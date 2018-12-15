package in.gov.rera.common.util;

import in.gov.rera.transaction.agentregistration.model.AgentRegistrationModel;
import in.gov.rera.transaction.complaint.model.ComplaintModel;
import in.gov.rera.transaction.projectregistration.model.ProjectRegistrationModel;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.Calendar;
import java.util.ResourceBundle;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.ColumnText;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfWriter;
import org.apache.log4j.Logger;

public class AcknowledgeUtilty2 {

	static Logger log= Logger.getLogger(AcknowledgeUtilty2.class);
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

	public static void main(String[] args) {
		try{
		AcknowledgeUtilty2 ack=new AcknowledgeUtilty2();
		ack.generateProjectCertificate();
		log.info("Project File created");
		ack.generateAgentCertificate();
		log.info("Agent File created");
		}catch (Exception e) {
			log.error(e.getMessage(),e);
		}
	}
	
	
	private String projectFile="e:/files/ProjectCertificate.pdf";
	private String agentFile="e:/files/AgentCertificate.pdf";
	private String projectPath="e:/files/Project_Certificate.jpg";
	private String agentPath="e:/files/Agent_Certificate.jpg";
	
	
	
	/*Agent Certificate*/		
	
	public void generateAgentCertificate(HttpServletResponse res,ProjectRegistrationModel project)throws Exception{
		OutputStream out	=res.getOutputStream();
		generateAgentAck(out,project);
		}



public File generateAgentCertificate()throws Exception{
	File pdf=new File(agentFile);
	OutputStream out	=new FileOutputStream(pdf);
	generateAgentAck(out,null);
		return pdf;
	}

   private void generateAgentAck(OutputStream out,ProjectRegistrationModel project)throws Exception{
	 
	  this.document = new Document();
	  Rectangle rect = new Rectangle(0,0,900,950);
		this.writer = PdfWriter.getInstance(this.document, out);
		this.document.setPageSize(rect);
		this.document.setMargins(40,40, 40, 40);
		this.document.open();
		//Desert.jpeg	
		ResourceBundle rb=ResourceBundle.getBundle("in.gov.rera.common.config.RERAProperties");
		String ackLoc=rb.getString("ACK_FOLDER_PATH"); 
	
		 Image img = Image.getInstance(agentPath);
		 
		 img.scaleAbsolute(rect);
						
	        PdfContentByte canvas = writer.getDirectContentUnder();
	        img.setAbsolutePosition(0, 0);
	        canvas.addImage(img);
	
	        // the direct content
	        PdfContentByte cb = writer.getDirectContent();
	        // the rectangle and the text we want to fit in the rectangle
	        
	     
	        
	        BaseFont bf = BaseFont.createFont();
	        float fontSize = 12.0f;
	 
	        // For Registration Number
	        
	        //  Phrase phrase = new Phrase(project.getApplicationNo(), new Font(bf, fontSize));
	        Phrase phrase = new Phrase("PR/KN/080817", new Font(bf, fontSize));
	        ColumnText.showTextAligned(cb, Element.ALIGN_CENTER, phrase,
	            			                778f,728f, 0);
	        
//For Agent Name
	        
	        //  Phrase phrase = new Phrase(project.getApplicationNo(), new Font(bf, fontSize));
	         phrase = new Phrase("Prakash Singh", new Font(bf, fontSize));
	        ColumnText.showTextAligned(cb, Element.ALIGN_CENTER, phrase,
	            			                550f,712f, 0);
	 
	        
	        
//For Father Name
	        
	        //  Phrase phrase = new Phrase(project.getApplicationNo(), new Font(bf, fontSize));
	         phrase = new Phrase("M K Singh", new Font(bf, fontSize));
	        ColumnText.showTextAligned(cb, Element.ALIGN_CENTER, phrase,
	            			                205f,694f, 0);
	 
	
//Taluka
	        
	    //  Phrase phrase = new Phrase(project.getApplicationNo(), new Font(bf, fontSize));
	         phrase = new Phrase("xyz Taluka", new Font(bf, fontSize));
	        ColumnText.showTextAligned(cb, Element.ALIGN_CENTER, phrase,
	        		487f,669f, 0);
	        
//District
	        
		    //  Phrase phrase = new Phrase(project.getApplicationNo(), new Font(bf, fontSize));
		         phrase = new Phrase("xyz District", new Font(bf, fontSize));
		        ColumnText.showTextAligned(cb, Element.ALIGN_CENTER, phrase,
		            			                755f,694f, 0);	    
//State
		        
			    //  Phrase phrase = new Phrase(project.getApplicationNo(), new Font(bf, fontSize));
			         phrase = new Phrase("xyz State", new Font(bf, fontSize));
			        ColumnText.showTextAligned(cb, Element.ALIGN_CENTER, phrase,
			            			                205f,675f, 0);	   
	
 //Firm or Compay		1	        
			    //  Phrase phrase = new Phrase(project.getApplicationNo(), new Font(bf, fontSize));
			         phrase = new Phrase("xyz Firm1", new Font(bf, fontSize));
			        ColumnText.showTextAligned(cb, Element.ALIGN_CENTER, phrase,
			            			                425f,640f, 0);	 
			        
 //Firm or Compay		2	        
				    //  Phrase phrase = new Phrase(project.getApplicationNo(), new Font(bf, fontSize));
				         phrase = new Phrase("xyz Firm2", new Font(bf, fontSize));
				        ColumnText.showTextAligned(cb, Element.ALIGN_CENTER, phrase,
				            			                700f,640f, 0);				        
				        
 //Address/Place        
					    //  Phrase phrase = new Phrase(project.getApplicationNo(), new Font(bf, fontSize));
					         phrase = new Phrase("xyz Place", new Font(bf, fontSize));
					        ColumnText.showTextAligned(cb, Element.ALIGN_CENTER, phrase,
					            			                457f,620f, 0);		
					        
//State        
						    //  Phrase phrase = new Phrase(project.getApplicationNo(), new Font(bf, fontSize));
						         phrase = new Phrase("xyz state term", new Font(bf, fontSize));
						        ColumnText.showTextAligned(cb, Element.ALIGN_CENTER, phrase,
						            			                414f,586f, 0);	
// Register Date						        

						        phrase = new Phrase(DateUtil.getDateString(Calendar.getInstance()), new Font(bf, fontSize));
						        ColumnText.showTextAligned(cb, Element.ALIGN_CENTER, phrase,
	            			                568f,226f, 0);
	        
	
 // Expire Date						        

						        phrase = new Phrase("2022-08-08", new Font(bf, fontSize));
						        ColumnText.showTextAligned(cb, Element.ALIGN_CENTER, phrase,
	            			               748f,226f, 0);
	        
	        
	        
		     document.close();
		     
		     
   }
	
	
	
	/*Project Certificate*/
	
		   public void generateProjectCertificate(HttpServletResponse res,ProjectRegistrationModel project)throws Exception{
				OutputStream out	=res.getOutputStream();
				generateProjectAck(out,project);
				}
	
	
	
	   public File generateProjectCertificate()throws Exception{
			File pdf=new File(projectFile);
			OutputStream out	=new FileOutputStream(pdf);
			generateProjectAck(out,null);
				return pdf;
			}

		   private void generateProjectAck(OutputStream out,ProjectRegistrationModel project)throws Exception{
			 
			  this.document = new Document();
			  Rectangle rect = new Rectangle(0,0,900,950);
				this.writer = PdfWriter.getInstance(this.document, out);
				this.document.setPageSize(rect);
				this.document.setMargins(40,40, 40, 40);
				this.document.open();
				//Desert.jpeg	
				ResourceBundle rb=ResourceBundle.getBundle("in.gov.rera.common.config.RERAProperties");
				String ackLoc=rb.getString("ACK_FOLDER_PATH"); 
			
				 Image img = Image.getInstance(ackLoc+"PROJ_ACK.jpg");
				 
				 img.scaleAbsolute(rect);
								
			        PdfContentByte canvas = writer.getDirectContentUnder();
			        img.setAbsolutePosition(0, 0);
			        canvas.addImage(img);
			
			        // the direct content
			        PdfContentByte cb = writer.getDirectContent();
			        // the rectangle and the text we want to fit in the rectangle
			        
			     
			        
			        BaseFont bf = BaseFont.createFont();
			        float fontSize = 12.0f;
			 
			      /*  if(project.getRegistrationType().equals(ReraConstants.INDVISUAL_REG)){
			        	
			        }else{
			        	
			        }*/
			        // For Registration Number
			        
			        //  Phrase phrase = new Phrase(project.getApplicationNo(), new Font(bf, fontSize));
			        Phrase phrase = new Phrase("PR/KN/080817/MAA000456", new Font(bf, fontSize));
			        ColumnText.showTextAligned(cb, Element.ALIGN_CENTER, phrase,
			            			                285f,687f, 0);
			        
// For Promoter Name
			        
			        //  Phrase phrase = new Phrase(project.getApplicationNo(), new Font(bf, fontSize));
			         phrase = new Phrase("Prakash Singh", new Font(bf, fontSize));
			        ColumnText.showTextAligned(cb, Element.ALIGN_CENTER, phrase,
			            			                395f,635f, 0);
			 
			        
			        
// For Father Name
			        
			        //  Phrase phrase = new Phrase(project.getApplicationNo(), new Font(bf, fontSize));
			         phrase = new Phrase("M K Singh", new Font(bf, fontSize));
			        ColumnText.showTextAligned(cb, Element.ALIGN_CENTER, phrase,
			            			                605f,635f, 0);
			 
			        
			        
			        
			        
//Taluka	        
			         phrase = new Phrase("prj taluka", new Font(bf, fontSize));
			        ColumnText.showTextAligned(cb, Element.ALIGN_CENTER, phrase,
			            			                220f,617f, 0);
			        
//District		        
			         phrase = new Phrase("prj Dist", new Font(bf, fontSize));
			        ColumnText.showTextAligned(cb, Element.ALIGN_CENTER, phrase,
			            			                410f,616f, 0);
//State		        
			         phrase = new Phrase("prj state", new Font(bf, fontSize));
			        ColumnText.showTextAligned(cb, Element.ALIGN_CENTER, phrase,
			            			               660f,616f, 0);
//Firm or Company		        
			         phrase = new Phrase("prj society", new Font(bf, fontSize));
			        ColumnText.showTextAligned(cb, Element.ALIGN_CENTER, phrase,
			            			                220f,544f, 0);
			        
//Business Address		        
			         phrase = new Phrase("prj Busns addrs", new Font(bf, fontSize));
			        ColumnText.showTextAligned(cb, Element.ALIGN_CENTER, phrase,
			            			                717f,544f, 0);	  
//Registration Approved Date		        
			         phrase = new Phrase(DateUtil.getDateString(Calendar.getInstance()), new Font(bf, fontSize));
			        ColumnText.showTextAligned(cb, Element.ALIGN_CENTER, phrase,
			            			                487f,371f, 0);
			        
//Expire Date		        
			         phrase = new Phrase("2022-08-08", new Font(bf, fontSize));
			        ColumnText.showTextAligned(cb, Element.ALIGN_CENTER, phrase,
			            			                703f,371f, 0);
			        
//Expire Date		        
			         phrase = new Phrase("2022-08-08", new Font(bf, fontSize));
			        ColumnText.showTextAligned(cb, Element.ALIGN_CENTER, phrase,
			            			               185f,354f, 0);
			      
			        
			        
			 
			        /* phrase = new Phrase(DateUtil.getDateString(Calendar.getInstance()), new Font(bf, fontSize));
			        ColumnText.showTextAligned(cb, Element.ALIGN_CENTER, phrase,
			            			                285f,570f, 0);*/
			        
			        
				     document.close();
				     
				     
		   }

}

