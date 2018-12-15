package in.gov.rera.transaction.unregistered.dao.impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.stereotype.Repository;

import in.gov.rera.common.dao.impl.GenericDAOImpl;
import in.gov.rera.common.model.EnquiryModel;
import in.gov.rera.common.model.UserModel;
import in.gov.rera.transaction.unregistered.dao.IUnregEnquiryDao;
import in.gov.rera.transaction.unregistered.model.UnregEnquiryModel;

@Repository(value = "IUnregEnquiryDao")
public class UnregEnquiryDaoImpl extends GenericDAOImpl<EnquiryModel, Long>  implements IUnregEnquiryDao{

	@Override
	public List<EnquiryModel> getEnquiriesByUser(UserModel user) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public EnquiryModel save(EnquiryModel enquiry) {
		if (enquiry.getEnquiryId() != null) {
			super.updateOrUpdateEntity(enquiry);

		} else {
			enquiry.setEnquiryId(super.createEntity(enquiry));
		}

		return enquiry;
	}

	@Override
	public List<EnquiryModel> getEnquiriesCreatedByUser(UserModel user) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<EnquiryModel> getAllEnquiries() {
		DetachedCriteria dt = DetachedCriteria.forClass(EnquiryModel.class);
		return super.getList(dt);
	}

}
