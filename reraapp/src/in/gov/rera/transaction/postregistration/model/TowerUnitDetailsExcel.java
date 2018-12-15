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
import javax.persistence.OrderColumn;
import javax.persistence.Table;

@Entity(name = "TowerUnitDetailsExcel")
@Table(name = "TL_TOWER_UNIT_DETAILS")
public class TowerUnitDetailsExcel {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "TOWER_UNIT_DELS_ID")
	private Long towerUnitDetailsId;

	private long floorNo;

	private String unitNo;

	private String unitType;

	private long carpetArea;

	private long exclusiveCommonAreaAllote;

	private long commonAreaAllotedTo;

	private long unDevidedShare;

	private long noOfParkingLots;

	@Column(name = "TOWER_TD_REF")
	private Long  TowerRefId;

	public Long getTowerRefId() {
		return TowerRefId;
	}

	public void setTowerRefId(Long TowerRefId) {
		this.TowerRefId = TowerRefId;
	}

	public Long getTowerUnitDetailsId() {
		return towerUnitDetailsId;
	}

	public void setTowerUnitDetailsId(Long towerUnitDetailsId) {
		this.towerUnitDetailsId = towerUnitDetailsId;
	}

	public long getFloorNo() {
		return floorNo;
	}

	public void setFloorNo(long floorNo) {
		this.floorNo = floorNo;
	}

	public String getUnitNo() {
		return unitNo;
	}

	public void setUnitNo(String unitNo) {
		this.unitNo = unitNo;
	}

	public String getUnitType() {
		return unitType;
	}

	public void setUnitType(String unitType) {
		this.unitType = unitType;
	}

	public long getCarpetArea() {
		return carpetArea;
	}

	public void setCarpetArea(long carpetArea) {
		this.carpetArea = carpetArea;
	}

	public long getExclusiveCommonAreaAllote() {
		return exclusiveCommonAreaAllote;
	}

	public void setExclusiveCommonAreaAllote(long exclusiveCommonAreaAllote) {
		this.exclusiveCommonAreaAllote = exclusiveCommonAreaAllote;
	}

	public long getCommonAreaAllotedTo() {
		return commonAreaAllotedTo;
	}

	public void setCommonAreaAllotedTo(long commonAreaAllotedTo) {
		this.commonAreaAllotedTo = commonAreaAllotedTo;
	}

	public long getUnDevidedShare() {
		return unDevidedShare;
	}

	public void setUnDevidedShare(long unDevidedShare) {
		this.unDevidedShare = unDevidedShare;
	}

	public long getNoOfParkingLots() {
		return noOfParkingLots;
	}

	public void setNoOfParkingLots(long noOfParkingLots) {
		this.noOfParkingLots = noOfParkingLots;
	}

}
