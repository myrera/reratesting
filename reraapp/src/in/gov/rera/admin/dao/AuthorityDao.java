package in.gov.rera.admin.dao;

import in.gov.rera.transaction.projectregistration.model.ProjectRegistrationModel;

import java.util.List;

public interface AuthorityDao {

	public List<ProjectRegistrationModel> getProjectRegistrationByStatus(String status);
	
	
}
