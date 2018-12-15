package in.gov.rera.helpdesk.dao.impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import in.gov.rera.common.dao.impl.GenericDAOImpl;
import in.gov.rera.common.model.UserModel;
import in.gov.rera.helpdesk.dao.HelpDeskDao;
import in.gov.rera.helpdesk.model.HelpDeskEnquiryHistory;
import in.gov.rera.helpdesk.model.HelpDeskEnquiryModel;

@Repository(value = "HelpDeskDao")
public class HelpDeskDaoImpl extends GenericDAOImpl<HelpDeskEnquiryModel, Long> implements HelpDeskDao {

	@Override
	public List<HelpDeskEnquiryModel> getEnquiriesByUser(UserModel user) {

		DetachedCriteria dt = DetachedCriteria.forClass(HelpDeskEnquiryModel.class);
		if (user == null) {
			dt.add(Restrictions.isNull("assignedTo"));
		} else {
			dt.add(Restrictions.eq("assignedTo", user));
		}
		return super.getList(dt);
	}
	
	@Override
	public List<HelpDeskEnquiryModel> getEnquiriesCreatedByUser(UserModel user) {

		DetachedCriteria dt = DetachedCriteria.forClass(HelpDeskEnquiryModel.class);
		
			dt.add(Restrictions.eq("createdBy", user));
		
		return super.getList(dt);
	}

	@Override
	public HelpDeskEnquiryModel save(HelpDeskEnquiryModel enquiry) {

		if (enquiry.getId() != null) {
			super.updateOrUpdateEntity(enquiry);

		} else {
			enquiry.setId(super.createEntity(enquiry));
		}

		return enquiry;
	}

	@Override
	public List<HelpDeskEnquiryModel> getAllEnquiries() {
		DetachedCriteria dt = DetachedCriteria.forClass(HelpDeskEnquiryModel.class);
		return super.getList(dt);
	}
	
	

}
