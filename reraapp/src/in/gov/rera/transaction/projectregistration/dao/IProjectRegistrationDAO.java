package in.gov.rera.transaction.projectregistration.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;

public interface IProjectRegistrationDAO <E ,PK>{
	PK save(E entity);
    void update(E entity);
    void saveOrUpdate(E entity);
    
    E get(PK pk);
    Session getSessionObj();
    E merge(E e);
    
    
    List<E> getProjectList(DetachedCriteria dt);
    
    List<E> getreturnProjectList(DetachedCriteria dt);
    
}
