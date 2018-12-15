package in.gov.rera.master.zone.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;



@Entity(name = "ZoneModel")
@Table(name = "TM_RERA_ZONE")
public class ZoneModel implements Serializable{

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 19898989L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ZONE_ID")
	private Long zoneId;
	
	@Column(name = "ZONE_NAME")
	private String zoneName;

	public Long getZoneId() {
		return zoneId;
	}

	public void setZoneId(Long zoneId) {
		this.zoneId = zoneId;
	}

	public String getZoneName() {
		return zoneName;
	}

	public void setZoneName(String zoneName) {
		this.zoneName = zoneName;
	}
	
	
	
}
