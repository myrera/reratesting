package in.gov.rera.admin.dao.impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import in.gov.rera.admin.dao.AuthorityDao;

import in.gov.rera.common.dao.impl.GenericDAOImpl;

import in.gov.rera.transaction.projectregistration.model.ProjectRegistrationModel;


public class AuthorityDaoImpl extends GenericDAOImpl  implements AuthorityDao{

	@Override
	public List<ProjectRegistrationModel> getProjectRegistrationByStatus(
			String status) {
		DetachedCriteria dt= DetachedCriteria.forClass(ProjectRegistrationModel.class);
		dt.add(Restrictions.eq("status", status));
		List<ProjectRegistrationModel> list=getList(dt);
		return list;
	}


	



}
