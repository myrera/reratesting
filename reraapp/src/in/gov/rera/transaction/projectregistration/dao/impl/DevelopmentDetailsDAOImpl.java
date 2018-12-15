package in.gov.rera.transaction.projectregistration.dao.impl;

import org.springframework.stereotype.Repository;

import in.gov.rera.common.dao.impl.GenericDAOImpl;
import in.gov.rera.transaction.projectregistration.dao.IDevelopmentDetailsDAO;
import in.gov.rera.transaction.projectregistration.model.DevelopmentDetailsModel;

@Repository
public class DevelopmentDetailsDAOImpl<E, PK> extends
		GenericDAOImpl<DevelopmentDetailsModel, Long> implements
		IDevelopmentDetailsDAO<DevelopmentDetailsModel, Long> {

	@Override
	public DevelopmentDetailsModel getDevelopmentDetailsById(Long pk) {
		// TODO Auto-generated method stub
		return super.getEntity(pk);
	}

}
