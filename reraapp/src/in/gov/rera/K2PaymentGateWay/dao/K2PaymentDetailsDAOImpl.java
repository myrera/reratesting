package in.gov.rera.K2PaymentGateWay.dao;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.stereotype.Repository;

import in.gov.rera.K2PaymentGateWay.model.K2PaymentDetailsModel;
import in.gov.rera.common.dao.impl.GenericDAOImpl;

@Repository(value="K2PaymentDeatailsDAO")
public class K2PaymentDetailsDAOImpl<E,PK> extends GenericDAOImpl<K2PaymentDetailsModel,Long>  implements IK2PaymentDeatailsDAO<K2PaymentDetailsModel,Long>{

	@Override
	public List<K2PaymentDetailsModel> getPaymentDetailsModel(DetachedCriteria dt) {
		return super.getList(dt);
	}

	@Override
	public Long save(K2PaymentDetailsModel entity) {
		return super.createEntity(entity);
	}
	
	@Override
	public void update(K2PaymentDetailsModel entity) {
		super.updateEntity(entity);
	}

	

}
