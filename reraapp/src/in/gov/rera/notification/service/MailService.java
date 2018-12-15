package in.gov.rera.notification.service;

import in.gov.rera.common.model.EnquiryModel;
import in.gov.rera.common.util.ReraConstants;
import in.gov.rera.notification.model.EmailNotification;
import in.gov.rera.transaction.agentregistration.model.AgentRegistrationModel;
import in.gov.rera.transaction.complaint.model.ComplaintModel;
import in.gov.rera.transaction.projectregistration.model.ProjectRegExtensionModel;
import in.gov.rera.transaction.projectregistration.model.ProjectRegistrationModel;

import java.io.File;
import java.util.ResourceBundle;

import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Service;

@Service(value = "MailService")
@Scope(value = "request", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class MailService {

	public void sendprojectRegConfirmation(ProjectRegistrationModel project) {
		EmailNotification email = new EmailNotification();
		email.setSubject("Project Registration (Ref " + project.getApplicationNo() + ") submitted successfuly.");
		StringBuffer sb = new StringBuffer();
		if (project.getRegistrationType().equals(ReraConstants.INDVISUAL_REG)) {
			sb.append("Dear ").append(project.getPromoterDetailsModel().getPromoterName()).append(",");
		} else {
			sb.append("M/S ").append(project.getPromoterDetailsModel().getPromoterName()).append(",");
		}
		sb.append("\n").append("\n");
		sb.append("You are hereby informed that your application for registration of your project '"
				+ project.getProjectDetailsModel().getProjectName() + "' is submited.");
		sb.append("\n");
		sb.append("\n").append("\n");

		sb.append("Regards:").append("\n");
		sb.append("Real Estate Regulatory Authority");
		email.setBodyContent(sb.toString());
		email.setSendTo(project.getPromoterDetailsModel().getEmailId());
		EmailSender sender = new EmailSender(email);
		sender.start();

	}

	public void sendProjectRegApproval(ProjectRegistrationModel project) {
		EmailNotification email = new EmailNotification();
		email.setSubject("Project Registration Approved.");

		ResourceBundle rb = ResourceBundle.getBundle("in.gov.rera.common.config.RERAProperties");
		String ackLoc = rb.getString("ACK_FOLDER_PATH");
		String filePath = ackLoc + "certificates//" + project.getProjectRegistrationNo().replaceAll("/", "") + ".pdf";
		email.setExternalFileLocation(filePath);
		email.setFileName(project.getProjectRegistrationNo().replaceAll("/", "") + ".pdf");

		StringBuffer sb = new StringBuffer();
		if (project.getRegistrationType().equals(ReraConstants.INDVISUAL_REG)) {
			sb.append("Dear ").append(project.getPromoterDetailsModel().getPromoterName()).append(",");
		} else {
			sb.append("M/S ").append(project.getPromoterDetailsModel().getPromoterName()).append(",");
		}
		sb.append("\n").append("\n");
		sb.append("You are hereby informed that your application for registration of your project '"
				+ project.getProjectDetailsModel().getProjectName() + "' has been approved.");
		// sb.append("Below is the credential for login in rera portal for
		// manage/update your project status.");
		sb.append("\n");
		sb.append("Your permananent registration number is ").append(project.getProjectRegistrationNo()).append("\n");
		sb.append("Your Certificate is also attached with this mail.").append("\n");

		sb.append("\n").append("\n").append("\n");
		sb.append("Regards:").append("\n");
		sb.append("Real Estate Regulatory Authority");
		email.setBodyContent(sb.toString());
		email.setSendTo(project.getPromoterDetailsModel().getEmailId());
		EmailSender sender = new EmailSender(email);
		sender.start();

	}

	public void sendProjectRegExtApproval(ProjectRegExtensionModel model) {
		ProjectRegistrationModel project = model.getProjectRegistration();
		EmailNotification email = new EmailNotification();
		email.setSubject(
				"Extension request for Project Registration No. " + project.getProjectRegistrationNo() + "   ");
		StringBuffer sb = new StringBuffer();
		if (project.getRegistrationType().equals(ReraConstants.INDVISUAL_REG)) {
			sb.append("Dear ").append(project.getPromoterDetailsModel().getPromoterName()).append(",");
		} else {
			sb.append("M/S ").append(project.getPromoterDetailsModel().getPromoterName()).append(",");
		}
		sb.append("\n").append("\n");
		sb.append("You are hereby informed that your  extension application for  project registration no. '"
				+ project.getProjectRegistrationNo() + "' has been approved.");

		sb.append("Regards:").append("\n");
		sb.append("Real Estate Regulatory Authority");
		email.setBodyContent(sb.toString());
		email.setSendTo(project.getPromoterDetailsModel().getEmailId());
		EmailSender sender = new EmailSender(email);
		sender.start();

	}

	public void sendAgentRegConfirmation(AgentRegistrationModel agent) {
		EmailNotification email = new EmailNotification();
		email.setSubject(
				"Real Estate Agent Registration (Ref " + agent.getApplicationNo() + " ) submitted successfuly.");
		StringBuffer sb = new StringBuffer();
		if (agent.getRegistrationType().equals(ReraConstants.INDVISUAL_REG)) {
			sb.append("Dear ").append(agent.getAgentDetailsModel().getAgentName()).append(",");
			email.setSendTo(agent.getAgentDetailsModel().getAgentEmailId());
		} else {
			sb.append("M/S ").append(agent.getAgentDetailsModel().getFirmName()).append(",");
			email.setSendTo(agent.getAgentDetailsModel().getFirmEmail());
		}
		sb.append("\n").append("\n");
		sb.append("You are hereby informed that your application for registration as real estate agent is submited.");
		sb.append("\n");
		sb.append("\n").append("\n").append("\n");

		sb.append("Regards:").append("\n");
		sb.append("Real Estate Regulatory Authority");
		email.setBodyContent(sb.toString());

		EmailSender sender = new EmailSender(email);
		sender.start();

	}

	public void sendAgentRegApproval(AgentRegistrationModel agent) {
		EmailNotification email = new EmailNotification();
		email.setSubject("Real Estate Agent Registration Approved.");
		StringBuffer sb = new StringBuffer();

		ResourceBundle rb = ResourceBundle.getBundle("in.gov.rera.common.config.RERAProperties");
		String ackLoc = rb.getString("ACK_FOLDER_PATH");
		String filePath = ackLoc + "certificates//" + agent.getAgentRegistrationNo().replaceAll("/", "") + ".pdf";
		email.setExternalFileLocation(filePath);
		email.setFileName(agent.getAgentRegistrationNo().replaceAll("/", "") + ".pdf");

		if (agent.getRegistrationType().equals(ReraConstants.INDVISUAL_REG)) {
			sb.append("Dear ").append(agent.getAgentDetailsModel().getAgentName()).append(",");
			email.setSendTo(agent.getAgentDetailsModel().getAgentEmailId());
		} else {
			sb.append("M/S ").append(agent.getAgentDetailsModel().getFirmName()).append(",");
			email.setSendTo(agent.getAgentDetailsModel().getFirmEmail());
		}
		sb.append("\n").append("\n");
		sb.append(
				"You are hereby informed that your application for registration as real estate agent has been approved.");
		sb.append("\n");

		sb.append("Your permananent registration number is ").append(agent.getAgentRegistrationNo()).append("\n");
		sb.append("Your Certificate is also attached with this mail.").append("\n");
		sb.append("\n").append("\n").append("\n");
		sb.append("Regards:").append("\n");
		sb.append("Real Estate Regulatory Authority");
		email.setBodyContent(sb.toString());

		EmailSender sender = new EmailSender(email);
		sender.start();

	}

	public void sendAgentRegRenewApproval(AgentRegistrationModel agent) {
		EmailNotification email = new EmailNotification();
		email.setSubject("Real Estate Agent Registration Renewal .");
		StringBuffer sb = new StringBuffer();
		if (agent.getRegistrationType().equals(ReraConstants.INDVISUAL_REG)) {
			sb.append("Dear ").append(agent.getAgentDetailsModel().getAgentName()).append(",");
			email.setSendTo(agent.getAgentDetailsModel().getAgentEmailId());
		} else {
			sb.append("M/S ").append(agent.getAgentDetailsModel().getFirmName()).append(",");
			email.setSendTo(agent.getAgentDetailsModel().getFirmEmail());
		}
		sb.append("\n").append("\n");
		sb.append("You are hereby informed that your application for renewal of  real estate agent registration no."
				+ agent.getAgentRegistrationNo() + " has been approved.");
		sb.append("\n");
		sb.append("\n").append("\n").append("\n");
		sb.append("Regards:").append("\n");
		sb.append("Real Estate Regulatory Authority");
		email.setBodyContent(sb.toString());

		EmailSender sender = new EmailSender(email);
		sender.start();

	}

	public void sendMail(EnquiryModel enq) {
		EmailNotification email = new EmailNotification();
		email.setSubject(enq.getSubject());

		email.setBodyContent(enq.getEnquiryText());
		email.setSendTo(enq.getEmailId());

		EmailSender sender = new EmailSender(email);
		sender.start();

	}

	public void sendMailWithAttachment(EmailNotification email) {

		EmailSender sender = new EmailSender(email);
		sender.start();

	}

	public void sendComplaintRegConfirmation(ComplaintModel model) {
		EmailNotification email = new EmailNotification();
		email.setSubject("Complaint Ref " + model.getComplaintNo() + " submitted successfuly.");
		StringBuffer sb = new StringBuffer();

		sb.append("Dear ").append(model.getApplicateName()).append(",");
		email.setSendTo(model.getApplicateEmailId());

		sb.append("\n").append("\n");
		sb.append("You are hereby informed that your complaint has been successfuly submited.");
		sb.append("\n").append("\n").append("\n");

		sb.append("Regards:").append("\n");
		sb.append("Real Estate Regulatory Authority");
		email.setBodyContent(sb.toString());

		EmailSender sender = new EmailSender(email);
		sender.start();

	}

}
