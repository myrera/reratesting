package in.gov.rera.transaction.postregistration.plots.model;

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
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity(name = "PlotScheduleModel")
@Table(name = "TL_PLOT_SCHEDULE_DETAILS")
public class PlotScheduleModel implements Serializable{
	
	private static final long serialVersionUID = 555667681L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "PLOT_SCHEDL_MODEL_ID")
	private Long plotScheduleModelId;
	
	
	@OneToMany(cascade = CascadeType.ALL,fetch=FetchType.LAZY)
	private List<CivilWorkModel> civilWorkList;
	
	
	
	@OneToOne(cascade = CascadeType.ALL, fetch=FetchType.LAZY)
	@JoinColumn(name = "PLOT_COMMON_AUTH_ID",nullable=true)
	private PlotsCommonAreaRelinquisedAuthorityModel plotsCommonAreaRelinquisedAuthorityModel;
	
	
	@OneToMany(cascade = CascadeType.ALL,fetch=FetchType.LAZY)
	private List<PlotCommonAreasToBeUsedByPurchaserModel> commonAreasPurchaserList;


	

	public Long getPlotScheduleModelId() {
		return plotScheduleModelId;
	}


	public void setPlotScheduleModelId(Long plotScheduleModelId) {
		this.plotScheduleModelId = plotScheduleModelId;
	}


	public List<CivilWorkModel> getCivilWorkList() {
		return civilWorkList;
	}


	public void setCivilWorkList(List<CivilWorkModel> civilWorkList) {
		this.civilWorkList = civilWorkList;
	}


	

	public List<PlotCommonAreasToBeUsedByPurchaserModel> getCommonAreasPurchaserList() {
		return commonAreasPurchaserList;
	}


	public void setCommonAreasPurchaserList(List<PlotCommonAreasToBeUsedByPurchaserModel> commonAreasPurchaserList) {
		this.commonAreasPurchaserList = commonAreasPurchaserList;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	public PlotsCommonAreaRelinquisedAuthorityModel getPlotsCommonAreaRelinquisedAuthorityModel() {
		return plotsCommonAreaRelinquisedAuthorityModel;
	}


	public void setPlotsCommonAreaRelinquisedAuthorityModel(
			PlotsCommonAreaRelinquisedAuthorityModel plotsCommonAreaRelinquisedAuthorityModel) {
		this.plotsCommonAreaRelinquisedAuthorityModel = plotsCommonAreaRelinquisedAuthorityModel;
	}


	
	


	
}
	

