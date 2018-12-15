package in.gov.rera.transaction.postregistration.controller;

import java.util.Calendar;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import in.gov.rera.common.dao.impl.CommonDao;
import in.gov.rera.common.model.EnquiryModel;
import in.gov.rera.common.model.UserModel;
import in.gov.rera.common.util.ReraConstants;
import in.gov.rera.notification.service.MailService;
import in.gov.rera.transaction.agentregistration.model.AgentRegistrationModel;
import in.gov.rera.transaction.postregistration.model.ApprovalCostModel;
import in.gov.rera.transaction.postregistration.model.ConstructionCostmodel;
import in.gov.rera.transaction.postregistration.model.FloorDetailsModel;
import in.gov.rera.transaction.postregistration.model.LandCostDetailsModel;
import in.gov.rera.transaction.postregistration.model.ProjectScheduleModel;
import in.gov.rera.transaction.postregistration.model.TowerDetailsModel;
import in.gov.rera.transaction.postregistration.service.IPostRegService;
import in.gov.rera.transaction.projectregistration.model.ProjectDetailsModel;
import in.gov.rera.transaction.projectregistration.model.ProjectRegistrationModel;
import in.gov.rera.transaction.projectregistration.service.IProjectRegistrationService;

@Controller("PostRegController")
@Scope("request")
public class PostRegController {

	static Logger log= Logger.getLogger(PostRegController.class);

	@Autowired
	HttpSession httpSession;

	@Autowired
	IPostRegService postRegService;

	@Autowired
	CommonDao<Object, Long> commonDao;

	@Autowired
	MailService mailService;

	@Autowired
	IProjectRegistrationService projectRegistrationService;

	private List<ProjectRegistrationModel> projectlist;

	@RequestMapping(value = "postRegNewUser")
	public ModelAndView newuserPage(HttpServletRequest request) {
		
		ModelAndView mv = new ModelAndView("postReg.newuser");
		
		DetachedCriteria dt = DetachedCriteria.forClass(ProjectRegistrationModel.class, "pr");
		dt.createAlias("pr.projectDetailsModel", "projectDetailsModel");
		dt.createAlias("pr.promoterDetailsModel", "promoterDetailsModel");
		dt.add(Restrictions.ne("pr.status", "SAVE_AS_DRAFT"));
		dt.add(Restrictions.ne("pr.status", "REVOKED"));
		List<Object> allApplicantsList = commonDao.getList(dt);

		mv.addObject("allApplicantsList", allApplicantsList );
		return mv;
	}

	@RequestMapping(value = "postRegRegistration")
	public ModelAndView registration(HttpServletRequest request,
			@RequestParam(value = "applicationNumber", required = false) String applicationNumber) {
		ProjectRegistrationModel project = null;
		ModelAndView mv = new ModelAndView("postReg.registration");
		String email =null;
		if (applicationNumber != null && applicationNumber.trim().length() != 0  && applicationNumber.startsWith("PRM")){
			try {
				project = projectRegistrationService.getProjectByPRMAppNo(applicationNumber);
				if (project != null) {
					email = project.getPromoterDetailsModel().getEmailId();
				} else {
					mv = new ModelAndView("postReg.newuser");
					mv.addObject("ERROR_MSG", "Permanent Application Number is not valid.");
					return mv;
				}
			} catch (Exception e) {
				log.error(e.getMessage(), e);
			}
		}else {
			mv = new ModelAndView("postReg.newuser");
			mv.addObject("ERROR_MSG", "Please Enter valid Permanent Application");
			return mv;
		}

		UserModel user = new UserModel();
		if(email != null && email.length()>0) {
			user.setEmailId(email);
		}
		user.setUserType(ReraConstants.POSTREG_USER);
		user.setCreatedOn(Calendar.getInstance());
		user.setStatus(ReraConstants.ACTIVE_USER);

		if (user.getPassword() == null)
			user.setPassword(generatePassword());

		commonDao.saveObject(project.getPromoterDetailsModel());
		user.setUserName(project.getPromoterDetailsModel().getPromoterName());
		user.setContactNumber(project.getPromoterDetailsModel().getMobileNo());
		user.setLoginId(generatePostregLoginId(getTotalPostRegUserCount()+1));
		commonDao.updateObject(user);
		System.out.println("user id>>"+user.getUserId());
		project.setProjectUser(user);
		try {
			projectRegistrationService.editProjectRegistration(project);
		} catch (Exception e) {
			e.printStackTrace();
		}

		EnquiryModel em = new EnquiryModel();
		em.setEmailId(user.getEmailId());
		em.setSubject("RERA User Post Registration Credential");
		StringBuffer sb = new StringBuffer();
		sb.append("Dear Promoter ").append(",\n");
		sb.append("Your user account has been successfuly created in rera portal.");
		sb.append("Login ID : ").append(user.getLoginId()).append("\n");
		sb.append("Password : ").append(user.getPassword()).append("\n \n\n\n");
		sb.append("Regards : \n ").append("RERA Karnataka Team");
		System.out.println(sb.toString());
		em.setEnquiryText(sb.toString());
		mailService.sendMail(em);

		/*	if (contactNumber != null ) {
			StringBuffer smsStringBuffer = new StringBuffer();
			smsStringBuffer.append("Dear ").append(user.getUserName()).append(",\n");
			smsStringBuffer.append("RERA User Credential for HelpDesk are \n");
			smsStringBuffer.append("Role : ").append(user.getUserType()).append("\n");
			smsStringBuffer.append("Login ID : ").append(user.getLoginId()).append("\n");
			smsStringBuffer.append("Password : ").append(user.getPassword()).append("\n");
			smsStringBuffer.append("Regards, \n").append("RERA Karnataka Team");
			System.out.println(smsStringBuffer.toString());
			smsService.sendSMS(contactNumber, smsStringBuffer.toString());

		}*/
		mv.addObject("email", email);
		return mv;

	}

	private static String generatePassword() {
		int digit = 0;
		Random rn = new Random();
		StringBuffer sb = new StringBuffer();
		while (digit < 8) {
			sb.append(chars.charAt(rn.nextInt(36)));
			digit++;
		}
		return sb.toString();
	}

	private static String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";

	private String generatePostregLoginId(int postRegUserCount) {
		StringBuffer sb=new StringBuffer("QU");
		String str = "" + postRegUserCount;
		while (str.length() < 6) {
			str = "0" + str;
		}
		sb.append(str);
		System.out.println("generated PostregLoginId is "+sb.toString());
		return sb.toString();
	}

	public Integer getTotalPostRegUserCount() {
		String str = "Select count(u) from  UserModel u  where u.loginId LIKE 'QU%'";
		System.out.println("str >>>"+str);
		Query query = null;
		try {
			query = commonDao.getQuery(str);
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return Integer.parseInt(query.uniqueResult().toString());
	}

	@RequestMapping(value="project/agreeUser")
	public ModelAndView postRegUserAgree(){
		ModelAndView mv=new ModelAndView("project.agree");
		return mv;
	}

	// postRegistartion project details 
	@RequestMapping(value = "project/postRegProjectDetails")
	public ModelAndView postRegProjectDetails() {
		ModelAndView mv = null;
		UserModel user = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
		projectlist = postRegService.getPostRegProjectsByLoginId(user.getLoginId());
		if(projectlist != null) {
			httpSession.setAttribute("pkid", projectlist.get(0).getProjectRegId());
			if (!projectlist.get(0).getProjectDetailsModel().getProjectType().equals("Plotted Development")) {
				mv = new ModelAndView("project.postRegProjectDetails");
				mv.addObject("postRegProjectDetails", projectlist.get(0));
				mv.addObject("projectRegistrationModel", projectlist.get(0));
				DetachedCriteria dtar= DetachedCriteria.forClass(AgentRegistrationModel.class,"ar");
				List<Object> agentModelList = commonDao.getList(dtar);
				mv.addObject("agentModelList",agentModelList);
			}
		}else {
			mv = new ModelAndView("postRegLoginPage");
			mv.addObject("ERROR_MSG", "The Login Id No longer Exist,Kindly Register as new User");
		}
		return mv;
	}

	@RequestMapping(value = "project/updateDocDetails", method = RequestMethod.POST)
	public ModelAndView updateDocDetails(
			@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request, @RequestParam("prospectusOrBrochureDoc") MultipartFile prospectusOrBrochureDoc,
			@RequestParam("advertisementDoc") MultipartFile advertisementDoc) throws Exception {
		ModelAndView mv = null;
		Long pkid = null;
		ProjectRegistrationModel baseObject;
		try {
			log.info("In updateTDRDetails projectId >> "+projectRegistrationModel.getProjectRegId());
			baseObject = postRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			baseObject = postRegService.saveOrUpdateDocDetails(baseObject, request,prospectusOrBrochureDoc,advertisementDoc);
			pkid = postRegService.saveUpdatePostRegistration(baseObject);
			log.info("In updateTDRDetails pkid >>> "+pkid);
			httpSession.setAttribute("pkid", pkid);
			mv = new ModelAndView("redirect:/project/postRegProjectDetails");
		} catch (Exception ex) {
			log.error(ex.getMessage(),ex);
			throw ex;
		}
		return mv;
	}

	/*@RequestMapping(value="project/getTowerDetails")
	public ModelAndView getTowerDetails(@RequestParam(value ="TOWER_ID") Long towerId){
		TowerDetailsModel towerDetailsModel = null;
		ModelAndView mv = null;
		mv=new ModelAndView("project.towerdetails");
		try {
			towerDetailsModel = (TowerDetailsModel)commonDao.getObject(TowerDetailsModel.class,towerId);
			mv.addObject("towerDetailsModel", towerDetailsModel);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return mv;
	}*/

	/*@RequestMapping(value="project/floordetails")
	public ModelAndView floordetails(){
		ProjectRegistrationModel bsModel = null;
		ModelAndView mv = null;
		mv=new ModelAndView("project.floordetails");
		try {
			UserModel user=(UserModel)httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
			bsModel = postRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			if ( bsModel.getProjectDetailsModel().getTowerDetailsList().get(0).getFloorDetailsList() != null && bsModel.getProjectDetailsModel().getTowerDetailsList().get(0).getFloorDetailsList().size() >0) {
				mv.addObject("floorStatus","YES");
			}else {
				mv.addObject("floorStatus", "NO");
			}
			mv.addObject("projectRegistrationModel", bsModel);
			mv.addObject("projectList", postRegService.getPostRegProjectsByLoginId(user.getLoginId()));
			Long noOfFloors=bsModel.getProjectDetailsModel().getTowerDetailsList().get(bsModel.getProjectDetailsModel().getTowerDetailsList().size()-1).getTotNoOfFloor();
			mv.addObject("noOfFloors",noOfFloors);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return mv;
	}*/

	/*@RequestMapping(value="project/eachfloordetails")
	public ModelAndView eachfloorDetails(){
		ProjectRegistrationModel bsModel = null;
		ModelAndView mv=new ModelAndView("project.eachfloordetails");
		try {
			bsModel = postRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			Long noOfFloors=bsModel.getProjectDetailsModel().getTowerDetailsList().get(0).getTotNoOfFloor();
			mv.addObject("noOfFloors",noOfFloors);
			List<FloorDetailsModel> floorList=bsModel.getProjectDetailsModel().getTowerDetailsList().get(0).getFloorDetailsList();
			mv.addObject("floorList",floorList);
			String typeOfTower=bsModel.getProjectDetailsModel().getTowerDetailsList().get(0).getApartmentType();
			mv.addObject("typeOfTower",typeOfTower);
			List<ProjectApartmentDetails> apartmentList=bsModel.getProjectDetailsModel().getTowerDetailsList().get(bsModel.getProjectDetailsModel().getTowerDetailsList().size()-1).getApartmentDetailsList();
			mv.addObject("apartmentList",apartmentList);
			mv.addObject("projectRegistrationModel", bsModel);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return mv;
	}*/

	/*@RequestMapping(value = "project/updateTowerDetails", method = RequestMethod.POST)
	public ModelAndView updateTowerDetails(
			@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = null;
		Long pkid = null;
		ProjectRegistrationModel baseObject;
		try {
			baseObject = postRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			baseObject = postRegService.saveOrUpdateTowerDetails(baseObject, request);
			pkid = postRegService.saveUpdatePostRegistration(baseObject);
			log.info("In updateTowerDetails pkid : >>"+pkid);
			httpSession.setAttribute("pkid", pkid);
			mv = new ModelAndView("redirect:/project/towerdetails");
		} catch (Exception ex) {
			log.error(ex.getMessage(),ex);
			throw ex;
		}
		return mv;
	}*/

	/*@RequestMapping(value = "project/updateNoOfTowers", method = RequestMethod.POST)
	public ModelAndView updateNoOfTowers(HttpServletRequest request) throws Exception {
		ModelAndView mv = null;
		Long pkid = null;
		ProjectRegistrationModel baseObject;
		try {
			baseObject = postRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			//baseObject = postRegService.saveOrUpdateTowerDetails(baseObject, request);
			baseObject.getProjectDetailsModel().setTotalNoOfTowers(Long.parseLong(request.getParameter("totalNoOfTowers")));
			pkid = postRegService.saveUpdatePostRegistration(baseObject);
			httpSession.setAttribute("pkid", pkid);
			mv = new ModelAndView("redirect:/project/towerdetails");
		} catch (Exception ex) {
			log.error(ex.getMessage(),ex);
			throw ex;
		}
		return mv;
	}*/



	/*@RequestMapping(value = "project/updateFloorDetails", method = RequestMethod.POST)
	public ModelAndView updateFloorDetails(
			@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = null;
		Long pkid = null;
		ProjectRegistrationModel baseObject;
		try {
			baseObject = postRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			baseObject = postRegService.saveOrUpdateFloorDetails(baseObject, request);
			pkid = postRegService.saveUpdatePostRegistration(baseObject);
			log.info("In updateTowerDetails pkid : >>"+pkid);
			httpSession.setAttribute("pkid", pkid);
			mv = new ModelAndView("redirect:/project/eachfloordetails");
		} catch (Exception ex) {
			log.error(ex.getMessage(),ex);
			throw ex;
		}
		return mv;
	}*/

	/*	@RequestMapping(value="project/updateEachApartmentDetails")
	public ModelAndView updateEachApartmentDetails(@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = null;
		Long pkid = null;
		ProjectRegistrationModel baseObject;
		try {
			baseObject = postRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			baseObject = postRegService.updateEachApartmentDetails(baseObject, request);
			pkid = postRegService.saveUpdatePostRegistration(baseObject);
			log.info("In updateEachApartmentDetails pkid : >>"+pkid);
			httpSession.setAttribute("pkid", pkid);
			mv = new ModelAndView("redirect:/project/eachfloordetails");
		} catch (Exception ex) {
			log.error(ex.getMessage(),ex);
			throw ex;
		}
		return mv;
	}*/

	@RequestMapping(value="project/towerdetails")
	public ModelAndView towerdetails(){
		ProjectRegistrationModel bsModel = null;
		ModelAndView mv = null;
		mv=new ModelAndView("project.towerdetails");
		try {
			UserModel user=(UserModel)httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
			bsModel = postRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			if ( bsModel.getProjectDetailsModel().getTowerDetailsList()!= null && bsModel.getProjectDetailsModel().getTowerDetailsList().size() >0) {
				if(bsModel.getProjectDetailsModel().getTowerDetailsList().size()>=1) {
					long l=bsModel.getProjectDetailsModel().getTowerDetailsList().get(0).getTotalNoOfTowers();
					int noOfTowers=(int)l;
					mv.addObject("noOfTowers",noOfTowers);
				}
				mv.addObject("towerStatus","YES");
			}else {
				mv.addObject("towerStatus", "NO");
			}
			mv.addObject("projectRegistrationModel", bsModel);
			mv.addObject("projectList", postRegService.getPostRegProjectsByLoginId(user.getLoginId()));
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return mv;
	}
	
	@RequestMapping(value = "project/updateTowerDetails", method = RequestMethod.POST)
	public ModelAndView updateTowerDetails(
			@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = null;
		Long pkid = null;
		ProjectRegistrationModel baseObject;
		try {
			baseObject = postRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			baseObject = postRegService.saveOrUpdateTowerDetails(baseObject, request);
			pkid = postRegService.saveUpdatePostRegistration(baseObject);
			log.info("In updateTowerDetails pkid : >>"+pkid);
			httpSession.setAttribute("pkid", pkid);
			mv = new ModelAndView("redirect:/project/floordetails");
		} catch (Exception ex) {
			log.error(ex.getMessage(),ex);
			throw ex;
		}
		return mv;
	}

	@RequestMapping(value="project/floordetails")
	public ModelAndView floordetails(){
		ProjectRegistrationModel bsModel = null;
		ModelAndView mv = null;
		mv=new ModelAndView("project.floordetails");
		try {
			UserModel user=(UserModel)httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
			bsModel = postRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			if ( bsModel.getProjectDetailsModel().getTowerDetailsList().get(0).getFloorDetailsList() != null && bsModel.getProjectDetailsModel().getTowerDetailsList().get(0).getFloorDetailsList().size() >0) {
				mv.addObject("floorStatus","YES");
			}else {
				mv.addObject("floorStatus", "NO");
			}
			mv.addObject("projectRegistrationModel", bsModel);
			mv.addObject("projectList", postRegService.getPostRegProjectsByLoginId(user.getLoginId()));
			Long noOfFloors=bsModel.getProjectDetailsModel().getTowerDetailsList().get(bsModel.getProjectDetailsModel().getTowerDetailsList().size()-1).getTotNoOfFloor();
			mv.addObject("noOfFloors",noOfFloors);
			List<FloorDetailsModel> floorList=bsModel.getProjectDetailsModel().getTowerDetailsList().get(bsModel.getProjectDetailsModel().getTowerDetailsList().size()-1).getFloorDetailsList();
			mv.addObject("floorList",floorList);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return mv;
	}

	@RequestMapping(value = "project/updateFloorDetails", method = RequestMethod.POST)
	public ModelAndView updateFloorDetails(
			@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = null;
		Long pkid = null;
		ProjectRegistrationModel baseObject;
		try {
			baseObject = postRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			baseObject = postRegService.saveOrUpdateFloorDetails(baseObject, request);
			pkid = postRegService.saveUpdatePostRegistration(baseObject);
			log.info("In updateTowerDetails pkid : >>"+pkid);
			httpSession.setAttribute("pkid", pkid);
			mv = new ModelAndView("redirect:/project/floordetails");
		} catch (Exception ex) {
			log.error(ex.getMessage(),ex);
			throw ex;
		}
		return mv;
	}

	@RequestMapping(value = "project/DownloadTowerDetailsExcel")
	public ModelAndView DownloadTowerDetailsExcel(@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request,HttpServletResponse response) throws Exception {
		ModelAndView mv = null;
		Long pkid = null;
		ProjectRegistrationModel baseObject;
		try {
			baseObject = postRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			baseObject = postRegService.DownloadTowerDetailsExcel(baseObject, request,response);
			pkid = postRegService.saveUpdatePostRegistration(baseObject);
			httpSession.setAttribute("pkid", pkid);
			mv = new ModelAndView("redirect:/project/towerdetails");
		} catch (Exception ex) {
			log.error(ex.getMessage(),ex);
			throw ex;
		}
		return mv;
	}

	@RequestMapping(value = "project/uploadExcel", method = RequestMethod.POST)
	public ModelAndView uploadExcel(
			@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request,HttpServletResponse response, @RequestParam("unitdetailsExcelFile") MultipartFile unitdetailsExcelFile) throws Exception {
		ModelAndView mv = null;
		Long pkid = null;
		ProjectRegistrationModel baseObject;
		try {
			baseObject = postRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));

			baseObject = postRegService.saveOrUploadExcel(baseObject, request,response,unitdetailsExcelFile);
			/*if(baseObject == null) {
				mv = new ModelAndView("towerdetails");
    			mv.addObject("ERROR_MSG", "Please give the correct Unit Type and other Details  ");
    			return mv;
			}*/
			pkid = postRegService.saveUpdatePostRegistration(baseObject);
			httpSession.setAttribute("pkid", pkid);
			mv = new ModelAndView("redirect:/project/towerdetails");
		} catch (Exception ex) {
			log.error(ex.getMessage(),ex);
			throw ex;
		}
		return mv;
	}

	//ProjectScheduling Details for Default projects 
	@RequestMapping(value="project/projectSchedule")
	public ModelAndView projectSchedule(){
		ProjectRegistrationModel bsModel = null;
		ModelAndView mv = null;
		mv=new ModelAndView("project.projectschedule");
		try {
			//log.info("in projectSchedule method>> id "+Long.parseLong(httpSession.getAttribute("pkid").toString()));
			bsModel = postRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			UserModel user=(UserModel)httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
			if ( bsModel.getProjectDetailsModel().getProjectScheduleModel() != null) {
				mv.addObject("projectWorkModelStatus","YES");
			}else {
				mv.addObject("projectWorkModelStatus", "NO");
			}
			mv.addObject("projectRegistrationModel", bsModel);
			mv.addObject("projectList", postRegService.getPostRegProjectsByLoginId(user.getLoginId()));
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return mv;
	}

	@RequestMapping(value = "project/updateProjectScheduleDetails", method = RequestMethod.POST)
	public ModelAndView updateProjectScheduleDetails(
			@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = null;
		Long pkid = null;
		ProjectRegistrationModel baseObject;
		try {
			baseObject = postRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			baseObject = postRegService.saveProjScheduleDetails(baseObject, request);
			pkid = postRegService.saveUpdatePostRegistration(baseObject);
			log.info("In updateProjectScheduleDetails pkid >>"+pkid);
			httpSession.setAttribute("pkid", pkid);
			mv = new ModelAndView("redirect:/project/projectSchedule");
		} catch (Exception ex) {
			log.error(ex.getMessage(),ex);
			throw ex;
		}
		return mv;
	}

	@RequestMapping(value = "project/updateSuperStructureDetails", method = RequestMethod.POST)
	public ModelAndView updateSuperStructureDetails(
			@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = null;
		Long pkid = null;
		ProjectRegistrationModel baseObject;
		try {
			baseObject = postRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			baseObject = postRegService.saveSuperStructureDetails(baseObject, request);
			pkid = postRegService.saveUpdatePostRegistration(baseObject);
			log.info("In updateProjectScheduleDetails pkid >>"+pkid);
			httpSession.setAttribute("pkid", pkid);
			mv = new ModelAndView("redirect:/project/projectSchedule");
		} catch (Exception ex) {
			log.error(ex.getMessage(),ex);
			throw ex;
		}
		return mv;
	}

	@RequestMapping(value = "project/updateFinInteriorDetails", method = RequestMethod.POST)
	public ModelAndView updateFinInteriorDetails(
			@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = null;
		Long pkid = null;
		ProjectRegistrationModel baseObject;
		try {
			baseObject = postRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			baseObject = postRegService.saveFinInteriorDetails(baseObject, request);
			pkid = postRegService.saveUpdatePostRegistration(baseObject);
			log.info("In updateProjectScheduleDetails pkid >>"+pkid);
			httpSession.setAttribute("pkid", pkid);
			mv = new ModelAndView("redirect:/project/projectSchedule");
		} catch (Exception ex) {
			log.error(ex.getMessage(),ex);
			throw ex;
		}
		return mv;
	}

	@RequestMapping(value = "project/updateMasonaryDetails", method = RequestMethod.POST)
	public ModelAndView updateMasonaryDetails(
			@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = null;
		Long pkid = null;
		ProjectRegistrationModel baseObject;
		try {
			baseObject = postRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			baseObject = postRegService.saveMasonaryDetails(baseObject, request);
			pkid = postRegService.saveUpdatePostRegistration(baseObject);
			log.info("In updateProjectScheduleDetails pkid >>"+pkid);
			httpSession.setAttribute("pkid", pkid);
			mv = new ModelAndView("redirect:/project/projectSchedule");
		} catch (Exception ex) {
			log.error(ex.getMessage(),ex);
			throw ex;
		}
		return mv;
	}

	@RequestMapping(value = "project/updateExternalInfrastructureDetails", method = RequestMethod.POST)
	public ModelAndView updateExternalInfrastructureDetails(
			@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = null;
		Long pkid = null;
		ProjectRegistrationModel baseObject;
		try {
			baseObject = postRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			baseObject = postRegService.saveExternalInfraDetails(baseObject, request);
			pkid = postRegService.saveUpdatePostRegistration(baseObject);
			log.info("In updateProjectScheduleDetails pkid >>"+pkid);
			httpSession.setAttribute("pkid", pkid);
			mv = new ModelAndView("redirect:/project/projectSchedule");
		} catch (Exception ex) {
			log.error(ex.getMessage(),ex);
			throw ex;
		}
		return mv;
	}

	@RequestMapping(value = "project/updateInternalInfrastructureDetails", method = RequestMethod.POST)
	public ModelAndView updateInternalInfrastructureDetails(
			@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = null;
		Long pkid = null;
		ProjectRegistrationModel baseObject;
		try {
			baseObject = postRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			baseObject = postRegService.saveInternalInfraDetails(baseObject, request);
			pkid = postRegService.saveUpdatePostRegistration(baseObject);
			log.info("In updateProjectScheduleDetails pkid >>"+pkid);
			httpSession.setAttribute("pkid", pkid);
			mv = new ModelAndView("redirect:/project/projectSchedule");
		} catch (Exception ex) {
			log.error(ex.getMessage(),ex);
			throw ex;
		}
		return mv;
	}

	@RequestMapping(value = "project/updateAmenityDetails", method = RequestMethod.POST)
	public ModelAndView updateAmenityDetails(
			@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = null;
		Long pkid = null;
		ProjectRegistrationModel baseObject;
		try {
			baseObject = postRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			baseObject = postRegService.saveAmenityDetails(baseObject, request);
			pkid = postRegService.saveUpdatePostRegistration(baseObject);
			log.info("In updateProjectScheduleDetails pkid >>"+pkid);
			httpSession.setAttribute("pkid", pkid);
			mv = new ModelAndView("redirect:/project/projectSchedule");
		} catch (Exception ex) {
			log.error(ex.getMessage(),ex);
			throw ex;
		}
		return mv;
	}

	@RequestMapping(value = "project/updateCommonDetails", method = RequestMethod.POST)
	public ModelAndView updateCommonDetails(
			@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = null;
		Long pkid = null;
		ProjectRegistrationModel baseObject;
		try {
			baseObject = postRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			baseObject = postRegService.saveCommonDetailsDetails(baseObject, request);
			pkid = postRegService.saveUpdatePostRegistration(baseObject);
			log.info("In updateProjectScheduleDetails pkid >>"+pkid);
			httpSession.setAttribute("pkid", pkid);
			mv = new ModelAndView("redirect:/project/projectSchedule");
		} catch (Exception ex) {
			log.error(ex.getMessage(),ex);
			throw ex;
		}
		return mv;
	}

	// LandCost Details
	@RequestMapping(value="project/landCostDetails")
	public ModelAndView landCostDetails(){
		ProjectRegistrationModel bsModel = null;
		ModelAndView mv = null;
		mv=new ModelAndView("project.landCostDetails");
		try {
			log.info("in landCostDetails method ProjectId >> "+Long.parseLong(httpSession.getAttribute("pkid").toString()));
			bsModel = postRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			UserModel user=(UserModel)httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
			if ( bsModel.getProjectDetailsModel().getLandCostDetailsModel() != null) {
				if(bsModel.getProjectDetailsModel().getLandCostDetailsModel().getLandAcquisitionCostModel() != null) {
					mv.addObject("landCostDetailsModelStatus","YES");
					mv.addObject("numberOfPromoters",bsModel.getProjectDetailsModel().getLandCostDetailsModel().getLandAcquisitionCostModel().getNumberOfPromoters());
					mv.addObject("numberOfLandowners",bsModel.getProjectDetailsModel().getLandCostDetailsModel().getLandAcquisitionCostModel().getNumberOfLandowners());
				}else {
					mv.addObject("landCostDetailsModelStatus", "NO");	
				}
				if(bsModel.getProjectDetailsModel().getLandCostDetailsModel().getLandAcquisitionCostModel().getProjectJDADetailsModel() == null) {
					mv.addObject("JDAStatus", "YES");
				}
				if(bsModel.getProjectDetailsModel().getLandCostDetailsModel().getTransferDevRightsDetailsModel() != null) {
					mv.addObject("TDRModelStatus","YES");
				}else {
					mv.addObject("TDRModelStatus", "NO");
				}
				/*
				if(bsModel.getProjectDetailsModel().getLandCostDetailsModel().getApprovalCostDetailsModel() != null) {
					mv.addObject("approvalCostStatus","YES");
				}else {
					mv.addObject("approvalCostStatus", "NO");
				}*/
			}else {
				mv.addObject("landCostDetailsModelStatus", "NO");
				mv.addObject("TDRModelStatus", "NO");
				mv.addObject("approvalCostStatus", "NO");
			}
			mv.addObject("projectRegistrationModel", bsModel);

			mv.addObject("projectList", postRegService.getPostRegProjectsByLoginId(user.getLoginId()));
			log.info(" === END landCostDetails === ");
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return mv;
	}

	@RequestMapping(value = "project/updateLandAcquisitionCostDetails", method = RequestMethod.POST)
	public ModelAndView updateLandAcquisitionCostDetails(
			@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = null;
		Long pkid = null;
		ProjectRegistrationModel baseObject;
		try {
			log.info("In updateLandAcquisitionCostDetails projectId >> "+projectRegistrationModel.getProjectRegId());
			baseObject = postRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			baseObject = postRegService.saveOrUpdateLandAcquiCostDetails(baseObject, request);
			pkid = postRegService.saveUpdatePostRegistration(baseObject);
			log.info("In updateLandAcquisitionCostDetails pkid >> "+pkid);
			httpSession.setAttribute("pkid", pkid);
			mv = new ModelAndView("redirect:/project/landCostDetails");
		} catch (Exception ex) {
			log.error(ex.getMessage(),ex);
			throw ex;
		}
		return mv;
	}

	@RequestMapping(value = "project/updateLandAcquisitionJDADetails", method = RequestMethod.POST)
	public ModelAndView updateLandAcquisitionJDADetails(
			@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = null;
		Long pkid = null;
		ProjectRegistrationModel baseObject;
		try {
			log.info("In updateLandAcquisitionCostDetails projectId >> "+projectRegistrationModel.getProjectRegId());
			baseObject = postRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			baseObject = postRegService.saveOrUpdateLandJDADetails(baseObject, request);
			pkid = postRegService.saveUpdatePostRegistration(baseObject);
			log.info("In updateLandAcquisitionCostDetails pkid >> "+pkid);
			httpSession.setAttribute("pkid", pkid);
			mv = new ModelAndView("redirect:/project/landCostDetails");
		} catch (Exception ex) {
			log.error(ex.getMessage(),ex);
			throw ex;
		}
		return mv;
	}

	@RequestMapping(value = "project/updateTDRDetails", method = RequestMethod.POST)
	public ModelAndView updateTDRDetails(
			@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request, @RequestParam("certFromChartedAcc") MultipartFile[] certFromChartedAccFile,
			@RequestParam("tdrPurchaseOrSaleDoc") MultipartFile tdrPurchaseOrSaleDoc) throws Exception {
		ModelAndView mv = null;
		Long pkid = null;
		ProjectRegistrationModel baseObject;
		try {
			log.info("In updateTDRDetails projectId >> "+projectRegistrationModel.getProjectRegId());
			baseObject = postRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			baseObject = postRegService.saveOrUpdateTDRDetails(baseObject, request,certFromChartedAccFile,tdrPurchaseOrSaleDoc);
			log.info("baseObject >"+baseObject.getProjectDetailsModel().getLandCostDetailsModel().getLandCostDetailsId());
			pkid = postRegService.saveUpdatePostRegistration(baseObject);
			log.info("In updateTDRDetails pkid >>> "+pkid);
			httpSession.setAttribute("pkid", pkid);
			mv = new ModelAndView("redirect:/project/landCostDetails");
		} catch (Exception ex) {
			log.error(ex.getMessage(),ex);
			throw ex;
		}
		return mv;
	}

	//updateApprovalCostDetails
	@RequestMapping(value = "project/updateApprovalCostDetails", method = RequestMethod.POST)
	public ModelAndView updateApprovalCostDetails(
			@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request, @RequestParam("certFromChartedAcc") MultipartFile[] certFromChartedAccFile) throws Exception {
		ModelAndView mv = null;
		Long pkid = null;
		ProjectRegistrationModel baseObject;
		try {
			log.info("In updateApprovalCostDetails method prijectId >> "+projectRegistrationModel.getProjectRegId());
			baseObject = postRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			baseObject = postRegService.saveOrUpdateApprovalCostDetails(baseObject, request,certFromChartedAccFile);
			pkid = postRegService.saveUpdatePostRegistration(baseObject);
			log.info("In updateApprovalCostDetails method : >>"+pkid);
			httpSession.setAttribute("pkid", pkid);
			mv = new ModelAndView("redirect:/project/landCostDetails");
		} catch (Exception ex) {
			log.error(ex.getMessage(),ex);
			throw ex;
		}
		return mv;
	}

	@RequestMapping(value="project/constructionCostDetails")
	public ModelAndView constructionCostDetails(){
		ProjectRegistrationModel bsModel = null;
		ModelAndView mv = null;
		mv=new ModelAndView("project.constructionCostDetails");
		try {
			//	log.info("in constructionCostDetails.. id "+Long.parseLong(httpSession.getAttribute("pkid").toString()));
			bsModel = postRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			UserModel user=(UserModel)httpSession.getAttribute(ReraConstants.SES_USER_ATTR);


			mv.addObject("projectRegistrationModel", bsModel);
			mv.addObject("projectList", postRegService.getPostRegProjectsByLoginId(user.getLoginId()));
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return mv;
	}

	@RequestMapping(value = "project/updateConstructionCostDetails", method = RequestMethod.POST)
	public ModelAndView updateConstructionCostDetails( @ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request,@RequestParam("certFromChartedAcc") MultipartFile certFromChartedAcc , @RequestParam("certificateIssuedByStructuralEng") MultipartFile certificateIssuedByStructuralEng ,
			@RequestParam("certificateIssuedByArchitect") MultipartFile certificateIssuedByArchitect) throws Exception {
		ModelAndView mv = null;
		Long pkid = null;
		ProjectRegistrationModel baseObject;
		try {
			log.info("In updateConstructionCostDetails projectId >> "+projectRegistrationModel.getProjectRegId());
			baseObject = postRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			baseObject = postRegService.saveOrUpdateConstructionCostDetails(baseObject, request,certFromChartedAcc,certificateIssuedByStructuralEng,
					certificateIssuedByArchitect);
			pkid = postRegService.saveUpdatePostRegistration(baseObject);
			log.info("In updateConstructionCostDetails pkid : >>"+pkid);
			httpSession.setAttribute("pkid", pkid);
			mv = new ModelAndView("redirect:/project/constructionCostDetails");
		} catch (Exception ex) {
			log.error(ex.getMessage(),ex);
			throw ex;
		}
		return mv;
	}

	@RequestMapping(value="project/projectSummaryDetails")
	public ModelAndView projectSummaryDetails(){
		ProjectRegistrationModel bsModel = null;
		ModelAndView mv = null;
		mv=new ModelAndView("project.projectSummaryDetails");
		try {
			log.info("in projectSummaryDetails.. id "+Long.parseLong(httpSession.getAttribute("pkid").toString()));
			bsModel = postRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			UserModel user=(UserModel)httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
			if ( bsModel.getProjectDetailsModel().getProjectSummary() != null) {
				mv.addObject("projectSummaryStatus","YES");
			}else {
				mv.addObject("projectSummaryStatus", "NO");
			}
			mv.addObject("projectRegistrationModel", bsModel);
			mv.addObject("projectList", postRegService.getPostRegProjectsByLoginId(user.getLoginId()));
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return mv;
	}

	@RequestMapping(value = "project/updateProjectSummaryDetails", method = RequestMethod.POST)
	public ModelAndView updateProjectSummaryDetails(
			@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = null;
		Long pkid = null;
		ProjectRegistrationModel baseObject;
		try {
			log.info("In updateProjectSummaryDetails projectId >> "+projectRegistrationModel.getProjectRegId());
			baseObject = postRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			baseObject = postRegService.updateProjectSummaryDetails(baseObject, request);
			pkid = postRegService.saveUpdatePostRegistration(baseObject);
			log.info("In updateConstructionCostDetails pkid : >>"+pkid);
			httpSession.setAttribute("pkid", pkid);
			mv = new ModelAndView("redirect:/project/projectSummaryDetails");
		} catch (Exception ex) {
			log.error(ex.getMessage(),ex);
			throw ex;
		}
		return mv;
	}

	@RequestMapping(value="project/finalApprovalDetails")
	public ModelAndView finalApprovalDetails(){
		ProjectRegistrationModel bsModel = null;
		ModelAndView mv = null;
		mv=new ModelAndView("project.finalApprovalDetails");
		try {
			UserModel user=(UserModel)httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
			bsModel = postRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			if ( bsModel.getProjectDetailsModel().getFinalApproval() != null && bsModel.getProjectDetailsModel().getFinalApproval().size() >0) {
				mv.addObject("finalApprovalStatus","YES");
			}else {
				mv.addObject("finalApprovalStatus", "NO");
			}
			mv.addObject("projectRegistrationModel", bsModel);
			mv.addObject("projectList", postRegService.getPostRegProjectsByLoginId(user.getLoginId()));
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return mv;
	}

	@RequestMapping(value = "project/updateFinalApprovalDetails", method = RequestMethod.POST)
	public ModelAndView updateFinalApprovalDetails(
			@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request,@RequestParam(value="uploadDoc") MultipartFile[] uploadDoc ) throws Exception {
		ModelAndView mv = null;
		Long pkid = null;
		ProjectRegistrationModel baseObject;
		try {
			baseObject = postRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			baseObject = postRegService.updateFinalApprovalDetails(baseObject, request,uploadDoc);
			pkid = postRegService.saveUpdatePostRegistration(baseObject);
			log.info("In updateFinalApprovalDetails pkid : >>"+pkid);
			httpSession.setAttribute("pkid", pkid);
			mv = new ModelAndView("redirect:/project/finalApprovalDetails");
		} catch (Exception ex) {
			log.error(ex.getMessage(),ex);
			throw ex;
		}
		return mv;
	}

	@RequestMapping(value="project/projectViewSummry")
	public ModelAndView projectViewSummry(){
		ProjectRegistrationModel baseObject = null;
		ModelAndView mv = null;
		
		try {
			baseObject = postRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));

			if (baseObject.getRegistrationType().equalsIgnoreCase(ReraConstants.INDVISUAL_REG)) {
				mv = new ModelAndView("project.viewSummary");
			} else {
				mv = new ModelAndView("project.viewSummary");
			}
			/*UserModel user=(UserModel)httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
			String mobileNo = null;
			mobileNo = baseObject.getPromoterDetailsModel().getMobileNo();
			log.info("mobileNo::::" + mobileNo);
			EnquiryModel em = new EnquiryModel();
			em.setEmailId(baseObject.getPromoterDetailsModel().getMobileNo());
			em.setSubject("Post Registration & Quarterly Updation successfully submitted");
			StringBuffer sb = new StringBuffer();
			sb.append("Dear Promoter ").append(",\n");
			sb.append(" Post Registration & Quarterly Updation is Successfully Submitted").append("\n\n\n");
			sb.append("Regards : \n ").append("RERA Karnataka Team");
			System.out.println(sb.toString());
			em.setEnquiryText(sb.toString());
			mailService.sendMail(em);*/
			
			String projectRegNo = baseObject.getProjectRegistrationNo();
			mv.addObject("projectRegNo", projectRegNo);
			
			ProjectDetailsModel projectDetails = baseObject.getProjectDetailsModel();
			mv.addObject("projectDetails", projectDetails);
			
			
			TowerDetailsModel tdm = null;
			List<TowerDetailsModel> towerDetailsList = baseObject.getProjectDetailsModel().getTowerDetailsList() != null
					&& baseObject.getProjectDetailsModel().getTowerDetailsList().size() != 0
							? baseObject.getProjectDetailsModel().getTowerDetailsList()
							: null;
			mv.addObject("towerDetailsList", towerDetailsList);
			LandCostDetailsModel lcdm = baseObject.getProjectDetailsModel().getLandCostDetailsModel();
			mv.addObject("lcdm", lcdm);

			ConstructionCostmodel constructionCostmodel = baseObject.getProjectDetailsModel().getConstructionCostModel();
			mv.addObject("constructionCostmodel", constructionCostmodel);
			
			ApprovalCostModel approvalCostModel=baseObject.getProjectDetailsModel().getLandCostDetailsModel().getApprovalCostModel();
			mv.addObject("approvalCostModel", approvalCostModel);
			
			
			
			ProjectScheduleModel projectScheduleModel = baseObject.getProjectDetailsModel().getProjectScheduleModel();
			mv.addObject("projectScheduleModel", projectScheduleModel);
			mv.addObject("project", baseObject);
			
		
			
		}catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return mv;
		
	}

}
