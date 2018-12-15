package in.gov.rera.transaction.postregistration.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import in.gov.rera.dms.beans.Document;

@Entity
@Table(name = "TL_CONSTRUCTION_COST_DETAILS")
public class ConstructionCostDetails {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "CONSTRUCTION_COST_DELS_ID")
	private Long constructionCostDetailsId;

	@Column(name = "EST_CONSTR_COST_BY_ENGG")
	private Long estConstrCostByEngg;

	@Column(name = "EST_ON_SITE_EXPENDITURE_SALARIES_OF_WORKERS")
	private Long estOnSiteExpenditureSalariesOfWorkers;

	@Column(name = "EST_ON_SITE_EXPENDITURE_CONSULTANT_FEES")
	private Long estOnSiteExpenditureConsultantsFees;

	@Column(name = "EST_ON_SITE_EXPENDITURE_SIDE_OVERHEAD")
	private Long estOnSiteExpenditureSideOverhead;

	@Column(name = "EST_ON_SITE_EXPENDITURE_COST_OF_SERVICES")
	private Long estOnSiteExpenditureCostOfServices;

	@Column(name = "EST_TAX")
	private Long estTax;

	@Column(name = "EST_CESS")
	private Long estCess;

	@Column(name = "EST_FEES")
	private Long estFees;

	@Column(name = "EST_CHARGES")
	private Long estCharges;


	@Column(name = "EST_PREMIUMS")
	private Long estPremiums;

	@Column(name = "EST_PAYABLE_AMT_TO_FIN_INSTITUTE_SCHEDULLED_BANK")
	private Long estPayableAmtToFinacialInstiteScheduledBanks; // amt+interest

	@Column(name = "EST_PAYABLE_AMT_TO_FIN_INSTITUTE_NBFC")
	private Long estPayableAmtToFinacialInstiteNBFC; // amt+interest

	@Column(name = "EST_PAYABLE_AMT_TO_FIN_INSTITUTE_MONEY_LANDERS")
	private Long estPayableAmtToFinacialInstiteMoneyLenders; // amt+interest

	
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
