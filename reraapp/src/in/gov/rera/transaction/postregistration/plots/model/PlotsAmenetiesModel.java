package in.gov.rera.transaction.postregistration.plots.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import in.gov.rera.dms.beans.Document;

@Entity(name = "PlotsAmenetiesModel")
@Table(name = "TL_PLOTS_AMENETIES_DETAILS")
public class PlotsAmenetiesModel implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "PLOTS_AMENETIES_ID")
	private Long plotsAmenetiesId;

	@Column(name = "IS_APPLICABLE")
	private String isApplicable;

	@Column(name = "AMENETIES_TYPE")
	private String amenetiesType;

	@Column(name = "ISAPPLECABLE")
	private String isApplecable;

	@Column(name = "PERCENTAGE_OF_COMPLETION")
	private String percentageOfCompletion;

	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name = "PLOT_PHOTOGRAPH")
	private Document plotPhotograph;

	public Long getPlotsAmenetiesId() {
		return plotsAmenetiesId;
	}

	public void setPlotsAmenetiesId(Long plotsAmenetiesId) {
		this.plotsAmenetiesId = plotsAmenetiesId;
	}

	public String getIsApplicable() {
		return isApplicable;
	}

	public void setIsApplicable(String isApplicable) {
		this.isApplicable = isApplicable;
	}

	public String getAmenetiesType() {
		return amenetiesType;
	}

	public void setAmenetiesType(String amenetiesType) {
		this.amenetiesType = amenetiesType;
	}

	public String getIsApplecable() {
		return isApplecable;
	}

	public void setIsApplecable(String isApplecable) {
		this.isApplecable = isApplecable;
	}

	public String getPercentageOfCompletion() {
		return percentageOfCompletion;
	}

	public void setPercentageOfCompletion(String percentageOfCompletion) {
		this.percentageOfCompletion = percentageOfCompletion;
	}

	public Document getPlotPhotograph() {
		return plotPhotograph;
	}

	public void setPlotPhotograph(Document plotPhotograph) {
		this.plotPhotograph = plotPhotograph;
	}
	
	
	

}
