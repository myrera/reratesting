	<%@page import="in.gov.rera.common.security.ReraSecurity"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="in.gov.rera.common.util.ReraConstants"%>
<%@page import="in.gov.rera.common.model.UserModel"%>
<%
UserModel user=(UserModel)session.getAttribute(ReraConstants.SES_USER_ATTR);

%>

<script>
function showhiderelfld(sel){
	var val=$(sel).val();
	if(val=='Delayed'){
		$("#ifdelaydv").show();
		$("#compeletionCertdv").hide();
	}else if(val=='Completed'){
		$("#ifdelaydv").hide();
		$("#compeletionCertdv").show();
	}
	else{
	
			$("#ifdelaydv").hide();
			$("#compeletionCertdv").hide();
	
	}
}

function updateProjectstatus(){
	var _frm=$("#projectstatus-form");
	if(validateForm(_frm)){
		$(_frm).submit();
	}
}

</script>
    
    <div class="breadcrumb">Home /Project Dash Board<span class="pull-right user_name">Welcome :<b><%=user.getUserName() %>  </b></span></div>


<!--News Ticker-->
<div class="container">




    
		<div class="col-md-12 col-sm-12">
			
			<div class="Main_containner">




<div class="drop_shadow"></div>

     
    <br>
<div class="inner_wrapper">
     <div class="col-md-12">
     <h1>Project <span> Details</span><h1><div class="pull-right">Last Updated <span>On</span> ${projectReg.projectDetailsModel.updatedOn.time}</h1>
     <div class="drop_shadow"></div>
     </div>
 
  
  
  
  
  

<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right ">Project Name <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p class="text-view">${projectReg.projectDetailsModel.projectName}</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Project <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${projectReg.projectDetailsModel.projectDescription} </p></div>
</div>
		
		
<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Project Type<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${projectReg.projectDetailsModel.projectType}</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Project Status<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${projectReg.projectDetailsModel.projectStatus}  </p></div>
	</div>
		

   <div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Project Start Date<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>
	
                              
    
      <fmt:formatDate type="date"  pattern="dd-MM-yyyy" dateStyle="short" value="${projectReg.projectDetailsModel.startDate.time}"/>
      
                              
		</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Project End Date<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>
		
         <fmt:formatDate type="date"  pattern="dd-MM-yyyy" dateStyle="short" value="${projectReg.projectDetailsModel.completionDate.time}"/>
      
		
		
		</p></div>
	</div>

					
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Total Area Of Land (Sq Mtr)<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${projectReg.projectDetailsModel.totalAreaOfLand}</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Total Coverd Area (Sq Mtr) <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${projectReg.projectDetailsModel.totalCoverdArea}  </p></div>
	</div>
		<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Total Open Area (Sq Mtr)<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${projectReg.projectDetailsModel.totalOpenArea}</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Estimated Cost of Construction (INR) <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${projectReg.projectDetailsModel.estimatedCost}  </p></div>
	</div>
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Cost of Land (INR)<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${projectReg.projectDetailsModel.costOfLand}</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Total Project Cost (INR) <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${projectReg.projectDetailsModel.totalProjectCost}  </p></div>
	</div>
						
							
											
    <div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Project Address Line 1 <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${projectReg.projectDetailsModel.addressLine1}, ${project.projectDetailsModel.addressLine2}</p></div>
		
	</div>

		<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">District<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${projectReg.projectDetailsModel.subDistrictModel.districtModel.districtName} </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Tehsil/Sub District<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p> ${projectReg.projectDetailsModel.subDistrictModel.subDistrictName} </p></div>
	</div>
			<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Approving Authority<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${projectReg.projectDetailsModel.approvingAuthority} </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Hard Copy Submission Office <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${projectReg.projectDetailsModel.office.officeName} </p></div>
	</div>
	
																
																
																
		<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">No of Garage for Sale<span class="space_LR">:</span></p></div>
		<%-- <fmt:parseNumber var = "i" type = "number" value = "${projectReg.projectDetailsModel.noOfGarageForSale}" /> --%>
		 <fmt:parseNumber var = "i" integerOnly = "true"   type = "number" value = "${projectReg.projectDetailsModel.noOfGarageForSale}" />
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${i} </p></div>
		
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Area of Garage for Sale (Sq Mtr)<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${projectReg.projectDetailsModel.areaOfGarageForSale}  </p></div>
	</div>
															
			<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">No of Open Parking for Sale<span class="space_LR">:</span></p></div>
		 <fmt:parseNumber var = "i" integerOnly = "true"   type = "number" value = "${projectReg.projectDetailsModel.noOfParkinfForSale}" />
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${i} </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Area of Open Parking for Sale (Sq Mtr)<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${projectReg.projectDetailsModel.areaOfParkinfForSale}  </p></div>
	</div>
	
	<div class="row">		
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">No of Covered Parking for Sale <span class="space_LR">:</span></p></div>
	    <div class="col-md-3 col-sm-6 col-xs-6" ><p>${projectReg.projectDetailsModel.noOfCoveredParkingForSale} </p></div> 
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Area of Covered Parking for Sale (Sq Mtr)<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${projectReg.projectDetailsModel.areaOfCoveredParkingForSale}  </p></div>
	</div>
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">No of Garage Sold Out<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${projectReg.projectDetailsModel.garageSoldout} </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">No Of Parking Sold Out<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${projectReg.projectDetailsModel.parkingSoldout}  </p></div>
	</div>
	
	
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">North Latitude<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${projectReg.projectDetailsModel.northlatitude} </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">North Longitude<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${projectReg.projectDetailsModel.northlongitude}  </p></div>
	</div>


	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">East Latitude<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${projectReg.projectDetailsModel.eastlatitude} </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">East Longitude<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${projectReg.projectDetailsModel.eastlongitude}  </p></div>
	</div>
	
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">South Latitude<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${projectReg.projectDetailsModel.southlatitude} </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">South Longitude<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${projectReg.projectDetailsModel.southlongitude}  </p></div>
	</div>
	
	<div class="col-sm-2 pull-right" style="text-align: right;">
			
	<div id="button"  class=" theme-clr" data-toggle="collapse" data-target="#projectstform" style="cursor:pointer">
      <span class="glyphicon glyphicon-plus-sign"></span> Update Status
    </div>
	</div>
	<div class='clearfix'></div>
	<div class="inner_wrapper collapse" id="projectstform">
	
    <form name="projectstatus-form" autocomplete="off" id="projectstatus-form" class="form-horizontal" action="updateProjectStatus"  method="post" enctype="multipart/form-data">
	<%=ReraSecurity.writeToken(request) %>
		<input type='hidden' name="project_id" value="${projectReg.projectDetailsModel.projectDetailsId}"  />
		<h1>Project <span>Status</span></h1>
		
		

	
	<div class="form-group">
		<label for="inputEmail3" class="col-sm-3 control-label">Status:</label>
				<div class="col-sm-3">
				<select name="project_status"  class="form-control requiredValFld " onchange="showhiderelfld(this)">
				<option value="0"> -- Select -- </option>
				<option value="Ongoing"> Ongoing </option>
				<option value="Delayed"> Delayed </option>
				<option value="Completed"> Completed </option>
				</select>
				
				<span class='requiredValFldMsg'> Please Select Status .</span>
				</div>
				
			
			
				
				
				<div style="display:none;" id="compeletionCertdv">
				<label for="inputEmail3" class="col-sm-2 control-label">Compeletion Certificate:</label>
				<div class="col-sm-3">
					<input type="file" name="compeletionCert" class="form-control" />
				</div>
				
				</div>
</div>

	<div style="display:none;" id="ifdelaydv">

<div class="form-group">
		<label for="inputEmail3" class="col-sm-3 control-label">No Of Months(Delayed):</label>
				<div class="col-sm-3">
				<input type="text" name="noOfMonthDelayed" rel="txtTooltip" title="Only digits are allowed."
				 data-toggle="tooltip" data-placement="bottom" class="form-control numericValFld requiredValFld" />
				
				<span class='requiredValFldMsg'> Please enter No.of Months delayed.</span>
				</div>
				
				<label for="inputEmail3" class="col-sm-2 control-label">Reason For Delayed :</label>
				<div class="col-sm-3">
					<input type="text" name="reasonForDelayed"  class="form-control requiredValFld" />
				
				<span class='requiredValFldMsg'> Please enter reason for delayed .</span>
				</div>
</div>
</div>

	<div class="form-group">
		<label for="inputEmail3" class="col-sm-3 control-label">No of Garage Sold Out :</label>
				<div class="col-sm-3">
				<input type="text" name="garageSold" rel="txtTooltip" title="Only digits are allowed." data-toggle="tooltip" data-placement="bottom" class="form-control numericValFld requiredValFld" />
				
				<span class='requiredValFldMsg'> Please enter No.of Garage Sold Out .</span>
				</div>
				
				<label for="inputEmail3" class="col-sm-2 control-label">No of Parking Sold Out :</label>
				<div class="col-sm-3">
					<input type="text" name="parkingSold" rel="txtTooltip" title="Only digits are allowed." data-toggle="tooltip" data-placement="bottom" class="form-control numericValFld requiredValFld" />
				
				<span class='requiredValFldMsg'> Please enter No.of Parking Sold Out .</span>
				</div>
</div>

 <div class="form-group">		
				
				<div class="col-sm-3 col-md-offset-3">
				<input name="btn1" class="btn-style"  value="Update" type="button" onclick="updateProjectstatus()" />
				</div>						
	</div>	

</form>

	</div>							
	<div class='clearfix'></div>
	
	</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
											
			
												

<div class="inner_wrapper">
			
			<h1>Project Bank <span> Details</span></h1>
			<div class="drop_shadow"></div>

	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Bank Name<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${projectReg.projectBankDetailsModel.bankModel.bankName}</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Branch<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${projectReg.projectBankDetailsModel.bankBranch} </p></div>
		
	</div>
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Account No.<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${projectReg.projectBankDetailsModel.accountNumber} </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">ifscCode<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${projectReg.projectBankDetailsModel.ifscCode} </p></div>
		
	</div>
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">State<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${projectReg.projectBankDetailsModel.districtModel.stateUtModel.stateUtName} </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">District<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${projectReg.projectBankDetailsModel.districtModel.districtName} </p></div>
		
	</div>
		</div>	
			
		
							
			

			
			
		
	
	
	

	</div>
<!--inner container end here-->





</div>
			
		</div>
	
	

    