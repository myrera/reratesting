package in.gov.rera.transaction.postregistration.dao;

import in.gov.rera.transaction.postregistration.model.ProjectApartmentDetails;

public interface IApartmentDAO<E ,PK> {
	 E getApartmentById(PK pk);
	void saveOrUpdate(ProjectApartmentDetails e);
}