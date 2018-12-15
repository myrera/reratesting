package in.gov.rera.transaction.postregistration.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import in.gov.rera.common.dao.impl.CommonDao;
import in.gov.rera.dms.beans.Document;
import in.gov.rera.dms.service.IDocumentService;
import in.gov.rera.dms.util.ContentUtil;
import in.gov.rera.transaction.postregistration.dao.IAmountWithdrawdBankDetlsDAO;
import in.gov.rera.transaction.postregistration.dao.IProjectScheduleDAO;
import in.gov.rera.transaction.postregistration.dao.IProjectWorkDAO;
import in.gov.rera.transaction.postregistration.model.AmountWithdrawlBankDetailsModel;
import in.gov.rera.transaction.postregistration.model.FinalApproval;
import in.gov.rera.transaction.postregistration.model.PostRegAgentDetails;
import in.gov.rera.transaction.postregistration.model.ProjectScheduleModel;
import in.gov.rera.transaction.postregistration.model.ProjectWorkModel;
import in.gov.rera.transaction.postregistration.model.WebSiteUrlDetailsModel;
import in.gov.rera.transaction.postregistration.plots.dao.IPlotAmountWithdrawdBankDetlsDAO;
import in.gov.rera.transaction.postregistration.plots.model.CivilWorkModel;
import in.gov.rera.transaction.postregistration.plots.model.PlotCommonAreasToBeUsedByPurchaserModel;
import in.gov.rera.transaction.postregistration.plots.model.PlotJDADetails;
import in.gov.rera.transaction.postregistration.plots.model.PlotJDALandOwnerDetails;
import in.gov.rera.transaction.postregistration.plots.model.PlotJDAPromoterDetails;
import in.gov.rera.transaction.postregistration.plots.model.PlotScheduleModel;
import in.gov.rera.transaction.postregistration.plots.model.PlotsAmountWithdrawlBankDetailsModel;
import in.gov.rera.transaction.postregistration.plots.model.PlotsApprovalCostDetailsModel;
import in.gov.rera.transaction.postregistration.plots.model.PlotsApprovalCostModel;
import in.gov.rera.transaction.postregistration.plots.model.PlotsCommonAreaRelinquisedAuthorityModel;
import in.gov.rera.transaction.postregistration.plots.model.PlotsConstructionCostDetails;
import in.gov.rera.transaction.postregistration.plots.model.PlotsConstructionCostmodel;
import in.gov.rera.transaction.postregistration.plots.model.PlotsCostSummary;
import in.gov.rera.transaction.postregistration.plots.model.PlotsDetailsModel;
import in.gov.rera.transaction.postregistration.plots.model.PlotsFinalApproval;
import in.gov.rera.transaction.postregistration.plots.model.PlotsLandAcquisitionCostModel;
import in.gov.rera.transaction.postregistration.plots.model.PlotsLandCostDetailsModel;
import in.gov.rera.transaction.postregistration.service.IPlotRegService;
import in.gov.rera.transaction.projectregistration.dao.IProjectRegistrationDAO;
import in.gov.rera.transaction.projectregistration.model.ProjectRegistrationModel;

@Service(value = "plotRegService")
@Scope("request")
public class PlotRegServiceImpl implements IPlotRegService {
	static Logger log= Logger.getLogger(PlotRegServiceImpl.class);
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
	public ProjectRegistrationModel getProjectRegByPk(Long pk) throws Exception {
		return postRegDAO.get(pk);
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
	public ProjectRegistrationModel saveOrUpdatePlotDetails(ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request) {
		List<PlotsDetailsModel>  plotsDetailsModelList = new ArrayList<PlotsDetailsModel>();
		PlotsDetailsModel plotDetailsModel1 = null;
		try {
			if(projectRegistrationModel.getProjectDetailsModel().getPlotDetailsList() != null && projectRegistrationModel.getProjectDetailsModel().getPlotDetailsList().size()>0) {
				// need to add later ths later	towerDetailsModel1 = (TowerDetailsModel) commonDao.getObject(TowerDetailsModel.class, Long.parseLong(request.getParameter("towerDetailsId")) );
				plotDetailsModel1 = new PlotsDetailsModel();
			}else {
				plotDetailsModel1 = new PlotsDetailsModel();
			}
			plotDetailsModel1.setTotalNumberOfPlots(Long.parseLong(request.getParameter("totalNumberOfPlots")));
			plotDetailsModel1.setTotalnoOfEWSPlots(Long.parseLong(request.getParameter("totalnoOfEWSPlots"))); 
			plotDetailsModel1.setTotalnoOfLIGPlots(Long.parseLong(request.getParameter("totalnoOfLIGPlots")));  
			plotDetailsModel1.setTotalnoOfMIGPlots(Long.parseLong(request.getParameter("totalnoOfMIGPlots"))); 
			plotDetailsModel1.setTotalnoOfHIGPlots(Long.parseLong(request.getParameter("totalnoOfHIGPlots"))); 
			plotDetailsModel1.setTotalnoOfOtherPlots(Long.parseLong(request.getParameter("totalnoOfOtherPlots")));
			//plotDetailsModel1.setTotalNumberOfPlotsAvailable(Long.parseLong(request.getParameter("totalNumberOfPlotsAvailable")));
			//plotDetailsModel1.setTotalNumberOfPlotsBooked(Long.parseLong(request.getParameter("totalNumberOfPlotsBooked")));
			plotsDetailsModelList.add(plotDetailsModel1);
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e.getMessage(), e);
			throw e;
		}
		projectRegistrationModel.getProjectDetailsModel().setPlotDetailsList(plotsDetailsModelList);
		return projectRegistrationModel;

	}

	@Override
	public ProjectRegistrationModel saveOrUpdatePlotCostDetails(
			ProjectRegistrationModel projectRegistrationModel, HttpServletRequest request) {
		//Document doc = null;
		//List<PlotsAmountWithdrawlBankDetailsModel> AmountWithdrawnList = new ArrayList<PlotsAmountWithdrawlBankDetailsModel>();
		PlotsLandCostDetailsModel costmodel = null;
		PlotsLandAcquisitionCostModel acquiModel = null;
		//PlotsAmountWithdrawlBankDetailsModel amountModel = null;

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			if(projectRegistrationModel.getProjectDetailsModel().getPlotLandCostDetailsModel() != null) {
				//amountModel = plotAmountWithdrawdBankDetlsDAO.getAmountWithdrawdBankDetlsModelById(Long.parseLong(request.getParameter("amtwithdrawBankDelsId")));
				acquiModel = projectRegistrationModel.getProjectDetailsModel().getPlotLandCostDetailsModel().getPlotLandAcquisitionCostModel();
				costmodel = projectRegistrationModel.getProjectDetailsModel().getPlotLandCostDetailsModel();
			}else {
				costmodel = new PlotsLandCostDetailsModel();
				acquiModel = new PlotsLandAcquisitionCostModel();
				//amountModel = new PlotsAmountWithdrawlBankDetailsModel();
			}
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
			}
			AmountWithdrawnList.add(amountModel);
			acquiModel.setBankDetailsModel(AmountWithdrawnList);*/
			costmodel.setPlotLandAcquisitionCostModel(acquiModel);
		}catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		projectRegistrationModel.getProjectDetailsModel().setPlotLandCostDetailsModel(costmodel);
		return projectRegistrationModel;
	}

	@Override
	public ProjectRegistrationModel saveOrUpdatePlotConstructionCostDetails(
			ProjectRegistrationModel projectRegistrationModel, HttpServletRequest request,MultipartFile certFromChartedAcc,MultipartFile certificateIssuedByStructuralEng,
			MultipartFile certificateIssuedByArchitect) throws Exception {
		List<PlotsConstructionCostDetails> consCostList = new ArrayList<PlotsConstructionCostDetails>();
		String[] consCostParticularArr = request.getParameterValues("consCostParticular");
		String[] estConsCostArr = request.getParameterValues("estConsCost");
		String[] conStructionIdArr = request.getParameterValues("constructionCostDetailsId");
		PlotsConstructionCostDetails constructionCost=null;
		PlotsConstructionCostmodel constructionCostmodel = null;
		Document doc = null;
        
		try {
			if(projectRegistrationModel.getProjectDetailsModel().getPlotsConstructionCostModel()!=null ) {
				constructionCostmodel=(PlotsConstructionCostmodel)projectRegistrationModel.getProjectDetailsModel().getPlotsConstructionCostModel();
			}else {
				constructionCostmodel=new PlotsConstructionCostmodel();
			}

			if (consCostParticularArr != null && consCostParticularArr.length > 0) {
				for (int i = 0; i < estConsCostArr.length; i++) {
					if (conStructionIdArr != null && conStructionIdArr.length > i && conStructionIdArr[i] != null && conStructionIdArr[i].trim().length() > 0) {
						constructionCost = (PlotsConstructionCostDetails)commonDao.getObject(PlotsConstructionCostDetails.class,Long.parseLong(conStructionIdArr[i]));
					} else {
						constructionCost = new PlotsConstructionCostDetails();
					}
					constructionCost.setConsCostParticular(consCostParticularArr[i]);
					constructionCost.setIsApplicable(request.getParameter("isApplicable_"+i));
					if(request.getParameter("isApplicable_"+i).equals("Yes")) {
						constructionCost.setEstConsCost(Long.parseLong((estConsCostArr[i])));

					}
					consCostList.add(constructionCost);
				}
				constructionCostmodel.setPlotsConstructionCostList(consCostList);
			}


			constructionCostmodel.setEstTotConstructionCost(Long.parseLong(request.getParameter("estTotConstructionCost")));
			constructionCostmodel.setTotProjectCost(Long.parseLong(request.getParameter("totProjectCost")));
			if(request.getParameter("certIssuedDocId") != null && request.getParameter("certIssuedDocId").trim().length() > 0 ) {
				doc = documentService.getDoc(Integer.parseInt(request.getParameter("certIssuedDocId")));
				MultipartFile obj = certFromChartedAcc;
				doc.setFileName(obj.getOriginalFilename());
				doc.setMimeType(obj.getContentType());
				doc.setInputStream(obj.getInputStream());
				if(obj.getOriginalFilename()!=null && obj.getOriginalFilename().length()>0) {
				contentUtil.saveDocument(doc);
				documentService.updateDoc(doc);
				}
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
							if(certificateIssuedByArchitect.getOriginalFilename()!=null && certificateIssuedByArchitect.getOriginalFilename().length()>0) {
							contentUtil.saveDocument(doc);
							documentService.updateDoc(doc);
							}
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
							if(certificateIssuedByStructuralEng.getOriginalFilename()!=null && certificateIssuedByStructuralEng.getOriginalFilename().length()>0) {
							contentUtil.saveDocument(doc);
							documentService.updateDoc(doc);
						}
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
		projectRegistrationModel.getProjectDetailsModel().setPlotsConstructionCostModel(constructionCostmodel);
		return projectRegistrationModel;
	}

	@Override
	public ProjectRegistrationModel updatePlotFinalApprovalDetails(ProjectRegistrationModel projectRegistrationModel,HttpServletRequest request,MultipartFile[] uploadDoc) throws Exception {
		String[] nameOfCerificateArr = request.getParameterValues("nameOfCerificate");
		PlotsFinalApproval finalApproval = null;
		Document doc=null;
		List<PlotsFinalApproval> finalApprovalList = new ArrayList<PlotsFinalApproval>();
		try {
			String[] finalApprovalsDetailsIdIdArr = request.getParameterValues("finalApprovalsDetailsId");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

			if (nameOfCerificateArr != null && nameOfCerificateArr.length > 0) {
				for(int i=0;i< nameOfCerificateArr.length; i++) {
					if (nameOfCerificateArr[i] != null) {
						if (finalApprovalsDetailsIdIdArr != null && finalApprovalsDetailsIdIdArr.length > i && finalApprovalsDetailsIdIdArr[i] != null && finalApprovalsDetailsIdIdArr[i].trim().length() > 0) {
							finalApproval = (PlotsFinalApproval)commonDao.getObject(FinalApproval.class,Long.parseLong(finalApprovalsDetailsIdIdArr[i]));
						} else {
							finalApproval = new PlotsFinalApproval();
						}

						finalApproval.setNameOfCerificate(nameOfCerificateArr[i]);
						finalApproval.setIsApproved(request.getParameter("isApproved_"+i));
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
							//doc.setDocumentType("FINAL_APPROVAL");
							//doc.setFolderId("" + projectRegistrationModel.getProjectRegId());
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
		projectRegistrationModel.getProjectDetailsModel().setPlotfinalApproval(finalApprovalList);
		return projectRegistrationModel;
	}

	@Override
	public ProjectRegistrationModel updatePlotSummaryDetails(ProjectRegistrationModel projectRegistrationModel,HttpServletRequest request) throws Exception {
		PlotsCostSummary  plotSummary = null;
		try {
			if(projectRegistrationModel.getProjectDetailsModel().getPlotSummary() != null) {
				plotSummary = projectRegistrationModel.getProjectDetailsModel().getPlotSummary();
			}else {
				plotSummary = new PlotsCostSummary();
			}
			plotSummary.setEstLandCost(Long.parseLong(request.getParameter("estLandCost")));
			plotSummary.setEstCostOfApprove(Long.parseLong(request.getParameter("estCostOfApprove")));
			plotSummary.setEstConstructionCost(Long.parseLong(request.getParameter("estConstructionCost")));
			plotSummary.setEstTotalCost(Long.parseLong(request.getParameter("estTotalCost")));

			plotSummary.setActLandCost(Long.parseLong(request.getParameter("actLandCost")));
			plotSummary.setActCostOfApprove(Long.parseLong(request.getParameter("actCostOfApprove")));
			plotSummary.setActConstructionCost(Long.parseLong(request.getParameter("actConstructionCost")));
			plotSummary.setActTotalCost(Long.parseLong(request.getParameter("actTotalCost")));

			plotSummary.setAmtCollectedFromAllotee(Long.parseLong(request.getParameter("amtCollectedFromAllotee")));
			plotSummary.setAmtUtilizedforConstruction(Long.parseLong(request.getParameter("amtUtilizedforConstruction")));
			plotSummary.setAmtUtilPercentage(Float.parseFloat(request.getParameter("amtUtilPercentage")));
			plotSummary.setBalanceAmt(Long.parseLong(request.getParameter("balanceAmt")));

		} catch (Exception e) {
			e.printStackTrace();
			log.error(e.getMessage(), e);
			throw e;
		}
		projectRegistrationModel.getProjectDetailsModel().setPlotSummary(plotSummary);;
		return projectRegistrationModel;
	}






	@Override
	public ProjectRegistrationModel savePlotScheduleCivilWorkDetails(ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request) throws Exception {
		List<CivilWorkModel> civilWorkList = new ArrayList<CivilWorkModel>();
		String[] typeOfWorkArr = request.getParameterValues("typeOfWork");
		boolean isSid = false;
		String sid = request.getParameter("plotScheduleModelId");
		CivilWorkModel plotsCivilWorkModel = null;
		PlotScheduleModel plotScheduleModel = null;
		try {
			String[] plotWorkIdArr = request.getParameterValues("civilWorkId");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

			if (typeOfWorkArr != null && typeOfWorkArr.length > 0) {
				for (int i = 0; i < typeOfWorkArr.length; i++) {
					if (typeOfWorkArr[i] != null) {
						if (plotWorkIdArr != null && plotWorkIdArr.length > i && plotWorkIdArr[i] != null
								&& plotWorkIdArr[i].trim().length() > 0) {
							plotsCivilWorkModel = (CivilWorkModel) commonDao.getObject(CivilWorkModel.class,
									Long.parseLong(plotWorkIdArr[i]));
							plotScheduleModel = projectRegistrationModel.getProjectDetailsModel()
									.getPlotScheduleModel();
						} else {
							log.info("created ProjectScheduleModel");
							if (sid != "" && sid.length() > 0) {
								plotsCivilWorkModel = new CivilWorkModel();
							} else {
								isSid = true;
								plotScheduleModel = new PlotScheduleModel();
								plotsCivilWorkModel = new CivilWorkModel();
							}

						}
						plotsCivilWorkModel.setTypeOfWork(typeOfWorkArr[i]);
						if (request.getParameterValues("estimatedFrmDate")[i] != null && request.getParameterValues("estimatedFrmDate")[i] != " " &&  request.getParameterValues("estimatedFrmDate")[i].trim().length()>0) {
							Date date = sdf.parse(request.getParameterValues("estimatedFrmDate")[i]);
							log.info("date " + date);
							Calendar estimatedFrmDateCal = Calendar.getInstance();
							estimatedFrmDateCal.setTime(date);
							plotsCivilWorkModel.setEstimatedFrmDate(estimatedFrmDateCal);
						}
						if (request.getParameterValues("estimatedToDate")[i] != null && request.getParameterValues("estimatedToDate")[i] != " " &&  request.getParameterValues("estimatedFrmDate")[i].trim().length()>0) {
							Date estimatedToDate = sdf.parse(request.getParameterValues("estimatedToDate")[i]);
							Calendar estimatedToDateCal = Calendar.getInstance();
							estimatedToDateCal.setTime(estimatedToDate);
							plotsCivilWorkModel.setEstimatedToDate(estimatedToDateCal);
						}
						plotsCivilWorkModel.setIsApplicable(request.getParameter("isApplicable_" + i));
						civilWorkList.add(plotsCivilWorkModel);
					}

				}
				if (isSid) {
					plotScheduleModel.setCivilWorkList(civilWorkList);
					projectRegistrationModel.getProjectDetailsModel().setPlotScheduleModel(plotScheduleModel);
					isSid = false;
				} else {
					projectRegistrationModel.getProjectDetailsModel().getPlotScheduleModel()
					.setCivilWorkList(civilWorkList);
				}
			}
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		// projectRegistrationModel.getProjectDetailsModel().setProjectScheduleModel(projectScheduleModel);
		return projectRegistrationModel;
	}

	// saveOrUpdatePlotScheduleCommonAreasPurchaserDetails

	@Override
	public ProjectRegistrationModel saveOrUpdatePlotScheduleCommonAreasPurchaserDetails(
			ProjectRegistrationModel projectRegistrationModel, HttpServletRequest request) throws Exception {
		List<PlotCommonAreasToBeUsedByPurchaserModel> commonAreasPurchaserList = new ArrayList<PlotCommonAreasToBeUsedByPurchaserModel>();
		String[] typeOfWorkArr = request.getParameterValues("commonArea");
		PlotCommonAreasToBeUsedByPurchaserModel plotCommonAreaDetails = null;
		try {
			String[] projWorkIdArr = request.getParameterValues("commonAreasToBeUsedByPurchaserId");
			if (typeOfWorkArr != null && typeOfWorkArr.length > 0) {
				for (int i = 0; i < typeOfWorkArr.length; i++) {
					if (typeOfWorkArr[i] != null) {
						if (projWorkIdArr != null && projWorkIdArr.length > i && projWorkIdArr[i] != null
								&& projWorkIdArr[i].trim().length() > 0) {
							plotCommonAreaDetails = (PlotCommonAreasToBeUsedByPurchaserModel) commonDao.getObject(
									PlotCommonAreasToBeUsedByPurchaserModel.class, Long.parseLong(projWorkIdArr[i]));
						} else {

							plotCommonAreaDetails = new PlotCommonAreasToBeUsedByPurchaserModel();
							log.info("created ProjectScheduleModel");
						}
						plotCommonAreaDetails.setCommonArea(typeOfWorkArr[i]);
						plotCommonAreaDetails.setIsApplicable(request.getParameter("isApplicable_" + i));
						// plotCommonAreaDetails.setCreatedOn(Calendar.getInstance());
						commonAreasPurchaserList.add(plotCommonAreaDetails);
					}
				}
			}
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		projectRegistrationModel.getProjectDetailsModel().getPlotScheduleModel()
		.setCommonAreasPurchaserList(commonAreasPurchaserList);
		return projectRegistrationModel;
	}

	@Override
	public ProjectRegistrationModel saveOrUpdatePlotScheduleCommonAreasAuthorityDetails(
			ProjectRegistrationModel baseObject, HttpServletRequest request) throws Exception {

		PlotsCommonAreaRelinquisedAuthorityModel plotsCommonAreaRelinquisedAuthorityModel = null;
		try {

			if (baseObject.getProjectDetailsModel().getPlotScheduleModel().getPlotsCommonAreaRelinquisedAuthorityModel() != null  ) {
				plotsCommonAreaRelinquisedAuthorityModel = baseObject.getProjectDetailsModel().getPlotScheduleModel().getPlotsCommonAreaRelinquisedAuthorityModel();
			} else {
				plotsCommonAreaRelinquisedAuthorityModel = new PlotsCommonAreaRelinquisedAuthorityModel();
			}
			plotsCommonAreaRelinquisedAuthorityModel
			.setTotNoOfParkAndOpenSpace(Long.parseLong(request.getParameter("totNoOfParkAndOpenSpace")));
			plotsCommonAreaRelinquisedAuthorityModel
			.setTotAreaOfRoad(Long.parseLong(request.getParameter("totAreaOfRoad")));
			plotsCommonAreaRelinquisedAuthorityModel.setTotAreaOfPublicOrSemiPubSites(
					Long.parseLong(request.getParameter("totAreaOfPublicOrSemiPubSites")));
			plotsCommonAreaRelinquisedAuthorityModel
			.setNoOfPublicOrSemiPubSites(Long.parseLong(request.getParameter("noOfPublicOrSemiPubSites")));
			plotsCommonAreaRelinquisedAuthorityModel
			.setTotAreaOfParkAndOpenSpace(Long.parseLong(request.getParameter("totAreaOfParkAndOpenSpace")));

		} catch (Exception e) {
			e.printStackTrace();
			log.error(e.getMessage(), e);
			throw e;
		}
		baseObject.getProjectDetailsModel().getPlotScheduleModel()
		.setPlotsCommonAreaRelinquisedAuthorityModel(plotsCommonAreaRelinquisedAuthorityModel);
		return baseObject;
	}

	@Override
	public ProjectRegistrationModel saveOrUpdatePlotJDADetails(ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request) throws Exception {
		List<PlotJDAPromoterDetails> promoterList = null;
		List<PlotJDALandOwnerDetails> landownerList = null;
		PlotsLandAcquisitionCostModel acquiModel = projectRegistrationModel.getProjectDetailsModel().getPlotLandCostDetailsModel().getPlotLandAcquisitionCostModel();
		PlotJDADetails jdaModel=null;
		PlotJDAPromoterDetails promoterModel=null;
		PlotJDALandOwnerDetails landownerModel=null;

		try {
			if(acquiModel.getProjectJDADetailsModel()!= null) {
				jdaModel = acquiModel.getProjectJDADetailsModel();
				promoterList=jdaModel.getPromoterList();
				landownerList=jdaModel.getLandOwnerList();
			}else {
				jdaModel = new PlotJDADetails();
				promoterList = new ArrayList<PlotJDAPromoterDetails>();
				landownerList = new ArrayList<PlotJDALandOwnerDetails>();
			}
			if(acquiModel.getNumberOfPromoters()>0) {
				String[] promoterArray=request.getParameterValues("promoterName");
				for (int i = 0; i < promoterArray.length; i++) {
					promoterModel=new PlotJDAPromoterDetails();
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
					landownerModel=new PlotJDALandOwnerDetails();
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
		}catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return projectRegistrationModel;
	}

	/*@Override
	public ProjectRegistrationModel saveOrUpdatePlotApprovalCostDetails(ProjectRegistrationModel projectRegistrationModel, 
			HttpServletRequest request,MultipartFile[]  certFromChartedAcc) throws Exception {
		Document doc = null;
		List<PlotsAmountWithdrawlBankDetailsModel> AmountWithdrawnList = new ArrayList<PlotsAmountWithdrawlBankDetailsModel>();
		PlotsLandCostDetailsModel landCostmodel = null;
		PlotsApprovalCostDetailsModel approvalCostModel = null;
		PlotsAmountWithdrawlBankDetailsModel amountModel = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String[] amtwithdrawBankDelsId = request.getParameterValues("amtwithdrawBankDelsId");
		String[] amount = request.getParameterValues("amount");
		String[] certFromChartedAccDocId = request.getParameterValues("certFromChartedAccDocId"); 
		try {
			if(projectRegistrationModel.getProjectDetailsModel().getPlotLandCostDetailsModel() != null) {
				landCostmodel = projectRegistrationModel.getProjectDetailsModel().getPlotLandCostDetailsModel();
				if(projectRegistrationModel.getProjectDetailsModel().getPlotLandCostDetailsModel().getPlotApprovalCostDetailsModel() != null) {
					approvalCostModel = projectRegistrationModel.getProjectDetailsModel().getPlotLandCostDetailsModel().getPlotApprovalCostDetailsModel();
				}else {
					approvalCostModel = new PlotsApprovalCostDetailsModel();
				}
			}else {
				landCostmodel = new PlotsLandCostDetailsModel();
				approvalCostModel = new  PlotsApprovalCostDetailsModel();
			}
			approvalCostModel.setNoObjectionCertAmtForCC(Long.parseLong(request.getParameter("noObjectionCertAmtForCC")));
			approvalCostModel.setNoObjectionCertAmtForBESCOM(Long.parseLong(request.getParameter("noObjectionCertAmtForBESCOM")));
			approvalCostModel.setNoObjectionCertAmtForBWSSB(Long.parseLong(request.getParameter("noObjectionCertAmtForBWSSB")));
			approvalCostModel.setNoObjectionCertAmtFORKSPCB(Long.parseLong(request.getParameter("noObjectionCertAmtFORKSPCB")));
			approvalCostModel.setNoObjectionCertAmtForOtherNOC(Long.parseLong(request.getParameter("noObjectionCertAmtForOtherNOC")));
			approvalCostModel.setPlotApprovalAmt(Long.parseLong(request.getParameter("planApprovalAmt")));
			approvalCostModel.setStampsDutyAmt(Long.parseLong(request.getParameter("stampsDutyAmt")));
			approvalCostModel.setTransferCharges(Long.parseLong(request.getParameter("transferCharges")));
			approvalCostModel.setRegistrationCharges(Long.parseLong(request.getParameter("registrationCharges")));
			approvalCostModel.setConversionCharges(Long.parseLong(request.getParameter("conversionCharges")));
			approvalCostModel.setTaxAmt(Long.parseLong(request.getParameter("taxAmt")));
			approvalCostModel.setTotalCostOfApprovals(Long.parseLong(request.getParameter("totalCostOfApprovals")));
			if(amount != null && amount.length > 0) {
				for(int i=0; i<amount.length;i++) {
					log.info("amount arr size "+amount.length);
					if( amount[i] != null) {
						if(amtwithdrawBankDelsId != null && amtwithdrawBankDelsId.length > i && amtwithdrawBankDelsId[i] != null && amtwithdrawBankDelsId[i].trim().length() > 0 ) {
							amountModel = plotAmountWithdrawdBankDetlsDAO.getAmountWithdrawdBankDetlsModelById(Long.parseLong(amtwithdrawBankDelsId[i]));
							doc = documentService.getDoc(Integer.parseInt(certFromChartedAccDocId[i].trim()));
						}else {
							amountModel = new PlotsAmountWithdrawlBankDetailsModel();
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
						//log.info("name >>"+certFromChartedAcc[i].getOriginalFilename());
						doc.setFileName(certFromChartedAcc[i].getOriginalFilename());
						doc.setMimeType(certFromChartedAcc[i].getContentType());
						doc.setInputStream(certFromChartedAcc[i].getInputStream());
						contentUtil.saveDocument(doc);
						documentService.updateDoc(doc);

						if(amountModel != null & amountModel.getCertFromChartedAcc() !=null) {
							doc = amountModel.getCertFromChartedAcc();
							//log.info("doc name "+doc.getFileName()+"id >"+doc.getDocumentId());
							doc.setFileName(certFromChartedAcc[i].getOriginalFilename());
							doc.setMimeType(certFromChartedAcc[i].getContentType());
							doc.setInputStream(certFromChartedAcc[i].getInputStream());
							contentUtil.saveDocument(doc);
							documentService.updateDoc(doc);
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
			approvalCostModel.setBankDetailsModel(AmountWithdrawnList);
			landCostmodel.setPlotApprovalCostDetailsModel(approvalCostModel);
		}catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		projectRegistrationModel.getProjectDetailsModel().setPlotLandCostDetailsModel(landCostmodel);
		return projectRegistrationModel;
	}*/

	@Override
	public ProjectRegistrationModel saveOrUpdatePlotApprovalCostDetails(ProjectRegistrationModel baseObject,
			HttpServletRequest request, MultipartFile[] certFromChartedAcc) throws Exception {
		Document doc = null;
		List<PlotsAmountWithdrawlBankDetailsModel> AmountWithdrawnList = new ArrayList<PlotsAmountWithdrawlBankDetailsModel>();
		List<PlotsApprovalCostDetailsModel> approvalCostDetailsModelList = new ArrayList<PlotsApprovalCostDetailsModel>();
		PlotsApprovalCostDetailsModel approvalCostDetailsModel = null;
		PlotsApprovalCostModel approvalCostModel = null;
		PlotsLandCostDetailsModel landCostmodel = null;
		PlotsAmountWithdrawlBankDetailsModel amountModel = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String[] amtwithdrawBankDelsId = request.getParameterValues("amtwithdrawBankDelsId");
		String[] amount = request.getParameterValues("amount");
		String[] certFromChartedAccDocId = request.getParameterValues("certFromChartedAccDocId");

		String[] approvalNameArr = request.getParameterValues("approvalParticular");
		String[] amountArr = request.getParameterValues("approvalAmt");
		String[] approveCostDetlsIdArr = request.getParameterValues("approveCostDetlsId");

		try {
			if(baseObject.getProjectDetailsModel().getPlotLandCostDetailsModel()!=null) {
				landCostmodel=baseObject.getProjectDetailsModel().getPlotLandCostDetailsModel();
				if(landCostmodel.getApprovalCostModel()!=null) {
					approvalCostModel=landCostmodel.getApprovalCostModel();
				}else {
					approvalCostModel=new PlotsApprovalCostModel();
				}
			}else {
				landCostmodel=new PlotsLandCostDetailsModel();
				approvalCostModel=new PlotsApprovalCostModel();
				landCostmodel.setApprovalCostModel(approvalCostModel);
				commonDao.saveObject(landCostmodel);
				baseObject.getProjectDetailsModel().setPlotLandCostDetailsModel(landCostmodel);
			}

			if(approvalNameArr != null && approvalNameArr.length > 0) {
				for (int i = 0; i < approvalNameArr.length; i++) {
					if(approveCostDetlsIdArr != null && approveCostDetlsIdArr.length > i && approveCostDetlsIdArr[i] != null && approveCostDetlsIdArr[i].trim().length() > 0)
					{ 
						approvalCostDetailsModel = (PlotsApprovalCostDetailsModel)commonDao.getObject(PlotsApprovalCostDetailsModel.class,Long.parseLong(approveCostDetlsIdArr[i]));
					}else {
						approvalCostDetailsModel = new PlotsApprovalCostDetailsModel();
					}
					approvalCostDetailsModel.setApprovalParticular(approvalNameArr[i]);
					approvalCostDetailsModel.setIsApplicable(request.getParameter("isApplicable_"+i));
					if(request.getParameter("isApplicable_"+i).equals("Yes"))
						approvalCostDetailsModel.setApprovalAmt(Long.parseLong(amountArr[i]));
					approvalCostDetailsModelList.add(approvalCostDetailsModel);
				}
				System.out.println(approvalCostDetailsModelList.size());
				approvalCostModel.setApprovalCostDetails(approvalCostDetailsModelList);
				approvalCostModel.setTotalCostOfApprovals(Long.parseLong(request.getParameter("totalCostOfApprovals")));
			}

			if(amount != null && amount.length > 0) {
				for(int i=0; i<amount.length;i++) {
					log.info("amount arr size "+amount.length);
					if( amount[i] != null) {
						if(amtwithdrawBankDelsId != null && amtwithdrawBankDelsId.length > i && amtwithdrawBankDelsId[i] != null && amtwithdrawBankDelsId[i].trim().length() > 0 ) {
							amountModel = plotAmountWithdrawdBankDetlsDAO.getAmountWithdrawdBankDetlsModelById(Long.parseLong(amtwithdrawBankDelsId[i]));
							doc = documentService.getDoc(Integer.parseInt(certFromChartedAccDocId[i].trim()));
						}else {
							amountModel = new PlotsAmountWithdrawlBankDetailsModel();
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
							doc.setFolderId("" + baseObject.getProjectRegId());
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
			approvalCostModel.setBankDetailsModel(AmountWithdrawnList);
			landCostmodel.setApprovalCostModel(approvalCostModel);;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return baseObject;
	}

}
