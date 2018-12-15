package in.gov.rera.transaction.projectregistration.model;

import in.gov.rera.dms.beans.Document;
import in.gov.rera.master.district.model.DistrictModel;
import in.gov.rera.master.subdistrict.model.SubDistrictModel;



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
@Entity(name = "PromoterDetailsModel")
@Table(name = "TL_PROMOTER_DETAILS")

public class PromoterDetailsModel {
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "PROMOTER_DELS_ID")
	private Long promoterDeldId;
	
	@Column(name = "PROMOTER_NAME", length = 150)
	private String promoterName;
	
	
	
	
	@Column(name = "PROMOTER_OTHER", length = 150)
	private String ifOther;
	

	@Column(name = "PIN_CODE", length = 20)
	private String pinCode;

	@Column(name = "ADHAAR_No", length = 20)
	private String adhaarNo;
	
	
	
	@Column(name = "PAN_NO", length = 15)
	private String panNo;
	
	@Column(name = "MOBILE_NO", length = 15)
	private String mobileNo;
	
	@Column(name = "LAND_LINE_NO_1", length = 15)
	private String landLineNo1;
	
	@Column(name = "LAND_LINE_NO_2", length = 15)
	private String landLineNo2;
	
	
	@Column(name = "TELEPHONE_NO", length = 15)
	private String telephoneNo;
	
	@Column(name = "ACCUPATION",length=500)
    private String accupation;
	

	@OneToMany(cascade = CascadeType.ALL, fetch=FetchType.LAZY)
	private Set<PromoterBlacklistDetailsModel> promoterBlackSet;
	
	
	@OneToOne(cascade=CascadeType.ALL,fetch=FetchType.LAZY)
	@JoinColumn(name="PROJECT_CHAIRMAN_ID")
	private ProjectChairmanModel projectChairmanModel;
	
	public String getPromoterName() {
		return promoterName;
	}

	public void setPromoterName(String promoterName) {
		this.promoterName = promoterName;
	}

	public String getPinCode() {
		return pinCode;
	}

	public void setPinCode(String pinCode) {
		this.pinCode = pinCode;
	}

	public String getAdhaarNo() {
		return adhaarNo;
	}

	public void setAdhaarNo(String adhaarNo) {
		this.adhaarNo = adhaarNo;
	}

	public String getPanNo() {
		return panNo;
	}

	public void setPanNo(String panNo) {
		this.panNo = panNo;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	



	public String getMobileNo() {
		return mobileNo;
	}

	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}

	public String getLandLineNo1() {
		return landLineNo1;
	}

	public void setLandLineNo1(String landLineNo1) {
		this.landLineNo1 = landLineNo1;
	}


	public String getAddressLine1() {
		return addressLine1;
	}

	public void setAddressLine1(String addressLine1) {
		this.addressLine1 = addressLine1;
	}

	public String getAddressLine2() {
		return addressLine2;
	}

	public void setAddressLine2(String addressLine2) {
		this.addressLine2 = addressLine2;
	}

	

	public String getFaxNumber() {
		return faxNumber;
	}

	public void setFaxNumber(String faxNumber) {
		this.faxNumber = faxNumber;
	}


	public Document getIndividualPhotoGraphPath() {
		return individualPhotoGraphPath;
	}

	public void setIndividualPhotoGraphPath(Document individualPhotoGraphPath) {
		this.individualPhotoGraphPath = individualPhotoGraphPath;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPromoterIndividualFatherName() {
		return promoterIndividualFatherName;
	}

	public void setPromoterIndividualFatherName(String promoterIndividualFatherName) {
		this.promoterIndividualFatherName = promoterIndividualFatherName;
	}

	public String getTypeOfPromoter() {
		return typeOfPromoter;
	}

	public void setTypeOfPromoter(String typeOfPromoter) {
		this.typeOfPromoter = typeOfPromoter;
	}

	public Long getPromoterDeldId() {
		return promoterDeldId;
	}

	public void setPromoterDeldId(Long promoterDeldId) {
		this.promoterDeldId = promoterDeldId;
	}

	public String getAccupation() {
		return accupation;
	}

	public void setAccupation(String accupation) {
		this.accupation = accupation;
	}

	public String getIfOther() {
		return ifOther;
	}

	public void setIfOther(String ifOther) {
		this.ifOther = ifOther;
	}

	public String getComRegistrationNo() {
		return comRegistrationNo;
	}

	public void setComRegistrationNo(String comRegistrationNo) {
		this.comRegistrationNo = comRegistrationNo;
	}

	public Document getDocument() {
		return document;
	}

	public void setDocument(Document document) {
		this.document = document;
	}

	public String getTelephoneNo() {
		return telephoneNo;
	}

	public void setTelephoneNo(String telephoneNo) {
		this.telephoneNo = telephoneNo;
	}

	public ProjectChairmanModel getProjectChairmanModel() {
		return projectChairmanModel;
	}

	public void setProjectChairmanModel(ProjectChairmanModel projectChairmanModel) {
		this.projectChairmanModel = projectChairmanModel;
	}

	




	public Set<PromoterBlacklistDetailsModel> getPromoterBlackSet() {
		return promoterBlackSet;
	}

	public void setPromoterBlackSet(Set<PromoterBlacklistDetailsModel> promoterBlackSet) {
		this.promoterBlackSet = promoterBlackSet;
	}






	public String getLandLineNo2() {
		return landLineNo2;
	}

	public void setLandLineNo2(String landLineNo2) {
		this.landLineNo2 = landLineNo2;
	}






	public DistrictModel getDistrictModel() {
		return districtModel;
	}

	public void setDistrictModel(DistrictModel districtModel) {
		this.districtModel = districtModel;
	}






	@Column(name = "EMAILID", length = 80)
	private String emailId;
	
	
	@Column(name = "ADDRESS_LINE_1", length = 500)
	private String addressLine1;

	@Column(name = "ADDRESS_LINE_2", length = 500)
	private String addressLine2;
	
	
	

	@ManyToOne
	@JoinColumn(name="COM_REG_CERTIFICATE_DOC_ID")
	private Document document;

	@Column(name = "COM_REG_NO", length = 100)
	private String comRegistrationNo;

	

	@Column(name="FAX_NO")
	private String faxNumber;
	
	@ManyToOne
	@JoinColumn(name = "DISTRICT_ID")
	private
	DistrictModel districtModel;


	
	@ManyToOne
	@JoinColumn(name="PROMOTOER_IND_PHOTO_DOC")
	private Document individualPhotoGraphPath;
	
	
	
	
	
	@Column(name = "NAME", length = 100)
	private String name;

	@Column(name = "PROMOTER_INV_FATHER_NAME", length = 100)
	private String promoterIndividualFatherName;

	@Column(name = "TYPE_OF_PROMOTER" , length = 50)
	private String typeOfPromoter;


	
	public void populateModel(PromoterDetailsModel model){
		this.accupation=model.getAccupation();
		this.addressLine1=model.getAddressLine1();
		this.addressLine2=model.getAddressLine2();
		this.adhaarNo=model.getAdhaarNo();
		this.comRegistrationNo=model.getComRegistrationNo();
		this.emailId=model.getEmailId();
		this.faxNumber=model.faxNumber;
		this.ifOther=model.getIfOther();
		this.landLineNo1=model.getLandLineNo1();
		this.mobileNo=model.getMobileNo();
		this.name=model.getName();
		this.panNo=model.getPanNo();
		this.pinCode=model.getPinCode();
		this.promoterIndividualFatherName=model.getPromoterIndividualFatherName();
		this.promoterName=model.getPromoterName();
		this.telephoneNo=model.getTelephoneNo();
		this.typeOfPromoter=model.getTypeOfPromoter();
		
		
		
		if(model.getProjectChairmanModel()!=null){
			if(this.getProjectChairmanModel()==null){
				this.projectChairmanModel=new ProjectChairmanModel();
			}
			this.getProjectChairmanModel().setAddressLine1(model.getProjectChairmanModel().getAddressLine1());
			this.getProjectChairmanModel().setAddressLine2(model.getProjectChairmanModel().getAddressLine2());
			this.getProjectChairmanModel().setChairmanName(model.getProjectChairmanModel().getChairmanName());
			this.getProjectChairmanModel().setEmailId(model.getProjectChairmanModel().getEmailId());
			this.getProjectChairmanModel().setMobileNo(model.getProjectChairmanModel().getMobileNo());
			this.getProjectChairmanModel().setPincode(model.getProjectChairmanModel().getPincode());
		}
		
		
		
	}
	
	
	
	
}
