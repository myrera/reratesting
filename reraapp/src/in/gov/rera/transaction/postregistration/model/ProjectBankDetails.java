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
@Table(name="TL_PROJECT_BANK_DETLS")
public class ProjectBankDetails {
	
@Id
@GeneratedValue(strategy = GenerationType.AUTO)
@Column(name = "PROJECT_BANK_DETLS_ID")
private Long projectBankDetailsId;

@Column(name = "PROJECT_COMPLETION_PERCENTAGE")
private Long percentageOfProjectCompletion;

@Column(name = "TOT_ADVANCE_AMT")
private Long totAdvanceAmt;


@Column(name = "AMT_WITHDRAWN_FROM_BANK")
private Long amtWithdrawnFromBank;

@OneToOne
@JoinColumn(name = "CERT_FROM_CA_ACC_ID")
private Document certFromChartedAcc;

@OneToOne
@JoinColumn(name = "CERT_ISSUED_BY_STRUCTURAL_ENG_ID")
private Document  certificateIssuedByStructuralEng;

@OneToOne
@JoinColumn(name = "CERT_ISSUED_BY_ARCHITECT_ID")
private Document  certificateIssuedByArchitect;

@OneToOne
@JoinColumn(name = "QUARTERLY_FIN_REPORT_ID")
private Document  financialReport;

@OneToOne
@JoinColumn(name = "ANNUAL_FIN_REPORT_ID")
private Document  annualfinancialReport;


public Document getFinancialReport() {
	return financialReport;
}

public void setFinancialReport(Document financialReport) {
	this.financialReport = financialReport;
}

public Long getProjectBankDetailsId() {
	return projectBankDetailsId;
}

public void setProjectBankDetailsId(Long projectBankDetailsId) {
	this.projectBankDetailsId = projectBankDetailsId;
}

public Long getPercentageOfProjectCompletion() {
	return percentageOfProjectCompletion;
}

public void setPercentageOfProjectCompletion(Long percentageOfProjectCompletion) {
	this.percentageOfProjectCompletion = percentageOfProjectCompletion;
}

public Long getTotAdvanceAmt() {
	return totAdvanceAmt;
}

public void setTotAdvanceAmt(Long totAdvanceAmt) {
	this.totAdvanceAmt = totAdvanceAmt;
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

public Long getAmtWithdrawnFromBank() {
	return amtWithdrawnFromBank;
}

public void setAmtWithdrawnFromBank(Long amtWithdrawnFromBank) {
	this.amtWithdrawnFromBank = amtWithdrawnFromBank;
}

public Document getAnnualfinancialReport() {
	return annualfinancialReport;
}

public void setAnnualfinancialReport(Document annualfinancialReport) {
	this.annualfinancialReport = annualfinancialReport;
}




}

