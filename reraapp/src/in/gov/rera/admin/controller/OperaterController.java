package in.gov.rera.admin.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import in.gov.rera.admin.service.ApplicationHistoryService;
import in.gov.rera.admin.service.AuthorityService;
import in.gov.rera.admin.service.DashboardService;
import in.gov.rera.common.dao.impl.CommonDao;
import in.gov.rera.common.model.ApplicationHistoryModel;
import in.gov.rera.common.model.EnquiryModel;
import in.gov.rera.common.model.LoginHistory;
import in.gov.rera.common.model.UserModel;
import in.gov.rera.common.security.FileSecurity;
import in.gov.rera.common.util.ComparatorUtil;
import in.gov.rera.common.util.ReraConstants;
import in.gov.rera.notification.service.MailService;
import in.gov.rera.transaction.agentregistration.model.AgentRegRenewalModel;
import in.gov.rera.transaction.agentregistration.model.AgentRegistrationModel;
import in.gov.rera.transaction.agentregistration.service.IAgentRegistrationService;
import in.gov.rera.transaction.complaint.model.ComplaintModel;
import in.gov.rera.transaction.complaint.service.IComplaintService;
import in.gov.rera.transaction.home.service.LoginService;
import in.gov.rera.transaction.projectregistration.model.ProjectRegExtensionModel;
import in.gov.rera.transaction.projectregistration.model.ProjectRegistrationModel;
import in.gov.rera.transaction.projectregistration.model.ProjectRemarks;
import in.gov.rera.transaction.projectregistration.model.UserRemarks;
import in.gov.rera.transaction.projectregistration.service.IProjectRegistrationService;
import in.gov.rera.transaction.unregistered.model.UnregisteredProjectDetail;

@Controller(value = "OperaterController")
@Scope("request")
public class OperaterController {

	static Logger log = Logger.getLogger(OperaterController.class);
	@Autowired
	HttpSession httpSession;

	@Autowired
	AuthorityService authorityService;

	@Autowired
	LoginService userService;

	@Autowired
	CommonDao<Object, Long> commonDao;

	@Autowired
	IProjectRegistrationService projectRegistrationService;

	@Autowired
	IAgentRegistrationService<AgentRegistrationModel, Long> agentRegistrationService;

	@Autowired
	IComplaintService<ComplaintModel, Long> complaintService;

	@Autowired
	DashboardService service;

	@Autowired
	ApplicationHistoryService applicationHistoryService;

	@Autowired
	MailService mailService;

	@RequestMapping(value = "operator/dashboard")
	public ModelAndView dashboard(HttpServletRequest request) {
		UserModel um = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
		UserModel user = (UserModel) commonDao.getObject(UserModel.class, um.getUserId());
		ModelAndView mv = new ModelAndView("operator.dashbord");
		List<AgentRegistrationModel> list = authorityService.getPendingAgentRegistration(ReraConstants.PENDING_OPRATOR,
				ReraConstants.INDVISUAL_REG);
		mv.addObject("AGENT_IND_REQUEST", list.size());
		list = authorityService.getPendingAgentRegistration(ReraConstants.PENDING_OPRATOR, ReraConstants.FIRM_COMP_REG);
		mv.addObject("AGENT_FIRM_REQUEST", list.size());
		List<ProjectRegistrationModel> lst = authorityService
				.getPendingProjectRegistration(ReraConstants.PENDING_OPRATOR, ReraConstants.INDVISUAL_REG);
		mv.addObject("PROJECT_IND_REQUEST", lst.size());
		lst = authorityService.getPendingProjectRegistration(ReraConstants.PENDING_OPRATOR,
				ReraConstants.FIRM_COMP_REG);
		mv.addObject("PROJECT_FIRM_REQUEST", lst.size());

		request.setAttribute("barData", service.getBarChartData());
		request.setAttribute("pieData", service.getPieChartData());
		request.setAttribute("lineData", service.getLineChartData());
		return mv;

	}

	@RequestMapping(value = "operator/projectTasklist")
	public ModelAndView projectTasklist(HttpServletRequest request) {
		UserModel um = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
		UserModel user = (UserModel) commonDao.getObject(UserModel.class, um.getUserId());
		ModelAndView mv = new ModelAndView("operator.projectTasklist");
		List<ProjectRegistrationModel> list = authorityService.getPendingProjectRegistration(ReraConstants.PENDING_OPRATOR, user);
		Collections.sort(list, new ComparatorUtil());
		log.info("sortList::::" + list);
		mv.addObject("projectList", list);
		mv.addObject("noOfPendingRequest", list.size());
		return mv;
	}

	@RequestMapping(value = "operator/projectUpdateTasklist")
	public ModelAndView projectUpdateTasklist(HttpServletRequest request) {
		UserModel um = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
		UserModel user = (UserModel) commonDao.getObject(UserModel.class, um.getUserId());
		ModelAndView mv = new ModelAndView("operator.updatedProjectTasklist");
		DetachedCriteria dt = DetachedCriteria.forClass(ProjectRegistrationModel.class, "pr");
		dt.add(Restrictions.eq("pr.updatedFlag", "YES"));
		dt.add(Restrictions.isNull("pr.frozen"));
		if (user.getAuthorityType() != null) {
			dt.createAlias("pr.projectRemarks", "rm");
			if (user.getAuthorityType().equals(ReraConstants.OP_ACCOUNTS_USER)) {
				dt.add(Restrictions.ne("rm.accountsStatus", "OK"));
			} else if (user.getAuthorityType().equals(ReraConstants.OP_REVENUE_USER)) {
				dt.add(Restrictions.ne("rm.revenueStatus", "OK"));
			} else if (user.getAuthorityType().equals(ReraConstants.OP_TCP_USER)) {
				dt.add(Restrictions.ne("rm.tcpStatus", "OK"));
			} else {
				dt.add(Restrictions.ne("rm.enggStatus", "OK"));
			}
		}
		dt.addOrder(Order.asc("applicationNo"));
		List<Object> list = commonDao.getList(dt);
		mv.addObject("projectList", list);
		mv.addObject("noOfPendingRequest", list.size());
		return mv;
	}

	public Integer getPendingAgentTaskList() {
		String str = "Select count(a) from  AgentRegistrationModel a  where (a.status='PENDING_OPERATOR' and DATEDIFF(CURDATE(), createdOn)>5)and(a.operatorRemarks is null and a.updatedFlag is null)";
		//SELECT count(*) FROM reraapp.tt_agent_registration where (STATUS='PENDING_OPERATOR' and DATEDIFF(CURDATE(), CREATED_ON)>5)and (OPERATOR_REMARKS is null and REG_UPDATED is null);
		System.out.println("str >>>"+str);
		Query query = null;
		try {
			query = commonDao.getQuery(str);
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return Integer.parseInt(query.uniqueResult().toString());
	}

	@RequestMapping(value = "operator/agentTasklist")
	public ModelAndView agentTasklist(HttpServletRequest request) {
		UserModel um = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
		UserModel user = (UserModel) commonDao.getObject(UserModel.class, um.getUserId());

		ModelAndView mv = new ModelAndView("operator.agentTasklist");
		List<AgentRegistrationModel> list = authorityService.getNewAgentRegistrationList(ReraConstants.PENDING_OPRATOR);

		/*Date dt1=list.get(1).getCreatedOn().getTime();
		Date dt2 = new Date();
        int diffInDays = (int) ((dt2.getTime() - dt1.getTime()) / (1000 * 60 * 60 * 24));*/

		int countOfPendingAgents=getPendingAgentTaskList();
		//System.out.println(diffInDays);
		mv.addObject("countOfPendingAgents", countOfPendingAgents);
		mv.addObject("agentList", list);
		mv.addObject("noOfPendingRequest", list.size());
		return mv;

	}


	@RequestMapping(value = "operator/complaintTasklist")
	public ModelAndView approveComplaint(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("operator.complaintTasklist");
		List<ComplaintModel> list = null;
		try {
			list = authorityService.getPendingComplaint(ReraConstants.PENDING_OPRATOR);
			mv.addObject("complaintList", list);
			mv.addObject("noOfPendingRequest", list.size());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return mv;
	}

	@RequestMapping(value = "operator/forwardComplaint")
	public ModelAndView forwardComplaint(@RequestParam(value = "COMPLAINT_ID") Long complainttId,
			@RequestParam(value = "ASSIGN_TO") Long assignTo, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("redirect: complaintTasklist");
		try {
			ComplaintModel complaintModel = complaintService.findComplaintById(complainttId);
			UserModel user = userService.getUserById(assignTo);
			complaintModel.setAssignTo(user);
			complaintModel.setStatus(ReraConstants.PENDING_AUTHORITY);
			complaintService.updateComplaint(complaintModel);
			try {
				saveApplicationHistory(user, complaintModel.getApplicationNo(), ReraConstants.FORWARD);

			} catch (Exception e) {
				log.error(e.getMessage(), e);
			}
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return mv;

	}

	@RequestMapping(value = "operator/complaintDetails")
	public ModelAndView complaintDetails(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("operator.approvComplaint");
		try {
			ComplaintModel complaintModel = complaintService
					.findComplaintById(Long.parseLong(request.getParameter("id")));
			mv.addObject("complaintModel", complaintModel);
			mv.addObject("AUTHORITYLIST", userService.getUserListByRole(ReraConstants.AUTHORITY_USER));
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}

		return mv;
	}

	@RequestMapping(value = "operator/projectDetails")
	public ModelAndView projectDetails(@RequestParam(value = "PROJECT_ID") Long projectId) {
		ModelAndView mv = null;
		try {
			UserModel um = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
			UserModel user = (UserModel) commonDao.getObject(UserModel.class, um.getUserId());

			String userType = user.getAuthorityType();

			ProjectRegistrationModel project = projectRegistrationService.getProjectRegByPk(projectId);
			if (project.getRegistrationType().equalsIgnoreCase(ReraConstants.INDVISUAL_REG)) {
				mv = new ModelAndView("operator.projectIndvDetails");
			} else {
				mv = new ModelAndView("operator.projectCompDetails");
			}
			mv.addObject("userList", userService.getUserListByRole(ReraConstants.AUTHORITY_USER));
			mv.addObject("project", project);
			mv.addObject("userType", userType);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return mv;

	}

	@RequestMapping(value = "operator/forwardProjectRegistration")
	public ModelAndView forwardProjectRegistration(@RequestParam(value = "PROJECT_ID") Long projectId,
			@RequestParam(value = "REMARKS") String remarks,
			@RequestParam(value = "isPaymentVerified", required = false) String isPaymentVerified,
			@RequestParam(value = "verificationStatus") String verificationStatus,
			HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("redirect:projectTasklist");
		try {
			UserModel um = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
			UserModel user = (UserModel) commonDao.getObject(UserModel.class, um.getUserId());
			ProjectRegistrationModel project = projectRegistrationService.getProjectRegByPk(projectId);

			if (project.getProjectRemarks() == null) {
				project.setProjectRemarks(new ProjectRemarks());
				ProjectRemarks rm = project.getProjectRemarks();
				rm.setRemarksList(new ArrayList<UserRemarks>());
				rm.getRemarksList().add(new UserRemarks());
			}
			ProjectRemarks rm = project.getProjectRemarks();

			List<UserRemarks> ls = rm.getRemarksList();
			UserRemarks op = new UserRemarks();
			if (ls == null || ls.size() == 0) {
				rm.setRemarksList(new ArrayList<UserRemarks>());
				op.setStatus("NEW");
				rm.getRemarksList().add(op);
			} else {
				op = ls.get(ls.size() - 1);
			}

			if (user.getAuthorityType().equals(ReraConstants.OP_ACCOUNTS_USER)) {

				if ("yes".equalsIgnoreCase(isPaymentVerified)) {
					project.getPaymentDetailsModel().setIsPaymentVerified("YES");
				} else {
					project.getPaymentDetailsModel().setIsPaymentVerified("NO");
				}

				op.setAccountsOprRemarks(remarks);
				rm.setAccountsStatus("OK");
				op.setAccountsUser(user);
				op.setOprAccRemarkDate(Calendar.getInstance());
				rm.setAccountsVerificationStatus(verificationStatus);
			} else if (user.getAuthorityType().equals(ReraConstants.OP_REVENUE_USER)) {
				op.setRevenueOprRemarks(remarks);
				rm.setRevenueStatus("OK");
				op.setRevenueUser(user);
				op.setOprRevRemarkDate(Calendar.getInstance());
				rm.setRevenueVerificationStatus(verificationStatus);
			} else if (user.getAuthorityType().equals(ReraConstants.OP_TCP_USER)) {
				op.setTcpOprRemarks(remarks);
				rm.setTcpStatus("OK");
				op.setTcpUser(user);
				op.setOprTcpRemarkDate(Calendar.getInstance());
				rm.setTcpVerificationStatus(verificationStatus);
			} else {
				op.setEnggOprRemarks(remarks);
				rm.setEnggStatus("OK");
				op.setEnggUser(user);
				op.setOprEnggRemarkDate(Calendar.getInstance());
				rm.setEnggVerificationStatus(verificationStatus);
			}
			if (rm.getAccountsStatus() != null && rm.getRevenueStatus() != null && rm.getTcpStatus() != null
					&& rm.getEnggStatus() != null && rm.getAccountsStatus().equals("OK")
					&& rm.getRevenueStatus().equals("OK") && rm.getTcpStatus().equals("OK")
					&& rm.getEnggStatus().equals("OK")) {
				project.setStatus(ReraConstants.PENDING_AUTHORITY);

			}

			try {
				saveApplicationHistory(user, project, ReraConstants.FORWARD);

			} catch (Exception e) {
				log.error(e.getMessage(), e);
			}

			//alerts
			if(project.getFirstEnquiryDate()==null && project.getSecondEnquiryDate()==null)
				project.setForwardByL0On(Calendar.getInstance());
			else
				project.setForwardByL0UpdatedOn(Calendar.getInstance());

			projectRegistrationService.editProjectRegistration(project);

		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return mv;

	}

	public Integer getPendingUpdatedAgentTaskList() {
		String str = "Select count(a) from  AgentRegistrationModel a  where (a.status='PENDING_OPERATOR' and DATEDIFF(CURDATE(), createdOn)>3) and a.updatedFlag='YES'";
		//SELECT count(*) FROM reraapp.tt_agent_registration where (STATUS='PENDING_OPERATOR' and DATEDIFF(CURDATE(), CREATED_ON)>3) and (REG_UPDATED='YES');
		System.out.println("str >>>"+str);
		Query query = null;
		try {
			query = commonDao.getQuery(str);
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return Integer.parseInt(query.uniqueResult().toString());
	}

	@RequestMapping(value = "operator/agentUpdateTasklist")
	public ModelAndView agentUpdateTasklist(HttpServletRequest request) {
		UserModel um = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
		UserModel user = (UserModel) commonDao.getObject(UserModel.class, um.getUserId());

		ModelAndView mv = new ModelAndView("operator.agentUpdateTasklist");
		DetachedCriteria dt = DetachedCriteria.forClass(AgentRegistrationModel.class);
		dt.add(Restrictions.eq("status", ReraConstants.PENDING_OPRATOR));
		dt.add(Restrictions.eq("updatedFlag", "YES"));
		List<Object> list = commonDao.getList(dt);
		int agentUpdatedPendingCount=getPendingUpdatedAgentTaskList();
		mv.addObject("agentList", list);
		mv.addObject("agentUpdatedPendingCount", agentUpdatedPendingCount);
		mv.addObject("noOfPendingRequest", list.size());
		return mv;

	}

	@RequestMapping(value = "operator/fowardAgentRegistration")
	public ModelAndView forwardAgentRegistrationStaus(@RequestParam(value = "AGENT_ID") Long agentId,
			@RequestParam(value = "REMARKS") String remarks, @RequestParam(value = "DOCS_STATUS") String docStatus,
			@RequestParam(value = "ASSIGN_TO") Long zoneId, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("redirect:agentTasklist");
		try {
			AgentRegistrationModel agent = agentRegistrationService.getAgentRegByPk(agentId);
			agent.setStatus(ReraConstants.PENDING_AUTHORITY);
			agent.setOperatorRemarks(remarks);
			agent.setDocumentStatus(docStatus);
			UserModel um = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
			UserModel user = (UserModel) commonDao.getObject(UserModel.class, um.getUserId());
			UserModel zone = (UserModel) commonDao.getObject(UserModel.class, zoneId);
			agent.setAuthorityUser(zone);
			agent.setOperator(user);
			if(agent.getProjectStatus() != null && agent.getProjectStatus().equals(ReraConstants.RETURN)) {
				agent.setProjectStatus(null);
			}

			try {
				saveApplicationHistory(user, agent, ReraConstants.FORWARD);

			} catch (Exception e) {
				log.error(e.getMessage(), e);
			}
			
			//alerts
			if(agent.getFirstEnquiryDate()==null && agent.getSecondEnquiryDate()==null)
				agent.setForwardByL0On(Calendar.getInstance());
			else
				agent.setForwardByL0UpdatedOn(Calendar.getInstance());

			agentRegistrationService.editAgentRegistration(agent);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return mv;

	}

	@RequestMapping(value = "operator/agentDetails")
	public ModelAndView agentDetails(@RequestParam(value = "AGENT_ID") Long agentId) {
		ModelAndView mv = null;
		new ModelAndView("operator.agentDetails");
		try {// AUTHORITYLIST
			AgentRegistrationModel agent = agentRegistrationService.getAgentRegByPk(agentId);
			if (agent.getRegistrationType().equalsIgnoreCase(ReraConstants.INDVISUAL_REG)) {
				mv = new ModelAndView("operator.agentIndvDetails");
			} else {
				mv = new ModelAndView("operator.agentCompDetails");
			}
			mv.addObject("agent", agent);
			mv.addObject("userList", userService.getUserListByRole(ReraConstants.AUTHORITY_USER));

		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return mv;

	}



	@RequestMapping(value = "operator/viewAllAgents")
	public ModelAndView viewAllAgents(HttpServletRequest request,
			@RequestParam(value = "status", required = false) String status,
			@RequestParam(value = "regNo", required = false) String regNo) {

		UserModel um = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
		UserModel user = (UserModel) commonDao.getObject(UserModel.class, um.getUserId());

		ModelAndView mv = new ModelAndView("operator.allAgentlist");

		List<AgentRegistrationModel> list = authorityService.getViewAllAgents(status, regNo);
		mv.addObject("agentList", list);
		mv.addObject("totalRecords", list.size());
		mv.addObject("authorityType", um.getAuthorityType());
		return mv;

	}



	/*
	 * @RequestMapping(value = "operator/viewAllProjects") public ModelAndView
	 * viewAllProject(HttpServletRequest
	 * request,@RequestParam(value="status",required=false) String status,
	 * 
	 * @RequestParam(value="regNo",required=false) String regNo) { ModelAndView
	 * mv = new ModelAndView("operator.allProjectlist");
	 * List<ProjectRegistrationModel> list = authorityService
	 * .getViewAllProjects(status,regNo); mv.addObject("projectList", list);
	 * mv.addObject("totalRecords", list.size()); return mv;
	 * 
	 * }
	 */

	@RequestMapping(value = "operator/viewAllAgentDetails")
	public ModelAndView viewAllAgentDetails(@RequestParam(value = "AGENT_ID") Long agentId) {
		ModelAndView mv = null;
		new ModelAndView("operator.viewAllAgentDetails");
		try {// AUTHORITYLIST
			AgentRegistrationModel agent = agentRegistrationService.getAgentRegByPk(agentId);
			if (agent.getRegistrationType().equalsIgnoreCase(ReraConstants.INDVISUAL_REG)) {
				mv = new ModelAndView("operator.viewAllAgentIndvDetails");
			} else {
				mv = new ModelAndView("operator.viewAllAgentCompDetails");
			}
			mv.addObject("agent", agent);
			mv.addObject("userList", userService.getUserListByRole(ReraConstants.AUTHORITY_USER));

		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return mv;

	}

	@RequestMapping(value = "operator/viewAllProjectDetails")
	public ModelAndView viewAllProjectDetails(@RequestParam(value = "PROJECT_ID") Long projectId) {
		ModelAndView mv = null;
		try {
			UserModel um = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
			UserModel user = (UserModel) commonDao.getObject(UserModel.class, um.getUserId());

			String userType = user.getAuthorityType();

			ProjectRegistrationModel project = projectRegistrationService.getProjectRegByPk(projectId);
			if (project.getRegistrationType().equalsIgnoreCase(ReraConstants.INDVISUAL_REG)) {
				mv = new ModelAndView("operator.viewAllProjectIndvDetails");
			} else {
				mv = new ModelAndView("operator.viewAllProjectCompDetails");
			}
			mv.addObject("userList", userService.getUserListByRole(ReraConstants.AUTHORITY_USER));
			mv.addObject("project", project);
			mv.addObject("userType", userType);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return mv;

	}


	@RequestMapping(value = "operator/viewAllProjects")
	public ModelAndView viewAllProject(HttpServletRequest request,
			@RequestParam(value = "status", required = false) String status,
			@RequestParam(value = "type", required = false) String type,
			@RequestParam(value = "fromdate", required = false) String fromdate,
			@RequestParam(value = "todate", required = false) String todate) {


		UserModel um = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
		UserModel user = (UserModel) commonDao.getObject(UserModel.class, um.getUserId());


		ModelAndView mv = new ModelAndView("operator.allProjectlist");
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
			//	dt.add(Restrictions.isNull("pr.frozen"));
			List<Object> list = commonDao.getList(dt);
			mv.addObject("projectList", list);
			mv.addObject("noOfPendingRequest", list.size());
			mv.addObject("authorityType", um.getAuthorityType());
		} catch (Exception ex) {
			log.error(ex.getMessage(), ex);
		}
		return mv;

	}

	// Added for return projects

	@RequestMapping(value = "operator/returnProjects")
	public ModelAndView returnProjects(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("operator.returnProjects");

		UserModel um = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
		UserModel user = (UserModel) commonDao.getObject(UserModel.class, um.getUserId());

		List<ProjectRegistrationModel> list = authorityService.getReturnedProjects(ReraConstants.PENDING_OPRATOR, user);
		mv.addObject("projectList", list);
		mv.addObject("noOfPendingRequest", list.size());
		return mv;
	}

	@RequestMapping(value = "operator/viewPendingEnquiry")
	public ModelAndView viewPendingEnquiry(HttpServletRequest request) {

		ModelAndView mv = new ModelAndView("operator.viewPendingEnquiry");
		UserModel um = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
		List<ProjectRegistrationModel> enquiryList = authorityService.getProjectsUnderEnquiryForOperator(um);

		mv.addObject("enquiryList", enquiryList);
		mv.addObject("noOfPendingRequest", enquiryList.size());
		return mv;

	}

	// end for return projects

	@RequestMapping(value = "operator/projectExtTasklist")
	public ModelAndView projectExtTasklist(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("operator.projectExtTasklist");
		List<Object> list = authorityService.getPendingProjectExtReg(ReraConstants.PENDING_OPRATOR);
		mv.addObject("projectExtList", list);
		mv.addObject("noOfPendingRequest", list.size());
		return mv;

	}

	@RequestMapping(value = "operator/projectExtDetails")
	public ModelAndView projectExtDetails(@RequestParam(value = "PROJECT_ID") Long projectId) {
		ModelAndView mv = null;
		try {
			ProjectRegExtensionModel project = (ProjectRegExtensionModel) commonDao
					.getObject(ProjectRegExtensionModel.class, projectId);
			if (project.getRegistrationType() == null) {
				project.setRegistrationType(project.getProjectRegistration().getRegistrationType());
			}
			if (project.getRegistrationType().equalsIgnoreCase(ReraConstants.INDVISUAL_REG)) {
				mv = new ModelAndView("operator.projectExtIndvDetails");
			} else {
				mv = new ModelAndView("operator.projectExtCompDetails");
			}
			mv.addObject("AUTHORITYLIST", userService.getUserListByRole(ReraConstants.AUTHORITY_USER));
			mv.addObject("projectExt", project);
			mv.addObject("project", project.getProjectRegistration());

		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return mv;
	}

	@RequestMapping(value = "operator/forwardProjectExtRegistration")
	public ModelAndView forwardProjectExtRegistration(@RequestParam(value = "PROJECT_ID") Long projectId,
			@RequestParam(value = "ASSIGN_TO") Long assignTo, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("redirect:projectTasklist");
		try {
			ProjectRegExtensionModel project = (ProjectRegExtensionModel) commonDao
					.getObject(ProjectRegExtensionModel.class, projectId);
			project.setStatus(ReraConstants.PENDING_AUTHORITY);

			try {
				UserModel um = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
				UserModel usr = (UserModel) commonDao.getObject(UserModel.class, um.getUserId());
				saveApplicationHistory(usr, project, ReraConstants.FORWARD);

			} catch (Exception e) {
				log.error(e.getMessage(), e);
			}

			UserModel user = userService.getUserById(assignTo);
			project.setAssignTo(user);
			commonDao.updateObject(project);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return mv;
	}

	@RequestMapping(value = "operator/agentRenewalTasklist")
	public ModelAndView agentRenwalTasklist(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("operator.agentRenwalTasklist");
		List<Object> list = authorityService.getPendingAgentRegRenewal(ReraConstants.PENDING_OPRATOR);
		//int pendingRenewalAgentsCount=getPendingRenewalAgentTaskList();
		mv.addObject("agentRenwalList", list);
		//mv.addObject("pendingRenewalAgentsCount", pendingRenewalAgentsCount);
		mv.addObject("noOfPendingRequest", list.size());
		return mv;
	}

	@RequestMapping(value = "operator/agentRenewalDetails")
	public ModelAndView agentRenewalDetails(@RequestParam(value = "AGENTREQ_ID") Long agentId) {
		ModelAndView mv = null;
		new ModelAndView("operator.agentReqIndvDetails");
		try {// AUTHORITYLIST
			AgentRegRenewalModel agent = (AgentRegRenewalModel) commonDao.getObject(AgentRegRenewalModel.class,
					agentId);
			if (agent.getAgentRegistration().getRegistrationType().equalsIgnoreCase(ReraConstants.INDVISUAL_REG)) {
				mv = new ModelAndView("operator.agentReqIndvDetails");
			} else {
				mv = new ModelAndView("operator.agentReqCompDetails");
			}
			mv.addObject("agentReq", agent);
			mv.addObject("agent", agent.getAgentRegistration());
			mv.addObject("AUTHORITYLIST", userService.getUserListByRole(ReraConstants.AUTHORITY_USER));

		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return mv;
	}

	@RequestMapping(value = "operator/fowardAgentRegRenwal")
	public ModelAndView fowardAgentRegRenwal(@RequestParam(value = "AGENT_ID") Long agentId,
			@RequestParam(value = "ASSIGN_TO") Long assignTo, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("redirect:agentRenewalTasklist");
		try {
			AgentRegRenewalModel agent = (AgentRegRenewalModel) commonDao.getObject(AgentRegRenewalModel.class,
					agentId);
			agent.setStatus(ReraConstants.PENDING_AUTHORITY);

			try {
				UserModel um = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
				UserModel usr = (UserModel) commonDao.getObject(UserModel.class, um.getUserId());
				saveApplicationHistory(usr, agent, ReraConstants.FORWARD);

			} catch (Exception e) {
				log.error(e.getMessage(), e);
			}

			UserModel user = userService.getUserById(assignTo);
			agent.setAssignTo(user);
			commonDao.updateObject(agent);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return mv;
	}

	@RequestMapping(value = "operator/changePasswordForm")
	public ModelAndView changePasswordForm() {
		ModelAndView mv = null;
		try {
			UserModel um = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
			UserModel usr = (UserModel) commonDao.getObject(UserModel.class, um.getUserId());
			saveApplicationHistory(usr, "", ReraConstants.CHANGE_PASSWORD);

		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}

		mv = new ModelAndView("operator.changePassword");
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

	@RequestMapping(value = "operator/enqApprovedTasklist")
	public ModelAndView enqApprovedTasklist(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("operator.enqApprovedProjectTasklist");
		List<ProjectRegistrationModel> list = authorityService.getApprovedProjectsUnderEnquiryForAuthority();
		mv.addObject("projectEnqApprovedList", list);
		mv.addObject("totalRecords", list.size());
		return mv;
	}

	@RequestMapping(value = "operator/saveUploadProjectDoc", method = RequestMethod.POST)
	public ModelAndView saveUploadProjectDoc(
			@RequestParam(value = "projectPhotoFile", required = false) MultipartFile[] projectPhotoFile,
			@RequestParam("otherFileDoc") MultipartFile[] otherFileDoc,
			@RequestParam("fieldName") String[] fieldNameArr, @RequestParam("projectId") Long pId,
			HttpServletRequest request) {

		Long prjId = (Long) httpSession.getAttribute("projectId");
		ModelAndView mv = null;
		if (!FileSecurity.checkFileSize(fieldNameArr, otherFileDoc)) {
			return new ModelAndView("incorrectFileType");
		}
		if (!FileSecurity.checkFileSize(projectPhotoFile)) {
			return new ModelAndView("incorrectFileType");
		}

		try {
			ProjectRegistrationModel baseModel = projectRegistrationService.getProjectRegByPk(prjId);

			ProjectRegistrationModel savedProject = projectRegistrationService.saveOrUpdateProjectPhotoDoc(
					projectPhotoFile, otherFileDoc, fieldNameArr, baseModel,
					Integer.parseInt(request.getParameter("flg")),
					Long.parseLong(request.getParameter("projectDocModel.docId")));

			UserModel um = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
			UserModel user = (UserModel) commonDao.getObject(UserModel.class, um.getUserId());

			projectRegistrationService.editProjectRegistration(savedProject);

			EnquiryModel enq = new EnquiryModel();
			enq.setSubject("RERA Karnataka Project Rejection Notice");
			enq.setCreatedOn(Calendar.getInstance());
			enq.setEnquiryText(
					"Dear Sir/Madam,\n \nPlease download your project rejection order copy by clicking on below url\n "
							+ "http://rera.karnataka.gov.in/download?DOC_ID="
							+ savedProject.getProjectAddDocModel().getRejectReasonDoc().getDocumentId()
							+ "\n\nRegards,\nRERA Karnataka Team");
			System.out.println("Test >> Dear Sir/Madam,\n \nPlease download your project rejection order copy by clicking on below url\n "
					+ "http://rera.karnataka.gov.in/download?DOC_ID="
					+ savedProject.getProjectAddDocModel().getRejectReasonDoc().getDocumentId()
					+ "\n\nRegards,\nRERA Karnataka Team");
			enq.setRaisedBy(user);

			enq.setEmailId(baseModel.getPromoterDetailsModel().getEmailId());

			mailService.sendMail(enq);
			try {
				saveApplicationHistory(user, savedProject.getApplicationNo(), ReraConstants.REJECT_ORDER_COPY_UPLOAD);

			} catch (Exception e) {
				log.error(e.getMessage(), e);
			}
			mv = new ModelAndView("operator.confirmationPage");

		} catch (Exception ex) {
			log.error(ex.getMessage(), ex);
		}
		return mv;

	}

	@RequestMapping(value = "operator/rejectReasonDocForm")
	public ModelAndView rejectReasonDocForm(@RequestParam(value = "PROJECT_ID") Long projectId,
			HttpServletRequest request) {
		ModelAndView mv = null;
		try {

			request.setAttribute("projectId", projectId);

			ProjectRegistrationModel project = projectRegistrationService.getProjectRegByPk(projectId);

			httpSession.setAttribute("projectId", projectId);

			mv = new ModelAndView("operator.rejectReasonDocForm");
			mv.addObject("projectId", project.getApplicationNo());
			mv.addObject("projectName", project.getProjectDetailsModel().getProjectName());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return mv;

	}

	@RequestMapping(value = "operator/confirmationPage")
	public ModelAndView confirmationPage() {

		Long prjId = (Long) httpSession.getAttribute("projectId");

		ModelAndView mv = new ModelAndView("operator.confirmationPage");
		mv.addObject("prjId", prjId);
		return mv;

	}


	// Added for return projects for agent
	public Integer getPendingReturnedAgentTaskList() {
		String str = "Select count(a) from  AgentRegRenewalModel a  where a.status='RETURN' and a.projectStatus='PENDING_OPERATOR' and DATEDIFF(CURDATE(), createdOn)>2";
		//SELECT count(*) FROM reraapp.tt_agent_reg_renew_model where STATUS='PENDING_OPERATOR' and DATEDIFF(CURDATE(), CREATED_ON)>2;
		System.out.println("str >>>"+str);
		Query query = null;
		try {
			query = commonDao.getQuery(str);
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return Integer.parseInt(query.uniqueResult().toString());
	}

	@RequestMapping(value = "operator/returnedAgentProjects")
	public ModelAndView returnageProjects(HttpServletRequest request) {

		ModelAndView mv = new ModelAndView("operator.returnedAgentProjects");
		//int pendingReturnedAgentsCount=getPendingReturnedAgentTaskList();
		//mv.addObject("pendingReturnedAgentsCount", pendingReturnedAgentsCount);
		UserModel um = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
		UserModel user = (UserModel) commonDao.getObject(UserModel.class, um.getUserId());
		List<AgentRegistrationModel> list = agentRegistrationService.returnedAgentProjects(ReraConstants.PENDING_OPRATOR, user);
		mv.addObject("agentList", list);
		mv.addObject("noOfPendingRequest", list.size());
		return mv;
	}

	// unregproject list
	@RequestMapping(value = "operator/viewAllunregProjects")
	public ModelAndView viewAllProjects(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("operator.viewAllunregProject");
		List<UnregisteredProjectDetail> list = authorityService.getViewAllunregProjects();
		mv.addObject("projectList", list);
		return mv;
	}
	
	@RequestMapping(value = "operator/viewAllunRegApprovedProject")
	public ModelAndView viewAllunRegApprovedProject(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("operator.viewAllunregProject");
		List<UnregisteredProjectDetail> list = authorityService.getViewAllApprovedunregProjects("PENDING_AEE");
		mv.addObject("projectList", list);
		return mv;
	}
	
	@RequestMapping(value = "operator/unregisteredProjectDetails")
	public ModelAndView unregisteredProjectDetails(HttpServletRequest request, @RequestParam("pkId") Long unregProjectDetailsId) {
		ModelAndView mv = new ModelAndView("unReg.unregisteredProjectDetails");
		
		UnregisteredProjectDetail project = (UnregisteredProjectDetail)commonDao.getObject(UnregisteredProjectDetail.class,unregProjectDetailsId);

		mv.addObject("project", project);
		
		return mv;

	}
}
