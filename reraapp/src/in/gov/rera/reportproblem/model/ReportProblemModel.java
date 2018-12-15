package in.gov.rera.reportproblem.model;

import java.io.Serializable;
import java.util.Calendar;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import in.gov.rera.dms.beans.Document;

@Entity(name = "ReportProblem")
@Table(name = "TL_REPORT_PROBLEM_DETAILS")
public class ReportProblemModel implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "REPORT_PROBLEM_ID")
	private Long reportId;

	@Column(name = "CREATED_ON")
	@Temporal(TemporalType.TIMESTAMP)
	private Calendar createdOn;

	@Column(name = "PROJECT_NAME", length = 100)
	private String projectName;

	@Column(name = "PROMOTER_NAME", length = 150)
	private String promoterName;

	@Column(name = "MOBILE_NO", length = 15)
	private String mobileNo;

	@Column(name = "PROMOTER_MOBILE_NO", length = 15)
	private String promoterMobileNo;

	@Column(name = "WEBSITE_LINKS", length = 150)
	private String website;

	@Column(name = "ADDRESS")
	private String address;

	@Column(name = "DISTRICT")
	private String distName;

	@Column(name = "PINCODE")
	private String pincode;

	@Column(name = "NO_OF_UNREG_PRJ")
	private String unRegProjects;

	@Column(name = "OTHER_DETAILS")
	private String otherDetails;

	@Column(name = "STATUS")
	private String status;

	@Column(name = "PROMOTER_EMAIL")
	private String promoterEmailAddress;
	
	@Column(name = "EMAIL")
	private String email;
	
	@Column(name = "REPORTER_NAME")
	private String reporterName;

	@ManyToOne
	@JoinColumn(name = "RELATED_DOC_ONE")
	private Document reportDocOne;

	@ManyToOne
	@JoinColumn(name = "RELATED_DOC_TWO")
	private Document reportDocTwo;

	@ManyToOne
	@JoinColumn(name = "RELATED_DOC_THREE")
	private Document reportDocThree;

	public Long getReportId() {
		return reportId;
	}

	public void setReportId(Long reportId) {
		this.reportId = reportId;
	}

	public Calendar getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(Calendar createdOn) {
		this.createdOn = createdOn;
	}

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

	public String getMobileNo() {
		return mobileNo;
	}

	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public String getPincode() {
		return pincode;
	}

	public void setPincode(String pincode) {
		this.pincode = pincode;
	}

	public String getOtherDetails() {
		return otherDetails;
	}

	public void setOtherDetails(String otherDetails) {
		this.otherDetails = otherDetails;
	}

	public Document getReportDocOne() {
		return reportDocOne;
	}

	public void setReportDocOne(Document reportDocOne) {
		this.reportDocOne = reportDocOne;
	}

	public Document getReportDocTwo() {
		return reportDocTwo;
	}

	public void setReportDocTwo(Document reportDocTwo) {
		this.reportDocTwo = reportDocTwo;
	}

	public Document getReportDocThree() {
		return reportDocThree;
	}

	public void setReportDocThree(Document reportDocThree) {
		this.reportDocThree = reportDocThree;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPromoterMobileNo() {
		return promoterMobileNo;
	}

	public void setPromoterMobileNo(String promoterMobileNo) {
		this.promoterMobileNo = promoterMobileNo;
	}

	public String getDistName() {
		return distName;
	}

	public void setDistName(String distName) {
		this.distName = distName;
	}

	public String getUnRegProjects() {
		return unRegProjects;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setUnRegProjects(String unRegProjects) {
		this.unRegProjects = unRegProjects;
	}

	public String getPromoterEmailAddress() {
		return promoterEmailAddress;
	}

	public void setPromoterEmailAddress(String promoterEmailAddress) {
		this.promoterEmailAddress = promoterEmailAddress;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getReporterName() {
		return reporterName;
	}

	public void setReporterName(String reporterName) {
		this.reporterName = reporterName;
	}
	

}
