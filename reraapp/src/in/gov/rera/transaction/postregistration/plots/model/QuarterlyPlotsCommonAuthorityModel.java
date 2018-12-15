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

@Entity(name = "QuarterlyPlotsCommonAuthorityModel")
@Table(name = "TL_PLOT_QUARTER_RELNQ_AUTH")
public class QuarterlyPlotsCommonAuthorityModel implements Serializable  {
	
	private static final long serialVersionUID = 555667681L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "PLOT_QUARTERLY_COM_AUTH_ID")
	private Long plotsQuarterlyCommonAreaAuthId;
	
	@Column(name = "TOT_NO_OF_PUBLIC_OR_SEMI_SITE")
	private Long noOfPublicOrSemiPubSites;
	
	
	@Column(name = "TOT_AREA_OF_PUBLIC_SITE")
	private Long totAreaOfPublicOrSemiPubSites;
	
	
	
	@Column(name = "TOT_NO_OF_PARK_AND_OPEN_SPACE")
	private Long totNoOfParkAndOpenSpace;
	
	@Column(name = "TOT_AREA_OF_PARK_AND_OPEN_SPACE")
	private Long totAreaOfParkAndOpenSpace;
	
	@OneToOne
	@JoinColumn(name = "PARK_AND_OPEN_SPACE_DOC_ID")
	private Document parkAndOpenSpace;
	
	@Column(name = "TOT_AREA_OF_ROAD")
	private Long totAreaOfRoad;
	
	
	@Column(name = "PERC_OF_COMPLETION_SITES")
	private Long  percentageOfCompletionOfSites;
	
	@Column(name = "PERC_OF_COMPLETION_PARK_OPEN_SPACE")
	private Long  percentageOfCompletionOfOpenSpace;
	
	@Column(name = "PERC_OF_COMPLETION_ROAD")
	private Long  percentageOfCompletionOfRoad;

	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="sitesPhotographId")
	private Document sitesPhotograph;
	
	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="openSpacePhotographId")
	private Document openSpacePhotograph;
	
	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="roadPhotographId")
	private Document roadPhotograph;

	public Long getPlotsQuarterlyCommonAreaAuthId() {
		return plotsQuarterlyCommonAreaAuthId;
	}

	public void setPlotsQuarterlyCommonAreaAuthId(Long plotsQuarterlyCommonAreaAuthId) {
		this.plotsQuarterlyCommonAreaAuthId = plotsQuarterlyCommonAreaAuthId;
	}

	public Long getNoOfPublicOrSemiPubSites() {
		return noOfPublicOrSemiPubSites;
	}

	public void setNoOfPublicOrSemiPubSites(Long noOfPublicOrSemiPubSites) {
		this.noOfPublicOrSemiPubSites = noOfPublicOrSemiPubSites;
	}

	public Long getTotAreaOfPublicOrSemiPubSites() {
		return totAreaOfPublicOrSemiPubSites;
	}

	public void setTotAreaOfPublicOrSemiPubSites(Long totAreaOfPublicOrSemiPubSites) {
		this.totAreaOfPublicOrSemiPubSites = totAreaOfPublicOrSemiPubSites;
	}

	public Long getTotNoOfParkAndOpenSpace() {
		return totNoOfParkAndOpenSpace;
	}

	public void setTotNoOfParkAndOpenSpace(Long totNoOfParkAndOpenSpace) {
		this.totNoOfParkAndOpenSpace = totNoOfParkAndOpenSpace;
	}

	public Long getTotAreaOfParkAndOpenSpace() {
		return totAreaOfParkAndOpenSpace;
	}

	public void setTotAreaOfParkAndOpenSpace(Long totAreaOfParkAndOpenSpace) {
		this.totAreaOfParkAndOpenSpace = totAreaOfParkAndOpenSpace;
	}

	public Document getParkAndOpenSpace() {
		return parkAndOpenSpace;
	}

	public void setParkAndOpenSpace(Document parkAndOpenSpace) {
		this.parkAndOpenSpace = parkAndOpenSpace;
	}

	public Long getTotAreaOfRoad() {
		return totAreaOfRoad;
	}

	public void setTotAreaOfRoad(Long totAreaOfRoad) {
		this.totAreaOfRoad = totAreaOfRoad;
	}

	public Long getPercentageOfCompletionOfSites() {
		return percentageOfCompletionOfSites;
	}

	public void setPercentageOfCompletionOfSites(Long percentageOfCompletionOfSites) {
		this.percentageOfCompletionOfSites = percentageOfCompletionOfSites;
	}

	public Long getPercentageOfCompletionOfOpenSpace() {
		return percentageOfCompletionOfOpenSpace;
	}

	public void setPercentageOfCompletionOfOpenSpace(Long percentageOfCompletionOfOpenSpace) {
		this.percentageOfCompletionOfOpenSpace = percentageOfCompletionOfOpenSpace;
	}

	public Long getPercentageOfCompletionOfRoad() {
		return percentageOfCompletionOfRoad;
	}

	public void setPercentageOfCompletionOfRoad(Long percentageOfCompletionOfRoad) {
		this.percentageOfCompletionOfRoad = percentageOfCompletionOfRoad;
	}

	public Document getSitesPhotograph() {
		return sitesPhotograph;
	}

	public void setSitesPhotograph(Document sitesPhotograph) {
		this.sitesPhotograph = sitesPhotograph;
	}

	public Document getOpenSpacePhotograph() {
		return openSpacePhotograph;
	}

	public void setOpenSpacePhotograph(Document openSpacePhotograph) {
		this.openSpacePhotograph = openSpacePhotograph;
	}

	public Document getRoadPhotograph() {
		return roadPhotograph;
	}

	public void setRoadPhotograph(Document roadPhotograph) {
		this.roadPhotograph = roadPhotograph;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	

	
}
