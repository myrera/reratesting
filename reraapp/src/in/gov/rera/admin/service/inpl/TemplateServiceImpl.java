package in.gov.rera.admin.service.inpl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import in.gov.rera.admin.service.TemplateService;
import in.gov.rera.common.dao.impl.CommonDao;
import in.gov.rera.common.model.TemplateModel;
import in.gov.rera.common.util.ReraConstants;


@Service(value="templateService")
public class TemplateServiceImpl implements TemplateService{
	
	@Autowired
	CommonDao<TemplateModel, Long> dao;

	@Override
	public List<Object> getTemplateList() {
		List<Object> templateList=null;
		DetachedCriteria dt=DetachedCriteria.forClass(TemplateModel.class);
		templateList = dao.getList(dt);
		return templateList;
	}
	
	@Override
	public List<Object> getTemplateListByType(String type) {
		List<Object> templateList=null;
		DetachedCriteria dt=DetachedCriteria.forClass(TemplateModel.class);
		templateList = dao.getList(dt);
		List<Object> typeList=new ArrayList<Object>();
		for (Object object : templateList) {
			if(type.equalsIgnoreCase(((TemplateModel)object).getType())){
				typeList.add(object);
			}
			
		}
		
		return typeList;
	}

	

}
