package in.gov.rera.outreachregister.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;

import in.gov.rera.common.model.EnquiryModel;
import in.gov.rera.master.district.model.DistrictModel;
import in.gov.rera.outreachregistraion.model.OutReachRegModel;
import in.gov.rera.outreachregistraion.model.OutReachRegistrationModel;

public interface IOutReachRegistrationDAO <E ,PK>{
	
	public  OutReachRegModel saveOutReachRegModel(OutReachRegModel entity) ;
	
	
	public List<Object> getDistrictList(Long id);
	
	public List<Object> getEventList();
	public List<Object> getEventList(String eventName);
    
}
