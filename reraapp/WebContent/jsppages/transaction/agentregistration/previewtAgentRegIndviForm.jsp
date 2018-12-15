<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@ page isELIgnored="false"%>

	
	
		<div class="pop_main">
	
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
  
        </div>
        <div class="modal-body">
	
		<form:form class="form-horizontal" action="updateInvdAgentDetails" id="agenttrxForm1"  enctype="multipart/form-data"  modelAttribute="agentRegistrationModel" autocomplete="off">
	
	<!--News Ticker-->


			<!--Inner wrapper start here-->            
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
							<form:input path="agentDetailsModel.agentName" disabled="true" class="form-control input-sm" 
								id="inputEmail3" placeholder="" ></form:input>
						</div>
						<label for="inputEmail3" class="col-sm-2 control-label">Father`s
							Name<sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="agentDetailsModel.agentFatherName" disabled="true" class="form-control input-sm" />

						</div>

					</div>

					<div class="form-group">
						<label for="inputEmail3" class="col-sm-3 control-label">Occupation</label>
						<div class="col-sm-3">
							<form:input path="agentDetailsModel.occupation" disabled="true" class="form-control input-sm"
								id="inputEmail3" placeholder="" />
						</div>
						
						<label for="inputEmail3" class="col-sm-2 control-label">Email
							Address<sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="agentDetailsModel.agentEmailId" disabled="true" class="form-control input-sm"
								placeholder="" />
						</div>
						
						</div>
						
						
						<div class="form-group">


						<label for="inputEmail3" class="col-sm-3 control-label">Adhaar
							No.<sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="agentDetailsModel.agentAdhaarNo" disabled="true" class="form-control input-sm" />
						</div>

						<label for="inputEmail3" class="col-sm-2 control-label">PAN
							Card No.<sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="agentDetailsModel.agentPanNo" disabled="true" class="form-control input-sm" />
						</div>

					</div>
					
					<div class="form-group">
						
						
						<label for="inputEmail3" class="col-sm-3 control-label">Mobile
							Number<sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="agentDetailsModel.agentPhoneNo" disabled="true" class="form-control input-sm"
								placeholder="" />
						</div>
						<label for="inputEmail3" class="col-sm-2 control-label">LandLine
							Number<sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="agentDetailsModel.landLineNumber1" disabled="true" class="form-control input-sm"
								placeholder="" />
						</div>
						
						
						</div>
						
						<div class="form-group">

							<label id="agentIndividualAddress" for="inputEmail3"
							class="col-sm-3 control-label">Address Line 1<sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="agentDetailsModel.agentIndividualAddressLine1" disabled="true"
								class="form-control input-sm" rows="3" />
						</div>
						<label id="agentIndividualAddress" for="inputEmail3"
							class="col-sm-2 control-label">Address Line 2<sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="agentDetailsModel.agentIndividualAddressLine2" disabled="true"
								class="form-control input-sm" rows="3" />
						</div>
						
						
						</div>
						
						
						  <div class="form-group">

						<label for="inputEmail3" class="col-sm-3 control-label">Pincode<sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="agentDetailsModel.agentIndividualPincode" disabled="true"
								class="form-control input-sm" rows="3" />
						</div>
						
						</div>
						
						
						
						<div class="form-group">


							 <label for="inputEmail3" class="col-sm-3 control-label">
								State<sup>*</sup></label>
							<div class="col-sm-3">
								<select name="agentStateUtId" id="agentStateUtId" disabled="disabled"  onchange="reloadChildDropdown(this)" class="form-control">
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



							<label for="inputEmail3" class="col-sm-2 control-label">District<sup>*</sup></label>
							<div class="col-sm-3">
															
								
								<select name="agentDistrictId" disabled="disabled" class="form-control" id="District-agentStateUtId">
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
					
					
					</div>


					<div class="form-group">

						<label for="inputEmail3" class="col-sm-3 control-label">Business
							Address Line 1<sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="agentDetailsModel.agentIndividualBussAddress1" dir="true"
								class="form-control input-sm" disabled="true" rows="3" />
						</div>
						<label for="inputEmail3" class="col-sm-2 control-label">Business
							Address Line 2<sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="agentDetailsModel.agentIndividualBussAddress2" disabled="true"
								class="form-control input-sm" rows="3" />
						</div>

					</div>

						<div class="form-group">


							<br> <label for="inputEmail3" class="col-sm-3 control-label">
								State<sup>*</sup></label>
							<div class="col-sm-3">
									
								
								<select name="businessStateUtId" id="businessState" disabled="disabled"  onchange="reloadChildDropdown(this)" class="form-control">
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
								
								
								
								
								
								
							</div>



							<label for="inputEmail3" class="col-sm-2 control-label">District<sup>*</sup></label>
							<div class="col-sm-3">
								
								
								<select name="businessDistrictId" class="form-control" disabled="disabled" id="District-businessState">
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
								
								
							</div>


						</div>
						
						   <div class="form-group">

						<label for="inputEmail3" class="col-sm-3 control-label">Pincode<sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="agentDetailsModel.agentIndividualBussPincode" disabled="true"
								class="form-control input-sm" rows="3" />
						</div>
						

					</div>
						
						
						
						
						
						
						
						
						
						
						
					<div class="form-group"></div>

					<div class="form-group">


						

						<label for="inputEmail3" class="col-sm-3 control-label">Photograph<sup>*</sup></label>
						<div class="col-sm-3">
						
						<div class="Containerdvphotospn"> 
					<span class='filenamephotospn'><a href="download?DOC_ID=  ${agentRegistrationModel.agentDetailsModel.photograph.documentId }">  ${agentRegistrationModel.agentDetailsModel.photograph.fileName } </a></span>
						
						
					        <div class="Containerphotospn" style="display:none;">
							<input type="file" name="agentPhotographPath" disabled="disabled" />
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
							Other RERA <span>Registration Details</span>
						</h1>
							
							<% int xxd=0; %>
						<c:forEach items="${pervAgentSet}" var="obj">
						<% if(xxd==0) {%>
						<div id="preRegSection-dv" class="addmoredv" >
						<%}else{ %>
						<div  class="addmoredv" >
						<%} %>
						
						<div class="drop_shadow">   </div>
						<div class="form-group">
                           <input type="hidden"  name="preRegId" value="${obj.preRegistrationId}">

							<br> <label for="inputEmail3" class="col-sm-3 control-label">
								Registration Number</label>
							<div class="col-sm-3">
								<input name="preRegistrationNo" disabled="disabled" class="form-control input-sm"  value="${obj.preRegistrationNo}"/>
							</div>

							<label for="inputEmail3" class="col-sm-2 control-label">Union
								Territory/State</label>
							<div class="col-sm-3">
								<select name="preRegStateUt" id="preRegStateUtId" disabled="disabled"  onchange="reloadChildDropdown(this)" class="form-control dynaselectfld">
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
							
							
								<div class="Containerdvcertspn  dynaeditablefilefld"> 
					<span class='filenamecertspn'><a href="download?DOC_ID=${obj.certificateDoc.documentId}">  ${obj.certificateDoc.fileName} </a></span>
						
						
					
					        <div class="Containercertspn" style="display:none;">
							<input type="file" disabled="disabled"  name="certificatePath"  id="exampleInputFile"/>
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

							<!-- AGENT INDIVIDUAL END -->
							
							
							
							<!-- AGENT DOCUMENT START  -->

<!--Inner wrapper stsrt here-->
<div class="inner_wrapper">



<h1>Upload<span> Document</span></h1>
<div class="border"><div class="orange"></div><div class="black"></div></div>

	
		
			<div class="form-group">
				<label class="col-sm-3 control-label"> PAN Card</label>
				<div class="col-sm-3">
				 				  	
				  		
							
							
							
								
						<div class="Containerdvphotospn"> 
					<span class='filenamephotospn'><a href="download?DOC_ID=${UploadDetails.panCardPath.documentId}"> ${UploadDetails.panCardPath.fileName} </a></span>
						
					
					        <div class="Containerphotospn" style="display:none;">
							<input type="file" name="panCardDocFile" id="panCardFile" disabled="disabled" />
							</div>
					 </div>
						
							
							
							
							
							
							
							
							
							
							
							
							
				</div>
		

				<label class="col-sm-2 control-label"> Address proof</label>
				<div class="col-sm-3">
				
				
				
						<div class="Containerdvaddressproof"> 
					<span class='filenameaddressproof'><a href="download?DOC_ID=${UploadDetails.addressProofPath.documentId}"> ${UploadDetails.addressProofPath.fileName} </a></span>
						
					
					        <div class="Containeraddressproof" style="display:none;">
							<input type="file" name="addressProofPath" id="addressProofPath" disabled="disabled" />
							</div>
					 </div>
				
				
				
				
			
				
							
				</div>
			
			</div>
		
			
		
	</div>
	<!-- AGENT DOCUMENT END  -->
<!--inner container end here-->





			</form:form>
</div></div></div></div></div>	