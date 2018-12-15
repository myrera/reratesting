package in.gov.rera.transaction.postregistration.plots.model;

import java.util.Calendar;

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



@Entity(name = "PlotsAmountWithdrawlBankDetailsModel" )
@Table(name = "TL_Plot_WITHDRAWL_DELS")
public class PlotsAmountWithdrawlBankDetailsModel {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "AMT_WITHDRAW_BANK_DELS_ID")
	private Long amtwithdrawBankDelsId;
	

	//3. Approval Costs 
	@Column(name = "AMOUNT")
	private Long amount ;
	
	@Column(name = "AMT_WITHDRAWN_DATE")
	@Temporal(TemporalType.DATE) //drops the time value and only preserves the date.
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	private Calendar amtWithDrawnDate;
	
	@OneToOne
	@JoinColumn(name = "CERT_FROM_CA_ACC_ID")
	private Document certFromChartedAcc;
	
	

	public Document getCertFromChartedAcc() {
		return certFromChartedAcc;
	}

	public void setCertFromChartedAcc(Document certFromChartedAcc) {
		this.certFromChartedAcc = certFromChartedAcc;
	}

	public Long getAmtwithdrawBankDelsId() {
		return amtwithdrawBankDelsId;
	}


	public void setAmtwithdrawBankDelsid(Long amtwithdrawBankDelsId) {
		this.amtwithdrawBankDelsId = amtwithdrawBankDelsId;
	}



	public Long getAmount() {
		return amount;
	}

	public void setAmount(Long amount) {
		this.amount = amount;
	}

	public Calendar getAmtWithDrawnDate() {
		return amtWithDrawnDate;
	}

	public void setAmtWithDrawnDate(Calendar amtWithDrawnDate) {
		this.amtWithDrawnDate = amtWithDrawnDate;
	}

	
	
	
	
	
	
}
