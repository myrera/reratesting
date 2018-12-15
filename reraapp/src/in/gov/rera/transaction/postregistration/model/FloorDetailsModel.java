package in.gov.rera.transaction.postregistration.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="TL_FLOOR_DETLS")
public class FloorDetailsModel {
	

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "FLOOR_DELS_ID")
	private Long floorDetailsId;
	
	@Column(name = "FLOOR_NO")
	private Integer floorNo;
	
	@Column(name = "FLOOR_NAME")
	private String floorName;

	
	
	@Column(name = "TOT_NO_OF_FLOOR")
	private Long totNoOfApartment;

	public Long getFloorDetailsId() {
		return floorDetailsId;
	}

	public void setFloorDetailsId(Long floorDetailsId) {
		this.floorDetailsId = floorDetailsId;
	}



	public Integer getFloorNo() {
		return floorNo;
	}

	public void setFloorNo(Integer floorNo) {
		this.floorNo = floorNo;
	}

	public String getFloorName() {
		return floorName;
	}

	public void setFloorName(String floorName) {
		this.floorName = floorName;
	}

	
	public Long getTotNoOfApartment() {
		return totNoOfApartment;
	}

	public void setTotNoOfApartment(Long totNoOfApartment) {
		this.totNoOfApartment = totNoOfApartment;
	}
	
	
	



	
	

}
