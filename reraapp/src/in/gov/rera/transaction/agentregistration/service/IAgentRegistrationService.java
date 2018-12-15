package in.gov.rera.transaction.agentregistration.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import in.gov.rera.common.model.UserModel;
import in.gov.rera.dms.beans.Document;
import in.gov.rera.transaction.agentregistration.model.AgentRegistrationModel;

public interface IAgentRegistrationService <E ,PK> {
   Long createAgentRegistration(E enitity);
   
   PK editAgentRegistration(E enitity);
    E getAgentRegByPk(PK l)throws Exception;

    E saveOrUpdateAgentPhotoDoc(MultipartFile file1,MultipartFile file2, AgentRegistrationModel agentBaseModel)throws Exception;

	E saveAgentPayment(MultipartFile multipartFile,E e) throws Exception;
	E saveOrUpdateAgentDoc(E E,MultipartFile multipartFile1,MultipartFile multipartFile2) throws Exception;
	E getSavedAgentByEmailId(String emailId);
	
	Document saveDocument(MultipartFile file,AgentRegistrationModel baseObj) throws Exception;
	Document updateDocument(MultipartFile file,Document baseObj) throws Exception;
	
	E getAgentByPanNo(String panNo) throws Exception;

	List<E> returnedAgentProjects(String pendingOprator, UserModel user);

	String generateAgentNo(AgentRegistrationModel model);

	String generateAckNo(AgentRegistrationModel model);

	Integer getTotalAgentCount();

	

	Integer getApprovedAgentCount();

	boolean checkAgentACKNumberExists(String sequence);

	boolean checkAgentPRNNumberExists(String sequence);

	AgentRegistrationModel getSavedAgentByPaymentToken(String paymentToken);

	
	
	
    
}
