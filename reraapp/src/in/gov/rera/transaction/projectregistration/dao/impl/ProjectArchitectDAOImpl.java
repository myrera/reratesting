package in.gov.rera.transaction.projectregistration.dao.impl;

import org.springframework.stereotype.Repository;

import in.gov.rera.common.dao.impl.GenericDAOImpl;
import in.gov.rera.transaction.projectregistration.dao.IProjectArchitectDAO;
import in.gov.rera.transaction.projectregistration.model.ProjectArchitectDetailsModel;

@Repository
public class ProjectArchitectDAOImpl extends GenericDAOImpl<ProjectArchitectDetailsModel, Long>
implements IProjectArchitectDAO<ProjectArchitectDetailsModel, Long>
{

	@Override
	public ProjectArchitectDetailsModel getProjectArchoitectById(Long pk) {
		// TODO Auto-generated method stub
		return super.getEntity(pk);
	}

}
