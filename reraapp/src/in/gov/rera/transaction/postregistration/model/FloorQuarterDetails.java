package in.gov.rera.transaction.postregistration.model;

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
@Table(name = "TL_FLOOR_QUART_DETLS")
public class FloorQuarterDetails implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "FLOOR_QUART_ID")
	private Long FloorQuartId;
	
	@Column(name = "FLOOR_NO")
	private Long floorNo;
	
	@Column(name = "PERC_OF_COMPLETION")
	private Long  percentageOfCompletionFloor;

	/*@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="photographId")
	private Document photograph;*/


	public Long getFloorNo() {
		return floorNo;
	}

	public Long getFloorQuartId() {
		return FloorQuartId;
	}

	public void setFloorQuartId(Long floorQuartId) {
		FloorQuartId = floorQuartId;
	}

	public void setFloorNo(Long floorNo) {
		this.floorNo = floorNo;
	}

	
public Long getPercentageOfCompletionFloor() {
		return percentageOfCompletionFloor;
	}

	public void setPercentageOfCompletionFloor(Long percentageOfCompletionFloor) {
		this.percentageOfCompletionFloor = percentageOfCompletionFloor;
	}

	/*
	public Document getPhotograph() {
		return photograph;
	}

	public void setPhotograph(Document photograph) {
		this.photograph = photograph;
	}
*/
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
}