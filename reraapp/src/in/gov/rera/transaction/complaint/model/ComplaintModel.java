package in.gov.rera.transaction.complaint.model;

import in.gov.rera.K2PaymentGateWay.model.K2PaymentDetailsModel;
import in.gov.rera.common.model.EnquiryModel;
import in.gov.rera.common.model.UserModel;
import in.gov.rera.dms.beans.Document;
import in.gov.rera.master.district.model.DistrictModel;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

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
import javax.persistence.OrderColumn;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity(name = "ComplaintModel")
@Table(name = "TT_COMPLAINT")
public class ComplaintModel {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "COMP_ID")
	private Long compId;

	@Column(name = "COMPLAINT_AGAINST",length=500)
	private String complaintAgainst;

	@Column(name = "COMPLAINT_NO")
	private String complaintNo;

	@Column(name = "COMPLAINT_STATUS")
	private String status;

	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name = "APPROVED_BY")
	private UserModel approveBy;

	@Column(name = "COMPLAINT_DATE")
	@Temporal(TemporalType.TIMESTAMP)
	private Calendar complaintDate;

	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name = "ASSIGN_TO")
	private UserModel assignTo;
	
	@Column(name = "APPROVE_ON")
	@Temporal(TemporalType.TIMESTAMP)
	private Calendar approvedOn;

	

	@Column(name = "PROJECT_NAME")
	private String projectName;
	
	@Column(name = "PROMOTER_NAME")
	private String promoterName;
	
	@Column(name = "APP_NO")
	private String applicationNo;
	
	@Column(name = "APPLICATE_ADHAAR_NO")
	private String applicateAdharNo;
	
	@Column(name = "ONRESPONDENT")
	private String onRespondent;
	
	@Column(name = "ONCOMPLAINANT")
	private String OnComplainant ;
	
	@Column(name = "ENQUIRY_ON")
	private String enquiryOn ;
	
	@OneToOne(cascade = CascadeType.ALL,fetch =FetchType.LAZY)
	@JoinColumn(name = "K2_PAY_DELS_ID")
	private K2PaymentDetailsModel k2PaymentDetailsModel;
	
	@OneToOne(cascade = CascadeType.ALL,fetch =FetchType.EAGER)
	@JoinColumn(name = "AAdharCardPath")
	private Document AAdharCardPath;
	
	@OneToMany(cascade = CascadeType.ALL, fetch=FetchType.LAZY)
	@OrderColumn(name="orders_index")
	private List<EnquiryModel> enquiryList;
	
	
	
	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getPromoterName() {
		return promoterName;
	}

	public void setPromoterName(String promoterName) {
		this.promoterName = promoterName;
	}

	public String getApplicationNo() {
		return applicationNo;
	}

	public void setApplicationNo(String applicationNo) {
		this.applicationNo = applicationNo;
	}

	public UserModel getAssignTo() {
		return assignTo;
	}

	public void setAssignTo(UserModel assignTo) {
		this.assignTo = assignTo;
	}

	public UserModel getApproveBy() {
		return approveBy;
	}

	public void setApproveBy(UserModel approveBy) {
		this.approveBy = approveBy;
	}

	public Calendar getApprovedOn() {
		return approvedOn;
	}

	public void setApprovedOn(Calendar approvedOn) {
		this.approvedOn = approvedOn;
	}

	@Column(name = "COMPLAINT_SUBJECT")
	private String complaintSubject;

	@Column(name = "COMPLAINT_SUMMARY", length = 3000)
	private String complaintSummary;

	@Column(name = "APPLICATE_NAME")
	private String applicateName;

	@Column(name = "APPLICATE_MOBILE_NO")
	private String applicateMobileNo;

	@Column(name = "APPLICATE_PHONE_NO")
	private String applicatePhoneNo;

	@Column(name = "APPLICATE_EMAILID")
	private String applicateEmailId;

	@Column(name = "APPLICATE_RES_ADD_LINE_1",length=500)
	private String applicateResAddressLine1;

	@Column(name = "APPLICATE_RES_ADD_LINE_2",length=500)
	private String applicateResAddressLine2;

	@Column(name = "APPLICATE_RES_PIN_CODE")
	private String applicateResPinCode;

	@ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name = "APP_RES_DISTRICT_ID")
	private DistrictModel appResdistrictModel;

	@Column(name = "APPLICATE_RES_SAME_AS_ADD_LINE_1",length=500)
	private String applicateResSameAsAddressLine1;

	@Column(name = "APPLICATE_RES_SAME_AS_ADD_LINE_2",length=500)
	private String applicateResSameAsAddressLine2;

	@Column(name = "APPLICATE_RES_SAME_AS_PIN_CODE")
	private String applicateResSameAsPinCode;

	@ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name = "APP_RES_SAME_AS_DISTRICT_ID")
	private DistrictModel appResSameAsdistrictModel;

	// --
	@Column(name = "RELIEF_FROM_RERA",length=700)
	private String reliefSoughtfromRera;

	@Column(name = "RESPONDENT_NAME")
	private String respondentName;

	@Column(name = "RESPONDENT_PHONE_NO")
	private String respondentPhoneNo;

	@Column(name = "RESPONDENT_MOBILE_NO")
	private String respondentMobileNo;

	@Column(name = "RESPONDENT_EMAILID")
	private String respondentEmailId;

	@Column(name = "RESPONDENT_RES_ADD_LINE_1",length=500)
	private String respondentResAddressLine1;

	@Column(name = "RESPONDEN_RES_ADD_LINE_2",length=500)
	private String respondentResAddressLine2;

	@Column(name = "RESPONDENT_RES_PIN_CODE")
	private String respondentResPinCode;

	@ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name = "RESPONDENT_RES_DISTRICT_ID")
	private DistrictModel respondentdistrictModel;

	
	@Column(name = "RESPONDENT_RES_SAME_AS_ADD_LINE_1",length=500)
	private String respondentResSameAsAddressLine1;

	@Column(name = "RESPONDENT_RES_SAME_AS_ADD_LINE_2",length=500)
	private String respondentResSameAsAddressLine2;

	@Column(name = "RESPONDENT_RES_SAME_AS_PIN_CODE")
	private String respondentResSameAsPinCode;

	@ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name = "RESPONDENT_RES_SAME_AS_DISTRICT_ID")
	private DistrictModel respondentSameAsdistrictModel;

	@Column(name = "INTERIM_ORDER_REQUIRED",length=1000)
	private String interimOrderRequired;

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private List<Document> docList;

	@Column(name = "INTERIM_ORDER_PRAYED", length = 3000)
	private String interimOrderPrayed;

	public String getComplaintAgainst() {
		return complaintAgainst;
	}

	public void setComplaintAgainst(String complaintAgainst) {
		this.complaintAgainst = complaintAgainst;
	}

	public String getComplaintSubject() {
		return complaintSubject;
	}

	public void setComplaintSubject(String complaintSubject) {
		this.complaintSubject = complaintSubject;
	}

	public String getComplaintSummary() {
		return complaintSummary;
	}

	public void setComplaintSummary(String complaintSummary) {
		this.complaintSummary = complaintSummary;
	}

	public String getApplicateName() {
		return applicateName;
	}

	public void setApplicateName(String applicateName) {
		this.applicateName = applicateName;
	}

	public String getApplicatePhoneNo() {
		return applicatePhoneNo;
	}

	public void setApplicatePhoneNo(String applicatePhoneNo) {
		this.applicatePhoneNo = applicatePhoneNo;
	}

	public String getApplicateEmailId() {
		return applicateEmailId;
	}

	public void setApplicateEmailId(String applicateEmailId) {
		this.applicateEmailId = applicateEmailId;
	}

	public String getApplicateResAddressLine1() {
		return applicateResAddressLine1;
	}

	public void setApplicateResAddressLine1(String applicateResAddressLine1) {
		this.applicateResAddressLine1 = applicateResAddressLine1;
	}

	public String getApplicateResAddressLine2() {
		return applicateResAddressLine2;
	}

	public void setApplicateResAddressLine2(String applicateResAddressLine2) {
		this.applicateResAddressLine2 = applicateResAddressLine2;
	}

	public String getApplicateResPinCode() {
		return applicateResPinCode;
	}

	public void setApplicateResPinCode(String applicateResPinCode) {
		this.applicateResPinCode = applicateResPinCode;
	}

	public DistrictModel getAppResdistrictModel() {
		return appResdistrictModel;
	}

	public void setAppResdistrictModel(DistrictModel appResdistrictModel) {
		this.appResdistrictModel = appResdistrictModel;
	}

	public String getApplicateResSameAsAddressLine1() {
		return applicateResSameAsAddressLine1;
	}

	public void setApplicateResSameAsAddressLine1(
			String applicateResSameAsAddressLine1) {
		this.applicateResSameAsAddressLine1 = applicateResSameAsAddressLine1;
	}

	public String getApplicateResSameAsAddressLine2() {
		return applicateResSameAsAddressLine2;
	}

	public void setApplicateResSameAsAddressLine2(
			String applicateResSameAsAddressLine2) {
		this.applicateResSameAsAddressLine2 = applicateResSameAsAddressLine2;
	}

	public String getApplicateResSameAsPinCode() {
		return applicateResSameAsPinCode;
	}

	public void setApplicateResSameAsPinCode(String applicateResSameAsPinCode) {
		this.applicateResSameAsPinCode = applicateResSameAsPinCode;
	}

	public DistrictModel getAppResSameAsdistrictModel() {
		return appResSameAsdistrictModel;
	}

	public void setAppResSameAsdistrictModel(
			DistrictModel appResSameAsdistrictModel) {
		this.appResSameAsdistrictModel = appResSameAsdistrictModel;
	}

	public String getRespondentName() {
		return respondentName;
	}

	public void setRespondentName(String respondentName) {
		this.respondentName = respondentName;
	}

	public String getRespondentPhoneNo() {
		return respondentPhoneNo;
	}

	public void setRespondentPhoneNo(String respondentPhoneNo) {
		this.respondentPhoneNo = respondentPhoneNo;
	}

	public String getRespondentEmailId() {
		return respondentEmailId;
	}

	public void setRespondentEmailId(String respondentEmailId) {
		this.respondentEmailId = respondentEmailId;
	}

	public String getRespondentResAddressLine1() {
		return respondentResAddressLine1;
	}

	public void setRespondentResAddressLine1(String respondentResAddressLine1) {
		this.respondentResAddressLine1 = respondentResAddressLine1;
	}

	public String getRespondentResAddressLine2() {
		return respondentResAddressLine2;
	}

	public void setRespondentResAddressLine2(String respondentResAddressLine2) {
		this.respondentResAddressLine2 = respondentResAddressLine2;
	}

	public String getRespondentResPinCode() {
		return respondentResPinCode;
	}

	public void setRespondentResPinCode(String respondentResPinCode) {
		this.respondentResPinCode = respondentResPinCode;
	}

	public DistrictModel getRespondentdistrictModel() {
		return respondentdistrictModel;
	}

	public void setRespondentdistrictModel(DistrictModel respondentdistrictModel) {
		this.respondentdistrictModel = respondentdistrictModel;
	}

	public String getRespondentResSameAsAddressLine1() {
		return respondentResSameAsAddressLine1;
	}

	public void setRespondentResSameAsAddressLine1(
			String respondentResSameAsAddressLine1) {
		this.respondentResSameAsAddressLine1 = respondentResSameAsAddressLine1;
	}

	public String getRespondentResSameAsAddressLine2() {
		return respondentResSameAsAddressLine2;
	}

	public void setRespondentResSameAsAddressLine2(
			String respondentResSameAsAddressLine2) {
		this.respondentResSameAsAddressLine2 = respondentResSameAsAddressLine2;
	}

	public String getRespondentResSameAsPinCode() {
		return respondentResSameAsPinCode;
	}

	public void setRespondentResSameAsPinCode(String respondentResSameAsPinCode) {
		this.respondentResSameAsPinCode = respondentResSameAsPinCode;
	}

	public DistrictModel getRespondentSameAsdistrictModel() {
		return respondentSameAsdistrictModel;
	}

	public void setRespondentSameAsdistrictModel(
			DistrictModel respondentSameAsdistrictModel) {
		this.respondentSameAsdistrictModel = respondentSameAsdistrictModel;
	}

	public String getInterimOrderPrayed() {
		return interimOrderPrayed;
	}

	public void setInterimOrderPrayed(String interimOrderPrayed) {
		this.interimOrderPrayed = interimOrderPrayed;
	}

	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name = "COMP_PAY_DELS_ID")
	private ComplaintPaymentDetailsModel complaintPaymentDetailsModel;

	public Long getCompId() {
		return compId;
	}

	public void setCompId(Long compId) {
		this.compId = compId;
	}

	public ComplaintPaymentDetailsModel getComplaintPaymentDetailsModel() {
		return complaintPaymentDetailsModel;
	}

	public void setComplaintPaymentDetailsModel(
			ComplaintPaymentDetailsModel complaintPaymentDetailsModel) {
		this.complaintPaymentDetailsModel = complaintPaymentDetailsModel;
	}

	public List<Document> getDocList() {
		return docList;
	}

	public void setDocList(List<Document> docList) {
		this.docList = docList;
	}

	public String getApplicateMobileNo() {
		return applicateMobileNo;
	}

	public void setApplicateMobileNo(String applicateMobileNo) {
		this.applicateMobileNo = applicateMobileNo;
	}

	public String getRespondentMobileNo() {
		return respondentMobileNo;
	}

	public void setRespondentMobileNo(String respondentMobileNo) {
		this.respondentMobileNo = respondentMobileNo;
	}

	public String getReliefSoughtfromRera() {
		return reliefSoughtfromRera;
	}

	public void setReliefSoughtfromRera(String reliefSoughtfromRera) {
		this.reliefSoughtfromRera = reliefSoughtfromRera;
	}

	public String getInterimOrderRequired() {
		return interimOrderRequired;
	}

	public void setInterimOrderRequired(String interimOrderRequired) {
		this.interimOrderRequired = interimOrderRequired;
	}

	public String getComplaintNo() {
		return complaintNo;
	}

	public void setComplaintNo(String complaintNo) {
		this.complaintNo = complaintNo;
	}

	public Calendar getComplaintDate() {
		return complaintDate;
	}

	public void setComplaintDate(Calendar complaintDate) {
		this.complaintDate = complaintDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getApplicateAdharNo() {
		return applicateAdharNo;
	}

	public void setApplicateAdharNo(String applicateAdharNo) {
		this.applicateAdharNo = applicateAdharNo;
	}

	public Document getAAdharCardPath() {
		return AAdharCardPath;
	}

	public void setAAdharCardPath(Document aAdharCardPath) {
		AAdharCardPath = aAdharCardPath;
	}

	public List<EnquiryModel> getEnquiryList() {
		return enquiryList;
	}

	public void setEnquiryList(List<EnquiryModel> enquiryList) {
		this.enquiryList = enquiryList;
	}

	public String getOnRespondent() {
		return onRespondent;
	}

	public void setOnRespondent(String onRespondent) {
		this.onRespondent = onRespondent;
	}

	public String getOnComplainant() {
		return OnComplainant;
	}

	public void setOnComplainant(String onComplainant) {
		OnComplainant = onComplainant;
	}

	public String getEnquiryOn() {
		return enquiryOn;
	}

	public void setEnquiryOn(String enquiryOn) {
		this.enquiryOn = enquiryOn;
	}

	public K2PaymentDetailsModel getK2PaymentDetailsModel() {
		return k2PaymentDetailsModel;
	}

	public void setK2PaymentDetailsModel(K2PaymentDetailsModel k2PaymentDetailsModel) {
		this.k2PaymentDetailsModel = k2PaymentDetailsModel;
	}
	
	

}
