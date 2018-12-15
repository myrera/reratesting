package in.gov.rera.transaction.postregistration.dao.impl;

import org.springframework.stereotype.Repository;

import in.gov.rera.common.dao.impl.GenericDAOImpl;
import in.gov.rera.transaction.postregistration.dao.IApartmentDAO;
import in.gov.rera.transaction.postregistration.model.ProjectApartmentDetails;

@Repository(value = "apartmentDAO")
public class ApartmentDAOImpl extends GenericDAOImpl<ProjectApartmentDetails, Long>
implements IApartmentDAO<ProjectApartmentDetails, Long>{


	@Override
	public ProjectApartmentDetails getApartmentById(Long pk) {
		// TODO Auto-generated method stub
		return super.getEntity(pk);
	}
	
	
	@Override
	public void saveOrUpdate(ProjectApartmentDetails e) {
		super.updateOrUpdateEntity(e);
		
	}
	
}