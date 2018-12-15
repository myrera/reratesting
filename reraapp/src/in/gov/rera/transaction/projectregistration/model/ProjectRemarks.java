package in.gov.rera.transaction.projectregistration.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

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
import javax.persistence.OrderColumn;
import javax.persistence.Table;

import in.gov.rera.common.model.UserModel;


@Entity(name = "ProjectRemarks")
@Table(name = "TL_PROJECT_REMARKS")
public class ProjectRemarks implements Serializable{

	/**
	 * 
	 */
	private static long serialVersionUID = 1552323008L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "OPR_REMARKS_ID")
	private Long remarksId;
	
	@Column(name = "REVENUE_STATUS")
	private String revenueStatus;
	@Column(name = "ACCOUNTS_STATUS")
	private String accountsStatus;
	@Column(name = "TCP_STATUS")
	private String tcpStatus;
	@Column(name = "ENGG_STATUS")
	private String enggStatus;
	
	@Column(name = "STATUS_RESET_DATE")
	private Date lastStatusReset;
	
	@ManyToOne
	@JoinColumn(name="STATUS_RESET_BY")
	private UserModel lastResetBy;
	
	
	@OneToMany(cascade = CascadeType.ALL, fetch=FetchType.LAZY)
	 @OrderColumn(name="orders_index")
	private List<UserRemarks> remarksList;
	
	@Column(name = "REVENUE_VERIFICATION_STATUS")
	private String revenueVerificationStatus;
	
	@Column(name = "ACCOUNTS_VERIFICATION_STATUS")
	private String accountsVerificationStatus;
	
	@Column(name = "TCP_VERIFICATION_STATUS")
	private String tcpVerificationStatus;
	
	@Column(name = "ENGG_VERIFICATION_STATUS")
	private String enggVerificationStatus;
	
	@Column(name = "UNDERSEC_VERIFICATION_STATUS")
	private String underSecVerificationStatus;
	
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public static void setSerialversionuid(long serialversionuid) {
		serialVersionUID = serialversionuid;
	}
	public String getRevenueVerificationStatus() {
		return revenueVerificationStatus;
	}
	public void setRevenueVerificationStatus(String revenueVerificationStatus) {
		this.revenueVerificationStatus = revenueVerificationStatus;
	}
	public String getAccountsVerificationStatus() {
		return accountsVerificationStatus;
	}
	public void setAccountsVerificationStatus(String accountsVerificationStatus) {
		this.accountsVerificationStatus = accountsVerificationStatus;
	}
	public String getTcpVerificationStatus() {
		return tcpVerificationStatus;
	}
	public void setTcpVerificationStatus(String tcpVerificationStatus) {
		this.tcpVerificationStatus = tcpVerificationStatus;
	}
	public String getEnggVerificationStatus() {
		return enggVerificationStatus;
	}
	public void setEnggVerificationStatus(String enggVerificationStatus) {
		this.enggVerificationStatus = enggVerificationStatus;
	}

	public Long getRemarksId() {
		return remarksId;
	}
	public void setRemarksId(Long remarksId) {
		this.remarksId = remarksId;
	}
	public String getRevenueStatus() {
		return revenueStatus;
	}
	public void setRevenueStatus(String revenueStatus) {
		this.revenueStatus = revenueStatus;
	}
	public String getAccountsStatus() {
		return accountsStatus;
	}
	public void setAccountsStatus(String accountsStatus) {
		this.accountsStatus = accountsStatus;
	}
	public String getTcpStatus() {
		return tcpStatus;
	}
	public void setTcpStatus(String tcpStatus) {
		this.tcpStatus = tcpStatus;
	}
	public String getEnggStatus() {
		return enggStatus;
	}
	public void setEnggStatus(String enggStatus) {
		this.enggStatus = enggStatus;
	}
	public List<UserRemarks> getRemarksList() {
		return remarksList;
	}
	public void setRemarksList(List<UserRemarks> remarksList) {
		this.remarksList = remarksList;
	}
	
	public Date getLastStatusReset() {
		return lastStatusReset;
	}
	public void setLastStatusReset(Date lastStatusReset) {
		this.lastStatusReset = lastStatusReset;
	}
	public UserModel getLastResetBy() {
		return lastResetBy;
	}
	public void setLastResetBy(UserModel lastResetBy) {
		this.lastResetBy = lastResetBy;
	}
	public static long getSerialVersionUID() {
		return serialVersionUID;
	}
	public static void setSerialVersionUID(long serialVersionUID) {
		ProjectRemarks.serialVersionUID = serialVersionUID;
	}
	public String getUnderSecVerificationStatus() {
		return underSecVerificationStatus;
	}
	public void setUnderSecVerificationStatus(String underSecVerificationStatus) {
		this.underSecVerificationStatus = underSecVerificationStatus;
	}
	
	
	
	
	
}
