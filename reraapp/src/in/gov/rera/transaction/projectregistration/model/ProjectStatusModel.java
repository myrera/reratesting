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

@Entity(name = "ProjectStatusModel")
@Table(name = "TL_PROJECT_STATUS")
public class ProjectStatusModel {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "PROJECT_STATUS_ID")
  private	Long status_id;
  
	@Column(name = "PROJECT_STATUS")
  private String projectStatus;
	@Column(name = "NO_OF_MONTHS_DELAYED")
  private int noOfMonthDelayed;
	
 @Column(name = "GARAGE_SOLDOUT")
  private int garageSoldout;
	
	@Column(name = "PARKING_SOLDOUT")
	 private int parkingSoldout;
  
	@Column(name = "UPDATED_ON")
	@Temporal(TemporalType.TIMESTAMP)
  private Calendar updatedOn;
	
	 @Column(name = "REASON_FOR_DELAYED")
	 private String reasonForDelayed;
	 
	 
	 

  
public String getReasonForDelayed() {
		return reasonForDelayed;
	}

	public void setReasonForDelayed(String reasonForDelayed) {
		this.reasonForDelayed = reasonForDelayed;
	}

public Long getStatus_id() {
	return status_id;
}

public void setStatus_id(Long status_id) {
	this.status_id = status_id;
}

public String getProjectStatus() {
	return projectStatus;
}

public void setProjectStatus(String projectStatus) {
	this.projectStatus = projectStatus;
}

public int getNoOfMonthDelayed() {
	return noOfMonthDelayed;
}

public void setNoOfMonthDelayed(int noOfMonthDelayed) {
	this.noOfMonthDelayed = noOfMonthDelayed;
}

public int getGarageSoldout() {
	return garageSoldout;
}

public void setGarageSoldout(int garageSoldout) {
	this.garageSoldout = garageSoldout;
}

public int getParkingSoldout() {
	return parkingSoldout;
}

public void setParkingSoldout(int parkingSoldout) {
	this.parkingSoldout = parkingSoldout;
}

public Calendar getUpdatedOn() {
	return updatedOn;
}

public void setUpdatedOn(Calendar updatedOn) {
	this.updatedOn = updatedOn;
}
  
}
