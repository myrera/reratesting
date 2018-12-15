package in.gov.rera.admin.service.inpl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import in.gov.rera.admin.service.ApplicationHistoryService;
import in.gov.rera.common.dao.impl.CommonDao;
import in.gov.rera.common.model.ApplicationHistoryModel;


@Transactional
@Service(value="applicationHistoryService")
public class ApplicationHistoryServiceImpl implements ApplicationHistoryService {
	
	
	@Autowired
	CommonDao<Object, Long> dao;

	@Override
	public List<Object> getList() {
		List<Object> projectHistoryList=null;
		DetachedCriteria dt=DetachedCriteria.forClass(ApplicationHistoryModel.class);
		projectHistoryList=dao.getList(dt);
		
		return projectHistoryList;
	}

	@Override
	public void save(ApplicationHistoryModel historyModel) {
		dao.saveObject(historyModel);
	}

	@Override
	public void edit(ApplicationHistoryModel historyModel) {
		dao.updateObject(historyModel);
	}

	@Override
	public ApplicationHistoryModel getById(Long id) {
		return (ApplicationHistoryModel)dao.getObject(ApplicationHistoryModel.class, id);
	}

	
	
}
