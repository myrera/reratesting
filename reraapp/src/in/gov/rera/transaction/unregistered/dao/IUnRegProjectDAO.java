package in.gov.rera.transaction.unregistered.dao;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import in.gov.rera.transaction.unregistered.model.UnregisteredProjectDetail;


public interface IUnRegProjectDAO<E ,PK> {
	
	List<E> getunregProjectList(DetachedCriteria dt);
	  E get(PK pk);
	 public void saveOrUpdateUnregProjectDetails(UnregisteredProjectDetail unregisteredProjectDetail );
	 public void delete(Long unregProjectDetailsId);
	void update(UnregisteredProjectDetail entity);
}
