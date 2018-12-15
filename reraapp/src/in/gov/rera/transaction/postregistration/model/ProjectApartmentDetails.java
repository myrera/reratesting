package in.gov.rera.transaction.postregistration.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="TL_PROJECT_APARTMENT_DETLS")
public class ProjectApartmentDetails {
	
@Id
@GeneratedValue(strategy = GenerationType.AUTO)
@Column(name = "APARTMENT_DETLS_ID")
private Long  apartmentDetailsId;

@Column(name = "APARTMENT_TYPE")
private String apartmentType;   // 1BHK,2BHK,OFFICE ,SHOP ETC

@Column(name = "CARPET_AREA")
private Integer carpetArea;

@Column(name = "BUILTUP_AREA")
private Integer builtUpArea;


@Column(name = "PROPORTIONATE_COMMON_AREA")
private Integer proportionateCommonArea;

@Column(name = "TOT_NO_EACH_APARTMENT_TYPE")
private Long  totNoOfEachApartmentType;


public Long getTotNoOfEachApartmentType() {
	return totNoOfEachApartmentType;
}


public void setTotNoOfEachApartmentType(Long totNoOfEachApartmentType) {
	this.totNoOfEachApartmentType = totNoOfEachApartmentType;
}


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


public Integer getCarpetArea() {
	return carpetArea;
}


public void setCarpetArea(Integer carpetArea) {
	this.carpetArea = carpetArea;
}


public Integer getBuiltUpArea() {
	return builtUpArea;
}


public void setBuiltUpArea(Integer builtUpArea) {
	this.builtUpArea = builtUpArea;
}


public Integer getProportionateCommonArea() {
	return proportionateCommonArea;
}


public void setProportionateCommonArea(Integer proportionateCommonArea) {
	this.proportionateCommonArea = proportionateCommonArea;
}


}