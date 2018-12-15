package in.gov.rera.notification.service;


import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Service;

/**
 * @author ParveshSingh
 *
 */
@Service(value="SmsService")
@Scope(value="request",proxyMode=ScopedProxyMode.TARGET_CLASS)
public class SmsService {

	
	
	public void sendSMS(String mobileNo,String msgText) {
		SmsSender sms=new SmsSender(mobileNo,msgText);
		sms.start();
		
	}
	
	}
