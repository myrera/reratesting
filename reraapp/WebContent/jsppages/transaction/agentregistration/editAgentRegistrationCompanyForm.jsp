<%@page import="in.gov.rera.common.security.ReraSecurity"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		<div class="stepwizard col-md-offset-1"></div>

	</div>
	<!--News Ticker-->
	<div class="container">
<form:form class="form-horizontal" autocomplete="off" action="updateAgentCompRegistration" id="agenttrxForm1" modelAttribute="agentRegistrationModel" method="POST" enctype='multipart/form-data'>
		<%=ReraSecurity.writeToken(request) %>
		<!--main container start here-->
	
	
				<form:hidden  path="agentRegistrationID"/>
				  <form:hidden path="agentDetailsModel.agentRegDetailID"/>
				  <form:hidden path="registrationType"/>
				   <form:hidden path="registrationStage"/>
	
	
		<div class="Main_containner">

			<!--Inner wrapper stsrt here-->
			<div class="inner_wrapper">

				<h1>
					Applicant<span> Detail</span>
				</h1>
				<div class="border">
					<div class="orange"></div>
					<div class="black"></div>
				</div>

				
					<br>

					<div class="form-group">
						<label class="col-sm-3 control-label">Name</label>
						<div class="col-sm-3">
							<form:input path="agentDetailsModel.firmName"  class="form-control input-sm requiredValFld"
								id="inputEmail3" placeholder=""/>
								<span class='requiredValFldMsg'> Please enter Name.</span>
						</div>
						
						<label for="inputEmail3" class="col-sm-2 control-label">Email
							Address</label>
						<div class="col-sm-3">
							<form:input path="agentDetailsModel.firmEmail" rel="txtTooltip" title="Only valid emailId is allowed.e.g:abc@xyz.com" data-toggle="tooltip" data-placement="bottom"   class="form-control input-sm emailValFld requiredValFld"
								id="agentEmailId" placeholder=""/>
								<span class='requiredValFldMsg'> Please enter Email Address.</span>
						</div>
						</div>
						
						<div class="form-group">
						<label class="col-sm-3 control-label">PAN No.</label>
						<div class="col-sm-3">
							<form:input path="agentDetailsModel.agentPanNo" rel="txtTooltip" title="Only valid pan number is allowed.e.g:ABCDE1234F " data-toggle="tooltip" data-placement="bottom"  class="form-control input-sm panNoValFld requiredValFld"
								id="inputEmail3" placeholder=""/>
								<span class='requiredValFldMsg'> Please enter Pan Number.</span>
						</div>
						
						
						</div>
						
						<div class="form-group">
						<label for="inputEmail3" class="col-sm-3 control-label">Registration
							Type</label>
						<div class="col-sm-3">
							<form:select path="agentDetailsModel.firmRegistrationType" class="form-control requiredValFld">
								<form:option value="0">Select</form:option>
								<form:option value="Company">Company</form:option>
								<form:option value="Partnership Firm">Partnership Firm </form:option>
								<form:option value="Development Authority">Development Authority</form:option>
								<form:option value="Proprietorship Firm">Proprietorship Firm </form:option>
								<form:option value="Trust">Trust</form:option>
								<form:option value="Other">Other</form:option>


							</form:select>
							<span class='requiredValFldMsg'> Please select Registration Type.</span>
						</div>
						<label for="inputEmail3" class="col-sm-2 control-label">Major
							Activities </label>
						<div class="col-sm-3">
							<form:input path="agentDetailsModel.firmActivities" class="form-control input-sm requiredValFld"
								 placeholder=""/>
								 <span class='requiredValFldMsg'> Please enter Major Activities.</span>
						</div>

					</div>

					<div class="form-group">
						<label for="inputEmail3" class="col-sm-3 control-label">Registration Number</label>
						<div class="col-sm-3">
							<form:input path="agentDetailsModel.firmRegistrationNo" class="form-control input-sm alphanumericValFld requiredValFld"
							 rel="txtTooltip"  title="In case of partnership firm 'NOT APPLICABLE' can be written. For Others it is mandatory" data-toggle="tooltip" data-placement="bottom" />
							<span class='requiredValFldMsg'> Please enter Registration Number.</span>
						</div>

						<label for="inputEmail3" class="col-sm-2 control-label">
							Fax Number </label>
						<div class="col-sm-3">
							<form:input path="agentDetailsModel.firmFaxNumber" rel="txtTooltip" title="Only digits are allowed." data-toggle="tooltip" data-placement="bottom"  class="form-control input-sm"
								id="inputEmail3" placeholder=""/>
								<!-- <span class='requiredValFldMsg'> Please enter Fax Number.</span> -->
						</div>

					</div>

					<div class="form-group">

						<label for="inputEmail3" class="col-sm-3 control-label">Mobile
							Number </label>
						<div class="col-sm-3">
							<form:input path="agentDetailsModel.firmMobileNo" rel="txtTooltip" title="Only 10 digits of mobile number is allowed." data-toggle="tooltip" data-placement="bottom"  class="form-control input-sm mobileValFld requiredValFld"/>
							<span class='requiredValFldMsg'> Please enter Mobile Number.</span>
						</div>
                         
                         <label for="inputEmail3" class="col-sm-2 control-label">Landline
							Number </label>
						<div class="col-sm-3">
							<form:input path="agentDetailsModel.firmLandLineNo1" rel="txtTooltip" title="Only 6-10 digits of landline number is allowed." data-toggle="tooltip" data-placement="bottom"  class="form-control input-sm landlineValFld requiredValFld"/>
							<span class='requiredValFldMsg'> Please enter Land Line Number.</span>
						</div>
                     			
					</div>
						<div class="form-group">
						<label for="inputEmail3" class="col-sm-3 control-label">Address Line 1
						</label>
						<div class="col-sm-3">
							<form:input path="agentDetailsModel.firmAddressLine1" class="form-control input-sm requiredValFld" rows="3"/>
							<span class='requiredValFldMsg'> Please enter Address Line 1.</span>
						</div>
						<label for="inputEmail3" class="col-sm-2 control-label">Address Line 2
						</label>
						<div class="col-sm-3">
							<form:input path="agentDetailsModel.firmAddressLine2" class="form-control input-sm requiredValFld" rows="3"/>
							<span class='requiredValFldMsg'> Please enter Address Line 2.</span>
						</div>

					</div>
					
					<div class="form-group">

					<label for="inputEmail3" class="col-sm-3 control-label">State</label>
						<div class="col-sm-3">
							<select name="agentStateUtId" id="agentState"  onchange="reloadChildDropdown(this)" class="form-control requiredValFld">
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
						<span class='requiredValFldMsg'> Please select State.</span>
							</div>
							
							
							
							
								<label for="inputEmail3" class="col-sm-2 control-label">District</label>
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
							<span class='requiredValFldMsg'> Please select District.</span>
						</div>
							
					</div>
					
					<div class="form-group">
						
						
							<label for="inputEmail3" class="col-sm-3 control-label">Pincode<sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="agentDetailsModel.firmPincode" rel="txtTooltip" title="Only 6 digits of pin number is allowed." data-toggle="tooltip" data-placement="bottom"  class="form-control input-sm pinCodeValFld requiredValFld"/>
							<span class='requiredValFldMsg'> Please enter Pin Code.</span>
						</div>
					
						
						
						<label for="inputEmail3" class="col-sm-2 control-label 	 ">
							Company Registration Certificate </label>
						<div class="col-sm-3">
							
										
								
									<div class="Containerdvphotospn"> 
					<span class='filenamephotospn'><a href="download?DOC_ID=${agentRegistrationModel.agentDetailsModel.firmCertificatDoc.documentId }">  ${agentRegistrationModel.agentDetailsModel.firmCertificatDoc.fileName } </a></span>
						
						<span onclick="editfilefieldenable(this)" style='float:right;cursor:pointer;' id="photospn">
											
					 EDIT   </span>
					
					        <div class="Containerphotospn" style="display:none;">
							<input type="file" class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  name="firmRegCertificatePath" />
							<span class='requiredValFldMsg'> Please select Company Registration Certificate.</span>
							</div>
					 </div>
					 
					 
					 
						</div>

					</div>
					
					<br>
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
							Partner/Director <span>Details</span>
						</h1>
						<div class="drop_shadow"></div>

						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">
								Partner / Director Name </label>
							<div class="col-sm-3">
								<form:input path="agentDetailsModel.partnerOrDirectorName" class="form-control input-sm requiredValFld"
									 placeholder=""/>
									 <span class='requiredValFldMsg'> Please enter Partner / Director Name.</span>
							</div>
							
								<label for="inputEmail3" class="col-sm-2 control-label">
								Email Address </label>
							<div class="col-sm-3">
								<form:input path="agentDetailsModel.partnerOrDirectorEmailAddress" rel="txtTooltip" title="Only valid emailId is allowed.e.g:abc@xyz.com" data-toggle="tooltip" data-placement="bottom"  class="form-control input-sm emailValFld requiredValFld" rows="3"/>
								<span class='requiredValFldMsg'> Please enter Email Id.</span>
							</div>
							</div>
								<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">
								Address Line 1 </label>
							<div class="col-sm-3">
								<form:input path="agentDetailsModel.partnerOrDirectorAddressLine1" class="form-control input-sm requiredValFld" rows="3"/>
								<span class='requiredValFldMsg'> Please enter Address Line 2.</span>
							</div>
							<label for="inputEmail3" class="col-sm-2 control-label">
								Address Line 2 </label>
							<div class="col-sm-3">
								<form:input path="agentDetailsModel.partnerOrDirectorAddressLine2" class="form-control input-sm requiredValFld" rows="3"/>
								<span class='requiredValFldMsg'> Please enter Address Line 1.</span>
							</div>
							</div>
							<div class="form-group">
						<label for="inputEmail3" class="col-sm-3 control-label">State</label>
						<div class="col-sm-3">
					<select name="directorStateUtId" id="directorState"  onchange="reloadChildDropdown(this)" class="form-control requiredValFld">
						<option value='0'> --Select-- </option>
						<c:forEach  items="${stateUtList}" var="st">
						<c:choose>
						<c:when test="${st.stateUtId==directorDistrictId.stateUtModel.stateUtId }">
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
						<label for="inputEmail3" class="col-sm-2 control-label">District</label>
						<div class="col-sm-3">
							<select name="directorDistrictId" class="form-control requiredValFld" id="District-directorState">
							<option value='0'> --Select-- </option>
									<c:forEach  items="${directorDistrictId.stateUtModel.districtModelSet}" var="dst">	
								
								<c:choose>
						<c:when test="${dst.districtId==directorDistrictId.districtId}">
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
								<form:input path="agentDetailsModel.partnerOrDirectorPincode" rel="txtTooltip" title="Only 6 digits of pin number is allowed." data-toggle="tooltip" data-placement="bottom"  class="form-control input-sm pinCodeValFld requiredValFld"
									 placeholder=""/>
									 <span class='requiredValFldMsg'> Please enter Pin Code.</span>
							</div>
							<label for="inputEmail3" class="col-sm-2 control-label">Mobile
								Number <sup>*</sup></label>
							<div class="col-sm-3">
								<form:input path="agentDetailsModel.partnerOrDirectorPhoneNO" rel="txtTooltip" title="Only 10 digits of mobile number is allowed." data-toggle="tooltip" data-placement="bottom"  class="form-control input-sm mobileValFld requiredValFld"
									 placeholder=""/>
									 <span class='requiredValFldMsg'> Please enter Mobile Number.</span>
							</div>
							
					

						
					</div>
					
					
					
							<div class="form-group">
							
							<label for="inputEmail3" class="col-sm-3 control-label">Photograph
							</label>
							<div class="col-sm-3">
								
								
								
									<div class="Containerdvphotospn"> 
					<span class='filenamephotospn'><a href="download?DOC_ID=${agentRegistrationModel.agentDetailsModel.photograph.documentId }">  ${agentRegistrationModel.agentDetailsModel.photograph.fileName } </a></span>
						
						<span onclick="editfilefieldenable(this)" style='float:right;cursor:pointer;' id="photospn">
											
					 EDIT   </span>
					
					        <div class="Containerphotospn" style="display:none;">
							<input type="file" class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  name="agentPhotographPath" />
							<span class='requiredValFldMsg'> Please select Photograph.</span>
							</div>
					 </div>
							</div>
							
						</div>

						
					</div>

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
							 <input type="hidden"  name="preRegId" />
								<input type="text" name="preRegistrationNo" class="form-control input-sm alphanumericValFld requiredValFld">
							
							<span class='requiredValFldMsg'> Please enter Registration Number.</span>
							</div>

							<label for="inputEmail3" class="col-sm-2 control-label">Union
								Territory/State</label>
							<div class="col-sm-3">
					<select name="stateUtId" id="preRegState"  onchange="reloadChildDropdown(this)" class="form-control dynaselectfld requiredValFld" >
						<option value='0'> --Select-- </option>
						<c:forEach  items="${stateUtList}" var="st">
						<option value='${st.stateUtId }'> ${st.stateUtName } </option>
						</c:forEach>
						</select>
						<span class='requiredValFldMsg'> Please select State.</span>
					
							</div>

						</div>

						<div class="form-group">

							<label class="col-sm-3	 control-label">Upload Certificate</label>
							<div class="col-sm-3">
								<input type="file" class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  name="certificatePath" id="exampleInputFile">
							</div>
							
							<label for="inputEmail3" class="col-sm-2 control-label">District</label>
							<div class="col-sm-3">
								<select class="form-control dynaselectfld requiredValFld" name="preDistrictId" id="District-preRegState" >
									<option value="0">  --Select--   </option>
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
						
						<div class="drop_shadow">  <span onclick="deloptdv(this);" style='float: right;'>DELETE</span></div>
						<div class="form-group">
						<br> <label for="inputEmail3" class="col-sm-3 control-label">
								Registration Number</label>
							<div class="col-sm-3">
							 <input type="hidden"  name="preRegId" value="${obj.preRegistrationId}">
								<input type="text" name="preRegistrationNo" class="form-control input-sm alphanumericValFld requiredValFld" value="${obj.preRegistrationNo}">
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
								
										
							
								<div class="Containerdvcertspn dynaeditablefilefld"> 
					<span class='filenamecertspn'><a href="document?DOC_ID=${obj.certificateDoc.documentId}">  ${obj.certificateDoc.fileName} </a></span>
						
						<span onclick="editfilefieldenable(this)" style='float:right;cursor:pointer;' id='certspn' class='spnbtnclass'>
											
					 EDIT   </span>
					
					        <div class="Containercertspn" style="display:none;">
							<input type="file" class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  name="certificatePath"  id="exampleInputFile"/>
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
								<span class="theme-clr addmore" id="preRegSection"> Add More&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>

						</div>

					</div>
					
			</div>
			<!--inner container end here-->


			<div class="button-wrapper">
				<!-- <input name="btn1" class="btn-style" value="Next" type="submit" onclick="nextForm()"/>   onclick="nextDocumentForm()"-->
				<input name="btn1" class="btn-style" value="Next" type="submit" onclick="nextDocumentForm()" />
				
			</div>

		

			<br>

		</div>
		<!-- container end here-->
</form:form>
	</div>

	<!--<div class="container">
  <div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">
      <div class="gov-bodies"> <a href="#"><img src="images/got-bodies1.jpg" width="108" height="28" /> </a> <a href="#"><img src="images/got-bodies2.jpg" width="139" height="30" /> </a> <a href="#"><img src="images/got-bodies3.jpg" width="134" height="29" /> </a> <a href="#"><img src="images/got-bodies4.jpg" width="85" height="34" /> </a> <a href="#"><img src="images/got-bodies5.jpg" width="72" height="43" /> </a> <a href="#"><img src="images/got-bodies6.jpg" width="90" height="26" /> </a> <a href="#"><img src="images/got-bodies7.jpg" width="57" height="44" /> </a> <a href="#"><img src="images/got-bodies8.jpg" width="78" height="28" /> </a> <a href="#"><img src="images/got-bodies9.jpg" width="105" height="35" /> </a> </div>
    </div>
  </div>
</div>-->

</body>
</html>