package in.gov.rera.transaction.postregistration.plots.dao.impl;

import org.springframework.stereotype.Repository;

import in.gov.rera.common.dao.impl.GenericDAOImpl;
import in.gov.rera.transaction.postregistration.plots.dao.IPlotAmountWithdrawdBankDetlsDAO;
import in.gov.rera.transaction.postregistration.plots.model.PlotsAmountWithdrawlBankDetailsModel;;

@Repository(value = "PlotAmountWithdrawdBankDetlsDAO")
public class PlotAmountWithdrawdBankDetlsDaoImpl extends GenericDAOImpl<PlotsAmountWithdrawlBankDetailsModel, Long>
implements IPlotAmountWithdrawdBankDetlsDAO<PlotsAmountWithdrawlBankDetailsModel, Long>{

	@Override
	public PlotsAmountWithdrawlBankDetailsModel getAmountWithdrawdBankDetlsModelById(Long pk) {
		return super.getEntity(pk);
	}
	
	@Override
	public void saveOrUpdate(PlotsAmountWithdrawlBankDetailsModel e) {
		super.updateOrUpdateEntity(e);
	}
	
}
