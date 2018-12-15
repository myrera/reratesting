
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


@Entity(name = "ExternalInfrastructureWorksModel")
@Table(name = "TL_EXTERNAL_WORK_MODEL")
public class ExternalInfrastructureWorksModel implements Serializable{

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



	@Column(name = "IS_APPLICABLE")
	private String isApplicable;



	@Column(name = "CREATED_ON")
	@Temporal(TemporalType.TIMESTAMP)
	private Calendar createdOn;

	public static long getSerialversionuid() {
		return serialVersionUID;
	}



	public Long getExternalInfrastructureId() {
		return externalInfrastructureId;
	}



	public Calendar getCreatedOn() {
		return createdOn;
	}



	public void setCreatedOn(Calendar createdOn) {
		this.createdOn = createdOn;
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





	public String getIsApplicable() {
		return isApplicable;
	}

	public void setIsApplicable(String isApplicable) {
		this.isApplicable = isApplicable;
	}








}
