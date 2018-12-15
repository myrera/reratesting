package in.gov.rera.reportproblem.dao.impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import in.gov.rera.common.dao.impl.CommonDao;
import in.gov.rera.common.dao.impl.GenericDAOImpl;
import in.gov.rera.master.district.model.DistrictModel;
import in.gov.rera.reportproblem.dao.IReportProblemDAO;
import in.gov.rera.reportproblem.model.ReportProblemModel;

@Repository(value = "IReportProblemDAO")
public class ReportProblemDAOImpl extends GenericDAOImpl<ReportProblemModel, Long> implements IReportProblemDAO{
	
	@Autowired
	CommonDao<Object, Long> commonDao;
	
/*	@Autowired
	IReportProblemDAO<ReportProblemModel, Long> reportModel;*/
	
	public ReportProblemModel SaveReportProblemModel(ReportProblemModel enitity) {
		
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
	public List<Object> getReportProblemList() {
		DetachedCriteria dt = DetachedCriteria.forClass(ReportProblemModel.class);
		
		return commonDao.getList(dt);
	}
	
	@Override
	public ReportProblemModel getreportModelByPk(Long pk) throws Exception {
		DetachedCriteria dt = DetachedCriteria.forClass(ReportProblemModel.class,"rpm");
		dt.add(Restrictions.eq("rpm.reportId", pk));
		
		return (ReportProblemModel) commonDao.getList(dt);
		
		//return reportModel.get(pk);
	}

	@Override
	public Object get(Object pk) {
		// TODO Auto-generated method stub
		return null;
	}

}
