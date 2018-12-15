package in.gov.rera.transaction.projectregistration.dao.impl;

import org.springframework.stereotype.Repository;

import in.gov.rera.common.dao.impl.GenericDAOImpl;
import in.gov.rera.transaction.projectregistration.dao.IProjectMemberDao;
import in.gov.rera.transaction.projectregistration.model.ProjectMemberDetailsModel;

@Repository
public class ProjectMemberDaoImpl extends GenericDAOImpl<ProjectMemberDetailsModel, Long> 
implements IProjectMemberDao<ProjectMemberDetailsModel, Long>
{

	@Override
	public ProjectMemberDetailsModel getProjectMemberById(Long pk) {
		// TODO Auto-generated method stub
		return super.getEntity(pk);
	}

}
