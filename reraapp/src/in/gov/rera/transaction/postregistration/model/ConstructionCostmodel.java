package in.gov.rera.transaction.postregistration.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import in.gov.rera.dms.beans.Document;

@Entity
@Table(name = "TL_CONSTRUCTION_DETAILS_ID")
public class ConstructionCostmodel {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "CONSTRUCTION_COST_MODEL_ID")
	private Long constructionCostModelId;

	@Column(name = "EST_TOT_CONSTRUCTION_COST")
	private Long estTotConstructionCost;
	
	@Column(name = "TOT_PROJECT_COST")
	private Long totProjectCost;
	
	@OneToOne
	@JoinColumn(name = "CERT_FROM_CA_ACC_ID")
	private Document certFromChartedAcc;

	@OneToOne
	@JoinColumn(name = "CERT_ISSUED_BY_STRUCTURAL_ENG_ID")
	private Document  certificateIssuedByStructuralEng;

	@OneToOne
	@JoinColumn(name = "CERT_ISSUED_BY_ARCHITECT_ID")
	private Document  certificateIssuedByArchitect;
	
	@OneToMany(cascade = CascadeType.ALL,fetch=FetchType.LAZY)
	private List<ConstructionCostDetails> constructionCostList;

	public Long getConstructionCostModelId() {
		return constructionCostModelId;
	}

	public void setConstructionCostModelId(Long constructionCostModelId) {
		this.constructionCostModelId = constructionCostModelId;
	}

	public Long getEstTotConstructionCost() {
		return estTotConstructionCost;
	}

	public void setEstTotConstructionCost(Long estTotConstructionCost) {
		this.estTotConstructionCost = estTotConstructionCost;
	}

	public Long getTotProjectCost() {
		return totProjectCost;
	}

	public void setTotProjectCost(Long totProjectCost) {
		this.totProjectCost = totProjectCost;
	}

	public Document getCertFromChartedAcc() {
		return certFromChartedAcc;
	}

	public void setCertFromChartedAcc(Document certFromChartedAcc) {
		this.certFromChartedAcc = certFromChartedAcc;
	}

	public Document getCertificateIssuedByStructuralEng() {
		return certificateIssuedByStructuralEng;
	}

	public void setCertificateIssuedByStructuralEng(Document certificateIssuedByStructuralEng) {
		this.certificateIssuedByStructuralEng = certificateIssuedByStructuralEng;
	}

	public Document getCertificateIssuedByArchitect() {
		return certificateIssuedByArchitect;
	}

	public void setCertificateIssuedByArchitect(Document certificateIssuedByArchitect) {
		this.certificateIssuedByArchitect = certificateIssuedByArchitect;
	}

	public List<ConstructionCostDetails> getConstructionCostList() {
		return constructionCostList;
	}

	public void setConstructionCostList(List<ConstructionCostDetails> constructionCostList) {
		this.constructionCostList = constructionCostList;
	}
	
	

}
