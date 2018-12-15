package in.gov.rera.transaction.complaint.controller;

import in.gov.rera.common.dao.impl.CommonDao;
import in.gov.rera.common.security.FileSecurity;
import in.gov.rera.common.util.AcknowledgeUtilty;
import in.gov.rera.common.util.PaymentTokenNumber;
import in.gov.rera.common.util.ReraConstants;
import in.gov.rera.master.bank.model.BankModel;
import in.gov.rera.master.bank.service.IBankService;
import in.gov.rera.master.district.dao.IDistrictDAO;
import in.gov.rera.master.district.model.DistrictModel;
import in.gov.rera.master.stateut.model.StateUtModel;
import in.gov.rera.master.stateut.service.IStateUtService;
import in.gov.rera.notification.service.MailService;
import in.gov.rera.transaction.agentregistration.model.AgentRegistrationModel;
import in.gov.rera.transaction.complaint.dao.IComplaintDAO;
import in.gov.rera.transaction.complaint.model.ComplaintModel;
import in.gov.rera.transaction.complaint.model.ComplaintPaymentDetailsModel;
import in.gov.rera.transaction.complaint.service.IComplaintService;
import in.gov.rera.transaction.projectregistration.model.ProjectRegistrationModel;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.apache.log4j.Logger;

@Controller("ComplaintController")
@Scope(value="request")
public class ComplaintController {
	static Logger log= Logger.getLogger(ComplaintController.class);
	@Autowired
	IBankService<BankModel ,Long> bankService;

	@Autowired
	IComplaintService <ComplaintModel,Long>complaintService;

	@Autowired
	IStateUtService<StateUtModel, Long>stateUtService;

	@Autowired
	IDistrictDAO<DistrictModel, Long>districtDAO;

	@Autowired
	IComplaintDAO<ComplaintModel,Long> complaintDAO;

	@Autowired
	HttpSession httpSession;

	@Autowired
	CommonDao<Object, Long> commonDao;

	@RequestMapping(value="complaintForm")
	public ModelAndView complaintForm(@ModelAttribute("complaintModel") ComplaintModel complaintModel,BindingResult result){

		ModelAndView mv = null;
		try{
			mv = new ModelAndView("complaintForm");

			DetachedCriteria dt = DetachedCriteria.forClass(ProjectRegistrationModel.class, "pr");
			dt.createAlias("pr.projectDetailsModel", "projectDetailsModel");
			dt.createAlias("pr.promoterDetailsModel", "promoterDetailsModel");
			dt.add(Restrictions.ne("pr.status", "SAVE_AS_DRAFT"));
			dt.add(Restrictions.ne("pr.status", "REVOKED"));
			List<Object> allApplicantsList = commonDao.getList(dt);

			mv.addObject("allApplicantsList", allApplicantsList );
			mv.addObject("stateUtList", stateUtService.getStateUtList());

			mv.addObject("bankList", bankService.getBankList());

		}catch(Exception ex){
			log.error(ex.getMessage(),ex);
		}
		return mv;

	}



	@RequestMapping(value="saveComplaint",method=RequestMethod.POST)
	public ModelAndView saveComplaint(@ModelAttribute("complaintModel") ComplaintModel complaintModel,
			@RequestParam(value="captions",required=false)String[] captions,
			@RequestParam(value="supportDoc",required=false)MultipartFile[] supportDoc, 
			@RequestParam("aadharDoc") MultipartFile aadharDoc, 
			HttpServletRequest request){
		ModelAndView mv = null;
		if(	!FileSecurity.checkFileSize(supportDoc)){
			return new ModelAndView("incorrectFileType");
		}

		/*if(	!FileSecurity.checkFileSize(attachScanCopy)){
			return new ModelAndView("incorrectFileType");
		}*/	

		if(	!FileSecurity.checkFileSize(aadharDoc)){
			return new ModelAndView("incorrectFileType");
		}

		try{

			complaintModel.setAppResdistrictModel(districtDAO.getDistirctById(Long.parseLong(request.getParameter("applicantDistrictId").toString())));
			complaintModel.setAppResSameAsdistrictModel(districtDAO.getDistirctById(Long.parseLong(request.getParameter("resSameAsDistrictId").toString())));
			complaintModel.setRespondentdistrictModel(districtDAO.getDistirctById(Long.parseLong(request.getParameter("respondentDistrictId").toString())));
			complaintModel.setRespondentSameAsdistrictModel(districtDAO.getDistirctById(Long.parseLong(request.getParameter("respondentSameAsdistrict").toString())));

			/*ComplaintPaymentDetailsModel complaintPaymentDetailsModel=new ComplaintPaymentDetailsModel();
			if(!request.getParameter("paymentmode").trim().equals("Payment Gateway".trim())){

				complaintPaymentDetailsModel.setAmount(Double.parseDouble(request.getParameter("amount")));
				complaintPaymentDetailsModel.setPaymentToken(request.getParameter("paymentToken"));
				complaintPaymentDetailsModel.setSbiTransactionRefNo(request.getParameter("sbiTransactionRefNo"));

			}

			complaintPaymentDetailsModel.setPaymentMode(request.getParameter("paymentmode"));

			complaintModel.setComplaintPaymentDetailsModel(complaintPaymentDetailsModel);*/
			complaintService.saveComplaint(complaintModel,supportDoc,captions,aadharDoc);

			/*if(!complaintModel.getComplaintPaymentDetailsModel().getPaymentMode().equalsIgnoreCase("Payment Gateway")){
				mv = new ModelAndView("redirect:/confirmComplaintPayment");
				mailService.sendComplaintRegConfirmation(complaintModel);
				httpSession.setAttribute("COMPLAINT_NO", complaintModel.getComplaintNo());
			}
			else{

			}*/
			httpSession.setAttribute("COMPLAINT_ID", complaintModel.getCompId());
			mv = new ModelAndView("redirect:/complaintPaymentPage");
		}catch(Exception ex){
			log.error(ex.getMessage(),ex);
		}
		return mv;

	}


	@RequestMapping(value="confirmComplaintPayment")
	public ModelAndView confirmComplaintPayment(){

		ModelAndView mv = null;
		try{
			mv = new ModelAndView("complaintConfirmForm");
			ComplaintModel complaintModel= complaintDAO.findComplaintById(Long.parseLong(httpSession.getAttribute("COMPLAINT_ID").toString()));
			complaintModel.setStatus(ReraConstants.PENDING_HEADOFFICE);
			complaintDAO.updateComplaint(complaintModel);
			mv.addObject("complaintNo", complaintModel.getComplaintNo());
		}catch(Exception ex){
			log.error(ex.getMessage(),ex);
		}
		return mv;

	}

	@RequestMapping(value="complaintPaymentPage")
	public ModelAndView ComplaintPaymentPage(){

		ModelAndView mv = null;
		try{
			mv = new ModelAndView("complaintPaymentForm");
			//mv.addObject("complaintNo", httpSession.getAttribute("COMPLAINT_NO"));

			ComplaintModel complaintModel= complaintDAO.findComplaintById(Long.parseLong(httpSession.getAttribute("COMPLAINT_ID").toString()));

			//commonDao.updateObject(complaintModel);
			if(complaintModel.getK2PaymentDetailsModel()!=null) {
				mv.addObject("paymentStatus", complaintModel.getK2PaymentDetailsModel().getPaymentStatus());
				mv.addObject("paymentReference", complaintModel.getK2PaymentDetailsModel().getK2ReferenceNumber());
				/*if(complaintModel.getStatus().equals(ReraConstants.PENDING_HEADOFFICE))
					mv.addObject("paymentDone","YES");
				else
					mv.addObject("paymentDone","NO");*/
			}else
				mv.addObject("paymentStatus", "PAYMENT_INITIATED");

			mv.addObject("paymentToken",complaintModel.getComplaintPaymentDetailsModel().getPaymentToken());
			mv.addObject("complainantname",complaintModel.getApplicateName());
			httpSession.setAttribute("COMPLAINT_ID", complaintModel.getCompId());
		}catch(Exception ex){
			log.error(ex.getMessage(),ex);
		}
		return mv;

	}

	@RequestMapping(value="complaintAcknowledgement")
	public void complaintAcknowledgement(HttpServletResponse response){
		try{
			response.setContentType("application/pdf");
			Long cid=(Long)httpSession.getAttribute("COMPLAINT_ID");
			ComplaintModel cm=	complaintService.findComplaintById(cid);
			AcknowledgeUtilty util=new AcknowledgeUtilty();
			util.generateComplaintAck(response, cm);//(response, agent);
		}catch (Exception e) {
			log.error(e.getMessage(),e);
		}

	}



	@Autowired
	MailService mailService;

}
