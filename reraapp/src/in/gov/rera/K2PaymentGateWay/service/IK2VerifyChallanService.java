package in.gov.rera.K2PaymentGateWay.service;

import java.util.Map;

public interface IK2VerifyChallanService {

	Map<String, String> verifyChallan(String challanRefNum) throws Exception;

}
