package in.gov.rera.transaction.projectregistration.model;

import in.gov.rera.dms.beans.Document;
import in.gov.rera.master.district.model.DistrictModel;
import in.gov.rera.master.subdistrict.model.SubDistrictModel;

import java.io.Serializable;
import java.util.Calendar;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity(name = "PreviousProjectDetailsModel")
@Table(name = "TL_PERIVIOUS_PROJECT_DETAILS")
public class PerviousProjectDetailsModel implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "PERV_PROJ_ID")
	private Long pervProjectRegId;
	
	
	

	@Column(name = "PROJECT_NAME", length = 150)
	private String projectName;

	@Column(name = "PROJECT_DESC", length = 400)
	private String projectDescription;

	@Column(name = "PROJECT_CURENT_STATUS", length = 50)
	private String projectCurrentStatus;

	@Column(name = "TYPE_OF_LAND")
	private String typeOfLand;

	@Column(name = "IF_DELAYED")
	private Boolean ifDelayed;

	@Column(name = "NO_OF_MONTH_DELAYED")
	private String noOfMonthDelayed;

	@Column(name = "IF_ONGOING")
	private Boolean ifOngoing;

	@Column(name = "EXPECTEDCOMPLETIONDATE")
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	private Calendar expectedCompletionDate;



	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "DISTRICT_ID")
	private DistrictModel districtModel;
	

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "PROJECT_COML_DOC_ID")
	private Document completionDocId;
	

	@Column(name = "LATITUDE", length = 500)
	private String Latitude;
	
	@Column(name = "LONGITUDE", length = 500)
	private String Longitude;
	
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
			
			// end Addedd latitude and longitude
			
			
			
	
	@Column(name = "PROJECT_ADDRESS", length = 500)
	private String projectAddress;
	
	@Column(name = "IS_CASES_PENDING")
	private String isCasesPending;
	
	@Column(name = "PRJ_CASES_DETAILS",length=500)
	private String caseDetails;
	
	@Column(name = "IS_PAYMENT_PENDING")
	private String isPaymentPending;
	
	@Column(name="PENDING_AMOUNT")
	private Long pendingAmount;
	
	
	

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

	public void setIsCasesPending(String isCasesPending) {
		this.isCasesPending = isCasesPending;
	}
	
	public String getIsCasesPending() {
		return isCasesPending;
	}

	
	

	public String getCaseDetails() {
		return caseDetails;
	}

	public void setCaseDetails(String caseDetails) {
		this.caseDetails = caseDetails;
	}

	
	
	public String getIsPaymentPending() {
		return isPaymentPending;
	}

	public void setIsPaymentPending(String isPaymentPending) {
		this.isPaymentPending = isPaymentPending;
	}

	@Column(name = "PIN_CODE", length = 20)
	private String projectAddrPinCode;

	



	public String getProjectDescription() {
		return projectDescription;
	}

	public void setProjectDescription(String projectDescription) {
		this.projectDescription = projectDescription;
	}

	public String getProjectCurrentStatus() {
		return projectCurrentStatus;
	}

	public void setProjectCurrentStatus(String projectCurrentStatus) {
		this.projectCurrentStatus = projectCurrentStatus;
	}

	public String getTypeOfLand() {
		return typeOfLand;
	}

	public void setTypeOfLand(String typeOfLand) {
		this.typeOfLand = typeOfLand;
	}

	public Boolean getIfDelayed() {
		return ifDelayed;
	}

	public void setIfDelayed(Boolean ifDelayed) {
		this.ifDelayed = ifDelayed;
	}

	public String getNoOfMonthDelayed() {
		return noOfMonthDelayed;
	}

	public void setNoOfMonthDelayed(String noOfMonthDelayed) {
		this.noOfMonthDelayed = noOfMonthDelayed;
	}

	public Boolean getIfOngoing() {
		return ifOngoing;
	}

	public void setIfOngoing(Boolean ifOngoing) {
		this.ifOngoing = ifOngoing;
	}

	public Calendar getExpectedCompletionDate() {
		return expectedCompletionDate;
	}

	public void setExpectedCompletionDate(Calendar expectedCompletionDate) {
		this.expectedCompletionDate = expectedCompletionDate;
	}




	


	public Long getPervProjectRegId() {
		return pervProjectRegId;
	}

	public void setPervProjectRegId(Long pervProjectRegId) {
		this.pervProjectRegId = pervProjectRegId;
	}

	public String getProjectAddress() {
		return projectAddress;
	}

	public void setProjectAddress(String projectAddress) {
		this.projectAddress = projectAddress;
	}

	

	public String getProjectAddrPinCode() {
		return projectAddrPinCode;
	}

	public void setProjectAddrPinCode(String projectAddrPinCode) {
		this.projectAddrPinCode = projectAddrPinCode;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public Long getPendingAmount() {
		return pendingAmount;
	}

	public void setPendingAmount(Long pendingAmount) {
		this.pendingAmount = pendingAmount;
	}

	/**
	 * @return the completionDocId
	 */
	public Document getCompletionDocId() {
		return completionDocId;
	}

	/**
	 * @param completionDocId the completionDocId to set
	 */
	public void setCompletionDocId(Document completionDocId) {
		this.completionDocId = completionDocId;
	}

	public DistrictModel getDistrictModel() {
		return districtModel;
	}

	public void setDistrictModel(DistrictModel districtModel) {
		this.districtModel = districtModel;
	}
}
