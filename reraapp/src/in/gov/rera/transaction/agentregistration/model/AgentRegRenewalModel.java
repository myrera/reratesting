package in.gov.rera.transaction.agentregistration.model;

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


@Entity(name = "AgentRegRenewalModel")
@Table(name = "TT_AGENT_REG_RENEW_MODEL")
public class AgentRegRenewalModel {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "AGENT_REG_RENEW_ID")
	private Long agentRegLogId;
	
	@Column(name = "AGENT_REG_APP_NO")
	private String applicationNo;
	
	
	@ManyToOne
	@JoinColumn(name="AGENT_REGISTRATION_ID")
	private AgentRegistrationModel agentRegistration;
	
	@Column(name="STATUS")
	private String status;
	
	
	
	@Column(name="CREATED_ON")
	private Calendar createdOn;
	
	
	@Column(name="APPROVED_ON")
	private Calendar approvedOn;
	
	@Column(name="EXPRIRED_DATE")
	private Calendar expireDate;
	
	@ManyToOne
	@JoinColumn(name="APPROVED_BY")
	private UserModel approvedBy;
	
	
	@ManyToOne
	@JoinColumn(name="ASSIGN_TO")
	private UserModel assignTo;
	
	@OneToOne(cascade = CascadeType.ALL,fetch =FetchType.LAZY)
	@JoinColumn(name = "RES_PAY_DELS_ID")
	private RegPaymentDetailsModel regPaymentDetailsModel;

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
	
	
	public String getApplicationNo() {
		return applicationNo;
	}

	public void setApplicationNo(String applicationNo) {
		this.applicationNo = applicationNo;
	}

	public Long getAgentRegLogId() {
		return agentRegLogId;
	}

	public void setAgentRegLogId(Long agentRegLogId) {
		this.agentRegLogId = agentRegLogId;
	}

	public AgentRegistrationModel getAgentRegistration() {
		return agentRegistration;
	}

	public void setAgentRegistration(AgentRegistrationModel agentRegistration) {
		this.agentRegistration = agentRegistration;
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

	public RegPaymentDetailsModel getRegPaymentDetailsModel() {
		return regPaymentDetailsModel;
	}

	public void setRegPaymentDetailsModel(
			RegPaymentDetailsModel regPaymentDetailsModel) {
		this.regPaymentDetailsModel = regPaymentDetailsModel;
	}

	public Set<Document> getSupportingDocs() {
		return supportingDocs;
	}

	public void setSupportingDocs(Set<Document> supportingDocs) {
		this.supportingDocs = supportingDocs;
	}
	
	
	
}
