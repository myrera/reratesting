package in.gov.rera.transaction.postregistration.plots.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity(name="PlotsLandCostDetailsModel")
@Table(name="TL_PLOT_LAND_COST_DETAILS")
public class PlotsLandCostDetailsModel{

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "LAND_COST_DELS_ID")
	private Long landCostDetailsId;

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "LAND_AQUISITION_COST_DELS_ID")
	private PlotsLandAcquisitionCostModel plotLandAcquisitionCostModel;

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "APPROVE_COST_MODEL_ID")
	private PlotsApprovalCostModel approvalCostModel;


	public Long getLandCostDetailsId() {
		return landCostDetailsId;
	}


	public void setLandCostDetailsId(Long landCostDetailsId) {
		this.landCostDetailsId = landCostDetailsId;
	}


	public PlotsLandAcquisitionCostModel getPlotLandAcquisitionCostModel() {
		return plotLandAcquisitionCostModel;
	}


	public void setPlotLandAcquisitionCostModel(PlotsLandAcquisitionCostModel plotLandAcquisitionCostModel) {
		this.plotLandAcquisitionCostModel = plotLandAcquisitionCostModel;
	}


	public PlotsApprovalCostModel getApprovalCostModel() {
		return approvalCostModel;
	}


	public void setApprovalCostModel(PlotsApprovalCostModel approvalCostModel) {
		this.approvalCostModel = approvalCostModel;
	}

}
