package in.gov.rera.transaction.postregistration.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name ="TL_PROJECT_JDA_PROMOTER_DELS")
public class ProjectJDAPromoterDetails implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="PROMOTER_JDA_ID")
	private Long promoterJDAId;
	
	@Column(name = "PROMOTER_NAME")
	private String promoterName;
	
	@Column(name = "NO_OF_UNITS_SHARE")
	private Long noOfUnitsOfShare;
	
	@Column(name = "PERCENTAGE_SHARE")
	private Long percentageOfShare;

	public Long getPromoterJDAId() {
		return promoterJDAId;
	}

	public void setPromoterJDAId(Long promoterJDAId) {
		this.promoterJDAId = promoterJDAId;
	}

	public String getPromoterName() {
		return promoterName;
	}

	public void setPromoterName(String promoterName) {
		this.promoterName = promoterName;
	}

	public Long getNoOfUnitsOfShare() {
		return noOfUnitsOfShare;
	}

	public void setNoOfUnitsOfShare(Long noOfUnitsOfShare) {
		this.noOfUnitsOfShare = noOfUnitsOfShare;
	}

	public Long getPercentageOfShare() {
		return percentageOfShare;
	}

	public void setPercentageOfShare(Long percentageOfShare) {
		this.percentageOfShare = percentageOfShare;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
}
	
	
