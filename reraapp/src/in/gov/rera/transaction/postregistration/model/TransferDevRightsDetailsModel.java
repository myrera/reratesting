package in.gov.rera.transaction.postregistration.model;

import java.util.List;
import java.util.Set;

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


@Entity(name = "TransferDevRightsDetailsModel")
@Table(name = "TL_TRANSFER_DEVLP_RIGHTS")
public class TransferDevRightsDetailsModel {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "TRANSFER_DEV_REG_ID")
	private Long transferDevRightsId;
	
	
	//2. Transfer of Development Rights (TDR)
	@Column(name = "IS_TDR_APPLICABLE")
	private String isTdrApplicable;

	@Column(name = "TDR_SANCTIONING_AREA")
	private Long tdrSanctionArea;
	
	@Column(name = "FAR_SANCTIONED_AMT")
	private Long  farSanctioned;

	@Column(name = "TDR_SANCTIONING_AUTHORITY")
	private String tdrSanctioningAuthority;

	@Column(name = "TDR_PURCHASE_AMT")
	private Long  tdrPurchaseAmt;
	
	@OneToOne
	@JoinColumn(name = "TDR_PURCHASE_OR_SALES_DOC_ID")
	private Document tdrPurchaseOrSaleDoc;
	
	@OneToMany(cascade = CascadeType.ALL,fetch=FetchType.LAZY)
	private List<AmountWithdrawlBankDetailsModel> amountWithdrawlBankDetailsModel;

	public Long getTransferDevRightsId() {
		return transferDevRightsId;
	}


	public Long getTdrSanctionArea() {
		return tdrSanctionArea;
	}

	public String getTdrSanctioningAuthority() {
		return tdrSanctioningAuthority;
	}

	public Long getTdrPurchaseAmt() {
		return tdrPurchaseAmt;
	}

	public Document getTdrPurchaseOrSaleDoc() {
		return tdrPurchaseOrSaleDoc;
	}

	public void setTransferDevRightsId(Long transferDevRightsId) {
		this.transferDevRightsId = transferDevRightsId;
	}

	

	public void setTdrSanctionArea(Long tdrSanctionArea) {
		this.tdrSanctionArea = tdrSanctionArea;
	}

	public void setTdrSanctioningAuthority(String tdrSanctioningAuthority) {
		this.tdrSanctioningAuthority = tdrSanctioningAuthority;
	}

	public void setTdrPurchaseAmt(Long tdrPurchaseAmt) {
		this.tdrPurchaseAmt = tdrPurchaseAmt;
	}

	public void setTdrPurchaseOrSaleDoc(Document tdrPurchaseOrSaleDoc) {
		this.tdrPurchaseOrSaleDoc = tdrPurchaseOrSaleDoc;
	}


	public String getIsTdrApplicable() {
		return isTdrApplicable;
	}


	public void setIsTdrApplicable(String isTdrApplicable) {
		this.isTdrApplicable = isTdrApplicable;
	}


	public List<AmountWithdrawlBankDetailsModel> getAmountWithdrawlBankDetailsModel() {
		return amountWithdrawlBankDetailsModel;
	}


	public void setAmountWithdrawlBankDetailsModel(List<AmountWithdrawlBankDetailsModel> amountWithdrawlBankDetailsModel) {
		this.amountWithdrawlBankDetailsModel = amountWithdrawlBankDetailsModel;
	}


	public Long getFarSanctioned() {
		return farSanctioned;
	}


	public void setFarSanctioned(Long farSanctioned) {
		this.farSanctioned = farSanctioned;
	}
	
	
	
	
	
	

}
