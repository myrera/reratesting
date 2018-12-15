package in.gov.rera.transaction.postregistration.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="TL_APARTM_QUART_DETLS")
public class ApartmentQuarterDetailsModel {
	
@Id
@GeneratedValue(strategy = GenerationType.AUTO)
@Column(name = "APARTMENT_DETLS_ID")
private Long  apartmentDetailsId;

@Column(name = "APARTMENT_TYPE")
private String apartmentType;   // 1BHK,2BHK,OFFICE ,SHOP ETC

@Column(name = "NO_OF_APARTMENTS_BOOKED")
private Long noOfApartmentsBooked;


@Column(name = "NO_OF_APARTMENTS_REMAINED")
private Long noOfApartmentsRemained;

@Column(name = "TOT_NO_OF_APARTMENT")
private Long  totNoOfApartment;

public Long getApartmentDetailsId() {
	return apartmentDetailsId;
}

public void setApartmentDetailsId(Long apartmentDetailsId) {
	this.apartmentDetailsId = apartmentDetailsId;
}

public String getApartmentType() {
	return apartmentType;
}

public void setApartmentType(String apartmentType) {
	this.apartmentType = apartmentType;
}

public Long getNoOfApartmentsBooked() {
	return noOfApartmentsBooked;
}

public void setNoOfApartmentsBooked(Long noOfApartmentsBooked) {
	this.noOfApartmentsBooked = noOfApartmentsBooked;
}

public Long getNoOfApartmentsRemained() {
	return noOfApartmentsRemained;
}

public void setNoOfApartmentsRemained(Long noOfApartmentsRemained) {
	this.noOfApartmentsRemained = noOfApartmentsRemained;
}

public Long getTotNoOfApartment() {
	return totNoOfApartment;
}

public void setTotNoOfApartment(Long totNoOfApartment) {
	this.totNoOfApartment = totNoOfApartment;
}




}
