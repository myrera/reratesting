package in.gov.rera.transaction.projectregistration.dao;

import in.gov.rera.common.model.EnquiryModel;

public interface EnquiryDetailsDAO<E,PK>  {
	
		public  EnquiryModel saveEnquiryModel(EnquiryModel entity) ;
}
