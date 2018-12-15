package in.gov.rera.common.scheduler;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import in.gov.rera.common.util.ReraConstants;
import in.gov.rera.transaction.agentregistration.model.AgentRegistrationModel;
import in.gov.rera.transaction.projectregistration.model.ProjectRegistrationModel;
import in.gov.rera.transaction.projectregistration.model.ProjectRemarks;
import in.gov.rera.transaction.projectregistration.model.UserRemarks;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.CriteriaSpecification;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.apache.log4j.Logger;

@Service(value="RScheduler")
public class RScheduler extends Thread{
	static Logger log= Logger.getLogger(RScheduler.class);
	@Autowired
	SessionFactory sessionFactory;
	
	Session session;
	
	public void run(){
		
		while(true){
		try{
			session=sessionFactory.openSession();
			//setDefaultRemaks();
			deleteDraftAgent();
			deleteDraftProject();
			checkExpiryDate();
			
			if(session!=null && session.isOpen())
			session.close();
		//	sleep(60*1000);
				sleep(24*60*60*1000);
		}
		catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		}
		
	}
	
	
private void setDefaultRemaks(){
	
	DetachedCriteria dt=DetachedCriteria.forClass(ProjectRegistrationModel.class);
	dt.add(Restrictions.eq("status", ReraConstants.PENDING_OPRATOR));
	dt.setResultTransformer(CriteriaSpecification.DISTINCT_ROOT_ENTITY);
	List<Object> list= dt.getExecutableCriteria(session).list();
log.info("List  >>>>     >>>   "+list);
	for(Object ob:list){
	log.info("SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS");
		Transaction trx=	session.beginTransaction();
		ProjectRegistrationModel pm=(ProjectRegistrationModel)ob;
		ProjectRemarks rem=new ProjectRemarks();
		rem.setAccountsStatus("NA");
		rem.setEnggStatus("NA");
		rem.setRevenueStatus("NA");
		rem.setTcpStatus("NA");
		UserRemarks ur=new UserRemarks();
		ur.setStatus("NEW");
		List<UserRemarks> lt= new ArrayList<UserRemarks>();
		lt.add(ur);
		rem.setRemarksList(lt);
		pm.setProjectRemarks(rem);
		session.update(pm);
		trx.commit();
	
		log.info("EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE");
	}

}
	
	
	
	private void checkExpiryDate(){
		try{
	
		Calendar cal=Calendar.getInstance();
		Query q=session.createQuery("Select p from ProjectRegistrationModel p where p.status=:st and ( p.expireDate is null or p.expireDate<:cal)");
		q.setString("st", ReraConstants.APPROVED);
		q.setCalendar("cal", cal);
		
	 List<Object> lst=	q.list();
	 log.info(" checkExpiryDate of projects "+lst);
		for(Object ob:lst){
			Transaction trx=	session.beginTransaction();
			ProjectRegistrationModel pm=(ProjectRegistrationModel)ob;
			pm.setStatus(ReraConstants.EXPIRED);
			pm.getProjectUser().setStatus(ReraConstants.INACTIVE_USER);
			session.update(pm);
			trx.commit();
		}
		
		}catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		try{
			
			Calendar cal=Calendar.getInstance();
			
			Query q=session.createQuery("Select p from AgentRegistrationModel p where p.status=:st and ( p.expireDate is null or p.expireDate<:cal)");
			q.setString("st", ReraConstants.APPROVED);
			q.setCalendar("cal", cal);
			
		 List<Object> lst=	q.list();
		
		 log.info(" checkExpiryDate of agents "+lst);
		for(Object ob:lst){
			Transaction trx=	session.beginTransaction();
			AgentRegistrationModel pm=(AgentRegistrationModel)ob;
			pm.setStatus(ReraConstants.EXPIRED);
			pm.getAgentUser().setStatus(ReraConstants.INACTIVE_USER);
			session.update(pm);
			trx.commit();
		}
		}
		catch (Exception e) {
		log.error(e.getMessage(),e);
		}
	}
	
	private void deleteDraftProject(){
		try{
	
		Calendar cal=Calendar.getInstance();
		cal.set(Calendar.DATE, cal.get(Calendar.DATE)-15);
		Query q=session.createQuery("Select p from ProjectRegistrationModel p where p.status=:st and  p.createdOn<:cal");
		q.setString("st", ReraConstants.SAVE_AS_DRAFT);
		q.setCalendar("cal", cal);
		 List<Object> lst=	q.list();
	List lst2=new ArrayList(lst);
	 log.info(" delete  draft projects "+lst);
		for(Object ob:lst2){
			Transaction trx=	session.beginTransaction();
			trx.commit();
			session.delete(ob);
		}
		}catch (Exception e) {
		log.error(e.getMessage(),e);
		}
	}
     private void deleteDraftAgent(){
		try{
    	
 		Calendar cal=Calendar.getInstance();
 		cal.set(Calendar.DATE, cal.get(Calendar.DATE)-15);
 		Query q=session.createQuery("Select p from AgentRegistrationModel p where p.status=:st and  p.createdOn<:cal");
		q.setString("st", ReraConstants.SAVE_AS_DRAFT);
		q.setCalendar("cal", cal);
		 List<Object> lst=	q.list();
		 List lst2=new ArrayList(lst);
 	 log.info(" delete  draft agents "+lst);
 		for(Object ob:lst2){
 		Transaction trx=	session.beginTransaction();
 			session.delete(ob);
 			trx.commit();
 		}
		}catch (Exception e) {
			log.error(e.getMessage(),e);
		}
	}
public static void main(String[] args) {

	Calendar cal=Calendar.getInstance();
	cal.set(Calendar.DATE, cal.get(Calendar.DATE)-15);
}     
}
