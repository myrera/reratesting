package in.gov.rera.common.dao.impl;

import java.util.Calendar;

public interface IVisitorDao<E,PK> {

	E getVisitorCountByDate(Calendar date);
	void saveVisitors(E e);
	void updateVisitors(E e);
	long getTotalVisitors();
	
}
