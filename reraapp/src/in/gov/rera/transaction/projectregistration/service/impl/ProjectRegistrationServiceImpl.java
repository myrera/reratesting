package in.gov.rera.transaction.projectregistration.service.impl;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import in.gov.rera.common.dao.impl.CommonDao;
import in.gov.rera.common.util.DateUtil;
import in.gov.rera.common.util.ReraConstants;
import in.gov.rera.dms.beans.Document;
import in.gov.rera.dms.service.IDocumentService;
import in.gov.rera.dms.util.ContentUtil;
import in.gov.rera.master.district.dao.IDistrictDAO;
import in.gov.rera.master.district.model.DistrictModel;
import in.gov.rera.transaction.agentregistration.dao.IAgentRegistrationDAO;
import in.gov.rera.transaction.agentregistration.model.AgentRegistrationModel;
import in.gov.rera.transaction.projectregistration.dao.IBlackListDao;
import in.gov.rera.transaction.projectregistration.dao.IDevelopmentDetailsDAO;
import in.gov.rera.transaction.projectregistration.dao.IPrevoiuProjectDao;
import in.gov.rera.transaction.projectregistration.dao.IProjectArchitectDAO;
import in.gov.rera.transaction.projectregistration.dao.IProjectContractorDAO;
import in.gov.rera.transaction.projectregistration.dao.IProjectMemberDao;
import in.gov.rera.transaction.projectregistration.dao.IProjectRegistrationDAO;
import in.gov.rera.transaction.projectregistration.dao.IStructuralEngneerDAO;
import in.gov.rera.transaction.projectregistration.model.DevelopmentDetailsModel;
import in.gov.rera.transaction.projectregistration.model.PerviousProjectDetailsModel;
import in.gov.rera.transaction.projectregistration.model.ProjectAdditionalFileDocModel;
import in.gov.rera.transaction.projectregistration.model.ProjectArchitectDetailsModel;
import in.gov.rera.transaction.projectregistration.model.ProjectContratorDetailsModel;
import in.gov.rera.transaction.projectregistration.model.ProjectDetailsModel;
import in.gov.rera.transaction.projectregistration.model.ProjectDocModel;
import in.gov.rera.transaction.projectregistration.model.ProjectMemberDetailsModel;
import in.gov.rera.transaction.projectregistration.model.ProjectPaymentDetailsModel;
import in.gov.rera.transaction.projectregistration.model.ProjectRegistrationModel;
import in.gov.rera.transaction.projectregistration.model.StructuralEngineerDetailsModel;
import in.gov.rera.transaction.projectregistration.service.IProjectRegistrationService;

@Service(value = "promoterRegistrationService")
@Scope("request")
public class ProjectRegistrationServiceImpl implements IProjectRegistrationService {
	static Logger log = Logger.getLogger(ProjectRegistrationServiceImpl.class);

	@Autowired
	IDistrictDAO<DistrictModel, Long> districtDAO;

	@Autowired
	ContentUtil contentUtil;

	@Autowired(required = true)
	IDocumentService<Document, Integer> documentService;

	@Autowired(required = true)
	IPrevoiuProjectDao<PerviousProjectDetailsModel, Long> preProjectDao;

	@Autowired
	IProjectContractorDAO<ProjectContratorDetailsModel, Long> projectContractorDao;
	@Autowired
	IProjectMemberDao<ProjectMemberDetailsModel, Long> projectMemberDao;
	@Autowired
	IStructuralEngneerDAO<StructuralEngineerDetailsModel, Long> structuralEngneerDAO;
	@Autowired
	IBlackListDao<ProjectMemberDetailsModel, Long> blackListDao;
	@Autowired
	IDevelopmentDetailsDAO<DevelopmentDetailsModel, Long> developmentDao;
	@Autowired
	IProjectArchitectDAO<ProjectArchitectDetailsModel, Long> projectArchitectDao;

	@Autowired
	HttpSession httpSession;

	@Autowired
	IProjectRegistrationDAO<ProjectRegistrationModel, Long> promoterRegistrationDAO;

	@Override

	public Long createProjectRegistration(ProjectRegistrationModel enitity) throws Exception {
		return promoterRegistrationDAO.save(enitity);
	}

	@Override

	public ProjectRegistrationModel getProjectRegByPk(Long pk) throws Exception {
		return promoterRegistrationDAO.get(pk);
	}

	@Override

	public Long editProjectRegistration(ProjectRegistrationModel enitity) throws Exception {
		promoterRegistrationDAO.update(enitity);
		return enitity.getProjectRegId();
	}

	public void saveDelayedCert(ProjectRegistrationModel project, MultipartFile cert) throws Exception {

		if (project.getProjectDetailsModel().getIsDelayed() != null
				&& project.getProjectDetailsModel().getIsDelayed().equals("Yes") && cert != null
				&& cert.getSize() > 20) {
			Document doc = null;
			if (project.getProjectDetailsModel().getDelayedCertDoc() != null) {
				doc = project.getProjectDetailsModel().getDelayedCertDoc();
				doc.setFileName(cert.getOriginalFilename());
				doc.setMimeType(cert.getContentType());
				doc.setInputStream(cert.getInputStream());
				contentUtil.saveDocument(doc);
				documentService.updateDoc(doc);
			} else {
				doc = new Document();
				doc.setFileName(cert.getOriginalFilename());
				doc.setDocumentType("POJECT_REG");
				doc.setFolderId("" + project.getProjectRegId());
				doc.setMimeType(cert.getContentType());
				doc.setInputStream(cert.getInputStream());
				contentUtil.saveDocument(doc);
				documentService.saveDoc(doc);

			}
			project.getProjectDetailsModel().setDelayedCertDoc(doc);
		}
	}

	@Override
	public ProjectRegistrationModel saveOrUpdateProjectPhotoDoc(MultipartFile[] projectPhoto, MultipartFile[] otherFile,
			String[] fieldNameArr, ProjectRegistrationModel baseModel, Integer flg, Long proDocId) throws Exception {

		Document document = null;
		Long projectId = baseModel.getProjectRegId();

		ProjectDocModel projDoc = new ProjectDocModel();
		baseModel.setProjectDocModel(projDoc);

		ProjectAdditionalFileDocModel additionalDoc = new ProjectAdditionalFileDocModel();

		// ProjectNewFileDocModel projNewFileDoc = new ProjectNewFileDocModel();
		// baseModel.setProjectNewFileDocModel(projNewFileDoc);

		for (int i = 0; i < otherFile.length; i++) {
			MultipartFile fileObj = otherFile[i];
			if (fileObj.getSize() > 0) {
				document = new Document();

				document.setInputStream(fileObj.getInputStream());
				document.setDocumentName(fileObj.getOriginalFilename());
				document.setDocumentType("PROJECT_REG");
				document.setFileName(fileObj.getOriginalFilename());
				document.setMimeType(fileObj.getContentType());
				document.setFolderId(String.valueOf(projectId));
				contentUtil.saveDocument(document);
				documentService.saveDoc(document);
				if (fieldNameArr[i].equalsIgnoreCase("panCardDoc")) {

					projDoc.setPanCardDoc(document);

				}
				// --auditedBalSheetDoc1
				if (fieldNameArr[i].equalsIgnoreCase("auditedBalSheetDoc1")) {
					projDoc.setAuditedBalSheetYear1(String.valueOf(DateUtil.getYearBack(1)));
					projDoc.setAuditedBalSheetDoc1(document);
				}

				if (fieldNameArr[i].equalsIgnoreCase("auditedBalSheetDoc2")) {
					projDoc.setAuditedBalSheetYear2(String.valueOf(DateUtil.getYearBack(2)));
					projDoc.setAuditedBalSheetDoc2(document);
				}
				if (fieldNameArr[i].equalsIgnoreCase("auditedBalSheetDoc3")) {
					projDoc.setAuditedBalSheetYear3(String.valueOf(DateUtil.getYearBack(3)));
					projDoc.setAuditedBalSheetDoc3(document);
				}

				if (fieldNameArr[i].equalsIgnoreCase("auditorsDoc1")) {
					projDoc.setAuditorsDoc1(document);
				}
				if (fieldNameArr[i].equalsIgnoreCase("auditorsDoc2")) {
					projDoc.setAuditorsDoc2(document);
				}
				if (fieldNameArr[i].equalsIgnoreCase("auditorsDoc3")) {
					projDoc.setAuditorsDoc3(document);
				}

				if (fieldNameArr[i].equalsIgnoreCase("incomeTaxReturn1")) {
					projDoc.setIncomeTaxReturn1(document);
				}
				if (fieldNameArr[i].equalsIgnoreCase("incomeTaxReturn2")) {
					projDoc.setIncomeTaxReturn2(document);
				}
				if (fieldNameArr[i].equalsIgnoreCase("incomeTaxReturn3")) {
					projDoc.setIncomeTaxReturn3(document);
				}

				// auditedProfitLossSheetDoc1

				if (fieldNameArr[i].equalsIgnoreCase("auditedProfitLossSheetDoc1")) {
					projDoc.setAuditedProfitLossSheetYear1(String.valueOf(DateUtil.getYearBack(1)));
					projDoc.setAuditedProfitLossSheetDoc1(document);

				}
				if (fieldNameArr[i].equalsIgnoreCase("auditedProfitLossSheetDoc2")) {
					projDoc.setAuditedProfitLossSheetDoc2(document);
					projDoc.setAuditedProfitLossSheetYear2(String.valueOf(DateUtil.getYearBack(2)));

				}
				if (fieldNameArr[i].equalsIgnoreCase("auditedProfitLossSheetDoc3")) {
					projDoc.setAuditedProfitLossSheetYear3(String.valueOf(DateUtil.getYearBack(3)));
					projDoc.setAuditedProfitLossSheetDoc3(document);

				}
				// -----CASH FLOW

				if (fieldNameArr[i].equalsIgnoreCase("cashFlowStmtFileDoc1")) {
					projDoc.setCashFlowStmtYear1(String.valueOf(DateUtil.getYearBack(1)));
					projDoc.setCashFlowStmtFileDoc1(document);

				}

				if (fieldNameArr[i].equalsIgnoreCase("cashFlowStmtFileDoc2")) {
					projDoc.setCashFlowStmtYear2(String.valueOf(DateUtil.getYearBack(2)));
					projDoc.setCashFlowStmtFileDoc2(document);

				}
				if (fieldNameArr[i].equalsIgnoreCase("cashFlowStmtFileDoc3")) {
					projDoc.setCashFlowStmtYear3(String.valueOf(DateUtil.getYearBack(3)));
					projDoc.setCashFlowStmtFileDoc3(document);

				}

				// --directorReportDoc

				if (fieldNameArr[i].equalsIgnoreCase("directorReportDoc1")) {
					projDoc.setDirectorReportYear1(String.valueOf(DateUtil.getYearBack(1)));
					projDoc.setDirectorReportDoc1(document);

				}
				if (fieldNameArr[i].equalsIgnoreCase("directorReportDoc2")) {
					projDoc.setDirectorReportYear2(String.valueOf(DateUtil.getYearBack(2)));
					projDoc.setDirectorReportDoc2(document);

				}
				if (fieldNameArr[i].equalsIgnoreCase("directorReportDoc3")) {
					projDoc.setDirectorReportYear3(String.valueOf(DateUtil.getYearBack(3)));
					projDoc.setDirectorReportDoc3(document);

				}
				//// AUDITED REPORT

				if (fieldNameArr[i].equalsIgnoreCase("auditedReportDocId1")) {
					projDoc.setAuditedReportYear1(String.valueOf(DateUtil.getYearBack(1)));
					projDoc.setAuditedReportDocId1(document);

				}
				if (fieldNameArr[i].equalsIgnoreCase("auditedReportDocId2")) {
					projDoc.setAuditedReportYear2(String.valueOf(DateUtil.getYearBack(2)));
					projDoc.setAuditedReportDocId2(document);

				}
				if (fieldNameArr[i].equalsIgnoreCase("auditedReportDocId3")) {
					projDoc.setAuditedReportYear3(String.valueOf(DateUtil.getYearBack(3)));
					projDoc.setAuditedReportDocId3(document);

				}

				// END

				if (fieldNameArr[i].equalsIgnoreCase("encumbranceCertificateDoc")) {
					projDoc.setEncumbranceCertificateDoc(document);

				}

				if (fieldNameArr[i].equalsIgnoreCase("commencementCertDoc")) {
					projDoc.setCommencementCertDoc(document);

				}
				if (fieldNameArr[i].equalsIgnoreCase("projectSpecificDoc")) {
					projDoc.setProjectSpecificDoc(document);

				}
				if (fieldNameArr[i].equalsIgnoreCase("approveSacPlanDoc")) {
					projDoc.setApproveSacPlanDoc(document);

				}
				if (fieldNameArr[i].equalsIgnoreCase("approveLayoutPlanDoc")) {
					projDoc.setApproveLayoutPlanDoc(document);

				}
				if (fieldNameArr[i].equalsIgnoreCase("agreementFileDoc")) {
					projDoc.setAgreementFileDoc(document);

				}
				if (fieldNameArr[i].equalsIgnoreCase("landLocationFileDoc")) {
					projDoc.setLandLocationFileDoc(document);

				}
				if (fieldNameArr[i].equalsIgnoreCase("sanctionedLayoutPlanDoc")) {
					projDoc.setSanctionedLayoutPlanDoc(document);

				}
				if (fieldNameArr[i].equalsIgnoreCase("areaDevelopmentDoc")) {
					projDoc.setAreaDevelopmentDoc(document);

				}
				if (fieldNameArr[i].equalsIgnoreCase("performaOfAllotmentLetterDoc")) {
					projDoc.setPerformaOfAllotmentLetterDoc(document);

				}

				if (fieldNameArr[i].equalsIgnoreCase("performaForSaleOfAgreement")) {
					projDoc.setPerformaForSaleOfAgreement(document);

				}

				if (fieldNameArr[i].equalsIgnoreCase("brochureOfCurrentProjectDoc")) {
					projDoc.setBrochureOfCurrentProjectDoc(document);

				}
				if (fieldNameArr[i].equalsIgnoreCase("projectRelatedDoc")) {
					projDoc.setProjectRelatedDoc(document);

				}
				if (fieldNameArr[i].equalsIgnoreCase("declarationFormbDoc")) {
					projDoc.setDeclarationFormbDoc(document);

				}
				if (fieldNameArr[i].equalsIgnoreCase("photoGraphDoc")) {
					projDoc.setPhotoGraphDoc(document);

				}

				if (fieldNameArr[i].equalsIgnoreCase("extendedLayoutPlanDoc")) {
					projDoc.setExtendedLayoutPlanDoc(document);

				}
				if (fieldNameArr[i].equalsIgnoreCase("extendedSacPlanDoc")) {
					projDoc.setExtendedSacPlanDoc(document);

				}
				if (fieldNameArr[i].equalsIgnoreCase("titleDeed")) {
					projDoc.setTitleDeed(document);

				}

				if (fieldNameArr[i].equalsIgnoreCase("jointDevelopmentAgreement")) {
					projDoc.setJointDevelopmentAgreement(document);

				}
				if (fieldNameArr[i].equalsIgnoreCase("existingLayoutPlan")) {
					projDoc.setExistingLayoutPlan(document);

				}
				if (fieldNameArr[i].equalsIgnoreCase("existingSectionPlanandSpec")) {
					projDoc.setExistingSectionPlanandSpec(document);

				}
				if (fieldNameArr[i].equalsIgnoreCase("changeOfLandUse")) {
					projDoc.setChangeOfLandUse(document);

				}

				if (fieldNameArr[i].equalsIgnoreCase("conveyanceDeed")) {
					projDoc.setConveyanceDeed(document);

				}

				if (fieldNameArr[i].equalsIgnoreCase("section109")) {
					additionalDoc.setSection109(document);

				}

				if (fieldNameArr[i].equalsIgnoreCase("section95")) {
					additionalDoc.setSection95(document);

				}

				if (fieldNameArr[i].equalsIgnoreCase("section14")) {
					additionalDoc.setSection14(document);

				}

				if (fieldNameArr[i].equalsIgnoreCase("anyOtherDoc")) {
					additionalDoc.setAnyOtherDoc(document);

				}

				// Added by Suneetha

				if (fieldNameArr[i].equalsIgnoreCase("utilisationCert")) {
					additionalDoc.setUtilisationCert(document);

				}
				if (fieldNameArr[i].equalsIgnoreCase("transferOfDevRightsCert")) {
					additionalDoc.setTransferOfDevRightsCert(document);

				}
				if (fieldNameArr[i].equalsIgnoreCase("relinquishmenDeed")) {
					additionalDoc.setRelinquishmenDeed(document);

				}
				if (fieldNameArr[i].equalsIgnoreCase("fireForceDept")) {
					additionalDoc.setFireForceDept(document);

				}
				if (fieldNameArr[i].equalsIgnoreCase("airportAuthorityOfIndia")) {
					additionalDoc.setAirportAuthorityOfIndia(document);

				}
				if (fieldNameArr[i].equalsIgnoreCase("bescom")) {
					additionalDoc.setBescom(document);

				}
				if (fieldNameArr[i].equalsIgnoreCase("bwssb")) {
					additionalDoc.setBwssb(document);

				}
				if (fieldNameArr[i].equalsIgnoreCase("kspcb")) {
					additionalDoc.setKspcb(document);

				}
				if (fieldNameArr[i].equalsIgnoreCase("seiaa")) {
					additionalDoc.setSeiaa(document);

				}
				if (fieldNameArr[i].equalsIgnoreCase("bsnl")) {
					additionalDoc.setBsnl(document);

				}
				if (fieldNameArr[i].equalsIgnoreCase("sectionalDrawingOfTheApartments")) {
					additionalDoc.setSectionalDrawingOfTheApartments(document);

				}
				if (fieldNameArr[i].equalsIgnoreCase("bmrcl")) {
					additionalDoc.setBmrcl(document);

				}

				if (fieldNameArr[i].equalsIgnoreCase("nocBuildingAbuttingToNeighbourProperties")) {
					additionalDoc.setNocBuildingAbuttingToNeighbourProperties(document);

				}
				if (fieldNameArr[i].equalsIgnoreCase("liftAuthorities")) {
					additionalDoc.setLiftAuthorities(document);

				}

				if (fieldNameArr[i].equalsIgnoreCase("bangaloreUrbanArtsCommission")) {
					additionalDoc.setBangaloreUrbanArtsCommission(document);

				}
				if (fieldNameArr[i].equalsIgnoreCase("urbanLandCeiling")) {
					additionalDoc.setUrbanLandCeiling(document);

				}

				if (fieldNameArr[i].equalsIgnoreCase("advocatesearchreport")) {
					additionalDoc.setAdvocatesearchreport(document);

				}
				if (fieldNameArr[i].equalsIgnoreCase("inspectorOfFactoriesCntrlOfExplosivesRailways")) {
					additionalDoc.setInspectorOfFactoriesCntrlOfExplosivesRailways(document);

				}
				if (fieldNameArr[i].equalsIgnoreCase("distMagistrate")) {
					additionalDoc.setDistMagistrate(document);

				}
				if (fieldNameArr[i].equalsIgnoreCase("coastalRegulationZoneAuthority")) {
					additionalDoc.setCoastalRegulationZoneAuthority(document);

				}
				if (fieldNameArr[i].equalsIgnoreCase("engrIndicateStructural")) {
					additionalDoc.setEngrIndicateStructural(document);

				}
				if (fieldNameArr[i].equalsIgnoreCase("rejectReasonDoc")) {
					additionalDoc.setRejectReasonDoc(document);
				}

			}

		}
		baseModel.setProjectAddDocModel(additionalDoc);
		return saveProjectPhoto(projectPhoto, baseModel);

	}

	@Override

	public ProjectRegistrationModel updateProjectPhotoDoc(String[] photoId, MultipartFile[] projectPhoto,
			MultipartFile[] otherFile, String[] fieldNameArr, ProjectRegistrationModel baseModel) throws Exception {

		Document document = null;
		Long projectId = baseModel.getProjectRegId();
		ProjectDocModel projDoc = baseModel.getProjectDocModel();

		ProjectAdditionalFileDocModel additionalDocs = baseModel.getProjectAddDocModel();

		ProjectPaymentDetailsModel penaltyDtls = baseModel.getPaymentDetailsModel();

		if (additionalDocs == null) {
			additionalDocs = new ProjectAdditionalFileDocModel();
			baseModel.setProjectAddDocModel(additionalDocs);
		}

		// ProjectNewFileDocModel projNewFileDoc =
		// baseModel.getProjectNewFileDocModel();

		for (int i = 0; i < otherFile.length; i++) {
			MultipartFile fileObj = otherFile[i];
			if (fileObj.getSize() > 0) {
				document = new Document();

				document.setInputStream(fileObj.getInputStream());
				document.setDocumentName(fileObj.getOriginalFilename());
				document.setDocumentType("PROJECT_REG");
				document.setFileName(fileObj.getOriginalFilename());
				document.setMimeType(fileObj.getContentType());
				document.setFolderId(String.valueOf(projectId));
				contentUtil.saveDocument(document);
				documentService.saveDoc(document);
				if (fieldNameArr[i].equalsIgnoreCase("panCardDoc")) {

					projDoc.setPanCardDoc(document);

				}
				// --auditedBalSheetDoc1

				if (fieldNameArr[i].equalsIgnoreCase("auditorsDoc1") && !fileObj.isEmpty()) {

					document = projDoc.getAuditorsDoc1();
					document.setFileName(fileObj.getOriginalFilename());
					document.setMimeType(fileObj.getContentType());
					document.setInputStream(fileObj.getInputStream());
					contentUtil.saveDocument(document);
					documentService.updateDoc(document);
				} else if (fieldNameArr[i].equalsIgnoreCase("auditorsDoc2") && !fileObj.isEmpty()) {
					document = projDoc.getAuditorsDoc2();
					document.setFileName(fileObj.getOriginalFilename());
					document.setMimeType(fileObj.getContentType());
					document.setInputStream(fileObj.getInputStream());
					contentUtil.saveDocument(document);
					documentService.updateDoc(document);
				} else if (fieldNameArr[i].equalsIgnoreCase("auditorsDoc3") && !fileObj.isEmpty()) {
					document = projDoc.getAuditorsDoc3();
					document.setFileName(fileObj.getOriginalFilename());
					document.setMimeType(fileObj.getContentType());
					document.setInputStream(fileObj.getInputStream());
					contentUtil.saveDocument(document);
					documentService.updateDoc(document);
				} else

				if (fieldNameArr[i].equalsIgnoreCase("incomeTaxReturn1") && !fileObj.isEmpty()) {
					document = projDoc.getIncomeTaxReturn1();
					document.setFileName(fileObj.getOriginalFilename());
					document.setMimeType(fileObj.getContentType());
					document.setInputStream(fileObj.getInputStream());
					contentUtil.saveDocument(document);
					documentService.updateDoc(document);
				} else if (fieldNameArr[i].equalsIgnoreCase("incomeTaxReturn2") && !fileObj.isEmpty()) {
					document = projDoc.getIncomeTaxReturn2();
					document.setFileName(fileObj.getOriginalFilename());
					document.setMimeType(fileObj.getContentType());
					document.setInputStream(fileObj.getInputStream());
					contentUtil.saveDocument(document);
					documentService.updateDoc(document);
				} else if (fieldNameArr[i].equalsIgnoreCase("incomeTaxReturn3") && !fileObj.isEmpty()) {
					document = projDoc.getIncomeTaxReturn3();
					document.setFileName(fileObj.getOriginalFilename());
					document.setMimeType(fileObj.getContentType());
					document.setInputStream(fileObj.getInputStream());
					contentUtil.saveDocument(document);
					documentService.updateDoc(document);
				} else if (fieldNameArr[i].equalsIgnoreCase("auditedBalSheetDoc1") && !fileObj.isEmpty()) {
					document = projDoc.getAuditedBalSheetDoc1();
					document.setFileName(fileObj.getOriginalFilename());
					document.setMimeType(fileObj.getContentType());
					document.setInputStream(fileObj.getInputStream());
					contentUtil.saveDocument(document);
					documentService.updateDoc(document);

				} else if (fieldNameArr[i].equalsIgnoreCase("auditedBalSheetDoc2") && !fileObj.isEmpty()) {
					document = projDoc.getAuditedBalSheetDoc2();
					document.setFileName(fileObj.getOriginalFilename());
					document.setMimeType(fileObj.getContentType());
					document.setInputStream(fileObj.getInputStream());
					contentUtil.saveDocument(document);
					documentService.updateDoc(document);
				} else if (fieldNameArr[i].equalsIgnoreCase("auditedBalSheetDoc3") && !fileObj.isEmpty()) {
					document = projDoc.getAuditedBalSheetDoc3();
					document.setFileName(fileObj.getOriginalFilename());
					document.setMimeType(fileObj.getContentType());
					document.setInputStream(fileObj.getInputStream());
					contentUtil.saveDocument(document);
					documentService.updateDoc(document);
				} else if (fieldNameArr[i].equalsIgnoreCase("auditedProfitLossSheetDoc1") && !fileObj.isEmpty()) {
					document = projDoc.getAuditedProfitLossSheetDoc1();
					document.setFileName(fileObj.getOriginalFilename());
					document.setMimeType(fileObj.getContentType());
					document.setInputStream(fileObj.getInputStream());
					contentUtil.saveDocument(document);
					documentService.updateDoc(document);

				} else if (fieldNameArr[i].equalsIgnoreCase("auditedProfitLossSheetDoc2") && !fileObj.isEmpty()) {
					document = projDoc.getAuditedProfitLossSheetDoc2();
					document.setFileName(fileObj.getOriginalFilename());
					document.setMimeType(fileObj.getContentType());
					document.setInputStream(fileObj.getInputStream());
					contentUtil.saveDocument(document);
					documentService.updateDoc(document);

				} else if (fieldNameArr[i].equalsIgnoreCase("auditedProfitLossSheetDoc3") && !fileObj.isEmpty()) {
					document = projDoc.getAuditedProfitLossSheetDoc3();
					document.setFileName(fileObj.getOriginalFilename());
					document.setMimeType(fileObj.getContentType());
					document.setInputStream(fileObj.getInputStream());
					contentUtil.saveDocument(document);
					documentService.updateDoc(document);

				} else if (fieldNameArr[i].equalsIgnoreCase("cashFlowStmtFileDoc1") && !fileObj.isEmpty()) {
					document = projDoc.getCashFlowStmtFileDoc1();
					document.setFileName(fileObj.getOriginalFilename());
					document.setMimeType(fileObj.getContentType());
					document.setInputStream(fileObj.getInputStream());
					contentUtil.saveDocument(document);
					documentService.updateDoc(document);

				} else if (fieldNameArr[i].equalsIgnoreCase("cashFlowStmtFileDoc2") && !fileObj.isEmpty()) {
					document = projDoc.getCashFlowStmtFileDoc2();
					document.setFileName(fileObj.getOriginalFilename());
					document.setMimeType(fileObj.getContentType());
					document.setInputStream(fileObj.getInputStream());
					contentUtil.saveDocument(document);
					documentService.updateDoc(document);

				} else if (fieldNameArr[i].equalsIgnoreCase("cashFlowStmtFileDoc3") && !fileObj.isEmpty()) {
					document = projDoc.getCashFlowStmtFileDoc3();
					document.setFileName(fileObj.getOriginalFilename());
					document.setMimeType(fileObj.getContentType());
					document.setInputStream(fileObj.getInputStream());
					contentUtil.saveDocument(document);
					documentService.updateDoc(document);

				} else if (fieldNameArr[i].equalsIgnoreCase("directorReportDoc1") && !fileObj.isEmpty()) {

					document = projDoc.getDirectorReportDoc1();
					document.setFileName(fileObj.getOriginalFilename());
					document.setMimeType(fileObj.getContentType());
					document.setInputStream(fileObj.getInputStream());
					contentUtil.saveDocument(document);
					documentService.updateDoc(document);

				}
				if (fieldNameArr[i].equalsIgnoreCase("directorReportDoc2") && !fileObj.isEmpty()) {
					document = projDoc.getDirectorReportDoc2();
					document.setFileName(fileObj.getOriginalFilename());
					document.setMimeType(fileObj.getContentType());
					document.setInputStream(fileObj.getInputStream());
					contentUtil.saveDocument(document);
					documentService.updateDoc(document);

				} else if (fieldNameArr[i].equalsIgnoreCase("directorReportDoc3") && !fileObj.isEmpty()) {
					document = projDoc.getDirectorReportDoc3();
					document.setFileName(fileObj.getOriginalFilename());
					document.setMimeType(fileObj.getContentType());
					document.setInputStream(fileObj.getInputStream());
					contentUtil.saveDocument(document);
					documentService.updateDoc(document);

				} else if (fieldNameArr[i].equalsIgnoreCase("auditedReportDocId1") && !fileObj.isEmpty()) {
					document = projDoc.getAuditedReportDocId1();
					document.setFileName(fileObj.getOriginalFilename());
					document.setMimeType(fileObj.getContentType());
					document.setInputStream(fileObj.getInputStream());
					contentUtil.saveDocument(document);
					documentService.updateDoc(document);

				} else if (fieldNameArr[i].equalsIgnoreCase("auditedReportDocId2") && !fileObj.isEmpty()) {
					document = projDoc.getAuditedReportDocId2();
					document.setFileName(fileObj.getOriginalFilename());
					document.setMimeType(fileObj.getContentType());
					document.setInputStream(fileObj.getInputStream());
					contentUtil.saveDocument(document);
					documentService.updateDoc(document);

				} else if (fieldNameArr[i].equalsIgnoreCase("auditedReportDocId3") && !fileObj.isEmpty()) {
					document = projDoc.getAuditedReportDocId3();
					document.setFileName(fileObj.getOriginalFilename());
					document.setMimeType(fileObj.getContentType());
					document.setInputStream(fileObj.getInputStream());
					contentUtil.saveDocument(document);
					documentService.updateDoc(document);

				} else if (fieldNameArr[i].equalsIgnoreCase("commencementCertDoc") && !fileObj.isEmpty()) {
					document = projDoc.getCommencementCertDoc();
					document.setFileName(fileObj.getOriginalFilename());
					document.setMimeType(fileObj.getContentType());
					document.setInputStream(fileObj.getInputStream());
					contentUtil.saveDocument(document);
					documentService.updateDoc(document);

				} else if (fieldNameArr[i].equalsIgnoreCase("approveSacPlanDoc") && !fileObj.isEmpty()) {
					document = projDoc.getApproveSacPlanDoc();
					document.setFileName(fileObj.getOriginalFilename());
					document.setMimeType(fileObj.getContentType());
					document.setInputStream(fileObj.getInputStream());
					contentUtil.saveDocument(document);
					documentService.updateDoc(document);

				} else if (fieldNameArr[i].equalsIgnoreCase("approveLayoutPlanDoc") && !fileObj.isEmpty()) {
					document = projDoc.getApproveLayoutPlanDoc();
					document.setFileName(fileObj.getOriginalFilename());
					document.setMimeType(fileObj.getContentType());
					document.setInputStream(fileObj.getInputStream());
					contentUtil.saveDocument(document);
					documentService.updateDoc(document);

				} else if (fieldNameArr[i].equalsIgnoreCase("agreementFileDoc") && !fileObj.isEmpty()) {
					document = projDoc.getAgreementFileDoc();
					document.setFileName(fileObj.getOriginalFilename());
					document.setMimeType(fileObj.getContentType());
					document.setInputStream(fileObj.getInputStream());
					contentUtil.saveDocument(document);
					documentService.updateDoc(document);

				} else if (fieldNameArr[i].equalsIgnoreCase("landLocationFileDoc") && !fileObj.isEmpty()) {
					document = projDoc.getLandLocationFileDoc();
					document.setFileName(fileObj.getOriginalFilename());
					document.setMimeType(fileObj.getContentType());
					document.setInputStream(fileObj.getInputStream());
					contentUtil.saveDocument(document);
					documentService.updateDoc(document);

				} else if (fieldNameArr[i].equalsIgnoreCase("encumbranceCertificateDoc") && !fileObj.isEmpty()) {

					document = projDoc.getEncumbranceCertificateDoc();
					document.setFileName(fileObj.getOriginalFilename());
					document.setMimeType(fileObj.getContentType());
					document.setInputStream(fileObj.getInputStream());
					contentUtil.saveDocument(document);
					documentService.updateDoc(document);

				}

				else if (fieldNameArr[i].equalsIgnoreCase("sanctionedLayoutPlanDoc") && !fileObj.isEmpty()) {
					document = projDoc.getSanctionedLayoutPlanDoc();
					document.setFileName(fileObj.getOriginalFilename());
					document.setMimeType(fileObj.getContentType());
					document.setInputStream(fileObj.getInputStream());
					contentUtil.saveDocument(document);
					documentService.updateDoc(document);

				} else if (fieldNameArr[i].equalsIgnoreCase("areaDevelopmentDoc") && !fileObj.isEmpty()) {
					document = projDoc.getAreaDevelopmentDoc();
					document.setFileName(fileObj.getOriginalFilename());
					document.setMimeType(fileObj.getContentType());
					document.setInputStream(fileObj.getInputStream());
					contentUtil.saveDocument(document);
					documentService.updateDoc(document);

				} else if (fieldNameArr[i].equalsIgnoreCase("performaOfAllotmentLetterDoc") && !fileObj.isEmpty()) {
					document = projDoc.getPerformaOfAllotmentLetterDoc();
					document.setFileName(fileObj.getOriginalFilename());
					document.setMimeType(fileObj.getContentType());
					document.setInputStream(fileObj.getInputStream());
					contentUtil.saveDocument(document);
					documentService.updateDoc(document);

				} else if (fieldNameArr[i].equalsIgnoreCase("performaForSaleOfAgreement") && !fileObj.isEmpty()) {
					document = projDoc.getPerformaForSaleOfAgreement();
					document.setFileName(fileObj.getOriginalFilename());
					document.setMimeType(fileObj.getContentType());
					document.setInputStream(fileObj.getInputStream());
					contentUtil.saveDocument(document);
					documentService.updateDoc(document);

				} else if (fieldNameArr[i].equalsIgnoreCase("brochureOfCurrentProjectDoc") && !fileObj.isEmpty()) {
					document = projDoc.getBrochureOfCurrentProjectDoc();
					document.setFileName(fileObj.getOriginalFilename());
					document.setMimeType(fileObj.getContentType());
					document.setInputStream(fileObj.getInputStream());
					contentUtil.saveDocument(document);
					documentService.updateDoc(document);

				} else if (fieldNameArr[i].equalsIgnoreCase("projectRelatedDoc") && !fileObj.isEmpty()) {
					document = projDoc.getProjectRelatedDoc();
					document.setFileName(fileObj.getOriginalFilename());
					document.setMimeType(fileObj.getContentType());
					document.setInputStream(fileObj.getInputStream());
					contentUtil.saveDocument(document);
					documentService.updateDoc(document);

				} else if (fieldNameArr[i].equalsIgnoreCase("projectSpecificDoc") && !fileObj.isEmpty()) {
					document = projDoc.getProjectSpecificDoc();
					document.setFileName(fileObj.getOriginalFilename());
					document.setMimeType(fileObj.getContentType());
					document.setInputStream(fileObj.getInputStream());
					contentUtil.saveDocument(document);
					documentService.updateDoc(document);

				} else if (fieldNameArr[i].equalsIgnoreCase("declarationFormbDoc") && !fileObj.isEmpty()) {
					document = projDoc.getDeclarationFormbDoc();
					document.setFileName(fileObj.getOriginalFilename());
					document.setMimeType(fileObj.getContentType());
					document.setInputStream(fileObj.getInputStream());
					contentUtil.saveDocument(document);
					documentService.updateDoc(document);

				} else if (fieldNameArr[i].equalsIgnoreCase("photoGraphDoc") && !fileObj.isEmpty()) {
					document = projDoc.getPhotoGraphDoc();
					document.setFileName(fileObj.getOriginalFilename());
					document.setMimeType(fileObj.getContentType());
					document.setInputStream(fileObj.getInputStream());
					contentUtil.saveDocument(document);
					documentService.updateDoc(document);

				} else if (fieldNameArr[i].equalsIgnoreCase("extendedLayoutPlanDoc") && !fileObj.isEmpty()) {

					document = projDoc.getExtendedLayoutPlanDoc();
					if (document == null) {
						document = new Document();
						document.setDocumentType("PROJECT_REG");
						document.setFolderId("" + baseModel.getProjectRegId());
						document.setFileName(fileObj.getOriginalFilename());
						document.setMimeType(fileObj.getContentType());
						document.setInputStream(fileObj.getInputStream());
						contentUtil.saveDocument(document);
						documentService.saveDoc(document);
						projDoc.setExtendedLayoutPlanDoc(document);
					} else {
						document.setFileName(fileObj.getOriginalFilename());
						document.setMimeType(fileObj.getContentType());
						document.setInputStream(fileObj.getInputStream());
						contentUtil.saveDocument(document);
						documentService.updateDoc(document);
					}

				} else if (fieldNameArr[i].equalsIgnoreCase("extendedSacPlanDoc") && !fileObj.isEmpty()) {
					document = projDoc.getExtendedSacPlanDoc();
					if (document == null) {
						document = new Document();
						document.setDocumentType("PROJECT_REG");
						document.setFolderId("" + baseModel.getProjectRegId());
						document.setFileName(fileObj.getOriginalFilename());
						document.setMimeType(fileObj.getContentType());
						document.setInputStream(fileObj.getInputStream());
						contentUtil.saveDocument(document);
						documentService.saveDoc(document);
						projDoc.setExtendedSacPlanDoc(document);
					} else {

						document.setFileName(fileObj.getOriginalFilename());
						document.setMimeType(fileObj.getContentType());
						document.setInputStream(fileObj.getInputStream());
						contentUtil.saveDocument(document);
						documentService.updateDoc(document);
					}

				} else if (fieldNameArr[i].equalsIgnoreCase("titleDeed") && !fileObj.isEmpty()) {
					document = projDoc.getTitleDeed();
					document.setFileName(fileObj.getOriginalFilename());
					document.setMimeType(fileObj.getContentType());
					document.setInputStream(fileObj.getInputStream());
					contentUtil.saveDocument(document);
					documentService.updateDoc(document);

				} else if (fieldNameArr[i].equalsIgnoreCase("jointDevelopmentAgreement") && !fileObj.isEmpty()) {
					document = projDoc.getJointDevelopmentAgreement();
					document.setFileName(fileObj.getOriginalFilename());
					document.setMimeType(fileObj.getContentType());
					document.setInputStream(fileObj.getInputStream());
					contentUtil.saveDocument(document);
					documentService.updateDoc(document);

				} else if (fieldNameArr[i].equalsIgnoreCase("existingLayoutPlan") && !fileObj.isEmpty()) {
					document = projDoc.getExistingLayoutPlan();
					document.setFileName(fileObj.getOriginalFilename());
					document.setMimeType(fileObj.getContentType());
					document.setInputStream(fileObj.getInputStream());
					contentUtil.saveDocument(document);
					documentService.updateDoc(document);

				}

				else if (fieldNameArr[i].equalsIgnoreCase("existingSectionPlanandSpec") && !fileObj.isEmpty()) {
					document = projDoc.getExistingSectionPlanandSpec();
					document.setFileName(fileObj.getOriginalFilename());
					document.setMimeType(fileObj.getContentType());
					document.setInputStream(fileObj.getInputStream());
					contentUtil.saveDocument(document);
					documentService.updateDoc(document);

				}

				else if (fieldNameArr[i].equalsIgnoreCase("changeOfLandUse") && !fileObj.isEmpty()) {
					document = projDoc.getChangeOfLandUse();
					if (document != null) {
						document = new Document();
						document.setFileName(fileObj.getOriginalFilename());
						document.setMimeType(fileObj.getContentType());
						document.setInputStream(fileObj.getInputStream());
						document.setDocumentType("PROJECT_REG");
						document.setFolderId(String.valueOf(baseModel.getProjectRegId()));
						contentUtil.saveDocument(document);
						documentService.saveDoc(document);
						projDoc.setChangeOfLandUse(document);
					} else {

						document.setFileName(fileObj.getOriginalFilename());
						document.setMimeType(fileObj.getContentType());
						document.setInputStream(fileObj.getInputStream());
						contentUtil.saveDocument(document);
						documentService.updateDoc(document);
					}
				} else if (fieldNameArr[i].equalsIgnoreCase("section109") && !fileObj.isEmpty()) {
					document = additionalDocs.getSection109();
					if (document != null) {
						document.setFileName(fileObj.getOriginalFilename());
						document.setMimeType(fileObj.getContentType());
						document.setInputStream(fileObj.getInputStream());
						contentUtil.saveDocument(document);
						documentService.updateDoc(document);
					} else {
						document = new Document();
						document.setFileName(fileObj.getOriginalFilename());
						document.setMimeType(fileObj.getContentType());
						document.setInputStream(fileObj.getInputStream());
						document.setDocumentType("PROJECT_REG");
						document.setFolderId(String.valueOf(baseModel.getProjectRegId()));
						contentUtil.saveDocument(document);
						documentService.saveDoc(document);
						additionalDocs.setSection109(document);
					}

				} else if (fieldNameArr[i].equalsIgnoreCase("section95") && !fileObj.isEmpty()) {

					document = additionalDocs.getSection95();
					if (document != null) {
						document.setFileName(fileObj.getOriginalFilename());
						document.setMimeType(fileObj.getContentType());
						document.setInputStream(fileObj.getInputStream());
						contentUtil.saveDocument(document);
						documentService.updateDoc(document);
					} else {
						document = new Document();
						document.setFileName(fileObj.getOriginalFilename());
						document.setMimeType(fileObj.getContentType());
						document.setInputStream(fileObj.getInputStream());
						document.setDocumentType("PROJECT_REG");
						document.setFolderId(String.valueOf(baseModel.getProjectRegId()));
						contentUtil.saveDocument(document);
						documentService.saveDoc(document);
						additionalDocs.setSection95(document);
					}

				} else if (fieldNameArr[i].equalsIgnoreCase("section14") && !fileObj.isEmpty()) {
					document = additionalDocs.getSection14();
					if (document != null) {
						document.setFileName(fileObj.getOriginalFilename());
						document.setMimeType(fileObj.getContentType());
						document.setInputStream(fileObj.getInputStream());
						contentUtil.saveDocument(document);
						documentService.updateDoc(document);
					} else {
						document = new Document();
						document.setFileName(fileObj.getOriginalFilename());
						document.setMimeType(fileObj.getContentType());
						document.setInputStream(fileObj.getInputStream());
						document.setDocumentType("PROJECT_REG");
						document.setFolderId(String.valueOf(baseModel.getProjectRegId()));
						contentUtil.saveDocument(document);
						documentService.saveDoc(document);
						additionalDocs.setSection14(document);
					}

				} else if (fieldNameArr[i].equalsIgnoreCase("anyOtherDoc") && !fileObj.isEmpty()) {
					document = additionalDocs.getAnyOtherDoc();
					if (document != null) {
						document.setFileName(fileObj.getOriginalFilename());
						document.setMimeType(fileObj.getContentType());
						document.setInputStream(fileObj.getInputStream());
						contentUtil.saveDocument(document);
						documentService.updateDoc(document);
					} else {
						document = new Document();
						document.setFileName(fileObj.getOriginalFilename());
						document.setMimeType(fileObj.getContentType());
						document.setInputStream(fileObj.getInputStream());
						document.setDocumentType("PROJECT_REG");
						document.setFolderId(String.valueOf(baseModel.getProjectRegId()));
						contentUtil.saveDocument(document);
						documentService.saveDoc(document);
						additionalDocs.setAnyOtherDoc(document);
					}

				}

				else if (fieldNameArr[i].equalsIgnoreCase("utilisationCert") && !fileObj.isEmpty()) {
					document = additionalDocs.getUtilisationCert();
					if (document != null) {
						document.setFileName(fileObj.getOriginalFilename());
						document.setMimeType(fileObj.getContentType());
						document.setInputStream(fileObj.getInputStream());
						contentUtil.saveDocument(document);
						documentService.updateDoc(document);
					} else {
						document = new Document();
						document.setFileName(fileObj.getOriginalFilename());
						document.setMimeType(fileObj.getContentType());
						document.setInputStream(fileObj.getInputStream());
						document.setDocumentType("PROJECT_REG");
						document.setFolderId(String.valueOf(baseModel.getProjectRegId()));
						contentUtil.saveDocument(document);
						documentService.saveDoc(document);
						additionalDocs.setUtilisationCert(document);
					}

				} else if (fieldNameArr[i].equalsIgnoreCase("transferOfDevRightsCert") && !fileObj.isEmpty()) {
					document = additionalDocs.getTransferOfDevRightsCert();
					if (document != null) {
						document.setFileName(fileObj.getOriginalFilename());
						document.setMimeType(fileObj.getContentType());
						document.setInputStream(fileObj.getInputStream());
						contentUtil.saveDocument(document);
						documentService.updateDoc(document);
					} else {
						document = new Document();
						document.setFileName(fileObj.getOriginalFilename());
						document.setMimeType(fileObj.getContentType());
						document.setInputStream(fileObj.getInputStream());
						document.setDocumentType("PROJECT_REG");
						document.setFolderId(String.valueOf(baseModel.getProjectRegId()));
						contentUtil.saveDocument(document);
						documentService.saveDoc(document);
						additionalDocs.setTransferOfDevRightsCert(document);
					}

				} else if (fieldNameArr[i].equalsIgnoreCase("relinquishmenDeed") && !fileObj.isEmpty()) {
					document = additionalDocs.getRelinquishmenDeed();
					if (document != null) {
						document.setFileName(fileObj.getOriginalFilename());
						document.setMimeType(fileObj.getContentType());
						document.setInputStream(fileObj.getInputStream());
						contentUtil.saveDocument(document);
						documentService.updateDoc(document);
					} else {
						document = new Document();
						document.setFileName(fileObj.getOriginalFilename());
						document.setMimeType(fileObj.getContentType());
						document.setInputStream(fileObj.getInputStream());
						document.setDocumentType("PROJECT_REG");
						document.setFolderId(String.valueOf(baseModel.getProjectRegId()));
						contentUtil.saveDocument(document);
						documentService.saveDoc(document);
						additionalDocs.setRelinquishmenDeed(document);
					}

				}

				else if (fieldNameArr[i].equalsIgnoreCase("fireForceDept") && !fileObj.isEmpty()) {
					document = additionalDocs.getFireForceDept();
					if (document != null) {
						document.setFileName(fileObj.getOriginalFilename());
						document.setMimeType(fileObj.getContentType());
						document.setInputStream(fileObj.getInputStream());
						contentUtil.saveDocument(document);
						documentService.updateDoc(document);
					} else {
						document = new Document();
						document.setFileName(fileObj.getOriginalFilename());
						document.setMimeType(fileObj.getContentType());
						document.setInputStream(fileObj.getInputStream());
						document.setDocumentType("PROJECT_REG");
						document.setFolderId(String.valueOf(baseModel.getProjectRegId()));
						contentUtil.saveDocument(document);
						documentService.saveDoc(document);
						additionalDocs.setFireForceDept(document);
					}

				}

				else if (fieldNameArr[i].equalsIgnoreCase("airportAuthorityOfIndia") && !fileObj.isEmpty()) {
					document = additionalDocs.getAirportAuthorityOfIndia();
					if (document != null) {
						document.setFileName(fileObj.getOriginalFilename());
						document.setMimeType(fileObj.getContentType());
						document.setInputStream(fileObj.getInputStream());
						contentUtil.saveDocument(document);
						documentService.updateDoc(document);
					} else {
						document = new Document();
						document.setFileName(fileObj.getOriginalFilename());
						document.setMimeType(fileObj.getContentType());
						document.setInputStream(fileObj.getInputStream());
						document.setDocumentType("PROJECT_REG");
						document.setFolderId(String.valueOf(baseModel.getProjectRegId()));
						contentUtil.saveDocument(document);
						documentService.saveDoc(document);
						additionalDocs.setAirportAuthorityOfIndia(document);
					}

				}

				else if (fieldNameArr[i].equalsIgnoreCase("bescom") && !fileObj.isEmpty()) {
					document = additionalDocs.getBescom();
					if (document != null) {
						document.setFileName(fileObj.getOriginalFilename());
						document.setMimeType(fileObj.getContentType());
						document.setInputStream(fileObj.getInputStream());
						contentUtil.saveDocument(document);
						documentService.updateDoc(document);
					} else {
						document = new Document();
						document.setFileName(fileObj.getOriginalFilename());
						document.setMimeType(fileObj.getContentType());
						document.setInputStream(fileObj.getInputStream());
						document.setDocumentType("PROJECT_REG");
						document.setFolderId(String.valueOf(baseModel.getProjectRegId()));
						contentUtil.saveDocument(document);
						documentService.saveDoc(document);
						additionalDocs.setBescom(document);
					}

				}

				else if (fieldNameArr[i].equalsIgnoreCase("bwssb") && !fileObj.isEmpty()) {
					document = additionalDocs.getBwssb();
					if (document != null) {
						document.setFileName(fileObj.getOriginalFilename());
						document.setMimeType(fileObj.getContentType());
						document.setInputStream(fileObj.getInputStream());
						contentUtil.saveDocument(document);
						documentService.updateDoc(document);
					} else {
						document = new Document();
						document.setFileName(fileObj.getOriginalFilename());
						document.setMimeType(fileObj.getContentType());
						document.setInputStream(fileObj.getInputStream());
						document.setDocumentType("PROJECT_REG");
						document.setFolderId(String.valueOf(baseModel.getProjectRegId()));
						contentUtil.saveDocument(document);
						documentService.saveDoc(document);
						additionalDocs.setBwssb(document);
					}

				}

				else if (fieldNameArr[i].equalsIgnoreCase("kspcb") && !fileObj.isEmpty()) {
					document = additionalDocs.getKspcb();
					if (document != null) {
						document.setFileName(fileObj.getOriginalFilename());
						document.setMimeType(fileObj.getContentType());
						document.setInputStream(fileObj.getInputStream());
						contentUtil.saveDocument(document);
						documentService.updateDoc(document);
					} else {
						document = new Document();
						document.setFileName(fileObj.getOriginalFilename());
						document.setMimeType(fileObj.getContentType());
						document.setInputStream(fileObj.getInputStream());
						document.setDocumentType("PROJECT_REG");
						document.setFolderId(String.valueOf(baseModel.getProjectRegId()));
						contentUtil.saveDocument(document);
						documentService.saveDoc(document);
						additionalDocs.setKspcb(document);
					}

				}

				else if (fieldNameArr[i].equalsIgnoreCase("seiaa") && !fileObj.isEmpty()) {
					document = additionalDocs.getSeiaa();
					if (document != null) {
						document.setFileName(fileObj.getOriginalFilename());
						document.setMimeType(fileObj.getContentType());
						document.setInputStream(fileObj.getInputStream());
						contentUtil.saveDocument(document);
						documentService.updateDoc(document);
					} else {
						document = new Document();
						document.setFileName(fileObj.getOriginalFilename());
						document.setMimeType(fileObj.getContentType());
						document.setInputStream(fileObj.getInputStream());
						document.setDocumentType("PROJECT_REG");
						document.setFolderId(String.valueOf(baseModel.getProjectRegId()));
						contentUtil.saveDocument(document);
						documentService.saveDoc(document);
						additionalDocs.setSeiaa(document);
					}

				}

				else if (fieldNameArr[i].equalsIgnoreCase("bsnl") && !fileObj.isEmpty()) {
					document = additionalDocs.getBsnl();
					if (document != null) {
						document.setFileName(fileObj.getOriginalFilename());
						document.setMimeType(fileObj.getContentType());
						document.setInputStream(fileObj.getInputStream());
						contentUtil.saveDocument(document);
						documentService.updateDoc(document);
					} else {
						document = new Document();
						document.setFileName(fileObj.getOriginalFilename());
						document.setMimeType(fileObj.getContentType());
						document.setInputStream(fileObj.getInputStream());
						document.setDocumentType("PROJECT_REG");
						document.setFolderId(String.valueOf(baseModel.getProjectRegId()));
						contentUtil.saveDocument(document);
						documentService.saveDoc(document);
						additionalDocs.setBsnl(document);
					}

				}

				else if (fieldNameArr[i].equalsIgnoreCase("bmrcl") && !fileObj.isEmpty()) {
					document = additionalDocs.getBmrcl();
					if (document != null) {
						document.setFileName(fileObj.getOriginalFilename());
						document.setMimeType(fileObj.getContentType());
						document.setInputStream(fileObj.getInputStream());
						contentUtil.saveDocument(document);
						documentService.updateDoc(document);
					} else {
						document = new Document();
						document.setFileName(fileObj.getOriginalFilename());
						document.setMimeType(fileObj.getContentType());
						document.setInputStream(fileObj.getInputStream());
						document.setDocumentType("PROJECT_REG");
						document.setFolderId(String.valueOf(baseModel.getProjectRegId()));
						contentUtil.saveDocument(document);
						documentService.saveDoc(document);
						additionalDocs.setBmrcl(document);
					}

				}

				else if (fieldNameArr[i].equalsIgnoreCase("liftAuthorities") && !fileObj.isEmpty()) {
					document = additionalDocs.getLiftAuthorities();
					if (document != null) {
						document.setFileName(fileObj.getOriginalFilename());
						document.setMimeType(fileObj.getContentType());
						document.setInputStream(fileObj.getInputStream());
						contentUtil.saveDocument(document);
						documentService.updateDoc(document);
					} else {
						document = new Document();
						document.setFileName(fileObj.getOriginalFilename());
						document.setMimeType(fileObj.getContentType());
						document.setInputStream(fileObj.getInputStream());
						document.setDocumentType("PROJECT_REG");
						document.setFolderId(String.valueOf(baseModel.getProjectRegId()));
						contentUtil.saveDocument(document);
						documentService.saveDoc(document);
						additionalDocs.setLiftAuthorities(document);
					}

				}

				else if (fieldNameArr[i].equalsIgnoreCase("nocBuildingAbuttingToNeighbourProperties")
						&& !fileObj.isEmpty()) {
					document = additionalDocs.getNocBuildingAbuttingToNeighbourProperties();
					if (document != null) {
						document.setFileName(fileObj.getOriginalFilename());
						document.setMimeType(fileObj.getContentType());
						document.setInputStream(fileObj.getInputStream());
						contentUtil.saveDocument(document);
						documentService.updateDoc(document);
					} else {
						document = new Document();
						document.setFileName(fileObj.getOriginalFilename());
						document.setMimeType(fileObj.getContentType());
						document.setInputStream(fileObj.getInputStream());
						document.setDocumentType("PROJECT_REG");
						document.setFolderId(String.valueOf(baseModel.getProjectRegId()));
						contentUtil.saveDocument(document);
						documentService.saveDoc(document);
						additionalDocs.setNocBuildingAbuttingToNeighbourProperties(document);
					}

				}

				else if (fieldNameArr[i].equalsIgnoreCase("sectionalDrawingOfTheApartments") && !fileObj.isEmpty()) {
					document = additionalDocs.getSectionalDrawingOfTheApartments();
					if (document != null) {
						document.setFileName(fileObj.getOriginalFilename());
						document.setMimeType(fileObj.getContentType());
						document.setInputStream(fileObj.getInputStream());
						contentUtil.saveDocument(document);
						documentService.updateDoc(document);
					} else {
						document = new Document();
						document.setFileName(fileObj.getOriginalFilename());
						document.setMimeType(fileObj.getContentType());
						document.setInputStream(fileObj.getInputStream());
						document.setDocumentType("PROJECT_REG");
						document.setFolderId(String.valueOf(baseModel.getProjectRegId()));
						contentUtil.saveDocument(document);
						documentService.saveDoc(document);
						additionalDocs.setSectionalDrawingOfTheApartments(document);
					}

				}

				else if (fieldNameArr[i].equalsIgnoreCase("engrIndicateStructural") && !fileObj.isEmpty()) {
					document = additionalDocs.getEngrIndicateStructural();
					if (document != null) {
						document.setFileName(fileObj.getOriginalFilename());
						document.setMimeType(fileObj.getContentType());
						document.setInputStream(fileObj.getInputStream());
						contentUtil.saveDocument(document);
						documentService.updateDoc(document);
					} else {
						document = new Document();
						document.setFileName(fileObj.getOriginalFilename());
						document.setMimeType(fileObj.getContentType());
						document.setInputStream(fileObj.getInputStream());
						document.setDocumentType("PROJECT_REG");
						document.setFolderId(String.valueOf(baseModel.getProjectRegId()));
						contentUtil.saveDocument(document);
						documentService.saveDoc(document);
						additionalDocs.setEngrIndicateStructural(document);
					}

				}

				else if (fieldNameArr[i].equalsIgnoreCase("coastalRegulationZoneAuthority") && !fileObj.isEmpty()) {
					document = additionalDocs.getCoastalRegulationZoneAuthority();
					if (document != null) {
						document.setFileName(fileObj.getOriginalFilename());
						document.setMimeType(fileObj.getContentType());
						document.setInputStream(fileObj.getInputStream());
						contentUtil.saveDocument(document);
						documentService.updateDoc(document);
					} else {
						document = new Document();
						document.setFileName(fileObj.getOriginalFilename());
						document.setMimeType(fileObj.getContentType());
						document.setInputStream(fileObj.getInputStream());
						document.setDocumentType("PROJECT_REG");
						document.setFolderId(String.valueOf(baseModel.getProjectRegId()));
						contentUtil.saveDocument(document);
						documentService.saveDoc(document);
						additionalDocs.setCoastalRegulationZoneAuthority(document);
					}

				} else if (fieldNameArr[i].equalsIgnoreCase("distMagistrate") && !fileObj.isEmpty()) {
					document = additionalDocs.getDistMagistrate();
					if (document != null) {
						document.setFileName(fileObj.getOriginalFilename());
						document.setMimeType(fileObj.getContentType());
						document.setInputStream(fileObj.getInputStream());
						contentUtil.saveDocument(document);
						documentService.updateDoc(document);
					} else {
						document = new Document();
						document.setFileName(fileObj.getOriginalFilename());
						document.setMimeType(fileObj.getContentType());
						document.setInputStream(fileObj.getInputStream());
						document.setDocumentType("PROJECT_REG");
						document.setFolderId(String.valueOf(baseModel.getProjectRegId()));
						contentUtil.saveDocument(document);
						documentService.saveDoc(document);
						additionalDocs.setDistMagistrate(document);
					}

				}

				else if (fieldNameArr[i].equalsIgnoreCase("inspectorOfFactoriesCntrlOfExplosivesRailways")
						&& !fileObj.isEmpty()) {
					document = additionalDocs.getInspectorOfFactoriesCntrlOfExplosivesRailways();
					if (document != null) {
						document.setFileName(fileObj.getOriginalFilename());
						document.setMimeType(fileObj.getContentType());
						document.setInputStream(fileObj.getInputStream());
						contentUtil.saveDocument(document);
						documentService.updateDoc(document);
					} else {
						document = new Document();
						document.setFileName(fileObj.getOriginalFilename());
						document.setMimeType(fileObj.getContentType());
						document.setInputStream(fileObj.getInputStream());
						document.setDocumentType("PROJECT_REG");
						document.setFolderId(String.valueOf(baseModel.getProjectRegId()));
						contentUtil.saveDocument(document);
						documentService.saveDoc(document);
						additionalDocs.setInspectorOfFactoriesCntrlOfExplosivesRailways(document);
					}

				}

				else if (fieldNameArr[i].equalsIgnoreCase("bangaloreUrbanArtsCommission") && !fileObj.isEmpty()) {
					document = additionalDocs.getBangaloreUrbanArtsCommission();
					if (document != null) {
						document.setFileName(fileObj.getOriginalFilename());
						document.setMimeType(fileObj.getContentType());
						document.setInputStream(fileObj.getInputStream());
						contentUtil.saveDocument(document);
						documentService.updateDoc(document);
					} else {
						document = new Document();
						document.setFileName(fileObj.getOriginalFilename());
						document.setMimeType(fileObj.getContentType());
						document.setInputStream(fileObj.getInputStream());
						document.setDocumentType("PROJECT_REG");
						document.setFolderId(String.valueOf(baseModel.getProjectRegId()));
						contentUtil.saveDocument(document);
						documentService.saveDoc(document);
						additionalDocs.setBangaloreUrbanArtsCommission(document);
					}

				}

				else if (fieldNameArr[i].equalsIgnoreCase("urbanLandCeiling") && !fileObj.isEmpty()) {
					document = additionalDocs.getUrbanLandCeiling();
					if (document != null) {
						document.setFileName(fileObj.getOriginalFilename());
						document.setMimeType(fileObj.getContentType());
						document.setInputStream(fileObj.getInputStream());
						contentUtil.saveDocument(document);
						documentService.updateDoc(document);
					} else {
						document = new Document();
						document.setFileName(fileObj.getOriginalFilename());
						document.setMimeType(fileObj.getContentType());
						document.setInputStream(fileObj.getInputStream());
						document.setDocumentType("PROJECT_REG");
						document.setFolderId(String.valueOf(baseModel.getProjectRegId()));
						contentUtil.saveDocument(document);
						documentService.saveDoc(document);
						additionalDocs.setUrbanLandCeiling(document);
					}

				} else if (fieldNameArr[i].equalsIgnoreCase("advocatesearchreport") && !fileObj.isEmpty()) {
					document = additionalDocs.getAdvocatesearchreport();
					if (document != null) {
						document.setFileName(fileObj.getOriginalFilename());
						document.setMimeType(fileObj.getContentType());
						document.setInputStream(fileObj.getInputStream());
						contentUtil.saveDocument(document);
						documentService.updateDoc(document);
					} else {
						document = new Document();
						document.setFileName(fileObj.getOriginalFilename());
						document.setMimeType(fileObj.getContentType());
						document.setInputStream(fileObj.getInputStream());
						document.setDocumentType("PROJECT_REG");
						document.setFolderId(String.valueOf(baseModel.getProjectRegId()));
						contentUtil.saveDocument(document);
						documentService.saveDoc(document);
						additionalDocs.setAdvocatesearchreport(document);
					}

				} else if (fieldNameArr[i].equalsIgnoreCase("rejectReasonDoc") && !fileObj.isEmpty()) {
					document = additionalDocs.getRejectReasonDoc();
					
					if (document == null) {
						document = new Document();
						document.setDocumentType("PROJECT_REG");
						document.setFolderId(String.valueOf(baseModel.getProjectRegId()));
						additionalDocs.setRejectReasonDoc(document);
					}

					document.setFileName(fileObj.getOriginalFilename());
					document.setMimeType(fileObj.getContentType());
					document.setInputStream(fileObj.getInputStream());
					contentUtil.saveDocument(document);
					documentService.updateDoc(document);

				}
			}

		}

		return saveProjectPhoto(projectPhoto, photoId, baseModel);

	}

	private ProjectRegistrationModel saveProjectPhoto(MultipartFile[] projectPhoto, ProjectRegistrationModel baseModel)
			throws Exception {
		Set<Document> projectPhotoDetailSet = new HashSet<Document>();
		if (projectPhoto != null) {
			for (int i = 0; i < projectPhoto.length; i++) {
				MultipartFile fileObj = projectPhoto[i];

				if (fileObj.getSize() > 0) {
					Document document = new Document();
					document.setInputStream(fileObj.getInputStream());
					document.setFileName(fileObj.getOriginalFilename());
					document.setDocumentType("PROJECT_REG");
					document.setMimeType(fileObj.getContentType());
					document.setFolderId(String.valueOf(baseModel.getProjectRegId()));
					contentUtil.saveDocument(document);
					documentService.saveDoc(document);

					projectPhotoDetailSet.add(document);
				}
			}

		}
		baseModel.setProjectPhotoDetailSet(projectPhotoDetailSet);
		return baseModel;
	}

	private ProjectRegistrationModel saveProjectPhoto(MultipartFile[] projectPhoto, String[] projectPhotoId,
			ProjectRegistrationModel baseModel) throws Exception {
		Document document = null;
		if (projectPhoto != null) {
			for (int i = 0; i < projectPhoto.length; i++) {
				MultipartFile fileObj = projectPhoto[i];
				if (!fileObj.isEmpty() && projectPhotoId != null && projectPhotoId.length > i
						&& projectPhotoId[i] != null && projectPhotoId[i].trim().length() > 0) {
					document = documentService.getDoc(Integer.parseInt(projectPhotoId[i].trim()));
					document.setFileName(fileObj.getOriginalFilename());
					document.setInputStream(fileObj.getInputStream());
					document.setMimeType(fileObj.getContentType());
					contentUtil.saveDocument(document);
					documentService.updateDoc(document);

				} else if (!fileObj.isEmpty()) {
					if (baseModel.getProjectPhotoDetailSet() == null) {
						baseModel.setProjectPhotoDetailSet(new HashSet<Document>());
					}
					document = new Document();
					document.setInputStream(fileObj.getInputStream());
					document.setFileName(fileObj.getOriginalFilename());
					document.setDocumentType("PROJECT_REG");
					document.setMimeType(fileObj.getContentType());
					document.setFolderId(String.valueOf(baseModel.getProjectRegId()));
					contentUtil.saveDocument(document);
					documentService.saveDoc(document);
					baseModel.getProjectPhotoDetailSet().add(document);
				}

			}
		}
		return baseModel;
	}

	@Override

	public ProjectRegistrationModel saveUpdateMember(ProjectRegistrationModel model, HttpServletRequest request,
			MultipartFile[] memberPhotoFile) {
		Set<ProjectMemberDetailsModel> set = new HashSet<ProjectMemberDetailsModel>();
		ProjectMemberDetailsModel memberModel = null;
		Document document = null;
		try {
			String[] arr = request.getParameterValues("memberName");
			String[] ids = request.getParameterValues("prjMemberChId");

			for (int i = 0; i < arr.length; i++) {

				if (ids != null && ids[i] != null && ids[i].trim().length() > 0) {
					memberModel = projectMemberDao.getProjectMemberById(Long.parseLong(ids[i]));
					if (memberPhotoFile != null && memberPhotoFile[i] != null && memberPhotoFile[i].getSize() > 20) {
						document = memberModel.getMomberPhotoDoc();
						document.setInputStream(memberPhotoFile[i].getInputStream());
						document.setFileName(memberPhotoFile[i].getOriginalFilename());
						document.setMimeType(memberPhotoFile[i].getContentType());
						contentUtil.saveDocument(document);
						documentService.updateDoc(document);
					}

				} else {
					if (memberPhotoFile != null && memberPhotoFile[i] != null && memberPhotoFile[i].getSize() > 20) {
						document = new Document();
						document.setInputStream(memberPhotoFile[i].getInputStream());
						document.setDocumentType("PROJECT_REG");
						document.setFileName(memberPhotoFile[i].getOriginalFilename());
						document.setMimeType(memberPhotoFile[i].getContentType());
						document.setFolderId(String.valueOf(model.getProjectRegId()));

						contentUtil.saveDocument(document);
						documentService.saveDoc(document);
					}
					memberModel = new ProjectMemberDetailsModel();
					memberModel.setMomberPhotoDoc(document);
					memberModel.setProjectChairmanModel(model.getPromoterDetailsModel().getProjectChairmanModel());

				}

				memberModel.setMemberName(arr[i]);
				memberModel.setMemberType(request.getParameterValues("memberType")[i]);
				memberModel.setEmailId(request.getParameterValues("memberEmailId")[i]);
				memberModel.setMobileNo(request.getParameterValues("memberMobileNo")[i]);
				memberModel.setAddressLine1(request.getParameterValues("memberAddressLine1")[i]);
				memberModel.setAddressLine2(request.getParameterValues("memberAddressLine2")[i]);
				memberModel.setPinCode(request.getParameterValues("memberPinCode")[i]);
				memberModel.setDistrictModel(
						districtDAO.getDistirctById(Long.parseLong(request.getParameterValues("memberDistrictId")[i])));

				set.add(memberModel);
			}

			model.getPromoterDetailsModel().getProjectChairmanModel().setMemberSet(set);
		} catch (Exception ex) {
			log.error(ex.getMessage(), ex);
		}

		return model;

	}

	@Override
	public ProjectRegistrationModel saveProjectPayment(MultipartFile scanCopyMlt,
			ProjectRegistrationModel projectRegistrationModel) throws Exception {
		Document document = new Document();
		document.setInputStream(scanCopyMlt.getInputStream());
		document.setDocumentName(scanCopyMlt.getOriginalFilename());
		document.setDocumentType("PROJECT_REG");
		document.setFileName(scanCopyMlt.getOriginalFilename());
		document.setMimeType(scanCopyMlt.getContentType());
		document.setFolderId(String.valueOf(projectRegistrationModel.getProjectRegId()));
		contentUtil.saveDocument(document);
		documentService.saveDoc(document);
		projectRegistrationModel.getPaymentDetailsModel().setScanCopyDoc(document);
		return projectRegistrationModel;
	}

	/*
	 * 
	 * * projectAddress
	 * 
	 * stateUtId
	 * 
	 * pervProjDistrictId
	 * 
	 * projectAddrPinCode
	 * 
	 * isPaymentPending
	 * 
	 * isCasesPending caseDetails pendingAmount expectedCompletionDate
	 * noOfMonthDelayed completionDocId
	 * 
	 * typeOfLand projectCurrentStatus
	 * 
	 * pervProjectDescription
	 * 
	 * pervProjectName
	 */
	@Override
	public ProjectRegistrationModel saveOrUpdatePromoterCompany(ProjectRegistrationModel projectRegistrationModel,
			MultipartFile multipartFile, HttpServletRequest request, MultipartFile[] completionDocId) throws Exception {
		Set<PerviousProjectDetailsModel> pervRegSet = new HashSet<PerviousProjectDetailsModel>();

		try {

			String[] projextNameArr = request.getParameterValues("pervProjectName");
			String[] projextIdArr = request.getParameterValues("pervProjectRegId");
			PerviousProjectDetailsModel perviousProjectDetailsModel = null;
			httpSession.setAttribute("projextNameArr", projextNameArr.length);
			if (projextNameArr != null && projextNameArr.length > 0) {
				for (int i = 0; i < projextNameArr.length; i++) {
					if (projextNameArr[i] != null) {

						if (projextIdArr != null && projextIdArr.length > i && projextIdArr[i] != null
								&& projextIdArr[i].trim().length() > 0) {
							perviousProjectDetailsModel = preProjectDao
									.getPerviousProjectDetailsModelById(Long.parseLong(projextIdArr[i]));
						} else {
							perviousProjectDetailsModel = new PerviousProjectDetailsModel();
						}
						perviousProjectDetailsModel.setProjectName(request.getParameterValues("pervProjectName")[i]);
						perviousProjectDetailsModel
								.setProjectDescription(request.getParameterValues("pervProjectDescription")[i]);
						perviousProjectDetailsModel
								.setProjectCurrentStatus(request.getParameterValues("projectCurrentStatus")[i]);
						perviousProjectDetailsModel.setTypeOfLand(request.getParameterValues("typeOfLand")[i]);
						Document document = null;
						if (request.getParameterValues("projectCurrentStatus")[i].equalsIgnoreCase("Delay")) {
							perviousProjectDetailsModel
									.setNoOfMonthDelayed(request.getParameterValues("noOfMonthDelayed")[i]);
						} else if (request.getParameterValues("projectCurrentStatus")[i].equalsIgnoreCase("Completed")
								&& completionDocId != null && completionDocId.length > i && completionDocId[i] != null
								&& completionDocId[i].getSize() > 100) {
							if (perviousProjectDetailsModel.getCompletionDocId() != null) {
								document = perviousProjectDetailsModel.getCompletionDocId();
								document.setInputStream(completionDocId[i].getInputStream());
								document.setFileName(completionDocId[i].getOriginalFilename());
								document.setMimeType(completionDocId[i].getContentType());
								contentUtil.saveDocument(document);
								documentService.updateDoc(document);

							} else {
								document = new Document();
								document.setDocumentType("PROJECT_REG");
								document.setFolderId(projectRegistrationModel.getProjectRegId().toString());
								document.setInputStream(completionDocId[i].getInputStream());
								document.setFileName(completionDocId[i].getOriginalFilename());
								document.setMimeType(completionDocId[i].getContentType());
								contentUtil.saveDocument(document);
								documentService.saveDoc(document);
								perviousProjectDetailsModel.setCompletionDocId(document);
							}

						} /*
							 * else{ if (request.getParameterValues(
							 * "expectedCompletionDate") != null) {
							 * SimpleDateFormat sf=new
							 * SimpleDateFormat("dd/MM/yyyy"); //
							 * sf.parse(request.getParameterValues(
							 * "expectedCompletionDate")[i]);
							 * perviousProjectDetailsModel.
							 * setExpectedCompletionDate(Calendar.getInstance())
							 * ;
							 * 
							 * }
							 * 
							 * 
							 * }
							 */

						else {
							if (request.getParameterValues("expectedCompletionDate") != null
									&& request.getParameterValues("expectedCompletionDate")[i] != null) {
								SimpleDateFormat sf = new SimpleDateFormat("dd/MM/yyyy");
								Date dt = sf.parse(request.getParameterValues("expectedCompletionDate")[i]);
								// sf.parse(request.getParameterValues("expectedCompletionDate")[i]);
								Calendar c = Calendar.getInstance();
								c.setTime(dt);
								log.info("expectedCompletionDate  :::::  " + dt);
								perviousProjectDetailsModel.setExpectedCompletionDate(c);

							}

						}

						perviousProjectDetailsModel
								.setIsCasesPending(request.getParameterValues("isCasesPendingFld")[i]);
						if (perviousProjectDetailsModel.getIsCasesPending().equalsIgnoreCase("YES"))
							perviousProjectDetailsModel.setCaseDetails(request.getParameterValues("caseDetails")[i]);

						perviousProjectDetailsModel
								.setIsPaymentPending(request.getParameterValues("isPaymentPendingFld")[i]);
						if (perviousProjectDetailsModel.getIsPaymentPending().equalsIgnoreCase("YES"))
							perviousProjectDetailsModel
									.setPendingAmount(Long.parseLong(request.getParameterValues("pendingAmount")[i]));

						// pervProjDistrictId
						perviousProjectDetailsModel.setDistrictModel(districtDAO
								.getDistirctById(Long.parseLong(request.getParameterValues("pervProjDistrictId")[i])));
						perviousProjectDetailsModel.setProjectAddress(request.getParameterValues("projectAddress")[i]);
						perviousProjectDetailsModel
								.setProjectAddrPinCode(request.getParameterValues("projectAddrPinCode")[i]);
						pervRegSet.add(perviousProjectDetailsModel);
					}
				}
			}

		} catch (Exception ex) {
			log.error(ex.getMessage(), ex);
		}
		projectRegistrationModel.setPreviousProjectDetailsSet(pervRegSet);
		return projectRegistrationModel;
	}

	@Override
	public ProjectRegistrationModel saveOrUpdateInvdPromoterDetails(ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request, MultipartFile[] fileArr, MultipartFile promoterIndiPhoto) throws Exception {
		try {
			Document document = new Document();
			Set<PerviousProjectDetailsModel> pervRegSet = new HashSet<PerviousProjectDetailsModel>();
			String[] projextNameArr = request.getParameterValues("pervProjectName");
			PerviousProjectDetailsModel perviousProjectDetailsModel = null;
			String[] projextIdArr = request.getParameterValues("pervProjectRegId");

			if (projextNameArr != null && projextNameArr.length > 0) {
				for (int i = 0; i < projextNameArr.length; i++) {
					if (projextNameArr[i] != null) {
						if (projextIdArr != null && projextIdArr.length > i && projextIdArr[i] != null
								&& projextIdArr[i].trim().length() > 0) {

							perviousProjectDetailsModel = preProjectDao.getPerviousProjectDetailsModelById(
									Long.parseLong(request.getParameterValues("pervProjectRegId")[i]));
						} else {

							perviousProjectDetailsModel = new PerviousProjectDetailsModel();
						}
						perviousProjectDetailsModel.setProjectName(projextNameArr[i]);
						perviousProjectDetailsModel
								.setProjectDescription(request.getParameterValues("pervProjectDescription")[i]);
						perviousProjectDetailsModel
								.setProjectCurrentStatus(request.getParameterValues("projectCurrentStatus")[i]);
						perviousProjectDetailsModel.setTypeOfLand(request.getParameterValues("typeOfLand")[i]);

						if (request.getParameterValues("projectCurrentStatus")[i].equalsIgnoreCase("Completed")
								&& fileArr != null && fileArr.length > i && fileArr[i] != null
								&& fileArr[i].getSize() > 100) {
							if (perviousProjectDetailsModel.getCompletionDocId() != null) {
								document = perviousProjectDetailsModel.getCompletionDocId();
								document.setInputStream(fileArr[i].getInputStream());

								document.setFileName(fileArr[i].getOriginalFilename());
								document.setMimeType(fileArr[i].getContentType());

								contentUtil.saveDocument(document);
								documentService.updateDoc(document);
							} else {
								document = new Document();
								document.setFolderId(projectRegistrationModel.getProjectRegId().toString());
								document.setDocumentType("PROJECT_REG");
								document.setInputStream(fileArr[i].getInputStream());
								document.setFileName(fileArr[i].getOriginalFilename());
								document.setMimeType(fileArr[i].getContentType());
								contentUtil.saveDocument(document);
								documentService.saveDoc(document);
							}

							perviousProjectDetailsModel.setCompletionDocId(document);

						} else if (request.getParameterValues("projectCurrentStatus")[i].equalsIgnoreCase("Delay")) {
							if (request.getParameterValues("noOfMonthDelayed") != null) {
								perviousProjectDetailsModel
										.setNoOfMonthDelayed(request.getParameterValues("noOfMonthDelayed")[i]);
							}

						}
						/*
						 * else{ if
						 * (request.getParameterValues("expectedCompletionDate")
						 * != null) {
						 * 
						 * perviousProjectDetailsModel.setExpectedCompletionDate
						 * (Calendar.getInstance()); }
						 * 
						 * 
						 * 
						 * }
						 */

						/*
						 * else{ if
						 * (request.getParameterValues("expectedCompletionDate")
						 * != null &&
						 * request.getParameterValues("expectedCompletionDate")[
						 * i] != null) { SimpleDateFormat sf=new
						 * SimpleDateFormat("dd/MM/yyyy"); //log.
						 * info("request.getParameterValues(\"expectedCompletionDate\")[i]   ::::"
						 * +request.getParameterValues("expectedCompletionDate")
						 * [i]); Date dt= sf.parse(request.getParameterValues(
						 * "expectedCompletionDate")[i]); //
						 * sf.parse(request.getParameterValues(
						 * "expectedCompletionDate")[i]); Calendar
						 * c=Calendar.getInstance(); c.setTime(dt);
						 * //log.info("expectedCompletionDate  :::::  "+dt.
						 * toString());
						 * perviousProjectDetailsModel.setExpectedCompletionDate
						 * (c);
						 * 
						 * }
						 * 
						 * 
						 * }
						 */

						else {
							if (request.getParameterValues("expectedCompletionDate") != null
									&& request.getParameterValues("expectedCompletionDate")[i] != null) {

								SimpleDateFormat sf = new SimpleDateFormat("dd/MM/yyyy");
								Date dt = sf.parse(request.getParameterValues("expectedCompletionDate")[i]);
								// sf.parse(request.getParameterValues("expectedCompletionDate")[i]);
								Calendar c = Calendar.getInstance();
								c.setTime(dt);
								log.info("expectedCompletionDate  :::::  " + dt);
								perviousProjectDetailsModel.setExpectedCompletionDate(c);

							}

						}

						perviousProjectDetailsModel
								.setIsCasesPending(request.getParameterValues("isCasesPendingFld")[i]);
						if (perviousProjectDetailsModel.getIsCasesPending().equalsIgnoreCase("YES"))
							perviousProjectDetailsModel.setCaseDetails(request.getParameterValues("caseDetails")[i]);

						perviousProjectDetailsModel
								.setIsPaymentPending(request.getParameterValues("isPaymentPendingFld")[i]);
						if (perviousProjectDetailsModel.getIsPaymentPending().equalsIgnoreCase("YES"))
							perviousProjectDetailsModel
									.setPendingAmount(Long.parseLong(request.getParameterValues("pendingAmount")[i]));
						perviousProjectDetailsModel.setProjectAddress(request.getParameterValues("projectAddress")[i]);
						perviousProjectDetailsModel
								.setProjectAddrPinCode(request.getParameterValues("projectAddrPinCode")[i]);
						if ((request.getParameterValues("pervProjDistrictId")[i] != null)) {
							perviousProjectDetailsModel.setDistrictModel(districtDAO.getDistirctById(
									Long.parseLong(request.getParameterValues("pervProjDistrictId")[i])));
						}
						pervRegSet.add(perviousProjectDetailsModel);
					}
				}
			}
			if (promoterIndiPhoto != null && promoterIndiPhoto.getSize() > 10) {
				if (projectRegistrationModel.getPromoterDetailsModel().getIndividualPhotoGraphPath() != null) {
					document = projectRegistrationModel.getPromoterDetailsModel().getIndividualPhotoGraphPath();
					document.setInputStream(promoterIndiPhoto.getInputStream());
					document.setFileName(promoterIndiPhoto.getOriginalFilename());
					document.setMimeType(promoterIndiPhoto.getContentType());
					contentUtil.saveDocument(document);
					documentService.updateDoc(document);

				} else {
					document = new Document();
					document.setInputStream(promoterIndiPhoto.getInputStream());
					document.setDocumentType("PROJECT_REG");
					document.setFileName(promoterIndiPhoto.getOriginalFilename());
					document.setMimeType(promoterIndiPhoto.getContentType());
					document.setFolderId(String.valueOf(projectRegistrationModel.getProjectRegId()));
					contentUtil.saveDocument(document);
					documentService.saveDoc(document);
					projectRegistrationModel.getPromoterDetailsModel().setIndividualPhotoGraphPath(document);
				}

			}
			projectRegistrationModel.setPreviousProjectDetailsSet(pervRegSet);

		} catch (Exception ex) {
			log.error(ex.getMessage(), ex);
			throw ex;
		}
		return projectRegistrationModel;
	}

	@Override

	public ProjectRegistrationModel saveOrUpdateChairManPhotograph(ProjectRegistrationModel projectId,
			MultipartFile multipartFile) throws Exception {
		Document document = null;
		if (multipartFile != null && multipartFile.getSize() > 20) {
			if (projectId.getPromoterDetailsModel() != null
					&& projectId.getPromoterDetailsModel().getProjectChairmanModel() != null
					&& projectId.getPromoterDetailsModel().getProjectChairmanModel().getDocument() != null) {
				document = projectId.getPromoterDetailsModel().getProjectChairmanModel().getDocument();
				document.setInputStream(multipartFile.getInputStream());
				document.setFileName(multipartFile.getOriginalFilename());
				document.setMimeType(multipartFile.getContentType());
				contentUtil.saveDocument(document);
				documentService.updateDoc(document);
			} else {
				document = new Document();
				document.setDocumentType("PROJECT_REG");
				document.setFolderId(String.valueOf(String.valueOf(projectId.getProjectRegId())));
				document.setInputStream(multipartFile.getInputStream());
				document.setFileName(multipartFile.getOriginalFilename());
				document.setMimeType(multipartFile.getContentType());
				contentUtil.saveDocument(document);
				documentService.saveDoc(document);
			}

			projectId.getPromoterDetailsModel().getProjectChairmanModel().setDocument(document);
		}
		return projectId;
	}

	@Override

	public ProjectRegistrationModel saveOrUpdateRegistrationCertificate(ProjectRegistrationModel projectId,
			MultipartFile multipartFile) throws Exception {
		Document document = null;
		if (multipartFile != null && multipartFile.getSize() > 20) {
			if (projectId.getPromoterDetailsModel() != null && projectId.getPromoterDetailsModel().getDocument() != null
					&& !multipartFile.isEmpty()) {
				document = projectId.getPromoterDetailsModel().getDocument();
				document.setInputStream(multipartFile.getInputStream());
				document.setMimeType(multipartFile.getContentType());
				document.setFileName(multipartFile.getOriginalFilename());
				contentUtil.saveDocument(document);
				documentService.updateDoc(document);

			} else if (!multipartFile.isEmpty()) {
				document = new Document();
				document.setInputStream(multipartFile.getInputStream());
				document.setDocumentType("PROJECT_REG");
				document.setMimeType(multipartFile.getContentType());
				document.setFileName(multipartFile.getOriginalFilename());
				document.setFolderId(String.valueOf(String.valueOf(projectId.getProjectRegId())));
				contentUtil.saveDocument(document);
				documentService.saveDoc(document);

			}

			projectId.getPromoterDetailsModel().setDocument(document);
		}
		return projectId;
	}

	@Override
	public Long mergeProjectRegistration(ProjectRegistrationModel enitity) throws Exception {

		return promoterRegistrationDAO.merge(enitity).getProjectRegId();
	}

	@Override
	public Long saveUpdateProjectRegistration(ProjectRegistrationModel enitity) throws Exception {
		promoterRegistrationDAO.saveOrUpdate(enitity);
		return enitity.getProjectRegId();
	}

	@Override
	public Session getSessiion() throws Exception {
		return promoterRegistrationDAO.getSessionObj();
	}

	@Override
	public AgentRegistrationModel getAgentByRegNo(String agentRegNo) {
		DetachedCriteria dt = DetachedCriteria.forClass(AgentRegistrationModel.class);
		dt.add(Restrictions.eq("applicationNo", agentRegNo));
		List<AgentRegistrationModel> list = agentRegistrationDAO.getAgentList(dt);
		if (list.size() > 0) {
			return list.get(0);
		}
		return null;
	}
	
	@Override
	public ProjectRegistrationModel getProjectByAppNo(String AppNo) {
		DetachedCriteria dt = DetachedCriteria.forClass(ProjectRegistrationModel.class,"obj");
		dt.add(Restrictions.eq("obj.applicationNo", AppNo));
		List<ProjectRegistrationModel> list = promoterRegistrationDAO.getProjectList(dt);
		if (list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	@Override
	public ProjectRegistrationModel geSavedtProjectRegByEmailId(String emailId) throws Exception {
		DetachedCriteria dt = DetachedCriteria.forClass(ProjectRegistrationModel.class, "obj");
		dt.add(Restrictions.eq("obj.status", ReraConstants.SAVE_AS_DRAFT));
		// status
		dt.createAlias("obj.promoterDetailsModel", "promotor");
		dt.add(Restrictions.eq("promotor.emailId", emailId));
		List<ProjectRegistrationModel> list = promoterRegistrationDAO.getProjectList(dt);
		if (list != null && list.size() > 0) {
			return list.get(0);
		} else {
			return null;
		}

	}

	@Override
	public List<ProjectRegistrationModel> getProjectByApplictionNo(String appNo) throws Exception {

		DetachedCriteria dt = DetachedCriteria.forClass(ProjectRegistrationModel.class, "obj");
		dt.add(Restrictions.eq("obj.applicationNo", appNo));

		return promoterRegistrationDAO.getProjectList(dt);
	}

	@Autowired
	IAgentRegistrationDAO<AgentRegistrationModel, Long> agentRegistrationDAO;

	@Autowired
	CommonDao<Object, Long> dao;

	@Override
	public String generateProjectRegNumber(ProjectRegistrationModel projectModel) {
		Calendar cal = Calendar.getInstance();
		
		
		
		int maxRetries = 0;
		boolean savedAgent = false;

		while (!savedAgent && maxRetries < 10) {
			maxRetries++;
			StringBuffer sb=new StringBuffer("PRM/KA/RERA/");
			generateNumber(projectModel, cal, sb,getApprovedProjectCount()+1);
			
			if(checkProjectPRNNumberExists(sb.toString())){
				continue;
			}
			return sb.toString();
		}

		throw new RuntimeException("Cannot generate PRN number");
		
		
	}
	
	@Override
	public String generateProjectRegNumberForOldProjects(ProjectRegistrationModel projectModel) {
		Calendar cal = Calendar.getInstance();
		StringBuffer sb=new StringBuffer("PRM/KA/RERA/");
		cal.setTime(projectModel.getApprovedOn().getTime());
		
		generateNumber(projectModel, cal, sb,getApprovedProjectCount()+1);
		
		return sb.toString();
	}
	
	@Override
	public String generateProjectAckNumber(ProjectRegistrationModel projectModel) {
		Calendar cal = Calendar.getInstance();
		
		
		int maxRetries = 0;
		boolean savedAgent = false;

		while (!savedAgent && maxRetries < 10) {
			maxRetries++;
			StringBuffer sb=new StringBuffer("ACK/KA/RERA/");
			generateNumber(projectModel, cal, sb,getTotalProjectCount()+1);
			String appNo = sb.toString();
			String[] appArray = appNo.split("/");
			if(checkProjectACKNumberExists(appArray[appArray.length - 1])){
				continue;
			}
			return sb.toString();
		}

		throw new RuntimeException("Cannot generate ack number");
		
		
	}

	private void generateNumber(ProjectRegistrationModel projectModel, Calendar cal, StringBuffer sb, int sequenceNumber) {
		ProjectDetailsModel project=projectModel.getProjectDetailsModel();
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
		
		

		String str = "" + sequenceNumber;
		while (str.length() < 6) {
			str = "0" + str;
		}
		sb.append(str);
	}
	
	
	public Integer getTotalProjectCount() {

		String str = "Select count(p) from ProjectRegistrationModel p INNER JOIN p.projectDetailsModel d where p.status != 'SAVE_AS_DRAFT'";
		

		Query query = null;
		
		try {
			query = dao.getQuery(str);
			

		} catch (Exception e) {

			log.error(e.getMessage(),e);
		}

		return Integer.parseInt(query.uniqueResult().toString());
	}
	
	
	private boolean checkProjectACKNumberExists(String sequence) {

		String str = "Select count(p) from ProjectRegistrationModel p where p.applicationNo like 'ACK/KA/RERA%" + "/"
				+ sequence + "'";

		Query query = null;

		try {
			query = dao.getQuery(str);

		} catch (Exception e) {

			log.error(e.getMessage(), e);
		}

		return Integer.parseInt(query.uniqueResult().toString()) == 0 ? false : true;
	}
	
	
	private boolean checkProjectPRNNumberExists(String sequence) {

		String str = "Select count(p) from ProjectRegistrationModel p where p.projectRegistrationNo = '"+sequence+"'";

		Query query = null;

		try {
			query = dao.getQuery(str);

		} catch (Exception e) {

			log.error(e.getMessage(), e);
		}

		return Integer.parseInt(query.uniqueResult().toString()) == 0 ? false : true;
	}


	
	@Override
	public Integer getApprovedProjectCount() {

		String str = "Select count(p) from ProjectRegistrationModel p where p.status='APPROVED'";
		

		Query query = null;
		
		try {
			query = dao.getQuery(str);
			

		} catch (Exception e) {

			log.error(e.getMessage(),e);
		}

		return Integer.parseInt(query.uniqueResult().toString());
	}

	
	@Override
	public ProjectRegistrationModel getProjectByPRMAppNo(String AppNo) {
		DetachedCriteria dt = DetachedCriteria.forClass(ProjectRegistrationModel.class,"obj");
		dt.add(Restrictions.eq("obj.projectRegistrationNo", AppNo));
		dt.add(Restrictions.eq("obj.status", ReraConstants.APPROVED));
		List<ProjectRegistrationModel> list = promoterRegistrationDAO.getProjectList(dt);
		if (list.size() > 0) {
			return list.get(0);
		}
		return null;
	}
	
	@Override
	public ProjectRegistrationModel getSavedProjectsByPaymentToken(String paymentToken) {

		DetachedCriteria dt = DetachedCriteria.forClass(ProjectRegistrationModel.class, "obj");

		dt.createAlias("obj.paymentDetailsModel", "paymentDetailsModel");
		
		dt.add((Restrictions.eq("paymentDetailsModel.paymentToken", paymentToken)));

		List<ProjectRegistrationModel> list = promoterRegistrationDAO.getProjectList(dt);
		if (list.size() > 0) {
			return list.get(0);
		}else {
		return null;
		}
	}
	
	@Override
	public ProjectRegistrationModel getSavedPenaltyProjectsByPaymentToken(String paymentToken) {

		DetachedCriteria dt = DetachedCriteria.forClass(ProjectRegistrationModel.class, "obj");

		dt.createAlias("obj.PenaltypaymentDetailsModel", "paymentDetailsModel");
		
		dt.add((Restrictions.eq("paymentDetailsModel.paymentToken", paymentToken)));

		List<ProjectRegistrationModel> list = promoterRegistrationDAO.getProjectList(dt);
		if (list.size() > 0) {
			return list.get(0);
		}else {
		return null;
		}
	}

	
}
