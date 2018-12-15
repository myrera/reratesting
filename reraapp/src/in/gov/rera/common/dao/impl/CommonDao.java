package in.gov.rera.common.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.criterion.DetachedCriteria;

import in.gov.rera.K2PaymentGateWay.model.K2PaymentDetailsModel;


public interface CommonDao<E,PK> {


	E loadObject(Class c,PK pk);
	E getObject(Class c,PK pk);
	void updateObject(E e);
	void saveObject(E e);
	void removeObject(E e);
	List<Object> getList(DetachedCriteria dt);
	Query getQuery(String query)throws Exception;
	
}
