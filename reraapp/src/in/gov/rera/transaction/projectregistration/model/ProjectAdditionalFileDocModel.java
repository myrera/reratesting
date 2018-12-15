package in.gov.rera.transaction.projectregistration.model;

import java.util.Set;

import in.gov.rera.dms.beans.Document;

import javax.persistence.Column;
import javax.persistence.Entity;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import javax.persistence.Table;

/**
 * @author admin
 *
 */
@Entity(name = "projectOtherFileDocModel")
@Table(name = "TL_PROJECT_NEW__FILE_DOC")
public class ProjectAdditionalFileDocModel {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "PROJ_NEW_DOC_ID")
	private Long newDocId;
	
	@ManyToOne
	@JoinColumn(name = "SECTION_109")
	private Document section109;
	
	
	@ManyToOne
	@JoinColumn(name = "SECTION_95")
	private Document section95;
	
	@ManyToOne
	@JoinColumn(name = "SECTION_14")
	private Document section14;
	

	@ManyToOne
	@JoinColumn(name = "ANY_OTHER_DOC")
	private Document anyOtherDoc;
	 
	@ManyToOne
	@JoinColumn(name = "UTILISATION_CERTIFICATE")
	private Document utilisationCert;
	
	@ManyToOne
	@JoinColumn(name = "TRANSFER_OF_DEV_RIGHTS_CERT")
	private Document transferOfDevRightsCert;
	
	@ManyToOne
	@JoinColumn(name = "RELINQUISHMENT_DEED")
	private Document relinquishmenDeed;
	
	@ManyToOne
	@JoinColumn(name = "FIRE_FORCE_DEPT")
	private Document fireForceDept;
	
	@ManyToOne
	@JoinColumn(name = "AIRPORT_AUTHORITY_INDIA")
	private Document airportAuthorityOfIndia;
	
	@ManyToOne
	@JoinColumn(name = "BESCOM")
	private Document bescom;
	
	@ManyToOne
	@JoinColumn(name = "BWSSB")
	private Document bwssb;
	
	@ManyToOne
	@JoinColumn(name = "KSPCB")
	private Document kspcb;
	
	@ManyToOne
	@JoinColumn(name = "SEIAA")
	private Document seiaa;
	
	@ManyToOne
	@JoinColumn(name = "BSNL")
	private Document bsnl;
	
	@ManyToOne
	@JoinColumn(name = "BMRCL")
	private Document bmrcl;
	 
		
	@ManyToOne
	@JoinColumn(name = "BANGALORE_URBAN_ARTS_COMMISSION")
	private Document  bangaloreUrbanArtsCommission;
 
	@ManyToOne
	@JoinColumn(name = "INSP_FACT_CNTRL_EXPLVS_RLY")
	private Document  inspectorOfFactoriesCntrlOfExplosivesRailways;
	
	@ManyToOne
	@JoinColumn(name = "DIST_MAGISTRATE")
	private Document  distMagistrate;
	
	@ManyToOne
	@JoinColumn(name = "CSTL_REG_ZONE_AUTHORITY")
	private Document  coastalRegulationZoneAuthority;
	
	@ManyToOne
	@JoinColumn(name = "STRUCTURAL_ENGINEER_CERTIFICATE")
	private Document engrIndicateStructural;
	
	@ManyToOne
	@JoinColumn(name = "SECTIONAL_DRAWING")
	private Document sectionalDrawingOfTheApartments; 

	@ManyToOne
	@JoinColumn(name = "NOC_BUILDING_ABUTTING_NEIGHBR")
	private Document  nocBuildingAbuttingToNeighbourProperties;
	
	@ManyToOne
	@JoinColumn(name = "LIFT_AUTHORITIES")
	private Document  liftAuthorities;
	
	@ManyToOne
	@JoinColumn(name = "URBAN_LAND_CEILING")
	private Document  urbanLandCeiling;
	
	@ManyToOne
	@JoinColumn(name = "ADVOCATE_SEARCH_REPORT")
	private Document  advocatesearchreport;
	
	@ManyToOne
	@JoinColumn(name = "REJECT_REASON_DOC")
	private Document  rejectReasonDoc;
	
	
	
	
	
	
	
	public Document getAdvocatesearchreport() {
		return advocatesearchreport;
	}

	public void setAdvocatesearchreport(Document advocatesearchreport) {
		this.advocatesearchreport = advocatesearchreport;
	}

	public Long getNewDocId() {
		return newDocId;
	}

	public void setNewDocId(Long newDocId) {
		this.newDocId = newDocId;
	}

	
	// END Addedd new 3 fields
		
	public Document getSection95() {
		return section95;
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


	public Document getSectionalDrawingOfTheApartments() {
		return sectionalDrawingOfTheApartments;
	}


	public void setSectionalDrawingOfTheApartments(
			Document sectionalDrawingOfTheApartments) {
		this.sectionalDrawingOfTheApartments = sectionalDrawingOfTheApartments;
	}


	public Document getUtilisationCert() {
		return utilisationCert;
	}


	public void setUtilisationCert(Document utilisationCert) {
		this.utilisationCert = utilisationCert;
	}


	public Document getTransferOfDevRightsCert() {
		return transferOfDevRightsCert;
	}


	public void setTransferOfDevRightsCert(Document transferOfDevRightsCert) {
		this.transferOfDevRightsCert = transferOfDevRightsCert;
	}


	public Document getRelinquishmenDeed() {
		return relinquishmenDeed;
	}


	public void setRelinquishmenDeed(Document relinquishmenDeed) {
		this.relinquishmenDeed = relinquishmenDeed;
	}


	public Document getFireForceDept() {
		return fireForceDept;
	}


	public void setFireForceDept(Document fireForceDept) {
		this.fireForceDept = fireForceDept;
	}


	public Document getAirportAuthorityOfIndia() {
		return airportAuthorityOfIndia;
	}


	public void setAirportAuthorityOfIndia(Document airportAuthorityOfIndia) {
		this.airportAuthorityOfIndia = airportAuthorityOfIndia;
	}


	public Document getBescom() {
		return bescom;
	}


	public void setBescom(Document bescom) {
		this.bescom = bescom;
	}


	public Document getBwssb() {
		return bwssb;
	}


	public void setBwssb(Document bwssb) {
		this.bwssb = bwssb;
	}


	public Document getKspcb() {
		return kspcb;
	}


	public void setKspcb(Document kspcb) {
		this.kspcb = kspcb;
	}


	public Document getSeiaa() {
		return seiaa;
	}


	public void setSeiaa(Document seiaa) {
		this.seiaa = seiaa;
	}


	public Document getBsnl() {
		return bsnl;
	}


	public void setBsnl(Document bsnl) {
		this.bsnl = bsnl;
	}


	public Document getBmrcl() {
		return bmrcl;
	}


	public void setBmrcl(Document bmrcl) {
		this.bmrcl = bmrcl;
	}


	public void setSection95(Document section95) {
		this.section95 = section95;
	}


	public Document getSection14() {
		return section14;
	}


	public void setSection14(Document section14) {
		this.section14 = section14;
	}


	public Document getAnyOtherDoc() {
		return anyOtherDoc;
	}


	public void setAnyOtherDoc(Document anyOtherDoc) {
		this.anyOtherDoc = anyOtherDoc;
	}

	public Document getSection109() {
		return section109;
	}


	public void setSection109(Document section109) {
		this.section109 = section109;
	}

	public Document getUrbanLandCeiling() {
		return urbanLandCeiling;
	}

	public void setUrbanLandCeiling(Document urbanLandCeiling) {
		this.urbanLandCeiling = urbanLandCeiling;
	}

	public Document getRejectReasonDoc() {
		return rejectReasonDoc;
	}

	public void setRejectReasonDoc(Document rejectReasonDoc) {
		this.rejectReasonDoc = rejectReasonDoc;
	}

	
	


}
