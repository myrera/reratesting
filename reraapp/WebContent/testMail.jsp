<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Session"%>
<%@page import="java.util.Properties"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.PasswordAuthentication"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

  <%
		final String username = "info.rera";
		final String password = "welcome";

		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "10.10.31.170");
		props.put("mail.smtp.port", "25");

		Session sess1 = Session.getInstance(props,
		  new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		  });

		try {

			Message message = new MimeMessage(sess1);
			message.setFrom(new InternetAddress("info.rera@karnataka.gov.in"));
			message.setRecipients(Message.RecipientType.TO,
				InternetAddress.parse("parvesh.singh09@gmail.com"));
			message.setSubject("Testing Subject");
			message.setText("Dear Mail Crawler,"
				+ "\n\n No spam to my email, please!");

			Transport.send(message);
			%>
		  Send mail successfully
				<%

		} catch (Exception e) {
			%>
		Exception found	<%=e%>
			<%
		}
	
  %>
  
