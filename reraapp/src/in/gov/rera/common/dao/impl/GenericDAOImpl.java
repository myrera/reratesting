package in.gov.rera.common.dao.impl;

import in.gov.rera.common.util.HibernateSession;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.CriteriaSpecification;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;

@Scope("request")
public class GenericDAOImpl<E, PK extends Serializable> implements
		IGenericDAO<E, PK> {
	private Class<E> clazz;

	@Autowired
	SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	public GenericDAOImpl() {
		this.clazz = (Class<E>) ((ParameterizedType) getClass()
				.getGenericSuperclass()).getActualTypeArguments()[0];

	}

	@SuppressWarnings("unchecked")
	@Override
	public E findOne(PK id) {
		return (E) HibernateSession.getReraSession(sessionFactory).load(clazz,
				id);

	}
	
	@SuppressWarnings("unchecked")
	@Override
	public E getEntity(PK id) {
		return (E) HibernateSession.getReraSession(sessionFactory).get(clazz,
				id);

	}

	@SuppressWarnings("unchecked")
	@Override
	public PK createEntity(E entity) {
		Session session = HibernateSession.getReraSession(sessionFactory);
		Transaction trx = session.beginTransaction();
		PK pk = (PK) session.save(entity);
		trx.commit();

		return pk;

	}

	@Override
	public Session getCurrentSession() {
		return HibernateSession.getReraSession(sessionFactory);
	}

	@Override
	public void updateEntity(E entity) {
		Session ses = getCurrentSession();
		Transaction trx = ses.beginTransaction();
		ses.update(entity);
		trx.commit();

	}
	
	

	@Override
	public void delete(E entity) {
		Session ses = getCurrentSession();
		Transaction trx = ses.beginTransaction();

		ses.delete(entity);
		trx.commit();
	}

	@Override
	public void deleteById(PK entityId) {
		Session ses = getCurrentSession();
		Transaction trx = ses.beginTransaction();
		ses.delete(findOne(entityId));
		trx.commit();

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<E> pagger(DetachedCriteria dt, Integer offcet,
			Integer maxResults) {
		dt.setResultTransformer(CriteriaSpecification.DISTINCT_ROOT_ENTITY);
		Criteria crt = dt.getExecutableCriteria(getCurrentSession());
		crt.setFirstResult(offcet);
		crt.setMaxResults(maxResults);
		return crt.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<E> getList(DetachedCriteria dt) {
		dt.setResultTransformer(CriteriaSpecification.DISTINCT_ROOT_ENTITY);
		return dt.getExecutableCriteria(
				getCurrentSession()).list();

	}

	@Override
	public void updateOrUpdateEntity(E entity) {
		Session ses = getCurrentSession();
		Transaction trx = ses.beginTransaction();
		ses.saveOrUpdate(entity);
		trx.commit();
	}

	@SuppressWarnings("unchecked")
	@Override
	public E mergeEntity(E entity) {
		Session ses = getCurrentSession();
		Transaction trx = ses.beginTransaction();
		E e = (E) ses.merge(entity);
		trx.commit();
		return e;
	}



}
