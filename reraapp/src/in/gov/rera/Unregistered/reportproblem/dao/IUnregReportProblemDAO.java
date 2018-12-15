package in.gov.rera.Unregistered.reportproblem.dao;

import java.util.List;

import in.gov.rera.reportproblem.model.ReportProblemModel;
import in.gov.rera.transaction.unregistered.model.UnregisteredProjectDetail;

public interface IUnregReportProblemDAO <E ,PK>{
	
	public  UnregisteredProjectDetail SaveUnregReportProblem(UnregisteredProjectDetail entity) ;
	
		
	List<Object> getUnregReportProblemList();
	
	 E get(PK pk);
	
	 UnregisteredProjectDetail getUnregRreportModelByPk(Long pk)throws Exception;
	
	/*List<E> getReportList(DetachedCriteria dt);*/
	
	/*public List<Object> getEventList();
	public List<Object> getEventList(String eventName);*/
    
}
