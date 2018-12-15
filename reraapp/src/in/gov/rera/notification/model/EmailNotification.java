package in.gov.rera.notification.model;

import java.io.File;

public class EmailNotification {

	private String sendTo;
	private String sender;
	private String subject;
	private String bodyContent;
	private File attachment;
	private boolean isHtml;
	
	private String fileName;

	private String externalFileLocation;

	public String getSendTo() {
		return sendTo;
	}

	public void setSendTo(String sendTo) {
		this.sendTo = sendTo;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getBodyContent() {
		return bodyContent;
	}

	public void setBodyContent(String bodyContent) {
		this.bodyContent = bodyContent;
	}

	public File getAttachment() {
		return attachment;
	}

	public void setAttachment(File attachment) {
		this.attachment = attachment;
	}

	public void sendAsHtml() {
		this.isHtml = true;
	}

	public boolean isHtmlMsg() {
		return isHtml;
	}

	public String getExternalFileLocation() {
		return externalFileLocation;
	}

	public void setExternalFileLocation(String externalFileLocation) {
		this.externalFileLocation = externalFileLocation;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

}
