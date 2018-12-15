package in.gov.rera.common.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity(name = "PendingSignature")
@Table(name = "TM_SIGNATURE")
public class PendingSignature implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 467623201L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "SIGN_ID")
	private long signId;

	@Column(name = "PROJECT_NUMBER")
	private String projectNumber;
	
	@Column(name = "PROJECT_Id")
	private Long projectId;

	
	private String userName;

	public long getSignId() {
		return signId;
	}

	public void setSignId(long signId) {
		this.signId = signId;
	}

	

	public void setUserName(String userName) {
		this.userName=userName;
		
	}

	public String getUserName() {
		return userName;
	}

	public String getProjectNumber() {
		return projectNumber;
	}

	public void setProjectNumber(String projectNumber) {
		this.projectNumber = projectNumber;
	}

	public Long getProjectId() {
		return projectId;
	}

	public void setProjectId(Long projectId) {
		this.projectId = projectId;
	}
	
	
	
	

}
