package in.gov.rera.master.bank.service.impl;

import java.util.List;

import in.gov.rera.master.bank.dao.IBankDAO;
import in.gov.rera.master.bank.model.BankModel;
import in.gov.rera.master.bank.service.IBankService;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service(value="bankService")
public class BankServiceImpl<E,PK> implements IBankService<BankModel ,Long> {

	
	@Autowired
	IBankDAO <BankModel ,Long>bankDAO;

	@Override
	public List<BankModel> getBankList() throws Exception {
		DetachedCriteria dt =DetachedCriteria.forClass(BankModel.class);
		return bankDAO.getBankList(dt);
	}

	@Override
	public BankModel getBankById(Long id) throws Exception {
		// TODO Auto-generated method stub
		return bankDAO.getBankById(id);
	}
	
	
	
	
}
