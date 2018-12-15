package in.gov.rera.transaction.postregistration.plots.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity(name = "PlotsApprovalCostModel")
@Table(name = "TL_PLOT_APPROVAL_COST_MODEL")
public class PlotsApprovalCostModel {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "APPROVE_COST_MODEL_ID")
	private Long approveCostModelId;
	
	@OneToMany(cascade = CascadeType.ALL,fetch=FetchType.LAZY)
	private List<PlotsApprovalCostDetailsModel> approvalCostDetails;
	
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private List<PlotsAmountWithdrawlBankDetailsModel> bankDetailsModel;
	
	@Column(name = "TOT_COST_OF_APPROVAL")
	private Long totalCostOfApprovals;

	public Long getApproveCostModelId() {
		return approveCostModelId;
	}

	public void setApproveCostModelId(Long approveCostModelId) {
		this.approveCostModelId = approveCostModelId;
	}

	public List<PlotsApprovalCostDetailsModel> getApprovalCostDetails() {
		return approvalCostDetails;
	}

	public void setApprovalCostDetails(List<PlotsApprovalCostDetailsModel> approvalCostDetails) {
		this.approvalCostDetails = approvalCostDetails;
	}

	public List<PlotsAmountWithdrawlBankDetailsModel> getBankDetailsModel() {
		return bankDetailsModel;
	}

	public void setBankDetailsModel(List<PlotsAmountWithdrawlBankDetailsModel> bankDetailsModel) {
		this.bankDetailsModel = bankDetailsModel;
	}

	public Long getTotalCostOfApprovals() {
		return totalCostOfApprovals;
	}

	public void setTotalCostOfApprovals(Long totalCostOfApprovals) {
		this.totalCostOfApprovals = totalCostOfApprovals;
	}
}
