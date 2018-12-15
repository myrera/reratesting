package in.gov.rera.helpdesk.service;

import java.util.List;
import java.util.Set;

import in.gov.rera.common.model.UserModel;
import in.gov.rera.helpdesk.model.HelpDeskEnquiryHistory;

public interface HelpDeskHistoryService {
	
	void save(HelpDeskEnquiryHistory history);
	
	List<HelpDeskEnquiryHistory> getAllHistoryByHelpDeskId(Long helpDeskId);
	
	HelpDeskEnquiryHistory getLatestHistoryByHelpDeskId(Long helpDeskId);
	
	Set<HelpDeskEnquiryHistory> getAllTicketsByUser(UserModel user);
	

}
