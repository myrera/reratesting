package in.gov.rera.transaction.postregistration.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import in.gov.rera.transaction.projectregistration.model.ProjectRegistrationModel;

public interface IPlotQuaterlyUpdateService {
	
	ProjectRegistrationModel saveUpdateQuarterPlotDetails(ProjectRegistrationModel projectRegistrationModel,
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
			MultipartFile certificateIssuedByArchitect, MultipartFile financialReport, MultipartFile annualfinancialReport,long quarterId) throws Exception;

}
