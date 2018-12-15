
package in.gov.rera.transaction.agentregistration.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import in.gov.rera.dms.beans.Document;
import in.gov.rera.master.district.model.DistrictModel;

@Entity(name = "PreviousDatailsModel")
@Table(name = "TL_AGENT_REG_PREVIOUS_DETAILS")
public class RegPreviousDatailsModel implements Serializable{

	
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "PRE_REGIS_ID")
	private Integer preRegistrationId;
	
	
	@Column(name = "PRE_REGISTRATION_NO", length = 50)
	private String preRegistrationNo;

	@Column(name = "AGENT_PRE_UT_STATE", length = 50)
	private String    agentPreUtState;
	
	
	@Column(name = "AGENT_PRE_UT_DISTRICT", length = 50)
	private String    agentPreUtDistrict;

	
	@ManyToOne
	@JoinColumn(name = "DISTRICT_ID")
	private DistrictModel districtModel;
	
	
	
	public DistrictModel getDistrictModel() {
		return districtModel;
	}

	public void setDistrictModel(DistrictModel districtModel) {
		this.districtModel = districtModel;
	}

	public String getAgentPreUtState() {
		return agentPreUtState;
	}

	public void setAgentPreUtState(String agentPreUtState) {
		this.agentPreUtState = agentPreUtState;
	}

	public String getAgentPreUtDistrict() {
		return agentPreUtDistrict;
	}

	public void setAgentPreUtDistrict(String agentPreUtDistrict) {
		this.agentPreUtDistrict = agentPreUtDistrict;
	}

	@OneToOne
	@JoinColumn(name="CERTIFICATE_DOC")
	private Document certificateDoc;
	
	@ManyToOne
	@JoinColumn(name="AGENT_REG_DETAILS_ID")
	private AgentDetailsModel agentDetailsModel;

	
	


	public Document getCertificateDoc() {
		return certificateDoc;
	}

	public void setCertificateDoc(Document certificateDoc) {
		this.certificateDoc = certificateDoc;
	}

	public Integer getPreRegistrationId() {
		return preRegistrationId;
	}

	public void setPreRegistrationId(Integer preRegistrationId) {
		this.preRegistrationId = preRegistrationId;
	}

	
	public String getPreRegistrationNo() {
		return preRegistrationNo;
	}

	public void setPreRegistrationNo(String preRegistrationNo) {
		this.preRegistrationNo = preRegistrationNo;
	}

	public AgentDetailsModel getAgentDetailsModel() {
		return agentDetailsModel;
	}

	public void setAgentDetailsModel(AgentDetailsModel agentDetailsModel) {
		this.agentDetailsModel = agentDetailsModel;
	}

	


	

	
}
	
