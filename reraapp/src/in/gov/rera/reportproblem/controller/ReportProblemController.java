package in.gov.rera.reportproblem.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.jdbc.support.nativejdbc.CommonsDbcpNativeJdbcExtractor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import in.gov.rera.common.dao.impl.CommonDao;
import in.gov.rera.common.model.EnquiryModel;
import in.gov.rera.common.model.UserModel;
import in.gov.rera.common.util.ReraConstants;
import in.gov.rera.dms.beans.Document;
import in.gov.rera.dms.service.IDocumentService;
import in.gov.rera.dms.util.ContentUtil;
import in.gov.rera.master.district.dao.IDistrictDAO;
import in.gov.rera.master.district.model.DistrictModel;
import in.gov.rera.notification.service.MailService;
import in.gov.rera.notification.service.SmsService;
import in.gov.rera.reportproblem.dao.IComplaintReportDAO;
import in.gov.rera.reportproblem.dao.IReportProblemDAO;
import in.gov.rera.reportproblem.model.ComplaintModelReport;
import in.gov.rera.reportproblem.model.ReportProblemModel;
import in.gov.rera.transaction.complaint.model.ComplaintModel;
import in.gov.rera.transaction.projectregistration.model.ProjectRegistrationModel;
import in.gov.rera.transaction.projectregistration.model.ProjectRemarks;
import in.gov.rera.transaction.projectregistration.model.UserRemarks;

@Controller(value = "ReportProblemController")
@Scope("request")
public class ReportProblemController {

	static Logger log = Logger.getLogger(ReportProblemController.class);

	@Autowired
	HttpSession httpSession;

	@Autowired
	ContentUtil contentUtil;

	@Autowired(required = true)
	IDocumentService<Document, Integer> documentService;

	@Autowired
	IDistrictDAO<DistrictModel, Long> districtDAO;

	@Autowired
	IReportProblemDAO<ReportProblemModel, Long> iReportProblemDAO;

	@Autowired
	MailService mailService;

	@Autowired
	SmsService smsService;

	@Autowired
	CommonDao<Object, Long> commonDao;
	
	@Autowired
	IComplaintReportDAO<ComplaintModelReport, Long> iComplaintReportDAO;

	

	@RequestMapping(value = "reportRegForm")
	public ModelAndView reportRegForm() {

		ModelAndView mv = new ModelAndView("reportRegForm");
		List<Object> distList = iReportProblemDAO.getDistrictList(117L);

		DetachedCriteria dt = DetachedCriteria.forClass(ProjectRegistrationModel.class, "pr");
		dt.createAlias("pr.projectDetailsModel", "projectDetailsModel");
		dt.createAlias("pr.promoterDetailsModel", "promoterDetailsModel");
		dt.add(Restrictions.ne("pr.status", "SAVE_AS_DRAFT"));
		dt.add(Restrictions.ne("pr.status", "REVOKED"));
		List<Object> allApplicantsList = commonDao.getList(dt);

		mv.addObject("allApplicantsList", allApplicantsList);
		// mv.addObject("stateUtList", stateUtService.getStateUtList());
		// mv.addObject("paymentTokenNo",PaymentTokenNumber.generateToken());
		// mv.addObject("bankList", bankService.getBankList());

		mv.addObject("distList", distList);
		return mv;

	}

	@RequestMapping(value = "projectUnregLogin")
	public ModelAndView projectUnregLogin() {

		// List<Object> distList = iReportProblemDAO.getDistrictList(117L);

		ModelAndView mv = new ModelAndView("projectUnregLogin");
		// mv.addObject("distList", distList);
		return mv;

	}

	@RequestMapping(value = "saveReportProblemDetails", method = RequestMethod.POST)
	public ModelAndView saveReportProblemDetails(HttpServletRequest request,
			@RequestParam("projectName") String projectName, @RequestParam("promoterName") String promoterName,
			@RequestParam("mobileNo") String mobileNo,@RequestParam("reportId") Long reportId,
			@RequestParam("website") String website,
			@RequestParam("otherDetails") String otherDetails,
			@RequestParam("distName") String distName, @RequestParam("address") String address,
			@RequestParam("pincode") String pinCode, @RequestParam("promoterEmail") String promoterEmail,
			@RequestParam(value = "reportDocOne", required = false) MultipartFile reportDocOne,
			@RequestParam(value = "reportDocTwo", required = false) MultipartFile reportDocTwo,
			@RequestParam(value = "reportDocThree", required = false) MultipartFile reportDocThree) {
		ModelAndView mv = null;
		try {
			ReportProblemModel reportProblemModel = new ReportProblemModel();
			//ReportProblemModel reportProblemModel = (ReportProblemModel)commonDao.getObject(ReportProblemModel.class, reportId);

			reportProblemModel.setProjectName(projectName);
			reportProblemModel.setPromoterName(promoterName);
			reportProblemModel.setPromoterMobileNo(mobileNo);
			reportProblemModel.setWebsite(website);
			//reportProblemModel.setUnRegProjects(unRegProjects);
			reportProblemModel.setOtherDetails(otherDetails);
			reportProblemModel.setDistName(distName);
			reportProblemModel.setAddress(address);
			reportProblemModel.setPincode(pinCode);
			reportProblemModel.setPromoterEmailAddress(promoterEmail);

			reportProblemModel.setCreatedOn(Calendar.getInstance());

			// iReportProblemDAO.SaveReportProblemModel(reportProblemModel);

			if (reportDocOne != null && !reportDocOne.isEmpty()) {

				Document document = new Document();
				document.setFileName(reportDocOne.getOriginalFilename());
				document.setMimeType(reportDocOne.getContentType());
				document.setInputStream(reportDocOne.getInputStream());
				document.setDocumentType("REPORT_REG");
				document.setFolderId(String.valueOf(reportProblemModel.getReportId()));
				contentUtil.saveDocument(document);
				documentService.saveDoc(document);
				reportProblemModel.setReportDocOne(document);
			}

			if (reportDocTwo != null && !reportDocTwo.isEmpty()) {

				Document document = new Document();
				document.setFileName(reportDocTwo.getOriginalFilename());
				document.setMimeType(reportDocTwo.getContentType());
				document.setInputStream(reportDocTwo.getInputStream());
				document.setDocumentType("REPORT_REG");
				document.setFolderId(String.valueOf(reportProblemModel.getReportId()));
				contentUtil.saveDocument(document);
				documentService.saveDoc(document);
				reportProblemModel.setReportDocTwo(document);
			}

			if (reportDocThree != null && !reportDocThree.isEmpty()) {

				Document document = new Document();
				document.setFileName(reportDocThree.getOriginalFilename());
				document.setMimeType(reportDocThree.getContentType());
				document.setInputStream(reportDocThree.getInputStream());
				document.setDocumentType("REPORT_REG");
				document.setFolderId(String.valueOf(reportProblemModel.getReportId()));
				contentUtil.saveDocument(document);
				documentService.saveDoc(document);
				reportProblemModel.setReportDocThree(document);
			}

			reportProblemModel.setStatus(ReraConstants.OPEN);
			iReportProblemDAO.SaveReportProblemModel(reportProblemModel);

			mv = new ModelAndView("home");
		} catch (Exception ex) {
			log.error(ex.getMessage(), ex);
		}
		return mv;
	}

	@RequestMapping(value = "authority/reportproblemList")
	public ModelAndView reportproblemList(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("reportproblemList");
		UserModel user = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
		List<Object> list = iReportProblemDAO.getReportProblemList();

		mv.addObject("reportList", list);
		mv.addObject("noOfPendingRequest", list.size());
		return mv;

	}

	@RequestMapping(value = "authority/unregisteredProjectDetails")
	public ModelAndView unregisteredProjectDetails(HttpServletRequest request,
			@RequestParam("reportId") Long reportId) {
		ModelAndView mv = new ModelAndView("authority.unregisteredProjectDetails");
		
		ReportProblemModel project = (ReportProblemModel)commonDao.getObject(ReportProblemModel.class,reportId);

		mv.addObject("project", project);
		
		return mv;

	}
	
	
	
	@RequestMapping(value = "authority/sendEnquiry", method = RequestMethod.POST)
	public ModelAndView sendEnquiry(@RequestParam(value = "projectId") Long reportId,
			@RequestParam(value = "subject") String subject, 
			@RequestParam(value = "summary") String summary
			) {
		ModelAndView mv = new ModelAndView("authority.unregisteredProjectDetails");
		try {
			
			ReportProblemModel project = (ReportProblemModel)commonDao.getObject(ReportProblemModel.class,reportId);
			EnquiryModel enq = new EnquiryModel();
			enq.setSubject(subject);
			enq.setCreatedOn(Calendar.getInstance());
			enq.setEnquiryText(summary);
			UserModel user = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
			UserModel us = (UserModel) commonDao.getObject(UserModel.class, user.getUserId());
			enq.setRaisedBy(us);

			enq.setEmailId(project.getPromoterEmailAddress());
			
			project.setStatus(ReraConstants.ENQUIRY);
			iReportProblemDAO.SaveReportProblemModel(project);

			mailService.sendMail(enq);

			mv.addObject("project", project);

		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return mv;

	}

	@RequestMapping(value = "sendOTPToEmailId")
	public ModelAndView sendOTPToEmailId(@RequestParam("emailId") String emailId,
			@RequestParam("mobileNo") String mobileNo,@RequestParam("name") String name, HttpServletRequest request) {
		// Object reg=null;
		ModelAndView mv = null;
		HttpSession ses = request.getSession(true);
		ReportProblemModel reportProblem=new ReportProblemModel();
		reportProblem.setEmail(emailId);
		reportProblem.setMobileNo(mobileNo);
		reportProblem.setReporterName(name);
		iReportProblemDAO.SaveReportProblemModel(reportProblem);

		if (mobileNo != null) {
			if (emailId != null) {
				// log.error("mobileNo::"+mobileNo);

				mv = new ModelAndView("reportusotpPage");
				mv.addObject("emailId", emailId);
				String key = generateCode(10);
				String pass = generateCode(6);
				mv.addObject("otpKey", key);
				mv.addObject("otppass", pass);
				ses.setAttribute(key, pass);
				EnquiryModel enq = new EnquiryModel();

				enq.setEmailId(emailId);
				enq.setSubject("RERA One Time Password");
				enq.setEnquiryText("Dear User, \n Please use " + pass + " as otp for login. ");
				mailService.sendMail(enq);
				if (mobileNo != null) {
					smsService.sendSMS(mobileNo, "Your One Time Password for rera temp login is :" + pass);
				}
				log.error("OTP is :::  " + pass);
			} else {
				ses.setAttribute("ERROR_MSG", "Please enter correct otp");
				mv = new ModelAndView("redirect:reportRegForm");
			}

		}

		else {
			log.error("mobileNo:: is Null");
		}

		ses.setAttribute("project", reportProblem);
		return mv;
	}

	// verifyOTP
	@RequestMapping(value = "reportusverifyOTP")
	public ModelAndView verifyOTP(@RequestParam("emailId") String emailId, @RequestParam("mobileNo") String mobileNo,
			@RequestParam("oneTimePass") String otp, @RequestParam("otpKey") String otpKey,
			HttpServletRequest request) {
		ModelAndView mv = null;
		HttpSession ses = request.getSession(true);
		String sesOTP = (String) ses.getAttribute(otpKey);
		System.out.println("sesOTP  " + sesOTP);
		System.out.println("otpKey  " + otpKey);
		System.out.println("otp  " + otp);
		if (sesOTP != null && sesOTP.equals(otp)) {
			// ses.setAttribute("USER_EMAIL_ID", emailId);
			/*
			 * if (userType.equals("Agent")) { ses.setAttribute("USER_TYPE",
			 * "AGENT"); mv = new ModelAndView("redirect:viewAgentAppList"); }
			 * else if (userType.equals("Promoter")) {
			 * ses.setAttribute("USER_TYPE", "PROMOTER"); mv = new
			 * ModelAndView("redirect:viewProjectAppList"); }
			 */

			mv = new ModelAndView("redirect:reportRegForm");

		} else {
			ses.setAttribute("ERROR_MSG", " Please enter correct One time password.");
			mv = new ModelAndView("helpdeskotpPage");
			mv.addObject("emailId", emailId);
			mv.addObject("mobileNo", mobileNo);

			mv.addObject("otpKey", otpKey);
		}
		return mv;
	}

	@RequestMapping(value = "checkRegisteredProjects")
	public ModelAndView viewAllProject(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("checkRegisteredProjects");
		try {
			DetachedCriteria dt = DetachedCriteria.forClass(ProjectRegistrationModel.class, "pr");
			dt.add(Restrictions.ne("pr.status", ReraConstants.REVOKED));
			dt.add(Restrictions.ne("pr.status", ReraConstants.SAVE_AS_DRAFT));
			List<Object> list = commonDao.getList(dt);
			mv.addObject("projectList", list);
			mv.addObject("noOfPendingRequest", list.size());
		} catch (Exception ex) {
			log.error(ex.getMessage(), ex);
		}
		return mv;

	}


	private static String generateCode(int lngth) {
		int digit = 0;
		Random rn = new Random();
		StringBuffer sb = new StringBuffer();
		while (digit < lngth) {
			sb.append(chars.charAt(rn.nextInt(36)));
			digit++;
		}
		return sb.toString();
	}

	private static String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
	
	
	@RequestMapping(value = "super/complaintRegForm")
	public ModelAndView complaintRegForm() {

		ModelAndView mv = new ModelAndView("complaintRegForm");
		List<Object> distList = iReportProblemDAO.getDistrictList(117L);
		DetachedCriteria dtc= DetachedCriteria.forClass(ComplaintModel.class,"cm");
		List<Object> complaintmodelList = commonDao.getList(dtc);
		mv.addObject("complaintmodelList",complaintmodelList);
		
	/*	DetachedCriteria dt = DetachedCriteria.forClass(ProjectRegistrationModel.class, "pr");
		dt.createAlias("pr.projectDetailsModel", "projectDetailsModel");
		dt.createAlias("pr.promoterDetailsModel", "promoterDetailsModel");
		dt.add(Restrictions.ne("pr.status", "SAVE_AS_DRAFT"));
		dt.add(Restrictions.ne("pr.status", "REVOKED"));
		List<Object> allApplicantsList = commonDao.getList(dt);
		mv.addObject("allApplicantsList", allApplicantsList);*/
		// mv.addObject("stateUtList", stateUtService.getStateUtList());
		mv.addObject("distList", distList);
		return mv;

	}
	
	
	@RequestMapping(value = "super/saveComplaintDetails", method = RequestMethod.POST)
	public ModelAndView saveReportProblemDetails(HttpServletRequest request,
			@RequestParam("complaintNo") String complaintNo, @RequestParam("petitioner") String petitioner,
			@RequestParam("respondentName") String respondentName,
			@RequestParam("distName") String distName,
			@RequestParam(value = "orderCopy", required = false) MultipartFile orderCopy) {
		ModelAndView mv = null;
		try {
			//ReportProblemModel reportProblemModel = (ReportProblemModel)commonDao.getObject(ReportProblemModel.class, reportId);
			ComplaintModelReport model =new ComplaintModelReport();
			model.setComplaintNo(complaintNo);
			model.setPetitioner(petitioner);
			model.setRespondentName(respondentName);
			SimpleDateFormat sf = new SimpleDateFormat("dd/MM/yyyy");
			Date dt = sf.parse(request.getParameter("orderDate"));
			Calendar c = Calendar.getInstance();
			c.setTime(dt);
			model.setOrderDate(c);
			model.setDistName(distName);
			if (orderCopy != null && !orderCopy.isEmpty()) {
				Document document = new Document();
				document.setFileName(orderCopy.getOriginalFilename());
				document.setMimeType(orderCopy.getContentType());
				document.setInputStream(orderCopy.getInputStream());
				document.setDocumentType("COMPLAINT_REG");
				contentUtil.saveDocument(document);
				documentService.saveDoc(document);
				model.setOrderCopy(document);
			}
			iComplaintReportDAO.SaveComplaintReportModel(model);
			mv = new ModelAndView("redirect:getComplaintDetails");
		} catch (Exception ex) {
			log.error(ex.getMessage(), ex);
		}
		return mv;
	}
	
	@RequestMapping(value = "super/getComplaintDetails")
	public ModelAndView getComplaintDetails() {
		ModelAndView mv = new ModelAndView("comaplaintDetails");
		DetachedCriteria dt = DetachedCriteria.forClass(ComplaintModelReport.class, "pr");
		List<Object> allApplicantsList = commonDao.getList(dt);
		mv.addObject("allApplicantsList", allApplicantsList);
		return mv;

	}
	
	@RequestMapping(value = "getComplaintDetailsHomePage")
	public ModelAndView getComplaintDetailsHomePage() {
		ModelAndView mv = new ModelAndView("complaintDetailsHomePage");
		DetachedCriteria dt = DetachedCriteria.forClass(ComplaintModelReport.class, "pr");
		List<Object> allApplicantsList = commonDao.getList(dt);
		mv.addObject("allApplicantsList", allApplicantsList);
		return mv;

	}
}
