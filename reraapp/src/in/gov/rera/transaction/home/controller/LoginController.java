package in.gov.rera.transaction.home.controller;

import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import in.gov.rera.common.dao.impl.CommonDao;
import in.gov.rera.common.model.LoginHistory;
import in.gov.rera.common.model.TokenModel;
import in.gov.rera.common.model.UserModel;
import in.gov.rera.common.util.Base64Decoder;
import in.gov.rera.common.util.ReraConstants;
import in.gov.rera.transaction.home.service.LoginService;
import in.gov.rera.transaction.postregistration.service.IPostRegService;
import in.gov.rera.transaction.projectregistration.model.ProjectRegistrationModel;
import in.gov.rera.transaction.projectregistration.service.IProjectRegistrationService;

import org.apache.log4j.Logger;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

@Controller("LoginController")
@Scope("request")
public class LoginController {
	static Logger log = Logger.getLogger(LoginController.class);
	@Autowired
	LoginService loginService;
	
	@Autowired
	IPostRegService postRegService;

	@Autowired
	CommonDao<Object, Long> commonDao;

	/*
	 * @RequestMapping(value = "loginPage") public ModelAndView loginPage() {
	 * return new ModelAndView("loginPage"); }
	 */

	@RequestMapping(value = "authorityLoginPage")
	public ModelAndView authorityLoginPage() {
		return new ModelAndView("authorityLoginPage");
	}

	/*
	 * @RequestMapping(value = "userLogin") public ModelAndView
	 * userLogin(HttpServletRequest request,
	 * 
	 * @RequestParam(value = "loginId", required = true) String logId,
	 * 
	 * @RequestParam(value = "password", required = true) String pass) {
	 * log.info(logId + "              " + pass); logId =
	 * Base64Decoder.decode(logId); pass = Base64Decoder.decode(pass);
	 * log.info(logId + "              " + pass); UserModel user =
	 * loginService.login(logId, pass); if (user != null && user.getUserType()
	 * != null && (user.getUserType().equals(ReraConstants.AGENT_USER) ||
	 * user.getUserType().equals(ReraConstants.PROJECT_USER))) {
	 * 
	 * try { return new ModelAndView("redirect:" + buildNewSession(request,
	 * user,null));
	 * 
	 * } catch (Exception ex) { log.error(ex.getMessage(),ex); } ModelAndView mv
	 * = new ModelAndView("loginPage"); mv.addObject("ERROR_MSG",
	 * "Something went wrong. Try again."); return mv; } else {
	 * 
	 * ModelAndView mv = new ModelAndView("loginPage");
	 * mv.addObject("ERROR_MSG", "Invalid login Id or passowrd."); return mv; }
	 * 
	 * }
	 */

	@RequestMapping(value = "authorityLogin")
	public ModelAndView authorityLogin(HttpServletRequest request,
			@RequestParam(value = "loginId", required = true) String logId,
			@RequestParam(value = "password", required = true) String pass) {

		logId = Base64Decoder.decode(logId);
		pass = Base64Decoder.decode(pass);

		UserModel user = loginService.login(logId, pass);
		if (user != null && user.getUserType() != null
				&& (user.getUserType().equals(ReraConstants.ADMIN_USER)
						|| user.getUserType().equals(ReraConstants.AUTHORITY_USER)
						|| user.getUserType().equals(ReraConstants.CHIEFAUTHORITY_USER)
						|| user.getUserType().equals(ReraConstants.OPERATOR_USER)
						|| user.getUserType().equals(ReraConstants.UNREG_OP_USER))) {

			DetachedCriteria dt1 = DetachedCriteria.forClass(TokenModel.class);

			dt1.add(Restrictions.eq("userId", user));

			List<Object> tmObject = commonDao.getList(dt1);

			if (tmObject != null && !tmObject.isEmpty()) {
				commonDao.removeObject(tmObject.get(0));
			}

			LoginHistory loginDetails = new LoginHistory();
			loginDetails.setLoginTime(new Date());
			loginDetails.setUser(user);
			loginDetails.setIpaddress(request.getHeader("X-Forwarded-For") == null ? request.getRemoteAddr()
					: request.getHeader("X-Forwarded-For"));
			commonDao.saveObject(loginDetails);

			try {
				return new ModelAndView("redirect:" + buildNewSession(request, user, loginDetails));

			} catch (Exception ex) {
				log.error(ex.getMessage(), ex);
			}
			ModelAndView mv = new ModelAndView("authorityLoginPage");
			mv.addObject("ERROR_MSG", "Something went wrong. Try again.");

			return mv;
		} else {

			ModelAndView mv = new ModelAndView("authorityLoginPage");
			mv.addObject("ERROR_MSG", "Invalid login Id or passowrd.");
			return mv;
		}

	}

	private String buildNewSession(HttpServletRequest request, UserModel user, LoginHistory loginDetails) {
		HttpSession session = request.getSession(true);
		session.invalidate();
		session = request.getSession(true);
		String path = "loginPage";
		String type = user.getUserType();
		session.setAttribute(ReraConstants.SES_USER_ATTR, user);
		session.setAttribute(ReraConstants.SES_USER_ROLE, type);
		session.setAttribute(ReraConstants.ROLE_ACCESS, user.getRoleAccess());
		session.setAttribute(ReraConstants.LOGIN_SESSION_ID, loginDetails);

		if (type.equals(ReraConstants.ADMIN_USER)) {
			path = "admin/dashboard";
		} else if (type.equals(ReraConstants.AUTHORITY_USER)) {
			path = "authority/dashboard";
		} else if (type.equals(ReraConstants.CHIEFAUTHORITY_USER)) {
			path = "super/dashboard";
		} else if (type.equals(ReraConstants.AGENT_USER)) {
			path = "agent/dashboard";
		} else if (type.equals(ReraConstants.PROJECT_USER)) {
			path = "project/dashboard";
		} else if (type.equals(ReraConstants.OPERATOR_USER)) {
			path = "operator/dashboard";
		} else if (type.equals(ReraConstants.UNREG_OP_USER)) {
			path = "unRegProject/unRegProjectDetailsForm";
		}

		return path;
	}

	@RequestMapping(value = "logout")
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse res) {

		UserModel loggedUser = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);

		loggedUser = (UserModel) commonDao.getObject(UserModel.class, loggedUser.getUserId());
		loggedUser.setLoginTime(null);
		commonDao.updateObject(loggedUser);
		HttpSession session = request.getSession(true);
		session.removeAttribute(ReraConstants.SES_USER_ATTR);
		session.removeAttribute(ReraConstants.SES_USER_ROLE);
		LoginHistory loginDetails = (LoginHistory) session.getAttribute(ReraConstants.LOGIN_SESSION_ID);
		if (loginDetails != null) {
			loginDetails = (LoginHistory) commonDao.loadObject(LoginHistory.class, loginDetails.getId());
			loginDetails.setLogoutTime(new Date());
			commonDao.saveObject(loginDetails);
			session.removeAttribute(ReraConstants.LOGIN_SESSION_ID);
		}
		
		

		DetachedCriteria dt1 = DetachedCriteria.forClass(TokenModel.class);
		List<Object> tml=commonDao.getList(dt1);
		dt1.add(Restrictions.eq("userId",loggedUser));
		
		List<Object> tmObject=commonDao.getList(dt1);
		
		
		
		if(tmObject!=null&&!tmObject.isEmpty()){
			commonDao.removeObject(tmObject.get(0));
		}
		

		log.info("Before :: " + session.getId());
		session.invalidate();

		session = request.getSession(true);
		log.info("After    " + session.getId());

		return new ModelAndView("redirect: home");
	}

	@RequestMapping(value = "forgetPasswordBForm")
	public ModelAndView forgetPasswordUserForm() {

		return new ModelAndView("forgetPasswordUserForm");
	}

	@RequestMapping(value = "retrievePassword")
	public ModelAndView retrievePasswordUser(@RequestParam("uType") String uType, @RequestParam("regNo") String regNo) {
		ModelAndView mv = new ModelAndView("forgetPasswordUserForm");
		try {
			if (loginService.retrievePassword(uType, regNo)) {
				mv.addObject("ERROR_MSG", "Login credential have been sent on registered email address.");
			} else {
				mv.addObject("ERROR_MSG", "User not found.");
			}

		} catch (Exception e) {
			log.error(e.getMessage(), e);
			mv.addObject("ERROR_MSG", "Something went wrong. Please try later.");
		}

		return mv;
	}

	@RequestMapping(value = "changePassword", method = RequestMethod.POST)
	public ModelAndView changePassword(HttpServletRequest request,
			@RequestParam(value = "password", required = true) String oldPassword,

			@RequestParam(value = "newpassword", required = true) String newpassword) throws Exception {

		newpassword = Base64Decoder.decode(newpassword);
		oldPassword = Base64Decoder.decode(oldPassword);
		ModelAndView mv = null;
		UserModel loggedUser = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);

		UserModel user = loginService.updatePassword(loggedUser.getLoginId(), oldPassword, newpassword);
		if (user != null) {

			try {
				return new ModelAndView("redirect:" + buildNewSession(request, user, null));

			} catch (Exception ex) {
				log.error(ex.getMessage(), ex);
			}

		} else {
			String type = loggedUser.getUserType();
			String path = "";

			if (type.equals(ReraConstants.ADMIN_USER)) {
				path = "admin/dashboard";
			} else if (type.equals(ReraConstants.AUTHORITY_USER)) {
				path = "authority/dashboard";
			} else if (type.equals(ReraConstants.CHIEFAUTHORITY_USER)) {
				path = "super/dashboard";
			} else if (type.equals(ReraConstants.AGENT_USER)) {
				path = "agent/dashboard";
			} else if (type.equals(ReraConstants.PROJECT_USER)) {
				path = "project/dashboard";
			} else if (type.equals(ReraConstants.OPERATOR_USER)) {
				path = "operator/dashboard";
			}
			return new ModelAndView("redirect:" + path);

		}
		return mv;

	}

	private static String getRandomId() {
		String SALTCHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
		StringBuilder salt = new StringBuilder();
		Random rnd = new Random();
		while (salt.length() < 26) { // length of the random string.
			int index = (int) (rnd.nextFloat() * SALTCHARS.length());
			salt.append(SALTCHARS.charAt(index));
		}
		String saltStr = salt.toString();
		return saltStr;
	}

	// Post registration Login

	@RequestMapping(value = "postRegLoginPage")
	public ModelAndView postRegLoginPage() {
		return new ModelAndView("postRegLoginPage");
	}

	@RequestMapping(value = "postRegUserLogin")
	public ModelAndView postRegUserLogin(HttpServletRequest request,
			@RequestParam(value = "loginId", required = true) String logId,
			@RequestParam(value = "password", required = true) String pass) {
		log.info("postReguserLogin>>>"+logId + "              " + pass);
		logId = Base64Decoder.decode(logId);
		pass = Base64Decoder.decode(pass);
		log.info(logId + "              " + pass);
		UserModel user = loginService.login(logId, pass);
		if (user != null && user.getLoginId() != null && user.getLoginId().startsWith("QU") && user.getUserType() != null  && user.getUserType().equals(ReraConstants.POSTREG_USER)) {

			try {
				return new ModelAndView("redirect:" + buildNewSessionPostReg(request, user,null));

			} catch (Exception ex) {
				log.error(ex.getMessage(),ex);
			}
			ModelAndView mv = new ModelAndView("postRegLoginPage");
			mv.addObject("ERROR_MSG", "Something went wrong. Try again.");
			return mv;
		} else {

			ModelAndView mv = new ModelAndView("postRegLoginPage");
			mv.addObject("ERROR_MSG", "Invalid login Id or passowrd.");
			return mv;
		}

	}
	
	private String buildNewSessionPostReg(HttpServletRequest request, UserModel user,LoginHistory loginDetails) {
		HttpSession session = request.getSession(true);
		session.invalidate();
		session = request.getSession(true);
		String path = "postRegUserLogin";
		String type = user.getUserType();
		session.setAttribute(ReraConstants.SES_USER_ATTR, user);
		session.setAttribute(ReraConstants.SES_USER_ROLE, type);
		session.setAttribute(ReraConstants.LOGIN_SESSION_ID, loginDetails);

		List<ProjectRegistrationModel> projectlist = postRegService.getPostRegProjectsByLoginId(user.getLoginId());
		if(projectlist != null) {
			if (projectlist.get(0).getProjectDetailsModel().getProjectType().equals("Plotted Development")) {
				path = "plot/agreeUser";
			}else {
				path = "project/agreeUser";
			}
		}
		return path;
	}

	@Autowired
	private HttpSession httpSession;
}
