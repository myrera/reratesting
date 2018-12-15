package in.gov.rera.transaction.postregistration.plots.model;

import java.io.Serializable;
import java.util.Calendar;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import in.gov.rera.dms.beans.Document;

@Entity(name = "PlotCommonAreasToBeUsedByPurchaserModel")
@Table(name = "TL_PLOT_COMMON_AREA_PURCHASER")
public class PlotCommonAreasToBeUsedByPurchaserModel implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "COMMON_AREA_PURCHASER_ID")
	private Long commonAreasToBeUsedByPurchaserId;

	@Column(name = "COMMON_AREA")
	private String commonArea;

	@Column(name = "IS_APPLICABLE")
	private String isApplicable;
	

	@Column(name = "CREATED_ON")
	@Temporal(TemporalType.TIMESTAMP)
	private Calendar createdOn;
	
	@Column(name = "PERC_OF_COMPLETION")
	private Long  percentageOfCompletion;

	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="photographId")
	private Document photograph;
	
	

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

	public Long getCommonAreasToBeUsedByPurchaserId() {
		return commonAreasToBeUsedByPurchaserId;
	}

	public void setCommonAreasToBeUsedByPurchaserId(Long commonAreasToBeUsedByPurchaserId) {
		this.commonAreasToBeUsedByPurchaserId = commonAreasToBeUsedByPurchaserId;
	}

	public String getCommonArea() {
		return commonArea;
	}

	public void setCommonArea(String commonArea) {
		this.commonArea = commonArea;
	}

	public String getIsApplicable() {
		return isApplicable;
	}

	public void setIsApplicable(String isApplicable) {
		this.isApplicable = isApplicable;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public Calendar getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(Calendar createdOn) {
		this.createdOn = createdOn;
	}

	

	
}
