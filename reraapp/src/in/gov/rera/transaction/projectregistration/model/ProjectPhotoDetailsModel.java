package in.gov.rera.transaction.projectregistration.model;

import in.gov.rera.dms.beans.Document;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity(name = "ProjectPhotoDetailsModel")
@Table(name = "TT_PROJECT_PHOTO_DETAILS")
public class ProjectPhotoDetailsModel {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "PROJECT_PHOTO_DELS_ID")
	private Long projPhotoDelsId;
	
	@ManyToOne
	@JoinColumn(name="PROJECT_REG_ID")
	private ProjectRegistrationModel projectRegistrationModel;
	
	@ManyToOne
	@JoinColumn(name="DOC_ID")
	private Document dcDocument;

	public Long getProjPhotoDelsId() {
		return projPhotoDelsId;
	}

	public void setProjPhotoDelsId(Long projPhotoDelsId) {
		this.projPhotoDelsId = projPhotoDelsId;
	}


	public ProjectRegistrationModel getProjectRegistrationModel() {
		return projectRegistrationModel;
	}

	public void setProjectRegistrationModel(ProjectRegistrationModel projectRegistrationModel) {
		this.projectRegistrationModel = projectRegistrationModel;
	}

	public Document getDcDocument() {
		return dcDocument;
	}

	public void setDcDocument(Document dcDocument) {
		this.dcDocument = dcDocument;
	}
}
