package in.gov.rera.admin.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface DashboardService {

	 Map<String,String> getPieChartData();
	
	List<Object> getLineChartData();
	
	List<Object> getBarChartData();

	Map<String, Integer> getDashboardTotals();

	Integer getOperatorsTotalsByDate(String operator, Date startDate, Date endDate);

	Map<String, Integer> getApplicationsTotalsByDate(Date startDate, Date endDate);
	
	
}
