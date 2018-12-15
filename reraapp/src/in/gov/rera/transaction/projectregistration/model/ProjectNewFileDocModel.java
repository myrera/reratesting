package in.gov.rera.transaction.projectregistration.model;

import java.util.Set;

import in.gov.rera.dms.beans.Document;

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
import javax.persistence.Table;

@Entity(name = "projectNewFileDocModel")
@Table(name = "TL_PROJECT_NEW_FILE_DOC")
public class ProjectNewFileDocModel {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "PROJ_DOC_ID")
	private Long docId;
	
	
	@ManyToOne
	@JoinColumn(name = "NOC_BUILDING_ABUTTING_NEIGHBR")
	private Document nocBuildingAbuttingToNeighbourProperties;
	
	@ManyToOne
	@JoinColumn(name = "LIFT_AUTHORITIES")
	private Document liftAuthorities;
	
	
	
	@ManyToOne
	@JoinColumn(name = "BANGALORE_URBAN_ARTS_COMMISSION")
	private Document bangaloreUrbanArtsCommission;
	
	
	@ManyToOne
	@JoinColumn(name = "INSP_FACT_CNTRL_EXPLVS_RLY")
	private Document inspectorOfFactoriesCntrlOfExplosivesRailways;
	
	@ManyToOne
	@JoinColumn(name = "DIST_MAGISTRATE")
	private Document distMagistrate;
	
	@ManyToOne
	@JoinColumn(name = "STRUCTURAL_ENGINEER_CERTIFICATE")
	private Document engrIndicateStructural;
	
	@ManyToOne
	@JoinColumn(name = "CSTL_REG_ZONE_AUTHORITY")
	private Document coastalRegulationZoneAuthority; 
	
	

	@ManyToOne
	@JoinColumn(name = "BMRCL")
	private Document bmrcl;
	
	
	public Long getDocId() {
		return docId;
	}

	public void setDocId(Long docId) {
		this.docId = docId;
	}

	public Document getNocBuildingAbuttingToNeighbourProperties() {
		return nocBuildingAbuttingToNeighbourProperties;
	}

	public void setNocBuildingAbuttingToNeighbourProperties(
			Document nocBuildingAbuttingToNeighbourProperties) {
		this.nocBuildingAbuttingToNeighbourProperties = nocBuildingAbuttingToNeighbourProperties;
	}

	public Document getLiftAuthorities() {
		return liftAuthorities;
	}

	public void setLiftAuthorities(Document liftAuthorities) {
		this.liftAuthorities = liftAuthorities;
	}

	public Document getBangaloreUrbanArtsCommission() {
		return bangaloreUrbanArtsCommission;
	}

	public void setBangaloreUrbanArtsCommission(
			Document bangaloreUrbanArtsCommission) {
		this.bangaloreUrbanArtsCommission = bangaloreUrbanArtsCommission;
	}


	public Document getInspectorOfFactoriesCntrlOfExplosivesRailways() {
		return inspectorOfFactoriesCntrlOfExplosivesRailways;
	}

	public void setInspectorOfFactoriesCntrlOfExplosivesRailways(
			Document inspectorOfFactoriesCntrlOfExplosivesRailways) {
		this.inspectorOfFactoriesCntrlOfExplosivesRailways = inspectorOfFactoriesCntrlOfExplosivesRailways;
	}

	public Document getDistMagistrate() {
		return distMagistrate;
	}

	public void setDistMagistrate(Document distMagistrate) {
		this.distMagistrate = distMagistrate;
	}

	public Document getCoastalRegulationZoneAuthority() {
		return coastalRegulationZoneAuthority;
	}

	public void setCoastalRegulationZoneAuthority(
			Document coastalRegulationZoneAuthority) {
		this.coastalRegulationZoneAuthority = coastalRegulationZoneAuthority;
	}

	public Document getEngrIndicateStructural() {
		return engrIndicateStructural;
	}

	public void setEngrIndicateStructural(Document engrIndicateStructural) {
		this.engrIndicateStructural = engrIndicateStructural;
	}

	public Document getBmrcl() {
		return bmrcl;
	}

	public void setBmrcl(Document bmrcl) {
		this.bmrcl = bmrcl;
	}
	
	
	


}
