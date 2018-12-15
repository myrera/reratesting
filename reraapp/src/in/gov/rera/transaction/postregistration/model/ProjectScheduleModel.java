package in.gov.rera.transaction.postregistration.model;

import java.io.Serializable;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity(name = "ProjectScheduleModel")
@Table(name = "TL_PROJECT_SCHEDULE_MODEL")
public class ProjectScheduleModel implements Serializable{
	
	private static final long serialVersionUID = 555667681L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "PROJECT_SCHEDL_ID")
	private Long projectScheduleId;
	
	
	@OneToMany(cascade = CascadeType.ALL,fetch=FetchType.LAZY)
	private List<SubStructureModel> subStructureList;
	
	@OneToMany(cascade = CascadeType.ALL,fetch=FetchType.LAZY)
	private List<SuperStructureModel> supStructureList;
	
	@OneToMany(cascade = CascadeType.ALL,fetch=FetchType.LAZY)
	private List<ProjectMasnoryModel> masonryList;
	
	@OneToMany(cascade = CascadeType.ALL,fetch=FetchType.LAZY)
	private List<FinishingInteriorModel> finishingOrInteriorWorkList;
	
	@OneToMany(cascade = CascadeType.ALL,fetch=FetchType.LAZY)
	private List<ExternalInfrastructureWorksModel> externalInfrastructureList;
	
	@OneToMany(cascade = CascadeType.ALL,fetch=FetchType.LAZY)
	private List<ProjectInternalInfrastructureDetails> internalInfraList;
	
	@OneToMany(cascade = CascadeType.ALL,fetch=FetchType.LAZY)
	private List<ProjectCommonAreaDetails> commonAreaList;
	
	@OneToMany(cascade = CascadeType.ALL,fetch=FetchType.LAZY)
	private List<ProjectAmenityDetails> amenityList;


	public List<ProjectCommonAreaDetails> getCommonAreaList() {
		return commonAreaList;
	}

	public void setCommonAreaList(List<ProjectCommonAreaDetails> commonAreaList) {
		this.commonAreaList = commonAreaList;
	}

	public List<ExternalInfrastructureWorksModel> getExternalInfrastructureList() {
		return externalInfrastructureList;
	}

	public void setExternalInfrastructureList(List<ExternalInfrastructureWorksModel> externalInfrastructureList) {
		this.externalInfrastructureList = externalInfrastructureList;
	}

	public Long getProjectScheduleId() {
		return projectScheduleId;
	}

	public void setProjectScheduleId(Long projectScheduleId) {
		this.projectScheduleId = projectScheduleId;
	}

	

	public List<SubStructureModel> getSubStructureList() {
		return subStructureList;
	}

	public void setSubStructureList(List<SubStructureModel> subStructureList) {
		this.subStructureList = subStructureList;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	public List<ProjectMasnoryModel> getMasonryList() {
		return masonryList;
	}

	public void setMasonryList(List<ProjectMasnoryModel> masonryList) {
		this.masonryList = masonryList;
	}

	public List<SuperStructureModel> getSupStructureList() {
		return supStructureList;
	}

	public void setSupStructureList(List<SuperStructureModel> supStructureList) {
		this.supStructureList = supStructureList;
	}

	public List<FinishingInteriorModel> getFinishingOrInteriorWorkList() {
		return finishingOrInteriorWorkList;
	}

	public void setFinishingOrInteriorWorkList(List<FinishingInteriorModel> finishingOrInteriorWorkList) {
		this.finishingOrInteriorWorkList = finishingOrInteriorWorkList;
	}

	public List<ProjectInternalInfrastructureDetails> getInternalInfraList() {
		return internalInfraList;
	}

	public void setInternalInfraList(List<ProjectInternalInfrastructureDetails> internalInfraList) {
		this.internalInfraList = internalInfraList;
	}

	public List<ProjectAmenityDetails> getAmenityList() {
		return amenityList;
	}

	public void setAmenityList(List<ProjectAmenityDetails> amenityList) {
		this.amenityList = amenityList;
	}

	


}
