package in.gov.rera.transaction.postregistration.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity(name = "InventoryDetailsModel")
@Table(name = "TL_INVENTORY_DETAILS")
public class InventoryDetailsModel {


	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "INVENTORY_DELS_ID")
	private Long inventoryDetailsId;
	
	@Column(name = "INVENTORY_TYPE")
	private String inventoryType;
	
	@Column(name = "CARPET_AREA")
	private int carpetArea;

	@Column(name = "BUILTUP_AREA")
	private int builtUpArea;
	
	
	@Column(name = "PROPORTIONATE_COMMON_AREA", length = 500)
	private int proportionateCommonArea;


	public Long getInventoryDetailsId() {
		return inventoryDetailsId;
	}


	public void setInventoryDetailsId(Long inventoryDetailsId) {
		this.inventoryDetailsId = inventoryDetailsId;
	}


	public String getInventoryType() {
		return inventoryType;
	}


	public void setInventoryType(String inventoryType) {
		this.inventoryType = inventoryType;
	}


	public int getCarpetArea() {
		return carpetArea;
	}


	public void setCarpetArea(int carpetArea) {
		this.carpetArea = carpetArea;
	}


	public int getBuiltUpArea() {
		return builtUpArea;
	}


	public void setBuiltUpArea(int builtUpArea) {
		this.builtUpArea = builtUpArea;
	}


	public int getProportionateCommonArea() {
		return proportionateCommonArea;
	}


	public void setProportionateCommonArea(int proportionateCommonArea) {
		this.proportionateCommonArea = proportionateCommonArea;
	}
	
	
	
	
	
}
