package in.gov.rera.transaction.postregistration.service.impl;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.ResourceBundle;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.poi.EncryptedDocumentException;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.CreationHelper;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.DataValidation;
import org.apache.poi.ss.usermodel.DataValidationConstraint;
import org.apache.poi.ss.usermodel.DataValidationHelper;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.apache.poi.ss.util.CellRangeAddressList;
import org.apache.poi.xssf.usermodel.XSSFDataValidation;
import org.apache.poi.xssf.usermodel.XSSFDataValidationConstraint;
import org.apache.poi.xssf.usermodel.XSSFDataValidationHelper;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import in.gov.rera.common.dao.impl.CommonDao;
import in.gov.rera.common.util.AcknowledgeUtilty;
import in.gov.rera.dms.beans.Document;
import in.gov.rera.dms.service.IDocumentService;
import in.gov.rera.dms.util.ContentUtil;
import in.gov.rera.transaction.postregistration.dao.IAmountWithdrawdBankDetlsDAO;
import in.gov.rera.transaction.postregistration.dao.IProjectScheduleDAO;
import in.gov.rera.transaction.postregistration.dao.IProjectWorkDAO;
import in.gov.rera.transaction.postregistration.model.AmountWithdrawlBankDetailsModel;
import in.gov.rera.transaction.postregistration.model.ApprovalCostDetailsModel;
import in.gov.rera.transaction.postregistration.model.ApprovalCostModel;
import in.gov.rera.transaction.postregistration.model.ConstructionCostDetails;
import in.gov.rera.transaction.postregistration.model.ConstructionCostmodel;
import in.gov.rera.transaction.postregistration.model.ExternalInfrastructureWorksModel;
import in.gov.rera.transaction.postregistration.model.FinalApproval;
import in.gov.rera.transaction.postregistration.model.FinishingInteriorModel;
import in.gov.rera.transaction.postregistration.model.FloorDetailsModel;
import in.gov.rera.transaction.postregistration.model.LandAcquisitionCostModel;
import in.gov.rera.transaction.postregistration.model.LandCostDetailsModel;
import in.gov.rera.transaction.postregistration.model.PostRegAgentDetails;
import in.gov.rera.transaction.postregistration.model.ProjectAmenityDetails;
import in.gov.rera.transaction.postregistration.model.ProjectApartmentDetails;
import in.gov.rera.transaction.postregistration.model.ProjectCommonAreaDetails;
import in.gov.rera.transaction.postregistration.model.ProjectInternalInfrastructureDetails;
import in.gov.rera.transaction.postregistration.model.ProjectJDADetails;
import in.gov.rera.transaction.postregistration.model.ProjectJDALandOwnerDetails;
import in.gov.rera.transaction.postregistration.model.ProjectJDAPromoterDetails;
import in.gov.rera.transaction.postregistration.model.ProjectMasnoryModel;
import in.gov.rera.transaction.postregistration.model.ProjectScheduleModel;
import in.gov.rera.transaction.postregistration.model.ProjectSummary;
import in.gov.rera.transaction.postregistration.model.ProjectWorkModel;
import in.gov.rera.transaction.postregistration.model.SubStructureModel;
import in.gov.rera.transaction.postregistration.model.SuperStructureModel;
import in.gov.rera.transaction.postregistration.model.TowerDetailsModel;
import in.gov.rera.transaction.postregistration.model.TowerUnitDetailsExcel;
import in.gov.rera.transaction.postregistration.model.TransferDevRightsDetailsModel;
import in.gov.rera.transaction.postregistration.model.WebSiteUrlDetailsModel;
import in.gov.rera.transaction.postregistration.plots.dao.IPlotAmountWithdrawdBankDetlsDAO;
import in.gov.rera.transaction.postregistration.plots.model.PlotsAmountWithdrawlBankDetailsModel;
import in.gov.rera.transaction.postregistration.service.IPostRegService;
import in.gov.rera.transaction.projectregistration.dao.IProjectRegistrationDAO;
import in.gov.rera.transaction.projectregistration.model.ProjectRegistrationModel;

@Service(value = "postRegService")
@Scope("request")
public class PostRegServiceImpl implements IPostRegService {

	static Logger log= Logger.getLogger(PostRegServiceImpl.class);

	@Autowired
	IProjectRegistrationDAO<ProjectRegistrationModel, Long> postRegDAO;

	@Autowired
	IProjectWorkDAO<ProjectWorkModel, Long> projectWorkDAO;

	@Autowired
	IProjectScheduleDAO<ProjectScheduleModel, Long> ProjectScheduleDAO;

	@Autowired
	ContentUtil contentUtil;

	@Autowired(required = true)
	IDocumentService<Document, Integer> documentService;

	@Autowired
	IAmountWithdrawdBankDetlsDAO<AmountWithdrawlBankDetailsModel, Long> AmountWithdrawdBankDetlsDAO;

	@Autowired
	CommonDao<Object, Long> commonDao;

	@Autowired
	IPlotAmountWithdrawdBankDetlsDAO<PlotsAmountWithdrawlBankDetailsModel, Long> plotAmountWithdrawdBankDetlsDAO;


	@Override
	public List<ProjectRegistrationModel> getPostRegProjectsByLoginId(String loginId) {
		DetachedCriteria dt= DetachedCriteria.forClass(ProjectRegistrationModel.class,"pr");
		dt.createAlias("pr.projectUser", "us");
		dt.add(Restrictions.eq("us.loginId", loginId));
		List<ProjectRegistrationModel> list=postRegDAO.getProjectList(dt);
		if(list!=null && list.size()>0){
			return list;
		}
		/*String  emailId = list.get(0).getProjectUser().getEmailId();
			DetachedCriteria projListDt= DetachedCriteria.forClass(ProjectRegistrationModel.class,"prj");
			projListDt.createAlias("prj.projectUser", "us1");
			projListDt.add(Restrictions.eq("us1.emailId", emailId));
			List<ProjectRegistrationModel> AllProjList=postRegDAO.getProjectList(projListDt);
			if(AllProjList!=null && AllProjList.size()>0){
				return AllProjList;
			}*/
		return null;
	}

	@Override
	public Long saveUpdatePostRegistration(ProjectRegistrationModel entity) throws Exception {
		postRegDAO.saveOrUpdate(entity);
		return entity.getProjectRegId();
	}

	public ProjectScheduleModel getProjectScheduleByPk(Long pk) throws Exception {
		return ProjectScheduleDAO.get(pk);
	}

	@Override
	public ProjectRegistrationModel getProjectRegByPk(Long pk) throws Exception {
		return postRegDAO.get(pk);
	}

	@Override
	public ProjectRegistrationModel saveProjScheduleDetails(ProjectRegistrationModel projectRegistrationModel,HttpServletRequest request) throws Exception {
		List<SubStructureModel> subStructureList= new ArrayList<SubStructureModel>();
		String[] typeOfWorkArr = request.getParameterValues("typeOfWork");
		boolean isSid=false;
		String sid = request.getParameter("projectScheduleId");
		SubStructureModel subStructureModel = null;
		ProjectScheduleModel projectScheduleModel = null;
		try {
			String[] projWorkIdArr = request.getParameterValues("subStructureId");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

			if (typeOfWorkArr != null && typeOfWorkArr.length > 0) {
				for(int i=0;i< typeOfWorkArr.length; i++) {
					if (typeOfWorkArr[i] != null) {
						if (projWorkIdArr != null && projWorkIdArr.length > i && projWorkIdArr[i] != null && projWorkIdArr[i].trim().length() > 0) {
							subStructureModel = (SubStructureModel)commonDao.getObject(SubStructureModel.class,Long.parseLong(projWorkIdArr[i]));
							projectScheduleModel = projectRegistrationModel.getProjectDetailsModel().getProjectScheduleModel();
						} else {
							log.info("created ProjectScheduleModel");
							if(sid != ""  && sid.length()>0) {
								subStructureModel = new SubStructureModel();
							}else {
								isSid = true;
								projectScheduleModel =  new ProjectScheduleModel();
								subStructureModel = new SubStructureModel();
							}
						}
						subStructureModel.setTypeOfWork(typeOfWorkArr[i]);
						if(request.getParameterValues("estimatedFrmDate")[i] != null && request.getParameterValues("estimatedFrmDate")[i] != "" &&  request.getParameterValues("estimatedFrmDate")[i].length()>0 ) {
							Date date = sdf.parse(request.getParameterValues("estimatedFrmDate")[i]);
							log.info("date "+date);
							Calendar estimatedFrmDateCal = Calendar.getInstance();
							estimatedFrmDateCal.setTime(date);
							subStructureModel.setEstimatedFrmDate(estimatedFrmDateCal);
						}
						if(request.getParameterValues("estimatedToDate")[i] != null && request.getParameterValues("estimatedToDate")[i] != "" &&  request.getParameterValues("estimatedToDate")[i].length()>0) {
							Date estimatedToDate = sdf.parse(request.getParameterValues("estimatedToDate")[i]);
							Calendar estimatedToDateCal = Calendar.getInstance();
							estimatedToDateCal.setTime(estimatedToDate);
							subStructureModel.setEstimatedToDate(estimatedToDateCal);
						}
						subStructureModel.setIsApplicable(request.getParameter("isApplicable_"+i));
						subStructureList.add(subStructureModel);
					}


				}
				if(isSid) {
					projectScheduleModel.setSubStructureList(subStructureList);
					projectRegistrationModel.getProjectDetailsModel().setProjectScheduleModel(projectScheduleModel);
					isSid = false;
				}else {

					projectRegistrationModel.getProjectDetailsModel().getProjectScheduleModel().setSubStructureList(subStructureList);
				}
			}
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return projectRegistrationModel;
	}

	@Override
	public ProjectRegistrationModel saveSuperStructureDetails(ProjectRegistrationModel projectRegistrationModel,HttpServletRequest request) throws Exception {
		List<SuperStructureModel> supStructureList= new ArrayList<SuperStructureModel>();
		String[] typeOfWorkArr = request.getParameterValues("typeOfWork");

		String sid = request.getParameter("projectScheduleId");
		SuperStructureModel supStructureModel = null;
		ProjectScheduleModel projectScheduleModel = null;
		boolean isSid=false;
		try {
			String[] projWorkIdArr = request.getParameterValues("supStructureId");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

			if (typeOfWorkArr != null && typeOfWorkArr.length > 0) {
				for(int i=0;i< typeOfWorkArr.length; i++) {
					if (typeOfWorkArr[i] != null) {
						if (projWorkIdArr != null && projWorkIdArr.length > i && projWorkIdArr[i] != null && projWorkIdArr[i].trim().length() > 0) {
							supStructureModel = (SuperStructureModel)commonDao.getObject(SuperStructureModel.class,Long.parseLong(projWorkIdArr[i]));
							projectScheduleModel = projectRegistrationModel.getProjectDetailsModel().getProjectScheduleModel();
						} else {
							log.info("created ProjectScheduleModel");
							if(sid != ""  && sid.length()>0) {
								supStructureModel = new SuperStructureModel();
							}else {
								isSid = true;
								projectScheduleModel =  new ProjectScheduleModel();
								supStructureModel = new SuperStructureModel();
							}

						}
						supStructureModel.setTypeOfWork(typeOfWorkArr[i]);
						if(request.getParameterValues("estimatedFrmDate")[i] != null && request.getParameterValues("estimatedFrmDate")[i] != "" &&  request.getParameterValues("estimatedFrmDate")[i].length()>0) {
							Date date = sdf.parse(request.getParameterValues("estimatedFrmDate")[i]);
							log.info("date "+date);
							Calendar estimatedFrmDateCal = Calendar.getInstance();
							estimatedFrmDateCal.setTime(date);
							supStructureModel.setEstimatedFrmDate(estimatedFrmDateCal);
						}
						if(request.getParameterValues("estimatedToDate")[i] != null && request.getParameterValues("estimatedToDate")[i] != "" && request.getParameterValues("estimatedToDate")[i].length()>0) {
							Date estimatedToDate = sdf.parse(request.getParameterValues("estimatedToDate")[i]);
							Calendar estimatedToDateCal = Calendar.getInstance();
							estimatedToDateCal.setTime(estimatedToDate);
							supStructureModel.setEstimatedToDate(estimatedToDateCal);
						}
						supStructureModel.setIsApplicable(request.getParameter("isApplicable_"+i));
						supStructureList.add(supStructureModel);
					}
				}

				if(isSid) {
					projectScheduleModel.setSupStructureList(supStructureList);
					projectRegistrationModel.getProjectDetailsModel().setProjectScheduleModel(projectScheduleModel);
					isSid = false;
				}else {

					projectRegistrationModel.getProjectDetailsModel().getProjectScheduleModel().setSupStructureList(supStructureList);
				}
			}
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return projectRegistrationModel;
	}

	@Override
	public ProjectRegistrationModel saveFinInteriorDetails(ProjectRegistrationModel projectRegistrationModel,HttpServletRequest request) throws Exception {
		List<FinishingInteriorModel> finishingInteriorList= new ArrayList<FinishingInteriorModel>();
		String[] typeOfWorkArr = request.getParameterValues("typeOfWork");
		boolean isSid=false;
		String sid = request.getParameter("projectScheduleId");
		FinishingInteriorModel finishingInteriorModel = null;
		ProjectScheduleModel projectScheduleModel = null;
		try {
			String[] projWorkIdArr = request.getParameterValues("finishingInteriorId");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

			if (typeOfWorkArr != null && typeOfWorkArr.length > 0) {
				for(int i=0;i< typeOfWorkArr.length; i++) {
					if (typeOfWorkArr[i] != null) {
						if (projWorkIdArr != null && projWorkIdArr.length > i && projWorkIdArr[i] != null && projWorkIdArr[i].trim().length() > 0) {
							finishingInteriorModel = (FinishingInteriorModel)commonDao.getObject(FinishingInteriorModel.class,Long.parseLong(projWorkIdArr[i]));
							projectScheduleModel = projectRegistrationModel.getProjectDetailsModel().getProjectScheduleModel();
						} else {
							log.info("created ProjectScheduleModel");
							if(sid != ""  && sid.length()>0) {

								finishingInteriorModel = new FinishingInteriorModel();
							}else {
								isSid = true;
								projectScheduleModel =  new ProjectScheduleModel();
								finishingInteriorModel = new FinishingInteriorModel();
							}

						}
						finishingInteriorModel.setTypeOfWork(typeOfWorkArr[i]);
						if(request.getParameterValues("estimatedFrmDate")[i] != null && request.getParameterValues("estimatedFrmDate")[i] != "" &&  request.getParameterValues("estimatedFrmDate")[i].length()>0 ) {
							Date date = sdf.parse(request.getParameterValues("estimatedFrmDate")[i]);
							log.info("date "+date);
							Calendar estimatedFrmDateCal = Calendar.getInstance();
							estimatedFrmDateCal.setTime(date);
							finishingInteriorModel.setEstimatedFrmDate(estimatedFrmDateCal);
						}
						if(request.getParameterValues("estimatedToDate")[i] != null && request.getParameterValues("estimatedToDate")[i] != "" &&  request.getParameterValues("estimatedToDate")[i].length()>0 ) {
							Date estimatedToDate = sdf.parse(request.getParameterValues("estimatedToDate")[i]);
							Calendar estimatedToDateCal = Calendar.getInstance();
							estimatedToDateCal.setTime(estimatedToDate);
							finishingInteriorModel.setEstimatedToDate(estimatedToDateCal);
						}
						finishingInteriorModel.setIsApplicable(request.getParameter("isApplicable_"+i));
						finishingInteriorList.add(finishingInteriorModel);
					}


				}
				//Some times project schedule id not created for the first project
				if(isSid ) {
					projectScheduleModel.setFinishingOrInteriorWorkList(finishingInteriorList);
					projectRegistrationModel.getProjectDetailsModel().setProjectScheduleModel(projectScheduleModel);
					isSid = false;
				}else {

					projectRegistrationModel.getProjectDetailsModel().getProjectScheduleModel().setFinishingOrInteriorWorkList(finishingInteriorList);
				}

			}
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return projectRegistrationModel;
	}

	@Override
	public ProjectRegistrationModel saveMasonaryDetails(ProjectRegistrationModel projectRegistrationModel,HttpServletRequest request) throws Exception {
		List<ProjectMasnoryModel> projectWorkList= new ArrayList<ProjectMasnoryModel>();
		String[] typeOfWorkArr = request.getParameterValues("typeOfWork");
		boolean isSid=false;
		String sid = request.getParameter("projectScheduleId");
		ProjectMasnoryModel masnoryModel = null;
		ProjectScheduleModel projectScheduleModel = null;
		try {
			String[] projWorkIdArr = request.getParameterValues("masnoryId");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

			if (typeOfWorkArr != null && typeOfWorkArr.length > 0) {
				for(int i=0;i< typeOfWorkArr.length; i++) {
					if (typeOfWorkArr[i] != null) {
						if (projWorkIdArr != null && projWorkIdArr.length > i && projWorkIdArr[i] != null && projWorkIdArr[i].trim().length() > 0) {
							masnoryModel = (ProjectMasnoryModel)commonDao.getObject(ProjectMasnoryModel.class,Long.parseLong(projWorkIdArr[i]));
							projectScheduleModel = projectRegistrationModel.getProjectDetailsModel().getProjectScheduleModel();
						} else {
							log.info("created ProjectScheduleModel");
							if(sid != ""  && sid.length()>0) {
								masnoryModel = new ProjectMasnoryModel();
							}else {
								isSid = true;
								projectScheduleModel =  new ProjectScheduleModel();
								masnoryModel = new ProjectMasnoryModel();
							}

						}
						masnoryModel.setTypeOfWork(typeOfWorkArr[i]);
						if(request.getParameterValues("estimatedFrmDate")[i] != null && request.getParameterValues("estimatedFrmDate")[i] != "" && request.getParameterValues("estimatedFrmDate")[i].length()>0 ) {
							Date date = sdf.parse(request.getParameterValues("estimatedFrmDate")[i]);
							log.info("date "+date);
							Calendar estimatedFrmDateCal = Calendar.getInstance();
							estimatedFrmDateCal.setTime(date);
							masnoryModel.setEstimatedFrmDate(estimatedFrmDateCal);
						}
						if(request.getParameterValues("estimatedToDate")[i] != null && request.getParameterValues("estimatedToDate")[i] != " " && request.getParameterValues("estimatedToDate")[i].length()>0 ) {
							Date estimatedToDate = sdf.parse(request.getParameterValues("estimatedToDate")[i]);
							Calendar estimatedToDateCal = Calendar.getInstance();
							estimatedToDateCal.setTime(estimatedToDate);
							masnoryModel.setEstimatedToDate(estimatedToDateCal);
						}
						masnoryModel.setIsApplicable(request.getParameter("isApplicable_"+i));
						projectWorkList.add(masnoryModel);
					}

				}
				//Some times project schedule id not created for the first project
				if(isSid) {
					projectScheduleModel.setMasonryList(projectWorkList);
					projectRegistrationModel.getProjectDetailsModel().setProjectScheduleModel(projectScheduleModel);
					isSid = false;
				}else {

					projectRegistrationModel.getProjectDetailsModel().getProjectScheduleModel().setMasonryList(projectWorkList);
				}
			}
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return projectRegistrationModel;
	}

	@Override
	public ProjectRegistrationModel saveOrUpdateConstructionCostDetails(
			ProjectRegistrationModel projectRegistrationModel, HttpServletRequest request,MultipartFile certFromChartedAcc, MultipartFile certificateIssuedByStructuralEng,
			MultipartFile certificateIssuedByArchitect) throws Exception {
		List<ConstructionCostDetails> consCostList = new ArrayList<ConstructionCostDetails>();
		String[] consCostParticularArr = request.getParameterValues("consCostParticular");
		String[] estConsCostArr = request.getParameterValues("estConsCost");
		String[] conStructionIdArr = request.getParameterValues("constructionCostDetailsId");
		ConstructionCostDetails constructionCost=null;
		ConstructionCostmodel constructionCostmodel = null;
		Document doc = null;

		try {
			if(projectRegistrationModel.getProjectDetailsModel().getConstructionCostModel()!=null) {
				constructionCostmodel=(ConstructionCostmodel)projectRegistrationModel.getProjectDetailsModel().getConstructionCostModel();
			}else {
				constructionCostmodel=new ConstructionCostmodel();
			}

			if (consCostParticularArr != null && consCostParticularArr.length > 0) {
				for (int i = 0; i < estConsCostArr.length; i++) {
					if (conStructionIdArr != null && conStructionIdArr.length > i && conStructionIdArr[i] != null && conStructionIdArr[i].trim().length() > 0) {
						constructionCost = (ConstructionCostDetails)commonDao.getObject(ConstructionCostDetails.class,Long.parseLong(conStructionIdArr[i]));
					} else {
						constructionCost = new ConstructionCostDetails();
					}
					constructionCost.setConsCostParticular(consCostParticularArr[i]);
					constructionCost.setIsApplicable(request.getParameter("isApplicable_"+i));
					if(request.getParameter("isApplicable_"+i).equals("Yes")) {
						constructionCost.setEstConsCost(Long.parseLong((estConsCostArr[i])));

					}
					consCostList.add(constructionCost);
				}
				constructionCostmodel.setConstructionCostList(consCostList);
			}


			constructionCostmodel.setEstTotConstructionCost(Long.parseLong(request.getParameter("estTotConstructionCost")));
			constructionCostmodel.setTotProjectCost(Long.parseLong(request.getParameter("totProjectCost")));
			if(request.getParameter("certIssuedDocId") != null && request.getParameter("certIssuedDocId").trim().length() > 0 ) {
				doc = documentService.getDoc(Integer.parseInt(request.getParameter("certIssuedDocId")));
				MultipartFile obj = certFromChartedAcc;
				doc.setFileName(obj.getOriginalFilename());
				doc.setMimeType(obj.getContentType());
				doc.setInputStream(obj.getInputStream());
				contentUtil.saveDocument(doc);
				documentService.updateDoc(doc);
			}else {
				doc = new Document();
				doc.setFileName(certFromChartedAcc.getOriginalFilename());
				doc.setDocumentType("QUATER_UPDT");
				doc.setFolderId("" + projectRegistrationModel.getProjectRegId());
				doc.setMimeType(certFromChartedAcc.getContentType());
				doc.setInputStream(certFromChartedAcc.getInputStream());
				contentUtil.saveDocument(doc);
				documentService.saveDoc(doc);
			}
			constructionCostmodel.setCertFromChartedAcc(doc);

			// certificateIssuedByArchitect doc saving
			if(request.getParameter("certIssuedArcDocId") != null && request.getParameter("certIssuedArcDocId").trim().length() > 0 ) {
				doc = documentService.getDoc(Integer.parseInt(request.getParameter("certIssuedArcDocId")));
				doc.setFileName(certificateIssuedByArchitect.getOriginalFilename());
				doc.setMimeType(certificateIssuedByArchitect.getContentType());
				doc.setInputStream(certificateIssuedByArchitect.getInputStream());
				contentUtil.saveDocument(doc);
				documentService.updateDoc(doc);
			}else {
				doc = new Document();
				doc.setFileName(certificateIssuedByArchitect.getOriginalFilename());
				doc.setDocumentType("QUATER_UPDT");
				doc.setFolderId("" + projectRegistrationModel.getProjectRegId());
				doc.setMimeType(certificateIssuedByArchitect.getContentType());
				doc.setInputStream(certificateIssuedByArchitect.getInputStream());
				contentUtil.saveDocument(doc);
				documentService.saveDoc(doc);
			}
			constructionCostmodel.setCertificateIssuedByArchitect(doc); 

			// certificateIssuedByStructuralEng doc saving
			if(request.getParameter("certIssuedStructuralEngDocId") != null && request.getParameter("certIssuedStructuralEngDocId").trim().length() > 0 ) {
				doc = documentService.getDoc(Integer.parseInt(request.getParameter("certIssuedStructuralEngDocId")));
				//doc.setFileName(certificateIssuedByStructuralEng.getOriginalFilename());
				doc.setMimeType(certificateIssuedByStructuralEng.getContentType());
				doc.setInputStream(certificateIssuedByStructuralEng.getInputStream());
				contentUtil.saveDocument(doc);
				documentService.updateDoc(doc);
			}else {
				doc = new Document();
				doc.setFileName(certificateIssuedByStructuralEng.getOriginalFilename());
				doc.setDocumentType("QUATER_UPDT");
				doc.setFolderId("" + projectRegistrationModel.getProjectRegId());
				doc.setMimeType(certificateIssuedByStructuralEng.getContentType());
				doc.setInputStream(certificateIssuedByStructuralEng.getInputStream());
				contentUtil.saveDocument(doc);
				documentService.saveDoc(doc);
			}
			constructionCostmodel.setCertificateIssuedByStructuralEng(doc);
		}	
		catch (Exception e) {
			e.printStackTrace();
			log.error(e.getMessage(), e);
			throw e;
		}
		projectRegistrationModel.getProjectDetailsModel().setConstructionCostModel(constructionCostmodel);
		return projectRegistrationModel;
	}

	@Override
	public ProjectRegistrationModel saveOrUpdateLandAcquiCostDetails(
			ProjectRegistrationModel projectRegistrationModel, HttpServletRequest request) throws Exception {
		Document doc = null;
		List<AmountWithdrawlBankDetailsModel> AmountWithdrawnList = new ArrayList<AmountWithdrawlBankDetailsModel>();
		LandCostDetailsModel costmodel = null;
		LandAcquisitionCostModel acquiModel = null;
		AmountWithdrawlBankDetailsModel amountModel = null;

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			if(projectRegistrationModel.getProjectDetailsModel().getLandCostDetailsModel() != null) {
				amountModel = AmountWithdrawdBankDetlsDAO.getAmountWithdrawdBankDetlsModelById(Long.parseLong(request.getParameter("amtwithdrawBankDelsId")));
				acquiModel = projectRegistrationModel.getProjectDetailsModel().getLandCostDetailsModel().getLandAcquisitionCostModel();
				costmodel = projectRegistrationModel.getProjectDetailsModel().getLandCostDetailsModel();
			}else {
				costmodel = new LandCostDetailsModel();
				acquiModel = new LandAcquisitionCostModel();
				amountModel = new AmountWithdrawlBankDetailsModel();
			}
			//acquiModel.setLandTitle(request.getParameter("landTitle"));
			acquiModel.setCostOfOwnership(Long.parseLong(request.getParameter("costOfOwnership"))); 
			//amountModel.setAmount(Long.parseLong(request.getParameter("amount")));
			acquiModel.setLandType(request.getParameter("landType"));

			if(request.getParameter("landType").equals("JDA With Land owner")) {
				acquiModel.setNumberOfLandowners(Integer.parseInt(request.getParameter("numberOfLandowners")));
				acquiModel.setNumberOfPromoters(Integer.parseInt(request.getParameter("numberOfPromoters")));
			}

			/*if(amountModel != null & amountModel.getCertFromChartedAcc() !=null) {
				doc = amountModel.getCertFromChartedAcc();
				doc.setFileName(certFromChartedAcc.getOriginalFilename());
				doc.setMimeType(certFromChartedAcc.getContentType());
				doc.setInputStream(certFromChartedAcc.getInputStream());
				contentUtil.saveDocument(doc);
				documentService.updateDoc(doc);
			}else {
				doc = new Document();
				doc.setFileName(certFromChartedAcc.getOriginalFilename());
				doc.setDocumentType("POST_REG");
				doc.setFolderId("" + projectRegistrationModel.getProjectRegId());
				doc.setMimeType(certFromChartedAcc.getContentType());
				doc.setInputStream(certFromChartedAcc.getInputStream());
				contentUtil.saveDocument(doc);
				documentService.saveDoc(doc);
			}
			amountModel.setCertFromChartedAcc(doc);

			if(request.getParameter("amtWithDrawnDate") != null && request.getParameter("amtWithDrawnDate") != "") {
				Date date = sdf.parse(request.getParameter("amtWithDrawnDate"));
				Calendar dateCal = Calendar.getInstance();
				dateCal.setTime(date);
				amountModel.setAmtWithDrawnDate(dateCal);
			}*/
			AmountWithdrawnList.add(amountModel);
			acquiModel.setAmountWithdrawlBankDetailsModel(AmountWithdrawnList);
			costmodel.setLandAcquisitionCostModel(acquiModel);
		}catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		projectRegistrationModel.getProjectDetailsModel().setLandCostDetailsModel(costmodel);
		return projectRegistrationModel;
	}

	// TDR
	@Override
	public ProjectRegistrationModel saveOrUpdateTDRDetails(ProjectRegistrationModel projectRegistrationModel, 
			HttpServletRequest request,MultipartFile[]  certFromChartedAcc,MultipartFile  tdrPurchaseOrSaleDoc) throws Exception {

		Document doc = null;
		List<AmountWithdrawlBankDetailsModel> amountWithdrawnList = new ArrayList<AmountWithdrawlBankDetailsModel>();
		LandCostDetailsModel costmodel = null;
		TransferDevRightsDetailsModel tdrModel = null;
		AmountWithdrawlBankDetailsModel amountModel = null;

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String isTdrApplicable =  request.getParameter("isTdrApplicable");
		String[] amount = request.getParameterValues("amount");
		String[] amtwithdrawBankDelsId = request.getParameterValues("amtwithdrawBankDelsId");

		String[] certFromChartedAccDocId = request.getParameterValues("certFromChartedAccDocId"); 
		//log.info("isTdrApplicable :"+isTdrApplicable +"tdrSanctionArea :"+tdrSanctionArea +"certFromChartedAccDocId "+certFromChartedAccDocId );

		try {
			if(projectRegistrationModel.getProjectDetailsModel().getLandCostDetailsModel() != null) {
				costmodel = projectRegistrationModel.getProjectDetailsModel().getLandCostDetailsModel();
				if(projectRegistrationModel.getProjectDetailsModel().getLandCostDetailsModel().getTransferDevRightsDetailsModel() != null) {
					tdrModel = projectRegistrationModel.getProjectDetailsModel().getLandCostDetailsModel().getTransferDevRightsDetailsModel();
				}else {
					tdrModel = new TransferDevRightsDetailsModel();
				}
			}else {
				costmodel = new LandCostDetailsModel();
				tdrModel = new TransferDevRightsDetailsModel();
			}

			tdrModel.setIsTdrApplicable(isTdrApplicable);

			if(isTdrApplicable.equals("Yes")) {
				tdrModel.setTdrPurchaseAmt(Long.parseLong(request.getParameter("tdrPurchaseAmt")));
				tdrModel.setTdrSanctioningAuthority(request.getParameter("tdrSanctioningAuthority"));
				//tdrModel.setFarSanctioned(Long.parseLong(request.getParameter("farSanctioned")));
				tdrModel.setTdrSanctionArea(Long.parseLong(request.getParameter("tdrSanctionArea")));
				if(amount != null && amount.length > 0) {
					for(int i=0; i<amount.length;i++) {
						if( amount[i] != null) {
							if(amtwithdrawBankDelsId != null && amtwithdrawBankDelsId.length > i && amtwithdrawBankDelsId[i] != null && amtwithdrawBankDelsId[i].trim().length() > 0 ) {
								log.info("amtwithdrawBankDelsId len"+amtwithdrawBankDelsId.length +"i >>>"+i);
								log.info("amount arr size "+amount.length +"amtwithdrawBankDelsId siz"+amtwithdrawBankDelsId.length);
								amountModel = AmountWithdrawdBankDetlsDAO.getAmountWithdrawdBankDetlsModelById(Long.parseLong(amtwithdrawBankDelsId[i]));
							}else {
								amountModel = new AmountWithdrawlBankDetailsModel();
							}
							if(certFromChartedAccDocId != null && certFromChartedAccDocId.length > i && certFromChartedAccDocId[i] != null && certFromChartedAccDocId[i].trim().length() > 0 ) {
								log.info("check "+amountModel.getCertFromChartedAcc().getDocumentId() + "====="+certFromChartedAccDocId[i].trim());
								doc = documentService.getDoc(Integer.parseInt(certFromChartedAccDocId[i].trim()));
								MultipartFile obj = certFromChartedAcc[i];
								//log.info("name >>"+obj.getOriginalFilename());
								doc.setFileName(obj.getOriginalFilename());
								doc.setMimeType(obj.getContentType());
								doc.setInputStream(obj.getInputStream());
								contentUtil.saveDocument(doc);
								documentService.updateDoc(doc);
							}else {
								doc = new Document();
								doc.setFileName(certFromChartedAcc[i].getOriginalFilename());
								doc.setDocumentType("TDR_REG");
								doc.setFolderId("" + projectRegistrationModel.getProjectRegId());
								doc.setMimeType(certFromChartedAcc[i].getContentType());
								doc.setInputStream(certFromChartedAcc[i].getInputStream());
								contentUtil.saveDocument(doc);
								documentService.saveDoc(doc);
							}
							amountModel.setAmount(Long.parseLong(amount[i]));
							if(request.getParameterValues("amtWithDrawnDate")[i] != null && request.getParameterValues("amtWithDrawnDate")[i] != "") {
								Date date = sdf.parse(request.getParameterValues("amtWithDrawnDate")[i]);
								Calendar cal =  Calendar.getInstance();
								cal.setTime(date);
								amountModel.setAmtWithDrawnDate(cal);
							}
							if(certFromChartedAcc != null && certFromChartedAcc.length>0) {
								if(certFromChartedAcc[i] != null && !certFromChartedAcc[i].isEmpty()) {
									log.info("id "+certFromChartedAcc[i] + "name "+certFromChartedAcc[i].getOriginalFilename()+"getname"+certFromChartedAcc[i].getName());
								}
							}
							amountModel.setCertFromChartedAcc(doc);
						}
						amountWithdrawnList.add(amountModel);
						log.info("AmountWithdrawnList size >>"+amountWithdrawnList.size());
					}
				}
				tdrModel.setAmountWithdrawlBankDetailsModel(amountWithdrawnList);

				if(tdrModel != null & tdrModel.getTdrPurchaseOrSaleDoc() !=null) {
					doc = tdrModel.getTdrPurchaseOrSaleDoc();
					doc.setFileName(tdrPurchaseOrSaleDoc.getOriginalFilename());
					doc.setMimeType(tdrPurchaseOrSaleDoc.getContentType());
					doc.setInputStream(tdrPurchaseOrSaleDoc.getInputStream());
					contentUtil.saveDocument(doc);
					documentService.updateDoc(doc);
				}else {
					doc = new Document();
					doc.setFileName(tdrPurchaseOrSaleDoc.getOriginalFilename());
					doc.setDocumentType("POST_REG");
					doc.setFolderId("" + projectRegistrationModel.getProjectRegId());
					doc.setMimeType(tdrPurchaseOrSaleDoc.getContentType());
					doc.setInputStream(tdrPurchaseOrSaleDoc.getInputStream());
					contentUtil.saveDocument(doc);
					documentService.saveDoc(doc);
				}
				tdrModel.setTdrPurchaseOrSaleDoc(doc);
			}
			costmodel.setTransferDevRightsDetailsModel(tdrModel);
		}catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		projectRegistrationModel.getProjectDetailsModel().setLandCostDetailsModel(costmodel);
		return projectRegistrationModel;
	}

	@Override
	public ProjectRegistrationModel saveOrUpdateApprovalCostDetails(ProjectRegistrationModel projectRegistrationModel, 
			HttpServletRequest request,MultipartFile[]  certFromChartedAcc) throws Exception {
		Document doc = null;
		List<AmountWithdrawlBankDetailsModel> AmountWithdrawnList = new ArrayList<AmountWithdrawlBankDetailsModel>();
		List<ApprovalCostDetailsModel> approvalCostModelList = new ArrayList<ApprovalCostDetailsModel>();
		ApprovalCostModel approvalCostModel = null;
		LandCostDetailsModel landCostmodel = null;
		ApprovalCostDetailsModel approvalCostDetailsModel = null;
		AmountWithdrawlBankDetailsModel amountModel = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String[] amtwithdrawBankDelsId = request.getParameterValues("amtwithdrawBankDelsId");
		String[] approvalNameArr = request.getParameterValues("approvalParticular");
		String[] amountArr = request.getParameterValues("approvalAmt");
		String[] approveCostDetlsIdArr = request.getParameterValues("approveCostDetlsId");
		String[] amount = request.getParameterValues("amount");
		String[] certFromChartedAccDocId = request.getParameterValues("certFromChartedAccDocId"); 
		try {
			if(projectRegistrationModel.getProjectDetailsModel().getLandCostDetailsModel()!=null) {
				landCostmodel=projectRegistrationModel.getProjectDetailsModel().getLandCostDetailsModel();
				if(projectRegistrationModel.getProjectDetailsModel().getLandCostDetailsModel().getApprovalCostModel() != null) {
					approvalCostModel = landCostmodel.getApprovalCostModel();
				}else {
					approvalCostModel = new ApprovalCostModel();
				}
			}
			
			if (approvalNameArr != null && approvalNameArr.length > 0) {
				for (int i = 0; i < amountArr.length; i++) {
					if (approveCostDetlsIdArr != null && approveCostDetlsIdArr.length > i && approveCostDetlsIdArr[i] != null && approveCostDetlsIdArr[i].trim().length() > 0) {
						approvalCostDetailsModel = (ApprovalCostDetailsModel)commonDao.getObject(ApprovalCostDetailsModel.class,Long.parseLong(approveCostDetlsIdArr[i]));
					} else {
						approvalCostDetailsModel = new ApprovalCostDetailsModel();
					}
					approvalCostDetailsModel.setIsApplicable(request.getParameter("isApplicable_"+i));
					approvalCostDetailsModel.setApprovalParticular(approvalNameArr[i]);

					if(request.getParameter("isApplicable_"+i).equals("Yes")) {
						approvalCostDetailsModel.setApprovalAmt(Long.parseLong((amountArr[i])));
					}
					approvalCostModelList.add(approvalCostDetailsModel);
				}
				approvalCostModel.setApprovalCostDetails(approvalCostModelList);
				approvalCostModel.setTotalCostOfApprovals(Long.parseLong(request.getParameter("totalCostOfApprovals")));
			}
			if(amount != null && amount.length > 0) {
				for(int i=0; i<amount.length;i++) {
					log.info("amount arr size "+amount.length);
					if( amount[i] != null) {
						if(amtwithdrawBankDelsId != null && amtwithdrawBankDelsId.length > i && amtwithdrawBankDelsId[i] != null && amtwithdrawBankDelsId[i].trim().length() > 0 ) {
							amountModel = AmountWithdrawdBankDetlsDAO.getAmountWithdrawdBankDetlsModelById(Long.parseLong(amtwithdrawBankDelsId[i]));
							doc = documentService.getDoc(Integer.parseInt(certFromChartedAccDocId[i].trim()));
						}else {
							amountModel = new AmountWithdrawlBankDetailsModel();
						}
						if(certFromChartedAccDocId != null && certFromChartedAccDocId.length > i && certFromChartedAccDocId[i] != null && certFromChartedAccDocId[i].trim().length() > 0 ) {
							doc = documentService.getDoc(Integer.parseInt(certFromChartedAccDocId[i].trim()));
							log.info("doc name "+doc.getFileName()+"id >"+doc.getDocumentId());
						}else {
							doc = new Document();
						}
						amountModel.setAmount(Long.parseLong(amount[i]));
						if(request.getParameterValues("amtWithDrawnDate")[i] != null && request.getParameterValues("amtWithDrawnDate")[i] !="") {
							Date date = sdf.parse(request.getParameterValues("amtWithDrawnDate")[i]);
							Calendar cal =  Calendar.getInstance();
							cal.setTime(date);
							amountModel.setAmtWithDrawnDate(cal);
						}
						if(amountModel != null & amountModel.getCertFromChartedAcc() !=null) {
							doc = amountModel.getCertFromChartedAcc();
							//log.info("doc name "+doc.getFileName()+"id >"+doc.getDocumentId());
							doc.setFileName(certFromChartedAcc[i].getOriginalFilename());
							doc.setMimeType(certFromChartedAcc[i].getContentType());
							doc.setInputStream(certFromChartedAcc[i].getInputStream());
							if(certFromChartedAcc[i].getOriginalFilename()!=null && certFromChartedAcc[i].getOriginalFilename().length()>0) {
								contentUtil.saveDocument(doc);
								documentService.updateDoc(doc);
							}
						}else {
							doc = new Document();
							doc.setFileName(certFromChartedAcc[i].getOriginalFilename());
							doc.setDocumentType("POST_REG");
							doc.setFolderId("" + projectRegistrationModel.getProjectRegId());
							doc.setMimeType(certFromChartedAcc[i].getContentType());
							doc.setInputStream(certFromChartedAcc[i].getInputStream());
							contentUtil.saveDocument(doc);
							documentService.saveDoc(doc);
						}
						amountModel.setCertFromChartedAcc(doc);
					}
					AmountWithdrawnList.add(amountModel);
					log.info("AmountWithdrawnList size >>"+AmountWithdrawnList.size());
				}
			}
			approvalCostModel.setAmountWithdrawlBankDetailsModel(AmountWithdrawnList);
		}catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		projectRegistrationModel.getProjectDetailsModel().getLandCostDetailsModel().setApprovalCostModel(approvalCostModel);
		return projectRegistrationModel;
	}

	@Override
	public ProjectRegistrationModel updateProjectSummaryDetails(ProjectRegistrationModel projectRegistrationModel,HttpServletRequest request) throws Exception {
		ProjectSummary  projectSummary = null;
		try {
			if(projectRegistrationModel.getProjectDetailsModel().getProjectSummary() != null) {
				projectSummary = projectRegistrationModel.getProjectDetailsModel().getProjectSummary();
			}else {
				projectSummary = new ProjectSummary();
			}
			projectSummary.setEstLandCost(Long.parseLong(request.getParameter("estLandCost")));
			projectSummary.setEstCostOfApprove(Long.parseLong(request.getParameter("estCostOfApprove")));
			projectSummary.setEstConstructionCost(Long.parseLong(request.getParameter("estConstructionCost")));
			projectSummary.setEstTotalCost(Long.parseLong(request.getParameter("estTotalCost")));

			projectSummary.setActLandCost(Long.parseLong(request.getParameter("actLandCost")));
			projectSummary.setActCostOfApprove(Long.parseLong(request.getParameter("actCostOfApprove")));
			projectSummary.setActConstructionCost(Long.parseLong(request.getParameter("actConstructionCost")));
			projectSummary.setActTotalCost(Long.parseLong(request.getParameter("actTotalCost")));

			projectSummary.setAmtCollectedFromAllotee(Long.parseLong(request.getParameter("amtCollectedFromAllotee")));
			projectSummary.setAmtUtilizedforConstruction(Long.parseLong(request.getParameter("amtUtilizedforConstruction")));
			projectSummary.setAmtUtilPercentage(Float.parseFloat(request.getParameter("amtUtilPercentage")));
			projectSummary.setBalanceAmt(Long.parseLong(request.getParameter("balanceAmt")));
			/*if(request.getParameter("tdrStatus").equals("YES")) {
				projectSummary.setFarSanctioned(Long.parseLong(request.getParameter("farSanctioned")));
				projectSummary.setFarAchieved(Long.parseLong(request.getParameter("farAchieved")));
			}*/

		} catch (Exception e) {
			e.printStackTrace();
			log.error(e.getMessage(), e);
			throw e;
		}
		projectRegistrationModel.getProjectDetailsModel().setProjectSummary(projectSummary);;
		return projectRegistrationModel;
	}

	@Override
	public ProjectRegistrationModel updateFinalApprovalDetails(ProjectRegistrationModel projectRegistrationModel,HttpServletRequest request,MultipartFile[] uploadDoc) throws Exception {
		String[] nameOfCerificateArr = request.getParameterValues("nameOfCerificate");
		FinalApproval finalApproval = null;
		Document doc=null;
		List<FinalApproval> finalApprovalList = new ArrayList<FinalApproval>();
		try {
			String[] finalApprovalsDetailsIdIdArr = request.getParameterValues("finalApprovalsDetailsId");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

			if (nameOfCerificateArr != null && nameOfCerificateArr.length > 0) {
				for(int i=0;i< nameOfCerificateArr.length; i++) {
					if (nameOfCerificateArr[i] != null) {
						if (finalApprovalsDetailsIdIdArr != null && finalApprovalsDetailsIdIdArr.length > i && finalApprovalsDetailsIdIdArr[i] != null && finalApprovalsDetailsIdIdArr[i].trim().length() > 0) {
							finalApproval = (FinalApproval)commonDao.getObject(FinalApproval.class,Long.parseLong(finalApprovalsDetailsIdIdArr[i]));
						} else {
							finalApproval = new FinalApproval();
						}
						//finalApproval.setIsApplicable(request.getParameter("isApplicable"));

						finalApproval.setNameOfCerificate(nameOfCerificateArr[i]);
						//finalApproval.setIsApproved(request.getParameter("isApproved_"+i));
						if(request.getParameterValues("approvedDate")[i] != null && request.getParameterValues("approvedDate")[i] != " ") {
							Date date = sdf.parse(request.getParameterValues("approvedDate")[i]);
							Calendar approvedDateCal = Calendar.getInstance();
							approvedDateCal.setTime(date);
							finalApproval.setApprovedDate(approvedDateCal);
						}
						if(request.getParameterValues("uploadDocId") != null) {
							doc = documentService.getDoc(Integer.parseInt(request.getParameterValues("uploadDocId")[i].trim()));
							doc.setFileName(uploadDoc[i].getOriginalFilename());
							doc.setMimeType(uploadDoc[i].getContentType());
							doc.setInputStream(uploadDoc[i].getInputStream());
							contentUtil.saveDocument(doc);
							documentService.updateDoc(doc);
						}else {
							doc = new Document();
							doc.setFileName(uploadDoc[i].getOriginalFilename());
							doc.setDocumentType("FINAL_APPROVAL");
							doc.setFolderId("" + projectRegistrationModel.getProjectRegId());
							doc.setMimeType(uploadDoc[i].getContentType());
							doc.setInputStream(uploadDoc[i].getInputStream());
							contentUtil.saveDocument(doc);
							documentService.saveDoc(doc);
						}
						finalApproval.setUploadDoc(doc);
					}
					finalApprovalList.add(finalApproval);
				}

			}
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		projectRegistrationModel.getProjectDetailsModel().setFinalApproval(finalApprovalList);
		return projectRegistrationModel;
	}

	/*@Override
	public ProjectRegistrationModel saveOrUpdateTowerDetails(ProjectRegistrationModel projectRegistrationModel,HttpServletRequest request) throws Exception {
		List<TowerDetailsModel>  towerDetailsModelList =null;
		TowerDetailsModel towerDetailsModel = null;
		String[] towerNameArr=request.getParameterValues("towerName");
		String[] towerIdArr=request.getParameterValues("towerDetailsId");

		try {
			if(projectRegistrationModel.getProjectDetailsModel().getTowerDetailsList() != null && projectRegistrationModel.getProjectDetailsModel().getTowerDetailsList().size()>0 
					&& towerIdArr.length>0) {
				towerDetailsModelList = projectRegistrationModel.getProjectDetailsModel().getTowerDetailsList() ;
				for (int i = 0; i < towerDetailsModelList.size(); i++) {
					towerDetailsModel=towerDetailsModelList.get(i);
					towerDetailsModel.setTowerName(towerNameArr[i]);
					towerDetailsModel.setApartmentType(request.getParameter("apartmentType_"+i));
					towerDetailsModel.setTotNoOfFloor(Long.parseLong(request.getParameterValues("totNoOfFloor")[i]));
					towerDetailsModel.setTotApartments(Long.parseLong(request.getParameterValues("totApartments")[i]));
					towerDetailsModel.setTotNoOfBasement(Long.parseLong(request.getParameterValues("totNoOfBasement")[i]));
					towerDetailsModel.setTotNoOfStills(Long.parseLong(request.getParameterValues("totNoOfStills")[i]));
					towerDetailsModel.setTotNoOfSlabsOfSuperStructure(Long.parseLong(request.getParameterValues("totNoOfSlabsOfSuperStructure")[i]));
				}
			}else {
				towerDetailsModelList = new ArrayList<TowerDetailsModel>();
				for (int i = 0; i < towerNameArr.length; i++) {
					towerDetailsModel=new TowerDetailsModel();
					towerDetailsModel.setTowerName(towerNameArr[i]);
					towerDetailsModel.setApartmentType(request.getParameter("apartmentType_"+i));
					towerDetailsModel.setTotNoOfFloor(Long.parseLong(request.getParameterValues("totNoOfFloor")[i]));
					towerDetailsModel.setTotApartments(Long.parseLong(request.getParameterValues("totApartments")[i]));
					towerDetailsModel.setTotNoOfBasement(Long.parseLong(request.getParameterValues("totNoOfBasement")[i]));
					towerDetailsModel.setTotNoOfStills(Long.parseLong(request.getParameterValues("totNoOfStills")[i]));
					towerDetailsModel.setTotNoOfSlabsOfSuperStructure(Long.parseLong(request.getParameterValues("totNoOfSlabsOfSuperStructure")[i]));
					towerDetailsModelList.add(towerDetailsModel);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e.getMessage(), e);
			throw e;
		}
		projectRegistrationModel.getProjectDetailsModel().setTowerDetailsList(towerDetailsModelList);
		return projectRegistrationModel;
	}*/

	@Override
	public ProjectRegistrationModel saveOrUpdateFloorDetails(ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request) throws Exception {
		List<FloorDetailsModel> FloorDetailsModelList = new ArrayList<FloorDetailsModel>();

		Long noOfFloors=projectRegistrationModel.getProjectDetailsModel().getTowerDetailsList().get(projectRegistrationModel.getProjectDetailsModel().getTowerDetailsList().size()-1).getTotNoOfFloor();
		log.info("No of floors "+noOfFloors);
		for(int i=0; i<=noOfFloors;i++) {
			FloorDetailsModel floorDetailsModel =  new FloorDetailsModel();
			floorDetailsModel.setFloorNo(Integer.parseInt(request.getParameterValues("floorNo")[i]));
			floorDetailsModel.setTotNoOfApartment(Long.parseLong(request.getParameterValues("totNoOfApartment")[i]) );
			FloorDetailsModelList.add(floorDetailsModel);
		}
		log.info("FloorDetailsModelList size >>"+FloorDetailsModelList.size());
		projectRegistrationModel.getProjectDetailsModel().getTowerDetailsList().get(projectRegistrationModel.getProjectDetailsModel().getTowerDetailsList().size()-1).setFloorDetailsList(FloorDetailsModelList);
		return projectRegistrationModel;
	}

	@Override
	public ProjectRegistrationModel updateEachApartmentDetails(
			ProjectRegistrationModel projectRegistrationModel, HttpServletRequest request) throws Exception {
		List<ProjectApartmentDetails> apartmentDetailsList = new ArrayList<ProjectApartmentDetails>();
		String[] apartmentTypeArr = request.getParameterValues("apartmentType");
		String[] apartmentDetailsIdArr = request.getParameterValues("apartmentDetailsId");

		ProjectApartmentDetails projectApartmentDetails = null;

		try {
			if (apartmentTypeArr != null && apartmentTypeArr.length > 0) {
				for(int i=0;i< apartmentTypeArr.length; i++) {
					if (apartmentTypeArr[i] != null) {
						if (apartmentDetailsIdArr != null && apartmentDetailsIdArr.length > i && apartmentDetailsIdArr[i] != null && apartmentDetailsIdArr[i].trim().length() > 0) {
							projectApartmentDetails =(ProjectApartmentDetails) commonDao.getObject(ProjectApartmentDetails.class, Long.parseLong(request.getParameterValues("apartmentDetailsIdArr")[i]));
						} else {
							log.info("created projectQuaterlyUpdateModel");
							projectApartmentDetails= new ProjectApartmentDetails();
						}
						projectApartmentDetails.setApartmentType(apartmentTypeArr[i]);
						projectApartmentDetails.setBuiltUpArea(Integer.parseInt(request.getParameterValues("builtUpArea")[i]));
						projectApartmentDetails.setCarpetArea(Integer.parseInt(request.getParameterValues("carpetArea")[i]) );
						projectApartmentDetails.setProportionateCommonArea(Integer.parseInt(request.getParameterValues("proportionateCommonArea")[i]) );
						projectApartmentDetails.setTotNoOfEachApartmentType(Long.parseLong(request.getParameterValues("totNoOfEachApartmentType")[i]) );
					}
					apartmentDetailsList.add(projectApartmentDetails);
				}
			}
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		log.info("apartmentDetailsList size >>"+apartmentDetailsList.size());
		projectRegistrationModel.getProjectDetailsModel().getTowerDetailsList().get(projectRegistrationModel.getProjectDetailsModel().getTowerDetailsList().size()-1).setApartmentDetailsList(apartmentDetailsList);
		return projectRegistrationModel;
	}

	@Override
	public ProjectRegistrationModel saveExternalInfraDetails(ProjectRegistrationModel projectRegistrationModel,HttpServletRequest request) throws Exception {
		List<ExternalInfrastructureWorksModel> externalList= new ArrayList<ExternalInfrastructureWorksModel>();
		String[] typeOfWorkArr = request.getParameterValues("externalInfrastructureName");
		ExternalInfrastructureWorksModel externalInfrastructureWorksModel = null;
		try {
			String[] projWorkIdArr = request.getParameterValues("externalInfrastructureId");
			if (typeOfWorkArr != null && typeOfWorkArr.length > 0) {
				for(int i=0;i< typeOfWorkArr.length; i++) {
					if (typeOfWorkArr[i] != null) {
						if (projWorkIdArr != null && projWorkIdArr.length > i && projWorkIdArr[i] != null && projWorkIdArr[i].trim().length() > 0) {
							externalInfrastructureWorksModel = (ExternalInfrastructureWorksModel)commonDao.getObject(ExternalInfrastructureWorksModel.class,Long.parseLong(projWorkIdArr[i]));
						} else {
							log.info("created ProjectScheduleModel");
							externalInfrastructureWorksModel = new ExternalInfrastructureWorksModel();
						}
						externalInfrastructureWorksModel.setExternalInfrastructureName(typeOfWorkArr[i]);
						externalInfrastructureWorksModel.setIsApplicable(request.getParameter("isApplicable_"+i));
						externalInfrastructureWorksModel.setCreatedOn(Calendar.getInstance());
						externalList.add(externalInfrastructureWorksModel);
					}
				}
			}
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		projectRegistrationModel.getProjectDetailsModel().getProjectScheduleModel().setExternalInfrastructureList(externalList);
		return projectRegistrationModel;
	}

	@Override
	public ProjectRegistrationModel saveInternalInfraDetails(ProjectRegistrationModel projectRegistrationModel,HttpServletRequest request) throws Exception {
		List<ProjectInternalInfrastructureDetails> internalList= new ArrayList<ProjectInternalInfrastructureDetails>();
		String[] typeOfWorkArr = request.getParameterValues("infrastructureName");
		ProjectInternalInfrastructureDetails projectInternalInfrastructureDetails = null;
		try {
			String[] projWorkIdArr = request.getParameterValues("infrastructureId");
			if (typeOfWorkArr != null && typeOfWorkArr.length > 0) {
				for(int i=0;i< typeOfWorkArr.length; i++) {
					if (typeOfWorkArr[i] != null) {
						if (projWorkIdArr != null && projWorkIdArr.length > i && projWorkIdArr[i] != null && projWorkIdArr[i].trim().length() > 0) {
							projectInternalInfrastructureDetails = (ProjectInternalInfrastructureDetails)commonDao.getObject(ProjectInternalInfrastructureDetails.class,Long.parseLong(projWorkIdArr[i]));
						} else {
							projectInternalInfrastructureDetails = new ProjectInternalInfrastructureDetails();
							log.info("created ProjectScheduleModel");
						}
						projectInternalInfrastructureDetails.setInfrastructureName(typeOfWorkArr[i]);
						projectInternalInfrastructureDetails.setIsApplicable(request.getParameter("isApplicable_"+i));
						projectInternalInfrastructureDetails.setCreatedOn(Calendar.getInstance());
						internalList.add(projectInternalInfrastructureDetails);
					}
				}
			}
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		projectRegistrationModel.getProjectDetailsModel().getProjectScheduleModel().setInternalInfraList(internalList);
		return projectRegistrationModel;
	}

	@Override
	public ProjectRegistrationModel saveCommonDetailsDetails(ProjectRegistrationModel projectRegistrationModel,HttpServletRequest request) throws Exception {
		List<ProjectCommonAreaDetails> commonList= new ArrayList<ProjectCommonAreaDetails>();
		String[] typeOfWorkArr = request.getParameterValues("commonAreaName");
		ProjectCommonAreaDetails projectCommonAreaDetails = null;
		try {
			String[] projWorkIdArr = request.getParameterValues("commonAreaDetailsId");
			if (typeOfWorkArr != null && typeOfWorkArr.length > 0) {
				for(int i=0;i< typeOfWorkArr.length; i++) {
					if (typeOfWorkArr[i] != null) {
						if (projWorkIdArr != null && projWorkIdArr.length > i && projWorkIdArr[i] != null && projWorkIdArr[i].trim().length() > 0) {
							projectCommonAreaDetails = (ProjectCommonAreaDetails)commonDao.getObject(ProjectCommonAreaDetails.class,Long.parseLong(projWorkIdArr[i]));
						} else {

							projectCommonAreaDetails = new ProjectCommonAreaDetails();
							log.info("created ProjectScheduleModel");
						}
						projectCommonAreaDetails.setCommonAreaName(typeOfWorkArr[i]);
						projectCommonAreaDetails.setIsApplicable(request.getParameter("isApplicable_"+i));
						projectCommonAreaDetails.setCreatedOn(Calendar.getInstance());
						commonList.add(projectCommonAreaDetails);
					}
				}
			}
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		projectRegistrationModel.getProjectDetailsModel().getProjectScheduleModel().setCommonAreaList(commonList);
		return projectRegistrationModel;
	}

	@Override
	public ProjectRegistrationModel saveAmenityDetails(ProjectRegistrationModel projectRegistrationModel,HttpServletRequest request) throws Exception {
		List<ProjectAmenityDetails> amenityList= new ArrayList<ProjectAmenityDetails>();
		String[] typeOfWorkArr = request.getParameterValues("amenityName");
		ProjectAmenityDetails projectAmenityDetails = null;
		try {
			String[] projWorkIdArr = request.getParameterValues("amenityDetailsId");
			if (typeOfWorkArr != null && typeOfWorkArr.length > 0) {
				for(int i=0;i< typeOfWorkArr.length; i++) {
					if (typeOfWorkArr[i] != null) {
						if (projWorkIdArr != null && projWorkIdArr.length > i && projWorkIdArr[i] != null && projWorkIdArr[i].trim().length() > 0) {
							projectAmenityDetails = (ProjectAmenityDetails)commonDao.getObject(ProjectAmenityDetails.class,Long.parseLong(projWorkIdArr[i]));
						} else {

							projectAmenityDetails = new ProjectAmenityDetails();
							log.info("created ProjectScheduleModel");
						}
						projectAmenityDetails.setAmenityName(typeOfWorkArr[i]);
						projectAmenityDetails.setIsApplicable(request.getParameter("isApplicable_"+i));
						//projectAmenityDetails.setCreatedOn(Calendar.getInstance());
						amenityList.add(projectAmenityDetails);
					}
				}
			}
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		projectRegistrationModel.getProjectDetailsModel().getProjectScheduleModel().setAmenityList(amenityList);
		return projectRegistrationModel;
	}

	@Override
	public ProjectRegistrationModel saveOrUpdateLandJDADetails(ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request) throws Exception {
		List<ProjectJDAPromoterDetails> promoterList = null;
		List<ProjectJDALandOwnerDetails> landownerList = null;
		LandAcquisitionCostModel acquiModel = projectRegistrationModel.getProjectDetailsModel().getLandCostDetailsModel().getLandAcquisitionCostModel();
		ProjectJDADetails jdaModel=null;
		ProjectJDAPromoterDetails promoterModel=null;
		ProjectJDALandOwnerDetails landownerModel=null;

		try {
			if(acquiModel.getProjectJDADetailsModel()!= null) {
				jdaModel = acquiModel.getProjectJDADetailsModel();
				promoterList=jdaModel.getPromoterList();
				landownerList=jdaModel.getLandOwnerList();
			}else {
				jdaModel = new ProjectJDADetails();
				promoterList = new ArrayList<ProjectJDAPromoterDetails>();
				landownerList = new ArrayList<ProjectJDALandOwnerDetails>();
			}
			if(acquiModel.getNumberOfPromoters()>0) {
				String[] promoterArray=request.getParameterValues("promoterName");
				for (int i = 0; i < promoterArray.length; i++) {
					promoterModel=new ProjectJDAPromoterDetails();
					promoterModel.setPromoterName(promoterArray[i]);
					promoterModel.setNoOfUnitsOfShare(Long.parseLong(request.getParameter("noOfUnitsOfShare_"+i))); 
					promoterModel.setPercentageOfShare(Long.parseLong(request.getParameter("percentageOfShare_"+i)));
					promoterList.add(promoterModel);
				}
				jdaModel.setPromoterList(promoterList);
			}
			if(acquiModel.getNumberOfLandowners()>0) {
				String[] landownerArray=request.getParameterValues("landOwner");
				for (int i = 0; i < landownerArray.length; i++) {
					landownerModel=new ProjectJDALandOwnerDetails();
					landownerModel.setLandOwner(landownerArray[i]);
					landownerModel.setIsApplicable(request.getParameter("isApplicable_"+i));

					if(request.getParameter("isApplicable_"+i).equals("Yes")) {
						landownerModel.setIsRegistered(request.getParameter("isRegistered_"+i));
					}
					if(request.getParameter("isRegistered_"+i).equals("Yes")) {
						landownerModel.setLandOwnerRegNo(request.getParameter("landOwnerRegNo_"+i));
					}
					landownerModel.setLandownerName(request.getParameter("landownerName_"+i));
					landownerModel.setLandownerAddress(request.getParameter("landownerAddress_"+i));
					landownerModel.setLandownerEmailId(request.getParameter("landownerEmailId_"+i));
					landownerModel.setLandownerMobileNo(Long.parseLong(request.getParameter("landownerMobileNo_"+i))); 
					landownerModel.setLandownerPercShare(Long.parseLong(request.getParameter("landownerPercShare_"+i)));
					landownerList.add(landownerModel);
				}
				jdaModel.setLandOwnerList(landownerList);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		acquiModel.setProjectJDADetailsModel(jdaModel);
		return projectRegistrationModel;
	}

	@Override
	public ProjectRegistrationModel saveOrUpdateDocDetails(ProjectRegistrationModel projectRegistrationModel, 
			HttpServletRequest request,MultipartFile prospectusOrBrochureDoc,MultipartFile  advertisementDoc) throws Exception {
		Document doc = null;
		WebSiteUrlDetailsModel WebSiteUrlDetailsModel = null;

		String[] agentAppNoArr =  request.getParameterValues("agentAppNo");
		String[] webSiteUrlArr =  request.getParameterValues("webSiteUrl");

		PostRegAgentDetails postRegAgentDetails = new PostRegAgentDetails();
		List<PostRegAgentDetails> list =new ArrayList<PostRegAgentDetails>();
		List<WebSiteUrlDetailsModel> webSiteUrlList =new ArrayList<WebSiteUrlDetailsModel>();

		String advertisementDocId = request.getParameter("advertisementDocId");
		String prospectusOrBrochureDocId = request.getParameter("prospectusOrBrochureDocId"); 
		try {
			if(prospectusOrBrochureDocId != null  ) {
				log.info("check prospectusOrBrochureDocId "+prospectusOrBrochureDocId);
				doc = documentService.getDoc(Integer.parseInt(prospectusOrBrochureDocId));
				MultipartFile obj = prospectusOrBrochureDoc;
				//log.info("name >>"+obj.getOriginalFilename());prospectusOrBrochureDocId
				doc.setFileName(obj.getOriginalFilename());
				doc.setMimeType(obj.getContentType());
				doc.setInputStream(obj.getInputStream());
				contentUtil.saveDocument(doc);
				documentService.updateDoc(doc);
			}else {
				doc = new Document();
				doc.setFileName(prospectusOrBrochureDoc.getOriginalFilename());
				doc.setDocumentType("prospectusOrBrochureDoc_REG");
				doc.setFolderId("" + projectRegistrationModel.getProjectRegId());
				doc.setMimeType(prospectusOrBrochureDoc.getContentType());
				doc.setInputStream(prospectusOrBrochureDoc.getInputStream());
				contentUtil.saveDocument(doc);
				documentService.saveDoc(doc);
			}
			projectRegistrationModel.getProjectDetailsModel().setProspectusOrBrochureDoc(doc);

			if(advertisementDocId != null  ) {
				log.info("check advertisementDoc "+advertisementDocId);
				doc = documentService.getDoc(Integer.parseInt(advertisementDocId));
				MultipartFile obj = prospectusOrBrochureDoc;
				//log.info("name >>"+obj.getOriginalFilename());prospectusOrBrochureDocId
				doc.setFileName(obj.getOriginalFilename());
				doc.setMimeType(obj.getContentType());
				doc.setInputStream(obj.getInputStream());
				contentUtil.saveDocument(doc);
				documentService.updateDoc(doc);
			}else {
				doc = new Document();
				doc.setFileName(prospectusOrBrochureDoc.getOriginalFilename());
				doc.setDocumentType("advertisementDocId_REG");
				doc.setFolderId("" + projectRegistrationModel.getProjectRegId());
				doc.setMimeType(advertisementDoc.getContentType());
				doc.setInputStream(advertisementDoc.getInputStream());
				contentUtil.saveDocument(doc);
				documentService.saveDoc(doc);
			}
			projectRegistrationModel.getProjectDetailsModel().setAdvertisementDoc(doc);

			if(webSiteUrlArr.length > 0) {
				for(int i=0 ; i<webSiteUrlArr.length;i++) {
					WebSiteUrlDetailsModel = new WebSiteUrlDetailsModel();
					WebSiteUrlDetailsModel.setWebSiteUrl(webSiteUrlArr[i]);
					webSiteUrlList.add(WebSiteUrlDetailsModel);
				}
				projectRegistrationModel.getProjectDetailsModel().setWebSiteUrlDetails(webSiteUrlList);
			}

			if(agentAppNoArr != null) {
				for(int i=0 ; i<agentAppNoArr.length;i++) {
					postRegAgentDetails = new PostRegAgentDetails();
					postRegAgentDetails.setAgentAppNo(agentAppNoArr[i]);
					list.add(postRegAgentDetails);
				}
			}
			projectRegistrationModel.getProjectDetailsModel().setPostRegAgentDetails(list);
			projectRegistrationModel.getProjectDetailsModel().setFarSanctioned(Float.parseFloat(request.getParameter("farSanctioned")));
		}catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return projectRegistrationModel;
	}

	@Override
	public ProjectRegistrationModel saveOrUpdateTowerDetails(ProjectRegistrationModel projectRegistrationModel,HttpServletRequest request) throws Exception {
		List<TowerDetailsModel>  towerDetailsModelList = new ArrayList<TowerDetailsModel>();
		TowerDetailsModel towerDetailsModel1 = null;
		try {
			if(projectRegistrationModel.getProjectDetailsModel().getTowerDetailsList() != null && projectRegistrationModel.getProjectDetailsModel().getTowerDetailsList().size()>0) {
				towerDetailsModelList = projectRegistrationModel.getProjectDetailsModel().getTowerDetailsList() ;
			}
			towerDetailsModel1 = new TowerDetailsModel();
			towerDetailsModel1.setTotNoOfFloor(Long.parseLong(request.getParameter("totNoOfFloor")) );
			towerDetailsModel1.setTotApartments(Long.parseLong(request.getParameter("totApartments")) );
			towerDetailsModel1.setTotNoOfBasement(Long.parseLong(request.getParameter("totNoOfBasement")) );
			towerDetailsModel1.setTotNoOfSlabsOfSuperStructure(Long.parseLong(request.getParameter("totNoOfSlabsOfSuperStructure")) );
			towerDetailsModel1.setTotNoOfStills(Long.parseLong(request.getParameter("totNoOfStills")) );
			towerDetailsModel1.setTowerName(request.getParameter("towerName"));
			towerDetailsModel1.setApartmentType(request.getParameter("apartmentType"));
			towerDetailsModel1.setTotalNoOfTowers(Long.parseLong(request.getParameter("totalNoOfTowers")) );
			towerDetailsModelList.add(towerDetailsModel1);
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e.getMessage(), e);
			throw e;
		}
		projectRegistrationModel.getProjectDetailsModel().setTowerDetailsList(towerDetailsModelList);
		return projectRegistrationModel;
	}

	private static String[] columns = {"floor No", "Unit No", "Unit Type","Other Type if Applicable","Carpet Area", "Exclusive Common Area Allotee", "Common Area Alloted To Association", "Undivided Share","No of parking lots","Tower Ref ID"};

	@Override
	public ProjectRegistrationModel DownloadTowerDetailsExcel(ProjectRegistrationModel baseObject, HttpServletRequest request,HttpServletResponse response) throws Exception {
		try {
			List<TowerDetailsModel>  towerDetailsModelList = new ArrayList<TowerDetailsModel>();
			if(baseObject.getProjectDetailsModel().getTowerDetailsList() != null) {
				towerDetailsModelList = baseObject.getProjectDetailsModel().getTowerDetailsList();
				System.out.println("towerDetailsModelList size "+towerDetailsModelList);
			}
			DataValidation dataValidation = null;
			DataValidationConstraint constraint = null;
			DataValidationHelper validationHelper = null;
			// Create a Workbook
			Workbook workbook = new XSSFWorkbook();     
			CreationHelper createHelper = workbook.getCreationHelper();
			// Create a Sheet
			for(int index =0;index<towerDetailsModelList.size();index++) {

				XSSFSheet sheet=(XSSFSheet) workbook.createSheet("Tower Name - "+towerDetailsModelList.get(index).getTowerName());
				validationHelper=new XSSFDataValidationHelper(sheet);

				long totalNoofUnits = towerDetailsModelList.get(index).getTotApartments();
				int totalNoofUnitsrow = (int) totalNoofUnits;
				System.out.println("totalNoofUnitsrow >.>"+totalNoofUnitsrow);
				CellRangeAddressList addressList = new CellRangeAddressList(0,totalNoofUnitsrow,2,2);
				constraint =validationHelper.createExplicitListConstraint(new String[]{"SELECT","1BHK", "2BHK", "3BHK","4BHK","5BHK","SHOP","COMMERCIAL","OTHER"});
				dataValidation = validationHelper.createValidation(constraint, addressList);
				dataValidation.setSuppressDropDownArrow(true);      
				sheet.addValidationData(dataValidation);

				CellRangeAddressList validationRangeCell = new CellRangeAddressList(0,totalNoofUnitsrow,4,8);

				XSSFDataValidationConstraint dvConstraint = 
						(XSSFDataValidationConstraint)
						validationHelper.createNumericConstraint(
								XSSFDataValidationConstraint.ValidationType.DECIMAL,
								XSSFDataValidationConstraint.OperatorType.BETWEEN,
								String.valueOf(0),
								String.valueOf(99999999)
								);
				XSSFDataValidation validation =(XSSFDataValidation)validationHelper.createValidation(
						dvConstraint, validationRangeCell);
				validation.setSuppressDropDownArrow(false);
				validation.createErrorBox("Error", "Please enter only 0-9 digits ");
				validation.setShowErrorBox(true);
				sheet.addValidationData(validation);

				Font headerFont = workbook.createFont();
				headerFont.setBold(true);
				headerFont.setFontHeightInPoints((short) 12);

				// Create a CellStyle with the font
				CellStyle headerCellStyle = workbook.createCellStyle();
				headerCellStyle.setFont(headerFont);

				// Create a Row
				Row headerRow = sheet.createRow(0);

				// Creating cells
				for(int i = 0; i < columns.length; i++) {
					Cell cell = headerRow.createCell(i);
					cell.setCellValue(columns[i]);
					cell.setCellStyle(headerCellStyle);
				}

				// Cell Style for formatting Date
				CellStyle dateCellStyle = workbook.createCellStyle();
				dateCellStyle.setDataFormat(createHelper.createDataFormat().getFormat("dd-MM-yyyy"));

				CellStyle lockedCellStyle = workbook.createCellStyle();
				lockedCellStyle.setLocked(true); //true or false based on the cell.


				CellStyle unlockedCellStyle = workbook.createCellStyle();
				unlockedCellStyle.setLocked(false); //true or false based on the cell.

				// Create Other rows and cells with TowerDetailsExcels data
				int rowNum = 1;
				for(int i=0; i<towerDetailsModelList.get(index).getFloorDetailsList().size();i++) {
					for(int j=0; j<towerDetailsModelList.get(index).getFloorDetailsList().get(i).getTotNoOfApartment();j++) {
						Row row = sheet.createRow(rowNum++);

						Cell  floorNoCel= row.createCell(0);
						floorNoCel.setCellValue(i);
						floorNoCel.setCellStyle(lockedCellStyle);

						Cell  unitNoCel= row.createCell(1);
						unitNoCel.setCellValue("");
						unitNoCel.setCellStyle(unlockedCellStyle);

						Cell  unitTypeCel= row.createCell(2);
						unitTypeCel.setCellValue("SELECT");
						unitTypeCel.setCellStyle(unlockedCellStyle);

						Cell  otherTypeCel= row.createCell(3);
						otherTypeCel.setCellValue("NA");
						otherTypeCel.setCellStyle(unlockedCellStyle);

						Cell  alloteeCel= row.createCell(4);
						alloteeCel.setCellValue("");
						alloteeCel.setCellStyle(unlockedCellStyle);

						Cell  commonAreaCel= row.createCell(5);
						commonAreaCel.setCellValue("");
						commonAreaCel.setCellStyle(unlockedCellStyle);

						Cell  commonAreaToCel= row.createCell(6);
						commonAreaToCel.setCellValue("");
						commonAreaToCel.setCellStyle(unlockedCellStyle);

						Cell  devidedShareCel= row.createCell(7);
						devidedShareCel.setCellValue("");
						devidedShareCel.setCellStyle(unlockedCellStyle);

						Cell  parkingCel= row.createCell(8);
						parkingCel.setCellValue("0");
						parkingCel.setCellStyle(unlockedCellStyle);

						Cell  TowerIdCel= row.createCell(9);
						TowerIdCel.setCellValue(towerDetailsModelList.get(index).getTowerDetailsId());
						TowerIdCel.setCellStyle(lockedCellStyle);
					}
				}

				// Resize all columns to fit the content size
				for(int j = 0; j < columns.length; j++) {
					sheet.autoSizeColumn(j);
				}
				sheet.protectSheet(""); 
			}
			// Write the output to a file
			FileOutputStream   fileOut = new FileOutputStream(ContentUtil.REPOSITORY_PATH+"//ExcelPostRegDocument//"+baseObject.getProjectRegistrationNo().replaceAll("/", "")+".xlsx");
			workbook.write(fileOut);

			fileOut.close();
			try {
				response.setContentType("application/vnd.ms-excel");
				response.setHeader("Content-Disposition", "attachment; filename="+baseObject.getProjectRegistrationNo()+".xlsx");
				workbook.write(response.getOutputStream()); // Write workbook to response.
				workbook.close();
			} catch (IOException e) {
				e.printStackTrace();
			}

		} catch (Exception e) {
			e.printStackTrace();
			log.error(e.getMessage(), e);
			throw e;
		}
		return baseObject;
	}

	@Override
	public ProjectRegistrationModel saveOrUploadExcel(ProjectRegistrationModel projectRegistrationModel, 
			HttpServletRequest request,HttpServletResponse response,MultipartFile  unitdetailsExcelFile) throws Exception {
		Document doc = null;
		ResourceBundle rb = ResourceBundle.getBundle("in.gov.rera.common.config.RERAProperties");
		String ackLoc = rb.getString("ACK_FOLDER_PATH");
		AcknowledgeUtilty util=new AcknowledgeUtilty();

		try {
			doc = new Document();
			doc.setFileName(unitdetailsExcelFile.getOriginalFilename());
			doc.setDocumentType("EXCEL_DIR");
			doc.setFolderId("" + projectRegistrationModel.getProjectRegId());
			doc.setMimeType(unitdetailsExcelFile.getContentType());
			doc.setInputStream(unitdetailsExcelFile.getInputStream());
			contentUtil.saveDocument(doc);
			documentService.saveDoc(doc);
			projectRegistrationModel.getProjectDetailsModel().setUnitdetailsExcelFile(doc);
			System.out.println("Saved successfully");
			String in1 = ContentUtil.REPOSITORY_PATH+projectRegistrationModel.getProjectDetailsModel().getUnitdetailsExcelFile().getDocumentType()+"/"+projectRegistrationModel.getProjectDetailsModel().getUnitdetailsExcelFile().getFolderId()+"/"+projectRegistrationModel.getProjectDetailsModel().getUnitdetailsExcelFile().getDocumentName();
			System.out.println("in >>"+in1);


			// Creating a Workbook from an Excel file (.xls or .xlsx)
			Workbook workbook = null;
			try {
				workbook = WorkbookFactory.create(new File(in1));
			} catch (EncryptedDocumentException | org.apache.poi.openxml4j.exceptions.InvalidFormatException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			// need to do validation based on the no of shet and no of tower
			// Retrieving the number of sheets in the Workbook
			System.out.println("Workbook has " + workbook.getNumberOfSheets() + " Sheets : ");

			// 1. You can obtain a sheetIterator and iterate over it
			DataFormatter dataFormatter = new DataFormatter();
			System.out.println("Retrieving Sheets using Iterator");
			Cell cell= null;
			String cellValue = null;
			if(projectRegistrationModel.getProjectDetailsModel().getTowerDetailsList().size() == workbook.getNumberOfSheets()) {
				for(int i=0; i<workbook.getNumberOfSheets(); i++) {
					List<TowerUnitDetailsExcel> list = new ArrayList<TowerUnitDetailsExcel>();
					Sheet sheet = workbook.getSheetAt(i);
					System.out.println("=> " + sheet.getSheetName());
					Iterator<Row> rowIterator = sheet.rowIterator();
					while (rowIterator.hasNext()) {
						Row row = rowIterator.next();
						if(row.getRowNum()==0){
							continue; //just skip the rows if row number is 0 header
						}
						TowerUnitDetailsExcel towerunitDetails = new TowerUnitDetailsExcel();
						// Cell cell = row.getCell(0);
						cell = row.getCell(0);
						cellValue = dataFormatter.formatCellValue(cell);
						towerunitDetails.setFloorNo(Long.parseLong(cellValue));

						cell = row.getCell(1);
						cellValue = dataFormatter.formatCellValue(cell);
						towerunitDetails.setUnitNo(cellValue);

						cell = row.getCell(2);
						cellValue = dataFormatter.formatCellValue(cell);
						/*	if(!cellValue.equals("SELECT")) {*/
						if(cellValue.equals("OTHER")) {
							cell = row.getCell(3);
							cellValue = dataFormatter.formatCellValue(cell);
							towerunitDetails.setUnitType(cellValue);
						}else {
							towerunitDetails.setUnitType(cellValue);
						}
						/*}else {
					                	return null;
					                	}*/

						cell = row.getCell(4);
						cellValue = dataFormatter.formatCellValue(cell);
						towerunitDetails.setCarpetArea(Long.parseLong(cellValue));


						cell = row.getCell(5);
						cellValue = dataFormatter.formatCellValue(cell);
						towerunitDetails.setExclusiveCommonAreaAllote(Long.parseLong(cellValue));

						cell = row.getCell(6);
						cellValue = dataFormatter.formatCellValue(cell);
						towerunitDetails.setCommonAreaAllotedTo(Long.parseLong(cellValue));

						cell = row.getCell(7);
						cellValue = dataFormatter.formatCellValue(cell);
						towerunitDetails.setUnDevidedShare(Long.parseLong(cellValue));

						cell = row.getCell(8);
						cellValue = dataFormatter.formatCellValue(cell);
						towerunitDetails.setNoOfParkingLots(Long.parseLong(cellValue));

						cell = row.getCell(9);
						cellValue = dataFormatter.formatCellValue(cell);
						towerunitDetails.setTowerRefId(Long.parseLong(cellValue));
						list.add(towerunitDetails);
					}
					projectRegistrationModel.getProjectDetailsModel().getTowerDetailsList().get(i).setTowerUnitDetailsList(list);
					commonDao.saveObject(projectRegistrationModel);
				}

			}else {
				System.out.println(" PLease enter the all tower details");
			}
			workbook.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return projectRegistrationModel;
	}

}
