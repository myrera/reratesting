package in.gov.rera.transaction.postregistration.model;

import java.io.Serializable;
import java.util.Calendar;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity(name = "QuarterFinishingInteriorModel")
@Table(name = "TL_QUARTER_FINI_INTERIOR_MODEL")
public class QuarterFinishingInteriorModel implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "FINIS_STRUCTURE_ID")
	private Long  finishingInteriorId;
	
	@Column(name = "TYPE_OF_WORK")
	private String typeOfWork;
	
		// Estimated Date 
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

		public static long getSerialversionuid() {
			return serialVersionUID;
		}

	
		public String getTypeOfWork() {
			return typeOfWork;
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

	
	


		public Long getFinishingInteriorId() {
			return finishingInteriorId;
		}


		public void setFinishingInteriorId(Long finishingInteriorId) {
			this.finishingInteriorId = finishingInteriorId;
		}


		public void setTypeOfWork(String typeOfWork) {
			this.typeOfWork = typeOfWork;
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
