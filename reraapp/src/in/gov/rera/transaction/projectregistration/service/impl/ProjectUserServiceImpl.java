package in.gov.rera.transaction.projectregistration.service.impl;

import java.util.Calendar;
import java.util.HashSet;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import in.gov.rera.common.dao.impl.CommonDao;
import in.gov.rera.common.util.ReraConstants;
import in.gov.rera.master.district.model.DistrictModel;
import in.gov.rera.transaction.agentregistration.model.AgentRegistrationModel;
import in.gov.rera.transaction.projectregistration.dao.IProjectRegistrationDAO;
import in.gov.rera.transaction.projectregistration.model.ProjectAgentModel;
import in.gov.rera.transaction.projectregistration.model.ProjectArchitectDetailsModel;
import in.gov.rera.transaction.projectregistration.model.ProjectContratorDetailsModel;
import in.gov.rera.transaction.projectregistration.model.ProjectRegistrationModel;
import in.gov.rera.transaction.projectregistration.model.StructuralEngineerDetailsModel;
import in.gov.rera.transaction.projectregistration.service.IProjectUserService;


@Service(value = "projectUserService")
@Scope("request")
public class ProjectUserServiceImpl implements IProjectUserService{

	@Autowired
	CommonDao<Object, Long> commonDao;
	
	@Autowired
	IProjectRegistrationDAO<ProjectRegistrationModel, Long> promoterRegistrationDAO;
	

	
	@Override
	public ProjectRegistrationModel getProjectByRegNo(String regNo) {
		DetachedCriteria dt= DetachedCriteria.forClass(ProjectRegistrationModel.class);
		dt.add(Restrictions.eq("projectRegistrationNo", regNo));
		ProjectRegistrationModel project=null;
		List<ProjectRegistrationModel> list=promoterRegistrationDAO.getProjectList(dt);
		if(list!=null && list.size()>0){
			project=list.get(0);
		}
		
		return project;
	}
	
	@Override
	public ProjectRegistrationModel getProjectByLoginId(String regNo) {
		DetachedCriteria dt= DetachedCriteria.forClass(ProjectRegistrationModel.class,"pr");
		dt.createAlias("pr.projectUser", "us");
		dt.add(Restrictions.eq("us.loginId", regNo));
		ProjectRegistrationModel project=null;
		List<ProjectRegistrationModel> list=promoterRegistrationDAO.getProjectList(dt);
		if(list!=null && list.size()>0){
			project=list.get(0);
		}
		
		return project;
	}

	@Override
	public void updateVedorList(Long vid, String type) {
		if(type!=null && vid!=null){
			if(type.equals("AGENT")){
				ProjectAgentModel obj=(ProjectAgentModel)commonDao.getObject(ProjectAgentModel.class, vid);
				obj.setStatus(ReraConstants.VENDOR_REQ_SEPARATED);
				obj.setSeparatedOn(Calendar.getInstance());
				commonDao.updateObject(obj);
			}else 	if(type.equals("CONTRACTOR")){
			ProjectContratorDetailsModel obj=(ProjectContratorDetailsModel)commonDao.getObject(ProjectContratorDetailsModel.class, vid);
			obj.setStatus(ReraConstants.VENDOR_REQ_SEPARATED);
			obj.setSeparatedOn(Calendar.getInstance());
			commonDao.updateObject(obj);
			}else 	if(type.equals("ENGINEER")){
				StructuralEngineerDetailsModel obj=(StructuralEngineerDetailsModel)commonDao.getObject(StructuralEngineerDetailsModel.class, vid);
				obj.setStatus(ReraConstants.VENDOR_REQ_SEPARATED);
				obj.setSeparatedOn(Calendar.getInstance());
				commonDao.updateObject(obj);
			}else 	if(type.equals("ARCHITECT")){
				ProjectArchitectDetailsModel obj=(ProjectArchitectDetailsModel)commonDao.getObject(ProjectArchitectDetailsModel.class, vid);
				obj.setStatus(ReraConstants.VENDOR_REQ_SEPARATED);
				obj.setSeparatedOn(Calendar.getInstance());
				commonDao.updateObject(obj);
			}
		}
		
	}

	@Override
	public void addAgent(ProjectRegistrationModel project,
			String agentRegNo) {
		
        DetachedCriteria dt=DetachedCriteria.forClass(AgentRegistrationModel.class);
        dt.add(Restrictions.eq("agentRegistrationNo", agentRegNo));
       List<Object> lst= commonDao.getList(dt);
       if(lst!=null && lst.size()>0 && lst.get(0)!=null){
    	   AgentRegistrationModel agent=(AgentRegistrationModel)lst.get(0);
    	   ProjectAgentModel obj=new ProjectAgentModel();
    	   obj.setAgent(agent);
    	   obj.setProject(project);
    	   obj.setAddedOn(Calendar.getInstance());
    	   obj.setStatus(ReraConstants.VENDOR_REQ_CONFIRMED);
    	   if(project.getProjectAgentDetailSet()==null){
    		   project.setProjectAgentDetailSet(new HashSet<ProjectAgentModel>());
    	   }
    	   if(agent.getProjectRegistrationModelSet()==null){
    		   agent.setProjectRegistrationModelSet(new HashSet<ProjectAgentModel>());
    	   }
    	   project.getProjectAgentDetailSet().add(obj);
    	   promoterRegistrationDAO.saveOrUpdate(project);
    	   commonDao.updateObject(agent);
       }
		
	}

	@Override
	public void addVendor(ProjectRegistrationModel project, String vType,
			String name, String email, String address1, String address2,
			String pinCode, String year, String keyProjects, Long distId) {
		
		
		if(vType!=null){
			
			DistrictModel dst=(DistrictModel)commonDao.getObject(DistrictModel.class, distId);
			
			if("CONTRACTOR".equals(vType)){
				ProjectContratorDetailsModel cont=new ProjectContratorDetailsModel();
				cont.setContractorName(name);
				cont.setEmailId(email);
				cont.setDistrictModel(dst);
				cont.setAddressLine1(address1);
				cont.setAddressLine2(address2);
				cont.setKeyProject(keyProjects);
				cont.setPinCode(pinCode);
				cont.setYearOfEstablishment(year);
				cont.setAddedOn(Calendar.getInstance());
				cont.setStatus(ReraConstants.VENDOR_REQ_CONFIRMED);
				if(project.getProjectContratorDetailSet()==null){
					project.setProjectContratorDetailSet(new HashSet<ProjectContratorDetailsModel>());
				}
				project.getProjectContratorDetailSet().add(cont);
				
			}else if("ENGINEER".equals(vType)){
				
				StructuralEngineerDetailsModel cont=new StructuralEngineerDetailsModel();
				cont.setEngineerName(name);
				cont.setEmailId(email);
				cont.setDistrictModel(dst);
				cont.setAddressLine1(address1);
				cont.setAddressLine2(address2);
				cont.setKeyProject(keyProjects);
				cont.setPinCode(pinCode);
				cont.setYearOfEstablishment(year);
				cont.setAddedOn(Calendar.getInstance());
				cont.setStatus(ReraConstants.VENDOR_REQ_CONFIRMED);
				
				if(project.getStructuralEngineerDetailSet()==null){
					project.setStructuralEngineerDetailSet(new HashSet<StructuralEngineerDetailsModel>());
				}
				project.getStructuralEngineerDetailSet().add(cont);
				
			}else if("ARCHITECT".equals(vType)){
				
				ProjectArchitectDetailsModel cont=new ProjectArchitectDetailsModel();
				cont.setArchitectName(name);
				cont.setEmailId(email);
				cont.setDistrictModel(dst);
				cont.setAddressLine1(address1);
				cont.setAddressLine2(address2);
				cont.setKeyProject(keyProjects);
				cont.setPinCode(pinCode);
				cont.setYearOfEstablishment(year);
				cont.setAddedOn(Calendar.getInstance());
				cont.setStatus(ReraConstants.VENDOR_REQ_CONFIRMED);
				if(project.getProjectArchitectDetailSet()==null){
					project.setProjectArchitectDetailSet(new HashSet<ProjectArchitectDetailsModel>());
				}
				project.getProjectArchitectDetailSet().add(cont);
			}
			
			promoterRegistrationDAO.update(project);
		}
		
	}

	
	
	
	
	
}
