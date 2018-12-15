package in.gov.rera.transaction.unregistered.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import in.gov.rera.common.model.UserModel;

@Entity(name = "UnregEnquiryModel")
@Table(name = "TT_UNREG_ENQUIRY")
public class UnregEnquiryModel {

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
	
	@Column(name="SUBJECT")
	private String subject;
	
	@Lob
	@Column(name="DESCRIPTION",length=10000)
	private String description;

	private String emailId;
	
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

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	
	
}
