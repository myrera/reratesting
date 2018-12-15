package in.gov.rera.transaction.postregistration.plots.dao;

import in.gov.rera.transaction.postregistration.plots.model.PlotsAmountWithdrawlBankDetailsModel;

public interface IPlotAmountWithdrawdBankDetlsDAO<E ,PK> {
	
	 E getAmountWithdrawdBankDetlsModelById(PK pk);
	void saveOrUpdate(PlotsAmountWithdrawlBankDetailsModel e);
}
