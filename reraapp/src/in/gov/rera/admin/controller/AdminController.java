package in.gov.rera.admin.controller;

import java.util.List;

import in.gov.rera.admin.service.AdminService;
import in.gov.rera.common.dao.impl.CommonDao;
import in.gov.rera.common.model.UserModel;
import in.gov.rera.master.district.dao.IDistrictDAO;
import in.gov.rera.master.district.model.DistrictModel;
import in.gov.rera.master.stateut.model.StateUtModel;
import in.gov.rera.master.stateut.service.IStateUtService;
import in.gov.rera.master.subdistrict.model.SubDistrictModel;
import in.gov.rera.master.zone.model.ZoneModel;
import in.gov.rera.notification.service.MailService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.apache.log4j.Logger;

 
@Controller(value="AdminController")
@Scope("request")
public class AdminController {

	static Logger log= Logger.getLogger(AdminController.class);
	
	
	@Autowired
	HttpSession httpSession;
	
	@Autowired
	AdminService adminService;
	
	@Autowired
	MailService mailService;
	
	@Autowired
	CommonDao<Object, Long> commonDao;
	
	
	@RequestMapping(value="admin/dashboard")
	public ModelAndView dashboard(HttpServletRequest request){
		
		return new ModelAndView("admin.dashbord");
		
		
	}
	
	
	@RequestMapping(value="admin/manageUsers")
	public ModelAndView manageUsers(HttpServletRequest request){
		ModelAndView mv=new ModelAndView("admin.manageUsersList");
		List<Object> users=adminService.getUserList();
		mv.addObject("userList", users);
		if(users!=null)
		mv.addObject("userCount", users.size());
		
		return mv;
		
		
	}
	
	@RequestMapping(value="admin/newUserForm")
	public ModelAndView newUserForm(HttpServletRequest request){
		ModelAndView mv=new ModelAndView("admin.newUserForm");
		DetachedCriteria dt=DetachedCriteria.forClass(ZoneModel.class);
		mv.addObject("userModel", new UserModel());
		return mv;
		
		
	}
	
	@RequestMapping(value="admin/editUserForm")
	public ModelAndView editUserForm(@RequestParam("USER_ID") Long userId){
		ModelAndView mv=new ModelAndView("admin.editUserForm");
		UserModel user=adminService.getUserById(userId);
		mv.addObject("userModel", user);
		return mv;
		
		
	}
	
	@RequestMapping(value="admin/updateUser")
	public ModelAndView updateUser(@ModelAttribute("userModel") UserModel user){
		UserModel um=adminService.getUserById(user.getUserId());
		um.setEmailId(user.getEmailId());
		um.setUserName(user.getUserName());
		um.setStatus(user.getStatus());
		um.setUserType(user.getUserType());
um.setAuthorityType(user.getAuthorityType());
		adminService.editUser(um);
		return new ModelAndView("redirect:manageUsers");
		
		
	}
	
	@RequestMapping(value="admin/createNewUser")
	public ModelAndView saveUser(@ModelAttribute("userModel") UserModel user){
		user.setPassword("password123");
		adminService.saveUser(user);
		return new ModelAndView("redirect:manageUsers");
		
		
	}
	
	

	
	
	
	
	@RequestMapping(value="admin/viewAllStateUT")
	public ModelAndView viewAllStateUT(){
		ModelAndView mv=new ModelAndView("admin.viewAllStateUT");
		List<Object> lst=adminService.getStateList();
		mv.addObject("stateList", lst);
		if(lst!=null)
		mv.addObject("stateCount",lst.size());
		return mv;
		
	}
	
	

	@RequestMapping(value="admin/updateStateUT")
	public ModelAndView updateStateUT(@RequestParam("stateUtId")Long stateUtId,
			@RequestParam("stateUtCode")String stateUtCode,@RequestParam("stateUtName")String stateUtName){
		try{
		StateUtModel st=stateService.getStateByID(stateUtId);
		st.setStateUtCode(stateUtCode);
		st.setStateUtName(stateUtName);
	     adminService.updateStateUt(st);
		}catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		
		return new ModelAndView("redirect:viewAllStateUT");
		
		
	}
	
	@RequestMapping(value="admin/createStateUT")
	public ModelAndView saveStateUT(	@RequestParam("stateUtCode")String stateUtCode,
			@RequestParam("stateUtName")String stateUtName){
		StateUtModel state=new StateUtModel();
		state.setStateUtCode(stateUtCode);
		state.setStateUtName(stateUtName);
		adminService.addNewStateUt(state);
		return new ModelAndView("redirect:viewAllStateUT");
		
		
	}
	
	
	
	
	@RequestMapping(value="admin/viewAllDistrict")
	public ModelAndView viewAllDistrict(@RequestParam("STATEUT_ID") Long stateId){
		ModelAndView mv=new ModelAndView("admin.viewAllDistrict");
		try{
			List<Object> lst=adminService.getDistrictList(stateId);
		mv.addObject("stateUt", stateService.getStateByID(stateId));
		if(lst!=null)
		mv.addObject("distCount", lst.size());
		mv.addObject("districtList", lst);
		}catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return mv;
		
		
	}
	
	
	
	
	
	@RequestMapping(value="admin/updateDistrict")
	public ModelAndView newDistrictForm(@RequestParam("stateutId") Long stateId,@RequestParam("districtId") Long districtId,
			@RequestParam("districtCode")String districtCode,@RequestParam("districtName")String districtName){
	
		try{
	DistrictModel dist=distDao.getDistirctById(districtId);
	dist.setDistrictCode(districtCode);
	dist.setDistrictName(districtName);
	adminService.updateDistrict(dist);
		}catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return new ModelAndView("redirect:viewAllDistrict?STATEUT_ID="+stateId);
		
		
	}
	
	@RequestMapping(value="admin/saveDistrict")
	public ModelAndView saveDistrict(@RequestParam("stateUtId")Long stateId,
			@RequestParam("districtCode")String districtCode,@RequestParam("districtName")String districtName){
		DistrictModel dist=new DistrictModel();
		dist.setDistrictCode(districtCode);
		dist.setDistrictName(districtName);
		adminService.addNewDistrict(dist, stateId);
		return new ModelAndView("redirect:viewAllDistrict?STATEUT_ID="+stateId);
		
		
	}
	
	
	
	
	
	
	
	
	@RequestMapping(value="admin/viewAllSubDistrict")
	public ModelAndView viewAllSubDistrict(@RequestParam("DIST_ID") Long distId){
		ModelAndView mv=new ModelAndView("admin.viewAllSubDistrict");
		try{
			List<Object> lst=adminService.getSubDistrictList(distId);
			if(lst!=null)
				mv.addObject("subDistCount",lst.size());
		mv.addObject("subDistrictList",lst);
		mv.addObject("district", distDao.getDistirctById(distId));
		}
		catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return mv;
		
		
	}
	
	

	@RequestMapping(value="admin/updateSubDistrict")
	public ModelAndView newSubDistrictForm(@RequestParam("districtId")Long distId,
			@RequestParam("subDistrictId")Long subDistrictId,@RequestParam("subDistrictName")String subDistrictName){
		
		try{
			adminService.updateSubDistrict(subDistrictId, subDistrictName);
	
		}catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return new ModelAndView("redirect:viewAllSubDistrict?DIST_ID="+distId);
		
		
	}
	
	@RequestMapping(value="admin/saveSubDistrict")
	public ModelAndView saveSubDistrict(@RequestParam("subDistrictName")String subDistrictName,@RequestParam("districtId")Long distId){
	
		SubDistrictModel model=new SubDistrictModel();
		model.setSubDistrictName(subDistrictName);
		adminService.addNewSubDistrict(model, distId);
		return new ModelAndView("redirect:viewAllSubDistrict?DIST_ID="+distId);
		
		
	}
	
	
	
	@Autowired
	IStateUtService<StateUtModel, Long> stateService;
	
	@Autowired
	IDistrictDAO<DistrictModel, Long> distDao;
	
}
