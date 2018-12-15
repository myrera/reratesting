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
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import in.gov.rera.dms.beans.Document;

@Entity(name = "PlotsDetailsModel")
@Table(name = "TL_PLOTS_DETAILS")
public class PlotsDetailsModel {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "PLOTS_DETAILS_ID")
	private Long plotsDetailsId;

	@Column(name = "TOTAL_NO_OF_PLOTS")
	private Long totalNumberOfPlots;

	/*	@ManyToOne
	@JoinColumn(name="CATEGORY")
	private PlotsCategoryModel category;*/
	
	/*@OneToMany(cascade = CascadeType.ALL,fetch=FetchType.LAZY)
	private List<PlotsWorkModel> plotWorksList;*/

	@Column(name = "TOTAL_NO_OF_PLOTS_BOOKED")
	private Long totalNumberOfPlotsBooked;
	
/*	public List<PlotsWorkModel> getPlotWorksList() {
		return plotWorksList;
	}

	public void setPlotWorksList(List<PlotsWorkModel> plotWorksList) {
		this.plotWorksList = plotWorksList;
	}*/

	@Column(name = "TOTAL_NO_OF_PLOTS_AVAILABLE")
	private Long totalNumberOfPlotsAvailable;
	
	@Column(name = "TOTAL_NO_OF_EWS_PLOTS")
	private Long totalnoOfEWSPlots;
	
	@Column(name = "TOTAL_NO_OF_LIG_PLOTS")
	private Long totalnoOfLIGPlots;
	
	@Column(name = "TOTAL_NO_OF_MIG_PLOTS")
	private Long totalnoOfMIGPlots;
	
	@Column(name = "TOTAL_NO_OF_HIG_PLOTS")
	private Long totalnoOfHIGPlots;
	
	@Column(name = "TOTAL_NO_OF_OTHER_PLOTS")
	private Long totalnoOfOtherPlots;

	public Long getPlotsDetailsId() {
		return plotsDetailsId;
	}

	public void setPlotsDetailsId(Long plotsDetailsId) {
		this.plotsDetailsId = plotsDetailsId;
	}

	public Long getTotalNumberOfPlots() {
		return totalNumberOfPlots;
	}

	public void setTotalNumberOfPlots(Long totalNumberOfPlots) {
		this.totalNumberOfPlots = totalNumberOfPlots;
	}

	public Long getTotalNumberOfPlotsBooked() {
		return totalNumberOfPlotsBooked;
	}

	public void setTotalNumberOfPlotsBooked(Long totalNumberOfPlotsBooked) {
		this.totalNumberOfPlotsBooked = totalNumberOfPlotsBooked;
	}

	public Long getTotalNumberOfPlotsAvailable() {
		return totalNumberOfPlotsAvailable;
	}

	public void setTotalNumberOfPlotsAvailable(Long totalNumberOfPlotsAvailable) {
		this.totalNumberOfPlotsAvailable = totalNumberOfPlotsAvailable;
	}

	public Long getTotalnoOfEWSPlots() {
		return totalnoOfEWSPlots;
	}

	public void setTotalnoOfEWSPlots(Long totalnoOfEWSPlots) {
		this.totalnoOfEWSPlots = totalnoOfEWSPlots;
	}

	public Long getTotalnoOfLIGPlots() {
		return totalnoOfLIGPlots;
	}

	public void setTotalnoOfLIGPlots(Long totalnoOfLIGPlots) {
		this.totalnoOfLIGPlots = totalnoOfLIGPlots;
	}

	public Long getTotalnoOfMIGPlots() {
		return totalnoOfMIGPlots;
	}

	public void setTotalnoOfMIGPlots(Long totalnoOfMIGPlots) {
		this.totalnoOfMIGPlots = totalnoOfMIGPlots;
	}

	public Long getTotalnoOfHIGPlots() {
		return totalnoOfHIGPlots;
	}

	public void setTotalnoOfHIGPlots(Long totalnoOfHIGPlots) {
		this.totalnoOfHIGPlots = totalnoOfHIGPlots;
	}

	public Long getTotalnoOfOtherPlots() {
		return totalnoOfOtherPlots;
	}

	public void setTotalnoOfOtherPlots(Long totalnoOfOtherPlots) {
		this.totalnoOfOtherPlots = totalnoOfOtherPlots;
	}











}
