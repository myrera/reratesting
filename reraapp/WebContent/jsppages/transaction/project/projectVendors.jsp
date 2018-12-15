<%@page import="in.gov.rera.common.security.ReraSecurity"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        
    <%@page import="in.gov.rera.common.util.ReraConstants"%>
<%@page import="in.gov.rera.common.model.UserModel"%>
<%
UserModel user=(UserModel)session.getAttribute(ReraConstants.SES_USER_ATTR);

%>
    
    <div class="breadcrumb">Home /Project Dash Board<span class="pull-right user_name">Welcome :<b><%=user.getUserName() %></b></span></div>


<!--News Ticker-->
<div class="container">




    
		<div class="col-md-12 col-sm-12">
			
			<div class="Main_containner">

<!--Inner wrapper stsrt here-->
<div class="inner_wrapper">


<div class="drop_shadow"></div>

     
    <br>

     <div class="col-md-12">
     <h1>Project Venders <span> Detail</span></h1>
     <div class="drop_shadow"></div>
     </div>
 
  
  
  
  
 <h1>Project  <span>Agent</span></h1>
			

    <c:forEach items="${projectReg.projectAgentDetailSet}" var="obj">
      <c:if test="${objs.status=='CONFIRMED'}">
     <div class="drop_shadow"> <span onclick="removeVendors('AGENT',${obj.id});" style='float: right;'>REMOVE</span></div>
   
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Agent Registration No.<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${obj.agent.agentRegistrationNo}</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Agent Name<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${obj.agent.agentDetailsModel.agentName}  </p></div>
	</div>
	
	
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Agent Address Line 1<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p> ${obj.agent.agentDetailsModel.agentIndividualAddressLine1}</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Agent Address Line 2<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p> ${obj.agent.agentDetailsModel.agentIndividualAddressLine2}</p></div>
		
	</div>
	</c:if>
	</c:forEach>


</div>

<div class="col-sm-2 pull-right" style="text-align: right;">
			
	<div id="button"  class=" theme-clr" data-toggle="collapse" data-target="#projectAgentform" style="cursor:pointer">
      <span class="glyphicon glyphicon-plus-sign"></span> Add New Agent
    </div>
	</div>
	
	
	<div class="inner_wrapper collapse" id="projectAgentform">
	
    <form name="addagent-form" id="addagent-form" class="form-horizontal" action="addProjectAgent"  method="post" >
	                          	<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">Agent Registration No.</label>
									<div class="col-sm-3">
										<div class="col-md-12 input-group">
											<input type="text" id="fldnogetagent" name="agentRegNo" class="form-control alphanumericValFld requiredValFld" >
											<span class='requiredValFldMsg'> Please enter Agent Registration Number.</span>
												 <label class="input-group-addon btn"
												    for="testdate" >
												
												 <span id='getagent' class="glyphicon glyphicon-search" onclick="getAgentDetails(this)"> </span>
											</label>
										</div>
									</div>

                                    <label for="inputEmail3" id='resultgetagent' class="col-sm-2 control-label dynaselectfld"> </label>
									<div class="col-sm-3">
									</div>
								</div>



								<div class="form-group">


									<label for="inputEmail3" class="col-sm-3 control-label">Agent
										Name</label>
									<div class="col-sm-3">
										<input class="form-control input-sm requiredValFld" id='fldnamenogetagent' disabled name="agentName" />
										
									</div>

									<label for="inputEmail3" class="col-sm-2 control-label dynaselectfld">
										Agent Address</label>
									<div class="col-sm-3">
										<input class="form-control input-sm" id='fldaddressnogetagent' disabled name="agentAddress" />
									</div>


								</div>
								
								 <div class="form-group">		
				
				<div class="col-sm-3 col-md-offset-3">
				<input name="btn1" class="btn-style"  value="Add Agent" type="button" onclick="addVendor('addagent-form')" />
				</div>						
	</div>	

	
		
	</form>
	
	</div>
	
		<br/><br/>
<div class="inner_wrapper">
		
<h1>Project   <span>Architects</span></h1>
			

  <c:forEach items="${projectReg.projectArchitectDetailSet}" var="arctObj">
    <c:if test="${arctObj.status=='CONFIRMED'}">
  <div class="drop_shadow"> <span onclick="removeVendors('ARCHITECT',${arctObj.projectArchId});" style='float: right;'>REMOVE</span></div>

	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Name<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${arctObj.architectName}</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">EmailID<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${arctObj.emailId}  </p></div>
    </div>
    
    
     <div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">State<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${arctObj.districtModel.stateUtModel.stateUtName}</p><p></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">District<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${arctObj.districtModel.districtName} </p></div>
    </div>
    
    <div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Address line 1<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${arctObj.addressLine1}</p><p></p></div>
	<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Address line 2<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${arctObj.addressLine2}</p><p></p></div>
		
	
		
    </div>
    
    
     <div class="row">
     	<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Year Of Establishment<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${arctObj.yearOfEstablishment}</p><p></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Pine Code<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${arctObj.pinCode}  </p></div>
		</div>
    
     <div class="row">
     	<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Key Project<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p> ${arctObj.keyProject} </p></div>
    </div>
    
    
    </c:if>
	</c:forEach>


</div>

<div class="col-sm-2 pull-right" style="text-align: right;">
			
	<div id="button"  class=" theme-clr" data-toggle="collapse" data-target="#projectacrchform" style="cursor:pointer">
      <span class="glyphicon glyphicon-plus-sign"></span> Add New Architect
    </div>
	</div>
	
	
	<div class="inner_wrapper collapse" id="projectacrchform">
	
    <form name="addarch-form" autocomplete="off" id="addarch-form" class="form-horizontal" action="addProjectVendors"  method="post" >
		<%=ReraSecurity.writeToken(request) %>
		<input type="hidden" name="vType" value='ARCHITECT' />
		
			<div class="form-group">
								<label for="inputEmail3" class="col-sm-3 control-label">Architect
									Name<sup>*</sup></label>
								<div class="col-sm-3">
									<input class="form-control input-sm requiredValFld" type="text"
										name="vendorName"  />
										<span class='requiredValFldMsg'> Please enter  Name.</span>

								</div>

								<label for="inputEmail3" class="col-sm-2 control-label">
								 Email ID<sup>*</sup></label>
								<div class="col-sm-3">
									<input class="form-control input-sm emailValFld requiredValFld" 
									name="vendorEmailId" rel="txtTooltip" title="Only valid eamilId is allowed.e.g:abc@xyz.com" data-toggle="tooltip" data-placement="bottom" 
										 />
										 <span class='requiredValFldMsg'> Please enter Email Id.</span>
								</div>



							</div>

                             <div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">Addrees Line 1<sup>*</sup>
									 </label>
									<div class="col-sm-3">
										<input class="form-control input-sm requiredValFld" name="addressLine1"
											id="arctAddressLine1" />
											<span class='requiredValFldMsg'> Please enter Address Line 1.</span>
									</div>

									<label for="inputEmail3" class="col-sm-2 control-label">
										Address Line 2<sup>*</sup></label>
									<div class="col-sm-3">
										<input class="form-control input-sm requiredValFld" name="addressLine2"
											id="arctAddressLine2" />
											<span class='requiredValFldMsg'> Please enter Address Line 2.</span>
									</div>

								</div>
								
								
								
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">State<sup>*</sup>
									 </label>
									<div class="col-sm-3">
										
					          <select name="arctStateUtId" id="architectState"  onchange="reloadChildDropdown(this)" class="form-control dynaselectfld requiredValFld">
						      <option value='0'> --Select-- </option>
						        <c:forEach  items="${stateUtList}" var="st">
						          <option value='${st.stateUtId }'> ${st.stateUtName } </option>
						        </c:forEach>
						       </select>
											<span class='requiredValFldMsg'> Please select State.</span>
									</div>

									<label for="inputEmail3" class="col-sm-2 control-label">
										District<sup>*</sup></label>
									<div class="col-sm-3">
								
								  <select class="form-control dynaselectfld requiredValFld" name="vendorDistrictId"  id="District-architectState" >
									<option value="1"> --Select-- </option>
																		
								</select>
											<span class='requiredValFldMsg'> Please select District.</span>
									</div>

								</div>
								
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">Pin Code<sup>*</sup>
									 </label>
									<div class="col-sm-3">
										<input class="form-control input-sm pinCodeValFld requiredValFld" name="vendorPineCode" rel="txtTooltip" title="Only 6 digits of pin number is allowed." data-toggle="tooltip" data-placement="bottom" 
											id="arctPineCode" />
											<span class='requiredValFldMsg'> Please enter Pin Code.</span>
									</div>

									<label for="inputEmail3" class="col-sm-2 control-label">
										Year
										of establishment<sup>*</sup></label>
									<div class="col-sm-3">
										<input class="form-control input-sm requiredValFld" name="vendorYearOfEst"
											id="arctYearOfEst" />
											<span class='requiredValFldMsg'> Please enter Year Of Establishment.</span>
									</div>

								</div>
								


								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">Key projects completed</label>
									<div class="col-sm-3">
										<input class="form-control input-sm requiredValFld"
											name="keyProjectCompleted" id="keyProjectCompleted" />
											<span class='requiredValFldMsg'> Please enter Key projects completed .</span>
									</div>

									<label for="inputEmail3" class="col-sm-2 control-label">
										</label>
									<div class="col-sm-3">
										
									</div>

								</div>
		
		
		 <div class="form-group">		
				
				<div class="col-sm-3 col-md-offset-3">
				<input name="btn1" class="btn-style"  value="Add Architect" type="button" onclick="addVendor('addarch-form')" />
				</div>						
	</div>	
	
		
	</form>
	
	</div>
	
<br/><br/>
<div class="inner_wrapper">
		
<h1>Structural    <span>Engineers</span></h1>
		
  <c:forEach items="${projectReg.structuralEngineerDetailSet}" var="strObj">
  	<c:if test="${strObj.status=='CONFIRMED'}">
	<div class="drop_shadow"><span onclick="removeVendors('ENGINEER',${strObj.projStcEngId});" style='float: right;'>REMOVE</span></div>

	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Name<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${strObj.engineerName}</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">EmailID<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${strObj.emailId}  </p></div>
    </div>
    
    
     <div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Sate<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${strObj.districtModel.stateUtModel.stateUtName}</p><p></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">District<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${strObj.districtModel.districtName} </p></div>
    </div>
    
    <div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Address line<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${strObj.addressLine1},${strObj.addressLine2}</p><p></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Pine Code<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${strObj.pinCode}  </p></div>
    </div>
    
    
     <div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Year Of Establishment<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${strObj.yearOfEstablishment}</p><p></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Key Project<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p> ${strObj.keyProject} </p></div>
    </div>
    </c:if>

	</c:forEach>
	


</div>

	<div class="col-sm-2 pull-right" style="text-align: right;">
			
	<div id="button"  class=" theme-clr" data-toggle="collapse" data-target="#projectengform" style="cursor:pointer">
      <span class="glyphicon glyphicon-plus-sign"></span> Add New Engineers
    </div>
	</div>
	
	
	<div class="inner_wrapper collapse" id="projectengform">
	
    <form name="addeng-form" id="addeng-form" class="form-horizontal" action="addProjectVendors"  method="post" >
	<input type="hidden" name="vType" value='ENGINEER' />
		
			<div class="form-group">
								<label for="inputEmail3" class="col-sm-3 control-label">Name<sup>*</sup></label>
								<div class="col-sm-3">
									<input class="form-control input-sm requiredValFld" type="text"
										name="vendorName"  />
										<span class='requiredValFldMsg'> Please enter  Name.</span>

								</div>

								<label for="inputEmail3" class="col-sm-2 control-label">
								 Email ID<sup>*</sup></label>
								<div class="col-sm-3">
									<input class="form-control input-sm emailValFld requiredValFld" 
									name="vendorEmailId" rel="txtTooltip" title="Only valid eamilId is allowed.e.g:abc@xyz.com" data-toggle="tooltip" data-placement="bottom" 
										 />
										 <span class='requiredValFldMsg'> Please enter Email Id.</span>
								</div>



							</div>

                             <div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">Addrees Line 1<sup>*</sup>
									 </label>
									<div class="col-sm-3">
										<input class="form-control input-sm requiredValFld" name="addressLine1"
											id="arctAddressLine1" />
											<span class='requiredValFldMsg'> Please enter Address Line 1.</span>
									</div>

									<label for="inputEmail3" class="col-sm-2 control-label">
										Address Line 2<sup>*</sup></label>
									<div class="col-sm-3">
										<input class="form-control input-sm requiredValFld" name="addressLine2"
											id="arctAddressLine2" />
											<span class='requiredValFldMsg'> Please enter Address Line 2.</span>
									</div>

								</div>
								
								
								
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">State<sup>*</sup>
									 </label>
									<div class="col-sm-3">
										
					          <select name="arctStateUtId" id="engineerState"  onchange="reloadChildDropdown(this)" class="form-control dynaselectfld requiredValFld">
						      <option value='0'> --Select-- </option>
						        <c:forEach  items="${stateUtList}" var="st">
						          <option value='${st.stateUtId }'> ${st.stateUtName } </option>
						        </c:forEach>
						       </select>
											<span class='requiredValFldMsg'> Please select State.</span>
									</div>

									<label for="inputEmail3" class="col-sm-2 control-label">
										District<sup>*</sup></label>
									<div class="col-sm-3">
								
								  <select class="form-control dynaselectfld requiredValFld" name="vendorDistrictId"  id="District-engineerState" >
									<option value="1"> --Select-- </option>
																		
								</select>
											<span class='requiredValFldMsg'> Please select District.</span>
									</div>

								</div>
								
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">Pin Code<sup>*</sup>
									 </label>
									<div class="col-sm-3">
										<input class="form-control input-sm pinCodeValFld requiredValFld" name="vendorPineCode" rel="txtTooltip" title="Only 6 digits of pin number is allowed." data-toggle="tooltip" data-placement="bottom" 
											id="arctPineCode" />
											<span class='requiredValFldMsg'> Please enter Pin Code.</span>
									</div>

									<label for="inputEmail3" class="col-sm-2 control-label">
										Year
										of establishment<sup>*</sup></label>
									<div class="col-sm-3">
										<input class="form-control input-sm requiredValFld" name="vendorYearOfEst"
											id="arctYearOfEst" />
											<span class='requiredValFldMsg'> Please enter Year Of Establishment.</span>
									</div>

								</div>
								


								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">Key projects completed</label>
									<div class="col-sm-3">
										<input class="form-control input-sm requiredValFld"
											name="keyProjectCompleted" id="keyProjectCompleted" />
											<span class='requiredValFldMsg'> Please enter Key projects completed .</span>
									</div>

									<label for="inputEmail3" class="col-sm-2 control-label">
										</label>
									<div class="col-sm-3">
										
									</div>

								</div>
		
		 <div class="form-group">		
				
				<div class="col-sm-3 col-md-offset-3">
				<input name="btn1" class="btn-style"  value="Add Engineer" type="button" onclick="addVendor('addeng-form')" />
				</div>						
	</div>	
		
	
		
	</form>
	
	</div>
	<br/><br/>

<div class="inner_wrapper">
		
<h1>Project <span>Contractors</span></h1>


 <c:forEach items="${projectReg.projectContratorDetailSet}" var="strObj">
 <c:if test="${strObj.status=='CONFIRMED'}">
<div class="drop_shadow"> <span onclick="removeVendors('CONTRACTOR',${strObj.projectCntrId});" style='float: right;'>REMOVE</span></div>


	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right"> Name<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${strObj.contractorName}</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">EmailID<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${strObj.emailId}  </p></div>
    </div>
    
    
     <div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Sate<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${strObj.districtModel.stateUtModel.stateUtName}</p><p></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">District<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${strObj.districtModel.districtName} </p></div>
    </div>
    
    <div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Address line<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${strObj.addressLine1},${strObj.addressLine2}</p><p></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Pine Code<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${strObj.pinCode}  </p></div>
    </div>
    
    
     <div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Year Of Establishment<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${strObj.yearOfEstablishment}</p><p></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Key Project<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>  </p></div>
    </div>
    </c:if>

	</c:forEach>
	
	
			

			
			
	

	</div>
<!--inner container end here-->

<div class="col-sm-2 pull-right" style="text-align: right;">
			
	<div id="button"  class=" theme-clr" data-toggle="collapse" data-target="#projectcontctform" style="cursor:pointer">
      <span class="glyphicon glyphicon-plus-sign"></span> Add New Contractor
    </div>
	</div>
	
	
	<div class="inner_wrapper collapse" id="projectcontctform">
	
    <form name="addcontractor-form" id="addcontractor-form" class="form-horizontal" action="addProjectVendors"  method="post" >
	<input type="hidden" name="vType" value='CONTRACTOR' />
		
			<div class="form-group">
								<label for="inputEmail3" class="col-sm-3 control-label"> Name<sup>*</sup></label>
								<div class="col-sm-3">
									<input class="form-control input-sm requiredValFld" type="text"
										name="vendorName"  />
										<span class='requiredValFldMsg'> Please enter  Name.</span>

								</div>

								<label for="inputEmail3" class="col-sm-2 control-label">
								 Email ID<sup>*</sup></label>
								<div class="col-sm-3">
									<input class="form-control input-sm emailValFld requiredValFld" 
									name="vendorEmailId" rel="txtTooltip" title="Only valid eamilId is allowed.e.g:abc@xyz.com" data-toggle="tooltip" data-placement="bottom" 
										 />
										 <span class='requiredValFldMsg'> Please enter Email Id.</span>
								</div>



							</div>

                             <div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">Addrees Line 1<sup>*</sup>
									 </label>
									<div class="col-sm-3">
										<input class="form-control input-sm requiredValFld" name="addressLine1"
											id="arctAddressLine1" />
											<span class='requiredValFldMsg'> Please enter Address Line 1.</span>
									</div>

									<label for="inputEmail3" class="col-sm-2 control-label">
										Address Line 2<sup>*</sup></label>
									<div class="col-sm-3">
										<input class="form-control input-sm requiredValFld" name="addressLine2"
											id="arctAddressLine2" />
											<span class='requiredValFldMsg'> Please enter Address Line 2.</span>
									</div>

								</div>
								
								
								
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">State<sup>*</sup>
									 </label>
									<div class="col-sm-3">
										
					          <select name="arctStateUtId" id="contractorState"  onchange="reloadChildDropdown(this)" class="form-control dynaselectfld requiredValFld">
						      <option value='0'> --Select-- </option>
						        <c:forEach  items="${stateUtList}" var="st">
						          <option value='${st.stateUtId }'> ${st.stateUtName } </option>
						        </c:forEach>
						       </select>
											<span class='requiredValFldMsg'> Please select State.</span>
									</div>

									<label for="inputEmail3" class="col-sm-2 control-label">
										District<sup>*</sup></label>
									<div class="col-sm-3">
								
								  <select class="form-control dynaselectfld requiredValFld" name="vendorDistrictId"  id="District-contractorState" >
									<option value="1"> --Select-- </option>
																		
								</select>
											<span class='requiredValFldMsg'> Please select District.</span>
									</div>

								</div>
								
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">Pin Code<sup>*</sup>
									 </label>
									<div class="col-sm-3">
										<input class="form-control input-sm pinCodeValFld requiredValFld" name="vendorPineCode" rel="txtTooltip" title="Only 6 digits of pin number is allowed." data-toggle="tooltip" data-placement="bottom" 
											id="arctPineCode" />
											<span class='requiredValFldMsg'> Please enter Pin Code.</span>
									</div>

									<label for="inputEmail3" class="col-sm-2 control-label">
										Year
										of establishment<sup>*</sup></label>
									<div class="col-sm-3">
										<input class="form-control input-sm requiredValFld" name="vendorYearOfEst"
											id="arctYearOfEst" />
											<span class='requiredValFldMsg'> Please enter Year Of Establishment.</span>
									</div>

								</div>
								


								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">Key projects completed</label>
									<div class="col-sm-3">
										<input class="form-control input-sm requiredValFld"
											name="keyProjectCompleted" id="keyProjectCompleted" />
											<span class='requiredValFldMsg'> Please enter Key projects completed .</span>
									</div>

									<label for="inputEmail3" class="col-sm-2 control-label">
										</label>
									<div class="col-sm-3">
										
									</div>

								</div>
		
		
		 <div class="form-group">		
				
				<div class="col-sm-3 col-md-offset-3">
				<input name="btn1" class="btn-style"  value="Add Contractor" type="button" onclick="addVendor('addcontractor-form')" />
				</div>						
	</div>	
		
	</form>
	
	</div>
	

<br/><br/>

</div>
			
		</div>
	
	


<!-- container end here-->

</div>






<form name="removeVendorFrm" id="removeVendorFrm" action="removeProjectVendor" method="post">
<input type="hidden" name="vType" id="vType" />
<input type="hidden" name="vId" id="vId" />
</form>    


<script>
function removeVendors(vt,vi){
	if(confirm("Are you sure to remove this vendor")){
		$('#vId').val(vi);
		$('#vType').val(vt);
		$('#removeVendorFrm').submit();
	}}
	
	
	


function getAgentDetails(spn) {
	
	var sid=$(spn).attr('id');
	var agentRegNo=$('#fldno'+sid).val();
	
	$.ajax({
		type : "GET",
		url : '<%=request.getContextPath()%>/getAgentDetailforProjectReg',
		data : "agentRegNo=" + agentRegNo+"&SID="+sid,
		success : function(response){
			
			var st=response.split("~");
			var iddd=st[0];
			if(st.length==2){
				
				$('#result'+iddd).text('Agent Not Found.');
				$('#result'+iddd).css('color','red');
			}else if(st.length==4){
				
				$('#fldnameno'+iddd).val(st[2]);
				$('#fldaddressno'+iddd).val(st[3]);
				$('#result'+iddd).text('Added Sucessfuly');
				$('#result'+iddd).css('color','green');
			}
		},

		error : function(e) {alert('Error: ' + e);}

	});

}

	
function addVendor(_id){
	var _frm=$('#'+_id);
	if(validateForm(_frm)){
		$(_frm).submit();
	}
}	
	
	
</script>

