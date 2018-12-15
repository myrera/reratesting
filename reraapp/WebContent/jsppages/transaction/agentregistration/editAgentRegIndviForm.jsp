<%@page import="in.gov.rera.common.security.ReraSecurity"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@ page isELIgnored="false"%>
<html>
<head>
<script src="<%=request.getContextPath() %>/resources/agentjs/agentJs.js"></script>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title></title>

</head>
<body>

	<div class="breadcrumb">Home / Real Estate Agent Registration</div>

	<div class="container">
		<div class="stepwizard col-md-offset-1">
			<div class="stepwizard-row setup-panel">


				<div class="stepwizard-step blank">
					<a href="#step-1" type="button" class="btn btn-success btn-circle">1</a>
					<p>Applicant Detail</p>
				</div>

				<div class="stepwizard-step blank">
					<a href="#step-2" type="button" class="btn btn-default btn-circle">2</a>
					<p>Upload Documents</p>
				</div>

				<div class="stepwizard-step blank">
					<a href="#step-2" type="button" class="btn btn-default btn-circle">3</a>
					<p>Payment</p>
				</div>

				<div class="stepwizard-step ">
					<a href="#step-3" type="button" class="btn btn-default btn-circle"
						disabled="disabled">4</a>
					<p>Confirmation</p>
				</div>
			</div>
		</div>
	</div>
	<!--News Ticker-->
	<div class="container">

		<!--main container start here-->
		<div class="Main_containner">

			<!--Inner wrapper stsrt here-->            
			<form:form class="form-horizontal"  action="updateInvdAgentDetails" id="agenttrxForm1"  enctype="multipart/form-data"  modelAttribute="agentRegistrationModel" autocomplete="off">
					<%=ReraSecurity.writeToken(request) %>
				<div class="inner_wrapper">


				<form:hidden  path="agentRegistrationID"/>
				  <form:hidden path="agentDetailsModel.agentRegDetailID"/>
				  <form:hidden path="registrationType"/>
				   <form:hidden path="registrationStage"/>
				  
				  
					<h1>Applicant Detail</h1>
					<div class="border">
						<div class="orange"></div>
						<div class="black"></div>
					</div>


					<br>

					<div class="form-group">
						<label class="col-sm-3 control-label">Name<sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="agentDetailsModel.agentName" class="form-control input-sm requiredValFld" 
								id="inputEmail3" placeholder="" ></form:input>
								<span class='requiredValFldMsg'> Please enter Name.</span>
						</div>
						<label for="inputEmail3" class="col-sm-2 control-label">Father`s
							Name<sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="agentDetailsModel.agentFatherName" class="form-control input-sm requiredValFld" />
				<span class='requiredValFldMsg'> Please enter Father's Name.</span>
						</div>

					</div>

					<div class="form-group">
						<label for="inputEmail3" class="col-sm-3 control-label">Occupation</label>
						<div class="col-sm-3">
							<form:select path="agentDetailsModel.occupation" class="form-control input-sm requiredValFld"
								id="inputEmail3" placeholder="" >
								<form:option value="Salaried" label="Salaried" />
								<form:option value="Self Employed" label="Self Employed" />
											<form:option value="Others" label="Others" />
					
							</form:select>	
								<span class='requiredValFldMsg'> Please Select Occupation.</span>
			
						</div>
						
						<label for="inputEmail3" class="col-sm-2 control-label">Email
							Address<sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="agentDetailsModel.agentEmailId" rel="txtTooltip" title="Only valid emailId is allowed.e.g:abc@xyz.com" data-toggle="tooltip" data-placement="bottom"  class="form-control input-sm emailValFld requiredValFld"
								placeholder="" />
								<span class='requiredValFldMsg'> Please enter Email Id.</span>
						</div>
						
						</div>
						
						
						<div class="form-group">


						<label for="inputEmail3" class="col-sm-3 control-label">Aadhaar
							No.<sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="agentDetailsModel.agentAdhaarNo" rel="txtTooltip" title="Only 12 digits of adhaar number is allowed." data-toggle="tooltip" data-placement="bottom"  class="form-control input-sm aadhaarNoValFld requiredValFld" />
							<span class='requiredValFldMsg'> Please enter Aadhaar Number.</span>
						</div>

						<label for="inputEmail3" class="col-sm-2 control-label">PAN
							Card No.<sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="agentDetailsModel.agentPanNo" rel="txtTooltip" title="Only valid pan number is allowed.e.g:ABCDE1234F" data-toggle="tooltip" data-placement="bottom"  class="form-control input-sm panNoValFld requiredValFld" />
							<span class='requiredValFldMsg'> Please enter Pan Card No.</span>
						</div>

					</div>
					
					<div class="form-group">
						
						
						<label for="inputEmail3" class="col-sm-3 control-label">Mobile
							Number<sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="agentDetailsModel.agentPhoneNo" rel="txtTooltip" title="Only 10 digits of mobile number is allowed." data-toggle="tooltip" data-placement="bottom"  class="form-control input-sm mobileValFld requiredValFld"
								placeholder="" />
								<span class='requiredValFldMsg'> Please enter Mobile Number.</span>
						</div>
						<label for="inputEmail3" class="col-sm-2 control-label">LandLine
							Number<sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="agentDetailsModel.landLineNumber1" rel="txtTooltip" title="Only 6- 10 digits of landline number is allowed." maxlength="10" data-toggle="tooltip" data-placement="bottom"  class="form-control input-sm landlineValFld requiredValFld"
								placeholder="" />
								<span class='requiredValFldMsg'> Please enter LandLine Number.</span>
						</div>
						
						
						</div>
						
						<div class="form-group">

							<label id="agentIndividualAddress" for="inputEmail3"
							class="col-sm-3 control-label">Address Line 1<sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="agentDetailsModel.agentIndividualAddressLine1"
								class="form-control input-sm requiredValFld" rows="3" />
								<span class='requiredValFldMsg'> Please enter Address Line 1.</span>
						</div>
						<label id="agentIndividualAddress" for="inputEmail3"
							class="col-sm-2 control-label">Address Line 2<sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="agentDetailsModel.agentIndividualAddressLine2"
								class="form-control input-sm requiredValFld" rows="3" />
								<span class='requiredValFldMsg'> Please enter Address Line 2.</span>
						</div>
						
						
						</div>
						
						
						  <div class="form-group">

						<label for="inputEmail3" class="col-sm-3 control-label">Pin Code<sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="agentDetailsModel.agentIndividualPincode" rel="txtTooltip" title="Only 6 digits of pin numbe is allowed." data-toggle="tooltip" data-placement="bottom" 
								class="form-control input-sm pinCodeValFld requiredValFld" rows="3" />
								<span class='requiredValFldMsg'> Please enter Pin Code.</span>
						</div>
						
						</div>
						
						
						
						<div class="form-group">


							 <label for="inputEmail3" class="col-sm-3 control-label">
								State<sup>*</sup></label>
							<div class="col-sm-3">
								<select name="agentStateUtId" id="agentStateUtId"  onchange="reloadChildDropdown(this)" class="form-control requiredValFld">
						<option value='0'> --Select-- </option>
						<c:forEach  items="${stateUtList}" var="st">
						<c:choose>
						<c:when test="${st.stateUtId==agentDistrict.stateUtModel.stateUtId }">
						<option value='${st.stateUtId }' selected="selected"> ${st.stateUtName } </option>
						</c:when>
						<c:otherwise>
						<option value='${st.stateUtId }'> ${st.stateUtName } </option>
						</c:otherwise>
						
						
						
						</c:choose>
						</c:forEach>
						
						</select>		
						<span class='requiredValFldMsg'> Please enter State.</span>
							</div>



							<label for="inputEmail3" class="col-sm-2 control-label">District<sup>*</sup></label>
							<div class="col-sm-3">
															
								
								<select name="agentDistrictId" class="form-control requiredValFld" id="District-agentStateUtId">
								<option value="0"> --Select-- </option>
						<c:forEach  items="${agentDistrict.stateUtModel.districtModelSet}" var="dst">	
								
								<c:choose>
						<c:when test="${dst.districtId==agentDistrict.districtId}">
						<option value='${dst.districtId }' selected="selected"> ${dst.districtName } </option>
						</c:when>
						<c:otherwise>
						<option value='${dst.districtId }'> ${dst.districtName } </option>
						</c:otherwise>
						
						
						
						</c:choose>
								
							
							</c:forEach>	

							</select>
							<span class='requiredValFldMsg'> Please enter District.</span>
								
								
								
							</div>

						</div>
					
						<div class="form-group">
					
					
					</div>


					<div class="form-group">

						<label for="inputEmail3" class="col-sm-3 control-label">Business
							Address Line 1<sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="agentDetailsModel.agentIndividualBussAddress1"
								class="form-control input-sm requiredValFld" rows="3" />
								<span class='requiredValFldMsg'> Please enter Business Address Line 1.</span>
						</div>
						<label for="inputEmail3" class="col-sm-2 control-label">Business
							Address Line 2<sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="agentDetailsModel.agentIndividualBussAddress2"
								class="form-control input-sm requiredValFld" rows="3" />
								<span class='requiredValFldMsg'> Please enter Business Address Line 2.</span>
						</div>

					</div>

						<div class="form-group">


							<br> <label for="inputEmail3" class="col-sm-3 control-label">
								State<sup>*</sup></label>
							<div class="col-sm-3">
									
								
								<select name="businessStateUtId" id="businessState"  onchange="reloadChildDropdown(this)" class="form-control requiredValFld">
						<option value='0'> --Select-- </option>
						<c:forEach  items="${stateUtList}" var="st">
						<c:choose>
						<c:when test="${st.stateUtId==businessDistrictId.stateUtModel.stateUtId }">
						<option value='${st.stateUtId }' selected="selected"> ${st.stateUtName } </option>
						</c:when>
						<c:otherwise>
						<option value='${st.stateUtId }'> ${st.stateUtName } </option>
						</c:otherwise>
						
						
						
						</c:choose>
						</c:forEach>
						</select>	
								<span class='requiredValFldMsg'> Please select State.</span>
								
								
								
								
								
							</div>



							<label for="inputEmail3" class="col-sm-2 control-label">District<sup>*</sup></label>
							<div class="col-sm-3">
								
								
								<select name="businessDistrictId" class="form-control requiredValFld" id="District-businessState">
								<option value='0'> --Select-- </option>
									<c:forEach  items="${businessDistrictId.stateUtModel.districtModelSet}" var="dst">	
								
								<c:choose>
						<c:when test="${dst.districtId==businessDistrictId.districtId}">
						<option value='${dst.districtId }' selected="selected"> ${dst.districtName } </option>
						</c:when>
						<c:otherwise>
						<option value='${dst.districtId }'> ${dst.districtName } </option>
						</c:otherwise>
						
						
						
						</c:choose>
								
							
							</c:forEach>
								

							</select>
								<span class='requiredValFldMsg'> Please select District.</span>
								
							</div>


						</div>
						
						   <div class="form-group">

						<label for="inputEmail3" class="col-sm-3 control-label">Pincode<sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="agentDetailsModel.agentIndividualBussPincode" rel="txtTooltip" title="Only 6 digits of pin number is allowed." data-toggle="tooltip" data-placement="bottom" 
								class="form-control input-sm pinCodeValFld requiredValFld" rows="3" />
								<span class='requiredValFldMsg'> Please enter Pin Code.</span>
						</div>
						

					</div>
						
						
						
						
						
						
						
						
						
						
						
					<div class="form-group"></div>

					<div class="form-group">


						

						<label for="inputEmail3" class="col-sm-3 control-label">Photograph<sup>*</sup></label>
						<div class="col-sm-3">
						
						<div class="Containerdvphotospn"> 
					<span class='filenamephotospn' ><a href="download?DOC_ID=  ${agentRegistrationModel.agentDetailsModel.photograph.documentId }">  ${agentRegistrationModel.agentDetailsModel.photograph.fileName } </a></span>
						
						<span onclick="editfilefieldenable(this)" style='float:right;cursor:pointer;' id="photospn">
										
					 EDIT   </span>
					
					        <div class="Containerphotospn" style="display:none;">
							<input type="file" class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  name="agentPhotographPath" />
							<span class='requiredValFldMsg'> Please select Photograph.</span>
							</div>
					 </div>
						
						
						
													</div>

					</div>
		
		
							<div class="inner_wrapper">

						<h1>
							Operation For <span>Registration</span>
						</h1>
		
		
	
		
						<div class="drop_shadow">   </div>

                       <div class="form-group">
						<label for="inputEmail3" class="col-sm-3 control-label">District<sup>*</sup></label>
						<div class="col-sm-3">
							<select class="form-control requiredValFld" name='oprDistrictId' id="oprDistrictId" onchange="reloadSubDistrict(this)">
						
							<option value='0'> --Select-- </option>
						<c:forEach items="${RERA_STATEUT.distList}" var="dst">
						<c:if test="${dst.districtId==agentRegistrationModel.districtModel.districtId }">
						<option value='${dst.districtId }' selected="selected"> ${dst.districtName } </option>
						</c:if>
						<c:if test="${dst.districtId!=agentRegistrationModel.districtModel.districtId }">
						<option value='${dst.districtId }'> ${dst.districtName } </option>
						</c:if>
						</c:forEach>
						</select>
						<span class='requiredValFldMsg'> Please select District.</span>
						</div>
						<label for="inputEmail3" class="col-sm-2 control-label">Tehsil/Sub
							District<sup>*</sup></label>
						<div class="col-sm-3">
							<select name="oprSubDistrictId" class="form-control requiredValFld" id="SubDistrict-oprDistrictId">
							<c:forEach items="${agentRegistrationModel.districtModel.subDistrictModelSet}" var="sb">
							<c:if test="${sb.subDistrictId==agentRegistrationModel.subDistrictModel.subDistrictId }">
						<option value='${sb.subDistrictId }' selected="selected"> ${sb.subDistrictName } </option>
						</c:if>
						<c:if test="${sb.subDistrictId!=agentRegistrationModel.districtModel.districtId }">
						<option value='${sb.subDistrictId }'> ${sb.subDistrictName } </option>
						</c:if>
							</c:forEach>
							</select>
							<span class='requiredValFldMsg'> Please select Tehsil/Sub District.</span>
						</div>

					</div>
							
											
					
					
					
					

					</div>
					
					<br/>
		
		
		
		
					<div class="inner_wrapper">

						<h1>
							Previous <span>Registration Details</span>
						</h1>
							
							<c:choose>
							<c:when test="${pervAgentSetFlag=='NO' }">
						<div id="preRegSection-dv" class="addmoredv">
						<div class="drop_shadow">    <span onclick="deloptdv(this);" style='float: right;'>DELETE</span></div>
						<div class="form-group">


							<br> <label for="inputEmail3" class="col-sm-3 control-label">
								Registration Number</label>
							<div class="col-sm-3">
							  <input type="hidden"  name="preRegId" >
								<input type="text" name="preRegistrationNo" class="form-control input-sm alphanumericValFld" >
								<span class='requiredValFldMsg'> Please enter Registration Number.</span>
							</div>

							<label for="inputEmail3" class="col-sm-2 control-label">Union
								Territory/State</label>
							<div class="col-sm-3">
					<select name="prestateUtId" id="preRegState"  onchange="reloadChildDropdown(this)" class="form-control dynaselectfld requiredValFld">
						<option value='0'> --Select-- </option>
						<c:forEach  items="${stateUtList}" var="st">
						<option value='${st.stateUtId }'> ${st.stateUtName } </option>
						</c:forEach>
						</select>
									<span class='requiredValFldMsg'> Please select Union Territory/State.</span>
							</div>

						</div>


						<div class="form-group">

							<label class="col-sm-3	 control-label">Upload Certificate</label>
							<div class="col-sm-3">
								<input type="file" class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  name="certificatePath" id="exampleInputFile">
								<span class='requiredValFldMsg'> Please select Upload Certificate.</span>
							</div>
							
							
								<label for="inputEmail3" class="col-sm-2 control-label">District</label>
							<div class="col-sm-3">
								<select class="form-control dynaselectfld requiredValFld" name="preDistrictId" id='District-preRegState'>
									<option value="0"> --Select-- </option>
																		
								</select>
								<span class='requiredValFldMsg'> Please select District.</span>
							</div>
						
						</div>
					</div>
							
							
							</c:when>
							<c:otherwise>
							
														<% int xxd=0; %>
						<c:forEach items="${pervAgentSet}" var="obj">
						<% if(xxd==0) {%>
						<div id="preRegSection-dv" class="addmoredv" >
						<%}else{ %>
						<div  class="addmoredv" >
						<%} %>
						
						<div class="drop_shadow">    <span onclick="deloptdv(this);" style='float: right;'>DELETE</span></div>
						<div class="form-group">
                         

							<br> <label for="inputEmail3" class="col-sm-3 control-label">
								Registration Number</label>
							<div class="col-sm-3">
							  <input type="hidden"  name="preRegId" value="${obj.preRegistrationId}">
								<input name="preRegistrationNo" class="form-control input-sm alphanumericValFld requiredValFld"  value="${obj.preRegistrationNo}"/>
								<span class='requiredValFldMsg'> Please enter Registration Number.</span>
							</div>

							<label for="inputEmail3" class="col-sm-2 control-label">Union
								Territory/State</label>
							<div class="col-sm-3">
								<select name="preRegStateUt" id="preRegStateUtId"  onchange="reloadChildDropdown(this)" class="form-control dynaselectfld requiredValFld">
						<option value='0'> --Select-- </option>
						<c:forEach  items="${stateUtList}" var="st">
						<c:choose>
						<c:when test="${st.stateUtId==obj.districtModel.stateUtModel.stateUtId }">
						<option value='${st.stateUtId }' selected="selected"> ${st.stateUtName } </option>
						</c:when>
						<c:otherwise>
						<option value='${st.stateUtId }'> ${st.stateUtName } </option>
						</c:otherwise>
						
						
						
						</c:choose>
						</c:forEach>
						</select>
						<span class='requiredValFldMsg'> Please select State.</span>
						
							</div>

						</div>


						<div class="form-group">

							<label class="col-sm-3	 control-label">Upload Certificate</label>
							<div class="col-sm-3">
							
							
								<div class="Containerdvcertspn  dynaeditablefilefld"> 
					<span class='filenamecertspn'><a href="download?DOC_ID=${obj.certificateDoc.documentId}">  ${obj.certificateDoc.fileName} </a></span>
						
						<span onclick="editfilefieldenable(this)" style='float:right;cursor:pointer;' id="certspn" class='spnbtnclass'>
										
					 EDIT   </span>
					
					        <div class="Containercertspn" style="display:none;">
							<input type="file"  name="certificatePath"  class="form-control dynaselectfld requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="exampleInputFile"/>
							<span class='requiredValFldMsg'> Please select Certificate.</span>
							</div>
					 </div>
						
					
							
								
								
							</div>
							
							
								<label for="inputEmail3" class="col-sm-2 control-label">District</label>
							<div class="col-sm-3">
								<select name="preDistrictId" class="form-control dynaselectfld requiredValFld" id="District-preRegStateUtId">
								<option value='0'> --Select-- </option>
									<c:forEach  items="${obj.districtModel.stateUtModel.districtModelSet}" var="dst">	
								
								<c:choose>
						<c:when test="${dst.districtId==obj.districtModel.districtId}">
						<option value='${dst.districtId }' selected="selected"> ${dst.districtName } </option>
						</c:when>
						<c:otherwise>
						<option value='${dst.districtId }'> ${dst.districtName } </option>
						</c:otherwise>
						
						</c:choose>
								
							
							</c:forEach>
														

							</select>
							<span class='requiredValFldMsg'> Please select District.</span>

							</div>
						
						</div>
						</div>
					</c:forEach>
							
							
							</c:otherwise>
							</c:choose>
							
							
							
							
							
							
							
							
					</div>
				
					<div class="form-group">
						<div class="col-sm-2 pull-right" style="text-align: right;">

							<span class="glyphicon glyphicon-plus-sign theme-clr "
								aria-hidden="true"></span>
								<span class="theme-clr addmore"  id="preRegSection"> Add More&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>

						</div>

					</div>
				</div>
				<!--inner container end here-->


				<div class="button-wrapper">
					<!--  onclick="nextForm1()" <input name="btn1" class="btn-style" value="Next" type="submit"  onsubmit="nextForm1()"/> -->
					<input name="btn1" class="btn-style" value="Next" type="submit"  onclick="nextForm1()" />
				</div>

				<br>
			</form:form>


		</div>
		<!-- container end here-->
	</div>

</body>
</html>