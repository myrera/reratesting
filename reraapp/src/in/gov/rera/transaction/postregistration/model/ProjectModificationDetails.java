package in.gov.rera.transaction.postregistration.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import in.gov.rera.dms.beans.Document;




@Entity
@Table(name ="TL_PROJECT_MODIFICATION_DETLS")
public class ProjectModificationDetails implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="MODIFICATION_DETLS_ID")
	private Long modificationDetailsId;
	
	@Column(name = "IS_MODIFICATION_REQUIRED_TO_APPROVE")
	private String isModificationRequiredToApprove;
	
	@Column(name = "WRITTEN_BY_CONSENT_OF_ALLOTEE")
	private String writtenConsentOfAllotee;
	
	@Column(name = "ISSUED_BY_AUTHORITY")
	private String issuedByAuthority;
	
	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="uploadApprovalDocId") 
	private Document uploadApprovalDoc;
	
	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="uploadDocId") 
	private Document uploadDoc;
	
	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="modifiedDocId") 
	private Document modifiedDoc;

	public Long getModificationDetailsId() {
		return modificationDetailsId;
	}
	 

	public void setModificationDetailsId(Long modificationDetailsId) {
		this.modificationDetailsId = modificationDetailsId;
	}

	public String getIsModificationRequiredToApprove() {
		return isModificationRequiredToApprove;
	}

	public void setIsModificationRequiredToApprove(String isModificationRequiredToApprove) {
		this.isModificationRequiredToApprove = isModificationRequiredToApprove;
	}

	public String getWrittenConsentOfAllotee() {
		return writtenConsentOfAllotee;
	}

	public void setWrittenConsentOfAllotee(String writtenConsentOfAllotee) {
		this.writtenConsentOfAllotee = writtenConsentOfAllotee;
	}

	public Document getUploadApprovalDoc() {
		return uploadApprovalDoc;
	}

	public void setUploadApprovalDoc(Document uploadApprovalDoc) {
		this.uploadApprovalDoc = uploadApprovalDoc;
	}

	public Document getUploadDoc() {
		return uploadDoc;
	}

	public void setUploadDoc(Document uploadDoc) {
		this.uploadDoc = uploadDoc;
	}

	public Document getModifiedDoc() {
		return modifiedDoc;
	}

	public void setModifiedDoc(Document modifiedDoc) {
		this.modifiedDoc = modifiedDoc;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	public String getIssuedByAuthority() {
		return issuedByAuthority;
	}


	public void setIssuedByAuthority(String issuedByAuthority) {
		this.issuedByAuthority = issuedByAuthority;
	}
	
	
	
	
}