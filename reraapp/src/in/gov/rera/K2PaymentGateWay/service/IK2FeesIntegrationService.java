package in.gov.rera.K2PaymentGateWay.service;

public interface IK2FeesIntegrationService {

	String invokeK2PaymentGateway(String promoterName, String amount, String paymentToken, String paymentType) throws Exception;

}