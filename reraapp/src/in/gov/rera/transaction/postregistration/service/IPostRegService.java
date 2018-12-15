package in.gov.rera.transaction.postregistration.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;

import in.gov.rera.transaction.postregistration.model.ProjectScheduleModel;
import in.gov.rera.transaction.projectregistration.model.ProjectRegistrationModel;

public interface IPostRegService {

	List<ProjectRegistrationModel> getPostRegProjectsByLoginId(String loginId);

	ProjectRegistrationModel getProjectRegByPk(Long pk)throws Exception;

	Long saveUpdatePostRegistration(ProjectRegistrationModel enitity) throws Exception;

	//ad copy
	ProjectRegistrationModel saveOrUpdateDocDetails(ProjectRegistrationModel baseObject,
			HttpServletRequest request, MultipartFile prospectusOrBrochureDoc,MultipartFile advertisementDoc) throws Exception;

	//tower
	ProjectRegistrationModel saveOrUpdateTowerDetails(ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request) throws Exception;	

	ProjectRegistrationModel saveOrUpdateFloorDetails(ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request) throws Exception;

	ProjectRegistrationModel updateEachApartmentDetails(ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request) throws Exception;

	//schedule
	ProjectRegistrationModel saveProjScheduleDetails(ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request) throws Exception;

	ProjectRegistrationModel saveSuperStructureDetails(ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request) throws Exception;

	ProjectRegistrationModel saveFinInteriorDetails(ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request) throws Exception;

	ProjectRegistrationModel saveMasonaryDetails(ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request) throws Exception;

	ProjectRegistrationModel saveExternalInfraDetails(ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request) throws Exception;

	ProjectRegistrationModel saveInternalInfraDetails(ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request) throws Exception;

	ProjectRegistrationModel saveCommonDetailsDetails(ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request) throws Exception;

	ProjectRegistrationModel saveAmenityDetails(ProjectRegistrationModel baseObject, HttpServletRequest request) throws Exception;

	// Land
	ProjectRegistrationModel saveOrUpdateLandAcquiCostDetails(ProjectRegistrationModel baseObject,
			HttpServletRequest request) throws Exception;

	ProjectRegistrationModel saveOrUpdateLandJDADetails(ProjectRegistrationModel projectRegistrationModel,HttpServletRequest request)throws Exception;

	ProjectRegistrationModel saveOrUpdateTDRDetails(ProjectRegistrationModel baseObject,
			HttpServletRequest request, MultipartFile[] certFromChartedAccFile,MultipartFile tdrPurchaseOrSaleDoc) throws Exception;

	ProjectRegistrationModel saveOrUpdateApprovalCostDetails(ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request, MultipartFile[] certFromChartedAcc) throws Exception;

	//construction
	ProjectRegistrationModel saveOrUpdateConstructionCostDetails(ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request,MultipartFile certFromChartedAcc, MultipartFile certificateIssuedByStructuralEng,
			MultipartFile certificateIssuedByArchitect) throws Exception;

	//summary and finalApproval
	ProjectRegistrationModel updateProjectSummaryDetails(ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request) throws Exception;

	ProjectRegistrationModel updateFinalApprovalDetails(ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request,MultipartFile[] uploadDoc) throws Exception;

	ProjectRegistrationModel saveOrUploadExcel(ProjectRegistrationModel baseObject,
			HttpServletRequest request,HttpServletResponse response, MultipartFile unitdetailsExcelFile) throws Exception;

	ProjectRegistrationModel DownloadTowerDetailsExcel(ProjectRegistrationModel baseObject, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	/*-----------------------------------------------------plots---------------------------------------*/

	/*ProjectRegistrationModel saveOrUpdatePlotDetails(ProjectRegistrationModel baseObject, HttpServletRequest request);

	ProjectRegistrationModel savePlotScheduleCivilWorkDetails(ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request) throws Exception;

	ProjectRegistrationModel saveOrUpdatePlotScheduleCommonAreasAuthorityDetails(ProjectRegistrationModel baseObject,
			HttpServletRequest request) throws Exception;

	ProjectRegistrationModel saveOrUpdatePlotScheduleCommonAreasPurchaserDetails(ProjectRegistrationModel projectRegistrationModel,
			HttpServletRequest request) throws Exception;

	ProjectRegistrationModel saveOrUpdatePlotCostDetails(ProjectRegistrationModel baseObject,HttpServletRequest request);

	ProjectRegistrationModel saveOrUpdatePlotJDADetails(ProjectRegistrationModel baseObject, HttpServletRequest request) throws Exception;

	ProjectRegistrationModel saveOrUpdatePlotApprovalCostDetails(ProjectRegistrationModel baseObject,
			HttpServletRequest request, MultipartFile[] certFromChartedAccFile) throws Exception;

	ProjectRegistrationModel saveOrUpdatePlotConstructionCostDetails(ProjectRegistrationModel baseObject,
			HttpServletRequest request) throws Exception;

	ProjectRegistrationModel updatePlotSummaryDetails(ProjectRegistrationModel baseObject, HttpServletRequest request) throws Exception;

	ProjectRegistrationModel updatePlotFinalApprovalDetails(ProjectRegistrationModel baseObject,
			HttpServletRequest request, MultipartFile[] uploadDoc) throws Exception;*/

}
