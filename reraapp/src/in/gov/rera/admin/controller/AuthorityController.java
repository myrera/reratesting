package in.gov.rera.admin.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.ResourceBundle;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import in.gov.rera.admin.service.ApplicationHistoryService;
import in.gov.rera.admin.service.AuthorityService;
import in.gov.rera.admin.service.DashboardService;
import in.gov.rera.admin.service.TemplateService;
import in.gov.rera.common.dao.impl.CommonDao;
import in.gov.rera.common.model.ApplicationHistoryModel;
import in.gov.rera.common.model.EnquiryModel;
import in.gov.rera.common.model.LoginHistory;
import in.gov.rera.common.model.MISReport;
import in.gov.rera.common.model.PendingAgentSignature;
import in.gov.rera.common.model.TemplateModel;
import in.gov.rera.common.model.TokenModel;
import in.gov.rera.common.model.UserModel;
import in.gov.rera.common.util.AcknowledgeUtilty;
import in.gov.rera.common.util.DateUtil;
import in.gov.rera.common.util.ReraConstants;
import in.gov.rera.master.stateut.model.StateUtModel;
import in.gov.rera.notification.model.EmailNotification;
import in.gov.rera.notification.service.MailService;
import in.gov.rera.notification.service.SmsService;
import in.gov.rera.transaction.agentregistration.model.AgentNumber;
import in.gov.rera.transaction.agentregistration.model.AgentRegRenewalModel;
import in.gov.rera.transaction.agentregistration.model.AgentRegistrationLog;
import in.gov.rera.transaction.agentregistration.model.AgentRegistrationModel;
import in.gov.rera.transaction.agentregistration.service.IAgentRegistrationService;
import in.gov.rera.transaction.complaint.model.ComplaintModel;
import in.gov.rera.transaction.complaint.service.IComplaintService;
import in.gov.rera.transaction.postregistration.model.ApprovalCostModel;
import in.gov.rera.transaction.postregistration.model.ConstructionCostmodel;
import in.gov.rera.transaction.postregistration.model.FinalApproval;
import in.gov.rera.transaction.postregistration.model.LandCostDetailsModel;
import in.gov.rera.transaction.postregistration.model.ProjectQuaterlyUpdate;
import in.gov.rera.transaction.postregistration.model.ProjectScheduleModel;
import in.gov.rera.transaction.postregistration.model.ProjectSummary;
import in.gov.rera.transaction.postregistration.model.TowerDetailsModel;
import in.gov.rera.transaction.postregistration.plots.model.PlotScheduleModel;
import in.gov.rera.transaction.postregistration.plots.model.PlotsConstructionCostmodel;
import in.gov.rera.transaction.postregistration.plots.model.PlotsCostSummary;
import in.gov.rera.transaction.postregistration.plots.model.PlotsDetailsModel;
import in.gov.rera.transaction.postregistration.plots.model.PlotsFinalApproval;
import in.gov.rera.transaction.postregistration.plots.model.PlotsLandCostDetailsModel;
import in.gov.rera.transaction.postregistration.plots.model.PlotsQuaterlyUpdate;
import in.gov.rera.transaction.projectregistration.model.ProjectNumber;
import in.gov.rera.transaction.projectregistration.model.ProjectRegExtensionModel;
import in.gov.rera.transaction.projectregistration.model.ProjectRegistrationModel;
import in.gov.rera.transaction.projectregistration.model.ProjectRemarks;
import in.gov.rera.transaction.projectregistration.model.UserRemarks;
import in.gov.rera.transaction.projectregistration.service.IProjectRegistrationService;

@Controller(value = "AuthorityController")
@Scope("request")
public class AuthorityController {

	static Logger logger = Logger.getLogger(AuthorityController.class);
	@Autowired
	HttpSession httpSession;

	@Autowired
	AuthorityService authorityService;

	@Autowired
	IProjectRegistrationService projectRegistrationService;

	@Autowired
	IAgentRegistrationService<AgentRegistrationModel, Long> agentRegistrationService;

	@Autowired
	IComplaintService<ComplaintModel, Long> complaintService;

	@Autowired
	CommonDao<Object, Long> commonDao;

	@Autowired
	ApplicationHistoryService applicationHistoryService;

	@Autowired
	MailService mailService;

	@Autowired
	SmsService smsService;

	@Autowired
	DashboardService service;

	@Autowired
	TemplateService templateService;

	@RequestMapping(value = "authority/dashboard")

	public ModelAndView dashboard(HttpServletRequest request) throws ParseException {

		ModelAndView mv = new ModelAndView("authority.dashbord");

		UserModel user = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);

		List<AgentRegistrationModel> list = authorityService.getPendingAgentRegistration(

				ReraConstants.PENDING_AUTHORITY, ReraConstants.INDVISUAL_REG, user.getUserId());

		mv.addObject("AGENT_IND_REQUEST", list != null ? list.size() : 0);

		list = authorityService.getPendingAgentRegistration(ReraConstants.PENDING_AUTHORITY,

				ReraConstants.FIRM_COMP_REG, user.getUserId());

		mv.addObject("AGENT_FIRM_REQUEST", list != null ? list.size() : 0);

		List<ProjectRegistrationModel> lst = authorityService.getPendingProjectRegistration(

				ReraConstants.PENDING_AUTHORITY, ReraConstants.INDVISUAL_REG, user.getUserId());

		mv.addObject("PROJECT_IND_REQUEST", lst != null ? lst.size() : 0);

		lst = authorityService.getPendingProjectRegistration(ReraConstants.PENDING_AUTHORITY,

				ReraConstants.FIRM_COMP_REG, user.getUserId());

		mv.addObject("PROJECT_FIRM_REQUEST", lst != null ? lst.size() : 0);

		request.setAttribute("barData", service.getBarChartData());

		request.setAttribute("pieData", service.getPieChartData());

		request.setAttribute("lineData", service.getLineChartData());

		// Total application

		Map<String, Integer> totals = service.getDashboardTotals();

		List<Integer> dataList = new ArrayList<Integer>();

		dataList.add(totals.get("totalProjects"));

		dataList.add(totals.get("totalAgents"));

		dataList.add(totals.get("totalComplaints"));

		List<String> lables = new ArrayList<String>();

		lables.add("Project");

		lables.add("Agents");

		lables.add("Complaints");

		mv.addObject("totalApplicationData", dataList);

		mv.addObject("totalApplicationLabel", lables);

		// Total application By month

		List<Integer> projectListWeekly = new ArrayList<Integer>();

		List<Integer> agentListWeekly = new ArrayList<Integer>();

		List<Integer> complaintListWeekly = new ArrayList<Integer>();

		Map<String, Integer> week4 = service.getApplicationsTotalsByDate(DateUtil.firstDayOfWeek(0),
				DateUtil.lastDayOfWeek(0));

		Map<String, Integer> week3 = service.getApplicationsTotalsByDate(DateUtil.firstDayOfWeek(-1),
				DateUtil.lastDayOfWeek(-1));

		Map<String, Integer> week2 = service.getApplicationsTotalsByDate(DateUtil.firstDayOfWeek(-2),
				DateUtil.lastDayOfWeek(-2));

		Map<String, Integer> week1 = service.getApplicationsTotalsByDate(DateUtil.firstDayOfWeek(-3),
				DateUtil.lastDayOfWeek(-3));

		projectListWeekly.add(week1.get("projects"));

		projectListWeekly.add(week2.get("projects"));

		projectListWeekly.add(week3.get("projects"));

		projectListWeekly.add(week4.get("projects"));

		agentListWeekly.add(week1.get("agents"));

		agentListWeekly.add(week2.get("agents"));

		agentListWeekly.add(week3.get("agents"));

		agentListWeekly.add(week4.get("agents"));

		complaintListWeekly.add(week1.get("complaints"));

		complaintListWeekly.add(week2.get("complaints"));

		complaintListWeekly.add(week3.get("complaints"));

		complaintListWeekly.add(week4.get("complaints"));

		List<String> totalApplicationMonthLabel = new ArrayList();

		totalApplicationMonthLabel.add(new SimpleDateFormat("MMM dd").format(DateUtil.firstDayOfWeek(-3)) + " - "
				+ new SimpleDateFormat("MMM dd").format(DateUtil.lastDayOfWeek(-3)));

		totalApplicationMonthLabel.add(new SimpleDateFormat("MMM dd").format(DateUtil.firstDayOfWeek(-2)) + " - "
				+ new SimpleDateFormat("MMM dd").format(DateUtil.lastDayOfWeek(-2)));

		totalApplicationMonthLabel.add(new SimpleDateFormat("MMM dd").format(DateUtil.firstDayOfWeek(-1)) + " - "
				+ new SimpleDateFormat("MMM dd").format(DateUtil.lastDayOfWeek(-1)));

		totalApplicationMonthLabel.add(new SimpleDateFormat("MMM dd").format(DateUtil.firstDayOfWeek(0)) + " - "
				+ new SimpleDateFormat("MMM dd").format(DateUtil.lastDayOfWeek(0)));

		List<Object> totalApplicationMonthData = new ArrayList();

		totalApplicationMonthData.add(projectListWeekly);

		totalApplicationMonthData.add(agentListWeekly);

		totalApplicationMonthData.add(complaintListWeekly);

		mv.addObject("totalApplicationMonthData", totalApplicationMonthData);

		mv.addObject("totalApplicationMonthLabel", totalApplicationMonthLabel);

		// application processed yearly

		List<Integer> applicationProcessedData = new ArrayList();

		applicationProcessedData.add(totals.get("totalProcessedApplications"));

		applicationProcessedData.add(totals.get("totalProcessed"));

		applicationProcessedData.add(totals.get("totalEnquiry"));

		applicationProcessedData.add(totals.get("totalApproved"));

		List<String> applicationProcessedLabel = new ArrayList();

		applicationProcessedLabel.add("Total");

		applicationProcessedLabel.add("Processed");

		applicationProcessedLabel.add("Under Enquiry");

		applicationProcessedLabel.add("Approved");

		mv.addObject("applicationProcessedData", applicationProcessedData);

		mv.addObject("applicationProcessedLabel", applicationProcessedLabel);

		// application processed By month

		List<Integer> applicationProcessedMonthDataVal = new ArrayList();

		applicationProcessedMonthDataVal.add(totals.get("totalApproved"));

		applicationProcessedMonthDataVal.add(totals.get("totalApproved"));

		applicationProcessedMonthDataVal.add(totals.get("totalApproved"));

		applicationProcessedMonthDataVal.add(totals.get("totalApproved"));

		List<String> applicationProcessedMonthLabel = new ArrayList();

		applicationProcessedMonthLabel.add(new SimpleDateFormat("MMM dd").format(DateUtil.firstDayOfWeek(-3)) + " - "
				+ new SimpleDateFormat("MMM dd").format(DateUtil.lastDayOfWeek(-3)));

		applicationProcessedMonthLabel.add(new SimpleDateFormat("MMM dd").format(DateUtil.firstDayOfWeek(-2)) + " - "
				+ new SimpleDateFormat("MMM dd").format(DateUtil.lastDayOfWeek(-2)));

		applicationProcessedMonthLabel.add(new SimpleDateFormat("MMM dd").format(DateUtil.firstDayOfWeek(-1)) + " - "
				+ new SimpleDateFormat("MMM dd").format(DateUtil.lastDayOfWeek(-1)));

		applicationProcessedMonthLabel.add(new SimpleDateFormat("MMM dd").format(DateUtil.firstDayOfWeek(0)) + " - "
				+ new SimpleDateFormat("MMM dd").format(DateUtil.lastDayOfWeek(0)));

		List<Object> applicationProcessedMonthData = new ArrayList();

		applicationProcessedMonthData.add(applicationProcessedMonthDataVal);

		applicationProcessedMonthData.add(applicationProcessedMonthDataVal);

		applicationProcessedMonthData.add(applicationProcessedMonthDataVal);

		applicationProcessedMonthData.add(applicationProcessedMonthDataVal);

		mv.addObject("applicationProcessedMonthData", applicationProcessedMonthData);

		mv.addObject("applicationProcessedMonthLabel", applicationProcessedMonthLabel);

		// application processed By weekly

		List<Integer> applicationProcessedWeeklyVal = new ArrayList();

		applicationProcessedWeeklyVal.add(22);

		applicationProcessedWeeklyVal.add(92);

		applicationProcessedWeeklyVal.add(42);

		applicationProcessedWeeklyVal.add(32);

		List<String> applicationProcessedWeeklyLabel = new ArrayList();

		applicationProcessedWeeklyLabel.add(new SimpleDateFormat("MMM dd").format(DateUtil.firstDayOfWeek(-3)) + " - "
				+ new SimpleDateFormat("MMM dd").format(DateUtil.lastDayOfWeek(-3)));

		applicationProcessedWeeklyLabel.add(new SimpleDateFormat("MMM dd").format(DateUtil.firstDayOfWeek(-2)) + " - "
				+ new SimpleDateFormat("MMM dd").format(DateUtil.lastDayOfWeek(-2)));

		applicationProcessedWeeklyLabel.add(new SimpleDateFormat("MMM dd").format(DateUtil.firstDayOfWeek(-3)) + " - "
				+ new SimpleDateFormat("MMM dd").format(DateUtil.lastDayOfWeek(-1)));

		applicationProcessedWeeklyLabel.add(new SimpleDateFormat("MMM dd").format(DateUtil.firstDayOfWeek(0)) + " - "
				+ new SimpleDateFormat("MMM dd").format(DateUtil.lastDayOfWeek(0)));

		List<Object> applicationProcessedWeeklyData = new ArrayList();

		applicationProcessedWeeklyData.add(applicationProcessedWeeklyVal);

		applicationProcessedWeeklyData.add(applicationProcessedWeeklyVal);

		applicationProcessedWeeklyData.add(applicationProcessedWeeklyVal);

		applicationProcessedWeeklyData.add(applicationProcessedWeeklyVal);

		mv.addObject("applicationProcessedWeeklyData", applicationProcessedWeeklyData);

		mv.addObject("applicationProcessedWeeklyLabel", applicationProcessedWeeklyLabel);

		// project processed overall

		List<Integer> projectProcessedOverAllData = new ArrayList();

		projectProcessedOverAllData.add(totals.get("totalAccountsProcessed"));

		projectProcessedOverAllData.add(totals.get("totalTcpProcessed"));

		projectProcessedOverAllData.add(totals.get("totalEnggProcessed"));

		projectProcessedOverAllData.add(totals.get("totalRevenueProcessed"));

		List<String> projectProcessedOverAllLabel = new ArrayList();

		projectProcessedOverAllLabel.add("Account");

		projectProcessedOverAllLabel.add("TCP");

		projectProcessedOverAllLabel.add("Engineering");

		projectProcessedOverAllLabel.add("Revenue");

		mv.addObject("projectProcessedOverAllData", projectProcessedOverAllData);

		mv.addObject("projectProcessedOverAllLabel", projectProcessedOverAllLabel);

		// project processed By weekly

		List<Integer> accountWeeklyVal = new ArrayList();

		accountWeeklyVal.add(service.getOperatorsTotalsByDate(ReraConstants.OP_ACCOUNTS_USER,
				DateUtil.firstDayOfWeek(-3), DateUtil.lastDayOfWeek(-3)));

		accountWeeklyVal.add(service.getOperatorsTotalsByDate(ReraConstants.OP_ACCOUNTS_USER,
				DateUtil.firstDayOfWeek(-2), DateUtil.lastDayOfWeek(-2)));

		accountWeeklyVal.add(service.getOperatorsTotalsByDate(ReraConstants.OP_ACCOUNTS_USER,
				DateUtil.firstDayOfWeek(-1), DateUtil.lastDayOfWeek(-1)));

		accountWeeklyVal.add(service.getOperatorsTotalsByDate(ReraConstants.OP_ACCOUNTS_USER,
				DateUtil.firstDayOfWeek(0), DateUtil.lastDayOfWeek(0)));

		List<Integer> tcpWeeklyVal = new ArrayList();

		tcpWeeklyVal.add(service.getOperatorsTotalsByDate(ReraConstants.OP_TCP_USER, DateUtil.firstDayOfWeek(-3),
				DateUtil.lastDayOfWeek(-3)));

		tcpWeeklyVal.add(service.getOperatorsTotalsByDate(ReraConstants.OP_TCP_USER, DateUtil.firstDayOfWeek(-2),
				DateUtil.lastDayOfWeek(-2)));

		tcpWeeklyVal.add(service.getOperatorsTotalsByDate(ReraConstants.OP_TCP_USER, DateUtil.firstDayOfWeek(-1),
				DateUtil.lastDayOfWeek(-1)));

		tcpWeeklyVal.add(service.getOperatorsTotalsByDate(ReraConstants.OP_TCP_USER, DateUtil.firstDayOfWeek(0),
				DateUtil.lastDayOfWeek(0)));

		List<Integer> enggWeeklyVal = new ArrayList();

		enggWeeklyVal.add(service.getOperatorsTotalsByDate(ReraConstants.OP_ENGG_USER, DateUtil.firstDayOfWeek(-3),
				DateUtil.lastDayOfWeek(-3)));

		enggWeeklyVal.add(service.getOperatorsTotalsByDate(ReraConstants.OP_ENGG_USER, DateUtil.firstDayOfWeek(-2),
				DateUtil.lastDayOfWeek(-2)));

		enggWeeklyVal.add(service.getOperatorsTotalsByDate(ReraConstants.OP_ENGG_USER, DateUtil.firstDayOfWeek(-1),
				DateUtil.lastDayOfWeek(-1)));

		enggWeeklyVal.add(service.getOperatorsTotalsByDate(ReraConstants.OP_ENGG_USER, DateUtil.firstDayOfWeek(0),
				DateUtil.lastDayOfWeek(0)));

		List<Integer> revenueWeeklyVal = new ArrayList();

		revenueWeeklyVal.add(service.getOperatorsTotalsByDate(ReraConstants.OP_REVENUE_USER,
				DateUtil.firstDayOfWeek(-3), DateUtil.lastDayOfWeek(-3)));

		revenueWeeklyVal.add(service.getOperatorsTotalsByDate(ReraConstants.OP_REVENUE_USER,
				DateUtil.firstDayOfWeek(-2), DateUtil.lastDayOfWeek(-2)));

		revenueWeeklyVal.add(service.getOperatorsTotalsByDate(ReraConstants.OP_REVENUE_USER,
				DateUtil.firstDayOfWeek(-1), DateUtil.lastDayOfWeek(-1)));

		revenueWeeklyVal.add(service.getOperatorsTotalsByDate(ReraConstants.OP_REVENUE_USER, DateUtil.firstDayOfWeek(0),
				DateUtil.lastDayOfWeek(0)));

		List<String> projectProcessedOverWeeklyLabel = new ArrayList();

		projectProcessedOverWeeklyLabel.add(new SimpleDateFormat("MMM dd").format(DateUtil.firstDayOfWeek(-3)) + " - "
				+ new SimpleDateFormat("MMM dd").format(DateUtil.lastDayOfWeek(-3)));

		projectProcessedOverWeeklyLabel.add(new SimpleDateFormat("MMM dd").format(DateUtil.firstDayOfWeek(-2)) + " - "
				+ new SimpleDateFormat("MMM dd").format(DateUtil.lastDayOfWeek(-2)));

		projectProcessedOverWeeklyLabel.add(new SimpleDateFormat("MMM dd").format(DateUtil.firstDayOfWeek(-3)) + " - "
				+ new SimpleDateFormat("MMM dd").format(DateUtil.lastDayOfWeek(-1)));

		projectProcessedOverWeeklyLabel.add(new SimpleDateFormat("MMM dd").format(DateUtil.firstDayOfWeek(0)) + " - "
				+ new SimpleDateFormat("MMM dd").format(DateUtil.lastDayOfWeek(0)));

		List<Object> projectProcessedOverWeeklyData = new ArrayList();

		projectProcessedOverWeeklyData.add(accountWeeklyVal);

		projectProcessedOverWeeklyData.add(tcpWeeklyVal);

		projectProcessedOverWeeklyData.add(enggWeeklyVal);

		projectProcessedOverWeeklyData.add(revenueWeeklyVal);

		mv.addObject("projectProcessedOverWeeklyData", projectProcessedOverWeeklyData);

		mv.addObject("projectProcessedOverWeeklyLabel", projectProcessedOverWeeklyLabel);

		return mv;

	}

	@RequestMapping(value = "authority/projectTasklist")
	public ModelAndView projectTasklist(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("authority.projectTasklist");
		UserModel user = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
		List<ProjectRegistrationModel> list = authorityService
				.getPendingProjectRegistrationForAuthority(ReraConstants.PENDING_AUTHORITY, user);
		mv.addObject("projectList", list);
		mv.addObject("noOfPendingRequest", list.size());
		return mv;

	}

	@RequestMapping(value = "authority/pendingProjectStatus")
	public ModelAndView pendingProjectStatus(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("authority.pendingProjectStatus");
		UserModel user = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
		List<ProjectRegistrationModel> list = authorityService
				.getPendingProjectRegistration(ReraConstants.PENDING_OPRATOR);
		mv.addObject("projectList", list);
		mv.addObject("noOfPendingRequest", list.size());
		return mv;

	}

	@RequestMapping(value = "authority/email")
	public ModelAndView email() {
		ModelAndView mv = new ModelAndView("authority.sendEmail");

		return mv;

	}

	@RequestMapping(value = "authority/sendEmail", method = RequestMethod.POST)
	public ModelAndView sendEmailToClient(HttpServletRequest request,
			final @RequestParam CommonsMultipartFile attachFileObj) throws IOException {

		// Reading Email Form Input Parameters
		String emailSubject = request.getParameter("subject");
		String emailMessage = request.getParameter("message");
		String emailToRecipient = request.getParameter("mailTo");

		String[] emails = emailToRecipient.split(",");

		for (int i = 0; i < emails.length; i++) {
			try {

				EmailNotification email = new EmailNotification();
				email.setSendTo(emails[i]);

				if (attachFileObj != null) {
					File file = new File(attachFileObj.getOriginalFilename());
					FileUtils.copyInputStreamToFile(attachFileObj.getInputStream(), file);
					email.setAttachment(file);
				}

				email.setBodyContent(emailMessage);
				email.setSubject(emailSubject);
				mailService.sendMailWithAttachment(email);
			} catch (Exception e) {
				System.out.println("*****************************Missed sending email: " + emails[i]);
			}

		}

		ModelAndView mv = new ModelAndView("authority.sendEmail");
		mv.addObject("messageObj", "Thank You! Your Email Has Been Sent!");
		return mv;

	}

	@RequestMapping(value = "authority/resetPendingProjectStatus")
	public ModelAndView resetPendingProjectStatus(HttpServletRequest request) {
		Long projectId = Long.parseLong(request.getParameter("PROJECT_ID"));
		UserModel user = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
		LoginHistory loginDetails = (LoginHistory) httpSession.getAttribute(ReraConstants.LOGIN_SESSION_ID);
		try {
			ProjectRegistrationModel project = projectRegistrationService.getProjectRegByPk(projectId);
			/*
			 * project.getProjectRemarks().setAccountsStatus("NA");
			 * project.getProjectRemarks().setEnggStatus("NA");
			 * project.getProjectRemarks().setRevenueStatus("NA");
			 * project.getProjectRemarks().setTcpStatus("NA");
			 * project.getProjectRemarks().setLastResetBy(user);
			 * project.getProjectRemarks().setLastStatusReset(new Date());
			 * project.setUpdatedFlag(null);
			 */
			project.setFrozen(null);
			projectRegistrationService.editProjectRegistration(project);

			try {
				saveApplicationHistory(user, project, ReraConstants.OPRATOR_STATUS_RESET);

			} catch (Exception e) {
				logger.error(e.getMessage(), e);
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			logger.error(e.getMessage(), e);
		}

		ModelAndView mv = new ModelAndView("redirect:pendingProjectStatus");
		return mv;

	}

	private void saveApplicationHistory(UserModel user, ProjectRegistrationModel project, String status) {
		String applicationNumber = project.getApplicationNo();

		saveApplicationHistory(user, status, applicationNumber);
	}

	private void saveApplicationHistory(UserModel user, String status, String applicationNumber) {
		LoginHistory loginDetails = (LoginHistory) httpSession.getAttribute(ReraConstants.LOGIN_SESSION_ID);
		ApplicationHistoryModel applicationHistory = new ApplicationHistoryModel();
		applicationHistory.setApplicationNo(applicationNumber);
		applicationHistory.setStatus(status);
		applicationHistory.setCreatedOn(new Date());
		applicationHistory.setUserModifiedBy(user);
		applicationHistory.setLoginSession(loginDetails);
		applicationHistoryService.save(applicationHistory);
	}

	private void saveApplicationHistory(UserModel user, AgentRegistrationModel agent, String status) {
		String applicationNumber = agent.getApplicationNo();

		saveApplicationHistory(user, status, applicationNumber);
	}

	private void saveApplicationHistory(UserModel user, AgentRegRenewalModel agent, String status) {
		String applicationNumber = agent.getApplicationNo();

		saveApplicationHistory(user, status, applicationNumber);
	}

	private void saveApplicationHistory(UserModel user, ProjectRegExtensionModel agent, String status) {
		String applicationNumber = agent.getApplicationNo();

		saveApplicationHistory(user, status, applicationNumber);
	}

	@RequestMapping(value = "authority/projectUpdateTasklist")
	public ModelAndView projectUpdateTasklist(HttpServletRequest request) {
		UserModel um = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
		UserModel user = (UserModel) commonDao.getObject(UserModel.class, um.getUserId());
		ModelAndView mv = new ModelAndView("authority.updatedProjectTasklist");
		DetachedCriteria dt = DetachedCriteria.forClass(ProjectRegistrationModel.class, "pr");
		dt.add(Restrictions.eq("pr.status", ReraConstants.PENDING_AUTHORITY));
		dt.add(Restrictions.eq("pr.updatedFlag", "YES"));
		List<Object> list = commonDao.getList(dt);
		mv.addObject("projectList", list);
		mv.addObject("noOfPendingRequest", list.size());
		return mv;

	}

	@RequestMapping(value = "authority/complaintTasklist")
	public ModelAndView approveComplaint(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("authority.complaintTasklist");
		UserModel user = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
		List<ComplaintModel> list = null;
		try {

			list = authorityService.getPendingComplaint(ReraConstants.PENDING_AUTHORITY, user.getUserId());
			list.addAll(authorityService.getPendingComplaint(ReraConstants.UNDER_ENQUIRY, user.getUserId()));
			mv.addObject("complaintList", list);
			mv.addObject("noOfPendingRequest", list.size());

		} catch (Exception e) {

			logger.error(e.getMessage(), e);
		}

		return mv;

	}

	@RequestMapping(value = "authority/complaintDetails")
	public ModelAndView complaintDetails(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("authority.approvComplaint");

		try {
			ComplaintModel complaintModel = complaintService
					.findComplaintById(Long.parseLong(request.getParameter("id")));
			mv.addObject("complaintModel", complaintModel);

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}

		return mv;

	}

	@RequestMapping(value = "authority/projectDetails")
	public ModelAndView projectDetails(@RequestParam(value = "PROJECT_ID") Long projectId) {
		ModelAndView mv = null;
		try {
			ProjectRegistrationModel project = projectRegistrationService.getProjectRegByPk(projectId);
			if (project.getRegistrationType().equalsIgnoreCase(ReraConstants.INDVISUAL_REG)) {
				mv = new ModelAndView("authority.projectIndvDetails");
			} else {
				mv = new ModelAndView("authority.projectCompDetails");
			}

			List<Object> tempList = createTemplate(project);
			mv.addObject("template", tempList);
			mv.addObject("project", project);

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return mv;

	}

	private List<Object> createTemplate(ProjectRegistrationModel project) {
		List<Object> tempList = templateService.getTemplateListByType(ReraConstants.PROJECT);
		String enquiryDate = "";
		String promoterName = "";
		String projectName = "";
		String enquiryDate1 = "";
		String enquiryDate2 = "";
		String enquiryDate3 = "";
		String paidAmount = "";

		Double doublePenaltyAmount = 0.0;
		Double triplePenaltyAmount = 0.0;

		if (project.getPromoterDetailsModel() != null && project.getPromoterDetailsModel().getPromoterName() != null) {
			promoterName = project.getPromoterDetailsModel().getPromoterName();
		}
		if (project.getProjectDetailsModel() != null && project.getProjectDetailsModel().getProjectName() != null) {
			projectName = project.getProjectDetailsModel().getProjectName();
		}

		for (Object tm : tempList) {

			String tc = ((TemplateModel) tm).getTemplateContent().replaceAll("\\$applicationDate",
					new SimpleDateFormat("dd/MM/yyyy").format(project.getCreatedOn().getTime()));

			if (project.getApplicationNo() != null) {
				tc = tc.replaceAll("\\$applicationNumber", project.getApplicationNo());
			}

			if (project.getEnquiryList() != null) {

				if (project.getEnquiryList().size() >= 1) {
					enquiryDate1 = new SimpleDateFormat("dd/MM/yyyy")
							.format(project.getEnquiryList().get(0).getCreatedOn().getTime());
				}

				if (project.getEnquiryList().size() >= 2) {
					enquiryDate2 = new SimpleDateFormat("dd/MM/yyyy")
							.format(project.getEnquiryList().get(1).getCreatedOn().getTime());
				}

				if (project.getEnquiryList().size() >= 3) {
					enquiryDate3 = new SimpleDateFormat("dd/MM/yyyy")
							.format(project.getEnquiryList().get(2).getCreatedOn().getTime());
				}

				for (EnquiryModel enquiry : project.getEnquiryList()) {
					enquiryDate = new SimpleDateFormat("dd/MM/yyyy").format(enquiry.getCreatedOn().getTime());
				}

			}

			if (project.getPaymentDetailsModel() != null) {
				paidAmount = project.getPaymentDetailsModel().getAmount().toString();
				doublePenaltyAmount = 2 * project.getPaymentDetailsModel().getAmount();
				triplePenaltyAmount = 3 * project.getPaymentDetailsModel().getAmount();
			}
			tc = tc.replaceAll("\\$paidAmount", paidAmount);
			tc = tc.replaceAll("\\$doublePenaltyAmount", doublePenaltyAmount + "");
			tc = tc.replaceAll("\\$triplePenaltyAmount", triplePenaltyAmount + "");
			tc = tc.replaceAll("\\$enquiryDate", enquiryDate);
			tc = tc.replaceAll("\\$enqDate1", enquiryDate1);
			tc = tc.replaceAll("\\$enqDate2", enquiryDate2);
			tc = tc.replaceAll("\\$enqDate3", enquiryDate3);

			tc = tc.replaceAll("\\$currentDate", new SimpleDateFormat("dd/MM/yyyy").format(new Date()));

			tc = tc.replaceAll("\\$promoterName", promoterName);

			tc = tc.replaceAll("\\$projectName", projectName);

			tc = tc.replaceAll("\\$projectDate",
					new SimpleDateFormat("dd/MM/yyyy").format(project.getCreatedOn().getTime()));

			((TemplateModel) tm).setTemplateContent(tc);
		}
		return tempList;
	}

	@RequestMapping(value = "authority/sendProjectRegEnquiry", method = RequestMethod.POST)
	public ModelAndView sendProjectRegEnquiry(@RequestParam(value = "projectId") Long projectId,
			@RequestParam(value = "subject") String subject, @RequestParam(value = "summary") String summary,
			@RequestParam(value = "Accounts", required = false) String accounts,
			@RequestParam(value = "Revenue", required = false) String revenue,
			@RequestParam(value = "TCP", required = false) String tcp,
			@RequestParam(value = "Engineer", required = false) String engg,
			@RequestParam(value = "accountsEnqAuthRemarks", required = false) String accountsAuthRemarks,
			@RequestParam(value = "revenueEnqAuthRemarks", required = false) String revenueAuthRemarks,
			@RequestParam(value = "tcpEnqAuthRemarks", required = false) String tcpAuthRemarks,
			@RequestParam(value = "enggEnqAuthRemarks", required = false) String enggAuthRemarks) {
		ModelAndView mv = null;
		try {
			ProjectRegistrationModel project = projectRegistrationService.getProjectRegByPk(projectId);
			String mobileNo = null;
			mobileNo = project.getPromoterDetailsModel().getMobileNo();
			logger.info("mobileNo::::" + mobileNo);

			EnquiryModel enq = new EnquiryModel();
			enq.setSubject(subject);
			enq.setCreatedOn(Calendar.getInstance());
			enq.setEnquiryText(summary);
			UserModel user = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
			UserModel us = (UserModel) commonDao.getObject(UserModel.class, user.getUserId());
			enq.setRaisedBy(us);

			enq.setEmailId(project.getPromoterDetailsModel().getEmailId());

			mailService.sendMail(enq);

			try {
				saveApplicationHistory(user, project, ReraConstants.ENQUIRY);

			} catch (Exception e) {
				logger.error(e.getMessage(), e);
			}

			if (project.getPromoterDetailsModel().getMobileNo() != null && project.getApplicationNo() != null) {
				StringBuffer sb = new StringBuffer();
				sb.append("An Enquiry has been raised for ").append(project.getApplicationNo()).append(".")
				.append(" Please refer your registered email address for more details.");
				smsService.sendSMS(project.getPromoterDetailsModel().getMobileNo(), sb.toString());

			}

			if (project.getEnquiryList() == null) {
				project.setEnquiryList(new ArrayList<EnquiryModel>());
			}
			project.getEnquiryList().add(enq);
			ProjectRemarks rm = project.getProjectRemarks();
			if (rm == null) {
				rm = new ProjectRemarks();
				rm.setAccountsStatus("NA");
				rm.setEnggStatus("NA");
				rm.setRevenueStatus("NA");
				rm.setTcpStatus("NA");
				UserRemarks ur = new UserRemarks();
				ur.setStatus("NEW");
				List<UserRemarks> lt = new ArrayList<UserRemarks>();
				lt.add(ur);
				rm.setRemarksList(lt);
				project.setProjectRemarks(rm);

			}
			List<UserRemarks> urList = rm.getRemarksList();
			UserRemarks ur = urList.get(urList.size() - 1);
			ur.setAccountsAuthRemarks(accountsAuthRemarks);
			ur.setAuthorityUser(user);
			ur.setEnggAuthRemarks(enggAuthRemarks);
			ur.setTcpAuthRemarks(tcpAuthRemarks);
			ur.setRevenueAuthRemarks(revenueAuthRemarks);
			ur.setAuthRemarkDate(Calendar.getInstance());
			ur.setStatus("CLOSE");
			UserRemarks newRem = new UserRemarks();
			newRem.setStatus("NEW");
			urList.add(newRem);
			if (accounts != null && accounts.trim().length() > 0) {
				rm.setAccountsStatus("NA");
			}
			if (revenue != null && revenue.trim().length() > 0) {
				rm.setRevenueStatus("NA");
			}
			if (tcp != null && tcp.trim().length() > 0) {
				rm.setTcpStatus("NA");
			}
			if (engg != null && engg.trim().length() > 0) {
				rm.setEnggStatus("NA");
			}
			if (!ReraConstants.APPROVED.equals(project.getStatus())) {
				project.setStatus(ReraConstants.PENDING_OPRATOR);
			} else {
				project.setClarificationAccepted(null);
			}

			// reset the project updated status of promoter to blank
			project.setUpdatedFlag(null);

			//alerts
			if(project.getFirstEnquiryDate()==null && project.getSecondEnquiryDate()==null)
				project.setFirstEnquiryDate(new Date());
			else if(project.getFirstEnquiryDate()!=null && project.getSecondEnquiryDate()==null)
				project.setSecondEnquiryDate(new Date());	

			projectRegistrationService.editProjectRegistration(project);

			if (project.getRegistrationType().equalsIgnoreCase(ReraConstants.INDVISUAL_REG)) {
				mv = new ModelAndView("authority.projectIndvDetails");
			} else {
				mv = new ModelAndView("authority.projectCompDetails");
			}

			mv.addObject("project", project);

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return mv;

	}

	@RequestMapping(value = "projectView")
	public ModelAndView projectView() {
		ModelAndView mv = new ModelAndView("projectView");

		Set<ProjectRegistrationModel> approvedList = new HashSet<ProjectRegistrationModel>(
				authorityService.getPendingProjectRegistration(ReraConstants.APPROVED));

		List<AgentRegistrationModel> allAgentslist = authorityService.getViewAllAgents();

		DetachedCriteria dt = DetachedCriteria.forClass(ProjectRegistrationModel.class, "pr");
		dt.add(Restrictions.ne("pr.status", "SAVE_AS_DRAFT"));
		dt.add(Restrictions.ne("pr.status", "REVOKED"));
		List<Object> allApplicantsList = commonDao.getList(dt);

		List<AgentRegistrationModel> agentsApprovedList = authorityService
				.getPendingAgentRegistration(ReraConstants.APPROVED);

		mv.addObject("allApplicantsList", allApplicantsList);
		mv.addObject("allAgentslist", allAgentslist);
		mv.addObject("approvedList", agentsApprovedList);

		return mv;
	}

	@RequestMapping(value = "authority/returnProjectRegistration")
	public ModelAndView returnProjectRegistration(@RequestParam(value = "PROJECT_ID") Long projectId,
			@RequestParam(value = "ACCOUNT", required = false) String accounts,
			@RequestParam(value = "REVENUE", required = false) String revenue,
			@RequestParam(value = "TCP", required = false) String tcp,
			@RequestParam(value = "ENGG", required = false) String engg,
			@RequestParam(value = "accountsAuthRemarks") String accountsAuthRemarks,
			@RequestParam(value = "revenueAuthRemarks") String revenueAuthRemarks,
			@RequestParam(value = "tcpAuthRemarks") String tcpAuthRemarks,
			@RequestParam(value = "enggAuthRemarks") String enggAuthRemarks, HttpServletRequest request)
					throws Exception {
		ModelAndView mv = new ModelAndView("redirect:projectTasklist");
		UserModel usr = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
		try {
			usr = (UserModel) commonDao.getObject(UserModel.class, usr.getUserId());
			ProjectRegistrationModel project = projectRegistrationService.getProjectRegByPk(projectId);
			ProjectRemarks rm = project.getProjectRemarks();
			if (rm == null) {
				rm = new ProjectRemarks();
				rm.setAccountsStatus("OK");
				rm.setEnggStatus("OK");
				rm.setRevenueStatus("OK");
				rm.setTcpStatus("OK");
				UserRemarks ur = new UserRemarks();
				ur.setStatus("NEW");
				List<UserRemarks> lt = new ArrayList<UserRemarks>();
				lt.add(ur);
				rm.setRemarksList(lt);
				project.setProjectRemarks(rm);

			}
			List<UserRemarks> urList = rm.getRemarksList();
			UserRemarks ur = urList.get(urList.size() - 1);
			ur.setAccountsAuthRemarks(accountsAuthRemarks);
			ur.setAuthorityUser(usr);
			ur.setEnggAuthRemarks(enggAuthRemarks);
			ur.setTcpAuthRemarks(tcpAuthRemarks);
			ur.setRevenueAuthRemarks(revenueAuthRemarks);
			ur.setAuthRemarkDate(Calendar.getInstance());
			ur.setStatus("CLOSE");
			UserRemarks newRem = new UserRemarks();
			newRem.setStatus("NEW");
			urList.add(newRem);
			if (accounts != null && accounts.trim().length() > 0) {
				rm.setAccountsStatus("NA");
			}
			if (revenue != null && revenue.trim().length() > 0) {
				rm.setRevenueStatus("NA");
			}
			if (tcp != null && tcp.trim().length() > 0) {
				rm.setTcpStatus("NA");
			}
			if (engg != null && engg.trim().length() > 0) {
				rm.setEnggStatus("NA");
			}
			project.setStatus(ReraConstants.PENDING_OPRATOR);
			
			project.setUpdatedFlag("YES");
			//alerts
			project.setReturnedByL1On(Calendar.getInstance());
			projectRegistrationService.editProjectRegistration(project);

			try {
				saveApplicationHistory(usr, project, ReraConstants.RETURN);

			} catch (Exception e) {
				logger.error(e.getMessage(), e);
			}
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}

		return mv;
	}

	// For getting projects under Pending Enquery

	@RequestMapping(value = "authority/viewPendingEnquery")
	public ModelAndView viewPendingEnquery(HttpServletRequest request) {

		ModelAndView mv = new ModelAndView("authority.viewPendingEnquery");
		List<ProjectRegistrationModel> enquiryList = authorityService.getProjectsUnderEnquiryForAuthority();
		mv.addObject("enquiryList", enquiryList);
		mv.addObject("noOfPendingRequest", enquiryList.size());

		return mv;

	}

	@RequestMapping(value = "authority/saveProjectRemarks")
	public ModelAndView saveRemarks(@RequestParam(value = "PROJECT_ID") Long projectId,
			@RequestParam(value = "accountsAuthRemarks") String accountsAuthRemarks,
			@RequestParam(value = "revenueAuthRemarks") String revenueAuthRemarks,
			@RequestParam(value = "tcpAuthRemarks") String tcpAuthRemarks,
			@RequestParam(value = "enggAuthRemarks") String enggAuthRemarks, HttpServletRequest request)
					throws Exception {
		ModelAndView mv = new ModelAndView("redirect:projectTasklist");
		UserModel usr = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
		try {
			usr = (UserModel) commonDao.getObject(UserModel.class, usr.getUserId());
			ProjectRegistrationModel project = projectRegistrationService.getProjectRegByPk(projectId);
			ProjectRemarks rm = project.getProjectRemarks();
			if (rm == null) {
				rm = new ProjectRemarks();
				rm.setAccountsStatus("NA");
				rm.setEnggStatus("NA");
				rm.setRevenueStatus("NA");
				rm.setTcpStatus("NA");
				UserRemarks ur = new UserRemarks();
				ur.setStatus("NEW");
				List<UserRemarks> lt = new ArrayList<UserRemarks>();
				lt.add(ur);
				rm.setRemarksList(lt);
				project.setProjectRemarks(rm);

			}
			List<UserRemarks> urList = rm.getRemarksList();
			UserRemarks ur = urList.get(urList.size() - 1);
			ur.setAccountsAuthRemarks(accountsAuthRemarks);
			// On save don't set Authority user as no action taken yet
			// ur.setAuthorityUser(usr);
			ur.setEnggAuthRemarks(enggAuthRemarks);
			ur.setTcpAuthRemarks(tcpAuthRemarks);
			ur.setRevenueAuthRemarks(revenueAuthRemarks);
			ur.setAuthRemarkDate(Calendar.getInstance());

			projectRegistrationService.editProjectRegistration(project);
			try {
				saveApplicationHistory(usr, project, ReraConstants.MODIFIED);

			} catch (Exception e) {
				logger.error(e.getMessage(), e);
			}
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}

		return mv;
	}

	@RequestMapping(value = "authority/approveProjectRegistration")
	public ModelAndView approveProjectRegistration(@RequestParam(value = "PROJECT_ID") Long projectId,
			@RequestParam(value = "accountsAuthRemarks") String accountsAuthRemarks,
			@RequestParam(value = "revenueAuthRemarks") String revenueAuthRemarks,
			@RequestParam(value = "tcpAuthRemarks") String tcpAuthRemarks,
			@RequestParam(value = "enggAuthRemarks") String enggAuthRemarks,
			@RequestParam(value = "STATUS") String status,
			@RequestParam(value = "verificationStatus") String verificationStatus, HttpServletRequest request)
					throws Exception {
		ModelAndView mv = new ModelAndView("redirect:projectTasklist");
		UserModel usr = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
		try {
			usr = (UserModel) commonDao.getObject(UserModel.class, usr.getUserId());
			ProjectRegistrationModel project = projectRegistrationService.getProjectRegByPk(projectId);

			if (status.equals("APPROVED")) {

				String appNo = projectRegistrationService.generateProjectRegNumber(project);
				if (appNo == null || appNo.trim().length() == 0)
					throw new RuntimeException();

				project.setProjectRegistrationNo(appNo);

				ProjectRemarks rm = project.getProjectRemarks();

				if (rm == null) {
					rm = new ProjectRemarks();
					project.setProjectRemarks(rm);
					rm.setRemarksList(new ArrayList<UserRemarks>());
					rm.getRemarksList().add(new UserRemarks());
				}

				List<UserRemarks> urList = rm.getRemarksList();
				UserRemarks ur = urList.get(urList.size() - 1);
				ur.setAccountsAuthRemarks(accountsAuthRemarks);
				ur.setAuthorityUser(usr);
				ur.setEnggAuthRemarks(enggAuthRemarks);
				ur.setTcpAuthRemarks(tcpAuthRemarks);
				ur.setRevenueAuthRemarks(revenueAuthRemarks);
				ur.setAuthRemarkDate(Calendar.getInstance());
				ur.setStatus("CLOSE");
				project.setStatus(ReraConstants.APPROVED);
				StateUtModel state = (StateUtModel) request.getAttribute("RERA_STATEUT");
				// String primNo=getNextNumber();
				// GenerateRegistrationNumber.generateRegNumber(project,
				// state,primNo );

				String str[] = project.getApplicationNo().split("/");
				UserModel user = new UserModel();
				user.setLoginId("PR" + str[str.length - 1]);
				user.setPassword("Welcome@123");
				user.setUserType(ReraConstants.PROJECT_USER);
				user.setStatus(ReraConstants.ACTIVE_USER);
				user.setCreatedOn(Calendar.getInstance());
				user.setEmailId(project.getPromoterDetailsModel().getEmailId());
				user.setUserName(project.getPromoterDetailsModel().getPromoterName());
				project.setProjectUser(user);
				project.setApprovedOn(Calendar.getInstance());
				project.setApprovedBy(usr);
				project.setExpireDate(project.getProjectDetailsModel().getCompletionDate());

				projectRegistrationService.editProjectRegistration(project);
				mailService.sendProjectRegApproval(project);

				if (project.getPromoterDetailsModel().getMobileNo() != null && project.getApplicationNo() != null) {
					StringBuffer sb = new StringBuffer();

					sb.append("Dear ").append(project.getPromoterDetailsModel().getPromoterName()).append(" , ")
					.append("\n").append("Your project ");

					sb.append(project.getProjectDetailsModel().getProjectName()).append(" with ")
					.append(project.getApplicationNo()).append(" has been approved by Rera Karnataka.");

					smsService.sendSMS(project.getPromoterDetailsModel().getMobileNo(), sb.toString());

				}

				if (project.getRegistrationType().equalsIgnoreCase(ReraConstants.INDVISUAL_REG)) {
					mv = new ModelAndView("authority.projectIndvDetailsPage");
				} else {
					mv = new ModelAndView("authority.projectCompDetailsPage");
				}
				mv.addObject("project", project);
				try {
					saveApplicationHistory(usr, project, ReraConstants.APPROVED);

				} catch (Exception e) {
					logger.error(e.getMessage(), e);
				}
			} else {
				ProjectRemarks rm = project.getProjectRemarks();
				if (rm == null) {
					rm = new ProjectRemarks();
					project.setProjectRemarks(rm);
					rm.setRemarksList(new ArrayList<UserRemarks>());
					rm.getRemarksList().add(new UserRemarks());
					rm.setUnderSecVerificationStatus(verificationStatus);
				} else {
					System.out.println("verificationStatus >>" + verificationStatus);
					rm.setUnderSecVerificationStatus(verificationStatus);
				}

				List<UserRemarks> urList = rm.getRemarksList();
				UserRemarks ur = urList.get(urList.size() - 1);
				ur.setAccountsAuthRemarks(accountsAuthRemarks);
				ur.setAuthorityUser(usr);
				ur.setEnggAuthRemarks(enggAuthRemarks);
				ur.setTcpAuthRemarks(tcpAuthRemarks);
				ur.setRevenueAuthRemarks(revenueAuthRemarks);
				ur.setAuthRemarkDate(Calendar.getInstance());

				project.setStatus(ReraConstants.PENDING_HEADOFFICE);
				projectRegistrationService.editProjectRegistration(project);
				try {
					saveApplicationHistory(usr, project, ReraConstants.FORWARD);

				} catch (Exception e) {
					logger.error(e.getMessage(), e);
				}
				mv = new ModelAndView("redirect:projectTasklist");
			}

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			throw e;
		}
		return mv;

	}

	private String getNextNumber() {
		ProjectNumber pn = (ProjectNumber) commonDao.getObject(ProjectNumber.class, new Long(1));
		if (pn == null) {
			pn = new ProjectNumber();
			pn.setFirstDigit(0);
			pn.setSecondDigit(0);
			pn.setLastNumber(0);
			commonDao.saveObject(pn);
		}
		pn.increementByOne();
		commonDao.updateObject(pn);

		return pn.generateNumber();
	}

	private String getNextAgentNumber() {
		AgentNumber pn = (AgentNumber) commonDao.getObject(AgentNumber.class, new Long(1));
		if (pn == null) {
			pn = new AgentNumber();
			pn.setFirstDigit(0);
			pn.setSecondDigit(0);
			pn.setLastNumber(0);
			commonDao.saveObject(pn);
		}
		pn.increementByOne();
		commonDao.updateObject(pn);

		return pn.generateNumber();
	}

	@RequestMapping(value = "authority/agentTasklist")
	public ModelAndView agentTasklist(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("authority.agentTasklist");
		UserModel user = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
		UserModel um = (UserModel) commonDao.getObject(UserModel.class, user.getUserId());
		List<AgentRegistrationModel> list = authorityService
				.getPendingAgentRegistration(ReraConstants.PENDING_AUTHORITY, um.getUserId());
		mv.addObject("agentList", list);
		mv.addObject("noOfPendingRequest", list.size());
		return mv;

	}

	@RequestMapping(value = "authority/correctData")
	public ModelAndView correctData(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("authority.agentTasklist");
		UserModel user = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
		UserModel um = (UserModel) commonDao.getObject(UserModel.class, user.getUserId());
		List<ProjectRegistrationModel> list = authorityService.getPendingProjectRegistration(ReraConstants.APPROVED);

		for (ProjectRegistrationModel project : list) {
			if (project.getProjectRegistrationNo() == null) {
				project.setProjectRegistrationNo(
						projectRegistrationService.generateProjectRegNumberForOldProjects(project));
				projectRegistrationService.editProjectRegistration(project);
			}
		}

		return null;

	}

	@RequestMapping(value = "authority/returnbyl2")
	public ModelAndView returnProjectsByAuthority(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("authority.returnbyl2");

		UserModel um = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
		UserModel user = (UserModel) commonDao.getObject(UserModel.class, um.getUserId());

		List<ProjectRegistrationModel> list = authorityService
				.returnProjectsByAuthority(ReraConstants.PENDING_AUTHORITY, user);
		mv.addObject("projectList", list);
		mv.addObject("noOfPendingRequest", list.size());

		return mv;

	}

	@RequestMapping(value = "authority/agentUpdateTasklist")
	public ModelAndView agentUpdateTasklist(HttpServletRequest request) {
		UserModel um = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
		UserModel user = (UserModel) commonDao.getObject(UserModel.class, um.getUserId());

		ModelAndView mv = new ModelAndView("authority.agentUpdateTasklist");
		DetachedCriteria dt = DetachedCriteria.forClass(AgentRegistrationModel.class);
		dt.add(Restrictions.eq("status", ReraConstants.PENDING_AUTHORITY));
		dt.add(Restrictions.eq("updatedFlag", "YES"));
		dt.add(Restrictions.eq("authorityUser", user));

		List<Object> list = commonDao.getList(dt);
		mv.addObject("agentList", list);
		mv.addObject("noOfPendingRequest", list.size());
		return mv;

	}

	@RequestMapping(value = "authority/correctAgentData")
	public ModelAndView correctAgentData(HttpServletRequest request) {
		UserModel um = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
		UserModel user = (UserModel) commonDao.getObject(UserModel.class, um.getUserId());

		ModelAndView mv = new ModelAndView("authority.agentUpdateTasklist");
		DetachedCriteria dt = DetachedCriteria.forClass(AgentRegistrationModel.class);
		dt.add(Restrictions.eq("status", ReraConstants.APPROVED));

		List<Object> list = commonDao.getList(dt);

		for (Object object : list) {
			AgentRegistrationModel agent = (AgentRegistrationModel) object;
			agent.setAgentRegistrationNo(agentRegistrationService.generateAgentNo(agent));
			agentRegistrationService.editAgentRegistration((AgentRegistrationModel) object);
		}

		return mv;

	}

	@RequestMapping(value = "authority/sendAgentRegEnquiry", method = RequestMethod.POST)
	public ModelAndView sendAgentRegEnquiry(@RequestParam(value = "AGENT_ID") Long agenttId,
			@RequestParam(value = "subject") String subject, @RequestParam(value = "summary") String summary) {
		ModelAndView mv = null;
		try {
			AgentRegistrationModel agent = agentRegistrationService.getAgentRegByPk(agenttId);

			EnquiryModel enq = new EnquiryModel();
			enq.setSubject(subject);
			enq.setCreatedOn(Calendar.getInstance());
			enq.setEnquiryText(summary);
			UserModel user = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
			UserModel us = (UserModel) commonDao.getObject(UserModel.class, user.getUserId());
			enq.setRaisedBy(us);
			if (agent.getRegistrationType().equals(ReraConstants.INDVISUAL_REG)) {
				enq.setEmailId(agent.getAgentDetailsModel().getAgentEmailId());
			} else {
				enq.setEmailId(agent.getAgentDetailsModel().getFirmEmail());
			}

			mailService.sendMail(enq);
			if (agent.getEnquiryList() == null) {
				agent.setEnquiryList(new ArrayList<EnquiryModel>());
			}
			agent.getEnquiryList().add(enq);
			agent.setStatus(ReraConstants.PENDING_OPRATOR);
			agent.setUpdatedFlag(null);

			agentRegistrationService.editAgentRegistration(agent);

			if (agent.getRegistrationType().equalsIgnoreCase(ReraConstants.INDVISUAL_REG)) {
				mv = new ModelAndView("authority.agentIndvDetails");
			} else {
				mv = new ModelAndView("authority.agentCompDetails");
			}
			mv.addObject("agent", agent);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;

	}

	/*
	 * @RequestMapping(value = "authority/approveAgentRegistration") public
	 * ModelAndView approveAgentRegistrationStaus(@RequestParam(value =
	 * "AGENT_ID") Long agentId,
	 * 
	 * @RequestParam(value = "REMARKS") String remarks, @RequestParam(value =
	 * "STATUS") String status, HttpServletRequest request) { ModelAndView mv =
	 * new ModelAndView("redirect:agentTasklist"); UserModel usr = (UserModel)
	 * httpSession.getAttribute(ReraConstants.SES_USER_ATTR); try {
	 * AgentRegistrationModel agent =
	 * agentRegistrationService.getAgentRegByPk(agentId);
	 * 
	 * agent.setAuthorityUser(usr); agent.setAuthorityRemarks(remarks);
	 * 
	 * if (status.equals("APPROVED")) { agent.setStatus(ReraConstants.APPROVED);
	 * StateUtModel state = (StateUtModel) request.getAttribute("RERA_STATEUT");
	 * // String primNo=getNextAgentNumber(); //
	 * GenerateRegistrationNumber.generateRegNumber(agent, // state,primNo);
	 * agent.setAgentRegistrationNo(agent.getApplicationNo()); String str[] =
	 * agent.getApplicationNo().split("/"); UserModel user = new UserModel();
	 * user.setLoginId("AG" + str[str.length - 1]);
	 * user.setPassword("Welcome@123");
	 * user.setCreatedOn(Calendar.getInstance());
	 * 
	 * user.setUserType(ReraConstants.AGENT_USER); if
	 * (agent.getRegistrationType().equalsIgnoreCase(ReraConstants.INDVISUAL_REG
	 * )) { user.setUserName(agent.getAgentDetailsModel().getAgentName());
	 * user.setEmailId(agent.getAgentDetailsModel().getAgentEmailId()); } else {
	 * user.setUserName(agent.getAgentDetailsModel().getFirmName());
	 * user.setEmailId(agent.getAgentDetailsModel().getFirmEmail()); }
	 * 
	 * user.setStatus(ReraConstants.ACTIVE_USER); usr = (UserModel)
	 * commonDao.getObject(UserModel.class, usr.getUserId());
	 * agent.setApprovedBy(usr); agent.setApprovedOn(Calendar.getInstance());
	 * agent.setAgentUser(user); Calendar exp = Calendar.getInstance();
	 * exp.set(Calendar.YEAR, exp.get(Calendar.YEAR) + 5);
	 * agent.setExpireDate(exp);
	 * 
	 * //agentRegistrationService.editAgentRegistration(agent);
	 * 
	 * try { saveApplicationHistory(usr, agent, ReraConstants.APPROVED);
	 * 
	 * } catch (Exception e) { logger.error(e.getMessage(), e); }
	 * 
	 * mailService.sendAgentRegApproval(agent); if
	 * (agent.getRegistrationType().equalsIgnoreCase(ReraConstants.INDVISUAL_REG
	 * )) { mv = new ModelAndView("authority.agentIndvDetailsPage"); } else { mv
	 * = new ModelAndView("authority.agentCompDetailsPage"); }
	 * mv.addObject("agent", agent); } else {
	 * agent.setStatus(ReraConstants.APPROVED); agent.setUpdatedFlag(null);
	 * agent.setCreatedOn(Calendar.getInstance()); mv = new
	 * ModelAndView("redirect:agentTasklist"); }
	 * agentRegistrationService.editAgentRegistration(agent); } catch (Exception
	 * e) { logger.error(e.getMessage(), e); } return mv;
	 * 
	 * }
	 */

	@RequestMapping(value = "authority/approveAgentRegistration")
	public ModelAndView approveAgentRegistrationStaus(@RequestParam(value = "AGENT_ID") Long agentId,
			@RequestParam(value = "REMARKS") String remarks, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("redirect:agentTasklist");
		UserModel usr = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
		try {
			AgentRegistrationModel agent = agentRegistrationService.getAgentRegByPk(agentId);
			agent.setStatus(ReraConstants.APPROVED);
			StateUtModel state = (StateUtModel) request.getAttribute("RERA_STATEUT");
			// String primNo=getNextAgentNumber();
			// GenerateRegistrationNumber.generateRegNumber(agent,
			// state,primNo);

			agent.setAgentRegistrationNo(agentRegistrationService.generateAgentNo(agent));
			String str[] = agent.getAgentRegistrationNo().split("/");
			UserModel user = new UserModel();
			user.setLoginId("AG" + str[str.length - 1]);
			user.setPassword("Welcome@123");
			user.setCreatedOn(Calendar.getInstance());

			user.setUserType(ReraConstants.AGENT_USER);
			if (agent.getRegistrationType().equalsIgnoreCase(ReraConstants.INDVISUAL_REG)) {
				user.setUserName(agent.getAgentDetailsModel().getAgentName());
				user.setEmailId(agent.getAgentDetailsModel().getAgentEmailId());
			} else {
				user.setUserName(agent.getAgentDetailsModel().getFirmName());
				user.setEmailId(agent.getAgentDetailsModel().getFirmEmail());
			}

			user.setStatus(ReraConstants.ACTIVE_USER);
			usr = (UserModel) commonDao.getObject(UserModel.class, usr.getUserId());
			agent.setApprovedBy(usr);
			agent.setApprovedOn(Calendar.getInstance());
			agent.setAgentUser(user);
			Calendar exp = Calendar.getInstance();
			exp.set(Calendar.YEAR, exp.get(Calendar.YEAR) + 5);
			agent.setExpireDate(exp);
			agent.setUpdatedFlag(null);
			agent.setAuthorityRemarks(remarks);
			agentRegistrationService.editAgentRegistration(agent);

			try {
				saveApplicationHistory(usr, agent, ReraConstants.APPROVED);

			} catch (Exception e) {
				logger.error(e.getMessage(), e);

			}

			mailService.sendAgentRegApproval(agent);
			if (agent.getRegistrationType().equalsIgnoreCase(ReraConstants.INDVISUAL_REG)) {
				mv = new ModelAndView("redirect:agentTasklist");
			} else {
				mv = new ModelAndView("redirect:agentTasklist");
			}
			mv.addObject("agent", agent);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return mv;

	}

	@RequestMapping(value = "authority/viewAllAgents")
	public ModelAndView viewAllAgents(HttpServletRequest request,
			@RequestParam(value = "status", required = false) String status,
			@RequestParam(value = "regNo", required = false) String regNo) {

		ModelAndView mv = new ModelAndView("authority.allAgentlist");

		// List<AgentRegistrationModel> agentList =
		// authorityService.getViewAllAgents(status, regNo);
		List<AgentRegistrationModel> agentList = authorityService.getViewAllAgents();
		// List<AgentRegistrationModel> list =
		// authorityService.getPendingAgentRegistration(ReraConstants.APPROVED);
		mv.addObject("agentList", agentList);
		mv.addObject("totalRecords", agentList.size());
		return mv;

	}

	/*
	 * @RequestMapping(value = "authority/viewAllProjects") public ModelAndView
	 * viewAllProject(HttpServletRequest
	 * request,@RequestParam(value="status",required=false) String status,
	 * 
	 * @RequestParam(value="regNo",required=false) String regNo) {
	 * 
	 * ModelAndView mv = new ModelAndView("authority.allProjectlist");
	 * 
	 * List<ProjectRegistrationModel> list =
	 * authorityService.getViewAllProjects(status,regNo); //
	 * List<ProjectRegistrationModel> list =
	 * authorityService.getPendingProjectRegistration(ReraConstants.APPROVED);
	 * mv.addObject("projectList", list); mv.addObject("totalRecords",
	 * list.size()); return mv;
	 * 
	 * }
	 */

	@RequestMapping(value = "authority/viewAllProjects")
	public ModelAndView viewAllProject(HttpServletRequest request,
			@RequestParam(value = "status", required = false) String status,
			@RequestParam(value = "type", required = false) String type,
			@RequestParam(value = "fromdate", required = false) String fromdate,
			@RequestParam(value = "todate", required = false) String todate) {
		ModelAndView mv = new ModelAndView("authority.allProjectlist");
		try {
			DetachedCriteria dt = DetachedCriteria.forClass(ProjectRegistrationModel.class, "pr");
			if (status != null && status.trim().length() > 2) {
				dt.add(Restrictions.eq("status", status));
				dt.add(Restrictions.ne("pr.status", "SAVE_AS_DRAFT"));
			}
			if (type != null && type.trim().length() > 2) {
				dt.createAlias("pr.projectDetailsModel", "pj");
				dt.add(Restrictions.eq("pj.projectType", type));
				dt.add(Restrictions.ne("pr.status", "SAVE_AS_DRAFT"));
			}
			if (fromdate != null && fromdate.trim().length() > 2) {
				SimpleDateFormat sf = new SimpleDateFormat("dd/MM/yyyy");
				Date dat = sf.parse(fromdate);
				Calendar c = Calendar.getInstance();
				c.setTime(dat);
				c.set(Calendar.HOUR, 1);

				dt.add(Restrictions.ge("pr.createdOn", c));
				dt.add(Restrictions.ne("pr.status", "SAVE_AS_DRAFT"));

			}
			if (todate != null && todate.trim().length() > 2) {
				SimpleDateFormat sf = new SimpleDateFormat("dd/MM/yyyy");
				Date dat = sf.parse(todate);
				Calendar c = Calendar.getInstance();
				c.setTime(dat);
				c.set(Calendar.HOUR, 23);

				dt.add(Restrictions.le("pr.createdOn", c));
				dt.add(Restrictions.ne("pr.status", "SAVE_AS_DRAFT"));

			}

			dt.add(Restrictions.ne("pr.status", "SAVE_AS_DRAFT"));
			List<Object> list = commonDao.getList(dt);
			mv.addObject("projectList", list);
			mv.addObject("noOfPendingRequest", list.size());
		} catch (Exception ex) {
			logger.error(ex.getMessage(), ex);
		}
		return mv;

	}

	@RequestMapping(value = "authority/viewApprovedAgents")
	public ModelAndView viewApprovedAgents(HttpServletRequest request,
			@RequestParam(value = "status", required = false) String status,
			@RequestParam(value = "regNo", required = false) String regNo) {

		ModelAndView mv = new ModelAndView("authority.viewApprovedAgents");

		// List<AgentRegistrationModel> list =
		// authorityService.getViewAllAgents(status,regNo);
		List<AgentRegistrationModel> list = authorityService.getPendingAgentRegistration(ReraConstants.APPROVED);
		mv.addObject("agentList", list);
		mv.addObject("totalRecords", list.size());
		return mv;

	}

	@RequestMapping(value = "authority/viewApprovedProjects")
	public ModelAndView viewApprovedProjects(HttpServletRequest request,
			@RequestParam(value = "status", required = false) String status,
			@RequestParam(value = "regNo", required = false) String regNo) {

		ModelAndView mv = new ModelAndView("authority.viewApprovedProjects");

		List<ProjectRegistrationModel> list = authorityService.getPendingProjectRegistration(ReraConstants.APPROVED);
		mv.addObject("projectList", list);
		mv.addObject("totalRecords", list.size());
		return mv;

	}

	@RequestMapping(value = "viewApprovedProjectsInHomePage")
	public ModelAndView viewApprovedProjectsInHomePage(HttpServletRequest request,
			@RequestParam(value = "status", required = false) String status,
			@RequestParam(value = "regNo", required = false) String regNo) {

		ModelAndView mv = new ModelAndView("viewApprovedProjectsInHomePage");

		Set<ProjectRegistrationModel> underProcess = new HashSet<ProjectRegistrationModel>();
		Set<ProjectRegistrationModel> enquiryList = new HashSet<ProjectRegistrationModel>(
				authorityService.getProjectsUnderEnquiry());
		Set<ProjectRegistrationModel> approvedList = new HashSet<ProjectRegistrationModel>(
				authorityService.getPendingProjectRegistration(ReraConstants.APPROVED));

		List<ProjectRegistrationModel> allProjectsList = new ArrayList<ProjectRegistrationModel>(
				authorityService.getViewAllProjects(status, regNo));

		Set<ProjectRegistrationModel> allRejectedList = new HashSet<ProjectRegistrationModel>(
				authorityService.getPendingProjectRegistration(ReraConstants.REJECTED));
		enquiryList.removeAll(allRejectedList);
		underProcess.addAll(authorityService.getProjectsUnderWork());
		underProcess.addAll(authorityService.getPendingProjectRegistration(ReraConstants.PENDING_AUTHORITY));
		underProcess.addAll(authorityService.getPendingProjectRegistration(ReraConstants.PENDING_HEADOFFICE));
		underProcess.addAll(authorityService.getUnderProcessReturnedProjects());
		underProcess.removeAll(enquiryList);
		underProcess.removeAll(approvedList);
		underProcess.removeAll(allRejectedList);

		mv.addObject("underProcess", underProcess);
		mv.addObject("enquiryList", enquiryList);
		mv.addObject("approvedList", approvedList);
		mv.addObject("allProjectsList", allProjectsList);
		mv.addObject("allRejectedList", allRejectedList);
		return mv;

	}

	@RequestMapping(value = "authority/agentDetailsPage")
	public ModelAndView agentDetailsPage(@RequestParam(value = "AGENT_ID") Long agentId) {
		ModelAndView mv = null;
		new ModelAndView("authority.agentDetails");
		try {
			AgentRegistrationModel agent = agentRegistrationService.getAgentRegByPk(agentId);
			if (agent.getRegistrationType().equalsIgnoreCase(ReraConstants.INDVISUAL_REG)) {
				mv = new ModelAndView("authority.agentIndvDetailsPage");
			} else {
				mv = new ModelAndView("authority.agentCompDetailsPage");
			}
			mv.addObject("agent", agent);

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return mv;

	}

	@RequestMapping(value = "authority/agentDetails")
	public ModelAndView agentDetails(@RequestParam(value = "AGENT_ID") Long agentId) {
		ModelAndView mv = null;

		Long id = agentId;
		new ModelAndView("authority.agentDetails");
		try {
			AgentRegistrationModel agent = agentRegistrationService.getAgentRegByPk(agentId);

			if (agent.getRegistrationType().equalsIgnoreCase(ReraConstants.INDVISUAL_REG)) {
				mv = new ModelAndView("authority.agentIndvDetails");
			} else {
				mv = new ModelAndView("authority.agentCompDetails");

			}

			mv.addObject("agent", agent);

			// AgentRegistrationModel agent1 =
			// agentRegistrationService.getAgentRegByPk(agentId);
			List<Object> tempList = createTemplate(agent);

			mv.addObject("template", tempList);

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return mv;

	}

	@RequestMapping(value = "authority/projectDetailsPage")
	public ModelAndView projectDetailsPage(@RequestParam(value = "PROJECT_ID") Long projectId) {
		ModelAndView mv = null;
		try {
			ProjectRegistrationModel project = projectRegistrationService.getProjectRegByPk(projectId);

			if (project.getRegistrationType().equalsIgnoreCase(ReraConstants.INDVISUAL_REG)) {
				mv = new ModelAndView("authority.projectIndvDetailsPage");
			} else {
				mv = new ModelAndView("authority.projectCompDetailsPage");
			}
			if (project.getProjectDetailsModel().getProjectType().equals("Plotted Development")) {

				//Plots Details
				PlotsDetailsModel pdm = null;
				pdm = project.getProjectDetailsModel().getPlotDetailsList() != null
						&& project.getProjectDetailsModel().getPlotDetailsList().size() != 0
						? project.getProjectDetailsModel().getPlotDetailsList().get(0)
								: null;
						mv.addObject("pdm", pdm);

						PlotsLandCostDetailsModel PlotsLandAcquisitionCost = project.getProjectDetailsModel().getPlotLandCostDetailsModel();
						mv.addObject("PlotsLandAcquisitionCost", PlotsLandAcquisitionCost);

						// const cost
						PlotsConstructionCostmodel plotsConstructionCostmodel = project.getProjectDetailsModel().getPlotsConstructionCostModel();
						mv.addObject("plotsConstructionCostmodel", plotsConstructionCostmodel);

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

						ApprovalCostModel approvalCostModel=project.getProjectDetailsModel().getLandCostDetailsModel().getApprovalCostModel();
						mv.addObject("approvalCostModel", approvalCostModel);

						List<ProjectQuaterlyUpdate> quarterList = null;
						quarterList = project.getProjectDetailsModel().getQuarterlyUpdate();
						mv.addObject("quarterList", quarterList);

						ProjectSummary psm = project.getProjectDetailsModel().getProjectSummary();
						mv.addObject("psm", psm);

						List<FinalApproval> fam = project.getProjectDetailsModel().getFinalApproval();
						mv.addObject("fam", fam);

						ProjectScheduleModel projectScheduleModel = project.getProjectDetailsModel().getProjectScheduleModel();
						mv.addObject("projectScheduleModel", projectScheduleModel);
			}
			List<Object> tempList = createTemplate(project);
			mv.addObject("template", tempList);
			mv.addObject("project", project);

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return mv;

	}

	// Added for return projects
	@RequestMapping(value = "authority/returnProjects")
	public ModelAndView returnProjectsToAuthority(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("authority.returnProjects");

		UserModel um = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
		UserModel user = (UserModel) commonDao.getObject(UserModel.class, um.getUserId());

		List<ProjectRegistrationModel> list = authorityService
				.returnProjectsToAuthority(ReraConstants.PENDING_AUTHORITY, user);
		mv.addObject("projectList", list);
		mv.addObject("noOfPendingRequest", list.size());

		return mv;

	}

	// end for return projects

	@RequestMapping(value = "authority/revokeAgentRegistration")
	public ModelAndView revokeAgentRegistrationStaus(@RequestParam(value = "AGENT_ID") Long agentId,
			@RequestParam(value = "REASON") String remarks, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("redirect:viewAllAgents");
		try {
			AgentRegistrationModel agent = agentRegistrationService.getAgentRegByPk(agentId);
			agent.setStatus(ReraConstants.REVOKED);
			agent.setApprovedOn(Calendar.getInstance());
			agent.setReasonForRevoke(remarks);
			agent.setLastUpdatedOn(Calendar.getInstance());
			agentRegistrationService.editAgentRegistration(agent);

			try {
				UserModel um = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
				UserModel user = (UserModel) commonDao.getObject(UserModel.class, um.getUserId());
				saveApplicationHistory(user, agent, ReraConstants.REVOKED);

			} catch (Exception e) {
				logger.error(e.getMessage(), e);
			}

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return mv;

	}

	@RequestMapping(value = "authority/revokeProjectRegistration")
	public ModelAndView revokeProjectRegistration(@RequestParam(value = "PROJECT_ID") Long projectId,
			@RequestParam(value = "REASON") String remarks, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("redirect:viewAllProjects");
		try {
			ProjectRegistrationModel project = projectRegistrationService.getProjectRegByPk(projectId);
			project.setStatus(ReraConstants.REVOKED);
			project.setLastUpdatedOn(Calendar.getInstance());
			project.setReasonForRevoke(remarks);

			projectRegistrationService.editProjectRegistration(project);
			try {
				UserModel um = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
				UserModel user = (UserModel) commonDao.getObject(UserModel.class, um.getUserId());
				saveApplicationHistory(user, project, ReraConstants.REVOKED);

			} catch (Exception e) {
				logger.error(e.getMessage(), e);
			}

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return mv;

	}

	@RequestMapping(value = "authority/acceptClarification")
	public ModelAndView acceptClarification(@RequestParam(value = "PROJECT_ID") Long projectId,
			HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("redirect:enqApprovedTasklist");
		try {
			ProjectRegistrationModel project = projectRegistrationService.getProjectRegByPk(projectId);
			project.setClarificationAccepted(true);

			projectRegistrationService.editProjectRegistration(project);
			try {
				UserModel um = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
				UserModel user = (UserModel) commonDao.getObject(UserModel.class, um.getUserId());
				saveApplicationHistory(user, project, ReraConstants.CLARIFICATION_ACCEPTED);

			} catch (Exception e) {
				logger.error(e.getMessage(), e);
			}

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return mv;

	}

	@RequestMapping(value = "authority/projectExtTasklist")
	public ModelAndView projectExtTasklist(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("authority.projectExtTasklist");
		UserModel user = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
		List<Object> list = authorityService.getPendingProjectExtReg(ReraConstants.PENDING_AUTHORITY, user.getUserId());
		mv.addObject("projectExtList", list);
		mv.addObject("noOfPendingRequest", list.size());
		return mv;

	}

	@RequestMapping(value = "authority/projectExtDetails")
	public ModelAndView projectExtDetails(@RequestParam(value = "PROJECT_ID") Long projectId) {
		ModelAndView mv = null;
		try {
			ProjectRegExtensionModel project = (ProjectRegExtensionModel) commonDao
					.getObject(ProjectRegExtensionModel.class, projectId);
			if (project.getRegistrationType() == null) {
				project.setRegistrationType(project.getProjectRegistration().getRegistrationType());
			}
			if (project.getRegistrationType().equalsIgnoreCase(ReraConstants.INDVISUAL_REG)) {
				mv = new ModelAndView("authority.projectExtIndvDetails");
			} else {
				mv = new ModelAndView("authority.projectExtCompDetails");
			}
			mv.addObject("projectExt", project);
			mv.addObject("project", project.getProjectRegistration());

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return mv;

	}

	@RequestMapping(value = "authority/sendProjectExtEnquiry", method = RequestMethod.POST)
	public ModelAndView sendProjectExtEnquiry(@RequestParam(value = "projectId") Long projectId,
			@RequestParam(value = "subject") String subject, @RequestParam(value = "summary") String summary) {
		ModelAndView mv = null;
		try {
			ProjectRegExtensionModel project = (ProjectRegExtensionModel) commonDao
					.getObject(ProjectRegExtensionModel.class, projectId);

			EnquiryModel enq = new EnquiryModel();
			enq.setSubject(subject);
			enq.setCreatedOn(Calendar.getInstance());
			enq.setEnquiryText(summary);
			UserModel user = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
			enq.setRaisedBy(user);

			enq.setEmailId(project.getProjectRegistration().getPromoterDetailsModel().getEmailId());

			mailService.sendMail(enq);

			try {
				saveApplicationHistory(user, project, ReraConstants.ENQUIRY);

			} catch (Exception e) {
				logger.error(e.getMessage(), e);
			}

			if (project.getEnquiryList() == null) {
				project.setEnquiryList(new ArrayList<EnquiryModel>());
			}
			project.getEnquiryList().add(enq);

			commonDao.updateObject(project);

			if (project.getRegistrationType() == null) {
				project.setRegistrationType(project.getProjectRegistration().getRegistrationType());
			}
			if (project.getRegistrationType().equalsIgnoreCase(ReraConstants.INDVISUAL_REG)) {
				mv = new ModelAndView("authority.projectExtIndvDetails");
			} else {
				mv = new ModelAndView("authority.projectExtCompDetails");
			}

			mv.addObject("projectExt", project);
			mv.addObject("project", project.getProjectRegistration());

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return mv;

	}

	@RequestMapping(value = "authority/approvedProjectExtRegistration")
	public ModelAndView approvedProjectExtRegistration(@RequestParam(value = "PROJECT_ID") Long projectId,
			@RequestParam(value = "REMARKS") String remarks, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("redirect:projectExtTasklist");
		UserModel user = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
		try {
			ProjectRegExtensionModel project = (ProjectRegExtensionModel) commonDao
					.getObject(ProjectRegExtensionModel.class, projectId);
			project.setStatus(ReraConstants.APPROVED);
			project.setRemarks(remarks);
			project.getProjectRegistration().setExpireDate(project.getExpireDate());
			project.setApprovedOn(Calendar.getInstance());
			user = (UserModel) commonDao.getObject(UserModel.class, user.getUserId());
			project.setApprovedBy(user);
			commonDao.updateObject(project.getProjectRegistration());
			commonDao.updateObject(project);

			mailService.sendProjectRegExtApproval(project);
			try {
				saveApplicationHistory(user, project, ReraConstants.APPROVED);

			} catch (Exception e) {
				logger.error(e.getMessage(), e);
			}

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return mv;

	}

	@RequestMapping(value = "authority/agentRenewalTasklist")
	public ModelAndView agentRenwalTasklist(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("authority.agentRenwalTasklist");
		UserModel user = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
		List<Object> list = authorityService.getPendingAgentRegRenewal(ReraConstants.PENDING_AUTHORITY,
				user.getUserId());

		mv.addObject("agentRenwalList", list);
		mv.addObject("noOfPendingRequest", list.size());
		return mv;

	}

	@RequestMapping(value = "authority/agentRenewalDetails")
	public ModelAndView agentRenewalDetails(@RequestParam(value = "AGENTREQ_ID") Long agentId) {
		ModelAndView mv = null;
		new ModelAndView("authority.agentDetails");
		try {// AUTHORITYLIST
			AgentRegRenewalModel agent = (AgentRegRenewalModel) commonDao.getObject(AgentRegRenewalModel.class,
					agentId);
			if (agent.getAgentRegistration().getRegistrationType().equalsIgnoreCase(ReraConstants.INDVISUAL_REG)) {
				mv = new ModelAndView("authority.agentReqIndvDetails");
			} else {
				mv = new ModelAndView("authority.agentReqCompDetails");
			}
			mv.addObject("agentReq", agent);
			mv.addObject("agent", agent.getAgentRegistration());

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return mv;

	}

	@RequestMapping(value = "authority/sendAgentRegRenewEnquiry", method = RequestMethod.POST)
	public ModelAndView sendAgentRegRenewEnquiry(@RequestParam(value = "AGENT_ID") Long agenttId,
			@RequestParam(value = "subject") String subject, @RequestParam(value = "summary") String summary) {
		ModelAndView mv = null;
		try {

			AgentRegRenewalModel agent = (AgentRegRenewalModel) commonDao.getObject(AgentRegRenewalModel.class,
					agenttId);

			EnquiryModel enq = new EnquiryModel();
			enq.setSubject(subject);
			enq.setCreatedOn(Calendar.getInstance());
			enq.setEnquiryText(summary);
			UserModel user = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
			enq.setRaisedBy(user);

			if (agent.getAgentRegistration().getRegistrationType().equals(ReraConstants.INDVISUAL_REG)) {
				enq.setEmailId(agent.getAgentRegistration().getAgentDetailsModel().getAgentEmailId());
			} else {
				enq.setEmailId(agent.getAgentRegistration().getAgentDetailsModel().getFirmEmail());
			}

			mailService.sendMail(enq);

			try {
				saveApplicationHistory(user, agent, ReraConstants.ENQUIRY);

			} catch (Exception e) {
				logger.error(e.getMessage(), e);
			}
			if (agent.getEnquiryList() == null) {
				agent.setEnquiryList(new ArrayList<EnquiryModel>());
			}
			agent.getEnquiryList().add(enq);

			commonDao.updateObject(agent);

			if (agent.getAgentRegistration().getRegistrationType().equalsIgnoreCase(ReraConstants.INDVISUAL_REG)) {
				mv = new ModelAndView("authority.agentReqIndvDetails");
			} else {
				mv = new ModelAndView("authority.agentReqCompDetails");
			}
			mv.addObject("agentReq", agent);
			mv.addObject("agent", agent.getAgentRegistration());

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return mv;

	}

	@RequestMapping(value = "authority/approveAgentRegRenwal")
	public ModelAndView approveAgentRegRenwal(@RequestParam(value = "AGENT_ID") Long agentId,

			@RequestParam(value = "REMARKS") String remarks, HttpServletRequest request) {

		ModelAndView mv = new ModelAndView("redirect:agentRenewalTasklist");
		UserModel user = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
		try {
			AgentRegRenewalModel agent = (AgentRegRenewalModel) commonDao.getObject(AgentRegRenewalModel.class,
					agentId);
			AgentRegistrationLog log = null;
			if (agent.getAgentRegistration().getRegistrationHistory() == null) {
				agent.getAgentRegistration().setRegistrationHistory(new ArrayList<AgentRegistrationLog>());
				log = new AgentRegistrationLog();
				log.setAgentRegistration(agent.getAgentRegistration());
				log.setApprovedBy(agent.getAgentRegistration().getApprovedBy());
				log.setApprovedOn(agent.getAgentRegistration().getApprovedOn());
				log.setAssignTo(agent.getAgentRegistration().getAssignTo());
				log.setCreatedOn(agent.getAgentRegistration().getCreatedOn());
				log.setExpireDate(agent.getAgentRegistration().getExpireDate());
				log.setRegPaymentDetailsModel(
						agent.getAgentRegistration().getAgentDetailsModel().getRegPaymentDetailsModel());
				log.setStatus(agent.getAgentRegistration().getStatus());
				agent.getAgentRegistration().getRegistrationHistory().add(log);
			}

			agent.setStatus(ReraConstants.APPROVED);
			agent.setApprovedOn(Calendar.getInstance());
			Calendar cal = Calendar.getInstance();
			cal.setTime(agent.getAgentRegistration().getExpireDate().getTime());
			cal.set(Calendar.YEAR, cal.get(Calendar.YEAR) + 5);
			agent.getAgentRegistration().setExpireDate(cal);
			user = (UserModel) commonDao.getObject(UserModel.class, user.getUserId());
			agent.setApprovedBy(user);

			commonDao.updateObject(agent);

			log = new AgentRegistrationLog();
			log.setAgentRegistration(agent.getAgentRegistration());
			log.setApprovedBy(agent.getApprovedBy());
			log.setApprovedOn(agent.getApprovedOn());
			log.setAssignTo(agent.getAssignTo());
			log.setCreatedOn(agent.getCreatedOn());
			log.setExpireDate(agent.getAgentRegistration().getExpireDate());
			log.setRegPaymentDetailsModel(agent.getRegPaymentDetailsModel());
			log.setStatus(agent.getStatus());
			agent.getAgentRegistration().getRegistrationHistory().add(log);

			commonDao.updateObject(agent.getAgentRegistration());

			try {
				saveApplicationHistory(user, agent, ReraConstants.APPROVED);

			} catch (Exception e) {
				logger.error(e.getMessage(), e);
			}

			mailService.sendAgentRegRenewApproval(agent.getAgentRegistration());

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return mv;

	}

	@RequestMapping(value = "authority/changePasswordForm")
	public ModelAndView authorityChangePasswordForm() {

		ModelAndView mv = null;

		mv = new ModelAndView("authority.changePassword");
		try {
			UserModel um = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
			UserModel user = (UserModel) commonDao.getObject(UserModel.class, um.getUserId());
			saveApplicationHistory(user, ReraConstants.CHANGE_PASSWORD, null);

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}

		return mv;
	}

	@RequestMapping(value = "authority/rejectProjectRegistration")
	public ModelAndView rejectProjectRegistration(@RequestParam(value = "projectId") Long projectId,
			@RequestParam(value = "reasonForRejection") String reasonForRejection,
			@RequestParam(value = "rejectSubject") String rejectSubject, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:projectTasklist");
		UserModel usr = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);

		try {
			usr = (UserModel) commonDao.getObject(UserModel.class, usr.getUserId());

			ProjectRegistrationModel project = projectRegistrationService.getProjectRegByPk(projectId);

			project.setStatus(ReraConstants.REJECTED);
			project.setRejectedBy(usr);
			project.setReasonForRejection(reasonForRejection);
			project.setRejectedOn(Calendar.getInstance());
			projectRegistrationService.editProjectRegistration(project);
			EnquiryModel enq = new EnquiryModel();
			enq.setEmailId(project.getPromoterDetailsModel().getEmailId());
			enq.setSubject(rejectSubject);
			enq.setEnquiryText(reasonForRejection);
			mailService.sendMail(enq);
			try {
				saveApplicationHistory(usr, project, ReraConstants.REJECTED);

			} catch (Exception e) {
				logger.error(e.getMessage(), e);
			}

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			throw e;
		}
		return mv;

	}

	@RequestMapping(value = "agentView")
	public ModelAndView agentView() {
		ModelAndView mv = new ModelAndView("agentView");

		List<AgentRegistrationModel> allAgentslist = authorityService.getViewAllAgents();

		List<AgentRegistrationModel> agentsApprovedList = authorityService
				.getPendingAgentRegistration(ReraConstants.APPROVED);

		mv.addObject("allAgentslist", allAgentslist);
		mv.addObject("agentsApprovedList", agentsApprovedList);

		return mv;
	}

	/*
	 * @RequestMapping(value = "outReachRegister") public ModelAndView
	 * outReachRegister() { ModelAndView mv = new
	 * ModelAndView("outReachRegister");
	 * 
	 * return mv; }
	 */

	public Integer getPendingAgentTaskList() {
		String str = "Select count(a) from  AgentRegistrationModel a  where (a.status='PENDING_OPERATOR' and DATEDIFF(CURDATE(), createdOn)>5)and(a.operatorRemarks is null and a.updatedFlag is null)";
		//SELECT count(*) FROM reraapp.tt_agent_registration where (STATUS='PENDING_OPERATOR' and DATEDIFF(CURDATE(), CREATED_ON)>5)and (OPERATOR_REMARKS is null and REG_UPDATED is null);
		System.out.println("str >>>"+str);
		Query query = null;
		try {
			query = commonDao.getQuery(str);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
		}
		return Integer.parseInt(query.uniqueResult().toString());
	}


	public Integer getPendingUpdatedAgentTaskList() {
		String str = "Select count(a) from  AgentRegistrationModel a  where (a.status='PENDING_OPERATOR' and DATEDIFF(CURDATE(), createdOn)>3) and a.updatedFlag='YES'";
		//SELECT count(*) FROM reraapp.tt_agent_registration where (STATUS='PENDING_OPERATOR' and DATEDIFF(CURDATE(), CREATED_ON)>3) and (REG_UPDATED='YES');
		System.out.println("str >>>"+str);
		Query query = null;
		try {
			query = commonDao.getQuery(str);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
		}
		return Integer.parseInt(query.uniqueResult().toString());
	}

	public Integer getPendingRenewalAgentTaskList() {
		String str = "Select count(a) from  AgentRegRenewalModel a  where a.status='PENDING_OPERATOR' and DATEDIFF(CURDATE(), createdOn)>2";
		//SELECT count(*) FROM reraapp.tt_agent_reg_renew_model where STATUS='PENDING_OPERATOR' and DATEDIFF(CURDATE(), CREATED_ON)>2;
		System.out.println("str >>>"+str);
		Query query = null;
		try {
			query = commonDao.getQuery(str);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
		}
		return Integer.parseInt(query.uniqueResult().toString());
	}

	public Integer getProjectsPendingUpdated(String user) {
		String str = "";
		Query query = null;
		try {
			if (ReraConstants.OP_ACCOUNTS_USER.equals(user)) {
				str = "Select count(*) from ProjectRegistrationModel p inner join p.projectRemarks as rm  where rm.accountsStatus!='OK' and p.frozen is null and p.updatedFlag='YES' and DATEDIFF(CURDATE(), p.createdOn)>3";
				query = commonDao.getQuery(str);
			} else if (ReraConstants.OP_TCP_USER.equals(user)) {
				str = "Select count(*) from ProjectRegistrationModel p inner join p.projectRemarks as rm  where rm.tcpStatus!='OK' and p.frozen is null and p.updatedFlag='YES' and DATEDIFF(CURDATE(), p.createdOn)>3";
				query = commonDao.getQuery(str);
			} else if (ReraConstants.OP_REVENUE_USER.equals(user)) {
				str = "Select count(*) from ProjectRegistrationModel p inner join p.projectRemarks as rm  where rm.revenueStatus!='OK' and p.frozen is null and p.updatedFlag='YES' and DATEDIFF(CURDATE(), p.createdOn)>3";
				query = commonDao.getQuery(str);
			} else if (ReraConstants.OP_ENGG_USER.equals(user)) {
				str = "Select count(*) from ProjectRegistrationModel p inner join p.projectRemarks as rm  where rm.enggStatus!='OK' and p.frozen is null and p.updatedFlag='YES' and DATEDIFF(CURDATE(), p.createdOn)>3";
				query = commonDao.getQuery(str);
			} 
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return (Integer.parseInt(query.uniqueResult().toString()) ) ;
	}

	@RequestMapping(value = "authority/alertreports")
	public ModelAndView alertsReport(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("authority.alertreports");
		mv.addObject("agentsNew",getPendingAgentTaskList());
		mv.addObject("agentsUpdated",getPendingUpdatedAgentTaskList());
		mv.addObject("agentsReturned",getPendingRenewalAgentTaskList());

		List<ProjectRegistrationModel> newProjectsRevenuelist = authorityService.getPendingAlertsProjectNewRegistration(ReraConstants.PENDING_OPRATOR, ReraConstants.OP_REVENUE_USER);
		System.out.println("newProjectsRevenuelist>>>>>>>>>>>> "+newProjectsRevenuelist.size());
		mv.addObject("newProjectsRevenuelist", newProjectsRevenuelist);

		List<ProjectRegistrationModel> newProjectsAcclist = authorityService.getPendingAlertsProjectNewRegistration(ReraConstants.PENDING_OPRATOR, ReraConstants.OP_ACCOUNTS_USER);
		mv.addObject("newProjectsAcclist", newProjectsAcclist);

		List<ProjectRegistrationModel> newProjectsTCPlist = authorityService.getPendingAlertsProjectNewRegistration(ReraConstants.PENDING_OPRATOR, ReraConstants.OP_TCP_USER);
		mv.addObject("newProjectsTCPlist", newProjectsTCPlist);

		List<ProjectRegistrationModel> newProjectsENGGlist = authorityService.getPendingAlertsProjectNewRegistration(ReraConstants.PENDING_OPRATOR, ReraConstants.OP_ENGG_USER);
		mv.addObject("newProjectsENGGlist", newProjectsENGGlist);

		List<ProjectRegistrationModel> returnedProjectsRevenuelist = authorityService.getAlertsReturnedProjects(ReraConstants.PENDING_OPRATOR, ReraConstants.OP_REVENUE_USER);
		mv.addObject("returnedProjectsRevenuelist", returnedProjectsRevenuelist);

		List<ProjectRegistrationModel> returnedProjectsACClist = authorityService.getAlertsReturnedProjects(ReraConstants.PENDING_OPRATOR, ReraConstants.OP_ACCOUNTS_USER);
		mv.addObject("returnedProjectsACClist", returnedProjectsACClist);

		List<ProjectRegistrationModel> returnedProjectsTCPlist = authorityService.getAlertsReturnedProjects(ReraConstants.PENDING_OPRATOR, ReraConstants.OP_TCP_USER);
		mv.addObject("returnedProjectsTCPlist", returnedProjectsTCPlist);

		List<ProjectRegistrationModel> returnedProjectsENGGlist = authorityService.getAlertsReturnedProjects(ReraConstants.PENDING_OPRATOR, ReraConstants.OP_ENGG_USER);
		mv.addObject("returnedProjectsENGGlist", returnedProjectsENGGlist);

		List<AgentRegistrationModel> returnedAgentslist = authorityService.returnedAgentProjects(ReraConstants.PENDING_OPRATOR);
		mv.addObject("returnedAgentslist", returnedAgentslist);

		mv.addObject("projectsUpdatedTCP",getProjectsPendingUpdated(ReraConstants.OP_TCP_USER));
		mv.addObject("projectsUpdatedACC",getProjectsPendingUpdated(ReraConstants.OP_ACCOUNTS_USER));
		mv.addObject("projectsUpdatedREV",getProjectsPendingUpdated(ReraConstants.OP_REVENUE_USER));
		mv.addObject("projectsUpdatedENGG",getProjectsPendingUpdated(ReraConstants.OP_ENGG_USER));

		return mv;
	}

	@RequestMapping(value = "authority/reports")
	public ModelAndView projectReport(HttpServletRequest request) {

		ModelAndView mv = new ModelAndView("authority.reports");

		String month = null;

		String year = null;

		month = request.getParameter("month");

		year = request.getParameter("year");

		Date referenceDate = new Date();

		List<MISReport> reports = new ArrayList<MISReport>();

		for (int i = 1; i < 12; i++) {

			Calendar c = Calendar.getInstance();

			c.setTime(referenceDate);

			if (c.get(Calendar.MONTH) < 6 && c.get(Calendar.YEAR) == 2017) {

				break;

			}

			Date startDate = DateUtil.firstDayOfMonth(c.get(Calendar.YEAR), c.get(Calendar.MONTH) + 1).getTime();

			Date endDate = DateUtil.lastDayOfMonth(c.get(Calendar.YEAR), c.get(Calendar.MONTH) + 1).getTime();

			MISReport report = new MISReport();

			report.setMonth(new SimpleDateFormat("MMMM").format(c.getTime()));

			report.setAccounts(

					authorityService.getProjectsPendingByDate(ReraConstants.OP_ACCOUNTS_USER, startDate, endDate));

			report.setApproved(authorityService.getTotalApprovedProjectsByDate(startDate, endDate));

			report.setEngg(authorityService.getProjectsPendingByDate(ReraConstants.OP_ENGG_USER, startDate, endDate));

			report.setHeadOffice(

					authorityService.getProjectsPendingByDate(ReraConstants.CHIEFAUTHORITY_USER, startDate, endDate));

			report.setPromoter(

					authorityService.getProjectsPendingByDate(ReraConstants.PROJECT_USER, startDate, endDate));

			report.setRegistration(authorityService.getTotalProjectsAppliedByDate(startDate, endDate));

			report.setRejected(authorityService.getTotalRejectedProjectsByDate(startDate, endDate));

			// report.setRemarks(remarks);

			report.setRevenue(

					authorityService.getProjectsPendingByDate(ReraConstants.OP_REVENUE_USER, startDate, endDate));

			report.setSecretary(

					authorityService.getProjectsPendingByDate(ReraConstants.AUTHORITY_USER, startDate, endDate));

			report.setTcp(authorityService.getProjectsPendingByDate(ReraConstants.OP_TCP_USER, startDate, endDate));

			report.setWithdrawn(authorityService.getTotalWithdrawnProjectsByDate(startDate, endDate));

			report.setPending(report.getRegistration() - (report.getApproved() + report.getRejected() + report.getWithdrawn()));

			reports.add(report);

			c.add(Calendar.MONTH, -1);

			referenceDate = c.getTime();

		}

		if (month == null || year == null) {

			Calendar c = Calendar.getInstance();

			Integer y1 = c.get(Calendar.YEAR);

			Integer m = c.get(Calendar.MONTH);

			Integer m1 = m + 1;

			month = m1.toString();

			year = y1.toString();

		}

		List<String> registerProjectlabel = new ArrayList<String>();

		List<String> pendingProjectlabel = new ArrayList<String>();

		List<Integer> registerProjectData = new ArrayList<Integer>();

		List<Integer> pendingProjectData = new ArrayList<Integer>();

		Date startDate = DateUtil.firstDayOfMonth(Integer.parseInt(year), Integer.parseInt(month)).getTime();

		Date endDate = DateUtil.lastDayOfMonth(Integer.parseInt(year), Integer.parseInt(month)).getTime();

		// register project by months

		Integer total = authorityService.getTotalProjectsAppliedByDate(startDate, endDate);

		Integer approved = authorityService.getTotalApprovedProjectsByDate(startDate, endDate);

		Integer rejected = authorityService.getTotalRejectedProjectsByDate(startDate, endDate);

		Integer withdrawn = authorityService.getTotalRejectedProjectsByDate(startDate, endDate);

		Integer remaining = total - (approved + rejected);

		registerProjectData.add(total);

		registerProjectData.add(approved);

		registerProjectData.add(rejected);

		registerProjectData.add(remaining);

		registerProjectData.add(withdrawn);

		// pending project by month

		pendingProjectData

		.add(authorityService.getProjectsPendingByDate(ReraConstants.OP_ACCOUNTS_USER, startDate, endDate));

		pendingProjectData.add(authorityService.getProjectsPendingByDate(ReraConstants.OP_TCP_USER, startDate, endDate));

		pendingProjectData.add(authorityService.getProjectsPendingByDate(ReraConstants.OP_ENGG_USER, startDate, endDate));

		pendingProjectData.add(authorityService.getProjectsPendingByDate(ReraConstants.OP_REVENUE_USER, startDate, endDate));

		pendingProjectData.add(authorityService.getProjectsPendingByDate(ReraConstants.AUTHORITY_USER, startDate, endDate));

		pendingProjectData.add(authorityService.getProjectsPendingByDate(ReraConstants.CHIEFAUTHORITY_USER, startDate, endDate));

		pendingProjectData.add(authorityService.getProjectsPendingByDate(ReraConstants.PROJECT_USER, startDate, endDate));

		registerProjectlabel.add("Total");

		registerProjectlabel.add("Approved");

		registerProjectlabel.add("Rejected");

		registerProjectlabel.add("Remaining");



		pendingProjectlabel.add("Account");

		pendingProjectlabel.add("TCP");

		pendingProjectlabel.add("Engineering");

		pendingProjectlabel.add("Revenue");

		pendingProjectlabel.add("Authority");

		pendingProjectlabel.add("Head Office");

		pendingProjectlabel.add("Promoter");

		pendingProjectlabel.add("Withdrawn");



		mv.addObject("pendingProjectData", pendingProjectData);

		mv.addObject("registerProjectData", registerProjectData);

		mv.addObject("registerProjectlabel", registerProjectlabel);

		mv.addObject("pendingProjectlabel", pendingProjectlabel);

		mv.addObject("month", month);

		mv.addObject("year", year);

		Collections.reverse(reports);



		MISReport reportTotal = new MISReport();

		for (MISReport report : reports) {

			reportTotal.setMonth("TOTAL");

			reportTotal.setAccounts(report.getAccounts() + reportTotal.getAccounts());

			reportTotal.setApproved(reportTotal.getApproved() + report.getApproved());

			reportTotal.setEngg(reportTotal.getEngg() + report.getEngg());

			reportTotal.setHeadOffice(report.getHeadOffice() + reportTotal.getHeadOffice());

			reportTotal.setPromoter(report.getPromoter() + reportTotal.getPromoter());

			reportTotal.setRegistration(report.getRegistration() + reportTotal.getRegistration());

			reportTotal.setRejected(report.getRejected() + reportTotal.getRejected());

			// report.setRemarks(remarks);

			reportTotal.setRevenue(report.getRevenue() + reportTotal.getRevenue());

			reportTotal.setSecretary(report.getSecretary() + reportTotal.getSecretary());

			reportTotal.setTcp(report.getTcp() + reportTotal.getTcp());

			reportTotal.setPending(report.getPending() + reportTotal.getPending());

			reportTotal.setWithdrawn(reportTotal.getWithdrawn()+report.getWithdrawn());



		}

		reports.add(reportTotal);

		mv.addObject("reports", reports);



		return mv;



	}

	@RequestMapping(value = "authority/pendingProjectStatusToSave", method = RequestMethod.POST)
	public ModelAndView pendingProjectStatusToSave(HttpServletRequest request) {

		UserModel user = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);

		try {
			String[] appNos = request.getParameterValues("getId");

			for (int i = 0; i < appNos.length; i++) {

				List<ProjectRegistrationModel> projectList = projectRegistrationService
						.getProjectByApplictionNo(appNos[i]);

				if (!projectList.isEmpty()) {
					ProjectRegistrationModel project = projectList.get(0);
					project.setUpdatedFlag("YES");
					project.setFrozen("YES");
					projectRegistrationService.editProjectRegistration(project);

					try {
						saveApplicationHistory(user, project, ReraConstants.PROJECT_FROZEN);

					} catch (Exception e) {
						logger.error(e.getMessage(), e);
					}
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			logger.error(e.getMessage(), e);
		}

		ModelAndView mv = new ModelAndView("authority.pendingProjectStatus");
		List<ProjectRegistrationModel> list = authorityService
				.getPendingProjectRegistration(ReraConstants.PENDING_OPRATOR);
		mv.addObject("projectList", list);
		mv.addObject("noOfPendingRequest", list.size());
		return mv;

	}

	@RequestMapping(value = "authority/agentreports")
	public ModelAndView agentReport(HttpServletRequest request) {

		ModelAndView mv = new ModelAndView("authority.agentreports");

		String month = null;
		String year = null;

		month = request.getParameter("month");
		year = request.getParameter("year");

		Date referenceDate = new Date();
		List<MISReport> agentreports = new ArrayList<MISReport>();
		for (int i = 1; i < 12; i++) {

			Calendar c = Calendar.getInstance();
			c.setTime(referenceDate);

			if (c.get(Calendar.MONTH) < 6 && c.get(Calendar.YEAR) == 2017) {
				break;
			}

			Date startDate = DateUtil.firstDayOfMonth(c.get(Calendar.YEAR), c.get(Calendar.MONTH) + 1).getTime();
			Date endDate = DateUtil.lastDayOfMonth(c.get(Calendar.YEAR), c.get(Calendar.MONTH) + 1).getTime();

			MISReport agentreport = new MISReport();
			agentreport.setMonth(new SimpleDateFormat("MMMM").format(c.getTime()));
			agentreport.setAccounts(
					authorityService.getAgentsPendingByDate(ReraConstants.OPERATOR_USER, startDate, endDate));
			agentreport.setApproved(authorityService.getTotalApprovedAgentssByDate(startDate, endDate));
			// agentreport.setHeadOffice(authorityService.getProjectsPendingByDate(ReraConstants.CHIEFAUTHORITY_USER,
			// startDate, endDate));
			agentreport.setAgent(authorityService.getAgentsPendingByDate(ReraConstants.AGENT_USER, startDate, endDate));
			agentreport.setRegistration(authorityService.getTotalAgentsAppliedByDate(startDate, endDate));
			agentreport.setRejected(authorityService.getTotalRejectedAgentsByDate(startDate, endDate));
			// agentreports.setRemarks(remarks);
			agentreport.setSecretary(
					authorityService.getAgentsPendingByDate(ReraConstants.AUTHORITY_USER, startDate, endDate));
			agentreport.setPending(
					agentreport.getRegistration() - (agentreport.getApproved() + agentreport.getRejected()));

			agentreports.add(agentreport);
			c.add(Calendar.MONTH, -1);
			referenceDate = c.getTime();
		}

		if (month == null || year == null) {
			Calendar c = Calendar.getInstance();
			Integer y1 = c.get(Calendar.YEAR);
			Integer m = c.get(Calendar.MONTH);
			Integer m1 = m + 1;
			month = m1.toString();
			year = y1.toString();

		}

		List<String> registerAgentlabel = new ArrayList<String>();
		List<String> pendingAgentlabel = new ArrayList<String>();
		List<Integer> registerAgentData = new ArrayList<Integer>();
		List<Integer> pendingAgentData = new ArrayList<Integer>();

		Date startDate = DateUtil.firstDayOfMonth(Integer.parseInt(year), Integer.parseInt(month)).getTime();
		Date endDate = DateUtil.lastDayOfMonth(Integer.parseInt(year), Integer.parseInt(month)).getTime();

		// register project by months
		Integer total = authorityService.getTotalAgentsAppliedByDate(startDate, endDate);
		Integer approved = authorityService.getTotalApprovedAgentssByDate(startDate, endDate);
		Integer rejected = authorityService.getTotalRejectedAgentsByDate(startDate, endDate);
		Integer remaining = total - (approved + rejected);

		registerAgentData.add(total);
		registerAgentData.add(approved);
		registerAgentData.add(rejected);
		registerAgentData.add(remaining);

		// pending project by month
		pendingAgentData
		.add(authorityService.getProjectsPendingByDate(ReraConstants.OP_ACCOUNTS_USER, startDate, endDate));

		pendingAgentData
		.add(authorityService.getProjectsPendingByDate(ReraConstants.AUTHORITY_USER, startDate, endDate));
		pendingAgentData.add(authorityService.getAgentsPendingByDate(ReraConstants.AGENT_USER, startDate, endDate));

		registerAgentlabel.add("Total");
		registerAgentlabel.add("Approved");
		registerAgentlabel.add("Rejected");
		registerAgentlabel.add("Remaining");

		pendingAgentlabel.add("Account");
		pendingAgentlabel.add("TCP");
		pendingAgentlabel.add("Engineering");
		pendingAgentlabel.add("Revenue");
		pendingAgentlabel.add("Authority");
		pendingAgentlabel.add("Head Office");
		pendingAgentlabel.add("Promoter");

		mv.addObject("pendingProjectData", pendingAgentData);
		mv.addObject("registerProjectData", registerAgentData);
		mv.addObject("registerProjectlabel", registerAgentlabel);
		mv.addObject("pendingProjectlabel", pendingAgentlabel);
		mv.addObject("month", month);
		mv.addObject("year", year);
		Collections.reverse(agentreports);

		MISReport reportTotal = new MISReport();
		for (MISReport agentreport : agentreports) {
			reportTotal.setMonth("TOTAL");
			reportTotal.setAccounts(agentreport.getAccounts() + reportTotal.getAccounts());
			reportTotal.setApproved(reportTotal.getApproved() + agentreport.getApproved());

			reportTotal.setPromoter(agentreport.getAgent() + reportTotal.getAgent());
			reportTotal.setRegistration(agentreport.getRegistration() + reportTotal.getRegistration());
			reportTotal.setRejected(agentreport.getRejected() + reportTotal.getRejected());
			// report.setRemarks(remarks);
			reportTotal.setSecretary(agentreport.getSecretary() + reportTotal.getSecretary());
			reportTotal.setTcp(agentreport.getTcp() + reportTotal.getTcp());
			reportTotal.setPending(agentreport.getPending() + reportTotal.getPending());
			reportTotal.setAgent(agentreport.getAgent()+reportTotal.getAgent());

		}
		agentreports.add(reportTotal);
		mv.addObject("agentreports", agentreports);

		return mv;

	}


	/// Return to L0

	@RequestMapping(value = "authority/returnProjectListToL0")
	public ModelAndView returnProjectsToL0(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("authority.returnProjectListToL0");
		UserModel user = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
		// List<ProjectRegistrationModel> list =
		// authorityService.getReturnedProjectToL0(ReraConstants.PENDING_OPRATOR,user);
		List<ProjectRegistrationModel> list = authorityService.getReturnedProjects(ReraConstants.PENDING_OPRATOR, user);

		mv.addObject("projectList", list);
		mv.addObject("noOfPendingRequest", list.size());
		return mv;

	}

	// For getting Agents under Pending Enquery

	@RequestMapping(value = "authority/viewAgentPendingEnquery")
	public ModelAndView getAgentPendingEnquiry(HttpServletRequest request) {

		ModelAndView mv = new ModelAndView("authority.viewAgentPendingEnquery");
		List<AgentRegistrationModel> enquiryList = authorityService.getAgentPendingEnquiry();
		mv.addObject("enquiryList", enquiryList);
		mv.addObject("noOfPendingRequest", enquiryList.size());

		return mv;

	}

	@RequestMapping(value = "authority/enqApprovedTasklist")
	public ModelAndView enqApprovedTasklist(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("authority.enqApprovedProjectTasklist");
		List<ProjectRegistrationModel> list = authorityService.getApprovedProjectsUnderEnquiryForAuthority();
		mv.addObject("projectEnqApprovedList", list);
		mv.addObject("totalRecords", list.size());
		return mv;
	}

	@RequestMapping(value = "authority/rejectAgentRegistration")
	public ModelAndView rejectAgentRegistration(@RequestParam(value = "agentId") Long agentId,
			@RequestParam(value = "reasonForRejection") String reasonForRejection,
			@RequestParam(value = "rejectSubject") String rejectSubject, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:agentTasklist");
		UserModel usr = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);

		try {
			usr = (UserModel) commonDao.getObject(UserModel.class, usr.getUserId());

			AgentRegistrationModel agent = agentRegistrationService.getAgentRegByPk(agentId);

			agent.setStatus(ReraConstants.REJECTED);
			agent.setRejectedBy(usr);
			agent.setReasonForRejection(reasonForRejection);
			agent.setRejectedOn(Calendar.getInstance());
			agentRegistrationService.editAgentRegistration(agent);
			EnquiryModel enq = new EnquiryModel();
			if (agent.getAgentDetailsModel().getAgentEmailId() != null)
				enq.setEmailId(agent.getAgentDetailsModel().getAgentEmailId());

			else
				enq.setEmailId(agent.getAgentDetailsModel().getFirmEmail());
			enq.setSubject(rejectSubject);
			enq.setEnquiryText(reasonForRejection);
			mailService.sendMail(enq);
			try {
				saveApplicationHistory(usr, agent, ReraConstants.REJECTED);

			} catch (Exception e) {
				logger.error(e.getMessage(), e);
			}

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			throw e;
		}
		return mv;

	}

	@RequestMapping(value = "authority/viewRejectedAgents")
	public ModelAndView viewRejectedAgents(HttpServletRequest request,
			@RequestParam(value = "status", required = false) String status,
			@RequestParam(value = "regNo", required = false) String regNo) {

		ModelAndView mv = new ModelAndView("authority.viewRejectedAgents");

		List<AgentRegistrationModel> list = authorityService.getRejectedList();
		mv.addObject("agentList", list);
		mv.addObject("totalRecords", list.size());
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

	// added to return the agent project to Operator
	@RequestMapping(value = "authority/returnAgentRegistration")
	public ModelAndView returnAgentRegistration(@RequestParam(value = "AGENT_ID") Long agenttId,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:agentTasklist");
		UserModel usr = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
		try {
			usr = (UserModel) commonDao.getObject(UserModel.class, usr.getUserId());
			AgentRegistrationModel agent = agentRegistrationService.getAgentRegByPk(agenttId);
			agent.setStatus(ReraConstants.PENDING_OPRATOR);
			agent.setProjectStatus(ReraConstants.RETURN);
			
			//alerts
			agent.setReturnedByL1On(Calendar.getInstance());
			
			agentRegistrationService.editAgentRegistration(agent);
			try {
				saveApplicationHistory(usr, agent, ReraConstants.RETURN);

			} catch (Exception e) {
				logger.error(e.getMessage(), e);
			}
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}

		return mv;
	}

	@RequestMapping(value = "authority/allcomplaints")
	public ModelAndView allComplaints(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("authority.allcomplaints");
		UserModel user = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
		List<ComplaintModel> list = null;
		try {
			list = authorityService.getPendingComplaint(ReraConstants.PENDING_HEADOFFICE);
			list.addAll(authorityService.getPendingComplaint(ReraConstants.UNDER_ENQUIRY));
			mv.addObject("complaintList", list);
			mv.addObject("noOfPendingRequest", list.size());

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}

		return mv;

	}

	@RequestMapping(value = "authority/availProjectToPromoter", method = RequestMethod.POST)
	public ModelAndView availProjectToPromoter(HttpServletRequest request) {
		System.out.println("hiiii availProjectToPromoter ");
		UserModel user = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);

		try {
			String[] appNos = request.getParameterValues("getId");

			for (int i = 0; i < appNos.length; i++) {

				List<ProjectRegistrationModel> projectList = projectRegistrationService
						.getProjectByApplictionNo(appNos[i]);

				if (!projectList.isEmpty()) {
					ProjectRegistrationModel project = projectList.get(0);
					project.setUpdatedFlag("YES");
					projectRegistrationService.editProjectRegistration(project);
					try {
						saveApplicationHistory(user, project, ReraConstants.AVAILTOPROMOTER);

					} catch (Exception e) {
						logger.error(e.getMessage(), e);
					}
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			logger.error(e.getMessage(), e);
		}

		ModelAndView mv = new ModelAndView("authority.pendingProjectStatus");
		List<ProjectRegistrationModel> list = authorityService
				.getPendingProjectRegistration(ReraConstants.PENDING_OPRATOR);
		mv.addObject("projectList", list);
		mv.addObject("noOfPendingRequest", list.size());
		return mv;

	}

	private String getApplicationNo(AgentRegistrationModel model) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(model.getApprovedOn().getTime());
		StringBuffer sb = new StringBuffer("PRM/KA/RERA/");
		if (model.getDistrictModel() != null && model.getDistrictModel().getDistrictId() != null)
			sb.append(model.getDistrictModel().getDistrictId()).append("/");

		if (model.getSubDistrictModel() != null && model.getSubDistrictModel().getSubDistrictId() != null)
			sb.append(model.getSubDistrictModel().getSubDistrictId()).append("/AG/");

		int yr = cal.get(Calendar.YEAR);
		int mnth = cal.get(Calendar.MONTH) + 1;
		int dt = cal.get(Calendar.DATE);
		yr = yr % 100;
		if (yr < 10) {
			sb.append("0").append(yr);
		} else {
			sb.append(yr);
		}
		if (mnth < 10) {
			sb.append("0").append(mnth);
		} else {
			sb.append(mnth);
		}
		if (dt < 10) {
			sb.append("0").append(dt);
		} else {
			sb.append(dt);
		}
		sb.append("/");

		String str = "" + model.getAgentRegistrationID();
		while (str.length() < 6) {
			str = "0" + str;
		}
		sb.append(str);
		return sb.toString();
	}

	@RequestMapping(value = "authority/pendingSignatures")
	public ModelAndView pendingSignatures(HttpServletRequest request) {

		ModelAndView mv = new ModelAndView("authority.pendingSignatures");
		// UserModel user = (UserModel)
		// httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
		DetachedCriteria dt = DetachedCriteria.forClass(ProjectRegistrationModel.class);
		dt.add(Restrictions.eq("status", ReraConstants.PENDING_APPROVAL_SIGN));

		List<Object> list = commonDao.getList(dt);
		mv.addObject("projectList", list);
		mv.addObject("noOfPendingRequest", list.size());
		httpSession.setAttribute(ReraConstants.SIGNATURE_COUNT, list.size());
		return mv;

	}

	@RequestMapping(value = "authority/pendingAgentSignatures")
	public ModelAndView pendingAgentSignatures(HttpServletRequest request) {

		ModelAndView mv = new ModelAndView("authority.pendingAgentSignatures");
		// UserModel user = (UserModel)
		// httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
		DetachedCriteria dt = DetachedCriteria.forClass(AgentRegistrationModel.class);
		dt.add(Restrictions.eq("status", ReraConstants.PENDING_AGENT_APPROVAL_SIGN));

		List<Object> list = commonDao.getList(dt);
		mv.addObject("projectList", list);
		mv.addObject("noOfPendingRequest", list.size());
		httpSession.setAttribute(ReraConstants.AGENT_SIGNATURE_COUNT, list.size());
		return mv;

	}

	@RequestMapping(value = "authority/prepareProjectRegistrationApproval")
	public ModelAndView prepareProjectRegistrationApproval(@RequestParam(value = "PROJECT_ID") Long projectId,
			@RequestParam(value = "accountsAuthRemarks") String accountsAuthRemarks,
			@RequestParam(value = "revenueAuthRemarks") String revenueAuthRemarks,
			@RequestParam(value = "tcpAuthRemarks") String tcpAuthRemarks,
			@RequestParam(value = "enggAuthRemarks") String enggAuthRemarks,
			@RequestParam(value = "STATUS") String status,
			@RequestParam(value = "verificationStatus") String verificationStatus, HttpServletRequest request)
					throws Exception {
		ModelAndView mv = new ModelAndView("redirect:projectTasklist");
		UserModel usr = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
		try {
			usr = (UserModel) commonDao.getObject(UserModel.class, usr.getUserId());
			ProjectRegistrationModel project = projectRegistrationService.getProjectRegByPk(projectId);
			project.setStatus(ReraConstants.PENDING_APPROVAL_SIGN);
			projectRegistrationService.editProjectRegistration(project);

			DetachedCriteria dt = DetachedCriteria.forClass(ProjectRegistrationModel.class);
			dt.add(Restrictions.eq("status", ReraConstants.PENDING_APPROVAL_SIGN));

			List<Object> list = commonDao.getList(dt);

			httpSession.setAttribute(ReraConstants.AGENT_SIGNATURE_COUNT, list.size());

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			throw e;
		}
		return mv;

	}

	@RequestMapping(value = "authority/approve")
	public ModelAndView approve(HttpServletRequest request, @RequestParam(value = "projectIds") String projectIds,
			HttpServletResponse response) throws NumberFormatException, Exception {
		ModelAndView mv = new ModelAndView("redirect:pendingSignatures");

		UserModel usr = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);

		DetachedCriteria dt = DetachedCriteria.forClass(ProjectRegistrationModel.class);
		dt.add(Restrictions.eq("status", ReraConstants.PENDING_APPROVAL_SIGN));

		List<Object> list = commonDao.getList(dt);

		httpSession.setAttribute(ReraConstants.SIGNATURE_COUNT, list.size());

		DetachedCriteria dt1 = DetachedCriteria.forClass(TokenModel.class);
		List<Object> tml = commonDao.getList(dt1);
		dt1.add(Restrictions.eq("userId.userId", usr.getUserId()));

		List<Object> tmObject = commonDao.getList(dt1);

		if (tmObject == null || tmObject.isEmpty()) {
			mv = new ModelAndView("authority.pendingSignatures");

			mv.addObject("ERROR_MSG", "Please login using digital token");
			mv.addObject("projectList", list);

			return mv;
		}
		usr = (UserModel) commonDao.getObject(UserModel.class, usr.getUserId());

		String[] pids = projectIds.split(",");
		for (String pid : pids) {

			ProjectRegistrationModel project = projectRegistrationService.getProjectRegByPk(Long.parseLong(pid));

			ProjectRemarks rm = project.getProjectRemarks();

			if (rm == null) {
				rm = new ProjectRemarks();
				project.setProjectRemarks(rm);
				rm.setRemarksList(new ArrayList<UserRemarks>());
				rm.getRemarksList().add(new UserRemarks());
			}

			List<UserRemarks> urList = rm.getRemarksList();
			UserRemarks ur = urList.get(urList.size() - 1);

			ur.setAuthorityUser(usr);

			ur.setAuthRemarkDate(Calendar.getInstance());
			ur.setStatus("CLOSE");
			project.setStatus(ReraConstants.APPROVED);
			StateUtModel state = (StateUtModel) request.getAttribute("RERA_STATEUT");
			// String primNo=getNextNumber();
			// GenerateRegistrationNumber.generateRegNumber(project,
			// state,primNo );
			String appNo = projectRegistrationService.generateProjectRegNumber(project);
			if (appNo == null || appNo.trim().length() == 0)
				throw new RuntimeException();
			project.setProjectRegistrationNo(appNo);
			String str[] = project.getApplicationNo().split("/");
			UserModel user = new UserModel();
			user.setLoginId("PR" + str[str.length - 1]);
			user.setPassword("Welcome@123");
			user.setUserType(ReraConstants.PROJECT_USER);
			user.setStatus(ReraConstants.ACTIVE_USER);
			user.setCreatedOn(Calendar.getInstance());
			user.setEmailId(project.getPromoterDetailsModel().getEmailId());
			user.setUserName(project.getPromoterDetailsModel().getPromoterName());
			project.setProjectUser(user);
			project.setApprovedOn(Calendar.getInstance());
			project.setApprovedBy(usr);
			project.setExpireDate(project.getProjectDetailsModel().getCompletionDate());

			projectRegistrationService.editProjectRegistration(project);
			mailService.sendProjectRegApproval(project);

			if (project.getPromoterDetailsModel().getMobileNo() != null && project.getApplicationNo() != null) {
				StringBuffer sb = new StringBuffer();

				sb.append("Dear ").append(project.getPromoterDetailsModel().getPromoterName()).append(" , ")
				.append("\n").append("Your project ");

				sb.append(project.getProjectDetailsModel().getProjectName()).append(" with ")
				.append(project.getApplicationNo()).append(" has been approved by Rera Karnataka.");

				smsService.sendSMS(project.getPromoterDetailsModel().getMobileNo(), sb.toString());

			}

			try {
				saveApplicationHistory(usr, project, ReraConstants.APPROVED);

			} catch (Exception e) {
				logger.error(e.getMessage(), e);
			}
		}

		return mv;

	}


	@RequestMapping(value = "authority/prepareAgentRegistration")
	public ModelAndView prepareAgentRegistrationStaus(@RequestParam(value = "AGENT_ID") Long agentId,
			@RequestParam(value = "REMARKS") String remarks, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("redirect:agentTasklist");
		UserModel usr = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
		try {
			AgentRegistrationModel agent = agentRegistrationService.getAgentRegByPk(agentId);
			agent.setStatus(ReraConstants.PENDING_AGENT_APPROVAL_SIGN);
			StateUtModel state = (StateUtModel) request.getAttribute("RERA_STATEUT");
			// String primNo=getNextAgentNumber();
			// GenerateRegistrationNumber.generateRegNumber(agent,
			// state,primNo);

			/*agent.setAgentRegistrationNo(agentRegistrationService.generateAgentNo(agent));
			String str[] = agent.getAgentRegistrationNo().split("/");
			UserModel user = new UserModel();
			user.setLoginId("AG" + str[str.length - 1]);
			user.setPassword("Welcome@123");
			user.setCreatedOn(Calendar.getInstance());

			user.setUserType(ReraConstants.AGENT_USER);
			if (agent.getRegistrationType().equalsIgnoreCase(ReraConstants.INDVISUAL_REG)) {
				user.setUserName(agent.getAgentDetailsModel().getAgentName());
				user.setEmailId(agent.getAgentDetailsModel().getAgentEmailId());
			} else {
				user.setUserName(agent.getAgentDetailsModel().getFirmName());
				user.setEmailId(agent.getAgentDetailsModel().getFirmEmail());
			}

			user.setStatus(ReraConstants.ACTIVE_USER);
			usr = (UserModel) commonDao.getObject(UserModel.class, usr.getUserId());
			agent.setApprovedBy(usr);
			agent.setApprovedOn(Calendar.getInstance());
			agent.setAgentUser(user);
			Calendar exp = Calendar.getInstance();
			exp.set(Calendar.YEAR, exp.get(Calendar.YEAR) + 5);
			agent.setExpireDate(exp);
			agent.setUpdatedFlag(null);
			agent.setAuthorityRemarks(remarks);
			agentRegistrationService.editAgentRegistration(agent);*/

			try {
				saveApplicationHistory(usr, agent, ReraConstants.PENDING_AGENT_APPROVAL_SIGN);

			} catch (Exception e) {
				logger.error(e.getMessage(), e);

			}

			DetachedCriteria dt = DetachedCriteria.forClass(AgentRegistrationModel.class);
			dt.add(Restrictions.eq("status", ReraConstants.PENDING_APPROVAL_SIGN));

			List<Object> list = commonDao.getList(dt);

			httpSession.setAttribute(ReraConstants.AGENT_SIGNATURE_COUNT, list.size());

			if (agent.getRegistrationType().equalsIgnoreCase(ReraConstants.INDVISUAL_REG)) {
				mv = new ModelAndView("redirect:agentTasklist");
			} else {
				mv = new ModelAndView("redirect:agentTasklist");
			}
			mv.addObject("agent", agent);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return mv;

	}

	@RequestMapping(value = "authority/approveAgents")
	public ModelAndView approveAgents(HttpServletRequest request,@RequestParam(value = "agentIds") String agentId, HttpServletResponse response) throws NumberFormatException, Exception {
		ModelAndView mv = new ModelAndView("redirect:pendingAgentSignatures");

		UserModel usr = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);

		DetachedCriteria dt = DetachedCriteria.forClass(AgentRegistrationModel.class);
		dt.add(Restrictions.eq("status", ReraConstants.PENDING_AGENT_APPROVAL_SIGN));

		List<Object> list = commonDao.getList(dt);

		httpSession.setAttribute(ReraConstants.AGENT_SIGNATURE_COUNT, list.size());

		DetachedCriteria dt1 = DetachedCriteria.forClass(TokenModel.class);
		dt1.add(Restrictions.eq("userId.userId",usr.getUserId()));

		List<Object> tmObject=commonDao.getList(dt1);

		if(tmObject==null||tmObject.isEmpty()){
			mv = new ModelAndView("authority.pendingAgentSignatures");
			mv.addObject("ERROR_MSG", "Please login using digital token");
			mv.addObject("projectList", list);
			return mv;
		}
		usr = (UserModel) commonDao.getObject(UserModel.class, usr.getUserId());
		String[] aids=agentId.split(",");
		for (String aid : aids) {
			AgentRegistrationModel agent=agentRegistrationService.getAgentRegByPk(Long.parseLong(aid));
			agent.setStatus(ReraConstants.APPROVED);
			agent.setAgentRegistrationNo(agentRegistrationService.generateAgentNo(agent));

			String str[] = agent.getAgentRegistrationNo().split("/");
			UserModel user = new UserModel();
			user.setLoginId("AG" + str[str.length - 1]);
			user.setPassword("Welcome@123");
			user.setCreatedOn(Calendar.getInstance());

			user.setUserType(ReraConstants.AGENT_USER);
			if (agent.getRegistrationType().equalsIgnoreCase(ReraConstants.INDVISUAL_REG)) {
				user.setUserName(agent.getAgentDetailsModel().getAgentName());
				user.setEmailId(agent.getAgentDetailsModel().getAgentEmailId());
			} else {
				user.setUserName(agent.getAgentDetailsModel().getFirmName());
				user.setEmailId(agent.getAgentDetailsModel().getFirmEmail());
			}

			user.setStatus(ReraConstants.ACTIVE_USER);
			usr = (UserModel) commonDao.getObject(UserModel.class, usr.getUserId());
			agent.setApprovedBy(usr);
			agent.setApprovedOn(Calendar.getInstance());
			agent.setAgentUser(user);
			Calendar exp = Calendar.getInstance();
			exp.set(Calendar.YEAR, exp.get(Calendar.YEAR) + 5);
			agent.setExpireDate(exp);
			agent.setUpdatedFlag(null);
			//agent.setAuthorityRemarks(remarks);
			agentRegistrationService.editAgentRegistration(agent);


			agentRegistrationService.editAgentRegistration(agent);

			try {
				ResourceBundle rb = ResourceBundle.getBundle("in.gov.rera.common.config.RERAProperties");
				String ackLoc = rb.getString("ACK_FOLDER_PATH");
				agent.setCertificateUser(usr);
				AcknowledgeUtilty actutil = new AcknowledgeUtilty();
				File file = new File(
						ackLoc + "certificates//" + agent.getAgentRegistrationNo().replaceAll("/", "") + ".pdf");
				OutputStream out = new FileOutputStream(file);
				actutil.generateAgentAck(out, agent);
				PendingAgentSignature ps=new PendingAgentSignature();

				ps.setAgentNumber(agent.getAgentRegistrationNo().replaceAll("/", ""));
				ps.setUserName(usr.getLoginId());
				ps.setAgentId(agent.getAgentRegistrationID());
				commonDao.saveObject(ps);

			} catch (Exception e) {
				e.printStackTrace();
			}



			//mailService.sendAgentRegApproval(agent);

			if (agent.getAgentDetailsModel().getFirmMobileNo() != null && agent.getApplicationNo() != null) {
				StringBuffer sb = new StringBuffer();

				sb.append("Dear ").append(agent.getAgentDetailsModel().getFirmName()).append(" , ")
				.append("\n").append("Your project ");

				sb.append(agent.getAgentDetailsModel().getFirmName()).append(" with ")
				.append(agent.getApplicationNo()).append(" has been approved by Rera Karnataka.");

				smsService.sendSMS(agent.getAgentDetailsModel().getFirmMobileNo(), sb.toString());
			}
			try {
				saveApplicationHistory(usr, agent, ReraConstants.APPROVED);
			} catch (Exception e) {
				logger.error(e.getMessage(), e);
			}
		}
		return mv;
	}


	@RequestMapping(value = "authority/approvedProjectList")
	public ModelAndView prepareProjectRegistrationApproval(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:projectTasklist");
		UserModel usr = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
		try {
			usr = (UserModel) commonDao.getObject(UserModel.class, usr.getUserId());

			DetachedCriteria dt = DetachedCriteria.forClass(AgentRegistrationModel.class);
			dt.add(Restrictions.eq("status", ReraConstants.APPROVED));

			List<Object> list = commonDao.getList(dt);

			for (Object prj : list) {
				AgentRegistrationModel arm=(AgentRegistrationModel)prj;
				File file =new File("/users/tejomaya/Documents/dms/output/"+arm.getAgentRegistrationNo().replaceAll("/", "")+".pdf");
				FileOutputStream fout=new FileOutputStream(file);
				AcknowledgeUtilty ack=new AcknowledgeUtilty();
				try {
					arm.setCertificateUser(usr);
					ack.generateAgentAck(fout, arm);
					fout.close();
				} catch (Exception e) {
					System.out.println("Missed Ack *************"+arm.getAgentRegistrationNo());
				}


			}


		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			throw e;
		}
		return mv;

	}

}
