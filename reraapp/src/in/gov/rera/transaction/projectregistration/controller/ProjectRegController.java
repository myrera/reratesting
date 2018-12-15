package in.gov.rera.transaction.projectregistration.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import in.gov.rera.common.dao.impl.CommonDao;
import in.gov.rera.common.model.EnquiryModel;
import in.gov.rera.common.security.FileSecurity;
import in.gov.rera.common.util.PaymentTokenNumber;
import in.gov.rera.common.util.ProjectFeeCalculator;
import in.gov.rera.common.util.ReraConstants;
import in.gov.rera.dms.beans.Document;
import in.gov.rera.dms.service.IDocumentService;
import in.gov.rera.dms.util.ContentUtil;
import in.gov.rera.master.bank.model.BankModel;
import in.gov.rera.master.bank.service.IBankService;
import in.gov.rera.master.district.dao.IDistrictDAO;
import in.gov.rera.master.district.model.DistrictModel;
import in.gov.rera.master.office.model.OfficeModel;
import in.gov.rera.master.stateut.model.StateUtModel;
import in.gov.rera.master.stateut.service.IStateUtService;
import in.gov.rera.master.subdistrict.dao.ISubDistrictDAO;
import in.gov.rera.master.subdistrict.model.SubDistrictModel;
import in.gov.rera.notification.service.MailService;
import in.gov.rera.notification.service.SmsService;
import in.gov.rera.transaction.agentregistration.dao.IAgentRegistrationDAO;
import in.gov.rera.transaction.agentregistration.model.AgentRegistrationModel;
import in.gov.rera.transaction.agentregistration.service.IAgentRegistrationService;
import in.gov.rera.transaction.projectregistration.dao.EnquiryDetailsDAO;
import in.gov.rera.transaction.projectregistration.dao.IProjectArchitectDAO;
import in.gov.rera.transaction.projectregistration.dao.IProjectContractorDAO;
import in.gov.rera.transaction.projectregistration.dao.IProjectRegistrationDAO;
import in.gov.rera.transaction.projectregistration.dao.IStructuralEngneerDAO;
import in.gov.rera.transaction.projectregistration.model.DevelopmentDetailsModel;
import in.gov.rera.transaction.projectregistration.model.ExtOtherDevModel;
import in.gov.rera.transaction.projectregistration.model.ExternalDevelopmentWorkModel;
import in.gov.rera.transaction.projectregistration.model.ProjectAgentModel;
import in.gov.rera.transaction.projectregistration.model.ProjectArchitectDetailsModel;
import in.gov.rera.transaction.projectregistration.model.ProjectContratorDetailsModel;
import in.gov.rera.transaction.projectregistration.model.ProjectDetailsModel;
import in.gov.rera.transaction.projectregistration.model.ProjectPaymentDetailsModel;
import in.gov.rera.transaction.projectregistration.model.ProjectRegistrationModel;
import in.gov.rera.transaction.projectregistration.model.ProjectRemarks;
import in.gov.rera.transaction.projectregistration.model.PromoterBlacklistDetailsModel;
import in.gov.rera.transaction.projectregistration.model.PromoterDetailsModel;
import in.gov.rera.transaction.projectregistration.model.StructuralEngineerDetailsModel;
import in.gov.rera.transaction.projectregistration.model.UserRemarks;
import in.gov.rera.transaction.projectregistration.service.IProjectRegistrationService;

@Controller(value = "ProjectRegController")
@Scope("request")

public class ProjectRegController {
	static Logger log = Logger.getLogger(ProjectRegController.class);

	@Autowired
	HttpSession httpSession;

	@Autowired
	IDistrictDAO<DistrictModel, Long> districtDAO;

	@Autowired
	ISubDistrictDAO<SubDistrictModel, Long> subDistrictDAO;

	@Autowired
	EnquiryDetailsDAO<EnquiryModel, Long> enquiryDetailsDAO;

	@Autowired
	IStateUtService<StateUtModel, Long> stateUtService;

	@Autowired
	IBankService<BankModel, Long> bankService;
	@Autowired
	IProjectRegistrationDAO<BankModel, Long> pRegistrationDAO;

	@Autowired
	ContentUtil contentUtil;

	@Autowired
	MailService mailService;

	@Autowired
	SmsService smsService;

	@Autowired(required = true)
	IDocumentService<Document, Integer> documentService;

	@Autowired
	IAgentRegistrationService<AgentRegistrationModel, Long> agentRegistrationService;

	@Autowired
	IAgentRegistrationDAO<AgentRegistrationModel, Long> agentRegistrationDAO;

	@Autowired
	IProjectRegistrationService projectRegistrationService;

	@Autowired
	CommonDao<Object, Long> commonDao;

	@RequestMapping(value = "initProjectRegistration", method = RequestMethod.GET)
	public ModelAndView initProjectRegistration(
			@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel) {
		ModelAndView mv = null;
		try {
			mv = new ModelAndView("projectRegistration");
		} catch (Exception ex) {
			log.error(ex.getMessage(), ex);
		}
		return mv;
	}

	@RequestMapping(value = "invOrComProjectRegForm", method = RequestMethod.POST)
	public ModelAndView redirectNextProjectForm(
			@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request) {
		ModelAndView mv = null;
		try {
			String str = request.getParameter("emailId");
			ProjectRegistrationModel savedObj = projectRegistrationService.geSavedtProjectRegByEmailId(str);
			if (savedObj != null) {
				if (savedObj.getRegistrationType().equalsIgnoreCase(ReraConstants.INDVISUAL_REG)) {
					mv = new ModelAndView("redirect:/editRegInvForm");

				} else {
					mv = new ModelAndView("redirect:/editPromoterComDels");

				}
				httpSession.setAttribute("pkid", savedObj.getProjectRegId());
			} else {
				mv = new ModelAndView(request.getParameter("nextForm"));
				mv.addObject("stateUtList", stateUtService.getStateUtList());
				httpSession.setAttribute("emailId", request.getParameter("emailId"));
			}

		} catch (Exception ex) {
			log.error(ex.getMessage(), ex);
		}
		return mv;
	}

	@RequestMapping(value = "project/saveEnquiryDetails", method = RequestMethod.POST)
	public ModelAndView saveEnquiryDetailsForm(@RequestParam("enquiryId") Long enquiryId,
			@RequestParam("enquiryText") String enquiryText, @RequestParam("subject") String subject,
			@RequestParam("emailId") String emailId,
			@RequestParam(value = "replyText", required = false) String replyText) {
		ModelAndView mv = null;

		try {

			// ProjectRegistrationModel baseModel=
			// projectRegistrationService.getProjectRegByPk(enquiryId);
			EnquiryModel enq = new EnquiryModel();
			enq.getEnquiryId();
			// enq.setSubject(subject);
			// enq.setEnquiryText(enquiryText);
			enq.setReplyText(replyText);
			// enq.setEmailId(emailId);

			// projectRegistrationService.getUpdateEnquiryDetails(enq);
			enquiryDetailsDAO.saveEnquiryModel(enq);

			mv = new ModelAndView("redirect:viewAppList");

		} catch (Exception ex) {
			log.error(ex.getMessage(), ex);
		}
		return mv;

	}

	@RequestMapping(value = "project/enquiryDetailsForm", method = RequestMethod.POST)
	public ModelAndView enquiryDetailsForm(@RequestParam("projectRegId") Long projectRegId

			) {
		ModelAndView mv = null;

		try {
			mv = new ModelAndView("enquiryDetailsForm");
			ProjectRegistrationModel baseModel = projectRegistrationService.getProjectRegByPk(projectRegId);

			mv.addObject("projectRegistrationModel", baseModel);

		} catch (Exception ex) {
			log.error(ex.getMessage(), ex);
		}
		return mv;

	}

	/*
	 * Save promoter indivisual details
	 */
	@RequestMapping(value = "saveInvdPromoterDetails", method = RequestMethod.POST)
	public ModelAndView saveInvdPromoterDetails(
			@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request,
			@RequestParam(value = "completionDocId", required = false) MultipartFile[] completionDocId,
			@RequestParam("individualPhotoGraphPath") MultipartFile promoterIndiPhoto) {
		ModelAndView mv = null;

		Long pkid = null;
		if (!FileSecurity.checkFileSize(completionDocId)) {
			return new ModelAndView("incorrectFileType");
		}
		if (!FileSecurity.checkFileSize(promoterIndiPhoto)) {
			return new ModelAndView("incorrectFileType");
		}

		try {
			projectRegistrationModel.setRegistrationType(ReraConstants.INDVISUAL_REG);
			projectRegistrationModel.setStatus(ReraConstants.SAVE_AS_DRAFT);
			projectRegistrationModel.setCreatedOn(Calendar.getInstance());

			projectRegistrationModel.getPromoterDetailsModel().setDistrictModel(
					districtDAO.getDistirctById(Long.parseLong(request.getParameter("permDistrictId"))));
			pkid = projectRegistrationService.createProjectRegistration(projectRegistrationModel);
			projectRegistrationModel = projectRegistrationService.saveOrUpdateInvdPromoterDetails(
					projectRegistrationModel, request, completionDocId, promoterIndiPhoto);
			projectRegistrationService.editProjectRegistration(projectRegistrationModel);

			httpSession.setAttribute("pkid", pkid);

			mv = new ModelAndView("redirect:/addProjectDetailsForm");

		} catch (Exception ex) {
			log.error(ex.getMessage(), ex);
		}
		return mv;
	}

	/*
	 * Save promoter company details
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 */

	@RequestMapping(value = "saveCompanyPromoterDetails", method = RequestMethod.POST)
	public ModelAndView saveCompanyPromoterDetails(
			@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request, @RequestParam("regCertificateFile") MultipartFile regCertificateFile,
			@RequestParam("chairManPhoto") MultipartFile chairManPhoto,
			@RequestParam(value = "memberPhotoFile", required = false) MultipartFile[] memberPhotoFile,
			@RequestParam(value = "completionDocId", required = false) MultipartFile[] completionDocId)
					throws Exception {
		ModelAndView mv = null;

		if (!FileSecurity.checkFileSize(completionDocId)) {
			return new ModelAndView("incorrectFileType");
		}
		if (!FileSecurity.checkFileSize(regCertificateFile)) {
			return new ModelAndView("incorrectFileType");
		}
		if (!FileSecurity.checkFileSize(chairManPhoto)) {
			return new ModelAndView("incorrectFileType");
		}
		if (!FileSecurity.checkFileSize(regCertificateFile)) {
			return new ModelAndView("incorrectFileType");
		}

		Long id = null;
		try {
			projectRegistrationModel.setRegistrationType(ReraConstants.FIRM_COMP_REG);
			projectRegistrationModel.setStatus(ReraConstants.SAVE_AS_DRAFT);
			projectRegistrationModel.setCreatedOn(Calendar.getInstance());
			projectRegistrationModel.getPromoterDetailsModel().setDistrictModel(
					districtDAO.getDistirctById(Long.parseLong(request.getParameter("permDistrictId"))));
			projectRegistrationModel.getPromoterDetailsModel().getProjectChairmanModel().setDistrictModel(
					districtDAO.getDistirctById(Long.parseLong(request.getParameter("chairManDistrictId"))));

			projectRegistrationService.createProjectRegistration(projectRegistrationModel);

			projectRegistrationModel = projectRegistrationService.saveOrUpdatePromoterCompany(projectRegistrationModel,
					regCertificateFile, request, completionDocId);
			// throw new Exception();

			httpSession.setAttribute("pkid", projectRegistrationModel.getProjectRegId());
			projectRegistrationModel.getPromoterDetailsModel().setPromoterBlackSet(
					getBalacklistPromoterSet(projectRegistrationModel.getPromoterDetailsModel(), request));
			projectRegistrationService.editProjectRegistration(
					projectRegistrationService.saveOrUpdateChairManPhotograph(projectRegistrationModel, chairManPhoto));
			projectRegistrationService.editProjectRegistration(projectRegistrationService
					.saveOrUpdateRegistrationCertificate(projectRegistrationModel, regCertificateFile));
			projectRegistrationService.saveUpdateMember(projectRegistrationModel, request, memberPhotoFile);
			projectRegistrationService.editProjectRegistration(projectRegistrationModel);

			// mv = new ModelAndView("redirect:/addProjectDetailsForm");

			projectRegistrationService.saveUpdateProjectRegistration(projectRegistrationModel);
			// projectRegistrationModel.getPromoterDetailsModel().setPromoterBlackSet(getBalacklistPromoterSet(projectRegistrationModel.getPromoterDetailsModel(),request));
			// projectRegistrationService.editProjectRegistration(projectRegistrationService.saveOrUpdateChairManPhotograph(projectRegistrationModel,
			// chairManPhoto));
			// projectRegistrationService.editProjectRegistration(projectRegistrationService.saveOrUpdateRegistrationCertificate(projectRegistrationModel,
			// regCertificateFile));
			// projectRegistrationService.saveUpdateMember(projectRegistrationModel,
			// request, memberPhotoFile);
			id = projectRegistrationService.saveUpdateProjectRegistration(projectRegistrationModel);

			/*
			 * mv = new ModelAndView("redirect:viewAppList"); EnquiryModel
			 * enq=new EnquiryModel();
			 * enq.setSubject(" '"+bsModel.getApplicationNo()
			 * +"' has been updated"); enq.setEnquiryText("");
			 * 
			 * enq.setSubject("RERA Project Application Updated for:"+bsModel.
			 * getApplicationNo()); enq.
			 * setEnquiryText("This is to bring to your notice that the project application details for'"
			 * +bsModel.getProjectDetailsModel().getProjectName()
			 * +"' with reference number'"+bsModel.getApplicationNo()
			 * +"'  was updated by the promoter on'"+
			 * bsModel.getCreatedOn()+"'");
			 * enq.setEmailId("info.rera@karnataka.gov.in");
			 * //enq.setEmailId("shubhashini.venugopal@in.pwc.com");
			 */

			mv = new ModelAndView("redirect:/addProjectDetailsForm");

		} catch (Exception ex) {
			log.error(ex.getMessage(), ex);
			throw ex;
		}
		return mv;
	}

	/*
	 * Save promoter indivisual details
	 */
	@RequestMapping(value = "addProjectDetailsForm")
	public ModelAndView addProjectDetailsForm() {
		ModelAndView mv = null;

		try {
			ProjectRegistrationModel bsModel = projectRegistrationService
					.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			mv = new ModelAndView("projectDetailsForm");
			mv.addObject("projectRegistrationModel", bsModel);
			// ReraConstants
			mv.addObject("stateUtList", stateUtService.getStateUtList());
			mv.addObject("bankList", bankService.getBankList());
			DetachedCriteria dt = DetachedCriteria.forClass(OfficeModel.class);
			mv.addObject("authList", commonDao.getList(dt));

		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}

		return mv;
	}

	@RequestMapping(value = "saveProjectDetails", method = RequestMethod.POST)
	public ModelAndView saveProjectDetails(
			@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request, @RequestParam("bankDistrictId") Long districtId,
			@RequestParam("projectDistrictId") Long projectDistrictId,
			@RequestParam("subDistrictId") Long subDistrictId, @RequestParam("profficeid") Long officeId,
			@RequestParam(value = "delayedCert", required = false) MultipartFile delayedCert) {
		ModelAndView mv = null;
		try {

			ProjectRegistrationModel savedProj = projectRegistrationService
					.getProjectRegByPk(projectRegistrationModel.getProjectRegId());

			savedProj.setProjectDetailsModel(projectRegistrationModel.getProjectDetailsModel());

			projectRegistrationModel.getProjectBankDetailsModel()
			.setBankModel(bankService.getBankById(Long.parseLong(request.getParameter("projectBankId"))));
			ExternalDevelopmentWorkModel extDev = projectRegistrationModel.getExternalDevelopmentWorkModel();
			extDev.setExtOtherDevSet(getExtOtherDevSet(request, extDev));
			savedProj.setExternalDevelopmentWorkModel(extDev);
			projectRegistrationModel.getProjectBankDetailsModel()
			.setDistrictModel(districtDAO.getDistirctById(districtId));
			savedProj.setProjectBankDetailsModel(projectRegistrationModel.getProjectBankDetailsModel());
			savedProj.setDevelopmentDetailSet(getDevelopmentDetailSet(request, savedProj));
			savedProj.getProjectDetailsModel().setDistrictModel(districtDAO.getDistirctById(projectDistrictId));
			savedProj.getProjectDetailsModel().setSubDistrictModel(subDistrictDAO.getSubDistirctById(subDistrictId));
			savedProj.getProjectDetailsModel()
			.setOffice((OfficeModel) commonDao.getObject(OfficeModel.class, officeId));
			projectRegistrationService.saveDelayedCert(savedProj, delayedCert);

			savedProj.setProjectAgentDetailSet(saveOrUdateAgent(request, savedProj));

			Set<ProjectArchitectDetailsModel> arcSet = getProjectArchitectSet(request, savedProj);
			if (arcSet.size() > 0) {
				savedProj.setProjectArchitectDetailSet(arcSet);
			}
			if (getStructuralEngineerSet(request, savedProj).size() > 0) {
				savedProj.setStructuralEngineerDetailSet(getStructuralEngineerSet(request, savedProj));
			}
			if (getProjectContratorSet(request, savedProj).size() > 0) {
				savedProj.setProjectContratorDetailSet(getProjectContratorSet(request, savedProj));
			}
			projectRegistrationService.editProjectRegistration(savedProj);

			mv = new ModelAndView("redirect:/uploadProjectDocsForm");

		} catch (Exception ex) {
			log.error(ex.getMessage(), ex);

		}

		return mv;
	}

	/*
	 * Save promoter indivisual details
	 */
	@RequestMapping(value = "uploadProjectDocsForm")
	public ModelAndView uploadProjectDocs() {
		ModelAndView mv = null;

		try {
			ProjectRegistrationModel bsModel = projectRegistrationService
					.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			mv = new ModelAndView("docUploadFrom");

			ProjectPaymentDetailsModel paymentDetailsModel = new ProjectPaymentDetailsModel();
			paymentDetailsModel.setPaymentToken(PaymentTokenNumber.generateToken(bsModel));

			commonDao.saveObject(paymentDetailsModel);
			bsModel.setPaymentDetailsModel(paymentDetailsModel);

			/*ProjectPaymentDetailsModel PenaltypaymentDetailsModel = new ProjectPaymentDetailsModel();
			paymentDetailsModel.setPaymentToken(PaymentTokenNumber.generateToken(bsModel));

			commonDao.saveObject(PenaltypaymentDetailsModel);
			bsModel.setPenaltypaymentDetailsModel(PenaltypaymentDetailsModel);*/

			commonDao.updateObject(bsModel);

			mv.addObject("projectRegistrationModel", bsModel);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}

		return mv;

	}

	@RequestMapping(value = "saveUploadProjectDoc", method = RequestMethod.POST)
	public ModelAndView saveUploadProjectDoc(
			@RequestParam(value = "projectPhotoFile", required = false) MultipartFile[] projectPhotoFile,
			@RequestParam("otherFileDoc") MultipartFile[] otherFileDoc,
			@RequestParam("fieldName") String[] fieldNameArr, HttpServletRequest request) {
		ModelAndView mv = null;
		if (!FileSecurity.checkFileSize(fieldNameArr, otherFileDoc)) {
			return new ModelAndView("incorrectFileType");
		}
		if (!FileSecurity.checkFileSize(projectPhotoFile)) {
			return new ModelAndView("incorrectFileType");
		}

		try {
			ProjectRegistrationModel baseModel = projectRegistrationService
					.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			ProjectRegistrationModel savedProject = projectRegistrationService.saveOrUpdateProjectPhotoDoc(
					projectPhotoFile, otherFileDoc, fieldNameArr, baseModel,
					Integer.parseInt(request.getParameter("flg")),
					Long.parseLong(request.getParameter("projectDocModel.docId")));

			projectRegistrationService.editProjectRegistration(savedProject);

			/*
			 * //Start Added for new fields ProjectRegistrationModel
			 * savedProjectnew=projectRegistrationService.
			 * saveOrUpdateProjectPhotoNewFileDoc(projectPhotoFile,
			 * otherFileDoc,fieldNameArr,baseModel,Integer.parseInt(request.
			 * getParameter("flg")),Long.parseLong(request.getParameter(
			 * "projectNewFileDocModel.newDocId")));
			 * projectRegistrationService.editProjectRegistration(
			 * savedProjectnew); //End Added for new fields
			 */
			mv = new ModelAndView("redirect:/projectRegpaymentForm");

		} catch (Exception ex) {
			log.error(ex.getMessage(), ex);
		}
		return mv;

	}

	// Start added for new fields

	/*
	 * @RequestMapping(value = "saveUploadProjectDoc", method =
	 * RequestMethod.POST) public ModelAndView
	 * saveUploadProjectNewFileDoc(@RequestParam(value="projectPhotoFile",
	 * required=false) MultipartFile[] projectPhotoFile,
	 * 
	 * @RequestParam("otherFileDoc") MultipartFile[] otherFileDoc,
	 * 
	 * @RequestParam("fieldName") String[]fieldNameArr, HttpServletRequest
	 * request){ ModelAndView mv = null; if(
	 * !FileSecurity.checkFileSize(fieldNameArr,otherFileDoc)){ return new
	 * ModelAndView("incorrectFileType"); } if(
	 * !FileSecurity.checkFileSize(projectPhotoFile)){ return new
	 * ModelAndView("incorrectFileType"); }
	 * 
	 * try{ ProjectRegistrationModel
	 * baseModel=projectRegistrationService.getProjectRegByPk(Long.parseLong(
	 * httpSession.getAttribute("pkid").toString())); ProjectRegistrationModel
	 * savedProject=projectRegistrationService.saveOrUpdateProjectPhotoDoc(
	 * projectPhotoFile,
	 * otherFileDoc,fieldNameArr,baseModel,Integer.parseInt(request.getParameter
	 * ("flg")),Long.parseLong(request.getParameter("projectDocModel.docId")));
	 * 
	 * projectRegistrationService.editProjectRegistration(savedProject);
	 * 
	 * //Start Added for new fields ProjectRegistrationModel
	 * savedProjectnew=projectRegistrationService.
	 * saveOrUpdateProjectPhotoNewFileDoc(projectPhotoFile,
	 * otherFileDoc,fieldNameArr,baseModel,Integer.parseInt(request.getParameter
	 * ("flg")),Long.parseLong(request.getParameter(
	 * "projectNewFileDocModel.newDocId")));
	 * projectRegistrationService.editProjectRegistration(savedProjectnew);
	 * //End Added for new fields
	 * 
	 * mv = new ModelAndView("redirect:/projectRegpaymentForm");
	 * 
	 * }catch(Exception ex){ log.error(ex.getMessage(),ex); } return mv;
	 * 
	 * }
	 */

	// End added for new fields

	/*
	 * Save promoter indivisual details
	 */
	@RequestMapping(value = "projectRegpaymentForm")
	public ModelAndView projectRegpaymentForm() {
		ModelAndView mv = null;
		try {
			ProjectRegistrationModel bsModel = projectRegistrationService
					.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			int regFee = ProjectFeeCalculator.getProjectRegFee(bsModel.getProjectDetailsModel());
			mv = new ModelAndView("projectPayment");
			String errorMsg = (String) httpSession.getAttribute("errorMsg");

			if (errorMsg != null) {
				httpSession.removeAttribute("errorMsg");
				mv.addObject("errorMsg", errorMsg);
			} else {
				mv.addObject("errorMsg", "NO");
			}
			if(bsModel.getProjectDetailsModel().getK2PaymentDetailsModel()!=null) {
				mv.addObject("paymentStatus", bsModel.getProjectDetailsModel().getK2PaymentDetailsModel().getPaymentStatus());
				mv.addObject("paymentReference", bsModel.getProjectDetailsModel().getK2PaymentDetailsModel().getK2ReferenceNumber());
			}else
				mv.addObject("paymentStatus", "PAYMENT_INITIATED");

			if(bsModel.getApplicationNo()!=null)
				mv.addObject("paymentDone","YES");
			else
				mv.addObject("paymentDone","NO");

			if(bsModel.getProjectDetailsModel().getK2PenaltyPaymentDetailsModel()!=null) {
				mv.addObject("penaltyPaymentStatus", "PENALTY_"+bsModel.getProjectDetailsModel().getK2PenaltyPaymentDetailsModel().getPaymentStatus());
				mv.addObject("penaltyPaymentReference", bsModel.getProjectDetailsModel().getK2PenaltyPaymentDetailsModel().getK2ReferenceNumber());
				mv.addObject("amount", bsModel.getProjectDetailsModel().getK2PenaltyPaymentDetailsModel().getAmount());
				mv.addObject("penaltyStatus", bsModel.getProjectDetailsModel().getK2PenaltyPaymentDetailsModel().getPenaltyApplicable());
			}else {
				mv.addObject("penaltyPaymentStatus", "PENALTY_PAYMENT_INITIATED");
				mv.addObject("penaltyStatus","NO");
			}
			mv.addObject("paymentToken", bsModel.getPaymentDetailsModel().getPaymentToken());
			mv.addObject("promotername", bsModel.getProjectDetailsModel().getProjectName());
			//mv.addObject("PenaltypaymentToken", bsModel.getPenaltypaymentDetailsModel().getPaymentToken());
			mv.addObject("RegistrationFee", regFee);
			mv.addObject("projectRegistrationModel", bsModel);
			mv.addObject("stateUtList", stateUtService.getStateUtList());

			mv.addObject("pervProjectSet", bsModel.getPreviousProjectDetailsSet());
			// projectRegistrationModel.setRegistrationType(ReraConstants.FIRM_COMP_REG);
			if (bsModel.getRegistrationType().equalsIgnoreCase(ReraConstants.FIRM_COMP_REG)) {
				mv.addObject("projectMemberSet",
						bsModel.getPromoterDetailsModel().getProjectChairmanModel().getMemberSet());
				mv.addObject("promoterBlackListSet", bsModel.getPromoterDetailsModel().getPromoterBlackSet());
			}

			if (bsModel.getProjectAgentDetailSet() == null || bsModel.getProjectAgentDetailSet().size() == 0) {
				mv.addObject("agentStatus", "NO");
			} else {
				mv.addObject("agentStatus", "YES");
				mv.addObject("agentSet", bsModel.getProjectAgentDetailSet());
			}
			mv.addObject("developmentSet", bsModel.getDevelopmentDetailSet());
			mv.addObject("architectSet", bsModel.getProjectArchitectDetailSet());
			mv.addObject("stcEngSet", bsModel.getStructuralEngineerDetailSet());
			mv.addObject("projContratorSet", bsModel.getProjectContratorDetailSet());
			mv.addObject("extOtherDevSet", bsModel.getExternalDevelopmentWorkModel().getExtOtherDevSet());
			mv.addObject("bankList", bankService.getBankList());

		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}

		return mv;

	}

	@RequestMapping(value = "saveProjectPayment", method = RequestMethod.POST)
	public ModelAndView saveProjectPayment(@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request) {
		ModelAndView mv = null;

		/*if (!FileSecurity.checkFileSize(scanCopyDoc)) {
			return new ModelAndView("incorrectFileType");
		}*/
		try {

			ProjectRegistrationModel bsModel = projectRegistrationService
					.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			bsModel.setPaymentDetailsModel(projectRegistrationModel.getPaymentDetailsModel());
			//ProjectRegistrationModel savedProject = projectRegistrationService.saveProjectPayment(bsModel);
			ProjectRegistrationModel savedProject=null;

			int maxRetries=0;
			boolean projectSave=false;
			while (!projectSave && maxRetries < 10) {
				try {
					maxRetries++;
					bsModel.setApplicationNo(projectRegistrationService.generateProjectAckNumber(bsModel));
					projectRegistrationService.editProjectRegistration(bsModel);
					savedProject = projectRegistrationService.getProjectRegByPk(bsModel.getProjectRegId());
					projectSave = true;
				} catch (Exception e) {
					projectSave = false;
				}
			}

			if(savedProject.getApplicationNo()==null||savedProject.getApplicationNo().trim().length()==0){
				throw new RuntimeException();
			}


			savedProject.setStatus(ReraConstants.PENDING_OPRATOR);
			savedProject.setCreatedOn(Calendar.getInstance());

			if(savedProject.getProjectDetailsModel().getK2PenaltyPaymentDetailsModel()==null) {
				savedProject.getProjectDetailsModel().getK2PaymentDetailsModel().setPenaltyApplicable("NO");
			}else {
				savedProject.getProjectDetailsModel().getK2PaymentDetailsModel().setPenaltyApplicable("YES");
			}


			/*if (penaltyRec != null && !penaltyRec.isEmpty()) {

				Document document = new Document();
				document.setFileName(penaltyRec.getOriginalFilename());
				document.setMimeType(penaltyRec.getContentType());
				document.setInputStream(penaltyRec.getInputStream());
				document.setDocumentType("PROJECT_REG");
				document.setFolderId(String.valueOf(bsModel.getProjectRegId()));
				contentUtil.saveDocument(document);
				documentService.saveDoc(document);
				bsModel.getPaymentDetailsModel().setPenaltyPaidReceipt(document);
			}*/

			ProjectRemarks op = new ProjectRemarks();
			op.setRevenueStatus("NA");
			op.setAccountsStatus("NA");
			op.setTcpStatus("NA");
			op.setEnggStatus("NA");
			op.setRemarksList(new ArrayList<UserRemarks>());
			UserRemarks um = new UserRemarks();
			um.setStatus("NEW");
			op.getRemarksList().add(um);
			savedProject.setProjectRemarks(op);
			projectRegistrationService.editProjectRegistration(savedProject);
			mv = new ModelAndView("redirect:/projectRegConfirmationPage");
			httpSession.setAttribute("pkid", savedProject.getProjectRegId());
			mailService.sendprojectRegConfirmation(savedProject);

			// smsService.sendSMS(mobileNo, msgText);

		} catch (Exception ex) {
			log.error(ex.getMessage(), ex);
		}
		return mv;
	}

	/*
	 * Save promoter indivisual details
	 */
	@RequestMapping(value = "projectRegConfirmationPage")
	public ModelAndView projectRegConfirmationPage() {
		ModelAndView mv = null;

		try {
			ProjectRegistrationModel bsModel = projectRegistrationService
					.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			mv = new ModelAndView("projectConfirmation");
			mv.addObject("projectRegistrationModel", bsModel);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}

		return mv;

	}

	@RequestMapping(value = "printCopyProjectReg")
	public ModelAndView printCopyProjectReg() {
		ModelAndView mv = null;

		try {
			ProjectRegistrationModel bsModel = projectRegistrationService
					.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			if (bsModel.getRegistrationType().equals(ReraConstants.INDVISUAL_REG))
				mv = new ModelAndView("print-indProjectPage");
			else
				mv = new ModelAndView("print-compProjectPage");
			mv.addObject("projectRegistrationModel", bsModel);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}

		return mv;

	}

	/*
	 * Previous Individual Promoter
	 */
	@RequestMapping(value = "editRegInvForm")
	public ModelAndView pervInvdPromoterForm(
			@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request) {
		ModelAndView mv = null;
		try {
			projectRegistrationModel = projectRegistrationService
					.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			mv = new ModelAndView("editRegInvForm");
			mv.addObject("projectRegistrationModel", projectRegistrationModel);

			if (projectRegistrationModel.getPreviousProjectDetailsSet() != null
					&& projectRegistrationModel.getPreviousProjectDetailsSet().size() > 0) {
				mv.addObject("pervProjectSet", projectRegistrationModel.getPreviousProjectDetailsSet());
				mv.addObject("pervProjectSetFlag", "YES");
			} else {
				mv.addObject("pervProjectSetFlag", "NO");
			}

			mv.addObject("stateUtList", stateUtService.getStateUtList());

		} catch (Exception ex) {
			log.error(ex.getMessage(), ex);
		}
		return mv;
	}

	/*
	 * Save promoter indivisual details
	 */
	@RequestMapping(value = "updateInvdPromoterDetails", method = RequestMethod.POST)
	public ModelAndView updateInvdPromoterDetails(
			@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request,
			@RequestParam(value = "completionDocId", required = false) MultipartFile[] completionDocId,
			@RequestParam("individualPhotoGraphPath") MultipartFile promoterIndiPhoto) throws Exception {
		ModelAndView mv = null;
		if (!FileSecurity.checkFileSize(completionDocId)) {
			return new ModelAndView("incorrectFileType");
		}
		if (!FileSecurity.checkFileSize(promoterIndiPhoto)) {
			return new ModelAndView("incorrectFileType");
		}

		Long pkid = null;
		try {

			ProjectRegistrationModel baseObject = projectRegistrationService
					.getProjectRegByPk(projectRegistrationModel.getProjectRegId());
			baseObject.setPromoterDetailsModel(projectRegistrationModel.getPromoterDetailsModel());
			baseObject.getPromoterDetailsModel().setDistrictModel(
					districtDAO.getDistirctById(Long.parseLong(request.getParameter("permDistrictId"))));

			baseObject = projectRegistrationService.saveOrUpdateInvdPromoterDetails(baseObject, request,
					completionDocId, promoterIndiPhoto);
			pkid = projectRegistrationService.saveUpdateProjectRegistration(baseObject);
			httpSession.setAttribute("pkid", pkid);

			if (baseObject.getProjectDetailsModel() != null) {
				mv = new ModelAndView("redirect:/editProjectDetailsForm");

			} else {
				mv = new ModelAndView("redirect:/addProjectDetailsForm");

			}

		} catch (Exception ex) {
			log.error(ex.getMessage(), ex);
			throw ex;
		}
		return mv;
	}

	@RequestMapping(value = "editPromoterComDels")
	public ModelAndView editPromoterComDels(
			@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request) {
		ModelAndView mv = null;
		try {
			mv = new ModelAndView("editProjectRegComForm");
			mv.addObject("stateUtList", stateUtService.getStateUtList());
			projectRegistrationModel = projectRegistrationService
					.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			mv.addObject("projectRegistrationModel", projectRegistrationModel);

			if (projectRegistrationModel.getPromoterDetailsModel().getProjectChairmanModel().getMemberSet() != null
					&& projectRegistrationModel.getPromoterDetailsModel().getProjectChairmanModel().getMemberSet()
					.size() > 0) {
				mv.addObject("projectMemberSet",
						projectRegistrationModel.getPromoterDetailsModel().getProjectChairmanModel().getMemberSet());
				mv.addObject("projectMemberSetFlag", "YES");
			} else {
				mv.addObject("projectMemberSetFlag", "NO");
			}

			if (projectRegistrationModel.getPreviousProjectDetailsSet() != null
					&& projectRegistrationModel.getPreviousProjectDetailsSet().size() > 0) {
				mv.addObject("pervProjectSet", projectRegistrationModel.getPreviousProjectDetailsSet());
				mv.addObject("pervProjectSetFlag", "YES");
			} else {
				mv.addObject("pervProjectSetFlag", "NO");
			}

			if (projectRegistrationModel.getPromoterDetailsModel().getPromoterBlackSet() != null
					&& projectRegistrationModel.getPromoterDetailsModel().getPromoterBlackSet().size() > 0) {

				mv.addObject("promoterBlackListSet",
						projectRegistrationModel.getPromoterDetailsModel().getPromoterBlackSet());
				mv.addObject("promoterBlackListSetFlag", "YES");
			} else {
				mv.addObject("promoterBlackListSetFlag", "NO");
			}

		} catch (Exception ex) {
			log.error(ex.getMessage(), ex);
		}

		return mv;

	}

	/*
	 * Save promoter company details
	 */

	@RequestMapping(value = "updateCompanyPromoterDetails", method = RequestMethod.POST)
	public ModelAndView updateCompanyPromoterDetails(
			@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request, @RequestParam("regCertificateFile") MultipartFile regCertificateFile,
			@RequestParam("chairManPhoto") MultipartFile chairManPhoto,
			@RequestParam("chairManDistrictId") Long chairManDistrictId,

			@RequestParam(value = "memberPhotoFile", required = false) MultipartFile[] memberPhotoFile,
			@RequestParam(value = "completionDocId", required = false) MultipartFile[] completionDocId) {
		ModelAndView mv = null;
		if (!FileSecurity.checkFileSize(completionDocId)) {
			return new ModelAndView("incorrectFileType");
		}
		if (!FileSecurity.checkFileSize(regCertificateFile)) {
			return new ModelAndView("incorrectFileType");
		}
		if (!FileSecurity.checkFileSize(memberPhotoFile)) {
			return new ModelAndView("incorrectFileType");
		}
		if (!FileSecurity.checkFileSize(chairManPhoto)) {
			return new ModelAndView("incorrectFileType");
		}
		Long id = null;
		try {

			ProjectRegistrationModel bsModel = projectRegistrationService
					.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));

			bsModel.getPromoterDetailsModel().populateModel(projectRegistrationModel.getPromoterDetailsModel());

			bsModel.getPromoterDetailsModel().setDistrictModel(
					districtDAO.getDistirctById(Long.parseLong(request.getParameter("permDistrictId"))));

			projectRegistrationModel = projectRegistrationService.saveOrUpdatePromoterCompany(bsModel,
					regCertificateFile, request, completionDocId);

			projectRegistrationService.saveUpdateProjectRegistration(bsModel);
			bsModel.getPromoterDetailsModel()
			.setPromoterBlackSet(getBalacklistPromoterSet(bsModel.getPromoterDetailsModel(), request));
			projectRegistrationService.editProjectRegistration(
					projectRegistrationService.saveOrUpdateChairManPhotograph(bsModel, chairManPhoto));
			bsModel.getPromoterDetailsModel().getProjectChairmanModel()
			.setDistrictModel(districtDAO.getDistirctById(chairManDistrictId));
			projectRegistrationService.editProjectRegistration(
					projectRegistrationService.saveOrUpdateRegistrationCertificate(bsModel, regCertificateFile));
			projectRegistrationService.saveUpdateMember(bsModel, request, memberPhotoFile);
			id = projectRegistrationService.saveUpdateProjectRegistration(bsModel);

			httpSession.setAttribute("pkid", id);

			// if(bsModel.getProjectDetailsModel()!=null){

			mv = new ModelAndView("redirect:/editProjectDetailsForm");
			// }

			// else{

			// mv = new ModelAndView("redirect:/addProjectDetailsForm");

			// }

		} catch (Exception ex) {
			log.error(ex.getMessage(), ex);
		}
		return mv;
	}

	/*
	 * Save promoter indivisual details
	 */
	@RequestMapping(value = "editProjectDetailsForm")
	public ModelAndView editProjectDetailsForm() {
		ModelAndView mv = null;

		try {

			ProjectRegistrationModel bsModel = projectRegistrationService
					.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			mv = new ModelAndView("editProjectDetailsForm");
			List<Object> allApplicantsList = null;

			DetachedCriteria agentdt = DetachedCriteria.forClass(AgentRegistrationModel.class, "ar");
			allApplicantsList = commonDao.getList(agentdt);
			mv.addObject("allApplicantsList", allApplicantsList);

			DetachedCriteria dt = DetachedCriteria.forClass(OfficeModel.class);
			mv.addObject("authList", commonDao.getList(dt));

			mv.addObject("projectRegistrationModel", bsModel);
			mv.addObject("stateUtList", stateUtService.getStateUtList());
			mv.addObject("bankList", bankService.getBankList());
			if (bsModel.getStructuralEngineerDetailSet() == null
					|| bsModel.getStructuralEngineerDetailSet().size() == 0) {
				mv.addObject("stcEngStatus", "NO");
			} else {
				mv.addObject("stcEngStatus", "YES");
				mv.addObject("stcEngSet", bsModel.getStructuralEngineerDetailSet());
			}

			if (bsModel.getProjectAgentDetailSet() == null || bsModel.getProjectAgentDetailSet().size() == 0) {
				mv.addObject("agentStatus", "NO");
			} else {
				mv.addObject("agentStatus", "YES");
				mv.addObject("agentSet", bsModel.getProjectAgentDetailSet());
			}

			if (bsModel.getProjectContratorDetailSet() == null || bsModel.getProjectContratorDetailSet().size() == 0) {
				mv.addObject("projContratorStatus", "NO");
			} else {
				mv.addObject("projContratorStatus", "YES");
				mv.addObject("projContratorSet", bsModel.getProjectContratorDetailSet());
			}

			if (bsModel.getProjectArchitectDetailSet() == null || bsModel.getProjectArchitectDetailSet().size() == 0) {
				mv.addObject("architectStatus", "NO");
			} else {
				mv.addObject("architectStatus", "YES");
				mv.addObject("architectSet", bsModel.getProjectArchitectDetailSet());
			}

			if (bsModel.getDevelopmentDetailSet() == null || bsModel.getDevelopmentDetailSet().size() == 0) {
				mv.addObject("developmentStatus", "NO");
			} else {
				mv.addObject("developmentStatus", "YES");
				mv.addObject("developmentSet", bsModel.getDevelopmentDetailSet());
			}

			if (bsModel.getExternalDevelopmentWorkModel() == null
					|| bsModel.getExternalDevelopmentWorkModel().getExtOtherDevSet() == null
					|| bsModel.getExternalDevelopmentWorkModel().getExtOtherDevSet().size() == 0) {
				mv.addObject("extOtherDevStatus", "NO");
			} else {
				mv.addObject("extOtherDevStatus", "YES");
				mv.addObject("extOtherDevSet", bsModel.getExternalDevelopmentWorkModel().getExtOtherDevSet());
			}

		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}

		return mv;
	}

	@RequestMapping(value = "updateProjectDetails", method = RequestMethod.POST)
	public ModelAndView updateProjectDetails(
			@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request, @RequestParam("bankDistrictId") Long districtId,
			@RequestParam("projectDistrictId") Long projectDistrictId,
			@RequestParam("subDistrictId") Long subDistrictId, @RequestParam("profficeid") Long officeId,
			@RequestParam(value = "delayedCert", required = false) MultipartFile delayedCert) {
		ModelAndView mv = null;
		try {
			ProjectRegistrationModel savedProj = projectRegistrationService
					.getProjectRegByPk(projectRegistrationModel.getProjectRegId());
			if (savedProj.getProjectDetailsModel() == null)
				savedProj.setProjectDetailsModel(new ProjectDetailsModel());
			savedProj.getProjectDetailsModel().populateModel(projectRegistrationModel.getProjectDetailsModel());
			ExternalDevelopmentWorkModel extDev = projectRegistrationModel.getExternalDevelopmentWorkModel();
			extDev.setExtOtherDevSet(getExtOtherDevSet(request, extDev));
			savedProj.setExternalDevelopmentWorkModel(extDev);
			savedProj.setProjectBankDetailsModel(projectRegistrationModel.getProjectBankDetailsModel());
			savedProj.getProjectBankDetailsModel()
			.setBankModel(bankService.getBankById(Long.parseLong(request.getParameter("projectBankId"))));
			savedProj.getProjectBankDetailsModel().setDistrictModel(districtDAO.getDistirctById(districtId));
			savedProj.getProjectDetailsModel()
			.setOffice((OfficeModel) commonDao.getObject(OfficeModel.class, officeId));

			savedProj.setDevelopmentDetailSet(getDevelopmentDetailSet(request, savedProj));
			Set<ProjectArchitectDetailsModel> arcSet = getProjectArchitectSet(request, savedProj);
			if (arcSet.size() > 0) {
				savedProj.setProjectArchitectDetailSet(arcSet);
			}
			if (getStructuralEngineerSet(request, savedProj).size() > 0) {
				savedProj.setStructuralEngineerDetailSet(getStructuralEngineerSet(request, savedProj));
			}
			if (getProjectContratorSet(request, savedProj).size() > 0) {
				savedProj.setProjectContratorDetailSet(getProjectContratorSet(request, savedProj));

			}

			savedProj.setProjectAgentDetailSet(saveOrUdateAgent(request, savedProj));
			savedProj.getProjectDetailsModel().setDistrictModel(districtDAO.getDistirctById(projectDistrictId));
			savedProj.getProjectDetailsModel().setSubDistrictModel(subDistrictDAO.getSubDistirctById(subDistrictId));
			projectRegistrationService.saveDelayedCert(savedProj, delayedCert);

			projectRegistrationService.mergeProjectRegistration(savedProj);

			if (savedProj.getProjectDocModel() != null) {
				mv = new ModelAndView("redirect:/editUploadDoc");
			}
			/*
			 * //Start Added for new fields else
			 * if(savedProj.getProjectNewFileDocModel()!=null){ mv = new
			 * ModelAndView("redirect:/editUploadDoc"); } //End Added for new
			 * fields
			 */ else {
				 mv = new ModelAndView("redirect:/uploadProjectDocsForm");
			 }

		} catch (Exception ex) {
			log.error(ex.getMessage(), ex);
		}
		return mv;
	}

	@RequestMapping("editUploadDoc")
	public ModelAndView editUploadDoc() {
		ModelAndView mv = null;

		try {
			mv = new ModelAndView("editDocUploadFrom");
			ProjectRegistrationModel baseModel = projectRegistrationService
					.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			mv.addObject("projectRegistrationModel", baseModel);
			if (baseModel.getProjectPhotoDetailSet() != null && baseModel.getProjectPhotoDetailSet().size() > 0) {
				mv.addObject("projectPhotoFlag", "YES");
			} else {
				mv.addObject("projectPhotoFlag", "NO");
			}

		} catch (Exception ex) {
			log.error(ex.getMessage(), ex);
		}
		return mv;

	}

	@RequestMapping(value = "updateUploadProjectDoc", method = RequestMethod.POST)
	public ModelAndView updateUploadProjectDoc(
			@RequestParam(value = "projectPhotoFile", required = false) MultipartFile[] projectPhotoFile,
			@RequestParam("otherFileDoc") MultipartFile[] otherFileDoc,
			@RequestParam("fieldName") String[] fieldNameArr,
			@RequestParam(value = "photoId", required = false) String[] photoId, HttpServletRequest request) {
		ModelAndView mv = null;

		if (!FileSecurity.checkFileSize(projectPhotoFile)) {
			return new ModelAndView("incorrectFileType");
		}
		if (!FileSecurity.checkFileSize(fieldNameArr, otherFileDoc)) {
			return new ModelAndView("incorrectFileType");
		}

		try {
			ProjectRegistrationModel baseModel = projectRegistrationService
					.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			baseModel = projectRegistrationService.updateProjectPhotoDoc(photoId, projectPhotoFile, otherFileDoc,
					fieldNameArr, baseModel);
			projectRegistrationService.editProjectRegistration(baseModel);

			/*
			 * //Start added for new fields
			 * 
			 * ProjectRegistrationModel
			 * baseModelNewDoc=projectRegistrationService.getProjectRegByPk(Long
			 * .parseLong(httpSession.getAttribute("pkid").toString()));
			 * baseModel=projectRegistrationService.updateProjectPhotoNewFileDoc
			 * (photoId,projectPhotoFile, otherFileDoc,fieldNameArr,baseModel);
			 * projectRegistrationService.editProjectRegistration(
			 * baseModelNewDoc);
			 * 
			 * 
			 * //end added for new fields
			 */
			mv = new ModelAndView("redirect:/projectRegpaymentForm");

		} catch (Exception ex) {
			log.error(ex.getMessage(), ex);
		}
		return mv;

	}

	public Set<PromoterBlacklistDetailsModel> getBalacklistPromoterSet(PromoterDetailsModel promoterDetailsModel,
			HttpServletRequest request) {
		Set<PromoterBlacklistDetailsModel> set = new HashSet<PromoterBlacklistDetailsModel>();
		try {
			PromoterBlacklistDetailsModel model = null;
			String[] arr = request.getParameterValues("certificateNo");
			if (arr != null) {
				for (int i = 0; i < arr.length; i++) {

					model = new PromoterBlacklistDetailsModel();
					model.setBlacklistReason(request.getParameterValues("blacklist")[i].toString());
					if (request.getParameterValues("prmBacklistId") != null) {
						if (!request.getParameterValues("prmBacklistId")[i].equals("")) {
							model.setPrmBacklistId(Long.parseLong(request.getParameterValues("prmBacklistId")[i]));
						}
					}

					model.setIsBalckList(request.getParameterValues("isBalckListFld")[i]);
					model.setCertificateNo(arr[i]);
					// model.setPromoterDetailsModel(promoterDetailsModel);
					model.setStateUtModel(
							stateUtService.getStateByID(Long.parseLong(request.getParameterValues("otherStateId")[i])));
					set.add(model);
				}
			}
		} catch (Exception ex) {
			log.error(ex.getMessage(), ex);
		}

		return set;
	}

	/*
	 * redirect Next Promoter Form
	 */

	/*
	 * private Set<DevelopmentDetailsModel>
	 * getDevelopmentDetailSet(HttpServletRequest
	 * request,ProjectRegistrationModel model){ Set<DevelopmentDetailsModel> set
	 * = new HashSet<DevelopmentDetailsModel>(); DevelopmentDetailsModel dev =
	 * null; try{ String[]arr= request.getParameterValues("typeOfInventory");
	 * if(arr!=null){ for(int i=0;i<arr.length;i++){ dev = new
	 * DevelopmentDetailsModel(); dev.setTypeOfInventory(arr[i]);
	 * dev.setNoOfInventory(Integer.parseInt(request.getParameterValues(
	 * "noOfInventory")[i].toString()));
	 * dev.setCarpetArea(Integer.parseInt(request.getParameterValues(
	 * "carpetArea")[i].toString()));
	 * dev.setAreaOfExclusive(Integer.parseInt(request.getParameterValues(
	 * "areaOfExclusive")[i]));
	 * dev.setAreaOfExclusiveOpenTerrace(Integer.parseInt(request.
	 * getParameterValues("areaOfExclusiveOpenTerrace")[i].toString()));
	 * if(request.getParameterValues("devId")!=null){
	 * dev.setDevId(Long.parseLong(request.getParameterValues("devId")[i].
	 * toString())); }
	 * 
	 * set.add(dev); } }
	 * 
	 * }catch(Exception ex){ log.error(ex.getMessage(),ex); } return set; }
	 */

	private Set<DevelopmentDetailsModel> getDevelopmentDetailSet(HttpServletRequest request,
			ProjectRegistrationModel model) {
		Set<DevelopmentDetailsModel> set = new HashSet<DevelopmentDetailsModel>();
		DevelopmentDetailsModel dev = null;
		try {
			String[] arr = request.getParameterValues("typeOfInventory");
			String[] ids = request.getParameterValues("devId");
			if (arr != null) {
				for (int i = 0; i < arr.length; i++) {
					if (ids != null && ids.length > i && ids[i] != null && ids[i].trim().length() > 0) {
						dev = (DevelopmentDetailsModel) commonDao.getObject(DevelopmentDetailsModel.class,
								Long.parseLong(ids[i]));
					} else {
						dev = new DevelopmentDetailsModel();
					}
					dev.setTypeOfInventory(arr[i]);
					dev.setNoOfInventory(Integer.parseInt(request.getParameterValues("noOfInventory")[i].toString()));
					dev.setCarpetArea(Integer.parseInt(request.getParameterValues("carpetArea")[i].toString()));
					dev.setAreaOfExclusive(Integer.parseInt(request.getParameterValues("areaOfExclusive")[i]));
					dev.setAreaOfExclusiveOpenTerrace(
							Integer.parseInt(request.getParameterValues("areaOfExclusiveOpenTerrace")[i].toString()));

					set.add(dev);
				}
			}

		} catch (Exception ex) {
			log.error(ex.getMessage(), ex);
		}
		return set;
	}

	private Set<ExtOtherDevModel> getExtOtherDevSet(HttpServletRequest request, ExternalDevelopmentWorkModel model) {
		Set<ExtOtherDevModel> set = new HashSet<ExtOtherDevModel>();
		ExtOtherDevModel dev = null;
		try {
			String[] arr = request.getParameterValues("extDevWorkDesc");
			if (arr != null) {
				for (int i = 0; i < arr.length; i++) {
					dev = new ExtOtherDevModel();
					dev.setDevelopeBy(request.getParameterValues("developeBy")[i]);
					dev.setExternalDevelopmentWorkModel(model);
					dev.setWorkDesc(request.getParameterValues("extDevWorkDesc")[i]);
					if (request.getParameterValues("extOtherDevId") != null) {
						if (!request.getParameterValues("extOtherDevId")[i].equals("")) {
							dev.setExtOtherDevId(Long.parseLong(request.getParameterValues("extOtherDevId")[i]));

						}
					}
					set.add(dev);
				}
			}

		} catch (Exception ex) {
			log.error(ex.getMessage(), ex);

		}
		return set;

	}

	private Set<ProjectArchitectDetailsModel> getProjectArchitectSet(HttpServletRequest request,
			ProjectRegistrationModel model) {
		Set<ProjectArchitectDetailsModel> set = new HashSet<ProjectArchitectDetailsModel>();
		try {

			ProjectArchitectDetailsModel architectDetailsModel = null;
			String[] arr = request.getParameterValues("strcEmailId");
			String[] ids = request.getParameterValues("projectArchId");
			if (arr != null) {
				for (int i = 0; i < arr.length; i++) {

					if (ids != null && ids.length > i && ids[i] != null && ids[i].trim().length() > 0) {

						architectDetailsModel = projectArchitectDAO.getProjectArchoitectById(Long.parseLong(ids[i]));

					} else {
						architectDetailsModel = new ProjectArchitectDetailsModel();
					}
					architectDetailsModel.setArchitectName(request.getParameterValues("architectName")[i]);
					architectDetailsModel.setEmailId(request.getParameterValues("arctEmailId")[i]);
					architectDetailsModel.setAddressLine1(request.getParameterValues("arctAddressLine1")[i]);
					architectDetailsModel.setAddressLine2(request.getParameterValues("arctAddressLine2")[i]);
					architectDetailsModel.setDistrictModel(districtDAO
							.getDistirctById(Long.parseLong(request.getParameterValues("arctProjDistrictId")[i])));
					architectDetailsModel.setYearOfEstablishment(request.getParameterValues("arctYearOfEst")[i]);
					architectDetailsModel.setKeyProject(request.getParameterValues("arctKeyProjectCompleted")[i]);
					architectDetailsModel.setPinCode(request.getParameterValues("arctPineCode")[i]);
					architectDetailsModel.setRegOfCoaNo(request.getParameterValues("regOfCoaNo")[i]);
					architectDetailsModel.setAddedOn(Calendar.getInstance());

					architectDetailsModel.setStatus(ReraConstants.VENDOR_REQ_CONFIRMED);
					set.add(architectDetailsModel);
				}

			}
		} catch (Exception ex) {
			log.error(ex.getMessage(), ex);
		}
		return set;
	}

	private Set<StructuralEngineerDetailsModel> getStructuralEngineerSet(HttpServletRequest request,
			ProjectRegistrationModel model) {
		Set<StructuralEngineerDetailsModel> set = new HashSet<StructuralEngineerDetailsModel>();
		StructuralEngineerDetailsModel eg = null;
		try {

			String[] arr = request.getParameterValues("strcEmailId");
			String[] ids = request.getParameterValues("strcStcEngId");
			if (arr != null) {
				for (int i = 0; i < arr.length; i++) {
					if (ids != null && ids.length > i && ids[i] != null && ids[i].trim().length() > 0) {
						eg = structuralEngneerDAO.getEngineerById(Long.parseLong(ids[i]));
					} else {
						eg = new StructuralEngineerDetailsModel();
					}
					eg.setEngineerName(request.getParameterValues("engineerName")[i].toString());
					eg.setEmailId(request.getParameterValues("strcEmailId")[i]);
					eg.setAddressLine1(request.getParameterValues("strcAddressLine1")[i]);

					eg.setAddressLine2(request.getParameterValues("strcAddressLine2")[i]);
					eg.setDistrictModel(districtDAO
							.getDistirctById(Long.parseLong(request.getParameterValues("strcProjDistrictId")[i])));
					eg.setYearOfEstablishment(request.getParameterValues("strcYearOfEst")[i]);

					eg.setKeyProject(request.getParameterValues("strcKeyProjectCompleted")[i]);
					eg.setLocalAuthorityLicenceNumber(request.getParameterValues("localAuthorityLicenceNumber")[i]);
					eg.setPinCode(request.getParameterValues("strcPineCode")[i]);
					eg.setAddedOn(Calendar.getInstance());
					eg.setStatus(ReraConstants.VENDOR_REQ_CONFIRMED);

					set.add(eg);
				}
			}

		} catch (Exception ex) {
			log.error(ex.getMessage(), ex);
		}
		return set;
	}

	private Set<ProjectAgentModel> saveOrUdateAgent(HttpServletRequest request, ProjectRegistrationModel model) {
		Set<ProjectAgentModel> agentSet = new HashSet<ProjectAgentModel>();

		try {
			String[] arr = request.getParameterValues("agentRegNo");
			if (arr != null) {
				ProjectAgentModel obj = null;
				for (int i = 0; i < arr.length; i++) {

					if (!arr[i].trim().equals("")) {
						AgentRegistrationModel agent = projectRegistrationService.getAgentByRegNo(arr[i]);
						if (agent != null) {
							obj = new ProjectAgentModel();
							obj.setAddedOn(Calendar.getInstance());
							obj.setStatus(ReraConstants.VENDOR_REQ_CONFIRMED);
							obj.setAgent(agent);
							obj.setProject(model);
							agentSet.add(obj);
							if (agent.getProjectRegistrationModelSet() == null) {
								agent.setProjectRegistrationModelSet(new HashSet<ProjectAgentModel>());
							}
							agent.getProjectRegistrationModelSet().add(obj);
							commonDao.updateObject(agent);
						}

					}
				}

			}

		} catch (Exception ex) {
			log.error(ex.getMessage(), ex);
		}
		return agentSet;
	}

	private Set<ProjectContratorDetailsModel> getProjectContratorSet(HttpServletRequest request,
			ProjectRegistrationModel model) {
		Set<ProjectContratorDetailsModel> set = new HashSet<ProjectContratorDetailsModel>();
		ProjectContratorDetailsModel eg = null;
		try {

			String[] arr = request.getParameterValues("cntrEmailId");
			String[] ids = request.getParameterValues("projectCntrId");
			if (arr != null) {
				for (int i = 0; i < arr.length; i++) {
					if (ids != null && ids.length > i && ids[i] != null && ids[i].trim().length() > 0) {

						eg = contratorDetailsDAO.getProjectContractorById(Long.parseLong(ids[i]));
					} else {
						eg = new ProjectContratorDetailsModel();
					}
					eg.setContractorName(request.getParameterValues("contractorName")[i]);
					eg.setEmailId(request.getParameterValues("cntrEmailId")[i]);
					eg.setAddressLine1(request.getParameterValues("cntrAddressLine1")[i]);
					eg.setAddressLine2(request.getParameterValues("cntrAddressLine2")[i]);
					eg.setDistrictModel(districtDAO
							.getDistirctById(Long.parseLong(request.getParameterValues("cntrProjDistrictId")[i])));
					eg.setYearOfEstablishment(request.getParameterValues("cntrYearOfEst")[i]);
					eg.setKeyProject(request.getParameterValues("cntrKeyProjectCompleted")[i]);
					eg.setPinCode(request.getParameterValues("cntrPineCode")[i]);
					eg.setAddedOn(Calendar.getInstance());
					eg.setStatus(ReraConstants.VENDOR_REQ_CONFIRMED);

					set.add(eg);
				}
			}

		} catch (Exception ex) {
			log.error(ex.getMessage(), ex);
		}
		return set;
	}

	@RequestMapping(value = "getAgentDetailforProjectReg", method = RequestMethod.GET)
	public @ResponseBody String getAgentDetailforProjectReg(@RequestParam("agentRegNo") String agentRegNo,
			@RequestParam("SID") String sid) {

		System.out.println("agentRegNo >>" + agentRegNo + "SID >>" + sid);
		AgentRegistrationModel agent = null;
		String agentDls = "Agent not found";
		try {

			agent = projectRegistrationService.getAgentByRegNo(agentRegNo);
			if (agent != null) {
				if (agent.getRegistrationType().equalsIgnoreCase(ReraConstants.INDVISUAL_REG))
					agentDls = sid + "~" + agent.getAgentRegistrationID() + "~"
							+ agent.getAgentDetailsModel().getAgentName() + "~"
							+ agent.getAgentDetailsModel().getAgentIndividualAddressLine1();
				else
					agentDls = sid + "~" + agent.getAgentRegistrationID() + "~"
							+ agent.getAgentDetailsModel().getFirmName() + "~"
							+ agent.getAgentDetailsModel().getFirmAddressLine1();

			} else {
				agentDls = sid + "~NOEXIST";
			}

		} catch (Exception ex) {
			log.error(ex.getMessage(), ex);
		}
		return agentDls;

	}

	@Autowired
	IStructuralEngneerDAO<StructuralEngineerDetailsModel, Long> structuralEngneerDAO;

	@Autowired
	IProjectContractorDAO<ProjectContratorDetailsModel, Long> contratorDetailsDAO;

	@Autowired
	IProjectArchitectDAO<ProjectArchitectDetailsModel, Long> projectArchitectDAO;

	/*
	 * private String getApplicationNo(ProjectDetailsModel project) { Calendar
	 * cal = Calendar.getInstance(); StringBuffer sb = new StringBuffer();
	 * sb.append("PR/"); if (project.getDistrictModel() != null &&
	 * project.getDistrictModel().getStateUtModel() != null)
	 * sb.append(project.getDistrictModel().getStateUtModel().getStateUtCode().
	 * toUpperCase()).append("/"); int yr = cal.get(Calendar.YEAR); int mnth =
	 * cal.get(Calendar.MONTH) + 1; int dt = cal.get(Calendar.DATE); yr = yr %
	 * 100; if (yr < 10) { sb.append("0").append(yr); } else { sb.append(yr); }
	 * if (mnth < 10) { sb.append("0").append(mnth); } else { sb.append(mnth); }
	 * if (dt < 10) { sb.append("0").append(dt); } else { sb.append(dt); }
	 * sb.append("/");
	 * 
	 * String str = "" + project.getProjectDetailsId(); while (str.length() < 6)
	 * { str = "0" + str; } sb.append(str); return sb.toString(); }
	 */

	private String getApplicationNo(ProjectDetailsModel project) {
		Calendar cal = Calendar.getInstance();
		StringBuffer sb = new StringBuffer("ACK/KA/RERA/");
		if (project.getDistrictModel() != null && project.getDistrictModel().getDistrictId() != null)
			sb.append(project.getDistrictModel().getDistrictId()).append("/");

		if (project.getSubDistrictModel() != null && project.getSubDistrictModel().getSubDistrictId() != null)
			sb.append(project.getSubDistrictModel().getSubDistrictId()).append("/PR/");

		int yr = cal.get(Calendar.YEAR);
		int mnth = cal.get(Calendar.MONTH) + 1;
		int dt = cal.get(Calendar.DATE);
		yr = yr % 100;
		if (yr < 10) {
			sb.append("0").append(yr);
		} else {
			sb.append(yr);
		}
		if (mnth < 10) {
			sb.append("0").append(mnth);
		} else {
			sb.append(mnth);
		}
		if (dt < 10) {
			sb.append("0").append(dt);
		} else {
			sb.append(dt);
		}
		sb.append("/");

		String str = "" + project.getProjectDetailsId();
		while (str.length() < 6) {
			str = "0" + str;
		}
		sb.append(str);
		System.out.println("GENERATED APP NO >>>" + sb.toString());
		return sb.toString();
	}

	//

	private String generateNewApplicationNo(ProjectDetailsModel project) {
		Calendar cal = Calendar.getInstance();
		StringBuffer sb = new StringBuffer("ACK/KA/RERA/");
		if (project.getDistrictModel() != null && project.getDistrictModel().getDistrictId() != null)
			sb.append(project.getDistrictModel().getDistrictId()).append("/");

		if (project.getSubDistrictModel() != null && project.getSubDistrictModel().getSubDistrictId() != null)
			sb.append(project.getSubDistrictModel().getSubDistrictId()).append("/PR/");

		int yr = cal.get(Calendar.YEAR);
		int mnth = cal.get(Calendar.MONTH) + 1;
		int dt = cal.get(Calendar.DATE);
		yr = yr % 100;
		if (yr < 10) {
			sb.append("0").append(yr);
		} else {
			sb.append(yr);
		}
		if (mnth < 10) {
			sb.append("0").append(mnth);
		} else {
			sb.append(mnth);
		}
		if (dt < 10) {
			sb.append("0").append(dt);
		} else {
			sb.append(dt);
		}
		sb.append("/");

		String str = "" + project.getProjectDetailsId();
		while (str.length() < 6) {
			str = "0" + str;
		}
		sb.append(str);
		System.out.println("GENERATED APP NO >>>" + sb.toString());
		return sb.toString();
	}
}
