

package in.gov.rera.transaction.postregistration.dao;

import in.gov.rera.transaction.postregistration.model.AmountWithdrawlBankDetailsModel;

public interface IAmountWithdrawdBankDetlsDAO<E ,PK> {
	
	 E getAmountWithdrawdBankDetlsModelById(PK pk);
	void saveOrUpdate(AmountWithdrawlBankDetailsModel e);
}
