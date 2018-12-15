package in.gov.rera.transaction.projectregistration.model;

import in.gov.rera.dms.beans.Document;
import in.gov.rera.master.district.model.DistrictModel;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity(name = "ProjectMemberDetailsModel")
@Table(name = "TL_PROJECT_MEMBER")

public class ProjectMemberDetailsModel {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "PROJECT_MEMBER_ID")
	private Long prjMemberChId;

	@ManyToOne
	@JoinColumn(name="PROJECT_CHAIRMAN_ID")
	private ProjectChairmanModel projectChairmanModel;
	
	
	@ManyToOne
	@JoinColumn(name="MEMBER_PHOTO_DOC")
	private Document momberPhotoDoc;
	
	@Column(name="MEMBER_NAME")
	private String memberName;
	
	@Column(name="MEMBER_TTPE")
	private String memberType;
	
	@Column(name="MOBILE_NO")
    private String mobileNo;
	
	@Column(name="EMAIL_ID")
    private String emailId;
	
	
	@Column(name="ADDRESS_LINE_NO1",length=500)
    private String addressLine1;
	
	
	@Column(name="ADDRESS_LINE_NO2",length=500)
    private String addressLine2;
	
	
	@Column(name="PINE_CODE")
	private String pinCode;

	@ManyToOne
	@JoinColumn(name="DISTRICT_ID")
    private DistrictModel districtModel;
	
	
	
	public Long getPrjMemberChId() {
		return prjMemberChId;
	}

	public void setPrjMemberChId(Long prjMemberChId) {
		this.prjMemberChId = prjMemberChId;
	}

	public ProjectChairmanModel getProjectChairmanModel() {
		return projectChairmanModel;
	}

	public void setProjectChairmanModel(ProjectChairmanModel projectChairmanModel) {
		this.projectChairmanModel = projectChairmanModel;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberType() {
		return memberType;
	}

	public void setMemberType(String memberType) {
		this.memberType = memberType;
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

	public Document getMomberPhotoDoc() {
		return momberPhotoDoc;
	}

	public void setMomberPhotoDoc(Document momberPhotoDoc) {
		this.momberPhotoDoc = momberPhotoDoc;
	}

	
	
	
}
