package in.gov.rera.master.stateut.model;

import in.gov.rera.master.district.model.DistrictModel;
import in.gov.rera.transaction.agentregistration.model.RegPreviousDatailsModel;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
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

@Entity(name = "StateUtModel")
@Table(name = "TM_STATE_UT")
public class StateUtModel implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 187767777L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "STATE_UT_ID")
	private Long stateUtId;

	public Long getStateUtId() {
		return stateUtId;
	}

	public void setStateUtId(Long stateUtId) {
		this.stateUtId = stateUtId;
	}

	public String getStateUtName() {
		return stateUtName;
	}

	public void setStateUtName(String stateUtName) {
		this.stateUtName = stateUtName;
	}

	@Column(name = "STATE_UT_NAME", length = 50)
	private String stateUtName;

	@Column(name = "STATE_UT_CODE", length = 10)
	private String stateUtCode;
	
	
	public String getStateUtCode() {
		return stateUtCode;
	}

	public void setStateUtCode(String stateUtCode) {
		this.stateUtCode = stateUtCode;
	}

	public Set<DistrictModel> getDistrictModelSet() {
		return districtModelSet;
	}

	public void setDistrictModelSet(Set<DistrictModel> districtModelSet) {
		this.districtModelSet = districtModelSet;
	}
	
	
	public List<DistrictModel> getDistList(){
		List<DistrictModel> dlist=null;
		
		if(getDistrictModelSet()!=null){
			
			dlist=new ArrayList<DistrictModel>(getDistrictModelSet());
			Collections.sort(dlist, new Comparator<DistrictModel>() {

				@Override
				public int compare(DistrictModel o1, DistrictModel o2) {
					
					return o1.getDistrictName().compareTo(o2.getDistrictName());
				}
			});
			
		}
		
		
		return dlist;
		
	}
	

	@OneToMany(mappedBy = "stateUtModel", cascade = CascadeType.ALL,fetch =FetchType.LAZY)
	private Set<DistrictModel> districtModelSet;
	
}
