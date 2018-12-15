package in.gov.rera.helpdesk.model;



import java.util.Date;
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

import in.gov.rera.common.model.UserModel;
import in.gov.rera.dms.beans.Document;


@Entity(name = "HelpDeskEnquiryHistory")
@Table(name = "TT_HELPDESK_HISTORY")
public class HelpDeskEnquiryHistory {

	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID")
	private Long id;
	
	@Column(name="STATUS")
	private String status;
	
	private Date createdOn;
	
	
	@ManyToOne
	@JoinColumn(name="ASSIGNOR")
	private UserModel assignor;
	
	@ManyToOne
	@JoinColumn(name="ASSIGNEE")
	private UserModel assignee;
	
	@OneToMany(cascade = CascadeType.ALL,fetch=FetchType.LAZY)
	private Set<Document> attachments;
	
	@ManyToOne
	@JoinColumn(name="enquiryId")
	private HelpDeskEnquiryModel enquiry;
	
	@Lob
	@Column(name="REMARKS",length=10000)
	private String description;
	
	private Boolean publicComment;
	
	

	public Boolean getPublicComment() {
		return publicComment;
	}

	public void setPublicComment(Boolean publicComment) {
		this.publicComment = publicComment;
	}

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

	

	

	public UserModel getAssignor() {
		return assignor;
	}

	public void setAssignor(UserModel assignor) {
		this.assignor = assignor;
	}

	public UserModel getAssignee() {
		return assignee;
	}

	public void setAssignee(UserModel assignee) {
		this.assignee = assignee;
	}

	public HelpDeskEnquiryModel getEnquiry() {
		return enquiry;
	}

	public void setEnquiry(HelpDeskEnquiryModel enquiry) {
		this.enquiry = enquiry;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Set<Document> getAttachments() {
		return attachments;
	}

	public void setAttachments(Set<Document> attachments) {
		this.attachments = attachments;
	}

	
	
	
	
	
	
	
	
}
