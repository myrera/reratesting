package in.gov.rera.common.model;



import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity(name = "ApplicationHistoryModel")
@Table(name = "TT_APPLICATION_HISTORY")
public class ApplicationHistoryModel {

	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID")
	private Long id;
	
	@Column(name = "PRO_REG_APP_NO")
	private String applicationNo;
	
	@Column(name="STATUS")
	private String status;
	
	private Date createdOn;
	
	
	@ManyToOne
	@JoinColumn(name="USER_ID")
	private UserModel userModifiedBy;
	
	@ManyToOne
	private LoginHistory loginSession;
	
	
	

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
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

	public Date getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(Date createdOn) {
		this.createdOn = createdOn;
	}

	public UserModel getUserModifiedBy() {
		return userModifiedBy;
	}

	public void setUserModifiedBy(UserModel userModifiedBy) {
		this.userModifiedBy = userModifiedBy;
	}

	public LoginHistory getLoginSession() {
		return loginSession;
	}

	public void setLoginSession(LoginHistory loginSession) {
		this.loginSession = loginSession;
	}
	
	
	
	
	
	
}
