package in.gov.rera.transaction.projectregistration.model;

import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.OrderColumn;
import javax.persistence.Table;

@Entity(name = "ExternalDevelopmentWorkModel")
@Table(name = "TL_EXT_DEVELOPMENT_DETAILS")
public class ExternalDevelopmentWorkModel {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "EXT_DEV_ID")
	private Long extDevId;

	@Column(name = "ROAD_SYSTEM_DEV_BY")
	private String roadSysetmDevBy;
    
	@OneToOne(cascade = CascadeType.ALL, fetch=FetchType.LAZY)
    @JoinColumn(name = "CURRENT_STATUSID")
	private ExtDevelopmentStatus currentStatus;
    
    
	 @OneToMany(cascade = CascadeType.ALL, fetch=FetchType.LAZY)
	 @OrderColumn(name="orders_index")
	private List<ExtDevelopmentStatus> previuosStatusList;
	
	
	@Column(name = "WATER_SUPPLY_BY")
	private String waterSupplyBy;

	@Column(name = "SEWEGE_AND_DRAINAGE_SYSTEM_DEV_BY")
	private String sewegeAndDrainageSystemDevBy;
	
	
	@Column(name = "ELECTRICITY_AND_TRANSFORMER_SUPPLY_BY")
	private String electricityAndTrasfomerSupply;


	
	@Column(name = "SOLID_WASTE_MANG_BY")
	private String solidWasteSupplyBy;
	

	@Column(name = "FIRE_FIGHTING_FACILITY")
	private String fireFighting;

	@Column(name = "DRINKING_WATER_FACILITY")
	private String drinkingWater;

	@Column(name = "EMERGENCY_EVACUTION_SERVICES")
	private String emergencyEvacuation;

	@Column(name = "USE_OF_RENEWABLE_ENERGY")
	private String renewableEnergy;
	
	
	
    	
	@OneToMany(mappedBy = "externalDevelopmentWorkModel", cascade = CascadeType.ALL,fetch=FetchType.LAZY)
	private Set<ExtOtherDevModel> extOtherDevSet;
	


	public Long getExtDevId() {
		return extDevId;
	}

	public void setExtDevId(Long extDevId) {
		this.extDevId = extDevId;
	}

	public String getRoadSysetmDevBy() {
		return roadSysetmDevBy;
	}

	public void setRoadSysetmDevBy(String roadSysetmDevBy) {
		this.roadSysetmDevBy = roadSysetmDevBy;
	}

	public String getWaterSupplyBy() {
		return waterSupplyBy;
	}

	public void setWaterSupplyBy(String waterSupplyBy) {
		this.waterSupplyBy = waterSupplyBy;
	}

	public String getSewegeAndDrainageSystemDevBy() {
		return sewegeAndDrainageSystemDevBy;
	}

	public void setSewegeAndDrainageSystemDevBy(
			String sewegeAndDrainageSystemDevBy) {
		this.sewegeAndDrainageSystemDevBy = sewegeAndDrainageSystemDevBy;
	}

	public String getElectricityAndTrasfomerSupply() {
		return electricityAndTrasfomerSupply;
	}

	public void setElectricityAndTrasfomerSupply(
			String electricityAndTrasfomerSupply) {
		this.electricityAndTrasfomerSupply = electricityAndTrasfomerSupply;
	}

	public String getSolidWasteSupplyBy() {
		return solidWasteSupplyBy;
	}

	public void setSolidWasteSupplyBy(String solidWasteSupplyBy) {
		this.solidWasteSupplyBy = solidWasteSupplyBy;
	}

	public Set<ExtOtherDevModel> getExtOtherDevSet() {
		return extOtherDevSet;
	}

	public void setExtOtherDevSet(Set<ExtOtherDevModel> extOtherDevSet) {
		this.extOtherDevSet = extOtherDevSet;
	}

	public ExtDevelopmentStatus getCurrentStatus() {
		return currentStatus;
	}

	public void setCurrentStatus(ExtDevelopmentStatus currentStatus) {
		this.currentStatus = currentStatus;
	}

	public List<ExtDevelopmentStatus> getPreviuosStatusList() {
		return previuosStatusList;
	}

	public void setPreviuosStatusList(List<ExtDevelopmentStatus> previuosStatusList) {
		this.previuosStatusList = previuosStatusList;
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
