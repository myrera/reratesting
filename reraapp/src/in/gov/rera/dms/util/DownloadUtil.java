package in.gov.rera.dms.util;

import java.io.FileInputStream;

import in.gov.rera.dms.beans.Document;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

@Service(value="downloadUtil")
public class DownloadUtil {

	
	private Document doc;
	public  void download(HttpServletResponse response, Document document)throws Exception{
		
		this.doc=document;
		
		response.setContentType(document.getMimeType());
		response.setHeader( "Content-Disposition", "attachment;filename="
			      + document.getFileName() );
		response.getOutputStream().write(getBytes());
		response.getOutputStream().close();
		
		
	}
	
	
public  void getImage(HttpServletResponse response, Document document)throws Exception{
		
		this.doc=document;
		
		response.setContentType(document.getMimeType());
		response.getOutputStream().write(getBytes());
		response.getOutputStream().close();
		
		
	}
	
	private byte[] getBytes() throws Exception{
		 byte[] bt=null;
		 
		 FileInputStream in=new FileInputStream(ContentUtil.REPOSITORY_PATH+this.doc.getDocumentType()+"/"+this.doc.getFolderId()+"/"+this.doc.getDocumentName());
		 bt=new byte[in.available()];
		 in.read(bt);
		 in.close();
		 return bt;
	}
}
