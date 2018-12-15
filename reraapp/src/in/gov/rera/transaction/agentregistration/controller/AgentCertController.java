package in.gov.rera.transaction.agentregistration.controller;

import in.gov.rera.common.model.UserModel;
import in.gov.rera.common.util.AcknowledgeUtilty;
import in.gov.rera.common.util.AgentCertificateUtil;
import in.gov.rera.common.util.ProjectCertificateUtil;
import in.gov.rera.common.util.ReraConstants;
import in.gov.rera.transaction.agentregistration.model.AgentRegistrationModel;
import in.gov.rera.transaction.agentregistration.service.IAgentRegistrationService;
import in.gov.rera.transaction.projectregistration.model.ProjectRegistrationModel;
import in.gov.rera.transaction.projectregistration.service.IProjectRegistrationService;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.apache.log4j.Logger;

@Controller(value = "AgentCertController")
@Scope("request")
public class AgentCertController {
	static Logger log = Logger.getLogger(AgentCertController.class);

	@Autowired
	HttpSession httpSession;

	@Autowired
	IAgentRegistrationService<AgentRegistrationModel, Long> service;

	@RequestMapping(value = "agentCert")
	public void agentCert(@RequestParam("AID") Long pid, HttpServletResponse response) {
		try {
			response.setContentType("application/pdf");
			UserModel loggedUser = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
			AgentRegistrationModel agent = service.getAgentRegByPk(pid);
			AcknowledgeUtilty actutil = new AcknowledgeUtilty();
			agent.setCertificateUser(loggedUser);
			actutil.generateAgentAck(response, agent);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}

	}

	@RequestMapping(value = "agentInterimCert")
	public void agentInterimCert(@RequestParam("AID") Long pid, HttpServletResponse response) {
		try {
			response.setContentType("application/pdf");
			AgentRegistrationModel agent = service.getAgentRegByPk(pid);
			AgentCertificateUtil util = new AgentCertificateUtil(agent);
			util.generateInterimCertificate(response);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}

	}

	@RequestMapping(value = "agentAcknowledgement")
	public void agentAcknowledgement(@RequestParam("AID") Long pid, HttpServletResponse response) {
		try {
			response.setContentType("application/pdf");
			AgentRegistrationModel agent = service.getAgentRegByPk(pid);
			AcknowledgeUtilty util = new AcknowledgeUtilty();
			util.generateAgentAck(response, agent);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}

	}

}
