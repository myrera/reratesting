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
@Table(name = "TL_INTERNAL_INFRASTRUCTURE_DETLS")
public class ProjectInternalInfrastructureDetails implements Serializable{
	
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

	/*@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="photographId")
	private Document photograph;*/
	
	@Column(name = "CREATED_ON")
	@Temporal(TemporalType.TIMESTAMP)
	private Calendar createdOn;
	
	@Column(name = "IS_APPLICABLE")
	private String isApplicable;


	public Calendar getCreatedOn() {
		return createdOn;
	}

	public String getIsApplicable() {
		return isApplicable;
	}

	public void setIsApplicable(String isApplicable) {
		this.isApplicable = isApplicable;
	}

	public void setCreatedOn(Calendar createdOn) {
		this.createdOn = createdOn;
	}

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

	/*public Document getPhotograph() {
		return photograph;
	}

	public void setPhotograph(Document photograph) {
		this.photograph = photograph;
	}*/

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
}