
package in.gov.rera.transaction.postregistration.model;

import java.io.Serializable;
import java.util.Calendar;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


@Entity(name = "QuarterExternalInfrastructureWorksModel")
@Table(name = "TL_QUARTER_EXTERNAL_WORK_MODEL")
public class QuarterExternalInfrastructureWorksModel implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "EXTERNAL_WORK_ID")
	private Long  externalInfrastructureId;

	@Column(name = "EXTERNAL_WORK_NAME")
	private String externalInfrastructureName;
	
	@Column(name = "PERC_OF_COMPLETION")
	private Long  percentageOfCompletion;

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public Long getExternalInfrastructureId() {
		return externalInfrastructureId;
	}

	public void setExternalInfrastructureId(Long externalInfrastructureId) {
		this.externalInfrastructureId = externalInfrastructureId;
	}

	public String getExternalInfrastructureName() {
		return externalInfrastructureName;
	}

	public void setExternalInfrastructureName(String externalInfrastructureName) {
		this.externalInfrastructureName = externalInfrastructureName;
	}

	public Long getPercentageOfCompletion() {
		return percentageOfCompletion;
	}

	public void setPercentageOfCompletion(Long percentageOfCompletion) {
		this.percentageOfCompletion = percentageOfCompletion;
	}

}
