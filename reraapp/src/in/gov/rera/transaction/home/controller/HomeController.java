package in.gov.rera.transaction.home.controller;

import java.security.PrivateKey;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import in.gov.rera.common.dao.impl.CommonDao;
import in.gov.rera.common.model.TokenModel;
import in.gov.rera.common.util.ReraConstants;
import in.gov.rera.transaction.home.dao.LoginDao;


@Controller("HomeController")
@Scope("request")
public class HomeController {
	
	@Autowired
	CommonDao<Object, Long> commonDao;
	
	@Autowired
	LoginDao loginDAO;
	
	@RequestMapping(value="home")
	public ModelAndView home(){
		return new ModelAndView("home");
	}
	
	
	@RequestMapping(value="changeLang")
	public ModelAndView home(@RequestParam("lang_id") String lang,HttpServletResponse res,HttpServletRequest req){
		
		Cookie cr[]=req.getCookies();
		if(cr!=null){
		for(Cookie c:cr){
			if(c.getName().equals("rera_user_lang2")){
							c.setMaxAge(0);
						
				c.setDomain("ghghhgh");
				c.setPath("666");
			}
		}
		}
		
		
		Cookie  ch=new Cookie("rera_user_lang2", lang);
		ch.setMaxAge(200000);
		ch.setPath("/");
		res.addCookie(ch);
		
		HttpSession ses=req.getSession(true);
		String retUri=(String)ses.getAttribute(ReraConstants.SES_USER_PREV_URI);
		if(retUri==null)
			retUri="home";
			
		return new ModelAndView("redirect:"+retUri);
	}
	
	
	@RequestMapping(value="sslLogin")
	public ModelAndView sslLogin(@RequestParam("name") String name,@RequestParam("userId") String userName,HttpServletResponse res,HttpServletRequest req){
		
		
		DetachedCriteria dt = DetachedCriteria.forClass(TokenModel.class);
		List<Object> tml=commonDao.getList(dt);
		dt.add(Restrictions.eq("userId.userId", loginDAO.getByLoginId(userName).getUserId()));
		
		List<Object> tmObject=commonDao.getList(dt);
		TokenModel tm =new TokenModel();
		if(tmObject==null || tmObject.isEmpty()){
		
		}else{
			tm=(TokenModel)tmObject.get(0);
		}
		tm.setUserId(loginDAO.getByLoginId(userName));
		tm.setSigningName(name);
		commonDao.saveObject(tm);
	
			
		return null;
	}
	
	
	@RequestMapping(value="rtiPage")
	public ModelAndView rtiPage(){
		return new ModelAndView("rtiPage");
	}
	
	@RequestMapping(value="downloadPage")
	public ModelAndView downloadPage(){
		return new ModelAndView("downloadPage");
	}
	
	@RequestMapping(value="helpPage")
	public ModelAndView helpPage(){
		return new ModelAndView("helpPage");
	}
	
	@RequestMapping(value="projectsUnderInvestigation")
	public ModelAndView projectsUnderInvestigation(){
		return new ModelAndView("projectsUnderInvestigation");
	}
	
	
	@RequestMapping(value="contactUsPage")
	public ModelAndView contactUs(){
		return new ModelAndView("contactUsPage");
	}
	                       
	@RequestMapping(value="functionsAndServicesPage")
	public ModelAndView functionsAndServicesPage(){
		return new ModelAndView("functionsAndServicesPage");
	}
	
	@RequestMapping(value="orgStructurePage")
	public ModelAndView orgStructurePage(){
		return new ModelAndView("orgStructurePage");
	}
	
	
	@RequestMapping(value="faq")
	public ModelAndView faq(@RequestParam(value="FID",required=false) Integer fd){
		ModelAndView mv=null;
	int	fid=0;
	if(fd!=null) fid=fd;
		if(fid==1){
			mv=new ModelAndView("faqPage1");
		}
		else if(fid==2){
			mv=new ModelAndView("faqPage2");
		}
		else{
			mv=new ModelAndView("faqPage");
		}
		return mv;
	}
	@RequestMapping(value="aboutUs")
	public ModelAndView aboutUs(HttpServletRequest request){
		
	
		return new ModelAndView("aboutUsKNPage");
	}

	
	
	
	
}
