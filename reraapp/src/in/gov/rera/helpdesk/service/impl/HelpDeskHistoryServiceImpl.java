package in.gov.rera.helpdesk.service.impl;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import in.gov.rera.common.model.UserModel;
import in.gov.rera.helpdesk.dao.HelpDeskHistoryDao;
import in.gov.rera.helpdesk.model.HelpDeskEnquiryHistory;
import in.gov.rera.helpdesk.service.HelpDeskHistoryService;


@Transactional
@Service(value="helpDeskHistoryService")
public class HelpDeskHistoryServiceImpl implements HelpDeskHistoryService {
	
	
	@Autowired
	HelpDeskHistoryDao helpDeskHistoryDao;

	@Override
	public void save(HelpDeskEnquiryHistory history) {
		helpDeskHistoryDao.save(history);
		
	}

	@Override
	public List<HelpDeskEnquiryHistory> getAllHistoryByHelpDeskId(Long helpDeskId) {
		// TODO Auto-generated method stub
		return helpDeskHistoryDao.getAllHistoryByHelpDeskId(helpDeskId);
	}

	@Override
	public HelpDeskEnquiryHistory getLatestHistoryByHelpDeskId(Long helpDeskId) {
		// TODO Auto-generated method stub
		return helpDeskHistoryDao.getLatestHistoryByHelpDeskId(helpDeskId);
	}

	@Override
	public Set<HelpDeskEnquiryHistory> getAllTicketsByUser(UserModel user) {
		
		return helpDeskHistoryDao.getViewAll(user);
	}
	
}
