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

@Entity(name = "TowerDetailsModel")
@Table(name = "TL_TOWER_DETAILS")
public class TowerDetailsModel {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "TOWER_DELS_ID")
	private Long towerDetailsId;

	@Column(name = "TOWER_NAME")
	private String towerName;

	@Column(name = "TOT_NO_OF_TOWER")
	private Long totNoOfTower;
	
	@Column(name = "TOT_NO_OF_FLOOR")
	private Long totNoOfFloor;
	
	@Column(name = "TOT_APARTMENTS")
	private Long totApartments;

	@Column(name = "TOT_NO_OF_BASEMENT")
	private Long totNoOfBasement;


	@Column(name = "TOT_NO_OF_STILLS")
	private Long totNoOfStills;


	@Column(name = "TOT_NO_OF_SLABS_OF_SUP_STRUCTURE")
	private Long totNoOfSlabsOfSuperStructure;

	@Column(name = "TOT_NO_OF_GARAGES")
	private Long totNoOfGarages;

	@Column(name = "NO_OF_GARAGES_BOOKED")
	private Long noOfGaragesBooked;

	@Column(name = "TOTAL_NO_OF_TOWERS")
	private Long totalNoOfTowers;
	
	@Column(name = "NO_OF_GARAGES_AVAILABLE")
	private Long noOfGaragesAvailable;

	@Column(name = "NO_OF_APARTMENTS_BOOKED")
	private Long noOfApartmentsBooked;


	@Column(name = "NO_OF_APARTMENTS_REMAINED")
	private Long noOfApartmentsRemained;

	@Column(name = "TOT_NO_OF_OPEN_CAR_PARKING")
	private Long totNoOfOpenCarParking;


	@Column(name = "TOT_NO_OF_CLOSED_CAR_PARKING")
	private Long totNoOfClosedCarParking;
	
	@Column(name = "APARTMENT_TYPE")
	private String apartmentType; //residencial,comercial,Mixed
	
	@OneToMany(cascade = CascadeType.ALL,fetch=FetchType.LAZY)
	@OrderColumn(name = "floor_index")
	private List<FloorDetailsModel> floorDetailsList;
	
	@OneToMany(cascade = CascadeType.ALL,fetch=FetchType.LAZY)
	private List<ProjectApartmentDetails> apartmentDetailsList;
	
	@OneToMany(cascade = CascadeType.ALL,fetch=FetchType.LAZY)
	private List<TowerUnitDetailsExcel> towerUnitDetailsList;
	
	
	
	
	public List<TowerUnitDetailsExcel> getTowerUnitDetailsList() {
		return towerUnitDetailsList;
	}

	public void setTowerUnitDetailsList(List<TowerUnitDetailsExcel> towerUnitDetailsList) {
		this.towerUnitDetailsList = towerUnitDetailsList;
	}

	public String getApartmentType() {
		return apartmentType;
	}

	public void setApartmentType(String apartmentType) {
		this.apartmentType = apartmentType;
	}

	public Long getTowerDetailsId() {
		return towerDetailsId;
	}

	public void setTowerDetailsId(Long towerDetailsId) {
		this.towerDetailsId = towerDetailsId;
	}

	public String getTowerName() {
		return towerName;
	}

	public void setTowerName(String towerName) {
		this.towerName = towerName;
	}


	
	public Long getTotNoOfTower() {
		return totNoOfTower;
	}

	public void setTotNoOfTower(Long totNoOfTower) {
		this.totNoOfTower = totNoOfTower;
	}

	public Long getTotNoOfFloor() {
		return totNoOfFloor;
	}

	public void setTotNoOfFloor(Long totNoOfFloor) {
		this.totNoOfFloor = totNoOfFloor;
	}

	public Long getTotApartments() {
		return totApartments;
	}

	public void setTotApartments(Long totApartments) {
		this.totApartments = totApartments;
	}

	public Long getTotNoOfBasement() {
		return totNoOfBasement;
	}

	public void setTotNoOfBasement(Long totNoOfBasement) {
		this.totNoOfBasement = totNoOfBasement;
	}

	public Long getTotNoOfStills() {
		return totNoOfStills;
	}

	public void setTotNoOfStills(Long totNoOfStills) {
		this.totNoOfStills = totNoOfStills;
	}

	public Long getTotNoOfSlabsOfSuperStructure() {
		return totNoOfSlabsOfSuperStructure;
	}

	public void setTotNoOfSlabsOfSuperStructure(Long totNoOfSlabsOfSuperStructure) {
		this.totNoOfSlabsOfSuperStructure = totNoOfSlabsOfSuperStructure;
	}

	public Long getTotNoOfGarages() {
		return totNoOfGarages;
	}

	public void setTotNoOfGarages(Long totNoOfGarages) {
		this.totNoOfGarages = totNoOfGarages;
	}

	public Long getNoOfGaragesBooked() {
		return noOfGaragesBooked;
	}

	public void setNoOfGaragesBooked(Long noOfGaragesBooked) {
		this.noOfGaragesBooked = noOfGaragesBooked;
	}

	public Long getNoOfGaragesAvailable() {
		return noOfGaragesAvailable;
	}

	public void setNoOfGaragesAvailable(Long noOfGaragesAvailable) {
		this.noOfGaragesAvailable = noOfGaragesAvailable;
	}

	public Long getNoOfApartmentsBooked() {
		return noOfApartmentsBooked;
	}

	public void setNoOfApartmentsBooked(Long noOfApartmentsBooked) {
		this.noOfApartmentsBooked = noOfApartmentsBooked;
	}

	public Long getNoOfApartmentsRemained() {
		return noOfApartmentsRemained;
	}

	public void setNoOfApartmentsRemained(Long noOfApartmentsRemained) {
		this.noOfApartmentsRemained = noOfApartmentsRemained;
	}

	public Long getTotNoOfOpenCarParking() {
		return totNoOfOpenCarParking;
	}

	public void setTotNoOfOpenCarParking(Long totNoOfOpenCarParking) {
		this.totNoOfOpenCarParking = totNoOfOpenCarParking;
	}

	public Long getTotNoOfClosedCarParking() {
		return totNoOfClosedCarParking;
	}

	public void setTotNoOfClosedCarParking(Long totNoOfClosedCarParking) {
		this.totNoOfClosedCarParking = totNoOfClosedCarParking;
	}

	public List<FloorDetailsModel> getFloorDetailsList() {
		return floorDetailsList;
	}

	public void setFloorDetailsList(List<FloorDetailsModel> floorDetailsList) {
		this.floorDetailsList = floorDetailsList;
	}

	public List<ProjectApartmentDetails> getApartmentDetailsList() {
		return apartmentDetailsList;
	}

	public void setApartmentDetailsList(List<ProjectApartmentDetails> apartmentDetailsList) {
		this.apartmentDetailsList = apartmentDetailsList;
	}

	public Long getTotalNoOfTowers() {
		return totalNoOfTowers;
	}

	public void setTotalNoOfTowers(Long totalNoOfTowers) {
		this.totalNoOfTowers = totalNoOfTowers;
	}

	

	
	

}
