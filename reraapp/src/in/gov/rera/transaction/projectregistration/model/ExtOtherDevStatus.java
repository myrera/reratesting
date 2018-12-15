package in.gov.rera.transaction.projectregistration.model;

import java.util.Calendar;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity(name = "ExtOtherDevStatus")
@Table(name = "TL_EXT_OTHER_DEV_STATUS")
public class ExtOtherDevStatus {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "STATUS_ID")
	private int statusId;
	
	@Column(name = "STATUS")
	private int status;
	
	@Column(name = "UPDATED_ON")
	@Temporal(TemporalType.TIMESTAMP)
	private Calendar updatedOn;

	public int getStatusId() {
		return statusId;
	}

	public void setStatusId(int statusId) {
		this.statusId = statusId;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Calendar getUpdatedOn() {
		return updatedOn;
	}

	public void setUpdatedOn(Calendar updatedOn) {
		this.updatedOn = updatedOn;
	}
	
	
}
