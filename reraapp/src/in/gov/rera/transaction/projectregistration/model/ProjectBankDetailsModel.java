package in.gov.rera.transaction.projectregistration.model;

import in.gov.rera.master.bank.model.BankModel;
import in.gov.rera.master.district.model.DistrictModel;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity(name = "ProjectBankDetailsModel")
@Table(name = "TL_PROJECT_BANK_DETAILS")
public class ProjectBankDetailsModel {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "PROJECT_BANK_DELS_ID")
	private Long projectBankDelsId;
	
	
	@Column(name = "BANK_CODE",length=50)
	private String bankCode;
	
	
	@Column(name = "BANK_NAME",length=50)
	private String bankName;
	
	
	@Column(name = "BANK_BRANCH",length=500)
	private String bankBranch;
	
	
	@Column(name = "IFSC_CODE",length=50)
	private String ifscCode;
	
	
	@Column(name = "ACCOUNT_NO",length=50)
	private String accountNumber;
	
	

	@ManyToOne
	@JoinColumn(name="BANK_ID")
	private BankModel bankModel;
	
	
	@ManyToOne
	@JoinColumn(name="DISTRICT_ID")
	private DistrictModel districtModel;

	
	public Long getProjectBankDelsId() {
		return projectBankDelsId;
	}

	public void setProjectBankDelsId(Long projectBankDelsId) {
		this.projectBankDelsId = projectBankDelsId;
	}

	public String getBankCode() {
		return bankCode;
	}

	public void setBankCode(String bankCode) {
		this.bankCode = bankCode;
	}

	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	public String getBankBranch() {
		return bankBranch;
	}

	public void setBankBranch(String bankBranch) {
		this.bankBranch = bankBranch;
	}

	public String getIfscCode() {
		return ifscCode;
	}

	public void setIfscCode(String ifscCode) {
		this.ifscCode = ifscCode;
	}

	public DistrictModel getDistrictModel() {
		return districtModel;
	}

	public void setDistrictModel(DistrictModel districtModel) {
		this.districtModel = districtModel;
	}

	public String getAccountNumber() {
		return accountNumber;
	}

	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}

	public BankModel getBankModel() {
		return bankModel;
	}

	public void setBankModel(BankModel bankModel) {
		this.bankModel = bankModel;
	}
	
	
	
	
	
}
