package in.gov.rera.transaction.projectregistration.model;

import in.gov.rera.dms.beans.Document;
import in.gov.rera.master.bank.model.BankModel;
import in.gov.rera.transaction.thirdparty.OnlineTransactionModel;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;


@Entity(name = "ProjectPaymentDetailsModel")
@Table(name = "Tl_PROJECT_PAYMENT_DETAILS")
public class ProjectPaymentDetailsModel {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "PROJECT_PAYMENT_DELS_ID")
	private Long paymentId;
	
	@Column(name = "PROJECT_PAYMENT_MODE")
	private String paymentMode;
	
	@Column(name = "PROJECT_PAYMENT_AMOUNT")
	private Double amount;
	
	@Column(name = "PROJECT_PAYMENT_CHEQUE_DD_NO")
	private String ddChequeNo;
	
	@Column(name = "BRANCH_NAME",length=500)
	private String branchName;
		
	@ManyToOne
	@JoinColumn(name="BANK_ID")
	private BankModel bankModel;
		
	@ManyToOne
	@JoinColumn(name="ATTACH_SCAN_COPY_DOC_ID")
	private Document scanCopyDoc;

	@OneToOne
	@JoinColumn(name="ONLINE_TRXID")
	private OnlineTransactionModel online;
	
	@Column(name = "PAYMENT_TOKEN")
	private String paymentToken;
	
	@Column(name = "SBI_TRX_REF_NO")
	private String sbiTransactionRefNo;
	
	@Column(name = "PENALTY_PAID_STATUS")
	private String penaltyPaid;
	
	@Column(name = "PENALTY_AMT")
	private String penaltyAmt;
	
	@Column(name = "ISPAYMENT_VERIFIED")
	private String isPaymentVerified;
	

	
	public String getIsPaymentVerified() {
		return isPaymentVerified;
	}


	public void setIsPaymentVerified(String isPaymentVerified) {
		this.isPaymentVerified = isPaymentVerified;
	}


	public String getPenaltyPaid() {
		return penaltyPaid;
	}


	public void setPenaltyPaid(String penaltyPaid) {
		this.penaltyPaid = penaltyPaid;
	}


	public String getPenaltyAmt() {
		return penaltyAmt;
	}


	public void setPenaltyAmt(String penaltyAmt) {
		this.penaltyAmt = penaltyAmt;
	}


	public Document getPenaltyPaidReceipt() {
		return penaltyPaidReceipt;
	}


	public void setPenaltyPaidReceipt(Document penaltyPaidReceipt) {
		this.penaltyPaidReceipt = penaltyPaidReceipt;
	}


	@ManyToOne
	@JoinColumn(name = "PENALTY_PAID_RECPT")
	private Document  penaltyPaidReceipt;
	
	
	public String getPaymentToken() {
		return paymentToken;
	}


	public void setPaymentToken(String paymentToken) {
		this.paymentToken = paymentToken;
	}


	public String getSbiTransactionRefNo() {
		return sbiTransactionRefNo;
	}


	public void setSbiTransactionRefNo(String sbiTransactionRefNo) {
		this.sbiTransactionRefNo = sbiTransactionRefNo;
	}


	public OnlineTransactionModel getOnline() {
		return online;
	}


	public void setOnline(OnlineTransactionModel online) {
		this.online = online;
	}


	public BankModel getBankModel() {
		return bankModel;
	}


	public void setBankModel(BankModel bankModel) {
		this.bankModel = bankModel;
	}


	public String getPaymentMode() {
		return paymentMode;
	}


	public void setPaymentMode(String paymentMode) {
		this.paymentMode = paymentMode;
	}


	


	/**
	 * @return the amount
	 */
	public Double getAmount() {
		return amount;
	}


	/**
	 * @param amount the amount to set
	 */
	public void setAmount(Double amount) {
		this.amount = amount;
	}


	public String getBranchName() {
		return branchName;
	}


	public Long getPaymentId() {
		return paymentId;
	}


	public void setPaymentId(Long paymentId) {
		this.paymentId = paymentId;
	}


	public void setBranchName(String branchName) {
		this.branchName = branchName;
	}


	public String getDdChequeNo() {
		return ddChequeNo;
	}


	public void setDdChequeNo(String ddChequeNo) {
		this.ddChequeNo = ddChequeNo;
	}


	public Document getScanCopyDoc() {
		return scanCopyDoc;
	}


	public void setScanCopyDoc(Document scanCopyDoc) {
		this.scanCopyDoc = scanCopyDoc;
	}
}
