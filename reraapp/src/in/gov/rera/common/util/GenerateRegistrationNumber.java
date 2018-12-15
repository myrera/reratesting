package in.gov.rera.common.util;

import java.util.Calendar;

import in.gov.rera.helpdesk.model.HelpDeskEnquiryModel;
import in.gov.rera.master.stateut.model.StateUtModel;
import in.gov.rera.transaction.agentregistration.model.AgentRegistrationModel;
import in.gov.rera.transaction.complaint.model.ComplaintModel;
import in.gov.rera.transaction.projectregistration.model.ProjectRegistrationModel;

public class GenerateRegistrationNumber {
	
	
	public static void generateRegNumber(AgentRegistrationModel agent,StateUtModel state,String nextNumber){
		StringBuffer sb=new StringBuffer("AG/");
		//UTStateCodeMONTHYEAR0001
		//AGUP01170001
		sb.append(state.getStateUtCode()).append("/");
		sb.append(agent.getDistrictModel().getDistrictCode().toUpperCase()).append("/");
		Calendar cal=Calendar.getInstance();
		cal.set(Calendar.YEAR, cal.get(Calendar.YEAR)+5);
		String tr=""+(cal.get(Calendar.YEAR)%100);
		String mnth=(cal.get(Calendar.MONTH)+1)+"";
		String dt=(cal.get(Calendar.DATE))+"";
		if(mnth.length()<2){
			mnth='0'+mnth;
		}
		if(tr.length()<2){
			tr='0'+tr;
		}
		if(dt.length()<2){
			dt="0"+dt;
		}
		sb.append(dt).append(mnth).append(tr).append("/");
	
		sb.append(nextNumber);
		
		agent.setAgentRegistrationNo(sb.toString());
	
	}

	
	public static void generateRegNumber(ProjectRegistrationModel project,StateUtModel state,String nextNumber){
		StringBuffer sb=new StringBuffer("PR/");
		
		sb.append(state.getStateUtCode()).append("/");
		sb.append(project.getProjectDetailsModel().getDistrictModel().getDistrictCode().toUpperCase()).append("/");
		Calendar cal=Calendar.getInstance();
		String tr=""+(cal.get(Calendar.YEAR)%100);
		String mnth=(cal.get(Calendar.MONTH)+1)+"";
		String dt=(cal.get(Calendar.DATE))+"";
		if(mnth.length()<2){
			mnth='0'+mnth;
		}
		if(tr.length()<2){
			tr='0'+tr;
		}
		if(dt.length()<2){
			dt="0"+dt;
		}
		sb.append(dt).append(mnth).append(tr).append("/");
	
	    String type=	project.getProjectDetailsModel().getProjectType();
		sb.append(type.charAt(0)).append(nextNumber);
		
		
		
			
		project.setProjectRegistrationNo(sb.toString());
	}
	
	public static void generateAppNumber(AgentRegistrationModel agent,StateUtModel state){
		StringBuffer sb=new StringBuffer("AGAP");
		sb.append(state.getStateUtCode());
		Calendar cal=Calendar.getInstance();
		String tr=""+(cal.get(Calendar.YEAR)%100);
		String mnth=(cal.get(Calendar.MONTH)+1)+"";
		if(mnth.length()<2){
			mnth='0'+mnth;
		}
		if(tr.length()<2){
			tr='0'+tr;
		}
		sb.append(mnth).append(tr);
		String str=""+agent.getAgentRegistrationID();
		if(str.length()==1){
			sb.append("000").append(agent.getAgentRegistrationID());
		}else if(str.length()==2){
			sb.append("00").append(agent.getAgentRegistrationID());
		}else if(str.length()==3){
			sb.append("0").append(agent.getAgentRegistrationID());
		}else {
			sb.append(agent.getAgentRegistrationID());
		}
		
		agent.setAgentRegistrationNo(sb.toString());
	}
	
	public static void generateAppNumber(ComplaintModel mod,StateUtModel state){
		StringBuffer sb=new StringBuffer("AGAP");
		sb.append(state.getStateUtCode());
		Calendar cal=Calendar.getInstance();
		String tr=""+(cal.get(Calendar.YEAR)%100);
		String mnth=(cal.get(Calendar.MONTH)+1)+"";
		if(mnth.length()<2){
			mnth='0'+mnth;
		}
		if(tr.length()<2){
			tr='0'+tr;
		}
		sb.append(mnth).append(tr);
	
	}

	public static void generateAppNumber(ProjectRegistrationModel project,StateUtModel state){
		StringBuffer sb=new StringBuffer("PR");
		sb.append(state.getStateUtCode());
		Calendar cal=Calendar.getInstance();
		String tr=""+(cal.get(Calendar.YEAR)%100);
		String mnth=(cal.get(Calendar.MONTH)+1)+"";
		if(mnth.length()<2){
			mnth='0'+mnth;
		}
		if(tr.length()<2){
			tr='0'+tr;
		}
		sb.append(mnth).append(tr);
		String str=""+project.getProjectRegId();
		if(str.length()==1){
			sb.append("000").append(project.getProjectRegId());
		}else if(str.length()==2){
			sb.append("00").append(project.getProjectRegId());
		}else if(str.length()==3){
			sb.append("0").append(project.getProjectRegId());
		}else {
			sb.append(project.getProjectRegId());
		}
		
		project.setProjectRegistrationNo(sb.toString());
	}
/*	public static void generateTicketNumber(HelpDeskEnquiryModel helpdesk){
		StringBuffer sb=new StringBuffer();
		//sb.append(state.getStateUtCode());
		Calendar cal=Calendar.getInstance();
		String tr=""+(cal.get(Calendar.YEAR)%100);
		String mnth=(cal.get(Calendar.MONTH)+1)+"";
		if(mnth.length()<2){
			mnth='0'+mnth;
		}
		if(tr.length()<2){
			tr='0'+tr;
		}
		sb.append(mnth).append(tr);
		String str=""+helpdesk.getId();
		System.out.println("str helpdesk >>>"+str);
		if(str.length()==1){
			sb.append("000").append(helpdesk.getId());
		}else if(str.length()==2){
			sb.append("00").append(helpdesk.getId());
		}else if(str.length()==3){
			sb.append("0").append(helpdesk.getId());
		}else {
			sb.append(helpdesk.getId());
		}
		System.out.println("Recent Helpdesk Token No "+sb.toString());
		helpdesk.setTicketNumber(sb.toString());
	}*/
	
	
	

}
