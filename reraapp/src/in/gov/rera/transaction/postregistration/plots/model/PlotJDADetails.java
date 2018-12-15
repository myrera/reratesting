package in.gov.rera.transaction.postregistration.plots.model;

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
@Table(name ="TL_PLOT_JDA_DELS")
public class PlotJDADetails implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="PLOT_JDA_ID")
	private Long projectJDAId;
	
	@OneToMany(cascade = CascadeType.ALL,fetch=FetchType.LAZY)
	private List<PlotJDALandOwnerDetails> landOwnerList;
	
	@OneToMany(cascade = CascadeType.ALL,fetch=FetchType.LAZY)
	private List<PlotJDAPromoterDetails> promoterList;

	public Long getProjectJDAId() {
		return projectJDAId;
	}

	public void setProjectJDAId(Long projectJDAId) {
		this.projectJDAId = projectJDAId;
	}

	public List<PlotJDALandOwnerDetails> getLandOwnerList() {
		return landOwnerList;
	}

	public void setLandOwnerList(List<PlotJDALandOwnerDetails> landOwnerList) {
		this.landOwnerList = landOwnerList;
	}

	public List<PlotJDAPromoterDetails> getPromoterList() {
		return promoterList;
	}

	public void setPromoterList(List<PlotJDAPromoterDetails> promoterList) {
		this.promoterList = promoterList;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	

}
	
	
