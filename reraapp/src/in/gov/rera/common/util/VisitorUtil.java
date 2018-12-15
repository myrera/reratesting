package in.gov.rera.common.util;

import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import in.gov.rera.common.dao.impl.IVisitorDao;
import in.gov.rera.common.model.VisitorsModel;

@Service(value="VisitorUtil")
public class VisitorUtil {

	public static final String RERA_VISITOR_FLAG="RERA_VISITOR_FLAG";
	public static final String RERA_TOTAL_VISITORS_COUNT="RERA_TOTAL_VISITORS_COUNT";
	@Autowired
	private IVisitorDao<VisitorsModel, Long> vDao;
	
	private VisitorsModel visitor;
	
	public void getVisitorCount(HttpServletRequest request){
		HttpSession ses=request.getSession(true);
		String vFlag=(String)ses.getAttribute(RERA_VISITOR_FLAG);
		if(vFlag==null){
			checkVisitorForToday();
			if(visitor==null){
				saveVisitor();
			}else{
				updateVisitor();
			}
		ses.setAttribute(RERA_VISITOR_FLAG, "YES");	
		}
		
		getTotalVisitorCount(request);
	}
	
	private void saveVisitor(){
		Calendar date=Calendar.getInstance();
		date.set(Calendar.HOUR, 0);
		date.set(Calendar.MINUTE, 0);
		date.set(Calendar.SECOND, 0);
		date.set(Calendar.MILLISECOND, 0);
		visitor=new VisitorsModel();
		visitor.setvDate(date);
		visitor.setCount(1);
		vDao.saveVisitors(visitor);
	}
	private void updateVisitor(){
		visitor.setCount(visitor.getCount()+1);
		vDao.updateVisitors(visitor);
	}
	private void getTotalVisitorCount(HttpServletRequest request){
		String count= vDao.getTotalVisitors()+"";
		while(count.length()<7){
			count="0"+count;
		}
		request.setAttribute(RERA_TOTAL_VISITORS_COUNT, count);
	} 
	private void checkVisitorForToday(){
		Calendar date=Calendar.getInstance();
		date.set(Calendar.HOUR, 0);
		date.set(Calendar.MINUTE, 0);
		date.set(Calendar.SECOND, 0);
		date.set(Calendar.MILLISECOND, 0);
		
		visitor=vDao.getVisitorCountByDate(date);
	} 
}
