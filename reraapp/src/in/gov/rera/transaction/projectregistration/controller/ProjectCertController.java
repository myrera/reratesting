package in.gov.rera.transaction.projectregistration.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import in.gov.rera.common.dao.impl.CommonDao;
import in.gov.rera.common.model.TokenModel;
import in.gov.rera.common.model.UserModel;
import in.gov.rera.common.util.AcknowledgeUtilty;
import in.gov.rera.common.util.ProjectCertificateUtil;
import in.gov.rera.common.util.ReraConstants;
import in.gov.rera.transaction.projectregistration.model.ProjectRegistrationModel;
import in.gov.rera.transaction.projectregistration.service.IProjectRegistrationService;

@Controller(value = "ProjectCertController")
@Scope("request")
public class ProjectCertController {

	static Logger log = Logger.getLogger(ProjectCertController.class);
	
	@Autowired
	HttpSession httpSession;

	private ProjectRegistrationModel project;

	@Autowired
	private IProjectRegistrationService service;
	
	@Autowired
	CommonDao<Object, Long> commonDao;

	@RequestMapping(value = "projectCert")
	public void projectCert(@RequestParam("PID") Long pid, HttpServletResponse response) {
		try {
			response.setContentType("application/pdf");
			this.project = service.getProjectRegByPk(pid);
			AcknowledgeUtilty actutil = new AcknowledgeUtilty();

			UserModel loggedUser = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);

			DetachedCriteria dt = DetachedCriteria.forClass(TokenModel.class);
			List<Object> tml = commonDao.getList(dt);
			dt.add(Restrictions.eq("userId.userId", loggedUser.getUserId()));

			List<Object> tmObject = commonDao.getList(dt);
			TokenModel tm = new TokenModel();
			if (tmObject == null || tmObject.isEmpty()) {

			} else {
				tm = (TokenModel) tmObject.get(0);
			}
			project.setCertificateUser(loggedUser);

			
			actutil.generateProjectCertificate(response, project);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			System.out.println(e.getMessage());
			e.printStackTrace();
		}

	}
	
	
	@RequestMapping(value = "projectCertPrev")
	public void projectCertPrev(@RequestParam("PID") Long pid, HttpServletResponse response) {
		try {
			response.setContentType("application/pdf");
			this.project = service.getProjectRegByPk(pid);
			AcknowledgeUtilty actutil = new AcknowledgeUtilty();

			UserModel loggedUser = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);

			
			project.setCertificateUser(loggedUser);
			
			

			
			actutil.generateProjectCertificate(response, project);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			e.printStackTrace();
		}

	}

	@RequestMapping(value = "projectInterimCert")
	public void projectInterimCert(@RequestParam("PID") Long pid, HttpServletResponse response) {
		try {
			response.setContentType("application/pdf");
			this.project = service.getProjectRegByPk(pid);
			ProjectCertificateUtil util = new ProjectCertificateUtil(this.project);
			util.generateInterimCertificate(response);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
	}

	@RequestMapping(value = "projectAcknowledgement")
	public void projectAcknowledgement(@RequestParam("PID") Long pid, HttpServletResponse response) {
		try {
			response.setContentType("application/pdf");
			this.project = service.getProjectRegByPk(pid);
			AcknowledgeUtilty util = new AcknowledgeUtilty();
			util.generateProjectCertificate(response, project);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
	}

}
