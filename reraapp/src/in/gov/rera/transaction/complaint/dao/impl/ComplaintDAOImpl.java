package in.gov.rera.transaction.complaint.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.stereotype.Repository;

import in.gov.rera.common.dao.impl.GenericDAOImpl;
import in.gov.rera.transaction.agentregistration.model.AgentRegistrationModel;
import in.gov.rera.transaction.complaint.dao.IComplaintDAO;
import in.gov.rera.transaction.complaint.model.ComplaintModel;

@Repository(value="complaintDAO")
public class ComplaintDAOImpl <E,PK> extends GenericDAOImpl<ComplaintModel, Long> implements IComplaintDAO<ComplaintModel,Long>{

	@Override
	public Long saveComplaint(ComplaintModel e) throws Exception {
		return super.createEntity(e);
	}

	@Override
	public ComplaintModel updateComplaint(ComplaintModel e) throws Exception {
		super.updateEntity(e);
		return e;
	}

	@Override
	public ComplaintModel findComplaintById(Long pk) throws Exception {
		return super.findOne(pk);
	}

	@Override
	public List<ComplaintModel> getComplaintList(DetachedCriteria dt)
			throws Exception {
	
		return super.getList(dt);
	}

	@Override
	public Session getSessionObj() throws Exception {
		
		return super.getCurrentSession();
	}

	@Override
	public ComplaintModel get(Long pk) {
		return super.findOne(pk);
	}
	
	@Override
	public void update(ComplaintModel entity) {
		super.updateEntity(entity);
	}
	
}
