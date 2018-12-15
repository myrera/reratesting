package in.gov.rera.transaction.postregistration.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import in.gov.rera.common.dao.impl.CommonDao;
import in.gov.rera.dms.beans.Document;
import in.gov.rera.dms.service.IDocumentService;
import in.gov.rera.dms.util.ContentUtil;
import in.gov.rera.transaction.postregistration.model.ProjectLitigationDetails;
import in.gov.rera.transaction.postregistration.plots.model.PlotsApprovalsAndNOCDetails;
import in.gov.rera.transaction.postregistration.plots.model.PlotsAssociationRegistrationDetails;
import in.gov.rera.transaction.postregistration.plots.model.PlotsBankDetails;
import in.gov.rera.transaction.postregistration.plots.model.PlotsLitigationDetails;
import in.gov.rera.transaction.postregistration.plots.model.PlotsModificationDetails;
import in.gov.rera.transaction.postregistration.plots.model.PlotsQuaterlyUpdate;
import in.gov.rera.transaction.postregistration.plots.model.PlotsWelfareFundDetails;
import in.gov.rera.transaction.postregistration.plots.model.QuarterPlotsConstructionCostModel;
import in.gov.rera.transaction.postregistration.plots.model.QuarterlyCivilWorkModel;
import in.gov.rera.transaction.postregistration.plots.model.QuarterlyPlotCommonPurchaserModel;
import in.gov.rera.transaction.postregistration.plots.model.QuarterlyPlotsCommonAuthorityModel;
import in.gov.rera.transaction.postregistration.plots.model.QuaterlyPlotsDetailsModel;
import in.gov.rera.transaction.postregistration.service.IPlotQuaterlyUpdateService;
import in.gov.rera.transaction.projectregistration.dao.IProjectRegistrationDAO;
import in.gov.rera.transaction.projectregistration.model.ProjectRegistrationModel;

@Service(value = "plotQuaterlyUpdateService")
@Scope("request")
public class PlotQuaterlyUpdateServiceImpl implements IPlotQuaterlyUpdateService {
	static Logger log= Logger.getLogger(PlotQuaterlyUpdateServiceImpl.class);
	@Autowired
	IProjectRegistrationDAO<ProjectRegistrationModel, Long> postRegDAO;
	
	@Autowired
	ContentUtil contentUtil;
	
	@Autowired(required = true)
	IDocumentService<Document, Integer> documentService;

	@Autowired
	CommonDao<Object, Long> commonDao;
	
	List<PlotsQuaterlyUpdate> plotQuaterlyUpdateList = new ArrayList<PlotsQuaterlyUpdate>();
	
	PlotsQuaterlyUpdate plotQuaterlyUpdate = null;
	
	Document doc = null;
	
	@Override
	public ProjectRegistrationModel saveUpdateQuarterPlotDetails(ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request, long quarterId) throws Exception {
		QuaterlyPlotsDetailsModel plotDetails =null;
		try {
			plotQuaterlyUpdate = (PlotsQuaterlyUpdate)commonDao.getObject(PlotsQuaterlyUpdate.class,quarterId);

			if(plotQuaterlyUpdate.getPlotDetails() != null  ) {
				plotDetails = plotQuaterlyUpdate.getPlotDetails();
			}else {
				plotDetails = new QuaterlyPlotsDetailsModel();
			}
			plotDetails.setTotalnoOfEWSPlotsBooked(Long.parseLong(request.getParameter("totalnoOfEWSPlotsBooked")));
			plotDetails.setTotalnoOfLIGPlotsBooked(Long.parseLong(request.getParameter("totalnoOfLIGPlotsBooked")));
			plotDetails.setTotalnoOfMIGPlotsBooked(Long.parseLong(request.getParameter("totalnoOfMIGPlotsBooked")));
			plotDetails.setTotalnoOfHIGPlotsBooked(Long.parseLong(request.getParameter("totalnoOfHIGPlotsBooked")));
			plotDetails.setTotalnoOfOtherPlotsBooked(Long.parseLong(request.getParameter("totalnoOfOtherPlotsBooked")));
			plotDetails.setTotalNumberOfPlotsBooked(Long.parseLong(request.getParameter("totalNumberOfPlotsBooked")));
			plotDetails.setTotalnoOfEWSPlotsAvailable(Long.parseLong(request.getParameter("totalnoOfEWSPlotsAvailable")));
			plotDetails.setTotalnoOfLIGPlotsAvailable(Long.parseLong(request.getParameter("totalnoOfLIGPlotsAvailable")));
			plotDetails.setTotalnoOfMIGPlotsAvailable(Long.parseLong(request.getParameter("totalnoOfMIGPlotsAvailable")));
			plotDetails.setTotalnoOfHIGPlotsAvailable(Long.parseLong(request.getParameter("totalnoOfHIGPlotsAvailable")));
			plotDetails.setTotalnoOfOtherPlotsAvailable(Long.parseLong(request.getParameter("totalnoOfOtherPlotsAvailable")));
			plotDetails.setTotalNumberOfPlotsAvailable(Long.parseLong(request.getParameter("totalNumberOfPlotsAvailable")));
			plotQuaterlyUpdate.setPlotDetails(plotDetails);
			commonDao.updateObject(plotQuaterlyUpdate);
			//plotQuaterlyUpdateList.add(plotQuaterlyUpdate);

		} catch (Exception e) {
			e.printStackTrace();
			log.error(e.getMessage(), e);
		}
		//projectRegistrationModel.getProjectDetailsModel().setPlotsQuarterlyUpdate(plotQuaterlyUpdateList);
		return projectRegistrationModel;
	}

	@Override
	public ProjectRegistrationModel updatePlotCivilWorksDetails(ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request, long quarterId) throws Exception {
		List<QuarterlyCivilWorkModel> quarterCivilWorkList = new ArrayList<QuarterlyCivilWorkModel>();
		String[] typeOfWorkArr = request.getParameterValues("typeOfWork");
		QuarterlyCivilWorkModel quarterlyCivilWorkModel = null;
		plotQuaterlyUpdate = (PlotsQuaterlyUpdate)commonDao.getObject(PlotsQuaterlyUpdate.class,quarterId);
		try {
			String[] projWorkIdArr = request.getParameterValues("civilWorkId");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

			if (typeOfWorkArr != null && typeOfWorkArr.length > 0) {
				for(int i=0;i< typeOfWorkArr.length; i++) {
					if (typeOfWorkArr[i] != null) {
						if (projWorkIdArr != null && projWorkIdArr.length > i && projWorkIdArr[i] != null && projWorkIdArr[i].trim().length() > 0) {
							quarterlyCivilWorkModel = (QuarterlyCivilWorkModel)commonDao.getObject(QuarterlyCivilWorkModel.class,Long.parseLong(projWorkIdArr[i]));
						} else {
							quarterlyCivilWorkModel = new QuarterlyCivilWorkModel();
						}
					}
					quarterlyCivilWorkModel.setTypeOfWork(typeOfWorkArr[i]);
					if(request.getParameterValues("estimatedFrmDate")[i] != null && request.getParameterValues("estimatedFrmDate")[i] != " " ) {
						Date date = sdf.parse(request.getParameterValues("estimatedFrmDate")[i]);
						log.info("date "+date);
						Calendar estimatedFrmDateCal = Calendar.getInstance();
						estimatedFrmDateCal.setTime(date);
						quarterlyCivilWorkModel.setEstimatedFrmDate(estimatedFrmDateCal);
					}
					if(request.getParameterValues("estimatedToDate")[i] != null && request.getParameterValues("estimatedToDate")[i] != " " ) {
						Date estimatedToDate = sdf.parse(request.getParameterValues("estimatedToDate")[i]);
						Calendar estimatedToDateCal = Calendar.getInstance();
						estimatedToDateCal.setTime(estimatedToDate);
						quarterlyCivilWorkModel.setEstimatedToDate(estimatedToDateCal);
					}
					if(request.getParameterValues("actualFrmDate")[i] != null && request.getParameterValues("actualFrmDate")[i] != " " ) {
						Date actualFrmDate = sdf.parse(request.getParameterValues("actualFrmDate")[i]);
						Calendar actualFrmDateCal = Calendar.getInstance();
						actualFrmDateCal.setTime(actualFrmDate);
						quarterlyCivilWorkModel.setActualFrmDate(actualFrmDateCal);
					}
					if(request.getParameterValues("actualToDate")[i] != null && request.getParameterValues("actualToDate")[i] != " " ) {
						Date actualToDate = sdf.parse(request.getParameterValues("actualToDate")[i]);
						Calendar actualToDateCal = Calendar.getInstance();
						actualToDateCal.setTime(actualToDate);
						quarterlyCivilWorkModel.setActualToDate(actualToDateCal);
					}

					commonDao.updateObject(quarterlyCivilWorkModel);
					quarterCivilWorkList.add(quarterlyCivilWorkModel);
					plotQuaterlyUpdate.setQuarterCivilWorkList(quarterCivilWorkList);	
					//plotQuaterlyUpdateList.add(plotQuaterlyUpdate);
					commonDao.updateObject(plotQuaterlyUpdate);

				}

			}
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return projectRegistrationModel;
	}

	@Override
	public ProjectRegistrationModel saveOrUpdateQuarterlyCommonAreasAuthorityDetails(
			ProjectRegistrationModel baseObject, HttpServletRequest request, long quarterId, MultipartFile sitesPhotograph,MultipartFile openSpacePhotograph,MultipartFile roadPhotograph) {
		QuarterlyPlotsCommonAuthorityModel quarterlyAuthorityModel = null;

		plotQuaterlyUpdate = (PlotsQuaterlyUpdate)commonDao.getObject(PlotsQuaterlyUpdate.class,quarterId);
		try {

			if (plotQuaterlyUpdate.getQuarterlyPlotsCommonAuthorityModel() != null) {
				quarterlyAuthorityModel =plotQuaterlyUpdate.getQuarterlyPlotsCommonAuthorityModel();
			} else {
				quarterlyAuthorityModel = new QuarterlyPlotsCommonAuthorityModel();
			}
			quarterlyAuthorityModel.setTotNoOfParkAndOpenSpace(Long.parseLong(request.getParameter("totNoOfParkAndOpenSpace")));
			quarterlyAuthorityModel.setTotAreaOfRoad(Long.parseLong(request.getParameter("totAreaOfRoad")));
			quarterlyAuthorityModel.setTotAreaOfPublicOrSemiPubSites(Long.parseLong(request.getParameter("totAreaOfPublicOrSemiPubSites")));
			quarterlyAuthorityModel.setNoOfPublicOrSemiPubSites(Long.parseLong(request.getParameter("noOfPublicOrSemiPubSites")));
			quarterlyAuthorityModel.setTotAreaOfParkAndOpenSpace(Long.parseLong(request.getParameter("totAreaOfParkAndOpenSpace")));

			quarterlyAuthorityModel.setPercentageOfCompletionOfSites(Long.parseLong(request.getParameter("percentageOfCompletionOfSites")));
			quarterlyAuthorityModel.setPercentageOfCompletionOfOpenSpace(Long.parseLong(request.getParameter("percentageOfCompletionOfOpenSpace")));

			quarterlyAuthorityModel.setPercentageOfCompletionOfRoad(Long.parseLong(request.getParameter("percentageOfCompletionOfRoad")));


			if (request.getParameter("sitesPhotographId") != null && request.getParameter("sitesPhotograph") != null) {
				doc = documentService .getDoc(Integer.parseInt(request.getParameter("sitesPhotographId").trim()));
				doc.setFileName(sitesPhotograph.getOriginalFilename());
				doc.setMimeType(sitesPhotograph.getContentType());
				doc.setInputStream(sitesPhotograph.getInputStream());
				contentUtil.saveDocument(doc);
				documentService.updateDoc(doc);
			} else {
				doc = new Document();
				doc.setFileName(sitesPhotograph.getOriginalFilename());
				//doc.setDocumentType("QUARTER_UPDT");
				//doc.setFolderId("" + photograph.getProjectRegId());
				doc.setMimeType(sitesPhotograph.getContentType());
				doc.setInputStream(sitesPhotograph.getInputStream());
				contentUtil.saveDocument(doc);
				documentService.saveDoc(doc);
			}

			quarterlyAuthorityModel.setSitesPhotograph(doc);

			if (request.getParameter("openSpacePhotographId") != null && request.getParameter("openSpacePhotograph") != null) {
				doc = documentService .getDoc(Integer.parseInt(request.getParameter("openSpacePhotographId").trim()));
				doc.setFileName(openSpacePhotograph.getOriginalFilename());
				doc.setMimeType(openSpacePhotograph.getContentType());
				doc.setInputStream(openSpacePhotograph.getInputStream());
				contentUtil.saveDocument(doc);
				documentService.updateDoc(doc);
			} else {
				doc = new Document();
				doc.setFileName(openSpacePhotograph.getOriginalFilename());
				//doc.setDocumentType("QUARTER_UPDT");
				//doc.setFolderId("" + photograph.getProjectRegId());
				doc.setMimeType(openSpacePhotograph.getContentType());
				doc.setInputStream(openSpacePhotograph.getInputStream());
				contentUtil.saveDocument(doc);
				documentService.saveDoc(doc);
			}

			quarterlyAuthorityModel.setOpenSpacePhotograph(doc);


			if (request.getParameter("roadPhotographId") != null && request.getParameter("roadPhotograph") != null) {
				doc = documentService .getDoc(Integer.parseInt(request.getParameter("roadPhotographId").trim()));
				doc.setFileName(roadPhotograph.getOriginalFilename());
				doc.setMimeType(roadPhotograph.getContentType());
				doc.setInputStream(roadPhotograph.getInputStream());
				contentUtil.saveDocument(doc);
				documentService.updateDoc(doc);
			} else {
				doc = new Document();
				doc.setFileName(roadPhotograph.getOriginalFilename());
				//doc.setDocumentType("QUARTER_UPDT");
				//doc.setFolderId("" + photograph.getProjectRegId());
				doc.setMimeType(roadPhotograph.getContentType());
				doc.setInputStream(roadPhotograph.getInputStream());
				contentUtil.saveDocument(doc);
				documentService.saveDoc(doc);
			}

			quarterlyAuthorityModel.setRoadPhotograph(doc);


			plotQuaterlyUpdate.setQuarterlyPlotsCommonAuthorityModel(quarterlyAuthorityModel);
			commonDao.updateObject(plotQuaterlyUpdate);
			//plotQuaterlyUpdateList.add(plotQuaterlyUpdate);

		} catch (Exception e) {
			e.printStackTrace();
			log.error(e.getMessage(), e);
			//throw e;
		}
		//baseObject.getProjectDetailsModel().setPlotsQuarterlyUpdate(plotQuaterlyUpdateList);
		return baseObject;
	}

	@Override
	public ProjectRegistrationModel saveOrUpdateQuarterlyCommonAreasPurchaserDetails( ProjectRegistrationModel baseObject, HttpServletRequest request,long quarterId) {

		List<QuarterlyPlotCommonPurchaserModel> quarterlyPlotCommonPurchaserList = new ArrayList<QuarterlyPlotCommonPurchaserModel>();
		String[] commonAreaArr = request.getParameterValues("commonArea");
		QuarterlyPlotCommonPurchaserModel quarterlyPurchaserModel = null;
		plotQuaterlyUpdate = (PlotsQuaterlyUpdate)commonDao.getObject(PlotsQuaterlyUpdate.class,quarterId);

		try {
			String[] percentageArray = request.getParameterValues("percentageOfCompletion");
			String[] commonPurchaserIdArr = request.getParameterValues("quarterlyCommonAreasToBeUsedByPurchaserId");
			//SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");


			if(percentageArray != null && percentageArray.length > 0) {
				for(int i=0; i<percentageArray.length;i++) {
					if( percentageArray[i] != null) {
						if(commonPurchaserIdArr != null && commonPurchaserIdArr.length > i && commonPurchaserIdArr[i] != null && commonPurchaserIdArr[i].trim().length() > 0 ) {
							quarterlyPurchaserModel = (QuarterlyPlotCommonPurchaserModel)commonDao.getObject(QuarterlyPlotCommonPurchaserModel.class,Long.parseLong(commonPurchaserIdArr[i]));
						}else {
							quarterlyPurchaserModel = new QuarterlyPlotCommonPurchaserModel();
						}
						quarterlyPurchaserModel.setCommonArea(request.getParameterValues("commonArea")[i]);
						quarterlyPurchaserModel.setPercentageOfCompletion(Long.parseLong(request.getParameterValues("percentageOfCompletion")[i]));

					}
					commonDao.updateObject(quarterlyPurchaserModel);
					quarterlyPlotCommonPurchaserList.add(quarterlyPurchaserModel);

				}

				plotQuaterlyUpdate.setQuarterCommonAreasPurchaserList(quarterlyPlotCommonPurchaserList);
				commonDao.updateObject(plotQuaterlyUpdate);
				//plotQuaterlyUpdateList.add(plotQuaterlyUpdate);
			}

		} catch (Exception e) {
			e.printStackTrace();
			log.error(e.getMessage(), e);
		}
		//baseObject.getProjectDetailsModel().setPlotsQuarterlyUpdate(plotQuaterlyUpdateList);
		return baseObject;
	}

	@Override
	public ProjectRegistrationModel saveOrUpdatePlotConstructionCostDetails(ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request, long quarterId) throws Exception {
		
		List<QuarterPlotsConstructionCostModel> quarterConstructionCostList= new ArrayList<QuarterPlotsConstructionCostModel>();
		String[] consCostParticularArr = request.getParameterValues("consCostParticular");
		String[] estCostArr = request.getParameterValues("estConsCost");
		String[] actCostArr = request.getParameterValues("actConsCost");
		QuarterPlotsConstructionCostModel quarterConstructionCostModel = null;
		plotQuaterlyUpdate = (PlotsQuaterlyUpdate) commonDao.getObject(PlotsQuaterlyUpdate.class, quarterId);

		try {

			String[] consCostParticularIdArr = request.getParameterValues("constructionCostDetailsId");


			if (consCostParticularArr != null && consCostParticularArr.length > 0) {
				for(int i=0;i< consCostParticularArr.length; i++) {
					if (consCostParticularArr[i] != null) {
						if (consCostParticularIdArr != null && consCostParticularIdArr.length > i && consCostParticularIdArr[i] != null && consCostParticularIdArr[i].trim().length() > 0) {
							quarterConstructionCostModel = (QuarterPlotsConstructionCostModel)commonDao.getObject(QuarterPlotsConstructionCostModel.class,Long.parseLong(consCostParticularIdArr[i]));
						} else {
							quarterConstructionCostModel = new QuarterPlotsConstructionCostModel();
						}
					}

					quarterConstructionCostModel.setConsCostParticular(consCostParticularArr[i]);
					quarterConstructionCostModel.setEstConsCost(Long.parseLong((estCostArr[i])));
					quarterConstructionCostModel.setActConsCost(Long.parseLong((actCostArr[i])));

					quarterConstructionCostList.add(quarterConstructionCostModel);

					plotQuaterlyUpdate.setQuarterPlotsConstructionCostList(quarterConstructionCostList);
				}
				//projectQuaterlyUpdateList.add(projectQuaterlyUpdate);
				commonDao.updateObject(plotQuaterlyUpdate);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
			log.error(e.getMessage(), e);
			throw e;
		}

		//projectRegistrationModel.getProjectDetailsModel().setQuarterlyUpdate(projectQuaterlyUpdateList);
		return projectRegistrationModel;
	}


	@Override
	public ProjectRegistrationModel updatePlotQuarterlyApprovalsOrNocDetails(ProjectRegistrationModel baseObject,
			HttpServletRequest request, long quarterID, MultipartFile[] photograph) {
		String[] detailsOfApprovalsOrNoc = request.getParameterValues("detailsOfApprovalsOrNoc");
		String[] approvalsAndNocDetailsIdArr = request.getParameterValues("approvalsAndNocDetailsId");
		PlotsApprovalsAndNOCDetails plotApprovalDetails =null;
		List<PlotsApprovalsAndNOCDetails> plotApprovalDetailsList = new ArrayList<PlotsApprovalsAndNOCDetails>();
		try {
			plotQuaterlyUpdate = (PlotsQuaterlyUpdate)commonDao.getObject(PlotsQuaterlyUpdate.class,quarterID);
			if(detailsOfApprovalsOrNoc != null && detailsOfApprovalsOrNoc.length > 0) {
				for(int i=0; i<detailsOfApprovalsOrNoc.length;i++) {
					if( detailsOfApprovalsOrNoc[i] != null) {
						if(approvalsAndNocDetailsIdArr != null && approvalsAndNocDetailsIdArr.length > i && approvalsAndNocDetailsIdArr[i] != null && approvalsAndNocDetailsIdArr[i].trim().length() > 0 ) {
							log.info("commonAreaDetailsIdArr len"+approvalsAndNocDetailsIdArr.length +"i >>>"+i);
							plotApprovalDetails = (PlotsApprovalsAndNOCDetails)commonDao.getObject(PlotsApprovalsAndNOCDetails.class,Long.parseLong(approvalsAndNocDetailsIdArr[i]));
						}else {
							plotApprovalDetails = new PlotsApprovalsAndNOCDetails();
						}
						plotApprovalDetails.setDetailsOfApprovalsOrNoc(request.getParameterValues("detailsOfApprovalsOrNoc")[i]);
						plotApprovalDetails.setIsApplicable(request.getParameter("isApplicable_"+i));

						if(request.getParameter("isApplicable_"+i).equals("Yes")) {
							plotApprovalDetails.setStatus(request.getParameterValues("status")[i]);

							if(request.getParameterValues("status")[i].equals("Approved")) {
								if(request.getParameterValues("uploadDocId") != null) {
									doc = documentService.getDoc(Integer.parseInt(request.getParameterValues("uploadDocId")[i].trim()));
									doc.setFileName(photograph[i].getOriginalFilename());
									doc.setMimeType(photograph[i].getContentType());
									doc.setInputStream(photograph[i].getInputStream());
									contentUtil.saveDocument(doc);
									documentService.updateDoc(doc);
								}else {
									doc = new Document();
									doc.setFileName(photograph[i].getOriginalFilename());
									doc.setDocumentType("QUARTER_UPDT");
									doc.setFolderId("" + baseObject.getProjectRegId());
									doc.setMimeType(photograph[i].getContentType());
									doc.setInputStream(photograph[i].getInputStream());
									contentUtil.saveDocument(doc);
									documentService.saveDoc(doc);
								}
								plotApprovalDetails.setUploadDoc(doc);
								SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
								if(request.getParameterValues("dateOfApplication")[i] != null && request.getParameterValues("dateOfApplication")[i] != " ") {
									Date actualFrmDate = sdf.parse(request.getParameterValues("dateOfApplication")[i]);
									Calendar dateOfApplicationCal = Calendar.getInstance();
									dateOfApplicationCal.setTime(actualFrmDate);
									plotApprovalDetails.setDateOfApplication(dateOfApplicationCal);
								}
							} 
							if(request.getParameterValues("status")[i].equals("Applied")) {
								SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
								if(request.getParameterValues("dateOfApplication")[i] != null && request.getParameterValues("dateOfApplication")[i] != " ") {
									Date actualFrmDate = sdf.parse(request.getParameterValues("dateOfApplication")[i]);
									Calendar dateOfApplicationCal = Calendar.getInstance();
									dateOfApplicationCal.setTime(actualFrmDate);
									plotApprovalDetails.setDateOfApplication(dateOfApplicationCal);
								}
							} 
						}
					}
					plotApprovalDetailsList.add(plotApprovalDetails);
					log.info("FloorQuarterDetailsList>>>"+plotApprovalDetailsList.size());
				}
				plotQuaterlyUpdate.setApprovalsAndNOCDetails(plotApprovalDetailsList);
				//plotQuaterlyUpdateList.add(plotQuaterlyUpdate);
				commonDao.updateObject(plotQuaterlyUpdate);
			}
		}catch (Exception e) {
			// TODO: handle exception
			log.error(e.getMessage(), e);
		}
		//baseObject.getProjectDetailsModel().setPlotsQuarterlyUpdate(plotQuaterlyUpdateList);
		return baseObject;
	}

	@Override
	public ProjectRegistrationModel updatePlotLitigationDetails(ProjectRegistrationModel baseObject,
			HttpServletRequest request, long quarterId, MultipartFile[] preventiveOrderDoc) throws Exception {
		String[] courtOrAuthorityName = request.getParameterValues("courtOrAuthorityName");
		String[] litigationDetailsIdArr = request.getParameterValues("litigationDetailsId");
		PlotsLitigationDetails plotLitigationDetails =null;
		List<PlotsLitigationDetails> litigationDetailsList = new ArrayList<PlotsLitigationDetails>();
		try {
			plotQuaterlyUpdate = (PlotsQuaterlyUpdate)commonDao.getObject(PlotsQuaterlyUpdate.class,quarterId);
			if(courtOrAuthorityName != null && courtOrAuthorityName.length > 0) {
				for(int i=0; i<courtOrAuthorityName.length;i++) {
					if( courtOrAuthorityName[i] != null) {
						if(litigationDetailsIdArr != null && litigationDetailsIdArr.length > i && litigationDetailsIdArr[i] != null && litigationDetailsIdArr[i].trim().length() > 0 ) {
							log.info("litigationDetailsIdArr len"+litigationDetailsIdArr.length +"i >>>"+i);
							plotLitigationDetails = (PlotsLitigationDetails)commonDao.getObject(ProjectLitigationDetails.class,Long.parseLong(litigationDetailsIdArr[i]));
						}else {
							plotLitigationDetails = new PlotsLitigationDetails();
						}
						plotLitigationDetails.setAnyLitigationOnProject(request.getParameterValues("anyLitigationOnProject")[i] );
						if(request.getParameterValues("anyLitigationOnProject")[i].equals("Yes")) {
							plotLitigationDetails.setCourtOrAuthorityName(request.getParameterValues("courtOrAuthorityName")[i]);
							plotLitigationDetails.setCaseNo(Long.parseLong(request.getParameterValues("caseNo")[i]));
							plotLitigationDetails.setCaseType(request.getParameterValues("caseType")[i] );

							plotLitigationDetails.setAnyPreventiveOrderIssued(request.getParameterValues("anyPreventiveOrderIssued")[i] );

							if(request.getParameterValues("anyPreventiveOrderIssued")[i].equals("Yes")) {
								plotLitigationDetails.setLitigationStatus(request.getParameterValues("litigationStatus")[i]);
								if(request.getParameterValues("preventiveOrderDocId") != null) {
									doc = documentService.getDoc(Integer.parseInt(request.getParameterValues("preventiveOrderDocId")[i].trim()));
									doc.setFileName(preventiveOrderDoc[i].getOriginalFilename());
									doc.setMimeType(preventiveOrderDoc[i].getContentType());
									doc.setInputStream(preventiveOrderDoc[i].getInputStream());
									contentUtil.saveDocument(doc);
									documentService.updateDoc(doc);
								}else {
									doc = new Document();
									doc.setFileName(preventiveOrderDoc[i].getOriginalFilename());
									doc.setDocumentType("QUARTER_UPDT");
									doc.setFolderId("" + baseObject.getProjectRegId());
									doc.setMimeType(preventiveOrderDoc[i].getContentType());
									doc.setInputStream(preventiveOrderDoc[i].getInputStream());
									contentUtil.saveDocument(doc);
									documentService.saveDoc(doc);
								}
								plotLitigationDetails.setPreventiveOrderDoc(doc);
							}
							SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
							if(request.getParameterValues("litigationYear")[i] != null && request.getParameterValues("litigationYear")[i] != " ") {
								Date litigationYear = sdf.parse(request.getParameterValues("litigationYear")[i]);
								Calendar litigationYearCal = Calendar.getInstance();
								litigationYearCal.setTime(litigationYear);
								litigationYearCal.set(Calendar.YEAR, litigationYearCal.get(Calendar.YEAR));
								log.info("litigationYearCal >>"+litigationYearCal);
								plotLitigationDetails.setLitigationYear(litigationYearCal);
							}
						}
					}
					litigationDetailsList.add(plotLitigationDetails);
					log.info("litigationDetailsList>>>"+litigationDetailsList.size());
				}
				plotQuaterlyUpdate.setLitigationDetails(litigationDetailsList);
				commonDao.updateObject(plotQuaterlyUpdate);
				//plotQuaterlyUpdateList.add(plotQuaterlyUpdate);
			}
		}catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		//baseObject.getProjectDetailsModel().setPlotsQuarterlyUpdate(plotQuaterlyUpdateList);
		return baseObject;
	}

	@Override
	public ProjectRegistrationModel updatePlotModificationDetails(ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request, long quarterId, MultipartFile uploadApprovalDoc, MultipartFile uploadDoc,
			MultipartFile modifiedDoc,MultipartFile detailsOfPlotReleased,MultipartFile plotNocCertificate) throws Exception {
		PlotsModificationDetails PlotModificationDetails =null;
		List<PlotsModificationDetails> PlotModificationDetailsList = new ArrayList<PlotsModificationDetails>();
		try {
			plotQuaterlyUpdate = (PlotsQuaterlyUpdate)commonDao.getObject(PlotsQuaterlyUpdate.class,quarterId);

			if(plotQuaterlyUpdate.getModificationDetails() != null && plotQuaterlyUpdate.getModificationDetails().size()>0 ) {
				PlotModificationDetails = (PlotsModificationDetails)commonDao.getObject(PlotsModificationDetails.class,Long.parseLong(request.getParameter("modificationDetailsId")));
			}else {
				PlotModificationDetails = new PlotsModificationDetails();
			}
			PlotModificationDetails.setIsModificationRequiredToApprove(request.getParameter("isModificationRequiredToApprove"));
			if(request.getParameter("isModificationRequiredToApprove").equals("Yes")) {

				PlotModificationDetails.setIssuedByAuthority(request.getParameter("issuedByAuthority"));
				if(request.getParameter("uploadApprovalDocId") != null && request.getParameter("uploadApprovalDoc") != null) {
					doc = documentService.getDoc(Integer.parseInt(request.getParameter("uploadApprovalDocId").trim()));
					doc.setFileName(uploadApprovalDoc.getOriginalFilename());
					doc.setMimeType(uploadApprovalDoc.getContentType());
					doc.setInputStream(uploadApprovalDoc.getInputStream());
					contentUtil.saveDocument(doc);
					documentService.updateDoc(doc);
				}else {
					doc = new Document();
					doc.setFileName(uploadApprovalDoc.getOriginalFilename());
					doc.setDocumentType("QUARTER_UPDT");
					doc.setFolderId("" + projectRegistrationModel.getProjectRegId());
					doc.setMimeType(uploadApprovalDoc.getContentType());
					doc.setInputStream(uploadApprovalDoc.getInputStream());
					contentUtil.saveDocument(doc);
					documentService.saveDoc(doc);
				}
				PlotModificationDetails.setUploadApprovalDoc(doc);

				PlotModificationDetails.setWrittenConsentOfAllotee(request.getParameter("writtenConsentOfAllotee"));

				if(request.getParameter("writtenConsentOfAllotee").equals("Yes")) {
					PlotModificationDetails.setModificationPlanNo(request.getParameter("modificationPlanNo"));
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					Date date = sdf.parse(request.getParameter("dateOfApproval"));
					Calendar approvedDate = Calendar.getInstance();
					approvedDate.setTime(date);
					PlotModificationDetails.setDateOfApproval(approvedDate);

					if(request.getParameter("uploadDocId") != null && request.getParameter("uploadDoc") != null) {
						doc = documentService.getDoc(Integer.parseInt(request.getParameter("uploadDocId").trim()));
						doc.setFileName(uploadDoc.getOriginalFilename());
						doc.setMimeType(uploadDoc.getContentType());
						doc.setInputStream(uploadDoc.getInputStream());
						contentUtil.saveDocument(doc);
						documentService.updateDoc(doc);
					}else {
						doc = new Document();
						doc.setFileName(uploadDoc.getOriginalFilename());
						doc.setDocumentType("QUARTER_UPDT");
						doc.setFolderId("" + projectRegistrationModel.getProjectRegId());
						doc.setMimeType(uploadDoc.getContentType());
						doc.setInputStream(uploadDoc.getInputStream());
						contentUtil.saveDocument(doc);
						documentService.saveDoc(doc);
					}
					PlotModificationDetails.setUploadDoc(doc);


					if(request.getParameter("modifiedDocId") != null && request.getParameter("modifiedDoc") != null) {
						doc = documentService.getDoc(Integer.parseInt(request.getParameter("modifiedDocId").trim()));
						doc.setFileName(modifiedDoc.getOriginalFilename());
						doc.setMimeType(modifiedDoc.getContentType());
						doc.setInputStream(modifiedDoc.getInputStream());
						contentUtil.saveDocument(doc);
						documentService.updateDoc(doc);
					}else {
						doc = new Document();
						doc.setFileName(modifiedDoc.getOriginalFilename());
						doc.setDocumentType("QUARTER_UPDT");
						doc.setFolderId("" + projectRegistrationModel.getProjectRegId());
						doc.setMimeType(modifiedDoc.getContentType());
						doc.setInputStream(modifiedDoc.getInputStream());
						contentUtil.saveDocument(doc);
						documentService.saveDoc(doc);
					}
					PlotModificationDetails.setModifiedDoc(doc);

					if(request.getParameter("detailsOfPlotReleasedId") != null && request.getParameter("detailsOfPlotReleased") != null) {
						doc = documentService.getDoc(Integer.parseInt(request.getParameter("detailsOfPlotReleasedId").trim()));
						doc.setFileName(detailsOfPlotReleased.getOriginalFilename());
						doc.setMimeType(detailsOfPlotReleased.getContentType());
						doc.setInputStream(detailsOfPlotReleased.getInputStream());
						contentUtil.saveDocument(doc);
						documentService.updateDoc(doc);
					}else {
						doc = new Document();
						doc.setFileName(detailsOfPlotReleased.getOriginalFilename());
						doc.setDocumentType("QUARTER_UPDT");
						doc.setFolderId("" + projectRegistrationModel.getProjectRegId());
						doc.setMimeType(detailsOfPlotReleased.getContentType());
						doc.setInputStream(detailsOfPlotReleased.getInputStream());
						contentUtil.saveDocument(doc);
						documentService.saveDoc(doc);
					}
					PlotModificationDetails.setDetailsOfPlotReleased(doc);

					if(request.getParameter("plotNocCertificateId") != null && request.getParameter("plotNocCertificate") != null) {
						doc = documentService.getDoc(Integer.parseInt(request.getParameter("plotNocCertificateId").trim()));
						doc.setFileName(plotNocCertificate.getOriginalFilename());
						doc.setMimeType(plotNocCertificate.getContentType());
						doc.setInputStream(plotNocCertificate.getInputStream());
						contentUtil.saveDocument(doc);
						documentService.updateDoc(doc);
					}else {
						doc = new Document();
						doc.setFileName(plotNocCertificate.getOriginalFilename());
						doc.setDocumentType("QUARTER_UPDT");
						doc.setFolderId("" + projectRegistrationModel.getProjectRegId());
						doc.setMimeType(plotNocCertificate.getContentType());
						doc.setInputStream(plotNocCertificate.getInputStream());
						contentUtil.saveDocument(doc);
						documentService.saveDoc(doc);
					}
					PlotModificationDetails.setPlotNocCertificate(doc);
				}
			}
			PlotModificationDetailsList.add(PlotModificationDetails);
			plotQuaterlyUpdate.setModificationDetails(PlotModificationDetailsList);
			//plotQuaterlyUpdateList.add(plotQuaterlyUpdate);
			commonDao.updateObject(plotQuaterlyUpdate);

		} catch (Exception e) {
			e.printStackTrace();
			log.error(e.getMessage(), e);
		}
		//projectRegistrationModel.getProjectDetailsModel().setPlotsQuarterlyUpdate(plotQuaterlyUpdateList);;
		return projectRegistrationModel;
	}

	@Override
	public ProjectRegistrationModel updatePlotAssociationDetails(ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request, long quarterId, MultipartFile registeredDoc) throws Exception {
		PlotsAssociationRegistrationDetails associationDetails =null;
		//	List<ProjectAssociationRegistrationDetails> associationDetailsList =null;
		try {
			plotQuaterlyUpdate = (PlotsQuaterlyUpdate)commonDao.getObject(PlotsQuaterlyUpdate.class,quarterId);

			if(plotQuaterlyUpdate.getAssociationDetails() != null  ) {
				associationDetails = plotQuaterlyUpdate.getAssociationDetails();
			}else {
				associationDetails = new PlotsAssociationRegistrationDetails();
			}
			associationDetails.setIsAssocitionFormed(request.getParameter("isAssocitionFormed"));

			if(request.getParameter("isAssocitionFormed").equals("Yes")) {
				associationDetails.setAssociationName(request.getParameter("associationName"));

				if(request.getParameter("registeredDocId") != null && request.getParameter("registeredDoc") != null) {
					doc = documentService.getDoc(Integer.parseInt(request.getParameter("registeredDocId").trim()));
					doc.setFileName(registeredDoc.getOriginalFilename());
					doc.setMimeType(registeredDoc.getContentType());
					doc.setInputStream(registeredDoc.getInputStream());
					contentUtil.saveDocument(doc);
					documentService.updateDoc(doc);
				}else {
					doc = new Document();
					doc.setFileName(registeredDoc.getOriginalFilename());
					doc.setDocumentType("QUARTER_UPDT");
					doc.setFolderId("" + projectRegistrationModel.getProjectRegId());
					doc.setMimeType(registeredDoc.getContentType());
					doc.setInputStream(registeredDoc.getInputStream());
					contentUtil.saveDocument(doc);
					documentService.saveDoc(doc);
				}
				associationDetails.setRegisteredDoc(doc);
			}
			//associationDetailsList.add(associationDetails);
			plotQuaterlyUpdate.setAssociationDetails(associationDetails);
			//plotQuaterlyUpdateList.add(plotQuaterlyUpdate);
			commonDao.updateObject(plotQuaterlyUpdate);

		} catch (Exception e) {
			e.printStackTrace();
			log.error(e.getMessage(), e);
		}
		//projectRegistrationModel.getProjectDetailsModel().setPlotsQuarterlyUpdate(plotQuaterlyUpdateList);
		return projectRegistrationModel;
	}

	@Override
	public ProjectRegistrationModel updatePlotConstructionWelfareDetails(ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request, long quarterId, MultipartFile welfareFundregisteredDoc) throws Exception {
		PlotsWelfareFundDetails welfareFundDetails =null;
		//	List<ProjectAssociationRegistrationDetails> associationDetailsList =null;
		try {
			plotQuaterlyUpdate = (PlotsQuaterlyUpdate)commonDao.getObject(PlotsQuaterlyUpdate.class,quarterId);

			if(plotQuaterlyUpdate.getWelfareFundDetails() != null  ) {
				welfareFundDetails = plotQuaterlyUpdate.getWelfareFundDetails();
			}else {
				welfareFundDetails = new PlotsWelfareFundDetails();
			}
			welfareFundDetails.setIsWelfareFundApplicable(request.getParameter("isWelfareFundApplicable"));

			if(request.getParameter("isWelfareFundApplicable").equals("Yes")) {
				welfareFundDetails.setPlotWelfareFundRegNo(request.getParameter("plotWelfareFundRegNo"));

				if(request.getParameter("welfareFundregisteredDocId") != null && request.getParameter("welfareFundregisteredDoc") != null) {
					doc = documentService.getDoc(Integer.parseInt(request.getParameter("welfareFundregisteredDocId").trim()));
					doc.setFileName(welfareFundregisteredDoc.getOriginalFilename());
					doc.setMimeType(welfareFundregisteredDoc.getContentType());
					doc.setInputStream(welfareFundregisteredDoc.getInputStream());
					contentUtil.saveDocument(doc);
					documentService.updateDoc(doc);
				}else {
					doc = new Document();
					doc.setFileName(welfareFundregisteredDoc.getOriginalFilename());
					doc.setDocumentType("QUARTER_UPDT");
					doc.setFolderId("" + projectRegistrationModel.getProjectRegId());
					doc.setMimeType(welfareFundregisteredDoc.getContentType());
					doc.setInputStream(welfareFundregisteredDoc.getInputStream());
					contentUtil.saveDocument(doc);
					documentService.saveDoc(doc);
				}
				welfareFundDetails.setWelfareFundregisteredDoc(doc);
			}
			//associationDetailsList.add(associationDetails);
			plotQuaterlyUpdate.setWelfareFundDetails(welfareFundDetails);
			//plotQuaterlyUpdateList.add(plotQuaterlyUpdate);
			commonDao.updateObject(plotQuaterlyUpdate);

		} catch (Exception e) {
			e.printStackTrace();
			log.error(e.getMessage(), e);
		}
		//projectRegistrationModel.getProjectDetailsModel().setPlotsQuarterlyUpdate(plotQuaterlyUpdateList);
		return projectRegistrationModel;
	}

	@Override
	public ProjectRegistrationModel updatePlotBankDetails(ProjectRegistrationModel baseObject,
			HttpServletRequest request, MultipartFile certFromChartedAcc,
			MultipartFile certificateIssuedByStructuralEng, MultipartFile certificateIssuedByArchitect,
			MultipartFile financialReport,MultipartFile annualfinancialReport, long quarterId) throws Exception {

		PlotsBankDetails plotBankDetails = null;

		plotQuaterlyUpdate = (PlotsQuaterlyUpdate)commonDao.getObject(PlotsQuaterlyUpdate.class,quarterId);

		try {
			if(plotQuaterlyUpdate.getBankDetails() != null) {
				plotBankDetails = plotQuaterlyUpdate.getBankDetails();
			}
			else {
				plotBankDetails = new PlotsBankDetails();
			}
			plotBankDetails.setAmtWithdrawnFromBank(Long.parseLong(request.getParameter("amtWithdrawnFromBank")));
			plotBankDetails.setPercentageOfProjectCompletion(Long.parseLong(request.getParameter("percentageOfProjectCompletion")));
			plotBankDetails.setTotAdvanceAmt(Long.parseLong(request.getParameter("totAdvanceAmt")));

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
				doc.setFolderId("" + baseObject.getProjectRegId());
				doc.setMimeType(certFromChartedAcc.getContentType());
				doc.setInputStream(certFromChartedAcc.getInputStream());
				contentUtil.saveDocument(doc);
				documentService.saveDoc(doc);
			}
			plotBankDetails.setCertFromChartedAcc(doc);

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
				doc.setFolderId("" + baseObject.getProjectRegId());
				doc.setMimeType(certificateIssuedByArchitect.getContentType());
				doc.setInputStream(certificateIssuedByArchitect.getInputStream());
				contentUtil.saveDocument(doc);
				documentService.saveDoc(doc);
			}
			plotBankDetails.setCertificateIssuedByArchitect(doc); 

			// certificateIssuedByStructuralEng doc saving
			if(request.getParameter("certIssuedStructuralEngDocId") != null && request.getParameter("certIssuedStructuralEngDocId").trim().length() > 0 ) {
				doc = documentService.getDoc(Integer.parseInt(request.getParameter("certIssuedStructuralEngDocId")));
				doc.setFileName(certificateIssuedByStructuralEng.getOriginalFilename());
				doc.setMimeType(certificateIssuedByStructuralEng.getContentType());
				doc.setInputStream(certificateIssuedByStructuralEng.getInputStream());
				contentUtil.saveDocument(doc);
				documentService.updateDoc(doc);
			}else {
				doc = new Document();
				doc.setFileName(certificateIssuedByStructuralEng.getOriginalFilename());
				doc.setDocumentType("QUATER_UPDT");
				doc.setFolderId("" + baseObject.getProjectRegId());
				doc.setMimeType(certificateIssuedByStructuralEng.getContentType());
				doc.setInputStream(certificateIssuedByStructuralEng.getInputStream());
				contentUtil.saveDocument(doc);
				documentService.saveDoc(doc);
			}
			plotBankDetails.setCertificateIssuedByStructuralEng(doc);

			if(Long.parseLong(request.getParameter("percentageOfProjectCompletion"))==100) {
				if(request.getParameter("annualfinancialReportId") != null && request.getParameter("annualfinancialReportId").trim().length() > 0 ) {
					doc = documentService.getDoc(Integer.parseInt(request.getParameter("annualfinancialReportId")));
					doc.setFileName(annualfinancialReport.getOriginalFilename());
					doc.setMimeType(annualfinancialReport.getContentType());
					doc.setInputStream(annualfinancialReport.getInputStream());
					contentUtil.saveDocument(doc);
					documentService.updateDoc(doc);
				}else {
					doc = new Document();
					doc.setFileName(annualfinancialReport.getOriginalFilename());
					doc.setDocumentType("QUATER_UPDT");
					doc.setFolderId("" + baseObject.getProjectRegId());
					doc.setMimeType(annualfinancialReport.getContentType());
					doc.setInputStream(annualfinancialReport.getInputStream());
					contentUtil.saveDocument(doc);
					documentService.saveDoc(doc);
				}
				plotBankDetails.setAnnualfinancialReport(doc);
			}else {
				// financialReport doc saving
				if(request.getParameter("financialReportId") != null && request.getParameter("financialReportId").trim().length() > 0 ) {
					doc = documentService.getDoc(Integer.parseInt(request.getParameter("financialReportId")));
					doc.setFileName(financialReport.getOriginalFilename());
					doc.setMimeType(financialReport.getContentType());
					doc.setInputStream(financialReport.getInputStream());
					contentUtil.saveDocument(doc);
					documentService.updateDoc(doc);
				}else {
					doc = new Document();
					doc.setFileName(financialReport.getOriginalFilename());
					doc.setDocumentType("QUATER_UPDT");
					doc.setFolderId("" + baseObject.getProjectRegId());
					doc.setMimeType(financialReport.getContentType());
					doc.setInputStream(financialReport.getInputStream());
					contentUtil.saveDocument(doc);
					documentService.saveDoc(doc);
				}
				plotBankDetails.setFinancialReport(doc);
			}

			commonDao.updateObject(plotBankDetails);
			plotQuaterlyUpdate.setBankDetails(plotBankDetails);
			commonDao.updateObject(plotQuaterlyUpdate);
			//projectQuaterlyUpdateList.add(projectQuaterlyUpdate);
			//projectRegistrationModel.getProjectDetailsModel().setQuarterlyUpdate(projectQuaterlyUpdateList);;
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e.getMessage(), e);
			throw e;
		}
		return baseObject;
	}
	
}
