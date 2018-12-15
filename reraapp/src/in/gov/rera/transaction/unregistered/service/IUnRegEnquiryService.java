package in.gov.rera.transaction.unregistered.service;

import java.util.List;

import in.gov.rera.common.model.EnquiryModel;
import in.gov.rera.common.model.UserModel;
import in.gov.rera.helpdesk.model.HelpDeskEnquiryHistory;
import in.gov.rera.helpdesk.model.HelpDeskEnquiryModel;
import in.gov.rera.transaction.unregistered.model.UnregEnquiryModel;

public interface IUnRegEnquiryService   {
	
	List<EnquiryModel> getEnquiriesByUser(UserModel user);
	
	EnquiryModel save(EnquiryModel enquiry);

	List<EnquiryModel> getEnquiriesCreatedByUser(UserModel user);

	List<EnquiryModel> getAllEnquiries();
	
	

}
