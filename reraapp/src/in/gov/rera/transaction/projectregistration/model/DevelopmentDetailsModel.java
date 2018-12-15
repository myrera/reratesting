package in.gov.rera.transaction.projectregistration.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.OrderColumn;
import javax.persistence.Table;

@Entity(name = "DevelopmentDetailsModel")
@Table(name = "TL_DEVELOPMENT_DETAILS")
public class DevelopmentDetailsModel {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "DEV_ID")
	private Long devId;

	

	@Column(name = "TYPE_OF_INVENTORY", length = 100)
	private String typeOfInventory;
	
	@OneToOne(cascade = CascadeType.ALL, fetch=FetchType.LAZY)
	@JoinColumn(name = "DEV_STATUS_ID")
	private DevelopmentStatus currentStatus;
	
	 @OneToMany(cascade = CascadeType.ALL, fetch=FetchType.LAZY)
	 @OrderColumn(name="orders_index")
	private List<DevelopmentStatus> developmentStatusList;
	
	
	
	@Column(name = "NO_OF_INVENTORY")
	private Integer noOfInventory;

	@Column(name = "CARPETAREA")
	private Integer carpetArea;

	
	
	
	
	
	public DevelopmentStatus getCurrentStatus() {
		return currentStatus;
	}

	public void setCurrentStatus(DevelopmentStatus currentStatus) {
		this.currentStatus = currentStatus;
	}

	public List<DevelopmentStatus> getDevelopmentStatusList() {
		return developmentStatusList;
	}

	public void setDevelopmentStatusList(
			List<DevelopmentStatus> developmentStatusList) {
		this.developmentStatusList = developmentStatusList;
	}

	public Long getDevId() {
		return devId;
	}

	public void setDevId(Long devId) {
		this.devId = devId;
	}

	public String getTypeOfInventory() {
		return typeOfInventory;
	}

	public void setTypeOfInventory(String typeOfInventory) {
		this.typeOfInventory = typeOfInventory;
	}


	public Integer getNoOfInventory() {
		return noOfInventory;
	}

	public void setNoOfInventory(Integer noOfInventory) {
		this.noOfInventory = noOfInventory;
	}

	public Integer getCarpetArea() {
		return carpetArea;
	}

	public void setCarpetArea(Integer carpetArea) {
		this.carpetArea = carpetArea;
	}

	public Integer getAreaOfExclusive() {
		return areaOfExclusive;
	}

	public void setAreaOfExclusive(Integer areaOfExclusive) {
		this.areaOfExclusive = areaOfExclusive;
	}

	public Integer getAreaOfExclusiveOpenTerrace() {
		return areaOfExclusiveOpenTerrace;
	}

	public void setAreaOfExclusiveOpenTerrace(Integer areaOfExclusiveOpenTerrace) {
		this.areaOfExclusiveOpenTerrace = areaOfExclusiveOpenTerrace;
	}

	@Column(name = "ARE_OF_EXCLUSIVE")
	private Integer areaOfExclusive;

	@Column(name = "ARE_OF_EXCLUSIVE_OPEN_TERRACE")
	private Integer areaOfExclusiveOpenTerrace;


	

}
