package in.gov.rera.reportproblem.dao.impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import in.gov.rera.common.dao.impl.CommonDao;
import in.gov.rera.common.dao.impl.GenericDAOImpl;
import in.gov.rera.master.district.model.DistrictModel;
import in.gov.rera.reportproblem.dao.IComplaintReportDAO;
import in.gov.rera.reportproblem.dao.IReportProblemDAO;
import in.gov.rera.reportproblem.model.ComplaintModelReport;
import in.gov.rera.reportproblem.model.ReportProblemModel;

@Repository(value = "IComplaintReportDAO")
public class ComplaintReportDAOImpl extends GenericDAOImpl<ComplaintModelReport, Long> implements IComplaintReportDAO{
	
	@Autowired
	CommonDao<Object, Long> commonDao;
	
/*	@Autowired
	IReportProblemDAO<ReportProblemModel, Long> reportModel;*/
	
	public ComplaintModelReport SaveComplaintReportModel(ComplaintModelReport enitity) {
		
		super.createEntity(enitity);
		
		 return enitity;
		
		}
}
