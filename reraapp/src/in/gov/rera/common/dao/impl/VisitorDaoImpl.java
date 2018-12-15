package in.gov.rera.common.dao.impl;

import java.util.Calendar;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import in.gov.rera.common.model.VisitorsModel;

@Repository
public class VisitorDaoImpl<E,PK> extends GenericDAOImpl<VisitorsModel, Long> implements IVisitorDao<VisitorsModel, Long> {

	@Override
	public VisitorsModel getVisitorCountByDate(Calendar date) {
		DetachedCriteria dt=DetachedCriteria.forClass(VisitorsModel.class);
		dt.add(Restrictions.eq("vDate", date));
		List<VisitorsModel> lst=super.getList(dt);
		if(lst==null || lst.size()==0)
		return null;
		else
			return lst.get(0);
	}

	@Override
	public void saveVisitors(VisitorsModel e) {
		super.createEntity(e);
		
	}

	@Override
	public void updateVisitors(VisitorsModel e) {
		super.updateOrUpdateEntity(e);
		
	}

	@Override
	public long getTotalVisitors() {
		Query query=getCurrentSession().createQuery("Select sum(v.count) from VisitorsModel v");
		List ls=query.list();
		if(ls==null)
			return 0;
		else
		return (Long)query.list().get(0);
	}

}
