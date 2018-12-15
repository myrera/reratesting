package in.gov.rera.helpdesk.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Random;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import in.gov.rera.admin.service.AdminService;
import in.gov.rera.admin.service.ApplicationHistoryService;
import in.gov.rera.admin.service.TemplateService;
import in.gov.rera.common.dao.impl.CommonDao;
import in.gov.rera.common.model.EnquiryModel;
import in.gov.rera.common.model.LoginHistory;
import in.gov.rera.common.model.UserModel;
import in.gov.rera.common.util.Base64Decoder;
import in.gov.rera.common.util.GenerateRegistrationNumber;
import in.gov.rera.common.util.ReraConstants;
import in.gov.rera.dms.beans.Document;
import in.gov.rera.dms.service.DocumentService;
import in.gov.rera.dms.util.ContentUtil;
import in.gov.rera.helpdesk.dao.HelpDeskDao;
import in.gov.rera.helpdesk.dao.HelpDeskHistoryDao;
import in.gov.rera.helpdesk.model.HelpDeskCategoryModel;
import in.gov.rera.helpdesk.model.HelpDeskEnquiryHistory;
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
import in.gov.rera.transaction.projectregistration.model.ProjectRegistrationModel;
import in.gov.rera.transaction.projectregistration.service.IProjectRegistrationService;
import in.gov.rera.transaction.projectregistration.service.IProjectUserService;

@Controller(value = "HelpDeskController")
@Scope("request")
public class HelpDeskController {

	static Logger log = Logger.getLogger(HelpDeskController.class);
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


	private String REGISTRATION_EMAIL_BODY = "Dear $name,\n"
			+ "Your query for $category for Project: $applicationNumber has been registered successfully. Your Ticket Number is: $ticketNumber. "
			+ "\n Please use this ticket number for all future references. The Ticket may take 3 days to 1 week depending on its complexity to be resolved during this time you will communicated about its status on regular intervals."
			+ "\n \n Thank you,\n RERA Karnataka Team.";

	private String ASSIGNED_EMAIL_BODY = "Dear $name,\n"
			+ "Your $ticketNumber has been assigned to $assignee for resolution. "
			+ "\n \n Thank you,\n RERA Karnataka Team.";

	private String RESOLUTION_EMAIL_BODY = "Dear $name,\n \n"
			+ "Your query for $category for Project: $applicationNumber, Ticket No: $ticketNumber has been marked as resolved by $assignee, with comments ' $remarks ' "
			+ "\n For more details and feedback please visit the help desk on rera portal. "
			+ "\n \n Thank you,\n RERA Karnataka Team.";

	@RequestMapping(value = "helpdesk/assign")
	public ModelAndView assign(@RequestParam(value = "ticketId") Long ticketId,
			@RequestParam(value = "userId") Long userId,
			@RequestParam(value = "remarks", required = false) String remarks,
			@RequestParam(value = "publicComment", required = false) boolean publicComment,
			HttpServletRequest request) {

		ModelAndView mv = new ModelAndView("redirect:viewAssignPage");

		UserModel user = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);

		HelpDeskEnquiryModel enquiry = (HelpDeskEnquiryModel) commonDao.loadObject(HelpDeskEnquiryModel.class,
				ticketId);
		UserModel assignTo = (UserModel) commonDao.loadObject(UserModel.class, userId);
		saveHistory("", publicComment, user, enquiry, assignTo, null, null, null);

		if (ReraConstants.OPEN.equals(enquiry.getStatus())) {
			enquiry.setStatus(ReraConstants.ASSIGNED);
		} else {
			enquiry.setStatus(ReraConstants.FORWARD);
		}

		helpDeskEnquiryService.assignEnquiry(assignTo, enquiry);

		List<HelpDeskEnquiryModel> enquires = helpDeskEnquiryService.getEnquiriesByUser(null);
		attachHistory(enquires);

		List<UserModel> userList = getUserList(user);
		mv.addObject("users", userList);
		mv.addObject("enquiries", enquires);

		String subject = "Status update for Ticket No:" + enquiry.getTicketNumber()
				+ " registered with RERA Karnataka: REASSIGNED.";

		String body = ASSIGNED_EMAIL_BODY.replaceAll("\\$name", enquiry.getCreatedBy().getUserName())
				.replaceAll("\\$ticketNumber", enquiry.getTicketNumber())
				.replaceAll("\\$assignee", assignTo.getUserName());
		sendEmail(enquiry, subject, body);
		return mv;

	}
	
	@RequestMapping(value = "helpdesk/changePasswordForm")
	public ModelAndView authorityChangePasswordForm() {
		ModelAndView mv = null;
		mv = new ModelAndView("helpdesk.changePassword");
		try {
			UserModel um = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
			UserModel user = (UserModel) commonDao.getObject(UserModel.class, um.getUserId());
			

		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}

		return mv;
	}
	

	@RequestMapping(value = "acceptReject")
	public ModelAndView acceptReject(@RequestParam(value = "ticketId") Long ticketId,
			@RequestParam(value = "remarks", required = false) String remarks,
			@RequestParam(value = "type", required = false) String type, HttpServletRequest request) {

		ModelAndView mv = new ModelAndView("helpdesk.enquiry.success");

		UserModel user = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);

		HelpDeskEnquiryModel enquiry = (HelpDeskEnquiryModel) commonDao.loadObject(HelpDeskEnquiryModel.class,
				ticketId);

		if (ReraConstants.REOPEN.equals(type)) {
			enquiry.setStatus(ReraConstants.REOPEN);
			enquiry.setAssignedTo(null);
		} else {
			enquiry.setStatus(ReraConstants.USER_ACCEPTED);
		}
		enquiry.setDescription(remarks);
		saveHistory(remarks, true, user, enquiry, null, null, null, null);

		
		helpDeskEnquiryService.save(enquiry);

		List<HelpDeskEnquiryModel> enquires = helpDeskEnquiryService.getEnquiriesCreatedByUser(user);
		attachHistory(enquires);
		mv.addObject("enquiries", enquires);

		return mv;

	}

	@RequestMapping(value = "createEnquiry")
	public ModelAndView createEnquiry(@RequestParam(value = "category") Long categoryId,
			@RequestParam(value = "description") String description,
			@RequestParam(value = "contactNumber") String contactNumber,
			@RequestParam(value = "applicationNumber") String applicationNumber,
			@RequestParam(value = "attachment1", required = false) MultipartFile attachment1,
			@RequestParam(value = "attachment2", required = false) MultipartFile attachment2,
			@RequestParam(value = "attachment3", required = false) MultipartFile attachment3,
			HttpServletRequest request) {

		ModelAndView mv = new ModelAndView("helpdesk.enquiry.success");

		UserModel user = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
		HelpDeskEnquiryModel enquiry = new HelpDeskEnquiryModel();
		enquiry.setCreatedBy(user);
		enquiry.setApplicationNumber(applicationNumber);
		enquiry.setDescription(description);
		enquiry.setContactNumber(contactNumber);
		enquiry.setCreatedOn(new Date());
		enquiry.setCategory((HelpDeskCategoryModel) commonDao.getObject(HelpDeskCategoryModel.class, categoryId));
		enquiry.setStatus(ReraConstants.OPEN);
		enquiry.setTicketNumber("TR" + new SimpleDateFormat("ddMMYYHHmmss").format(new Date()));

		Set<Document> docs = new HashSet<Document>();
		try {

			docs = prepareAttachments(attachment1, attachment2, attachment3, user, enquiry.getTicketNumber());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		enquiry.setAttachments(docs);
		enquiry = helpDeskEnquiryService.save(enquiry);

		List<HelpDeskEnquiryModel> enquires = helpDeskEnquiryService.getEnquiriesCreatedByUser(user);
		attachHistory(enquires);
		mv.addObject("enquiries", enquires);
		mv.addObject("applicationNumber", applicationNumber);
		

		saveHistory(description, true, user, enquiry, null, attachment1, attachment2, attachment3);

		String subject = "Ticket No:" + enquiry.getTicketNumber() + " has been Registered with RERA Karnataka. ";
		String body = REGISTRATION_EMAIL_BODY.replaceAll("\\$name", enquiry.getCreatedBy().getUserName())
				.replaceAll("\\$ticketNumber", enquiry.getTicketNumber())
				.replaceAll("\\$applicationNumber", enquiry.getApplicationNumber())
				.replaceAll("\\$category", enquiry.getCategory().getName());
		sendEmail(enquiry, subject, body);
		return mv;

	}


	@RequestMapping(value = "helpdesk/return")
	public ModelAndView returnTicket(@RequestParam(value = "ticketId") Long ticketId,
			@RequestParam(value = "remarks") String remarks,
			@RequestParam(value = "assignId", required = false) Long assignId,
			@RequestParam(value = "publicComment", required = false) Boolean publicComment,
			@RequestParam(value = "attachment1", required = false) MultipartFile attachment1,
			@RequestParam(value = "attachment2", required = false) MultipartFile attachment2,
			@RequestParam(value = "attachment3", required = false) MultipartFile attachment3,
			HttpServletRequest request) {

		// MultipartFile attachment1 = null;
		// MultipartFile attachment2 = null;
		// MultipartFile attachment3 = null;

		ModelAndView mv = new ModelAndView("helpdesk.authority.dashboard");

		UserModel user = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);

		HelpDeskEnquiryModel enquiry = (HelpDeskEnquiryModel) commonDao.loadObject(HelpDeskEnquiryModel.class,ticketId );

		// HelpDeskEnquiryHistory history =
		// helpDeskHistoryService.getLatestHistoryByHelpDeskId(ticketId);
		UserModel assignTo = (UserModel) commonDao.loadObject(UserModel.class, assignId);
		enquiry.setStatus(ReraConstants.RETURN);

		saveHistory(remarks, publicComment, user, enquiry, assignTo, attachment1, attachment2, attachment3);

		helpDeskEnquiryService.assignEnquiry(assignTo, enquiry);
		List<HelpDeskEnquiryModel> enquiries = helpDeskEnquiryService.getEnquiriesByUser(user);
		attachHistory(enquiries);
		List<UserModel> userList = getUserList(user);
		mv.addObject("users", userList);
		mv.addObject("enquiries", enquiries);

		return mv;

	}

	@RequestMapping(value = "helpdeskLoginPage")
	public ModelAndView loginPage(HttpServletRequest request) {

		ModelAndView mv = new ModelAndView("helpdesk.loginpage");

		return mv;

	}

	@RequestMapping(value = "helpdesk/allTickets")
	public ModelAndView getAllTickets(HttpServletRequest request) {

		ModelAndView mv = new ModelAndView("helpdesk.assignee.all");

		List<HelpDeskEnquiryModel> enquires = helpDeskEnquiryService.getAllEnquiries();

		attachHistory(enquires);
		mv.addObject("enquiries", enquires);

		return mv;

	}
	
	@RequestMapping(value = "helpdesk/viewAssignPage")
	public ModelAndView getTicketsToAssign(HttpServletRequest request) {

		ModelAndView mv = new ModelAndView("helpdesk.assignee.dashboard");

		UserModel user = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
		List<HelpDeskEnquiryModel> enquires = helpDeskEnquiryService.getEnquiriesByUser(null);
		enquires.addAll(helpDeskEnquiryService.getEnquiriesByUser(user));

		attachHistory(enquires);
		mv.addObject("enquiries", enquires);
		List<UserModel> userList = getUserList(user);
		mv.addObject("users", userList);

		return mv;

	}
	
	@RequestMapping(value = "helpdesk/authority")
	public ModelAndView authority(HttpServletRequest request) {

		ModelAndView mv = new ModelAndView("helpdesk.authority.dashboard");

		UserModel user = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
		List<HelpDeskEnquiryModel> enquires = helpDeskEnquiryService.getEnquiriesByUser(user);
		

		attachHistory(enquires);
		mv.addObject("enquiries", enquires);
		List<UserModel> userList = getUserList(user);
		mv.addObject("users", userList);

		return mv;

	}

	@RequestMapping(value = "helpdesk/loginPage")
	public ModelAndView loginPageDisplay(HttpServletRequest request) {

		ModelAndView mv = new ModelAndView("helpdesk.loginpage");

		return mv;

	}

	@RequestMapping(value = "helpdeskNewUser")
	public ModelAndView newuserPage(HttpServletRequest request) {

		ModelAndView mv = new ModelAndView("helpdesk.newuser");
		// appending all the agent/project/complaints into one list for autocomplete
		List<Object> allApplicantsList = null;
		DetachedCriteria dtc= DetachedCriteria.forClass(ComplaintModel.class,"cm");
		List<Object> complaintmodelList = commonDao.getList(dtc);
		mv.addObject("complaintmodelList",complaintmodelList);
		
		DetachedCriteria dt = DetachedCriteria.forClass(ProjectRegistrationModel.class, "pr");
		dt.add(Restrictions.ne("pr.status", "SAVE_AS_DRAFT"));
		dt.add(Restrictions.ne("pr.status", "REVOKED"));
		 allApplicantsList = commonDao.getList(dt);
		 mv.addObject("allApplicantsList",allApplicantsList);
		 
		DetachedCriteria dtar= DetachedCriteria.forClass(AgentRegistrationModel.class,"ar");
		List<Object> agentModelList = commonDao.getList(dtar);
		 mv.addObject("agentModelList",agentModelList);
		return mv;

	}

	@RequestMapping(value = "helpdesk/project")
	public ModelAndView getProject(HttpServletRequest request,
			@RequestParam(value = "applicationNumber", required = true) String applicationNumber) {

		ModelAndView mv = new ModelAndView("helpdesk.project");
		mv.addObject("project", projectRegistrationService.getProjectByAppNo(applicationNumber));

		return mv;

	}

	@RequestMapping(value = "helpdeskRegistration")
	public ModelAndView registration(HttpServletRequest request,
			@RequestParam(value = "name", required = true) String name,
			@RequestParam(value = "email", required = false) String email,
			@RequestParam(value = "contactNumber", required = false) String contactNumber,
			@RequestParam(value = "applicationNumber", required = false) String applicationNumber,
			@RequestParam(value = "type", required = true) String type,
			@RequestParam(value = "other", required = false) String other) {

		ModelAndView mv = new ModelAndView("helpdesk.registration");
		List<Object> allApplicantsList = null;

		if (applicationNumber != null && applicationNumber.trim().length() != 0) {
			try {

				if (ReraConstants.PROJECT.equals(type)) {
					DetachedCriteria dt = DetachedCriteria.forClass(ProjectRegistrationModel.class, "pr");
					dt.add(Restrictions.ne("pr.status", "SAVE_AS_DRAFT"));
					dt.add(Restrictions.ne("pr.status", "REVOKED"));
					allApplicantsList = commonDao.getList(dt);
					ProjectRegistrationModel project = projectRegistrationService.getProjectByAppNo(applicationNumber);
					if (project != null) {
						email = project.getPromoterDetailsModel().getEmailId();
					} else {
						mv = new ModelAndView("helpdesk.newuser");
						mv.addObject("ERROR_MSG", "Application number not valid.");
						return mv;
					}

				} else {
					
					DetachedCriteria dt= DetachedCriteria.forClass(AgentRegistrationModel.class,"ar");
					allApplicantsList = commonDao.getList(dt);
					
					if(ReraConstants.COMPLAINANT.equals(type)) {
						DetachedCriteria dtc= DetachedCriteria.forClass(ComplaintModel.class,"cm");
						allApplicantsList = commonDao.getList(dtc);
					}
					AgentRegistrationModel agent = agentRegistrationService.getAgentByAppNo(applicationNumber);
					if (agent != null) {
						email = agent.getAgentDetailsModel().getAgentEmailId();
					} else {
						mv = new ModelAndView("helpdesk.newuser");
						mv.addObject("ERROR_MSG", "Application number not valid.");
						return mv;
					}

				}

			} catch (Exception e) {
				log.error(e.getMessage(), e);
			}
		}

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

		if (user.getPassword() == null)
			user.setPassword(generatePassword());

		commonDao.saveObject(user);
		user.setLoginId(type.substring(0, 1) + String.format("%06d", user.getUserId()));
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
		
		if (contactNumber != null ) {
			StringBuffer smsStringBuffer = new StringBuffer();
			smsStringBuffer.append("Dear ").append(user.getUserName()).append(",\n");
			smsStringBuffer.append("RERA User Credential for HelpDesk are \n");
			smsStringBuffer.append("Role : ").append(user.getUserType()).append("\n");
			smsStringBuffer.append("Login ID : ").append(user.getLoginId()).append("\n");
			smsStringBuffer.append("Password : ").append(user.getPassword()).append("\n");
			smsStringBuffer.append("Regards, \n").append("RERA Karnataka Team");
			System.out.println(smsStringBuffer.toString());
			smsService.sendSMS(contactNumber, smsStringBuffer.toString());

		}
		mv.addObject("email", email);
		mv.addObject("allApplicantsList", allApplicantsList );
		return mv;

	}

	@RequestMapping(value = "helpdeskLogin")
	public ModelAndView login(HttpServletRequest request,
			@RequestParam(value = "loginId", required = true) String logId,
			@RequestParam(value = "password", required = true) String pass) {

		logId = Base64Decoder.decode(logId);
		pass = Base64Decoder.decode(pass);

		UserModel user = loginService.login(logId, pass);
		String path = "";
		String applicationNumber = "";
		List<HelpDeskEnquiryModel> enquires = new ArrayList<HelpDeskEnquiryModel>();
		if (user != null && user.getUserType() != null && !(user.getLoginId().startsWith("PD")) && !(user.getLoginId().startsWith("QU")) ) {

			try {

				if (ReraConstants.HELPDESK_JUNIOR.equals(user.getUserType())) {
					path = "redirect:helpdesk/viewAssignPage";
					enquires = helpDeskEnquiryService.getEnquiriesByUser(null);
					enquires.addAll(helpDeskEnquiryService.getEnquiriesByUser(user));
				} else if (ReraConstants.HELPDESK_LEGAL.equals(user.getUserType())
						|| ReraConstants.HELPDESK_MANAGER.equals(user.getUserType())
						|| ReraConstants.HELPDESK_TECHNICAL.equals(user.getUserType())
						|| ReraConstants.HELPDESK_CHIEF_AUTHORITY.equals(user.getUserType())
						|| ReraConstants.HELPDESK_AUTHORITY.equals(user.getUserType())
						|| ReraConstants.HELPDESK_UAUTHORITY.equals(user.getUserType())
						|| ReraConstants.HELPDESK_ENGINEER.equals(user.getUserType())
						|| ReraConstants.HELPDESK_ACCOUNTS.equals(user.getUserType())
						) {
					path = "redirect:helpdesk/authority";
					enquires = helpDeskEnquiryService.getEnquiriesByUser(user);
				} else {
					path = "helpdesk.enquiry";
					if (ReraConstants.PROJECT.equals(user.getUserType())) {
						ProjectRegistrationModel project = projectUserService.getProjectByLoginId(user.getLoginId());
						if (project != null)
							applicationNumber = project.getApplicationNo();

					} else if (ReraConstants.AGENT.equals(user.getUserType())) {
						AgentRegistrationModel agent = agentRegistrationService.getAgentByLoginId(user.getLoginId());
						if (agent != null)
							applicationNumber = agent.getApplicationNo();
					}
					enquires = helpDeskEnquiryService.getEnquiriesCreatedByUser(user);
				}

				buildNewSession(request, user, null);
				ModelAndView mv = new ModelAndView(path);
				DetachedCriteria dt = DetachedCriteria.forClass(HelpDeskCategoryModel.class);
				mv.addObject("categories", commonDao.getList(dt));
				mv.addObject("applicationNumber", applicationNumber);
				List<UserModel> userList = getUserList(user);
				mv.addObject("users", userList);
				attachHistory(enquires);
				mv.addObject("enquiries", enquires);
				return mv;

			} catch (Exception ex) {
				log.error(ex.getMessage(), ex);
			}
			ModelAndView mv = new ModelAndView("helpdesk.loginpage");
			mv.addObject("ERROR_MSG", "Something went wrong. Try again.");
			return mv;
		} else {

			ModelAndView mv = new ModelAndView("helpdesk.loginpage");
			mv.addObject("ERROR_MSG", "Invalid login Id or password.");
			return mv;
		}

	}

	private void saveHistory(String remarks, Boolean publicComment, UserModel user, HelpDeskEnquiryModel enquiry,
			UserModel assignee, MultipartFile attachment1, MultipartFile attachment2, MultipartFile attachment3) {
		HelpDeskEnquiryHistory newHistory = new HelpDeskEnquiryHistory();
		newHistory.setAssignor(user);
		newHistory.setAssignee(assignee);
		newHistory.setDescription(remarks);
		newHistory.setEnquiry(enquiry);
		newHistory.setStatus(enquiry.getStatus());
		newHistory.setCreatedOn(new Date());
		newHistory.setPublicComment(publicComment);

		Set<Document> docs = new HashSet<Document>();
		try {

			docs = prepareAttachments(attachment1, attachment2, attachment3, user, enquiry.getTicketNumber());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		newHistory.setAttachments(docs);
		helpDeskHistoryService.save(newHistory);

	}

	@RequestMapping(value = "helpdesk/respond")
	public ModelAndView respond(@RequestParam(value = "ticketId") Long ticketId,
			@RequestParam(value = "remarks") String remarks,
			@RequestParam(value = "publicComment", required = false) Boolean publicComment,
			@RequestParam(value = "attachment1", required = false) MultipartFile attachment1,
			@RequestParam(value = "attachment2", required = false) MultipartFile attachment2,
			@RequestParam(value = "attachment3", required = false) MultipartFile attachment3,
			HttpServletRequest request) {
		System.out.println(" remarks >>"+remarks +" publicComment >>"+publicComment);
		// MultipartFile attachment1 = null;
		// MultipartFile attachment2 = null;
		// MultipartFile attachment3 = null;

		ModelAndView mv = new ModelAndView("helpdesk.authority.dashboard");

		UserModel user = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);

		HelpDeskEnquiryModel enquiry = (HelpDeskEnquiryModel) commonDao.loadObject(HelpDeskEnquiryModel.class,
				ticketId);
		enquiry.setStatus(ReraConstants.CLOSE);
		saveHistory(remarks, publicComment, user, enquiry, enquiry.getCreatedBy(), attachment1, attachment2,
				attachment3);

		helpDeskEnquiryService.assignEnquiry(enquiry.getCreatedBy(), enquiry);
		List<HelpDeskEnquiryModel> enquires = helpDeskEnquiryService.getEnquiriesByUser(user);
		attachHistory(enquires);
		List<UserModel> userList = getUserList(user);
		mv.addObject("users", userList);
		mv.addObject("enquiries", enquires);

		String subject = "Status update for Ticket No:" + enquiry.getTicketNumber()
				+ " registered with RERA Karnataka: RESOLVED. ";

		String body = RESOLUTION_EMAIL_BODY.replaceAll("\\$name", enquiry.getCreatedBy().getUserName())
				.replaceAll("\\$ticketNumber", enquiry.getTicketNumber())
				.replaceAll("\\$applicationNumber", enquiry.getApplicationNumber())
				.replaceAll("\\$category", enquiry.getCategory().getName())
				.replaceAll("\\$assignee", user.getUserName()).replaceAll("\\$remarks", remarks);

		sendEmail(enquiry, subject, body);

		return mv;

	}

	private Set<Document> prepareAttachments(MultipartFile attachment1, MultipartFile attachment2,
			MultipartFile attachment3, UserModel user, String ticketNumber) throws IOException, Exception {

		Set<Document> docs = new HashSet<Document>();
		if (attachment1 != null && !attachment1.isEmpty()) {
			Document doc = new Document();
			doc.setFileName(attachment1.getOriginalFilename());
			doc.setInputStream(attachment1.getInputStream());
			doc.setFolderId(ReraConstants.HELPDESK);
			doc.setMimeType(attachment1.getContentType());
			doc.setDocumentType(user.getUserType());
			contentUtil.saveDocument(doc);
			documentService.saveDoc(doc);
			docs.add(doc);
		}

		if (attachment2 != null && !attachment2.isEmpty()) {
			Document doc = new Document();
			doc.setFileName(attachment2.getOriginalFilename());
			doc.setInputStream(attachment2.getInputStream());
			doc.setFolderId(ticketNumber);
			doc.setMimeType(attachment2.getContentType());
			doc.setDocumentType(user.getUserType());
			contentUtil.saveDocument(doc);
			documentService.saveDoc(doc);
			docs.add(doc);
		}

		if (attachment3 != null && !attachment3.isEmpty()) {
			Document doc = new Document();
			doc.setFileName(attachment3.getOriginalFilename());
			doc.setInputStream(attachment3.getInputStream());
			doc.setFolderId(ticketNumber);
			doc.setMimeType(attachment3.getContentType());
			doc.setDocumentType(user.getUserType());
			contentUtil.saveDocument(doc);
			documentService.saveDoc(doc);
			docs.add(doc);
		}
		return docs;
	}
	
	@RequestMapping(value = "helpdeskChangePassword", method = RequestMethod.POST)
	public ModelAndView changePassword(HttpServletRequest request,
			@RequestParam(value = "password", required = true) String oldPassword,

			@RequestParam(value = "newpassword", required = true) String newpassword) throws Exception {

		newpassword = Base64Decoder.decode(newpassword);
		oldPassword = Base64Decoder.decode(oldPassword);
		ModelAndView mv = null;
		UserModel loggedUser = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);

		UserModel user = loginService.updatePassword(loggedUser.getLoginId(), oldPassword, newpassword);
		String path = "";
		String applicationNumber = "";
		List<Object> allApplicantsList = null;
		List<HelpDeskEnquiryModel> enquires = new ArrayList<HelpDeskEnquiryModel>();
		if (user != null && user.getUserType() != null) {

			try {

				if (ReraConstants.HELPDESK_JUNIOR.equals(user.getUserType())) {
					path = "redirect:helpdesk/viewAssignPage";
					enquires = helpDeskEnquiryService.getEnquiriesByUser(null);
					enquires.addAll(helpDeskEnquiryService.getEnquiriesByUser(user));
				} else if  (ReraConstants.HELPDESK_LEGAL.equals(user.getUserType())
						|| ReraConstants.HELPDESK_MANAGER.equals(user.getUserType())
						|| ReraConstants.HELPDESK_TECHNICAL.equals(user.getUserType())
						|| ReraConstants.HELPDESK_CHIEF_AUTHORITY.equals(user.getUserType())
						|| ReraConstants.HELPDESK_AUTHORITY.equals(user.getUserType())
						|| ReraConstants.HELPDESK_UAUTHORITY.equals(user.getUserType())
						|| ReraConstants.HELPDESK_ENGINEER.equals(user.getUserType())
						|| ReraConstants.HELPDESK_ACCOUNTS.equals(user.getUserType())
						) {
					path = "redirect:helpdesk/authority";
					enquires = helpDeskEnquiryService.getEnquiriesByUser(user);
				} else {
					path = "helpdesk.enquiry";
					if (ReraConstants.PROJECT.equals(user.getUserType())) {
						ProjectRegistrationModel project = projectUserService.getProjectByLoginId(user.getLoginId());
						if (project != null) applicationNumber = project.getApplicationNo();
						
						
						
						DetachedCriteria dt= DetachedCriteria.forClass(ProjectRegistrationModel.class,"pr");
						dt.createAlias("pr.projectUser", "us");
						dt.add(Restrictions.eq("us.loginId", user.getLoginId()));
						List<Object> list=commonDao.getList(dt);
						String  emailId = ((ProjectRegistrationModel) list.get(0)).getProjectUser().getEmailId();
						DetachedCriteria projListDt= DetachedCriteria.forClass(ProjectRegistrationModel.class,"prj");
						projListDt.createAlias("prj.projectUser", "us1");
						projListDt.add(Restrictions.eq("us1.emailId", emailId));
						allApplicantsList = commonDao.getList(projListDt);
					} else if (ReraConstants.AGENT.equals(user.getUserType())) {
						AgentRegistrationModel agent = agentRegistrationService.getAgentByLoginId(user.getLoginId());
						if (agent != null)	applicationNumber = agent.getApplicationNo();
						
						DetachedCriteria dt= DetachedCriteria.forClass(AgentRegistrationModel.class,"ar");
						dt.createAlias("ar.agentUser", "us");
						dt.add(Restrictions.eq("us.loginId", user.getLoginId()));
						List<Object> list=commonDao.getList(dt);
						String  emailId = ((AgentRegistrationModel) list.get(0)).getAgentUser().getEmailId();
						DetachedCriteria projListDt= DetachedCriteria.forClass(AgentRegistrationModel.class,"arp");
						projListDt.createAlias("arp.agentUser", "us1");
						projListDt.add(Restrictions.eq("us1.emailId", emailId));
						allApplicantsList = commonDao.getList(projListDt);
					}
					enquires = helpDeskEnquiryService.getEnquiriesCreatedByUser(user);
				}

				buildNewSession(request, user, null);
				mv = new ModelAndView(path);
				DetachedCriteria dt = DetachedCriteria.forClass(HelpDeskCategoryModel.class);
				mv.addObject("categories", commonDao.getList(dt));
				mv.addObject("applicationNumber", applicationNumber);
				mv.addObject("allApplicantsList", allApplicantsList );
				List<UserModel> userList = getUserList(user);
				mv.addObject("users", userList);
				attachHistory(enquires);
				mv.addObject("enquiries", enquires);
				return mv;

			} catch (Exception ex) {
				log.error(ex.getMessage(), ex);
			}
			mv = new ModelAndView("helpdesk.loginpage");
			mv.addObject("ERROR_MSG", "Something went wrong. Try again.");
			return mv;
		} else {

			mv = new ModelAndView("helpdesk.loginpage");
			mv.addObject("ERROR_MSG", "Invalid login Id or password.");
			return mv;
		}

	}
	
	@RequestMapping(value = "helpdesk/agentDetails")
	public ModelAndView getAgent(HttpServletRequest request,
			@RequestParam(value = "applicationNumber", required = true) String applicationNumber) {
		ModelAndView mv = null;
		try {
			AgentRegistrationModel agent = agentRegistrationService.getAgentByAppNo(applicationNumber);

			if (agent.getRegistrationType().equalsIgnoreCase(ReraConstants.INDVISUAL_REG)) {
				mv = new ModelAndView("helpdesk.agentIndvDetails");
			} else {
				mv = new ModelAndView("helpdesk.agentCompDetails");
			}
			mv.addObject("agent", agent);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return mv;
	}

	
	@RequestMapping(value = "helpdesk/complaintDetails")
	public ModelAndView complaintDetails(HttpServletRequest request,
			@RequestParam(value = "applicationNumber", required = true) String complaintAppNo) {
		ModelAndView mv = new ModelAndView("helpdesk.complaintDetails");
		try {
			ComplaintModel complaintModel = complaintService.getComplaintsByAppNo(complaintAppNo);
			mv.addObject("complaintModel", complaintModel);
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return mv;

	}

	private void buildNewSession(HttpServletRequest request, UserModel user, LoginHistory loginDetails) {
		HttpSession session = request.getSession(true);
		session.invalidate();
		session = request.getSession(true);

		String type = user.getUserType();
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

	private List<UserModel> getUserList(UserModel user) {
		List<UserModel> userList = new ArrayList<UserModel>();
		userList.addAll(loginService.getUserListByRole(ReraConstants.HELPDESK_MANAGER));
		userList.addAll(loginService.getUserListByRole(ReraConstants.HELPDESK_LEGAL));
		userList.addAll(loginService.getUserListByRole(ReraConstants.HELPDESK_TECHNICAL));
		userList.addAll(loginService.getUserListByRole(ReraConstants.HELPDESK_JUNIOR));
		userList.addAll(loginService.getUserListByRole(ReraConstants.HELPDESK_AUTHORITY));
		userList.addAll(loginService.getUserListByRole(ReraConstants.HELPDESK_CHIEF_AUTHORITY));
		userList.addAll(loginService.getUserListByRole(ReraConstants.HELPDESK_UAUTHORITY));
		userList.addAll(loginService.getUserListByRole(ReraConstants.HELPDESK_ACCOUNTS));
		userList.addAll(loginService.getUserListByRole(ReraConstants.HELPDESK_ENGINEER));
		userList.addAll(loginService.getUserListByRole(ReraConstants.HELPDESK_CHIEF_AUTHORITY));
		userList.remove(user);

		return userList;
	}

	private void attachHistory(List<HelpDeskEnquiryModel> enquires) {
		for (HelpDeskEnquiryModel helpDeskEnquiryModel : enquires) {
			helpDeskEnquiryModel
					.setLogs(helpDeskHistoryService.getAllHistoryByHelpDeskId(helpDeskEnquiryModel.getId()));
		}
	}

	
	
	@RequestMapping(value = "helpdesk/viewAllTicketsByUser")
	public ModelAndView viewAllTicketsByUser(HttpServletRequest request) {
		UserModel user = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
		ModelAndView mv = new ModelAndView("helpdesk.viewAll");
		Set<HelpDeskEnquiryHistory> enquires = helpDeskHistoryService.getAllTicketsByUser(user);
		mv.addObject("enquiries", enquires);
		return mv;
	}
	
}
