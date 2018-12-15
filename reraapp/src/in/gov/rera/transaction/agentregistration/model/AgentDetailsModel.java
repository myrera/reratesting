package in.gov.rera.transaction.agentregistration.model;

import java.io.Serializable;
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
import javax.persistence.OneToOne;
import javax.persistence.Table;

import in.gov.rera.K2PaymentGateWay.model.K2PaymentDetailsModel;
import in.gov.rera.dms.beans.Document;
import in.gov.rera.master.district.model.DistrictModel;

@Entity(name = "AgentDetailsModel")
@Table(name = "TL_AGENT_REG_DETAILS_MODEL")
public class AgentDetailsModel implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "AGENT_REG_DETAILS_ID")
	private Long agentRegDetailID;

	@OneToMany(mappedBy = "agentDetailsModel", cascade = CascadeType.ALL,fetch =FetchType.LAZY)
	private Set<RegPreviousDatailsModel> regPreviousDatailsModelSet;
	
	@OneToOne(cascade = CascadeType.ALL,fetch =FetchType.LAZY)
	@JoinColumn(name = "REG_UPLOAD_DEL_ID")
	private RegUploadDetailsModel regUploadDetailsModel;
	
	@ManyToOne
	@JoinColumn(name = "DISTRICT_ID")
	private DistrictModel districtModel;
	
	@OneToOne(cascade = CascadeType.ALL,fetch =FetchType.EAGER)
	@JoinColumn(name = "PHOTOGRAPH")
	private Document photograph;

	@OneToOne(cascade = CascadeType.ALL,fetch =FetchType.LAZY)
	@JoinColumn(name = "FIRM_CERTIFICATE")
	private Document firmCertificatDoc;
	
	@OneToOne(cascade = CascadeType.ALL,fetch =FetchType.LAZY)
	@JoinColumn(name = "RES_PAY_DELS_ID")
	private RegPaymentDetailsModel regPaymentDetailsModel;
	
	@OneToOne(cascade = CascadeType.ALL,fetch =FetchType.LAZY)
	@JoinColumn(name = "K2_PAY_DELS_ID")
	private K2PaymentDetailsModel k2PaymentDetailsModel;
	
	@Column(name = "AGENT_NAME", length = 100)
	private String agentName;

	@Column(name = "AGENT_FATHER_NAME", length = 100)
	private String agentFatherName;
	
	@Column(name = "OCCUPATION", length = 500)
	private String occupation;

	@Column(name = "AGENT_IND_ADDRESS_LINE1", length = 400)
	private String agentIndividualAddressLine1;
	
	@Column(name = "AGENT_IND_ADDRESS_LINE2", length = 400)
	private String agentIndividualAddressLine2;
	
	@Column(name = "AGENT_IND_PINCODE", length = 10)
	private String agentIndividualPincode;
	
	
	@Column(name="AGENT_LANDLINE_1")
	private String landLineNumber1;
	

	@Column(name = "FIRM_NAME", length = 200)
	private String firmName;

	@Column(name = "FIRM_ADDRESS_LINE_1", length = 400)
	private String firmAddressLine1;
	
	@Column(name = "FIRM_ADDRESS_LINE_2", length = 400)
	private String firmAddressLine2;
	
	@Column(name = "FIRM_PINCODE", length = 10)
	private String firmPincode;

	@Column(name = "FIRM_REGISTRATION_TYPE", length = 50)
	private String firmRegistrationType;

	@Column(name = "FIRM_ACTIVITY", length = 500)
	private String firmActivities;

	@Column(name = "FIRM_EMAIL", length = 80)
	private String firmEmail;

	@Column(name = "FAX_NUMBER", length = 50)
	private String firmFaxNumber;

	@Column(name = "FIRM_MOBILE_NO", length = 50)
	private String firmMobileNo;
	
	@Column(name = "FIRM_LANDLINE_NO_1", length = 50)
	private String firmLandLineNo1;
	
	@Column(name = "FIRM_LANDLINE_NO_2", length = 50)
	private String firmLandLineNo2;
	
	@Column(name = "FIRM_REGISTRATION_NO", length = 100)
	private String firmRegistrationNo;


	@Column(name = "PARTNER_DIRECTOR_NAME", length = 100)
	private String partnerOrDirectorName;

	@Column(name = "PARTNER_DIRECTOR_ADDRESS", length = 400)
	private String partnerOrDirectorAddress;

	@Column(name = "PARTNER_DIRECTOR_PHONE_NO", length = 50)
	private String partnerOrDirectorPhoneNO;

	
	
	@Column(name = "PART_DIR_ADDRESS_1", length = 400)
	private String partnerOrDirectorAddressLine1;
	

	@Column(name = "PART_DIR_PINCODE", length = 10)
	private String partnerOrDirectorPincode;
	
	@ManyToOne
	@JoinColumn(name = "PART_DIR_DISTRICT_ID")
	private DistrictModel partnerOrDirectorDistrictModel;


	@Column(name = "AGENT_INDIVIDUAL_BUSS_ADDRESS_1", length = 400)
	private String agentIndividualBussAddress1;
	
	@Column(name = "AGENT_INDIVIDUAL_BUSS_PINCODE", length = 400)
	private String agentIndividualBussPincode;
	
	public Document getPhotograph() {
		return photograph;
	}

	
	
	
	

	public Document getFirmCertificatDoc() {
		return firmCertificatDoc;
	}






	public void setFirmCertificatDoc(Document firmCertificatDoc) {
		this.firmCertificatDoc = firmCertificatDoc;
	}






	public void setPhotograph(Document photograph) {
		this.photograph = photograph;
	}


	@Column(name = "AGENT_INDIVIDUAL_BUSS_ADDRESS_2", length = 400)
	private String agentIndividualBussAddress2;

	
	@ManyToOne
	@JoinColumn(name = "AGENT_INDIVIDUAL_BUSS_DISTRICT_ID")
	private DistrictModel agentIndividualBussDistrictModel;

	
	
	@Column(name = "AGENT_PHONE_NO", length = 50)
	private String agentPhoneNo;

	@Column(name = "AGENT_EMAIL_ID", length = 80)
	private String agentEmailId;

	@Column(name = "AGENT_PAN_NO", length = 20)
	private String agentPanNo;

	@Column(name = "AGENT_ADHAAR_NO", length = 20)
	private String agentAdhaarNo;
	
	@Column(name = "PART_DIR_ADDRESS_2", length = 400)
	private String partnerOrDirectorAddressLine2;
	
	
	@Column(name = "PART_DIR_EMAIL_ADDRESS", length = 80)
	private String partnerOrDirectorEmailAddress;


	public Long getAgentRegDetailID() {
		return agentRegDetailID;
	}


	public void setAgentRegDetailID(Long agentRegDetailID) {
		this.agentRegDetailID = agentRegDetailID;
	}


	public Set<RegPreviousDatailsModel> getRegPreviousDatailsModelSet() {
		return regPreviousDatailsModelSet;
	}


	public void setRegPreviousDatailsModelSet(Set<RegPreviousDatailsModel> regPreviousDatailsModelSet) {
		this.regPreviousDatailsModelSet = regPreviousDatailsModelSet;
	}


	public RegUploadDetailsModel getRegUploadDetailsModel() {
		return regUploadDetailsModel;
	}


	public void setRegUploadDetailsModel(RegUploadDetailsModel regUploadDetailsModel) {
		this.regUploadDetailsModel = regUploadDetailsModel;
	}


	public DistrictModel getDistrictModel() {
		return districtModel;
	}


	public void setDistrictModel(DistrictModel districtModel) {
		this.districtModel = districtModel;
	}


	public RegPaymentDetailsModel getRegPaymentDetailsModel() {
		return regPaymentDetailsModel;
	}


	public void setRegPaymentDetailsModel(RegPaymentDetailsModel regPaymentDetailsModel) {
		this.regPaymentDetailsModel = regPaymentDetailsModel;
	}


	public String getAgentName() {
		return agentName;
	}


	public void setAgentName(String agentName) {
		this.agentName = agentName;
	}


	public String getAgentFatherName() {
		return agentFatherName;
	}


	public void setAgentFatherName(String agentFatherName) {
		this.agentFatherName = agentFatherName;
	}


	public String getOccupation() {
		return occupation;
	}


	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}


	public String getAgentIndividualAddressLine1() {
		return agentIndividualAddressLine1;
	}


	public void setAgentIndividualAddressLine1(String agentIndividualAddressLine1) {
		this.agentIndividualAddressLine1 = agentIndividualAddressLine1;
	}


	public String getAgentIndividualAddressLine2() {
		return agentIndividualAddressLine2;
	}


	public void setAgentIndividualAddressLine2(String agentIndividualAddressLine2) {
		this.agentIndividualAddressLine2 = agentIndividualAddressLine2;
	}


	public String getLandLineNumber1() {
		return landLineNumber1;
	}


	public void setLandLineNumber1(String landLineNumber1) {
		this.landLineNumber1 = landLineNumber1;
	}


	

	public String getFirmName() {
		return firmName;
	}


	public void setFirmName(String firmName) {
		this.firmName = firmName;
	}


	public String getFirmAddressLine1() {
		return firmAddressLine1;
	}


	public void setFirmAddressLine1(String firmAddressLine1) {
		this.firmAddressLine1 = firmAddressLine1;
	}


	public String getFirmAddressLine2() {
		return firmAddressLine2;
	}


	public void setFirmAddressLine2(String firmAddressLine2) {
		this.firmAddressLine2 = firmAddressLine2;
	}


	public DistrictModel getPartnerOrDirectorDistrictModel() {
		return partnerOrDirectorDistrictModel;
	}






	public void setPartnerOrDirectorDistrictModel(
			DistrictModel partnerOrDirectorDistrictModel) {
		this.partnerOrDirectorDistrictModel = partnerOrDirectorDistrictModel;
	}






	public DistrictModel getAgentIndividualBussDistrictModel() {
		return agentIndividualBussDistrictModel;
	}






	public void setAgentIndividualBussDistrictModel(
			DistrictModel agentIndividualBussDistrictModel) {
		this.agentIndividualBussDistrictModel = agentIndividualBussDistrictModel;
	}






	public String getFirmRegistrationType() {
		return firmRegistrationType;
	}


	public void setFirmRegistrationType(String firmRegistrationType) {
		this.firmRegistrationType = firmRegistrationType;
	}


	public String getFirmActivities() {
		return firmActivities;
	}


	public void setFirmActivities(String firmActivities) {
		this.firmActivities = firmActivities;
	}


	public String getFirmEmail() {
		return firmEmail;
	}


	public void setFirmEmail(String firmEmail) {
		this.firmEmail = firmEmail;
	}


	public String getFirmFaxNumber() {
		return firmFaxNumber;
	}


	public void setFirmFaxNumber(String firmFaxNumber) {
		this.firmFaxNumber = firmFaxNumber;
	}


	public String getFirmMobileNo() {
		return firmMobileNo;
	}


	public void setFirmMobileNo(String firmMobileNo) {
		this.firmMobileNo = firmMobileNo;
	}


	public String getFirmLandLineNo1() {
		return firmLandLineNo1;
	}


	public void setFirmLandLineNo1(String firmLandLineNo1) {
		this.firmLandLineNo1 = firmLandLineNo1;
	}


	public String getFirmLandLineNo2() {
		return firmLandLineNo2;
	}


	public void setFirmLandLineNo2(String firmLandLineNo2) {
		this.firmLandLineNo2 = firmLandLineNo2;
	}


	public String getFirmRegistrationNo() {
		return firmRegistrationNo;
	}


	public void setFirmRegistrationNo(String firmRegistrationNo) {
		this.firmRegistrationNo = firmRegistrationNo;
	}





	public String getPartnerOrDirectorName() {
		return partnerOrDirectorName;
	}


	public void setPartnerOrDirectorName(String partnerOrDirectorName) {
		this.partnerOrDirectorName = partnerOrDirectorName;
	}


	public String getPartnerOrDirectorAddress() {
		return partnerOrDirectorAddress;
	}


	public void setPartnerOrDirectorAddress(String partnerOrDirectorAddress) {
		this.partnerOrDirectorAddress = partnerOrDirectorAddress;
	}


	public String getPartnerOrDirectorPhoneNO() {
		return partnerOrDirectorPhoneNO;
	}


	public void setPartnerOrDirectorPhoneNO(String partnerOrDirectorPhoneNO) {
		this.partnerOrDirectorPhoneNO = partnerOrDirectorPhoneNO;
	}




	public String getPartnerOrDirectorAddressLine1() {
		return partnerOrDirectorAddressLine1;
	}


	public void setPartnerOrDirectorAddressLine1(String partnerOrDirectorAddressLine1) {
		this.partnerOrDirectorAddressLine1 = partnerOrDirectorAddressLine1;
	}


	public String getAgentIndividualBussAddress1() {
		return agentIndividualBussAddress1;
	}


	public void setAgentIndividualBussAddress1(String agentIndividualBussAddress1) {
		this.agentIndividualBussAddress1 = agentIndividualBussAddress1;
	}


	public String getAgentIndividualBussAddress2() {
		return agentIndividualBussAddress2;
	}


	public void setAgentIndividualBussAddress2(String agentIndividualBussAddress2) {
		this.agentIndividualBussAddress2 = agentIndividualBussAddress2;
	}


	public String getAgentPhoneNo() {
		return agentPhoneNo;
	}


	public void setAgentPhoneNo(String agentPhoneNo) {
		this.agentPhoneNo = agentPhoneNo;
	}


	public String getAgentEmailId() {
		return agentEmailId;
	}


	public void setAgentEmailId(String agentEmailId) {
		this.agentEmailId = agentEmailId;
	}


	public String getAgentPanNo() {
		return agentPanNo;
	}


	public void setAgentPanNo(String agentPanNo) {
		this.agentPanNo = agentPanNo;
	}


	public String getAgentAdhaarNo() {
		return agentAdhaarNo;
	}


	public void setAgentAdhaarNo(String agentAdhaarNo) {
		this.agentAdhaarNo = agentAdhaarNo;
	}


	public String getPartnerOrDirectorAddressLine2() {
		return partnerOrDirectorAddressLine2;
	}


	public void setPartnerOrDirectorAddressLine2(String partnerOrDirectorAddressLine2) {
		this.partnerOrDirectorAddressLine2 = partnerOrDirectorAddressLine2;
	}


	public String getPartnerOrDirectorEmailAddress() {
		return partnerOrDirectorEmailAddress;
	}


	public void setPartnerOrDirectorEmailAddress(String partnerOrDirectorEmailAddress) {
		this.partnerOrDirectorEmailAddress = partnerOrDirectorEmailAddress;
	}






	public String getAgentIndividualPincode() {
		return agentIndividualPincode;
	}






	public void setAgentIndividualPincode(String agentIndividualPincode) {
		this.agentIndividualPincode = agentIndividualPincode;
	}






	public String getFirmPincode() {
		return firmPincode;
	}






	public void setFirmPincode(String firmPincode) {
		this.firmPincode = firmPincode;
	}






	public String getPartnerOrDirectorPincode() {
		return partnerOrDirectorPincode;
	}






	public void setPartnerOrDirectorPincode(String partnerOrDirectorPincode) {
		this.partnerOrDirectorPincode = partnerOrDirectorPincode;
	}






	public String getAgentIndividualBussPincode() {
		return agentIndividualBussPincode;
	}






	public void setAgentIndividualBussPincode(String agentIndividualBussPincode) {
		this.agentIndividualBussPincode = agentIndividualBussPincode;
	}






	public K2PaymentDetailsModel getK2PaymentDetailsModel() {
		return k2PaymentDetailsModel;
	}






	public void setK2PaymentDetailsModel(K2PaymentDetailsModel k2PaymentDetailsModel) {
		this.k2PaymentDetailsModel = k2PaymentDetailsModel;
	}






	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
}
