package in.gov.rera.transaction.postregistration.plots.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="TL_PLOT_CONS_COST_DETAILS")
public class PlotsConstructionCostDetails {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "PLOTS_CONSTRUCTION_COST_DELS_ID")
	private Long constructionCostDetailsId;

	@Column(name = "EST_CONSTR_COST_BY_ENGG")
	private Long estConstrCostByEngg;
	
	@Column(name = "EST_OUTGOING_PAYMENT")
	private Long outgoingpayment;

	@Column(name = "EST_ONSITE_EXPENDITURE_SALARIES_OF_WORKERS")
	private Long estOnSiteExpenditureSalariesOfWorkers;

	@Column(name = "EST_ONSITE_EXPENDITURE_CONSULTANTS_FEES")
	private Long estOnSiteExpenditureConsultantsFees;



	@Column(name = "EST_ONSITE_EXPENDITURE_SITE_OVERHEAD")
	private Long estOnSiteExpenditureSideOverhead;


	@Column(name = "EST_ONSITE_EXPENDITURE_COST_SERVICES")
	private Long estOnSiteExpenditureCostOfServices;


	@Column(name = "EST_TAX")
	private Long estTax;


	@Column(name = "EST_CESS")
	private Long estCess;


	@Column(name = "EST_FESS")
	private Long estFees;


	@Column(name = "EST_CHARGES")
	private Long estCharges;


	@Column(name = "EST_PREMIUMS")
	private Long estPremiums;


	@Column(name = "EST_PAYABLE_AMT_FIN_INSTITUTE_SCHEDULE_BANKS")
	private Long estPayableAmtToFinacialInstiteScheduledBanks;


	@Column(name = "EST_PAYABLE_AMT_FIN_INSTITUTE_NBFC")
	private Long estPayableAmtToFinacialInstiteNBFC;


	@Column(name = "EST_PAYABLE_AMT_FIN_INSTITUTE_MONEYLENDERS")
	private Long estPayableAmtToFinacialInstiteMoneyLenders;

	@Column(name = "EST_TOT_CONSTRUCTION_COST")
	private Long estTotConstructionCost;

	@Column(name = "ACT_TOT_CONSTRUCTION_COST")
	private Long actTotConstructionCost;
	
	@Column(name = "Is_APPLICABLE")
	private String isApplicable;
	
	@Column(name = "CONS_COST_PARTICULARS")
	private String consCostParticular;
	
	@Column(name = "EST_CONS_COST")
	private Long estConsCost;

	public Long getConstructionCostDetailsId() {
		return constructionCostDetailsId;
	}

	public void setConstructionCostDetailsId(Long constructionCostDetailsId) {
		this.constructionCostDetailsId = constructionCostDetailsId;
	}

	public Long getEstConstrCostByEngg() {
		return estConstrCostByEngg;
	}

	public void setEstConstrCostByEngg(Long estConstrCostByEngg) {
		this.estConstrCostByEngg = estConstrCostByEngg;
	}


	public Long getEstOnSiteExpenditureSalariesOfWorkers() {
		return estOnSiteExpenditureSalariesOfWorkers;
	}

	public void setEstOnSiteExpenditureSalariesOfWorkers(Long estOnSiteExpenditureSalariesOfWorkers) {
		this.estOnSiteExpenditureSalariesOfWorkers = estOnSiteExpenditureSalariesOfWorkers;
	}


	public Long getEstOnSiteExpenditureConsultantsFees() {
		return estOnSiteExpenditureConsultantsFees;
	}

	public void setEstOnSiteExpenditureConsultantsFees(Long estOnSiteExpenditureConsultantsFees) {
		this.estOnSiteExpenditureConsultantsFees = estOnSiteExpenditureConsultantsFees;
	}


	public Long getEstOnSiteExpenditureSideOverhead() {
		return estOnSiteExpenditureSideOverhead;
	}

	public void setEstOnSiteExpenditureSideOverhead(Long estOnSiteExpenditureSideOverhead) {
		this.estOnSiteExpenditureSideOverhead = estOnSiteExpenditureSideOverhead;
	}


	public Long getEstOnSiteExpenditureCostOfServices() {
		return estOnSiteExpenditureCostOfServices;
	}

	public void setEstOnSiteExpenditureCostOfServices(Long estOnSiteExpenditureCostOfServices) {
		this.estOnSiteExpenditureCostOfServices = estOnSiteExpenditureCostOfServices;
	}


	public Long getEstTax() {
		return estTax;
	}

	public void setEstTax(Long estTax) {
		this.estTax = estTax;
	}


	public Long getEstCess() {
		return estCess;
	}

	public void setEstCess(Long estCess) {
		this.estCess = estCess;
	}


	public Long getEstFees() {
		return estFees;
	}

	public void setEstFees(Long estFees) {
		this.estFees = estFees;
	}


	public Long getEstCharges() {
		return estCharges;
	}

	public void setEstCharges(Long estCharges) {
		this.estCharges = estCharges;
	}


	public Long getEstPremiums() {
		return estPremiums;
	}

	public void setEstPremiums(Long estPremiums) {
		this.estPremiums = estPremiums;
	}


	public Long getEstPayableAmtToFinacialInstiteScheduledBanks() {
		return estPayableAmtToFinacialInstiteScheduledBanks;
	}

	public void setEstPayableAmtToFinacialInstiteScheduledBanks(Long estPayableAmtToFinacialInstiteScheduledBanks) {
		this.estPayableAmtToFinacialInstiteScheduledBanks = estPayableAmtToFinacialInstiteScheduledBanks;
	}


	public Long getEstPayableAmtToFinacialInstiteNBFC() {
		return estPayableAmtToFinacialInstiteNBFC;
	}

	public void setEstPayableAmtToFinacialInstiteNBFC(Long estPayableAmtToFinacialInstiteNBFC) {
		this.estPayableAmtToFinacialInstiteNBFC = estPayableAmtToFinacialInstiteNBFC;
	}


	public Long getEstPayableAmtToFinacialInstiteMoneyLenders() {
		return estPayableAmtToFinacialInstiteMoneyLenders;
	}

	public void setEstPayableAmtToFinacialInstiteMoneyLenders(Long estPayableAmtToFinacialInstiteMoneyLenders) {
		this.estPayableAmtToFinacialInstiteMoneyLenders = estPayableAmtToFinacialInstiteMoneyLenders;
	}


	public Long getEstTotConstructionCost() {
		return estTotConstructionCost;
	}

	public void setEstTotConstructionCost(Long estTotConstructionCost) {
		this.estTotConstructionCost = estTotConstructionCost;
	}

	public Long getActTotConstructionCost() {
		return actTotConstructionCost;
	}

	public void setActTotConstructionCost(Long actTotConstructionCost) {
		this.actTotConstructionCost = actTotConstructionCost;
	}

	public Long getOutgoingpayment() {
		return outgoingpayment;
	}

	public void setOutgoingpayment(Long outgoingpayment) {
		this.outgoingpayment = outgoingpayment;
	}

	public String getIsApplicable() {
		return isApplicable;
	}

	public void setIsApplicable(String isApplicable) {
		this.isApplicable = isApplicable;
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
	
	
	
}



