package in.gov.rera.transaction.postregistration.dao.impl;

import org.springframework.stereotype.Repository;

import in.gov.rera.common.dao.impl.GenericDAOImpl;
import in.gov.rera.transaction.postregistration.dao.IProjectScheduleDAO;
import in.gov.rera.transaction.postregistration.model.ProjectScheduleModel;

@Repository(value = "ProjectScheduleDAO")
public class ProjectScheduleDaoImpl extends
GenericDAOImpl<ProjectScheduleModel, Long> implements
IProjectScheduleDAO<ProjectScheduleModel, Long>{
	
	@Override
	public void saveOuUpdate(ProjectScheduleModel e) {
		super.updateOrUpdateEntity(e);
		
	}

	@Override
	public ProjectScheduleModel get(Long pk) {
		return super.getEntity(pk);
	}
}
