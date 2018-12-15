package in.gov.rera.transaction.postregistration.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import in.gov.rera.transaction.postregistration.model.ProjectScheduleModel;
import in.gov.rera.transaction.projectregistration.model.ProjectRegistrationModel;

public interface IPlotRegService {

	List<ProjectRegistrationModel> getPostRegProjectsByLoginId(String loginId);
	
	ProjectRegistrationModel getProjectRegByPk(Long pk)throws Exception;
	
	Long saveUpdatePostRegistration(ProjectRegistrationModel enitity) throws Exception;

	ProjectRegistrationModel saveOrUpdateDocDetails(ProjectRegistrationModel baseObject,
			HttpServletRequest request, MultipartFile prospectusOrBrochureDoc,MultipartFile advertisementDoc) throws Exception;
	
	ProjectRegistrationModel saveOrUpdatePlotDetails(ProjectRegistrationModel baseObject, HttpServletRequest request);
	
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
	
	ProjectRegistrationModel saveOrUpdatePlotConstructionCostDetails( ProjectRegistrationModel projectRegistrationModel, HttpServletRequest request,MultipartFile certFromChartedAcc,MultipartFile  certificateIssuedByStructuralEng,
			MultipartFile  certificateIssuedByArchitect) throws Exception;
	
	ProjectRegistrationModel updatePlotSummaryDetails(ProjectRegistrationModel baseObject, HttpServletRequest request) throws Exception;

	ProjectRegistrationModel updatePlotFinalApprovalDetails(ProjectRegistrationModel baseObject,
			HttpServletRequest request, MultipartFile[] uploadDoc) throws Exception;
}
