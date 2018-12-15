package in.gov.rera.transaction.postregistration.plots.model;

import java.io.Serializable;
import java.util.Calendar;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import in.gov.rera.dms.beans.Document;




@Entity
@Table(name ="TL_PLOTS_MODIFICATION_DETLS")
public class PlotsModificationDetails implements Serializable {
	
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
	
	@Column(name="MODIFICATION_PLAN_NO")
	private String modificationPlanNo;
	
	@Column(name = "DATE_OF_APPROVAL")
	@Temporal(TemporalType.DATE) //drops the time value and only preserves the date.
	@DateTimeFormat(pattern = "dd/MM/yyyy") 
	private Calendar dateOfApproval;
	
	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="DETAILS_OF_PLOT_RELEASED") 
	private Document detailsOfPlotReleased;
	
	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="PLOT_NOC_CERTIFICATE") 
	private Document plotNocCertificate;

	public Document getPlotNocCertificate() {
		return plotNocCertificate;
	}

	public void setPlotNocCertificate(Document plotNocCertificate) {
		this.plotNocCertificate = plotNocCertificate;
	}


	public String getModificationPlanNo() {
		return modificationPlanNo;
	}


	public void setModificationPlanNo(String modificationPlanNo) {
		this.modificationPlanNo = modificationPlanNo;
	}


	public Calendar getDateOfApproval() {
		return dateOfApproval;
	}


	public void setDateOfApproval(Calendar dateOfApproval) {
		this.dateOfApproval = dateOfApproval;
	}


	public Document getDetailsOfPlotReleased() {
		return detailsOfPlotReleased;
	}


	public void setDetailsOfPlotReleased(Document detailsOfPlotReleased) {
		this.detailsOfPlotReleased = detailsOfPlotReleased;
	}


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