package in.gov.rera.transaction.postregistration.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import in.gov.rera.transaction.projectregistration.model.ProjectRegistrationModel;

public interface IQuaterlyUpdateService {

	ProjectRegistrationModel updateProjectBankDetails(ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request, MultipartFile certFromChartedAcc, MultipartFile certificateIssuedByStructuralEng,
			MultipartFile certificateIssuedByArchitect,MultipartFile financialReport,MultipartFile annualfinancialReport,Long quarterId) throws Exception;

	ProjectRegistrationModel updateParkingDetails(ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request,Long quarterID) throws Exception;

	ProjectRegistrationModel updateFloorDetails(ProjectRegistrationModel baseObject, HttpServletRequest request,
			Long quarterID) ;

	ProjectRegistrationModel updateInfrastructureDetails(ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request, long quarterID);

	ProjectRegistrationModel updateCommonAreaDetails(ProjectRegistrationModel projectRegistrationModel, HttpServletRequest request,
			long quarterID);

	ProjectRegistrationModel updateApprovalsOrNocDetails(ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request, long quarterID, MultipartFile[] uploadDoc) throws Exception;

	ProjectRegistrationModel updateAssociationDetails(ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request, long quarterId, MultipartFile registeredDoc);

	ProjectRegistrationModel updateModificationDetails(ProjectRegistrationModel projectRegistrationModel, HttpServletRequest request,
			long quarterId, MultipartFile uploadApprovalDoc, MultipartFile uploadDoc, MultipartFile modifiedDoc)throws Exception;

	ProjectRegistrationModel updateLitigationDetails(ProjectRegistrationModel baseObject, HttpServletRequest request,
			long quarterId, MultipartFile[] preventiveOrderDoc,MultipartFile[] furtherOrderDoc) throws Exception;

	ProjectRegistrationModel updateCivilWorksDetails(ProjectRegistrationModel projectRegistrationModel, HttpServletRequest request,
			long quarterId) throws Exception;

	ProjectRegistrationModel updateProjectConstructionWelfareDetails(ProjectRegistrationModel baseObject,
			HttpServletRequest request, long parseLong, MultipartFile registeredDoc) throws Exception;

	ProjectRegistrationModel saveOrUpdateConstructionCostDetails(ProjectRegistrationModel baseObject,
			HttpServletRequest request, long parseLong) throws Exception;

	ProjectRegistrationModel saveSuperStructureDetails(ProjectRegistrationModel baseObject, HttpServletRequest request,long quarterID) throws Exception;

	ProjectRegistrationModel saveSubStructureDetails(ProjectRegistrationModel baseObject, HttpServletRequest request,long quarterID) throws Exception;

	ProjectRegistrationModel saveAmenityDetails(ProjectRegistrationModel baseObject, HttpServletRequest request,long quarterID) throws Exception;

	ProjectRegistrationModel saveMasonryDetails(ProjectRegistrationModel baseObject, HttpServletRequest request,
			long parseLong)throws Exception;

	ProjectRegistrationModel saveFinishingInteriorDetails(ProjectRegistrationModel baseObject,
			HttpServletRequest request, long parseLong)throws Exception;

	ProjectRegistrationModel updateExternalInfrastructureDetails(ProjectRegistrationModel baseObject,
			HttpServletRequest request, long parseLong)throws Exception;

	ProjectRegistrationModel updateBuildingDetails(ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request, Long quarterId, MultipartFile[] photograph) throws Exception;

	/*-------------------------------------------------plots--------------------------------*/

	/*ProjectRegistrationModel saveUpdateQuarterPlotDetails(ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request, long quarterID) throws Exception;

	ProjectRegistrationModel updatePlotCivilWorksDetails(ProjectRegistrationModel projectRegistrationModel, HttpServletRequest request,
			long quarterId) throws Exception;

	ProjectRegistrationModel saveOrUpdateQuarterlyCommonAreasAuthorityDetails(ProjectRegistrationModel baseObject,
			HttpServletRequest request, long quarterId,MultipartFile sitesPhotograph,MultipartFile openSpacePhotograph,MultipartFile roadPhotograph);

	ProjectRegistrationModel saveOrUpdateQuarterlyCommonAreasPurchaserDetails(ProjectRegistrationModel baseObject,
			HttpServletRequest request,long quarterId);

	ProjectRegistrationModel saveOrUpdatePlotConstructionCostDetails(ProjectRegistrationModel baseObject,
			HttpServletRequest request, long quarterId) throws Exception;

	ProjectRegistrationModel updatePlotQuarterlyApprovalsOrNocDetails(ProjectRegistrationModel baseObject,
			HttpServletRequest request, long parseLong, MultipartFile[] photograph);

	ProjectRegistrationModel updatePlotLitigationDetails(ProjectRegistrationModel baseObject,
			HttpServletRequest request, long parseLong, MultipartFile[] preventiveOrderDoc) throws Exception;

	ProjectRegistrationModel updatePlotModificationDetails(ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request, long parseLong, MultipartFile uploadApprovalDoc, MultipartFile uploadDoc ,
			MultipartFile modifiedDoc,MultipartFile detailsOfPlotReleased,MultipartFile plotNocCertificate) throws Exception;

	ProjectRegistrationModel updatePlotAssociationDetails(ProjectRegistrationModel baseObject,
			HttpServletRequest request, long parseLong, MultipartFile registeredDoc) throws Exception;

	ProjectRegistrationModel updatePlotConstructionWelfareDetails(ProjectRegistrationModel baseObject,
			HttpServletRequest request, long parseLong, MultipartFile welfareFundregisteredDoc) throws Exception;

	ProjectRegistrationModel updatePlotBankDetails(ProjectRegistrationModel baseObject, HttpServletRequest request,
			MultipartFile certFromChartedAcc, MultipartFile certificateIssuedByStructuralEng,
			MultipartFile certificateIssuedByArchitect, MultipartFile financialReport, MultipartFile annualfinancialReport,long quarterId) throws Exception;*/

}
