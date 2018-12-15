package in.gov.rera.outreachregister.dao.impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import in.gov.rera.common.dao.impl.CommonDao;
import in.gov.rera.common.dao.impl.CommonDaoImpl;
import in.gov.rera.common.dao.impl.GenericDAOImpl;
import in.gov.rera.common.model.EnquiryModel;
import in.gov.rera.common.util.ReraConstants;
import in.gov.rera.master.district.model.DistrictModel;
import in.gov.rera.outreachregister.dao.IOutReachRegistrationDAO;
import in.gov.rera.outreachregistraion.model.OutReachEventModel;
import in.gov.rera.outreachregistraion.model.OutReachRegModel;
import in.gov.rera.outreachregistraion.model.OutReachRegistrationModel;
import in.gov.rera.transaction.agentregistration.model.AgentRegistrationModel;
import in.gov.rera.transaction.projectregistration.dao.EnquiryDetailsDAO;
import in.gov.rera.transaction.projectregistration.model.ProjectRegistrationModel;

@Repository(value = "IOutReachRegistrationDAO")
public class OutReachRegDetailsDAOImpl extends GenericDAOImpl<OutReachRegModel, Long> implements IOutReachRegistrationDAO{
	
	@Autowired
	CommonDao<Object, Long> commonDao;
	
	
	public OutReachRegModel saveOutReachRegModel(OutReachRegModel enitity) {
		
		super.createEntity(enitity);
		
		 return enitity;
		
		
		
		
	}

	@Override
	public List<Object> getDistrictList(Long id) {
		

		DetachedCriteria dt = DetachedCriteria.forClass(DistrictModel.class, "pr");
		dt.add(Restrictions.eq("pr.stateUtModel.stateUtId", 117L));
		

		List<Object> distList = commonDao.getList(dt);
		
		
		return distList;
	}
	
	
	
	@Override
	public List<Object> getEventList() {
		

		DetachedCriteria dt = DetachedCriteria.forClass(OutReachEventModel.class, "evn");
		List<Object> eventList = commonDao.getList(dt);
		
		
		return eventList;
	}
	
	@Override
	public List<Object> getEventList(String eventName) {
		

		DetachedCriteria dt = DetachedCriteria.forClass(OutReachEventModel.class, "evn");
		List<Object> eventList = commonDao.getList(dt);
		
		
		return eventList;
	}
	

}
