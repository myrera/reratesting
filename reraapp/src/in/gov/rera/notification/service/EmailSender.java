package in.gov.rera.notification.service;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.apache.log4j.Logger;

import in.gov.rera.notification.model.EmailNotification;
import in.gov.rera.notification.model.MailConstants;

public class EmailSender extends Thread {

	static Logger log = Logger.getLogger(EmailSender.class);
	private EmailNotification email;

	public EmailSender(EmailNotification email) {
		this.email = email;
	}

	public void run() {
		try {
			sendEmail();
			log.info("Mail send:::::::::::::");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
	}

	private void sendEmail() throws Exception {

		MimeMessage message = new MimeMessage(MailConstants.getAuthSession());

		message.setFrom(new InternetAddress(MailConstants.EMAIL_MAILFROM));

		message.addRecipient(Message.RecipientType.TO, new InternetAddress(this.email.getSendTo()));
		message.addRecipient(Message.RecipientType.BCC, new InternetAddress("rera.karnataka.enquiry@gmail.com"));

		message.setSubject(this.email.getSubject());

		if (email.isHtmlMsg()) {
			message.setContent(email.getBodyContent(), "text/html");
		} else {
			message.setContent(email.getBodyContent(), "text/plain");
		}

		if (email.getAttachment() != null) {
			// Create a multipar message
			Multipart multipart = new MimeMultipart();
			BodyPart messageBodyPart = new MimeBodyPart();
			// Set text message part
			messageBodyPart.setText(email.getBodyContent());
			multipart.addBodyPart(messageBodyPart);

			// Part two is attachment
			messageBodyPart = new MimeBodyPart();
			String filename = email.getAttachment().getName();
			DataSource source = new FileDataSource(filename);
			messageBodyPart.setDataHandler(new DataHandler(source));
			messageBodyPart.setFileName(filename);
			multipart.addBodyPart(messageBodyPart);

			// Send the complete message parts
			message.setContent(multipart);
		}

		if (email.getExternalFileLocation() != null) {
			// Create a multipar message
						Multipart multipart = new MimeMultipart();
						BodyPart messageBodyPart = new MimeBodyPart();
						// Set text message part
						messageBodyPart.setText(email.getBodyContent());
						multipart.addBodyPart(messageBodyPart);

						// Part two is attachment
						messageBodyPart = new MimeBodyPart();
						
						DataSource source = new FileDataSource(email.getExternalFileLocation());
						messageBodyPart.setDataHandler(new DataHandler(source));
						messageBodyPart.setFileName(email.getFileName());
						multipart.addBodyPart(messageBodyPart);

						// Send the complete message parts
						message.setContent(multipart);
		}

		// message.setText(msg);
		Transport.send(message);
	}

	public static void main(String[] args) {
		EmailNotification email = new EmailNotification();
		email.setSubject("Test mail  ");
		email.setBodyContent("Test mail");
		email.setSendTo("parvesh.singh09@gmail.com");
		EmailSender s = new EmailSender(email);
		s.start();
		log.info("Finish");
	}
}
