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

@Entity(name = "ComplaintModelReport")
@Table(name = "TT_COMPLAINT_REPORT")
public class ComplaintModelReport implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "COMPLAINT_REPORT_ID")
	private Long complaintReportId;
	
	@Column(name = "COMPLAINT_NO", length = 15)
	private String complaintNo;

	@Column(name = "ORDER_DATE")
	@Temporal(TemporalType.TIMESTAMP)
	private Calendar orderDate;

	@Column(name = "PETITIONER", length = 100)
	private String petitioner;

	@Column(name = "RESPONDENT_NAME", length = 150)
	private String respondentName;

	@Column(name = "DISTRICT")
	private String distName;

	@ManyToOne
	@JoinColumn(name = "ORDER_COPY")
	private Document orderCopy;

	public Long getComplaintReportId() {
		return complaintReportId;
	}

	public void setComplaintReportId(Long complaintReportId) {
		this.complaintReportId = complaintReportId;
	}

	public String getComplaintNo() {
		return complaintNo;
	}

	public void setComplaintNo(String complaintNo) {
		this.complaintNo = complaintNo;
	}

	public Calendar getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Calendar orderDate) {
		this.orderDate = orderDate;
	}

	public String getPetitioner() {
		return petitioner;
	}

	public void setPetitioner(String petitioner) {
		this.petitioner = petitioner;
	}

	public String getRespondentName() {
		return respondentName;
	}

	public void setRespondentName(String respondentName) {
		this.respondentName = respondentName;
	}

	public String getDistName() {
		return distName;
	}

	public void setDistName(String distName) {
		this.distName = distName;
	}


	public Document getOrderCopy() {
		return orderCopy;
	}

	public void setOrderCopy(Document orderCopy) {
		this.orderCopy = orderCopy;
	}

	

}
