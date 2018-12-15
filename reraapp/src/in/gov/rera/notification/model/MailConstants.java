package in.gov.rera.notification.model;

import java.util.Properties;
import java.util.ResourceBundle;

import javax.mail.PasswordAuthentication;
import javax.mail.Session;

import org.apache.log4j.Logger;
public class MailConstants {

	static Logger log= Logger.getLogger(MailConstants.class);

	public static String EMAIL_SMTPHOST;
	public static String EMAIL_SMTPPORT;
	public static boolean EMAIL_SMTPAUTH;
	public static String EMAIL_AUTHUSERNAME;
	public static String EMAIL_AUTHPASSWORD;
	public static String EMAIL_MAILFROM;
	public static boolean EMAIL_SMTPSTARTTLS;
	
	static{
		ResourceBundle rb=ResourceBundle.getBundle("in.gov.rera.notification.config.notification");
		
		EMAIL_SMTPHOST=rb.getString("EMAIL_SMTPHOST");
		EMAIL_SMTPPORT=rb.getString("EMAIL_SMTPPORT");
		EMAIL_AUTHUSERNAME=rb.getString("EMAIL_AUTHUSERNAME");
		EMAIL_AUTHPASSWORD=rb.getString("EMAIL_AUTHPASSWORD");
		EMAIL_MAILFROM=rb.getString("EMAIL_MAILFROM");
		String str=rb.getString("EMAIL_SMTPAUTH");
		EMAIL_SMTPAUTH=str!=null && str.equalsIgnoreCase("true");
		 str=rb.getString("EMAIL_SMTPSTARTTLS");
		 EMAIL_SMTPSTARTTLS=str!=null && str.equalsIgnoreCase("true");
	}
	
	public static Session getAuthSession(){
		Properties props=new Properties();
		 props.setProperty("mail.smtp.host", EMAIL_SMTPHOST);
	        props.put("mail.smtp.auth", "true");
	        props.put("mail.debug", "false");
	        props.setProperty("mail.smtp.port", EMAIL_SMTPPORT);
	    //    props.put("mail.smtps.ssl.enable", "true");
	        props.put("mail.smtp.user", EMAIL_AUTHUSERNAME);
	        props.put("mail.smtp.password", EMAIL_AUTHPASSWORD);
	        props.put("mail.smtp.starttls.enable", "true");
	        log.info("EMAIL_AUTHUSERNAME>>"+EMAIL_AUTHUSERNAME);
	        log.info("EMAIL_AUTHPASSWORD >>>"+EMAIL_AUTHPASSWORD);
		Session ss= Session.getInstance(props,
	                new javax.mail.Authenticator() {
	                    protected PasswordAuthentication getPasswordAuthentication() {
	                        return new PasswordAuthentication(EMAIL_AUTHUSERNAME, EMAIL_AUTHPASSWORD);
	                    }
	                });
		
		ss.setDebug(true);
		return ss;

	       

	}
}
