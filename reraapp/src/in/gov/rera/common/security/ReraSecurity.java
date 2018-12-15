package in.gov.rera.common.security;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
public class ReraSecurity {

	static Logger log= Logger.getLogger(ReraSecurity.class);
	private static final String securityParam="AUTH_PARAM";

public static boolean isValidRequest(HttpServletRequest request){
	boolean flag=false;
	String paramName=request.getParameter(securityParam);
	if(paramName==null){
		log.info("Token Not Found ::: ");
		return true; 
	}
	else{
	String value=request.getParameter(paramName);
	if(value!=null){
	HttpSession ses=request.getSession(true);
	
	Map<String, String> securityMap=(Map)ses.getAttribute("rera.securityMap");
	if(securityMap!=null){
		if(securityMap.containsKey(paramName)){
			if(value.equals(securityMap.get(paramName))){
				securityMap.remove(paramName);
				flag=true;
			}
		}}
	}
	}
	log.info("Invalid Request::: ");
    return flag;

}

public static String writeToken(HttpServletRequest request){
	StringBuffer sb=new StringBuffer();
	HttpSession ses=request.getSession(true);
	Map<String, String> securityMap=(Map)ses.getAttribute("rera.securityMap");
	if(securityMap==null){
		securityMap=new HashMap<String,String>();
		ses.setAttribute("rera.securityMap", securityMap);
	}
	String key=getRandomKey();
	String value=getRandomValue();
	securityMap.put(key, value);
	
	sb.append("<input type='hidden' name='AUTH_PARAM' value='").append(key).append("' />  ");

	sb.append(" <input type='hidden' name='").append(key).append("' value='").append(value).append("' />  ");
	
	
	
	return sb.toString();
}


private static String getRandomKey(){
	String SALTCHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    StringBuilder salt = new StringBuilder();
    Random rnd = new Random();
    while (salt.length() < 8) { // length of the random string.
        int index = (int) (rnd.nextFloat() * SALTCHARS.length());
        salt.append(SALTCHARS.charAt(index));
    }
    String saltStr = salt.toString();
    return saltStr;
}


private static String getRandomValue(){
	String SALTCHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
    StringBuilder salt = new StringBuilder();
    Random rnd = new Random();
    while (salt.length() < 16) { // length of the random string.
        int index = (int) (rnd.nextFloat() * SALTCHARS.length());
        salt.append(SALTCHARS.charAt(index));
    }
    String saltStr = salt.toString();
    return saltStr;
}


public static boolean checkScript(HttpServletRequest request){
	Map<String,String[]> paramMap=request.getParameterMap();
	if(paramMap!=null){
		for(String key:paramMap.keySet()){
			String val[]=paramMap.get(key);{
				if(val!=null && val.length>0){
					for(String value:val){
						if(checkScript(value)){
							return false;
						}
					}
				}
			}
		}
	}
	
	return true;
}

private static boolean checkScript(String data){
	String str[]={"<script","script>","</script","<SCRIPT","SCRIPT>","</SCRIPT","JAVASCRIPT","&LT;","&GT;"};
	if(data!=null){
	for(String c:str){
		if(data.contains(c)){
			log.info("Invalid Charset::: "+c);
			return true;
		}
	}
	String stn[]={"onmouse","onclick","onkeyup","onkeypress","onchange","onfocus","onblur"};
	for(String c:stn){
		if(data.toLowerCase().contains(c) & (data.toLowerCase().contains("(") || data.toLowerCase().contains(")"))){
			log.info("Invalid script::: "+stn);
			return true;
		}
	}
	}
	return false;
}


public static void main(String[] args) {
	log.info(checkScript("onmouseover(") );
}
}
