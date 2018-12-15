package in.gov.rera.interceptor;

import in.gov.rera.common.util.ReraConstants;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.apache.log4j.Logger;

public class OperatorUserInterceptor  extends HandlerInterceptorAdapter{

	static Logger log= Logger.getLogger(OperatorUserInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		HttpSession httpSession=request.getSession();
		String role=(String)httpSession.getAttribute(ReraConstants.SES_USER_ROLE);
		try{
		if(role!=null && role.equals(ReraConstants.OPERATOR_USER)){
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
