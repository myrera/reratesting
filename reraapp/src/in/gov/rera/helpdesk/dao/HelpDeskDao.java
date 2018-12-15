package in.gov.rera.helpdesk.dao;

import java.util.List;

import in.gov.rera.common.dao.impl.IGenericDAO;
import in.gov.rera.common.model.UserModel;
import in.gov.rera.helpdesk.model.HelpDeskEnquiryHistory;
import in.gov.rera.helpdesk.model.HelpDeskEnquiryModel;

public interface HelpDeskDao extends IGenericDAO<HelpDeskEnquiryModel, Long> {

	List<HelpDeskEnquiryModel> getEnquiriesByUser(UserModel user);

	HelpDeskEnquiryModel save(HelpDeskEnquiryModel enquiry);

	List<HelpDeskEnquiryModel> getEnquiriesCreatedByUser(UserModel user);

	List<HelpDeskEnquiryModel> getAllEnquiries();

}
