package in.gov.rera.helpdesk.dao;

import java.util.List;
import java.util.Set;

import in.gov.rera.common.dao.impl.IGenericDAO;
import in.gov.rera.common.model.UserModel;
import in.gov.rera.helpdesk.model.HelpDeskEnquiryHistory;

public interface HelpDeskHistoryDao extends IGenericDAO<HelpDeskEnquiryHistory, Long> {

	void save(HelpDeskEnquiryHistory history);

	List<HelpDeskEnquiryHistory> getAllHistoryByHelpDeskId(Long helpDeskId);

	HelpDeskEnquiryHistory getLatestHistoryByHelpDeskId(Long helpDeskId);

	Set<HelpDeskEnquiryHistory> getViewAll(UserModel user);
	
	
}
