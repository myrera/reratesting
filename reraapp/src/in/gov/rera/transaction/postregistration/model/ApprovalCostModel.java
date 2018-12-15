package in.gov.rera.transaction.postregistration.model;

import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity(name = "ApprovalCostModel")
@Table(name = "TL_APPROVAL_COST_MODEL")
public class ApprovalCostModel {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "APPROVE_COST_MODEL_ID")
	private Long approveCostModelId;
	
	@OneToMany(cascade = CascadeType.ALL,fetch=FetchType.LAZY)
	private List<ApprovalCostDetailsModel> approvalCostDetails;
	
	
	@OneToMany(cascade = CascadeType.ALL,fetch=FetchType.LAZY)
	private List<AmountWithdrawlBankDetailsModel> amountWithdrawlBankDetailsModel;
	
	@Column(name = "TOT_COST_OF_APPROVAL")
	private Long totalCostOfApprovals;


	public Long getApproveCostModelId() {
		return approveCostModelId;
	}


	public void setApproveCostModelId(Long approveCostModelId) {
		this.approveCostModelId = approveCostModelId;
	}


	public List<ApprovalCostDetailsModel> getApprovalCostDetails() {
		return approvalCostDetails;
	}


	public void setApprovalCostDetails(List<ApprovalCostDetailsModel> approvalCostDetails) {
		this.approvalCostDetails = approvalCostDetails;
	}


	public List<AmountWithdrawlBankDetailsModel> getAmountWithdrawlBankDetailsModel() {
		return amountWithdrawlBankDetailsModel;
	}


	public void setAmountWithdrawlBankDetailsModel(List<AmountWithdrawlBankDetailsModel> amountWithdrawlBankDetailsModel) {
		this.amountWithdrawlBankDetailsModel = amountWithdrawlBankDetailsModel;
	}


	public Long getTotalCostOfApprovals() {
		return totalCostOfApprovals;
	}


	public void setTotalCostOfApprovals(Long totalCostOfApprovals) {
		this.totalCostOfApprovals = totalCostOfApprovals;
	}
	
	
	
	

	
}
