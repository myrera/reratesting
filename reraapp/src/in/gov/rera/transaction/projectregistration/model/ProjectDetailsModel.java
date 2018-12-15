package in.gov.rera.transaction.projectregistration.model;

import java.util.Calendar;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.OrderColumn;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import in.gov.rera.K2PaymentGateWay.model.K2PaymentDetailsModel;
import in.gov.rera.dms.beans.Document;
import in.gov.rera.master.district.model.DistrictModel;
import in.gov.rera.master.office.model.OfficeModel;
import in.gov.rera.master.subdistrict.model.SubDistrictModel;
import in.gov.rera.transaction.postregistration.model.ConstructionCostmodel;
import in.gov.rera.transaction.postregistration.model.FinalApproval;
import in.gov.rera.transaction.postregistration.model.LandCostDetailsModel;
import in.gov.rera.transaction.postregistration.model.PostRegAgentDetails;
import in.gov.rera.transaction.postregistration.model.ProjectQuaterlyUpdate;
import in.gov.rera.transaction.postregistration.model.ProjectScheduleModel;
import in.gov.rera.transaction.postregistration.model.ProjectSummary;
import in.gov.rera.transaction.postregistration.model.TowerDetailsModel;
import in.gov.rera.transaction.postregistration.model.WebSiteUrlDetailsModel;
import in.gov.rera.transaction.postregistration.plots.model.PlotScheduleModel;
import in.gov.rera.transaction.postregistration.plots.model.PlotsConstructionCostmodel;
import in.gov.rera.transaction.postregistration.plots.model.PlotsCostSummary;
import in.gov.rera.transaction.postregistration.plots.model.PlotsDetailsModel;
import in.gov.rera.transaction.postregistration.plots.model.PlotsFinalApproval;
import in.gov.rera.transaction.postregistration.plots.model.PlotsLandCostDetailsModel;
import in.gov.rera.transaction.postregistration.plots.model.PlotsQuaterlyUpdate;

@Entity(name = "ProjectDetailsModel")
@Table(name = "TL_PROJECT_DETAILS")
public class ProjectDetailsModel {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "PROJECT_DELS_ID")
	private Long projectDetailsId;

	@Column(name = "PROJECT_NAME", length = 100)
	private String projectName;

	@Column(name = "PROJECT_DESC", length = 3500)
	private String projectDescription;

	@Column(name = "PROJECT_TYPE")
	private String projectType;

	@OneToOne(cascade = CascadeType.ALL,fetch =FetchType.LAZY)
	@JoinColumn(name = "K2_PAY_DELS_ID")
	private K2PaymentDetailsModel k2PaymentDetailsModel;

	@OneToOne(cascade = CascadeType.ALL,fetch =FetchType.LAZY)
	@JoinColumn(name = "K2_PENALTY_PAY_DELS_ID")
	private K2PaymentDetailsModel k2PenaltyPaymentDetailsModel;

	public List<PostRegAgentDetails> getPostRegAgentDetails() {
		return postRegAgentDetails;
	}

	public void setPostRegAgentDetails(List<PostRegAgentDetails> postRegAgentDetails) {
		this.postRegAgentDetails = postRegAgentDetails;
	}

	@Column(name = "PROJECT_STATUS")
	private String projectStatus;

	@Column(name = "TOTAL_LAND_AREA")
	private Integer totalAreaOfLand;

	@Column(name = "TOTAL_OPEN_AREA")
	private Integer totalOpenArea;

	@Column(name = "TOTAL_COVERED_AREA")
	private Integer totalCoverdArea;

	private String workDetails;

	@Column(name = "START_DATE")
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	private Calendar startDate;

	@Column(name = "COMPLETION_DATE")
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	private Calendar completionDate;

	@Column(name = "NO_OF_GARAGE_FOR_SALE")
	private Integer noOfGarageForSale;

	@Column(name = "AREA_OF_GARAGE_FOR_SALE")
	private Integer areaOfGarageForSale;

	@ManyToOne
	@JoinColumn(name = "SUB_DISTRICT_ID")
	private SubDistrictModel subDistrictModel;

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@OrderColumn(name = "orders_index")
	private List<ProjectQuaterlyUpdate> quarterlyUpdate;

	/*	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@OrderColumn(name = "orders_index")
	private List<PlotsQuarterlyUpdate> plotsQuarterlyUpdate;*/

	@ManyToOne
	@JoinColumn(name = "RERA_OFFICE")
	private OfficeModel office;

	@ManyToOne
	@JoinColumn(name = "DISTRICT_ID")
	private DistrictModel districtModel;

	@Column(name = "LATITUDE", length = 500)
	private String latitude;

	@Column(name = "LONGITUDE", length = 500)
	private String longitude;

	@Column(name = "APPROVING_AUTHORITY")
	private String approvingAuthority;

	@Column(name = "IS_ANY_CHANGE_IN_PLAN")
	private String isSubSqChangeInPlan;

	@Column(name = "IS_DELAYED")
	private String isDelayed;

	@Column(name = "TOTAL_AMT_FRM_ALLOTEE")
	private Long totalAmtClctedFrmAllotee;

	@Column(name = "TOTAL_AMT_FOR_USEDDEV")
	private Long totalAmtUsedInPrjct;

	@Column(name = "TOTAL_BAL_AMT_ALLOTEE")
	private Long totalBalAmtOfAlte;

	@OneToOne
	@JoinColumn(name = "COMPELETION_CERT_DOC_ID")
	private Document compeletionCertDoc;

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@OrderColumn(name = "orders_index")
	private List<ProjectStatusModel> statusList;

	@Column(name = "REASON_FOR_DELAYED")
	private String reasonForDelayed;

	@Column(name = "NO_OF_MONTHS_DELAYED")
	private Integer noOfMonthDelayed = new Integer(0);
	@Column(name = "GARAGE_SOLDOUT")
	private Integer garageSoldout = new Integer(0);
	@Column(name = "PARKING_SOLDOUT")
	private Integer parkingSoldout = new Integer(0);

	@Column(name = "LAST_UPDATED_ON")
	private Calendar updatedOn;

	@Column(name = "ESTIMATED_COST")
	private Long estimatedCost;
	@Column(name = "COST_OF_LAND")
	private Long costOfLand;
	@Column(name = "TOTAL_PROJECT_COST")
	private Long totalProjectCost;

	@Column(name = "DEV_COMPLETION_STATUS")
	private Integer devCompletion;

	@ManyToOne
	@JoinColumn(name = "DELAYED_CERT_DOC")
	private Document delayedCertDoc;

	/*@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@OrderColumn(name = "orders_index")
	private List<PlotsDetailsModel> plotDetailsList;

	public List<PlotsDetailsModel> getPlotDetailsList() {
		return plotDetailsList;
	}

	public void setPlotDetailsList(List<PlotsDetailsModel> plotDetailsList) {
		this.plotDetailsList = plotDetailsList;
	}*/

	@Column(name = "DEV_PENDING_STATUS")
	private Integer devPending;

	@Column(name = "EST_END_DATE")
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	private Calendar estimatedEndDate;



	// start Addedd latitude and longitude
	@Column(name = "SOUTH_LATITUDE")
	private String southlatitude;
	@Column(name = "SOUTH_LONGITUDE")
	private String southlongitude;

	@Column(name = "NORTH_LATITUDE")
	private String northlatitude;
	@Column(name = "NORTH_LONGITUDE")
	private String northlongitude;


	@Column(name = "EAST_LATITUDE")
	private String eastlatitude;
	@Column(name = "EAST_LONGITUDE")
	private String eastlongitude;

	@Column(name = "WEST_LATITUDE")
	private String westlatitude;
	@Column(name = "WEST_LONGITUDE")
	private String westlongitude;


	@OneToOne(cascade = CascadeType.ALL, fetch=FetchType.LAZY)
	@JoinColumn(name = "PROJECT_SCHEDL_ID",nullable=true)
	private ProjectScheduleModel projectScheduleModel;

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "CONSTRUCTION_COST_MODEL_ID")
	private ConstructionCostmodel constructionCostModel;

	//plots
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "PLOTS_CONSTRUCTION_COST_MODEL_ID")
	private PlotsConstructionCostmodel plotsConstructionCostModel;

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "LAND_COST_DELS_ID")
	private LandCostDetailsModel landCostDetailsModel;

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "PROJECT_SUMMARY_ID")
	private ProjectSummary projectSummary;


	@OneToMany(cascade = CascadeType.ALL,fetch=FetchType.LAZY)
	private List<FinalApproval> finalApproval;

	// end Addedd latitude and longitude


	@OneToOne
	@JoinColumn(name = "ADEVERTISEMENT_ID")
	private Document advertisementDoc;

	/*		@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
		@OrderColumn(name = "orders_index")
		private List<Document> advertiseDocList;


		@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
		@OrderColumn(name = "orders_index")
		private List<Document> prospectusBrochureDocList;
	 */


	@OneToOne
	@JoinColumn(name = "PROSPECTUS_ID")
	private Document prospectusOrBrochureDoc;

	@Column(name = "NO_OF_TOWERS")
	private Long totalNoOfTowers;

	public Long getTotalNoOfTowers() {
		return totalNoOfTowers;
	}

	public void setTotalNoOfTowers(Long totalNoOfTowers) {
		this.totalNoOfTowers = totalNoOfTowers;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@OrderColumn(name = "orders_index")
	private List<TowerDetailsModel> towerDetailsList;




	@Column(name = "LAND_COMPONENT_TYPE")
	private String landComponentType;

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "PLOT_COST_DELS_ID")
	private PlotsLandCostDetailsModel plotLandCostDetailsModel;

	@OneToMany(cascade = CascadeType.ALL,fetch=FetchType.LAZY)
	private List<PlotsFinalApproval> plotfinalApproval;

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@OrderColumn(name = "orders_index")
	private List<PlotsDetailsModel> plotDetailsList;

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "PLOT_SUMMARY_ID")
	private PlotsCostSummary plotSummary;

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@OrderColumn(name = "orders_index")
	private List<PlotsQuaterlyUpdate> plotsQuarterlyUpdate;


	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@OrderColumn(name = "orders_index")
	private List<PostRegAgentDetails> postRegAgentDetails;


	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@OrderColumn(name = "orders_index")
	private List<WebSiteUrlDetailsModel> webSiteUrlDetails;

	@OneToOne(cascade = CascadeType.ALL, fetch=FetchType.LAZY)
	@JoinColumn(name = "PLOT_SCHEDL_MODEL_ID",nullable=true)
	private PlotScheduleModel plotScheduleModel ;

	@Column(name = "FAR_SANCTIONED_AMT")
	private Float  farSanctioned;

	@OneToOne
	@JoinColumn(name = "EXCEL_DOC_ID")
	private Document unitdetailsExcelFile;




	public Document getUnitdetailsExcelFile() {
		return unitdetailsExcelFile;
	}

	public void setUnitdetailsExcelFile(Document unitdetailsExcelFile) {
		this.unitdetailsExcelFile = unitdetailsExcelFile;
	}

	public Float getFarSanctioned() {
		return farSanctioned;
	}

	public void setFarSanctioned(Float farSanctioned) {
		this.farSanctioned = farSanctioned;
	}


	public PlotScheduleModel getPlotScheduleModel() {
		return plotScheduleModel;
	}





	public void setPlotScheduleModel(PlotScheduleModel plotScheduleModel) {
		this.plotScheduleModel = plotScheduleModel;
	}






	public String getLandComponentType() {
		return landComponentType;
	}





	public void setLandComponentType(String landComponentType) {
		this.landComponentType = landComponentType;
	}





	public Document getDelayedCertDoc() {
		return delayedCertDoc;
	}





	public String getSouthlatitude() {
		return southlatitude;
	}





	public void setSouthlatitude(String southlatitude) {
		this.southlatitude = southlatitude;
	}





	public String getSouthlongitude() {
		return southlongitude;
	}





	public void setSouthlongitude(String southlongitude) {
		this.southlongitude = southlongitude;
	}





	public String getNorthlatitude() {
		return northlatitude;
	}





	public void setNorthlatitude(String northlatitude) {
		this.northlatitude = northlatitude;
	}





	public String getNorthlongitude() {
		return northlongitude;
	}





	public void setNorthlongitude(String northlongitude) {
		this.northlongitude = northlongitude;
	}





	public String getEastlatitude() {
		return eastlatitude;
	}





	public void setEastlatitude(String eastlatitude) {
		this.eastlatitude = eastlatitude;
	}





	public String getEastlongitude() {
		return eastlongitude;
	}





	public void setEastlongitude(String eastlongitude) {
		this.eastlongitude = eastlongitude;
	}





	public String getWestlatitude() {
		return westlatitude;
	}





	public void setWestlatitude(String westlatitude) {
		this.westlatitude = westlatitude;
	}





	public String getWestlongitude() {
		return westlongitude;
	}





	public void setWestlongitude(String westlongitude) {
		this.westlongitude = westlongitude;
	}





	public void setDelayedCertDoc(Document delayedCertDoc) {
		this.delayedCertDoc = delayedCertDoc;
	}

	public String getWorkDetails() {
		return workDetails;
	}

	public void setWorkDetails(String workDetails) {
		this.workDetails = workDetails;
		this.projectDescription = workDetails;
	}

	public OfficeModel getOffice() {
		return office;
	}

	public void setOffice(OfficeModel office) {
		this.office = office;
	}

	public Long getEstimatedCost() {
		return estimatedCost;
	}

	public void setEstimatedCost(Long estimatedCost) {
		this.estimatedCost = estimatedCost;
	}

	public Long getCostOfLand() {
		return costOfLand;
	}

	public void setCostOfLand(Long costOfLand) {
		this.costOfLand = costOfLand;
	}

	public Long getTotalProjectCost() {
		return totalProjectCost;
	}

	public void setTotalProjectCost(Long totalProjectCost) {
		this.totalProjectCost = totalProjectCost;
	}

	public String getApprovingAuthority() {
		return approvingAuthority;
	}

	public void setApprovingAuthority(String approvingAuthority) {
		this.approvingAuthority = approvingAuthority;
	}

	public String getReasonForDelayed() {
		return reasonForDelayed;
	}

	public void setReasonForDelayed(String reasonForDelayed) {
		this.reasonForDelayed = reasonForDelayed;
	}

	public Calendar getUpdatedOn() {
		return updatedOn;
	}

	public void setUpdatedOn(Calendar updatedOn) {
		this.updatedOn = updatedOn;
	}

	public Document getCompeletionCertDoc() {
		return compeletionCertDoc;
	}

	public void setCompeletionCertDoc(Document compeletionCertDoc) {
		this.compeletionCertDoc = compeletionCertDoc;
	}

	public List<ProjectStatusModel> getStatusList() {
		return statusList;
	}

	public void setStatusList(List<ProjectStatusModel> statusList) {
		this.statusList = statusList;
	}

	public int getNoOfMonthDelayed() {
		if (this.noOfMonthDelayed == null)
			return 0;

		return noOfMonthDelayed;
	}

	public void setNoOfMonthDelayed(int noOfMonthDelayed) {
		this.noOfMonthDelayed = noOfMonthDelayed;
	}

	public int getGarageSoldout() {
		if (this.garageSoldout == null)
			return 0;

		return garageSoldout;
	}

	public void setGarageSoldout(int garageSoldout) {
		this.garageSoldout = garageSoldout;
	}

	public int getParkingSoldout() {
		if (this.parkingSoldout == null)
			return 0;

		return parkingSoldout;
	}

	public void setParkingSoldout(int parkingSoldout) {
		this.parkingSoldout = parkingSoldout;
	}

	public Calendar getStartDate() {
		return startDate;
	}

	public void setStartDate(Calendar startDate) {
		this.startDate = startDate;
	}

	public Calendar getCompletionDate() {
		return completionDate;
	}

	public void setCompletionDate(Calendar completionDate) {
		this.completionDate = completionDate;
	}

	public String getProjectStatus() {
		return projectStatus;
	}

	public void setProjectStatus(String projectStatus) {
		this.projectStatus = projectStatus;
	}

	public Integer getTotalAreaOfLand() {
		return totalAreaOfLand;
	}

	public void setTotalAreaOfLand(Integer totalAreaOfLand) {
		this.totalAreaOfLand = totalAreaOfLand;
	}

	public Integer getTotalOpenArea() {
		return totalOpenArea;
	}

	public void setTotalOpenArea(Integer totalOpenArea) {
		this.totalOpenArea = totalOpenArea;
	}

	public Integer getTotalCoverdArea() {
		return totalCoverdArea;
	}

	public void setTotalCoverdArea(Integer totalCoverdArea) {
		this.totalCoverdArea = totalCoverdArea;
	}

	public Integer getNoOfGarageForSale() {
		return noOfGarageForSale;
	}

	public void setNoOfGarageForSale(Integer noOfGarageForSale) {
		this.noOfGarageForSale = noOfGarageForSale;
	}

	public Integer getAreaOfGarageForSale() {
		return areaOfGarageForSale;
	}

	public void setAreaOfGarageForSale(Integer areaOfGarageForSale) {
		this.areaOfGarageForSale = areaOfGarageForSale;
	}

	public Integer getNoOfParkinfForSale() {
		return noOfParkinfForSale;
	}



	public LandCostDetailsModel getLandCostDetailsModel() {
		return landCostDetailsModel;
	}





	public void setLandCostDetailsModel(LandCostDetailsModel landCostDetailsModel) {
		this.landCostDetailsModel = landCostDetailsModel;
	}





	public ProjectScheduleModel getProjectScheduleModel() {
		return projectScheduleModel;
	}





	public void setProjectScheduleModel(ProjectScheduleModel projectScheduleModel) {
		this.projectScheduleModel = projectScheduleModel;
	}










	public ConstructionCostmodel getConstructionCostModel() {
		return constructionCostModel;
	}





	public void setConstructionCostModel(ConstructionCostmodel constructionCostModel) {
		this.constructionCostModel = constructionCostModel;
	}





	public void setNoOfMonthDelayed(Integer noOfMonthDelayed) {
		this.noOfMonthDelayed = noOfMonthDelayed;
	}





	public void setGarageSoldout(Integer garageSoldout) {
		this.garageSoldout = garageSoldout;
	}





	public void setParkingSoldout(Integer parkingSoldout) {
		this.parkingSoldout = parkingSoldout;
	}





	public void setNoOfParkinfForSale(Integer noOfParkinfForSale) {
		this.noOfParkinfForSale = noOfParkinfForSale;
	}

	public Integer getAreaOfParkinfForSale() {
		return areaOfParkinfForSale;
	}

	public void setAreaOfParkinfForSale(Integer areaOfParkinfForSale) {
		this.areaOfParkinfForSale = areaOfParkinfForSale;
	}

	public SubDistrictModel getSubDistrictModel() {
		return subDistrictModel;
	}

	public void setSubDistrictModel(SubDistrictModel subDistrict) {
		this.subDistrictModel = subDistrict;
	}

	@Column(name = "NO_OF_PARKING_FOR_SALE")
	private Integer noOfParkinfForSale;

	@Column(name = "AREA_OF_PARKING_FOR_SALE")
	private Integer areaOfParkinfForSale;

	@Column(name = "NO_OF_COVEREDPARKING_SALE")
	private Integer noOfCoveredParkingForSale;

	@Column(name = "AREA_OF_COVEREDPARKING_SALE")
	private Integer areaOfCoveredParkingForSale;


	public Integer getNoOfCoveredParkingForSale() {
		return noOfCoveredParkingForSale;
	}





	public void setNoOfCoveredParkingForSale(Integer noOfCoveredParkingForSale) {
		this.noOfCoveredParkingForSale = noOfCoveredParkingForSale;
	}





	public Integer getAreaOfCoveredParkingForSale() {
		return areaOfCoveredParkingForSale;
	}





	public void setAreaOfCoveredParkingForSale(Integer areaOfCoveredParkingForSale) {
		this.areaOfCoveredParkingForSale = areaOfCoveredParkingForSale;
	}

	@Column(name = "ADDRESS_LINE_1")
	private String addressLine1;

	public String getAddressLine1() {
		return addressLine1;
	}

	public void setAddressLine1(String addressLine1) {
		this.addressLine1 = addressLine1;
	}

	public String getAddressLine2() {
		return addressLine2;
	}

	public void setAddressLine2(String addressLine2) {
		this.addressLine2 = addressLine2;
	}

	@Column(name = "ADDRESS_LINE_2")
	private String addressLine2;

	public Long getProjectDetailsId() {
		return projectDetailsId;
	}

	public void setProjectDetailsId(Long projectDetailsId) {
		this.projectDetailsId = projectDetailsId;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getProjectDescription() {
		return projectDescription;
	}

	public void setProjectDescription(String projectDescription) {
		this.projectDescription = projectDescription;
	}

	public String getProjectType() {
		return projectType;
	}

	public void setProjectType(String projectType) {
		this.projectType = projectType;
	}

	@Override
	public String toString() {
		return startDate.toString();

	}

	public String getIsSubSqChangeInPlan() {
		return isSubSqChangeInPlan;
	}

	public void setIsSubSqChangeInPlan(String isSubSqChangeInPlan) {
		this.isSubSqChangeInPlan = isSubSqChangeInPlan;
	}

	public String getIsDelayed() {
		return isDelayed;
	}

	public void setIsDelayed(String isDelayed) {
		this.isDelayed = isDelayed;
	}

	public Long getTotalAmtClctedFrmAllotee() {
		return totalAmtClctedFrmAllotee;
	}

	public void setTotalAmtClctedFrmAllotee(Long totalAmtClctedFrmAllotee) {
		this.totalAmtClctedFrmAllotee = totalAmtClctedFrmAllotee;
	}

	public Long getTotalAmtUsedInPrjct() {
		return totalAmtUsedInPrjct;
	}

	public void setTotalAmtUsedInPrjct(Long totalAmtUsedInPrjct) {
		this.totalAmtUsedInPrjct = totalAmtUsedInPrjct;
	}

	public Long getTotalBalAmtOfAlte() {
		return totalBalAmtOfAlte;
	}

	public void setTotalBalAmtOfAlte(Long totalBalAmtOfAlte) {
		this.totalBalAmtOfAlte = totalBalAmtOfAlte;
	}

	public Integer getDevCompletion() {
		return devCompletion;
	}

	public void setDevCompletion(Integer devCompletion) {
		this.devCompletion = devCompletion;
	}

	public Integer getDevPending() {
		return devPending;
	}

	public void setDevPending(Integer devPending) {
		this.devPending = devPending;
	}

	public Calendar getEstimatedEndDate() {
		return estimatedEndDate;
	}

	public void setEstimatedEndDate(Calendar estimatedEndDate) {
		this.estimatedEndDate = estimatedEndDate;
	}

	public DistrictModel getDistrictModel() {
		return districtModel;
	}

	public void setDistrictModel(DistrictModel district) {
		this.districtModel = district;
	}



	public String getLatitude() {
		return latitude;
	}


	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}





	public void populateModel(ProjectDetailsModel model) {
		this.addressLine1 = model.getAddressLine1();
		this.addressLine2 = model.getAddressLine2();
		this.noOfGarageForSale = model.getNoOfGarageForSale();

		this.projectName = model.getProjectName();
		this.projectDescription = model.getProjectDescription();
		this.projectType = model.getProjectType();

		this.projectStatus = model.getProjectStatus();
		this.totalAreaOfLand = model.getTotalAreaOfLand();
		this.totalOpenArea = model.getTotalOpenArea();
		this.totalCoverdArea = model.getTotalCoverdArea();
		this.startDate = model.getStartDate();
		this.completionDate = model.getCompletionDate();

		this.areaOfGarageForSale = model.getAreaOfGarageForSale();
		this.noOfParkinfForSale = model.getNoOfParkinfForSale();
		this.noOfCoveredParkingForSale=model.noOfCoveredParkingForSale;
		this.areaOfCoveredParkingForSale=model.areaOfCoveredParkingForSale;
		this.areaOfParkinfForSale = model.getAreaOfParkinfForSale();

		this.isDelayed = model.isDelayed;

		this.noOfMonthDelayed = model.getNoOfMonthDelayed();
		this.reasonForDelayed = model.getReasonForDelayed();

		this.costOfLand = model.costOfLand;
		this.estimatedCost = model.estimatedCost;
		this.totalProjectCost = model.totalProjectCost;

		this.isSubSqChangeInPlan = model.isSubSqChangeInPlan;
		this.totalAmtClctedFrmAllotee = model.totalAmtClctedFrmAllotee;
		this.totalAmtUsedInPrjct = model.totalAmtUsedInPrjct;
		this.totalBalAmtOfAlte = model.totalBalAmtOfAlte;
		this.devCompletion = model.devCompletion;
		this.devPending = model.devPending;

		this.northlatitude=model.northlatitude;
		this.northlongitude=model.northlongitude;
		this.southlatitude=model.southlatitude;
		this.southlongitude=model.southlongitude;
		this.eastlatitude=model.eastlatitude;
		this.eastlongitude=model.eastlongitude;
		this.westlatitude=model.westlatitude;
		this.westlongitude=model.westlongitude;

	}





	public List<ProjectQuaterlyUpdate> getQuarterlyUpdate() {
		return quarterlyUpdate;
	}





	public void setQuarterlyUpdate(List<ProjectQuaterlyUpdate> quarterlyUpdate) {
		this.quarterlyUpdate = quarterlyUpdate;
	}





	public ProjectSummary getProjectSummary() {
		return projectSummary;
	}





	public void setProjectSummary(ProjectSummary projectSummary) {
		this.projectSummary = projectSummary;
	}





	public List<FinalApproval> getFinalApproval() {
		return finalApproval;
	}





	public void setFinalApproval(List<FinalApproval> finalApproval) {
		this.finalApproval = finalApproval;
	}





	public List<TowerDetailsModel> getTowerDetailsList() {
		return towerDetailsList;
	}





	public void setTowerDetailsList(List<TowerDetailsModel> towerDetailsList) {
		this.towerDetailsList = towerDetailsList;
	}





	public PlotsLandCostDetailsModel getPlotLandCostDetailsModel() {
		return plotLandCostDetailsModel;
	}





	public void setPlotLandCostDetailsModel(PlotsLandCostDetailsModel plotLandCostDetailsModel) {
		this.plotLandCostDetailsModel = plotLandCostDetailsModel;
	}






	public List<PlotsFinalApproval> getPlotfinalApproval() {
		return plotfinalApproval;
	}





	public void setPlotfinalApproval(List<PlotsFinalApproval> plotfinalApproval) {
		this.plotfinalApproval = plotfinalApproval;
	}





	public List<PlotsDetailsModel> getPlotDetailsList() {
		return plotDetailsList;
	}





	public void setPlotDetailsList(List<PlotsDetailsModel> plotDetailsList) {
		this.plotDetailsList = plotDetailsList;
	}





	public PlotsCostSummary getPlotSummary() {
		return plotSummary;
	}





	public void setPlotSummary(PlotsCostSummary plotSummary) {
		this.plotSummary = plotSummary;
	}





	public List<PlotsQuaterlyUpdate> getPlotsQuarterlyUpdate() {
		return plotsQuarterlyUpdate;
	}





	public void setPlotsQuarterlyUpdate(List<PlotsQuaterlyUpdate> plotsQuarterlyUpdate) {
		this.plotsQuarterlyUpdate = plotsQuarterlyUpdate;
	}









	public List<WebSiteUrlDetailsModel> getWebSiteUrlDetails() {
		return webSiteUrlDetails;
	}





	public void setWebSiteUrlDetails(List<WebSiteUrlDetailsModel> webSiteUrlDetails) {
		this.webSiteUrlDetails = webSiteUrlDetails;
	}





	public Document getAdvertisementDoc() {
		return advertisementDoc;
	}





	public void setAdvertisementDoc(Document advertisementDoc) {
		this.advertisementDoc = advertisementDoc;
	}





	public Document getProspectusOrBrochureDoc() {
		return prospectusOrBrochureDoc;
	}





	public void setProspectusOrBrochureDoc(Document prospectusOrBrochureDoc) {
		this.prospectusOrBrochureDoc = prospectusOrBrochureDoc;
	}

	public K2PaymentDetailsModel getK2PaymentDetailsModel() {
		return k2PaymentDetailsModel;
	}

	public void setK2PaymentDetailsModel(K2PaymentDetailsModel k2PaymentDetailsModel) {
		this.k2PaymentDetailsModel = k2PaymentDetailsModel;
	}

	public K2PaymentDetailsModel getK2PenaltyPaymentDetailsModel() {
		return k2PenaltyPaymentDetailsModel;
	}

	public void setK2PenaltyPaymentDetailsModel(K2PaymentDetailsModel k2PenaltyPaymentDetailsModel) {
		this.k2PenaltyPaymentDetailsModel = k2PenaltyPaymentDetailsModel;
	}

	public PlotsConstructionCostmodel getPlotsConstructionCostModel() {
		return plotsConstructionCostModel;
	}

	public void setPlotsConstructionCostModel(PlotsConstructionCostmodel plotsConstructionCostModel) {
		this.plotsConstructionCostModel = plotsConstructionCostModel;
	}






	/*
	public List<Document> getAdvertiseDocList() {
		return advertiseDocList;
	}





	public void setAdvertiseDocList(List<Document> advertiseDocList) {
		this.advertiseDocList = advertiseDocList;
	}





	public List<Document> getProspectusBrochureDocList() {
		return prospectusBrochureDocList;
	}





	public void setProspectusBrochureDocList(List<Document> prospectusBrochureDocList) {
		this.prospectusBrochureDocList = prospectusBrochureDocList;
	}

	 */




}
