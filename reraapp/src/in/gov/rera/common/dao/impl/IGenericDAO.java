package in.gov.rera.common.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;

import in.gov.rera.K2PaymentGateWay.model.K2PaymentDetailsModel;

public interface IGenericDAO<E, PK extends Serializable> {
	E findOne(final PK id);
	E getEntity(final PK id);

	PK createEntity(final E entity);
	
	
	E mergeEntity(final E entity);

	void updateEntity(final E entity);
	void updateOrUpdateEntity(final E entity);

	void delete(final E entity);

	void deleteById(final PK entityId);
	public List<E> pagger(DetachedCriteria dt, Integer offcet,
			Integer maxResults);

	public List<E> getList(DetachedCriteria dt);
	
	public Session getCurrentSession() ;
	
	
	
}
