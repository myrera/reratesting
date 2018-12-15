package in.gov.rera.transaction.complaint.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;

public interface IComplaintDAO<E,PK> {
	
	PK saveComplaint(E e) throws Exception;
	E updateComplaint(E e) throws Exception;
	E findComplaintById(PK pk)throws Exception;
	List<E> getComplaintList(DetachedCriteria dt)throws Exception;
	Session getSessionObj()throws Exception;
	
	 void update(E entity);
	 E get(PK pk);

}
