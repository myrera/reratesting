package in.gov.rera.transaction.agentregistration.service.impl;

import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import in.gov.rera.K2PaymentGateWay.dao.IK2PaymentDeatailsDAO;
import in.gov.rera.K2PaymentGateWay.model.K2PaymentDetailsModel;
import in.gov.rera.common.dao.impl.CommonDao;
import in.gov.rera.common.model.EnquiryModel;
import in.gov.rera.common.model.UserModel;
import in.gov.rera.common.util.ReraConstants;
import in.gov.rera.dms.beans.Document;
import in.gov.rera.dms.service.IDocumentService;
import in.gov.rera.dms.util.ContentUtil;
import in.gov.rera.transaction.agentregistration.dao.IAgentRegistrationDAO;
import in.gov.rera.transaction.agentregistration.model.AgentRegistrationModel;
import in.gov.rera.transaction.agentregistration.model.RegUploadDetailsModel;
import in.gov.rera.transaction.agentregistration.service.IAgentRegistrationService;
import in.gov.rera.transaction.projectregistration.dao.EnquiryDetailsDAO;
import in.gov.rera.transaction.projectregistration.service.impl.ProjectRegistrationServiceImpl;

@Service(value = "agentRegistrationService")
@Scope("request")
public class AgentRegistrationServiceImpl<E, PK> implements IAgentRegistrationService<AgentRegistrationModel, Long> {

	static Logger log = Logger.getLogger(ProjectRegistrationServiceImpl.class);

	@Autowired
	ContentUtil contentUtil;

	@Autowired(required = true)
	IDocumentService<Document, Integer> documentService;

	@Autowired
	HttpSession httpSession;

	@Autowired
	IAgentRegistrationDAO<AgentRegistrationModel, Long> agentRegistrationDAO;
	
	@Autowired
	IK2PaymentDeatailsDAO<K2PaymentDetailsModel, Long> K2PaymentDeatailsDAO;

	@Autowired
	EnquiryDetailsDAO<EnquiryModel, Long> enquiryDetailsDAO;

	@Autowired
	CommonDao<Object, Long> dao;

	@Override
	public Long createAgentRegistration(AgentRegistrationModel enitity) {
		return agentRegistrationDAO.save(enitity);
	}

	@Override
	@Transactional(readOnly = true)
	public AgentRegistrationModel getAgentRegByPk(Long pk) throws Exception {

		return agentRegistrationDAO.get(pk);
	}

	@Override
	public Long editAgentRegistration(AgentRegistrationModel enitity) {
		agentRegistrationDAO.update(enitity);
		return enitity.getAgentDetailsModel().getAgentRegDetailID();
	}

	@Override
	public AgentRegistrationModel saveOrUpdateAgentPhotoDoc(MultipartFile panCard, MultipartFile addressProof,
			AgentRegistrationModel agentBaseModel) throws Exception {

		Long agentId = agentBaseModel.getAgentRegistrationID();
		RegUploadDetailsModel agentDoc = new RegUploadDetailsModel();

		Document document = new Document();
		document.setInputStream(panCard.getInputStream());
		document.setDocumentType("AGENT_REG");
		document.setFileName(panCard.getOriginalFilename());
		document.setMimeType(panCard.getContentType());
		document.setFolderId(String.valueOf(agentBaseModel.getAgentRegistrationID()));
		contentUtil.saveDocument(document);
		documentService.saveDoc(document);

		agentDoc.setPanCardPath(document);

		document = new Document();
		document.setInputStream(addressProof.getInputStream());
		document.setDocumentType("AGENT_REG");
		document.setFileName(addressProof.getOriginalFilename());
		document.setMimeType(addressProof.getContentType());
		document.setFolderId(String.valueOf(agentBaseModel.getAgentRegistrationID()));
		contentUtil.saveDocument(document);
		documentService.saveDoc(document);
		agentDoc.setAddressProofPath(document);

		agentBaseModel.getAgentDetailsModel().setRegUploadDetailsModel(agentDoc);

		return agentBaseModel;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public AgentRegistrationModel saveAgentPayment(MultipartFile agentPayScanCopy,
			AgentRegistrationModel agentRegistrationModel) throws Exception {

		Document document = new Document();
		document.setInputStream(agentPayScanCopy.getInputStream());
		document.setDocumentType("AGENT_REG");
		document.setFileName(agentPayScanCopy.getOriginalFilename());
		document.setMimeType(agentPayScanCopy.getContentType());
		document.setFolderId(String.valueOf(agentRegistrationModel.getAgentRegistrationID()));
		contentUtil.saveDocument(document);
		documentService.saveDoc(document);

		agentRegistrationModel.getAgentDetailsModel().getRegPaymentDetailsModel().setAttachScanCopy(document);

		return agentRegistrationModel;

	}

	@Override
	public AgentRegistrationModel saveOrUpdateAgentDoc(AgentRegistrationModel baseObj, MultipartFile panCard,
			MultipartFile addProof) throws Exception {

		Document parnCardDocId = baseObj.getAgentDetailsModel().getRegUploadDetailsModel().getPanCardPath();

		Document addressProofId = baseObj.getAgentDetailsModel().getRegUploadDetailsModel().getAddressProofPath();
		if (panCard != null) {
			parnCardDocId.setMimeType(panCard.getContentType());
			parnCardDocId.setInputStream(panCard.getInputStream());
			parnCardDocId.setFileName(panCard.getOriginalFilename());
			contentUtil.saveDocument(parnCardDocId);
		}

		if (addProof != null) {

			addressProofId.setMimeType(addProof.getContentType());
			addressProofId.setInputStream(addProof.getInputStream());
			addressProofId.setFileName(addProof.getOriginalFilename());
			contentUtil.saveDocument(addressProofId);
		}

		return baseObj;
	}

	@Override
	public AgentRegistrationModel getSavedAgentByEmailId(String emailId) {

		DetachedCriteria dt = DetachedCriteria.forClass(AgentRegistrationModel.class, "obj");

		dt.add(Restrictions.eq("obj.status", ReraConstants.SAVE_AS_DRAFT));
		dt.createAlias("obj.agentDetailsModel", "agentDetailsModel");
		dt.add(Restrictions.or(Restrictions.eq("agentDetailsModel.agentEmailId", emailId),
				Restrictions.eq("agentDetailsModel.firmEmail", emailId)));

		List<AgentRegistrationModel> list = agentRegistrationDAO.getAgentList(dt);
		if (list != null && list.size() > 0) {
			return list.get(0);
		} else {
			return null;
		}
	}

	@Override
	public Document saveDocument(MultipartFile file, AgentRegistrationModel baseObj) throws Exception {
		Document document = new Document();
		document.setInputStream(file.getInputStream());
		document.setDocumentType("AGENT_REG");
		document.setFileName(file.getOriginalFilename());
		document.setMimeType(file.getContentType());
		document.setFolderId(String.valueOf(baseObj.getAgentRegistrationID()));
		contentUtil.saveDocument(document);
		documentService.saveDoc(document);

		return document;
	}

	@Override
	public Document updateDocument(MultipartFile file, Document baseObj) throws Exception {

		baseObj.setInputStream(file.getInputStream());
		baseObj.setFileName(file.getOriginalFilename());
		baseObj.setMimeType(file.getContentType());
		contentUtil.saveDocument(baseObj);
		documentService.updateDoc(baseObj);

		return baseObj;
	}

	@Override
	public AgentRegistrationModel getAgentByPanNo(String panNo) throws Exception {
		DetachedCriteria dt = DetachedCriteria.forClass(AgentRegistrationModel.class, "obj");

		dt.add(Restrictions.ne("obj.status", ReraConstants.REJECTED));
		dt.createAlias("obj.agentDetailsModel", "agentDetailsModel");
		dt.add(Restrictions.eq("agentDetailsModel.agentPanNo", panNo));

		List<AgentRegistrationModel> list = agentRegistrationDAO.getAgentList(dt);
		if (list != null && list.size() > 0) {
			return list.get(0);
		} else {
			return null;
		}
	}

	@Override
	public List<AgentRegistrationModel> returnedAgentProjects(String pendingOprator, UserModel user) {
		DetachedCriteria dt = DetachedCriteria.forClass(AgentRegistrationModel.class);
		dt.add(Restrictions.eq("projectStatus", ReraConstants.RETURN));
		dt.add(Restrictions.eq("status", pendingOprator));
		dt.add(Restrictions.isNotNull("operatorRemarks"));

		dt.addOrder(Order.asc("applicationNo"));
		return agentRegistrationDAO.getAgentList(dt);
	}

	@Override
	public String generateAckNo(AgentRegistrationModel model) {
		Calendar cal = Calendar.getInstance();
		StringBuffer sb = new StringBuffer("ACK/KA/RERA/");
		generateNumber(model, cal, sb, getTotalAgentCount() + 1);
		return sb.toString();
	}

	private void generateNumber(AgentRegistrationModel model, Calendar cal, StringBuffer sb, int seqNumber) {
		if (model.getDistrictModel() != null && model.getDistrictModel().getDistrictId() != null)
			sb.append(model.getDistrictModel().getDistrictId()).append("/");

		if (model.getSubDistrictModel() != null && model.getSubDistrictModel().getSubDistrictId() != null)
			sb.append(model.getSubDistrictModel().getSubDistrictId()).append("/AG/");

		int yr = cal.get(Calendar.YEAR);
		int mnth = cal.get(Calendar.MONTH) + 1;
		int dt = cal.get(Calendar.DATE);
		yr = yr % 100;
		if (yr < 10) {
			sb.append("0").append(yr);
		} else {
			sb.append(yr);
		}
		if (mnth < 10) {
			sb.append("0").append(mnth);
		} else {
			sb.append(mnth);
		}
		if (dt < 10) {
			sb.append("0").append(dt);
		} else {
			sb.append(dt);
		}
		sb.append("/");

		String str = "" + seqNumber;
		while (str.length() < 6) {
			str = "0" + str;
		}
		sb.append(str);
	}

	@Override
	public String generateAgentNo(AgentRegistrationModel model) {
		Calendar cal = Calendar.getInstance();

		int maxRetries = 0;
		boolean savedAgent = false;

		while (!savedAgent && maxRetries < 10) {
			maxRetries++;
			StringBuffer sb = new StringBuffer("PRM/KA/RERA/");
			generateNumber(model, cal, sb, getApprovedAgentCount() + 1);
			String appNo = sb.toString();
			if (checkAgentPRNNumberExists(appNo)) {
				continue;
			}
			return sb.toString();
		}

		throw new RuntimeException("Cannot generate registration number");
	}

	@Override
	public boolean checkAgentACKNumberExists(String sequence) {

		String str = "Select count(a) from AgentRegistrationModel a where a.applicationNo like 'ACK/KA/RERA%" + "/"
				+ sequence + "'";

		Query query = null;

		try {
			query = dao.getQuery(str);

		} catch (Exception e) {

			log.error(e.getMessage(), e);
		}

		return Integer.parseInt(query.uniqueResult().toString()) == 0 ? false : true;
	}

	@Override
	public boolean checkAgentPRNNumberExists(String sequence) {

		String str = "Select count(a) from AgentRegistrationModel a where a.agentRegistrationNo ='"+sequence+"'";
		Query query = null;

		try {
			query = dao.getQuery(str);

		} catch (Exception e) {

			log.error(e.getMessage(), e);
		}

		return Integer.parseInt(query.uniqueResult().toString()) == 0 ? false : true;
	}

	@Override
	public Integer getTotalAgentCount() {

		String str = "Select count(a) from AgentRegistrationModel a where a.status!='SAVE_AS_DRAFT'";

		Query query = null;

		try {
			query = dao.getQuery(str);

		} catch (Exception e) {

			log.error(e.getMessage(), e);
		}

		return Integer.parseInt(query.uniqueResult().toString());
	}

	@Override
	public Integer getApprovedAgentCount() {

		String str = "Select count(a) from AgentRegistrationModel a where a.status='APPROVED'";

		Query query = null;

		try {
			query = dao.getQuery(str);

		} catch (Exception e) {

			log.error(e.getMessage(), e);
		}

		return Integer.parseInt(query.uniqueResult().toString());
	}
	
	@Override
	public AgentRegistrationModel getSavedAgentByPaymentToken(String paymentToken) {

		DetachedCriteria dt = DetachedCriteria.forClass(AgentRegistrationModel.class, "obj");

		dt.createAlias("obj.agentDetailsModel.regPaymentDetailsModel", "paymentDetailsModel");
		
		dt.add((Restrictions.eq("paymentDetailsModel.paymentToken", paymentToken)));

		List<AgentRegistrationModel> list = agentRegistrationDAO.getAgentList(dt);
		if (list != null && list.size() > 0) {
			return list.get(0);
		} else {
			return null;
		}
	}

}