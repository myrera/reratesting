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

@Entity(name = "StructuralEngineerDetailsModel")
@Table(name = "TT_PROJECT_STC_ENG")

public class StructuralEngineerDetailsModel {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "PROJECT_STC_ENG_ID")
	private Long projStcEngId;
	
	
	@Column(name = "EMAILID",length=100)
	private String emailId;
	

	
	
	@Column(name = "ENG_NAME")
	private String engineerName;


	@Column(name="STATUS")
	private String status;
	
	@Column(name="ADDED_ON")
	private Calendar addedOn;
	
	@Column(name="SEPARATED_ON")
	private Calendar separatedOn;
	
	
	@Column(name = "ADDRESS_LINE_1",length=500)
	private String addressLine1;
	
	
	
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

	public DistrictModel getDistrictModel() {
		return districtModel;
	}

	public void setDistrictModel(DistrictModel districtModel) {
		this.districtModel = districtModel;
	}

	public String getKeyProject() {
		return keyProject;
	}

	public void setKeyProject(String keyProject) {
		this.keyProject = keyProject;
	}

	@ManyToOne
	@JoinColumn(name="DISTRICT_ID")
	private DistrictModel districtModel;
	
	
	public String getAddressLine1() {
		return addressLine1;
	}

	public void setAddressLine1(String addressLine1) {
		this.addressLine1 = addressLine1;
	}

	@Column(name = "ADDRESS_LINE_2",length=500)
	private String addressLine2;
	
	@Column(name = "YAAR_OF_EST",length=50)
	private String yearOfEstablishment;
	
	@Column(name = "KEY_PROJ_COMPLT",length=400)
	private String keyProject;
	
	@Column(name = "LOCAL_AUTH_LICENCE_NUM")
	private String localAuthorityLicenceNumber;
	
	
	
	
	public String getLocalAuthorityLicenceNumber() {
		return localAuthorityLicenceNumber;
	}

	public void setLocalAuthorityLicenceNumber(String localAuthorityLicenceNumber) {
		this.localAuthorityLicenceNumber = localAuthorityLicenceNumber;
	}

	public String getAddressLine2() {
		return addressLine2;
	}

	public void setAddressLine2(String addressLine2) {
		this.addressLine2 = addressLine2;
	}

	@Column(name = "PIN_CODE",length=400)
	private String pinCode;
	
	

	public Long getProjStcEngId() {
		return projStcEngId;
	}

	public void setProjStcEngId(Long projStcEngId) {
		this.projStcEngId = projStcEngId;
	}

	public String getEngineerName() {
		return engineerName;
	}

	public void setEngineerName(String engineerName) {
		this.engineerName = engineerName;
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

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((projStcEngId == null) ? 0 : projStcEngId.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		StructuralEngineerDetailsModel other = (StructuralEngineerDetailsModel) obj;
		if (projStcEngId == null) {
			if (other.projStcEngId != null)
				return false;
		} else if (!projStcEngId.equals(other.projStcEngId))
			return false;
		return true;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	
}
