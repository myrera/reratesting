package in.gov.rera.transaction.postregistration.model;

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
@Table(name ="TL_FINAL_APPROVALS_DETLS")
public class FinalApproval implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="FINAL_APPROVALS_DETLS_ID")
	private Long finalApprovalsDetailsId;
	
	@Column(name = "NAME_OF_CERTIFICATE")
	private String nameOfCerificate;
	
	@Column(name = "IS_APPROVED")
	private String isApproved;
	
	@Column(name = "Is_APPLICABLE")
	private String isApplicable;
	
	@Column(name = "APPROVED_DATE")
	@Temporal(TemporalType.DATE) //drops the time value and only preserves the date.
	@DateTimeFormat(pattern = "dd/MM/yyyy") 
	private Calendar approvedDate;

	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="uploadDocId")
	private Document uploadDoc;

	public Long getFinalApprovalsDetailsId() {
		return finalApprovalsDetailsId;
	}

	public void setFinalApprovalsDetailsId(Long finalApprovalsDetailsId) {
		this.finalApprovalsDetailsId = finalApprovalsDetailsId;
	}

	public String getNameOfCerificate() {
		return nameOfCerificate;
	}

	public void setNameOfCerificate(String nameOfCerificate) {
		this.nameOfCerificate = nameOfCerificate;
	}

	public String getIsApproved() {
		return isApproved;
	}

	public void setIsApproved(String isApproved) {
		this.isApproved = isApproved;
	}

	public Calendar getApprovedDate() {
		return approvedDate;
	}

	public void setApprovedDate(Calendar approvedDate) {
		this.approvedDate = approvedDate;
	}

	public Document getUploadDoc() {
		return uploadDoc;
	}

	public void setUploadDoc(Document uploadDoc) {
		this.uploadDoc = uploadDoc;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getIsApplicable() {
		return isApplicable;
	}

	public void setIsApplicable(String isApplicable) {
		this.isApplicable = isApplicable;
	}
	
	
	
	
	
}