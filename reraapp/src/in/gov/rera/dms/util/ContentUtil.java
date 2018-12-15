package in.gov.rera.dms.util;

import in.gov.rera.dms.beans.Document;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.Date;
import java.util.ResourceBundle;

import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Service;
import org.apache.log4j.Logger;

@Service(value="contentUtil")
@Scope(value="request",proxyMode=ScopedProxyMode.TARGET_CLASS)
public class ContentUtil {

	static Logger log= Logger.getLogger(ContentUtil.class);
	public  static String REPOSITORY_PATH = "";
	private String folderName;
	private String docType;
	private Document doc;
	
	static{
		try{
			ResourceBundle rb=ResourceBundle.getBundle("in.gov.rera.common.config.RERAProperties");
			REPOSITORY_PATH=rb.getString("DMS_FOLDER_PATH");
		}
		catch(Exception ex){
			log.error(ex.getMessage(),ex);
		}
	}
	
	public  boolean saveDocument(Document document){
		this.doc=document;
		this.folderName=document.getFolderId();
		this.docType=document.getDocumentType();
		try{
		if(!isProjectFolderExists()){
			createProjectDir();
		}
		  saveDocument(doc.getInputStream());
		}
		catch (Exception e) {
			log.error(e.getMessage(),e);
			return false;
		}
	     return true;	
	}
	
	public  boolean removeDocument(Document document){
		this.doc=document;
		this.folderName=document.getFolderId();
		this.docType=document.getDocumentType();
		try{
		File fl=new File(REPOSITORY_PATH+docType+"/"+folderName+"/"+document.getDocumentName());
		  while(fl.exists()){
			  fl.delete();
		  }
		}
		catch (Exception e) {
			log.error(e.getMessage(),e);
			return false;
		}
	     return true;	
	}
	
	private void saveDocument(InputStream in)throws Exception{
		
		String fileName=getFileName();
		FileOutputStream out=new FileOutputStream(REPOSITORY_PATH+docType+"/"+folderName+"/"+fileName);
		byte bt[]=new byte[in.available()];
		while(in.read(bt)!=-1){
			out.write(bt);
		}
		
		in.close();
		out.close();
		this.doc.setDocumentName(fileName);
	}
	
	
	private String getFileName(){
		String st=doc.getFileName();
		
		String fname=st.substring(0,st.lastIndexOf("."));
		
		String ext=st.substring(st.lastIndexOf(".")+1);
		
		
		return fname+"_"+new Date().getTime()+"."+ext;
	}
	
	private boolean createProjectDir(){
		File folder=new File(REPOSITORY_PATH+docType);
		folder.mkdir();
		File folder1=new File(folder.getAbsolutePath()+"/"+folderName);
		return	folder1.mkdir();
	}
	
	private boolean isProjectFolderExists(){
		File folder=new File(REPOSITORY_PATH+docType+"/"+folderName);
		return folder.exists();
	}
}
