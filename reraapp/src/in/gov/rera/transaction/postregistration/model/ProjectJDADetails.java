package in.gov.rera.transaction.postregistration.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name ="TL_PROJECT_JDA_DELS")
public class ProjectJDADetails implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="PROJECT_JDA_ID")
	private Long projectJDAId;
	
	@OneToMany(cascade = CascadeType.ALL,fetch=FetchType.LAZY)
	private List<ProjectJDALandOwnerDetails> landOwnerList;
	
	@OneToMany(cascade = CascadeType.ALL,fetch=FetchType.LAZY)
	private List<ProjectJDAPromoterDetails> promoterList;

	public Long getProjectJDAId() {
		return projectJDAId;
	}

	public void setProjectJDAId(Long projectJDAId) {
		this.projectJDAId = projectJDAId;
	}

	public List<ProjectJDALandOwnerDetails> getLandOwnerList() {
		return landOwnerList;
	}

	public void setLandOwnerList(List<ProjectJDALandOwnerDetails> landOwnerList) {
		this.landOwnerList = landOwnerList;
	}

	public List<ProjectJDAPromoterDetails> getPromoterList() {
		return promoterList;
	}

	public void setPromoterList(List<ProjectJDAPromoterDetails> promoterList) {
		this.promoterList = promoterList;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
	
	
