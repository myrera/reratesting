package in.gov.rera.transaction.projectregistration.model;

import java.util.Set;

import in.gov.rera.dms.beans.Document;

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
import javax.persistence.Table;

@Entity(name = "projectNewDocModel")
@Table(name = "TL_PROJECT_NEW_DOC")
public class ProjectNewDocModel {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "PROJ_NEW_DOC_ID")
	private Long newDocId;
	
	@JoinColumn(name = "UTILISATION_CERTIFICATE")
	private Document  utilisationcertificate;
	
	@ManyToOne
	@JoinColumn(name = "TRANSFER_OF_DEV_CERT")
	private Document  trnsfrOfDevlpcert;
	
	@ManyToOne
	@JoinColumn(name = "RELINQUJISHMENT_DEED")
	private Document  relinquishmentDeed;
	
	@ManyToOne
	@JoinColumn(name = "NOC_SEC_109")
	private Document  nocsec109;
 
	@ManyToOne
	@JoinColumn(name = "CONVERSION_CERT")
	private Document  conversionCert;
	
	@ManyToOne
	@JoinColumn(name = "NOC_SEC_14")
	private Document  nocsec14;
	
	@ManyToOne
	@JoinColumn(name = "OTHER_DOCS")
	private Document  otherDocs;
	
	
	public Long getNewDocId() {
		return newDocId;
	}

	public void setNewDocId(Long newDocId) {
		this.newDocId = newDocId;
	}

	public Document getUtilisationcertificate() {
		return utilisationcertificate;
	}

	public void setUtilisationcertificate(Document utilisationcertificate) {
		this.utilisationcertificate = utilisationcertificate;
	}

	public Document getTrnsfrOfDevlpcert() {
		return trnsfrOfDevlpcert;
	}

	public void setTrnsfrOfDevlpcert(Document trnsfrOfDevlpcert) {
		this.trnsfrOfDevlpcert = trnsfrOfDevlpcert;
	}

	public Document getRelinquishmentDeed() {
		return relinquishmentDeed;
	}

	public void setRelinquishmentDeed(Document relinquishmentDeed) {
		this.relinquishmentDeed = relinquishmentDeed;
	}

	public Document getNocsec109() {
		return nocsec109;
	}

	public void setNocsec109(Document nocsec109) {
		this.nocsec109 = nocsec109;
	}

	public Document getConversionCert() {
		return conversionCert;
	}

	public void setConversionCert(Document conversionCert) {
		this.conversionCert = conversionCert;
	}

	public Document getNocsec14() {
		return nocsec14;
	}

	public void setNocsec14(Document nocsec14) {
		this.nocsec14 = nocsec14;
	}

	public Document getOtherDocs() {
		return otherDocs;
	}

	public void setOtherDocs(Document otherDocs) {
		this.otherDocs = otherDocs;
	}
	
	


}
