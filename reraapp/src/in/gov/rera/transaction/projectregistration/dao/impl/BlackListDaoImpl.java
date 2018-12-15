package in.gov.rera.transaction.projectregistration.dao.impl;

import org.springframework.stereotype.Repository;

import in.gov.rera.common.dao.impl.GenericDAOImpl;
import in.gov.rera.transaction.projectregistration.dao.IBlackListDao;
import in.gov.rera.transaction.projectregistration.model.ProjectMemberDetailsModel;

@Repository
public class BlackListDaoImpl<E,PK> extends GenericDAOImpl<ProjectMemberDetailsModel, 
Long> implements IBlackListDao<ProjectMemberDetailsModel, Long>{

	@Override
	public ProjectMemberDetailsModel getBlackListById(Long pk) {
		// TODO Auto-generated method stub
		return super.getEntity(pk);
	}

}
