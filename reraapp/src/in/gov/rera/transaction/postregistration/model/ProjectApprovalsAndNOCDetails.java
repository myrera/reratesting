package in.gov.rera.transaction.postregistration.model;

import java.io.Serializable;
import java.util.Calendar;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Entity;
import org.springframework.format.annotation.DateTimeFormat;

import in.gov.rera.dms.beans.Document;

/**
 * @author admin
 *
 */
@Entity
@Table(name ="TL_APPROVALS_AND_NOC_DETLS")
public class ProjectApprovalsAndNOCDetails implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="APPROVALS_AND_DETLS_ID")
	private Long approvalsAndNocDetailsId;
	
	
	
	@Column(name = "DETAILS_OF_APPROVALS_OR_NOC")
	private String detailsOfApprovalsOrNoc;
	
	@Column(name = "IS_APPLICABLE")
	private String isApplicable;
	
	@Column(name = "STATUS")
	private String status;
	
	@Column(name = "DATE_OF_APPLICATION")
	@Temporal(TemporalType.DATE) //drops the time value and only preserves the date.
	@DateTimeFormat(pattern = "dd/MM/yyyy") 
	private Calendar dateOfApplication;

	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="uploadDocId")
	private Document uploadDoc;

	public Long getApprovalsAndNocDetailsId() {
		return approvalsAndNocDetailsId;
	}

	public void setApprovalsAndNocDetailsId(Long approvalsAndNocDetailsId) {
		this.approvalsAndNocDetailsId = approvalsAndNocDetailsId;
	}

	public String getDetailsOfApprovalsOrNoc() {
		return detailsOfApprovalsOrNoc;
	}

	public void setDetailsOfApprovalsOrNoc(String detailsOfApprovalsOrNoc) {
		this.detailsOfApprovalsOrNoc = detailsOfApprovalsOrNoc;
	}

	public String getIsApplicable() {
		return isApplicable;
	}

	public void setIsApplicable(String isApplicable) {
		this.isApplicable = isApplicable;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}


	public Calendar getDateOfApplication() {
		return dateOfApplication;
	}

	public void setDateOfApplication(Calendar dateOfApplication) {
		this.dateOfApplication = dateOfApplication;
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

}

