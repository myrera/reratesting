<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@ page isELIgnored="false"%>

	
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
						<label class="col-sm-3 col-xs-3 control-label">Name<sup>*</sup></label>
						<div class="col-sm-3 col-xs-3">
							<form:input path="agentDetailsModel.agentName" disabled="true" class="form-control input-sm" 
								id="inputEmail3" placeholder="" ></form:input>
						</div>
						<label for="inputEmail3" class="col-sm-2 col-xs-2 control-label">Father`s
							Name<sup>*</sup></label>
						<div class="col-sm-3 col-xs-3">
							<form:input path="agentDetailsModel.agentFatherName" disabled="true" class="form-control input-sm" />

						</div>

					</div>

					<div class="form-group">
						<label for="inputEmail3" class="col-sm-3 col-xs-3 control-label">Occupation</label>
						<div class="col-sm-3 col-xs-3">
							<form:input path="agentDetailsModel.occupation" disabled="true" class="form-control input-sm"
								id="inputEmail3" placeholder="" />
						</div>
						
						<label for="inputEmail3" class="col-sm-2 col-xs-2 control-label">Email
							Address<sup>*</sup></label>
						<div class="col-sm-3 col-xs-3">
							<form:input path="agentDetailsModel.agentEmailId" disabled="true" class="form-control input-sm"
								placeholder="" />
						</div>
						
						</div>
						
						
						<div class="form-group">


						<label for="inputEmail3" class="col-sm-3 col-xs-3 control-label">Aadhaar
							No.<sup>*</sup></label>
						<div class="col-sm-3 col-xs-3">
							<form:input path="agentDetailsModel.agentAdhaarNo" disabled="true" class="form-control input-sm" />
						</div>

						<label for="inputEmail3" class="col-sm-2 col-xs-2 control-label">PAN
							Card No.<sup>*</sup></label>
						<div class="col-sm-3 col-xs-3">
							<form:input path="agentDetailsModel.agentPanNo" disabled="true" class="form-control input-sm" />
						</div>

					</div>
					
					<div class="form-group">
						
						
						<label for="inputEmail3" class="col-sm-3 col-xs-3 control-label">Mobile
							Number<sup>*</sup></label>
						<div class="col-sm-3 col-xs-3">
							<form:input path="agentDetailsModel.agentPhoneNo" disabled="true" class="form-control input-sm"
								placeholder="" />
						</div>
						<label for="inputEmail3" class="col-sm-2 col-xs-2 control-label">LandLine
							Number<sup>*</sup></label>
						<div class="col-sm-3 col-xs-3">
							<form:input path="agentDetailsModel.landLineNumber1" disabled="true" class="form-control input-sm"
								placeholder="" />
						</div>
						
						
						</div>
						
						<div class="form-group">

							<label id="agentIndividualAddress" for="inputEmail3"
							class="col-sm-3 col-xs-3 control-label">Address Line 1<sup>*</sup></label>
						<div class="col-sm-3 col-xs-3">
							<form:input path="agentDetailsModel.agentIndividualAddressLine1" disabled="true"
								class="form-control input-sm" rows="3" />
						</div>
						<label id="agentIndividualAddress" for="inputEmail3"
							class="col-sm-2 col-xs-2 control-label">Address Line 2<sup>*</sup></label>
						<div class="col-sm-3 col-xs-3">
							<form:input path="agentDetailsModel.agentIndividualAddressLine2" disabled="true"
								class="form-control input-sm" rows="3" />
						</div>
						
						
						</div>
						
						
						  <div class="form-group">

						<label for="inputEmail3" class="col-sm-3 col-xs-3 control-label">Pincode<sup>*</sup></label>
						<div class="col-sm-3 col-xs-3">
							<form:input path="agentDetailsModel.agentIndividualPincode" disabled="true"
								class="form-control input-sm" rows="3" />
						</div>
						
						</div>
						
						
						
						<div class="form-group">


							 <label for="inputEmail3" class="col-sm-3 col-xs-3 control-label">
								State<sup>*</sup></label>
							<div class="col-sm-3 col-xs-3">
								<select name="agentStateUtId" id="agentStateUtId" disabled="disabled"  onchange="reloadChildDropdown(this)" class="form-control">
						<option value='${agentRegistrationModel.agentDetailsModel.districtModel.stateUtModel.stateUtId }' selected="selected"> ${agentRegistrationModel.agentDetailsModel.districtModel.stateUtModel.stateUtName } </option>
						</select>		
							</div>



							<label for="inputEmail3" class="col-sm-2 col-xs-2 control-label">District<sup>*</sup></label>
							<div class="col-sm-3 col-xs-3">
															
								
								<select name="agentDistrictId" disabled="disabled" class="form-control" id="District-agentStateUtId">
						<option value='${agentRegistrationModel.agentDetailsModel.districtModel.districtId }' selected="selected"> ${agentRegistrationModel.agentDetailsModel.districtModel.districtName } </option>
								</select>
								
								
								
							</div>

						</div>
					
						<div class="form-group">
					
					
					</div>


					<div class="form-group">

						<label for="inputEmail3" class="col-sm-3 col-xs-3 control-label">Business
							Address Line 1<sup>*</sup></label>
						<div class="col-sm-3 col-xs-3">
							<form:input path="agentDetailsModel.agentIndividualBussAddress1" dir="true"
								class="form-control input-sm" disabled="true" rows="3" />
						</div>
						<label for="inputEmail3" class="col-sm-2 col-xs-2 control-label">Business
							Address Line 2<sup>*</sup></label>
						<div class="col-sm-3 col-xs-3">
							<form:input path="agentDetailsModel.agentIndividualBussAddress2" disabled="true"
								class="form-control input-sm" rows="3" />
						</div>

					</div>

						<div class="form-group">


							<br> <label for="inputEmail3" class="col-sm-3 col-xs-3 control-label">
								State<sup>*</sup></label>
							<div class="col-sm-3 col-xs-3">
									
								
								<select name="businessStateUtId" id="businessState" disabled="disabled"  onchange="reloadChildDropdown(this)" class="form-control">
							<option value='${agentRegistrationModel.agentDetailsModel.agentIndividualBussDistrictModel.stateUtModel.stateUtId }' selected="selected"> ${agentRegistrationModel.agentDetailsModel.agentIndividualBussDistrictModel.stateUtModel.stateUtName} </option>
					</select>	
								
								
								
								
								
								
							</div>



							<label for="inputEmail3" class="col-sm-2 col-xs-2 control-label">District<sup>*</sup></label>
							<div class="col-sm-3 col-xs-3">
								
								
								<select name="businessDistrictId" class="form-control" disabled="disabled" id="District-businessState">
									<option value='${agentRegistrationModel.agentDetailsModel.agentIndividualBussDistrictModel.districtId }' selected="selected"> ${agentRegistrationModel.agentDetailsModel.agentIndividualBussDistrictModel.districtName } </option>
											</select>
								
								
							</div>


						</div>
						
						   <div class="form-group">

						<label for="inputEmail3" class="col-sm-3 col-xs-3 control-label">Pincode<sup>*</sup></label>
						<div class="col-sm-3 col-xs-3">
							<form:input path="agentDetailsModel.agentIndividualBussPincode" disabled="true"
								class="form-control input-sm" rows="3" />
						</div>
						

					</div>
						
						
						
						
						
						
						
						
						
						
						
					<div class="form-group"></div>

					<div class="form-group">


						

						<label for="inputEmail3" class="col-sm-3 col-xs-3 control-label">Photograph<sup>*</sup></label>
						<div class="col-sm-3 col-xs-3">
						
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
						<label for="inputEmail3" class="col-sm-3 col-xs-3 control-label">District<sup>*</sup></label>
						<div class="col-sm-3 col-xs-3">
							<select class="form-control requiredValFld" name='oprDistrictId' disabled="disabled" id="oprDistrictId" onchange="reloadSubDistrict(this)">
						
						<option value='${agentRegistrationModel.districtModel.districtId }'> ${agentRegistrationModel.districtModel.districtName } </option>
						</select>
						<span class='requiredValFldMsg'> Please select District.</span>
						</div>
						<label for="inputEmail3" class="col-sm-2 col-xs-2 control-label">Tehsil/Sub
							District<sup>*</sup></label>
						<div class="col-sm-3 col-xs-3">
							<select name="oprSubDistrictId" disabled="disabled" class="form-control requiredValFld" id="SubDistrict-oprDistrictId">

						<option value='${agentRegistrationModel.subDistrictModel.subDistrictId }' selected="selected"> ${agentRegistrationModel.subDistrictModel.subDistrictName } </option>
							</select>
							<span class='requiredValFldMsg'> Please select Tehsil/Sub District.</span>
						</div>

					</div>
								<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 col-xs-3 control-label">
								Approving Authority<sup>*</sup></label>
							<div class="col-sm-3 col-xs-3">
								<form:select path="approvingAuthority" disabled="true"
								cssClass="form-control requiredValFld">
								<form:option value="0" label="Select" />
								<form:option value="AUDA" label="AUDA" />
								<form:option value="SUDA" label="SUDA" />
                                 <form:option value="Others" label="Others" />
							</form:select>
							<span class='requiredValFldMsg'> Please enter Approving Authority.</span>
							</div>
							</div>					
					
					
					
					

					</div>
		
					<br/>
		
					<div class="inner_wrapper">

						<h1>
							Other RERA <span>Registration Details</span>
						</h1>
							
							<% int xxd=0; %>
						<c:forEach items="${agentRegistrationModel.agentDetailsModel.regPreviousDatailsModelSet}" var="obj">
						<% if(xxd==0) {%>
						<div id="preRegSection-dv" class="addmoredv" >
						<%}else{ %>
						<div  class="addmoredv" >
						<%} %>
						
						<div class="drop_shadow">   </div>
						<div class="form-group">
                           <input type="hidden"  name="preRegId" value="${obj.preRegistrationId}">

							<br> <label for="inputEmail3" class="col-sm-3 col-xs-3 control-label">
								Registration Number</label>
							<div class="col-sm-3 col-xs-3">
								<input name="preRegistrationNo" disabled="disabled" class="form-control input-sm"  value="${obj.preRegistrationNo}"/>
							</div>

							<label for="inputEmail3" class="col-sm-2 col-xs-2 control-label">Union
								Territory/State</label>
							<div class="col-sm-3 col-xs-3">
						<select name="preRegStateUt" id="preRegStateUtId" disabled="disabled" onchange="reloadChildDropdown(this)" class="form-control dynaselectfld">
						<option value='${obj.districtModel.stateUtModel.stateUtId }' selected="selected"> ${obj.districtModel.stateUtModel.stateUtName } </option>
						</select>
							</div>


						</div>


						<div class="form-group">

							<label class="col-sm-3 col-xs-3	 control-label">Upload Certificate</label>
							<div class="col-sm-3 col-xs-3">
							
							
								<div class="Containerdvcertspn  dynaeditablefilefld"> 
					<span class='filenamecertspn'><a href="download?DOC_ID=${obj.certificateDoc.documentId}">  ${obj.certificateDoc.fileName} </a></span>
						
						
					
					        <div class="Containercertspn" style="display:none;">
							<input type="file" disabled="disabled"  name="certificatePath"  id="exampleInputFile"/>
							</div>
					 </div>
						
					
							
								
								
							</div>
							
							
							<label for="inputEmail3" class="col-sm-2 col-xs-2 control-label">District</label>
							<div class="col-sm-3 col-xs-3">
																
								
								<select name="preDistrictId" disabled="disabled" class="form-control dynaselectfld" id="District-preRegStateUtId">
						<option value='${obj.districtModel.districtId }' selected="selected"> ${obj.districtModel.districtName } </option>
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
				<label class="col-sm-3 col-xs-3 control-label"> PAN Card</label>
				<div class="col-sm-3 col-xs-3">
				 				  	
				  		
							
							
							
								
						<div class="Containerdvphotospn"> 
					<span class='filenamephotospn'><a href="download?DOC_ID=${agentRegistrationModel.agentDetailsModel.regUploadDetailsModel.panCardPath.documentId}"> ${agentRegistrationModel.agentDetailsModel.regUploadDetailsModel.panCardPath.fileName} </a></span>
						
					
					        <div class="Containerphotospn" style="display:none;">
							<input type="file"   name="panCardDocFile" id="panCardFile" disabled="disabled" />
							</div>
					 </div>
						
							
							
							
							
							
							
							
							
							
							
							
							
				</div>
		

				<label class="col-sm-2 col-xs-2 control-label"> Address proof</label>
				<div class="col-sm-3 col-xs-3">
				
				
				
						<div class="Containerdvaddressproof"> 
					<span class='filenameaddressproof'><a href="download?DOC_ID=${agentRegistrationModel.agentDetailsModel.regUploadDetailsModel.addressProofPath.documentId}"> ${agentRegistrationModel.agentDetailsModel.regUploadDetailsModel.addressProofPath.fileName} </a></span>
						
					
					        <div class="Containeraddressproof" style="display:none;">
							<input type="file"   name="addressProofPath" id="addressProofPath" disabled="disabled" />
							</div>
					 </div>
				
				
				
				
			
				
							
				</div>
			
			</div>		
			
		
	</div>
	<!-- AGENT DOCUMENT END  -->
<!--inner container end here-->

<div class="inner_wrapper">



<h1>Payment<span>Details</span></h1>
<div class="border">
<div class="orange"> </div>
<div class="black"></div></div>



				<div class="form-group">
				<label for="inputEmail3" class="col-sm-3 control-label"> Payment Mode<sup>*</sup></label>
						<div class="col-sm-3">
						

								<form:select path="agentDetailsModel.regPaymentDetailsModel.paymentMode"
								cssClass="form-control" disabled="true" >
								<form:option value="Khajane2 Challan" label="Khajane2 Challan" />
								</form:select>
							
							</div>
				
				<label for="inputEmail3" class="col-sm-2 control-label optionfld2">  </label>
				<div class="col-sm-3 optionfld2">
				
					
						<a href="https://www.onlinesbi.com/prelogin/icollecthome.htm" target="_blank">Click Here</a> for online payment through SBI Collect
				
					
				</div>
	
	         </div>
	
	
		<div class="form-group">
		<label for="inputEmail3" class="col-sm-3 control-label"> Amount (INR)<sup>*</sup></label>
				<div class="col-sm-3">
				<c:choose>
				<c:when test="${agentRegistrationModel.registrationType=='FIRM_COMP_REG' }">
				<input class="form-control input-sm" type="text" name="amount" readonly="readonly" value="50000" />
				</c:when>
				<c:otherwise>
				<input class="form-control input-sm" type="text" name="amount"  readonly="readonly"  value="10000" />
				</c:otherwise>
				</c:choose>
				</div>
				
				<label for="inputEmail3" class="col-sm-2 control-label optionfld2"> 	Unique Token Number<sup>*</sup> </label>
				<div class="col-sm-3 optionfld2">
				<form:input path="agentDetailsModel.regPaymentDetailsModel.paymentToken" cssClass="form-control input-sm"  readonly="true" />
				</div>
		
	</div>
	
	<div class="form-group optionfld2">
	<label for="inputEmail3" class="col-sm-3 control-label">Khajane2 Challan Number<sup>*</sup></label>
				<div class="col-sm-3">
					<form:input path="agentDetailsModel.regPaymentDetailsModel.sbiTransactionRefNo"  cssClass="form-control  input-sm requiredValFld"  />
				<span class='requiredValFldMsg'> Please enter SBCollect Reference Number.</span>
				</div>
		
				
			<label class="col-sm-2 control-label"> Attach Online Payment Receipt <sup>*</sup></label>
				<div class="col-sm-3">
				  <input type="file" class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  name="attachScanCopy"  id="exampleInputFile">
			<a href="#">${agentRegistrationModel.agentDetailsModel.regPaymentDetailsModel.attachScanCopy.fileName}</a>
			
				</div>	
	</div>
			
	
		<br>
<div class="form-group">

	<input type="checkbox" checked="checked"  class="requiredValFld" name="showonpublicdomain"></input> Except Aadhaar Card Number, all other information will be added to the public domain
		
		 <span class='requiredValFldMsg'> Please affirm the declarations.</span>					
 </div>
	
<br>
	<div class="form-group">

		<input type="checkbox"  checked="checked" class="requiredValFld" name="affirm" id="affirm"></input> [I/We] solemnly affirm and declare that the particulars given in herein are correct to [my /our] knowledge and belief and nothing material has been concealed by [me/us] therefrom
		<span class='requiredValFldMsg'> Please affirm the declarations.</span>
		
	</div>
			
			
	</div>





			</form:form>