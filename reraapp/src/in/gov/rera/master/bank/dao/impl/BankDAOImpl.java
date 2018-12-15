package in.gov.rera.master.bank.dao.impl;

import in.gov.rera.common.dao.impl.GenericDAOImpl;
import in.gov.rera.master.bank.dao.IBankDAO;
import in.gov.rera.master.bank.model.BankModel;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.stereotype.Repository;

@Repository(value="bankDAO")

public class BankDAOImpl <E,PK>extends  GenericDAOImpl<BankModel,Long> implements IBankDAO <BankModel,Long>{

	@Override
	public List<BankModel> getBankList(DetachedCriteria dt) throws Exception {
		return super.getList(dt);
	}

	@Override
	public BankModel getBankById(Long id) {
		
		return super.findOne(id);
	}

}
