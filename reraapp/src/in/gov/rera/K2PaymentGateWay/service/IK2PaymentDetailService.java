package in.gov.rera.K2PaymentGateWay.service;

import javax.servlet.http.HttpServletRequest;

import in.gov.rera.K2PaymentGateWay.model.K2PaymentDetailsModel;

public interface IK2PaymentDetailService<E ,PK> {
	
	E savePaymentDetails(String promoterName,String amount,String paymentToken,String paymentType,String chalanRefNo);
	
	E updatePaymentDetails(HttpServletRequest request);

	K2PaymentDetailsModel updatePendingPaymentDetails(HttpServletRequest request);

	K2PaymentDetailsModel getPaymentDetailsByK2ChallanRefNo(String chalanRefNo);

}
