package in.gov.rera.transaction.unregistered.dao;

import java.util.List;

import in.gov.rera.common.dao.impl.IGenericDAO;
import in.gov.rera.common.model.EnquiryModel;
import in.gov.rera.common.model.UserModel;
import in.gov.rera.transaction.unregistered.model.UnregEnquiryModel;

public interface IUnregEnquiryDao extends IGenericDAO<EnquiryModel, Long>{

	List<EnquiryModel> getEnquiriesByUser(UserModel user);

	EnquiryModel save(EnquiryModel enquiry);

	List<EnquiryModel> getEnquiriesCreatedByUser(UserModel user);

	List<EnquiryModel> getAllEnquiries();
}
