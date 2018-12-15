package in.gov.rera.transaction.postregistration.model;

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

import in.gov.rera.dms.beans.Document;

@Entity
@Table(name = "TL_QUARTER_INTERNAL_INFRASTRUCTURE_DETLS")
public class QuarterInternalInfrastructureDetails implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "INFRASTRUCTURE_ID")
	private Long infrastructureId;
	
	@Column(name = "INFRASTRUCTURE_NAME")
	private String infrastructureName;
	
	@Column(name = "PERC_OF_COMPLETION")
	private Long  percentageOfCompletion;


	public Long getInfrastructureId() {
		return infrastructureId;
	}

	public void setInfrastructureId(Long infrastructureId) {
		this.infrastructureId = infrastructureId;
	}


	public String getInfrastructureName() {
		return infrastructureName;
	}

	public void setInfrastructureName(String infrastructureName) {
		this.infrastructureName = infrastructureName;
	}

	public Long getPercentageOfCompletion() {
		return percentageOfCompletion;
	}

	public void setPercentageOfCompletion(Long percentageOfCompletion) {
		this.percentageOfCompletion = percentageOfCompletion;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
}