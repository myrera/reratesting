package in.gov.rera.publicdomain.controller;

import java.util.Calendar;
import java.util.List;
import java.util.Random;
import java.util.concurrent.TimeUnit;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import in.gov.rera.admin.service.AdminService;
import in.gov.rera.admin.service.ApplicationHistoryService;
import in.gov.rera.admin.service.TemplateService;
import in.gov.rera.common.dao.impl.CommonDao;
import in.gov.rera.common.model.EnquiryModel;
import in.gov.rera.common.model.LoginHistory;
import in.gov.rera.common.model.UserModel;
import in.gov.rera.common.util.Base64Decoder;
import in.gov.rera.common.util.DocumentEncryptor;
import in.gov.rera.common.util.ReraConstants;
import in.gov.rera.dms.service.DocumentService;
import in.gov.rera.dms.util.ContentUtil;
import in.gov.rera.helpdesk.dao.HelpDeskHistoryDao;
import in.gov.rera.helpdesk.model.HelpDeskEnquiryModel;
import in.gov.rera.helpdesk.service.HelpDeskEnquiryService;
import in.gov.rera.helpdesk.service.HelpDeskHistoryService;
import in.gov.rera.notification.service.MailService;
import in.gov.rera.notification.service.SmsService;
import in.gov.rera.transaction.agentregistration.model.AgentRegistrationModel;
import in.gov.rera.transaction.agentregistration.service.IAgentUserService;
import in.gov.rera.transaction.complaint.model.ComplaintModel;
import in.gov.rera.transaction.complaint.service.IComplaintService;
import in.gov.rera.transaction.home.service.LoginService;
import in.gov.rera.transaction.postregistration.model.ApprovalCostModel;
import in.gov.rera.transaction.postregistration.model.ConstructionCostmodel;
import in.gov.rera.transaction.postregistration.model.LandCostDetailsModel;
import in.gov.rera.transaction.postregistration.model.ProjectQuaterlyUpdate;
import in.gov.rera.transaction.postregistration.model.ProjectScheduleModel;
import in.gov.rera.transaction.postregistration.model.TowerDetailsModel;
import in.gov.rera.transaction.postregistration.plots.model.PlotScheduleModel;
import in.gov.rera.transaction.postregistration.plots.model.PlotsConstructionCostDetails;
import in.gov.rera.transaction.postregistration.plots.model.PlotsCostSummary;
import in.gov.rera.transaction.postregistration.plots.model.PlotsDetailsModel;
import in.gov.rera.transaction.postregistration.plots.model.PlotsFinalApproval;
import in.gov.rera.transaction.postregistration.plots.model.PlotsLandCostDetailsModel;
import in.gov.rera.transaction.postregistration.plots.model.PlotsQuaterlyUpdate;
import in.gov.rera.transaction.projectregistration.model.ProjectDetailsModel;
import in.gov.rera.transaction.projectregistration.model.ProjectRegistrationModel;
import in.gov.rera.transaction.projectregistration.service.IProjectRegistrationService;
import in.gov.rera.transaction.projectregistration.service.IProjectUserService;

@Controller(value = "PublicDomainController")
@Scope("request")
public class PublicDomainController {

	static Logger log = Logger.getLogger(PublicDomainController.class);
	@Autowired
	HttpSession httpSession;

	@Autowired
	IProjectRegistrationService projectRegistrationService;

	@Autowired
	HelpDeskEnquiryService helpDeskEnquiryService;

	@Autowired
	HelpDeskHistoryService helpDeskHistoryService;

	@Autowired
	IProjectUserService projectUserService;

	@Autowired
	IAgentUserService agentRegistrationService;

	@Autowired
	TemplateService templateService;

	@Autowired
	CommonDao<Object, Long> commonDao;

	@Autowired
	ApplicationHistoryService applicationHistoryService;

	@Autowired
	MailService mailService;

	@Autowired
	LoginService loginService;

	@Autowired
	ContentUtil contentUtil;

	@Autowired
	DocumentService documentService;

	@Autowired
	AdminService adminService;

	@Autowired
	IComplaintService<ComplaintModel, Long> complaintService;

	@Autowired
	SmsService smsService;

	@Autowired
	HelpDeskHistoryDao helpDeskHistoryDao;

	@RequestMapping(value = "changePasswordForm")
	public ModelAndView authorityChangePasswordForm() {
		ModelAndView mv = null;
		mv = new ModelAndView("publicDomain.changePassword");
		try {
			UserModel um = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
			UserModel user = (UserModel) commonDao.getObject(UserModel.class, um.getUserId());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}

		return mv;
	}

	@RequestMapping(value = "publicDomainLoginPage")
	public ModelAndView loginPage(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("publicdomain.loginpage");
		return mv;
	}

	@RequestMapping(value = "NewUser")
	public ModelAndView newuserPage(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("publicdomain.newuser");
		// appending all the agent/project/complaints into one list for auto
		// complete
		List<Object> allApplicantsList = null;
		DetachedCriteria dtc = DetachedCriteria.forClass(ComplaintModel.class, "cm");
		List<Object> complaintmodelList = commonDao.getList(dtc);
		mv.addObject("complaintmodelList", complaintmodelList);

		DetachedCriteria dt = DetachedCriteria.forClass(ProjectRegistrationModel.class, "pr");
		dt.add(Restrictions.ne("pr.status", "SAVE_AS_DRAFT"));
		dt.add(Restrictions.ne("pr.status", "REVOKED"));
		allApplicantsList = commonDao.getList(dt);
		mv.addObject("allApplicantsList", allApplicantsList);
		DetachedCriteria dtar = DetachedCriteria.forClass(AgentRegistrationModel.class, "ar");
		List<Object> agentModelList = commonDao.getList(dtar);
		mv.addObject("agentModelList", agentModelList);
		return mv;
	}

	@RequestMapping(value = "Registration")
	public ModelAndView registration(HttpServletRequest request,
			@RequestParam(value = "name", required = true) String name,
			@RequestParam(value = "email", required = false) String email,
			@RequestParam(value = "contactNumber", required = false) String contactNumber,
			@RequestParam(value = "applicationNumber", required = false) String applicationNumber,
			@RequestParam(value = "type", required = true) String type,
			@RequestParam(value = "other", required = false) String other) {

		ModelAndView mv = new ModelAndView("publicdomain.registration");
		List<Object> allApplicantsList = null;
		UserModel user = new UserModel();
		user.setEmailId(email);
		user.setContactNumber(contactNumber);

		// user.setLoginId(type.substring(0, 2) + new
		// SimpleDateFormat("ddMMyyHHmmss").format(new Date()));
		if (other != null)
			user.setUserType(other);
		else
			user.setUserType(type);

		user.setUserName(name);

		user.setCreatedOn(Calendar.getInstance());
		user.setStatus(ReraConstants.ACTIVE_USER);
		user.setAuthorityType(ReraConstants.PUBLIC_USER);

		if (user.getPassword() == null)
			user.setPassword(generatePassword());

		commonDao.saveObject(user);
		user.setLoginId("PD" + String.format("%06d", user.getUserId()));
		commonDao.updateObject(user);

		EnquiryModel em = new EnquiryModel();
		em.setEmailId(user.getEmailId());
		em.setSubject("RERA User Credential");
		StringBuffer sb = new StringBuffer();
		sb.append("Dear ").append(user.getUserName()).append(",\n");
		sb.append("Your user account has been successfuly created in rera portal.");
		sb.append("Role : ").append(user.getUserType()).append("\n");
		sb.append("Login ID : ").append(user.getLoginId()).append("\n");
		sb.append("Password : ").append(user.getPassword()).append("\n \n\n\n");
		sb.append("Regards : \n ").append("RERA Karnataka Team");
		System.out.println(sb.toString());
		em.setEnquiryText(sb.toString());
		mailService.sendMail(em);
		if (contactNumber != null) {
			StringBuffer smsStringBuffer = new StringBuffer();
			smsStringBuffer.append("Dear ").append(user.getUserName()).append(",\n");
			smsStringBuffer.append("RERA User Credential for public domain are \n");
			smsStringBuffer.append("Role : ").append(user.getUserType()).append("\n");
			smsStringBuffer.append("Login ID : ").append(user.getLoginId()).append("\n");
			smsStringBuffer.append("Password : ").append(user.getPassword()).append("\n");
			smsStringBuffer.append("Regards, \n").append("RERA Karnataka Team");
			System.out.println(smsStringBuffer.toString());
			smsService.sendSMS(contactNumber, smsStringBuffer.toString());
		}
		mv.addObject("email", email);
		mv.addObject("allApplicantsList", allApplicantsList);
		return mv;

	}

	@RequestMapping(value = "saveLoginDetails")
	public ModelAndView login(HttpServletRequest request,
			@RequestParam(value = "loginId", required = true) String logId,
			@RequestParam(value = "password", required = true) String pass) {
		logId = Base64Decoder.decode(logId);
		pass = Base64Decoder.decode(pass);
		log.info("logId >>" + logId + "pass" + pass);
		UserModel user = loginService.login(logId, pass);

		if (user != null && user.getUserType() != null && user.getAuthorityType() != null
				&& user.getAuthorityType().equals(ReraConstants.PUBLIC_USER)) {

			if (user.getLoginTime() != null) {
				long diff = Calendar.getInstance().getTime().getTime() - user.getLoginTime().getTime().getTime();
				long minutes = TimeUnit.MILLISECONDS.toMinutes(diff);
				if (minutes < 30) {
					ModelAndView mv = new ModelAndView("publicdomain.loginpage");
					mv.addObject("ERROR_MSG", "Invalid session. Please try after 30 minutes");
					user.setLoginTime(Calendar.getInstance());
					return mv;
				} else {
					user = (UserModel) commonDao.getObject(UserModel.class, user.getUserId());
					user.setLoginTime(null);
					commonDao.updateObject(user);
				}
			}
			try {
				ModelAndView mv = new ModelAndView("redirect:publicDomain/projectList");

				buildNewSession(request, user, null);
				return mv;
			} catch (Exception ex) {
				log.error(ex.getMessage(), ex);
			}
			ModelAndView mv = new ModelAndView("publicdomain.loginpage");
			mv.addObject("ERROR_MSG", "Something went wrong. Try again.");
			user.setLoginTime(Calendar.getInstance());
			return mv;

		} else {
			ModelAndView mv = new ModelAndView("publicdomain.loginpage");
			mv.addObject("ERROR_MSG", "Invalid Login Id or Password.");
			return mv;
		}
	}

	@RequestMapping(value = "publicDomain/projectList")
	public ModelAndView getProjectList(HttpServletRequest request) {
		List<Object> allApplicantsList = null;
		UserModel um = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
		if (um == null)
			return null;
		ModelAndView mv = new ModelAndView("projectList");
		DetachedCriteria dt = DetachedCriteria.forClass(ProjectRegistrationModel.class, "pr");
		dt.add(Restrictions.eq("pr.status", ReraConstants.APPROVED));
		// dt.add(Restrictions.ne("pr.status", "REVOKED"));
		allApplicantsList = commonDao.getList(dt);
		mv.addObject("projectList", allApplicantsList);
		mv.addObject("noOfPendingRequest", allApplicantsList.size());
		return mv;
	}


	@RequestMapping(value = "publicDomain/projectDetails")
	public ModelAndView projectDetails(@RequestParam(value = "PROJECT_ID") String projectId) {
		ModelAndView mv = null;
		try {
			ProjectRegistrationModel project = projectRegistrationService
					.getProjectRegByPk(Long.parseLong(DocumentEncryptor.decrypt(projectId)));
			if (project.getRegistrationType().equalsIgnoreCase(ReraConstants.INDVISUAL_REG)) {
				mv = new ModelAndView("publicdomain.projectIndvDetails");
			} else {
				mv = new ModelAndView("publicdomain.projectCompDetails");
			}

			if (project.getProjectDetailsModel().getProjectType().equals("Plotted Development")) {
              
				String projectRegNo = project.getProjectRegistrationNo();
				mv.addObject("projectRegNo", projectRegNo);
				
				ProjectDetailsModel projectDetails = project.getProjectDetailsModel();
				mv.addObject("projectDetails", projectDetails);
				//Plots Details
				PlotsDetailsModel pdm = null;
				pdm = project.getProjectDetailsModel().getPlotDetailsList() != null
						&& project.getProjectDetailsModel().getPlotDetailsList().size() != 0
						? project.getProjectDetailsModel().getPlotDetailsList().get(0)
								: null;
						mv.addObject("pdm", pdm);

						PlotsLandCostDetailsModel PlotsLandAcquisitionCost = project.getProjectDetailsModel().getPlotLandCostDetailsModel();
						mv.addObject("PlotsLandAcquisitionCost", PlotsLandAcquisitionCost);

						/*// cont cost
						PlotsConstructionCostDetails plotsConstructionCost = project.getProjectDetailsModel().getPlotconstructionCostDetails();
						mv.addObject("plotsConstructionCost", plotsConstructionCost);*/

						// plot Schedule
						PlotScheduleModel plotScheduleModel = project.getProjectDetailsModel().getPlotScheduleModel();
						mv.addObject("plotScheduleModel", plotScheduleModel);

						// Plots Final Approval
						List<PlotsFinalApproval> plotfinalApproval = project.getProjectDetailsModel().getPlotfinalApproval();
						mv.addObject("plotfinalApproval", plotfinalApproval);

						// Plots Cost Summary
						PlotsCostSummary plotsCostSummary = project.getProjectDetailsModel().getPlotSummary();
						mv.addObject("plotsCostSummary", plotsCostSummary);

						// quarterly update
						List<PlotsQuaterlyUpdate> plotQuarterList = null;
						plotQuarterList = project.getProjectDetailsModel().getPlotsQuarterlyUpdate();
								mv.addObject("plotQuarterList", plotQuarterList);
								System.out.println("size---->>>"+plotQuarterList.size());


			} else {
				
				String projectRegNo = project.getProjectRegistrationNo();
				mv.addObject("projectRegNo", projectRegNo);
				
				ProjectDetailsModel projectDetails = project.getProjectDetailsModel();
				mv.addObject("projectDetails", projectDetails);
				
				TowerDetailsModel tdm = null;
				List<TowerDetailsModel> towerDetailsList = project.getProjectDetailsModel().getTowerDetailsList() != null
						&& project.getProjectDetailsModel().getTowerDetailsList().size() != 0
								? project.getProjectDetailsModel().getTowerDetailsList()
								: null;
				mv.addObject("towerDetailsList", towerDetailsList);
				LandCostDetailsModel lcdm = project.getProjectDetailsModel().getLandCostDetailsModel();
				mv.addObject("lcdm", lcdm);

				ConstructionCostmodel constructionCostmodel = project.getProjectDetailsModel().getConstructionCostModel();
				mv.addObject("constructionCostmodel", constructionCostmodel);
				
				/*ApprovalCostModel approvalCostModel=project.getProjectDetailsModel().getLandCostDetailsModel().getApprovalCostModel();
				mv.addObject("approvalCostModel", approvalCostModel);*/
				
				List<ProjectQuaterlyUpdate> quarterList = null;
				quarterList = project.getProjectDetailsModel().getQuarterlyUpdate();
				mv.addObject("quarterList", quarterList);
				
				ProjectScheduleModel projectScheduleModel = project.getProjectDetailsModel().getProjectScheduleModel();
				mv.addObject("projectScheduleModel", projectScheduleModel);
			}
			mv.addObject("project", project);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return mv;

	}

	private void buildNewSession(HttpServletRequest request, UserModel user, LoginHistory loginDetails) {
		HttpSession session = request.getSession(true);
		session.invalidate();
		session = request.getSession(true);
		user = (UserModel) commonDao.getObject(UserModel.class, user.getUserId());
		user.setLoginTime(Calendar.getInstance());
		commonDao.saveObject(user);
		String type = user.getAuthorityType();
		session.setAttribute(ReraConstants.SES_USER_ATTR, user);
		session.setAttribute(ReraConstants.SES_USER_ROLE, type);
		session.setAttribute(ReraConstants.LOGIN_SESSION_ID, loginDetails);

	}

	private void sendEmail(HelpDeskEnquiryModel enquiry, String subject, String body) {
		EnquiryModel em = new EnquiryModel();
		em.setEmailId(enquiry.getCreatedBy().getEmailId());
		em.setSubject(subject);
		em.setEnquiryText(body);
		mailService.sendMail(em);
	}

	private static String generatePassword() {
		int digit = 0;
		Random rn = new Random();
		StringBuffer sb = new StringBuffer();
		while (digit < 8) {
			sb.append(chars.charAt(rn.nextInt(36)));
			digit++;
		}
		return sb.toString();
	}

	private static String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";

}
