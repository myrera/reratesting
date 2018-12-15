package in.gov.rera.transaction.postregistration.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
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
import in.gov.rera.transaction.postregistration.plots.model.PlotScheduleModel;
import in.gov.rera.transaction.postregistration.plots.model.PlotsConstructionCostmodel;
import in.gov.rera.transaction.postregistration.plots.model.PlotsDetailsModel;
import in.gov.rera.transaction.postregistration.plots.model.PlotsLandCostDetailsModel;
import in.gov.rera.transaction.postregistration.service.IPlotRegService;
import in.gov.rera.transaction.projectregistration.model.ProjectDetailsModel;
import in.gov.rera.transaction.projectregistration.model.ProjectRegistrationModel;
import in.gov.rera.transaction.projectregistration.service.IProjectRegistrationService;


@Controller("PlotsController")
@Scope("request")
public class PlotsController {

	static Logger log= Logger.getLogger(PlotsController.class);

	@Autowired
	HttpSession httpSession;

	@Autowired
	IPlotRegService plotRegService;

	@Autowired
	CommonDao<Object, Long> commonDao;

	@Autowired
	MailService mailService;

	@Autowired
	IProjectRegistrationService projectRegistrationService;

	private List<ProjectRegistrationModel> plotlist;

	@RequestMapping(value="plot/agreeUser")
	public ModelAndView postRegPlotUserAgree(){
		ModelAndView mv=new ModelAndView("plot.agree");
		return mv;
	}

	@RequestMapping(value = "plot/postRegProjectDetails")
	public ModelAndView postRegProjectPlotDetails() {
		ModelAndView mv = null;
		UserModel user = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
		plotlist = plotRegService.getPostRegProjectsByLoginId(user.getLoginId());
		if(plotlist != null) {
			httpSession.setAttribute("pkid", plotlist.get(0).getProjectRegId());
			if (plotlist.get(0).getProjectDetailsModel().getProjectType().equals("Plotted Development")) {
				mv = new ModelAndView("plot.plottedProjectDetails");
			}
			mv.addObject("postRegProjectDetails", plotlist.get(0));
			mv.addObject("projectRegistrationModel", plotlist.get(0));
		}else {
			mv = new ModelAndView("postRegLoginPage");
			mv.addObject("ERROR_MSG", "The Login Id No longer Exist,Kindly Register as new User");
		}
		return mv;
	}

	@RequestMapping(value = "plot/updatePlotDocDetails", method = RequestMethod.POST)
	public ModelAndView updatePlotDocDetails(
			@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request, @RequestParam("prospectusOrBrochureDoc") MultipartFile prospectusOrBrochureDoc,
			@RequestParam("advertisementDoc") MultipartFile advertisementDoc) throws Exception {
		ModelAndView mv = null;
		Long pkid = null;
		ProjectRegistrationModel baseObject;
		try {
			log.info("In updateTDRDetails projectId >> "+projectRegistrationModel.getProjectRegId());
			baseObject = plotRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			baseObject = plotRegService.saveOrUpdateDocDetails(baseObject, request,prospectusOrBrochureDoc,advertisementDoc);
			pkid = plotRegService.saveUpdatePostRegistration(baseObject);
			log.info("In updateTDRDetails pkid >>> "+pkid);
			httpSession.setAttribute("pkid", pkid);
			mv = new ModelAndView("redirect:/plot/postRegProjectDetails");
		} catch (Exception ex) {
			log.error(ex.getMessage(),ex);
			throw ex;
		}
		return mv;
	}

	@RequestMapping(value="plot/plotDetails")
	public ModelAndView plotDetails(){
		ProjectRegistrationModel bsModel = null;
		ModelAndView mv=null;
		mv=new ModelAndView("plot.plotDetails");
		try {
			UserModel user=(UserModel)httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
			bsModel = plotRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			if ( bsModel.getProjectDetailsModel().getPlotDetailsList()!= null && bsModel.getProjectDetailsModel().getPlotDetailsList().size() >0) {
				mv.addObject("plotStatus","YES");
				PlotsDetailsModel plotDetailModel= bsModel.getProjectDetailsModel().getPlotDetailsList().get(0);
				mv.addObject("plotDetailModel",plotDetailModel);
			}else {
				mv.addObject("plotStatus", "NO");
			}
			mv.addObject("projectRegistrationModel", bsModel);
			mv.addObject("projectList", plotRegService.getPostRegProjectsByLoginId(user.getLoginId()));
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return mv;
	}

	@RequestMapping(value="plot/updatePlotDetails")
	public ModelAndView updatePlotDetails(@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = null;
		Long pkid = null;
		ProjectRegistrationModel baseObject;
		try {
			baseObject = plotRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			baseObject = plotRegService.saveOrUpdatePlotDetails(baseObject, request);
			pkid = plotRegService.saveUpdatePostRegistration(baseObject);
			log.info("In updatePlotDetails pkid : >>"+pkid);
			httpSession.setAttribute("pkid", pkid);
			mv = new ModelAndView("redirect:/plot/plotDetails");
		} catch (Exception ex) {
			log.error(ex.getMessage(),ex);
			throw ex;
		}
		return mv;
	}

	@RequestMapping(value="plot/plotScheduleDetails")
	public ModelAndView plotScheduleDetails(){
		ProjectRegistrationModel bsModel = null;
		ModelAndView mv = null;
		mv=new ModelAndView("plot.plotScheduleDetails");
		try {
			UserModel user=(UserModel)httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
			bsModel = plotRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			mv.addObject("projectRegistrationModel", bsModel);
			mv.addObject("projectList", plotRegService.getPostRegProjectsByLoginId(user.getLoginId()));
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return mv;
	}

	@RequestMapping(value = "plot/updatePlotScheduleDetails", method = RequestMethod.POST)
	public ModelAndView updatePlotScheduleDetails(
			@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = null;
		Long pkid = null;
		ProjectRegistrationModel baseObject;
		try {
			log.info(" In updatePlotScheduleDetails method ProjectId >> "+projectRegistrationModel.getProjectRegId());
			baseObject = plotRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			baseObject = plotRegService.savePlotScheduleCivilWorkDetails(baseObject, request);
			pkid = plotRegService.saveUpdatePostRegistration(baseObject);
			log.info("In savePlotScheduleCivilWorkDetails pkid >>"+pkid);
			httpSession.setAttribute("pkid", pkid);
			mv = new ModelAndView("redirect:/plot/plotScheduleDetails");
		} catch (Exception ex) {
			log.error(ex.getMessage(),ex);
			throw ex;
		}
		return mv;
	}

	// common area purchaser
	@RequestMapping(value = "plot/updatePlotScheduleCommonAreasPurchaserDetails", method = RequestMethod.POST)
	public ModelAndView updatePlotScheduleCommonAreasToBeUsedByPurchaserDetails(
			@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = null;
		Long pkid = null;
		ProjectRegistrationModel baseObject;
		try {
			log.info(" In updatePlotScheduleDetails method ProjectId >> "+projectRegistrationModel.getProjectRegId());
			baseObject = plotRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			baseObject = plotRegService.saveOrUpdatePlotScheduleCommonAreasPurchaserDetails(baseObject, request);
			pkid = plotRegService.saveUpdatePostRegistration(baseObject);
			log.info("In updateProjectScheduleDetails pkid >>"+pkid);
			httpSession.setAttribute("pkid", pkid);
			mv = new ModelAndView("redirect:/plot/plotScheduleDetails");
		} catch (Exception ex) {
			log.error(ex.getMessage(),ex);
			throw ex;
		}
		return mv;
	}

	//  Common Areas To be Relinquished to local Authority /Planning Authority
	@RequestMapping(value = "plot/updatePlotScheduleCommonAreasAuthorityDetails", method = RequestMethod.POST)
	public ModelAndView updatePlotScheduleCommonAreasRelinquishedToLocalAuthorityDetails(
			@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = null;
		Long pkid = null;
		ProjectRegistrationModel baseObject;
		try {
			log.info(" In updatePlotScheduleDetails method ProjectId >> "+projectRegistrationModel.getProjectRegId());
			baseObject = plotRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			baseObject = plotRegService.saveOrUpdatePlotScheduleCommonAreasAuthorityDetails(baseObject, request);
			pkid = plotRegService.saveUpdatePostRegistration(baseObject);
			log.info("In updateProjectScheduleDetails pkid >>"+pkid);
			httpSession.setAttribute("pkid", pkid);
			mv = new ModelAndView("redirect:/plot/plotScheduleDetails");
		} catch (Exception ex) {
			log.error(ex.getMessage(),ex);
			throw ex;
		}
		return mv;
	}

	@RequestMapping(value="plot/plotCostDetails")
	public ModelAndView plotCostDetails(){
		ProjectRegistrationModel bsModel = null;
		ModelAndView mv = null;
		mv=new ModelAndView("plot.plotCostDetails");
		try {
			UserModel user=(UserModel)httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
			bsModel = plotRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			if ( bsModel.getProjectDetailsModel().getPlotLandCostDetailsModel() != null) {
				if(bsModel.getProjectDetailsModel().getPlotLandCostDetailsModel().getPlotLandAcquisitionCostModel() != null) {
					mv.addObject("numberOfPromoters",bsModel.getProjectDetailsModel().getPlotLandCostDetailsModel().getPlotLandAcquisitionCostModel().getNumberOfPromoters());
					mv.addObject("numberOfLandowners",bsModel.getProjectDetailsModel().getPlotLandCostDetailsModel().getPlotLandAcquisitionCostModel().getNumberOfLandowners());

					if(bsModel.getProjectDetailsModel().getPlotLandCostDetailsModel().getPlotLandAcquisitionCostModel().getProjectJDADetailsModel() == null) {
						mv.addObject("JDAStatus", "YES");
					}
				}
			}
			mv.addObject("projectRegistrationModel", bsModel);
			mv.addObject("projectList", plotRegService.getPostRegProjectsByLoginId(user.getLoginId()));
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return mv;
	}

	@RequestMapping(value = "plot/updateplotCostDetails", method = RequestMethod.POST)
	public ModelAndView updateplotCostDetails(
			@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = null;
		Long pkid = null;
		ProjectRegistrationModel baseObject;
		try {
			log.info("In updateLandAcquisitionCostDetails projectId >> "+projectRegistrationModel.getProjectRegId());
			baseObject = plotRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			baseObject = plotRegService.saveOrUpdatePlotCostDetails(baseObject, request);
			pkid = plotRegService.saveUpdatePostRegistration(baseObject);
			log.info("In updateLandAcquisitionCostDetails pkid >> "+pkid);
			httpSession.setAttribute("pkid", pkid);
			mv = new ModelAndView("redirect:/plot/plotCostDetails");
		} catch (Exception ex) {
			log.error(ex.getMessage(),ex);
			throw ex;
		}
		return mv;
	}

	@RequestMapping(value = "plot/updatePlotAcquisitionJDADetails", method = RequestMethod.POST)
	public ModelAndView updatePlotAcquisitionJDADetails(
			@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = null;
		Long pkid = null;
		ProjectRegistrationModel baseObject;
		try {
			log.info("In updateLandAcquisitionCostDetails projectId >> "+projectRegistrationModel.getProjectRegId());
			baseObject = plotRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			baseObject = plotRegService.saveOrUpdatePlotJDADetails(baseObject, request);
			pkid = plotRegService.saveUpdatePostRegistration(baseObject);
			log.info("In updateLandAcquisitionCostDetails pkid >> "+pkid);
			httpSession.setAttribute("pkid", pkid);
			mv = new ModelAndView("redirect:/plot/plotCostDetails");
		} catch (Exception ex) {
			log.error(ex.getMessage(),ex);
			throw ex;
		}
		return mv;
	}

	@RequestMapping(value = "plot/updatePlotApprovalCostDetails", method = RequestMethod.POST)
	public ModelAndView updatePlotApprovalCostDetails(
			@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request, @RequestParam("certFromChartedAcc") MultipartFile[] certFromChartedAccFile) throws Exception {
		ModelAndView mv = null;
		Long pkid = null;
		ProjectRegistrationModel baseObject;
		try {
			log.info("In updateApprovalCostDetails method prijectId >> "+projectRegistrationModel.getProjectRegId());
			baseObject = plotRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			baseObject = plotRegService.saveOrUpdatePlotApprovalCostDetails(baseObject, request,certFromChartedAccFile);
			pkid = plotRegService.saveUpdatePostRegistration(baseObject);
			log.info("In updateApprovalCostDetails method : >>"+pkid);
			httpSession.setAttribute("pkid", pkid);
			mv = new ModelAndView("redirect:/plot/plotCostDetails");
		} catch (Exception ex) {
			log.error(ex.getMessage(),ex);
			throw ex;
		}
		return mv;
	}

	@RequestMapping(value="plot/plotConstructionCostDetails")
	public ModelAndView plotConstructionCostDetails(){
		ProjectRegistrationModel bsModel = null;
		ModelAndView mv = null;
		mv=new ModelAndView("plot.plotConstructionCostDetails");
		try {
			UserModel user=(UserModel)httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
			bsModel = plotRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			mv.addObject("projectRegistrationModel", bsModel);
			mv.addObject("projectList", plotRegService.getPostRegProjectsByLoginId(user.getLoginId()));
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return mv;
	}

	@RequestMapping(value = "plot/updatePlotConstructionCostDetails", method = RequestMethod.POST)
	public ModelAndView updatePlotConstructionCostDetails(  @ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request,@RequestParam("certFromChartedAcc") MultipartFile certFromChartedAcc , @RequestParam("certificateIssuedByStructuralEng") MultipartFile certificateIssuedByStructuralEng ,
			@RequestParam("certificateIssuedByArchitect") MultipartFile certificateIssuedByArchitect) throws Exception {
		ModelAndView mv = null;
		Long pkid = null;
		ProjectRegistrationModel baseObject;
		try {
			log.info("In updateConstructionCostDetails projectId >> "+projectRegistrationModel.getProjectRegId());
			baseObject = plotRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			baseObject = plotRegService.saveOrUpdatePlotConstructionCostDetails(baseObject, request,certFromChartedAcc,certificateIssuedByStructuralEng,
					certificateIssuedByArchitect);
			pkid = plotRegService.saveUpdatePostRegistration(baseObject);
			log.info("In updateConstructionCostDetails pkid : >>"+pkid);
			httpSession.setAttribute("pkid", pkid);
			mv = new ModelAndView("redirect:/plot/plotConstructionCostDetails");
		} catch (Exception ex) {
			log.error(ex.getMessage(),ex);
			throw ex;
		}
		return mv;
	}

	@RequestMapping(value="plot/plotSummaryDetails")
	public ModelAndView plotSummaryDetails(){
		ProjectRegistrationModel bsModel = null;
		ModelAndView mv = null;
		mv=new ModelAndView("plot.plotSummaryDetails");
		try {
			UserModel user=(UserModel)httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
			bsModel = plotRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			mv.addObject("projectRegistrationModel", bsModel);
			mv.addObject("projectList", plotRegService.getPostRegProjectsByLoginId(user.getLoginId()));
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return mv;
	}

	@RequestMapping(value = "plot/updatePlotSummaryDetails", method = RequestMethod.POST)
	public ModelAndView updatePrlotSummaryDetails(
			@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = null;
		Long pkid = null;
		ProjectRegistrationModel baseObject;
		try {
			log.info("In updateProjectSummaryDetails projectId >> "+projectRegistrationModel.getProjectRegId());
			baseObject = plotRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			baseObject = plotRegService.updatePlotSummaryDetails(baseObject, request);
			pkid = plotRegService.saveUpdatePostRegistration(baseObject);
			log.info("In updatePlotSummaryDetails pkid : >>"+pkid);
			httpSession.setAttribute("pkid", pkid);
			mv = new ModelAndView("redirect:/plot/plotSummaryDetails");
		} catch (Exception ex) {
			log.error(ex.getMessage(),ex);
			throw ex;
		}
		return mv;
	}

	@RequestMapping(value="plot/plotFinalApprovalDetails")
	public ModelAndView plotFinalApprovalDetails(){
		ProjectRegistrationModel bsModel = null;
		ModelAndView mv = null;
		mv=new ModelAndView("plot.plotFinalApprovalDetails");
		try {
			UserModel user=(UserModel)httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
			bsModel = plotRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			mv.addObject("projectRegistrationModel", bsModel);
			mv.addObject("projectList", plotRegService.getPostRegProjectsByLoginId(user.getLoginId()));
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return mv;
	}

	@RequestMapping(value = "plot/updatePlotFinalApprovalDetails", method = RequestMethod.POST)
	public ModelAndView updatePlotFinalApprovalDetails(
			@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request,@RequestParam(value="uploadDoc") MultipartFile[] uploadDoc ) throws Exception {
		ModelAndView mv = null;
		Long pkid = null;
		ProjectRegistrationModel baseObject;
		try {
			baseObject = plotRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			baseObject = plotRegService.updatePlotFinalApprovalDetails(baseObject, request,uploadDoc);
			pkid = plotRegService.saveUpdatePostRegistration(baseObject);
			log.info("In updatePlotFinalApprovalDetails pkid : >>"+pkid);
			httpSession.setAttribute("pkid", pkid);
			mv = new ModelAndView("redirect:/plot/plotFinalApprovalDetails");
		} catch (Exception ex) {
			log.error(ex.getMessage(),ex);
			throw ex;
		}
		return mv;
	}

	@RequestMapping(value="plot/plotSummaryrDetails")
	public ModelAndView plotQuarterDetails(){
		ProjectRegistrationModel baseObject = null;
		ModelAndView mv = null;
		try {
			baseObject = plotRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			if (baseObject.getRegistrationType().equalsIgnoreCase(ReraConstants.INDVISUAL_REG)) {
				mv = new ModelAndView("plot.viewSummary");
			} else {
				mv = new ModelAndView("plot.viewSummary");
			}

			String mobileNo = null;
			mobileNo = baseObject.getPromoterDetailsModel().getMobileNo();
			log.info("mobileNo::::" + mobileNo);
			EnquiryModel em = new EnquiryModel();
			em.setEmailId(baseObject.getPromoterDetailsModel().getMobileNo());
			em.setSubject("Post Registration successfully submitted");
			StringBuffer sb = new StringBuffer();
			sb.append("Dear Promoter ").append(",\n");
			sb.append(" Post Registration is Successfully Submitted").append("\n\n\n");
			sb.append("Regards : \n ").append("RERA Karnataka Team");
			System.out.println(sb.toString());
			em.setEnquiryText(sb.toString());
			mailService.sendMail(em);

			String projectRegNo = baseObject.getProjectRegistrationNo();
			mv.addObject("projectRegNo", projectRegNo);
			
			ProjectDetailsModel projectDetails = baseObject.getProjectDetailsModel();
			mv.addObject("projectDetails", projectDetails);
			
			
			//Plots Details
			PlotsDetailsModel pdm = null;
			pdm = baseObject.getProjectDetailsModel().getPlotDetailsList() != null
					&& baseObject.getProjectDetailsModel().getPlotDetailsList().size() != 0
					? baseObject.getProjectDetailsModel().getPlotDetailsList().get(0)
							: null;
					mv.addObject("pdm", pdm);

					PlotsLandCostDetailsModel PlotsLandAcquisitionCost = baseObject.getProjectDetailsModel().getPlotLandCostDetailsModel();
					mv.addObject("PlotsLandAcquisitionCost", PlotsLandAcquisitionCost);

					// const cost
					PlotsConstructionCostmodel plotsConstructionCostmodel = baseObject.getProjectDetailsModel().getPlotsConstructionCostModel();
					mv.addObject("plotsConstructionCostmodel", plotsConstructionCostmodel);

					// plot Schedule
					PlotScheduleModel plotScheduleModel = baseObject.getProjectDetailsModel().getPlotScheduleModel();
					mv.addObject("plotScheduleModel", plotScheduleModel);

					
							
					mv.addObject("project", baseObject);
		}catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return mv;
	}


}