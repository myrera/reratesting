package in.gov.rera.search;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import in.gov.rera.common.model.UserModel;
import in.gov.rera.common.util.ReraConstants;
import in.gov.rera.transaction.agentregistration.dao.IAgentRegistrationDAO;
import in.gov.rera.transaction.agentregistration.model.AgentRegistrationModel;
import in.gov.rera.transaction.agentregistration.service.IAgentRegistrationService;
import in.gov.rera.transaction.projectregistration.dao.IProjectRegistrationDAO;
import in.gov.rera.transaction.projectregistration.model.ProjectRegistrationModel;
import in.gov.rera.transaction.projectregistration.service.IProjectRegistrationService;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.apache.log4j.Logger;


@Controller("SearchController")
@Scope("request")
public class SearchController {
	static Logger log= Logger.getLogger(SearchController.class);
	
	@Autowired
	ISearch seachEngine;
	
	@Autowired
	HttpSession httpSession;
	
	@Autowired
	IAgentRegistrationService<AgentRegistrationModel, Long> agentRegistrationService;
	

	@Autowired
	IProjectRegistrationService projectRegistrationService;
	
	@Autowired
	IProjectRegistrationDAO<ProjectRegistrationModel,Long> projectRegDao;
	
	@Autowired
	IAgentRegistrationDAO<AgentRegistrationModel, Long> agentDao;
	
	/*@RequestMapping(value="search")
	public ModelAndView search(@RequestParam(value="searchTxt") String name,
			@RequestParam(value="currentPage", required=false) Integer currentPage,
			@RequestParam(value="startFrom") int startFrom){
		SearchQuery query=new SearchQuery();
		query.setCurrentPage(0);
		query.setName(name);
		query.setStartIndex(startFrom);
		
		
	SearchResult result=null;
	try{
	result=seachEngine.search(query);
	}catch (Exception e) {
		log.error(e.getMessage(),e);
	}
	
	ModelAndView mv=	new ModelAndView("resultPage");
	mv.addObject("result", result);
		return mv;
	}
	
   
	@RequestMapping(value="viewProjectDetailPage")
	public ModelAndView viewProjectDetailPage(@RequestParam(value="projectID") Long projectId){
		UserModel user = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
		if(user==null){
			return new ModelAndView("home");
		}
		ModelAndView mv=null;
		try{
	ProjectRegistrationModel project=		projectRegistrationService.getProjectRegByPk(projectId);
	if(project.getRegistrationType().equalsIgnoreCase(ReraConstants.INDVISUAL_REG)){
		mv=new ModelAndView("home.individualProjectDetails");
	}else{
		mv=new ModelAndView("home.compProjectDetails");
	}
         mv.addObject("project", project);
		
		}
		catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return mv;
				
	}
	
	

	@RequestMapping(value="viewAgentDetailPage")
	public ModelAndView viewAgentDetailPage(@RequestParam(value="agentID") Long agentId){
		
		UserModel user = (UserModel) httpSession.getAttribute(ReraConstants.SES_USER_ATTR);
		if(user==null){
			return new ModelAndView("home");
		}
		
		ModelAndView mv=null;
       try{
    AgentRegistrationModel agent=  agentRegistrationService.getAgentRegByPk(agentId);
    
  
    
    
		if(agent.getRegistrationType().equalsIgnoreCase(ReraConstants.INDVISUAL_REG)){
			mv=new ModelAndView("home.individualAgentDetails");
		}else{
			mv=new ModelAndView("home.compAgentDetails");
		}
       mv.addObject("agent", agent);
       mv.addObject("projectList", agent.getProjectRegistrationModelSet());
       
       }
		catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return mv;
				
	}
	
	@RequestMapping(value="viewDefaulterProjects")
	public ModelAndView viewDefaulterProjects(HttpServletRequest request){
		ModelAndView mv=new ModelAndView("defaulterProjectList");
       DetachedCriteria dt=DetachedCriteria.forClass(ProjectRegistrationModel.class);
       dt.add(Restrictions.eq("status", ReraConstants.REVOKED));
       
       List<ProjectRegistrationModel> list=projectRegDao.getProjectList(dt);
       mv.addObject("projectList", list);
       mv.addObject("totalRecords", list.size());
		return mv;
				
	}
	
	@RequestMapping(value="viewDefaulterAgents")
	public ModelAndView viewDefaulterAgents(HttpServletRequest request){
		ModelAndView mv=new ModelAndView("defaulterAgentList");
		 DetachedCriteria dt=DetachedCriteria.forClass(AgentRegistrationModel.class);
	       dt.add(Restrictions.eq("status", ReraConstants.REVOKED));
	       List<AgentRegistrationModel>  list=agentDao.getAgentList(dt);
	       mv.addObject("agentList", list);
	       mv.addObject("totalRecords", list.size());
		return mv;
				
	}*/
	
	
}
