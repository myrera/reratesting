package in.gov.rera.transaction.projectregistration.model;

import java.util.List;

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
import javax.persistence.OrderColumn;
import javax.persistence.Table;


@Entity(name = "ExtOtherDevModel")
@Table(name = "TL_EXT_OTHER_DEV_DETAILS")
public class ExtOtherDevModel {

	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="EXT_OTHER_DEV_ID")
	private Long extOtherDevId;
	
	@ManyToOne(cascade = CascadeType.ALL, fetch=FetchType.LAZY)
	@JoinColumn(name="EXT_DEV_ID")
	private ExternalDevelopmentWorkModel externalDevelopmentWorkModel;
	

	@Column(name="DEVELOP_BY")
	private String developeBy;
	
	@Column(name="WORK_DESC")
	private String workDesc;
	
	@OneToOne(cascade = CascadeType.ALL, fetch=FetchType.LAZY)
	@JoinColumn(name="CURRENT_STATUSID")
	private ExtOtherDevStatus currentStatus;
	
	 @OneToMany(cascade = CascadeType.ALL, fetch=FetchType.LAZY)
	 @OrderColumn(name="orders_index")
	private List<ExtOtherDevStatus> statusList;

	
	
	public ExtOtherDevStatus getCurrentStatus() {
		return currentStatus;
	}

	public void setCurrentStatus(ExtOtherDevStatus currentStatus) {
		this.currentStatus = currentStatus;
	}

	public List<ExtOtherDevStatus> getStatusList() {
		return statusList;
	}

	public void setStatusList(List<ExtOtherDevStatus> statusList) {
		this.statusList = statusList;
	}

	public Long getExtOtherDevId() {
		return extOtherDevId;
	}

	public void setExtOtherDevId(Long extOtherDevId) {
		this.extOtherDevId = extOtherDevId;
	}

	

	public String getDevelopeBy() {
		return developeBy;
	}

	public void setDevelopeBy(String developeBy) {
		this.developeBy = developeBy;
	}

	public String getWorkDesc() {
		return workDesc;
	}

	public void setWorkDesc(String workDesc) {
		this.workDesc = workDesc;
	}

	public ExternalDevelopmentWorkModel getExternalDevelopmentWorkModel() {
		return externalDevelopmentWorkModel;
	}

	public void setExternalDevelopmentWorkModel(
			ExternalDevelopmentWorkModel externalDevelopmentWorkModel) {
		this.externalDevelopmentWorkModel = externalDevelopmentWorkModel;
	}

	
	
	
	
	
}
