<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>




	<div class="pop_main">
	
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
  
        </div>
        <div class="modal-body">
  



          <form:form class="form-horizontal" action="updateAgentCompRegistration" id="agenttrxForm1" modelAttribute="agentRegistrationModel" method="POST" enctype='multipart/form-data'>


				<form:hidden  path="agentRegistrationID"/>
				  <form:hidden path="agentDetailsModel.agentRegDetailID"/>
				  <form:hidden path="registrationType"/>
				   <form:hidden path="registrationStage"/>

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
							<form:input path="agentDetailsModel.firmName" disabled="true"  class="form-control input-sm"
								id="inputEmail3" placeholder=""/>
						</div>
						
						<label for="inputEmail3" class="col-sm-2 control-label">Email
							Address</label>
						<div class="col-sm-3">
							<form:input path="agentDetailsModel.firmEmail" disabled="true" class="form-control input-sm"
								id="agentEmailId" placeholder=""/>
						</div>
						</div>
						<div class="form-group">
						<label for="inputEmail3" class="col-sm-3 control-label">Registration
							Type</label>
						<div class="col-sm-3">
							<form:select path="agentDetailsModel.firmRegistrationType" disabled="true" class="form-control">
								<form:option value="0">Select</form:option>
								<form:option value="Company">Company</form:option>
								<form:option value="Partnership Firm">Partnership Firm </form:option>
			                 	<form:option value="Proprietorship Firm">Proprietorship Firm </form:option>
								<form:option value="Trust">Trust</form:option>
								<form:option value="Firm">Firm</form:option>
								<form:option value="Other">Other</form:option>



							</form:select>
						</div>
						<label for="inputEmail3" class="col-sm-2 control-label">Major
							Activities </label>
						<div class="col-sm-3">
							<form:input path="agentDetailsModel.firmActivities" disabled="true" class="form-control input-sm"
								 placeholder=""/>
						</div>

					</div>

					<div class="form-group">
						<label for="inputEmail3" class="col-sm-3 control-label">Registration Number</label>
						<div class="col-sm-3">
							<form:input path="agentDetailsModel.firmRegistrationNo" disabled="true" class="form-control input-sm"/>
						</div>

						<label for="inputEmail3" class="col-sm-2 control-label">
							Fax Number </label>
						<div class="col-sm-3">
							<form:input path="agentDetailsModel.firmFaxNumber" disabled="true"  class="form-control input-sm"
								id="inputEmail3" placeholder=""/>
						</div>

					</div>

					<div class="form-group">

						<label for="inputEmail3" class="col-sm-3 control-label">Mobile
							Number </label>
						<div class="col-sm-3">
							<form:input path="agentDetailsModel.firmMobileNo" disabled="true"  class="form-control input-sm"/>
						</div>
                         
                         <label for="inputEmail3" class="col-sm-2 control-label">Landline
							Number </label>
						<div class="col-sm-3">
							<form:input path="agentDetailsModel.firmLandLineNo1" disabled="true"  class="form-control input-sm"/>
						</div>
                     			
					</div>
						<div class="form-group">
						<label for="inputEmail3" class="col-sm-3 control-label">Address Line 1
						</label>
						<div class="col-sm-3">
							<form:input path="agentDetailsModel.firmAddressLine1" disabled="true" class="form-control input-sm" rows="3"/>
						</div>
						<label for="inputEmail3" class="col-sm-2 control-label">Address Line 2
						</label>
						<div class="col-sm-3">
							<form:input path="agentDetailsModel.firmAddressLine2" disabled="true" class="form-control input-sm" rows="3"/>
						</div>

					</div>
					
					<div class="form-group">

					<label for="inputEmail3" class="col-sm-3 control-label">State</label>
						<div class="col-sm-3">
							<select name="agentStateUtId" id="agentState" disabled="disabled"  onchange="reloadChildDropdown(this)" class="form-control">
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
							</div>
							
							
							
							
								<label for="inputEmail3" class="col-sm-2 control-label">District</label>
						<div class="col-sm-3">
							<select name="agentDistrictId" class="form-control" disabled="disabled" id="District-agentStateUtId">
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
						</div>
							
					</div>
					
					<div class="form-group">
						
						
							<label for="inputEmail3" class="col-sm-3 control-label">Pincode<sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="agentDetailsModel.firmPincode" disabled="true"  class="form-control input-sm"/>
						</div>
					
						
						
						<label for="inputEmail3" class="col-sm-2 control-label 	 ">
							Company Registration Certificate </label>
						<div class="col-sm-3">
							
										
								
									<div class="Containerdvphotospn"> 
					<span class='filenamephotospn'><a href="download?DOC_ID=${agentRegistrationModel.agentDetailsModel.firmCertificatDoc.documentId }">  ${agentRegistrationModel.agentDetailsModel.firmCertificatDoc.fileName } </a></span>
						
						
					
					        <div class="Containerphotospn" style="display:none;">
							<input type="file" name="firmRegCertificatePath" disabled="disabled" />
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
							<select class="form-control " name='oprDistrictId' id="oprDistrictId" onchange="reloadSubDistrict(this)">
						
							<option value='0'> --Select-- </option>
						<c:forEach items="${RERA_STATEUT.districtModelSet}" var="dst">
						<c:if test="${dst.districtId==agentRegistrationModel.districtModel.districtId }">
						<option value='${dst.districtId }' selected="selected"> ${dst.districtName } </option>
						</c:if>
						<c:if test="${dst.districtId!=agentRegistrationModel.districtModel.districtId }">
						<option value='${dst.districtId }'> ${dst.districtName } </option>
						</c:if>
						</c:forEach>
						</select>
						</div>
						<label for="inputEmail3" class="col-sm-2 control-label">Tehsil/Sub
							District<sup>*</sup></label>
						<div class="col-sm-3">
							<select name="oprSubDistrictId" class="form-control " id="SubDistrict-oprDistrictId">
							<c:forEach items="${agentRegistrationModel.districtModel.subDistrictModelSet}" var="sb">
							<c:if test="${sb.subDistrictId==agentRegistrationModel.subDistrictModel.subDistrictId }">
						<option value='${sb.subDistrictId }' selected="selected"> ${sb.subDistrictName } </option>
						</c:if>
						<c:if test="${sb.subDistrictId!=agentRegistrationModel.districtModel.districtId }">
						<option value='${sb.subDistrictId }'> ${sb.subDistrictName } </option>
						</c:if>
							</c:forEach>
							</select>
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
								<form:input path="agentDetailsModel.partnerOrDirectorName" disabled="true" class="form-control input-sm"
									 placeholder=""/>
							</div>
							
								<label for="inputEmail3" class="col-sm-2 control-label">
								Email Address </label>
							<div class="col-sm-3">
								<form:input path="agentDetailsModel.partnerOrDirectorEmailAddress" disabled="true" class="form-control input-sm" rows="3"/>
							</div>
							</div>
								<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">
								Address Line 1 </label>
							<div class="col-sm-3">
								<form:input path="agentDetailsModel.partnerOrDirectorAddressLine1" disabled="true" class="form-control input-sm" rows="3"/>
							</div>
							<label for="inputEmail3" class="col-sm-2 control-label">
								Address Line 2 </label>
							<div class="col-sm-3">
								<form:input path="agentDetailsModel.partnerOrDirectorAddressLine2" disabled="true" class="form-control input-sm" rows="3"/>
							</div>
							</div>
							<div class="form-group">
						<label for="inputEmail3" class="col-sm-3 control-label">State</label>
						<div class="col-sm-3">
					<select name="directorStateUtId" id="directorState" disabled="disabled"  onchange="reloadChildDropdown(this)" class="form-control">
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
										</div>
						<label for="inputEmail3" class="col-sm-2 control-label">District</label>
						<div class="col-sm-3">
							<select name="directorDistrictId" class="form-control" disabled="disabled" id="District-directorState">
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
						</div>

					</div>
					
					
					
					<div class="form-group">
							
							<label for="inputEmail3" class="col-sm-3 control-label">Pincode<sup>*</sup></label>
							<div class="col-sm-3">
								<form:input path="agentDetailsModel.partnerOrDirectorPincode" disabled="true" class="form-control input-sm"
									 placeholder=""/>
							</div>
							<label for="inputEmail3" class="col-sm-2 control-label">Mobile
								Number <sup>*</sup></label>
							<div class="col-sm-3">
								<form:input path="agentDetailsModel.partnerOrDirectorPhoneNO" disabled="true" class="form-control input-sm"
									 placeholder=""/>
							</div>
							
					

						
					</div>
					
					
					
							<div class="form-group">
							
							<label for="inputEmail3" class="col-sm-3 control-label">Photograph
							</label>
							<div class="col-sm-3">
								
								
								
									<div class="Containerdvphotospn"> 
					<span class='filenamephotospn'><a href="download?DOC_ID=${agentRegistrationModel.agentDetailsModel.photograph.documentId }">  ${agentRegistrationModel.agentDetailsModel.photograph.fileName } </a></span>
						
						
					
					        <div class="Containerphotospn" style="display:none;">
							<input type="file" name="agentPhotographPath" disabled="disabled" />
							</div>
					 </div>
							</div>
							
						</div>

						
					</div>

					<div class="inner_wrapper">

						<h1>
							Other RERA <span>Registration Details</span>
						</h1>
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
								<input type="text" name="preRegistrationNo" class="form-control input-sm" disabled="disabled" value="${obj.preRegistrationNo}">
							</div>

							<label for="inputEmail3" class="col-sm-2 control-label">Union
								Territory/State</label>
							<div class="col-sm-3">
						<select name="preRegStateUt" id="preRegStateUtId" disabled="disabled" onchange="reloadChildDropdown(this)" class="form-control dynaselectfld">
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
							</div>

						</div>

						<div class="form-group">

							<label class="col-sm-3	 control-label">Upload Certificate</label>
							<div class="col-sm-3">
								
										
							
								<div class="Containerdvcertspn dynaeditablefilefld"> 
					<span class='filenamecertspn'><a href="document?DOC_ID=${obj.certificateDoc.documentId}">  ${obj.certificateDoc.fileName} </a></span>
						
						
					
					        <div class="Containercertspn" style="display:none;">
							<input type="file" name="certificatePath"  id="exampleInputFile" disabled="disabled"/>
							</div>
					 </div>
						
							</div>
							
							<label for="inputEmail3" class="col-sm-2 control-label">District</label>
							<div class="col-sm-3">
																
								
								<select name="preDistrictId" disabled="disabled" class="form-control dynaselectfld" id="District-preRegStateUtId">
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
								
								
								
							</div>

						</div>
						</div>
</c:forEach>
					</div>

					
					
			</div>
			<!--inner container end here-->


		
		

			<br>


<!--Inner wrapper stsrt here-->
<div class="inner_wrapper">



<h1>Upload<span> Document</span></h1>
<div class="border"><div class="orange"></div><div class="black"></div></div>


<form:form class="form-horizontal" modelAttribute="agentRegistrationModel" action="editAgentRegUpload"
 id="agenttrxForm1" method="POST"   enctype="multipart/form-data" >
	
				<form:hidden  path="agentRegistrationID"/>
				  <form:hidden path="agentDetailsModel.agentRegDetailID"/>
				  <form:hidden path="registrationType"/>
				   <form:hidden path="registrationStage"/>
	
			<div class="form-group">
				<label class="col-sm-3 control-label"> PAN Card</label>
				<div class="col-sm-3">
				 				  	
				  		
							
							
							
								
						<div class="Containerdvphotospn"> 
					<span class='filenamephotospn'><a href="download?DOC_ID=${UploadDetails.panCardPath.documentId}"> ${UploadDetails.panCardPath.fileName} </a></span>
						
					
					        <div class="Containerphotospn" style="display:none;">
							<input type="file"   name="panCardDocFile" id="panCardFile" disabled="disabled" />
							</div>
					 </div>
						
							
							
							
							
							
							
							
							
							
							
							
							
				</div>
		

				<label class="col-sm-2 control-label"> Address proof</label>
				<div class="col-sm-3">
				
				
				
						<div class="Containerdvaddressproof"> 
					<span class='filenameaddressproof'><a href="download?DOC_ID=${UploadDetails.addressProofPath.documentId}"> ${UploadDetails.addressProofPath.fileName} </a></span>
						
					
					        <div class="Containeraddressproof" style="display:none;">
							<input type="file"   name="addressProofPath" id="addressProofPath" disabled="disabled" />
							</div>
					 </div>
				
				
				
				
			
				
							
				</div>
			
			</div>
		
			
		

 </form:form>
	</div>
		<!-- container end here-->
	
  

 </form:form>
 </div></div></div></div></div>
