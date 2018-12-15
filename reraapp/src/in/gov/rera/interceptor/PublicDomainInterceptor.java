package in.gov.rera.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import in.gov.rera.common.util.ReraConstants;

public class PublicDomainInterceptor  extends HandlerInterceptorAdapter{

	static Logger log= Logger.getLogger(PublicDomainInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		HttpSession httpSession=request.getSession();
		//UserModel um = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
		String role=(String)httpSession.getAttribute(ReraConstants.SES_USER_ROLE);
		try{
			if(role!=null && role.equals(ReraConstants.PUBLIC_USER)){
				return true;
			}
			else{
				response.sendRedirect(request.getContextPath()+"/home");
			}
		}catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return false;
	}
	
}
