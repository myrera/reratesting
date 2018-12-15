package in.gov.rera.K2PaymentGateWay.dao;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import in.gov.rera.K2PaymentGateWay.model.K2PaymentDetailsModel;

public interface IK2PaymentDeatailsDAO<E,PK> {
	
	PK save(E entity);
	void update(E entity);
	List<K2PaymentDetailsModel> getPaymentDetailsModel(DetachedCriteria dt);

}
