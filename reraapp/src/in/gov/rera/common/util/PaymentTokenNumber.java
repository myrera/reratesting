package in.gov.rera.common.util;

import java.util.Date;

import in.gov.rera.transaction.agentregistration.model.AgentRegRenewalModel;
import in.gov.rera.transaction.agentregistration.model.AgentRegistrationModel;
import in.gov.rera.transaction.complaint.model.ComplaintModel;
import in.gov.rera.transaction.projectregistration.model.ProjectRegExtensionModel;
import in.gov.rera.transaction.projectregistration.model.ProjectRegistrationModel;
import org.apache.log4j.Logger;

public class PaymentTokenNumber {

	static Logger log= Logger.getLogger(PaymentTokenNumber.class);
	
	public static String generateToken(ProjectRegistrationModel model){

	StringBuffer sb=new StringBuffer("PR");
	if(model.getRegistrationType().equals(ReraConstants.INDVISUAL_REG))
		sb.append("I");
		else
		sb.append("C");	
	sb.append(uniqeCode());
	
	long id=model.getProjectRegId();
			
		String str=""+(id%1000);
		
		while(str.length()<3){
			str="0"+str;
		}
		sb.append(str);
		return sb.toString();
	} 
	
	public static String generateTokenProjectRegExtension(ProjectRegistrationModel model){

		StringBuffer sb=new StringBuffer("PX");
		if(model.getRegistrationType().equals(ReraConstants.INDVISUAL_REG))
			sb.append("I");
			else
			sb.append("C");	
		sb.append(uniqeCode());
		
		long id=model.getProjectRegId();
				
			String str=""+(id%1000);
			
			while(str.length()<3){
				str="0"+str;
			}
			sb.append(str);
			return sb.toString();
		} 

	
	public static String generateToken(AgentRegistrationModel model){

	StringBuffer sb=new StringBuffer("AR");
	if(model.getRegistrationType().equals(ReraConstants.INDVISUAL_REG))
		sb.append("I");
		else
		sb.append("C");	
	sb.append(uniqeCode());
	
	long id=model.getAgentRegistrationID();
			
		String str=""+(id%1000);
		
		while(str.length()<3){
			str="0"+str;
		}
		sb.append(str);
		return sb.toString();
	} 
	
	
	public static String generateTokenAgentRegRenewal(AgentRegistrationModel model){

		StringBuffer sb=new StringBuffer("AX");
		if(model.getRegistrationType().equals(ReraConstants.INDVISUAL_REG))
			sb.append("I");
			else
			sb.append("C");	
		sb.append(uniqeCode());
		
		long id=model.getAgentRegistrationID();
				
		String str=""+(id%1000);
			
			while(str.length()<3){
				str="0"+str;
			}
			sb.append(str);
			return sb.toString();
		} 
	
	
	
	public static String generateToken(){

		StringBuffer sb=new StringBuffer("CMP");
		
		sb.append(uniqeCode());
		
		
				
			String str=""+(number%1000);
			
			while(str.length()<3){
				str="0"+str;
			}
			number++;
			sb.append(str);
			return sb.toString();
		} 
		
	private static long number=1l;
	
	
	public static String uniqeCode(){
		StringBuffer sb=new StringBuffer();
		long l=new Date().getTime();
		while(l>0){
			int x=(int)(l%35);
			l=l/61;
			sb.append(charCode.charAt(x));
		}
		
		
		return sb.toString();
	}
	
	public static void main(String[] args) {
		log.info(uniqeCode());
	}
private static final String charCode="ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";	

}


