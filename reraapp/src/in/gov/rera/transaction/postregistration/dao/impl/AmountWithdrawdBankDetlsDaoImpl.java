

package in.gov.rera.transaction.postregistration.dao.impl;

import org.springframework.stereotype.Repository;

import in.gov.rera.common.dao.impl.GenericDAOImpl;
import in.gov.rera.transaction.postregistration.dao.IAmountWithdrawdBankDetlsDAO;
import in.gov.rera.transaction.postregistration.model.AmountWithdrawlBankDetailsModel;;

@Repository(value = "AmountWithdrawdBankDetlsDAO")
public class AmountWithdrawdBankDetlsDaoImpl extends GenericDAOImpl<AmountWithdrawlBankDetailsModel, Long>
implements IAmountWithdrawdBankDetlsDAO<AmountWithdrawlBankDetailsModel, Long>{


	@Override
	public AmountWithdrawlBankDetailsModel getAmountWithdrawdBankDetlsModelById(Long pk) {
		// TODO Auto-generated method stub
		return super.getEntity(pk);
	}
	
	
	@Override
	public void saveOrUpdate(AmountWithdrawlBankDetailsModel e) {
		super.updateOrUpdateEntity(e);
		
	}
	
}
