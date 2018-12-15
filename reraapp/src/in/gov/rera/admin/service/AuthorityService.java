package in.gov.rera.admin.service;

import in.gov.rera.common.model.UserModel;
import in.gov.rera.transaction.agentregistration.model.AgentRegRenewalModel;
import in.gov.rera.transaction.agentregistration.model.AgentRegistrationModel;
import in.gov.rera.transaction.complaint.model.ComplaintModel;
import in.gov.rera.transaction.projectregistration.model.ProjectRegistrationModel;
import in.gov.rera.transaction.unregistered.model.UnregisteredProjectDetail;

import java.text.ParseException;
import java.util.Date;
import java.util.List;

public interface AuthorityService {

	public List<Object> getPendingProjectExtReg(String status);

	public List<Object> getPendingProjectExtReg(String status, Long userId);

	public List<ProjectRegistrationModel> getPendingProjectRegistration(
			String status);

	public List<ProjectRegistrationModel> getPendingProjectRegistration(
			String status, UserModel user);

	public List<ProjectRegistrationModel> getPendingProjectRegistration(
			String status, Long userId);

	public List<ProjectRegistrationModel> getPendingProjectRegistration(
			String status, String type, UserModel user);

	public List<ProjectRegistrationModel> getPendingProjectRegistration(
			String status, String type);

	public List<ProjectRegistrationModel> getPendingProjectRegistration(
			String status, String type, Long userId);

	// Added for return projects

	public List<ProjectRegistrationModel> getReturnedProjects(
			String pendingOprator, UserModel user);

	public List<ProjectRegistrationModel> getViewAllProjects();

	public List<ProjectRegistrationModel> getViewAllProjects(String status,
			String regNo);

	public List<Object> getPendingAgentRegRenewal(String status);

	public List<Object> getPendingAgentRegRenewal(String status, Long userId);

	public List<AgentRegistrationModel> getPendingAgentRegistration(
			String status);

	public List<AgentRegistrationModel> getPendingAgentRegistration(
			String status, UserModel user);

	public List<AgentRegistrationModel> getPendingAgentRegistration(
			String status, Long userId);

	public List<AgentRegistrationModel> getPendingAgentRegistration(
			String status, String type);

	public List<AgentRegistrationModel> getPendingAgentRegistration(
			String status, String type, UserModel user);

	public List<AgentRegistrationModel> getPendingAgentRegistration(
			String status, String type, Long userId);

	public List<AgentRegistrationModel> getViewAllAgents();

	public List<AgentRegistrationModel> getViewAllAgents(String status,
			String regNo);

	public List<ComplaintModel> getPendingComplaint(String status)
			throws Exception;

	public List<ComplaintModel> getPendingComplaint(String status, Long userId)
			throws Exception;

	public List<ProjectRegistrationModel> returnProjectsToAuthority(
			String pendingAuthority, UserModel user);

	public List<ProjectRegistrationModel> getPendingProjectRegistrationForAuthority(
			String status, UserModel user);

	List<ProjectRegistrationModel> getProjectsUnderEnquiry();

	List<ProjectRegistrationModel> getUnderProcessReturnedProjects();

	List<ProjectRegistrationModel> getProjectsUnderWork();

	List<ProjectRegistrationModel> getProjectsUnderEnquiryForOperator( UserModel user);

	List<ProjectRegistrationModel> getProjectsUnderEnquiryForAuthority();

	List<ProjectRegistrationModel> returnProjectsByAuthority(String status, UserModel user);

	Integer getProjectsPendingByDate(String user, Date startDate, Date endDate);

	

	Integer getTotalProjectsAppliedByDate( Date startDate, Date endDate);

	Integer getTotalApprovedProjectsByDate( Date startDate, Date endDate);

	Integer getTotalRejectedProjectsByDate( Date startDate, Date endDate); 
	
	
	Integer getTotalAgentsAppliedByDate( Date startDate, Date endDate);

	// end for return projects
	
	public List<AgentRegistrationModel> getAgentPendingEnquiry();
	
	Integer getTotalApprovedAgentssByDate( Date startDate, Date endDate);
	
	Integer getTotalRejectedAgentsByDate( Date startDate, Date endDate); 
	
	Integer getAgentsPendingByDate(String user, Date startDate, Date endDate);

	List<ProjectRegistrationModel> getApprovedProjectsUnderEnquiryForAuthority();
	
	public List<AgentRegistrationModel> getRejectedList();
	
	public List<AgentRegistrationModel> getNewAgentRegistrationList(
			String status);
	public Integer getTotalWithdrawnProjectsByDate(Date startDate, Date endDate);

	int getPendingProjectRegistrationCount(String status, UserModel user);

	//alerts
	List<ProjectRegistrationModel> getPendingAlertsProjectNewRegistration(String status, String type);

	List<ProjectRegistrationModel> getAlertsReturnedProjects(String status, String type);

	List<AgentRegistrationModel> returnedAgentProjects(String pendingOprator);

	List<UnregisteredProjectDetail> getViewAllunregProjects();

	List<UnregisteredProjectDetail> getViewAllApprovedunregProjects(String status);
	

}
