package in.gov.rera.notification.service;

import java.io.InputStream;
import java.io.OutputStreamWriter;
import java.io.StringWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import org.apache.commons.io.IOUtils;

import org.apache.log4j.Logger;
public class SmsSender extends Thread{
	static Logger log= Logger.getLogger(SmsSender.class);
	private static final String SITE_URL="http://smspush.openhouseplatform.com/smsmessaging/1/outbound/tel%3A%2BRERAKA/requests";
	//private static final String SITE_URL="http://10.10.30.183:80";
	private static final String KEY="cf418967-5bdd-41d5-96a6-c8f0a63eeb3b";
	
	private String mobileNo;
	private String messege;
	
	public SmsSender(){
		super();
	}
	
	
	public SmsSender(String mobileNo,String msgText){
		super();
		this.mobileNo=mobileNo;
		this.messege=msgText;
	}
	
	
	public String getMobileNo() {
		return mobileNo;
	}


	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}


	public String getMessege() {
		return messege;
	}


	public void setMessege(String messege) {
		this.messege = messege;
	}


	@Override
	public void run() {
		sendSMS();
	}
	

	public String sendSMS() {
		try {
			URL url = new URL(SITE_URL); 
			HttpURLConnection httpURLConnection = (HttpURLConnection) url.openConnection();
			httpURLConnection.setRequestMethod("POST");
			httpURLConnection.setDoOutput(true);
			httpURLConnection.setRequestProperty("Content-type", "application/json;charset=UTF-8");
			httpURLConnection.addRequestProperty("key", KEY);
			String strReq = "{\"outboundSMSMessageRequest\":{\"address\":[\"tel:"+this.mobileNo+"\"]," +
					"\"senderAddress\":\"tel:RERAKA\",\"outboundSMSTextMessage\":{\"message\":" +
					"\""+this.messege+"\"}," +
					"\"clientCorrelator\":\"\",\"messageType\":\"4\",\"category\":\"RERAKA-Employment\",\"notifyURL\":\"\",\"callbackData\":" +
					"\"some-data-useful-to-the-requester\",\"senderName\":\"RERAKA\"}}";
			OutputStreamWriter createUserosw = new OutputStreamWriter(httpURLConnection.getOutputStream());
			createUserosw.write(strReq.toString()); createUserosw.close();
			int userResponseCode = httpURLConnection.getResponseCode(); 
			log.info("userResponseCode >>"+userResponseCode);
			InputStream createUserInputStream = httpURLConnection.getInputStream();
			StringWriter createUserwriter = new StringWriter();
			IOUtils.copy(createUserInputStream, createUserwriter, "UTF-8");
			String outResponse = createUserwriter.toString();
			log.info("outResponse >>"+outResponse);
			return outResponse;
			}
	catch (Exception ex) { log.error(ex.getMessage(),ex); }
		return "";
	}

	
	
	private String sendSMS2() {
		try {
			URL url = new URL(SITE_URL); 
			HttpURLConnection httpURLConnection = (HttpURLConnection) url.openConnection();
			httpURLConnection.setRequestMethod("POST");
			httpURLConnection.setDoOutput(true);
			httpURLConnection.setRequestProperty("Content-type", "application/json;charset=UTF-8");
			httpURLConnection.addRequestProperty("key", "cf418967-5bdd-41d5-96a6-c8f0a63eeb3b");
			String strReq = "{\"outboundSMSMessageRequest\":{\"address\":[\"tel:9901888447\"]," +
					"\"senderAddress\":\"tel:RERAKA\",\"outboundSMSTextMessage\":{\"message\":" +
					"\"Dear Sudeep Test message from RERA Portal (rera.karnataka.gov.in) \"}," +
					"\"clientCorrelator\":\"\",\"messageType\":\"4\",\"category\":\"RERAKA-Employment\",\"notifyURL\":\"\",\"callbackData\":" +
					"\"some-data-useful-to-the-requester\",\"senderName\":\"RERAKA\"}}";
			OutputStreamWriter createUserosw = new OutputStreamWriter(httpURLConnection.getOutputStream());
			createUserosw.write(strReq.toString()); createUserosw.close();
			int userResponseCode = httpURLConnection.getResponseCode(); 
			log.info("userResponseCode2 >>"+userResponseCode);
			InputStream createUserInputStream = httpURLConnection.getInputStream();
			StringWriter createUserwriter = new StringWriter();
			IOUtils.copy(createUserInputStream, createUserwriter, "UTF-8");
			String outResponse = createUserwriter.toString();
			log.info("outResponse2 >>"+outResponse);
			return outResponse;
			}
	catch (Exception ex) { log.error(ex.getMessage(),ex); }
		return "";
	}
	public static void main(String[] args) {
		SmsSender sms=new SmsSender();
		sms.sendSMS2();
	}

}
