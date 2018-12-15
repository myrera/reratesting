package in.gov.rera.transaction.complaint.service;

import org.springframework.web.multipart.MultipartFile;

import in.gov.rera.transaction.complaint.model.ComplaintModel;
import in.gov.rera.transaction.projectregistration.model.ProjectRegistrationModel;

public interface IComplaintService <E,PK>{
	PK saveComplaint(E e,MultipartFile[] multipartFile,String[] captions,MultipartFile attachScanCopy) throws Exception;
	E updateComplaint(E e) throws Exception;
	E findComplaintById(PK pk)throws Exception;
	E getComplaintRegByPk(PK l)throws Exception;

	PK editComplaintRegistration(E enitity);

	ComplaintModel getComplaintsByAppNo(String complaintAppNo);
	ComplaintModel getSavedComplaintsByPaymentToken(String paymentToken);


}
