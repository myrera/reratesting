package in.gov.rera.K2PaymentGateWay.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import in.gov.rera.K2PaymentGateWay.model.K2PaymentDetailsModel;
import in.gov.rera.K2PaymentGateWay.service.IK2FeesIntegrationService;
import in.gov.rera.K2PaymentGateWay.service.IK2PaymentDetailService;
import in.gov.rera.K2PaymentGateWay.service.IK2PenaltyIntegrationService;
import in.gov.rera.K2PaymentGateWay.service.IK2VerifyChallanService;
import in.gov.rera.K2PaymentGateWay.service.impl.K2URLGenerator;
import in.gov.rera.common.util.ReraConstants;
import in.gov.rera.transaction.agentregistration.model.AgentRegistrationModel;
import in.gov.rera.transaction.agentregistration.service.IAgentRegistrationService;
import in.gov.rera.transaction.complaint.dao.IComplaintDAO;
import in.gov.rera.transaction.complaint.model.ComplaintModel;
import in.gov.rera.transaction.complaint.service.IComplaintService;
import in.gov.rera.transaction.projectregistration.model.ProjectRegistrationModel;
import in.gov.rera.transaction.projectregistration.service.IProjectRegistrationService;

@Controller(value = "K2PaymentController")
@Scope("request")
public class K2PaymentController {

	@Autowired
	IK2PaymentDetailService<K2PaymentDetailsModel, Long> K2PaymentDetailsService;

	@Autowired
	IAgentRegistrationService<AgentRegistrationModel,Long> agentRegistrationService;

	@Autowired
	IComplaintService <ComplaintModel,Long> complaintService;

	@Autowired
	IComplaintDAO<ComplaintModel,Long> complaintDAO;

	@Autowired
	IK2FeesIntegrationService K2FeesIntegrationService;

	@Autowired
	IK2PenaltyIntegrationService K2PenaltyIntegrationService;
	
	@Autowired
	IK2VerifyChallanService K2VerifyChallanService;

	@Autowired
	IProjectRegistrationService projectRegistrationService;

	@Autowired
	HttpSession httpSession;

	@RequestMapping(value="/K2paymentPage")
	public RedirectView paymentPageRedirect(String promoterName,String paymentToken,String paymentType,String amount) throws Exception {
		RedirectView redirectView = new RedirectView();

		System.out.println(">>>>"+promoterName+">>>"+amount+">>"+paymentToken+">>"+paymentType);

		String redirectUrl=null;
		/*if(paymentType.equals("PENALTY") || paymentType.equals("TEMP_PENALTY"))
			redirectUrl=K2PenaltyIntegrationService.invokeK2PaymentGateway(promoterName, amount,paymentToken, paymentType);
		else*/
			redirectUrl=K2FeesIntegrationService.invokeK2PaymentGateway(promoterName, amount,paymentToken, paymentType);

		System.out.println("generatedurl>>>>"+redirectUrl);

		redirectView.setUrl(redirectUrl);
		return redirectView;
	} 

	@RequestMapping(value = "/paymentSuccessPage" ,method = RequestMethod.GET)
	public ModelAndView paymentSuccessPage(String encdata,String dept_code) throws NumberFormatException, Exception{
		
		String[] data=K2URLGenerator.decryptedDataArray(encdata);

		ModelAndView mv=new ModelAndView("paymentSuccessPage");

		String[] txnDetails= {"Bank_transaction_no","challan_amount","challan_ref_no","Status","Bank_name","Payment_mode","trsn_timestamp","StatusDescryption"};

		Map<String , String> paymentStatusMap=new HashMap<String , String>();
		paymentStatusMap.put("10700092", "Payment pending at payment gateway");
		paymentStatusMap.put("10700066", "Payment received at payment gateway");
		paymentStatusMap.put("10700068", "Payment failed at payment gateway");
		paymentStatusMap.put("10700098", "Challan Expired");

		mv.addObject(txnDetails[7], paymentStatusMap.get(data[3]));
		for (int i = 0; i < txnDetails.length-1; i++) {

			mv.addObject(txnDetails[i], data[i]);

			System.out.println(txnDetails[i]+"<<>>"+data[i]);
		}
		
		K2PaymentDetailsModel K2Model=K2PaymentDetailsService.getPaymentDetailsByK2ChallanRefNo(data[2]);
		if(K2Model.getPaymentType().equals("TEMP_PENALTY"))
			mv.addObject("redirection", "rerauser");
		else
			mv.addObject("redirection", "reraapp");
		
		return mv;
	}

	@RequestMapping(value = "/K2PaymentSuccess", method = RequestMethod.GET)
	public ModelAndView K2PaymentSuccess(HttpServletRequest request) {
		System.out.println("payment done");
		ModelAndView mv = null;

		try {
			K2PaymentDetailsModel K2Model=K2PaymentDetailsService.updatePaymentDetails(request);

			if(K2Model.getPaymentType().equals("AGENT_REG")) {
				AgentRegistrationModel agentModel=agentRegistrationService.getSavedAgentByPaymentToken(K2Model.getPaymentToken());
				httpSession.setAttribute("pkid", agentModel.getAgentRegistrationID());
				mv = new ModelAndView("redirect:/agentPaymentForm");
			}else if(K2Model.getPaymentType().equals("PROJECT_REG")) {
				ProjectRegistrationModel project=projectRegistrationService.getSavedProjectsByPaymentToken(K2Model.getPaymentToken());
				httpSession.setAttribute("pkid", project.getProjectRegId());
				mv = new ModelAndView("redirect:/projectRegpaymentForm");
			}else if(K2Model.getPaymentType().equals("PENALTY")) {
				ProjectRegistrationModel project=projectRegistrationService.getSavedProjectsByPaymentToken(K2Model.getPaymentToken());
				httpSession.setAttribute("pkid", project.getProjectRegId());
				mv = new ModelAndView("redirect:/projectRegpaymentForm");
			}else if(K2Model.getPaymentType().equals("TEMP_PENALTY")) {
				ProjectRegistrationModel project=projectRegistrationService.getSavedProjectsByPaymentToken(K2Model.getPaymentToken());
				System.out.println("paymenttoken>>>>>>>>>>>>>>>>>>> "+K2Model.getPaymentToken() );
				//httpSession.setAttribute("pkid", project.getProjectRegId());
				mv = new ModelAndView("redirect:rerauser/project/penaltyDetailsForm?projectRegId="+project.getProjectRegId());
			} else if(K2Model.getPaymentType().equals("COMPLAINT")){
				ComplaintModel complaintModel=complaintService.getSavedComplaintsByPaymentToken(K2Model.getPaymentToken());
				/*complaintModel.setStatus(ReraConstants.PENDING_HEADOFFICE);
				complaintDAO.updateComplaint(complaintModel);*/
				httpSession.setAttribute("COMPLAINT_ID", complaintModel.getCompId());
				mv = new ModelAndView("redirect:/complaintPaymentPage");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	@RequestMapping(value = "/pendingPaymentPage")
	public ModelAndView pendingPaymentPage(){
		ModelAndView mv=new ModelAndView("pendingPaymentPage");
		return mv;
	}
	
	@RequestMapping(value = "/verifyChallan")
	public ModelAndView verifyChallan(String challanrefNum) throws Exception{
		System.out.println("challanRefNum>>>>>>>>>>>>>>>"+challanrefNum);
		ModelAndView mv=null;
		Map<String , String> paymentStatusMap=new HashMap<String , String>();
		paymentStatusMap.put("10700092", "Payment pending at payment gateway");
		paymentStatusMap.put("10700066", "Payment received at payment gateway");
		paymentStatusMap.put("10700068", "Payment failed at payment gateway");
		paymentStatusMap.put("10700098", "Challan Expired");
		
		Map<String, String> verifiedChallandata = K2VerifyChallanService.verifyChallan(challanrefNum);
		
		mv=new ModelAndView("pendingPaymentPage");
		for (Map.Entry<String,String> entry : verifiedChallandata.entrySet()) {
            System.out.println("Key = " + entry.getKey() + ", Value = " + entry.getValue());
		}
		mv.addObject("deptRefNum", verifiedChallandata.get("deptRefNum"));
		
		K2PaymentDetailsModel k2model=K2PaymentDetailsService.getPaymentDetailsByK2ChallanRefNo(challanrefNum);
		
		if(k2model.getPaymentStatus().equals("PAYMENT_PENDING") ) {
		mv.addObject("bankName", verifiedChallandata.get("bankName"));
		mv.addObject("paidAmount", verifiedChallandata.get("paidAmount"));
		mv.addObject("pymntMode", verifiedChallandata.get("pymntMode"));
		mv.addObject("currentTimeStamp", verifiedChallandata.get("currentTimeStamp"));
		mv.addObject("StatusDescryption", paymentStatusMap.get(verifiedChallandata.get("pymntstatus")));
		mv.addObject("statusCode", verifiedChallandata.get("pymntstatus"));
		}else {
			mv.addObject("challanStatus", paymentStatusMap.get(k2model.getPaymentStatusCode()));
		}
		K2PaymentDetailsModel K2Model=K2PaymentDetailsService.getPaymentDetailsByK2ChallanRefNo(challanrefNum);
		if(K2Model.getPaymentType().equals("TEMP_PENALTY"))
			mv.addObject("redirection", "rerauser");
		else
			mv.addObject("redirection", "reraapp");
		
		return mv;
	}
	
	@RequestMapping(value = "/K2PendingPaymentSuccess", method = RequestMethod.GET)
	public ModelAndView K2PendingPaymentSuccess(HttpServletRequest request) {
		System.out.println("Pending payment success");
		ModelAndView mv = null;

		try {
			K2PaymentDetailsModel K2Model=K2PaymentDetailsService.updatePendingPaymentDetails(request);

			if(K2Model.getPaymentType().equals("AGENT_REG")) {
				AgentRegistrationModel agentModel=agentRegistrationService.getSavedAgentByPaymentToken(K2Model.getPaymentToken());
				httpSession.setAttribute("pkid", agentModel.getAgentRegistrationID());
				mv = new ModelAndView("redirect:/agentPaymentForm");
			}else if(K2Model.getPaymentType().equals("PROJECT_REG")) {
				ProjectRegistrationModel project=projectRegistrationService.getSavedProjectsByPaymentToken(K2Model.getPaymentToken());
				httpSession.setAttribute("pkid", project.getProjectRegId());
				mv = new ModelAndView("redirect:/projectRegpaymentForm");
			}else if(K2Model.getPaymentType().equals("PENALTY")) {
				ProjectRegistrationModel project=projectRegistrationService.getSavedProjectsByPaymentToken(K2Model.getPaymentToken());
				httpSession.setAttribute("pkid", project.getProjectRegId());
				mv = new ModelAndView("redirect:/projectRegpaymentForm");
			}else if(K2Model.getPaymentType().equals("COMPLAINT")){
				ComplaintModel complaintModel=complaintService.getSavedComplaintsByPaymentToken(K2Model.getPaymentToken());
				/*complaintModel.setStatus(ReraConstants.PENDING_HEADOFFICE);
				complaintDAO.updateComplaint(complaintModel);*/
				httpSession.setAttribute("COMPLAINT_ID", complaintModel.getCompId());
				mv = new ModelAndView("redirect:/complaintPaymentPage");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

}
