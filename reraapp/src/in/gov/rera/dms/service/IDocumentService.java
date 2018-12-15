package in.gov.rera.dms.service;

import in.gov.rera.dms.beans.Document;

public interface IDocumentService <E,PK>{
	
	public Integer saveDoc(E document) throws Exception;
	
	
	public void updateDoc(E document)throws Exception;
	
	
	public Document getDoc(PK id)throws Exception;
	
}
