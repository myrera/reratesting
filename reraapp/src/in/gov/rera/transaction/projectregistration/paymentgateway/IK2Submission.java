package in.gov.rera.transaction.projectregistration.paymentgateway;

public interface IK2Submission {
	
	String invokeK2PaymentGateway(String promoterNmae,String amount) throws Exception;

}
