package in.gov.rera.helpdesk.dao.impl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import in.gov.rera.common.dao.impl.GenericDAOImpl;
import in.gov.rera.common.model.UserModel;
import in.gov.rera.helpdesk.dao.HelpDeskHistoryDao;
import in.gov.rera.helpdesk.model.HelpDeskEnquiryHistory;

@Repository(value = "HelpDeskHistoryDao")
public class HelpDeskHistoryDaoImpl extends GenericDAOImpl<HelpDeskEnquiryHistory, Long> implements HelpDeskHistoryDao {

	@Override
	public List<HelpDeskEnquiryHistory> getAllHistoryByHelpDeskId(Long helpDeskId) {
		DetachedCriteria dt = DetachedCriteria.forClass(HelpDeskEnquiryHistory.class, "hdeh");

		dt.createAlias("hdeh.enquiry", "enquiry");
		dt.add(Restrictions.eq("enquiry.id", helpDeskId));
		dt.addOrder(Order.asc("hdeh.createdOn"));

		return super.getList(dt);

	}

	@Override
	public HelpDeskEnquiryHistory getLatestHistoryByHelpDeskId(Long helpDeskId) {

		DetachedCriteria dt = DetachedCriteria.forClass(HelpDeskEnquiryHistory.class, "hdeh");

		dt.createAlias("hdeh.enquiry", "enquiry");
		dt.add(Restrictions.eq("enquiry.id", helpDeskId));
		dt.addOrder(Order.desc("hdeh.createdOn"));

		return super.getList(dt).get(0);
		
	}

	@Override
	public void save(HelpDeskEnquiryHistory history) {
		if(history.getId()==null){
			super.createEntity(history);
		}else{
			super.updateOrUpdateEntity(history);
		}

	}
	
	@Override
	public Set<HelpDeskEnquiryHistory> getViewAll(UserModel user) {
		DetachedCriteria dt = DetachedCriteria.forClass(HelpDeskEnquiryHistory.class, "his");
		dt.createAlias("his.enquiry", "enquiry");
		dt.add(Restrictions.or( Restrictions.eq("assignee", user),Restrictions.eq("assignor", user)));
		Set<HelpDeskEnquiryHistory> set = new HashSet<HelpDeskEnquiryHistory>(super.getList(dt));
		return set;
		
	}
	
}
