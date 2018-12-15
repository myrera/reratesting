package in.gov.rera.transaction.postregistration.plots.model;

import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity(name="PlotsLandAcquisitionCostModel")
@Table(name="TL_PLOTS_LAND_AQ_COST_DELS")
public class PlotsLandAcquisitionCostModel {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "LAND_AQUISITION_COST_DELS_ID")
	private Long landAcquisitionCostDetailsId;
	
	@Column(name="COST_OF_OWNERSHIP")
	private Long costOfOwnership;
	
	@Column(name="LAND_ACUISITION_TYPE")
	private String landType;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "JDA_DELS_ID")
	private PlotJDADetails projectJDADetailsModel;
	
	@Column(name="NO_OF_PROMOTERS")
	private Integer numberOfPromoters;
	
	@Column(name="NO_OF_LANDOWNERS")
	private Integer numberOfLandowners;
	
	//ADD PEYMENT 
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private List<PlotsAmountWithdrawlBankDetailsModel> bankDetailsModel;

	public Long getLandAcquisitionCostDetailsId() {
		return landAcquisitionCostDetailsId;
	}

	public void setLandAcquisitionCostDetailsId(Long landAcquisitionCostDetailsId) {
		this.landAcquisitionCostDetailsId = landAcquisitionCostDetailsId;
	}

	public Long getCostOfOwnership() {
		return costOfOwnership;
	}

	public void setCostOfOwnership(Long costOfOwnership) {
		this.costOfOwnership = costOfOwnership;
	}

	public String getLandType() {
		return landType;
	}

	public void setLandType(String landType) {
		this.landType = landType;
	}

	public PlotJDADetails getProjectJDADetailsModel() {
		return projectJDADetailsModel;
	}

	public void setProjectJDADetailsModel(PlotJDADetails projectJDADetailsModel) {
		this.projectJDADetailsModel = projectJDADetailsModel;
	}

	public Integer getNumberOfPromoters() {
		return numberOfPromoters;
	}

	public void setNumberOfPromoters(Integer numberOfPromoters) {
		this.numberOfPromoters = numberOfPromoters;
	}

	public Integer getNumberOfLandowners() {
		return numberOfLandowners;
	}

	public void setNumberOfLandowners(Integer numberOfLandowners) {
		this.numberOfLandowners = numberOfLandowners;
	}

	public List<PlotsAmountWithdrawlBankDetailsModel> getBankDetailsModel() {
		return bankDetailsModel;
	}

	public void setBankDetailsModel(List<PlotsAmountWithdrawlBankDetailsModel> bankDetailsModel) {
		this.bankDetailsModel = bankDetailsModel;
	}

}
