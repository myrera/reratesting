package in.gov.rera.common.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.Calendar;

import in.gov.rera.transaction.agentregistration.model.AgentRegistrationModel;
import in.gov.rera.transaction.projectregistration.model.ProjectRegistrationModel;

import javax.servlet.http.HttpServletResponse;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.Font;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.TabStop.Alignment;
import com.itextpdf.text.pdf.ColumnText;
import com.itextpdf.text.pdf.PdfWriter;

public class AgentCertificateUtil {

	private AgentRegistrationModel agent;
	private PdfWriter writer;
	private Document document;
    private static Font catFont = new Font(Font.FontFamily.COURIER, 24,
            Font.BOLDITALIC);
    private static Font redFont = new Font(Font.FontFamily.COURIER, 12,
            Font.BOLDITALIC, BaseColor.RED);
    private static Font subFont = new Font(Font.FontFamily.TIMES_ROMAN, 16,
            Font.BOLD);
    private static Font smallBold = new Font(Font.FontFamily.TIMES_ROMAN, 12,
            Font.BOLD);
	
	public AgentCertificateUtil(AgentRegistrationModel project){
		this.agent=project;
	}
	
	
	public void generateAgentCertificate(HttpServletResponse response)throws Exception{
		OutputStream out=response.getOutputStream();
		generateCret(out);
		out.close();
		
	}
	
   public File generateAgentCertificate()throws Exception{
	File pdf=File.createTempFile("certFile",".pdf");
	OutputStream out	=new FileOutputStream(pdf);
	generateCret(out);
		return pdf;
	}

   private void generateCret(OutputStream out)throws Exception{
	 
	  this.document = new Document();
		this.writer = PdfWriter.getInstance(this.document, out);
		this.document.setPageSize(PageSize.A3);
		this.document.setMargins(40,40, 40, 40);
		this.document.open();
		 String header= " REGISTRATION CERTIFICATE OF REAL ESTATE AGENT";
		 Paragraph pr=new Paragraph(header,catFont);
		  pr.setAlignment(Paragraph.ALIGN_CENTER);
	        document.add(pr);
	      
	        pr=new Paragraph("     "); 
		     document.add(pr); 
		     pr=new Paragraph("     "); 
		     document.add(pr); 
		     pr=new Paragraph("     "); 
		     document.add(pr); 
		     
	   String   text= "This registration is granted under section 9 with registration certificate bearing No. ";
	     pr=new Paragraph();
	    pr.add(new Chunk(text,smallBold));
	    pr.setAlignment(Paragraph.ALIGN_CENTER);
	     pr.add(new Chunk(agent.getAgentRegistrationNo()+" ",redFont));
	     
	     pr.add(new Chunk(" to:- ",smallBold));
	     document.add(pr);    
	     
	    
	    
		     
		     if(agent.getRegistrationType().equals(ReraConstants.INDVISUAL_REG)){
		    	  pr=new Paragraph();
		    	  pr.setAlignment(Paragraph.ALIGN_CENTER);
				    pr.add(new Chunk("Mr./Ms. "+agent.getAgentDetailsModel().getAgentName()+" son of Mr./Ms. "+ agent.getAgentDetailsModel().getAgentFatherName()+
				    		" Address: "+agent.getAgentDetailsModel().getAgentIndividualAddressLine1()+", "+agent.getAgentDetailsModel().getAgentIndividualAddressLine2()+
				    		", "+agent.getAgentDetailsModel().getDistrictModel().getDistrictName()+", "+agent.getAgentDetailsModel().getDistrictModel().getStateUtModel().getStateUtName(),smallBold));
				     		     
		     }
		     else{
		    	  pr=new Paragraph();
		    	  pr.setAlignment(Paragraph.ALIGN_CENTER);
				    pr.add(new Chunk(agent.getAgentDetailsModel().getFirmName()+" "+agent.getAgentDetailsModel().getFirmRegistrationType()+" having its registred office at "+
				    		agent.getAgentDetailsModel().getFirmAddressLine1()+", "+agent.getAgentDetailsModel().getFirmAddressLine2()+", "+
				    		agent.getAgentDetailsModel().getDistrictModel().getDistrictName()+", "+agent.getAgentDetailsModel().getDistrictModel().getStateUtModel().getStateUtName(),smallBold));
				   
				    
		     }
		     
		     pr.add(new Chunk("to act as a real estate agent to facilitate the sale or purchase of any plot, apartment or building, as the case may be, in"+
" real estate projects registered in the "+ agent.getAgentDetailsModel().getDistrictModel().getStateUtModel().getStateUtName()+" State in terms of the Act and the rules and regulations made thereunder."));
		       document.add(pr); 
		       
		     pr=new Paragraph("     "); 
		     document.add(pr); 
		     pr=new Paragraph("     "); 
		     document.add(pr); 
		     pr=new Paragraph("     "); 
		     document.add(pr); 
		     pr=new Paragraph("     "); 
		     document.add(pr); 
		     
		     pr=new Paragraph("This registration is granted subject to the following conditions, namely:- "); 
		     pr.setAlignment(Paragraph.ALIGN_LEFT);
		     document.add(pr); 
		     pr=new Paragraph("     "); 
		     document.add(pr); 
		     pr=new Paragraph("     "); 
		     document.add(pr); 
		     
		     
		     
		     pr=new Paragraph("(i) The real estate agent shall not facilitate the sale or purchase of any plot, apartment or building, as the case"+
" may be, in a real estate project or part of it, being sold by the promoter which is required but not registered "+
 "with the Authority. "); 
		     pr.setAlignment(Paragraph.ALIGN_JUSTIFIED);
		     document.add(pr); 
		     pr=new Paragraph("     "); 
		     document.add(pr); 
		     
		     pr=new Paragraph("(ii) The real estate agent shall maintain and preserve such books of account, records and documents as provided under rule 12;"); 
		     pr.setAlignment(Paragraph.ALIGN_JUSTIFIED);
		     document.add(pr); 
		     pr=new Paragraph("     "); 
		     document.add(pr); 
		     
		     pr=new Paragraph("(iii) The real estate agent shall not involve himself in any unfair trade practices as specified under clause (c) of section 10;");
		     pr.setAlignment(Paragraph.ALIGN_JUSTIFIED);
		     document.add(pr); 
		     pr=new Paragraph("     "); 
		     document.add(pr); 
		     
		     pr=new Paragraph("(iv) The real estate agent shall facilitate the possession of all information and documents, as the allottee is entitled "+
"to, at the time of booking of any plot, apartment or building, as the case may be;"); 
		     pr.setAlignment(Paragraph.ALIGN_JUSTIFIED);
		     document.add(pr); 
		     pr=new Paragraph("     "); 
		     document.add(pr); 
		     
		     pr=new Paragraph("(v) The real estate agent shall provide assistance to enable the allottee and promoter to exercise their respective "+
"rights and fulfil their respective obligations at the time of booking and sale of any plot, apartment or building, "+
"as the case may be;"); 
		     pr.setAlignment(Paragraph.ALIGN_JUSTIFIED);
		     document.add(pr); 
		     pr=new Paragraph("     "); 
		     document.add(pr); 
		     
		     pr=new Paragraph("(vi) The real estate agent shall comply with the provisions of the Act and the rules and regulations made thereunder;");
		     pr.setAlignment(Paragraph.ALIGN_JUSTIFIED);
		     document.add(pr); 		     
		     pr=new Paragraph("     "); 
		     
		     
		     pr=new Paragraph("(vii) The real estate agent shall not contravene the provisions of any other law for the time being in force as applicable to him;");
		     pr.setAlignment(Paragraph.ALIGN_JUSTIFIED);
		     document.add(pr); 		     
		     pr=new Paragraph("     "); 
		     document.add(pr); 
		     
		     pr=new Paragraph("(viii)The real estate agent shall discharge such other functions as may be specified by the Authority by regulations.");
		     pr.setAlignment(Paragraph.ALIGN_JUSTIFIED);
		     document.add(pr); 		     
		     pr=new Paragraph("     "); 
		     document.add(pr); 
		     pr=new Paragraph("     "); 
		     document.add(pr); 
		     pr=new Paragraph("     "); 
		     document.add(pr); 
		     
		     pr=new Paragraph("The registration is valid for a period of five years commencing from "+DateUtil.getDateString(agent.getApprovedOn()) +" and ending with "+DateUtil.getDateString(agent.getExpireDate())+" unless " +
		     		"renewed by the Authority in accordance with the provisions of the Act or the rules and regulations made thereunder.");
		     pr.setAlignment(Paragraph.ALIGN_JUSTIFIED);
		     document.add(pr); 		     
		     pr=new Paragraph("     "); 
		     document.add(pr); 
		     document.add(pr); 
		     pr=new Paragraph("     ");   		     
		     document.add(pr); 
		     pr=new Paragraph("     "); 
		     document.add(pr); 
		     
		     
		     pr=new Paragraph("If the above mentioned conditions are not fulfilled by the real estate agent, the Authority may take necessary action " +
		     		"against the real estate agent including revoking the registration granted herein, as per the Act and the rules and regulations made thereunder"); 
		     pr.setAlignment(Paragraph.ALIGN_JUSTIFIED);
		     document.add(pr); 
		     
		     pr=new Paragraph("     "); 
		     document.add(pr); 
		     pr=new Paragraph("     "); 
		     document.add(pr); 
		     pr=new Paragraph("     "); 
		     document.add(pr); 
		     pr=new Paragraph("     "); 
		     document.add(pr); 
		     pr=new Paragraph("     "); 
		     document.add(pr); 
		     pr=new Paragraph("     "); 
		     document.add(pr); 
		     
		     pr=new Paragraph(" Date:  "+ DateUtil.getDateString(agent.getApprovedOn())); 
		     document.add(pr);  
		     pr=new Paragraph(" Place:  "); 
		     document.add(pr);  
		     
		     
		     pr=new Paragraph(" Signature and seal of the Authorised Officer "); 
		      pr.setAlignment(Paragraph.ALIGN_RIGHT);
		     document.add(pr);  
		     pr=new Paragraph(" Real Estate Regulatory Authority      "); 
		     pr.setAlignment(Paragraph.ALIGN_RIGHT);
		     document.add(pr);  
		     
		     document.close();
		     
		     
   }
   
   
   
   
   
   
   

	public void generateInterimCertificate(HttpServletResponse response)throws Exception{
		OutputStream out=response.getOutputStream();
		generateInterimCret(out);
		out.close();
		
	}
	
  public File generateInterimCertificate()throws Exception{
	File pdf=File.createTempFile("certFile",".pdf");
	OutputStream out	=new FileOutputStream(pdf);
	generateInterimCret(out);
		return pdf;
	}

  private void generateInterimCret(OutputStream out)throws Exception{
	 
	  this.document = new Document();
		this.writer = PdfWriter.getInstance(this.document, out);
		this.document.setPageSize(PageSize.A3);
		this.document.setMargins(40,40, 40, 40);
		this.document.open();
		 String header= " REGISTRATION CERTIFICATE OF REAL ESTATE AGENT (INTERIM)";
		 Paragraph pr=new Paragraph(header,catFont);
		  pr.setAlignment(Paragraph.ALIGN_CENTER);
	        document.add(pr);
	      
	        pr=new Paragraph("     "); 
		     document.add(pr); 
		     pr=new Paragraph("     "); 
		     document.add(pr); 
		     pr=new Paragraph("     "); 
		     document.add(pr); 
		     
	   String   text= "This interim registration is granted with registration certificate bearing No. ";
	     pr=new Paragraph();
	    pr.add(new Chunk(text,smallBold));
	    pr.setAlignment(Paragraph.ALIGN_CENTER);
	     pr.add(new Chunk(agent.getApplicationNo()+" ",redFont));
	     
	     pr.add(new Chunk(" to:- ",smallBold));
	     document.add(pr);    
	     
	    
	    
		     
		     if(agent.getRegistrationType().equals(ReraConstants.INDVISUAL_REG)){
		    	  pr=new Paragraph();
		    	  pr.setAlignment(Paragraph.ALIGN_CENTER);
				    pr.add(new Chunk("Mr./Ms. "+agent.getAgentDetailsModel().getAgentName()+" son of Mr./Ms. "+ agent.getAgentDetailsModel().getAgentFatherName()+
				    		" Address: "+agent.getAgentDetailsModel().getAgentIndividualAddressLine1()+", "+agent.getAgentDetailsModel().getAgentIndividualAddressLine2()+
				    		", "+agent.getAgentDetailsModel().getDistrictModel().getDistrictName()+", "+agent.getAgentDetailsModel().getDistrictModel().getStateUtModel().getStateUtName(),smallBold));
				     		     
		     }
		     else{
		    	  pr=new Paragraph();
		    	  pr.setAlignment(Paragraph.ALIGN_CENTER);
				    pr.add(new Chunk(agent.getAgentDetailsModel().getFirmName()+" "+agent.getAgentDetailsModel().getFirmRegistrationType()+" having its registred office at "+
				    		agent.getAgentDetailsModel().getFirmAddressLine1()+", "+agent.getAgentDetailsModel().getFirmAddressLine2()+", "+
				    		agent.getAgentDetailsModel().getDistrictModel().getDistrictName()+", "+agent.getAgentDetailsModel().getDistrictModel().getStateUtModel().getStateUtName(),smallBold));
				   
				    
		     }
		     
		     pr.add(new Chunk("to act as a real estate agent to facilitate the sale or purchase of any plot, apartment or building, as the case may be, in"+
" real estate projects registered in the "+ agent.getAgentDetailsModel().getDistrictModel().getStateUtModel().getStateUtName()+" State in terms of the Act and the rules and regulations made thereunder."));
		       document.add(pr); 
		       
		     pr=new Paragraph("     "); 
		     document.add(pr); 
		     pr=new Paragraph("     "); 
		     document.add(pr); 
		     pr=new Paragraph("     "); 
		     document.add(pr); 
		     pr=new Paragraph("     "); 
		     document.add(pr); 
		     
		     pr=new Paragraph("This registration is granted subject to the following conditions, namely:- "); 
		     pr.setAlignment(Paragraph.ALIGN_LEFT);
		     document.add(pr); 
		     pr=new Paragraph("     "); 
		     document.add(pr); 
		     pr=new Paragraph("     "); 
		     document.add(pr); 
		     
		     
		     
		     pr=new Paragraph("(i) The real estate agent shall not facilitate the sale or purchase of any plot, apartment or building, as the case"+
" may be, in a real estate project or part of it, being sold by the promoter which is required but not registered "+
"with the Authority. "); 
		     pr.setAlignment(Paragraph.ALIGN_JUSTIFIED);
		     document.add(pr); 
		     pr=new Paragraph("     "); 
		     document.add(pr); 
		     
		     pr=new Paragraph("(ii) The real estate agent shall maintain and preserve such books of account, records and documents as provided under rule 12;"); 
		     pr.setAlignment(Paragraph.ALIGN_JUSTIFIED);
		     document.add(pr); 
		     pr=new Paragraph("     "); 
		     document.add(pr); 
		     
		     pr=new Paragraph("(iii) The real estate agent shall not involve himself in any unfair trade practices as specified under clause (c) of section 10;");
		     pr.setAlignment(Paragraph.ALIGN_JUSTIFIED);
		     document.add(pr); 
		     pr=new Paragraph("     "); 
		     document.add(pr); 
		     
		     pr=new Paragraph("(iv) The real estate agent shall facilitate the possession of all information and documents, as the allottee is entitled "+
"to, at the time of booking of any plot, apartment or building, as the case may be;"); 
		     pr.setAlignment(Paragraph.ALIGN_JUSTIFIED);
		     document.add(pr); 
		     pr=new Paragraph("     "); 
		     document.add(pr); 
		     
		     pr=new Paragraph("(v) The real estate agent shall provide assistance to enable the allottee and promoter to exercise their respective "+
"rights and fulfil their respective obligations at the time of booking and sale of any plot, apartment or building, "+
"as the case may be;"); 
		     pr.setAlignment(Paragraph.ALIGN_JUSTIFIED);
		     document.add(pr); 
		     pr=new Paragraph("     "); 
		     document.add(pr); 
		     
		     pr=new Paragraph("(vi) The real estate agent shall comply with the provisions of the Act and the rules and regulations made thereunder;");
		     pr.setAlignment(Paragraph.ALIGN_JUSTIFIED);
		     document.add(pr); 		     
		     pr=new Paragraph("     "); 
		     
		     
		     pr=new Paragraph("(vii) The real estate agent shall not contravene the provisions of any other law for the time being in force as applicable to him;");
		     pr.setAlignment(Paragraph.ALIGN_JUSTIFIED);
		     document.add(pr); 		     
		     pr=new Paragraph("     "); 
		     document.add(pr); 
		     
		     pr=new Paragraph("(viii)The real estate agent shall discharge such other functions as may be specified by the Authority by regulations.");
		     pr.setAlignment(Paragraph.ALIGN_JUSTIFIED);
		     document.add(pr); 		     
		     pr=new Paragraph("     "); 
		     document.add(pr); 
		     pr=new Paragraph("     "); 
		     document.add(pr); 
		     pr=new Paragraph("     "); 
		     document.add(pr); 
		    Calendar c= Calendar.getInstance();
		    Calendar c2= Calendar.getInstance();
		    c2.set(Calendar.YEAR, c.get(Calendar.YEAR)+1);
		     pr=new Paragraph("The registration is valid for a period of five years commencing from "+DateUtil.getDateString(c) +" and ending with "+DateUtil.getDateString(c2)+" unless " +
		     		"renewed by the Authority in accordance with the provisions of the Act or the rules and regulations made thereunder.");
		     pr.setAlignment(Paragraph.ALIGN_JUSTIFIED);
		     document.add(pr); 		     
		     pr=new Paragraph("     "); 
		     document.add(pr); 
		     document.add(pr); 
		     pr=new Paragraph("     ");   		     
		     document.add(pr); 
		     pr=new Paragraph("     "); 
		     document.add(pr); 
		     
		     
		     pr=new Paragraph("If the above mentioned conditions are not fulfilled by the real estate agent, the Authority may take necessary action " +
		     		"against the real estate agent including revoking the registration granted herein, as per the Act and the rules and regulations made thereunder"); 
		     pr.setAlignment(Paragraph.ALIGN_JUSTIFIED);
		     document.add(pr); 
		     
		     pr=new Paragraph("     "); 
		     document.add(pr); 
		     pr=new Paragraph("     "); 
		     document.add(pr); 
		     pr=new Paragraph("     "); 
		     document.add(pr); 
		     pr=new Paragraph("     "); 
		     document.add(pr); 
		     pr=new Paragraph("     "); 
		     document.add(pr); 
		     pr=new Paragraph("     "); 
		     document.add(pr); 
		     
		     pr=new Paragraph(" Date:  "+ DateUtil.getDateString(agent.getApprovedOn())); 
		     document.add(pr);  
		     
		     
		     pr=new Paragraph(" Real Estate Regulatory Authority      "); 
		     pr.setAlignment(Paragraph.ALIGN_RIGHT);
		     document.add(pr);  
		     
		     document.close();
		     
		     
  }

}
