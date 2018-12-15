package in.gov.rera.transaction.home.service;

import java.util.List;

import in.gov.rera.common.model.UserModel;

public interface LoginService {

	public UserModel login(String loginId,String password);
	
	public UserModel getUserById(Long userId);
	
	public List<UserModel> getUserListByRole(String role);
	
	public UserModel updatePassword(String loginId,String password,String newpass) throws Exception;

    public boolean retrievePassword(String uType,String regNo) throws Exception;

	UserModel getUserByEmail(String emailId);


}
