package in.gov.rera.transaction.projectregistration.model;

import java.util.Calendar;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity(name = "ExtDevelopmentStatus")
@Table(name = "TL_EXT_DEV_STATUS")
public class ExtDevelopmentStatus {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "STATUS_ID")
	private int statusId;
	
	@Column(name = "ROAD_SYSTEM_STATUS")
	private int roadSysetmDevStatus;
	
	@Column(name = "WATER_SUPPLY_STATUS")
	private int waterSupplyStatus;
	
	@Column(name = "SEWEGE_AND_DRAIN_STATUS")
	private int sewegeAndDrainageStatus;
	
	@Column(name = "ELECTRICITY_SYSTEM_STATUS")
	private int electricityStatus;
	
	@Column(name = "SOLID_WASTE_STATUS")
	private int solidWasteStatus;
	
	
	@Column(name = "FIRE_FIGHTING_FACILITY")
	private String fireFighting;

	@Column(name = "DRINKING_WATER_FACILITY")
	private String drinkingWater;

	@Column(name = "EMERGENCY_EVACUTION_SERVICES")
	private String emergencyEvacuation;

	@Column(name = "USE_OF_RENEWABLE_ENERGY")
	private String renewableEnergy;
	
	
	
	@Column(name = "UPDATED_ON")
	@Temporal(TemporalType.TIMESTAMP)
	private Calendar updatedOn;


	public int getStatusId() {
		return statusId;
	}


	public void setStatusId(int statusId) {
		this.statusId = statusId;
	}


	public Integer getRoadSysetmDevStatus() {
		return roadSysetmDevStatus;
	}


	public void setRoadSysetmDevStatus(Integer roadSysetmDevStatus) {
		this.roadSysetmDevStatus = roadSysetmDevStatus;
	}


	public Integer getWaterSupplyStatus() {
		return waterSupplyStatus;
	}


	public void setWaterSupplyStatus(Integer waterSupplyStatus) {
		this.waterSupplyStatus = waterSupplyStatus;
	}


	public Integer getSewegeAndDrainageStatus() {
		return sewegeAndDrainageStatus;
	}


	public void setSewegeAndDrainageStatus(Integer sewegeAndDrainageStatus) {
		this.sewegeAndDrainageStatus = sewegeAndDrainageStatus;
	}


	public Integer getElectricityStatus() {
		return electricityStatus;
	}


	public void setElectricityStatus(int electricityStatus) {
		this.electricityStatus = electricityStatus;
	}


	public Integer getSolidWasteStatus() {
		return solidWasteStatus;
	}


	public void setSolidWasteStatus(Integer solidWasteStatus) {
		this.solidWasteStatus = solidWasteStatus;
	}


	public Calendar getUpdatedOn() {
		return updatedOn;
	}


	public void setUpdatedOn(Calendar updatedOn) {
		this.updatedOn = updatedOn;
	}


	public String getFireFighting() {
		return fireFighting;
	}


	public void setFireFighting(String fireFighting) {
		this.fireFighting = fireFighting;
	}


	public String getDrinkingWater() {
		return drinkingWater;
	}


	public void setDrinkingWater(String drinkingWater) {
		this.drinkingWater = drinkingWater;
	}


	public String getEmergencyEvacuation() {
		return emergencyEvacuation;
	}


	public void setEmergencyEvacuation(String emergencyEvacuation) {
		this.emergencyEvacuation = emergencyEvacuation;
	}


	public String getRenewableEnergy() {
		return renewableEnergy;
	}


	public void setRenewableEnergy(String renewableEnergy) {
		this.renewableEnergy = renewableEnergy;
	}

		
	
	
}
