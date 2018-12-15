package in.gov.rera.transaction.home.service.impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import in.gov.rera.common.dao.impl.CommonDao;
import in.gov.rera.common.model.EnquiryModel;
import in.gov.rera.common.model.UserModel;
import in.gov.rera.common.util.BaseEncryptor;
import in.gov.rera.common.util.ReraConstants;
import in.gov.rera.notification.service.MailService;
import in.gov.rera.transaction.agentregistration.model.AgentRegistrationModel;
import in.gov.rera.transaction.home.dao.LoginDao;
import in.gov.rera.transaction.home.service.LoginService;
import in.gov.rera.transaction.projectregistration.model.ProjectRegistrationModel;

import org.apache.log4j.Logger;

@Service(value="loginService")
@Scope("request")
public class LoginServiceImpl implements LoginService {
	static Logger log= Logger.getLogger(LoginServiceImpl.class);
	
	@Autowired
	LoginDao loginDAO;
	
	
	public UserModel login(String loginId,String password){
		
		UserModel user=loginDAO.getByLoginId(loginId);
		
		if(user==null) return null;
		
		BaseEncryptor encryptor=new BaseEncryptor();
		if(encryptor.checkPassword(password, user.getPassword())){
			return user;
		}else{
			user=	loginDAO.verifyUser(loginId, password);
			
			if(user!=null){
				try {
					user.setPassword(encryptor.encrypt(password));
					loginDAO.updateUser(user);
				} catch (Exception e) {
					log.error(e.getMessage(),e);
				}
			}
		}
		
		
		return user;
	}


	@Override
	public UserModel getUserById(Long userId) {
		// TODO Auto-generated method stub
		return loginDAO.getUserById(userId);
	}
	
	@Override
	public UserModel getUserByEmail(String emailId) {
		// TODO Auto-generated method stub
		return loginDAO.getByEmail(emailId);
	}
	
public List<UserModel> getUserListByRole(String role){
		
		DetachedCriteria dt=DetachedCriteria.forClass(UserModel.class);
		
		dt.add(Restrictions.eq("userType", role));
		
		return loginDAO.getUserList(dt);
		
	}


@Override
public UserModel updatePassword(String loginId, String oldpassword,String newpass) throws Exception {
	UserModel user=login(loginId, oldpassword);
	if(user!=null){
		user.setPassword(newpass);
		loginDAO.updateUser(user);
	}
	return user;
}

@Autowired
CommonDao<Object, Long> dao; 
@Autowired
MailService mailService;

@Override
public boolean retrievePassword(String uType, String regNo) throws Exception {
	String emailId=null;
	String pass=null;
	boolean flag=false;
	
	DetachedCriteria dt=null;
	if(uType.equals("AGENT")){
		dt=DetachedCriteria.forClass(AgentRegistrationModel.class);
		dt.add(Restrictions.eq("agentRegistrationNo", regNo));
		dt.add(Restrictions.eq("status", ReraConstants.APPROVED));
		List<Object> lst=dao.getList(dt);
		if(lst!=null && lst.size()>0 && lst.get(0)!=null){
			flag=true;
			AgentRegistrationModel object=(AgentRegistrationModel)lst.get(0);
			pass=object.getAgentUser().getPassword();
			emailId=object.getAgentDetailsModel().getAgentEmailId();
		}
	}else{
		dt=DetachedCriteria.forClass(ProjectRegistrationModel.class);
		dt.add(Restrictions.eq("projectRegistrationNo", regNo));
		dt.add(Restrictions.eq("status", ReraConstants.APPROVED));
		List<Object> lst=dao.getList(dt);
		if(lst!=null && lst.size()>0 && lst.get(0)!=null){
			flag=true;
			ProjectRegistrationModel object=(ProjectRegistrationModel)lst.get(0);
			pass=object.getProjectUser().getPassword();
			emailId=object.getPromoterDetailsModel().getEmailId();
	}
	}
	
	if(flag){
		EnquiryModel enq=new EnquiryModel();
		enq.setSubject("RERA Protal Login Credential");
		StringBuffer sb=new StringBuffer();
		sb.append("Dear User,\n").append("Your login credential is as below:\n").append("Login Id/Registration No. :").append(regNo).append("\n");
		sb.append("Password : ").append(pass).append("\n\n\n");
		sb.append("Regards:\n").append("Real Estate Regulatory Authority ");
		
		
		enq.setEnquiryText(sb.toString());
		enq.setEmailId(emailId);
		
		
		mailService.sendMail(enq);
	}
	
	return flag;
}
}
