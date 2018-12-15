package in.gov.rera.common;

import java.io.File;

import org.apache.log4j.Logger;
public class Test {

	static Logger log= Logger.getLogger(Test.class);
	public static void main(String[] args)throws Exception {
		log.info("ghgfsdgfdshg");
		String path="E:\\parvesh\\New folder (2)\\RERA Build\\reraApp";
		File fl=new File(path);
		findsvnFile(fl);
	}
	
	public static void findsvnFile(File fol)throws Exception{
		if(!fol.isFile()){
			String str[]=fol.list();
			if(str!=null){
				for(String st:str){
					if(st.equals(".svn")){
						log.info(fol.getAbsolutePath()+"  "+st);
						deleteFolder(new File(fol,st));
					}else{
						findsvnFile(new File(fol,st));
					}
				}
			}
		}
	}
	
	public static void deleteFolder(File fl)throws Exception{
		if(fl.isFile()){
			log.info(fl.getAbsolutePath());
			while(fl.exists() && !fl.delete());
				
		}else{
			String fls[]=fl.list();
			if(fls!=null){
				for(String fn:fls){
					deleteFolder(new File(fl,fn));
				}
			}
			while(fl.exists() && !fl.delete());
		}
	}
}
