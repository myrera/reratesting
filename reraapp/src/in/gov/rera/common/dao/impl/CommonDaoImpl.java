package in.gov.rera.common.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.stereotype.Repository;

import in.gov.rera.K2PaymentGateWay.model.K2PaymentDetailsModel;
import in.gov.rera.transaction.agentregistration.model.AgentRegistrationModel;


@Repository
public class CommonDaoImpl<E,PK> extends GenericDAOImpl<Object, Long> implements CommonDao<Object,Long>{

	

	@Override
	public Object loadObject(Class c, Long pk) {
		// TODO Auto-generated method stub

		return getCurrentSession().load(c, pk);
	}

	@Override
	public Object getObject(Class c, Long pk) {

		// TODO Auto-generated method stub
		 return getCurrentSession().get(c, pk);
	}

	@Override
	public void updateObject(Object e) {
		super.updateOrUpdateEntity(e);
		
	}

	@Override
	public void saveObject(Object e) {
		super.createEntity(e);
		
	}
	
	@Override
	public void removeObject(Object e) {
		super.delete(e);
		
	}

	
	@Override
	public List<Object> getList(DetachedCriteria dt) {
		
		return super.getList(dt);
	}
	

	
	
	
	

	
	@Override
	public Query getQuery(String query)throws Exception {
		// TODO Auto-generated method stub
		return getCurrentSession().createQuery(query);
	}

	


}
