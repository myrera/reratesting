package in.gov.rera.transaction.agentregistration.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;

public interface IAgentRegistrationDAO<E ,PK> {

	 
	    PK save(E entity);
	    void update(E entity);
	    E get(PK pk);
	    Session getSessionObj();
	    
	    List<E> getAgentList(DetachedCriteria dt);
	    
	}

