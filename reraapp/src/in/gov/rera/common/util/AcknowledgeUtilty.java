package in.gov.rera.common.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.ResourceBundle;

import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Image;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.BarcodeQRCode;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.ColumnText;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfWriter;

import in.gov.rera.transaction.agentregistration.model.AgentRegistrationModel;
import in.gov.rera.transaction.complaint.model.ComplaintModel;
import in.gov.rera.transaction.projectregistration.model.ProjectRegistrationModel;

public class AcknowledgeUtilty {
	static Logger log = Logger.getLogger(AcknowledgeUtilty.class);
	private ProjectRegistrationModel project;
	private PdfWriter writer;
	private Document document;
	private static Font catFont = new Font(Font.FontFamily.COURIER, 24, Font.BOLDITALIC);
	private static Font redFont = new Font(Font.FontFamily.COURIER, 12, Font.BOLDITALIC, BaseColor.RED);
	private static Font subFont = new Font(Font.FontFamily.TIMES_ROMAN, 16, Font.BOLD);
	private static Font smallBold = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.BOLD);

	public static void main(String[] args) {
		try {
			final File folder = new File("/users/tejomaya/Documents/dms/cert/");

			for (final File fileEntry : folder.listFiles()) {

				System.out.println(fileEntry.getName());

			}

			System.out.println("PR/KN/170801/000976".replaceAll("/", ""));
			AcknowledgeUtilty ack = new AcknowledgeUtilty();
			// ack.generateComplaintAck();
			log.info("File created");

			ack.generateProjectCertificate();
			log.info("Project File created");
			// ack.generateAgentAck();
			log.info("Agent File created");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
	}

	public void generateComplaintAck(HttpServletResponse res, ComplaintModel comp) throws Exception {

		OutputStream out = res.getOutputStream();
		generateComplaintAck(out, comp);

	}

	public File generateComplaintAck() throws Exception {
		File pdf = new File("e:/comptest.pdf");
		OutputStream out = new FileOutputStream(pdf);
		generateComplaintAck(out, null);
		return pdf;
	}

	private void generateComplaintAck(OutputStream out, ComplaintModel comp) throws Exception {

		this.document = new Document();
		Rectangle rect = new Rectangle(0, 0, 900, 950);
		this.writer = PdfWriter.getInstance(this.document, out);
		this.document.setPageSize(rect);
		this.document.setMargins(40, 40, 40, 40);
		this.document.open();
		// Desert.jpeg
		ResourceBundle rb = ResourceBundle.getBundle("in.gov.rera.common.config.RERAProperties");
		String ackLoc = rb.getString("ACK_FOLDER_PATH");
		Image img = Image.getInstance(ackLoc + "COPNT_ACK.jpg");

		img.scaleAbsolute(rect);

		PdfContentByte canvas = writer.getDirectContentUnder();
		img.setAbsolutePosition(0, 0);
		canvas.addImage(img);

		// the direct content
		PdfContentByte cb = writer.getDirectContent();
		// the rectangle and the text we want to fit in the rectangle

		BaseFont bf = BaseFont.createFont();
		float fontSize = 12.0f;
		Phrase phrase = new Phrase(comp.getComplaintNo(), new Font(bf, fontSize));
		ColumnText.showTextAligned(cb, Element.ALIGN_LEFT, phrase, 490f, 653f, 0);

		phrase = new Phrase(DateUtil.getDateString(Calendar.getInstance()), new Font(bf, fontSize));
		ColumnText.showTextAligned(cb, Element.ALIGN_LEFT, phrase, 280f, 374f, 0);

		phrase = new Phrase("Rs. 1000.00 ", new Font(bf, fontSize));
		ColumnText.showTextAligned(cb, Element.ALIGN_LEFT, phrase, 145f, 493f, 0);

		phrase = new Phrase("Rs. 1000.00  ", new Font(bf, fontSize));
		ColumnText.showTextAligned(cb, Element.ALIGN_LEFT, phrase, 145f, 547f, 0);

		document.close();

	}

	public void generateAgentAck(HttpServletResponse res, AgentRegistrationModel agent) throws Exception {
		OutputStream out = res.getOutputStream();
		generateAgentAck(out, agent);
	}

	public File generateAgentAck() throws Exception {
		File pdf = new File("e:/agenttest.pdf");
		OutputStream out = new FileOutputStream(pdf);
		generateAgentAck(out, null);
		return pdf;
	}

	public void generateAgentAck(OutputStream out, AgentRegistrationModel agent) throws Exception {

		this.document = new Document();
		Rectangle rect = new Rectangle(0, 0, 900, 950);
		this.writer = PdfWriter.getInstance(this.document, out);
		this.document.setPageSize(rect);
		this.document.setMargins(40, 40, 40, 40);
		this.document.open();
		// Desert.jpeg
		ResourceBundle rb = ResourceBundle.getBundle("in.gov.rera.common.config.RERAProperties");
		String ackLoc = rb.getString("ACK_FOLDER_PATH");

		
		BarcodeQRCode qrcode = new BarcodeQRCode(
				"https://rera.karnataka.gov.in/certificate?CER_NO=" + agent.getAgentRegistrationNo(), 1, 1, null);
		
		// String str="Please scan the QR code for validate the authentication
		// of the certificate";
		Image qrcodeImage = qrcode.getImage();
		qrcodeImage.setAbsolutePosition(400, 50);
		qrcodeImage.scalePercent(200);
		this.document.add(qrcodeImage);

		// Paragraph pr = new Paragraph("");

		// pr.setAbsolutePosition(300,52);

		Date approvedDate=new Date();
		if(agent.getApprovedOn()!=null){
			approvedDate=agent.getApprovedOn().getTime();
		}
		
		if (agent.getRegistrationType().equals(ReraConstants.INDVISUAL_REG)) {
			Image img = Image.getInstance(ackLoc + "AGNT_ACK_INDVL.jpg");

			img.scaleAbsolute(rect);

			PdfContentByte canvas = writer.getDirectContentUnder();
			img.setAbsolutePosition(0, 0);
			canvas.addImage(img);

			float left = 100f;
			float botom = 100f;

			// the direct content
			PdfContentByte cb = writer.getDirectContent();
			// the rectangle and the text we want to fit in the rectangle

			BaseFont bf = BaseFont.createFont();
			float fontSize = 10.0f;

			StringBuffer str = new StringBuffer();

			// Agent Registration NO
			Phrase phrase = new Phrase(agent.getAgentRegistrationNo(), new Font(bf, fontSize));
			ColumnText.showTextAligned(cb, Element.ALIGN_LEFT, phrase, 235f, 722f, 0);

			// Agent Name

			phrase = new Phrase(agent.getAgentUser().getUserName().toUpperCase(), new Font(bf, fontSize));
			ColumnText.showTextAligned(cb, Element.ALIGN_LEFT, phrase, 535f, 723f, 0);

			// Agent Father's Name

			phrase = new Phrase(agent.getAgentDetailsModel().getAgentFatherName().toUpperCase(),
					new Font(bf, fontSize));
			ColumnText.showTextAligned(cb, Element.ALIGN_LEFT, phrase, 255f, 705f, 0);

			// Agent Taluk
			phrase = new Phrase(agent.getSubDistrictModel().getSubDistrictName().toUpperCase(), new Font(bf, fontSize));
			ColumnText.showTextAligned(cb, Element.ALIGN_LEFT, phrase, 140f, 686f, 0);

			// Agent District
			phrase = new Phrase(agent.getDistrictModel().getDistrictName().toUpperCase(), new Font(bf, fontSize));
			ColumnText.showTextAligned(cb, Element.ALIGN_LEFT, phrase, 512f, 686f, 0);

			// Agent State
			phrase = new Phrase(agent.getDistrictModel().getStateUtModel().getStateUtName().toUpperCase(),
					new Font(bf, fontSize));
			ColumnText.showTextAligned(cb, Element.ALIGN_LEFT, phrase, 140f, 668f, 0);

			// Agent Address

			str = new StringBuffer();

			str.append(agent.getAgentDetailsModel().getAgentIndividualBussAddress1()).append(" , ")
					.append(agent.getAgentDetailsModel().getAgentIndividualBussAddress2()).append(" , ")
					.append(agent.getAgentDetailsModel().getDistrictModel().getDistrictName()).append(" , ")
					.append(agent.getAgentDetailsModel().getDistrictModel().getStateUtModel().getStateUtName());
			str.append("-").append(agent.getAgentDetailsModel().getAgentIndividualPincode());
			phrase = new Phrase(str.toString().toUpperCase(), new Font(bf, fontSize));
			ColumnText.showTextAligned(cb, Element.ALIGN_LEFT, phrase, 95f, 650f, 0);

			// Agent State
			phrase = new Phrase(agent.getDistrictModel().getStateUtModel().getStateUtName().toUpperCase(),
					new Font(bf, fontSize));
			ColumnText.showTextAligned(cb, Element.ALIGN_LEFT, phrase, 290f, 614f, 0);

			// Agent From Date

			String apdate = DateUtil.getDateString(agent.getApprovedOn());
			SimpleDateFormat apdf1 = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat apdf2 = new SimpleDateFormat("dd-MM-yyyy");
			String approvedate = apdf2.format(apdf1.parse(apdate));

			phrase = new Phrase(approvedate, new Font(bf, fontSize));
			ColumnText.showTextAligned(cb, Element.ALIGN_LEFT, phrase, 530f, 272f, 0);

			// Agent End Date

			String expdate = DateUtil.getDateString(agent.getExpireDate());
			SimpleDateFormat expdf1 = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat expdf2 = new SimpleDateFormat("dd-MM-yyyy");
			String exdate = expdf2.format(expdf1.parse(expdate));

			phrase = new Phrase(exdate, new Font(bf, fontSize));
			ColumnText.showTextAligned(cb, Element.ALIGN_LEFT, phrase, 740f, 272, 0);

			// System Date

			

			// current place
			// phrase = new
			// Phrase(agent.getDistrictModel().getStateUtModel().getStateUtName().toUpperCase(),
			// new Font(bf, fontSize));
			

			phrase = new Phrase("*Please scan the QR code to validate", new Font(bf, 8.0f));
			ColumnText.showTextAligned(cb, Element.ALIGN_CENTER, phrase, 440f, 50f, 0);
			phrase = new Phrase(" the authenticity of the certificate.", new Font(bf, 8.0f));
			ColumnText.showTextAligned(cb, Element.ALIGN_CENTER, phrase, 440f, 42f, 0);
			
			
			phrase = new Phrase("Digitally Signed By", new Font(bf, fontSize));
			ColumnText.showTextAligned(cb, Element.ALIGN_RIGHT, phrase, 830f, 120f, 0);

			phrase = new Phrase(agent.getCertificateUser().getUserName(), new Font(bf, fontSize));
			ColumnText.showTextAligned(cb, Element.ALIGN_RIGHT, phrase, 830f, 105f, 0);

			phrase = new Phrase(agent.getCertificateUser().getDesignation(), new Font(bf, fontSize));
			ColumnText.showTextAligned(cb, Element.ALIGN_RIGHT, phrase, 830f, 90f, 0);

			phrase = new Phrase("Approved Date: " + new SimpleDateFormat("dd-MM-yyyy").format(approvedDate),
					new Font(bf, fontSize));
			ColumnText.showTextAligned(cb, Element.ALIGN_RIGHT, phrase, 830f, 60f, 0);
			
			

			document.close();

		}

		else {
			Image img = Image.getInstance(ackLoc + "AGNT_ACK_COMPANY.jpg");

			img.scaleAbsolute(rect);

			PdfContentByte canvas = writer.getDirectContentUnder();
			img.setAbsolutePosition(0, 0);
			canvas.addImage(img);

			float left = 100f;
			float botom = 100f;

			// the direct content
			PdfContentByte cb = writer.getDirectContent();
			// the rectangle and the text we want to fit in the rectangle

			BaseFont bf = BaseFont.createFont();
			float fontSize = 10.0f;

			StringBuffer str = new StringBuffer();

			// Agent Registration NO
			Phrase phrase = new Phrase(agent.getAgentRegistrationNo(), new Font(bf, fontSize));
			ColumnText.showTextAligned(cb, Element.ALIGN_LEFT, phrase, 240f, 714f, 0);

			// Agent Company/firm

			phrase = new Phrase(agent.getAgentDetailsModel().getFirmName().toUpperCase(), new Font(bf, fontSize));
			ColumnText.showTextAligned(cb, Element.ALIGN_LEFT, phrase, 95f, 678f, 0);

			// Agent Company/firm address

			phrase = new Phrase(agent.getAgentDetailsModel().getFirmAddressLine1().toUpperCase(),
					new Font(bf, fontSize));
			ColumnText.showTextAligned(cb, Element.ALIGN_LEFT, phrase, 200f, 661f, 0);

			str = new StringBuffer();

			str.append(agent.getAgentDetailsModel().getFirmAddressLine2()).append(" , ")
					.append(agent.getAgentDetailsModel().getDistrictModel().getDistrictName()).append(" , ")
					.append(agent.getAgentDetailsModel().getDistrictModel().getStateUtModel().getStateUtName());
			str.append(" - ").append(agent.getAgentDetailsModel().getFirmPincode());
			phrase = new Phrase(str.toString().toUpperCase(), new Font(bf, fontSize));
			ColumnText.showTextAligned(cb, Element.ALIGN_LEFT, phrase, 95f, 643f, 0);

			// Agent Address
			/*
			 * phrase = new Phrase(agent.getAgentDetailsModel().
			 * getAgentIndividualBussAddress1(), new Font(bf, fontSize));
			 * ColumnText.showTextAligned(cb, Element.ALIGN_LEFT, phrase,
			 * 457f,720f, 0);
			 * 
			 * phrase = new Phrase(agent.getAgentDetailsModel().
			 * getAgentIndividualBussAddress2(), new Font(bf, fontSize));
			 * ColumnText.showTextAligned(cb, Element.ALIGN_LEFT, phrase,
			 * 477f,720f, 0);
			 */

			// Agent State
			phrase = new Phrase(agent.getDistrictModel().getStateUtModel().getStateUtName().toUpperCase(),
					new Font(bf, fontSize));
			ColumnText.showTextAligned(cb, Element.ALIGN_LEFT, phrase, 330f, 606f, 0);

			// Agent From Date

			String apdate = DateUtil.getDateString(agent.getApprovedOn());
			SimpleDateFormat apdf1 = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat apdf2 = new SimpleDateFormat("dd-MM-yyyy");
			String approvedate = apdf2.format(apdf1.parse(apdate));

			phrase = new Phrase(approvedate, new Font(bf, fontSize));
			ColumnText.showTextAligned(cb, Element.ALIGN_LEFT, phrase, 533f, 241f, 0);

			// Agent End Date
			String expdate = DateUtil.getDateString(agent.getExpireDate());
			SimpleDateFormat expdf1 = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat expdf2 = new SimpleDateFormat("dd-MM-yyyy");
			String exdate = expdf2.format(expdf1.parse(expdate));

			phrase = new Phrase(exdate, new Font(bf, fontSize));
			ColumnText.showTextAligned(cb, Element.ALIGN_LEFT, phrase, 750f, 241f, 0);

			

			phrase = new Phrase("*Please scan the QR code to validate", new Font(bf, 8.0f));
			ColumnText.showTextAligned(cb, Element.ALIGN_CENTER, phrase, 440f, 50f, 0);
			phrase = new Phrase(" the authenticity of the certificate.", new Font(bf, 8.0f));
			ColumnText.showTextAligned(cb, Element.ALIGN_CENTER, phrase, 440f, 42f, 0);
			
			phrase = new Phrase("Digitally Signed By", new Font(bf, fontSize));
			ColumnText.showTextAligned(cb, Element.ALIGN_RIGHT, phrase, 830f, 115f, 0);

			phrase = new Phrase(agent.getCertificateUser().getUserName(), new Font(bf, fontSize));
			ColumnText.showTextAligned(cb, Element.ALIGN_RIGHT, phrase, 830f, 100f, 0);

			phrase = new Phrase(agent.getCertificateUser().getDesignation(), new Font(bf, fontSize));
			ColumnText.showTextAligned(cb, Element.ALIGN_RIGHT, phrase, 830f, 85f, 0);

			phrase = new Phrase("Approved Date: " + new SimpleDateFormat("dd-MM-yyyy").format(approvedDate),
					new Font(bf, fontSize));
			ColumnText.showTextAligned(cb, Element.ALIGN_RIGHT, phrase, 830f, 55f, 0);

			document.close();

		}

	}

	public void generateProjectCertificate(HttpServletResponse res, ProjectRegistrationModel project) throws Exception {
		OutputStream out = res.getOutputStream();
		generateProjectAck(out, project);
	}

	public File generateProjectCertificate() throws Exception {
		File pdf = new File("/Users/tejomaya/Desktop/test123.pdf");
		OutputStream out = new FileOutputStream(pdf);
		generateProjectAck(out, null);
		return pdf;
	}

	public void generateProjectAck(OutputStream out, ProjectRegistrationModel project) throws Exception {

		Date startDate = new Date();
		if (project.getCreatedOn().getTime().before(new SimpleDateFormat("dd-MM-yyyy").parse("01-04-2018"))) {
			startDate = project.getCreatedOn().getTime();
		} else {
			if (project.getApprovedOn() != null)
				startDate = project.getApprovedOn().getTime();
		}

		
		
		String projectRegNumber=project.getProjectRegistrationNo();
		
		Date approvedDate = new Date();
		if (project.getApprovedOn() != null) {
			approvedDate = project.getApprovedOn().getTime();
		}
		
		String expdate = DateUtil.getDateString(project.getProjectDetailsModel().getCompletionDate().getTime());
		SimpleDateFormat expdf1 = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat expdf2 = new SimpleDateFormat("dd-MM-yyyy");
		String exdate = expdf2.format(expdf1.parse(expdate));

		
		
		
		
		
		this.document = new Document();
		Rectangle rect = new Rectangle(0, 0, 900, 950);
		this.writer = PdfWriter.getInstance(this.document, out);
		this.document.setPageSize(rect);
		this.document.setMargins(40, 40, 40, 40);
		this.document.open();
		// Desert.jpeg
		ResourceBundle rb = ResourceBundle.getBundle("in.gov.rera.common.config.RERAProperties");
		String ackLoc = rb.getString("ACK_FOLDER_PATH");

		

		BarcodeQRCode qrcode = new BarcodeQRCode(
				"https://rera.karnataka.gov.in/certificate?CER_NO=" + project.getProjectRegistrationNo(), 1, 1, null);
		Image qrcodeImage = qrcode.getImage();
		qrcodeImage.setAbsolutePosition(420, 70);
		qrcodeImage.scalePercent(200);
		this.document.add(qrcodeImage);

		if (project.getRegistrationType().equals(ReraConstants.INDVISUAL_REG)) {

			Image img = Image.getInstance(ackLoc + "PROJ_ACK_INDVL.jpg");

			img.scaleAbsolute(rect);

			PdfContentByte canvas = writer.getDirectContentUnder();
			img.setAbsolutePosition(0, 0);
			canvas.addImage(img);

			// the direct content
			PdfContentByte cb = writer.getDirectContent();
			// the rectangle and the text we want to fit in the rectangle

			BaseFont bf = BaseFont.createFont();
			float fontSize = 10.0f;

			StringBuffer str = new StringBuffer();
			str = new StringBuffer();

			// Project Registration No
			Phrase phrase = new Phrase(projectRegNumber, new Font(bf, fontSize));
			ColumnText.showTextAligned(cb, Element.ALIGN_LEFT, phrase, 285f, 696f, 0);

			// Project Name
			str.append(project.getProjectDetailsModel().getProjectName()).append(",   ")
					.append(project.getProjectDetailsModel().getAddressLine1());

			phrase = new Phrase(str.toString().toUpperCase(), new Font(bf, fontSize));
			ColumnText.showTextAligned(cb, Element.ALIGN_LEFT, phrase, 177f, 679f, 0);

			// Promoter Address

			str = new StringBuffer();
			str.append(project.getProjectDetailsModel().getAddressLine2()).append(", ")
					.append(project.getProjectDetailsModel().getSubDistrictModel().getSubDistrictName());
			str.append(", ").append(project.getProjectDetailsModel().getDistrictModel().getDistrictName());

			phrase = new Phrase(str.toString().toUpperCase(), new Font(bf, fontSize));
			ColumnText.showTextAligned(cb, Element.ALIGN_LEFT, phrase, 85f, 660f, 0);

			// Promoter Name
			phrase = new Phrase(project.getPromoterDetailsModel().getPromoterName().toUpperCase(),
					new Font(bf, fontSize));
			ColumnText.showTextAligned(cb, Element.ALIGN_LEFT, phrase, 155f, 643f, 0);

			// Father's Name
			phrase = new Phrase(project.getPromoterDetailsModel().getPromoterIndividualFatherName().toUpperCase(),
					new Font(bf, fontSize));
			ColumnText.showTextAligned(cb, Element.ALIGN_LEFT, phrase, 267f, 624f, 0);
			// Taluka

			phrase = new Phrase(
					project.getProjectDetailsModel().getSubDistrictModel().getSubDistrictName().toUpperCase(),
					new Font(bf, fontSize));
			ColumnText.showTextAligned(cb, Element.ALIGN_LEFT, phrase, 155f, 607f, 0);

			// District
			phrase = new Phrase(project.getPromoterDetailsModel().getDistrictModel().getDistrictName().toUpperCase(),
					new Font(bf, fontSize));
			ColumnText.showTextAligned(cb, Element.ALIGN_LEFT, phrase, 510f, 607f, 0);
			// State
			phrase = new Phrase(project.getPromoterDetailsModel().getDistrictModel().getStateUtModel().getStateUtName()
					.toUpperCase(), new Font(bf, fontSize));
			ColumnText.showTextAligned(cb, Element.ALIGN_LEFT, phrase, 145f, 588f, 0);

			phrase = new Phrase(project.getPromoterDetailsModel().getAddressLine1().toUpperCase(),
					new Font(bf, fontSize));
			ColumnText.showTextAligned(cb, Element.ALIGN_LEFT, phrase, 87f, 552f, 0);
			// Business Address
			// str = new StringBuffer();
			str = new StringBuffer();
			str.append(project.getPromoterDetailsModel().getAddressLine2()).append(",  ")
					.append(project.getPromoterDetailsModel().getDistrictModel().getDistrictName());
			str.append(",  ")
					.append(project.getPromoterDetailsModel().getDistrictModel().getStateUtModel().getStateUtName());
			str.append(" - ");
			str.append(project.getPromoterDetailsModel().getPinCode());

			phrase = new Phrase(str.toString().toUpperCase(), new Font(bf, fontSize));
			ColumnText.showTextAligned(cb, Element.ALIGN_LEFT, phrase, 87f, 534f, 0);

			/*DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

			LocalDate fDate = LocalDate.parse(new SimpleDateFormat("yyyy-MM-dd").format(startDate), formatter);
			LocalDate eDate = LocalDate.parse(new SimpleDateFormat("yyyy-MM-dd")
					.format(project.getProjectDetailsModel().getCompletionDate().getTime()));
			Period period = Period.between(fDate, eDate);
			log.info("Years " + period.getYears()); // Years
			log.info("Months " + period.getMonths()); // Months
			log.info("Days " + period.getDays()); // Days

			str = new StringBuffer();

			str.append(String.valueOf(period.getYears())).append(".").append(String.valueOf(period.getMonths()));

			// Period of days (Approved date - expired date
			// Duration of Project validity
			//phrase = new Phrase(str.toString(), new Font(bf, fontSize));
			// phrase = new Phrase("5 years", new Font(bf, fontSize));
			// ColumnText.showTextAligned(cb, Element.ALIGN_LEFT, phrase,
			// 450f,352f, 0);

			// Approved Date
			String apdate = DateUtil.getDateString(startDate);
			SimpleDateFormat apdf1 = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat apdf2 = new SimpleDateFormat("dd-MM-yyyy");
			String approvedate = apdf2.format(apdf1.parse(apdate));
*/
			phrase = new Phrase(new SimpleDateFormat("dd-MM-yyyy").format(startDate), new Font(bf, fontSize));
			ColumnText.showTextAligned(cb, Element.ALIGN_LEFT, phrase, 365f, 355f, 0);

			// Expire Date

			

			phrase = new Phrase(exdate, new Font(bf, fontSize));
			ColumnText.showTextAligned(cb, Element.ALIGN_LEFT, phrase, 565f, 355f, 0);

			// phrase = new Phrase("Dated: "+approvedate, new Font(bf,
			// fontSize));
			// ColumnText.showTextAligned(cb, Element.ALIGN_LEFT, phrase,
			// 105f,105f, 0);

			// phrase = new
			// Phrase(project.getProjectDetailsModel().getDistrictModel().getStateUtModel().getStateUtName().toUpperCase(),
			// new Font(bf, fontSize));
			// phrase = new Phrase("Place: "+"BENGALURU".toUpperCase(), new
			// Font(bf, fontSize));
			// ColumnText.showTextAligned(cb, Element.ALIGN_LEFT, phrase,
			// 105f,85f, 0);

			phrase = new Phrase("*Please scan the QR code to validate", new Font(bf, 8.0f));
			ColumnText.showTextAligned(cb, Element.ALIGN_CENTER, phrase, 460f, 60f, 0);
			phrase = new Phrase(" the authenticity of the certificate.", new Font(bf, 8.0f));
			ColumnText.showTextAligned(cb, Element.ALIGN_CENTER, phrase, 460f, 52f, 0);

			phrase = new Phrase("Digitally Signed By", new Font(bf, fontSize));
			ColumnText.showTextAligned(cb, Element.ALIGN_RIGHT, phrase, 830f, 125f, 0);

			phrase = new Phrase(project.getCertificateUser().getUserName(), new Font(bf, fontSize));
			ColumnText.showTextAligned(cb, Element.ALIGN_RIGHT, phrase, 830f, 110f, 0);

			phrase = new Phrase(project.getCertificateUser().getDesignation(), new Font(bf, fontSize));
			ColumnText.showTextAligned(cb, Element.ALIGN_RIGHT, phrase, 830f, 95f, 0);

			phrase = new Phrase("Approved Date: " + new SimpleDateFormat("dd-MM-yyyy").format(approvedDate),
					new Font(bf, fontSize));
			ColumnText.showTextAligned(cb, Element.ALIGN_RIGHT, phrase, 830f, 65f, 0);

			document.close();

		}

		else {

			Image img = Image.getInstance(ackLoc + "PROJ_ACK_COMPANY.jpg");

			img.scaleAbsolute(rect);

			PdfContentByte canvas = writer.getDirectContentUnder();
			img.setAbsolutePosition(0, 0);
			canvas.addImage(img);

			// the direct content
			PdfContentByte cb = writer.getDirectContent();
			// the rectangle and the text we want to fit in the rectangle

			BaseFont bf = BaseFont.createFont();
			float fontSize = 10.0f;

			String strval = null;

			StringBuffer str = new StringBuffer();

			// Project Registration No
			Phrase phrase = new Phrase(projectRegNumber, new Font(bf, fontSize));
			ColumnText.showTextAligned(cb, Element.ALIGN_LEFT, phrase, 290f, 690f, 0);

			// Project Name
			str.append(project.getProjectDetailsModel().getProjectName()).append(",   ")
					.append(project.getProjectDetailsModel().getAddressLine1());

			// str.append(" - ").append(project.getProjectDetailsModel())
			phrase = new Phrase(str.toString().toUpperCase(), new Font(bf, fontSize));
			ColumnText.showTextAligned(cb, Element.ALIGN_LEFT, phrase, 183f, 669f, 0);

			str = new StringBuffer();
			str.append(project.getProjectDetailsModel().getAddressLine2()).append(", ")
					.append(project.getProjectDetailsModel().getSubDistrictModel().getSubDistrictName());
			str.append(", ").append(project.getProjectDetailsModel().getDistrictModel().getDistrictName());

			phrase = new Phrase(str.toString().toUpperCase(), new Font(bf, fontSize));
			ColumnText.showTextAligned(cb, Element.ALIGN_LEFT, phrase, 95f, 652f, 0);

			phrase = new Phrase(project.getPromoterDetailsModel().getPromoterName().toUpperCase(),
					new Font(bf, fontSize));
			ColumnText.showTextAligned(cb, Element.ALIGN_LEFT, phrase, 95f, 616f, 0);

			str = new StringBuffer();
			str.append(project.getPromoterDetailsModel().getAddressLine1());

			phrase = new Phrase(str.toString().toUpperCase(), new Font(bf, fontSize));
			ColumnText.showTextAligned(cb, Element.ALIGN_LEFT, phrase, 95f, 597f, 0);

			str = new StringBuffer();
			str.append(project.getPromoterDetailsModel().getAddressLine2()).append(", ")
					.append(project.getPromoterDetailsModel().getDistrictModel().getDistrictName());
			str.append(", ")
					.append(project.getPromoterDetailsModel().getDistrictModel().getStateUtModel().getStateUtName());
			str.append(" - ");
			str.append(project.getPromoterDetailsModel().getPinCode());
			phrase = new Phrase(str.toString().toUpperCase(), new Font(bf, fontSize));
			ColumnText.showTextAligned(cb, Element.ALIGN_LEFT, phrase, 95f, 579f, 0);

			/*DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

			LocalDate fDate = LocalDate.parse(new SimpleDateFormat("yyyy-MM-dd").format(startDate), formatter);
			LocalDate eDate = LocalDate.parse(new SimpleDateFormat("yyyy-MM-dd")
					.format(project.getProjectDetailsModel().getCompletionDate().getTime()), formatter);
			Period period = Period.between(fDate, eDate);
			log.info("Years " + period.getYears()); // Years
			log.info("Months " + period.getMonths()); // Months
			log.info("Days " + period.getDays()); // Days

			str = new StringBuffer();

			str.append(String.valueOf(period.getYears())).append(".").append(String.valueOf(period.getMonths()));

			// Period of days (Approved date - expired date
			// Project validaity
			//phrase = new Phrase(str.toString(), new Font(bf, fontSize));
			// phrase = new Phrase("5 Years", new Font(bf, fontSize));
			// ColumnText.showTextAligned(cb, Element.ALIGN_LEFT, phrase,
			// 450f,381f, 0);

			// Approved Date

			String apdate = DateUtil.getDateString(startDate);
			SimpleDateFormat apdf1 = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat apdf2 = new SimpleDateFormat("dd-MM-yyyy");
			String approvedate = apdf2.format(apdf1.parse(apdate));*/

			phrase = new Phrase(new SimpleDateFormat("dd-MM-yyyy").format(startDate), new Font(bf, fontSize));
			ColumnText.showTextAligned(cb, Element.ALIGN_LEFT, phrase, 350f, 381f, 0);

			

			phrase = new Phrase(exdate, new Font(bf, fontSize));
			ColumnText.showTextAligned(cb, Element.ALIGN_LEFT, phrase, 560f, 381f, 0);

			// phrase = new Phrase("Dated: "+approvedate, new Font(bf,
			// fontSize));
			// ColumnText.showTextAligned(cb, Element.ALIGN_LEFT, phrase,
			// 105f,130f, 0);

			// phrase = new
			// Phrase(project.getProjectDetailsModel().getDistrictModel().getStateUtModel().getStateUtName().toUpperCase(),
			// new Font(bf, fontSize));
			// phrase = new Phrase("Place: "+"BENGALURU".toUpperCase(), new
			// Font(bf, fontSize));
			// ColumnText.showTextAligned(cb, Element.ALIGN_LEFT, phrase,
			// 105f,112f, 0);

			phrase = new Phrase("*Please scan the QR code to validate", new Font(bf, 8.0f));
			ColumnText.showTextAligned(cb, Element.ALIGN_CENTER, phrase, 460f, 60f, 0);
			phrase = new Phrase(" the authenticity of the certificate.", new Font(bf, 8.0f));
			ColumnText.showTextAligned(cb, Element.ALIGN_CENTER, phrase, 460f, 52f, 0);

			phrase = new Phrase("Digitally Signed By", new Font(bf, fontSize));
			ColumnText.showTextAligned(cb, Element.ALIGN_RIGHT, phrase, 830f, 125f, 0);

			phrase = new Phrase(project.getCertificateUser().getUserName(), new Font(bf, fontSize));
			ColumnText.showTextAligned(cb, Element.ALIGN_RIGHT, phrase, 830f, 110f, 0);

			phrase = new Phrase(project.getCertificateUser().getDesignation(), new Font(bf, fontSize));
			ColumnText.showTextAligned(cb, Element.ALIGN_RIGHT, phrase, 830f, 95f, 0);

			phrase = new Phrase("Project Approval Date: " + new SimpleDateFormat("dd-MM-yyyy").format(approvedDate),
					new Font(bf, fontSize));
			ColumnText.showTextAligned(cb, Element.ALIGN_RIGHT, phrase, 830f, 65f, 0);

			document.close();

		}
		
		

	}

	public static void main22(String[] args) {
		float days = 6997;
		float year = (float) (days / 365);
		String yrs = year + "";
		if (yrs.contains(".")) {
			if (yrs.length() > (yrs.indexOf('.') + 2)) {
				yrs = yrs.substring(0, (yrs.indexOf('.') + 3));
			}
		}
		log.info(yrs);
	}
}
