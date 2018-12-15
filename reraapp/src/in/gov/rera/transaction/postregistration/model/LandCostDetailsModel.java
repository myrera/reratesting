package in.gov.rera.transaction.postregistration.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="TL_LAND_COST_DETAILS")
public class LandCostDetailsModel {
	
@Id
@GeneratedValue(strategy = GenerationType.AUTO)
@Column(name = "LAND_COST_DELS_ID")
private Long landCostDetailsId;

@OneToOne(cascade = CascadeType.ALL)
@JoinColumn(name = "LAND_AQUISITION_COST_DELS_ID")
private LandAcquisitionCostModel landAcquisitionCostModel;

@OneToOne(cascade = CascadeType.ALL)
@JoinColumn(name = "TRANSFER_DEV_REG_ID")
private TransferDevRightsDetailsModel transferDevRightsDetailsModel;

@OneToOne(cascade = CascadeType.ALL)
@JoinColumn(name = "APPROVE_COST_MODEL_ID")
private ApprovalCostModel approvalCostModel;

public LandAcquisitionCostModel getLandAcquisitionCostModel() {
	return landAcquisitionCostModel;
}

public TransferDevRightsDetailsModel getTransferDevRightsDetailsModel() {
	return transferDevRightsDetailsModel;
}

public void setLandAcquisitionCostModel(LandAcquisitionCostModel landAcquisitionCostModel) {
	this.landAcquisitionCostModel = landAcquisitionCostModel;
}

public void setTransferDevRightsDetailsModel(TransferDevRightsDetailsModel transferDevRightsDetailsModel) {
	this.transferDevRightsDetailsModel = transferDevRightsDetailsModel;
}

public Long getLandCostDetailsId() {
	return landCostDetailsId;
}

public void setLandCostDetailsId(Long landCostDetailsId) {
	this.landCostDetailsId = landCostDetailsId;
}

public ApprovalCostModel getApprovalCostModel() {
	return approvalCostModel;
}

public void setApprovalCostModel(ApprovalCostModel approvalCostModel) {
	this.approvalCostModel = approvalCostModel;
}

}
