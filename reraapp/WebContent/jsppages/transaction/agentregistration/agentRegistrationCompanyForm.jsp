
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
<form:form class="form-horizontal" autocomplete="off" action="saveAgentCompRegistration" id="agenttrxForm1" modelAttribute="agentRegistrationModel" method="POST" enctype='multipart/form-data'>
		<%=ReraSecurity.writeToken(request) %>
		<!--main container start here-->
		<div class="Main_containner">

			<!--Inner wrapper start here-->
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
						<label class="col-sm-3 control-label">Name<sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="agentDetailsModel.firmName"  class="form-control input-sm requiredValFld"
								id="inputEmail3" placeholder=""/>
						<span class='requiredValFldMsg'> Please enter Name.</span>
						</div>
						
						<label for="inputEmail3" class="col-sm-2 control-label">Email
							Address</label>
						<div class="col-sm-3">
							<form:input path="agentDetailsModel.firmEmail"  maxlength="49" rel="txtTooltip" title="Only valid emailId is allowed.e.g abc@gmail.com" data-toggle="tooltip" data-placement="bottom" readonly="true"  class="form-control input-sm emailValFld"
								id="agentEmailId" placeholder=""/>
						</div>
						</div>
						
						<div class="form-group">
						<label class="col-sm-3 control-label">PAN No.<sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="agentDetailsModel.agentPanNo" rel="txtTooltip" title="Only valid pan number is allowed.e.g: ABCDE1234F" data-toggle="tooltip" data-placement="bottom" class="form-control input-sm panNoValFld requiredValFld"
								id="agentpanno" placeholder=""/>
						<span class='requiredValFldMsg'> Please enter PAN No.</span>
						
						</div>
						
					 
						</div>
						
						<div class="form-group">
						<label for="inputEmail3" class="col-sm-3 control-label">Registration
							Type<sup>*</sup></label>
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
							<span class='requiredValFldMsg'> Please Select Registration Type.</span>
						</div>
						<label for="inputEmail3" class="col-sm-2 control-label">Major
							Activities <sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="agentDetailsModel.firmActivities" maxlength="99" class="form-control input-sm requiredValFld"
								 placeholder=""/>
						<span class='requiredValFldMsg'> Please enter Major Activities.</span>
						
						</div>

					</div>

					<div class="form-group">
						<label for="inputEmail3" class="col-sm-3 control-label"> Registration Number<sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="agentDetailsModel.firmRegistrationNo"  maxlength="50" class="form-control input-sm alphanumericValFld requiredValFld"/>
						
						<span class='requiredValFldMsg'> Please enter Registration Number.</span>
						</div>

						<label for="inputEmail3" class="col-sm-2 control-label">
							Fax Number </label>
						<div class="col-sm-3">
							<form:input path="agentDetailsModel.firmFaxNumber"  maxlength="12"  rel="txtTooltip"  title="In case of partnership firm 'NOT APPLICABLE' can be written. For Others it is mandatory" data-toggle="tooltip" data-placement="bottom"  
							
							class="form-control input-sm "
								id="inputEmail3" placeholder=""/>
						
						<!-- <span class='requiredValFldMsg'> Please enter Fax Number.</span> -->
						</div>

					</div>

					<div class="form-group">

						<label for="inputEmail3" class="col-sm-3 control-label">Mobile
							Number <sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="agentDetailsModel.firmMobileNo" rel="txtTooltip" title="Only 10 digits of mobile number is allowed " data-toggle="tooltip" data-placement="bottom" class="form-control input-sm mobileValFld requiredValFld " maxlength="10"/>
						
						<span class='requiredValFldMsg'> Please enter Mobile Number.</span>
						</div>
                         
                         <label for="inputEmail3" class="col-sm-2 control-label">Landline
							Number <sup>*</sup> </label>
						<div class="col-sm-3">
							<form:input path="agentDetailsModel.firmLandLineNo1" rel="txtTooltip" title="Only 6-10 digits of landline is allowed." data-toggle="tooltip" data-placement="bottom"  class="form-control input-sm landlineValFld requiredValFld " maxlength="10"/>
						
						<span class='requiredValFldMsg'> Please enter Landline Number.</span>
						</div>
                     			
					</div>
					
						<div class="form-group">
						<label for="inputEmail3" class="col-sm-3 control-label">Address Line 1<sup>*</sup>
						</label>
						<div class="col-sm-3">
							<form:input path="agentDetailsModel.firmAddressLine1"  maxlength="99" class="form-control input-sm requiredValFld" rows="3"/>
						
						<span class='requiredValFldMsg'> Please enter Address Line1.</span>
						</div>
						<label for="inputEmail3" class="col-sm-2 control-label">Address Line 2<sup>*</sup>
						</label>
						<div class="col-sm-3">
							<form:input path="agentDetailsModel.firmAddressLine2"  maxlength="99" class="form-control input-sm requiredValFld" rows="3"/>
						
						<span class='requiredValFldMsg'> Please enter Address Line2.</span>
						</div>

					</div>
					
					<div class="form-group">

						
						
						
						
					<label for="inputEmail3" class="col-sm-3 control-label">State<sup>*</sup></label>
						<div class="col-sm-3">
						
						<select name="stateUtId" id="firmSate"  onchange="reloadChildDropdown(this)" class="form-control requiredValFld">
						<option value='0'> --Select-- </option>
						<c:forEach  items="${stateUtList}" var="st">
						<option value='${st.stateUtId }'> ${st.stateUtName } </option>
						</c:forEach>
						</select>
						<span class='requiredValFldMsg'> Please select State.</span>
						</div>
						
						
						
						<label for="inputEmail3" class="col-sm-2 control-label">District<sup>*</sup></label>
						<div class="col-sm-3">
							<select name="agentDistrictId"  id='District-firmSate'class="form-control requiredValFld">
								<option value="0">Select</option>
								
														</select>
														<span class='requiredValFldMsg'> Please select District.</span>
						</div>
						
					</div>
					
					<div class="form-group">
						
						<label for="inputEmail3" class="col-sm-3 control-label">Pincode<sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="agentDetailsModel.firmPincode" rel="txtTooltip" title="Only 6 digits of pin number is allowed. " data-toggle="tooltip" data-placement="bottom"  maxlength="6" class="form-control input-sm pinCodeValFld requiredValFld "/>
						
						<span class='requiredValFldMsg'> Please enter Pincode.</span>
						</div>
						
						
						
						<label for="inputEmail3" class="col-sm-2 control-label 	 ">
							 Registration Certificate <sup>*</sup></label>
						<div class="col-sm-3">
							<input type="file" class="form-control input-sm requiredValFld"  rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom" name="firmRegCertificatePath" id="exampleInputFile">
						<span class='requiredValFldMsg'> Please select Company Registration Certificate.</span>
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
						<option value='${dst.districtId }'> ${dst.districtName } </option>
						</c:forEach>
						</select>
						<span class='requiredValFldMsg'> Please select District.</span>
						</div>
						<label for="inputEmail3" class="col-sm-2 control-label">Tehsil/Sub
							District<sup>*</sup></label>
						<div class="col-sm-3">
							<select name="oprSubDistrictId" class="form-control requiredValFld" id="SubDistrict-oprDistrictId">
							<option value='0'> --Select-- </option>
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
		
		
	
		
						<div class="drop_shadow">   </div>

						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">
								Partner / Director Name<sup>*</sup> </label>
							<div class="col-sm-3">
								<form:input path="agentDetailsModel.partnerOrDirectorName" class="form-control input-sm requiredValFld"
									 placeholder=""/>
							
							<span class='requiredValFldMsg'> Please enter Partner/Director Name.</span>
							</div>
							
								<label for="inputEmail3" class="col-sm-2 control-label">
								Email Address <sup>*</sup></label>
							<div class="col-sm-3">
								<form:input path="agentDetailsModel.partnerOrDirectorEmailAddress"  maxlength="49" rel="txtTooltip" title="Only valid emailId is allowed.e.g:abc@xyz.com" data-toggle="tooltip" data-placement="bottom"  class="form-control input-sm emailValFld requiredValFld" rows="3"/>
							
							<span class='requiredValFldMsg'> Please enter Email Address.</span>
							</div>
							</div>
								<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">
								Address Line 1 <sup>*</sup></label>
							<div class="col-sm-3">
								<form:input path="agentDetailsModel.partnerOrDirectorAddressLine1"  maxlength="99" class="form-control input-sm requiredValFld" rows="3"/>
							
							<span class='requiredValFldMsg'> Please enter Address Line1.</span>
							</div>
							<label for="inputEmail3" class="col-sm-2 control-label">
								Address Line 2 <sup>*</sup></label>
							<div class="col-sm-3">
								<form:input path="agentDetailsModel.partnerOrDirectorAddressLine2"  maxlength="99" class="form-control input-sm requiredValFld" rows="3"/>
							
							<span class='requiredValFldMsg'> Please enter Address Line2.</span>
							</div>
							</div>
							<div class="form-group">
						<label for="inputEmail3" class="col-sm-3 control-label">State<sup>*</sup></label>
						<div class="col-sm-3">
						<select name="stateUtId" id="partnerState"  onchange="reloadChildDropdown(this)" class="form-control requiredValFld">
						<option value='0'> --Select-- </option>
						<c:forEach  items="${stateUtList}" var="st">
						<option value='${st.stateUtId }'> ${st.stateUtName } </option>
						</c:forEach>
						</select>
						<span class='requiredValFldMsg'> Please select State.</span>
											</div>
						<label for="inputEmail3" class="col-sm-2 control-label">District<sup>*</sup></label>
						<div class="col-sm-3">
							<select name="directorDistrictId" class="form-control requiredValFld" id="District-partnerState">
								<option value="0"> --Select-- </option>
								
								

							</select>
							<span class='requiredValFldMsg'> Please select District.</span>
						</div>

					</div>
					
					
					<div class="form-group">
							
							<label for="inputEmail3" class="col-sm-3 control-label">Pincode<sup>*</sup></label>
							<div class="col-sm-3">
								<form:input path="agentDetailsModel.partnerOrDirectorPincode"  rel="txtTooltip" title="Only 6 digits of pin number is allowed " data-toggle="tooltip" data-placement="bottom" maxlength="6" class="form-control input-sm   pinCodeValFld requiredValFld"
									 placeholder=""/>
							
							<span class='requiredValFldMsg'> Please enter Pincode.</span>
							</div>
							<label for="inputEmail3" class="col-sm-2 control-label">Mobile
								Number <sup>*</sup></label>
							<div class="col-sm-3">
								<form:input path="agentDetailsModel.partnerOrDirectorPhoneNO"  rel="txtTooltip" title="Only 10 digits of mobile number is allowed" data-toggle="tooltip" data-placement="bottom" maxlength="10" class="form-control input-sm mobileValFld requiredValFld "
									 placeholder=""/>
							
							<span class='requiredValFldMsg'> Please enter Mobile Number.</span>
							</div>
				 
						
					</div>
					
					
					
							<div class="form-group">
							
							
							<label for="inputEmail3" class="col-sm-3 control-label">Photograph<sup>*</sup>
							</label>
							<div class="col-sm-3">
								<input type="file" class="form-control requiredValFld" name="agentPhotographPath" id="exampleInputFile"  rel="txtTooltip" title="Only image file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom">
							<span class='requiredValFldMsg'> Please select Photograph.</span>
							</div>
							
					

						
					</div>
					

					<div class="inner_wrapper">

						<h1>
							Other RERA <span>Registration Details</span>
						</h1>
						
						
							<div id="preRegSection-dv" class="addmoredv">
						
						
						
						<div class="drop_shadow">    <span onclick="deloptdv(this);" style='float: right;'>DELETE</span></div>
						<div class="form-group">
						<br> <label for="inputEmail3" class="col-sm-3 control-label">
								Registration Number</label>
							<div class="col-sm-3">
								<input type="text"  maxlength="49" name="preRegistrationNo" class="form-control input-sm alphanumericValFld requiredValFld">
							
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
							
							<span class='requiredValFldMsg'> Please Upload Certificate.</span>
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
</div>
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
				<!-- <input name="btn1" class="btn-style" value="Next" type="submit" onclick="nextForm()"/> -->
				<input name="btn1" class="btn-style" value="Next" type="button" onclick="nextDocumentForm()"/>
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