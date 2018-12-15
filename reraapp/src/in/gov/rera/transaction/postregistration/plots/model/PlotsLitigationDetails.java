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
@Table(name ="TL_PLOTS_LITIGATION_DETLS")
public class PlotsLitigationDetails implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="LITIGATION_DETLS_ID")
	private Long litigationDetailsId;
	
	@Column(name = "ANY_LITIGATION_ON_PROJECT")
	private String anyLitigationOnProject;
	
	@Column(name = "CASE_TYPE")
	private String caseType;
	
	@Column(name = "COURT_OR_AUTHORITY_NAME")
	private String courtOrAuthorityName;
	
	@Column(name = "CASE_NO")
	private Long caseNo;
	
	@Column(name="LITIGATION_YEAR")
	private Calendar litigationYear;
	
	@Column(name = "ANY_PREVENTIVE_ORDER_ISSUED")
	private String anyPreventiveOrderIssued;
	
	@Column(name = "LITIGATION_STATUS")
	private String litigationStatus;
	
	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="preventiveOrderDocId") 
	private Document preventiveOrderDoc;

	public Long getLitigationDetailsId() {
		return litigationDetailsId;
	}

	public void setLitigationDetailsId(Long litigationDetailsId) {
		this.litigationDetailsId = litigationDetailsId;
	}

	public String getAnyLitigationOnProject() {
		return anyLitigationOnProject;
	}

	public void setAnyLitigationOnProject(String anyLitigationOnProject) {
		this.anyLitigationOnProject = anyLitigationOnProject;
	}

	public String getCaseType() {
		return caseType;
	}

	public void setCaseType(String caseType) {
		this.caseType = caseType;
	}

	public String getCourtOrAuthorityName() {
		return courtOrAuthorityName;
	}

	public void setCourtOrAuthorityName(String courtOrAuthorityName) {
		this.courtOrAuthorityName = courtOrAuthorityName;
	}

	public Long getCaseNo() {
		return caseNo;
	}

	public void setCaseNo(Long caseNo) {
		this.caseNo = caseNo;
	}

	public Calendar getLitigationYear() {
		return litigationYear;
	}

	public void setLitigationYear(Calendar litigationYear) {
		this.litigationYear = litigationYear;
	}

	public String getAnyPreventiveOrderIssued() {
		return anyPreventiveOrderIssued;
	}

	public void setAnyPreventiveOrderIssued(String anyPreventiveOrderIssued) {
		this.anyPreventiveOrderIssued = anyPreventiveOrderIssued;
	}

	public String getLitigationStatus() {
		return litigationStatus;
	}

	public void setLitigationStatus(String litigationStatus) {
		this.litigationStatus = litigationStatus;
	}

	public Document getPreventiveOrderDoc() {
		return preventiveOrderDoc;
	}

	public void setPreventiveOrderDoc(Document preventiveOrderDoc) {
		this.preventiveOrderDoc = preventiveOrderDoc;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
	
}