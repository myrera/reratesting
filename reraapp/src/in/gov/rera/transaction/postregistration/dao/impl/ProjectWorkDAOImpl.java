package in.gov.rera.transaction.postregistration.dao.impl;

import org.springframework.stereotype.Repository;

import in.gov.rera.common.dao.impl.GenericDAOImpl;
import in.gov.rera.transaction.postregistration.dao.IProjectWorkDAO;
import in.gov.rera.transaction.postregistration.model.ProjectScheduleModel;
import in.gov.rera.transaction.postregistration.model.ProjectWorkModel;

@Repository(value = "projectWorkDAO")
public class ProjectWorkDAOImpl extends GenericDAOImpl<ProjectWorkModel, Long>
implements IProjectWorkDAO<ProjectWorkModel, Long>{


	@Override
	public ProjectWorkModel getProjectWorkModelById(Long pk) {
		// TODO Auto-generated method stub
		return super.getEntity(pk);
	}
	
	
	@Override
	public void saveOrUpdate(ProjectWorkModel e) {
		super.updateOrUpdateEntity(e);
		
	}
	
}
