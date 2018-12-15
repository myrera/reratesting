package in.gov.rera.transaction.unregistered.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.OrderColumn;
import javax.persistence.Table;

import in.gov.rera.common.model.EnquiryModel;
import in.gov.rera.transaction.projectregistration.model.ProjectRemarks;

@Entity(name = "UnregisteredProjectDetail")
@Table(name = "TL_UNREG_PROJECT_DETAILS")
public class UnregisteredProjectDetail implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="UNREG_PROJ_DETAILS_ID")
	private Long unregProjectDetailsId;
	
	@Column(name = "PROJECT_NAME")
	private String projectName;

	@Column(name = "PROMOTER_NAME")
	private String promoterName;
	
	@Column(name = "EMAIL_ID")
	private String emailID;

	@Column(name = "PHONE_NUMBER")
	private Long phoneNumber;
	
	@Column(name = "CORPORATE_ADDRESS")
	private String  corpAddress;

	@Column(name = "PIN_CODE")
	private Long pinCode;
	
	@Column(name = "DISTRICT")
	private String district;

	@Column(name = "TALUK")
	private String taluk;
	
	@Column(name = "PROJECT_LOCATION")
	private String projectLocation;
	
	@Column(name = "WEBSITE_ADDRESS")
	private String websiteAddress;
	
	@Column(name = "SOURCE")
	private String source;
	
	@Column(name = "STATUS")
	private String status;
	
	@Column(name = "CREATED_BY")
	private String createdBy;
	
	public String getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name = "Project_REMARKS_ID")
	private ProjectRemarks projectRemarks;
	
	
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@OrderColumn(name = "orders_index")
	private List<EnquiryModel> enquiryList;

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getPromoterName() {
		return promoterName;
	}

	public void setPromoterName(String promoterName) {
		this.promoterName = promoterName;
	}

	public String getEmailID() {
		return emailID;
	}

	public void setEmailID(String emailID) {
		this.emailID = emailID;
	}

	public Long getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(Long phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getCorpAddress() {
		return corpAddress;
	}

	public void setCorpAddress(String corpAddress) {
		this.corpAddress = corpAddress;
	}

	public Long getPinCode() {
		return pinCode;
	}

	public void setPinCode(Long pinCode) {
		this.pinCode = pinCode;
	}

	public String getDistrict() {
		return district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

	public String getTaluk() {
		return taluk;
	}

	public void setTaluk(String taluk) {
		this.taluk = taluk;
	}

	public String getProjectLocation() {
		return projectLocation;
	}

	public void setProjectLocation(String projectLocation) {
		this.projectLocation = projectLocation;
	}

	public String getWebsiteAddress() {
		return websiteAddress;
	}

	public void setWebsiteAddress(String websiteAddress) {
		this.websiteAddress = websiteAddress;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public Long getUnregProjectDetailsId() {
		return unregProjectDetailsId;
	}

	public void setUnregProjectDetailsId(Long unregProjectDetailsId) {
		this.unregProjectDetailsId = unregProjectDetailsId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public List<EnquiryModel> getEnquiryList() {
		return enquiryList;
	}

	public void setEnquiryList(List<EnquiryModel> enquiryList) {
		this.enquiryList = enquiryList;
	}

	public ProjectRemarks getProjectRemarks() {
		return projectRemarks;
	}

	public void setProjectRemarks(ProjectRemarks projectRemarks) {
		this.projectRemarks = projectRemarks;
	}
	
	


}
