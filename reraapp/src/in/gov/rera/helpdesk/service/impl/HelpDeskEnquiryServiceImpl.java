package in.gov.rera.helpdesk.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import in.gov.rera.common.model.UserModel;
import in.gov.rera.helpdesk.dao.HelpDeskDao;
import in.gov.rera.helpdesk.model.HelpDeskEnquiryHistory;
import in.gov.rera.helpdesk.model.HelpDeskEnquiryModel;
import in.gov.rera.helpdesk.service.HelpDeskEnquiryService;


@Transactional
@Service(value="helpDeskEnquiryService")
public class HelpDeskEnquiryServiceImpl implements HelpDeskEnquiryService {
	
	
	@Autowired
	HelpDeskDao helpDeskDao;
	
	

	@Override
	public List<HelpDeskEnquiryModel> getEnquiriesByUser(UserModel user) {
		
		return helpDeskDao.getEnquiriesByUser(user);
	}
	
	@Override
	public List<HelpDeskEnquiryModel> getEnquiriesCreatedByUser(UserModel user) {
		
		return helpDeskDao.getEnquiriesCreatedByUser(user);
	}
	
	@Override
	public List<HelpDeskEnquiryModel> getAllEnquiries() {
		return helpDeskDao.getAllEnquiries();
	}

	@Override
	public void assignEnquiry(UserModel user, HelpDeskEnquiryModel enquiry) {
		enquiry.setAssignedTo(user);
		helpDeskDao.save(enquiry);
	}

	@Override
	public HelpDeskEnquiryModel save(HelpDeskEnquiryModel enquiry) {
		
		return helpDeskDao.save(enquiry);
	}


	
}
