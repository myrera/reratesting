package in.gov.rera.transaction.postregistration.dao;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import in.gov.rera.transaction.projectregistration.model.ProjectRegistrationModel;

public interface IPostRegDAO<E ,PK>{
	  List<E> getProjectList(DetachedCriteria dt);
	  E get(PK pk);
	void saveOrUpdate(ProjectRegistrationModel e);
	 
}
