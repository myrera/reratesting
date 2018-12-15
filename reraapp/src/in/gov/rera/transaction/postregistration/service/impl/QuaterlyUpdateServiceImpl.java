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
import in.gov.rera.transaction.postregistration.dao.IProjectWorkDAO;
import in.gov.rera.transaction.postregistration.model.ApartmentQuarterDetailsModel;
import in.gov.rera.transaction.postregistration.model.QuarterConstructionCostModel;
import in.gov.rera.transaction.postregistration.model.ProjectApprovalsAndNOCDetails;
import in.gov.rera.transaction.postregistration.model.ProjectAssociationRegistrationDetails;
import in.gov.rera.transaction.postregistration.model.ProjectBankDetails;
import in.gov.rera.transaction.postregistration.model.ProjectBuildingDetails;
import in.gov.rera.transaction.postregistration.model.FloorQuarterDetails;
import in.gov.rera.transaction.postregistration.model.ProjectLitigationDetails;
import in.gov.rera.transaction.postregistration.model.ProjectModificationDetails;
import in.gov.rera.transaction.postregistration.model.ProjectParkingDetails;
import in.gov.rera.transaction.postregistration.model.ProjectQuaterlyUpdate;
import in.gov.rera.transaction.postregistration.model.ProjectWelfareFundDetails;
import in.gov.rera.transaction.postregistration.model.ProjectWorkModel;
import in.gov.rera.transaction.postregistration.model.QuarteMasnoryModel;
import in.gov.rera.transaction.postregistration.model.QuarterAmenityDetails;
import in.gov.rera.transaction.postregistration.model.QuarterCommonAreaDetails;
import in.gov.rera.transaction.postregistration.model.QuarterExternalInfrastructureWorksModel;
import in.gov.rera.transaction.postregistration.model.QuarterFinishingInteriorModel;
import in.gov.rera.transaction.postregistration.model.QuarterInternalInfrastructureDetails;
import in.gov.rera.transaction.postregistration.model.QuarterSubStructureModel;
import in.gov.rera.transaction.postregistration.model.QuarterSuperStructureModel;
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
import in.gov.rera.transaction.postregistration.service.IQuaterlyUpdateService;
import in.gov.rera.transaction.projectregistration.dao.IProjectRegistrationDAO;
import in.gov.rera.transaction.projectregistration.model.ProjectRegistrationModel;

@Service(value = "quaterlyUpdateService")
@Scope("request")
public class QuaterlyUpdateServiceImpl implements IQuaterlyUpdateService{

	static Logger log= Logger.getLogger(QuaterlyUpdateServiceImpl.class);
	@Autowired
	IProjectRegistrationDAO<ProjectRegistrationModel, Long> postRegDAO;

	@Autowired
	IProjectWorkDAO<ProjectWorkModel, Long> projectWorkDAO;

	@Autowired
	ContentUtil contentUtil;

	@Autowired(required = true)
	IDocumentService<Document, Integer> documentService;

	@Autowired
	CommonDao<Object, Long> commonDao;

	List<ProjectQuaterlyUpdate> projectQuaterlyUpdateList = new ArrayList<ProjectQuaterlyUpdate>();

	ProjectQuaterlyUpdate projectQuaterlyUpdate = null;

	Document doc = null;

	@Override
	public ProjectRegistrationModel updateProjectBankDetails(ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request,MultipartFile certFromChartedAcc, MultipartFile certificateIssuedByStructuralEng,
			MultipartFile certificateIssuedByArchitect,MultipartFile financialReport,MultipartFile annualfinancialReport,Long quarterId) throws Exception {

		ProjectBankDetails projectBankDetails = null;

		projectQuaterlyUpdate = (ProjectQuaterlyUpdate)commonDao.getObject(ProjectQuaterlyUpdate.class,quarterId);

		try {
			if(projectQuaterlyUpdate.getBankDetails() != null) {
				projectBankDetails = projectQuaterlyUpdate.getBankDetails();
			}
			else {
				projectBankDetails = new ProjectBankDetails();
			}
			projectBankDetails.setAmtWithdrawnFromBank(Long.parseLong(request.getParameter("amtWithdrawnFromBank")));
			projectBankDetails.setPercentageOfProjectCompletion(Long.parseLong(request.getParameter("percentageOfProjectCompletion")));
			projectBankDetails.setTotAdvanceAmt(Long.parseLong(request.getParameter("totAdvanceAmt")));

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
			projectBankDetails.setCertFromChartedAcc(doc);


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
					doc.setFolderId("" + projectRegistrationModel.getProjectRegId());
					doc.setMimeType(annualfinancialReport.getContentType());
					doc.setInputStream(annualfinancialReport.getInputStream());
					contentUtil.saveDocument(doc);
					documentService.saveDoc(doc);
				}
				projectBankDetails.setAnnualfinancialReport(doc);
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
					doc.setFolderId("" + projectRegistrationModel.getProjectRegId());
					doc.setMimeType(financialReport.getContentType());
					doc.setInputStream(financialReport.getInputStream());
					contentUtil.saveDocument(doc);
					documentService.saveDoc(doc);
				}
				projectBankDetails.setFinancialReport(doc);
			}

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
			projectBankDetails.setCertificateIssuedByArchitect(doc); 

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
			projectBankDetails.setCertificateIssuedByStructuralEng(doc);
			commonDao.updateObject(projectBankDetails);
			projectQuaterlyUpdate.setBankDetails(projectBankDetails);
			commonDao.updateObject(projectQuaterlyUpdate);
			//projectQuaterlyUpdateList.add(projectQuaterlyUpdate);
			//projectRegistrationModel.getProjectDetailsModel().setQuarterlyUpdate(projectQuaterlyUpdateList);;
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e.getMessage(), e);
			throw e;
		}
		return projectRegistrationModel;
	}


	//



	/*@Override
	public ProjectRegistrationModel updateApartmentDetails(ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request,Long quarterId) throws Exception {
		List<ProjectApartmentDetails> projectApartmenList = new ArrayList<ProjectApartmentDetails>();
		ProjectApartmentDetails projectApartmentDetails = null;
		ProjectQuaterlyUpdate projectQuaterlyUpdate = null;
		List<ProjectQuaterlyUpdate> projectQuaterlyUpdateList = new ArrayList<ProjectQuaterlyUpdate>();
		try {
			projectQuaterlyUpdate = (ProjectQuaterlyUpdate)commonDao.getObject(ProjectQuaterlyUpdate.class,quarterId);
				if( projectQuaterlyUpdate.getApartmentDetails() != null && projectQuaterlyUpdate.getApartmentDetails().size()>0) {
					projectApartmentDetails = apartmentDAO.getApartmentById((Long.parseLong(request.getParameter("apartmentDetailsId"))));
				}
				else {
					projectApartmentDetails = new ProjectApartmentDetails();
				}
				projectApartmentDetails.setApartmentType(request.getParameter("apartmentType"));
				//projectApartmentDetails.setNoOfApartmentsBooked(Long.parseLong(request.getParameter("noOfApartmentsBooked")));
				//projectApartmentDetails.setNoOfApartmentsRemained(Long.parseLong(request.getParameter("noOfApartmentsRemained")));
				//projectApartmentDetails.setTotApartments(Long.parseLong(request.getParameter("totApartments")));
				commonDao.updateObject(projectApartmentDetails);
				projectApartmenList.add(projectApartmentDetails);
				projectQuaterlyUpdate.setApartmentDetails(projectApartmenList);
				projectQuaterlyUpdate.setActualUpdateDate(Calendar.getInstance());
				commonDao.updateObject(projectQuaterlyUpdate);
				//projectQuaterlyUpdateList.add(projectQuaterlyUpdate);

		} catch (Exception e) {
			e.printStackTrace();
			log.error(e.getMessage(), e);
			throw e;
		}
	//	projectRegistrationModel.getProjectDetailsModel().setQuarterlyUpdate(projectQuaterlyUpdateList);
		return projectRegistrationModel;
	}
	 */

	@Override
	public ProjectRegistrationModel updateParkingDetails(ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request,Long quarterId) throws Exception {
		ProjectParkingDetails projectParkingDetails = null;
		try {
			projectQuaterlyUpdate = (ProjectQuaterlyUpdate)commonDao.getObject(ProjectQuaterlyUpdate.class,quarterId);

			if( projectQuaterlyUpdate.getParkingDetails() != null ) {
				projectParkingDetails = projectQuaterlyUpdate.getParkingDetails();
			}
			else {
				projectParkingDetails = new ProjectParkingDetails();
			}
			projectParkingDetails.setTotNoOfGarages(Long.parseLong(request.getParameter("totNoOfGarages")) );
			projectParkingDetails.setNoOfGaragesBooked(Long.parseLong(request.getParameter("noOfGaragesBooked")) );
			projectParkingDetails.setNoOfGaragesRemained(Long.parseLong(request.getParameter("noOfGaragesRemained") ));

			projectParkingDetails.setTotNoOfOpenParking(Long.parseLong(request.getParameter("totNoOfOpenParking"))  );
			projectParkingDetails.setNoOfOpenParkingBooked(Long.parseLong(request.getParameter("noOfOpenParkingBooked")) );
			projectParkingDetails.setNoOfOpenParkingRemained(Long.parseLong(request.getParameter("noOfOpenParkingRemained"))  );


			projectParkingDetails.setTotNoOfClosedParking(Long.parseLong(request.getParameter("totNoOfClosedParking") ));
			projectParkingDetails.setNoOfClosedParkingBooked(Long.parseLong(request.getParameter("noOfClosedParkingBooked")) );
			projectParkingDetails.setNoOfClosedParkingRemained(Long.parseLong(request.getParameter("noOfClosedParkingRemained")) );
			commonDao.updateObject(projectParkingDetails);
			projectQuaterlyUpdate.setParkingDetails(projectParkingDetails);
			commonDao.updateObject(projectQuaterlyUpdate);
			//projectQuaterlyUpdateList.add(projectQuaterlyUpdate);
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e.getMessage(), e);
			throw e;
		}
		//	projectRegistrationModel.getProjectDetailsModel().setQuarterlyUpdate(projectQuaterlyUpdateList);;
		return projectRegistrationModel;
	}

	@Override
	public ProjectRegistrationModel updateBuildingDetails(ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request,Long quarterId, MultipartFile[]  photograph) throws Exception {
		List<ProjectBuildingDetails> projectBuildingDetailsList = new ArrayList<ProjectBuildingDetails>();
		List<ApartmentQuarterDetailsModel> apartmentQuarterDetailsList = new ArrayList<ApartmentQuarterDetailsModel>();
		List<FloorQuarterDetails> FloorQuarterDetailsList = new ArrayList<FloorQuarterDetails>();


		projectQuaterlyUpdateList=projectRegistrationModel.getProjectDetailsModel().getQuarterlyUpdate();
		ProjectBuildingDetails projectBuildingDetails =null;
		ApartmentQuarterDetailsModel apartmentQuarterDetailsModel =null;
		FloorQuarterDetails FloorQuarterDetails =null;

		try {
			projectQuaterlyUpdate = (ProjectQuaterlyUpdate)commonDao.getObject(ProjectQuaterlyUpdate.class,quarterId);
			String[] blockNameArray = request.getParameterValues("blockName");
			String[] apartmentTypeArray = request.getParameterValues("apartmentType");
			String[] floorNoArray = request.getParameterValues("floorNo");

			if( projectQuaterlyUpdate.getBuildingDetails() != null && projectQuaterlyUpdate.getBuildingDetails().size() > 0) {
				//	projectBuildingDetails = (ProjectBuildingDetails)commonDao.getObject(ProjectBuildingDetails.class,Long.parseLong(request.getParameter("buildingDetailsId")));
				projectBuildingDetailsList = projectQuaterlyUpdate.getBuildingDetails() ;
			}


			if(blockNameArray != null) {
				for(int i=0; i<=blockNameArray.length-1; i++) {
					projectBuildingDetails = new ProjectBuildingDetails();
					projectBuildingDetails.setBlockName(request.getParameterValues("blockName")[i]);
					projectBuildingDetails.setPercentageOfCompletion(Long.parseLong(request.getParameterValues("percentageOfCompletion")[i]));
					if(request.getParameterValues("photographDocId") != null && request.getParameterValues("photographDocId")[i] != null) {
						doc = documentService.getDoc(Integer.parseInt(request.getParameterValues("photographDocId")[i].trim()));
						doc.setFileName(photograph[i].getOriginalFilename());
						doc.setMimeType(photograph[i].getContentType());
						doc.setInputStream(photograph[i].getInputStream());
						contentUtil.saveDocument(doc);
						documentService.updateDoc(doc);
					}else {
						doc = new Document();
						doc.setFileName(photograph[i].getOriginalFilename());
						doc.setDocumentType("QUARTER_UPDT");
						doc.setFolderId("" + projectRegistrationModel.getProjectRegId());
						doc.setMimeType(photograph[i].getContentType());
						doc.setInputStream(photograph[i].getInputStream());
						contentUtil.saveDocument(doc);
						documentService.saveDoc(doc);
					}
					projectBuildingDetails.setPhotograph(doc);
					commonDao.updateObject(projectBuildingDetails);
					projectBuildingDetailsList.add(projectBuildingDetails);
					projectQuaterlyUpdate.setBuildingDetails(projectBuildingDetailsList);
					commonDao.updateObject(projectQuaterlyUpdate);
					//projectQuaterlyUpdateList.add(projectQuaterlyUpdate);
				}

				//	System.out.println("list size "+projectQuaterlyUpdateList.size());
			}
			//Apartment
			if(apartmentTypeArray != null) {
				for(int i=0; i<apartmentTypeArray.length; i++) {
					apartmentQuarterDetailsModel = new ApartmentQuarterDetailsModel();
					apartmentQuarterDetailsModel.setApartmentType( request.getParameterValues("apartmentType")[i] );
					apartmentQuarterDetailsModel.setNoOfApartmentsBooked(Long.parseLong(request.getParameterValues("noOfApartmentsBooked")[i]) );
					apartmentQuarterDetailsModel.setNoOfApartmentsRemained(Long.parseLong(request.getParameterValues("noOfApartmentsRemained")[i]) );
					apartmentQuarterDetailsModel.setTotNoOfApartment(Long.parseLong(request.getParameterValues("totNoOfApartment")[i]) );

					commonDao.updateObject(apartmentQuarterDetailsModel);
					apartmentQuarterDetailsList.add(apartmentQuarterDetailsModel);

					projectQuaterlyUpdate.getBuildingDetails().get(projectQuaterlyUpdate.getBuildingDetails().size()-1).setApartmentDetails(apartmentQuarterDetailsList);
					commonDao.updateObject(projectQuaterlyUpdate);
				}
			}
			//Flooar
			if(floorNoArray != null) {
				for(int i=0; i<floorNoArray.length; i++) {
					FloorQuarterDetails = new FloorQuarterDetails();
					FloorQuarterDetails.setFloorNo(Long.parseLong(request.getParameterValues("floorNo")[i]));
					FloorQuarterDetails.setPercentageOfCompletionFloor(Long.parseLong(request.getParameterValues("percentageOfCompletionFloor")[i]));
					commonDao.updateObject(FloorQuarterDetails);
					FloorQuarterDetailsList.add(FloorQuarterDetails);
					projectQuaterlyUpdate.getBuildingDetails().get(projectQuaterlyUpdate.getBuildingDetails().size()-1).setFloorDetails(FloorQuarterDetailsList);
					commonDao.updateObject(projectQuaterlyUpdate);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			log.error(e.getMessage(), e);
			throw e;
		}
		//projectRegistrationModel.getProjectDetailsModel().setQuarterlyUpdate(projectQuaterlyUpdateList);
		return projectRegistrationModel;
	}

	/*
	@Override
	public ProjectRegistrationModel updateFloorDetails(ProjectRegistrationModel projectRegistrationModel, HttpServletRequest request,
			Long quarterId) {

		List<FloorQuarterDetails> FloorQuarterDetailsList = new ArrayList<FloorQuarterDetails>();
		FloorQuarterDetails FloorQuarterDetails =null;
		try {
			projectQuaterlyUpdate = (ProjectQuaterlyUpdate)commonDao.getObject(ProjectQuaterlyUpdate.class,quarterId);
			//for add more take in the array of request

			String[] percentageArray = request.getParameterValues("percentageOfCompletion");
			String[] projFloorIdArr = request.getParameterValues("projFloorId");   
			if(percentageArray != null && percentageArray.length > 0) {
				for(int i=0; i<percentageArray.length;i++) {
					if( percentageArray[i] != null) {
						if(projFloorIdArr != null && projFloorIdArr.length > i && projFloorIdArr[i] != null && projFloorIdArr[i].trim().length() > 0 ) {
							log.info("projFloorIdArr len"+projFloorIdArr.length +"i >>>"+i);
							FloorQuarterDetails = (FloorQuarterDetails)commonDao.getObject(FloorQuarterDetails.class,Long.parseLong(projFloorIdArr[i]));
						}else {
							FloorQuarterDetails = new FloorQuarterDetails();
						}
						FloorQuarterDetails.setFloorNo(Long.parseLong(request.getParameterValues("floorNo")[i]));
						FloorQuarterDetails.setPercentageOfCompletion(Long.parseLong(request.getParameterValues("percentageOfCompletion")[i]));
				}
					FloorQuarterDetailsList.add(FloorQuarterDetails);
					log.info("FloorQuarterDetailsList>>>"+FloorQuarterDetailsList.size());

			}
				projectQuaterlyUpdate.setFloorDetails(FloorQuarterDetailsList);
				projectQuaterlyUpdateList.add(projectQuaterlyUpdate);
			}

		} catch (Exception e) {
			e.printStackTrace();
			log.error(e.getMessage(), e);
		}
		projectRegistrationModel.getProjectDetailsModel().setQuarterlyUpdate(projectQuaterlyUpdateList);
		return projectRegistrationModel;

	}*/


	@Override
	public ProjectRegistrationModel updateInfrastructureDetails(ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request, long quarterId) {

		List<QuarterInternalInfrastructureDetails> infraStructureList = new ArrayList<QuarterInternalInfrastructureDetails>();
		QuarterInternalInfrastructureDetails quarterInternalInfrastructureDetails =null;
		try {
			projectQuaterlyUpdate = (ProjectQuaterlyUpdate)commonDao.getObject(ProjectQuaterlyUpdate.class,quarterId);
			//for add more take in the array of request

			String[] percentageArray = request.getParameterValues("percentageOfCompletion");
			String[] infrastructureIdArr = request.getParameterValues("infrastructureId");   
			if(percentageArray != null && percentageArray.length > 0) {
				for(int i=0; i<percentageArray.length;i++) {
					if( percentageArray[i] != null) {
						if(infrastructureIdArr != null && infrastructureIdArr.length > i && infrastructureIdArr[i] != null && infrastructureIdArr[i].trim().length() > 0 ) {
							quarterInternalInfrastructureDetails = (QuarterInternalInfrastructureDetails)commonDao.getObject(QuarterInternalInfrastructureDetails.class,Long.parseLong(infrastructureIdArr[i]));
						}else {
							quarterInternalInfrastructureDetails = new QuarterInternalInfrastructureDetails();
						}
						quarterInternalInfrastructureDetails.setInfrastructureName(request.getParameterValues("infrastructureName")[i]);
						quarterInternalInfrastructureDetails.setPercentageOfCompletion(Long.parseLong(request.getParameterValues("percentageOfCompletion")[i]));
						/*	if(photographDocIdArr != null && photographDocIdArr[i] != null) {
							doc = documentService.getDoc(Integer.parseInt(request.getParameterValues("photographDocId")[i].trim()));
							doc.setFileName(photograph[i].getOriginalFilename());
							doc.setMimeType(photograph[i].getContentType());
							doc.setInputStream(photograph[i].getInputStream());
							contentUtil.saveDocument(doc);
							documentService.updateDoc(doc);
						}else {
							doc = new Document();
							doc.setFileName(photograph[i].getOriginalFilename());
							doc.setDocumentType("QUARTER_UPDT");
							doc.setFolderId("" + projectRegistrationModel.getProjectRegId());
							doc.setMimeType(photograph[i].getContentType());
							doc.setInputStream(photograph[i].getInputStream());
							contentUtil.saveDocument(doc);
							documentService.saveDoc(doc);
						}*/
						//projectInternalInfrastructureDetails.setPhotograph(doc);
					}
					commonDao.updateObject(quarterInternalInfrastructureDetails);
					infraStructureList.add(quarterInternalInfrastructureDetails);
				}
				projectQuaterlyUpdate.setInfrastructureDetails(infraStructureList);
				commonDao.updateObject(projectQuaterlyUpdate);
				//projectQuaterlyUpdateList.add(projectQuaterlyUpdate);
				commonDao.updateObject(projectQuaterlyUpdate);
			}

		} catch (Exception e) {
			e.printStackTrace();
			log.error(e.getMessage(), e);
		}
		//projectRegistrationModel.getProjectDetailsModel().setQuarterlyUpdate(projectQuaterlyUpdateList);
		return projectRegistrationModel;
	}


	@Override
	public ProjectRegistrationModel updateApprovalsOrNocDetails(ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request, long quarterID, MultipartFile[] photograph) throws Exception {
		String[] detailsOfApprovalsOrNoc = request.getParameterValues("detailsOfApprovalsOrNoc");
		String[] approvalsAndNocDetailsIdArr = request.getParameterValues("approvalsAndNocDetailsId");
		ProjectApprovalsAndNOCDetails approvalDetails =null;
		List<ProjectApprovalsAndNOCDetails> approvalDetailsList = new ArrayList<ProjectApprovalsAndNOCDetails>();
		try {
			projectQuaterlyUpdate = (ProjectQuaterlyUpdate)commonDao.getObject(ProjectQuaterlyUpdate.class,quarterID);
			if(detailsOfApprovalsOrNoc != null && detailsOfApprovalsOrNoc.length > 0) {
				for(int i=0; i<detailsOfApprovalsOrNoc.length;i++) {
					if( detailsOfApprovalsOrNoc[i] != null) {
						if(approvalsAndNocDetailsIdArr != null && approvalsAndNocDetailsIdArr.length > i && approvalsAndNocDetailsIdArr[i] != null && approvalsAndNocDetailsIdArr[i].trim().length() > 0 ) {
							log.info("commonAreaDetailsIdArr len"+approvalsAndNocDetailsIdArr.length +"i >>>"+i);
							approvalDetails = (ProjectApprovalsAndNOCDetails)commonDao.getObject(ProjectApprovalsAndNOCDetails.class,Long.parseLong(approvalsAndNocDetailsIdArr[i]));
						}else {
							approvalDetails = new ProjectApprovalsAndNOCDetails();
						}
						approvalDetails.setDetailsOfApprovalsOrNoc(request.getParameterValues("detailsOfApprovalsOrNoc")[i]);
						approvalDetails.setIsApplicable(request.getParameter("isApplicable_"+i));

						if(request.getParameter("isApplicable_"+i).equals("Yes")) {

							approvalDetails.setStatus(request.getParameterValues("status")[i]);

							if(request.getParameterValues("status")[i].equals("Approved")) {

								if(request.getParameterValues("uploadDocId") != null) {
									doc = documentService.getDoc(Integer.parseInt(request.getParameterValues("uploadDocId")[i].trim()));
									doc.setFileName(photograph[i].getOriginalFilename());
									doc.setMimeType(photograph[i].getContentType());
									doc.setInputStream(photograph[i].getInputStream());
									contentUtil.saveDocument(doc);
									documentService.updateDoc(doc);
								}else {
									if(photograph[i] != null ){
										doc = new Document();
										doc.setFileName(photograph[i].getOriginalFilename());
										doc.setDocumentType("QUARTER_UPDT");
										doc.setFolderId("" + projectRegistrationModel.getProjectRegId());
										doc.setMimeType(photograph[i].getContentType());
										doc.setInputStream(photograph[i].getInputStream());
										contentUtil.saveDocument(doc);
										documentService.saveDoc(doc);
									}

								}
								approvalDetails.setUploadDoc(doc);

								SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
								if(request.getParameterValues("dateOfApplication")[i] != null && request.getParameterValues("dateOfApplication")[i] != " "
										&& request.getParameterValues("dateOfApplication")[i].length()>0) {
									Date actualFrmDate = sdf.parse(request.getParameterValues("dateOfApplication")[i]);
									Calendar dateOfApplicationCal = Calendar.getInstance();
									dateOfApplicationCal.setTime(actualFrmDate);
									approvalDetails.setDateOfApplication(dateOfApplicationCal);
								}
							}else if(request.getParameterValues("status")[i].equals("Applied")) {

								SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
								if(request.getParameterValues("dateOfApplication")[i] != null && request.getParameterValues("dateOfApplication")[i] != " "
										&& request.getParameterValues("dateOfApplication")[i].length()>0) {
									Date actualFrmDate = sdf.parse(request.getParameterValues("dateOfApplication")[i]);
									Calendar dateOfApplicationCal = Calendar.getInstance();
									dateOfApplicationCal.setTime(actualFrmDate);
									approvalDetails.setDateOfApplication(dateOfApplicationCal);
								}
							}
						}
					}
					approvalDetailsList.add(approvalDetails);
					log.info("FloorQuarterDetailsList>>>"+approvalDetailsList.size());
				}
				projectQuaterlyUpdate.setApprovalsAndNOCDetails(approvalDetailsList);
				commonDao.updateObject(projectQuaterlyUpdate);
			}
		}catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		//projectRegistrationModel.getProjectDetailsModel().setQuarterlyUpdate(projectQuaterlyUpdateList);
		return projectRegistrationModel;
	}

	@Override
	public ProjectRegistrationModel updateAssociationDetails(ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request, long quarterId, MultipartFile registeredDoc) {

		ProjectAssociationRegistrationDetails associationDetails =null;
		//	List<ProjectAssociationRegistrationDetails> associationDetailsList =null;
		try {
			projectQuaterlyUpdate = (ProjectQuaterlyUpdate)commonDao.getObject(ProjectQuaterlyUpdate.class,quarterId);

			if(projectQuaterlyUpdate.getAssociationDetails() != null  ) {
				associationDetails = projectQuaterlyUpdate.getAssociationDetails();
			}else {
				associationDetails = new ProjectAssociationRegistrationDetails();
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
			projectQuaterlyUpdate.setAssociationDetails(associationDetails);
			commonDao.updateObject(projectQuaterlyUpdate);

		} catch (Exception e) {
			e.printStackTrace();
			log.error(e.getMessage(), e);
		}
		//projectRegistrationModel.getProjectDetailsModel().setQuarterlyUpdate(projectQuaterlyUpdateList);
		return projectRegistrationModel;
	}


	@Override
	public ProjectRegistrationModel updateModificationDetails(ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request, long quarterId, MultipartFile uploadApprovalDoc, MultipartFile uploadDoc,
			MultipartFile modifiedDoc) throws Exception {


		ProjectModificationDetails ProjectModificationDetails =null;
		List<ProjectModificationDetails> ProjectModificationDetailsList = new ArrayList<ProjectModificationDetails>();
		try {
			projectQuaterlyUpdate = (ProjectQuaterlyUpdate)commonDao.getObject(ProjectQuaterlyUpdate.class,quarterId);

			if(projectQuaterlyUpdate.getModificationDetails() != null && projectQuaterlyUpdate.getModificationDetails().size()>0 ) {
				ProjectModificationDetails = (ProjectModificationDetails)commonDao.getObject(ProjectModificationDetails.class,Long.parseLong(request.getParameter("modificationDetailsId")));
			}else {
				ProjectModificationDetails = new ProjectModificationDetails();
			}


			ProjectModificationDetails.setIsModificationRequiredToApprove(request.getParameter("isModificationRequiredToApprove"));
			if(request.getParameter("isModificationRequiredToApprove").equals("Yes")) {
				ProjectModificationDetails.setIssuedByAuthority(request.getParameter("issuedByAuthority"));

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
				ProjectModificationDetails.setUploadApprovalDoc(doc);

				ProjectModificationDetails.setWrittenConsentOfAllotee(request.getParameter("writtenConsentOfAllotee"));
				if(request.getParameter("writtenConsentOfAllotee").equals("Yes")) {
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
					ProjectModificationDetails.setUploadDoc(doc);


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
					ProjectModificationDetails.setModifiedDoc(doc);
				}
			}
			ProjectModificationDetailsList.add(ProjectModificationDetails);
			projectQuaterlyUpdate.setModificationDetails(ProjectModificationDetailsList);
			commonDao.updateObject(projectQuaterlyUpdate);

		} catch (Exception e) {
			e.printStackTrace();
			log.error(e.getMessage(), e);
		}
		//projectRegistrationModel.getProjectDetailsModel().setQuarterlyUpdate(projectQuaterlyUpdateList);;
		return projectRegistrationModel;
	}


	/*@Override
	public ProjectRegistrationModel updateLitigationDetails(ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request, long quarterId, MultipartFile[] preventiveOrderDoc) throws Exception {
		String[] courtOrAuthorityName = request.getParameterValues("courtOrAuthorityName");
		String[] litigationDetailsIdArr = request.getParameterValues("litigationDetailsId");
		ProjectLitigationDetails projectLitigationDetails =null;
		List<ProjectLitigationDetails> litigationDetailsList = new ArrayList<ProjectLitigationDetails>();
		try {
			projectQuaterlyUpdate = (ProjectQuaterlyUpdate)commonDao.getObject(ProjectQuaterlyUpdate.class,quarterId);
			if(courtOrAuthorityName != null && courtOrAuthorityName.length > 0) {
				for(int i=0; i<courtOrAuthorityName.length;i++) {
					if( courtOrAuthorityName[i] != null) {
						if(litigationDetailsIdArr != null && litigationDetailsIdArr.length > i && litigationDetailsIdArr[i] != null && litigationDetailsIdArr[i].trim().length() > 0 ) {
							log.info("litigationDetailsIdArr len"+litigationDetailsIdArr.length +"i >>>"+i);
							projectLitigationDetails = (ProjectLitigationDetails)commonDao.getObject(ProjectLitigationDetails.class,Long.parseLong(litigationDetailsIdArr[i]));
						}else {
							projectLitigationDetails = new ProjectLitigationDetails();
						}
						projectLitigationDetails.setAnyLitigationOnProject(request.getParameterValues("anyLitigationOnProject")[i] );

						if(request.getParameterValues("anyLitigationOnProject")[i].equals("Yes")) {
							projectLitigationDetails.setCourtOrAuthorityName(request.getParameterValues("courtOrAuthorityName")[i]);
							projectLitigationDetails.setAnyPreventiveOrderIssued(request.getParameterValues("anyPreventiveOrderIssued")[i] );
							projectLitigationDetails.setCaseNo(Long.parseLong(request.getParameterValues("caseNo")[i]));
							projectLitigationDetails.setCaseType(request.getParameterValues("caseType")[i] );

							if(request.getParameterValues("anyPreventiveOrderIssued")[i].equals("Yes")) {
								projectLitigationDetails.setLitigationStatus(request.getParameterValues("litigationStatus")[i]);
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
									doc.setFolderId("" + projectRegistrationModel.getProjectRegId());
									doc.setMimeType(preventiveOrderDoc[i].getContentType());
									doc.setInputStream(preventiveOrderDoc[i].getInputStream());
									contentUtil.saveDocument(doc);
									documentService.saveDoc(doc);
								}
								projectLitigationDetails.setPreventiveOrderDoc(doc);
							}
							SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
							if(request.getParameterValues("litigationYear")[i] != null && request.getParameterValues("litigationYear")[i] != " ") {
								Date litigationYear = sdf.parse(request.getParameterValues("litigationYear")[i]);
								Calendar litigationYearCal = Calendar.getInstance();
								litigationYearCal.setTime(litigationYear);
								litigationYearCal.set(Calendar.YEAR, litigationYearCal.get(Calendar.YEAR));
								log.info("litigationYearCal >>"+litigationYearCal);
								projectLitigationDetails.setLitigationYear(litigationYearCal);
							}
						}
					}
					litigationDetailsList.add(projectLitigationDetails);
					log.info("litigationDetailsList>>>"+litigationDetailsList.size());
				}
				projectQuaterlyUpdate.setLitigationDetails(litigationDetailsList);
				projectQuaterlyUpdateList.add(projectQuaterlyUpdate);
			}
		}catch (Exception e) {
			// TODO: handle exception
			log.error(e.getMessage(), e);
		}
		projectRegistrationModel.getProjectDetailsModel().setQuarterlyUpdate(projectQuaterlyUpdateList);
		return projectRegistrationModel;
	}*/

	@Override
	public ProjectRegistrationModel updateLitigationDetails(ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request, long quarterId, MultipartFile[] preventiveOrderDoc,MultipartFile[] furtherOrderDoc) throws Exception {
		String[] courtOrAuthorityName = request.getParameterValues("courtOrAuthorityName");
		String[] litigationDetailsIdArr = request.getParameterValues("litigationDetailsId");
		String[] litigationArr = request.getParameterValues("litigationStatus");
		String[] preventiveOrderDocIdArr = request.getParameterValues("preventiveOrderDocId");
		String[] furtherOrderDocIdArr = request.getParameterValues("furtherOrderDocId");

		ProjectLitigationDetails projectLitigationDetails =null;
		List<ProjectLitigationDetails> litigationDetailsList =null;
		try {
			projectQuaterlyUpdate = (ProjectQuaterlyUpdate)commonDao.getObject(ProjectQuaterlyUpdate.class,quarterId);
			if(courtOrAuthorityName != null && courtOrAuthorityName.length > 0) {
				if (projectQuaterlyUpdate.getLitigationDetails()!=null) {
					litigationDetailsList=projectQuaterlyUpdate.getLitigationDetails();
				} else {
					litigationDetailsList = new ArrayList<ProjectLitigationDetails>();
				}
				for(int i=0; i<courtOrAuthorityName.length;i++) {
					if( courtOrAuthorityName[i] != null) {
						if(litigationDetailsIdArr != null && litigationDetailsIdArr.length > i && litigationDetailsIdArr[i] != null && litigationDetailsIdArr[i].trim().length() > 0 ) {
							log.info("litigationDetailsIdArr len"+litigationDetailsIdArr.length +"i >>>"+i);
							projectLitigationDetails = (ProjectLitigationDetails)commonDao.getObject(ProjectLitigationDetails.class,Long.parseLong(litigationDetailsIdArr[i]));
						}else {
							projectLitigationDetails = new ProjectLitigationDetails();
						}
						projectLitigationDetails.setAnyLitigationOnProject(request.getParameter("anyLitigationOnProject_"+i) );

						if(request.getParameter("anyLitigationOnProject_"+i).equals("Yes")) {
							projectLitigationDetails.setCourtOrAuthorityName(request.getParameterValues("courtOrAuthorityName")[i]);

							projectLitigationDetails.setCaseNo(Long.parseLong(request.getParameterValues("caseNo")[i]));
							projectLitigationDetails.setCaseType(request.getParameterValues("caseType")[i] );

							SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
							if(request.getParameterValues("litigationYear")[i] != null && request.getParameterValues("litigationYear")[i] != " ") {
								Date litigationYear = sdf.parse(request.getParameterValues("litigationYear")[i]);
								Calendar litigationYearCal = Calendar.getInstance();
								litigationYearCal.setTime(litigationYear);
								litigationYearCal.set(Calendar.YEAR, litigationYearCal.get(Calendar.YEAR));
								log.info("litigationYearCal >>"+litigationYearCal);
								projectLitigationDetails.setLitigationYear(litigationYearCal);
							}

							projectLitigationDetails.setAnyPreventiveOrderIssued(request.getParameter("anyPreventiveOrderIssued_"+i));
							if(request.getParameter("anyPreventiveOrderIssued_"+i).equals("Yes")) {
								projectLitigationDetails.setLitigationStatus(litigationArr[i]);
								if(preventiveOrderDocIdArr!=null && preventiveOrderDocIdArr.length>i && preventiveOrderDocIdArr[i]!=null && preventiveOrderDocIdArr[i].trim().length()>0) {
									doc = documentService.getDoc(Integer.parseInt(preventiveOrderDocIdArr[i].trim()));
									MultipartFile obj= preventiveOrderDoc[i];
									doc.setFileName(obj.getOriginalFilename());
									doc.setMimeType(obj.getContentType());
									doc.setInputStream(obj.getInputStream());
									contentUtil.saveDocument(doc);
									documentService.updateDoc(doc);
								}else {
									doc = new Document();
									doc.setFileName(preventiveOrderDoc[i].getOriginalFilename());
									doc.setDocumentType("QUARTER_UPDT");
									doc.setFolderId("" + projectRegistrationModel.getProjectRegId());
									doc.setMimeType(preventiveOrderDoc[i].getContentType());
									doc.setInputStream(preventiveOrderDoc[i].getInputStream());
									contentUtil.saveDocument(doc);
									documentService.saveDoc(doc);
								}
								projectLitigationDetails.setPreventiveOrderDoc(doc);

								if(furtherOrderDocIdArr!=null && furtherOrderDocIdArr.length>i && furtherOrderDocIdArr[i]!=null && furtherOrderDocIdArr[i].trim().length()>0) {
									doc = documentService.getDoc(Integer.parseInt(furtherOrderDocIdArr[i].trim()));
									MultipartFile obj= furtherOrderDoc[i];
									doc.setFileName(obj.getOriginalFilename());
									doc.setMimeType(obj.getContentType());
									doc.setInputStream(obj.getInputStream());
									contentUtil.saveDocument(doc);
									documentService.updateDoc(doc);
								}else {
									doc = new Document();
									doc.setFileName(furtherOrderDoc[i].getOriginalFilename());
									doc.setDocumentType("QUARTER_UPDT");
									doc.setFolderId("" + projectRegistrationModel.getProjectRegId());
									doc.setMimeType(furtherOrderDoc[i].getContentType());
									doc.setInputStream(furtherOrderDoc[i].getInputStream());
									contentUtil.saveDocument(doc);
									documentService.saveDoc(doc);
								}
								projectLitigationDetails.setFurtherOrderDoc(doc);
							}
						}
					}
					litigationDetailsList.add(projectLitigationDetails);
					log.info("litigationDetailsList>>>"+litigationDetailsList.size());
				}
				projectQuaterlyUpdate.setLitigationDetails(litigationDetailsList);
				commonDao.updateObject(projectQuaterlyUpdate);
			}
		}catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		//projectRegistrationModel.getProjectDetailsModel().setQuarterlyUpdate(projectQuaterlyUpdateList);
		return projectRegistrationModel;
	}

	@Override
	public ProjectRegistrationModel updateCivilWorksDetails(ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request, long quarterId) throws Exception {
		List<ProjectWorkModel> projectWorkList= new ArrayList<ProjectWorkModel>();
		String[] typeOfWorkArr = request.getParameterValues("TypeOfWork");
		ProjectWorkModel projectWorkModel = null;
		projectQuaterlyUpdate = (ProjectQuaterlyUpdate)commonDao.getObject(ProjectQuaterlyUpdate.class,quarterId);
		try {
			String[] projWorkIdArr = request.getParameterValues("projWorkId");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			if (typeOfWorkArr != null && typeOfWorkArr.length > 0) {
				for(int i=0;i< typeOfWorkArr.length; i++) {
					if (typeOfWorkArr[i] != null) {
						if (projWorkIdArr != null && projWorkIdArr.length > i && projWorkIdArr[i] != null && projWorkIdArr[i].trim().length() > 0) {
							projectWorkModel = projectWorkDAO.getProjectWorkModelById(Long.parseLong(projWorkIdArr[i]));
						}else {
							projectWorkModel = new ProjectWorkModel();
						}

					}
					projectWorkModel.setTypeOfWork(typeOfWorkArr[i]);

					if(request.getParameterValues("actualFrmDate")[i] != null && request.getParameterValues("actualFrmDate")[i] != " ") {
						Date actualFrmDate = sdf.parse(request.getParameterValues("actualFrmDate")[i]);
						Calendar actualFrmDateCal = Calendar.getInstance();
						actualFrmDateCal.setTime(actualFrmDate);
						projectWorkModel.setActualFrmDate(actualFrmDateCal);
					}
					if(request.getParameterValues("actualToDate")[i] != null && request.getParameterValues("actualToDate")[i] != " ") {
						Date actualToDate = sdf.parse(request.getParameterValues("actualToDate")[i]);
						Calendar actualToDateCal = Calendar.getInstance();
						actualToDateCal.setTime(actualToDate);
						projectWorkModel.setActualToDate(actualToDateCal);
					}
					projectWorkList.add(projectWorkModel);
				}
				projectQuaterlyUpdate.setProjectWorkModel(projectWorkList);
				commonDao.updateObject(projectQuaterlyUpdate);
				//projectQuaterlyUpdateList.add(projectQuaterlyUpdate);

			}
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		//projectRegistrationModel.getProjectDetailsModel().setQuarterlyUpdate(projectQuaterlyUpdateList);
		return projectRegistrationModel;
	}

	@Override
	public ProjectRegistrationModel updateFloorDetails(ProjectRegistrationModel baseObject, HttpServletRequest request,
			Long quarterID) {
		return null;
	}

	@Override
	public ProjectRegistrationModel updateProjectConstructionWelfareDetails(
			ProjectRegistrationModel projectRegistrationModel, HttpServletRequest request, long quarterId,
			MultipartFile welfareFundregisteredDoc) throws Exception {
		ProjectWelfareFundDetails welfareFundDetails = null;
		// List<ProjectAssociationRegistrationDetails> associationDetailsList =null;
		try {
			projectQuaterlyUpdate = (ProjectQuaterlyUpdate) commonDao.getObject(ProjectQuaterlyUpdate.class, quarterId);

			if (projectQuaterlyUpdate.getProjectWelfareFundDetails() != null) {
				welfareFundDetails = projectQuaterlyUpdate.getProjectWelfareFundDetails();
			} else {
				welfareFundDetails = new ProjectWelfareFundDetails();
			}
			welfareFundDetails.setIsApplicable(request.getParameter("isApplicable"));

			if(request.getParameter("isApplicable").equals("Yes")) {
				welfareFundDetails.setProjecteFundRegNo(request.getParameter("projecteFundRegNo"));

				if (request.getParameter("welfareFundregisteredDocId") != null
						&& request.getParameter("welfareFundregisteredDoc") != null) {
					doc = documentService
							.getDoc(Integer.parseInt(request.getParameter("welfareFundregisteredDocId").trim()));
					doc.setFileName(welfareFundregisteredDoc.getOriginalFilename());
					doc.setMimeType(welfareFundregisteredDoc.getContentType());
					doc.setInputStream(welfareFundregisteredDoc.getInputStream());
					contentUtil.saveDocument(doc);
					documentService.updateDoc(doc);
				} else {
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
			// associationDetailsList.add(associationDetails);
			projectQuaterlyUpdate.setProjectWelfareFundDetails(welfareFundDetails);
			//projectQuaterlyUpdateList.add(projectQuaterlyUpdate);
			commonDao.updateObject(projectQuaterlyUpdate);

		} catch (Exception e) {
			e.printStackTrace();
			log.error(e.getMessage(), e);
		}
		//projectRegistrationModel.getProjectDetailsModel().setQuarterlyUpdate(projectQuaterlyUpdateList);
		return projectRegistrationModel;
	}



	@Override
	public ProjectRegistrationModel saveOrUpdateConstructionCostDetails(ProjectRegistrationModel projectRegistrationModel, HttpServletRequest request, long quarterId) throws Exception {

		List<ProjectQuaterlyUpdate> projectQuaterlyUpdateList = new ArrayList<ProjectQuaterlyUpdate>();
		List<QuarterConstructionCostModel> quarterConstructionCostList= new ArrayList<QuarterConstructionCostModel>();
		String[] consCostParticularArr = request.getParameterValues("consCostParticular");
		String[] estCostArr = request.getParameterValues("estConsCost");
		String[] actCostArr = request.getParameterValues("actConsCost");
		QuarterConstructionCostModel quarterConstructionCostModel = null;
		projectQuaterlyUpdate = (ProjectQuaterlyUpdate)commonDao.getObject(ProjectQuaterlyUpdate.class,quarterId);

		try {

			String[] consCostParticularIdArr = request.getParameterValues("constructionCostDetailsId");


			if (consCostParticularArr != null && consCostParticularArr.length > 0) {
				for(int i=0;i< consCostParticularArr.length; i++) {
					if (consCostParticularArr[i] != null) {
						if (consCostParticularIdArr != null && consCostParticularIdArr.length > i && consCostParticularIdArr[i] != null && consCostParticularIdArr[i].trim().length() > 0) {
							quarterConstructionCostModel = (QuarterConstructionCostModel)commonDao.getObject(QuarterConstructionCostModel.class,Long.parseLong(consCostParticularIdArr[i]));
						} else {
							quarterConstructionCostModel = new QuarterConstructionCostModel();
						}
					}

					quarterConstructionCostModel.setConsCostParticular(consCostParticularArr[i]);
					quarterConstructionCostModel.setEstConsCost(Long.parseLong((estCostArr[i])));
					quarterConstructionCostModel.setActConsCost(Long.parseLong((actCostArr[i])));

					quarterConstructionCostList.add(quarterConstructionCostModel);

					projectQuaterlyUpdate.setQuarterConstructionCostList(quarterConstructionCostList);
				}
				//projectQuaterlyUpdateList.add(projectQuaterlyUpdate);
				commonDao.updateObject(projectQuaterlyUpdate);
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
	public ProjectRegistrationModel saveSuperStructureDetails(ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request,long quarterId) throws Exception {
		List<QuarterSuperStructureModel> quarterSupStructureList= new ArrayList<QuarterSuperStructureModel>();
		String[] typeOfWorkArr = request.getParameterValues("typeOfWork");
		QuarterSuperStructureModel quarterSupStructureModel = null;
		projectQuaterlyUpdate = (ProjectQuaterlyUpdate)commonDao.getObject(ProjectQuaterlyUpdate.class,quarterId);

		try {
			String[] projWorkIdArr = request.getParameterValues("supStructureId");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

			if (typeOfWorkArr != null && typeOfWorkArr.length > 0) {
				for(int i=0;i< typeOfWorkArr.length; i++) {
					if (typeOfWorkArr[i] != null) {
						if (projWorkIdArr != null && projWorkIdArr.length > i && projWorkIdArr[i] != null && projWorkIdArr[i].trim().length() > 0) {
							quarterSupStructureModel = (QuarterSuperStructureModel)commonDao.getObject(QuarterSuperStructureModel.class,Long.parseLong(projWorkIdArr[i]));
						} else {
							quarterSupStructureModel = new QuarterSuperStructureModel();
						}
					}
					quarterSupStructureModel.setTypeOfWork(typeOfWorkArr[i]);
					if(request.getParameterValues("estimatedFrmDate")[i] != null && request.getParameterValues("estimatedFrmDate")[i] != " ") {
						Date date = sdf.parse(request.getParameterValues("estimatedFrmDate")[i]);
						log.info("date "+date);
						Calendar estimatedFrmDateCal = Calendar.getInstance();
						estimatedFrmDateCal.setTime(date);
						quarterSupStructureModel.setEstimatedFrmDate(estimatedFrmDateCal);
					}
					if(request.getParameterValues("estimatedToDate")[i] != null && request.getParameterValues("estimatedToDate")[i] != " ") {
						Date estimatedToDate = sdf.parse(request.getParameterValues("estimatedToDate")[i]);
						Calendar estimatedToDateCal = Calendar.getInstance();
						estimatedToDateCal.setTime(estimatedToDate);
						quarterSupStructureModel.setEstimatedToDate(estimatedToDateCal);
					}
					if(request.getParameterValues("actualFrmDate")[i] != null && request.getParameterValues("actualFrmDate")[i] != " ") {
						Date actualFrmDate = sdf.parse(request.getParameterValues("actualFrmDate")[i]);
						Calendar actualFrmDateCal = Calendar.getInstance();
						actualFrmDateCal.setTime(actualFrmDate);
						quarterSupStructureModel.setActualFrmDate(actualFrmDateCal);
					}
					if(request.getParameterValues("actualToDate")[i] != null && request.getParameterValues("actualToDate")[i] != " ") {
						Date actualToDate = sdf.parse(request.getParameterValues("actualToDate")[i]);
						Calendar actualToDateCal = Calendar.getInstance();
						actualToDateCal.setTime(actualToDate);
						quarterSupStructureModel.setActualToDate(actualToDateCal);
					}

					commonDao.updateObject(quarterSupStructureModel);
					quarterSupStructureList.add(quarterSupStructureModel);
					projectQuaterlyUpdate.setSuperStructureList(quarterSupStructureList);	
					commonDao.updateObject(projectQuaterlyUpdate);
				}
			}
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return projectRegistrationModel;
	}


	@Override
	public ProjectRegistrationModel saveSubStructureDetails(ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request,long quarterId) throws Exception {
		List<QuarterSubStructureModel> quarterSubStructureList= new ArrayList<QuarterSubStructureModel>();
		String[] typeOfWorkArr = request.getParameterValues("typeOfWork");
		QuarterSubStructureModel quarterSubStructureModel = null;
		projectQuaterlyUpdate = (ProjectQuaterlyUpdate)commonDao.getObject(ProjectQuaterlyUpdate.class,quarterId);

		try {
			String[] projWorkIdArr = request.getParameterValues("subStructureId");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

			if (typeOfWorkArr != null && typeOfWorkArr.length > 0) {
				for(int i=0;i< typeOfWorkArr.length; i++) {
					if (typeOfWorkArr[i] != null) {
						if (projWorkIdArr != null && projWorkIdArr.length > i && projWorkIdArr[i] != null && projWorkIdArr[i].trim().length() > 0) {
							quarterSubStructureModel = (QuarterSubStructureModel)commonDao.getObject(QuarterSubStructureModel.class,Long.parseLong(projWorkIdArr[i]));
						} else {
							quarterSubStructureModel = new QuarterSubStructureModel();
						}
					}
					quarterSubStructureModel.setTypeOfWork(typeOfWorkArr[i]);
					if(request.getParameterValues("estimatedFrmDate")[i] != null && request.getParameterValues("estimatedFrmDate")[i] != " ") {
						Date date = sdf.parse(request.getParameterValues("estimatedFrmDate")[i]);
						log.info("date "+date);
						Calendar estimatedFrmDateCal = Calendar.getInstance();
						estimatedFrmDateCal.setTime(date);
						quarterSubStructureModel.setEstimatedFrmDate(estimatedFrmDateCal);
					}
					if(request.getParameterValues("estimatedToDate")[i] != null && request.getParameterValues("estimatedToDate")[i] != " ") {
						Date estimatedToDate = sdf.parse(request.getParameterValues("estimatedToDate")[i]);
						Calendar estimatedToDateCal = Calendar.getInstance();
						estimatedToDateCal.setTime(estimatedToDate);
						quarterSubStructureModel.setEstimatedToDate(estimatedToDateCal);
					}
					if(request.getParameterValues("actualFrmDate")[i] != null && request.getParameterValues("actualFrmDate")[i] != " ") {
						Date actualFrmDate = sdf.parse(request.getParameterValues("actualFrmDate")[i]);
						Calendar actualFrmDateCal = Calendar.getInstance();
						actualFrmDateCal.setTime(actualFrmDate);
						quarterSubStructureModel.setActualFrmDate(actualFrmDateCal);
					}
					if(request.getParameterValues("actualToDate")[i] != null && request.getParameterValues("actualToDate")[i] != " ") {
						Date actualToDate = sdf.parse(request.getParameterValues("actualToDate")[i]);
						Calendar actualToDateCal = Calendar.getInstance();
						actualToDateCal.setTime(actualToDate);
						quarterSubStructureModel.setActualToDate(actualToDateCal);
					}

					commonDao.updateObject(quarterSubStructureModel);
					quarterSubStructureList.add(quarterSubStructureModel);
					projectQuaterlyUpdate.setSubStructureList(quarterSubStructureList);	
					commonDao.updateObject(projectQuaterlyUpdate);
				}
			}
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return projectRegistrationModel;
	}


	@Override
	public ProjectRegistrationModel saveAmenityDetails(ProjectRegistrationModel projectRegistrationModel, HttpServletRequest request,long quarterId)
			throws Exception {
		List<QuarterAmenityDetails> amenityList= new ArrayList<QuarterAmenityDetails>();
		String[] typeOfWorkArr = request.getParameterValues("amenityName");
		QuarterAmenityDetails quarterAmenityDetails = null;
		projectQuaterlyUpdate = (ProjectQuaterlyUpdate)commonDao.getObject(ProjectQuaterlyUpdate.class,quarterId);
		try {
			String[] percentageArray = request.getParameterValues("percOfCompletion");
			String[] projWorkIdArr = request.getParameterValues("amenityDetailsId");
			if (typeOfWorkArr != null && typeOfWorkArr.length > 0) {
				for(int i=0;i< typeOfWorkArr.length; i++) {
					if (typeOfWorkArr[i] != null) {
						if (projWorkIdArr != null && projWorkIdArr.length > i && projWorkIdArr[i] != null && projWorkIdArr[i].trim().length() > 0) {
							quarterAmenityDetails = (QuarterAmenityDetails)commonDao.getObject(QuarterAmenityDetails.class,Long.parseLong(projWorkIdArr[i]));
						} else {
							quarterAmenityDetails = new QuarterAmenityDetails();
							//log.info("created ProjectScheduleModel");
						}
						quarterAmenityDetails.setAmenityName(typeOfWorkArr[i]);
						quarterAmenityDetails.setPercOfCompletion(Long.parseLong(percentageArray[i]));
						commonDao.updateObject(quarterAmenityDetails);
						amenityList.add(quarterAmenityDetails);
						projectQuaterlyUpdate.setAmenityList(amenityList);
						commonDao.updateObject(projectQuaterlyUpdate);
					}
				}
			}
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return projectRegistrationModel;
	}


	@Override
	public ProjectRegistrationModel saveMasonryDetails(ProjectRegistrationModel projectRegistrationModel, HttpServletRequest request,
			long quarterId) throws Exception {
		List<QuarteMasnoryModel> quarterMasonryList= new ArrayList<QuarteMasnoryModel>();
		String[] typeOfWorkArr = request.getParameterValues("typeOfWork");
		QuarteMasnoryModel quarterSubStructureModel = null;
		projectQuaterlyUpdate = (ProjectQuaterlyUpdate)commonDao.getObject(ProjectQuaterlyUpdate.class,quarterId);
		try {
			String[] projWorkIdArr = request.getParameterValues("masnoryId");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

			if (typeOfWorkArr != null && typeOfWorkArr.length > 0) {
				for(int i=0;i< typeOfWorkArr.length; i++) {
					if (typeOfWorkArr[i] != null) {
						if (projWorkIdArr != null && projWorkIdArr.length > i && projWorkIdArr[i] != null && projWorkIdArr[i].trim().length() > 0) {
							quarterSubStructureModel = (QuarteMasnoryModel)commonDao.getObject(QuarteMasnoryModel.class,Long.parseLong(projWorkIdArr[i]));
						} else {
							quarterSubStructureModel = new QuarteMasnoryModel();
						}
					}
					quarterSubStructureModel.setTypeOfWork(typeOfWorkArr[i]);
					if(request.getParameterValues("estimatedFrmDate")[i] != null && request.getParameterValues("estimatedFrmDate")[i] != " ") {
						Date date = sdf.parse(request.getParameterValues("estimatedFrmDate")[i]);
						log.info("date "+date);
						Calendar estimatedFrmDateCal = Calendar.getInstance();
						estimatedFrmDateCal.setTime(date);
						quarterSubStructureModel.setEstimatedFrmDate(estimatedFrmDateCal);
					}
					if(request.getParameterValues("estimatedToDate")[i] != null && request.getParameterValues("estimatedToDate")[i] != " ") {
						Date estimatedToDate = sdf.parse(request.getParameterValues("estimatedToDate")[i]);
						Calendar estimatedToDateCal = Calendar.getInstance();
						estimatedToDateCal.setTime(estimatedToDate);
						quarterSubStructureModel.setEstimatedToDate(estimatedToDateCal);
					}
					if(request.getParameterValues("actualFrmDate")[i] != null && request.getParameterValues("actualFrmDate")[i] != " ") {
						Date actualFrmDate = sdf.parse(request.getParameterValues("actualFrmDate")[i]);
						Calendar actualFrmDateCal = Calendar.getInstance();
						actualFrmDateCal.setTime(actualFrmDate);
						quarterSubStructureModel.setActualFrmDate(actualFrmDateCal);
					}
					if(request.getParameterValues("actualToDate")[i] != null && request.getParameterValues("actualToDate")[i] != " ") {
						Date actualToDate = sdf.parse(request.getParameterValues("actualToDate")[i]);
						Calendar actualToDateCal = Calendar.getInstance();
						actualToDateCal.setTime(actualToDate);
						quarterSubStructureModel.setActualToDate(actualToDateCal);
					}

					commonDao.updateObject(quarterSubStructureModel);
					quarterMasonryList.add(quarterSubStructureModel);
					projectQuaterlyUpdate.setMasonryList(quarterMasonryList);	
					commonDao.updateObject(projectQuaterlyUpdate);
				}
			}
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return projectRegistrationModel;
	}


	@Override
	public ProjectRegistrationModel saveFinishingInteriorDetails(ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request, long quarterId) throws Exception {
		List<QuarterFinishingInteriorModel> interiorList= new ArrayList<QuarterFinishingInteriorModel>();
		String[] typeOfWorkArr = request.getParameterValues("typeOfWork");
		QuarterFinishingInteriorModel interiorModel = null;
		projectQuaterlyUpdate = (ProjectQuaterlyUpdate)commonDao.getObject(ProjectQuaterlyUpdate.class,quarterId);

		try {
			String[] projWorkIdArr = request.getParameterValues("finishingInteriorId");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

			if (typeOfWorkArr != null && typeOfWorkArr.length > 0) {
				for(int i=0;i< typeOfWorkArr.length; i++) {
					if (typeOfWorkArr[i] != null) {
						if (projWorkIdArr != null && projWorkIdArr.length > i && projWorkIdArr[i] != null && projWorkIdArr[i].trim().length() > 0) {
							interiorModel = (QuarterFinishingInteriorModel)commonDao.getObject(QuarterFinishingInteriorModel.class,Long.parseLong(projWorkIdArr[i]));
						} else {
							interiorModel = new QuarterFinishingInteriorModel();
						}
					}
					interiorModel.setTypeOfWork(typeOfWorkArr[i]);
					if(request.getParameterValues("estimatedFrmDate")[i] != null && request.getParameterValues("estimatedFrmDate")[i] != " ") {
						Date date = sdf.parse(request.getParameterValues("estimatedFrmDate")[i]);
						log.info("date "+date);
						Calendar estimatedFrmDateCal = Calendar.getInstance();
						estimatedFrmDateCal.setTime(date);
						interiorModel.setEstimatedFrmDate(estimatedFrmDateCal);
					}
					if(request.getParameterValues("estimatedToDate")[i] != null && request.getParameterValues("estimatedToDate")[i] != " ") {
						Date estimatedToDate = sdf.parse(request.getParameterValues("estimatedToDate")[i]);
						Calendar estimatedToDateCal = Calendar.getInstance();
						estimatedToDateCal.setTime(estimatedToDate);
						interiorModel.setEstimatedToDate(estimatedToDateCal);
					}
					if(request.getParameterValues("actualFrmDate")[i] != null && request.getParameterValues("actualFrmDate")[i] != " ") {
						Date actualFrmDate = sdf.parse(request.getParameterValues("actualFrmDate")[i]);
						Calendar actualFrmDateCal = Calendar.getInstance();
						actualFrmDateCal.setTime(actualFrmDate);
						interiorModel.setActualFrmDate(actualFrmDateCal);
					}
					if(request.getParameterValues("actualToDate")[i] != null && request.getParameterValues("actualToDate")[i] != " ") {
						Date actualToDate = sdf.parse(request.getParameterValues("actualToDate")[i]);
						Calendar actualToDateCal = Calendar.getInstance();
						actualToDateCal.setTime(actualToDate);
						interiorModel.setActualToDate(actualToDateCal);
					}

					commonDao.updateObject(interiorModel);
					interiorList.add(interiorModel);
					projectQuaterlyUpdate.setFinishingOrInteriorWorkList(interiorList);	
					commonDao.updateObject(projectQuaterlyUpdate);
				}
			}
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return projectRegistrationModel;
	}


	@Override
	public ProjectRegistrationModel updateExternalInfrastructureDetails(ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request, long quarterId) throws Exception {
		List<QuarterExternalInfrastructureWorksModel> externalInfraList = new ArrayList<QuarterExternalInfrastructureWorksModel>();
		QuarterExternalInfrastructureWorksModel quarterExternalInfrastructureDetails =null;
		try {
			projectQuaterlyUpdate = (ProjectQuaterlyUpdate)commonDao.getObject(ProjectQuaterlyUpdate.class,quarterId);
			//for add more take in the array of request

			String[] percentageArray = request.getParameterValues("percentageOfCompletion");
			String[] infrastructureIdArr = request.getParameterValues("externalInfrastructureId");   
			if(percentageArray != null && percentageArray.length > 0) {
				for(int i=0; i<percentageArray.length;i++) {
					if( percentageArray[i] != null) {
						if(infrastructureIdArr != null && infrastructureIdArr.length > i && infrastructureIdArr[i] != null && infrastructureIdArr[i].trim().length() > 0 ) {
							quarterExternalInfrastructureDetails = (QuarterExternalInfrastructureWorksModel)commonDao.getObject(QuarterExternalInfrastructureWorksModel.class,Long.parseLong(infrastructureIdArr[i]));
						}else {
							quarterExternalInfrastructureDetails = new QuarterExternalInfrastructureWorksModel();
						}
						quarterExternalInfrastructureDetails.setExternalInfrastructureName(request.getParameterValues("externalInfrastructureName")[i]);
						quarterExternalInfrastructureDetails.setPercentageOfCompletion(Long.parseLong(request.getParameterValues("percentageOfCompletion")[i]));

					}
					commonDao.updateObject(quarterExternalInfrastructureDetails);
					externalInfraList.add(quarterExternalInfrastructureDetails);
				}
				projectQuaterlyUpdate.setExternalinfrastructureDetails(externalInfraList);
				commonDao.updateObject(projectQuaterlyUpdate);
				//projectQuaterlyUpdateList.add(projectQuaterlyUpdate);
			}

		} catch (Exception e) {
			e.printStackTrace();
			log.error(e.getMessage(), e);
		}
		//projectRegistrationModel.getProjectDetailsModel().setQuarterlyUpdate(projectQuaterlyUpdateList);
		return projectRegistrationModel;
	}

	@Override
	public ProjectRegistrationModel updateCommonAreaDetails(ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request, long quarterId) {

		List<QuarterCommonAreaDetails> commonAreaList = new ArrayList<QuarterCommonAreaDetails>();
		QuarterCommonAreaDetails quarterCommonAreaDetails =null;
		try {
			projectQuaterlyUpdate = (ProjectQuaterlyUpdate)commonDao.getObject(ProjectQuaterlyUpdate.class,quarterId);
			//for add more take in the array of request

			String[] percentageArray = request.getParameterValues("percentageOfCompletion");
			String[] commonAreaDetailsIdArr = request.getParameterValues("commonAreaDetailsId");   
			if(percentageArray != null && percentageArray.length > 0) {
				for(int i=0; i<percentageArray.length;i++) {
					if( percentageArray[i] != null) {
						if(commonAreaDetailsIdArr != null && commonAreaDetailsIdArr.length > i && commonAreaDetailsIdArr[i] != null && commonAreaDetailsIdArr[i].trim().length() > 0 ) {
							log.info("commonAreaDetailsIdArr len"+commonAreaDetailsIdArr.length +"i >>>"+i);
							quarterCommonAreaDetails = (QuarterCommonAreaDetails)commonDao.getObject(QuarterCommonAreaDetails.class,Long.parseLong(commonAreaDetailsIdArr[i]));
						}else {
							quarterCommonAreaDetails = new QuarterCommonAreaDetails();
						}
						quarterCommonAreaDetails.setCommonAreaName(request.getParameterValues("commonAreaName")[i]);
						quarterCommonAreaDetails.setPercentageOfCompletion(Long.parseLong(request.getParameterValues("percentageOfCompletion")[i]));

					}
					commonAreaList.add(quarterCommonAreaDetails);
					log.info("FloorQuarterDetailsList>>>"+commonAreaList.size());
				}
				projectQuaterlyUpdate.setCommonAreaDetails(commonAreaList);
				//projectQuaterlyUpdateList.add(projectQuaterlyUpdate);
				commonDao.updateObject(projectQuaterlyUpdate);
			}

		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		//projectRegistrationModel.getProjectDetailsModel().setQuarterlyUpdate(projectQuaterlyUpdateList);
		return projectRegistrationModel;

	}


	//---------------------------------------------------plots------------------------------------------

	/*List<PlotsQuaterlyUpdate> plotQuaterlyUpdateList = new ArrayList<PlotsQuaterlyUpdate>();

	PlotsQuaterlyUpdate plotQuaterlyUpdate = null;

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
			plotQuaterlyUpdateList.add(plotQuaterlyUpdate);

		} catch (Exception e) {
			e.printStackTrace();
			log.error(e.getMessage(), e);
		}
		projectRegistrationModel.getProjectDetailsModel().setPlotsQuarterlyUpdate(plotQuaterlyUpdateList);
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
					plotQuaterlyUpdateList.add(plotQuaterlyUpdate);
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
			plotQuaterlyUpdateList.add(plotQuaterlyUpdate);

		} catch (Exception e) {
			e.printStackTrace();
			log.error(e.getMessage(), e);
			//throw e;
		}
		baseObject.getProjectDetailsModel().setPlotsQuarterlyUpdate(plotQuaterlyUpdateList);
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
				plotQuaterlyUpdateList.add(plotQuaterlyUpdate);
			}

		} catch (Exception e) {
			e.printStackTrace();
			log.error(e.getMessage(), e);
		}
		baseObject.getProjectDetailsModel().setPlotsQuarterlyUpdate(plotQuaterlyUpdateList);
		return baseObject;
	}

	@Override
	public ProjectRegistrationModel saveOrUpdatePlotConstructionCostDetails(ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request, long quarterId) throws Exception {
		QuarterPlotsConstructionCostModel constructionCostDetailsModel = null;
		List<PlotsQuaterlyUpdate> plotQuaterlyUpdateList = new ArrayList<PlotsQuaterlyUpdate>();

		plotQuaterlyUpdate = (PlotsQuaterlyUpdate) commonDao.getObject(PlotsQuaterlyUpdate.class, quarterId);
		try {
			if (plotQuaterlyUpdate.getConstructionCostQuarteDetlsl() != null) {
				constructionCostDetailsModel = plotQuaterlyUpdate.getConstructionCostQuarteDetlsl();
			} else {
				constructionCostDetailsModel = new QuarterPlotsConstructionCostModel();
			}
			constructionCostDetailsModel.setEstConstrCostByEngg(Long.parseLong(request.getParameter("estConstrCostByEngg")));
			constructionCostDetailsModel.setActConstrCostByEngg(Long.parseLong(request.getParameter("actConstrCostByEngg")));
			constructionCostDetailsModel.setActOnSiteExpenditureSalariesOfWorkers(Long.parseLong(request.getParameter("actOnSiteExpenditureSalariesOfWorkers")));
			constructionCostDetailsModel.setEstOnSiteExpenditureSalariesOfWorkers(Long.parseLong(request.getParameter("estOnSiteExpenditureSalariesOfWorkers")));
			constructionCostDetailsModel.setActOnSiteExpenditureSideOverhead(Long.parseLong(request.getParameter("actOnSiteExpenditureSideOverhead")));
			constructionCostDetailsModel.setEstOnSiteExpenditureSideOverhead(Long.parseLong(request.getParameter("estOnSiteExpenditureSideOverhead")));
			constructionCostDetailsModel.setEstOnSiteExpenditureConsultantsFees(Long.parseLong(request.getParameter("estOnSiteExpenditureConsultantsFees")));
			constructionCostDetailsModel.setActOnSiteExpenditureConsultantsFees(Long.parseLong(request.getParameter("actOnSiteExpenditureConsultantsFees")));
			constructionCostDetailsModel.setEstOnSiteExpenditureCostOfServices(Long.parseLong(request.getParameter("estOnSiteExpenditureCostOfServices")));
			constructionCostDetailsModel.setActOnSiteExpenditureCostOfServices(Long.parseLong(request.getParameter("actOnSiteExpenditureCostOfServices")));
			constructionCostDetailsModel.setEstTax(Long.parseLong(request.getParameter("estTax")));
			constructionCostDetailsModel.setActTax(Long.parseLong(request.getParameter("actTax")));
			constructionCostDetailsModel.setEstCess(Long.parseLong(request.getParameter("estCess")));
			constructionCostDetailsModel.setActCess(Long.parseLong(request.getParameter("actCess")));
			constructionCostDetailsModel.setActCharges(Long.parseLong(request.getParameter("actCharges")));
			constructionCostDetailsModel.setEstFees(Long.parseLong(request.getParameter("estFees")));
			constructionCostDetailsModel.setActFees(Long.parseLong(request.getParameter("actFees")));
			constructionCostDetailsModel.setEstCharges(Long.parseLong(request.getParameter("estCharges")));
			constructionCostDetailsModel.setEstPremiums(Long.parseLong(request.getParameter("estPremiums")));
			constructionCostDetailsModel.setActPremiums(Long.parseLong(request.getParameter("actPremiums")));

			constructionCostDetailsModel.setEstPayableAmtToFinacialInstiteScheduledBanks(Long.parseLong(request.getParameter("estPayableAmtToFinacialInstiteScheduledBanks")));
			constructionCostDetailsModel.setActPayableAmtToFinacialInstiteScheduledBanks(Long.parseLong(request.getParameter("actPayableAmtToFinacialInstiteScheduledBanks")));
			constructionCostDetailsModel.setEstPayableAmtToFinacialInstiteNBFC(Long.parseLong(request.getParameter("estPayableAmtToFinacialInstiteNBFC")));
			constructionCostDetailsModel.setActPayableAmtToFinacialInstiteNBFC(Long.parseLong(request.getParameter("actPayableAmtToFinacialInstiteNBFC")));
			constructionCostDetailsModel.setEstPayableAmtToFinacialInstiteMoneyLenders(Long.parseLong(request.getParameter("estPayableAmtToFinacialInstiteMoneyLenders")));
			constructionCostDetailsModel.setActPayableAmtToFinacialInstiteMoneyLenders(Long.parseLong(request.getParameter("actPayableAmtToFinacialInstiteMoneyLenders")));
			constructionCostDetailsModel.setEstTotConstructionCost(Long.parseLong(request.getParameter("estTotConstructionCost")));
			constructionCostDetailsModel.setActTotConstructionCost(Long.parseLong(request.getParameter("actTotConstructionCost")));

			plotQuaterlyUpdate.setConstructionCostQuarteDetlsl(constructionCostDetailsModel);
			plotQuaterlyUpdateList.add(plotQuaterlyUpdate);


		} catch (Exception e) {
			e.printStackTrace();
			log.error(e.getMessage(), e);
			throw e;
		}

		projectRegistrationModel.getProjectDetailsModel().setPlotsQuarterlyUpdate(plotQuaterlyUpdateList);
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
									//doc.setDocumentType("QUARTER_UPDT");
									//doc.setFolderId("" + baseObject.getProjectRegId());
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
				plotQuaterlyUpdateList.add(plotQuaterlyUpdate);
			}
		}catch (Exception e) {
			// TODO: handle exception
			log.error(e.getMessage(), e);
		}
		baseObject.getProjectDetailsModel().setPlotsQuarterlyUpdate(plotQuaterlyUpdateList);
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
				plotQuaterlyUpdate.setLitigationDetails(litigationDetailsList);;
				plotQuaterlyUpdateList.add(plotQuaterlyUpdate);
			}
		}catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		baseObject.getProjectDetailsModel().setPlotsQuarterlyUpdate(plotQuaterlyUpdateList);
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
			plotQuaterlyUpdateList.add(plotQuaterlyUpdate);

		} catch (Exception e) {
			e.printStackTrace();
			log.error(e.getMessage(), e);
		}
		projectRegistrationModel.getProjectDetailsModel().setPlotsQuarterlyUpdate(plotQuaterlyUpdateList);;
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
			plotQuaterlyUpdateList.add(plotQuaterlyUpdate);

		} catch (Exception e) {
			e.printStackTrace();
			log.error(e.getMessage(), e);
		}
		projectRegistrationModel.getProjectDetailsModel().setPlotsQuarterlyUpdate(plotQuaterlyUpdateList);
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
			plotQuaterlyUpdateList.add(plotQuaterlyUpdate);

		} catch (Exception e) {
			e.printStackTrace();
			log.error(e.getMessage(), e);
		}
		projectRegistrationModel.getProjectDetailsModel().setPlotsQuarterlyUpdate(plotQuaterlyUpdateList);
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
	}*/

}
