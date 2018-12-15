package in.gov.rera.master.bank.dao;

import in.gov.rera.master.bank.model.BankModel;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

public interface IBankDAO <E,PK>{

	List<BankModel>getBankList(DetachedCriteria dt) throws Exception;
	E getBankById(PK id);
	
}
