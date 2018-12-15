package in.gov.rera.admin.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.ResourceBundle;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import in.gov.rera.common.model.PendingSignature;
import in.gov.rera.common.model.TemplateModel;
import in.gov.rera.common.model.TokenModel;
import in.gov.rera.common.model.UserModel;
import in.gov.rera.common.util.AcknowledgeUtilty;
import in.gov.rera.common.util.DateUtil;
import in.gov.rera.common.util.ReraConstants;
import in.gov.rera.master.stateut.model.StateUtModel;
import in.gov.rera.notification.service.MailService;
import in.gov.rera.notification.service.SmsService;
import in.gov.rera.transaction.agentregistration.model.AgentNumber;
import in.gov.rera.transaction.agentregistration.model.AgentRegRenewalModel;
import in.gov.rera.transaction.agentregistration.model.AgentRegistrationLog;
import in.gov.rera.transaction.agentregistration.model.AgentRegistrationModel;
import in.gov.rera.transaction.agentregistration.service.IAgentRegistrationService;
import in.gov.rera.transaction.complaint.model.ComplaintModel;
import in.gov.rera.transaction.complaint.service.IComplaintService;
import in.gov.rera.transaction.projectregistration.model.ProjectNumber;
import in.gov.rera.transaction.projectregistration.model.ProjectRegExtensionModel;
import in.gov.rera.transaction.projectregistration.model.ProjectRegistrationModel;
import in.gov.rera.transaction.projectregistration.model.ProjectRemarks;
import in.gov.rera.transaction.projectregistration.model.UserRemarks;
import in.gov.rera.transaction.projectregistration.service.IProjectRegistrationService;

@Controller(value = "ChiefAuthorityController")
@Scope("request")
public class ChiefAuthorityController {

	static Logger logger = Logger.getLogger(ChiefAuthorityController.class);

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
	MailService mailService;

	@Autowired
	DashboardService service;

	@Autowired
	ApplicationHistoryService applicationHistoryService;

	@Autowired
	SmsService smsService;

	@Autowired
	TemplateService templateService;

	@RequestMapping(value = "super/dashboard")
	public ModelAndView dashboard(HttpServletRequest request) throws ParseException {

		ModelAndView mv = new ModelAndView("super.dashbord");

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

	@RequestMapping(value = "super/projectTasklist")
	public ModelAndView projectTasklist(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("super.projectTasklist");
		UserModel user = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
		List<ProjectRegistrationModel> list = authorityService
				.getPendingProjectRegistration(ReraConstants.PENDING_HEADOFFICE);
		mv.addObject("projectList", list);
		mv.addObject("noOfPendingRequest", list.size());
		return mv;

	}

	@RequestMapping(value = "super/complaintTasklist")
	public ModelAndView approveComplaint(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("super.complaintTasklist");
		UserModel user = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
		List<ComplaintModel> list = null;
		try {

			list = authorityService.getPendingComplaint(ReraConstants.PENDING_HEADOFFICE);
			mv.addObject("complaintList", list);
			mv.addObject("noOfPendingRequest", list.size());

		} catch (Exception e) {

			logger.error(e.getMessage(), e);
		}

		return mv;

	}

	@RequestMapping(value = "super/allcomplaints")
	public ModelAndView allComplaints(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("super.allcomplaints");
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

	@RequestMapping(value = "super/projectDetails")
	public ModelAndView projectDetails(@RequestParam(value = "PROJECT_ID") Long projectId) {
		ModelAndView mv = null;

		try {
			ProjectRegistrationModel project = projectRegistrationService.getProjectRegByPk(projectId);
			if (project.getRegistrationType().equalsIgnoreCase(ReraConstants.INDVISUAL_REG)) {
				mv = new ModelAndView("super.projectIndvDetails");
			} else {
				mv = new ModelAndView("super.projectCompDetails");
			}

			List<Object> tempList = templateService.getTemplateListByType(ReraConstants.PROJECT);
			String enquiryDate = "";
			String promoterName = "";
			String projectName = "";

			if (project.getPromoterDetailsModel() != null
					&& project.getPromoterDetailsModel().getPromoterName() != null) {
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

					for (EnquiryModel enquiry : project.getEnquiryList()) {
						enquiryDate = new SimpleDateFormat("dd/MM/yyyy").format(enquiry.getCreatedOn().getTime());
					}

				}
				tc = tc.replaceAll("\\$enquiryDate", enquiryDate);
				tc = tc.replaceAll("\\$currentDate", new SimpleDateFormat("dd/MM/yyyy").format(new Date()));

				tc = tc.replaceAll("\\$promoterName", promoterName);

				tc = tc.replaceAll("\\$projectName", projectName);

				tc = tc.replaceAll("\\$projectDate",
						new SimpleDateFormat("dd/MM/yyyy").format(project.getCreatedOn().getTime()));

				((TemplateModel) tm).setTemplateContent(tc);
			}
			mv.addObject("template", tempList);
			mv.addObject("project", project);

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return mv;
	}

	@RequestMapping(value = "super/sendProjectRegEnquiry", method = RequestMethod.POST)
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

			try {
				saveApplicationHistory(user, project, ReraConstants.ENQUIRY);

			} catch (Exception e) {
				logger.error(e.getMessage(), e);
			}

			mailService.sendMail(enq);

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

			projectRegistrationService.editProjectRegistration(project);

			if (project.getRegistrationType().equalsIgnoreCase(ReraConstants.INDVISUAL_REG)) {
				mv = new ModelAndView("super.projectIndvDetails");
			} else {
				mv = new ModelAndView("super.projectCompDetails");
			}

			mv.addObject("project", project);

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return mv;

	}

	@RequestMapping(value = "super/approveProjectRegistration")
	public ModelAndView approveProjectRegistration(@RequestParam(value = "PROJECT_ID") Long projectId,
			@RequestParam(value = "STATUS") String status,
			@RequestParam(value = "accountsSupRemarks", required = false) String accountsSupRemarks,
			@RequestParam(value = "revenueSupRemarks", required = false) String revenueSupRemarks,
			@RequestParam(value = "tcpSupRemarks", required = false) String tcpSupRemarks,
			@RequestParam(value = "enggSupRemarks", required = false) String enggSupRemarks, HttpServletRequest request)
			throws Exception {
		ModelAndView mv = new ModelAndView("redirect:projectTasklist");
		UserModel usr = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);

		try {
			usr = (UserModel) commonDao.getObject(UserModel.class, usr.getUserId());

			ProjectRegistrationModel project = projectRegistrationService.getProjectRegByPk(projectId);

			ProjectRemarks rem = project.getProjectRemarks();
			UserRemarks ur = new UserRemarks();
			List<UserRemarks> urList = new ArrayList<UserRemarks>();
			if (rem != null) {
				urList = rem.getRemarksList();
				ur = urList.get(urList.size() - 1);
			}

			ur.setAccountsSupRemarks(accountsSupRemarks);
			ur.setRevenueSupRemarks(revenueSupRemarks);
			ur.setTcpSupRemarks(tcpSupRemarks);
			ur.setEnggSupRemarks(enggSupRemarks);
			ur.setSupRemarkDate(Calendar.getInstance());
			ur.setSuperUser(usr);

			if (status.equals("APPROVED")) {

				String appNo = projectRegistrationService.generateProjectRegNumber(project);
				if (appNo == null || appNo.trim().length() == 0)
					throw new RuntimeException();

				project.setProjectRegistrationNo(appNo);

				ur.setStatus("CLOSE");
				project.setStatus(ReraConstants.APPROVED);

				StateUtModel state = (StateUtModel) request.getAttribute("RERA_STATEUT");
				// String primNo= getNextNumber();
				// GenerateRegistrationNumber.generateRegNumber(project,
				// state,primNo);

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

				try {
					saveApplicationHistory(usr, project, ReraConstants.APPROVED);

				} catch (Exception e) {
					logger.error(e.getMessage(), e);
				}

				mailService.sendProjectRegApproval(project);
				return mv;
			} else if (status.equals("RETURN")) {
				ur.setStatus("CLOSE");
				UserRemarks newRem = new UserRemarks();
				newRem.setStatus("NEW");
				urList.add(newRem);
				project.setStatus(ReraConstants.PENDING_AUTHORITY);
				project.setReturnedByL2On(Calendar.getInstance());
				projectRegistrationService.editProjectRegistration(project);

				try {
					saveApplicationHistory(usr, project, ReraConstants.RETURN);

				} catch (Exception e) {
					logger.error(e.getMessage(), e);
				}

			} else {
				ur.setStatus("CLOSE");
				project.setStatus(ReraConstants.REJECTED);
				project.setRejectedBy(usr);
				project.setRejectedOn(Calendar.getInstance());
				projectRegistrationService.editProjectRegistration(project);

				try {
					saveApplicationHistory(usr, project, ReraConstants.REJECTED);

				} catch (Exception e) {
					logger.error(e.getMessage(), e);
				}
			}

			if (!status.equals("RETURN")) {
				if (project.getRegistrationType().equalsIgnoreCase(ReraConstants.INDVISUAL_REG)) {
					mv = new ModelAndView("super.projectIndvDetailsPage");
				} else {
					mv = new ModelAndView("super.projectCompDetailsPage");
				}
				mv.addObject("project", project);

				try {
					saveApplicationHistory(usr, project, ReraConstants.RETURN);

				} catch (Exception e) {
					logger.error(e.getMessage(), e);
				}
			}
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			throw e;
		}
		return mv;

	}

	@RequestMapping(value = "super/approveProject")
	public ModelAndView approveProject(@RequestParam(value = "PROJECT_ID") Long projectId,
			@RequestParam(value = "STATUS") String status,
			@RequestParam(value = "accountsSupRemarks", required = false) String accountsSupRemarks,
			@RequestParam(value = "revenueSupRemarks", required = false) String revenueSupRemarks,
			@RequestParam(value = "tcpSupRemarks", required = false) String tcpSupRemarks,
			@RequestParam(value = "enggSupRemarks", required = false) String enggSupRemarks, HttpServletRequest request)
			throws Exception {
		ModelAndView mv = new ModelAndView("redirect:viewAllProjects");
		UserModel usr = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);

		try {
			usr = (UserModel) commonDao.getObject(UserModel.class, usr.getUserId());

			ProjectRegistrationModel project = projectRegistrationService.getProjectRegByPk(projectId);

			logger.info("project:::" + project.toString().length());
			ProjectRemarks rem = project.getProjectRemarks();
			UserRemarks ur = new UserRemarks();
			List<UserRemarks> urList = new ArrayList<UserRemarks>();
			if (rem != null) {
				urList = rem.getRemarksList();
				ur = urList.get(urList.size() - 1);
			}

			ur.setAccountsSupRemarks(accountsSupRemarks);
			ur.setRevenueSupRemarks(revenueSupRemarks);
			ur.setTcpSupRemarks(tcpSupRemarks);
			ur.setEnggSupRemarks(enggSupRemarks);
			ur.setSupRemarkDate(Calendar.getInstance());
			ur.setSuperUser(usr);

			ur.setStatus("CLOSE");
			project.setStatus(ReraConstants.APPROVED);

			try {
				saveApplicationHistory(usr, project, ReraConstants.APPROVED);

			} catch (Exception e) {
				logger.error(e.getMessage(), e);
			}

			StateUtModel state = (StateUtModel) request.getAttribute("RERA_STATEUT");
			// String primNo= getNextNumber();
			// GenerateRegistrationNumber.generateRegNumber(project,
			// state,primNo);

			int maxRetries = 0;
			boolean projectSave = false;

			while (!projectSave && maxRetries < 10) {
				try {
					maxRetries++;
					project.setProjectRegistrationNo(projectRegistrationService.generateProjectRegNumber(project));
					projectRegistrationService.editProjectRegistration(project);
					project = projectRegistrationService.getProjectRegByPk(projectId);
					projectSave = true;
				} catch (Exception e) {
					projectSave = false;
				}

			}

			String str[] = project.getProjectRegistrationNo().split("/");
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
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
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

	@RequestMapping(value = "super/agentTasklist")
	public ModelAndView agentTasklist(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("super.agentTasklist");
		UserModel user = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
		List<AgentRegistrationModel> list = authorityService
				.getPendingAgentRegistration(ReraConstants.PENDING_HEADOFFICE);
		mv.addObject("agentList", list);
		mv.addObject("noOfPendingRequest", list.size());
		return mv;

	}

	@RequestMapping(value = "super/sendAgentRegEnquiry", method = RequestMethod.POST)
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
			enq.setRaisedBy(user);

			if (agent.getRegistrationType().equals(ReraConstants.INDVISUAL_REG)) {
				enq.setEmailId(agent.getAgentDetailsModel().getAgentEmailId());
			} else {
				enq.setEmailId(agent.getAgentDetailsModel().getFirmEmail());
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

			agentRegistrationService.editAgentRegistration(agent);

			if (agent.getRegistrationType().equalsIgnoreCase(ReraConstants.INDVISUAL_REG)) {
				mv = new ModelAndView("super.agentIndvDetails");
			} else {
				mv = new ModelAndView("super.agentCompDetails");
			}
			mv.addObject("agent", agent);

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return mv;

	}

	@RequestMapping(value = "super/complaintDetails")
	public ModelAndView complaintDetails(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("super.approvComplaint");

		try {
			ComplaintModel complaintModel = complaintService
					.findComplaintById(Long.parseLong(request.getParameter("id")));

			List<Object> tempList = createTemplate(complaintModel);
			mv.addObject("template", tempList);
			mv.addObject("complaintModel", complaintModel);

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}

		return mv;

	}

	@RequestMapping(value = "super/sendComplaintRegEnquiry", method = RequestMethod.POST)
	public ModelAndView sendComplaintRegEnquiry(@RequestParam(value = "COMPLAINT_ID") Long complaintId,
			@RequestParam(value = "enquiryOn") String enquiryOn, @RequestParam(value = "subject") String subject,
			@RequestParam(value = "summary") String summary, HttpServletRequest request) {
		ModelAndView mv = null;
		String emailId = null;

		try {
			ComplaintModel complaintModel = complaintService.getComplaintRegByPk(complaintId);

			if (complaintModel.getRespondentEmailId() == null && complaintModel.getApplicationNo() == null) {
				return new ModelAndView("super.noProjectDetails");

			}

			else if (complaintModel.getApplicationNo() != null && complaintModel.getRespondentEmailId() == null) {
				String ProjAppNo = "";

				ProjAppNo = ProjAppNo.replaceAll(", $", "");

				/*
				 * String splitted[] = ProjAppNo.split(","); StringBuffer sb =
				 * new StringBuffer(); String retrieveData = ""; for(int i =0;
				 * i<splitted.length; i++){ retrieveData = splitted[i];
				 * if((retrieveData.trim()).length()>0){
				 * 
				 * if(i!=0){ sb.append(","); } sb.append(retrieveData);
				 * 
				 * } }
				 * 
				 * ProjAppNo = sb.toString(); System.out.println(ProjAppNo);
				 */

				ProjectRegistrationModel prj = projectRegistrationService.getProjectByAppNo(ProjAppNo);

				System.out.println("ProjAppNo:::" + ProjAppNo);

				emailId = prj.getPromoterDetailsModel().getEmailId();

			}

			else if (enquiryOn.equalsIgnoreCase(ReraConstants.COMPLAINANT)) {

				emailId = complaintModel.getApplicateEmailId();
				complaintModel.setOnComplainant("YES");

			}

			else if (complaintModel.getRespondentEmailId() != null) {

				emailId = complaintModel.getRespondentEmailId();
				complaintModel.setOnRespondent("YES");

			}

			else {
				return new ModelAndView("super.noProjectDetails");

			}

			EnquiryModel enq = new EnquiryModel();
			enq.setSubject(subject);
			enq.setCreatedOn(Calendar.getInstance());
			enq.setEnquiryText(summary);
			UserModel user = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
			UserModel us = (UserModel) commonDao.getObject(UserModel.class, user.getUserId());
			enq.setRaisedBy(us);

			enq.setEmailId(emailId);

			mailService.sendMail(enq);
			if (complaintModel.getEnquiryList() == null) {
				complaintModel.setEnquiryList(new ArrayList<EnquiryModel>());
			}
			complaintModel.getEnquiryList().add(enq);
			complaintModel.setStatus(ReraConstants.UNDER_ENQUIRY);
			complaintModel.setEnquiryOn(enquiryOn);

			complaintService.editComplaintRegistration(complaintModel);

			mv = new ModelAndView("super.approvComplaint");

			mv.addObject("complaintModel", complaintModel);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;

	}

	@RequestMapping(value = "super/approveAgentRegistration")
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
			agentRegistrationService.editAgentRegistration(agent);

			try {
				saveApplicationHistory(usr, agent, ReraConstants.APPROVED);

			} catch (Exception e) {
				logger.error(e.getMessage(), e);
			}

			mailService.sendAgentRegApproval(agent);
			if (agent.getRegistrationType().equalsIgnoreCase(ReraConstants.INDVISUAL_REG)) {
				mv = new ModelAndView("super.agentIndvDetailsPage");
			} else {
				mv = new ModelAndView("super.agentCompDetailsPage");
			}
			mv.addObject("agent", agent);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return mv;

	}

	@RequestMapping(value = "super/agentDetails")
	public ModelAndView agentDetails(@RequestParam(value = "AGENT_ID") Long agentId) {
		ModelAndView mv = null;
		new ModelAndView("super.agentDetails");
		try {
			AgentRegistrationModel agent = agentRegistrationService.getAgentRegByPk(agentId);
			if (agent.getRegistrationType().equalsIgnoreCase(ReraConstants.INDVISUAL_REG)) {
				mv = new ModelAndView("super.agentIndvDetails");
			} else {
				mv = new ModelAndView("super.agentCompDetails");
			}
			mv.addObject("agent", agent);

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return mv;

	}

	@RequestMapping(value = "super/viewAllAgents")
	public ModelAndView viewAllAgents(HttpServletRequest request,
			@RequestParam(value = "status", required = false) String status,
			@RequestParam(value = "regNo", required = false) String regNo) {

		ModelAndView mv = new ModelAndView("super.allAgentlist");

		List<AgentRegistrationModel> list = authorityService.getViewAllAgents(status, regNo);
		mv.addObject("agentList", list);
		mv.addObject("totalRecords", list.size());
		return mv;

	}

	@RequestMapping(value = "super/viewAllProjects")
	public ModelAndView viewAllProject(HttpServletRequest request,
			@RequestParam(value = "status", required = false) String status,
			@RequestParam(value = "regNo", required = false) String regNo) {

		ModelAndView mv = new ModelAndView("super.allProjectlist");

		List<ProjectRegistrationModel> list = authorityService.getViewAllProjects(status, regNo);
		mv.addObject("projectList", list);
		mv.addObject("totalRecords", list.size());
		return mv;

	}

	@RequestMapping(value = "super/agentDetailsPage")
	public ModelAndView agentDetailsPage(@RequestParam(value = "AGENT_ID") Long agentId) {
		ModelAndView mv = null;
		new ModelAndView("super.agentDetails");
		try {
			AgentRegistrationModel agent = agentRegistrationService.getAgentRegByPk(agentId);
			if (agent.getRegistrationType().equalsIgnoreCase(ReraConstants.INDVISUAL_REG)) {
				mv = new ModelAndView("super.agentIndvDetailsPage");
			} else {
				mv = new ModelAndView("super.agentCompDetailsPage");
			}
			mv.addObject("agent", agent);

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return mv;

	}

	@RequestMapping(value = "super/projectDetailsPage")
	public ModelAndView projectDetailsPage(@RequestParam(value = "PROJECT_ID") Long projectId) {
		ModelAndView mv = null;
		try {
			ProjectRegistrationModel project = projectRegistrationService.getProjectRegByPk(projectId);
			if (project.getRegistrationType().equalsIgnoreCase(ReraConstants.INDVISUAL_REG)) {
				mv = new ModelAndView("super.projectIndvDetailsPage");
			} else {
				mv = new ModelAndView("super.projectCompDetailsPage");
			}

			mv.addObject("project", project);

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return mv;

	}

	@RequestMapping(value = "super/revokeAgentRegistration")
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
				UserModel user = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
				saveApplicationHistory(user, agent, ReraConstants.REVOKED);

			} catch (Exception e) {
				logger.error(e.getMessage(), e);
			}

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return mv;

	}

	@RequestMapping(value = "super/revokeProjectRegistration")
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
				UserModel user = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
				saveApplicationHistory(user, project, ReraConstants.REVOKED);

			} catch (Exception e) {
				logger.error(e.getMessage(), e);
			}

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return mv;

	}

	@RequestMapping(value = "super/projectExtTasklist")
	public ModelAndView projectExtTasklist(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("super.projectExtTasklist");
		UserModel user = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
		List<Object> list = authorityService.getPendingProjectExtReg(ReraConstants.PENDING_AUTHORITY, user.getUserId());
		mv.addObject("projectExtList", list);
		mv.addObject("noOfPendingRequest", list.size());
		return mv;

	}

	@RequestMapping(value = "super/projectExtDetails")
	public ModelAndView projectExtDetails(@RequestParam(value = "PROJECT_ID") Long projectId) {
		ModelAndView mv = null;
		try {
			ProjectRegExtensionModel project = (ProjectRegExtensionModel) commonDao
					.getObject(ProjectRegExtensionModel.class, projectId);
			if (project.getRegistrationType() == null) {
				project.setRegistrationType(project.getProjectRegistration().getRegistrationType());
			}
			if (project.getRegistrationType().equalsIgnoreCase(ReraConstants.INDVISUAL_REG)) {
				mv = new ModelAndView("super.projectExtIndvDetails");
			} else {
				mv = new ModelAndView("super.projectExtCompDetails");
			}
			mv.addObject("projectExt", project);
			mv.addObject("project", project.getProjectRegistration());

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return mv;

	}

	@RequestMapping(value = "super/sendProjectExtEnquiry", method = RequestMethod.POST)
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
				mv = new ModelAndView("super.projectExtIndvDetails");
			} else {
				mv = new ModelAndView("super.projectExtCompDetails");
			}

			mv.addObject("projectExt", project);
			mv.addObject("project", project.getProjectRegistration());

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return mv;

	}

	@RequestMapping(value = "super/approvedProjectExtRegistration")
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

	@RequestMapping(value = "super/agentRenewalTasklist")
	public ModelAndView agentRenwalTasklist(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("super.agentRenwalTasklist");
		UserModel user = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
		List<Object> list = authorityService.getPendingAgentRegRenewal(ReraConstants.PENDING_AUTHORITY,
				user.getUserId());

		mv.addObject("agentRenwalList", list);
		mv.addObject("noOfPendingRequest", list.size());
		return mv;

	}

	@RequestMapping(value = "super/agentRenewalDetails")
	public ModelAndView agentRenewalDetails(@RequestParam(value = "AGENTREQ_ID") Long agentId) {
		ModelAndView mv = null;
		new ModelAndView("super.agentDetails");
		try {// AUTHORITYLIST
			AgentRegRenewalModel agent = (AgentRegRenewalModel) commonDao.getObject(AgentRegRenewalModel.class,
					agentId);
			if (agent.getAgentRegistration().getRegistrationType().equalsIgnoreCase(ReraConstants.INDVISUAL_REG)) {
				mv = new ModelAndView("super.agentReqIndvDetails");
			} else {
				mv = new ModelAndView("super.agentReqCompDetails");
			}
			mv.addObject("agentReq", agent);
			mv.addObject("agent", agent.getAgentRegistration());

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return mv;

	}

	@RequestMapping(value = "super/sendAgentRegRenewEnquiry", method = RequestMethod.POST)
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
				mv = new ModelAndView("super.agentReqIndvDetails");
			} else {
				mv = new ModelAndView("super.agentReqCompDetails");
			}
			mv.addObject("agentReq", agent);
			mv.addObject("agent", agent.getAgentRegistration());

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return mv;

	}

	@RequestMapping(value = "super/approveAgentRegRenwal")
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

			mailService.sendAgentRegRenewApproval(agent.getAgentRegistration());

			try {
				saveApplicationHistory(user, agent, ReraConstants.APPROVED);

			} catch (Exception e) {
				logger.error(e.getMessage(), e);
			}

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return mv;

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

	@RequestMapping(value = "super/changePasswordForm")
	public ModelAndView authorityChangePasswordForm() {

		ModelAndView mv = null;

		mv = new ModelAndView("super.changePassword");

		return mv;
	}

	@RequestMapping(value = "super/rejectProjectRegistration")
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

	@RequestMapping(value = "super/enqApprovedTasklist")
	public ModelAndView enqApprovedTasklist(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("super.enqApprovedProjectTasklist");
		// List<Object> list =
		// authorityService.getPendingAgentRegRenewal(ReraConstants.APPROVED);

		List<ProjectRegistrationModel> list = authorityService.getApprovedProjectsUnderEnquiryForAuthority();
		mv.addObject("projectEnqApprovedList", list);
		mv.addObject("totalRecords", list.size());
		return mv;
	}

	private List<Object> createTemplate(ComplaintModel complaintModel) {
		List<Object> tempList = templateService.getTemplateListByType(ReraConstants.COMPLAINT);
		String enquiryDate = "";
		String complainanttName = "";
		// String projectName = "";

		if (complaintModel.getPromoterName() != null) {
			complainanttName = complaintModel.getPromoterName();

		}

		for (Object tm : tempList) {

			String tc = ((TemplateModel) tm).getTemplateContent().replaceAll("\\$applicationDate",
					new SimpleDateFormat("dd/MM/yyyy").format(complaintModel.getComplaintDate().getTime()));

			if (complaintModel.getComplaintNo() != null) {
				tc = tc.replaceAll("\\$complaintNo", complaintModel.getComplaintNo());
			}

			if (complaintModel.getEnquiryList() != null) {

				for (EnquiryModel enquiry : complaintModel.getEnquiryList()) {
					enquiryDate = new SimpleDateFormat("dd/MM/yyyy").format(enquiry.getCreatedOn().getTime());
				}

			}
			tc = tc.replaceAll("\\$enquiryDate", enquiryDate);
			tc = tc.replaceAll("\\$currentDate", new SimpleDateFormat("dd/MM/yyyy").format(new Date()));

			tc = tc.replaceAll("\\$complainanttName", complainanttName);

			tc = tc.replaceAll("\\$complaintDate",
					new SimpleDateFormat("dd/MM/yyyy").format(complaintModel.getComplaintDate().getTime()));

			((TemplateModel) tm).setTemplateContent(tc);
		}
		return tempList;
	}

	@RequestMapping(value = "super/reports")
	public ModelAndView projectReport(HttpServletRequest request) {

		ModelAndView mv = new ModelAndView("super.reports");

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
		pendingProjectData
				.add(authorityService.getProjectsPendingByDate(ReraConstants.OP_TCP_USER, startDate, endDate));
		pendingProjectData
				.add(authorityService.getProjectsPendingByDate(ReraConstants.OP_ENGG_USER, startDate, endDate));
		pendingProjectData
				.add(authorityService.getProjectsPendingByDate(ReraConstants.OP_REVENUE_USER, startDate, endDate));
		pendingProjectData
				.add(authorityService.getProjectsPendingByDate(ReraConstants.AUTHORITY_USER, startDate, endDate));
		pendingProjectData
				.add(authorityService.getProjectsPendingByDate(ReraConstants.CHIEFAUTHORITY_USER, startDate, endDate));
		pendingProjectData
				.add(authorityService.getProjectsPendingByDate(ReraConstants.PROJECT_USER, startDate, endDate));

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

	@RequestMapping(value = "super/agentreports")
	public ModelAndView agentReport(HttpServletRequest request) {

		ModelAndView mv = new ModelAndView("super.agentreports");

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

		}
		agentreports.add(reportTotal);
		mv.addObject("agentreports", agentreports);

		return mv;

	}

	@RequestMapping(value = "super/viewApprovedProjects")
	public ModelAndView viewApprovedProjects(HttpServletRequest request,
			@RequestParam(value = "status", required = false) String status,
			@RequestParam(value = "regNo", required = false) String regNo) {

		ModelAndView mv = new ModelAndView("super.viewApprovedProjects");

		List<ProjectRegistrationModel> list = authorityService.getPendingProjectRegistration(ReraConstants.APPROVED);
		mv.addObject("projectList", list);
		mv.addObject("totalRecords", list.size());
		return mv;

	}

	// Added for return projects

	@RequestMapping(value = "super/returnProjects")
	public ModelAndView returnProjectsToAuthority(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("super.returnProjects");

		UserModel um = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
		UserModel user = (UserModel) commonDao.getObject(UserModel.class, um.getUserId());

		List<ProjectRegistrationModel> list = authorityService
				.returnProjectsToAuthority(ReraConstants.PENDING_HEADOFFICE, user);
		mv.addObject("projectList", list);
		mv.addObject("noOfPendingRequest", list.size());

		return mv;

	}

	// For getting projects under Pending Enquery

	@RequestMapping(value = "super/viewPendingEnquery")
	public ModelAndView viewPendingEnquery(HttpServletRequest request) {

		ModelAndView mv = new ModelAndView("super.viewPendingEnquery");
		List<ProjectRegistrationModel> enquiryList = authorityService.getProjectsUnderEnquiryForAuthority();
		mv.addObject("enquiryList", enquiryList);
		mv.addObject("noOfPendingRequest", enquiryList.size());

		return mv;

	}

	@RequestMapping(value = "super/pendingProjectStatus")
	public ModelAndView pendingProjectStatus(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("super.pendingProjectStatus");
		UserModel user = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
		List<ProjectRegistrationModel> list = authorityService
				.getPendingProjectRegistration(ReraConstants.PENDING_OPRATOR);
		mv.addObject("projectList", list);
		mv.addObject("noOfPendingRequest", list.size());
		return mv;

	}

	@RequestMapping(value = "super/returnbyl2")
	public ModelAndView returnProjectsByAuthority(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("super.returnbyl2");

		UserModel um = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
		UserModel user = (UserModel) commonDao.getObject(UserModel.class, um.getUserId());

		List<ProjectRegistrationModel> list = authorityService
				.returnProjectsByAuthority(ReraConstants.PENDING_AUTHORITY, user);
		mv.addObject("projectList", list);
		mv.addObject("noOfPendingRequest", list.size());

		return mv;

	}

	@RequestMapping(value = "super/viewRejectedAgents")
	public ModelAndView viewRejectedAgents(HttpServletRequest request,
			@RequestParam(value = "status", required = false) String status,
			@RequestParam(value = "regNo", required = false) String regNo) {

		ModelAndView mv = new ModelAndView("super.viewRejectedAgents");

		List<AgentRegistrationModel> list = authorityService.getRejectedList();
		mv.addObject("agentList", list);
		mv.addObject("totalRecords", list.size());
		return mv;

	}

	@RequestMapping(value = "super/viewPendingComplaints")
	public ModelAndView viewPendingComplaints(HttpServletRequest request) {

		ModelAndView mv = new ModelAndView("super.viewPendingComplaints");

		List<ComplaintModel> list = null;

		try {

			list = authorityService.getPendingComplaint(ReraConstants.UNDER_ENQUIRY);
			mv.addObject("complaintList", list);
			mv.addObject("totalRecords", list.size());

		} catch (Exception e) {

			logger.error(e.getMessage(), e);
		}
		return mv;

	}

	@RequestMapping(value = "super/prepareProjectRegistrationApproval")
	public ModelAndView prepareProjectRegistrationApproval(@RequestParam(value = "PROJECT_ID") Long projectId,
			@RequestParam(value = "STATUS") String status,
			@RequestParam(value = "accountsSupRemarks", required = false) String accountsSupRemarks,
			@RequestParam(value = "revenueSupRemarks", required = false) String revenueSupRemarks,
			@RequestParam(value = "tcpSupRemarks", required = false) String tcpSupRemarks,
			@RequestParam(value = "enggSupRemarks", required = false) String enggSupRemarks, HttpServletRequest request)
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

			httpSession.setAttribute(ReraConstants.SIGNATURE_COUNT, list.size());

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			throw e;
		}
		return mv;

	}

	@RequestMapping(value = "super/pendingSignatures")
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

	@RequestMapping(value = "super/approve")
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
			mv = new ModelAndView("super.pendingSignatures");

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

			int maxRetries = 0;
			boolean projectSave = false;

			while (!projectSave && maxRetries < 10) {
				try {
					maxRetries++;
					project.setProjectRegistrationNo(projectRegistrationService.generateProjectRegNumber(project));
					projectRegistrationService.editProjectRegistration(project);
					project = projectRegistrationService.getProjectRegByPk(Long.parseLong(pid));
					projectSave = true;
				} catch (Exception e) {
					projectSave = false;
				}

			}

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

			try {
				ResourceBundle rb = ResourceBundle.getBundle("in.gov.rera.common.config.RERAProperties");
				String ackLoc = rb.getString("ACK_FOLDER_PATH");
				project.setCertificateUser(usr);
				AcknowledgeUtilty actutil = new AcknowledgeUtilty();
				File file = new File(
						ackLoc + "certificates//" + project.getProjectRegistrationNo().replaceAll("/", "") + ".pdf");
				OutputStream out = new FileOutputStream(file);
				actutil.generateProjectAck(out, project);
				PendingSignature ps=new PendingSignature();
				
				ps.setProjectNumber(project.getProjectRegistrationNo().replaceAll("/", ""));
				ps.setUserName(usr.getLoginId());
				ps.setProjectId(project.getProjectRegId());
				commonDao.saveObject(ps);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			//mailService.sendProjectRegApproval(project);

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

	@RequestMapping(value = "super/approvedProjectList")
	public ModelAndView prepareProjectRegistrationApproval(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:projectTasklist");
		UserModel usr = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
		try {
			usr = (UserModel) commonDao.getObject(UserModel.class, usr.getUserId());

			DetachedCriteria dt = DetachedCriteria.forClass(ProjectRegistrationModel.class);
			dt.add(Restrictions.eq("status", ReraConstants.APPROVED));

			List<Object> list = commonDao.getList(dt);

			StringBuffer sb = new StringBuffer();
			
			for (Object prj : list) {
				

				mailService.sendProjectRegApproval((ProjectRegistrationModel) prj);
				

			}

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			throw e;
		}
		return mv;

	}

}