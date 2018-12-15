package in.gov.rera.transaction.postregistration.plots.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name ="TL_PLOT_JDA_LANDOWNER_DELS")
public class PlotJDALandOwnerDetails implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="LANDOWNER_JDA_ID")
	private Long landOwnerJDAId;
	
	@Column(name = "LAND_OWNER")
	private String landOwner;
	
	@Column(name = "LAND_OWNER_REG_NO")
	private String landOwnerRegNo;
	
	@Column(name = "SHARE_APPLICABLE")
	private String isApplicable;
	
	@Column(name = "REGISTERED_WITH_RERA")
	private String isRegistered;
	
	@Column(name = "LAND_OWNER_NAME")
	private String landownerName;
	
	@Column(name = "LAND_OWNER_MOBILE")
	private Long landownerMobileNo;
	
	@Column(name = "LAND_OWNER_ADDRESS")
	private String landownerAddress;
	
	@Column(name = "LAND_OWNER_EMAIL")
	private String landownerEmailId;
	
	@Column(name = "LAND_OWNER_PERC_SHARE")
	private Long landownerPercShare;
	
	public String getIsRegistered() {
		return isRegistered;
	}

	public void setIsRegistered(String isRegistered) {
		this.isRegistered = isRegistered;
	}

	public Long getLandOwnerJDAId() {
		return landOwnerJDAId;
	}

	public void setLandOwnerJDAId(Long landOwnerJDAId) {
		this.landOwnerJDAId = landOwnerJDAId;
	}

	public String getLandOwner() {
		return landOwner;
	}

	public void setLandOwner(String landOwner) {
		this.landOwner = landOwner;
	}

	public String getIsApplicable() {
		return isApplicable;
	}

	public void setIsApplicable(String isApplicable) {
		this.isApplicable = isApplicable;
	}

	public String getLandownerName() {
		return landownerName;
	}

	public void setLandownerName(String landownerName) {
		this.landownerName = landownerName;
	}

	public Long getLandownerMobileNo() {
		return landownerMobileNo;
	}

	public void setLandownerMobileNo(Long landownerMobileNo) {
		this.landownerMobileNo = landownerMobileNo;
	}

	public String getLandownerAddress() {
		return landownerAddress;
	}

	public void setLandownerAddress(String landownerAddress) {
		this.landownerAddress = landownerAddress;
	}

	public String getLandownerEmailId() {
		return landownerEmailId;
	}

	public void setLandownerEmailId(String landownerEmailId) {
		this.landownerEmailId = landownerEmailId;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public Long getLandownerPercShare() {
		return landownerPercShare;
	}

	public void setLandownerPercShare(Long landownerPercShare) {
		this.landownerPercShare = landownerPercShare;
	}

	public String getLandOwnerRegNo() {
		return landOwnerRegNo;
	}

	public void setLandOwnerRegNo(String landOwnerRegNo) {
		this.landOwnerRegNo = landOwnerRegNo;
	}
	
	
	
}
	
	
