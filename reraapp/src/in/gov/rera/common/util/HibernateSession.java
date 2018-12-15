package in.gov.rera.common.util;



import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;




public class HibernateSession {

	private static final ThreadLocal<Session> threadLocal = new ThreadLocal<Session>();

   private static	HibernateSession hibernateSession;

	
	/**
	 * Returns the ThreadLocal Session instance. Lazy initialize the
	 * <code>SessionFactory</code> if needed.
	 * 
	 * @return Session
	 * @throws HibernateException
	 */
	public static  Session getReraSession(SessionFactory sessionFactory) throws HibernateException {
		//System.out.println("session");
	if(hibernateSession==null){
		//System.out.println("session1");
		hibernateSession=new HibernateSession();
		//System.out.println("session2");
	}
	//System.out.println("session3");
		Session session = threadLocal.get();
		//System.out.println("session4");
		if (session == null || !session.isOpen()) {
			//System.out.println("session5");
			session=	sessionFactory.openSession();
			threadLocal.set(session);
			//System.out.println("session6");
		}
		//System.out.println("return session");
		return session;
	}

	

	/**
	 * Close the single hibernate session instance.
	 * 
	 * @throws HibernateException
	 */
	public static  void closeSession() throws HibernateException {
		Session session = threadLocal.get();
		threadLocal.set(null);

		if (session != null) {
			session.close();
			
		}
	}

}
