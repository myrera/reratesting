package in.gov.rera.transaction.agentregistration.model;

import java.io.File;
import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.support.MultipartFilter;

import in.gov.rera.dms.beans.Document;

@Entity(name = "RegUploadDetailsModel")
@Table(name = "TL_AGENT_REG_DOC_DETAILS")
public class RegUploadDetailsModel implements Serializable {

	
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "REG_UPLOAD_DEL_ID", length = 50)
	private Long regUploadDetailId;
	
	@ManyToOne
	@JoinColumn(name = "PAN_CARD_PATH_ID")
	private Document  panCardPath;

	@ManyToOne
	@JoinColumn(name = "ADDRESS_PROOF_PATH_ID")
	private Document addressProofPath;
	
	
	public Long getRegUploadDetailId() {
	return regUploadDetailId;

	}

	public void setRegUploadDetailId(Long regUploadDetailId) {
	this.regUploadDetailId = regUploadDetailId;

	}

	
	public Document getPanCardPath() {
		return panCardPath;
	}

	public void setPanCardPath(Document panCardPath) {
		this.panCardPath =  panCardPath;
	}

	public Document getAddressProofPath() {
		return addressProofPath;
	}

	public void setAddressProofPath(Document addressProofPath) {
		this.addressProofPath = addressProofPath;
	}

	
	
	
}
