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


@Entity
@Table(name = "TL_PLOTS_COMMON_AREA_DETLS")
public class PlotsCommonAreaDetails implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "COMMON_AREA_DETLS_ID")
	private Long commonAreaDetailsId;
	
	@Column(name = "COMMON_AREA_NAME")
	private String commonAreaName;
	
	@Column(name = "PERC_OF_COMPLETION")
	private Long  percentageOfCompletion;

	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="photographId")
	private Document photograph;

	public Long getCommonAreaDetailsId() {
		return commonAreaDetailsId;
	}

	public void setCommonAreaDetailsId(Long commonAreaDetailsId) {
		this.commonAreaDetailsId = commonAreaDetailsId;
	}

	public String getCommonAreaName() {
		return commonAreaName;
	}

	public void setCommonAreaName(String commonAreaName) {
		this.commonAreaName = commonAreaName;
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