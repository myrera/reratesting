package in.gov.rera.transaction.postregistration.dao.impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.stereotype.Repository;

import in.gov.rera.common.dao.impl.GenericDAOImpl;
import in.gov.rera.transaction.postregistration.dao.IPostRegDAO;
import in.gov.rera.transaction.postregistration.model.ProjectWorkModel;
import in.gov.rera.transaction.projectregistration.model.PerviousProjectDetailsModel;
import in.gov.rera.transaction.projectregistration.model.ProjectRegistrationModel;

@Repository(value = "postRegDAO")
public class PostRegDAOImpl<E, PK> extends
GenericDAOImpl<ProjectRegistrationModel, Long> implements
IPostRegDAO<ProjectRegistrationModel, Long> {

	@Override
	public List<ProjectRegistrationModel> getProjectList(DetachedCriteria dt) {
		return super.getList(dt);
	}


	@Override
	public ProjectRegistrationModel get(Long pk) {
		return super.findOne(pk);
	}


	/*@Override
	public void saveOrUpdate(ProjectRegistrationModel e) {
		super.updateOrUpdateEntity(e);
		
	}*/
	
	@Override
	public void saveOrUpdate(ProjectRegistrationModel e) {
		super.createEntity(e);
		
	}
	
	
	
	
}