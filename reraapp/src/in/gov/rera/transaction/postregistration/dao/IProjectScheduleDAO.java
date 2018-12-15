package in.gov.rera.transaction.postregistration.dao;

import in.gov.rera.transaction.postregistration.model.ProjectScheduleModel;

public interface IProjectScheduleDAO<E ,PK> {
	
	void saveOuUpdate(ProjectScheduleModel e);
	 E get(PK pk);
	
	

}
