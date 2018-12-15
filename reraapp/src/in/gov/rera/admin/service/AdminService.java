package in.gov.rera.admin.service;

import in.gov.rera.common.model.UserModel;
import in.gov.rera.master.district.model.DistrictModel;
import in.gov.rera.master.stateut.model.StateUtModel;
import in.gov.rera.master.subdistrict.model.SubDistrictModel;

import java.util.List;

public interface AdminService {

	List<Object> getUserList();
	void saveUser(UserModel user);
	void editUser(UserModel user);
	UserModel getUserById(Long id);
	UserModel getUserByLoginId(String id);
	
	List<Object> getStateList();
	List<Object> getDistrictList(Long stateId);
	List<Object> getSubDistrictList(Long distId);
	
	void addNewStateUt(StateUtModel dist);
	void addNewDistrict(DistrictModel dist, Long stateId);
	void addNewSubDistrict(SubDistrictModel subdist,Long distId);
	
	void updateStateUt(StateUtModel dist);
	void updateDistrict(DistrictModel dist);
	void updateSubDistrict(Long id, String name);
}
