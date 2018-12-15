package in.gov.rera.admin.service;

import java.util.List;

import in.gov.rera.common.model.ApplicationHistoryModel;


public interface ApplicationHistoryService {

	List<Object> getList();
	void save(ApplicationHistoryModel historyModel);
	void edit(ApplicationHistoryModel historyModel);
	ApplicationHistoryModel getById(Long id);

}
