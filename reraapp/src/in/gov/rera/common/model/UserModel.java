package in.gov.rera.common.model;

import in.gov.rera.master.district.model.DistrictModel;
import in.gov.rera.master.zone.model.ZoneModel;

import java.io.Serializable;
import java.util.Calendar;

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

@Entity(name = "UserModel")
@Table(name = "TM_USER")
public class UserModel implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 467623201L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "USER_ID")
	private long userId;
	
	@Column(name = "LOGIN_ID")
	private String loginId;
	
	@Column(name = "PASSWORD")
	private String password;
	
	@Column(name = "EMAILID")
	private String emailId;
	
	@Column(name = "USER_TYPE")
	private String userType;
	
	@Column(name = "AUTHORITY_TYPE")
	private String authorityType;
	
	@Column(name = "USER_NAME")
	private String userName;
	
	@Column(name = "USER_DESIGNATION")
	private String designation;
	
	@Column(name = "USER_STATUS")
	private String status;
	
	@ManyToOne
	@JoinColumn(name = "DISTRICT_ID")
	private DistrictModel district;
	
	@ManyToOne
	@JoinColumn(name = "ZONE_ID")
	private ZoneModel zone;
	
	
	@Column(name="CREATED_ON")
	@Temporal(TemporalType.TIMESTAMP)
	private Calendar createdOn;
	
	@Column(name = "ROLE_ACCESS")
	private String roleAccess;
	
	private String contactNumber;
	
	
	@Column(name="LOGIN_TIME")
	@Temporal(TemporalType.TIMESTAMP)
	private Calendar loginTime;
	
	
	
	
	public DistrictModel getDistrict() {
		return district;
	}

	public void setDistrict(DistrictModel district) {
		this.district = district;
	}

	public ZoneModel getZone() {
		return zone;
	}

	public void setZone(ZoneModel zone) {
		this.zone = zone;
	}

	public String getAuthorityType() {
		return authorityType;
	}

	public void setAuthorityType(String authorityType) {
		this.authorityType = authorityType;
	}

	public Calendar getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(Calendar createdOn) {
		this.createdOn = createdOn;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public long getUserId() {
		return userId;
	}

	public void setUserId(long userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}
	
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public String getLoginId() {
		return loginId;
	}
	
	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getUserType() {
		return userType;
	}
	
	public void setUserType(String userType) {
		this.userType = userType;
	}

	public String getRoleAccess() {
		return roleAccess;
	}

	public void setRoleAccess(String roleAccess) {
		this.roleAccess = roleAccess;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (int) (userId ^ (userId >>> 32));
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (!(obj instanceof UserModel))
			return false;
		UserModel other = (UserModel) obj;
		if (userId != other.userId)
			return false;
		return true;
	}

	public String getContactNumber() {
		return contactNumber;
	}

	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}

	public Calendar getLoginTime() {
		return loginTime;
	}

	public void setLoginTime(Calendar loginTime) {
		this.loginTime = loginTime;
	}

	public String getDesignation() {
		return designation;
	}

	public void setDesignation(String designation) {
		this.designation = designation;
	}
	
	
	public static void main(String[] args) {
		StringBuffer sb=new StringBuffer();
		
		sb.append("test");
		sb.append(",");
		System.out.println("success".toCharArray());
	}
	
}
