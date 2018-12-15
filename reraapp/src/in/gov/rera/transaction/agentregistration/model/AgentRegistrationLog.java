package in.gov.rera.transaction.agentregistration.model;

import in.gov.rera.common.model.UserModel;

import java.util.Calendar;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;


@Entity(name = "AgentRegistrationLog")
@Table(name = "TL_AGENT_REGISTRATION_LOG")
public class AgentRegistrationLog {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "AGENT_REG_LOG_ID")
	private Long agentRegLogId;
	
	private AgentRegistrationModel agentRegistration;
	
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
	
	@OneToOne(cascade = CascadeType.ALL,fetch =FetchType.LAZY)
	@JoinColumn(name = "RES_PAY_DELS_ID")
	private RegPaymentDetailsModel regPaymentDetailsModel;

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

	public RegPaymentDetailsModel getRegPaymentDetailsModel() {
		return regPaymentDetailsModel;
	}

	public void setRegPaymentDetailsModel(
			RegPaymentDetailsModel regPaymentDetailsModel) {
		this.regPaymentDetailsModel = regPaymentDetailsModel;
	}
	
	
	
	
}
