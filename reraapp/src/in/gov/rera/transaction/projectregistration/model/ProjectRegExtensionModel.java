package in.gov.rera.transaction.projectregistration.model;

import in.gov.rera.common.model.EnquiryModel;
import in.gov.rera.common.model.UserModel;
import in.gov.rera.dms.beans.Document;

import java.util.Calendar;
import java.util.List;
import java.util.Set;

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



@Entity(name = "ProjectRegExtensionModel")
@Table(name = "TT_PROJECT_REG_EXT")
public class ProjectRegExtensionModel {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "PROJECT_REG_EXT_ID")
	private Long projectExtId;
	
	@Column(name = "PRO_REGEXT_APP_NO")
	private String applicationNo;
	
	@ManyToOne
	@JoinColumn(name="PROJECT_REG_ID")
	private ProjectRegistrationModel projectRegistration;
	
	@Column(name="EXTEND_TO_DATE")
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	private Calendar extendToDate;
	
	@Column(name="REASON_FOR_EXTEND")
	private String reasonForExtends;
	
	@Column(name="REMARKS",length=2500)
	private String remarks;
	
	@Column(name="STATUS")
	private String status;
	
	@Column(name="REG_TYPE")
	private String registrationType;
	
	@Column(name = "REASON_FOR_REVOKE",length=500)
	private String reasonForRevoke;
	
	@Column(name="CREATED_ON")
	private Calendar createdOn;
	
	@Column(name="APPROVED_ON")
	private Calendar approvedOn;
	
	
	@Column(name="EXPRIRED_DATE")
	private Calendar expireDate;
	
	@Column(name="LAST_UPDATED_ON")
	private Calendar lastUpdatedOn;
	
	@ManyToOne
	@JoinColumn(name="APPROVED_BY")
	private UserModel approvedBy;

	@ManyToOne
	@JoinColumn(name="ASSIGN_TO")
	private UserModel assignTo;
	
	@OneToOne(cascade=CascadeType.ALL,fetch=FetchType.LAZY)
	@JoinColumn(name="PROJECT_PAYMENT_ID")
	private ProjectPaymentDetailsModel paymentDetailsModel;
	
	@OneToMany( cascade = CascadeType.ALL,fetch=FetchType.LAZY)
	private Set<Document> supportingDocs;

	
	 @OneToMany(cascade = CascadeType.ALL, fetch=FetchType.LAZY)
	 @OrderColumn(name="orders_index")
	 private List<EnquiryModel> enquiryList;
	 
	 
	
	public List<EnquiryModel> getEnquiryList() {
		return enquiryList;
	}

	public void setEnquiryList(List<EnquiryModel> enquiryList) {
		this.enquiryList = enquiryList;
	}
	
	
	
	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public Calendar getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(Calendar createdOn) {
		this.createdOn = createdOn;
	}

	public String getApplicationNo() {
		return applicationNo;
	}

	public void setApplicationNo(String applicationNo) {
		this.applicationNo = applicationNo;
	}

	public Long getProjectExtId() {
		return projectExtId;
	}

	public void setProjectExtId(Long projectExtId) {
		this.projectExtId = projectExtId;
	}

	public ProjectRegistrationModel getProjectRegistration() {
		return projectRegistration;
	}

	public void setProjectRegistration(ProjectRegistrationModel projectRegistration) {
		this.projectRegistration = projectRegistration;
	}

	public Calendar getExtendToDate() {
		return extendToDate;
	}

	public void setExtendToDate(Calendar extendToDate) {
		this.extendToDate = extendToDate;
	}

	public String getReasonForExtends() {
		return reasonForExtends;
	}

	public void setReasonForExtends(String reasonForExtends) {
		this.reasonForExtends = reasonForExtends;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getRegistrationType() {
		return registrationType;
	}

	public void setRegistrationType(String registrationType) {
		this.registrationType = registrationType;
	}

	public String getReasonForRevoke() {
		return reasonForRevoke;
	}

	public void setReasonForRevoke(String reasonForRevoke) {
		this.reasonForRevoke = reasonForRevoke;
	}

	public Calendar getApprovedOn() {
		return approvedOn;
	}

	public void setApprovedOn(Calendar approvedOn) {
		this.approvedOn = approvedOn;
	}

	public Calendar getExpireDate() {
		return expireDate;
	}

	public void setExpireDate(Calendar expireDate) {
		this.expireDate = expireDate;
	}

	public Calendar getLastUpdatedOn() {
		return lastUpdatedOn;
	}

	public void setLastUpdatedOn(Calendar lastUpdatedOn) {
		this.lastUpdatedOn = lastUpdatedOn;
	}

	public UserModel getApprovedBy() {
		return approvedBy;
	}

	public void setApprovedBy(UserModel approvedBy) {
		this.approvedBy = approvedBy;
	}

	public UserModel getAssignTo() {
		return assignTo;
	}

	public void setAssignTo(UserModel assignTo) {
		this.assignTo = assignTo;
	}

	public ProjectPaymentDetailsModel getPaymentDetailsModel() {
		return paymentDetailsModel;
	}

	public void setPaymentDetailsModel(
			ProjectPaymentDetailsModel paymentDetailsModel) {
		this.paymentDetailsModel = paymentDetailsModel;
	}

	public Set<Document> getSupportingDocs() {
		return supportingDocs;
	}

	public void setSupportingDocs(Set<Document> supportingDocs) {
		this.supportingDocs = supportingDocs;
	}
	
	
	

}
