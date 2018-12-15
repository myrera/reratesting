package in.gov.rera.transaction.unregistered.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import in.gov.rera.common.dao.impl.CommonDao;
import in.gov.rera.common.util.ReraConstants;
import in.gov.rera.transaction.postregistration.service.impl.PostRegServiceImpl;
import in.gov.rera.transaction.projectregistration.model.ProjectRegistrationModel;
import in.gov.rera.transaction.unregistered.dao.IUnRegProjectDAO;
import in.gov.rera.transaction.unregistered.model.UnregisteredProjectDetail;
import in.gov.rera.transaction.unregistered.service.IUnRegService;

@Service(value = "unRegService")
@Scope("request")
public class UnRegServiceImpl  implements IUnRegService  {
	static Logger log= Logger.getLogger(PostRegServiceImpl.class);
	@Autowired
	IUnRegProjectDAO<UnregisteredProjectDetail, Long> unRegDAO;
	
	@Autowired
	CommonDao<Object, Long> commonDao;

	@Override
	public Long saveOrUpdateUnRegProject(UnregisteredProjectDetail unRegProj) throws Exception {
		unRegDAO.saveOrUpdateUnregProjectDetails(unRegProj);
		return unRegProj.getUnregProjectDetailsId();
	}
	

	@Override
	public List<UnregisteredProjectDetail> getViewAllProjects() {
		DetachedCriteria dt = DetachedCriteria.forClass(UnregisteredProjectDetail.class);
		/*dt.add(Restrictions.ne("status", ReraConstants.SAVE_AS_DRAFT));
		dt.add(Restrictions.ne("status", ReraConstants.REVOKED));
		dt.addOrder(Order.asc("applicationNo"));*/
		return unRegDAO.getunregProjectList(dt);
	}


	@Override
	public UnregisteredProjectDetail getProjectRegByPk(Long pk) throws Exception {
		return unRegDAO.get(pk);
	}
	
	@Override
	public Long editUnProjectRegistration(UnregisteredProjectDetail enitity) throws Exception {
		unRegDAO.update(enitity);
		return enitity.getUnregProjectDetailsId();
	}



	@Override
	public void delete(Long unregProjectDetailsId) {
		unRegDAO.delete(unregProjectDetailsId);
	}


	@Override
	public void editUnRegProject(UnregisteredProjectDetail project, HttpServletRequest request) {
		project.setCorpAddress(request.getParameter("corpAddress"));
		project.setDistrict(request.getParameter("district"));
		project.setEmailID(request.getParameter("emailID"));
		project.setPhoneNumber(Long.parseLong(request.getParameter("phoneNumber")));
		project.setPinCode(Long.parseLong(request.getParameter("pinCode")));
		project.setProjectLocation(request.getParameter("projectLocation"));
		project.setProjectName(request.getParameter("projectName"));
		project.setPromoterName(request.getParameter("promoterName"));
		project.setTaluk(request.getParameter("taluk"));
		project.setWebsiteAddress(request.getParameter("websiteAddress"));
		unRegDAO.update(project);
	}
	

}
 