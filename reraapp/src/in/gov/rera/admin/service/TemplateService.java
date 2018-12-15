package in.gov.rera.admin.service;

import java.util.List;

import in.gov.rera.common.model.TemplateModel;


public interface TemplateService {

	List<Object> getTemplateList();

	List<Object> getTemplateListByType(String type); 
	
	// void saveTemplate( TemplateModel templateModel );
	
}
