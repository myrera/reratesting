package in.gov.rera.transaction.postregistration.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import in.gov.rera.dms.beans.Document;


@Entity(name = "ProjectWelfareFundDetails")
@Table(name = "TL_PROJECT_WELFARE_FUND_DETAILS")
public class ProjectWelfareFundDetails implements Serializable {
	
	private static final long serialVersionUID = 1L;
	 
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="PROJECT_WELFARE_ID")
	private Long projectWelfareFundDetailsId;
	
	@Column(name = "REGISTRATION_NO")
	private String projecteFundRegNo;
	
	@Column(name = "IS_Applicable")
	private String isApplicable;

	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="registeredDocId") 
	private Document welfareFundregisteredDoc;

	public Long getProjectWelfareFundDetailsId() {
		return projectWelfareFundDetailsId;
	}

	public void setProjectWelfareFundDetailsId(Long projectWelfareFundDetailsId) {
		this.projectWelfareFundDetailsId = projectWelfareFundDetailsId;
	}

	public String getProjecteFundRegNo() {
		return projecteFundRegNo;
	}

	public void setProjecteFundRegNo(String projecteFundRegNo) {
		this.projecteFundRegNo = projecteFundRegNo;
	}

	public String getIsApplicable() {
		return isApplicable;
	}

	public void setIsApplicable(String isApplicable) {
		this.isApplicable = isApplicable;
	}

	public Document getWelfareFundregisteredDoc() {
		return welfareFundregisteredDoc;
	}

	public void setWelfareFundregisteredDoc(Document welfareFundregisteredDoc) {
		this.welfareFundregisteredDoc = welfareFundregisteredDoc;
	}

	
}
