package in.gov.rera.interceptor;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import org.apache.log4j.Logger;
public class ErrorHandler implements Filter {
	static Logger log= Logger.getLogger(ErrorHandler.class);
ServletContext context;
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		try{
			
			arg2.doFilter(arg0, arg1);
		}catch (Exception e) {
			log.error(e.getMessage(),e);
			context.getRequestDispatcher("/errorPage.jsp").forward(arg0, arg1);
		}
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		context=arg0.getServletContext();
	}

}
