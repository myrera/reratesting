package in.gov.rera.transaction.projectregistration.controller;


import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashSet;
import java.util.Set;

import in.gov.rera.common.dao.impl.CommonDao;
import in.gov.rera.common.dao.impl.IGenericDAO;
import in.gov.rera.common.model.UserModel;
import in.gov.rera.common.security.FileSecurity;
import in.gov.rera.common.util.PaymentTokenNumber;
import in.gov.rera.common.util.ReraConstants;
import in.gov.rera.dms.beans.Document;
import in.gov.rera.dms.service.IDocumentService;
import in.gov.rera.dms.util.ContentUtil;
import in.gov.rera.master.bank.model.BankModel;
import in.gov.rera.master.bank.service.IBankService;
import in.gov.rera.master.bank.service.impl.BankServiceImpl;
import in.gov.rera.master.stateut.model.StateUtModel;
import in.gov.rera.master.stateut.service.IStateUtService;
import in.gov.rera.transaction.projectregistration.model.DevelopmentDetailsModel;
import in.gov.rera.transaction.projectregistration.model.DevelopmentStatus;
import in.gov.rera.transaction.projectregistration.model.ExtDevelopmentStatus;
import in.gov.rera.transaction.projectregistration.model.ExtOtherDevModel;
import in.gov.rera.transaction.projectregistration.model.ExtOtherDevStatus;
import in.gov.rera.transaction.projectregistration.model.ExternalDevelopmentWorkModel;
import in.gov.rera.transaction.projectregistration.model.ProjectDetailsModel;
import in.gov.rera.transaction.projectregistration.model.ProjectRegExtensionModel;
import in.gov.rera.transaction.projectregistration.model.ProjectRegistrationModel;
import in.gov.rera.transaction.projectregistration.model.ProjectStatusModel;
import in.gov.rera.transaction.projectregistration.service.IProjectUserService;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.apache.log4j.Logger;


@Controller(value = "ProjectUserController")
@Scope("request")
public class ProjectUserController {

	static Logger log= Logger.getLogger(ProjectUserController.class);
	@Autowired
	HttpSession httpSession;
	
	@Autowired
	IProjectUserService projectUserService;
	
	@Autowired
	IStateUtService<StateUtModel, Long>stateUtService;
	
	
	private ProjectRegExtensionModel projectExt;
	
    private ProjectRegistrationModel project;

    @RequestMapping(value="project/dashboard")
	public ModelAndView dashboard(){
		populateProject();
		ModelAndView	mv=null;
		if(project.getRegistrationType().equals(ReraConstants.INDVISUAL_REG)){
			mv=new ModelAndView("project.dashbordIndv");
		}
		else{
			mv=new ModelAndView("project.dashbordComp");
		}
		
		mv.addObject("projectReg",project);
		
		return mv;
	}
	
    @RequestMapping(value="project/projectDetailsPage")
	public ModelAndView projectDetailsPage(){
		populateProject();
		ModelAndView	mv=new ModelAndView("project.projectDetails");
		mv.addObject("projectReg",project);
		
		return mv;
	}
    
    @RequestMapping(value="project/paymentDetailsPage")
	public ModelAndView paymentDetailsPage(){
		populateProject();
		ModelAndView	mv=new ModelAndView("project.paymentDetails");
		mv.addObject("projectReg",project);
		
		return mv;
	}
    
    @RequestMapping(value="project/developmentDetailsPage")
	public ModelAndView developmentDetailsPage(){
		populateProject();
		ModelAndView	mv=new ModelAndView("project.developmentDetails");
		mv.addObject("projectReg",project);
		
		return mv;
	}
    
    @RequestMapping(value="project/projectVendors")
	public ModelAndView projectVendors(){
		populateProject();
		ModelAndView	mv=new ModelAndView("project.projectVendors");
		try{
		mv.addObject("stateUtList", stateUtService.getStateUtList());
		}
		catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		mv.addObject("projectReg",project);
		
		return mv;
	}
    
    @RequestMapping(value="project/projectDocumentsPage")
	public ModelAndView projectDocumentsPage(){
		populateProject();
		ModelAndView	mv=new ModelAndView("project.projectDocuments");
		mv.addObject("projectReg",project);
		
		return mv;
	}
    
    
    @RequestMapping(value="project/updateProjectDocuments")
	public ModelAndView updateProjectDocuments(@RequestParam("attachments")MultipartFile doc,
			@RequestParam("caption")String caption ){
		populateProject();
		

		if(!FileSecurity.checkFileType(doc)){
			return new ModelAndView("redirect:/incorrectFileType");
		}
		
		
		try{
		if(doc!=null && !doc.isEmpty()){
			Document dm=new Document();
			dm.setCaption(caption);
			dm.setDocumentType("PROJECT_REG");
			dm.setFileName(doc.getOriginalFilename());
			dm.setMimeType(doc.getContentType());
			dm.setFolderId(project.getProjectRegId()+"");
			dm.setInputStream(doc.getInputStream());
			contentUtil.saveDocument(dm);
			documentService.saveDoc(dm);
			if(project.getProjectDocModel().getOtherDocumentSet()==null){
				project.getProjectDocModel().setOtherDocumentSet(new HashSet<Document>());	
			}
			project.getProjectDocModel().getOtherDocumentSet().add(dm);
			dao.updateObject(project.getProjectDocModel());
			
			//Start Added new fields
			//dao.updateObject(project.getProjectNewDocModel());
			//End Added new fields
		}
		}catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		ModelAndView	mv=new ModelAndView("project.projectDocuments");
		mv.addObject("projectReg",project);
		
		return mv;
	}
    
    
    
    @RequestMapping(value="project/projectPhotosPage")
  	public ModelAndView projectPhotosPage(){
  		populateProject();
  		ModelAndView	mv=new ModelAndView("project.projectPhotosPage");
  		mv.addObject("projectReg",project);
  		
  		return mv;
  	}
    
    
    @RequestMapping(value="project/updateProjectPhotos")
  	public ModelAndView updateProjectPhotos(@RequestParam("projectPhoto")MultipartFile doc){
  		populateProject();
  	

		if(!FileSecurity.checkFileType(doc)){
			return new ModelAndView("redirect:/incorrectFileType");
		}
  		
  		try{
  		if(doc!=null && !doc.isEmpty()){
  			Document dm=new Document();
  			dm.setDocumentType("PROJECT_REG");
  			dm.setFileName(doc.getOriginalFilename());
  			dm.setMimeType(doc.getContentType());
  			dm.setFolderId(project.getProjectRegId()+"");
  			dm.setInputStream(doc.getInputStream());
  			contentUtil.saveDocument(dm);
  			documentService.saveDoc(dm);
  			if(project.getProjectPhotoDetailSet()==null){
  				project.setProjectPhotoDetailSet(new HashSet<Document>());	
  			}
  			project.getProjectPhotoDetailSet().add(dm);
  			dao.updateObject(project);
  		}
  		}catch (Exception e) {
  			log.error(e.getMessage(),e);
  		}
  		ModelAndView	mv=new ModelAndView("project.projectPhotosPage");
  		mv.addObject("projectReg",project);
  		
  		return mv;
  	}
    
    @RequestMapping(value="project/removeProjectPhoto")
  	public ModelAndView removeProjectPhoto(@RequestParam("photoId")int docId){
  		populateProject();
  		Document photo=null;
  		for(Document doc: project.getProjectPhotoDetailSet()){
  			if(doc.getDocumentId()==docId){
  				photo=doc;
  				break;
  			}
  		}
  		if(photo!=null){
  			contentUtil.removeDocument(photo);
  			project.getProjectPhotoDetailSet().remove(photo);
  			dao.removeObject(photo);
  		}
  		dao.updateObject(project);
  		
  		ModelAndView	mv=new ModelAndView("redirect:projectPhotosPage");
  		
  		
  		return mv;
  	}
    
    
    
    @RequestMapping(value="project/changePasswordForm")
	public ModelAndView changePasswordForm(){
		populateProject();
		ModelAndView	mv=new ModelAndView("project.changePassword");
		mv.addObject("projectReg",project);
		
		return mv;
	}
    
    
    @RequestMapping(value="project/updateProjectStatus")
   	public ModelAndView updateProjectStatus(@RequestParam("project_id") Long pid,
   			@RequestParam("project_status") String projectStatus,
   			@RequestParam("parkingSold") Integer parkingSold,
   			@RequestParam("garageSold") Integer garageSold,
   			@RequestParam("noOfMonthDelayed") Integer ifdelay,
   			@RequestParam("reasonForDelayed") String reasonForDelayed,
   			@RequestParam("compeletionCert")MultipartFile compeletionCert ){
    	

		if(!FileSecurity.checkFileType(compeletionCert)){
			return new ModelAndView("redirect:/incorrectFileType");
		}
		
    	populateProject();
    	ProjectDetailsModel pro=(ProjectDetailsModel)dao.loadObject(ProjectDetailsModel.class,pid);
    	ProjectStatusModel status=new ProjectStatusModel();
    	status.setGarageSoldout(pro.getGarageSoldout());
    	status.setNoOfMonthDelayed(pro.getNoOfMonthDelayed());
    	status.setParkingSoldout(pro.getParkingSoldout());
    	status.setProjectStatus(pro.getProjectStatus());
    	status.setReasonForDelayed(pro.getReasonForDelayed());
    	status.setUpdatedOn(pro.getUpdatedOn());
    	if(pro.getStatusList()==null){
    		pro.setStatusList(new ArrayList<ProjectStatusModel>());
    	}
    	pro.getStatusList().add(status);
    	pro.setParkingSoldout(parkingSold);
    	pro.setGarageSoldout(garageSold);
    	if(projectStatus.equalsIgnoreCase("Delayed"))
    	{pro.setNoOfMonthDelayed(ifdelay);
    	pro.setReasonForDelayed(reasonForDelayed);
    	}
    	pro.setProjectStatus(projectStatus);
    	pro.setUpdatedOn(Calendar.getInstance());
    	try{
    	if(projectStatus.equalsIgnoreCase("Completed") && compeletionCert!=null && !compeletionCert.isEmpty()){
    		Document doc=new Document();
    		doc.setFileName(compeletionCert.getOriginalFilename());
    		doc.setMimeType(compeletionCert.getContentType());
    		doc.setInputStream(compeletionCert.getInputStream());
    		doc.setDocumentType("PROJECT");
    		doc.setFolderId(project.getProjectRegId().toString());
    		contentUtil.saveDocument(doc);
    		documentService.saveDoc(doc);
    		pro.setCompeletionCertDoc(doc);
    	}
    	}catch (Exception e) {
			log.error(e.getMessage(),e);
		}
    	dao.updateObject(pro);
   		ModelAndView	mv=new ModelAndView("redirect:projectDetailsPage");
   		
   		return mv;
   	}
    
    @Autowired
	ContentUtil contentUtil;

	@Autowired(required = true)
	IDocumentService<Document, Integer> documentService;
    
    
    @RequestMapping(value="project/updateDevStatus")
   	public ModelAndView updateDevelopmentStatus(@RequestParam("dev_id")Long did,
   			@RequestParam("inv_completed")Integer completed,@RequestParam("inv_sold")Integer sold
   			
   			){
    	DevelopmentStatus status=new DevelopmentStatus();
    	status.setTotalCompleted(completed);
    	status.setTotalSold(sold);
    	status.setUpdatedOn(Calendar.getInstance());
    	
    	DevelopmentDetailsModel
   		 dev=(DevelopmentDetailsModel)dao.loadObject(DevelopmentDetailsModel.class, did);
   		if(dev.getCurrentStatus()==null){
   			dev.setCurrentStatus(status);
   			
   		}
   		else{
   			if(dev.getDevelopmentStatusList()==null){
   				dev.setDevelopmentStatusList(new ArrayList<DevelopmentStatus>());
   			}
   			dev.getDevelopmentStatusList().add(dev.getCurrentStatus());
   			dev.setCurrentStatus(status);
   		}
   		dao.updateObject(dev);
   		
   		ModelAndView	mv=new ModelAndView("redirect:developmentDetailsPage");
   		
   		return mv;
   	}
    
    
    @RequestMapping(value="project/updateExtDevStatus")
   	public ModelAndView updateExtDevStatus(@RequestParam("dev_id")Long did,
   			@RequestParam("roadstatus")Integer roadstatus,@RequestParam("waterstatus")Integer waterstatus,
   			@RequestParam("electricitystatus")Integer electricitystatus,
   			@RequestParam("sewagestatus")Integer sewagestatus,
   			@RequestParam("solidwastestatus")Integer solidwastestatus
   			){
    	ExtDevelopmentStatus status=new ExtDevelopmentStatus();
    	status.setElectricityStatus(electricitystatus);
    	status.setRoadSysetmDevStatus(roadstatus);
    	status.setSewegeAndDrainageStatus(sewagestatus);
    	status.setSolidWasteStatus(solidwastestatus);
    	status.setWaterSupplyStatus(waterstatus);
    	status.setUpdatedOn(Calendar.getInstance());
    	
   		ExternalDevelopmentWorkModel ext=(ExternalDevelopmentWorkModel)dao.loadObject(ExternalDevelopmentWorkModel.class, did);
   		if(ext.getCurrentStatus()==null){
   			ext.setCurrentStatus(status);
   			
   		}
   		else{
   			if(ext.getPreviuosStatusList()==null){
   				ext.setPreviuosStatusList(new ArrayList<ExtDevelopmentStatus>());
   			}
   			ext.getPreviuosStatusList().add(ext.getCurrentStatus());
   			ext.setCurrentStatus(status);
   		}
   		dao.updateObject(ext);
   	
   		ModelAndView	mv=new ModelAndView("redirect:developmentDetailsPage");
   		
   		return mv;
   	}
    
    @RequestMapping(value="project/updateExtOtherDevStatus")
   	public ModelAndView updateOthersExtDevStatus(@RequestParam("dev_id")Long did,
   			@RequestParam("status")Integer completed
   			){
    	
    	ExtOtherDevStatus status=new ExtOtherDevStatus();
    	status.setStatus(completed);
    	status.setUpdatedOn(Calendar.getInstance());
    	
   		ExtOtherDevModel ext=(ExtOtherDevModel)dao.getObject(ExtOtherDevModel.class, did);
   		if(ext.getCurrentStatus()==null){
   			ext.setCurrentStatus(status);
   		}else{
   			if(ext.getStatusList()==null){
   				ext.setStatusList(new ArrayList<ExtOtherDevStatus>());
   			}
   			ext.getStatusList().add(ext.getCurrentStatus());
   			ext.setCurrentStatus(status);
   		}
   		dao.updateObject(ext);
   		
   		ModelAndView	mv=new ModelAndView("redirect:developmentDetailsPage");
   		
   		return mv;
   	}
    
    
    @RequestMapping(value="project/removeProjectVendor")
   	public ModelAndView updateVendorList(@RequestParam("vId")Long vid,
   			@RequestParam("vType")String vType
   			){
    	
    	projectUserService.updateVedorList(vid, vType);
   		
   		ModelAndView	mv=new ModelAndView("redirect:projectVendors");
   		
   		return mv;
   	}
    
    
    
    
    
    @RequestMapping(value="project/openRegistrationExtForm")
	 public ModelAndView openRenewalForm(){
		 populateProject();
			ModelAndView mv=null;
		int fee=(int)(double)	project.getPaymentDetailsModel().getAmount();
			fee=fee/2;
			
			mv=new ModelAndView("project.registrationExtForm");
			try{
				projectExt=new ProjectRegExtensionModel();
				mv.addObject("projectExt",projectExt);	
			mv.addObject("RegistrationFee",fee);
			mv.addObject("paymentTokenNo", PaymentTokenNumber.generateTokenProjectRegExtension(project));
			}
			catch (Exception e) {
				log.error(e.getMessage(),e);
			}
			return mv;
	 }
  	
    //saveProjectExtensionReq
    @RequestMapping(value="project/saveProjectExtensionReq")
   	public ModelAndView saveProjectExtensionReq(@ModelAttribute("projectExt") ProjectRegExtensionModel model,
   			@RequestParam("scanCopyDoc")MultipartFile scanCopy,
   			@RequestParam(value="captions",required=false)String [] captions,
   			@RequestParam(value="attachments",required=false)MultipartFile[] files){
    	populateProject();
    	model.setCreatedOn(Calendar.getInstance());
    
    	if(!FileSecurity.checkFileType(scanCopy)){
			return new ModelAndView("redirect:/incorrectFileType");
		}
  		
    	if(!FileSecurity.checkFileType(files)){
			return new ModelAndView("redirect:/incorrectFileType");
		}
  		
    	
    	
    	
    	
    	if(model.getPaymentDetailsModel().getPaymentMode().equalsIgnoreCase("Payment Gateway")){
    		model.setStatus(ReraConstants.SAVE_AS_DRAFT);
    	}
    	else{
    	model.setStatus(ReraConstants.PENDING_OPRATOR);
    	}
    	model.setProjectRegistration(project);
    	project.setProjectExtention(model);
    	model.setRegistrationType(project.getRegistrationType());
    	try{
    	if(scanCopy!=null && !scanCopy.isEmpty()){
    		Document doc=new Document();
    		doc.setFileName(scanCopy.getOriginalFilename());
    		doc.setInputStream(scanCopy.getInputStream());
    		doc.setFolderId(project.getProjectRegId()+"");
    		doc.setMimeType(scanCopy.getContentType());
    		doc.setDocumentType("PROJECT_REG");
    		contentUtil.saveDocument(doc);
    		documentService.saveDoc(doc);
    		model.getPaymentDetailsModel().setScanCopyDoc(doc);
    	}
    	if(files!=null && files.length>0){
    		Set<Document> docs=new HashSet<Document>();
    		int xx=0;
    		for(MultipartFile file:files){
    			if(!file.isEmpty()){
    			Document doc=new Document();
        		doc.setFileName(file.getOriginalFilename());
        		doc.setCaption(captions[xx]);
        		doc.setInputStream(file.getInputStream());
        		doc.setFolderId(project.getProjectRegId()+"");
        		doc.setMimeType(file.getContentType());
        		doc.setDocumentType("PROJECT_REG");
        		contentUtil.saveDocument(doc);
        		documentService.saveDoc(doc);
        		docs.add(doc);
    			}
        		xx++;
    		}
    		model.setSupportingDocs(docs);
    	}
    	
    	}
    	catch (Exception e) {
		log.error(e.getMessage(),e);
		}
    	
    	dao.saveObject(model);
    	dao.updateObject(project);
    	
	ModelAndView	mv=null;
	if(model.getPaymentDetailsModel().getPaymentMode().equalsIgnoreCase("Payment Gateway")){
	mv=	new ModelAndView("redirect:confirmationPage");
	}
	else{
		httpSession.setAttribute("EXT_REG_ID", model.getProjectExtId());
	mv=	new ModelAndView("redirect:projectExtPaymentGateway");
	}
	
   		
   		return mv;
    }
    
    
    @RequestMapping(value="project/confirmationPage")
    public ModelAndView confirmationPage(){
    	ModelAndView mv=new ModelAndView("project.confirmationPage");
    	populateProject();
    	return mv;
    	
    }
    
    
    
    @RequestMapping(value="project/addProjectAgent")
    public ModelAndView addAgent(@RequestParam("agentRegNo") String agentNo){
    	ModelAndView mv=new ModelAndView("redirect:projectVendors");
    	populateProject();
    	projectUserService.addAgent(project, agentNo);
    	return mv;
    	
    }
    @RequestMapping(value="project/addProjectVendors")
  public ModelAndView addVendors(@RequestParam("vendorName")String vendorName,
		  @RequestParam("vType")String vType,@RequestParam("vendorEmailId")String email,
		  @RequestParam("addressLine1")String address1,@RequestParam("addressLine2")String address2,
		  @RequestParam("vendorDistrictId")Long district,@RequestParam("vendorPineCode")String pincode,
		  @RequestParam("vendorYearOfEst")String year,@RequestParam("keyProjectCompleted")String keyProjects){
	  ModelAndView mv=new ModelAndView("redirect:projectVendors");
	  populateProject();
  	projectUserService.addVendor(project, vType, vendorName, email, address1, address2, pincode, year, keyProjects, district);
  	return mv;
    } 
    
    
    
	
	private void populateProject(){
		UserModel user=(UserModel)httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
		project=projectUserService.getProjectByLoginId(user.getLoginId());
	}
	
	@Autowired
	CommonDao<Object, Long> dao;
	@Autowired
	IBankService<BankModel, Long> bankService;
	


    private  String getApplicationNo(){
    Calendar cal=Calendar.getInstance();
    StringBuffer sb=new StringBuffer();
    sb.append("PR/");
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
   long num= cal.getTimeInMillis();
   num=num%1000000;
   String str=""+num;
   while(str.length()<7){
	   str="0"+str;
   }
   sb.append(str);
		return sb.toString();
    }


}
