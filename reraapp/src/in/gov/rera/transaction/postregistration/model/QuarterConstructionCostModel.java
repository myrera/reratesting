package in.gov.rera.transaction.postregistration.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity(name = "QuarterConstructionCostModel")
@Table(name = "TL_CONSTRUCTION_QUART_DETLS")
public class QuarterConstructionCostModel {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "CONSTRUCTION_COST_DELS_ID")
	private Long constructionCostDetailsId;	
	
	@Column(name = "CONS_COST_PARTICULAR")
	private String consCostParticular;

	@Column(name = " EST_COST")
	private Long estConsCost;

	@Column(name = "ACT_COST")
	private Long actConsCost;

	public Long getConstructionCostDetailsId() {
		return constructionCostDetailsId;
	}

	public void setConstructionCostDetailsId(Long constructionCostDetailsId) {
		this.constructionCostDetailsId = constructionCostDetailsId;
	}

	public String getConsCostParticular() {
		return consCostParticular;
	}

	public void setConsCostParticular(String consCostParticular) {
		this.consCostParticular = consCostParticular;
	}

	public Long getEstConsCost() {
		return estConsCost;
	}

	public void setEstConsCost(Long estConsCost) {
		this.estConsCost = estConsCost;
	}

	public Long getActConsCost() {
		return actConsCost;
	}

	public void setActConsCost(Long actConsCost) {
		this.actConsCost = actConsCost;
	}

	
}
