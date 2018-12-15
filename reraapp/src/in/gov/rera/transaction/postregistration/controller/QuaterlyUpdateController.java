package in.gov.rera.transaction.postregistration.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.hibernate.Query;
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
import in.gov.rera.transaction.postregistration.model.ApprovalCostModel;
import in.gov.rera.transaction.postregistration.model.ConstructionCostmodel;
import in.gov.rera.transaction.postregistration.model.FinalApproval;
import in.gov.rera.transaction.postregistration.model.LandCostDetailsModel;
import in.gov.rera.transaction.postregistration.model.ProjectQuaterlyUpdate;
import in.gov.rera.transaction.postregistration.model.ProjectScheduleModel;
import in.gov.rera.transaction.postregistration.model.ProjectSummary;
import in.gov.rera.transaction.postregistration.model.TowerDetailsModel;
import in.gov.rera.transaction.postregistration.service.IPostRegService;
import in.gov.rera.transaction.postregistration.service.IQuaterlyUpdateService;
import in.gov.rera.transaction.projectregistration.model.ProjectDetailsModel;
import in.gov.rera.transaction.projectregistration.model.ProjectRegistrationModel;
import in.gov.rera.transaction.projectregistration.service.IProjectRegistrationService;
import sun.util.resources.cldr.aa.CalendarData_aa_ER;

@Controller("QuaterlyUpdateController")
@Scope("request")
public class QuaterlyUpdateController {
	static Logger log = Logger.getLogger(QuaterlyUpdateController.class);
	@Autowired
	HttpSession httpSession;

	@Autowired
	IPostRegService postRegService;

	@Autowired
	IProjectRegistrationService projectRegistrationService;

	@Autowired
	CommonDao<Object, Long> commonDao;

	@Autowired
	IQuaterlyUpdateService quaterlyUpdateService;

	@Autowired
	MailService mailService;

	@RequestMapping(value = "quarter/home")
	public ModelAndView postRegProjectDetails() {
		ModelAndView mv  = null;
		UserModel user = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
		ProjectRegistrationModel project;
		try {
			project = postRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			List<ProjectQuaterlyUpdate> quarterlyUpdateList = null;
			if (project.getProjectDetailsModel().getQuarterlyUpdate() == null ||project.getProjectDetailsModel().getQuarterlyUpdate().size()==0) {
				if(project.getApprovedOn()!=null && project.getProjectDetailsModel()!=null &&
						project.getApprovedOn().getTime().before(project.getProjectDetailsModel().getCompletionDate().getTime())
						&& project.getProjectDetailsModel().getCompletionDate().getTime().after(Calendar.getInstance().getTime())) {
					quarterlyUpdateList = new ArrayList<ProjectQuaterlyUpdate>();
					Date startDate = project.getApprovedOn().getTime();
					Date endDate = project.getProjectDetailsModel().getCompletionDate().getTime();
					Date quaterDate = startDate;
					int diffInDays = (int) ((endDate.getTime() - startDate.getTime()) / (1000 * 60 * 60 * 24));
					System.out.println("diffInDays >>"+diffInDays);
					int count=-90;
					while (quaterDate.before(endDate)) {
						count+=90;
						ProjectQuaterlyUpdate quaterlyUpdate = new ProjectQuaterlyUpdate();
						Calendar updateDate = Calendar.getInstance();
						updateDate.setTime(quaterDate);
						quaterlyUpdate.setUpdateDate(updateDate);
						Calendar nextQuarter = (Calendar) updateDate.clone();
						nextQuarter.add(Calendar.MONTH, 3);
						quaterDate = nextQuarter.getTime();
						commonDao.saveObject(quaterlyUpdate);
						quarterlyUpdateList.add(quaterlyUpdate);
					}
					if(diffInDays-count>=1) {
						ProjectQuaterlyUpdate quaterlyUpdate = new ProjectQuaterlyUpdate();
						Calendar updateEndDate = Calendar.getInstance();
						updateEndDate.setTime(endDate);
						quaterlyUpdate.setUpdateDate(updateEndDate);
						quarterlyUpdateList.add(quaterlyUpdate);
					}
				}else {
					quarterlyUpdateList = new ArrayList<ProjectQuaterlyUpdate>();
					ProjectQuaterlyUpdate quaterlyUpdate = new ProjectQuaterlyUpdate();
					Calendar updateDate = Calendar.getInstance();
					updateDate.setTime(Calendar.getInstance().getTime());
					quaterlyUpdate.setUpdateDate(updateDate);
					commonDao.saveObject(quaterlyUpdate);
					quarterlyUpdateList.add(quaterlyUpdate);
				}
			}else {
				quarterlyUpdateList = project.getProjectDetailsModel().getQuarterlyUpdate();
			}
			project.getProjectDetailsModel().setQuarterlyUpdate(quarterlyUpdateList);
			try {
				projectRegistrationService.editProjectRegistration(project);
			} catch (Exception e) {
				log.error("Problem with saving quaterly update");
			}
			httpSession.setAttribute("pkid", Long.parseLong(httpSession.getAttribute("pkid").toString()));
			mv = new ModelAndView("project.quaterlyUpdateHome");
			mv.addObject("completiondate",project.getProjectDetailsModel().getCompletionDate());
			mv.addObject("quaterlyUpdate", project.getProjectDetailsModel().getQuarterlyUpdate());
			mv.addObject("projectList", postRegService.getPostRegProjectsByLoginId(user.getLoginId()));
			mv.addObject("projectRegistrationModel", project);
		} catch (NumberFormatException e1) {
			e1.printStackTrace();
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		return mv;
	}

	@RequestMapping(value="quarter/quaterlyUpdate")
	public  ModelAndView quaterlyUpdate(HttpServletRequest request,@RequestParam(value ="QUARTER_ID",required = false) Long quarterId){
		log.info("quaterlyUpdate >>>> loading ");
		ModelAndView mv=new ModelAndView("quaterlyupdate");
		ProjectRegistrationModel bsModel = null;
		ProjectQuaterlyUpdate projectQuaterlyUpdate  = null;
		int quarterBuildingSize= 0;
		if(quarterId != null) {
			mv.addObject("quarter", commonDao.getObject(ProjectQuaterlyUpdate.class, quarterId));
			httpSession.setAttribute("quarterID", quarterId);

			projectQuaterlyUpdate = (ProjectQuaterlyUpdate) commonDao.getObject(ProjectQuaterlyUpdate.class, quarterId);
			quarterBuildingSize = projectQuaterlyUpdate.getBuildingDetails()!=null ? projectQuaterlyUpdate.getBuildingDetails().size():0;

		}else {
			mv.addObject("quarter", commonDao.getObject(ProjectQuaterlyUpdate.class, Long.parseLong(httpSession.getAttribute("quarterID").toString())));

			projectQuaterlyUpdate = (ProjectQuaterlyUpdate) commonDao.getObject(ProjectQuaterlyUpdate.class, Long.parseLong(httpSession.getAttribute("quarterID").toString()));
			quarterBuildingSize = projectQuaterlyUpdate.getBuildingDetails()!=null ? projectQuaterlyUpdate.getBuildingDetails().size():0;
		}

		try {

			httpSession.setAttribute("pkid", Long.parseLong(httpSession.getAttribute("pkid").toString()));
			mv.addObject("project", postRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString())));
			mv.addObject("projectRegistrationModel", postRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString())));
			if(postRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString())).getProjectDetailsModel().getTowerDetailsList() != null &&
					postRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString())).getProjectDetailsModel().getTowerDetailsList().get(0).getTowerUnitDetailsList()!= null
					) {
				int towerSize = postRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString())).getProjectDetailsModel().getTowerDetailsList()!= null ?postRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString())).getProjectDetailsModel().getTowerDetailsList().size():0;
				List<TreeMap<Long, Map<Object,Object>>> mapList = new ArrayList<TreeMap<Long, Map<Object,Object>>>();

				for(int i=0; i<towerSize ; i++) {
					TreeMap<Long, Map<Object,Object>> map = new TreeMap<>();
					long towerId= postRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString())).getProjectDetailsModel().getTowerDetailsList().get(i).getTowerDetailsId();
					List<Object[]> list = getTowerUnitDetailsById(towerId) ;
					Map<Object,Object> map1= new TreeMap<Object,Object>();
					for( int index=0; index<list.size(); index++ ) {
						map1.put(list.get(index)[0],list.get(index)[1]);
					}
					map.put(towerId, map1);
					System.out.println("map size >>>"+list.size());
					mapList.add(map);
				}
				System.out.println("mapList size >>>"+mapList.size());
				mv.addObject("mapList", mapList);
			}

			int Size =postRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString())).getProjectDetailsModel().getTowerDetailsList().size();
			int res = Size - quarterBuildingSize;
			List<TowerDetailsModel> list = new ArrayList<TowerDetailsModel>();
			if(Size == quarterBuildingSize ) {

			}else {
				System.out.println("size >>>"+projectQuaterlyUpdate.getBuildingDetails().size());
				if( projectQuaterlyUpdate.getBuildingDetails() == null || projectQuaterlyUpdate.getBuildingDetails().size() == 0 ) {
					list = postRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString())).getProjectDetailsModel().getTowerDetailsList();
				}else {
					for(int i=0;i<res; i++) {
						TowerDetailsModel details = postRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString())).getProjectDetailsModel().getTowerDetailsList().get(++i);
						list.add(details);
					}
				}
				mv.addObject("TowerList", list);
			}
		} catch (NumberFormatException e) {
			log.error(e.getMessage(),e);
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return mv;
	}

	public List<Object[]> getTowerUnitDetailsById(long TowerRefId) {
		String str = "";
		Query query = null;
		try {
			System.out.println("TowerRefId >>"+TowerRefId);
			str = "Select unitType,count(unitType) as unitTypeCount from TowerUnitDetailsExcel p where p.TowerRefId = :TowerRefId group by unitType";
			query = commonDao.getQuery(str);
			query.setLong("TowerRefId", TowerRefId);
			System.out.println("query >>"+query);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		List<Object[]> results = query.list();
		return results;
	}
	
	@RequestMapping(value = "quarter/updateBuildingDetails", method = RequestMethod.POST)
	public ModelAndView updateBuildingDetails(@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request,@RequestParam("photograph") MultipartFile[] photograph)  throws Exception {
		ModelAndView mv = null;
		Long pkid = null;
		ProjectRegistrationModel baseObject;
		try {
			baseObject = postRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			baseObject = quaterlyUpdateService.updateBuildingDetails(baseObject, request,Long.parseLong(httpSession.getAttribute("quarterID").toString()),photograph);
			httpSession.setAttribute("quarterID", baseObject.getProjectDetailsModel().getQuarterlyUpdate().get(0).getQuaterlyId());
			pkid = postRegService.saveUpdatePostRegistration(baseObject);
			httpSession.setAttribute("pkid", pkid);
			
			mv = new ModelAndView("redirect:/quarter/quaterlyUpdate");
		} catch (Exception ex) {
			log.error(ex.getMessage(),ex);
			throw ex;
		}
		return mv;
	}

	@RequestMapping(value = "quarter/updateProjectBankDetails", method = RequestMethod.POST)
	public ModelAndView updateProjectBankDetails(@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request,	@RequestParam("certFromChartedAcc") MultipartFile certFromChartedAcc , @RequestParam("certificateIssuedByStructuralEng") MultipartFile certificateIssuedByStructuralEng ,
			@RequestParam("certificateIssuedByArchitect") MultipartFile certificateIssuedByArchitect,
			@RequestParam("financialReport") MultipartFile financialReport,@RequestParam("annualfinancialReport") MultipartFile annualfinancialReport)  throws Exception {
		ModelAndView mv = null;
		Long pkid = null;
		ProjectRegistrationModel baseObject;
		try {
			baseObject = postRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			baseObject = quaterlyUpdateService.updateProjectBankDetails(baseObject, request,certFromChartedAcc,certificateIssuedByStructuralEng,financialReport,
					certificateIssuedByArchitect,annualfinancialReport,Long.parseLong(httpSession.getAttribute("quarterID").toString()));

			ProjectQuaterlyUpdate quarter=(ProjectQuaterlyUpdate)commonDao.getObject(ProjectQuaterlyUpdate.class, Long.parseLong(httpSession.getAttribute("quarterID").toString()));
			httpSession.setAttribute("quarterID", quarter.getQuaterlyId());

			pkid = postRegService.saveUpdatePostRegistration(baseObject);
			log.info("In updateProjectBankDetails pkid : >>"+pkid);
			httpSession.setAttribute("pkid", pkid);
			mv = new ModelAndView("redirect:/quarter/quaterlyUpdate");
		} catch (Exception ex) {
			log.error(ex.getMessage(),ex);
			throw ex;
		}
		return mv;
	}

	@RequestMapping(value = "quarter/updateParkingDetails", method = RequestMethod.POST)
	public ModelAndView updateParkingDetails(@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request)  throws Exception {
		ModelAndView mv = null;
		Long pkid = null;
		ProjectRegistrationModel baseObject;
		try {
			log.info("In updateApartmentDetails projectId >> "+Long.parseLong(httpSession.getAttribute("quarterID").toString()));
			baseObject = postRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			baseObject = quaterlyUpdateService.updateParkingDetails(baseObject, request,Long.parseLong(httpSession.getAttribute("quarterID").toString()));

			ProjectQuaterlyUpdate quarter=(ProjectQuaterlyUpdate)commonDao.getObject(ProjectQuaterlyUpdate.class, Long.parseLong(httpSession.getAttribute("quarterID").toString()));
			httpSession.setAttribute("quarterID", quarter.getQuaterlyId());

			pkid = postRegService.saveUpdatePostRegistration(baseObject);
			log.info("In updateParkingDetails pkid : >>"+pkid);
			httpSession.setAttribute("pkid", pkid);
			mv = new ModelAndView("redirect:/quarter/quaterlyUpdate");
		} catch (Exception ex) {
			log.error(ex.getMessage(),ex);
			throw ex;
		}
		return mv;
	}

	@RequestMapping(value = "quarter/updateFloorDetails", method = RequestMethod.POST)
	public ModelAndView updateFloorDetails(@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request)  throws Exception {
		ModelAndView mv = null;
		Long pkid = null;
		ProjectRegistrationModel baseObject;
		try {
			baseObject = postRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			baseObject = quaterlyUpdateService.updateFloorDetails(baseObject, request,Long.parseLong(httpSession.getAttribute("quarterID").toString()));

			ProjectQuaterlyUpdate quarter=(ProjectQuaterlyUpdate)commonDao.getObject(ProjectQuaterlyUpdate.class, Long.parseLong(httpSession.getAttribute("quarterID").toString()));
			httpSession.setAttribute("quarterID", quarter.getQuaterlyId());

			pkid = postRegService.saveUpdatePostRegistration(baseObject);
			httpSession.setAttribute("pkid", pkid);
			mv = new ModelAndView("redirect:/quarter/quaterlyUpdate");
		} catch (Exception ex) {
			log.error(ex.getMessage(),ex);
			throw ex;
		}
		return mv;
	}

	@RequestMapping(value = "quarter/updateApprovalsOrNocDetails", method = RequestMethod.POST)
	public ModelAndView updateApprovalsOrNocDetails(@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request,@RequestParam("uploadDoc")  MultipartFile[] photograph)  throws Exception {
		ModelAndView mv = null;
		Long pkid = null;
		ProjectRegistrationModel baseObject;
		try {
			baseObject = postRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			baseObject = quaterlyUpdateService.updateApprovalsOrNocDetails(baseObject, request,Long.parseLong(httpSession.getAttribute("quarterID").toString()),photograph);

			ProjectQuaterlyUpdate quarter=(ProjectQuaterlyUpdate)commonDao.getObject(ProjectQuaterlyUpdate.class, Long.parseLong(httpSession.getAttribute("quarterID").toString()));
			httpSession.setAttribute("quarterID", quarter.getQuaterlyId());

			pkid = postRegService.saveUpdatePostRegistration(baseObject);
			httpSession.setAttribute("pkid", pkid);
			mv = new ModelAndView("redirect:/quarter/quaterlyUpdate");
		} catch (Exception ex) {
			log.error(ex.getMessage(),ex);
			throw ex;
		}
		return mv;
	}

	@RequestMapping(value = "quarter/updateModificationDetails", method = RequestMethod.POST)
	public ModelAndView updateModificationDetails(@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request,@RequestParam("modifiedDoc")  MultipartFile modifiedDoc,
			@RequestParam("uploadApprovalDoc")  MultipartFile uploadApprovalDoc,@RequestParam("uploadDoc")  MultipartFile uploadDoc)  throws Exception {
		ModelAndView mv = null;
		Long pkid = null;
		ProjectRegistrationModel baseObject;
		try {
			baseObject = postRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			baseObject = quaterlyUpdateService.updateModificationDetails(baseObject, request,Long.parseLong(httpSession.getAttribute("quarterID").toString()),
					uploadApprovalDoc ,uploadDoc , modifiedDoc);

			ProjectQuaterlyUpdate quarter=(ProjectQuaterlyUpdate)commonDao.getObject(ProjectQuaterlyUpdate.class, Long.parseLong(httpSession.getAttribute("quarterID").toString()));
			httpSession.setAttribute("quarterID", quarter.getQuaterlyId());

			pkid = postRegService.saveUpdatePostRegistration(baseObject);
			log.info("In updateModificationsDetails pkid : >>"+pkid);
			httpSession.setAttribute("pkid", pkid);
			mv = new ModelAndView("redirect:/quarter/quaterlyUpdate");
		} catch (Exception ex) {
			log.error(ex.getMessage(),ex);
			throw ex;
		}
		return mv;
	}

	@RequestMapping(value = "quarter/updateLitigationDetails", method = RequestMethod.POST)
	public ModelAndView updateLitigationDetails(@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request,@RequestParam("preventiveOrderDoc")  MultipartFile[] preventiveOrderDoc,@RequestParam("furtherOrderDoc") MultipartFile[] furtherOrderDoc)  throws Exception {
		ModelAndView mv = null;
		Long pkid = null;
		ProjectRegistrationModel baseObject;
		try {
			baseObject = postRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			baseObject = quaterlyUpdateService.updateLitigationDetails(baseObject, request,Long.parseLong(httpSession.getAttribute("quarterID").toString()),preventiveOrderDoc,furtherOrderDoc);

			ProjectQuaterlyUpdate quarter=(ProjectQuaterlyUpdate)commonDao.getObject(ProjectQuaterlyUpdate.class, Long.parseLong(httpSession.getAttribute("quarterID").toString()));
			httpSession.setAttribute("quarterID", quarter.getQuaterlyId());

			log.info("test getQuaterlyId >>"+quarter.getQuaterlyId());

			pkid = postRegService.saveUpdatePostRegistration(baseObject);
			log.info("In updateLitigationDetails pkid : >>"+pkid);
			httpSession.setAttribute("pkid", pkid);
			mv = new ModelAndView("redirect:/quarter/quaterlyUpdate");
		} catch (Exception ex) {
			log.error(ex.getMessage(),ex);
			throw ex;
		}
		return mv;
	}

	@RequestMapping(value = "quarter/updateAssociationDetails", method = RequestMethod.POST)
	public ModelAndView updateAssociationDetails(@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request,@RequestParam("registeredDoc")  MultipartFile registeredDoc)  throws Exception {
		ModelAndView mv = null;
		Long pkid = null;
		ProjectRegistrationModel baseObject;
		try {
			baseObject = postRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			baseObject = quaterlyUpdateService.updateAssociationDetails(baseObject, request,Long.parseLong(httpSession.getAttribute("quarterID").toString()),registeredDoc);

			ProjectQuaterlyUpdate quarter=(ProjectQuaterlyUpdate)commonDao.getObject(ProjectQuaterlyUpdate.class, Long.parseLong(httpSession.getAttribute("quarterID").toString()));
			httpSession.setAttribute("quarterID", quarter.getQuaterlyId());

			log.info("test getQuaterlyId >>"+quarter.getQuaterlyId());

			pkid = postRegService.saveUpdatePostRegistration(baseObject);
			log.info("In updateAssociationDetails pkid : >>"+pkid);
			httpSession.setAttribute("pkid", pkid);
			mv = new ModelAndView("redirect:/quarter/quaterlyUpdate");
		} catch (Exception ex) {
			log.error(ex.getMessage(),ex);
			throw ex;
		}
		return mv;
	}

	@RequestMapping(value = "quarter/updateCivilWorksDetails", method = RequestMethod.POST)
	public ModelAndView updateCivilWorksDetails(@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request)  throws Exception {
		ModelAndView mv = null;
		Long pkid = null;
		ProjectRegistrationModel baseObject;
		try {

			baseObject = postRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			baseObject = quaterlyUpdateService.updateCivilWorksDetails(baseObject, request,Long.parseLong(httpSession.getAttribute("quarterID").toString()));

			ProjectQuaterlyUpdate quarter=(ProjectQuaterlyUpdate)commonDao.getObject(ProjectQuaterlyUpdate.class, Long.parseLong(httpSession.getAttribute("quarterID").toString()));
			httpSession.setAttribute("quarterID", quarter.getQuaterlyId());

			log.info("test getQuaterlyId >>"+quarter.getQuaterlyId());

			pkid = postRegService.saveUpdatePostRegistration(baseObject);
			log.info("In updateBuildingDetails pkid : >>"+pkid);
			httpSession.setAttribute("pkid", pkid);
			mv = new ModelAndView("redirect:/quarter/quaterlyUpdate");
		} catch (Exception ex) {
			log.error(ex.getMessage(),ex);
			throw ex;
		}
		return mv;
	}

	@RequestMapping(value = "quarter/updateProjectConstructionWelfareDetails", method = RequestMethod.POST)
	public ModelAndView updateProjectConstructionWelfareDetails(@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request,@RequestParam("welfareFundregisteredDoc")  MultipartFile welfareFundregisteredDoc)  throws Exception {
		ModelAndView mv = null;
		Long pkid = null;
		ProjectRegistrationModel baseObject;
		try {
			baseObject = postRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			baseObject = quaterlyUpdateService.updateProjectConstructionWelfareDetails(baseObject, request,Long.parseLong(httpSession.getAttribute("quarterID").toString()),welfareFundregisteredDoc);

			ProjectQuaterlyUpdate quarter=(ProjectQuaterlyUpdate)commonDao.getObject(ProjectQuaterlyUpdate.class, Long.parseLong(httpSession.getAttribute("quarterID").toString()));
			httpSession.setAttribute("quarterID", quarter.getQuaterlyId());

			log.info("test getQuaterlyId >>"+quarter.getQuaterlyId());

			pkid = postRegService.saveUpdatePostRegistration(baseObject);
			log.info("In updateProjectConstructionWelfareDetails pkid : >>"+pkid);
			httpSession.setAttribute("pkid", pkid);
			mv = new ModelAndView("redirect:/quarter/quaterlyUpdate");
		} catch (Exception ex) {
			log.error(ex.getMessage(),ex);
			throw ex;
		}
		return mv;
	}

	@RequestMapping(value = "quarter/updateConstructionCostDetails", method = RequestMethod.POST)
	public ModelAndView updateConstructionCostDetails(
			@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = null;
		Long pkid = null;
		ProjectRegistrationModel baseObject;
		try {
			baseObject = postRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			baseObject = quaterlyUpdateService.saveOrUpdateConstructionCostDetails(baseObject, request,Long.parseLong(httpSession.getAttribute("quarterID").toString()));

			ProjectQuaterlyUpdate quarter=(ProjectQuaterlyUpdate)commonDao.getObject(ProjectQuaterlyUpdate.class, Long.parseLong(httpSession.getAttribute("quarterID").toString()));
			httpSession.setAttribute("quarterID", quarter.getQuaterlyId());

			log.info("test getQuaterlyId >>"+quarter.getQuaterlyId());

			pkid = postRegService.saveUpdatePostRegistration(baseObject);
			log.info("In updateConstructionCostDetails pkid : >>"+pkid);
			httpSession.setAttribute("pkid", pkid);
			mv = new ModelAndView("redirect:/quarter/quaterlyUpdate");
		} catch (Exception ex) {
			log.error(ex.getMessage(),ex);
			throw ex;
		}
		return mv;
	}

	@RequestMapping(value = "quarter/updateSuperStructureWorks", method = RequestMethod.POST)
	public ModelAndView updateSuperStructureDetails(
			@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = null;
		Long pkid = null;
		ProjectRegistrationModel baseObject;
		try {
			baseObject = postRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			baseObject = quaterlyUpdateService.saveSuperStructureDetails(baseObject, request,Long.parseLong(httpSession.getAttribute("quarterID").toString()));

			ProjectQuaterlyUpdate quarter=(ProjectQuaterlyUpdate)commonDao.getObject(ProjectQuaterlyUpdate.class, Long.parseLong(httpSession.getAttribute("quarterID").toString()));
			httpSession.setAttribute("quarterID", quarter.getQuaterlyId());

			log.info("test getQuaterlyId >>"+quarter.getQuaterlyId());

			pkid = postRegService.saveUpdatePostRegistration(baseObject);
			log.info("In updateProjectScheduleDetails pkid >>"+pkid);
			httpSession.setAttribute("pkid", pkid);
			mv = new ModelAndView("redirect:/quarter/quaterlyUpdate");
		} catch (Exception ex) {
			log.error(ex.getMessage(),ex);
			throw ex;
		}
		return mv;
	}

	@RequestMapping(value = "quarter/updateSubStructureWorks", method = RequestMethod.POST)
	public ModelAndView updateSubStructureDetails(
			@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = null;
		Long pkid = null;
		ProjectRegistrationModel baseObject;
		try {
			baseObject = postRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			baseObject = quaterlyUpdateService.saveSubStructureDetails(baseObject, request,Long.parseLong(httpSession.getAttribute("quarterID").toString()));

			ProjectQuaterlyUpdate quarter=(ProjectQuaterlyUpdate)commonDao.getObject(ProjectQuaterlyUpdate.class, Long.parseLong(httpSession.getAttribute("quarterID").toString()));
			httpSession.setAttribute("quarterID", quarter.getQuaterlyId());

			log.info("test getQuaterlyId >>"+quarter.getQuaterlyId());

			pkid = postRegService.saveUpdatePostRegistration(baseObject);
			log.info("In updateProjectScheduleDetails pkid >>"+pkid);
			httpSession.setAttribute("pkid", pkid);
			mv = new ModelAndView("redirect:/quarter/quaterlyUpdate");
		} catch (Exception ex) {
			log.error(ex.getMessage(),ex);
			throw ex;
		}
		return mv;
	}

	@RequestMapping(value = "quarter/updatequarterAmenityDetails", method = RequestMethod.POST)
	public ModelAndView updateAmenityDetails(
			@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = null;
		Long pkid = null;
		ProjectRegistrationModel baseObject;
		try {
			baseObject = postRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			baseObject = quaterlyUpdateService.saveAmenityDetails(baseObject, request,Long.parseLong(httpSession.getAttribute("quarterID").toString()));

			ProjectQuaterlyUpdate quarter=(ProjectQuaterlyUpdate)commonDao.getObject(ProjectQuaterlyUpdate.class, Long.parseLong(httpSession.getAttribute("quarterID").toString()));
			httpSession.setAttribute("quarterID", quarter.getQuaterlyId());

			log.info("test getQuaterlyId >>"+quarter.getQuaterlyId());

			pkid = postRegService.saveUpdatePostRegistration(baseObject);
			log.info("In updateProjectScheduleDetails pkid >>"+pkid);
			httpSession.setAttribute("pkid", pkid);
			mv = new ModelAndView("redirect:/quarter/quaterlyUpdate");
		} catch (Exception ex) {
			log.error(ex.getMessage(),ex);
			throw ex;
		}
		return mv;
	}

	@RequestMapping(value = "quarter/updatequarterMasonryDetails", method = RequestMethod.POST)
	public ModelAndView updateMasonryDetails(
			@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = null;
		Long pkid = null;
		ProjectRegistrationModel baseObject;
		try {
			baseObject = postRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			baseObject = quaterlyUpdateService.saveMasonryDetails(baseObject, request,Long.parseLong(httpSession.getAttribute("quarterID").toString()));

			ProjectQuaterlyUpdate quarter=(ProjectQuaterlyUpdate)commonDao.getObject(ProjectQuaterlyUpdate.class, Long.parseLong(httpSession.getAttribute("quarterID").toString()));
			httpSession.setAttribute("quarterID", quarter.getQuaterlyId());

			log.info("test getQuaterlyId >>"+quarter.getQuaterlyId());

			pkid = postRegService.saveUpdatePostRegistration(baseObject);
			log.info("In updateProjectScheduleDetails pkid >>"+pkid);
			httpSession.setAttribute("pkid", pkid);
			mv = new ModelAndView("redirect:/quarter/quaterlyUpdate");
		} catch (Exception ex) {
			log.error(ex.getMessage(),ex);
			throw ex;
		}
		return mv;
	}

	@RequestMapping(value = "quarter/updateQuarterFinInteriorDetails", method = RequestMethod.POST)
	public ModelAndView updateFinishingInteriorDetails(
			@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = null;
		Long pkid = null;
		ProjectRegistrationModel baseObject;
		try {
			baseObject = postRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			baseObject = quaterlyUpdateService.saveFinishingInteriorDetails(baseObject, request,Long.parseLong(httpSession.getAttribute("quarterID").toString()));

			ProjectQuaterlyUpdate quarter=(ProjectQuaterlyUpdate)commonDao.getObject(ProjectQuaterlyUpdate.class, Long.parseLong(httpSession.getAttribute("quarterID").toString()));
			httpSession.setAttribute("quarterID", quarter.getQuaterlyId());

			log.info("test getQuaterlyId >>"+quarter.getQuaterlyId());

			pkid = postRegService.saveUpdatePostRegistration(baseObject);
			log.info("In updateProjectScheduleDetails pkid >>"+pkid);
			httpSession.setAttribute("pkid", pkid);
			mv = new ModelAndView("redirect:/quarter/quaterlyUpdate");
		} catch (Exception ex) {
			log.error(ex.getMessage(),ex);
			throw ex;
		}
		return mv;
	}

	@RequestMapping(value = "quarter/updateInfrastructureDetails", method = RequestMethod.POST)
	public ModelAndView updateInfrastructureDetails(@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request)  throws Exception {
		ModelAndView mv = null;
		Long pkid = null;
		ProjectRegistrationModel baseObject;
		try {
			baseObject = postRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			baseObject = quaterlyUpdateService.updateInfrastructureDetails(baseObject, request,Long.parseLong(httpSession.getAttribute("quarterID").toString()));

			ProjectQuaterlyUpdate quarter=(ProjectQuaterlyUpdate)commonDao.getObject(ProjectQuaterlyUpdate.class, Long.parseLong(httpSession.getAttribute("quarterID").toString()));
			httpSession.setAttribute("quarterID", quarter.getQuaterlyId());

			log.info("test getQuaterlyId >>"+quarter.getQuaterlyId());

			pkid = postRegService.saveUpdatePostRegistration(baseObject);
			log.info("In updateBuildingDetails pkid : >>"+pkid);
			httpSession.setAttribute("pkid", pkid);
			mv = new ModelAndView("redirect:/quarter/quaterlyUpdate");
		} catch (Exception ex) {
			log.error(ex.getMessage(),ex);
			throw ex;
		}
		return mv;
	}

	@RequestMapping(value = "quarter/updateExternalstructureDetails", method = RequestMethod.POST)
	public ModelAndView updateExternalInfrastructureDetails(@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request)  throws Exception {
		ModelAndView mv = null;
		Long pkid = null;
		ProjectRegistrationModel baseObject;
		try {
			baseObject = postRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			baseObject = quaterlyUpdateService.updateExternalInfrastructureDetails(baseObject, request,Long.parseLong(httpSession.getAttribute("quarterID").toString()));

			ProjectQuaterlyUpdate quarter=(ProjectQuaterlyUpdate)commonDao.getObject(ProjectQuaterlyUpdate.class, Long.parseLong(httpSession.getAttribute("quarterID").toString()));
			httpSession.setAttribute("quarterID", quarter.getQuaterlyId());

			log.info("test getQuaterlyId >>"+quarter.getQuaterlyId());

			pkid = postRegService.saveUpdatePostRegistration(baseObject);
			log.info("In updateBuildingDetails pkid : >>"+pkid);
			httpSession.setAttribute("pkid", pkid);
			mv = new ModelAndView("redirect:/quarter/quaterlyUpdate");
		} catch (Exception ex) {
			log.error(ex.getMessage(),ex);
			throw ex;
		}
		return mv;
	}

	@RequestMapping(value = "quarter/updateCommonAreaDetails", method = RequestMethod.POST)
	public ModelAndView updateCommonAreaDetails(@ModelAttribute("projectRegistrationModel") ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request)  throws Exception {
		ModelAndView mv = null;
		Long pkid = null;
		ProjectRegistrationModel baseObject;
		try {
			baseObject = postRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			baseObject = quaterlyUpdateService.updateCommonAreaDetails(baseObject, request,Long.parseLong(httpSession.getAttribute("quarterID").toString()));

			ProjectQuaterlyUpdate quarter=(ProjectQuaterlyUpdate)commonDao.getObject(ProjectQuaterlyUpdate.class, Long.parseLong(httpSession.getAttribute("quarterID").toString()));
			httpSession.setAttribute("quarterID", quarter.getQuaterlyId());

			log.info("test getQuaterlyId >>"+quarter.getQuaterlyId());

			pkid = postRegService.saveUpdatePostRegistration(baseObject);
			log.info("In updateBuildingDetails pkid : >>"+pkid);
			httpSession.setAttribute("pkid", pkid);
			mv = new ModelAndView("redirect:/quarter/quaterlyUpdate");
		} catch (Exception ex) {
			log.error(ex.getMessage(),ex);
			throw ex;
		}
		return mv;
	}

	@RequestMapping(value="quarter/projectQuarterDetails")
	public ModelAndView projectQuarterDetails(long quarterId){
		ProjectRegistrationModel baseObject = null;
		ModelAndView mv = null;
		try {
			baseObject = postRegService.getProjectRegByPk(Long.parseLong(httpSession.getAttribute("pkid").toString()));
			if (baseObject.getRegistrationType().equalsIgnoreCase(ReraConstants.INDVISUAL_REG)) {
				mv = new ModelAndView("project.submitQuarterInd");
			} else {
				mv = new ModelAndView("project.submitQuarterComp");
			}
			
			ProjectQuaterlyUpdate quarter=(ProjectQuaterlyUpdate) commonDao.getObject(ProjectQuaterlyUpdate.class, quarterId);
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
			
			ProjectQuaterlyUpdate qudm = null;

			qudm=(ProjectQuaterlyUpdate) commonDao.getObject(ProjectQuaterlyUpdate.class, quarterId);
			
			mv.addObject("qudm", qudm);
			
			ProjectSummary psm = baseObject.getProjectDetailsModel().getProjectSummary();
			mv.addObject("psm", psm);
			
			List<FinalApproval> finalApprovalList = baseObject.getProjectDetailsModel().getFinalApproval();
			mv.addObject("finalApprovalList", finalApprovalList);
			
			ProjectScheduleModel projectScheduleModel = baseObject.getProjectDetailsModel().getProjectScheduleModel();
			mv.addObject("projectScheduleModel", projectScheduleModel);

		}catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return mv;
	}

}
