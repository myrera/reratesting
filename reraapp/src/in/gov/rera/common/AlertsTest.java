package in.gov.rera.common;

import java.io.Serializable;
import java.sql.Connection;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Timer;
import java.util.TimerTask;

import javax.naming.NamingException;
import javax.naming.Reference;

import org.hibernate.Cache;
import org.hibernate.HibernateException;
import org.hibernate.Interceptor;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.StatelessSession;
import org.hibernate.Transaction;
import org.hibernate.TypeHelper;
import org.hibernate.criterion.CriteriaSpecification;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.hibernate.engine.FilterDefinition;
import org.hibernate.metadata.ClassMetadata;
import org.hibernate.metadata.CollectionMetadata;
import org.hibernate.stat.Statistics;
import org.springframework.beans.factory.annotation.Autowired;

import in.gov.rera.common.model.EnquiryModel;
import in.gov.rera.common.util.HibernateSession;
import in.gov.rera.common.util.ReraConstants;
import in.gov.rera.notification.service.MailService;
import in.gov.rera.notification.service.SmsService;
import in.gov.rera.transaction.agentregistration.model.AgentRegistrationModel;
import in.gov.rera.transaction.projectregistration.model.ProjectRegistrationModel;

public class AlertsTest extends TimerTask{

	@Override
	public void run() {
		AlertsTest alerts=new AlertsTest();
		alerts.disableAgentTempLoginFirstEnq();
	}

	public static void main(String args[]) throws InterruptedException {

		Timer time = new Timer(); // Instantiate Timer Object
		AlertsTest st = new AlertsTest(); // Instantiate SheduledTask class
		time.schedule(st, 0, 1000); // Create Repetitively task for every 1 secs

		//for demo only.
		for (int i = 0; i <= 5; i++) {
			System.out.println("Execution in Main Thread...." + i);
			Thread.sleep(2000);
			if (i == 5) {
				System.out.println("Application Terminates");
				System.exit(0);
			}
		}
	}
	
	public void scheduleTest() throws InterruptedException {

		Timer time = new Timer(); // Instantiate Timer Object
		AlertsTest st = new AlertsTest(); // Instantiate SheduledTask class
		time.schedule(st, 0, 1000); // Create Repetitively task for every 1 secs

		//for demo only.
		for (int i = 0; i <= 5; i++) {
			System.out.println("Execution in Main Thread...." + i);
			Thread.sleep(2000);
			if (i == 5) {
				System.out.println("Application Terminates");
				System.exit(0);
			}
		}
	}

/*	@Autowired
	CommonDao<Object, Long> commonDao;

	@Autowired
	MailService mailService;

	@Autowired
	SmsService smsService;*/
	
	//@Autowired
	//AnnotationSessionFactoryBean sessionFactory=new AnnotationSessionFactoryBean();
	
	//@Autowired
	SessionFactory sessionFactory;
	
	
	public List<Object> getList(DetachedCriteria dt) {
		dt.setResultTransformer(CriteriaSpecification.DISTINCT_ROOT_ENTITY);
		return dt.getExecutableCriteria(getCurrentSession()).list();

	}
	
	public void updateObject(Object entity) {
		Session ses = getCurrentSession();
		Transaction trx = ses.beginTransaction();
		ses.saveOrUpdate(entity);
		trx.commit();
	}
	
	public Session getCurrentSession() {
		//SessionFactory sessionFactory;
		System.out.println(HibernateSession.getReraSession(sessionFactory));
		return HibernateSession.getReraSession(sessionFactory);
	}

	public void disableTempLoginFirstEnq() {
		//CommonDao<Object, Long> commonDao=new CommonDaoImpl<Object, Long>();
		MailService mailService=new MailService();
		SmsService smsService=new SmsService();
		//String str = "Select p.firstEnquiryDate from ProjectRegistrationModel p where p.updatedFlag!='YES' and p.promoterUpdatedOn<>null and p.firstEnquiryDate!=null";
		DetachedCriteria dt = DetachedCriteria.forClass(ProjectRegistrationModel.class, "pr");
		dt.add(Restrictions.eq("pr.status", ReraConstants.PENDING_OPRATOR));
		dt.add(Restrictions.isNull("pr.updatedFlag"));
		dt.add(Restrictions.isNull("pr.promoterUpdatedOn"));
		dt.add(Restrictions.isNotNull("pr.firstEnquiryDate"));
		System.out.println(dt);
		List<Object> list = getList(dt);

		if(list!=null && list.size()>0) {
			for (int i = 0; i < list.size(); i++) {
				ProjectRegistrationModel project=(ProjectRegistrationModel) list.get(i);
				System.out.println("ack number>>>>>>>>>>>>"+project.getApplicationNo());
				Date startDate = project.getFirstEnquiryDate();
				Date curDate = new Date();
				int diffInDays = (int) ((curDate.getTime() - startDate.getTime()) / (1000 * 60 * 60 * 24));

				Calendar c = Calendar.getInstance();
				c.setTime(startDate);
				c.add(Calendar.DATE, 5);
				Date Valid=c.getTime();
				System.out.println("valid>>>>>>>>>>>>> "+Valid);
				System.out.println("diffInDays>>>> "+diffInDays);
				if(diffInDays>=5) {
					project.setUpdatedFlag("YES");
					//project.setStatus(ReraConstants.PENDING_AUTHORITY);
					updateObject(project);

					EnquiryModel em = new EnquiryModel();
					em.setEmailId(project.getPromoterDetailsModel().getEmailId());
					em.setSubject("RERA TEMP LOGIN HAS BEEN DISABLED");
					StringBuffer sb = new StringBuffer();
					sb.append("Dear Promoter ").append(",\n");
					sb.append("Your Temp Login Has been disabled in RERA portal \n");
					sb.append("it was Valid Only for 5 Days Till ").append(Valid+".\n");
					//sb.append("Please Update the details through temp Login : ").append("https://rera.karnataka.gov.in/rerauser/loginPage").append("\n \n\n\n");
					sb.append("Regards : \n ").append("RERA Karnataka Team");
					System.out.println(sb.toString());
					em.setEnquiryText(sb.toString());
					mailService.sendMail(em);

					String contactNumber=project.getPromoterDetailsModel().getMobileNo();
					System.out.println("mobile>>>>>>>>>."+contactNumber);
					if (contactNumber != null ) {
						StringBuffer smsStringBuffer = new StringBuffer();
						smsStringBuffer.append("Dear Promoter").append(",\n");
						smsStringBuffer.append("Your Temp Login Has been disabled in RERA portal \n");
						smsStringBuffer.append("it was Valid Only for 5 Days Till ").append(Valid+".\n");
						//smsStringBuffer.append("Please Update the details through temp Login : ").append("https://rera.karnataka.gov.in/rerauser/loginPage").append("\n \n\n\n");
						smsStringBuffer.append("Regards : \n ").append("RERA Karnataka Team");
						System.out.println(smsStringBuffer.toString());
						smsService.sendSMS(contactNumber, smsStringBuffer.toString());

					}
					System.out.println("temp login disabled");
				}else {
					EnquiryModel em = new EnquiryModel();
					em.setEmailId(project.getPromoterDetailsModel().getEmailId());
					em.setSubject("REMINDER TO UPDATE DETAILS BY TEMP LOGIN");
					StringBuffer sb = new StringBuffer();
					sb.append("Dear Promoter ").append(",\n");
					sb.append("Your Temp Login Validity is created in RERA portal \n");
					sb.append("is Valid Only for ").append(5-diffInDays).append(" Days Till ").append(Valid+".\n");
					sb.append("Please Update the details through temp Login : ").append("https://rera.karnataka.gov.in/rerauser/loginPage").append("\n \n\n\n");
					sb.append("Regards : \n ").append("RERA Karnataka Team");
					System.out.println(sb.toString());
					em.setEnquiryText(sb.toString());
					mailService.sendMail(em);

					String contactNumber=project.getPromoterDetailsModel().getMobileNo();
					System.out.println("mobile>>>>>>>>>."+contactNumber);
					if (contactNumber != null ) {
						StringBuffer smsStringBuffer = new StringBuffer();
						smsStringBuffer.append("Dear Promoter").append(",\n");
						smsStringBuffer.append("Your Temp Login Validity is created in RERA portal \\n");
						smsStringBuffer.append("is Valid Only for ").append(5-diffInDays).append(" Days Till ").append(Valid+".\n");
						smsStringBuffer.append("Please Update the details through temp Login : ").append("https://rera.karnataka.gov.in/rerauser/loginPage").append("\n \n\n\n");
						smsStringBuffer.append("Regards : \n ").append("RERA Karnataka Team");
						System.out.println(smsStringBuffer.toString());
						smsService.sendSMS(contactNumber, smsStringBuffer.toString());

					}
				}
			}
		}else {
			System.out.println("no enquiries");
		}
	}

	public void disableTempLoginSecondEnq() {
		//CommonDao<Object, Long> commonDao=new CommonDaoImpl<Object, Long>();
		MailService mailService=new MailService();
		SmsService smsService=new SmsService();
		//String str = "Select p.firstEnquiryDate from ProjectRegistrationModel p where p.updatedFlag='YES' and p.promoterUpdatedOn<>null and p.firstEnquiryDate!=null and p.secondEnquiryDate!=null";
		DetachedCriteria dt = DetachedCriteria.forClass(ProjectRegistrationModel.class, "pr");
		dt.add(Restrictions.eq("pr.status", ReraConstants.PENDING_OPRATOR));
		dt.add(Restrictions.isNull("pr.updatedFlag"));
		dt.add(Restrictions.isNull("pr.promoterUpdatedOn"));
		dt.add(Restrictions.isNotNull("pr.firstEnquiryDate"));
		dt.add(Restrictions.isNotNull("pr.secondEnquiryDate"));
		List<Object> list = getList(dt);

		if(list!=null && list.size()>0) {
			for (int i = 0; i < list.size(); i++) {
				ProjectRegistrationModel project=(ProjectRegistrationModel) list.get(i);
				System.out.println("ack number>>>>>>>>>>>>"+project.getApplicationNo());
				Date startDate = project.getSecondEnquiryDate();
				Date curDate = new Date();
				int diffInDays = (int) ((curDate.getTime() - startDate.getTime()) / (1000 * 60 * 60 * 24));

				Calendar c = Calendar.getInstance();
				c.setTime(startDate);
				c.add(Calendar.DATE, 3);
				Date Valid=c.getTime();
				System.out.println("valid>>>>>>>>>>>>> "+Valid);
				System.out.println("diffInDays>>>> "+diffInDays);
				if(diffInDays>=3) {
					project.setUpdatedFlag("YES");
					updateObject(project);

					EnquiryModel em = new EnquiryModel();
					em.setEmailId(project.getPromoterDetailsModel().getEmailId());
					em.setSubject("RERA TEMP LOGIN HAS BEEN DISABLED");
					StringBuffer sb = new StringBuffer();
					sb.append("Dear Promoter ").append(",\n");
					sb.append("Your Temp Login Has been disabled in RERA portal \n");
					sb.append("it was Valid Only for 3 Days Till ").append(Valid+".\n");
					//sb.append("Please Update the details through temp Login : ").append("https://rera.karnataka.gov.in/rerauser/loginPage").append("\n \n\n\n");
					sb.append("Regards : \n ").append("RERA Karnataka Team");
					System.out.println(sb.toString());
					em.setEnquiryText(sb.toString());
					mailService.sendMail(em);

					String contactNumber=project.getPromoterDetailsModel().getMobileNo();
					System.out.println("mobile>>>>>>>>>."+contactNumber);
					if (contactNumber != null ) {
						StringBuffer smsStringBuffer = new StringBuffer();
						smsStringBuffer.append("Dear Promoter").append(",\n");
						smsStringBuffer.append("Your Temp Login Has been disabled in RERA portal \n");
						smsStringBuffer.append("it was Valid Only for 3 Days Till ").append(Valid+".\n");
						//smsStringBuffer.append("Please Update the details through temp Login : ").append("https://rera.karnataka.gov.in/rerauser/loginPage").append("\n \n\n\n");
						smsStringBuffer.append("Regards : \n ").append("RERA Karnataka Team");
						System.out.println(smsStringBuffer.toString());
						smsService.sendSMS(contactNumber, smsStringBuffer.toString());

					}
					System.out.println("temp login disabled");
				}else {
					EnquiryModel em = new EnquiryModel();
					em.setEmailId(project.getPromoterDetailsModel().getEmailId());
					em.setSubject("REMINDER TO UPDATE DETAILS BY TEMP LOGIN");
					StringBuffer sb = new StringBuffer();
					sb.append("Dear Promoter ").append(",\n");
					sb.append("Your Temp Login Validity is created in RERA portal \n");
					sb.append("is Valid Only for ").append(3-diffInDays).append(" Days Till ").append(Valid+".\n");
					sb.append("Please Update the details through temp Login : ").append("https://rera.karnataka.gov.in/rerauser/loginPage").append("\n \n\n\n");
					sb.append("Regards : \n ").append("RERA Karnataka Team");
					System.out.println(sb.toString());
					em.setEnquiryText(sb.toString());
					mailService.sendMail(em);

					String contactNumber=project.getPromoterDetailsModel().getMobileNo();
					System.out.println("mobile>>>>>>>>>."+contactNumber);
					if (contactNumber != null ) {
						StringBuffer smsStringBuffer = new StringBuffer();
						smsStringBuffer.append("Dear Promoter").append(",\n");
						smsStringBuffer.append("Your Temp Login Validity is created in RERA portal \\n");
						smsStringBuffer.append("is Valid Only for ").append(3-diffInDays).append(" Days Till ").append(Valid+".\n");
						smsStringBuffer.append("Please Update the details through temp Login : ").append("https://rera.karnataka.gov.in/rerauser/loginPage").append("\n \n\n\n");
						smsStringBuffer.append("Regards : \n ").append("RERA Karnataka Team");
						System.out.println(smsStringBuffer.toString());
						smsService.sendSMS(contactNumber, smsStringBuffer.toString());

					}
				}
			}
		}else {
			System.out.println("no enquiries");
		}
	}

	public void disableAgentTempLoginFirstEnq() {
		//CommonDao<Object, Long> commonDao=new CommonDaoImpl<Object, Long>();
		MailService mailService=new MailService();
		SmsService smsService=new SmsService();
		//String str = "Select p.firstEnquiryDate from ProjectRegistrationModel p where p.updatedFlag!='YES' and p.promoterUpdatedOn<>null and p.firstEnquiryDate!=null";
		DetachedCriteria dt = DetachedCriteria.forClass(AgentRegistrationModel.class, "pr");
		dt.add(Restrictions.eq("pr.status", ReraConstants.PENDING_OPRATOR));
		dt.add(Restrictions.isNull("pr.updatedFlag"));
		dt.add(Restrictions.isNull("pr.promoterUpdatedOn"));
		dt.add(Restrictions.isNotNull("pr.firstEnquiryDate"));
		System.out.println(dt);
		List<Object> list =getList(dt);

		if(list!=null && list.size()>0) {
			for (int i = 0; i < list.size(); i++) {
				AgentRegistrationModel project=(AgentRegistrationModel) list.get(i);
				System.out.println("ack number>>>>>>>>>>>>"+project.getApplicationNo());
				Date startDate = project.getFirstEnquiryDate();
				Date curDate = new Date();
				Calendar c = Calendar.getInstance();
				c.setTime(startDate);
				c.add(Calendar.DATE, 5);
				Date Valid=c.getTime();
				System.out.println("valid>>>>>>>>>>>>> "+Valid);
				int diffInDays = (int) ((curDate.getTime() - startDate.getTime()) / (1000 * 60 * 60 * 24));
				System.out.println("diffInDays>>>> "+diffInDays);
				if(diffInDays>=5) {
					project.setUpdatedFlag("YES");
					//project.setStatus(ReraConstants.PENDING_AUTHORITY);
					updateObject(project);

					EnquiryModel em = new EnquiryModel();
					String mail=null;
					if (project.getRegistrationType().equalsIgnoreCase(ReraConstants.INDVISUAL_REG)) {
						mail=project.getAgentDetailsModel().getAgentEmailId();
					} else {
						mail=project.getAgentDetailsModel().getFirmEmail();
					}
					em.setEmailId(mail);
					em.setSubject("RERA TEMP LOGIN HAS BEEN DISABLED");
					StringBuffer sb = new StringBuffer();
					sb.append("Dear Agent ").append(",\n");
					sb.append("Your Temp Login Has been disabled in RERA portal \n");
					sb.append("it was Valid Only for 5 Days Till ").append(Valid+".\n");
					//sb.append("Please Update the details through temp Login : ").append("https://rera.karnataka.gov.in/rerauser/loginPage").append("\n \n\n\n");
					sb.append("Regards : \n ").append("RERA Karnataka Team");
					System.out.println(sb.toString());
					em.setEnquiryText(sb.toString());
					mailService.sendMail(em);

					String contactNumber=project.getAgentDetailsModel().getFirmMobileNo();
					System.out.println("mobile>>>>>>>>>."+contactNumber);
					if (contactNumber != null ) {
						StringBuffer smsStringBuffer = new StringBuffer();
						smsStringBuffer.append("Dear Promoter").append(",\n");
						smsStringBuffer.append("Your Temp Login Has been disabled in RERA portal \n");
						smsStringBuffer.append("it was Valid Only for 5 Days Till ").append(Valid+".\n");
						smsStringBuffer.append("Regards : \n ").append("RERA Karnataka Team");
						System.out.println(smsStringBuffer.toString());
						smsService.sendSMS(contactNumber, smsStringBuffer.toString());

					}
					System.out.println("temp login disabled");
				}else {
					EnquiryModel em = new EnquiryModel();
					String mail=null;
					if (project.getRegistrationType().equalsIgnoreCase(ReraConstants.INDVISUAL_REG)) {
						mail=project.getAgentDetailsModel().getAgentEmailId();
					} else {
						mail=project.getAgentDetailsModel().getFirmEmail();
					}
					em.setEmailId(mail);
					em.setSubject("REMINDER TO UPDATE DETAILS BY TEMP LOGIN");
					StringBuffer sb = new StringBuffer();
					sb.append("Dear Agent ").append(",\n");
					sb.append("Your Temp Login Validity is created in RERA portal \n");
					sb.append("is Valid Only for ").append(5-diffInDays).append(" Days Till ").append(Valid+".\n");
					sb.append("Please Update the details through temp Login : ").append("https://rera.karnataka.gov.in/rerauser/loginPage").append("\n \n\n\n");
					sb.append("Regards : \n ").append("RERA Karnataka Team");
					System.out.println(sb.toString());
					em.setEnquiryText(sb.toString());
					mailService.sendMail(em);

					String contactNumber=project.getAgentDetailsModel().getFirmMobileNo();
					System.out.println("mobile>>>>>>>>>."+contactNumber);
					if (contactNumber != null ) {
						StringBuffer smsStringBuffer = new StringBuffer();
						smsStringBuffer.append("Dear Agent").append(",\n");
						smsStringBuffer.append("Your Temp Login Validity is created in RERA portal \\n");
						smsStringBuffer.append("is Valid Only for ").append(5-diffInDays).append(" Days Till ").append(Valid+".\n");
						smsStringBuffer.append("Please Update the details through temp Login : ").append("https://rera.karnataka.gov.in/rerauser/loginPage").append("\n \n\n\n");
						smsStringBuffer.append("Regards : \n ").append("RERA Karnataka Team");
						System.out.println(smsStringBuffer.toString());
						smsService.sendSMS(contactNumber, smsStringBuffer.toString());

					}
				}
			}
		}else {
			System.out.println("no enquiries");
		}
	}

	public void disableAgentTempLoginSecondEnq() {
		//CommonDao<Object, Long> commonDao=new CommonDaoImpl<Object, Long>();
		MailService mailService=new MailService();
		SmsService smsService=new SmsService();
		//String str = "Select p.firstEnquiryDate from ProjectRegistrationModel p where p.updatedFlag='YES' and p.promoterUpdatedOn<>null and p.firstEnquiryDate!=null and p.secondEnquiryDate!=null";
		DetachedCriteria dt = DetachedCriteria.forClass(AgentRegistrationModel.class, "pr");
		dt.add(Restrictions.eq("pr.status", ReraConstants.PENDING_OPRATOR));
		dt.add(Restrictions.isNull("pr.updatedFlag"));
		dt.add(Restrictions.isNull("pr.promoterUpdatedOn"));
		dt.add(Restrictions.isNotNull("pr.firstEnquiryDate"));
		dt.add(Restrictions.isNotNull("pr.secondEnquiryDate"));
		List<Object> list = getList(dt);

		if(list!=null && list.size()>0) {
			for (int i = 0; i < list.size(); i++) {
				AgentRegistrationModel project=(AgentRegistrationModel) list.get(i);
				System.out.println("ack number>>>>>>>>>>>>"+project.getApplicationNo());
				Date startDate = project.getSecondEnquiryDate();
				Date curDate = new Date();
				int diffInDays = (int) ((curDate.getTime() - startDate.getTime()) / (1000 * 60 * 60 * 24));

				Calendar c = Calendar.getInstance();
				c.setTime(startDate);
				c.add(Calendar.DATE, 3);
				Date Valid=c.getTime();
				System.out.println("valid>>>>>>>>>>>>> "+Valid);

				System.out.println("diffInDays>>>> "+diffInDays);
				if(diffInDays>=3) {
					project.setUpdatedFlag("YES");
					updateObject(project);

					EnquiryModel em = new EnquiryModel();
					String mail=null;
					if (project.getRegistrationType().equalsIgnoreCase(ReraConstants.INDVISUAL_REG)) {
						mail=project.getAgentDetailsModel().getAgentEmailId();
					} else {
						mail=project.getAgentDetailsModel().getFirmEmail();
					}
					em.setEmailId(mail);
					em.setSubject("RERA TEMP LOGIN HAS BEEN DISABLED");
					StringBuffer sb = new StringBuffer();
					sb.append("Dear Agent ").append(",\n");
					sb.append("Your Temp Login Has been disabled in RERA portal \n");
					sb.append("it was Valid Only for 3 Days Till ").append(Valid+".\n");
					//sb.append("Please Update the details through temp Login : ").append("https://rera.karnataka.gov.in/rerauser/loginPage").append("\n \n\n\n");
					sb.append("Regards : \n ").append("RERA Karnataka Team");
					System.out.println(sb.toString());
					em.setEnquiryText(sb.toString());
					mailService.sendMail(em);

					String contactNumber=project.getAgentDetailsModel().getFirmMobileNo();
					System.out.println("mobile>>>>>>>>>."+contactNumber);
					if (contactNumber != null ) {
						StringBuffer smsStringBuffer = new StringBuffer();
						smsStringBuffer.append("Dear Promoter").append(",\n");
						smsStringBuffer.append("Your Temp Login Has been disabled in RERA portal \n");
						smsStringBuffer.append("it was Valid Only for 3 Days Till ").append(Valid+".\n");
						smsStringBuffer.append("Regards : \n ").append("RERA Karnataka Team");
						System.out.println(smsStringBuffer.toString());
						smsService.sendSMS(contactNumber, smsStringBuffer.toString());

					}
					System.out.println("temp login disabled");
				}else {
					EnquiryModel em = new EnquiryModel();
					String mail=null;
					if (project.getRegistrationType().equalsIgnoreCase(ReraConstants.INDVISUAL_REG)) {
						mail=project.getAgentDetailsModel().getAgentEmailId();
					} else {
						mail=project.getAgentDetailsModel().getFirmEmail();
					}
					em.setEmailId(mail);
					em.setSubject("REMINDER TO UPDATE DETAILS BY TEMP LOGIN");
					StringBuffer sb = new StringBuffer();
					sb.append("Dear Agent ").append(",\n");
					sb.append("Your Temp Login Validity is created in RERA portal \n");
					sb.append("is Valid Only for ").append(3-diffInDays).append(" Days Till ").append(Valid+".\n");
					sb.append("Please Update the details through temp Login : ").append("https://rera.karnataka.gov.in/rerauser/loginPage").append("\n \n\n\n");
					sb.append("Regards : \n ").append("RERA Karnataka Team");
					System.out.println(sb.toString());
					em.setEnquiryText(sb.toString());
					mailService.sendMail(em);

					String contactNumber=project.getAgentDetailsModel().getFirmMobileNo();
					System.out.println("mobile>>>>>>>>>."+contactNumber);
					if (contactNumber != null ) {
						StringBuffer smsStringBuffer = new StringBuffer();
						smsStringBuffer.append("Dear Agent").append(",\n");
						smsStringBuffer.append("Your Temp Login Validity is created in RERA portal \\n");
						smsStringBuffer.append("is Valid Only for ").append(3-diffInDays).append(" Days Till ").append(Valid+".\n");
						smsStringBuffer.append("Please Update the details through temp Login : ").append("https://rera.karnataka.gov.in/rerauser/loginPage").append("\n \n\n\n");
						smsStringBuffer.append("Regards : \n ").append("RERA Karnataka Team");
						System.out.println(smsStringBuffer.toString());
						smsService.sendSMS(contactNumber, smsStringBuffer.toString());

					}

				}
			}
		}else {
			System.out.println("no enquiries");
		}
	}

}
