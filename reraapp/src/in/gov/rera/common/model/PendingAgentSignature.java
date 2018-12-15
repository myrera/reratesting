package in.gov.rera.common.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity(name = "PendingAgentSignature")
@Table(name = "TM_AGENT_SIGNATURE")
public class PendingAgentSignature implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 467623201L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "SIGN_ID")
	private long signId;

	@Column(name = "AGENT_NUMBER")
	private String agentNumber;
	
	@Column(name = "AGENT_Id")
	private Long agentId;

	
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

	public String getAgentNumber() {
		return agentNumber;
	}

	public void setAgentNumber(String agentNumber) {
		this.agentNumber = agentNumber;
	}

	public Long getAgentId() {
		return agentId;
	}

	public void setAgentId(Long agentId) {
		this.agentId = agentId;
	}

	
	
	
	
	

}
