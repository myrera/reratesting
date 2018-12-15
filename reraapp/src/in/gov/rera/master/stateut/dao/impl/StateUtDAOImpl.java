package in.gov.rera.master.stateut.dao.impl;

import in.gov.rera.common.dao.impl.GenericDAOImpl;
import in.gov.rera.master.stateut.dao.IStateUtDAO;
import in.gov.rera.master.stateut.model.StateUtModel;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.stereotype.Repository;

@Repository(value="stateUtDAO")

public class StateUtDAOImpl<E, PK> extends GenericDAOImpl<StateUtModel, Long> implements IStateUtDAO<StateUtModel, Long>{

	@Override
	public List<StateUtModel> getStateUtList(DetachedCriteria dt)
			throws Exception {
		return super.getList(dt);
	}

	@Override
	public StateUtModel getStateById(Long pk) throws Exception {
		// TODO Auto-generated method stub
		return super.findOne(pk);
	}

}
