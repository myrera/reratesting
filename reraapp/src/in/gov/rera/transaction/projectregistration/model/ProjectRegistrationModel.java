package in.gov.rera.transaction.projectregistration.model;

import java.io.Serializable;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Calendar;
import java.util.Date;
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
import javax.persistence.Transient;

import in.gov.rera.common.model.EnquiryModel;
import in.gov.rera.common.model.UserModel;
import in.gov.rera.common.util.DocumentEncryptor;
import in.gov.rera.dms.beans.Document;
import in.gov.rera.master.zone.model.ZoneModel;

@Entity(name = "ProjectRegistrationModel")
@Table(name = "TT_PROJECT_REG")
public class ProjectRegistrationModel implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Transient
	private UserModel certificateUser;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "PROJECT_REG_ID")

	private Long projectRegId;

	@Column(name = "PROJECT_NEW_REG_NO", length = 50)
	private String projectRegistrationNo;

	public String getProjectOldRegistrationNo() {

		if (projectOldRegistrationNo == null || projectOldRegistrationNo.trim().length() == 0)
			return projectRegistrationNo;

		return projectOldRegistrationNo;
	}

	@Column(name = "PROJECT_REG_NO", length = 50)
	private String projectOldRegistrationNo;

	@Column(name = "PRO_REG_APP_NO")
	private String applicationNo;

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((projectRegId == null) ? 0 : projectRegId.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (!(obj instanceof ProjectRegistrationModel))
			return false;
		ProjectRegistrationModel other = (ProjectRegistrationModel) obj;
		if (projectRegId == null) {
			if (other.projectRegId != null)
				return false;
		} else if (!projectRegId.equals(other.projectRegId))
			return false;
		return true;
	}

	@Column(name = "STATUS")
	private String status;

	@Column(name = "REG_TYPE")
	private String registrationType;

	@Column(name = "REASON_FOR_REVOKE", length = 500)
	private String reasonForRevoke;

	@Column(name = "REASON_FOR_REJECT", length = 5000)
	private String reasonForRejection;

	@Column(name = "APPROVED_ON")
	private Calendar approvedOn;

	@Column(name = "EXPRIRED_DATE")
	private Calendar expireDate;

	@Column(name = "LAST_UPDATED_ON")
	private Calendar lastUpdatedOn;

	@ManyToOne
	@JoinColumn(name = "APPROVED_BY")
	private UserModel approvedBy;

	@ManyToOne
	@JoinColumn(name = "REJECTED_BY")
	private UserModel rejectedBy;

	@Column(name = "REJECTED_ON")
	private Calendar rejectedOn;

	@ManyToOne
	@JoinColumn(name = "AUTH_USER")
	private UserModel authorityUser;

	@Column(name = "REG_UPDATED")
	private String updatedFlag;
	
	//alerts started
	
	@Column(name = "FIRST_ENQUIRY_DATE")
	private Date firstEnquiryDate;
	
	@Column(name = "SECOND_ENQUIRY_DATE")
	private Date secondEnquiryDate;
	
	@Column(name = "PROMOTER_UPDATED_DATE")
	private Calendar promoterUpdatedOn;
	
	@Column(name = "RETURNED_BY_L1_DATE")
	private Calendar returnedByL1On;
	
	@Column(name = "RETURNED_BY_L2_DATE")
	private Calendar returnedByL2On;
	
	@Column(name = "FORWARD_BY_L0_DATE")
	private Calendar forwardByL0On;
	
	@Column(name = "FORWARD_BY_L0_UPDATEDDATE")
	private Calendar forwardByL0UpdatedOn;

	public Calendar getForwardByL0On() {
		return forwardByL0On;
	}

	public void setForwardByL0On(Calendar forwardByL0On) {
		this.forwardByL0On = forwardByL0On;
	}

	public Calendar getForwardByL0UpdatedOn() {
		return forwardByL0UpdatedOn;
	}

	public void setForwardByL0UpdatedOn(Calendar forwardByL0UpdatedOn) {
		this.forwardByL0UpdatedOn = forwardByL0UpdatedOn;
	}

	public Calendar getReturnedByL2On() {
		return returnedByL2On;
	}

	public void setReturnedByL2On(Calendar returnedByL2On) {
		this.returnedByL2On = returnedByL2On;
	}

	public Calendar getReturnedByL1On() {
		return returnedByL1On;
	}

	public void setReturnedByL1On(Calendar returnedByL1On) {
		this.returnedByL1On = returnedByL1On;
	}

	public Date getFirstEnquiryDate() {
		return firstEnquiryDate;
	}

	public void setFirstEnquiryDate(Date firstEnquiryDate) {
		this.firstEnquiryDate = firstEnquiryDate;
	}

	public Date getSecondEnquiryDate() {
		return secondEnquiryDate;
	}

	public void setSecondEnquiryDate(Date secondEnquiryDate) {
		this.secondEnquiryDate = secondEnquiryDate;
	}

	public Calendar getPromoterUpdatedOn() {
		return promoterUpdatedOn;
	}

	public void setPromoterUpdatedOn(Calendar promoterUpdatedOn) {
		this.promoterUpdatedOn = promoterUpdatedOn;
	}
	
	//alerts ended

	@Column(name = "CLARITY_ACCEPTED")
	private Boolean clarificationAccepted;

	@Column(name = "frozen")
	private String frozen;

	@Column(name = "DOCS_STATUS")
	private String documentStatus;

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private Set<PerviousProjectDetailsModel> previousProjectDetailsSet;

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "PROJECT_DELS_ID")
	private ProjectDetailsModel projectDetailsModel;

	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name = "Project_REMARKS_ID")
	private ProjectRemarks projectRemarks;

	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name = "PROJECT_USER_ID")
	private UserModel projectUser;

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private Set<DevelopmentDetailsModel> developmentDetailSet;

	@OneToMany(cascade = CascadeType.PERSIST, fetch = FetchType.LAZY)
	private Set<ProjectAgentModel> projectAgentDetailSet;

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private Set<ProjectArchitectDetailsModel> projectArchitectDetailSet;

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private Set<StructuralEngineerDetailsModel> structuralEngineerDetailSet;

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private Set<ProjectContratorDetailsModel> projectContratorDetailSet;

	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name = "PROJECT_REG_EXT_ID")
	private ProjectRegExtensionModel projectExtention;

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private Set<Document> projectPhotoDetailSet;

	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name = "PROMOTER_DELS_ID")
	private PromoterDetailsModel promoterDetailsModel;

	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name = "EXT_DEV_ID")
	private ExternalDevelopmentWorkModel externalDevelopmentWorkModel;

	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name = "PROJECT_BANK_DELS_ID")
	private ProjectBankDetailsModel projectBankDetailsModel;

	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name = "PROJ_DOC_ID")
	private ProjectDocModel projectDocModel;

	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name = "PROJ_ADD_DOC_ID")
	private ProjectAdditionalFileDocModel projectAddDocModel;

	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name = "PROJECT_PAYMENT_DELS_ID")
	private ProjectPaymentDetailsModel paymentDetailsModel;
	
	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name = "PENALTY_PAYMENT_DELS_ID")
	private ProjectPaymentDetailsModel PenaltypaymentDetailsModel;

	@Column(name = "CREATED_ON")
	@Temporal(TemporalType.TIMESTAMP)
	private Calendar createdOn;

	public ProjectRemarks getProjectRemarks() {
		return projectRemarks;
	}

	public void setProjectRemarks(ProjectRemarks projectRemarks) {
		this.projectRemarks = projectRemarks;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@OrderColumn(name = "orders_index")
	private List<EnquiryModel> enquiryList;

	@ManyToOne
	@JoinColumn(name = "ZONE_ID")
	private ZoneModel zone;

	public ProjectAdditionalFileDocModel getProjectAddDocModel() {
		return projectAddDocModel;
	}

	public void setProjectAddDocModel(ProjectAdditionalFileDocModel projectAddDocModel) {
		this.projectAddDocModel = projectAddDocModel;
	}

	public String getDocumentStatus() {
		return documentStatus;
	}

	public void setDocumentStatus(String documentStatus) {
		this.documentStatus = documentStatus;
	}

	public ZoneModel getZone() {
		return zone;
	}

	public void setZone(ZoneModel zone) {
		this.zone = zone;
	}

	public List<EnquiryModel> getEnquiryList() {
		return enquiryList;
	}

	public void setEnquiryList(List<EnquiryModel> enquiryList) {
		this.enquiryList = enquiryList;
	}

	public ProjectRegExtensionModel getProjectExtention() {
		return projectExtention;
	}

	public void setProjectExtention(ProjectRegExtensionModel projectExtention) {
		this.projectExtention = projectExtention;
	}

	public String getReasonForRevoke() {
		return reasonForRevoke;
	}

	public void setReasonForRevoke(String reasonForRevoke) {
		this.reasonForRevoke = reasonForRevoke;
	}

	public String getUpdatedFlag() {
		return updatedFlag;
	}

	public void setUpdatedFlag(String updatedFlag) {
		this.updatedFlag = updatedFlag;
	}

	public String getApplicationNo() {
		return applicationNo;
	}

	public void setApplicationNo(String applicationNo) {
		this.applicationNo = applicationNo;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Calendar getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(Calendar createdOn) {
		this.createdOn = createdOn;
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

	public UserModel getAuthorityUser() {
		return authorityUser;
	}

	public void setAuthorityUser(UserModel authorityUser) {
		this.authorityUser = authorityUser;
	}

	public ProjectDetailsModel getProjectDetailsModel() {
		return projectDetailsModel;
	}

	public void setProjectDetailsModel(ProjectDetailsModel projectDetailsModel) {
		this.projectDetailsModel = projectDetailsModel;
	}

	public ExternalDevelopmentWorkModel getExternalDevelopmentWorkModel() {
		return externalDevelopmentWorkModel;
	}

	public void setExternalDevelopmentWorkModel(ExternalDevelopmentWorkModel externalDevelopmentWorkModel) {
		this.externalDevelopmentWorkModel = externalDevelopmentWorkModel;
	}

	public ProjectBankDetailsModel getProjectBankDetailsModel() {
		return projectBankDetailsModel;
	}

	public void setProjectBankDetailsModel(ProjectBankDetailsModel projectBankDetailsModel) {
		this.projectBankDetailsModel = projectBankDetailsModel;
	}

	public String getProjectRegistrationNo() {
		return projectRegistrationNo;
	}

	public void setProjectRegistrationNo(String projectRegistrationNo) {
		this.projectRegistrationNo = projectRegistrationNo;
	}

	public UserModel getProjectUser() {
		return projectUser;
	}

	public void setProjectUser(UserModel projectUser) {
		this.projectUser = projectUser;
	}

	public Long getProjectRegId() {
		return projectRegId;
	}

	public void setProjectRegId(Long projectRegId) {
		this.projectRegId = projectRegId;
	}

	public Set<PerviousProjectDetailsModel> getPreviousProjectDetailsSet() {
		return previousProjectDetailsSet;
	}

	public void setPreviousProjectDetailsSet(Set<PerviousProjectDetailsModel> previousProjectDetailsSet) {
		this.previousProjectDetailsSet = previousProjectDetailsSet;
	}

	public Set<DevelopmentDetailsModel> getDevelopmentDetailSet() {
		return developmentDetailSet;
	}

	public void setDevelopmentDetailSet(Set<DevelopmentDetailsModel> developmentDetailSet) {
		this.developmentDetailSet = developmentDetailSet;
	}

	public Set<ProjectArchitectDetailsModel> getProjectArchitectDetailSet() {
		return projectArchitectDetailSet;
	}

	public void setProjectArchitectDetailSet(Set<ProjectArchitectDetailsModel> projectArchitectDetailSet) {
		this.projectArchitectDetailSet = projectArchitectDetailSet;
	}

	public Set<StructuralEngineerDetailsModel> getStructuralEngineerDetailSet() {
		return structuralEngineerDetailSet;
	}

	public void setStructuralEngineerDetailSet(Set<StructuralEngineerDetailsModel> structuralEngineerDetailSet) {
		this.structuralEngineerDetailSet = structuralEngineerDetailSet;
	}

	public Set<ProjectContratorDetailsModel> getProjectContratorDetailSet() {
		return projectContratorDetailSet;
	}

	public void setProjectContratorDetailSet(Set<ProjectContratorDetailsModel> projectContratorDetailSet) {
		this.projectContratorDetailSet = projectContratorDetailSet;
	}

	public Set<Document> getProjectPhotoDetailSet() {
		return projectPhotoDetailSet;
	}

	public void setProjectPhotoDetailSet(Set<Document> projectPhotoDetailSet) {
		this.projectPhotoDetailSet = projectPhotoDetailSet;
	}

	public Set<ProjectAgentModel> getProjectAgentDetailSet() {
		return projectAgentDetailSet;
	}

	public void setProjectAgentDetailSet(Set<ProjectAgentModel> projectAgentDetailSet) {
		this.projectAgentDetailSet = projectAgentDetailSet;
	}

	public PromoterDetailsModel getPromoterDetailsModel() {
		return promoterDetailsModel;
	}

	public void setPromoterDetailsModel(PromoterDetailsModel promoterDetailsModel) {
		this.promoterDetailsModel = promoterDetailsModel;
	}

	public ProjectDocModel getProjectDocModel() {
		return projectDocModel;
	}

	public void setProjectDocModel(ProjectDocModel projectDocModel) {
		this.projectDocModel = projectDocModel;
	}

	public ProjectPaymentDetailsModel getPaymentDetailsModel() {
		return paymentDetailsModel;
	}

	public void setPaymentDetailsModel(ProjectPaymentDetailsModel paymentDetailsModel) {
		this.paymentDetailsModel = paymentDetailsModel;
	}

	public String getRegistrationType() {
		return registrationType;
	}

	public void setRegistrationType(String registrationType) {
		this.registrationType = registrationType;
	}

	public UserModel getRejectedBy() {
		return rejectedBy;
	}

	public void setRejectedBy(UserModel rejectedBy) {
		this.rejectedBy = rejectedBy;
	}

	public Calendar getRejectedOn() {
		return rejectedOn;
	}

	public void setRejectedOn(Calendar rejectedOn) {
		this.rejectedOn = rejectedOn;
	}

	public String getReasonForRejection() {
		return reasonForRejection;
	}

	public void setReasonForRejection(String reasonForRejection) {
		this.reasonForRejection = reasonForRejection;
	}

	public String getFrozen() {
		return frozen;
	}

	public void setFrozen(String frozen) {
		this.frozen = frozen;
	}

	public Boolean isClarificationAccepted() {
		return clarificationAccepted;
	}

	public void setClarificationAccepted(Boolean clarificationAccepted) {
		this.clarificationAccepted = clarificationAccepted;
	}

	public String getProjId() throws UnsupportedEncodingException {
		return URLEncoder.encode(DocumentEncryptor.encrypt(projectRegId.toString()),
				java.nio.charset.StandardCharsets.UTF_8.toString());
	}

	public UserModel getCertificateUser() {
		return certificateUser;
	}

	public void setCertificateUser(UserModel certificateUser) {
		this.certificateUser = certificateUser;
	}

	public ProjectPaymentDetailsModel getPenaltypaymentDetailsModel() {
		return PenaltypaymentDetailsModel;
	}

	public void setPenaltypaymentDetailsModel(ProjectPaymentDetailsModel penaltypaymentDetailsModel) {
		PenaltypaymentDetailsModel = penaltypaymentDetailsModel;
	}
	
	

}
