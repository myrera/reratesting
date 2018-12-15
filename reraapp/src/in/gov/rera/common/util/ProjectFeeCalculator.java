package in.gov.rera.common.util;

import in.gov.rera.transaction.projectregistration.model.ProjectDetailsModel;

import java.util.HashMap;
import java.util.Map;

public class ProjectFeeCalculator {

	private static Map<String, Integer> maxLimit;
	private static Map<String,Integer> lowerCost;
	private static Map<String,Integer> higherCost;
	
	static{
		maxLimit=new HashMap<String, Integer>();
		lowerCost=new HashMap<String, Integer>();
		higherCost=new HashMap<String, Integer>();
		
		maxLimit.put("Residential/Group Housing", 500000);
		lowerCost.put("Residential/Group Housing",5);
		higherCost.put("Residential/Group Housing", 10);
		
		maxLimit.put("Mixed Development", 700000);
		lowerCost.put("Mixed Development",10);
		higherCost.put("Mixed Development", 15);
		
		maxLimit.put("Commercial", 1000000);
		lowerCost.put("Commercial",20);
		higherCost.put("Commercial", 25);
		
		maxLimit.put("Plotted Development", 200000);
		lowerCost.put("Plotted Development",5);
		higherCost.put("Plotted Development", 5);
		
		
		
		
		
	}
	
	
	public static int getProjectRegFee(ProjectDetailsModel project){
		int fee=0;
		String type=project.getProjectType();
		int area=(int)(double)project.getTotalAreaOfLand();
		if(area<=1000){
			fee=area*lowerCost.get(type);
		}else{
			fee=area*higherCost.get(type);
		}
		if(fee>maxLimit.get(type)){
			fee=maxLimit.get(type);
		}
		
		return fee;
	}
	
}
