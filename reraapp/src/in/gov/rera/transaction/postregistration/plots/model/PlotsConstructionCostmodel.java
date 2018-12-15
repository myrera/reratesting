package in.gov.rera.transaction.postregistration.plots.model;

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
@Table(name = "TL_PLOTS_CONS_COST_MODEL")
public class PlotsConstructionCostmodel {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "PLOTS_CONSTRUCTION_COST_MODEL_ID")
	private Long plotsConstructionCostModelId;

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
	private List<PlotsConstructionCostDetails> plotsConstructionCostList;

	public Long getPlotsConstructionCostModelId() {
		return plotsConstructionCostModelId;
	}

	public void setPlotsConstructionCostModelId(Long plotsConstructionCostModelId) {
		this.plotsConstructionCostModelId = plotsConstructionCostModelId;
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

	public List<PlotsConstructionCostDetails> getPlotsConstructionCostList() {
		return plotsConstructionCostList;
	}

	public void setPlotsConstructionCostList(List<PlotsConstructionCostDetails> plotsConstructionCostList) {
		this.plotsConstructionCostList = plotsConstructionCostList;
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

	

}
