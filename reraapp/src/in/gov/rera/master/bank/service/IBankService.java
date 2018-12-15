package in.gov.rera.master.bank.service;

import in.gov.rera.master.bank.model.BankModel;

import java.util.List;

public interface IBankService <E,PK>{

	 List<BankModel>getBankList() throws Exception;
	 
	 E getBankById(PK id)  throws Exception;
	 
}
