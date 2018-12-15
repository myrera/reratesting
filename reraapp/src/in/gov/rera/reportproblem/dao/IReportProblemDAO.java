package in.gov.rera.reportproblem.dao;

import java.util.List;

import in.gov.rera.reportproblem.model.ReportProblemModel;

public interface IReportProblemDAO <E ,PK>{
	
	public  ReportProblemModel SaveReportProblemModel(ReportProblemModel entity) ;
	
	
	public List<Object> getDistrictList(Long id);
	
	List<Object> getReportProblemList();
	
	 E get(PK pk);
	
	ReportProblemModel getreportModelByPk(Long pk)throws Exception;
	
	/*List<E> getReportList(DetachedCriteria dt);*/
	
	/*public List<Object> getEventList();
	public List<Object> getEventList(String eventName);*/
    
}
