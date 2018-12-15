package in.gov.rera.publicdomain.controller;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.util.HtmlUtils;

import in.gov.rera.admin.service.AdminService;
import in.gov.rera.admin.service.ApplicationHistoryService;
import in.gov.rera.admin.service.TemplateService;
import in.gov.rera.common.dao.impl.CommonDao;
import in.gov.rera.common.model.UserModel;
import in.gov.rera.common.util.DocumentEncryptor;
import in.gov.rera.common.util.ReraConstants;
import in.gov.rera.dms.beans.Document;
import in.gov.rera.dms.service.DocumentService;
import in.gov.rera.dms.util.ContentUtil;
import in.gov.rera.dms.util.DownloadUtil;
import in.gov.rera.helpdesk.dao.HelpDeskHistoryDao;
import in.gov.rera.helpdesk.service.HelpDeskEnquiryService;
import in.gov.rera.helpdesk.service.HelpDeskHistoryService;
import in.gov.rera.notification.service.MailService;
import in.gov.rera.notification.service.SmsService;
import in.gov.rera.transaction.agentregistration.service.IAgentUserService;
import in.gov.rera.transaction.complaint.model.ComplaintModel;
import in.gov.rera.transaction.complaint.service.IComplaintService;
import in.gov.rera.transaction.home.service.LoginService;
import in.gov.rera.transaction.projectregistration.model.ProjectRegistrationModel;
import in.gov.rera.transaction.projectregistration.service.IProjectRegistrationService;
import in.gov.rera.transaction.projectregistration.service.IProjectUserService;

@Controller(value = "PublicDomainDocumentController")
@Scope("request")
public class PublicDomainDocumentController {

	static Logger log = Logger.getLogger(PublicDomainDocumentController.class);
	@Autowired
	HttpSession httpSession;

	@Autowired
	IProjectRegistrationService projectRegistrationService;

	@Autowired
	HelpDeskEnquiryService helpDeskEnquiryService;

	@Autowired
	HelpDeskHistoryService helpDeskHistoryService;

	@Autowired
	IProjectUserService projectUserService;

	@Autowired
	IAgentUserService agentRegistrationService;

	@Autowired
	TemplateService templateService;

	@Autowired
	CommonDao<Object, Long> commonDao;

	@Autowired
	ApplicationHistoryService applicationHistoryService;

	@Autowired
	MailService mailService;

	@Autowired
	LoginService loginService;

	@Autowired
	ContentUtil contentUtil;

	@Autowired
	DocumentService documentService;

	@Autowired
	AdminService adminService;

	@Autowired
	IComplaintService<ComplaintModel, Long> complaintService;

	@Autowired
	SmsService smsService;

	@Autowired
	HelpDeskHistoryDao helpDeskHistoryDao;

	@RequestMapping(value = "publicDomain/getFiles", method = RequestMethod.POST)
	public ModelAndView download(HttpServletRequest request,
			@RequestParam(value = "docIds", required = true) String docIds, HttpServletResponse response) {

		String[] documents = docIds.split(",");

		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		ZipOutputStream zos = new ZipOutputStream(baos);
		byte bytes[] = new byte[2048];
		String zipFileName=null;
		DocumentEncryptor be=new DocumentEncryptor();

		try {

			for (String fileName : documents) {
				
				if(fileName==null || fileName.trim().length()==0)
					continue;

				
				Document document = documentService.getDoc(Integer.parseInt(DocumentEncryptor.decrypt(URLDecoder.decode(fileName,java.nio.charset.StandardCharsets.UTF_8.toString()))));
				
				
				if(zipFileName==null){
					ProjectRegistrationModel project=projectRegistrationService.getProjectRegByPk(Long.parseLong(document.getFolderId()));
					zipFileName=project.getApplicationNo()+".zip";
				}
				
				FileInputStream fis = new FileInputStream(ContentUtil.REPOSITORY_PATH + document.getDocumentType() + "/"
						+ document.getFolderId() + "/" + document.getDocumentName());
				BufferedInputStream bis = new BufferedInputStream(fis);

				zos.putNextEntry(new ZipEntry(document.getDocumentName()));

				int bytesRead;
				while ((bytesRead = bis.read(bytes)) != -1) {
					zos.write(bytes, 0, bytesRead);
				}
				zos.closeEntry();
				bis.close();
				fis.close();
			}
			zos.flush();
			baos.flush();
			zos.close();
			baos.close();

		} catch (Exception e) {
			// TODO: handle exception
		}

		try {
			response.setContentType("application/zip");
			response.setHeader("Content-Disposition", "attachment;filename=" + zipFileName);
			response.getOutputStream().write(baos.toByteArray());
			response.getOutputStream().close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;

	}
	
	
	@RequestMapping(value = "publicDomain/getFile", method = RequestMethod.GET)
	public ModelAndView getDocument(@RequestParam(value = "docId") String docId, HttpServletResponse response) {

		UserModel user = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);

		try {
			Document document = documentService.getDoc(Integer.parseInt(DocumentEncryptor.decrypt(docId)));
			
			
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

	private static String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";

	
}
