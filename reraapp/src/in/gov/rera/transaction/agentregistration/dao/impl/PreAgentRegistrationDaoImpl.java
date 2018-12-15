package in.gov.rera.transaction.agentregistration.dao.impl;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;

import in.gov.rera.common.dao.impl.GenericDAOImpl;
import in.gov.rera.transaction.agentregistration.dao.IPreAgentReistrationDao;
import in.gov.rera.transaction.agentregistration.model.RegPreviousDatailsModel;

@Repository(value="preAgentRegistrationDao")
@Scope("request")
public class PreAgentRegistrationDaoImpl<E,PK> extends GenericDAOImpl<RegPreviousDatailsModel, Integer> implements IPreAgentReistrationDao<RegPreviousDatailsModel, Integer> {

	@Override
	public RegPreviousDatailsModel getPreRegistrationById(Integer id) {
		
		return super.findOne(id);
	}

	@Override
	public void updatePreRegistration(RegPreviousDatailsModel obj) {
		super.updateEntity(obj);
		
	}


	
	
}
