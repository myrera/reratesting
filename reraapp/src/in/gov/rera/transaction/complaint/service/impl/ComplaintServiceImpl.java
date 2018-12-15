package in.gov.rera.transaction.complaint.service.impl;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import in.gov.rera.common.dao.impl.CommonDao;
import in.gov.rera.common.util.PaymentTokenNumber;
import in.gov.rera.common.util.ReraConstants;
import in.gov.rera.dms.beans.Document;
import in.gov.rera.dms.service.IDocumentService;
import in.gov.rera.dms.util.ContentUtil;
import in.gov.rera.transaction.complaint.dao.IComplaintDAO;
import in.gov.rera.transaction.complaint.model.ComplaintModel;
import in.gov.rera.transaction.complaint.model.ComplaintPaymentDetailsModel;
import in.gov.rera.transaction.complaint.service.IComplaintService;
import in.gov.rera.transaction.projectregistration.model.ProjectRegistrationModel;

@Service(value="complaintService")
@Scope(value="request")
public class ComplaintServiceImpl<E,PK> implements IComplaintService<ComplaintModel,Long> {
	static Logger log= Logger.getLogger(ComplaintServiceImpl.class);
	
	@Autowired
	IComplaintDAO<ComplaintModel,Long> complaintDAO;
	
	@Autowired
	ContentUtil contentUtil;
	
	@Autowired
	CommonDao<Object, Long> commonDao;

	@Autowired(required = true)
	IDocumentService<Document, Integer> documentService;
	
	@Override
	public Long saveComplaint(ComplaintModel complaintModel,MultipartFile[] multipartFile,String[] captions,MultipartFile aadharDoc) throws Exception {
	
		  complaintModel.setComplaintDate(Calendar.getInstance());
		
		  Long id	=complaintDAO.saveComplaint(complaintModel);
		  complaintModel.setComplaintNo(getComplaintNo(id));
	 
		try{
			complaintModel= setCompaintDocument(complaintModel, multipartFile,captions,aadharDoc);
			
			ComplaintPaymentDetailsModel complaintPaymentDetailsModel=new ComplaintPaymentDetailsModel();
			complaintPaymentDetailsModel.setPaymentToken(PaymentTokenNumber.generateToken());
			commonDao.saveObject(complaintPaymentDetailsModel);
			complaintModel.setComplaintPaymentDetailsModel(complaintPaymentDetailsModel);
		   
	   }catch(Exception ex){
		   log.error(ex.getMessage(),ex);
	   }
		/*if(!complaintModel.getComplaintPaymentDetailsModel().getPaymentMode().equalsIgnoreCase("Payment Gateway"))
		  complaintModel.setStatus(ReraConstants.PENDING_HEADOFFICE);
		else*/
			 complaintModel.setStatus(ReraConstants.SAVE_AS_DRAFT);
		 complaintDAO.updateComplaint(complaintModel);
		 return id;
	}

	@Override
	public ComplaintModel updateComplaint(ComplaintModel e) throws Exception {
		return complaintDAO.updateComplaint(e);
	}

	@Override
	public ComplaintModel findComplaintById(Long pk) throws Exception {
		return complaintDAO.findComplaintById(pk);
	}

	
	private final ComplaintModel setCompaintDocument(ComplaintModel complaintModel,MultipartFile[] multipartFile,String[] captions, MultipartFile aadharDoc) throws Exception{
		List<Document> list = new ArrayList<Document>();
		int x=0;
		if(multipartFile!=null && multipartFile.length>0){
		for(MultipartFile multiDoc:multipartFile){
			if(!multiDoc.isEmpty() && multiDoc.getSize()>10){
				Document document=new Document();
				document.setInputStream(multiDoc.getInputStream());
				document.setDocumentType("COMPLAINT");
				document.setCaption(captions[x]);
				document.setMimeType(multiDoc.getContentType());
				document.setFileName(multiDoc.getOriginalFilename());
				document.setFolderId(String.valueOf(complaintModel.getCompId()));
				contentUtil.saveDocument(document);
				documentService.saveDoc(document);
				list.add(document);
				x++;
			}
		}
		}
		Document document1=new Document();
		document1.setInputStream(aadharDoc.getInputStream());
		document1.setDocumentType("COMPLAINT");
		document1.setMimeType(aadharDoc.getContentType());
		document1.setFileName(aadharDoc.getOriginalFilename());
		document1.setFolderId(String.valueOf(complaintModel.getCompId()));
		contentUtil.saveDocument(document1);
		documentService.saveDoc(document1);
		complaintModel.setAAdharCardPath(document1);
		
		/*Document document=new Document();
		document.setInputStream(scanCopy.getInputStream());
		document.setDocumentType("COMPLAINT");
		document.setMimeType(scanCopy.getContentType());
		document.setFileName(scanCopy.getOriginalFilename());
		document.setFolderId(String.valueOf(complaintModel.getCompId()));
		contentUtil.saveDocument(document);
		documentService.saveDoc(document);
		
		complaintModel.getComplaintPaymentDetailsModel().setAttachScanCopy(document);*/
		return complaintModel;
	}
	
	
	@Override
	@Transactional(readOnly=true)
	public ComplaintModel getComplaintRegByPk(Long pk) throws Exception {
		
		return complaintDAO.get(pk);
	}
    
	@Override
	public Long editComplaintRegistration(ComplaintModel enitity){
	 complaintDAO.update(enitity);
		return enitity.getCompId();
	}
	
	@Override
	public ComplaintModel getSavedComplaintsByPaymentToken(String paymentToken){

		DetachedCriteria dt = DetachedCriteria.forClass(ComplaintModel.class, "obj");

		dt.createAlias("obj.complaintPaymentDetailsModel", "paymentDetailsModel");
		
		dt.add((Restrictions.eq("paymentDetailsModel.paymentToken", paymentToken)));

		List<ComplaintModel> list=null;
		try {
			list = complaintDAO.getComplaintList(dt);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (list.size() > 0) {
			return list.get(0);
		}else {
		return null;
		}
	}
    

	@Override
	public ComplaintModel getComplaintsByAppNo(String complaintAppNo) {
    	ComplaintModel complaintModel =null;
    	List<ComplaintModel> list =null;
    	
		DetachedCriteria dt=DetachedCriteria.forClass(ComplaintModel.class);
		dt.add(Restrictions.eq("complaintNo", complaintAppNo));
		try {
			list = complaintDAO.getComplaintList(dt);
		} catch (Exception e) {
			e.printStackTrace();
		}
		complaintModel=list!=null && !list.isEmpty()?list.get(0):null; 
		return complaintModel;
	}

    
    private  String getComplaintNo(Long id){
    Calendar cal=Calendar.getInstance();
    StringBuffer sb=new StringBuffer();
    sb.append("CMP/");
    int  yr=cal.get(Calendar.YEAR);
    int mnth=cal.get(Calendar.MONTH)+1;
    int dt=cal.get(Calendar.DATE);
    yr=yr%100;
    if(yr<10){
    	sb.append("0").append(yr);
    }else
    {
    	sb.append(yr);
    }
    if(mnth<10){
    	sb.append("0").append(mnth);
    }else
    {
    	sb.append(mnth);
    }
    if(dt<10){
    	sb.append("0").append(dt);
    }else
    {
    	sb.append(dt);
    }
    sb.append("/");
  
    String str="100";
    if(id!=null)
     str=id.toString();
   while(str.length()<7){
	   str="0"+str;
   }
   sb.append(str);
		return sb.toString();
    }
}