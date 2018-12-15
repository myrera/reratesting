package in.gov.rera.helpdesk.model;



import java.util.Date;
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
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import in.gov.rera.common.model.UserModel;
import in.gov.rera.dms.beans.Document;


@Entity(name = "HelpDeskEnquiryModel")
@Table(name = "TT_HELPDESK_ENQUIRY")
public class HelpDeskEnquiryModel {

	
	public HelpDeskCategoryModel getCategory() {
		return category;
	}

	public void setCategory(HelpDeskCategoryModel category) {
		this.category = category;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID")
	private Long id;
	
	@Column(name="STATUS")
	private String status;
	
	private Date createdOn;
	
	
	@ManyToOne
	@JoinColumn(name="CREATED_BY")
	private UserModel createdBy;
	
	@ManyToOne
	@JoinColumn(name="CATEGORY")
	private HelpDeskCategoryModel category;
	
	@ManyToOne
	@JoinColumn(name="ASSIGNED_TO")
	private UserModel assignedTo;
	
	@Lob
	@Column(name="DESCRIPTION",length=10000)
	private String description;
	
	@Column(name="PHONE")
	private String contactNumber;
	
	@Column(name="APPLICATION_NUMBER")
	private String applicationNumber;
	
	@OneToMany(cascade = CascadeType.ALL,fetch=FetchType.LAZY)
	private Set<Document> attachments;

	@Column(name="TICKET_NUMBER")
	private String ticketNumber;
	
	@Transient
	private List<HelpDeskEnquiryHistory> logs;
	

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(Date createdOn) {
		this.createdOn = createdOn;
	}

	public UserModel getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(UserModel createdBy) {
		this.createdBy = createdBy;
	}

	public UserModel getAssignedTo() {
		return assignedTo;
	}

	public void setAssignedTo(UserModel assignedTo) {
		this.assignedTo = assignedTo;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getContactNumber() {
		return contactNumber;
	}

	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}

	public Set<Document> getAttachments() {
		return attachments;
	}

	public void setAttachments(Set<Document> attachments) {
		this.attachments = attachments;
	}

	public void setTicketNumber(String ticketNumber) {
		this.ticketNumber=ticketNumber;
		
	}

	public String getTicketNumber() {
		return ticketNumber;
	}

	public String getApplicationNumber() {
		return applicationNumber;
	}

	public void setApplicationNumber(String applicationNumber) {
		this.applicationNumber = applicationNumber;
	}

	public List<HelpDeskEnquiryHistory> getLogs() {
		return logs;
	}

	public void setLogs(List<HelpDeskEnquiryHistory> logs) {
		this.logs = logs;
	}

	
	
	
	
	
	
	
}
