package in.gov.rera.transaction.postregistration.model;

import java.util.Calendar;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity(name = "FloaringWorkModel")
@Table(name = "TL_FLOOR_WORK_MODEL")
public class FloaringWorkModel {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "FLOOR_WORK_ID")
	private Long floorWorkId;
	
	@Column(name = "TYPE_OF_FLOOR_WORK")
	private String typeOfFloorWork;
	
	@Column(name = "ESTIMATED_FRM_DATE")
	@Temporal(TemporalType.DATE) //drops the time value and only preserves the date.
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	private Calendar estimatedFrmDate;
	
	@Column(name = "ESTIMATED_TO_DATE")
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	private Calendar estimatedToDate;
	
	// Actual Date
	@Column(name = "ACTUAL_FRM_DATE")
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	private Calendar actualFrmDate;
	
	@Column(name = "ACTUAL_TO_DATE")
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	private Calendar actualToDate;

	public Long getFloorWorkId() {
		return floorWorkId;
	}

	public String getTypeOfFloorWork() {
		return typeOfFloorWork;
	}

	public Calendar getEstimatedFrmDate() {
		return estimatedFrmDate;
	}

	public Calendar getEstimatedToDate() {
		return estimatedToDate;
	}

	public Calendar getActualFrmDate() {
		return actualFrmDate;
	}

	public Calendar getActualToDate() {
		return actualToDate;
	}

	public void setFloorWorkId(Long floorWorkId) {
		this.floorWorkId = floorWorkId;
	}

	public void setTypeOfFloorWork(String typeOfFloorWork) {
		this.typeOfFloorWork = typeOfFloorWork;
	}

	public void setEstimatedFrmDate(Calendar estimatedFrmDate) {
		this.estimatedFrmDate = estimatedFrmDate;
	}

	public void setEstimatedToDate(Calendar estimatedToDate) {
		this.estimatedToDate = estimatedToDate;
	}

	public void setActualFrmDate(Calendar actualFrmDate) {
		this.actualFrmDate = actualFrmDate;
	}

	public void setActualToDate(Calendar actualToDate) {
		this.actualToDate = actualToDate;
	}
	
	
	
	
	
}
