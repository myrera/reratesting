package in.gov.rera.transaction.home.dao;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import in.gov.rera.common.model.UserModel;

public interface LoginDao {

	public UserModel verifyUser(String loginId,String password);
	
	public UserModel getUserById(Long userId);
	
	public List<UserModel> getUserList(DetachedCriteria dt);
	
	public UserModel updateUser(UserModel user)throws Exception;
	
	public UserModel getByLoginId(String loginId);
	
	public UserModel getByEmail(String email);

}
