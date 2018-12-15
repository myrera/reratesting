package in.gov.rera.dms.controller;

import java.io.File;
import java.io.FileInputStream;
import java.util.ResourceBundle;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import in.gov.rera.common.model.UserModel;
import in.gov.rera.common.util.ReraConstants;
import in.gov.rera.dms.beans.Document;
import in.gov.rera.dms.service.DocumentService;
import in.gov.rera.dms.util.ContentUtil;
import in.gov.rera.dms.util.DownloadUtil;

@Controller(value = "DocumentController")
@Scope("request")
public class DocumentController {
	static Logger log = Logger.getLogger(DocumentController.class);

	@Autowired
	DocumentService documentService;

	@Autowired
	HttpSession httpSession;

	@RequestMapping(value = "reraimage", method = RequestMethod.GET)
	public ModelAndView getImage(@RequestParam(value = "IMG_ID") int docId, HttpServletResponse response) {

		UserModel user = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);

		if (user == null)
			return null;

		try {
			Document document = documentService.getDoc(docId);
			DownloadUtil util = new DownloadUtil();
			util.getImage(response, document);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return null;
	}

	@RequestMapping(value = "download", method = RequestMethod.GET)
	public ModelAndView getDocument(@RequestParam(value = "DOC_ID") int docId, HttpServletResponse response) {

		UserModel user = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);

		try {
			Document document = documentService.getDoc(docId);
			
			
			if(document==null) return null;
			
			if(user==null){
				if( !"COMPLAINT_REG".equals(document.getDocumentType())){
					return null;
				}	
				
			}
			
			DownloadUtil util = new DownloadUtil();
			util.download(response, document);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}

		return null;
	}
	
	
	@RequestMapping(value = "certificate", method = RequestMethod.GET)
	public ModelAndView getDocument(@RequestParam(value = "CER_NO") String cerNo, HttpServletResponse response) {

		

		try {
			ResourceBundle rb = ResourceBundle.getBundle("in.gov.rera.common.config.RERAProperties");
			String ackLoc = rb.getString("ACK_FOLDER_PATH");
			
			File file =new File(ackLoc+"certificates/"+cerNo.replaceAll("/", "")+".pdf");
			 FileInputStream in=new FileInputStream(file);
			 byte[] bt=new byte[in.available()];
			 in.read(bt);
			 in.close();
			
			
			response.setContentType("application/pdf");
			 response.setHeader( "Content-Disposition", "attachment;filename="
				      + file.getName() );
			response.getOutputStream().write(bt);
			response.getOutputStream().close();
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}

		return null;
	}
}
