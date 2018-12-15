package in.gov.rera.transaction.unregistered.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import in.gov.rera.transaction.unregistered.model.UnregisteredProjectDetail;

public interface IUnRegService {
	
    Long saveOrUpdateUnRegProject(UnregisteredProjectDetail enitity)throws Exception;
    UnregisteredProjectDetail getProjectRegByPk(Long pk)throws Exception;
    
    public List<UnregisteredProjectDetail> getViewAllProjects();
    
    public void delete(Long unregProjectDetailsId);
	Long editUnProjectRegistration(UnregisteredProjectDetail enitity) throws Exception;
	void editUnRegProject(UnregisteredProjectDetail project, HttpServletRequest request);
}
