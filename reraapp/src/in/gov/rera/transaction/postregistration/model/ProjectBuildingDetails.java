package in.gov.rera.transaction.postregistration.model;

import java.util.List;

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
import javax.persistence.Table;

import in.gov.rera.dms.beans.Document;


@Entity
@Table(name="TL_PROJECT_BUILDING_DETLS")
public class ProjectBuildingDetails {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "BUILDING_DETLS_ID")
	private Long  buildingDetailsId; 


	@Column(name = "BLOCK_NAME")
	private String blockName;

	@Column(name = "PERC_OF_COMPLETION")
	private Long  percentageOfCompletion;

	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="photographId")
	private Document photograph;

	@OneToMany(cascade = CascadeType.ALL,fetch=FetchType.LAZY)
	private List<FloorQuarterDetails> floorDetails;

	@Column(name = "TOWER_TD_REF")
	private Long  TowerIdRef;

	@OneToMany(cascade = CascadeType.ALL,fetch=FetchType.LAZY)
	private List<ApartmentQuarterDetailsModel> apartmentDetails;

	public Long getTowerIdRef() {
		return TowerIdRef;
	}

	public void setTowerIdRef(Long towerIdRef) {
		TowerIdRef = towerIdRef;
	}

	public List<FloorQuarterDetails> getFloorDetails() {
		return floorDetails;
	}

	public void setFloorDetails(List<FloorQuarterDetails> floorDetails) {
		this.floorDetails = floorDetails;
	}

	public String getBlockName() {
		return blockName;
	}

	public void setBlockName(String blockName) {
		this.blockName = blockName;
	}

	public Long getPercentageOfCompletion() {
		return percentageOfCompletion;
	}

	public void setPercentageOfCompletion(Long percentageOfCompletion) {
		this.percentageOfCompletion = percentageOfCompletion;
	}

	public Document getPhotograph() {
		return photograph;
	}

	public void setPhotograph(Document photograph) {
		this.photograph = photograph;
	}

	public Long getBuildingDetailsId() {
		return buildingDetailsId;
	}

	public void setBuildingDetailsId(Long buildingDetailsId) {
		this.buildingDetailsId = buildingDetailsId;
	}

	public List<ApartmentQuarterDetailsModel> getApartmentDetails() {
		return apartmentDetails;
	}

	public void setApartmentDetails(List<ApartmentQuarterDetailsModel> apartmentDetails) {
		this.apartmentDetails = apartmentDetails;
	}








}