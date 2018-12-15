package in.gov.rera.search;


import in.gov.rera.common.dao.impl.GenericDAOImpl;
import in.gov.rera.transaction.agentregistration.model.AgentRegistrationModel;
import in.gov.rera.transaction.projectregistration.model.ProjectRegistrationModel;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;





@Repository("SearchEngine")
public class SearchEngine<E,PK> extends GenericDAOImpl<Object,Long> implements ISearch<Object, Long>  {

	public static int MAX_RESULT=5;
	
	
	public SearchResult search(SearchQuery query){
		SearchResult result=new SearchResult();
		
		List<Object> recordList=getRecords(getSQLQuery(query));
		for(int x=0;x<recordList.size();x++){
			if(result.getRecordList()==null){
				result.setRecordList(new ArrayList<SearchObject>());
			}
			Object[] mp=(Object[])recordList.get(x);
			
			result.getRecordList().add(populateObject(mp));
		}
		
		result.setName(query.getName());
		result.setTotalRecords(getRecordCount(getCountQuery(query)));
		result.setMaxRecords(MAX_RESULT);
		result.setCurrentPage(query.getCurrentPage());
		result.setStartFrom(query.getStartIndex());
		if(result.getStartFrom()+MAX_RESULT > result.getTotalRecords()){
			result.setLastIndex(result.getTotalRecords());
		}else{
			result.setLastIndex(result.getStartFrom()+MAX_RESULT );
		}
		
		result.setPagging();
		return result;
	}
	
	
	private SearchObject populateObject(Object[] data){
		SearchObject object=new SearchObject();
		String type=(String)data[1];
		String id=data[0].toString();
		object.setObjectType(type);
		if(type.equalsIgnoreCase("PROJECT")){
	object.setObject(	getCurrentSession().load(ProjectRegistrationModel.class, Long.parseLong(id)));	
		}
		else{
			object.setObject(	getCurrentSession().load(AgentRegistrationModel.class, Long.parseLong(id)));	
		}
		
	
		return object;
	}
	
	
	private String getSQLQuery(SearchQuery query){
		String str= checkInjection(query);
		String sqlQuery="SELECT  * FROM ( "+
"SELECT PREG.PROJECT_REG_ID ID, 'PROJECT' RTYPE,PDTL.PROJECT_NAME NAME  FROM TL_PROJECT_DETAILS PDTL, TT_PROJECT_REG PREG WHERE PREG.STATUS='APPROVED' AND PREG.PROJECT_DELS_ID=PDTL.PROJECT_DELS_ID AND "+
" UPPER(PDTL.PROJECT_NAME) LIKE UPPER('%"+str+"%') "+
" UNION "+
" SELECT PREG.PROJECT_REG_ID ID, 'PROJECT' RTYPE ,PRDTL.PROMOTER_NAME NAME  FROM TL_PROMOTER_DETAILS PRDTL, TT_PROJECT_REG PREG WHERE PREG.STATUS='APPROVED' AND PREG.PROMOTER_DELS_ID=PRDTL.PROMOTER_DELS_ID AND "+
" UPPER(PRDTL.PROMOTER_NAME) LIKE UPPER('%"+str+"%') "+
" UNION   SELECT  AR.AGENT_REG_ID ID,  'AGENT' RTYPE ,AD.FIRM_NAME NAME FROM TT_AGENT_REGISTRATION  AR, TL_AGENT_REG_DETAILS_MODEL AD  WHERE AR.STATUS='APPROVED' AND   AR.AGENT_REG_DETAILS_ID=AD.AGENT_REG_DETAILS_ID" +
" AND  UPPER(AD.FIRM_NAME) LIKE  UPPER('%"+str+"%') UNION SELECT  AR.AGENT_REG_ID ID,  'AGENT' RTYPE,AD.AGENT_NAME NAME " +
		" FROM TT_AGENT_REGISTRATION  AR, TL_AGENT_REG_DETAILS_MODEL AD  WHERE  AR.STATUS='APPROVED' AND    AR.AGENT_REG_DETAILS_ID=AD.AGENT_REG_DETAILS_ID" +
" AND UPPER(AD.AGENT_NAME) LIKE  UPPER('%"+str+"%') ) RE ORDER BY UPPER(RE.NAME) LIMIT "+query.getStartIndex()+","+MAX_RESULT;
		
		return sqlQuery;
	}
	
	private String getCountQuery(SearchQuery query){
		String str= checkInjection(query);
		String sqlQuery="SELECT  COUNT(*) FROM ( "+
"SELECT PREG.PROJECT_REG_ID ID, 'PROJECT' RTYPE,PDTL.PROJECT_NAME NAME  FROM TL_PROJECT_DETAILS PDTL, TT_PROJECT_REG PREG WHERE PREG.STATUS='APPROVED' AND PREG.PROJECT_DELS_ID=PDTL.PROJECT_DELS_ID AND "+
" UPPER(PDTL.PROJECT_NAME) LIKE UPPER('%"+str+"%') "+
" UNION "+
" SELECT PREG.PROJECT_REG_ID ID, 'PROJECT' RTYPE ,PRDTL.PROMOTER_NAME NAME  FROM TL_PROMOTER_DETAILS PRDTL, TT_PROJECT_REG PREG WHERE PREG.STATUS='APPROVED' AND PREG.PROMOTER_DELS_ID=PRDTL.PROMOTER_DELS_ID AND "+
" UPPER(PRDTL.PROMOTER_NAME) LIKE UPPER('%"+str+"%') "+
" UNION   SELECT  AR.AGENT_REG_ID ID,  'AGENT' RTYPE ,AD.FIRM_NAME NAME FROM TT_AGENT_REGISTRATION  AR, TL_AGENT_REG_DETAILS_MODEL AD  WHERE AR.STATUS='APPROVED' AND  AR.AGENT_REG_DETAILS_ID=AD.AGENT_REG_DETAILS_ID" +
" AND  UPPER(AD.FIRM_NAME) LIKE  UPPER('%"+str+"%') UNION SELECT  AR.AGENT_REG_ID ID,  'AGENT' RTYPE,AD.AGENT_NAME NAME " +
		" FROM TT_AGENT_REGISTRATION  AR, TL_AGENT_REG_DETAILS_MODEL AD  WHERE AR.STATUS='APPROVED' AND  AR.AGENT_REG_DETAILS_ID=AD.AGENT_REG_DETAILS_ID" +
" AND UPPER(AD.AGENT_NAME) LIKE  UPPER('%"+str+"%') ) RE ";
		
		return sqlQuery;
		
		
		
	}
	
	private String checkInjection(SearchQuery query){
		if(query.getName()!=null){
		String data=	query.getName();
		if(data.toLowerCase().contains("select") && (data.contains("(") || data.contains(")") || data.toLowerCase().contains("from"))){
			return "";
		}
		
		}else
			return "";
		return query.getName();
		
	}
	
	
	private List<Object> getRecords(String query){
		List<Object> records =null;
		
		SQLQuery sql=	getCurrentSession().createSQLQuery(query);
	    records=	sql.list();
		return records;
	}
	
	
	private int getRecordCount(String query){
		
		int records=0;
		SQLQuery sql=	getCurrentSession().createSQLQuery(query);
	List<Object> lst=sql.list();
	if(lst!=null && lst.size()>0){
		BigInteger m=(BigInteger)lst.get(0);
		records=m.intValue();
	}
		return records;
	}
	
}
