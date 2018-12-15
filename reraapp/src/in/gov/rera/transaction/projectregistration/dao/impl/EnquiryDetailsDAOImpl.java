package in.gov.rera.transaction.projectregistration.dao.impl;

import org.springframework.stereotype.Repository;

import in.gov.rera.common.dao.impl.GenericDAOImpl;
import in.gov.rera.common.model.EnquiryModel;
import in.gov.rera.transaction.projectregistration.dao.EnquiryDetailsDAO;

@Repository(value = "EnquiryDetailsDAO")
public class EnquiryDetailsDAOImpl extends GenericDAOImpl<EnquiryModel, Long> implements EnquiryDetailsDAO{
	
	public EnquiryModel saveEnquiryModel(EnquiryModel enitity) {
		
		super.updateEntity(enitity);
		
		 return enitity;
		
		
		
		
	}
	
	

}
