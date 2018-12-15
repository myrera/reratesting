package in.gov.rera.transaction.agentregistration.service;

import in.gov.rera.transaction.agentregistration.model.AgentRegistrationModel;

public interface IAgentUserService<E,PK> {

	AgentRegistrationModel getAgentByRegNo(String regNo);
	AgentRegistrationModel getAgentByAppNo(String appNo);
	AgentRegistrationModel getAgentByLoginId(String regNo);
}
