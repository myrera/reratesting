package in.gov.rera.transaction.thirdparty;

import java.util.List;

import in.gov.rera.common.dao.impl.CommonDao;
import in.gov.rera.common.util.ReraConstants;
import in.gov.rera.notification.service.MailService;
import in.gov.rera.transaction.agentregistration.model.AgentRegistrationModel;
import in.gov.rera.transaction.agentregistration.model.RegPaymentDetailsModel;
import in.gov.rera.transaction.complaint.model.ComplaintModel;
import in.gov.rera.transaction.complaint.model.ComplaintPaymentDetailsModel;
import in.gov.rera.transaction.projectregistration.model.ProjectPaymentDetailsModel;
import in.gov.rera.transaction.projectregistration.model.ProjectRegExtensionModel;
import in.gov.rera.transaction.projectregistration.model.ProjectRegistrationModel;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;



@Controller(value = "PaymentgateWayController")
@Scope("request")
public class PaymentgateWayController {
     @Autowired
	CommonDao<Object, Long> commonDao;
     
     @Autowired
     HttpSession session;
     
	@Autowired
     PaymentGatewayUtil gatewayutil;
     
	@Autowired
	MailService mailService;
     
     
     
     
	  @RequestMapping(value="projectRegPaymentGateway")
		public ModelAndView projectRegPayment(@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel model){
	    
		  ProjectRegistrationModel project=(ProjectRegistrationModel)commonDao.getObject(ProjectRegistrationModel.class, model.getProjectRegId());
		  PaymentParameter pp=gatewayutil.onlineTrx(project, model.getPaymentDetailsModel().getAmount());
		   OnlineTransactionModel trx=pp.getTrxObject();
		   commonDao.saveObject(trx);
		   
		   ModelAndView mv=new ModelAndView("pay.paymentgatewayForm");
		  mv.addObject("pay", pp);
		  
		  return mv;
	  }
	  
	  @RequestMapping(value="agentRegPaymentGateway")
			public ModelAndView agentRegPayment( @ModelAttribute("agentRegistrationModel")AgentRegistrationModel model,
			@RequestParam ("amount") Double amount){
		  AgentRegistrationModel agent=(AgentRegistrationModel)commonDao.getObject(AgentRegistrationModel.class, model.getAgentRegistrationID());
		  PaymentParameter pp=gatewayutil.onlineTrx(agent,amount);
		   OnlineTransactionModel trx=pp.getTrxObject();
		   commonDao.saveObject(trx);
		   ModelAndView mv=new ModelAndView("pay.paymentgatewayForm");
		  mv.addObject("pay", pp);
		  return mv;
		  
		  
		  } 
	  
	  @RequestMapping(value="complaintRegPaymentGateway")
		public ModelAndView complaintRegPayment(){
	  
		  Long compId=(Long)session.getAttribute("COMPLAINT_ID");
		  ComplaintModel model=(ComplaintModel)commonDao.getObject(ComplaintModel.class, compId);
		  PaymentParameter pp=gatewayutil.onlineTrx(model);
		   OnlineTransactionModel trx=pp.getTrxObject();
		   commonDao.saveObject(trx);
		   ModelAndView mv=new ModelAndView("pay.paymentgatewayForm");
		  mv.addObject("pay", pp);
		  return mv;
	  } 
	  
	  
	  
	  @RequestMapping(value="project/projectExtPaymentGateway")
		public ModelAndView projectExtPayment(){
	  Long pid=(Long)session.getAttribute("EXT_REG_ID");
	  ProjectRegExtensionModel ext=(ProjectRegExtensionModel)commonDao.getObject(ProjectRegExtensionModel.class, pid);
	  PaymentParameter pp=gatewayutil.onlineTrx(ext.getProjectRegistration(),ext.getPaymentDetailsModel().getAmount());
	   OnlineTransactionModel trx=pp.getTrxObject();
	   commonDao.saveObject(trx);
	   ModelAndView mv=new ModelAndView("pay.paymentgatewayForm");
	  mv.addObject("pay", pp);
	  return mv;
	  
	  
	  } 
	  
	  @RequestMapping(value="agent/agentRenewPaymentGateway")
		public void agentRenewPayment(){
	  
	  } 
	  
	  
	  
	  @RequestMapping(value="paymentfailResponse")
		public ModelAndView paymentSuccessResponse(HttpServletRequest request){
		  String txnid = request.getParameter("txnid");
			OnlineTransactionModel trx=getTransactionByNo(txnid);
			trx.setPaymentId(request.getParameter("mihpayid"));
			trx.setBankCode(request.getParameter("bankcode"));
			trx.setMode(request.getParameter("mode"));
			trx.setStatus(request.getParameter("status"));
			trx.setErrorMsg(request.getParameter("error"));
			commonDao.updateObject(trx);
			if(trx.getServiceId().equals(PaymentGatewayUtil.AGENT_REG)){
				session.setAttribute("errorMsg", trx.getErrorMsg());
				session.setAttribute("pkid", trx.getUserId());
				 return  new ModelAndView("redirect:/agentPaymentForm");
			}
			else if(trx.getServiceId().equals(PaymentGatewayUtil.PROJECT_REG)){
				session.setAttribute("errorMsg", trx.getErrorMsg());
				session.setAttribute("pkid", trx.getUserId());
				 return  new ModelAndView("redirect:/projectRegpaymentForm");
			}
			else{
				 return  new ModelAndView("redirect:/paymentFailurePage");	
			}
	  } 
	  
	  @RequestMapping(value="paymentResponse")
		public ModelAndView paymentfailResponse(HttpServletRequest request){
			String txnid = request.getParameter("txnid");
			OnlineTransactionModel trx=getTransactionByNo(txnid);
			trx.setPaymentId(request.getParameter("mihpayid"));
			trx.setBankCode(request.getParameter("bankcode"));
			trx.setMode(request.getParameter("mode"));
			trx.setStatus(request.getParameter("status"));
			commonDao.updateObject(trx);
			ModelAndView mv=null;
			if(trx.getServiceId().equals(PaymentGatewayUtil.AGENT_REG)){
				AgentRegistrationModel model=(AgentRegistrationModel)commonDao.getObject(AgentRegistrationModel.class, trx.getUserId());
				RegPaymentDetailsModel pay=	new RegPaymentDetailsModel();
				pay.setAmount((double)trx.getAmount());
				pay.setPaymentMode("Payment Gateway");
				pay.setOnline(trx);
				model.getAgentDetailsModel().setRegPaymentDetailsModel(pay);
				model.setStatus(ReraConstants.PENDING_OPRATOR);
				commonDao.updateObject(model);
				mv = new ModelAndView("redirect:/agentRegistrationConfirmation");
				mailService.sendAgentRegConfirmation(model);
			}else 	if(trx.getServiceId().equals(PaymentGatewayUtil.PROJECT_REG)){
				
				ProjectRegistrationModel project=(ProjectRegistrationModel)commonDao.getObject(ProjectRegistrationModel.class, trx.getUserId());
				ProjectPaymentDetailsModel pay=new ProjectPaymentDetailsModel();
				pay.setAmount((double)trx.getAmount());
				pay.setPaymentMode("Payment Gateway");
				pay.setOnline(trx);
				project.setPaymentDetailsModel(pay);
				project.setStatus(ReraConstants.PENDING_OPRATOR);
				commonDao.updateObject(project);
				mailService.sendprojectRegConfirmation(project);
				mv = new ModelAndView("redirect:/projectRegConfirmationPage");
				
			}else 	if(trx.getServiceId().equals(PaymentGatewayUtil.COMPLAINT_REG)){
				ComplaintModel com=(ComplaintModel)commonDao.getObject(ComplaintModel.class, trx.getUserId());
				ComplaintPaymentDetailsModel pay=new ComplaintPaymentDetailsModel();
				pay.setAmount((double)trx.getAmount());
				pay.setPaymentMode("Payment Gateway");
				pay.setOnline(trx);
				com.setComplaintPaymentDetailsModel(pay);
				com.setStatus(ReraConstants.PENDING_OPRATOR);
				commonDao.updateObject(com);
			//	mailService.sendprojectRegConfirmation(com);
				mv = new ModelAndView("redirect:/confirmComplaintPayment");
			}
			else 		if(trx.getServiceId().equals(PaymentGatewayUtil.PROJECT_REG_EXT)){
				
				ProjectRegistrationModel project=(ProjectRegistrationModel)commonDao.getObject(ProjectRegistrationModel.class, trx.getUserId());
				
				project.getProjectExtention().getPaymentDetailsModel().setAmount((double)trx.getAmount());
				project.getProjectExtention().getPaymentDetailsModel().setPaymentMode("Payment Gateway");
				project.getProjectExtention().getPaymentDetailsModel().setOnline(trx);
			
				project.getProjectExtention().setStatus(ReraConstants.PENDING_OPRATOR);
				commonDao.updateObject(project);
				//mailService.sendprojectRegConfirmation(project);
				mv = new ModelAndView("redirect:project/confirmationPage");
				
			}
			return mv;
	  } 
	  @RequestMapping(value="paymentCancelResponse")
		public ModelAndView paymentCancelResponse(HttpServletRequest request){
			String txnid = request.getParameter("txnid");
			OnlineTransactionModel trx=getTransactionByNo(txnid);
			trx.setPaymentId(request.getParameter("mihpayid"));
			trx.setBankCode(request.getParameter("bankcode"));
			trx.setMode(request.getParameter("mode"));
			trx.setErrorMsg(request.getParameter("error"));
			trx.setStatus(request.getParameter("status"));
			commonDao.updateObject(trx);
			
			//
			if(trx.getServiceId().equals(PaymentGatewayUtil.AGENT_REG)){
				session.setAttribute("errorMsg", trx.getErrorMsg());
				session.setAttribute("pkid", trx.getUserId());
				 return  new ModelAndView("redirect:/agentPaymentForm");
			}
			else if(trx.getServiceId().equals(PaymentGatewayUtil.PROJECT_REG)){
				session.setAttribute("errorMsg", trx.getErrorMsg());
				session.setAttribute("pkid", trx.getUserId());
				 return  new ModelAndView("redirect:/projectRegpaymentForm");
			}
			else{
				 return  new ModelAndView("redirect:/paymentFailurePage");	
			}
		  
	  } 
	  
	  @RequestMapping(value="paymentFailurePage")
			public ModelAndView errorMsgPage(HttpServletRequest request){
			
			  return  new ModelAndView("pay.errorMsg");
		  } 
	  
	  
	  
	  
	  private OnlineTransactionModel getTransactionByNo(String trxno){
		  OnlineTransactionModel trx=null;
		  DetachedCriteria dt=DetachedCriteria.forClass(OnlineTransactionModel.class);
		  dt.add(Restrictions.eq("transactionNo", trxno));
		 List<Object> list= commonDao.getList(dt);
		  if(list!=null && list.size()>0)
			  trx=(OnlineTransactionModel)list.get(0);
		  return trx;
	  }
	  
 	  
	  
}
