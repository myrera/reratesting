package in.gov.rera.transaction.agentregistration.dao;

public interface IPreAgentReistrationDao<E,PK> {

	E getPreRegistrationById(PK id);
	void updatePreRegistration(E obj);
	
}
