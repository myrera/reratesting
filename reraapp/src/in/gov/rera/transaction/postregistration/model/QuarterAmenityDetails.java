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
@Table(name = "TL_QUARTER_AMENITY_DETLS")
public class QuarterAmenityDetails implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "AMENITY_DETLS_ID")
	private Long amenityDetailsId;
	
	@Column(name = "AMENITY_NAME")
	private String amenityName;
	
	@Column(name = "PERC_OF_COMP")
	private Long percOfCompletion;

	public Long getAmenityDetailsId() {
		return amenityDetailsId;
	}

	public void setAmenityDetailsId(Long amenityDetailsId) {
		this.amenityDetailsId = amenityDetailsId;
	}

	public String getAmenityName() {
		return amenityName;
	}

	public void setAmenityName(String amenityName) {
		this.amenityName = amenityName;
	}

	

	public Long getPercOfCompletion() {
		return percOfCompletion;
	}

	public void setPercOfCompletion(Long percOfCompletion) {
		this.percOfCompletion = percOfCompletion;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}