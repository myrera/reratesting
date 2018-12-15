package in.gov.rera.transaction.agentregistration.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;

import in.gov.rera.common.dao.impl.GenericDAOImpl;
import in.gov.rera.transaction.agentregistration.dao.IAgentRegistrationDAO;
import in.gov.rera.transaction.agentregistration.model.AgentRegistrationModel;
import org.apache.log4j.Logger;

@Repository(value="AgentRegistrationDAO")
public class AgentRegistrationDAOImpl<E ,PK> extends GenericDAOImpl<AgentRegistrationModel,Long>  implements IAgentRegistrationDAO<AgentRegistrationModel,Long> {
	static Logger log= Logger.getLogger(AgentRegistrationDAOImpl.class);
	
	
	@Override
	public Long save(AgentRegistrationModel entity) {
		log.info("in dao method ++========"+entity.getAgentDetailsModel().getAgentName());
		return super.createEntity(entity);
	}

	@Override
	public void update(AgentRegistrationModel entity) {
		super.updateEntity(entity);
	}

	@Override
	public AgentRegistrationModel get(Long pk) {
		return super.findOne(pk);
	}

	@Override
	public Session getSessionObj() {
	
		return super.getCurrentSession();
	}

	@Override
	public List<AgentRegistrationModel> getAgentList(DetachedCriteria dt) {
		return super.getList(dt);
	}
	
}
