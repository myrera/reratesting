package in.gov.rera.transaction.projectregistration.model;

import java.util.Set;

import in.gov.rera.dms.beans.Document;
import in.gov.rera.master.district.model.DistrictModel;

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
import javax.persistence.Table;

@Entity(name = "ProjectChairmanModel")
@Table(name = "TL_PROJECT_CHAIRMAN")
public class ProjectChairmanModel {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "PROJECT_CHAIRMAN_ID")
	private Long projectChId;

	@Column(name = "CHAIRMAN_NAME")
	private String chairmanName;
	
	@Column(name = "CHAIRMAN_MOBILE_NO")
	private String mobileNo;
	
	@Column(name = "CHAIRMAN_EMAIL_ID")
	private String emailId;
	@Column(name = "CHAIRMAN_ADDRESS1",length=500)
	private String addressLine1;

	@Column(name = "CHAIRMAN_ADDRESS2",length=500)
	private String addressLine2;
	
	@Column(name = "PIN_CODE")
	private String pincode;
	
	@ManyToOne
	@JoinColumn(name="DISTRICT_ID")
    private DistrictModel districtModel;
	
	
	@ManyToOne
	@JoinColumn(name = "CHAIRMAN_PHOTO_DOC_ID")
	private Document document;

	public Long getProjectChId() {
		return projectChId;
	}

	@OneToMany(mappedBy = "projectChairmanModel", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private Set<ProjectMemberDetailsModel> memberSet;

	
	
	
	
	
	public String getPincode() {
		return pincode;
	}

	public void setPincode(String pincode) {
		this.pincode = pincode;
	}

	public DistrictModel getDistrictModel() {
		return districtModel;
	}

	public void setDistrictModel(DistrictModel districtModel) {
		this.districtModel = districtModel;
	}

	public void setProjectChId(Long projectChId) {
		this.projectChId = projectChId;
	}

	public String getChairmanName() {
		return chairmanName;
	}

	public void setChairmanName(String chairmanName) {
		this.chairmanName = chairmanName;
	}

	public String getMobileNo() {
		return mobileNo;
	}

	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
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

	public Document getDocument() {
		return document;
	}

	public void setDocument(Document document) {
		this.document = document;
	}

	public Set<ProjectMemberDetailsModel> getMemberSet() {
		return memberSet;
	}

	public void setMemberSet(Set<ProjectMemberDetailsModel> memberSet) {
		this.memberSet = memberSet;
	}

}
