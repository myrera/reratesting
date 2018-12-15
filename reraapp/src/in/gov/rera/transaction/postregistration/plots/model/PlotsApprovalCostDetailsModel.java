package in.gov.rera.transaction.postregistration.plots.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity(name = "PlotsApprovalCostDetailsModel")
@Table(name = "TL_PLOT_APPROVAL_COST_DETAILS")
public class PlotsApprovalCostDetailsModel {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "APPROVE_COST_DETLS_ID")
	private Long approveCostDetlsId;
	
	@Column(name = "Is_APPLICABLE")
	private String isApplicable;
	
	@Column(name = "APPROVAL_NAME")
	private String approvalParticular;
	
	@Column(name = "APPROVAL_AMT")
	private Long approvalAmt;

	public Long getApproveCostDetlsId() {
		return approveCostDetlsId;
	}

	public void setApproveCostDetlsId(Long approveCostDetlsId) {
		this.approveCostDetlsId = approveCostDetlsId;
	}

	public String getIsApplicable() {
		return isApplicable;
	}

	public void setIsApplicable(String isApplicable) {
		this.isApplicable = isApplicable;
	}

	public String getApprovalParticular() {
		return approvalParticular;
	}

	public void setApprovalParticular(String approvalParticular) {
		this.approvalParticular = approvalParticular;
	}

	public Long getApprovalAmt() {
		return approvalAmt;
	}

	public void setApprovalAmt(Long approvalAmt) {
		this.approvalAmt = approvalAmt;
	}
	
}
