package in.gov.rera.transaction.thirdparty;

import in.gov.rera.common.util.ReraConstants;
import in.gov.rera.transaction.agentregistration.model.AgentRegistrationModel;
import in.gov.rera.transaction.complaint.model.ComplaintModel;
import in.gov.rera.transaction.projectregistration.model.ProjectRegistrationModel;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Calendar;
import java.util.ResourceBundle;

import org.springframework.stereotype.Service;
import org.apache.log4j.Logger;

@Service("PaymentGatewayUtil")
public class PaymentGatewayUtil {
	static Logger log= Logger.getLogger(PaymentGatewayUtil.class);

	public static  String GATEWAY_URL="";
	public static  String MARCHENT_KEY="";
	public static  String SALT="";
	
	public static  String RET_S_URL="";
	public static  String RET_F_URL="";
	public static  String RET_C_URL="";
	
	public static final String PROJECT_REG="Project Registraion";
	public static final String AGENT_REG="Agent Registration";
	public static final String COMPLAINT_REG="Complaint Registration";
	public static final String PROJECT_REG_EXT="Project Extension";
	public static final String AGENT_REG_RENEWAL="Agent Registration Renewal";
	
	
	static{
		try{
		ResourceBundle rb=ResourceBundle.getBundle("in.gov.rera.transaction.thirdparty.paymentgatewayconfig");
		GATEWAY_URL=rb.getString("GATEWAY_URL");
		MARCHENT_KEY=rb.getString("MARCHENT_KEY");
		SALT=rb.getString("SALT");
		RET_S_URL=rb.getString("RET_S_URL");
		RET_F_URL=rb.getString("RET_F_URL");
		RET_C_URL=rb.getString("RET_C_URL");
		}
		catch (Exception e) {
			log.error(e.getMessage(),e);
		}
	}
	
	
	
	public PaymentParameter onlineTrx(ProjectRegistrationModel model,double amount){
		PaymentParameter mv=new PaymentParameter();
		mv.setAmount(amount+"");
		mv.setEmail(model.getPromoterDetailsModel().getEmailId());
		if(model.getRegistrationType().equals(ReraConstants.INDVISUAL_REG)){
			mv.setFirstname(model.getPromoterDetailsModel().getPromoterName());
			mv.setPhone(model.getPromoterDetailsModel().getMobileNo());
		}else{
			mv.setFirstname(model.getPromoterDetailsModel().getPromoterName());
			mv.setPhone(model.getPromoterDetailsModel().getProjectChairmanModel().getMobileNo());
		}
		mv.setKey(MARCHENT_KEY);
		mv.setUdf1(model.getProjectRegId()+"");
		mv.setProductinfo(PROJECT_REG);
		mv.setTxnid("PREG"+gettrxdate()+""+model.getProjectRegId());
		mv.setAction(GATEWAY_URL);
		mv.setHash(hashCal("SHA-512", mv));
		mv.setFurl(RET_F_URL);
		mv.setCurl(RET_C_URL);
		mv.setSurl(RET_S_URL);
		return mv;
	}
	
	public PaymentParameter onlineTrxExt(ProjectRegistrationModel model,double amount){
		PaymentParameter mv=new PaymentParameter();
		mv.setAmount(amount+"");
		mv.setEmail(model.getPromoterDetailsModel().getEmailId());
		if(model.getRegistrationType().equals(ReraConstants.INDVISUAL_REG)){
			mv.setFirstname(model.getPromoterDetailsModel().getPromoterName());
			mv.setPhone(model.getPromoterDetailsModel().getMobileNo());
		}else{
			mv.setFirstname(model.getPromoterDetailsModel().getPromoterName());
			mv.setPhone(model.getPromoterDetailsModel().getProjectChairmanModel().getMobileNo());
		}
		mv.setKey(MARCHENT_KEY);
		mv.setUdf1(model.getProjectRegId()+"");
		mv.setProductinfo(PROJECT_REG_EXT);
		mv.setTxnid("PEXT"+gettrxdate()+""+model.getProjectRegId());
		mv.setAction(GATEWAY_URL);
		mv.setHash(hashCal("SHA-512", mv));
		mv.setFurl(RET_F_URL);
		mv.setCurl(RET_C_URL);
		mv.setSurl(RET_S_URL);
		return mv;
	}
	
	
	
	
	
	public PaymentParameter onlineTrx(AgentRegistrationModel model,double amount){
		PaymentParameter mv=new PaymentParameter();
		mv.setAmount(amount+"");
		if(model.getRegistrationType().equals(ReraConstants.INDVISUAL_REG)){
			mv.setFirstname(model.getAgentDetailsModel().getAgentName());
			mv.setPhone(model.getAgentDetailsModel().getAgentPhoneNo());
			mv.setEmail(model.getAgentDetailsModel().getAgentEmailId());
		}else{
			mv.setFirstname(model.getAgentDetailsModel().getFirmName());
			mv.setPhone(model.getAgentDetailsModel().getFirmMobileNo());
			mv.setEmail(model.getAgentDetailsModel().getFirmEmail());
		}
		
		mv.setKey(MARCHENT_KEY);
		mv.setUdf1(model.getAgentRegistrationID()+"");
		mv.setProductinfo(AGENT_REG);
		mv.setTxnid("AG"+gettrxdate()+""+model.getAgentRegistrationID());
		mv.setAction(GATEWAY_URL);
		mv.setHash(hashCal("SHA-512", mv));
		mv.setFurl(RET_F_URL);
		mv.setCurl(RET_C_URL);
		mv.setSurl(RET_S_URL);
		
		return mv;
	}
	
	public PaymentParameter onlineTrxRenew(AgentRegistrationModel model,double amount){
		PaymentParameter mv=new PaymentParameter();
		mv.setAmount(amount+"");
		if(model.getRegistrationType().equals(ReraConstants.INDVISUAL_REG)){
			mv.setFirstname(model.getAgentDetailsModel().getAgentName());
			mv.setPhone(model.getAgentDetailsModel().getAgentPhoneNo());
			mv.setEmail(model.getAgentDetailsModel().getAgentEmailId());
		}else{
			mv.setFirstname(model.getAgentDetailsModel().getFirmName());
			mv.setPhone(model.getAgentDetailsModel().getFirmMobileNo());
			mv.setEmail(model.getAgentDetailsModel().getFirmEmail());
		}
		
		mv.setKey(MARCHENT_KEY);
		mv.setUdf1(model.getAgentRegistrationID()+"");
		mv.setProductinfo(AGENT_REG);
		mv.setTxnid("AGRN"+gettrxdate()+""+model.getAgentRegistrationID());
		mv.setAction(GATEWAY_URL);
		mv.setHash(hashCal("SHA-512", mv));
		mv.setFurl(RET_F_URL);
		mv.setCurl(RET_C_URL);
		mv.setSurl(RET_S_URL);
		
		return mv;
	}
	
	
	
	public PaymentParameter onlineTrx(ComplaintModel model){
		PaymentParameter mv=new PaymentParameter();
		mv.setAmount("1000");
			mv.setFirstname(model.getApplicateName());
			mv.setPhone(model.getApplicateMobileNo());
			mv.setEmail(model.getApplicateEmailId());
		mv.setKey(MARCHENT_KEY);
		mv.setUdf1(model.getCompId()+"");
		mv.setProductinfo(COMPLAINT_REG);
		mv.setTxnid("CR"+gettrxdate()+""+model.getCompId());
		mv.setAction(GATEWAY_URL);
		mv.setHash(hashCal("SHA-512", mv));
		mv.setFurl(RET_F_URL);
		mv.setCurl(RET_C_URL);
		mv.setSurl(RET_S_URL);
		
		return mv;
	}
	
	
	public String hashCal(String type,PaymentParameter mv){
		String str=mv.getKey()+"|"+mv.getTxnid()+"|"+mv.getAmount()+
				"|"+mv.getProductinfo()+"|"+mv.getFirstname()+"|"+
				mv.getEmail()+"|"+mv.getUdf1()+"||||||||||"+SALT;
		byte[] hashseq=str.getBytes();
		StringBuffer hexString = new StringBuffer();
		try{
		MessageDigest algorithm = MessageDigest.getInstance(type);
		algorithm.reset();
		algorithm.update(hashseq);
		byte messageDigest[] = algorithm.digest();
            
		

		for (int i=0;i<messageDigest.length;i++) {
			String hex=Integer.toHexString(0xFF & messageDigest[i]);
			if(hex.length()==1) hexString.append("0");
			hexString.append(hex);
		}
			
		}catch(NoSuchAlgorithmException nsae){ }
		
		return hexString.toString();


	}
	
	
	
	private String gettrxdate(){
		StringBuffer sb=new StringBuffer();
		Calendar cal=Calendar.getInstance();
	int y=	(cal.get(Calendar.YEAR)%100);
	int m=	(cal.get(Calendar.MONTH+1));
    int d=cal.get(Calendar.DATE);
    int h=cal.get(Calendar.HOUR_OF_DAY);
    int mn=cal.get(Calendar.MINUTE);
    int ss=cal.get(Calendar.SECOND);
    
				if(y<10)
					sb.append("0");
				sb.append(y);
				if(m<10)
					sb.append("0");
				sb.append(m);
				if(d<10)
					sb.append("0");
				sb.append(d);
				if(h<10)
					sb.append("0");
				sb.append(h);
				if(mn<10)
					sb.append("0");
				sb.append(mn);
				if(ss<10)
					sb.append("0");
				sb.append(ss);
				
				
			;	
		return sb.toString();
	}
}
