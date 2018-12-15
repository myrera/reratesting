package in.gov.rera.transaction.projectregistration.model;


import java.util.Calendar;

import in.gov.rera.master.district.model.DistrictModel;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity(name = "ProjectArchitectDetails")
@Table(name = "TL_PROJECT_ARCHITECT_DETAILS")

public class ProjectArchitectDetailsModel {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "PROJECT_ARCH_ID")
	private Long projectArchId;
	
	@Column(name = "ARCHITECT_NAME",length=100)
	private String architectName;
	

	@Column(name="STATUS")
	private String status;
	
	@Column(name="ADDED_ON")
	private Calendar addedOn;
	
	@Column(name="SEPARATED_ON")
	private Calendar separatedOn;
	
	
	
	
	
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Calendar getAddedOn() {
		return addedOn;
	}

	public void setAddedOn(Calendar addedOn) {
		this.addedOn = addedOn;
	}

	public Calendar getSeparatedOn() {
		return separatedOn;
	}

	public void setSeparatedOn(Calendar separatedOn) {
		this.separatedOn = separatedOn;
	}

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

	@Column(name = "EMAILID",length=100)
	private String emailId;
	
	@Column(name = "ADDRESS_LINE_1",length=500)
	private String addressLine1;
	
	@Column(name = "ADDRESS_LINE_2",length=500)
	private String addressLine2;
	
	@Column(name = "YAAR_OF_EST")
	private String yearOfEstablishment;
	
	@Column(name = "KEY_PROJ_COMPLT")
	private String keyProject;
	
	@Column(name = "PIN_CODE")
	private String pinCode;
	
	@Column(name = "REG_OF_CAO_NUM")
	private String regOfCoaNo;

	
	

	public String getRegOfCoaNo() {
		return regOfCoaNo;
	}

	public void setRegOfCoaNo(String regOfCoaNo) {
		this.regOfCoaNo = regOfCoaNo;
	}

	public String getYearOfEstablishment() {
		return yearOfEstablishment;
	}

	public void setYearOfEstablishment(String yearOfEstablishment) {
		this.yearOfEstablishment = yearOfEstablishment;
	}


	public String getPinCode() {
		return pinCode;
	}

	public void setPinCode(String pinCode) {
		this.pinCode = pinCode;
	}

	public DistrictModel getDistrictModel() {
		return districtModel;
	}

	public void setDistrictModel(DistrictModel districtModel) {
		this.districtModel = districtModel;
	}

	@ManyToOne
	@JoinColumn(name="DISTRICT_ID")
	private DistrictModel districtModel;
	
	
	public Long getProjectArchId() {
		return projectArchId;
	}

	public void setProjectArchId(Long projectArchId) {
		this.projectArchId = projectArchId;
	}

	public String getArchitectName() {
		return architectName;
	}

	public void setArchitectName(String architectName) {
		this.architectName = architectName;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getKeyProject() {
		return this.keyProject;
	}

	public void setKeyProject(String keyProject) {
		this.keyProject = keyProject;
	}

	
	



}
