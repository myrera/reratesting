package in.gov.rera.transaction.home.dao.impl;

import java.util.List;

import in.gov.rera.common.dao.impl.GenericDAOImpl;
import in.gov.rera.common.model.UserModel;
import in.gov.rera.transaction.home.dao.LoginDao;
import in.gov.rera.transaction.projectregistration.model.ProjectRegistrationModel;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository(value = "LoginDAO")
public class LoginDaoImpl extends GenericDAOImpl<UserModel, Long> implements LoginDao {

	
	
	
	
	public UserModel verifyUser(String loginId,String password){
		UserModel user=null;
		DetachedCriteria dt= DetachedCriteria.forClass(UserModel.class);
		dt.add(Restrictions.eq("loginId", loginId));
		dt.add(Restrictions.eq("password", password));
		
		List<UserModel> userList=getList(dt);
		if(userList!=null && userList.size()>0){
			user=userList.get(0);
		}
		return user;
	}
	
	public UserModel getByLoginId(String loginId){
		UserModel user=null;
		DetachedCriteria dt= DetachedCriteria.forClass(UserModel.class);
		dt.add(Restrictions.eq("loginId", loginId));
		
		List<UserModel> userList=getList(dt);
		if(userList!=null && userList.size()>0){
			user=userList.get(0);
		}
		return user;
	}
	
	public UserModel getByEmail(String email){
		UserModel user=null;
		DetachedCriteria dt= DetachedCriteria.forClass(UserModel.class);
		dt.add(Restrictions.eq("emailId", email));
		
		List<UserModel> userList=getList(dt);
		if(userList!=null && userList.size()>0){
			user=userList.get(0);
		}
		return user;
	}
	
	public UserModel getUserById(Long userId){
		
		return super.getEntity(userId);
	}
	
	public List<UserModel> getUserList(DetachedCriteria dt){
		return super.getList(dt);
	}

	@Override
	public UserModel updateUser(UserModel user) throws Exception{
		
			super.updateEntity(user);
	
		 
		 return user;
		
	}
	
	
}
