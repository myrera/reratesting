package in.gov.rera.transaction.postregistration.plots.model;

import java.util.List;
import java.util.Set;

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
import javax.persistence.Table;

import in.gov.rera.dms.beans.Document;

@Entity(name = "QuaterlyPlotsDetailsModel")
@Table(name = "TL_QUATERLY_PLOTS_DETAILS")
public class QuaterlyPlotsDetailsModel {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "QUATERLY_PLOTS_DETAILS_ID")
	private Long quaterlyPlotsDetailsId;

	@Column(name = "TOTAL_NO_OF_PLOTS_BOOKED")
	private Long totalNumberOfPlotsBooked;
	
	@Column(name = "TOTAL_NO_OF_EWS_PLOTS_BOOKED")
	private Long totalnoOfEWSPlotsBooked;
	
	@Column(name = "TOTAL_NO_OF_LIG_PLOTS_BOOKED")
	private Long totalnoOfLIGPlotsBooked;
	
	@Column(name = "TOTAL_NO_OF_MIG_PLOTS_BOOKED")
	private Long totalnoOfMIGPlotsBooked;
	
	@Column(name = "TOTAL_NO_OF_HIG_PLOTS_BOOKED")
	private Long totalnoOfHIGPlotsBooked;
	
	@Column(name = "TOTAL_NO_OF_OTHER_PLOTS_BOOKED")
	private Long totalnoOfOtherPlotsBooked;

	@Column(name = "TOTAL_NO_OF_PLOTS_AVAILABLE")
	private Long totalNumberOfPlotsAvailable;

	@Column(name = "TOTAL_NO_OF_EWS_PLOTS_AVAILABLE")
	private Long totalnoOfEWSPlotsAvailable;
	
	@Column(name = "TOTAL_NO_OF_LIG_PLOTS_AVAILABLE")
	private Long totalnoOfLIGPlotsAvailable;
	
	@Column(name = "TOTAL_NO_OF_MIG_PLOTS_AVAILABLE")
	private Long totalnoOfMIGPlotsAvailable;
	
	@Column(name = "TOTAL_NO_OF_HIG_PLOTS_AVAILABLE")
	private Long totalnoOfHIGPlotsAvailable;
	
	@Column(name = "TOTAL_NO_OF_OTHER_PLOTS_AVAILABLE")
	private Long totalnoOfOtherPlotsAvailable;

	public Long getQuaterlyPlotsDetailsId() {
		return quaterlyPlotsDetailsId;
	}

	public void setQuaterlyPlotsDetailsId(Long quaterlyPlotsDetailsId) {
		this.quaterlyPlotsDetailsId = quaterlyPlotsDetailsId;
	}



	public Long getTotalNumberOfPlotsBooked() {
		return totalNumberOfPlotsBooked;
	}

	public void setTotalNumberOfPlotsBooked(Long totalNumberOfPlotsBooked) {
		this.totalNumberOfPlotsBooked = totalNumberOfPlotsBooked;
	}

	public Long getTotalnoOfEWSPlotsBooked() {
		return totalnoOfEWSPlotsBooked;
	}

	public void setTotalnoOfEWSPlotsBooked(Long totalnoOfEWSPlotsBooked) {
		this.totalnoOfEWSPlotsBooked = totalnoOfEWSPlotsBooked;
	}

	public Long getTotalnoOfLIGPlotsBooked() {
		return totalnoOfLIGPlotsBooked;
	}

	public void setTotalnoOfLIGPlotsBooked(Long totalnoOfLIGPlotsBooked) {
		this.totalnoOfLIGPlotsBooked = totalnoOfLIGPlotsBooked;
	}

	public Long getTotalnoOfMIGPlotsBooked() {
		return totalnoOfMIGPlotsBooked;
	}

	public void setTotalnoOfMIGPlotsBooked(Long totalnoOfMIGPlotsBooked) {
		this.totalnoOfMIGPlotsBooked = totalnoOfMIGPlotsBooked;
	}

	public Long getTotalnoOfHIGPlotsBooked() {
		return totalnoOfHIGPlotsBooked;
	}

	public void setTotalnoOfHIGPlotsBooked(Long totalnoOfHIGPlotsBooked) {
		this.totalnoOfHIGPlotsBooked = totalnoOfHIGPlotsBooked;
	}

	public Long getTotalnoOfOtherPlotsBooked() {
		return totalnoOfOtherPlotsBooked;
	}

	public void setTotalnoOfOtherPlotsBooked(Long totalnoOfOtherPlotsBooked) {
		this.totalnoOfOtherPlotsBooked = totalnoOfOtherPlotsBooked;
	}

	public Long getTotalNumberOfPlotsAvailable() {
		return totalNumberOfPlotsAvailable;
	}

	public void setTotalNumberOfPlotsAvailable(Long totalNumberOfPlotsAvailable) {
		this.totalNumberOfPlotsAvailable = totalNumberOfPlotsAvailable;
	}

	public Long getTotalnoOfEWSPlotsAvailable() {
		return totalnoOfEWSPlotsAvailable;
	}

	public void setTotalnoOfEWSPlotsAvailable(Long totalnoOfEWSPlotsAvailable) {
		this.totalnoOfEWSPlotsAvailable = totalnoOfEWSPlotsAvailable;
	}

	public Long getTotalnoOfLIGPlotsAvailable() {
		return totalnoOfLIGPlotsAvailable;
	}

	public void setTotalnoOfLIGPlotsAvailable(Long totalnoOfLIGPlotsAvailable) {
		this.totalnoOfLIGPlotsAvailable = totalnoOfLIGPlotsAvailable;
	}

	public Long getTotalnoOfMIGPlotsAvailable() {
		return totalnoOfMIGPlotsAvailable;
	}

	public void setTotalnoOfMIGPlotsAvailable(Long totalnoOfMIGPlotsAvailable) {
		this.totalnoOfMIGPlotsAvailable = totalnoOfMIGPlotsAvailable;
	}

	public Long getTotalnoOfHIGPlotsAvailable() {
		return totalnoOfHIGPlotsAvailable;
	}

	public void setTotalnoOfHIGPlotsAvailable(Long totalnoOfHIGPlotsAvailable) {
		this.totalnoOfHIGPlotsAvailable = totalnoOfHIGPlotsAvailable;
	}

	public Long getTotalnoOfOtherPlotsAvailable() {
		return totalnoOfOtherPlotsAvailable;
	}

	public void setTotalnoOfOtherPlotsAvailable(Long totalnoOfOtherPlotsAvailable) {
		this.totalnoOfOtherPlotsAvailable = totalnoOfOtherPlotsAvailable;
	}


}
