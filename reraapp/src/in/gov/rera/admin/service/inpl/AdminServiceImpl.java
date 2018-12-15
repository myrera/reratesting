package in.gov.rera.admin.service.inpl;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.Random;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import in.gov.rera.admin.service.AdminService;
import in.gov.rera.common.dao.impl.CommonDao;
import in.gov.rera.common.model.EnquiryModel;
import in.gov.rera.common.model.UserModel;
import in.gov.rera.common.util.ReraConstants;
import in.gov.rera.master.district.model.DistrictModel;
import in.gov.rera.master.stateut.model.StateUtModel;
import in.gov.rera.master.subdistrict.model.SubDistrictModel;
import in.gov.rera.notification.service.MailService;
import org.apache.log4j.Logger;

@Service(value="adminService")
public class AdminServiceImpl implements AdminService {
	static Logger log= Logger.getLogger(AdminServiceImpl.class);
	@Autowired
	CommonDao<Object, Long> dao;
	
	@Autowired
	MailService mailService;
	
	@Override
	public List<Object> getUserList() {
		List<Object> userList=null;
		DetachedCriteria dt=DetachedCriteria.forClass(UserModel.class);
		/*dt.add(Restrictions.or(Restrictions.eq("userType", ReraConstants.AUTHORITY_USER), Restrictions.eq("userType", ReraConstants.OPERATOR_USER)));
		dt.add(Restrictions.or(Restrictions.eq("userType", ReraConstants.HELPDESK_LEGAL), Restrictions.eq("userType", ReraConstants.HELPDESK_MANAGER)));
		dt.add(Restrictions.eq("userType", ReraConstants.HELPDESK_TECHNICAL));*/
		
		
		userList=dao.getList(dt);
		
		
		return userList;
	}

	@Override
	public void saveUser(UserModel user) {
	user.setCreatedOn(Calendar.getInstance());
	user.setStatus(ReraConstants.ACTIVE_USER);
	
	if(user.getPassword()==null)
	user.setPassword(generatePassword());
	
	dao.saveObject(user);
	
	EnquiryModel em=new EnquiryModel();
	em.setEmailId(user.getEmailId());
	em.setSubject("RERA User Credential");
	StringBuffer sb=new StringBuffer();
	sb.append("Dear ").append(user.getUserName()).append(",\n");
	sb.append("Your user account has been successfuly created in rera portal.");
	sb.append("Role : ").append(user.getUserType()).append("\n");
	sb.append("Login ID : ").append(user.getLoginId()).append("\n");
	sb.append("Password : ").append(user.getPassword()).append("\n \n\n\n");
	sb.append("Regards : \n ").append("Portal Admin");
	
		em.setEnquiryText(sb.toString());
		mailService.sendMail(em);
	}

	@Override
	public void editUser(UserModel user) {
		dao.updateObject(user);
		
	}

	@Override
	public UserModel getUserById(Long id) {
		
		return (UserModel)dao.getObject(UserModel.class, id);
	}
	
	@Override
	public UserModel getUserByLoginId(String id) {
		UserModel user=null;
		DetachedCriteria dt=DetachedCriteria.forClass(UserModel.class);
		dt.add(Restrictions.eq("loginId",id));
		
		List<Object> lst=dao.getList(dt);
		if(lst!=null && lst.size()>0 && lst.get(0)!=null){
			user=(UserModel)lst.get(0);
		}
		return null;
	}

	private static String generatePassword(){
		int digit=0;
		Random rn=new Random();
		StringBuffer sb=new StringBuffer();
		while(digit<8){
			sb.append(chars.charAt(rn.nextInt(36))); 
			digit++;
		}
		return sb.toString();
	}

	private static String chars="ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
	public static void main(String[] args) {
		log.info(generatePassword());
	}

	@Override
	public List<Object> getStateList() {
		List<Object> slst=null;
		DetachedCriteria dt=DetachedCriteria.forClass(StateUtModel.class);
		slst=dao.getList(dt);
		Collections.sort(slst,new Comparator<Object>() {

			@Override
			public int compare(Object o1, Object o2) {
				StateUtModel st1=(StateUtModel)o1;
				StateUtModel st2=(StateUtModel)o2;
				return st1.getStateUtName().compareTo(st2.getStateUtName());
			}
		});
		return slst;
	}

	@Override
	public List<Object> getDistrictList(Long stateId) {
		List<Object> slst=null;
		StateUtModel st=(StateUtModel)dao.getObject(StateUtModel.class, stateId);
		slst=new ArrayList<Object>(st.getDistrictModelSet());
		
		Collections.sort(slst,new Comparator<Object>() {

			@Override
			public int compare(Object o1, Object o2) {
				DistrictModel st1=(DistrictModel)o1;
				DistrictModel st2=(DistrictModel)o2;
				return st1.getDistrictName() .compareTo(st2.getDistrictName());
			}
		});
		return slst;
		
	}

	@Override
	public List<Object> getSubDistrictList(Long distId) {
		List<Object> slst=null;
		DistrictModel st=(DistrictModel)dao.getObject(DistrictModel.class, distId);
		slst=new ArrayList<Object>(st.getSubDistrictModelSet());
		
		Collections.sort(slst,new Comparator<Object>() {

			@Override
			public int compare(Object o1, Object o2) {
				SubDistrictModel st1=(SubDistrictModel)o1;
				SubDistrictModel st2=(SubDistrictModel)o2;
				return st1.getSubDistrictName() .compareTo(st2.getSubDistrictName());
			}
		});
		return slst;
	}

	@Override
	public void addNewStateUt(StateUtModel dist) {
		dao.saveObject(dist);
		
	}

	@Override
	public void addNewDistrict(DistrictModel dist,Long stateId) {
		StateUtModel st=(StateUtModel)dao.getObject(StateUtModel.class, stateId);
		if(st.getDistrictModelSet()==null){
			st.setDistrictModelSet(new HashSet<DistrictModel>());
		}
		dist.setStateUtModel(st);
		st.getDistrictModelSet().add(dist);
		dao.updateObject(st);
		
	}

	@Override
	public void addNewSubDistrict(SubDistrictModel subdist,Long distId) {
		DistrictModel dm=(DistrictModel)dao.getObject(DistrictModel.class, distId);
		if(dm.getSubDistrictModelSet()==null){
			dm.setSubDistrictModelSet(new HashSet<SubDistrictModel>());
		}
		subdist.setDistrictModel(dm);
		dm.getSubDistrictModelSet().add(subdist);
		dao.updateObject(dm);
	}

	@Override
	public void updateStateUt(StateUtModel dist) {
		dao.updateObject(dist);
		
	}

	@Override
	public void updateDistrict(DistrictModel dist) {
		dao.updateObject(dist);
		
	}

	@Override
	public void updateSubDistrict(Long subdistId,String name) {
		SubDistrictModel sub=(SubDistrictModel)dao.getObject(SubDistrictModel.class, subdistId);
		sub.setSubDistrictName(name);
		dao.updateObject(sub);
		
	}
}

