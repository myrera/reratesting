package in.gov.rera.admin.service.inpl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import in.gov.rera.admin.service.AuthorityService;
import in.gov.rera.common.dao.impl.CommonDao;
import in.gov.rera.common.model.UserModel;
import in.gov.rera.common.util.ReraConstants;
import in.gov.rera.transaction.agentregistration.dao.IAgentRegistrationDAO;
import in.gov.rera.transaction.agentregistration.model.AgentRegRenewalModel;
import in.gov.rera.transaction.agentregistration.model.AgentRegistrationModel;
import in.gov.rera.transaction.complaint.dao.IComplaintDAO;
import in.gov.rera.transaction.complaint.model.ComplaintModel;
import in.gov.rera.transaction.projectregistration.dao.IProjectRegistrationDAO;
import in.gov.rera.transaction.projectregistration.model.ProjectRegExtensionModel;
import in.gov.rera.transaction.projectregistration.model.ProjectRegistrationModel;
import in.gov.rera.transaction.unregistered.dao.IUnRegProjectDAO;
import in.gov.rera.transaction.unregistered.model.UnregisteredProjectDetail;

@Service(value = "authorityService")
public class AuthorityServiceImpl implements AuthorityService {
	static Logger log = Logger.getLogger(AuthorityServiceImpl.class);
	@Autowired
	IProjectRegistrationDAO<ProjectRegistrationModel, Long> projectRegistrationDAO;

	@Autowired
	IAgentRegistrationDAO<AgentRegistrationModel, Long> agentRegistrationDAO;

	@Autowired
	IComplaintDAO<ComplaintModel, Long> complaintDAO;
	
	@Autowired
	IUnRegProjectDAO<UnregisteredProjectDetail, Long> unRegDAO;

	@Override
	public List<UnregisteredProjectDetail> getViewAllunregProjects() {
		DetachedCriteria dt = DetachedCriteria.forClass(UnregisteredProjectDetail.class);
		return unRegDAO.getunregProjectList(dt);
	}
	
	@Override
	public List<UnregisteredProjectDetail> getViewAllApprovedunregProjects(String status) {
		DetachedCriteria dt = DetachedCriteria.forClass(UnregisteredProjectDetail.class,"upr");
		dt.add(Restrictions.eq("upr.status", status));
		return unRegDAO.getunregProjectList(dt);
	}
	
	@Override
	public List<ProjectRegistrationModel> getPendingProjectRegistration(String status) {
		DetachedCriteria dt = DetachedCriteria.forClass(ProjectRegistrationModel.class);
		dt.add(Restrictions.eq("status", status));
		dt.addOrder(Order.asc("applicationNo"));
		return projectRegistrationDAO.getProjectList(dt);
	}

	@Override
	public List<ProjectRegistrationModel> getUnderProcessReturnedProjects() {
		DetachedCriteria dt = DetachedCriteria.forClass(ProjectRegistrationModel.class, "pr");
		dt.createAlias("pr.projectRemarks", "rm");
		dt.add(Restrictions.ne("pr.status", ReraConstants.REVOKED));
		dt.add(Restrictions.ne("pr.status", ReraConstants.SAVE_AS_DRAFT));
		dt.createAlias("rm.remarksList", "urm");
		dt.createAlias("pr.promoterDetailsModel", "pm");

		Criterion condition = Restrictions
				.and(Restrictions.and(Restrictions.eq("pr.status", ReraConstants.PENDING_OPRATOR),
						Restrictions.isNotNull("urm.authorityUser")), Restrictions.eq("urm.status", "CLOSE"));

		dt.add(condition);

		dt.addOrder(Order.asc("pm.promoterName"));
		return projectRegistrationDAO.getProjectList(dt);
	}

	@Override
	public List<ProjectRegistrationModel> getProjectsUnderWork() {

		DetachedCriteria dt = DetachedCriteria.forClass(ProjectRegistrationModel.class, "pr");

		dt.createAlias("pr.projectRemarks", "rm");
		dt.add(Restrictions.ne("pr.status", ReraConstants.REVOKED));
		dt.add(Restrictions.ne("pr.status", ReraConstants.SAVE_AS_DRAFT));

		Criterion or1 = Restrictions.or(Restrictions.eq("rm.accountsStatus", "OK"),
				Restrictions.eq("rm.revenueStatus", "OK"));
		Criterion or2 = Restrictions.or(Restrictions.eq("rm.tcpStatus", "OK"), Restrictions.eq("rm.enggStatus", "OK"));
		dt.add(Restrictions.or(or1, or2));

		return projectRegistrationDAO.getProjectList(dt);
	}

	@Override
	public List<ProjectRegistrationModel> getProjectsUnderEnquiry() {

		String flag = null;

		DetachedCriteria dt = DetachedCriteria.forClass(

				ProjectRegistrationModel.class, "pr");
		dt.createAlias("pr.enquiryList", "eq");
		dt.add(Restrictions.isNull("pr.updatedFlag"));
		dt.add(Restrictions.isNotNull("pr.enquiryList"));

		dt.add(Restrictions.ne("pr.status", ReraConstants.APPROVED));
		dt.add(Restrictions.ne("pr.status", ReraConstants.REVOKED));
		dt.add(Restrictions.ne("pr.status", ReraConstants.SAVE_AS_DRAFT));

		return projectRegistrationDAO.getProjectList(dt);
	}

	@Override
	public List<ProjectRegistrationModel> getProjectsUnderEnquiryForAuthority() {

		String flag = null;

		DetachedCriteria dt = DetachedCriteria.forClass(ProjectRegistrationModel.class, "pr");
		dt.createAlias("pr.enquiryList", "eq");
		dt.add(Restrictions.isNotNull("pr.enquiryList"));
		dt.add(Restrictions.ne("pr.status", ReraConstants.APPROVED));
		dt.add(Restrictions.ne("pr.status", ReraConstants.REVOKED));
		dt.add(Restrictions.ne("pr.status", ReraConstants.SAVE_AS_DRAFT));

		return projectRegistrationDAO.getProjectList(dt);
	}

	@Override
	public List<ProjectRegistrationModel> getApprovedProjectsUnderEnquiryForAuthority() {

		String flag = null;

		DetachedCriteria dt = DetachedCriteria.forClass(ProjectRegistrationModel.class, "pr");
		dt.createAlias("pr.enquiryList", "eq");
		dt.add(Restrictions.isNotNull("pr.enquiryList"));
		dt.add(Restrictions.eq("pr.status", ReraConstants.APPROVED));
		dt.add(Restrictions.isNull("pr.clarificationAccepted"));
		dt.add(Restrictions.geProperty("eq.createdOn", "pr.approvedOn"));

		return projectRegistrationDAO.getProjectList(dt);
	}

	@Override
	public List<ProjectRegistrationModel> getProjectsUnderEnquiryForOperator(UserModel user) {

		DetachedCriteria dt = DetachedCriteria.forClass(

				ProjectRegistrationModel.class, "pr");
		dt.createAlias("pr.enquiryList", "eq");
		dt.createAlias("pr.projectRemarks", "rm");
		dt.add(Restrictions.isNotNull("enquiryList"));
		dt.add(Restrictions.eq("pr.status", ReraConstants.PENDING_OPRATOR));
		dt.add(Restrictions.isNull("pr.frozen"));
		if (user.getAuthorityType() != null) {
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
		return projectRegistrationDAO.getProjectList(dt);
	}

	@Override
	public List<ProjectRegistrationModel> getPendingProjectRegistrationForAuthority(String status, UserModel user) {

		DetachedCriteria dt = DetachedCriteria.forClass(ProjectRegistrationModel.class, "pr");
		dt.add(Restrictions.eq("status", status));
		dt.addOrder(Order.asc("applicationNo"));
		dt.createAlias("pr.projectRemarks", "rm");
		dt.add(Restrictions.ne("pr.status", ReraConstants.REVOKED));
		dt.add(Restrictions.ne("pr.status", ReraConstants.SAVE_AS_DRAFT));

		List<ProjectRegistrationModel> returnedList = returnProjectsToAuthority(status, user);

		if (returnedList != null && returnedList.size() != 0) {
			List<Long> projectIds = new ArrayList<Long>();
			for (ProjectRegistrationModel projectRegistrationModel : returnedList) {
				projectIds.add(projectRegistrationModel.getProjectRegId());
			}
			dt.add(Restrictions.not(Restrictions.in("pr.id", projectIds)));
		}

		if (user.getUserType().equalsIgnoreCase(ReraConstants.AUTHORITY_USER)) {

			dt.add(Restrictions.eq("rm.accountsStatus", "OK"));

			dt.add(Restrictions.eq("rm.revenueStatus", "OK"));

			dt.add(Restrictions.eq("rm.tcpStatus", "OK"));

			dt.add(Restrictions.eq("rm.enggStatus", "OK"));

		}
		List<ProjectRegistrationModel> list = projectRegistrationDAO.getProjectList(dt);
		list.removeAll(returnProjectsByAuthority(status, user));
		return list;
	}

	private DetachedCriteria getProjectRegCriteria(String status, UserModel user) {
		DetachedCriteria dt = DetachedCriteria.forClass(ProjectRegistrationModel.class, "pr");
		dt.add(Restrictions.eq("pr.status", status));

		List<ProjectRegistrationModel> returnedProjectList = getReturnedProjects(status, user);

		if (user.getUserType().equalsIgnoreCase(ReraConstants.OPERATOR_USER)) {
			if (user.getAuthorityType() != null) {
				dt.createAlias("pr.projectRemarks", "rm");

				if (returnedProjectList != null && returnedProjectList.size() != 0) {
					List<Long> projectIds = new ArrayList<Long>();
					for (ProjectRegistrationModel projectRegistrationModel : returnedProjectList) {
						projectIds.add(projectRegistrationModel.getProjectRegId());
					}
					dt.add(Restrictions.not(Restrictions.in("pr.id", projectIds)));
				}

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
			dt.add(Restrictions.isNull("pr.frozen"));
		} else {
			dt.add(Restrictions.eq("pr.zone.zoneId", user.getZone().getZoneId()));
		}
		dt.addOrder(Order.asc("applicationNo"));


		return dt;
	}

	private DetachedCriteria getReturnedProjectRegCriteriaForAuthority(String status, UserModel user) {
		DetachedCriteria dt = DetachedCriteria.forClass(ProjectRegistrationModel.class, "pr");
		dt.add(Restrictions.eq("pr.status", status));

		if (user.getUserType().equalsIgnoreCase(ReraConstants.AUTHORITY_USER)) {

			dt.add(Restrictions.eq("rm.accountsStatus", "OK"));

			dt.add(Restrictions.eq("rm.revenueStatus", "OK"));

			dt.add(Restrictions.eq("rm.tcpStatus", "OK"));

			dt.add(Restrictions.eq("rm.enggStatus", "OK"));

			dt.createAlias("pr.projectRemarks", "rm");
			dt.createAlias("rm.remarksList", "urm");

			dt.add(Restrictions.isNotNull("urm.authorityUser"));
			// dt.add(Restrictions.eq("urm.status", "NEW"));

		}
		dt.addOrder(Order.asc("applicationNo"));

		return dt;
	}

	private DetachedCriteria getReturnedProjectRegCriteria(String status, UserModel user) {
		DetachedCriteria dt = DetachedCriteria.forClass(ProjectRegistrationModel.class, "pr");
		dt.add(Restrictions.eq("pr.status", status));

		if (user.getUserType().equalsIgnoreCase(ReraConstants.OPERATOR_USER)) {
			if (user.getAuthorityType() != null) {
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

		}
		dt.add(Restrictions.isNull("pr.frozen"));
		dt.createAlias("pr.projectRemarks", "rm");
		dt.createAlias("rm.remarksList", "urm");

		dt.add(Restrictions.isNotNull("urm.authorityUser"));
		dt.add(Restrictions.eq("urm.status", "CLOSE"));
		dt.addOrder(Order.asc("applicationNo"));

		return dt;
	}

	@Override
	public List<ProjectRegistrationModel> getPendingProjectRegistration(String status, UserModel user) {
		DetachedCriteria dt = getProjectRegCriteria(status, user);
		return projectRegistrationDAO.getProjectList(dt);
	}

	//alerts started

	@Override
	public List<ProjectRegistrationModel> getPendingAlertsProjectNewRegistration(String status, String type) {
		DetachedCriteria dt = getAlertsProjectNewRegCriteria(status, type);
		return projectRegistrationDAO.getProjectList(dt);
	}

	private DetachedCriteria getAlertsProjectNewRegCriteria(String status, String type) {
		DetachedCriteria dt = DetachedCriteria.forClass(ProjectRegistrationModel.class, "pr");
		dt.add(Restrictions.eq("pr.status", status));

		List<ProjectRegistrationModel> returnedProjectList = getAlertsReturnedProjects(status, type);

		dt.createAlias("pr.projectRemarks", "rm");

		if (returnedProjectList != null && returnedProjectList.size() != 0) {
			List<Long> projectIds = new ArrayList<Long>();
			for (ProjectRegistrationModel projectRegistrationModel : returnedProjectList) {
				projectIds.add(projectRegistrationModel.getProjectRegId());
			}
			dt.add(Restrictions.not(Restrictions.in("pr.id", projectIds)));
		}

		if (type.equals(ReraConstants.OP_ACCOUNTS_USER)) {
			dt.add(Restrictions.ne("rm.accountsStatus", "OK"));
		} else if (type.equals(ReraConstants.OP_REVENUE_USER)) {
			dt.add(Restrictions.ne("rm.revenueStatus", "OK"));
		} else if (type.equals(ReraConstants.OP_TCP_USER)) {
			dt.add(Restrictions.ne("rm.tcpStatus", "OK"));
		} else {
			dt.add(Restrictions.ne("rm.enggStatus", "OK"));
		}
		dt.add(Restrictions.isNull("pr.frozen"));

		dt.addOrder(Order.asc("applicationNo"));
		return dt;
	}

	@Override
	public List<AgentRegistrationModel> returnedAgentProjects(String pendingOprator) {
		DetachedCriteria dt = DetachedCriteria.forClass(AgentRegistrationModel.class);
		dt.add(Restrictions.eq("projectStatus", ReraConstants.RETURN));
		dt.add(Restrictions.eq("status", pendingOprator));
		dt.add(Restrictions.isNotNull("operatorRemarks"));

		dt.addOrder(Order.asc("applicationNo"));
		return agentRegistrationDAO.getAgentList(dt);
	}
	
	@Override
	public List<ProjectRegistrationModel> getAlertsReturnedProjects(String status, String type) {
		DetachedCriteria dt = getAlertsReturnedProjectRegCriteria(status, type);
		return projectRegistrationDAO.getProjectList(dt);
	}

	private DetachedCriteria getAlertsReturnedProjectRegCriteria(String status, String type) {
		DetachedCriteria dt = DetachedCriteria.forClass(ProjectRegistrationModel.class, "pr");
		dt.add(Restrictions.eq("pr.status", status));

		if (type.equals(ReraConstants.OP_ACCOUNTS_USER)) {
			dt.add(Restrictions.ne("rm.accountsStatus", "OK"));
		} else if (type.equals(ReraConstants.OP_REVENUE_USER)) {
			dt.add(Restrictions.ne("rm.revenueStatus", "OK"));
		} else if (type.equals(ReraConstants.OP_TCP_USER)) {
			dt.add(Restrictions.ne("rm.tcpStatus", "OK"));
		} else {
			dt.add(Restrictions.ne("rm.enggStatus", "OK"));
		}

		dt.add(Restrictions.isNull("pr.frozen"));
		dt.createAlias("pr.projectRemarks", "rm");
		dt.createAlias("rm.remarksList", "urm");

		dt.add(Restrictions.isNotNull("urm.authorityUser"));
		dt.add(Restrictions.eq("urm.status", "CLOSE"));
		dt.addOrder(Order.asc("applicationNo"));

		return dt;
	}

	//alerts end

	@Override
	public int getPendingProjectRegistrationCount(String status, UserModel user) {
		DetachedCriteria dt = getProjectRegCountCriteria(status, user);
		return projectRegistrationDAO.getProjectList(dt).size();
	}

	private DetachedCriteria getProjectRegCountCriteria(String status, UserModel user) {
		DetachedCriteria dt = DetachedCriteria.forClass(ProjectRegistrationModel.class, "pr");
		dt.add(Restrictions.eq("pr.status", status));

		List<ProjectRegistrationModel> returnedProjectList = getReturnedProjects(status, user);

		if (user.getUserType().equalsIgnoreCase(ReraConstants.OPERATOR_USER)) {
			if (user.getAuthorityType() != null) {
				dt.createAlias("pr.projectRemarks", "rm");

				if (returnedProjectList != null && returnedProjectList.size() != 0) {
					List<Long> projectIds = new ArrayList<Long>();
					for (ProjectRegistrationModel projectRegistrationModel : returnedProjectList) {
						projectIds.add(projectRegistrationModel.getProjectRegId());
					}
					dt.add(Restrictions.not(Restrictions.in("pr.id", projectIds)));
				}

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
			dt.add(Restrictions.isNull("pr.frozen"));
		} else {
			dt.add(Restrictions.eq("pr.zone.zoneId", user.getZone().getZoneId()));
		}
		//dt.add(Restrictions.sqlRestriction("and DATEDIFF(CURDATE(), createdOn)>5"));
		//dt.createAlias("pr.createdOn", "created");
		/*String sDate1="15/06/2018";  
		Date date1=null;
	    try {
			date1=new SimpleDateFormat("dd/MM/yyyy").parse(sDate1);
		} catch (ParseException e) {
			e.printStackTrace();
		} */
		//Criterion diffdate =Restrictions.between("diffDate", date1, new Date());
		//dt.add(Restrictions.ge("diffdate", 5));
		//System.out.println("diffdate >>"+diffdate);
		//dt.addOrder(Order.asc("applicationNo"));
		return dt;
	}

	private DetachedCriteria getProjectRegCriteria(String status, String type, UserModel user) {
		DetachedCriteria dt = DetachedCriteria.forClass(ProjectRegistrationModel.class, "pr");
		dt.add(Restrictions.eq("pr.status", status));
		dt.add(Restrictions.eq("pr.registrationType", type));

		if (user.getUserType().equalsIgnoreCase(ReraConstants.OPERATOR_USER)) {
			dt.createAlias("pr.projectDetailsModel", "aaa");
			if (user.getAuthorityType().equals("AUDA")) {

				dt.add(Restrictions.eq("aaa.approvingAuthority", "AUDA"));
			} else if (user.getAuthorityType().equals("SUDA")) {

				dt.add(Restrictions.eq("aaa.approvingAuthority", "SUDA"));
			} else {
				dt.add(Restrictions.eq("aaa.approvingAuthority", "Others"));
				dt.add(Restrictions.eq("aaa.districtModel.districtId", user.getDistrict().getDistrictId()));
			}
		} else {
			dt.add(Restrictions.eq("pr.zone.zoneId", user.getZone().getZoneId()));
		}
		return dt;
	}

	@Override
	public List<ProjectRegistrationModel> getPendingProjectRegistration(String status, String type, UserModel user) {
		DetachedCriteria dt = getProjectRegCriteria(status, type, user);

		return projectRegistrationDAO.getProjectList(dt);
	}

	@Override
	public List<ProjectRegistrationModel> getPendingProjectRegistration(String status, Long userId) {
		DetachedCriteria dt = DetachedCriteria.forClass(ProjectRegistrationModel.class);
		dt.add(Restrictions.eq("status", status));
		dt.add(Restrictions.eq("authorityUser.userId", userId));
		dt.addOrder(Order.asc("applicationNo"));
		return projectRegistrationDAO.getProjectList(dt);
	}

	@Override
	public List<ProjectRegistrationModel> getPendingProjectRegistration(String status, String type) {
		DetachedCriteria dt = DetachedCriteria.forClass(ProjectRegistrationModel.class);
		dt.add(Restrictions.eq("status", status));
		dt.add(Restrictions.eq("registrationType", type));

		return projectRegistrationDAO.getProjectList(dt);
	}

	@Override
	public List<ProjectRegistrationModel> getViewAllProjects() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ProjectRegistrationModel> getViewAllProjects(String status, String regNo) {
		DetachedCriteria dt = DetachedCriteria.forClass(ProjectRegistrationModel.class);
		dt.add(Restrictions.ne("status", ReraConstants.SAVE_AS_DRAFT));
		dt.add(Restrictions.ne("status", ReraConstants.REVOKED));
		dt.addOrder(Order.asc("applicationNo"));
		return projectRegistrationDAO.getProjectList(dt);
	}

	@Override
	public List<ProjectRegistrationModel> returnProjectsByAuthority(String status, UserModel user) {
		DetachedCriteria dt = getReturnedProjectRegCriteriaForChairman(status, user);

		return projectRegistrationDAO.getProjectList(dt);

	}

	private DetachedCriteria getReturnedProjectRegCriteriaForChairman(String status, UserModel user) {
		DetachedCriteria dt = DetachedCriteria.forClass(ProjectRegistrationModel.class, "pr");
		dt.add(Restrictions.eq("pr.status", status));

		dt.createAlias("pr.projectRemarks", "rm");
		dt.createAlias("rm.remarksList", "urm");

		dt.add(Restrictions.isNotNull("urm.superUser"));
		dt.addOrder(Order.asc("applicationNo"));

		return dt;
	}

	private DetachedCriteria getReturnedProjectToL0(String status, UserModel user) {
		DetachedCriteria dt = DetachedCriteria.forClass(ProjectRegistrationModel.class, "pr");
		dt.add(Restrictions.eq("pr.status", status));

		dt.createAlias("pr.projectRemarks", "rm");
		dt.createAlias("rm.remarksList", "urm");

		dt.add(Restrictions.isNotNull("urm.authorityUser"));
		/*
		 * dt.add(Restrictions.or(Restrictions.isNotNull("urm.revenueOprRemarks"
		 * ),Restrictions.isNotNull("urm.accountsOprRemarks")));
		 * dt.add(Restrictions.or(Restrictions.isNotNull("urm.tcpOprRemarks"),
		 * Restrictions.isNotNull("urm.enggOprRemarks")));
		 */

		Criterion or1 = Restrictions.or(Restrictions.isNotNull("urm.revenueOprRemarks"),
				Restrictions.isNotNull("urm.accountsOprRemarks"));

		Criterion or2 = Restrictions.or(Restrictions.isNotNull("urm.tcpOprRemarks"),
				Restrictions.isNotNull("urm.enggOprRemarks"));

		dt.add(Restrictions.or(or1, or2));

		dt.addOrder(Order.asc("applicationNo"));
		dt.add(Restrictions.isNull("pr.frozen"));

		return dt;
	}

	@Override
	public List<AgentRegistrationModel> getPendingAgentRegistration(String status, String type) {
		DetachedCriteria dt = DetachedCriteria.forClass(AgentRegistrationModel.class);
		dt.add(Restrictions.eq("status", status));
		dt.add(Restrictions.eq("registrationType", type));

		return agentRegistrationDAO.getAgentList(dt);
	}

	@Override
	public List<AgentRegistrationModel> getPendingAgentRegistration(String status, UserModel user) {
		DetachedCriteria dt = getDetachedCriteriaForAgent(status, user);
		return agentRegistrationDAO.getAgentList(dt);
	}

	private DetachedCriteria getDetachedCriteriaForAgent(String status, UserModel user) {
		DetachedCriteria dt = DetachedCriteria.forClass(AgentRegistrationModel.class);
		dt.add(Restrictions.eq("status", status));
		if (user.getUserType().equalsIgnoreCase(ReraConstants.OPERATOR_USER)) {
			if (user.getAuthorityType().equals("AUDA")) {
				dt.add(Restrictions.eq("approvingAuthority", "AUDA"));
			} else if (user.getAuthorityType().equals("SUDA")) {
				dt.add(Restrictions.eq("approvingAuthority", "SUDA"));
			} else {
				dt.add(Restrictions.eq("approvingAuthority", "Others"));
				dt.add(Restrictions.eq("districtModel.districtId", user.getDistrict().getDistrictId()));
			}
		} else {
			dt.add(Restrictions.eq("zone.zoneId", user.getZone().getZoneId()));
		}

		return dt;
	}

	@Override
	public List<AgentRegistrationModel> getPendingAgentRegistration(String status, String type, UserModel user) {
		DetachedCriteria dt = getDetachedCriteriaForAgent(status, type, user);
		return agentRegistrationDAO.getAgentList(dt);
	}

	private DetachedCriteria getDetachedCriteriaForAgent(String status, String type, UserModel user) {
		DetachedCriteria dt = DetachedCriteria.forClass(AgentRegistrationModel.class);
		dt.add(Restrictions.eq("status", status));
		dt.add(Restrictions.eq("registrationType", type));
		if (user.getUserType().equalsIgnoreCase(ReraConstants.OPERATOR_USER)) {
			if (user.getAuthorityType().equals("AUDA")) {
				dt.add(Restrictions.eq("approvingAuthority", "AUDA"));
			} else if (user.getAuthorityType().equals("SUDA")) {
				dt.add(Restrictions.eq("approvingAuthority", "SUDA"));
			} else {
				dt.add(Restrictions.eq("approvingAuthority", "Others"));
				dt.add(Restrictions.eq("districtModel.districtId", user.getDistrict().getDistrictId()));
			}
		} else {
			dt.add(Restrictions.eq("zone.zoneId", user.getZone().getZoneId()));
		}

		return dt;
	}

	@Override
	public List<AgentRegistrationModel> getPendingAgentRegistration(String status, String type, Long userId) {
		DetachedCriteria dt = DetachedCriteria.forClass(AgentRegistrationModel.class);
		dt.add(Restrictions.eq("status", status));
		dt.add(Restrictions.eq("registrationType", type));
		dt.add(Restrictions.eq("authorityUser.userId", userId));
		return agentRegistrationDAO.getAgentList(dt);
	}



	@Override
	public List<AgentRegistrationModel> getPendingAgentRegistration(String status) {
		DetachedCriteria dt = DetachedCriteria.forClass(AgentRegistrationModel.class);
		dt.add(Restrictions.eq("status", status));
		dt.add(Restrictions.isNull("updatedFlag"));
		dt.addOrder(Order.asc("applicationNo"));
		return agentRegistrationDAO.getAgentList(dt);
	}

	@Override
	public List<AgentRegistrationModel> getNewAgentRegistrationList(String status) {
		DetachedCriteria dt = DetachedCriteria.forClass(AgentRegistrationModel.class);
		dt.add(Restrictions.eq("status", status));
		dt.add(Restrictions.isNull("updatedFlag"));
		dt.add(Restrictions.isNull("operatorRemarks"));

		dt.addOrder(Order.asc("applicationNo"));
		return agentRegistrationDAO.getAgentList(dt);
	}


	@Override
	public List<AgentRegistrationModel> getPendingAgentRegistration(String status, Long userId) {
		DetachedCriteria dt = DetachedCriteria.forClass(AgentRegistrationModel.class);
		dt.add(Restrictions.eq("status", status));
		dt.add(Restrictions.isNull("updatedFlag"));
		dt.add(Restrictions.eq("authorityUser.userId", userId));
		dt.addOrder(Order.asc("applicationNo"));
		return agentRegistrationDAO.getAgentList(dt);
	}

	@Override
	public List<AgentRegistrationModel> getViewAllAgents() {
		// TODO Auto-generated method stub
		DetachedCriteria dt = DetachedCriteria.forClass(AgentRegistrationModel.class, "agent");
		dt.add(Restrictions.ne("agent.status", "SAVE_AS_DRAFT"));
		dt.add(Restrictions.ne("agent.status", "REVOKED"));

		dt.addOrder(Order.asc("applicationNo"));
		return agentRegistrationDAO.getAgentList(dt);
	}

	@Override
	public List<AgentRegistrationModel> getViewAllAgents(String status, String regNo) {
		// TODO Auto-generated method stub
		DetachedCriteria dt = DetachedCriteria.forClass(AgentRegistrationModel.class);
		if (status != null && !status.equals("0")) {
			dt.add(Restrictions.eq("status", status));
		}
		if (regNo != null) {
			dt.add(Restrictions.eq("agentRegistrationNo", regNo));
		}

		dt.add(Restrictions.ne("status", ReraConstants.SAVE_AS_DRAFT));
		dt.add(Restrictions.ne("status", ReraConstants.REVOKED));
		dt.addOrder(Order.asc("applicationNo"));
		return agentRegistrationDAO.getAgentList(dt);
	}

	@Override
	public List<ComplaintModel> getPendingComplaint(String status) throws Exception {
		DetachedCriteria dt = DetachedCriteria.forClass(ComplaintModel.class);
		dt.add(Restrictions.eq("status", status));
		dt.addOrder(Order.asc("complaintDate"));
		return complaintDAO.getComplaintList(dt);
	}

	@Override
	public List<ComplaintModel> getPendingComplaint(String status, Long userId) throws Exception {
		DetachedCriteria dt = DetachedCriteria.forClass(ComplaintModel.class);
		dt.add(Restrictions.eq("status", status));
		dt.add(Restrictions.eq("assignTo.userId", userId));
		dt.addOrder(Order.asc("complaintDate"));
		return complaintDAO.getComplaintList(dt);
	}

	@Override
	public List<ProjectRegistrationModel> getPendingProjectRegistration(String status, String type, Long userId) {
		DetachedCriteria dt = DetachedCriteria.forClass(ProjectRegistrationModel.class);
		dt.add(Restrictions.eq("status", status));
		dt.add(Restrictions.eq("registrationType", type));
		dt.add(Restrictions.eq("authorityUser.userId", userId));
		return projectRegistrationDAO.getProjectList(dt);
	}

	@Override
	public List<Object> getPendingProjectExtReg(String status) {
		DetachedCriteria dt = DetachedCriteria.forClass(ProjectRegExtensionModel.class);
		dt.add(Restrictions.eq("status", status));
		return dao.getList(dt);
	}

	@Override
	public List<Object> getPendingProjectExtReg(String status, Long userId) {
		DetachedCriteria dt = DetachedCriteria.forClass(ProjectRegExtensionModel.class);
		dt.add(Restrictions.eq("status", status));
		dt.add(Restrictions.eq("assignTo.userId", userId));
		return dao.getList(dt);
	}

	@Override
	public List<Object> getPendingAgentRegRenewal(String status) {
		DetachedCriteria dt = DetachedCriteria.forClass(AgentRegRenewalModel.class);
		dt.add(Restrictions.eq("status", status));
		return dao.getList(dt);

	}

	@Override
	public List<Object> getPendingAgentRegRenewal(String status, Long userId) {
		DetachedCriteria dt = DetachedCriteria.forClass(AgentRegRenewalModel.class);
		dt.add(Restrictions.eq("status", status));
		dt.add(Restrictions.eq("assignTo.userId", userId));
		return dao.getList(dt);
	}

	@Override
	public List<AgentRegistrationModel> getAgentPendingEnquiry() {
		// TODO Auto-generated method stub

		DetachedCriteria dt = DetachedCriteria.forClass(AgentRegistrationModel.class, "agent");
		dt.createAlias("agent.enquiryList", "eq");
		dt.add(Restrictions.isNotNull("agent.enquiryList"));
		dt.add(Restrictions.ne("agent.status", ReraConstants.APPROVED));
		dt.add(Restrictions.ne("agent.status", ReraConstants.REVOKED));
		dt.add(Restrictions.ne("agent.status", ReraConstants.SAVE_AS_DRAFT));

		return agentRegistrationDAO.getAgentList(dt);

	}

	// Added for return projects

	//

	@Autowired
	CommonDao<Object, Long> dao;

	@Override
	public List<ProjectRegistrationModel> getReturnedProjects(String status, UserModel user) {
		DetachedCriteria dt = getReturnedProjectRegCriteria(status, user);
		return projectRegistrationDAO.getProjectList(dt);
	}

	@Override
	public List<ProjectRegistrationModel> returnProjectsToAuthority(String status, UserModel user) {
		DetachedCriteria dt = getReturnedProjectRegCriteriaForAuthority(status, user);

		List<ProjectRegistrationModel> list = projectRegistrationDAO.getProjectList(dt);
		list.removeAll(returnProjectsByAuthority(status, user));
		return list;

	}

	@Override
	public Integer getTotalProjectsAppliedByDate(Date startDate, Date endDate) {

		String str = "";
		Query query = null;
		try {

			str = "Select count(distinct p) from ProjectRegistrationModel p where  p.status <> :revoked  and p.status <> :draft and p.createdOn between :startDate and :endDate";
			query = dao.getQuery(str);

			query.setString("startDate", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(startDate));
			query.setString("endDate", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(endDate));
			query.setString("revoked", ReraConstants.REVOKED);
			query.setString("draft", ReraConstants.SAVE_AS_DRAFT);

		} catch (Exception e) {

			log.error(e.getMessage(), e);
		}

		return Integer.parseInt(query.uniqueResult().toString());

	}

	@Override
	public Integer getTotalApprovedProjectsByDate(Date startDate, Date endDate) {

		String str = "";
		Query query = null;
		try {

			str = "Select count(distinct p) from ProjectRegistrationModel p where  p.status = :approved  and p.createdOn between :startDate and :endDate";
			query = dao.getQuery(str);

			query.setString("startDate", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(startDate));
			query.setString("endDate", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(endDate));
			query.setString("approved", ReraConstants.APPROVED);

		} catch (Exception e) {

			log.error(e.getMessage(), e);
		}

		return Integer.parseInt(query.uniqueResult().toString());

	}

	@Override
	public Integer getTotalRejectedProjectsByDate(Date startDate, Date endDate) {

		String str = "";
		Query query = null;
		try {

			str = "Select count(distinct p) from ProjectRegistrationModel p where  p.status = :reject  and p.createdOn between :startDate and :endDate";
			query = dao.getQuery(str);

			query.setString("startDate", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(startDate));
			query.setString("endDate", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(endDate));
			query.setString("reject", ReraConstants.REJECTED);

		} catch (Exception e) {

			log.error(e.getMessage(), e);
		}

		return Integer.parseInt(query.uniqueResult().toString());

	}

	@Override
	public Integer getProjectsPendingByDate(String user, Date startDate, Date endDate) {

		String str = "";
		Query query = null;
		try {
			if (ReraConstants.OP_ACCOUNTS_USER.equals(user)) {
				str = "Select count(distinct p) from ProjectRegistrationModel p inner join p.projectRemarks as rm  where  p.status = :pendingOperator  and rm.accountsStatus <>'OK' and p.updatedFlag = 'YES' and p.createdOn between :startDate and :endDate";
				query = dao.getQuery(str);
				query.setString("pendingOperator", ReraConstants.PENDING_OPRATOR);
			} else if (ReraConstants.OP_TCP_USER.equals(user)) {
				str = "Select count(distinct p) from ProjectRegistrationModel p inner join p.projectRemarks as rm  where p.status = :pendingOperator and rm.tcpStatus <> 'OK' and p.updatedFlag = 'YES' and p.createdOn between :startDate and :endDate";
				query = dao.getQuery(str);

				query.setString("pendingOperator", ReraConstants.PENDING_OPRATOR);
			} else if (ReraConstants.OP_REVENUE_USER.equals(user)) {
				str = "Select count(distinct p) from ProjectRegistrationModel p inner join p.projectRemarks as rm  where  p.status = :pendingOperator and rm.revenueStatus <> 'OK' and p.updatedFlag = 'YES' and p.createdOn between :startDate and :endDate";
				query = dao.getQuery(str);
				query.setString("pendingOperator", ReraConstants.PENDING_OPRATOR);
			} else if (ReraConstants.OP_ENGG_USER.equals(user)) {
				str = "Select count(distinct p) from ProjectRegistrationModel p inner join p.projectRemarks as rm  where  p.status = :pendingOperator and rm.enggStatus <> 'OK' and p.updatedFlag = 'YES' and p.createdOn between :startDate and :endDate";
				query = dao.getQuery(str);
				query.setString("pendingOperator", ReraConstants.PENDING_OPRATOR);
			} else if (ReraConstants.AUTHORITY_USER.equals(user)) {
				str = "Select count(distinct p) from ProjectRegistrationModel p  where  p.status = :pendingAuthority and p.createdOn between :startDate and :endDate";
				query = dao.getQuery(str);
				query.setString("pendingAuthority", ReraConstants.PENDING_AUTHORITY);
			} else if (ReraConstants.CHIEFAUTHORITY_USER.equals(user)) {
				str = "Select count(distinct p) from ProjectRegistrationModel p  where  p.status = :pendingHeadOffice and p.createdOn between :startDate and :endDate";
				query = dao.getQuery(str);
				query.setString("pendingHeadOffice", ReraConstants.PENDING_HEADOFFICE);
			} else if (ReraConstants.PROJECT_USER.equals(user)) {
				str = "Select count(distinct p) from ProjectRegistrationModel p  where p.status = :pendingoperator and  p.updatedFlag is null and p.createdOn between :startDate and :endDate";
				query = dao.getQuery(str);
				query.setString("pendingoperator", ReraConstants.PENDING_OPRATOR);

			}

			query.setString("startDate", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(startDate));
			query.setString("endDate", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(endDate));

		} catch (Exception e) {

			log.error(e.getMessage(), e);
		}

		return (Integer.parseInt(query.uniqueResult().toString()) ) ;
	}



	@Override
	public Integer getTotalAgentsAppliedByDate(Date startDate, Date endDate) {

		String str = "";
		Query query = null;
		try {

			str = "Select count(distinct p) from AgentRegistrationModel p where  p.status <> :revoked  and p.status <> :draft and p.createdOn between :startDate and :endDate";
			query = dao.getQuery(str);

			query.setString("startDate", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(startDate));
			query.setString("endDate", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(endDate));
			query.setString("revoked", ReraConstants.REVOKED);
			query.setString("draft", ReraConstants.SAVE_AS_DRAFT);

		} catch (Exception e) {

			log.error(e.getMessage(), e);
		}

		return Integer.parseInt(query.uniqueResult().toString());

	}

	@Override
	public Integer getTotalApprovedAgentssByDate(Date startDate, Date endDate) {

		String str = "";
		Query query = null;
		try {

			str = "Select count(distinct p) from AgentRegistrationModel p where  p.status = :approved  and p.createdOn between :startDate and :endDate";
			query = dao.getQuery(str);

			query.setString("startDate", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(startDate));
			query.setString("endDate", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(endDate));
			query.setString("approved", ReraConstants.APPROVED);

		} catch (Exception e) {

			log.error(e.getMessage(), e);
		}

		return Integer.parseInt(query.uniqueResult().toString());

	}

	@Override
	public Integer getTotalRejectedAgentsByDate(Date startDate, Date endDate) {

		String str = "";
		Query query = null;
		try {

			str = "Select count(distinct p) from AgentRegistrationModel p where  p.status = :reject  and p.createdOn between :startDate and :endDate";
			query = dao.getQuery(str);

			query.setString("startDate", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(startDate));
			query.setString("endDate", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(endDate));
			query.setString("reject", ReraConstants.REJECTED);

		} catch (Exception e) {

			log.error(e.getMessage(), e);
		}

		return Integer.parseInt(query.uniqueResult().toString());

	}

	@Override
	public Integer getAgentsPendingByDate(String user, Date startDate, Date endDate) {

		String str = "";
		Query query = null;
		try {
			if (ReraConstants.OPERATOR_USER.equals(user)) {
				str = "Select count(distinct p) from AgentRegistrationModel p where  p.status = :pendingOperator  and p.updatedFlag = 'YES' and p.createdOn between :startDate and :endDate";
				query = dao.getQuery(str);
				query.setString("pendingOperator", ReraConstants.PENDING_OPRATOR);
			} else if (ReraConstants.AUTHORITY_USER.equals(user)) {
				str = "Select count(distinct p) from AgentRegistrationModel p  where  p.status = :pendingAuthority and p.createdOn between :startDate and :endDate";
				query = dao.getQuery(str);
				query.setString("pendingAuthority", ReraConstants.PENDING_AUTHORITY);
			} /*
			 * else if (ReraConstants.CHIEFAUTHORITY_USER.equals(user)) {
			 * str =
			 * "Select count(distinct p) from AgentRegistrationModel p  where  p.status = :pendingHeadOffice and p.createdOn between :startDate and :endDate"
			 * ; query = dao.getQuery(str);
			 * query.setString("pendingHeadOffice",
			 * ReraConstants.PENDING_HEADOFFICE); }
			 */else if (ReraConstants.AGENT_USER.equals(user)) {
				 str = "Select count(distinct p) from AgentRegistrationModel p  where p.status = :pendingoperator and  p.updatedFlag is null and p.createdOn between :startDate and :endDate";
				 query = dao.getQuery(str);
				 query.setString("pendingoperator", ReraConstants.PENDING_OPRATOR);

			 }

			query.setString("startDate", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(startDate));
			query.setString("endDate", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(endDate));

		} catch (Exception e) {

			log.error(e.getMessage(), e);
		}

		return Integer.parseInt(query.uniqueResult().toString());
	}

	@Override
	public List<AgentRegistrationModel> getRejectedList() {
		DetachedCriteria dt = DetachedCriteria.forClass(AgentRegistrationModel.class);
		dt.add(Restrictions.eq("status", ReraConstants.REJECTED));

		return agentRegistrationDAO.getAgentList(dt);
	}



	@Override

	public Integer getTotalWithdrawnProjectsByDate(Date startDate, Date endDate) {



		String str = "";

		Query query = null;

		try {



			str = "Select count(distinct p) from ProjectRegistrationModel p where  p.status = :status  and p.createdOn between :startDate and :endDate";

			query = dao.getQuery(str);



			query.setString("startDate", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(startDate));

			query.setString("endDate", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(endDate));

			query.setString("status", ReraConstants.WITHDRAWN);



		} catch (Exception e) {



			log.error(e.getMessage(), e);

		}



		return Integer.parseInt(query.uniqueResult().toString());



	}
}
