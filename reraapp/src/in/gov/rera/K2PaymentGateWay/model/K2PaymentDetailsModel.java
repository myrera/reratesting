package in.gov.rera.K2PaymentGateWay.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity(name = "K2PaymentDetailsModel")
@Table(name = "TL_K2_PAYMENT_DETAILS")
public class K2PaymentDetailsModel {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "K2_PAYMENT_DELS_ID")
	private Long paymentId;
	
	@Column(name = "PAYMENT_DONE_BY")
	private String paymentDoneBy;
	
	@Column(name = "K2_PAYMENT_TYPE")
	private String paymentType;
	
	@Column(name = "K2_PAYMENT_AMOUNT")
	private String amount;
	
	@Column(name = "PENALTY_APPLICABLE")
	private String penaltyApplicable;
	
	@Column(name = "K2_REFERENCE_NO")
	private String k2ReferenceNumber;
	
	@Column(name = "PAYMENT_TOKEN")
	private String paymentToken;
	
	@Column(name = "PAYMENT_INITIATED_DATE")
	private Date paymentDate;
	
	@Column(name = "PAYMENT_STATUS")
	private String paymentStatus;
	
	@Column(name = "BANK_TRANSACTION_NO")
	private String bankTransactionNumber;
	
	@Column(name = "BANK_NAME")
	private String bankName;
	
	@Column(name = "PAYMENT_STATUS_CODE")
	private String paymentStatusCode;
	
	@Column(name = "PAYMENT_MODE")
	private String paymentMode;
	
	@Column(name = "TRANSACTION_TIME")
	private String transactionTime;
	
	public String getPenaltyApplicable() {
		return penaltyApplicable;
	}

	public void setPenaltyApplicable(String penaltyApplicable) {
		this.penaltyApplicable = penaltyApplicable;
	}

	public Long getPaymentId() {
		return paymentId;
	}

	public void setPaymentId(Long paymentId) {
		this.paymentId = paymentId;
	}

	public String getPaymentDoneBy() {
		return paymentDoneBy;
	}

	public void setPaymentDoneBy(String paymentDoneBy) {
		this.paymentDoneBy = paymentDoneBy;
	}

	public String getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	public String getK2ReferenceNumber() {
		return k2ReferenceNumber;
	}

	public void setK2ReferenceNumber(String k2ReferenceNumber) {
		this.k2ReferenceNumber = k2ReferenceNumber;
	}

	public String getPaymentToken() {
		return paymentToken;
	}

	public void setPaymentToken(String paymentToken) {
		this.paymentToken = paymentToken;
	}

	public Date getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(Date paymentDate) {
		this.paymentDate = paymentDate;
	}

	public String getPaymentStatus() {
		return paymentStatus;
	}

	public void setPaymentStatus(String paymentStatus) {
		this.paymentStatus = paymentStatus;
	}

	public String getBankTransactionNumber() {
		return bankTransactionNumber;
	}

	public void setBankTransactionNumber(String bankTransactionNumber) {
		this.bankTransactionNumber = bankTransactionNumber;
	}

	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankNamer) {
		this.bankName = bankNamer;
	}

	public String getPaymentStatusCode() {
		return paymentStatusCode;
	}

	public void setPaymentStatusCode(String paymentStatusCode) {
		this.paymentStatusCode = paymentStatusCode;
	}

	public String getPaymentMode() {
		return paymentMode;
	}

	public void setPaymentMode(String paymentMode) {
		this.paymentMode = paymentMode;
	}

	public String getTransactionTime() {
		return transactionTime;
	}

	public void setTransactionTime(String transactionTime) {
		this.transactionTime = transactionTime;
	}

	@Override
	public String toString() {
		return "K2PaymentDetailsModel [paymentId=" + paymentId + ", paymentDoneBy=" + paymentDoneBy + ", paymentType="
				+ paymentType + ", amount=" + amount + ", k2ReferenceNumber=" + k2ReferenceNumber + ", paymentToken="
				+ paymentToken + ", paymentDate=" + paymentDate + ", paymentStatus=" + paymentStatus
				+ ", bankTransactionNumber=" + bankTransactionNumber + ", bankName=" + bankName + ", paymentStatusCode="
				+ paymentStatusCode + ", paymentMode=" + paymentMode + ", transactionTime=" + transactionTime + "]";
	}
}
