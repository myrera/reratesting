 package in.gov.rera.transaction.unregistered.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import in.gov.rera.common.model.EnquiryModel;
import in.gov.rera.common.model.UserModel;
import in.gov.rera.transaction.unregistered.dao.IUnregEnquiryDao;
import in.gov.rera.transaction.unregistered.model.UnregEnquiryModel;
import in.gov.rera.transaction.unregistered.service.IUnRegEnquiryService;

@Transactional
@Service(value="UnregEnquiryService")
public class UnregEnquiryServiceImpl implements IUnRegEnquiryService{

	@Autowired
	IUnregEnquiryDao unregEnqDao;
	
	@Override
	public List<EnquiryModel> getEnquiriesByUser(UserModel user) {
		// TODO Auto-generated method stub
		return unregEnqDao.getEnquiriesByUser(user);
	}

	@Override
	public EnquiryModel save(EnquiryModel enquiry) {
		
		return unregEnqDao.save(enquiry);
	}

	@Override
	public List<EnquiryModel> getEnquiriesCreatedByUser(UserModel user) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<EnquiryModel> getAllEnquiries() {
		// TODO Auto-generated method stub
		return unregEnqDao.getAllEnquiries();
	}

}
