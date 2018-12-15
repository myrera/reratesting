package in.gov.rera.transaction.projectregistration.service;

import in.gov.rera.transaction.projectregistration.model.ProjectAgentModel;
import in.gov.rera.transaction.projectregistration.model.ProjectRegistrationModel;

public interface IProjectUserService {

	ProjectRegistrationModel getProjectByRegNo(String regNo);
	ProjectRegistrationModel getProjectByLoginId(String regNo);
	void updateVedorList(Long vid,String type);
	void addAgent(ProjectRegistrationModel project,String agentNo);
	void addVendor(ProjectRegistrationModel project, String vType,String name,
			String email,String address1,String address2,String pinCode,String year,String keyProjects,
			Long distId);
}
