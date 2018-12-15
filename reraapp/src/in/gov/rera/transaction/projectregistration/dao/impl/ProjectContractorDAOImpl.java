package in.gov.rera.transaction.projectregistration.dao.impl;

import org.springframework.stereotype.Repository;

import in.gov.rera.common.dao.impl.GenericDAOImpl;
import in.gov.rera.transaction.projectregistration.dao.IProjectContractorDAO;
import in.gov.rera.transaction.projectregistration.model.ProjectContratorDetailsModel;

@Repository
public class ProjectContractorDAOImpl extends GenericDAOImpl<ProjectContratorDetailsModel, Long> 
implements IProjectContractorDAO<ProjectContratorDetailsModel, Long>
{

	@Override
	public ProjectContratorDetailsModel getProjectContractorById(Long pk) {
		// TODO Auto-generated method stub
		return super.getEntity(pk);
	}

}
