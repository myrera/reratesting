package in.gov.rera.transaction.unregistered.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import in.gov.rera.admin.service.TemplateService;
import in.gov.rera.common.dao.impl.CommonDao;
import in.gov.rera.common.model.ApplicationHistoryModel;
import in.gov.rera.common.model.EnquiryModel;
import in.gov.rera.common.model.LoginHistory;
import in.gov.rera.common.model.TemplateModel;
import in.gov.rera.common.model.UserModel;
import in.gov.rera.common.util.Base64Decoder;
import in.gov.rera.common.util.ReraConstants;
import in.gov.rera.notification.service.MailService;
import in.gov.rera.transaction.agentregistration.model.AgentRegistrationModel;
import in.gov.rera.transaction.agentregistration.service.IAgentRegistrationService;
import in.gov.rera.transaction.home.service.LoginService;
import in.gov.rera.transaction.projectregistration.model.ProjectRemarks;
import in.gov.rera.transaction.projectregistration.model.UserRemarks;
import in.gov.rera.transaction.unregistered.dao.IUnRegProjectDAO;
import in.gov.rera.transaction.unregistered.model.UnregisteredProjectDetail;
import in.gov.rera.transaction.unregistered.service.IUnRegEnquiryService;
import in.gov.rera.transaction.unregistered.service.IUnRegService;

@Controller("UnregProjectDetailsController")
@Scope("request")
public class UnregProjectController {
	
	static Logger log = Logger.getLogger(UnregProjectController.class);
	
	@Autowired
	HttpSession httpSession;
	
	@Autowired
	TemplateService templateService;
	
	@Autowired
	IAgentRegistrationService<AgentRegistrationModel, Long> agentRegistrationService;
	
	@Autowired
	IUnRegProjectDAO<UnregisteredProjectDetail, Long> unRegDAO;
	
	@Autowired
	CommonDao<Object, Long> commonDao;
	@Autowired
	IUnRegService unRegService;
	
	@Autowired
	MailService mailService;
	
	@Autowired
	IUnRegEnquiryService enqService;
	
	/*@Autowired
	IUnregReportProblemDAO<UnregisteredProjectDetail, Long> unregReportProblemDAO;*/
	
	@Autowired
	LoginService loginService;
	
	private String REGISTRATION_EMAIL_BODY = "Dear $name,\n"
			+ "Your query for $category for Project: $applicationNumber has been registered successfully. Your Ticket Number is: $ticketNumber. "
			+ "\n Please use this ticket number for all future references. The Ticket may take 3 days to 1 week depending on its complexity to be resolved during this time you will communicated about its status on regular intervals."
			+ "\n \n Thank you,\n RERA Karnataka Team.";
	
	// unregistered Login
		@RequestMapping(value = "unregLoginPage")
		public ModelAndView unregLoginPage() {
			return new ModelAndView("unReg.unregLoginPage");
		}
		
// login process
		@RequestMapping(value = "unregUserLogin")
		public String UserLogin(HttpServletRequest request, @RequestParam(value = "loginId", required = true) String logId,
				@RequestParam(value = "password", required = true) String pass) {
			log.info("unregUserLogin>>>"+logId + "              " + pass);
			logId = Base64Decoder.decode(logId);
			pass = Base64Decoder.decode(pass);
			log.info(logId + "              " + pass);
			UserModel user = loginService.login(logId, pass);
			if (user != null && user.getLoginId() != null ) {
				return "redirect:unRegProject/unRegProjectDetailsForm";
		}else {
			ModelAndView mv = new ModelAndView("unReg.unregLoginPage");
			mv.addObject("ERROR_MSG", "Invalid login Id or password.");
			 return "unregLoginPage";
		}
		}
	

	// get reg form
	@RequestMapping(value = "unRegProject/unRegProjectDetailsForm", method = RequestMethod.GET)
	public ModelAndView unRegProjectDetails() {
		 ModelAndView mv = null;
		  mv= new ModelAndView("unReg.unregProjectDetailsSaveForm");
		
		return mv;
	}
	
	// project details save
	@RequestMapping(value ="unRegProject/saveOrUpdateUnregProjectDetails", method = RequestMethod.POST)
	public ModelAndView saveOrUpdateUnregProjectDetails(@ModelAttribute("unregProjectDetail")UnregisteredProjectDetail unregProjectDetail,
			HttpServletRequest request) throws Exception {
		unregProjectDetail.setStatus("PENDING_UNREG_OPERATOR");
		unRegService.saveOrUpdateUnRegProject(unregProjectDetail);
		return new ModelAndView("redirect:/unRegProject/unRegProjectDetailsForm?act=save");
	}
	
	@RequestMapping(value ="unRegProject/editUnregProjectDetails", method = RequestMethod.POST)
	public ModelAndView editUnregProjectDetails(HttpServletRequest request,@RequestParam(value = "PROJECT_ID") Long projectId) throws Exception {
		UnregisteredProjectDetail project = unRegService.getProjectRegByPk(projectId);
		unRegService.editUnRegProject(project,request);
		return new ModelAndView("redirect:/unRegProject/unregisteredProjectDetails?pkId="+projectId);
	}
	
	// project list
	@RequestMapping(value = "unRegProject/viewAllProjects")
	public ModelAndView viewAllProjects(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("unReg.viewAllProject");
		List<UnregisteredProjectDetail> list = unRegService.getViewAllProjects();
		mv.addObject("projectList", list);
		return mv;
	}
	
	// view indv project details
	@RequestMapping(value = "unRegProject/unregisteredProjectDetails")
	public ModelAndView unregisteredProjectDetails(HttpServletRequest request, @RequestParam("pkId") Long unregProjectDetailsId) throws Exception {
		ModelAndView mv = new ModelAndView("unReg.unregisteredProjectDetails");
		
		UnregisteredProjectDetail project = (UnregisteredProjectDetail)commonDao.getObject(UnregisteredProjectDetail.class,unregProjectDetailsId);

		mv.addObject("project", project);
		AgentRegistrationModel agent = agentRegistrationService.getAgentRegByPk(1L);
		List<Object> tempList = createTemplate(agent);

		mv.addObject("template", tempList);
		
		return mv;

	}
	
	private List<Object> createTemplate(AgentRegistrationModel agent) {
		List<Object> tempList = templateService.getTemplateListByType(ReraConstants.AGENT);
		String enquiryDate = "";
		String Name = "";
		// String projectName = "";

		if (agent.getAgentDetailsModel() != null) {
			if (agent.getAgentDetailsModel().getAgentName() != null) {
				// agentName = agent.getAgentDetailsModel().getAgentName();
				Name = agent.getAgentDetailsModel().getAgentName();
			} else {
				// firmName = agent.getAgentDetailsModel().getFirmName();
				Name = agent.getAgentDetailsModel().getFirmName();
			}

		}

		for (Object tm : tempList) {

			String tc = ((TemplateModel) tm).getTemplateContent().replaceAll("\\$applicationDate",
					new SimpleDateFormat("dd/MM/yyyy").format(agent.getCreatedOn().getTime()));

			if (agent.getApplicationNo() != null) {
				tc = tc.replaceAll("\\$applicationNumber", agent.getApplicationNo());
			}

			if (agent.getEnquiryList() != null) {

				for (EnquiryModel enquiry : agent.getEnquiryList()) {
					enquiryDate = new SimpleDateFormat("dd/MM/yyyy").format(enquiry.getCreatedOn().getTime());
				}

			}
			tc = tc.replaceAll("\\$enquiryDate", enquiryDate);
			tc = tc.replaceAll("\\$currentDate", new SimpleDateFormat("dd/MM/yyyy").format(new Date()));

			/*
			 * if (agentName != null) { tc = tc.replaceAll("\\$agentName",
			 * agentName);
			 * 
			 * } else { tc = tc.replaceAll("\\$firmName", firmName);
			 * 
			 * }
			 */

			tc = tc.replaceAll("\\$agentName", Name);

			tc = tc.replaceAll("\\$projectDate",
					new SimpleDateFormat("dd/MM/yyyy").format(agent.getCreatedOn().getTime()));

			((TemplateModel) tm).setTemplateContent(tc);
		}
		return tempList;
	}
	
	// send enquiry
	/*@RequestMapping(value = "unRegProject/sendEnquiry", method = RequestMethod.POST)
	public ModelAndView sendEnquiry(HttpServletRequest request, @RequestParam("pkId") Long unregProjectDetailsId,
			@RequestParam(value = "subject") String subject, 
			@RequestParam(value = "summary") String summary
			) {
		ModelAndView mv = new ModelAndView("unReg.unregisteredProjectDetails");
		try {
			
			UnregisteredProjectDetail project = (UnregisteredProjectDetail)commonDao.getObject(UnregisteredProjectDetail.class,unregProjectDetailsId);
			EnquiryModel enq = new EnquiryModel();
			enq.setSubject(subject);
			enq.setCreatedOn(Calendar.getInstance());
			enq.setEnquiryText(summary);
			UserModel user = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
			UserModel us = (UserModel) commonDao.getObject(UserModel.class, user.getUserId());
			enq.setRaisedBy(us);

			enq.setEmailId(project.getEmailID());
			
			//project.setStatus(ReraConstants.ENQUIRY);
			unregReportProblemDAO.SaveUnregReportProblem(project);

			mailService.sendMail(enq);

			mv.addObject("project", project);
			
			System.out.println(enq.getSubject());

		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return mv;

	}
	*/
	/*private void sendEmail(UnregEnquiryModel enquiry, String subject, String summary) {
		
		EnquiryModel em = new EnquiryModel();
		em.setEmailId(enquiry.getEmailId());
		em.setSubject(subject);
		em.setEnquiryText(summary);
		mailService.sendMail(em);
		System.out.println(em);
	}*/
	
	
	@RequestMapping(value = "unRegProject/sendEnquiry", method = RequestMethod.POST)
	public ModelAndView saveEnquiry(HttpServletRequest request, @RequestParam("pkId") Long unregProjectDetailsId,
			@RequestParam(value = "subject") String subject, 
			@RequestParam(value = "summary") String summary) {
         
		ModelAndView mv = null;
		
		 try {
		UnregisteredProjectDetail project = unRegService.getProjectRegByPk(unregProjectDetailsId);
		/*UnregEnquiryModel enquiry = new UnregEnquiryModel();
		enquiry.setSubject(subject);
		enquiry.setDescription(summary);
		enquiry.setEmailId(project.getEmailID());
		enquiry.setCreatedOn(new Date());
		enquiry.setStatus(ReraConstants.OPEN);
		UserModel user = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
		UserModel us = (UserModel) commonDao.getObject(UserModel.class, user.getUserId());
		enquiry.setCreatedBy(us);*/
		
		EnquiryModel enq = new EnquiryModel();
		enq.setSubject(subject);
		enq.setCreatedOn(Calendar.getInstance());
		enq.setEnquiryText(summary);
		//UserModel user = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
		//UserModel us = (UserModel) commonDao.getObject(UserModel.class, user.getUserId());
		//enq.setRaisedBy(us);
		enq.setEmailId(project.getEmailID());
		
		enq = enqService.save(enq);
		
		
		if (project.getEnquiryList() == null) {
			project.setEnquiryList(new ArrayList<EnquiryModel>());
		}
		else {
		project.getEnquiryList().add(enq);
		}
		//List<HelpDeskEnquiryModel> enquires = helpDeskEnquiryService.getEnquiriesCreatedByUser(user);
		
		mv.addObject("enquiry", enq);
		mv.addObject("unregProject", project);
		
		//saveHistory(description, true, user, enquiry, null, attachment1, attachment2, attachment3);
		 mv = new ModelAndView("unReg.unregisteredProjectDetails");
				
		 mailService.sendMail(enq);
		  } catch (Exception e) {
			  log.error(e.getMessage(), e);
		
	}
		 //mv = new ModelAndView("redirect:unregisteredProjectDetails");
		 return mv;
	
	}
	
	private void saveApplicationHistory(UserModel user, UnregisteredProjectDetail project, String status) {

		saveApplicationHistory(user,project, status );
	}
	

	
	@RequestMapping(value = "unRegProject/exemptOrRegProject", method = RequestMethod.GET)
	public ModelAndView testNewForm() {
		 ModelAndView mv = null;
		  mv= new ModelAndView("unReg.exemptOrRegProjectForm");
		
		return mv;
	}
	
	// forward to L1 by L0
	@RequestMapping(value = "unRegProject/forwardProjectRegistration")
	public ModelAndView forwardProjectRegistration(@RequestParam(value = "PROJECT_ID") Long projectId,
			HttpServletRequest request) {
		ModelAndView mv = null;
		try {
			UserModel um = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
			UserModel user = (UserModel) commonDao.getObject(UserModel.class, um.getUserId());
			UnregisteredProjectDetail project = unRegService.getProjectRegByPk(projectId);

			project.setStatus("PENDING_AEE");
			unRegService.editUnProjectRegistration(project);
			mv=new ModelAndView("redirect:/unRegProject/viewAllProjects");
			/*try {
				saveApplicationHistory(user, project, ReraConstants.FORWARD);

			} catch (Exception e) {
				log.error(e.getMessage(), e);
			}*/

		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return mv;

	}
	
	 @RequestMapping(value = "unRegProject/deleteProject")
	    public String deleteProject(@RequestParam("ProjectId") Long unregProjectDetailsId) {
		 unRegService.delete(unregProjectDetailsId);
	        return "redirect:viewAllProjects?act=del";
	        
	    
	 }
	
}