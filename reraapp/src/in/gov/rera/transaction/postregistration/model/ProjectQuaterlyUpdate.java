package in.gov.rera.transaction.postregistration.model;

import java.io.Serializable;
import java.util.Calendar;
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
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.springframework.format.annotation.DateTimeFormat;

@Entity(name = "ProjectQuaterlyUpdate")
@Table(name = "TL_QUATERLY_UPDATE")
public class ProjectQuaterlyUpdate implements Serializable{	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID")
	private Long quaterlyId;
		
		@Column(name = "UPDATE_DATE")
		@Temporal(TemporalType.DATE) //drops the time value and only preserves the date.
		@DateTimeFormat(pattern = "dd/MM/yyyy") 
		private Calendar updateDate;
		
		@Column(name = "ACTUAL_UPDATE_DATE")
		@Temporal(TemporalType.DATE) //drops the time value and only preserves the date.
		@DateTimeFormat(pattern = "dd/MM/yyyy") 
		private Calendar actualUpdateDate;
		
		@OneToMany(cascade = CascadeType.ALL,fetch=FetchType.LAZY)
		private List<ProjectWorkModel> projectWorkModel;
		

		@OneToOne(cascade = CascadeType.ALL)
		@JoinColumn(name = "PROJECT_BANK_DETLS_ID")
		private ProjectBankDetails bankDetails;
		
		/*@OneToMany(cascade = CascadeType.ALL,fetch=FetchType.LAZY)
		private List<ProjectApartmentDetails> apartmentDetails;
*/		
		@OneToOne(cascade = CascadeType.ALL)
		@JoinColumn(name = "PROJECT_PARKING_DETLS_ID")
		private ProjectParkingDetails parkingDetails;
		
		@OneToMany(cascade = CascadeType.ALL,fetch=FetchType.LAZY)
		private List<ProjectBuildingDetails> buildingDetails;
		
		@OneToMany(cascade = CascadeType.ALL,fetch=FetchType.LAZY)
		private List<QuarterCommonAreaDetails> commonAreaDetails;
		
		@OneToMany(cascade = CascadeType.ALL,fetch=FetchType.LAZY)
		private List<ProjectApprovalsAndNOCDetails> approvalsAndNOCDetails;
		
		@OneToMany(cascade = CascadeType.ALL,fetch=FetchType.LAZY)
		private List<ProjectLitigationDetails> litigationDetails;
		
		@OneToMany(cascade = CascadeType.ALL,fetch=FetchType.LAZY)
		private List<ProjectModificationDetails> modificationDetails;
		
		@OneToOne(cascade = CascadeType.ALL)
		@JoinColumn(name = "ASSOCIATION_DETLS_ID")
		private ProjectAssociationRegistrationDetails associationDetails;
		
		@OneToOne(cascade = CascadeType.ALL)
		@JoinColumn(name = "PROJECT_WELFARE_ID")
		private ProjectWelfareFundDetails projectWelfareFundDetails;
		
		@OneToMany(cascade = CascadeType.ALL,fetch=FetchType.LAZY)
		private List<QuarterConstructionCostModel> quarterConstructionCostList;
		
		@OneToMany(cascade = CascadeType.ALL,fetch=FetchType.LAZY)
		private List<QuarterSuperStructureModel> superStructureList;
		
		@OneToMany(cascade = CascadeType.ALL,fetch=FetchType.LAZY)
		private List<QuarterSubStructureModel> subStructureList;

		@OneToMany(cascade = CascadeType.ALL,fetch=FetchType.LAZY)
		private List<QuarterAmenityDetails> amenityList;

		@OneToMany(cascade = CascadeType.ALL,fetch=FetchType.LAZY)
		private List<QuarteMasnoryModel> masonryList;
		
		@OneToMany(cascade = CascadeType.ALL,fetch=FetchType.LAZY)
		private List<QuarterFinishingInteriorModel> finishingOrInteriorWorkList;
		
		@OneToMany(cascade = CascadeType.ALL,fetch=FetchType.LAZY)
		private List<QuarterInternalInfrastructureDetails> infrastructureDetails;
		
		@OneToMany(cascade = CascadeType.ALL,fetch=FetchType.LAZY)
		private List<QuarterExternalInfrastructureWorksModel> externalinfrastructureDetails;
		
		public List<QuarterSubStructureModel> getSubStructureList() {
			return subStructureList;
		}

		public void setSubStructureList(List<QuarterSubStructureModel> subStructureList) {
			this.subStructureList = subStructureList;
		}

		public List<QuarterSuperStructureModel> getSuperStructureList() {
			return superStructureList;
		}

		public void setSuperStructureList(List<QuarterSuperStructureModel> superStructureList) {
			this.superStructureList = superStructureList;
		}
		
	
		public ProjectWelfareFundDetails getProjectWelfareFundDetails() {
			return projectWelfareFundDetails;
		}

		public void setProjectWelfareFundDetails(ProjectWelfareFundDetails projectWelfareFundDetails) {
			this.projectWelfareFundDetails = projectWelfareFundDetails;
		}

		public Long getQuaterlyId() {
			return quaterlyId;
		}

		

		public List<QuarterConstructionCostModel> getQuarterConstructionCostList() {
			return quarterConstructionCostList;
		}

		public void setQuarterConstructionCostList(List<QuarterConstructionCostModel> quarterConstructionCostList) {
			this.quarterConstructionCostList = quarterConstructionCostList;
		}

		public void setQuaterlyId(Long quaterlyId) {
			this.quaterlyId = quaterlyId;
		}

		public Calendar getUpdateDate() {
			return updateDate;
		}

		public void setUpdateDate(Calendar updateDate) {
			this.updateDate = updateDate;
		}

		public Calendar getActualUpdateDate() {
			return actualUpdateDate;
		}

		public void setActualUpdateDate(Calendar actualUpdateDate) {
			this.actualUpdateDate = actualUpdateDate;
		}




		public List<ProjectWorkModel> getProjectWorkModel() {
			return projectWorkModel;
		}

		public void setProjectWorkModel(List<ProjectWorkModel> projectWorkModel) {
			this.projectWorkModel = projectWorkModel;
		}

		public ProjectParkingDetails getParkingDetails() {
			return parkingDetails;
		}

		public void setParkingDetails(ProjectParkingDetails parkingDetails) {
			this.parkingDetails = parkingDetails;
		}



		public List<ProjectBuildingDetails> getBuildingDetails() {
			return buildingDetails;
		}

		public void setBuildingDetails(List<ProjectBuildingDetails> buildingDetails) {
			this.buildingDetails = buildingDetails;
		}

		public List<ProjectModificationDetails> getModificationDetails() {
			return modificationDetails;
		}

		public void setModificationDetails(List<ProjectModificationDetails> modificationDetails) {
			this.modificationDetails = modificationDetails;
		}

		public ProjectAssociationRegistrationDetails getAssociationDetails() {
			return associationDetails;
		}

		public void setAssociationDetails(ProjectAssociationRegistrationDetails associationDetails) {
			this.associationDetails = associationDetails;
		}

	
		public static long getSerialversionuid() {
			return serialVersionUID;
		}

		public ProjectBankDetails getBankDetails() {
			return bankDetails;
		}

		public void setBankDetails(ProjectBankDetails bankDetails) {
			this.bankDetails = bankDetails;
		}


		

		public List<QuarterCommonAreaDetails> getCommonAreaDetails() {
			return commonAreaDetails;
		}

		public void setCommonAreaDetails(List<QuarterCommonAreaDetails> commonAreaDetails) {
			this.commonAreaDetails = commonAreaDetails;
		}

		public List<ProjectApprovalsAndNOCDetails> getApprovalsAndNOCDetails() {
			return approvalsAndNOCDetails;
		}

		public void setApprovalsAndNOCDetails(List<ProjectApprovalsAndNOCDetails> approvalsAndNOCDetails) {
			this.approvalsAndNOCDetails = approvalsAndNOCDetails;
		}

		public List<ProjectLitigationDetails> getLitigationDetails() {
			return litigationDetails;
		}

		public void setLitigationDetails(List<ProjectLitigationDetails> litigationDetails) {
			this.litigationDetails = litigationDetails;
		}

		public List<QuarterAmenityDetails> getAmenityList() {
			return amenityList;
		}

		public void setAmenityList(List<QuarterAmenityDetails> amenityList) {
			this.amenityList = amenityList;
		}

		public List<QuarteMasnoryModel> getMasonryList() {
			return masonryList;
		}

		public void setMasonryList(List<QuarteMasnoryModel> masonryList) {
			this.masonryList = masonryList;
		}

		public List<QuarterInternalInfrastructureDetails> getInfrastructureDetails() {
			return infrastructureDetails;
		}

		public void setInfrastructureDetails(List<QuarterInternalInfrastructureDetails> infrastructureDetails) {
			this.infrastructureDetails = infrastructureDetails;
		}

		public List<QuarterFinishingInteriorModel> getFinishingOrInteriorWorkList() {
			return finishingOrInteriorWorkList;
		}

		public void setFinishingOrInteriorWorkList(List<QuarterFinishingInteriorModel> finishingOrInteriorWorkList) {
			this.finishingOrInteriorWorkList = finishingOrInteriorWorkList;
		}

		public List<QuarterExternalInfrastructureWorksModel> getExternalinfrastructureDetails() {
			return externalinfrastructureDetails;
		}

		public void setExternalinfrastructureDetails(
				List<QuarterExternalInfrastructureWorksModel> externalinfrastructureDetails) {
			this.externalinfrastructureDetails = externalinfrastructureDetails;
		}
		
}
