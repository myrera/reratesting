package in.gov.rera.transaction.projectregistration.dao.impl;

import java.util.List;

import in.gov.rera.common.dao.impl.GenericDAOImpl;
import in.gov.rera.transaction.projectregistration.dao.IProjectRegistrationDAO;
import in.gov.rera.transaction.projectregistration.model.ProjectRegistrationModel;

import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;

@Repository(value = "projectRegistrationDAO")
public class ProjectRegistrationDAOImpl<E, PK> extends
		GenericDAOImpl<ProjectRegistrationModel, Long> implements
		IProjectRegistrationDAO<ProjectRegistrationModel, Long> {

	@Override
	public Long save(ProjectRegistrationModel entity) {
		return  super.createEntity(entity);
	}

	@Override
	public void update(ProjectRegistrationModel entity) {
		super.updateEntity(entity);

	}

	@Override
	public ProjectRegistrationModel get(Long pk) {
		return super.findOne(pk);
	}

	@Override
	public Session getSessionObj() {
		return super.getCurrentSession();
	}

	@Override
	public ProjectRegistrationModel merge(ProjectRegistrationModel e) {
		return super.mergeEntity(e);
	}

	@Override
	public void saveOrUpdate(ProjectRegistrationModel e) {
		super.updateOrUpdateEntity(e);
		
	}

	@Override
	public List<ProjectRegistrationModel> getProjectList(DetachedCriteria dt) {
		return super.getList(dt);
		
	}

	@Override
	public List<ProjectRegistrationModel> getreturnProjectList(DetachedCriteria dt) {
		return super.getList(dt);
		
	}
	

}
