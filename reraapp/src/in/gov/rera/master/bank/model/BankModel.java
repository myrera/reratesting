package in.gov.rera.master.bank.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity(name = "BankModel")
@Table(name = "TM_BANK")
public class BankModel implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 17687687L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "BANK_ID")
	private Long bankId;

	@Column(name = "BANK_CODE")
	private String bankCode;
	
	@Column(name = "BANK_NAME")
    private String bankName;

	public Long getBankId() {
		return bankId;
	}

	public void setBankId(Long bankId) {
		this.bankId = bankId;
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
	
}
