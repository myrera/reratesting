package in.gov.rera.transaction.postregistration.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
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
import in.gov.rera.transaction.postregistration.plots.model.PlotsCostSummary;
import in.gov.rera.transaction.postregistration.plots.model.PlotsDetailsModel;
import in.gov.rera.transaction.postregistration.plots.model.PlotsFinalApproval;
import in.gov.rera.transaction.postregistration.plots.model.PlotsLandCostDetailsModel;
import in.gov.rera.transaction.postregistration.plots.model.PlotsQuaterlyUpdate;
import in.gov.rera.transaction.postregistration.service.IPlotQuaterlyUpdateService;
import in.gov.rera.transaction.postregistration.service.IPostRegService;
import in.gov.rera.transaction.projectregistration.model.ProjectRegistrationModel;
import in.gov.rera.transaction.projectregistration.service.IProjectRegistrationService;

@Controller("PlotQuarterlyUpdateController")
@Scope("request")
public class PlotQuarterlyUpdateController {
	static Logger log = Logger.getLogger(PlotQuarterlyUpdateController.class);
	@Autowired
	HttpSession httpSession;

	@Autowired
	IPostRegService postRegService;

	@Autowired
	IPlotQuaterlyUpdateService plotquaterlyUpdateService;

	@Autowired
	IProjectRegistrationService projectRegistrationService;

	@Autowired
	CommonDao<Object, Long> commonDao;

	@Autowired
	IPlotQuaterlyUpdateService plotQuaterlyUpdateService;

	@Autowired
	MailService mailService;

	@RequestMapping(value = "plotquarter/home")
	public ModelAndView plotRegProjectDetails() {
		ModelAndView mv  = null;
		UserModel user = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
		ProjectRegistrationModel project;
		try {
			project = postRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			List<PlotsQuaterlyUpdate> plotQuarterlyUpdateList = null;
			if (project.getProjectDetailsModel().getPlotsQuarterlyUpdate() == null ||project.getProjectDetailsModel().getPlotsQuarterlyUpdate().size()==0) {
				if(project.getApprovedOn()!=null && project.getProjectDetailsModel()!=null &&
						project.getApprovedOn().getTime().before(project.getProjectDetailsModel().getCompletionDate().getTime())
						&& Calendar.getInstance().getTime().before(project.getProjectDetailsModel().getCompletionDate().getTime())) {
					Date startDate = project.getApprovedOn().getTime();
					Date endDate = project.getProjectDetailsModel().getCompletionDate().getTime();
					plotQuarterlyUpdateList = new ArrayList<PlotsQuaterlyUpdate>();
					Date quaterDate = startDate;
					int diffInDays = (int) ((endDate.getTime() - startDate.getTime()) / (1000 * 60 * 60 * 24));
					System.out.println("diffInDays >>"+diffInDays);
					int count=-90;
					while (quaterDate.before(endDate)) {
						count+=90;
						System.out.println("count >>>"+count++);
						System.out.println("quaterDate >>> "+quaterDate+"endDate >>> "+endDate);
						PlotsQuaterlyUpdate plotquaterlyUpdate = new PlotsQuaterlyUpdate();
						Calendar updateDate = Calendar.getInstance();
						updateDate.setTime(quaterDate);
						plotquaterlyUpdate.setUpdateDate(updateDate);
						Calendar nextQuarter = (Calendar) updateDate.clone();
						nextQuarter.add(Calendar.MONTH, 3);
						quaterDate = nextQuarter.getTime();
						commonDao.saveObject(plotquaterlyUpdate);
						plotQuarterlyUpdateList.add(plotquaterlyUpdate);
					}
					if(diffInDays-count>=1) {
					PlotsQuaterlyUpdate plotquaterlyUpdate = new PlotsQuaterlyUpdate();
					Calendar updateEndDate = Calendar.getInstance();
					updateEndDate.setTime(endDate);
					plotquaterlyUpdate.setUpdateDate(updateEndDate);
					plotQuarterlyUpdateList.add(plotquaterlyUpdate);
					}
				}else {
					plotQuarterlyUpdateList = new ArrayList<PlotsQuaterlyUpdate>();
					PlotsQuaterlyUpdate plotquaterlyUpdate = new PlotsQuaterlyUpdate();
					Calendar updateDate = Calendar.getInstance();
					updateDate.setTime(Calendar.getInstance().getTime());
					plotquaterlyUpdate.setUpdateDate(updateDate);
					commonDao.saveObject(plotquaterlyUpdate);
					plotQuarterlyUpdateList.add(plotquaterlyUpdate);
				}
			}else {
				plotQuarterlyUpdateList = project.getProjectDetailsModel().getPlotsQuarterlyUpdate();
			}
			project.getProjectDetailsModel().setPlotsQuarterlyUpdate(plotQuarterlyUpdateList);
			try {
				projectRegistrationService.editProjectRegistration(project);
			} catch (Exception e) {
				log.error("Problem with saving quaterly update");
			}
			httpSession.setAttribute("pkid", Long.parseLong(httpSession.getAttribute("pkid").toString()));
			
			mv = new ModelAndView("plot.plotquaterlyUpdateHome");
			/*for (int i = 0; i < plotQuarterlyUpdateList.size(); i++) {
					if(plotQuarterlyUpdateList.get(i).getBankDetails().getPercentageOfProjectCompletion()==100) {
						mv.addObject("lastquarter",plotQuarterlyUpdateList.get(i).getUpdateDate());
					}
			}*/
			mv.addObject("completiondate",project.getProjectDetailsModel().getCompletionDate());
			mv.addObject("quaterlyUpdate", project.getProjectDetailsModel().getPlotsQuarterlyUpdate());
			mv.addObject("projectList", postRegService.getPostRegProjectsByLoginId(user.getLoginId()));
			mv.addObject("projectRegistrationModel", project);
		} catch (NumberFormatException e1) {
			e1.printStackTrace();
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		return mv;
	}

	@RequestMapping(value="plotquarter/quaterlyUpdate")
	public  ModelAndView plotQuaterlyUpdate(HttpServletRequest request,@RequestParam(value ="QUARTER_ID",required = false) Long quarterId){
		log.info("quaterlyUpdate >>>> loading ");
		ModelAndView mv=new ModelAndView("plotquaterlyupdate");
		if(quarterId != null) {
			mv.addObject("quarter", commonDao.getObject(PlotsQuaterlyUpdate.class, quarterId));
			httpSession.setAttribute("plotquarterID", quarterId);
		}else {
			mv.addObject("quarter", commonDao.getObject(PlotsQuaterlyUpdate.class, Long.parseLong(httpSession.getAttribute("plotquarterID").toString())));
		}
		try {
			httpSession.setAttribute("pkid", Long.parseLong(httpSession.getAttribute("pkid").toString()));
			mv.addObject("project", postRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString())));
			mv.addObject("projectRegistrationModel", postRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString())));
		} catch (NumberFormatException e) {
			log.error(e.getMessage(),e);
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return mv;
	}

	@RequestMapping(value = "plotquarter/updatePlotBankDetails", method = RequestMethod.POST)
	public ModelAndView updatePlotBankDetails(@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request,	@RequestParam("certFromChartedAcc") MultipartFile certFromChartedAcc , @RequestParam("certificateIssuedByStructuralEng") MultipartFile certificateIssuedByStructuralEng ,
			@RequestParam("certificateIssuedByArchitect") MultipartFile certificateIssuedByArchitect,
			@RequestParam("financialReport") MultipartFile financialReport,@RequestParam("annualfinancialReport") MultipartFile annualfinancialReport)  throws Exception {
		ModelAndView mv = null;
		Long pkid = null;
		ProjectRegistrationModel baseObject;
		try {
			baseObject = postRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			baseObject = plotquaterlyUpdateService.updatePlotBankDetails(baseObject, request,certFromChartedAcc,certificateIssuedByStructuralEng,
					certificateIssuedByArchitect,financialReport,annualfinancialReport,Long.parseLong(httpSession.getAttribute("plotquarterID").toString()));

			PlotsQuaterlyUpdate plotquarter=(PlotsQuaterlyUpdate)commonDao.getObject(PlotsQuaterlyUpdate.class, Long.parseLong(httpSession.getAttribute("plotquarterID").toString()));
			httpSession.setAttribute("plotquarterID", plotquarter.getQuaterlyId());

			log.info("test getQuaterlyId >>"+plotquarter.getQuaterlyId());

			pkid = postRegService.saveUpdatePostRegistration(baseObject);
			log.info("In updateProjectBankDetails pkid : >>"+pkid);
			httpSession.setAttribute("pkid", pkid);
			mv = new ModelAndView("redirect:/plotquarter/quaterlyUpdate");
		} catch (Exception ex) {
			log.error(ex.getMessage(),ex);
			throw ex;
		}
		return mv;
	}

	@RequestMapping(value = "plotquarter/updatePlotLitigationDetails", method = RequestMethod.POST)
	public ModelAndView updatePlotLitigationDetails(@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request,@RequestParam("preventiveOrderDoc")  MultipartFile[] preventiveOrderDoc)  throws Exception {
		ModelAndView mv = null;
		Long pkid = null;
		ProjectRegistrationModel baseObject;
		try {

			baseObject = postRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			baseObject = plotquaterlyUpdateService.updatePlotLitigationDetails(baseObject, request,Long.parseLong(httpSession.getAttribute("plotquarterID").toString()),preventiveOrderDoc);

			PlotsQuaterlyUpdate plotquarter=(PlotsQuaterlyUpdate)commonDao.getObject(PlotsQuaterlyUpdate.class, Long.parseLong(httpSession.getAttribute("plotquarterID").toString()));
			httpSession.setAttribute("plotquarterID", plotquarter.getQuaterlyId());

			log.info("test getQuaterlyId >>"+plotquarter.getQuaterlyId());

			pkid = postRegService.saveUpdatePostRegistration(baseObject);
			log.info("In updateBuildingDetails pkid : >>"+pkid);
			httpSession.setAttribute("pkid", pkid);
			mv = new ModelAndView("redirect:/plotquarter/quaterlyUpdate");
		} catch (Exception ex) {
			log.error(ex.getMessage(),ex);
			throw ex;
		}
		return mv;
	}

	@RequestMapping(value = "plotquarter/updatePlotModificationDetails", method = RequestMethod.POST)
	public ModelAndView updatePlotModificationDetails(@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request,@RequestParam("modifiedDoc")  MultipartFile modifiedDoc,
			@RequestParam("uploadApprovalDoc")  MultipartFile uploadApprovalDoc,@RequestParam("uploadDoc")  MultipartFile uploadDoc,
			@RequestParam("detailsOfPlotReleased")  MultipartFile detailsOfPlotReleased
			,@RequestParam("plotNocCertificate")  MultipartFile plotNocCertificate)  throws Exception {
		ModelAndView mv = null;
		Long pkid = null;
		ProjectRegistrationModel baseObject;
		try {
			baseObject = postRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			baseObject = plotquaterlyUpdateService.updatePlotModificationDetails(baseObject, request,Long.parseLong(httpSession.getAttribute("plotquarterID").toString()),
					uploadApprovalDoc ,uploadDoc , modifiedDoc,detailsOfPlotReleased,plotNocCertificate);

			PlotsQuaterlyUpdate plotquarter=(PlotsQuaterlyUpdate)commonDao.getObject(PlotsQuaterlyUpdate.class, Long.parseLong(httpSession.getAttribute("plotquarterID").toString()));
			httpSession.setAttribute("plotquarterID", plotquarter.getQuaterlyId());;

			log.info("test getQuaterlyId >>"+plotquarter.getQuaterlyId());

			pkid = postRegService.saveUpdatePostRegistration(baseObject);
			log.info("In updateBuildingDetails pkid : >>"+pkid);
			httpSession.setAttribute("pkid", pkid);
			mv = new ModelAndView("redirect:/plotquarter/quaterlyUpdate");
		} catch (Exception ex) {
			log.error(ex.getMessage(),ex);
			throw ex;
		}
		return mv;
	}

	@RequestMapping(value = "plotquarter/updatePlotAssociationDetails", method = RequestMethod.POST)
	public ModelAndView updatePlotAssociationDetails(@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request,@RequestParam("registeredDoc")  MultipartFile registeredDoc)  throws Exception {
		ModelAndView mv = null;
		Long pkid = null;
		ProjectRegistrationModel baseObject;
		try {
			baseObject = postRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			baseObject = plotquaterlyUpdateService.updatePlotAssociationDetails(baseObject, request,Long.parseLong(httpSession.getAttribute("plotquarterID").toString()),registeredDoc);

			PlotsQuaterlyUpdate plotquarter=(PlotsQuaterlyUpdate)commonDao.getObject(PlotsQuaterlyUpdate.class, Long.parseLong(httpSession.getAttribute("plotquarterID").toString()));
			httpSession.setAttribute("plotquarterID", plotquarter.getQuaterlyId());

			log.info("test getQuaterlyId >>"+plotquarter.getQuaterlyId());

			pkid = postRegService.saveUpdatePostRegistration(baseObject);
			log.info("In updateAssociationDetails pkid : >>"+pkid);
			httpSession.setAttribute("pkid", pkid);
			mv = new ModelAndView("redirect:/plotquarter/quaterlyUpdate");
		} catch (Exception ex) {
			log.error(ex.getMessage(),ex);
			throw ex;
		}
		return mv;
	}

	@RequestMapping(value = "plotquarter/updatePlotConstructionWelfareDetails", method = RequestMethod.POST)
	public ModelAndView updatePlotConstructionWelfareDetails(@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request,@RequestParam("welfareFundregisteredDoc")  MultipartFile welfareFundregisteredDoc)  throws Exception {
		ModelAndView mv = null;
		Long pkid = null;
		ProjectRegistrationModel baseObject;
		try {
			baseObject = postRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			baseObject = plotquaterlyUpdateService.updatePlotConstructionWelfareDetails(baseObject, request,Long.parseLong(httpSession.getAttribute("plotquarterID").toString()),welfareFundregisteredDoc);

			PlotsQuaterlyUpdate plotquarter=(PlotsQuaterlyUpdate)commonDao.getObject(PlotsQuaterlyUpdate.class, Long.parseLong(httpSession.getAttribute("plotquarterID").toString()));
			httpSession.setAttribute("plotquarterID", plotquarter.getQuaterlyId());

			log.info("test getQuaterlyId >>"+plotquarter.getQuaterlyId());

			pkid = postRegService.saveUpdatePostRegistration(baseObject);
			log.info("In updateAssociationDetails pkid : >>"+pkid);
			httpSession.setAttribute("pkid", pkid);
			mv = new ModelAndView("redirect:/plotquarter/quaterlyUpdate");
		} catch (Exception ex) {
			log.error(ex.getMessage(),ex);
			throw ex;
		}
		return mv;
	}

	@RequestMapping(value = "plotquarter/updateQuarterPlotDetails", method = RequestMethod.POST)
	public ModelAndView updateQuarterPlotDetails(@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request)  throws Exception {
		ModelAndView mv = null;
		Long pkid = null;
		ProjectRegistrationModel baseObject;
		try {
			baseObject = postRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			baseObject = plotquaterlyUpdateService.saveUpdateQuarterPlotDetails(baseObject, request,Long.parseLong(httpSession.getAttribute("plotquarterID").toString()));

			PlotsQuaterlyUpdate plotquarter=(PlotsQuaterlyUpdate)commonDao.getObject(PlotsQuaterlyUpdate.class, Long.parseLong(httpSession.getAttribute("plotquarterID").toString()));
			httpSession.setAttribute("plotquarterID", plotquarter.getQuaterlyId());

			log.info("test getQuaterlyId >>"+plotquarter.getQuaterlyId());

			pkid = postRegService.saveUpdatePostRegistration(baseObject);
			log.info("In updateAssociationDetails pkid : >>"+pkid);
			httpSession.setAttribute("pkid", pkid);
			mv = new ModelAndView("redirect:/plotquarter/quaterlyUpdate");
		} catch (Exception ex) {
			log.error(ex.getMessage(),ex);
			throw ex;
		}
		return mv;
	}

	@RequestMapping(value = "plotquarter/updatePlottedCivilWorksDetails", method = RequestMethod.POST)
	public ModelAndView updatePlottedCivilWorksDetails(@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request)  throws Exception {
		ModelAndView mv = null;
		Long pkid = null;
		ProjectRegistrationModel baseObject;
		try {
			baseObject = postRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			baseObject = plotquaterlyUpdateService.updatePlotCivilWorksDetails(baseObject, request,Long.parseLong(httpSession.getAttribute("plotquarterID").toString()));

			PlotsQuaterlyUpdate plotquarter=(PlotsQuaterlyUpdate)commonDao.getObject(PlotsQuaterlyUpdate.class, Long.parseLong(httpSession.getAttribute("plotquarterID").toString()));
			httpSession.setAttribute("plotquarterID", plotquarter.getQuaterlyId());

			log.info("test getQuaterlyId >>"+plotquarter.getQuaterlyId());

			pkid = postRegService.saveUpdatePostRegistration(baseObject);
			log.info("In updateBuildingDetails pkid : >>"+pkid);
			httpSession.setAttribute("pkid", pkid);
			mv = new ModelAndView("redirect:/plotquarter/quaterlyUpdate");
		} catch (Exception ex) {
			log.error(ex.getMessage(),ex);
			throw ex;
		}
		return mv;
	}

	// plot Common Areas To be Relinquished to local Authority /Planning Authority
	@RequestMapping(value = "plotquarter/updateQuarterlyCommonAreasAuthorityDetails", method = RequestMethod.POST)
	public ModelAndView updateQuarterlyCommonAreasRelinquishedToLocalAuthorityDetails(
			@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request,@RequestParam("sitesPhotograph") MultipartFile sitesPhotograph,@RequestParam("openSpacePhotograph") MultipartFile openSpacePhotograph,@RequestParam("roadPhotograph") MultipartFile roadPhotograph) throws Exception {
		ModelAndView mv = null;
		Long pkid = null;
		ProjectRegistrationModel baseObject;
		try {
			log.info(" In updatePlotScheduleDetails method ProjectId >> "+projectRegistrationModel.getProjectRegId());
			baseObject = postRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			baseObject = plotquaterlyUpdateService.saveOrUpdateQuarterlyCommonAreasAuthorityDetails(baseObject,request,Long.parseLong(httpSession.getAttribute("plotquarterID").toString()),sitesPhotograph,openSpacePhotograph,roadPhotograph);

			PlotsQuaterlyUpdate plotquarter=(PlotsQuaterlyUpdate)commonDao.getObject(PlotsQuaterlyUpdate.class, Long.parseLong(httpSession.getAttribute("plotquarterID").toString()));
			httpSession.setAttribute("plotquarterID", plotquarter.getQuaterlyId());

			log.info("test getQuaterlyId >>"+plotquarter.getQuaterlyId());

			pkid = postRegService.saveUpdatePostRegistration(baseObject);
			httpSession.setAttribute("pkid", pkid);
			mv = new ModelAndView("redirect:/plotquarter/quaterlyUpdate");
		} catch (Exception ex) {
			log.error(ex.getMessage(),ex);
			throw ex;
		}
		return mv;
	}


	@RequestMapping(value = "plotquarter/updateQuarterlyCommonAreasPurchaserDetails", method = RequestMethod.POST)
	public ModelAndView updateQuarterlyCommonAreasPurchaserDetails(@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request)  throws Exception {
		ModelAndView mv = null;
		Long pkid = null;
		ProjectRegistrationModel baseObject;
		try {
			baseObject = postRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			baseObject = plotquaterlyUpdateService.saveOrUpdateQuarterlyCommonAreasPurchaserDetails(baseObject, request,Long.parseLong(httpSession.getAttribute("plotquarterID").toString()));

			PlotsQuaterlyUpdate plotquarter=(PlotsQuaterlyUpdate)commonDao.getObject(PlotsQuaterlyUpdate.class, Long.parseLong(httpSession.getAttribute("plotquarterID").toString()));
			httpSession.setAttribute("plotquarterID", plotquarter.getQuaterlyId());

			log.info("test getQuaterlyId >>"+plotquarter.getQuaterlyId());

			pkid = postRegService.saveUpdatePostRegistration(baseObject);
			log.info("In updateBuildingDetails pkid : >>"+pkid);
			httpSession.setAttribute("pkid", pkid);
			mv = new ModelAndView("redirect:/plotquarter/quaterlyUpdate");
		} catch (Exception ex) {
			log.error(ex.getMessage(),ex);
			throw ex;
		}
		return mv;
	}

	@RequestMapping(value = "plotquarter/updatePlotApprovalsOrNocDetails", method = RequestMethod.POST)
	public ModelAndView updatePlotQuarterlyApprovalsOrNocDetails(@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request,@RequestParam("uploadDoc")  MultipartFile[] photograph)  throws Exception {
		ModelAndView mv = null;
		Long pkid = null;
		ProjectRegistrationModel baseObject;
		try {
			baseObject = postRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			baseObject = plotquaterlyUpdateService.updatePlotQuarterlyApprovalsOrNocDetails(baseObject, request,Long.parseLong(httpSession.getAttribute("plotquarterID").toString()),photograph);

			PlotsQuaterlyUpdate plotquarter=(PlotsQuaterlyUpdate)commonDao.getObject(PlotsQuaterlyUpdate.class, Long.parseLong(httpSession.getAttribute("plotquarterID").toString()));
			httpSession.setAttribute("plotquarterID", plotquarter.getQuaterlyId());

			log.info("test getQuaterlyId >>"+plotquarter.getQuaterlyId());

			pkid = postRegService.saveUpdatePostRegistration(baseObject);
			log.info("In updateBuildingDetails pkid : >>"+pkid);
			httpSession.setAttribute("pkid", pkid);
			mv = new ModelAndView("redirect:/plotquarter/quaterlyUpdate");
		} catch (Exception ex) {
			log.error(ex.getMessage(),ex);
			throw ex;
		}
		return mv;
	}

	@RequestMapping(value = "plotquarter/updatePlotConstructionCostDetails", method = RequestMethod.POST)
	public ModelAndView updatePlotConstructionCostDetails(
			@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = null;
		Long pkid = null;
		ProjectRegistrationModel baseObject;
		try {
			baseObject = postRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			baseObject = plotquaterlyUpdateService.saveOrUpdatePlotConstructionCostDetails(baseObject, request,Long.parseLong(httpSession.getAttribute("plotquarterID").toString()));

			PlotsQuaterlyUpdate plotquarter=(PlotsQuaterlyUpdate)commonDao.getObject(PlotsQuaterlyUpdate.class, Long.parseLong(httpSession.getAttribute("plotquarterID").toString()));
			httpSession.setAttribute("plotquarterID", plotquarter.getQuaterlyId());

			log.info("test getQuaterlyId >>"+plotquarter.getQuaterlyId());

			pkid = postRegService.saveUpdatePostRegistration(baseObject);
			log.info("In updateConstructionCostDetails pkid : >>"+pkid);
			httpSession.setAttribute("pkid", pkid);
			mv = new ModelAndView("redirect:/plotquarter/quaterlyUpdate");
		} catch (Exception ex) {
			log.error(ex.getMessage(),ex);
			throw ex;
		}
		return mv;
	}

	@RequestMapping(value="plotquarter/plotQuarterDetails")
	public ModelAndView plotQuarterDetails(long quarterId){
		ProjectRegistrationModel baseObject = null;
		ModelAndView mv = null;
		try {
			baseObject = postRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			if (baseObject.getRegistrationType().equalsIgnoreCase(ReraConstants.INDVISUAL_REG)) {
				mv = new ModelAndView("plot.submitPlotQuarterInd");
			} else {
				mv = new ModelAndView("plot.submitPlotQuarterComp");
			}
			
			PlotsQuaterlyUpdate quarter=(PlotsQuaterlyUpdate) commonDao.getObject(PlotsQuaterlyUpdate.class, quarterId);
			quarter.setActualUpdateDate(Calendar.getInstance());
			commonDao.updateObject(quarter);
			
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
			mailService.sendMail(em);

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

					// Plots Final Approval
					List<PlotsFinalApproval> plotfinalApproval = baseObject.getProjectDetailsModel().getPlotfinalApproval();
					mv.addObject("plotfinalApproval", plotfinalApproval);

					// Plots Cost Summary
					PlotsCostSummary plotsCostSummary = baseObject.getProjectDetailsModel().getPlotSummary();
					mv.addObject("plotsCostSummary", plotsCostSummary);

					// quarterly update
					/*List<PlotsQuaterlyUpdate> plotQuarterList = null;
					//System.out.println("size >>"+baseObject.getProjectDetailsModel().getPlotsQuarterlyUpdate().size());
					plotQuarterList = baseObject.getProjectDetailsModel().getPlotsQuarterlyUpdate();
							mv.addObject("plotQuarterList", plotQuarterList);
							System.out.println("size---->>>"+plotQuarterList.size());*/
					
					PlotsQuaterlyUpdate plotQuarter = null;
					plotQuarter=(PlotsQuaterlyUpdate) commonDao.getObject(PlotsQuaterlyUpdate.class, quarterId);
					
				/*	List<PlotsQuaterlyUpdate> plotQuarterList=new ArrayList<PlotsQuaterlyUpdate>();
					PlotsQuaterlyUpdate plotQuarter=(PlotsQuaterlyUpdate) commonDao.getObject(PlotsQuaterlyUpdate.class, quarterId);
					plotQuarterList.set(0, plotQuarter);*/
					
					mv.addObject("plotQuarter", plotQuarter);
							
							mv.addObject("project", baseObject);
		}catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return mv;
	}
}