package in.gov.rera.transaction.postregistration.plots.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name ="TL_PLOT_COST_SUMMARY")
public class PlotsCostSummary implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="PLOT_SUMMARY_ID")
	private Long plotSummaryId;
	
	@Column(name = "EST_LAND_COST")
	private Long estLandCost;
	
	@Column(name = "ACT_LAND_COST")
	private Long actLandCost;
	
	@Column(name = "EST_CONSTRUCTION_COST")
	private Long estConstructionCost;
	
	@Column(name = "ACT_CONSTRUCTION_COST")
	private Long actConstructionCost;
	
	@Column(name = "EST_TOTAL_COST")
	private Long estTotalCost;
	
	@Column(name = "ACT_TOTAL_COST")
	private Long actTotalCost;
	
	@Column(name = "EST_COST_OF_APPROVE")
	private Long estCostOfApprove;
	
	@Column(name = "ACT_COST_OF_APPROVE")
	private Long actCostOfApprove;
	
	
	@Column(name = "AMT_COLLECTED_FROM_ALLOTEE")
	private Long amtCollectedFromAllotee;
	
	
	@Column(name = "AMT_UTILIZED_FOR_CONSTRUCTION")
	private Long amtUtilizedforConstruction;
	
	@Column(name = "AMT_UTILIZED_PER")
	private Float amtUtilPercentage;
	
	@Column(name = "BALANCE_AMT")
	private Long balanceAmt;
	
	@Column(name = "PERTICULARS_NAME")
	private Long perticularsname;


	public Long getEstTotalCost() {
		return estTotalCost;
	}

	public void setEstTotalCost(Long estTotalCost) {
		this.estTotalCost = estTotalCost;
	}

	public Long getActTotalCost() {
		return actTotalCost;
	}

	public void setActTotalCost(Long actTotalCost) {
		this.actTotalCost = actTotalCost;
	}

	public Long getEstLandCost() {
		return estLandCost;
	}

	public void setEstLandCost(Long estLandCost) {
		this.estLandCost = estLandCost;
	}

	public Long getActLandCost() {
		return actLandCost;
	}

	public void setActLandCost(Long actLandCost) {
		this.actLandCost = actLandCost;
	}

	public Long getEstConstructionCost() {
		return estConstructionCost;
	}

	public void setEstConstructionCost(Long estConstructionCost) {
		this.estConstructionCost = estConstructionCost;
	}

	public Long getActConstructionCost() {
		return actConstructionCost;
	}

	public void setActConstructionCost(Long actConstructionCost) {
		this.actConstructionCost = actConstructionCost;
	}

	public Long getEstCostOfApprove() {
		return estCostOfApprove;
	}

	public void setEstCostOfApprove(Long estCostOfApprove) {
		this.estCostOfApprove = estCostOfApprove;
	}

	public Long getActCostOfApprove() {
		return actCostOfApprove;
	}

	public void setActCostOfApprove(Long actCostOfApprove) {
		this.actCostOfApprove = actCostOfApprove;
	}

	public Long getAmtCollectedFromAllotee() {
		return amtCollectedFromAllotee;
	}

	public void setAmtCollectedFromAllotee(Long amtCollectedFromAllotee) {
		this.amtCollectedFromAllotee = amtCollectedFromAllotee;
	}

	public Long getAmtUtilizedforConstruction() {
		return amtUtilizedforConstruction;
	}

	public void setAmtUtilizedforConstruction(Long amtUtilizedforConstruction) {
		this.amtUtilizedforConstruction = amtUtilizedforConstruction;
	}

	public Long getBalanceAmt() {
		return balanceAmt;
	}

	public void setBalanceAmt(Long balanceAmt) {
		this.balanceAmt = balanceAmt;
	}

	
	public Float getAmtUtilPercentage() {
		return amtUtilPercentage;
	}

	public void setAmtUtilPercentage(Float amtUtilPercentage) {
		this.amtUtilPercentage = amtUtilPercentage;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public Long getPerticularsname() {
		return perticularsname;
	}

	public void setPerticularsname(Long perticularsname) {
		this.perticularsname = perticularsname;
	}

	public Long getPlotSummaryId() {
		return plotSummaryId;
	}

	public void setPlotSummaryId(Long plotSummaryId) {
		this.plotSummaryId = plotSummaryId;
	}


	
}
	
	