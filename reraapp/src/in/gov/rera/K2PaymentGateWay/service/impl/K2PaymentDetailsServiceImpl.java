package in.gov.rera.K2PaymentGateWay.service.impl;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import in.gov.rera.K2PaymentGateWay.dao.IK2PaymentDeatailsDAO;
import in.gov.rera.K2PaymentGateWay.model.K2PaymentDetailsModel;
import in.gov.rera.K2PaymentGateWay.service.IK2PaymentDetailService;
import in.gov.rera.common.dao.impl.CommonDao;
import in.gov.rera.transaction.agentregistration.dao.IAgentRegistrationDAO;
import in.gov.rera.transaction.agentregistration.model.AgentRegistrationModel;
import in.gov.rera.transaction.agentregistration.service.IAgentRegistrationService;
import in.gov.rera.transaction.complaint.model.ComplaintModel;
import in.gov.rera.transaction.complaint.service.IComplaintService;
import in.gov.rera.transaction.projectregistration.model.ProjectRegistrationModel;
import in.gov.rera.transaction.projectregistration.service.IProjectRegistrationService;

@Service(value = "K2PaymentDetailsService")
@Scope("request")
public class K2PaymentDetailsServiceImpl implements IK2PaymentDetailService<K2PaymentDetailsModel, Long> {

	@Autowired
	IK2PaymentDeatailsDAO<K2PaymentDetailsModel, Long> K2PaymentDeatailsDAO;

	@Autowired()
	CommonDao<Object, Long> commonDao;

	@Autowired
	IAgentRegistrationService<AgentRegistrationModel,Long> agentRegistrationService;
	
	@Autowired
	IComplaintService <ComplaintModel,Long> complaintService;
	
	@Autowired
	IProjectRegistrationService projectRegistrationService;

	@Autowired
	IAgentRegistrationDAO<AgentRegistrationModel, Long> agentRegistrationDAO;

	@Override
	public K2PaymentDetailsModel savePaymentDetails(String promoterName,String amount,String paymentToken,String paymentType,String chalanRefNo) {
		K2PaymentDetailsModel K2Model=new K2PaymentDetailsModel();
		//K2Model.setPaymentId(1L);
		K2Model.setAmount(amount);
		K2Model.setPaymentToken(paymentToken);
		K2Model.setPaymentDoneBy(promoterName);
		K2Model.setPaymentType(paymentType);
		K2Model.setPaymentStatus("PAYMENT_INITIATED");
		K2Model.setK2ReferenceNumber(chalanRefNo);
		K2Model.setPaymentDate(new Date());
		//System.out.println(K2Model.toString());

		if(paymentType.equals("AGENT_REG")) {
			commonDao.updateObject(K2Model);
			AgentRegistrationModel agentModel=agentRegistrationService.getSavedAgentByPaymentToken(paymentToken);
			agentModel.getAgentDetailsModel().setK2PaymentDetailsModel(K2Model);
			commonDao.updateObject(agentModel);
		}else if(paymentType.equals("PROJECT_REG")) {
			commonDao.updateObject(K2Model);
			ProjectRegistrationModel project=projectRegistrationService.getSavedProjectsByPaymentToken(paymentToken);
			project.getProjectDetailsModel().setK2PaymentDetailsModel(K2Model);
			commonDao.updateObject(project);
		}else if(paymentType.equals("PENALTY")) {
			K2Model.setPenaltyApplicable("YES");
			commonDao.updateObject(K2Model);
			ProjectRegistrationModel project=projectRegistrationService.getSavedProjectsByPaymentToken(paymentToken);
			project.getProjectDetailsModel().setK2PenaltyPaymentDetailsModel(K2Model);
			commonDao.updateObject(project);
		}else {
			commonDao.updateObject(K2Model);
			ComplaintModel complaintModel=complaintService.getSavedComplaintsByPaymentToken(K2Model.getPaymentToken());
			complaintModel.setK2PaymentDetailsModel(K2Model);
			commonDao.updateObject(complaintModel);
		}

		return K2Model;
	}

	@Override
	public K2PaymentDetailsModel getPaymentDetailsByK2ChallanRefNo(String chalanRefNo) {

		DetachedCriteria dt = DetachedCriteria.forClass(K2PaymentDetailsModel.class, "obj");

		dt.add((Restrictions.eq("obj.k2ReferenceNumber", chalanRefNo)));

		List<K2PaymentDetailsModel> list = K2PaymentDeatailsDAO.getPaymentDetailsModel(dt);
		if (list != null && list.size() > 0) {
			return list.get(0);
		} else {
			return null;
		}
	}

	@Override
	public K2PaymentDetailsModel updatePaymentDetails(HttpServletRequest request) {
		K2PaymentDetailsModel K2Model=getPaymentDetailsByK2ChallanRefNo(request.getParameter("k2ReferenceNumber"));
		K2Model.setBankTransactionNumber(request.getParameter("bankTransactionNumber"));
		K2Model.setBankName(request.getParameter("bankName"));
		K2Model.setPaymentMode(request.getParameter("paymentMode"));
		K2Model.setPaymentStatusCode(request.getParameter("paymentStatusCode"));
		if(request.getParameter("paymentStatusCode").equals("10700066"))
			K2Model.setPaymentStatus("PAYMENT_DONE");
		else if(request.getParameter("paymentStatusCode").equals("10700092"))
			K2Model.setPaymentStatus("PAYMENT_PENDING");
		else if(request.getParameter("paymentStatusCode").equals("10700068"))
			K2Model.setPaymentStatus("PAYMENT_FAILED");
		else 
			K2Model.setPaymentStatus("PAYMENT_FAILED");
		K2Model.setTransactionTime(request.getParameter("transactionTime"));
		commonDao.updateObject(K2Model);
		return K2Model;	
	}
	
	@Override
	public K2PaymentDetailsModel updatePendingPaymentDetails(HttpServletRequest request) {
		K2PaymentDetailsModel K2Model=getPaymentDetailsByK2ChallanRefNo(request.getParameter("k2ReferenceNumber"));
		K2Model.setPaymentStatusCode(request.getParameter("paymentStatusCode"));
		if(request.getParameter("paymentStatusCode").equals("10700066"))
			K2Model.setPaymentStatus("PAYMENT_DONE");
		else if(request.getParameter("paymentStatusCode").equals("10700092"))
			K2Model.setPaymentStatus("PAYMENT_PENDING");
		else if(request.getParameter("paymentStatusCode").equals("10700068"))
			K2Model.setPaymentStatus("PAYMENT_FAILED");
		else 
			K2Model.setPaymentStatus("PAYMENT_FAILED");
		K2Model.setTransactionTime(request.getParameter("transactionTime"));
		commonDao.updateObject(K2Model);
		return K2Model;	
	}



}
