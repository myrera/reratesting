package in.gov.rera.transaction.postregistration.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="TL_PROJECT_PARKING_DETLS")
public class ProjectParkingDetails {
	
@Id
@GeneratedValue(strategy = GenerationType.AUTO)
@Column(name = "PARKING_DETLS_ID")
private Long  parkingDetailsId;

@Column(name = "TOT_NO_OF_GARAGES")
private Long totNoOfGarages;

@Column(name = "NO_OF_GARAGES_BOOKED")
private Long noOfGaragesBooked;


@Column(name = "NO_OF_GARAGES_REMAINED")
private Long noOfGaragesRemained;

// 2
@Column(name = "TOT_NO_OF_OPEN_PARKING")
private Long totNoOfOpenParking;

@Column(name = "NO_OF_OPEN_PARKING_BOOKED")
private Long noOfOpenParkingBooked;


@Column(name = "NO_OF_OPEN_PARKING_REMAINED")
private Long noOfOpenParkingRemained;

//3

@Column(name = "TOT_NO_OF_CLOSED_PARKING")
private Long totNoOfClosedParking;

@Column(name = "NO_OF_CLOSED_PARKING_BOOKED")
private Long noOfClosedParkingBooked;


@Column(name = "NO_OF_CLOSED_PARKING_REMAINED")
private Long noOfClosedParkingRemained;


public Long getParkingDetailsId() {
	return parkingDetailsId;
}


public void setParkingDetailsId(Long parkingDetailsId) {
	this.parkingDetailsId = parkingDetailsId;
}


public Long getTotNoOfGarages() {
	return totNoOfGarages;
}


public void setTotNoOfGarages(Long totNoOfGarages) {
	this.totNoOfGarages = totNoOfGarages;
}


public Long getNoOfGaragesBooked() {
	return noOfGaragesBooked;
}


public void setNoOfGaragesBooked(Long noOfGaragesBooked) {
	this.noOfGaragesBooked = noOfGaragesBooked;
}


public Long getNoOfGaragesRemained() {
	return noOfGaragesRemained;
}


public void setNoOfGaragesRemained(Long noOfGaragesRemained) {
	this.noOfGaragesRemained = noOfGaragesRemained;
}


public Long getTotNoOfOpenParking() {
	return totNoOfOpenParking;
}


public void setTotNoOfOpenParking(Long totNoOfOpenParking) {
	this.totNoOfOpenParking = totNoOfOpenParking;
}


public Long getNoOfOpenParkingBooked() {
	return noOfOpenParkingBooked;
}


public void setNoOfOpenParkingBooked(Long noOfOpenParkingBooked) {
	this.noOfOpenParkingBooked = noOfOpenParkingBooked;
}


public Long getNoOfOpenParkingRemained() {
	return noOfOpenParkingRemained;
}


public void setNoOfOpenParkingRemained(Long noOfOpenParkingRemained) {
	this.noOfOpenParkingRemained = noOfOpenParkingRemained;
}


public Long getTotNoOfClosedParking() {
	return totNoOfClosedParking;
}


public void setTotNoOfClosedParking(Long totNoOfClosedParking) {
	this.totNoOfClosedParking = totNoOfClosedParking;
}


public Long getNoOfClosedParkingBooked() {
	return noOfClosedParkingBooked;
}


public void setNoOfClosedParkingBooked(Long noOfClosedParkingBooked) {
	this.noOfClosedParkingBooked = noOfClosedParkingBooked;
}


public Long getNoOfClosedParkingRemained() {
	return noOfClosedParkingRemained;
}


public void setNoOfClosedParkingRemained(Long noOfClosedParkingRemained) {
	this.noOfClosedParkingRemained = noOfClosedParkingRemained;
}








}