package in.gov.rera.transaction.projectregistration.model;

import java.io.Serializable;
import java.util.Calendar;
import in.gov.rera.common.model.UserModel;
import in.gov.rera.common.util.DateUtil;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;



@Entity(name = "UserRemarks")
@Table(name = "TL_PROJECT_USER_REMARKS")
public class UserRemarks implements Serializable{

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 17874354009L;
	
	
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "USER_REMARKS_ID")
	private Long userRemarksId;
	
	
	@Column(name = "REVENUE_OPR_REMARKS" ,length = 2000)
	private String revenueOprRemarks;
	@Column(name = "ACCOUNTS_OPR_REMARKS" ,length = 2000)
	private String accountsOprRemarks;
	@Column(name = "TCP_OPR_REMARKS" ,length = 2000)
	private String tcpOprRemarks;
	@Column(name = "ENGG_OPR_REMARKS" ,length = 2000)
	private String enggOprRemarks;
	
	@Column(name = "RVN_OPR_DATE")
	@Temporal(TemporalType.TIMESTAMP)
	private Calendar oprRevRemarkDate;
	@Column(name = "ACC_OPR_DATE")
	@Temporal(TemporalType.TIMESTAMP)
	private Calendar oprAccRemarkDate;
	@Column(name = "TCP_OPR_DATE")
	@Temporal(TemporalType.TIMESTAMP)
	private Calendar oprTcpRemarkDate;
	@Column(name = "ENGG_OPR_DATE")
	@Temporal(TemporalType.TIMESTAMP)
	private Calendar oprEnggRemarkDate;
	
	
	
	
	@Column(name = "REVENUE_AUTH_REMARKS" ,length = 2000)
	private String revenueAuthRemarks;
	@Column(name = "ACCOUNTS_AUTH_REMARKS" ,length = 2000)
	private String accountsAuthRemarks;
	@Column(name = "TCP_AUTH_REMARKS" ,length = 2000)
	private String tcpAuthRemarks;
	@Column(name = "ENGG_AUTH_REMARKS" ,length = 2000)
	private String enggAuthRemarks;
	
	@Column(name = "AUTH_REMARKS_DATE")
	@Temporal(TemporalType.TIMESTAMP)
	private Calendar authRemarkDate;
	
	@Column(name = "REVENUE_SUP_REMARKS" ,length = 2000)
	private String revenueSupRemarks;
	@Column(name = "ACCOUNTS_SUP_REMARKS" ,length = 2000)
	private String accountsSupRemarks;
	@Column(name = "TCP_SUP_REMARKS" ,length = 2000)
	private String tcpSupRemarks;
	@Column(name = "ENGG_SUP_REMARKS" ,length = 2000)
	private String enggSupRemarks;
	
	@Column(name = "SUP_REMARKS_DATE")
	@Temporal(TemporalType.TIMESTAMP)
	private Calendar supRemarkDate;
	
	@ManyToOne
	@JoinColumn(name="REVENUE_USER")
	private UserModel revenueUser;
	
	@ManyToOne
	@JoinColumn(name="ACCOUNTS_USER")
	private UserModel accountsUser;
	
	@ManyToOne
	@JoinColumn(name="TCP_USER")
	private UserModel tcpUser;
	
	@ManyToOne
	@JoinColumn(name="ENGG_USER")
	private UserModel enggUser;

	@ManyToOne
	@JoinColumn(name="AUTHORITY_USER")
	private UserModel authorityUser;

	@ManyToOne
	@JoinColumn(name="SUPER_USER")
	private UserModel superUser;
	
	
	
	@Column(name = "REMARKS_STATUS")
	private String status;
	
	
	
	
	
	public String getRevenueOprRemarks() {
		return revenueOprRemarks;
	}
	public void setRevenueOprRemarks(String revenueOprRemarks) {
		this.revenueOprRemarks = revenueOprRemarks;
	}
	public String getAccountsOprRemarks() {
		return accountsOprRemarks;
	}
	public void setAccountsOprRemarks(String accountsOprRemarks) {
		this.accountsOprRemarks = accountsOprRemarks;
	}
	public String getTcpOprRemarks() {
		return tcpOprRemarks;
	}
	public void setTcpOprRemarks(String tcpOprRemarks) {
		this.tcpOprRemarks = tcpOprRemarks;
	}
	public String getEnggOprRemarks() {
		return enggOprRemarks;
	}
	public void setEnggOprRemarks(String enggOprRemarks) {
		this.enggOprRemarks = enggOprRemarks;
	}
	public Calendar getOprRevRemarkDate() {
		return oprRevRemarkDate;
	}
	public void setOprRevRemarkDate(Calendar oprRevRemarkDate) {
		this.oprRevRemarkDate = oprRevRemarkDate;
	}
	public Calendar getOprAccRemarkDate() {
		return oprAccRemarkDate;
	}
	public void setOprAccRemarkDate(Calendar oprAccRemarkDate) {
		this.oprAccRemarkDate = oprAccRemarkDate;
	}
	public Calendar getOprTcpRemarkDate() {
		return oprTcpRemarkDate;
	}
	public void setOprTcpRemarkDate(Calendar oprTcpRemarkDate) {
		this.oprTcpRemarkDate = oprTcpRemarkDate;
	}
	public Calendar getOprEnggRemarkDate() {
		return oprEnggRemarkDate;
	}
	public void setOprEnggRemarkDate(Calendar oprEnggRemarkDate) {
		this.oprEnggRemarkDate = oprEnggRemarkDate;
	}
	public String getRevenueAuthRemarks() {
		return revenueAuthRemarks;
	}
	public void setRevenueAuthRemarks(String revenueAuthRemarks) {
		this.revenueAuthRemarks = revenueAuthRemarks;
	}
	public String getAccountsAuthRemarks() {
		return accountsAuthRemarks;
	}
	public void setAccountsAuthRemarks(String accountsAuthRemarks) {
		this.accountsAuthRemarks = accountsAuthRemarks;
	}
	public String getTcpAuthRemarks() {
		return tcpAuthRemarks;
	}
	public void setTcpAuthRemarks(String tcpAuthRemarks) {
		this.tcpAuthRemarks = tcpAuthRemarks;
	}
	public String getEnggAuthRemarks() {
		return enggAuthRemarks;
	}
	public void setEnggAuthRemarks(String enggAuthRemarks) {
		this.enggAuthRemarks = enggAuthRemarks;
	}
	public Calendar getAuthRemarkDate() {
		return authRemarkDate;
	}
	public void setAuthRemarkDate(Calendar authRemarkDate) {
		this.authRemarkDate = authRemarkDate;
	}
	public String getRevenueSupRemarks() {
		return revenueSupRemarks;
	}
	public void setRevenueSupRemarks(String revenueSupRemarks) {
		this.revenueSupRemarks = revenueSupRemarks;
	}
	public String getAccountsSupRemarks() {
		return accountsSupRemarks;
	}
	public void setAccountsSupRemarks(String accountsSupRemarks) {
		this.accountsSupRemarks = accountsSupRemarks;
	}
	public String getTcpSupRemarks() {
		return tcpSupRemarks;
	}
	public void setTcpSupRemarks(String tcpSupRemarks) {
		this.tcpSupRemarks = tcpSupRemarks;
	}
	public String getEnggSupRemarks() {
		return enggSupRemarks;
	}
	public void setEnggSupRemarks(String enggSupRemarks) {
		this.enggSupRemarks = enggSupRemarks;
	}
	public Calendar getSupRemarkDate() {
		return supRemarkDate;
	}
	public void setSupRemarkDate(Calendar supRemarkDate) {
		this.supRemarkDate = supRemarkDate;
	}
	public UserModel getAuthorityUser() {
		return authorityUser;
	}
	public void setAuthorityUser(UserModel authorityUser) {
		this.authorityUser = authorityUser;
	}
	public UserModel getSuperUser() {
		return superUser;
	}
	public void setSuperUser(UserModel superUser) {
		this.superUser = superUser;
	}
	public UserModel getRevenueUser() {
		return revenueUser;
	}
	public void setRevenueUser(UserModel revenueUser) {
		this.revenueUser = revenueUser;
	}
	public UserModel getAccountsUser() {
		return accountsUser;
	}
	public void setAccountsUser(UserModel accountsUser) {
		this.accountsUser = accountsUser;
	}
	public UserModel getTcpUser() {
		return tcpUser;
	}
	public void setTcpUser(UserModel tcpUser) {
		this.tcpUser = tcpUser;
	}
	public UserModel getEnggUser() {
		return enggUser;
	}
	public void setEnggUser(UserModel enggUser) {
		this.enggUser = enggUser;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
	public String getOprRevRemarkDateStr() {
		if(getOprRevRemarkDate()!=null){
			return	DateUtil.getDateString(getOprRevRemarkDate()); 
		}
		return null;
	}
	public String getOprAccRemarkDateStr() {
		if( getOprAccRemarkDate()!=null){
		return	DateUtil.getDateString(getOprAccRemarkDate()); 
		}
		return null;
	}
	public String getOprTcpRemarkDateStr() {
		if( getOprTcpRemarkDate()!=null){
			return	DateUtil.getDateString(getOprTcpRemarkDate()); 
		}
		return null;
	}
	public String getOprEnggRemarkDateStr() {
		if( getOprEnggRemarkDate()!=null){
			return	DateUtil.getDateString(getOprEnggRemarkDate()); 
		}
		return null;
	}
	public String getSupRemarkDateStr() {
		if( getSupRemarkDate()!=null){
			return	DateUtil.getDateString(getSupRemarkDate()); 
		}
		return null;
	}

	public String getAuthRemarkDateStr() {
		if( getAuthRemarkDate()!=null){
			return	DateUtil.getDateString(getAuthRemarkDate()); 
		}
		return null;
	}
}
