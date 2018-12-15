package in.gov.rera.transaction.postregistration.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity(name = "PostRegAgentDetails")
@Table(name = "TL_POSTREG_AGENT_DETAILS")
public class PostRegAgentDetails {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "POSTREG_AGENT_DELS_ID")
	private Long postRegDetailsId;

	
	
	@Column(name = "AGENT_APP_NO", length = 100)
	private String agentAppNo;

	@Column(name = "WER_URL", length = 3500)
	private String webUrl;

	public Long getPostRegDetailsId() {
		return postRegDetailsId;
	}

	public void setPostRegDetailsId(Long postRegDetailsId) {
		this.postRegDetailsId = postRegDetailsId;
	}

	public String getAgentAppNo() {
		return agentAppNo;
	}

	public void setAgentAppNo(String agentAppNo) {
		this.agentAppNo = agentAppNo;
	}

	public String getWebUrl() {
		return webUrl;
	}

	public void setWebUrl(String webUrl) {
		this.webUrl = webUrl;
	}
	
	


}
