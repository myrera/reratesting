package in.gov.rera.transaction.projectregistration.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import java.util.ResourceBundle;

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
import org.springframework.web.multipart.MultipartFile;

import in.gov.rera.common.dao.impl.CommonDao;
import in.gov.rera.common.model.PendingAgentSignature;
import in.gov.rera.common.model.PendingSignature;
import in.gov.rera.notification.service.MailService;
import in.gov.rera.transaction.agentregistration.model.AgentRegistrationModel;
import in.gov.rera.transaction.agentregistration.service.IAgentRegistrationService;
import in.gov.rera.transaction.projectregistration.model.ProjectRegistrationModel;
import in.gov.rera.transaction.projectregistration.service.IProjectRegistrationService;

@Controller(value = "CertificateController")
@Scope("request")
public class CertificateController {
	
	@Autowired
	MailService mailService;

	static Logger log = Logger.getLogger(CertificateController.class);
	@Autowired
	HttpSession httpSession;

	private ProjectRegistrationModel project;
	
	private AgentRegistrationModel agent;

	@Autowired
	private IProjectRegistrationService service;
	
	@Autowired
	IAgentRegistrationService<AgentRegistrationModel, Long> agentRegistrationService;

	@Autowired
	CommonDao<Object, Long> commonDao;

	@RequestMapping(value = "getCertificate")
	public void projectCert(@RequestParam("CID") String cid, HttpServletResponse response) {
		if(cid==null){
			return;
		}
		
		
		try {
			response.setContentType("application/pdf");
			
			OutputStream out = response.getOutputStream();

			ResourceBundle rb = ResourceBundle.getBundle("in.gov.rera.common.config.RERAProperties");
			String ackLoc = rb.getString("ACK_FOLDER_PATH");

			File file = new File(
					ackLoc + "certificates/" + cid + ".pdf");
			FileInputStream in = new FileInputStream(file);
			byte[] bt = new byte[in.available()];
			in.read(bt);
			in.close();

			out.write(bt);

		} catch (Exception e) {
			log.error(e.getMessage(), e);

		}

	}

	@RequestMapping(value = "getPendingCertificate")
	public void getPendingCertificate(@RequestParam("userId") String userId, HttpServletResponse response)
			throws IOException {

		DetachedCriteria dt = DetachedCriteria.forClass(PendingSignature.class);
		dt.add(Restrictions.eq("userName", userId));
		List<Object> pendingList = commonDao.getList(dt);

		StringBuffer sb = new StringBuffer();
		for (Object pendingObject : pendingList) {
			PendingSignature sig = (PendingSignature) pendingObject;
			sb.append(sig.getProjectNumber());
			sb.append(",");

		}
		response.getOutputStream().write(sb.toString().getBytes());

	}
	
	@RequestMapping(value = "getAgentPendingCertificate")
	public void getAgentPendingCertificate(@RequestParam("userId") String userId, HttpServletResponse response)
			throws IOException {

		DetachedCriteria dt = DetachedCriteria.forClass(PendingAgentSignature.class);
		dt.add(Restrictions.eq("userName", userId));
		List<Object> pendingList = commonDao.getList(dt);

		StringBuffer sb = new StringBuffer();
		for (Object pendingObject : pendingList) {
			PendingAgentSignature sig = (PendingAgentSignature) pendingObject;
			sb.append(sig.getAgentNumber());
			sb.append(",");

		}
		response.getOutputStream().write(sb.toString().getBytes());

	}

	@RequestMapping(value = "deletePendingCertificatesData")
	public void deletePending(@RequestParam("projectId") String projectId, HttpServletResponse response)
			throws Exception {

		DetachedCriteria dt = DetachedCriteria.forClass(PendingSignature.class);
		dt.add(Restrictions.eq("projectNumber", projectId));
		List<Object> pendingList = commonDao.getList(dt);

		StringBuffer sb = new StringBuffer();
		for (Object pendingObject : pendingList) {
			
			PendingSignature sig = (PendingSignature) pendingObject;
			project=service.getProjectRegByPk(sig.getProjectId());
			mailService.sendProjectRegApproval(project);
			commonDao.removeObject(sig);
			

		}

	}
	
	@RequestMapping(value = "deleteAgentPendingCertificatesData")
	public void deleteAgentPending(@RequestParam("agentId") String agentId, HttpServletResponse response)
			throws Exception {

		DetachedCriteria dt = DetachedCriteria.forClass(PendingAgentSignature.class);
		dt.add(Restrictions.eq("agentNumber", agentId));
		List<Object> pendingList = commonDao.getList(dt);

		StringBuffer sb = new StringBuffer();
		for (Object pendingObject : pendingList) {
			
			PendingAgentSignature sig = (PendingAgentSignature) pendingObject;
			agent=agentRegistrationService.getAgentRegByPk(sig.getAgentId());
			mailService.sendAgentRegApproval(agent);
			commonDao.removeObject(sig);
			

		}

	}

	@RequestMapping(value = "saveCertificate")
	public void saveCert(@RequestParam(value = "uploadFile", required = false) MultipartFile uploadFile,
			HttpServletResponse response) {

		try {
			if (uploadFile != null && !uploadFile.isEmpty()) {

				ResourceBundle rb = ResourceBundle.getBundle("in.gov.rera.common.config.RERAProperties");
				String ackLoc = rb.getString("ACK_FOLDER_PATH");

				File file = new File(ackLoc + "certificates/" + uploadFile.getOriginalFilename());
				FileOutputStream out = new FileOutputStream(file);
				byte[] bt = new byte[uploadFile.getInputStream().available()];
				uploadFile.getInputStream().read(bt);
				uploadFile.getInputStream().close();

				out.write(bt);
				response.getOutputStream().write("success".getBytes());

			}
		} catch (Exception e) {
			log.error(e.getMessage(), e);

		}

	}

}
