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

@Entity(name = "PlotsCommonAreaRelinquisedAuthorityModel")
@Table(name = "TL_PLOT_COMMON_AREA_RELQ_AUTH")
public class PlotsCommonAreaRelinquisedAuthorityModel implements Serializable  {
	
	private static final long serialVersionUID = 555667681L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "PLOT_COMMON_AUTH_ID")
	private Long plotsCommonAreaAuthId;
	
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
	
	
	@Column(name = "PERC_OF_COMPLETION")
	private Long  percentageOfCompletion;

	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="photographId")
	private Document photograph;
	
	

	public Long getPlotsCommonAreaAuthId() {
		return plotsCommonAreaAuthId;
	}


	public void setPlotsCommonAreaAuthId(Long plotsCommonAreaAuthId) {
		this.plotsCommonAreaAuthId = plotsCommonAreaAuthId;
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

	public Long getTotAreaOfParkAndOpenSpace() {
		return totAreaOfParkAndOpenSpace;
	}


	public void setTotAreaOfParkAndOpenSpace(Long totAreaOfParkAndOpenSpace) {
		this.totAreaOfParkAndOpenSpace = totAreaOfParkAndOpenSpace;
	}


	public Long getTotNoOfParkAndOpenSpace() {
		return totNoOfParkAndOpenSpace;
	}


	public void setTotNoOfParkAndOpenSpace(Long totNoOfParkAndOpenSpace) {
		this.totNoOfParkAndOpenSpace = totNoOfParkAndOpenSpace;
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


	public Long getPercentageOfCompletion() {
		return percentageOfCompletion;
	}


	public void setPercentageOfCompletion(Long percentageOfCompletion) {
		this.percentageOfCompletion = percentageOfCompletion;
	}


	public Document getPhotograph() {
		return photograph;
	}


	public void setPhotograph(Document photograph) {
		this.photograph = photograph;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	
	
}
