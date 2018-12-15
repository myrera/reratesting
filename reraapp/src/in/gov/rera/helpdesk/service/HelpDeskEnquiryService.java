package in.gov.rera.helpdesk.service;

import java.util.List;

import in.gov.rera.common.model.UserModel;
import in.gov.rera.helpdesk.model.HelpDeskEnquiryHistory;
import in.gov.rera.helpdesk.model.HelpDeskEnquiryModel;

public interface HelpDeskEnquiryService {
	
	List<HelpDeskEnquiryModel> getEnquiriesByUser(UserModel user);
	
	void assignEnquiry(UserModel user,HelpDeskEnquiryModel enquiry);
	
	HelpDeskEnquiryModel save(HelpDeskEnquiryModel enquiry);

	List<HelpDeskEnquiryModel> getEnquiriesCreatedByUser(UserModel user);

	List<HelpDeskEnquiryModel> getAllEnquiries();

}
