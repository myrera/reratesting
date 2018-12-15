package in.gov.rera.dms.service;

import in.gov.rera.common.dao.impl.GenericDAOImpl;
import in.gov.rera.dms.beans.Document;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service(value="documentService")
public class DocumentService extends GenericDAOImpl<Document, Integer> implements IDocumentService<Document, Integer>{

	public Integer saveDoc(Document document) throws Exception{
		return super.createEntity(document);
	}
	
	
	public void updateDoc(Document document)throws Exception{
	    super.updateOrUpdateEntity(document);
	}
	
	
	
	public Document getDoc(Integer id)throws Exception{
		return super.findOne(id);
	}
	

}
