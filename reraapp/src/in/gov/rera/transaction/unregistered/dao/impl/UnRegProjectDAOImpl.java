package in.gov.rera.transaction.unregistered.dao.impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.stereotype.Repository;

import in.gov.rera.common.dao.impl.GenericDAOImpl;
import in.gov.rera.transaction.projectregistration.model.ProjectRegistrationModel;
import in.gov.rera.transaction.unregistered.dao.IUnRegProjectDAO;
import in.gov.rera.transaction.unregistered.model.UnregisteredProjectDetail;
@Repository(value = "unRegProjectDAO")
public class UnRegProjectDAOImpl extends GenericDAOImpl<UnregisteredProjectDetail, Long> implements IUnRegProjectDAO<UnregisteredProjectDetail, Long> {

	@Override
	public List<UnregisteredProjectDetail> getunregProjectList(DetachedCriteria dt) {
		return super.getList(dt);
	}

	@Override
	public void update(UnregisteredProjectDetail entity) {
		super.updateEntity(entity);

	}
	
	@Override
	public UnregisteredProjectDetail get(Long pk) {
		return super.findOne(pk);
	}

	@Override
	public void saveOrUpdateUnregProjectDetails(UnregisteredProjectDetail unregisteredProjectDetail) {
		super.createEntity(unregisteredProjectDetail);
		
	}

	@Override
	public void delete(Long unregProjectDetailsId) {
		super.deleteById(unregProjectDetailsId);
		
	}

}
