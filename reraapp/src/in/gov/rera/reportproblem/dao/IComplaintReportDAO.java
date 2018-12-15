package in.gov.rera.reportproblem.dao;

import in.gov.rera.reportproblem.model.ComplaintModelReport;

public interface IComplaintReportDAO<E ,PK> {
	
	public  ComplaintModelReport SaveComplaintReportModel(ComplaintModelReport entity) ;
}
