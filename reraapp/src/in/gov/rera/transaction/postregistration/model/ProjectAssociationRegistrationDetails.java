package in.gov.rera.transaction.postregistration.model;

import java.io.Serializable;
import java.util.Calendar;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import in.gov.rera.dms.beans.Document;


@Entity
@Table(name ="TL_ASSOCIATION_DETLS")
public class ProjectAssociationRegistrationDetails implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="ASSOCIATION_DETLS_ID")
	private Long AssociationDetailsId;
	
	@Column(name = "ASSOCIATION_NAME")
	private String associationName;
	
	@Column(name = "IS_ASSOCIATION_FORMED")
	private String isAssocitionFormed;

	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="registeredDocId") 
	private Document registeredDoc;

	public Long getAssociationDetailsId() {
		return AssociationDetailsId;
	}

	public void setAssociationDetailsId(Long associationDetailsId) {
		AssociationDetailsId = associationDetailsId;
	}

	public String getAssociationName() {
		return associationName;
	}

	public void setAssociationName(String associationName) {
		this.associationName = associationName;
	}

	public String getIsAssocitionFormed() {
		return isAssocitionFormed;
	}

	public void setIsAssocitionFormed(String isAssocitionFormed) {
		this.isAssocitionFormed = isAssocitionFormed;
	}

	public Document getRegisteredDoc() {
		return registeredDoc;
	}

	public void setRegisteredDoc(Document registeredDoc) {
		this.registeredDoc = registeredDoc;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
	
	
	
}