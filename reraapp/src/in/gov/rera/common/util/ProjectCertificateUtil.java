package in.gov.rera.common.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.Calendar;

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

public class ProjectCertificateUtil {

	private ProjectRegistrationModel project;
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
	
	public ProjectCertificateUtil(ProjectRegistrationModel project){
		this.project=project;
	}
	
	public void generateProjectCertificate(HttpServletResponse response)throws Exception{
		OutputStream out=response.getOutputStream();
		generateCret(out);
		out.close();
		
	}
	
   public File generateProjectCertificate()throws Exception{
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
		 String header= "REGISTRATION CERTIFICATE OF PROJECT";
		 Paragraph pr=new Paragraph(header,catFont);
		  pr.setAlignment(Paragraph.ALIGN_CENTER);
	        document.add(pr);
	      
	        pr=new Paragraph("     "); 
		     document.add(pr); 
		     pr=new Paragraph("     "); 
		     document.add(pr); 
		     pr=new Paragraph("     "); 
		     document.add(pr); 
		     
	   String   text= "This registration is granted under section 5 to the following project under project registration number ";
	     pr=new Paragraph();
	    pr.add(new Chunk(text,smallBold));
	    pr.setAlignment(Paragraph.ALIGN_CENTER);
	     pr.add(new Chunk(project.getProjectRegistrationNo()+" ",redFont));
	     document.add(pr);    
	     
	     pr=new Paragraph("     "); 
	     document.add(pr); 
	     
	     pr=new Paragraph();
	     pr.setAlignment(Paragraph.ALIGN_CENTER);
	     pr.add(new Chunk("Project : ",smallBold));
		    pr.add(new Chunk(project.getProjectDetailsModel().getProjectName()+" ",subFont));
		     pr.add(new Chunk("Address: "+project.getProjectDetailsModel().getAddressLine1()+", "+project.getProjectDetailsModel().getAddressLine2()+", "+
		    		 project.getProjectDetailsModel().getSubDistrictModel().getSubDistrictName()+", "+project.getProjectDetailsModel().getDistrictModel().getDistrictName() +", "+
		    		 project.getProjectDetailsModel().getDistrictModel().getStateUtModel().getStateUtName(),smallBold));
		     document.add(pr); 
		     pr=new Paragraph("     "); 
		     document.add(pr); 
	       
		     pr=new Paragraph("     "); 
		     document.add(pr); 
		     
		     if(project.getRegistrationType().equals(ReraConstants.INDVISUAL_REG)){
		    	  pr=new Paragraph();
		    	  pr.setAlignment(Paragraph.ALIGN_CENTER);
				    pr.add(new Chunk("Mr./Ms. "+project.getPromoterDetailsModel().getPromoterName()+" son of Mr./Ms. "+ project.getPromoterDetailsModel().getPromoterIndividualFatherName()+
				    		" Address: "+project.getPromoterDetailsModel().getAddressLine1()+", "+project.getPromoterDetailsModel().getAddressLine2()+", "+project.getPromoterDetailsModel().getDistrictModel().getDistrictName()+", "+
				    		project.getPromoterDetailsModel().getDistrictModel().getStateUtModel().getStateUtName() ,smallBold));
				     		     document.add(pr);  
		     }
		     else{
		    	  pr=new Paragraph();
		    	  pr.setAlignment(Paragraph.ALIGN_CENTER);
				    pr.add(new Chunk(project.getPromoterDetailsModel().getPromoterName()+" "+project.getPromoterDetailsModel().getTypeOfPromoter()+" having its registered office "+project.getPromoterDetailsModel().getAddressLine1()+", "+project.getPromoterDetailsModel().getAddressLine2()+", "+project.getPromoterDetailsModel().getDistrictModel().getDistrictName()+", "+
				    		project.getPromoterDetailsModel().getDistrictModel().getStateUtModel().getStateUtName() ,smallBold));
				   
				     document.add(pr);  
		     }
		     pr=new Paragraph("     "); 
		     document.add(pr); 
		     pr=new Paragraph("     "); 
		     document.add(pr); 
		     pr=new Paragraph("     "); 
		     document.add(pr); 
		     
		     pr=new Paragraph("This registration is granted subject to the following conditions, namely:-    "); 
		     pr.setAlignment(Paragraph.ALIGN_LEFT);
		     document.add(pr); 
		     pr=new Paragraph("     "); 
		     document.add(pr); 
		     
		     
		     pr=new Paragraph("(i) The promoter shall enter into an agreement for sale with the allottees as prescribed by the appropriate Government. "); 
		     pr.setAlignment(Paragraph.ALIGN_JUSTIFIED);
		     document.add(pr); 
		     pr=new Paragraph("     "); 
		     document.add(pr); 
		     
		     pr=new Paragraph("(ii) The promoter shall execute and register a conveyance deed in favour of the allottee or the association of the"+
           " allottees, as the case may be, of the apartment, plot or building, as the case may be, or the common areas as "+
           "per section 17."); 
		     pr.setAlignment(Paragraph.ALIGN_JUSTIFIED);
		     document.add(pr); 
		     pr=new Paragraph("     "); 
		     document.add(pr); 
		     
		     pr=new Paragraph("(iii) The promoter shall deposit seventy per cent. of the amounts realised by the promoter in a separate account "+
"to be maintained in a schedule bank to cover the cost of construction and the land cost to be used only for "+
"that purpose as per sub-clause (D) of clause (l) of sub-section (2) of section 4. ");
		     pr.setAlignment(Paragraph.ALIGN_JUSTIFIED);
		     document.add(pr); 
		     pr=new Paragraph("     "); 
		     document.add(pr); 
		     
		     pr=new Paragraph("(iv) The registration shall be valid  from "+DateUtil.getDateString(project.getApprovedOn())+" and ending "+
                        "with "+DateUtil.getDateString(project.getExpireDate())+" unless extended by the Authority in accordance with the Act and the"+
                          "rules made thereunder."); 
		     pr.setAlignment(Paragraph.ALIGN_JUSTIFIED);
		     document.add(pr); 
		     pr=new Paragraph("     "); 
		     document.add(pr); 
		     
		     pr=new Paragraph("(v) The promoter shall comply with the provisions of the Act and the rules and regulations made thereunder."); 
		     pr.setAlignment(Paragraph.ALIGN_JUSTIFIED);
		     document.add(pr); 
		     pr=new Paragraph("     "); 
		     document.add(pr); 
		     
		     pr=new Paragraph("(vi) The promoter shall not contravene the provisions of any other law for the time being in force as applicable to the project.");
		     pr.setAlignment(Paragraph.ALIGN_JUSTIFIED);
		     document.add(pr); 
		     
		     pr=new Paragraph("     "); 
		     document.add(pr); 
		     pr=new Paragraph("     "); 
		     document.add(pr); 
		     pr=new Paragraph("     "); 
		     document.add(pr); 
		     
		     
		     pr=new Paragraph("If the above mentioned conditions are not fulfilled by the promoter, the Authority may take necessary action against "+
     "the promoter including revoking the registration granted herein, as per the Act and the rules and regulations made "+
       "thereunder."); 
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
		     
		     pr=new Paragraph(" Date:  "+ DateUtil.getDateString(project.getApprovedOn())); 
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
	
   public File generateProjectInterimCertificate()throws Exception{
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
		 String header= "REGISTRATION CERTIFICATE OF PROJECT (INTERIM)";
		 Paragraph pr=new Paragraph(header,catFont);
		  pr.setAlignment(Paragraph.ALIGN_CENTER);
	        document.add(pr);
	      
	        pr=new Paragraph("     "); 
		     document.add(pr); 
		     pr=new Paragraph("     "); 
		     document.add(pr); 
		     pr=new Paragraph("     "); 
		     document.add(pr); 
		     
	   String   text= "This interim registration is granted to the following project under project registration number ";
	     pr=new Paragraph();
	    pr.add(new Chunk(text,smallBold));
	    pr.setAlignment(Paragraph.ALIGN_CENTER);
	     pr.add(new Chunk(project.getApplicationNo()+" ",redFont));
	     document.add(pr);    
	     
	     pr=new Paragraph("     "); 
	     document.add(pr); 
	     
	     pr=new Paragraph();
	     pr.setAlignment(Paragraph.ALIGN_CENTER);
	     pr.add(new Chunk("Project : ",smallBold));
		    pr.add(new Chunk(project.getProjectDetailsModel().getProjectName()+" ",subFont));
		     pr.add(new Chunk("Address: "+project.getProjectDetailsModel().getAddressLine1()+", "+project.getProjectDetailsModel().getAddressLine2()+", "+
		    		 project.getProjectDetailsModel().getSubDistrictModel().getSubDistrictName()+", "+project.getProjectDetailsModel().getDistrictModel().getDistrictName() +", "+
		    		 project.getProjectDetailsModel().getDistrictModel().getStateUtModel().getStateUtName(),smallBold));
		     document.add(pr); 
		     pr=new Paragraph("     "); 
		     document.add(pr); 
	       
		     pr=new Paragraph("     "); 
		     document.add(pr); 
		     
		     if(project.getRegistrationType().equals(ReraConstants.INDVISUAL_REG)){
		    	  pr=new Paragraph();
		    	  pr.setAlignment(Paragraph.ALIGN_CENTER);
				    pr.add(new Chunk("Mr./Ms. "+project.getPromoterDetailsModel().getPromoterName()+" son of Mr./Ms. "+ project.getPromoterDetailsModel().getPromoterIndividualFatherName()+
				    		" Address: "+project.getPromoterDetailsModel().getAddressLine1()+", "+project.getPromoterDetailsModel().getAddressLine2()+", "+project.getPromoterDetailsModel().getDistrictModel().getDistrictName()+", "+
				    		project.getPromoterDetailsModel().getDistrictModel().getStateUtModel().getStateUtName() ,smallBold));
				     		     document.add(pr);  
		     }
		     else{
		    	  pr=new Paragraph();
		    	  pr.setAlignment(Paragraph.ALIGN_CENTER);
				    pr.add(new Chunk(project.getPromoterDetailsModel().getPromoterName()+" "+project.getPromoterDetailsModel().getTypeOfPromoter()+" having its registered office "+project.getPromoterDetailsModel().getAddressLine1()+", "+project.getPromoterDetailsModel().getAddressLine2()+", "+project.getPromoterDetailsModel().getDistrictModel().getDistrictName()+", "+
				    		project.getPromoterDetailsModel().getDistrictModel().getStateUtModel().getStateUtName() ,smallBold));
				   
				     document.add(pr);  
		     }
		     pr=new Paragraph("     "); 
		     document.add(pr); 
		     pr=new Paragraph("     "); 
		     document.add(pr); 
		     pr=new Paragraph("     "); 
		     document.add(pr); 
		     
		     pr=new Paragraph("This registration is granted subject to the following conditions, namely:-    "); 
		     pr.setAlignment(Paragraph.ALIGN_LEFT);
		     document.add(pr); 
		     pr=new Paragraph("     "); 
		     document.add(pr); 
		     
		     
		     pr=new Paragraph("(i) The promoter shall enter into an agreement for sale with the allottees as prescribed by the appropriate Government. "); 
		     pr.setAlignment(Paragraph.ALIGN_JUSTIFIED);
		     document.add(pr); 
		     pr=new Paragraph("     "); 
		     document.add(pr); 
		     
		     pr=new Paragraph("(ii) The promoter shall execute and register a conveyance deed in favour of the allottee or the association of the"+
           " allottees, as the case may be, of the apartment, plot or building, as the case may be, or the common areas as "+
           "per section 17."); 
		     pr.setAlignment(Paragraph.ALIGN_JUSTIFIED);
		     document.add(pr); 
		     pr=new Paragraph("     "); 
		     document.add(pr); 
		     
		     pr=new Paragraph("(iii) The promoter shall deposit seventy per cent. of the amounts realised by the promoter in a separate account "+
"to be maintained in a schedule bank to cover the cost of construction and the land cost to be used only for "+
"that purpose as per sub-clause (D) of clause (l) of sub-section (2) of section 4. ");
		     pr.setAlignment(Paragraph.ALIGN_JUSTIFIED);
		     document.add(pr); 
		     pr=new Paragraph("     "); 
		     document.add(pr); 
		     
		     pr=new Paragraph("(iv) The registration shall be valid  from "+DateUtil.getDateString(project.getProjectDetailsModel().getStartDate())+" and ending "+
                        "with "+DateUtil.getDateString(project.getProjectDetailsModel().getStartDate())+" unless extended by the Authority in accordance with the Act and the"+
                          "rules made thereunder."); 
		     pr.setAlignment(Paragraph.ALIGN_JUSTIFIED);
		     document.add(pr); 
		     pr=new Paragraph("     "); 
		     document.add(pr); 
		     
		     pr=new Paragraph("(v) The promoter shall comply with the provisions of the Act and the rules and regulations made thereunder."); 
		     pr.setAlignment(Paragraph.ALIGN_JUSTIFIED);
		     document.add(pr); 
		     pr=new Paragraph("     "); 
		     document.add(pr); 
		     
		     pr=new Paragraph("(vi) The promoter shall not contravene the provisions of any other law for the time being in force as applicable to the project.");
		     pr.setAlignment(Paragraph.ALIGN_JUSTIFIED);
		     document.add(pr); 
		     
		     pr=new Paragraph("     "); 
		     document.add(pr); 
		     pr=new Paragraph("     "); 
		     document.add(pr); 
		     pr=new Paragraph("     "); 
		     document.add(pr); 
		     
		     
		     pr=new Paragraph("If the above mentioned conditions are not fulfilled by the promoter, the Authority may take necessary action against "+
     "the promoter including revoking the registration granted herein, as per the Act and the rules and regulations made "+
       "thereunder."); 
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
		     
		     pr=new Paragraph(" Date:  "+ DateUtil.getDateString(Calendar.getInstance())); 
		     document.add(pr);  
		     
		     
		     pr=new Paragraph(" Real Estate Regulatory Authority      "); 
		     pr.setAlignment(Paragraph.ALIGN_RIGHT);
		     document.add(pr);  
		     
		     document.close();
		     
		     
   }

   
   
   
   
   
}
