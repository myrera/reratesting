package in.gov.rera.common.security;

import org.springframework.web.multipart.MultipartFile;

import org.apache.log4j.Logger;
public class FileSecurity {
	static Logger log= Logger.getLogger(FileSecurity.class);

private static final String mimetype[]={"application/pdf","image/png","image/jpg","image/jpeg"};
private static final String extensions[]={".pdf",".png",".jpg",".jpeg"};
	
	public static boolean checkFileType(MultipartFile file){
	/*	if(file==null){
			return true;
		}
		else
		{
			
	if(file.getSize()>10 &&	file.getContentType()!=null){
		String ctype=file.getContentType();
		int xx=0;
		for(String type:mimetype){
			if(type.equalsIgnoreCase(ctype)){
				String fname=file.getOriginalFilename();
				
				char ch[]=fname.toCharArray();
				int x=0;
				for(char c:ch){
					if(c=='.'){
						x++;
					}
				}
				if(x==1){
				if(fname.toLowerCase().endsWith(extensions[xx])){
					return true;
				}
				}
			}
			xx++;
		}
	}	else{
		return true;
	}
		}		
		return false;*/
		return true;
	}
	
	
	public static boolean checkFileType(MultipartFile[] file){
		/*if(file==null){
			return true;
		}
		else
		{
		for(MultipartFile fl:file){
			if(! checkFileType(fl)){
				return false;
			}
		}	
		}		*/
		return true;
	}
	
	public static boolean checkFileSize(String[] fileName,MultipartFile[] file){
	/*	int size=fileName.length;
		for(int i=0;i<size;i++){
			if(fileName[i]!=null && !fileName[i].equalsIgnoreCase("encumbranceCertificateDoc") && !fileName[i].equalsIgnoreCase("approveSacPlanDoc") &&
					!fileName[i].equalsIgnoreCase("approveLayoutPlanDoc") && !fileName[i].equalsIgnoreCase("agreementFileDoc") &&
					!fileName[i].equalsIgnoreCase("sanctionedLayoutPlanDoc") && !fileName[i].equalsIgnoreCase("brochureOfCurrentProjectDoc") &&
					!fileName[i].equalsIgnoreCase("areaDevelopmentDoc")){
				if(file[i]!=null && file[i].getSize()>(1024*1024)){
					log.info(file[i].getSize()+"   file size()   "+""+file[i].getOriginalFilename());
					return false;
				}
			}
		}*/
		return true;
	}
	
	public static boolean checkFileSize(MultipartFile[] file){
		/*if(file!=null && file.length>0){
			for(MultipartFile fl:file){
				if(fl!=null && fl.getSize()>(1024*1024)){
					log.info(fl.getSize()+"   file size()   "+fl.getOriginalFilename());
					return false;
				}
			}
		}*/
		return true;
	}
	
	public static boolean checkFileSize(MultipartFile file){
		if(file!=null && file.getSize()>(1024*1024)){
			log.info(file.getSize()+"   file size()   "+file.getOriginalFilename());
					return false;
				}
		
		return true;
	}
	
}
