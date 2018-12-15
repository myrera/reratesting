package in.gov.rera.transaction.projectregistration.dao.impl;

import org.springframework.stereotype.Repository;

import in.gov.rera.common.dao.impl.GenericDAOImpl;
import in.gov.rera.transaction.projectregistration.dao.IPrevoiuProjectDao;
import in.gov.rera.transaction.projectregistration.model.PerviousProjectDetailsModel;

@Repository
public class PreviuosProjectDaoImpl extends GenericDAOImpl<PerviousProjectDetailsModel, Long>
implements IPrevoiuProjectDao<PerviousProjectDetailsModel, Long>{

	@Override
	public PerviousProjectDetailsModel getPerviousProjectDetailsModelById(
			Long pk) {
		// TODO Auto-generated method stub
		return super.getEntity(pk);
	}

}
