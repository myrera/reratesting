package in.gov.rera.transaction.agentregistration.model;

import java.io.Serializable;
import java.text.SimpleDateFormat;
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
import javax.persistence.Transient;

import in.gov.rera.common.model.EnquiryModel;
import in.gov.rera.common.model.UserModel;
import in.gov.rera.master.district.model.DistrictModel;
import in.gov.rera.master.office.model.OfficeModel;
import in.gov.rera.master.subdistrict.model.SubDistrictModel;
import in.gov.rera.master.zone.model.ZoneModel;
import in.gov.rera.transaction.projectregistration.model.ProjectAgentModel;

@Entity(name = "AgentRegistrationModel")
@Table(name = "TT_AGENT_REGISTRATION")
public class AgentRegistrationModel implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "AGENT_REG_ID")
	private Long agentRegistrationID;
	
	@Column(name = "AGENT_REG_APP_NO")
	private String applicationNo;
	
	@Column(name = "AGENT_NEW_REG_NO")
	private String agentRegistrationNo;
	
	@Column(name = "AGENT_REG_NO")
	private String agentOldRegistrationNo;
	
	@Column(name = "REASON_FOR_REVOKE")
	private String reasonForRevoke;
	

	@Column(name = "REG_UPDATED")
	private String updatedFlag;
	
	@Transient
	private UserModel certificateUser;
	
	@OneToMany(cascade =CascadeType.ALL,fetch = FetchType.LAZY)
	private Set<ProjectAgentModel> projectRegistrationModelSet;
	

	@Column(name="REG_TYPE")
	private String registrationType;
	
	@Column(name="STATUS")
	private String status;
	
	
	
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
	
	@Column(name = "REASON_FOR_REJECT",length=5000)
	private String reasonForRejection;
	
	@ManyToOne
	@JoinColumn(name="REJECTED_BY")
	private UserModel rejectedBy;
	
	@Column(name="REJECTED_ON")
	private Calendar rejectedOn;
	
	@OneToOne(  cascade = CascadeType.ALL,fetch =FetchType.EAGER)
	@JoinColumn(name="AGENT_REG_DETAILS_ID")
	private AgentDetailsModel agentDetailsModel;
	
	@OneToOne(  cascade = CascadeType.ALL,fetch =FetchType.EAGER)
	@JoinColumn(name="AGENT_USER_ID")
	private UserModel agentUser;

	@Column(name="AGENT_CREATED_ON")
	private String agentRegApprovedDate=new SimpleDateFormat("yyyy-MM-dd hh-mm-ss").format(new Date());
	

	@Column(name="REG_STAGE")
   private String registrationStage;
	
	 @OneToMany(cascade = CascadeType.ALL, fetch=FetchType.LAZY)
	 @OrderColumn(name="orders_index")
	private List<AgentRegistrationLog> registrationHistory;
	
	 
	 @OneToMany(cascade = CascadeType.ALL, fetch=FetchType.LAZY)
	 @OrderColumn(name="orders_index")
	 private List<EnquiryModel> enquiryList;

	 
	 
	 @ManyToOne
		@JoinColumn(name = "SUB_DISTRICT_ID")
		private SubDistrictModel subDistrictModel;
		
		
		@ManyToOne
		@JoinColumn(name="RERA_OFFICE")
		private OfficeModel office;
		
		@ManyToOne
		@JoinColumn(name = "DISTRICT_ID")
		private DistrictModel districtModel;
		
		@Column(name = "APPROVING_AUTHORITY")
		private String approvingAuthority;
	 
	 
		@ManyToOne
		@JoinColumn(name="OPERATOR_USER")
		private UserModel operator;
		
		@ManyToOne
		@JoinColumn(name="AUTH_USER")
		private UserModel authorityUser;
		
		@Column(name="OPERATOR_REMARKS",length=1500)
		private String operatorRemarks;
		
		@Column(name = "AUTHORITY_REMARKS",length=1500)
		private String authorityRemarks;
		
		@Column(name = "DOCS_STATUS")
		private String documentStatus;
 
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
		@ManyToOne
		@JoinColumn(name = "ZONE_ID")
		private ZoneModel zone; 
		
		@Column(name="PROJECT_STATUS")
		private String projectStatus;
		
		
	 
	public String getUpdatedFlag() {
			return updatedFlag;
		}

		public void setUpdatedFlag(String updatedFlag) {
			this.updatedFlag = updatedFlag;
		}

	public ZoneModel getZone() {
			return zone;
		}

		public void setZone(ZoneModel zone) {
			this.zone = zone;
		}

	public UserModel getOperator() {
			return operator;
		}

		public void setOperator(UserModel operator) {
			this.operator = operator;
		}

		public UserModel getAuthorityUser() {
			return authorityUser;
		}

		public void setAuthorityUser(UserModel authorityUser) {
			this.authorityUser = authorityUser;
		}

		public String getOperatorRemarks() {
			return operatorRemarks;
		}

		public void setOperatorRemarks(String operatorRemarks) {
			this.operatorRemarks = operatorRemarks;
		}

		public String getAuthorityRemarks() {
			return authorityRemarks;
		}

		public void setAuthorityRemarks(String authorityRemarks) {
			this.authorityRemarks = authorityRemarks;
		}

		public String getDocumentStatus() {
			return documentStatus;
		}

		public void setDocumentStatus(String documentStatus) {
			this.documentStatus = documentStatus;
		}

	public SubDistrictModel getSubDistrictModel() {
			return subDistrictModel;
		}

		public void setSubDistrictModel(SubDistrictModel subDistrictModel) {
			this.subDistrictModel = subDistrictModel;
		}

		public OfficeModel getOffice() {
			return office;
		}

		public void setOffice(OfficeModel office) {
			this.office = office;
		}

		public DistrictModel getDistrictModel() {
			return districtModel;
		}

		public void setDistrictModel(DistrictModel districtModel) {
			this.districtModel = districtModel;
		}

		public String getApprovingAuthority() {
			return approvingAuthority;
		}

		public void setApprovingAuthority(String approvingAuthority) {
			this.approvingAuthority = approvingAuthority;
		}

	public String getApplicationNo() {
		return applicationNo;
	}

	public void setApplicationNo(String applicationNo) {
		this.applicationNo = applicationNo;
	}

	public List<EnquiryModel> getEnquiryList() {
		return enquiryList;
	}

	public void setEnquiryList(List<EnquiryModel> enquiryList) {
		this.enquiryList = enquiryList;
	}

	public String getAgentRegistrationNo() {
		return agentRegistrationNo;
	}

	public void setAgentRegistrationNo(String agentRegistrationNo) {
		this.agentRegistrationNo = agentRegistrationNo;
	}

	
	

	public String getReasonForRevoke() {
		return reasonForRevoke;
	}

	public void setReasonForRevoke(String reasonForRevoke) {
		this.reasonForRevoke = reasonForRevoke;
	}



	
	
	public Set<ProjectAgentModel> getProjectRegistrationModelSet() {
		return projectRegistrationModelSet;
	}

	public void setProjectRegistrationModelSet(
			Set<ProjectAgentModel> projectRegistrationModelSet) {
		this.projectRegistrationModelSet = projectRegistrationModelSet;
	}

	public UserModel getAssignTo() {
		return assignTo;
	}

	public void setAssignTo(UserModel assignTo) {
		this.assignTo = assignTo;
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

	public String getRegistrationType() {
		return registrationType;
	}

	public void setRegistrationType(String registrationType) {
		this.registrationType = registrationType;
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


	
	public String getAgentRegApprovedDate() {
		return agentRegApprovedDate;
	}

	public void setAgentRegApprovedDate(String agentRegApprovedDate) {
		this.agentRegApprovedDate = agentRegApprovedDate;
	}


	public UserModel getAgentUser() {
		return agentUser;
	}

	public void setAgentUser(UserModel agentUser) {
		this.agentUser = agentUser;
	}

	public Long getAgentRegistrationID() {
		return agentRegistrationID;
	}

	public void setAgentRegistrationID(Long agentRegistrationID) {
		this.agentRegistrationID = agentRegistrationID;
	}

	public AgentDetailsModel getAgentDetailsModel() {
		return agentDetailsModel;
	}

	public void setAgentDetailsModel(AgentDetailsModel agentDetailsModel) {
		this.agentDetailsModel = agentDetailsModel;
	}
	
	
	

	public String getRegistrationStage() {
		return registrationStage;
	}

	public void setRegistrationStage(String registrationStage) {
		this.registrationStage = registrationStage;
	}

	public List<AgentRegistrationLog> getRegistrationHistory() {
		return registrationHistory;
	}

	public void setRegistrationHistory(
			List<AgentRegistrationLog> registrationHistory) {
		this.registrationHistory = registrationHistory;
	}

	public String getReasonForRejection() {
		return reasonForRejection;
	}

	public void setReasonForRejection(String reasonForRejection) {
		this.reasonForRejection = reasonForRejection;
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

	public String getProjectStatus() {
		return projectStatus;
	}

	public void setProjectStatus(String projectStatus) {
		this.projectStatus = projectStatus;
	}

	public String getAgentOldRegistrationNo() {
		
		if(agentOldRegistrationNo==null) return agentRegistrationNo;
		
		return agentOldRegistrationNo;
	}

	public UserModel getCertificateUser() {
		return certificateUser;
	}

	public void setCertificateUser(UserModel certificateUser) {
		this.certificateUser = certificateUser;
	}

	

	

	

}
