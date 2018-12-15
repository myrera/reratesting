package in.gov.rera.Unregistered.reportproblem.dao.impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import in.gov.rera.Unregistered.reportproblem.dao.IUnregReportProblemDAO;
import in.gov.rera.common.dao.impl.CommonDao;
import in.gov.rera.common.dao.impl.GenericDAOImpl;
import in.gov.rera.master.district.model.DistrictModel;
import in.gov.rera.reportproblem.model.ReportProblemModel;
import in.gov.rera.transaction.unregistered.model.UnregisteredProjectDetail;

@Repository(value = "IUnregReportProblemDAO")
public class UnregReportProblemDAOImpl extends GenericDAOImpl<UnregisteredProjectDetail, Long> implements IUnregReportProblemDAO{
	
	@Autowired
	CommonDao<Object, Long> commonDao;

	@Override
	public UnregisteredProjectDetail SaveUnregReportProblem(UnregisteredProjectDetail entity) {
		super.createEntity(entity);
		
		 return entity;
		
	}

	@Override
	public List getUnregReportProblemList() {
          DetachedCriteria dt = DetachedCriteria.forClass(UnregisteredProjectDetail.class);
		
		  return commonDao.getList(dt);
	}

	@Override
	public Object get(Object pk) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public UnregisteredProjectDetail getUnregRreportModelByPk(Long pk) throws Exception {
		DetachedCriteria dt = DetachedCriteria.forClass(UnregisteredProjectDetail.class,"unReg");
		dt.add(Restrictions.eq("rpm.reportId", pk));
		
		return (UnregisteredProjectDetail) commonDao.getList(dt);
	}
	
	
	
}
