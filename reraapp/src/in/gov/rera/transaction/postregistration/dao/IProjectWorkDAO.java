package in.gov.rera.transaction.postregistration.dao;

import in.gov.rera.transaction.postregistration.model.ProjectWorkModel;

public interface IProjectWorkDAO<E ,PK> {
	
	 E getProjectWorkModelById(PK pk);
	void saveOrUpdate(ProjectWorkModel e);
}
