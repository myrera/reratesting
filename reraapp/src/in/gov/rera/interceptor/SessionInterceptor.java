package in.gov.rera.interceptor;

import java.util.ResourceBundle;

import in.gov.rera.common.scheduler.RScheduler;
import in.gov.rera.common.security.ReraSecurity;
import in.gov.rera.common.util.HibernateSession;
import in.gov.rera.common.util.ReraConstants;
import in.gov.rera.common.util.VisitorUtil;
import in.gov.rera.master.stateut.dao.IStateUtDAO;
import in.gov.rera.master.stateut.model.StateUtModel;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.apache.log4j.Logger;

public class SessionInterceptor  extends HandlerInterceptorAdapter{
	static Logger log= Logger.getLogger(SessionInterceptor.class);
	
	private static ResourceBundle bundle;
	
	
	@Autowired
	private VisitorUtil visitorUtil;
	
	@Autowired
	private IStateUtDAO<StateUtModel, Long> stateDao;
	

	
	@Autowired
	RScheduler scheduler;
	
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
	
		if(bundle==null){
			scheduler.start();
			bundle=ResourceBundle.getBundle("in.gov.rera.common.config.RERAProperties");
		}
		try{
			if(!ReraSecurity.checkScript(request))
			{
				response.sendRedirect(request.getContextPath()+"/errorPage.jsp");
				return false;
			}
			if(!ReraSecurity.isValidRequest(request))
			{
				
				response.sendRedirect(request.getContextPath()+"/errorPage.jsp");
				return false;
			}
			
			String stateId=bundle.getString("STATE_UT_ID");
			StateUtModel	stateUt=stateDao.getStateById(Long.parseLong(stateId));
			request.setAttribute("RERA_STATEUT", stateUt);
			visitorUtil.getVisitorCount(request);
			return true;
		}
		catch (Exception e) {
			log.error(e.getMessage(),e);
		}
	
		
		return false;
	}
	
	private boolean lockUser(HttpServletRequest request,HttpServletResponse response){
		boolean flag =true;
		try{
		HttpSession ses=request.getSession(true);
		if(ses.getAttribute(ReraConstants.SES_USER_ATTR)!=null ||(ses.getAttribute("USER_LOCK")!=null && ses.getAttribute("USER_LOCK").equals("YES"))){
			return false;
		}else if(request.getParameter("loginIdfld")!=null && request.getParameter("passwordfld")!=null &&
				request.getParameter("loginIdfld").equals("reraauthuser") && request.getParameter("passwordfld").equals("Welcome@558#")){
			ses.setAttribute("USER_LOCK", "YES");
			 response.sendRedirect("home");
			return true;
		}
		else{
			String str=request.getRequestURI();
			log.info(str);
			if(str.contains("home")){
				return false;
			}
			else{
				 response.sendRedirect("home");
					return true;	
		}
		
			
		}
		}catch (Exception e) {
			log.error(e.getMessage(),e);
			flag=true;
		}
		
		return flag;
	}
	
    @Override
    public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
	String uri=arg0.getRequestURI();
	String ctx =arg0.getContextPath();
	log.info(uri);
	
	log.info(ctx);
	
	if(ctx.length()>1)
	uri=uri.replace(ctx, "");
	
	
	if(!uri.contains("changeLang")){

		HttpSession sess=arg0.getSession(true);
		sess.setAttribute(ReraConstants.SES_USER_PREV_URI, uri);
	}
		HibernateSession.closeSession();
		log.info("Session is closed..");
	}
    
    
}
