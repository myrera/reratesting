package in.gov.rera.transaction.agentregistration.service.impl;

import java.util.List;

import in.gov.rera.transaction.agentregistration.dao.IAgentRegistrationDAO;
import in.gov.rera.transaction.agentregistration.model.AgentRegistrationModel;
import in.gov.rera.transaction.agentregistration.service.IAgentUserService;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;


@Service(value="agentUserService")
@Scope("request")
public class AgentUserService<E,PK> implements IAgentUserService<AgentRegistrationModel, Long>  {

	
	@Autowired
	IAgentRegistrationDAO<AgentRegistrationModel,Long> agentRegistrationDAO;
	
	
	@Override
	public AgentRegistrationModel getAgentByRegNo(String regNo) {
		AgentRegistrationModel agent =null;
		
		DetachedCriteria dt=DetachedCriteria.forClass(AgentRegistrationModel.class);
		dt.add(Restrictions.eq("agentRegistrationNo", regNo));
		
		List<AgentRegistrationModel> list=agentRegistrationDAO.getAgentList(dt);
		agent=list!=null && !list.isEmpty()?list.get(0):null; 
		
		return agent;
	}


	@Override
	public AgentRegistrationModel getAgentByLoginId(String regNo) {
AgentRegistrationModel agent =null;
		
		DetachedCriteria dt=DetachedCriteria.forClass(AgentRegistrationModel.class,"ag");
		dt.createAlias("ag.agentUser", "uu");
		dt.add(Restrictions.eq("uu.loginId", regNo));
		
		List<AgentRegistrationModel> list=agentRegistrationDAO.getAgentList(dt);
		agent=list!=null && !list.isEmpty()?list.get(0):null; 
		
		return agent;
	}


	@Override
	public AgentRegistrationModel getAgentByAppNo(String appNo) {
AgentRegistrationModel agent =null;
		
		DetachedCriteria dt=DetachedCriteria.forClass(AgentRegistrationModel.class);
		dt.add(Restrictions.eq("applicationNo", appNo));
		
		List<AgentRegistrationModel> list=agentRegistrationDAO.getAgentList(dt);
		agent=list!=null && !list.isEmpty()?list.get(0):null; 
		
		return agent;
	}

}
