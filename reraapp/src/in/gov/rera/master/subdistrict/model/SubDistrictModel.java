package in.gov.rera.master.subdistrict.model;

import java.io.Serializable;

import in.gov.rera.master.district.model.DistrictModel;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity(name = "SubDistrictModel")
@Table(name = "TM_SUB_DISTRICT")
public class SubDistrictModel implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 14445545L;


	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "SUB_DISTRICT_ID")
	private Long subDistrictId;

	
	@ManyToOne
	@JoinColumn(name="DISTRICT_ID")
	private DistrictModel districtModel;
	
	
	@Column(name = "SUB_DISTRICT_NAME", length = 50)
	private String subDistrictName;
	
	public Long getSubDistrictId() {
		return subDistrictId;
	}

	public void setSubDistrictId(Long subDistrictId) {
		this.subDistrictId = subDistrictId;
	}

	public String getSubDistrictName() {
		return subDistrictName;
	}

	public void setSubDistrictName(String subDistrictName) {
		this.subDistrictName = subDistrictName;
	}

	public DistrictModel getDistrictModel() {
		return districtModel;
	}

	public void setDistrictModel(DistrictModel districtModel) {
		this.districtModel = districtModel;
	}

	


}
