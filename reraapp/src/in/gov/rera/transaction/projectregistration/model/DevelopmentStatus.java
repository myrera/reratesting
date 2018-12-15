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

@Entity(name = "DevelopmentStatus")
@Table(name = "DEVELOPMENT_STATUS")
public class DevelopmentStatus {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "STATUS_ID")
	private int statusId;
	
	@Column(name = "TOTAL_SOLD")
	private int totalSold;
	
	@Column(name = "TOTAL_COMPLETED")
	private int totalCompleted;
	
	@Column(name = "UPDATED_ON")
	@Temporal(TemporalType.TIMESTAMP)
	private Calendar updatedOn;

	public int getStatusId() {
		return statusId;
	}

	public void setStatusId(int statusId) {
		this.statusId = statusId;
	}

	public int getTotalSold() {
		return totalSold;
	}

	public void setTotalSold(int totalSold) {
		this.totalSold = totalSold;
	}

	public int getTotalCompleted() {
		return totalCompleted;
	}

	public void setTotalCompleted(int totalCompleted) {
		this.totalCompleted = totalCompleted;
	}

	public Calendar getUpdatedOn() {
		return updatedOn;
	}

	public void setUpdatedOn(Calendar updatedOn) {
		this.updatedOn = updatedOn;
	}
	
	
	
}
