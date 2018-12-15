<%@page import="in.gov.rera.common.security.ReraSecurity"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html >
<html>
<head>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script
	src="<%=request.getContextPath()%>/resources/complaintjs/complaint.js"></script>
<script>
	function choosepaymentmethod(slct) {
		var val = $(slct).val();
		if (val == 'Payment Gateway') {
			$(".optionfld2").each(function() {
				$(this).hide();
			});
			document.paymenttrxForm1.action = 'redirectpaymentgateway';
		} else {
			$(".optionfld2").each(function() {
				$(this).show();
			});
			document.paymenttrxForm1.action = 'saveComplaint';
		}
	}

	function hideShow() {

		var interimOrderRequired1 = $(
				"input[name='interimOrderRequired']:checked").val()

		if (interimOrderRequired1 == "YES") {

			$('#interimOrderPrayed').show();
		}
		if (interimOrderRequired1 == "NO") {
			$('#interimOrderPrayed').hide();
		}
	}
</script>




<script>
	var applicationArray = new Array();
	var applicationNameList = new Array();
	<c:forEach items="${allApplicantsList}" var="application">

	var localObj = {
		projectName : '<c:out value="${application.projectDetailsModel.projectName}"/>',
		promoterName : '<c:out value="${application.promoterDetailsModel.promoterName}"/>',
		appNo : '<c:out value="${application.applicationNo}"/>'
	};
	var count = 0;
	count = count + 1;
	if (count < 10)
		applicationNameList
				.push('<c:out value="${application.projectDetailsModel.projectName}"/>');
	applicationArray.push(localObj);
	</c:forEach>

	$(function() {
		$("#applicationId").autocomplete(
				{
					source : function(request, response) {
						var results = $.ui.autocomplete.filter(
								applicationNameList, request.term);

						response(results.slice(0, 5));
					}
				});
	});

	function showInfo() {

		var selectedApp = document.getElementById('applicationId').value;
		console.log(selectedApp)

		for (var i = 0; i < applicationArray.length; i++) {
			if (selectedApp == applicationArray[i].projectName) {
				document.getElementById('promoterNameId').value = applicationArray[i].promoterName;
				document.getElementById('ackNumId').value = applicationArray[i].appNo;
			}
		}
	}

	function isReraProFun(val) {

		if (val == 'Yes') {

			document.getElementById('isReraId').style.display = 'block';
			document.getElementById('isNotReraId').style.display = 'none';
		} else if (val == 'No') {
			document.getElementById('isReraId').style.display = 'none';
			document.getElementById('isNotReraId').style.display = 'block';
		}

	}
</script>




</head>

<body>
	<form:form action="saveComplaint" method="post"
		cssClass="form-horizontal" id="complaint" autocomplete="off"
		commandName="complaintModel" name="paymenttrxForm11"
		enctype="multipart/form-data">
		<%=ReraSecurity.writeToken(request)%>

		<!--Banner-->


		<div class="breadcrumb">Home / Real Estate Complaint
			Registration</div>


		<!--News Ticker-->
		<div class="container">
		
		<div class="stepwizard col-md-offset-1">
    <div class="stepwizard-row setup-panel">
     
      <div class="stepwizard-step fill">
        <a href="#step-1" type="button" class="btn btn-success btn-circle">1</a>
        <p>Complaint Details</p>
      </div>
      
      <div class="stepwizard-step ">
        <a href="#step-2" type="button" class="btn btn-default btn-circle" disabled="disabled">2</a>
        <p>Payment</p>
      </div>
      
    </div>
</div>

			<!--main container start here-->
			<div class="Main_containner comp">

				<!--Inner wrapper stsrt here-->
				<div class="inner_wrapper">



					<h1>Complaint Registration Form</h1>
					<div class="border">
						<div class="orange"></div>
						<div class="black"></div>
					</div>






					<div class="inner_wrapper">
						<h1>
							Details of the <span>Complainant</span>
						</h1>
						<div class="drop_shadow"></div>
						<div class="clearfix"></div>

						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">
								Name of Complainant<sup>*</sup>
							</label>
							<div class="col-sm-3">

								<form:input path="applicateName"
									cssClass="form-control input-sm requiredValFld"
									rel="txtTooltip" title="Only Alphabets are allowed"
									data-toggle="tooltip" data-placement="bottom" />
								<span class='requiredValFldMsg'> Please select Application Name.</span>

							</div>





							<label for="inputEmail3" class="col-sm-2 control-label">Telephone
								Number <sup>*</sup>
							</label>
							<div class="col-sm-3">
								<form:input path="applicatePhoneNo"
									cssClass="form-control input-sm requiredValFld landlineValFld"
									maxlength="8" rel="txtTooltip" title="Only Digits are allowed."
									data-toggle="tooltip" data-placement="bottom" />
								<span class='requiredValFldMsg'> Please select phone no.</span>

							</div>
						</div>


						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">
								Mobile Number<sup>*</sup>
							</label>
							<div class="col-sm-3">

								<form:input path="applicateMobileNo"
									cssClass="form-control input-sm  requiredValFld mobileValFld"
									maxlength="10" rel="txtTooltip"
									title="Only 10 digits of mobile number is allowed."
									data-toggle="tooltip" data-placement="bottom" />
								<span class='requiredValFldMsg'> Please select MobileNo.</span>
							</div>

							<label for="inputEmail3" class="col-sm-2 control-label">EmailId
								<sup>*</sup>
							</label>
							<div class="col-sm-3">
								<form:input path="applicateEmailId"
									cssClass="form-control input-sm requiredValFld emailValFld"
									rel="txtTooltip"
									title="Only valid emailId is allowed.e.g:abc@xyz.com"
									data-toggle="tooltip" data-placement="bottom" />
								<span class='requiredValFldMsg'> Please select EmailId.</span>
							</div>
						</div>


							<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">
								Aadhaar / Passport Number <sup>*</sup>
							</label>
							<div class="col-sm-3">
								<form:input path="applicateAdharNo"
									cssClass="form-control input-sm  "
									maxlength="12" rel="txtTooltip"
									title="Only passport/Aadhar number is allowed."
									data-toggle="tooltip" data-placement="bottom" />
								      <span class='requiredValFldMsg'> Please select Aadhaar No.</span>
							</div>
							<label class="col-sm-2 control-label"> Upload Aadhaar Card / Passport : </label>
								<div class="col-sm-3">
									<input type="file" id="aadharDoc" name="aadharDoc"
										rel="txtTooltip" class="form-control requiredValFld fiveMBsizefile"
										title="Only image or pdf file is allowed. file size upto 5 MB"
										data-toggle="tooltip" data-placement="bottom" /> <span
										class='requiredValFldMsg'> Please select Aadhaar scan copy</span>
								 </div>
							</div>

						<div class="inner_wrapper">
							<h2>Official/Residential Address</h2>
							<br>




							<div class="form-group">



								<label for="inputEmail3" class="col-sm-3 control-label">Address
									line 1<sup>*</sup>
								</label>
								<div class="col-sm-3">

									<form:input path="applicateResAddressLine1"
										cssClass="form-control input-sm requiredValFld" maxlength="50" />
									<span class='requiredValFldMsg'> Please select Address line1.</span>


								</div>
								<label for="inputEmail3" class="col-sm-2 control-label">Address
									line 2<sup>*</sup>
								</label>
								<div class="col-sm-3">
									<form:input path="applicateResAddressLine2"
										cssClass="form-control input-sm requiredValFld" maxlength="50" />
									<span class='requiredValFldMsg'> Please select Address
									line 2.</span>

								</div>


							</div>


							<div class="form-group">



								<label for="inputEmail3" class="col-sm-3 control-label">State<sup>*</sup></label>
								<div class="col-sm-3">


									<select name="applicantSateId" id="applicantSate"
										onchange="reloadChildDropdown(this)"
										class="form-control dynaselectfld requiredValFld">
										<option value='0'>--Select--</option>
										<c:forEach items="${stateUtList}" var="st">
											<option value='${st.stateUtId }'>${st.stateUtName }</option>
										</c:forEach>
									</select> <span class='requiredValFldMsg'> Please select applicant state.</span>



								</div>


								<label for="inputEmail3" class="col-sm-2 control-label">District<sup>*</sup></label>
								<div class="col-sm-3">
									<select class="form-control dynaselectfld requiredValFld"
										name="applicantDistrictId" id="District-applicantSate">
										<option value="0">--Select--</option>

									</select> <span class='requiredValFldMsg'> Please select applicant District .</span>

								</div>




							</div>






							<div class="form-group">

								<label for="inputEmail3" class="col-sm-3 control-label">Pin
									Code<sup>*</sup>
								</label>
								<div class="col-sm-3">

									<form:input path="applicateResPinCode"
										cssClass="form-control input-sm requiredValFld pinCodeValFld pinCodeValFld pinCodeValFld"
										maxlength="6" rel="txtTooltip"
										title="Only 6 digits of pin number is allowed."
										data-toggle="tooltip" data-placement="bottom" />
									<span class='requiredValFldMsg'> Please select applicant PinCode </span>


								</div>


							</div>


						</div>




						<div class="inner_wrapper">

							<div class="form-group">
								<div class="col-md-12">
									<h2>
										Address for Service of All Notices <span>Same as above</span>
										<input id="applicantCapyAdd" onclick="copyAppResAdd()"
											class="test" type="checkbox" />
									</h2>
								</div>




							</div>


							<div class="form-group">



								<label for="inputEmail3" class="col-sm-3 control-label">Address
									line 1<sup>*</sup>
								</label>
								<div class="col-sm-3">

									<form:input path="applicateResSameAsAddressLine1"
										cssClass="form-control input-sm requiredValFld" />
									<span class='requiredValFldMsg'> Please enter Address1.</span>


								</div>
								<label for="inputEmail3" class="col-sm-2 control-label">Address
									line 2<sup>*</sup>
								</label>
								<div class="col-sm-3">
									<form:input path="applicateResSameAsAddressLine2"
										cssClass="form-control input-sm requiredValFld" />
									<span class='requiredValFldMsg'> Please enter Address
									line 2.</span>

								</div>


							</div>


							<div class="form-group">



								<label for="inputEmail3" class="col-sm-3 control-label">State<sup>*</sup></label>
								<div class="col-sm-3">


									<select name="applicantResSameAsSateId" id="resSameAsSate"
										onchange="reloadChildDropdown(this)"
										class="form-control dynaselectfld requiredValFld">
										<option value='0'>--Select--</option>
										<c:forEach items="${stateUtList}" var="st">
											<option value='${st.stateUtId }'>${st.stateUtName }</option>
										</c:forEach>
									</select> <span class='requiredValFldMsg'> Please select State.</span>


								</div>


								<label for="inputEmail3" class="col-sm-2 control-label">District<sup>*</sup></label>
								<div class="col-sm-3">
									<select class="form-control dynaselectfld requiredValFld"
										name="resSameAsDistrictId" id="District-resSameAsSate">
										<option value="0">--Select--</option>

									</select> <span class='requiredValFldMsg'> Please select District.</span>

								</div>




							</div>






							<div class="form-group">

								<label for="inputEmail3" class="col-sm-3 control-label">Pin
									code<sup>*</sup>
								</label>
								<div class="col-sm-3">

									<form:input path="applicateResSameAsPinCode"
										cssClass="form-control input-sm requiredValFld pinCodeValFld"
										maxlength="6" rel="txtTooltip"
										title="Only 6 digits of pin number is allowed."
										data-toggle="tooltip" data-placement="bottom" />

									<span class='requiredValFldMsg'> Please enter Pincode.</span>

								</div>


							</div>



						</div>



						<div class="inner_wrapper">

							<h1>
								Details of the <span>Respondent</span>
							</h1>
							<div class="drop_shadow"></div>
							<div class="clearfix"></div>


							<div class="form-group">
								<label for="inputEmail3" class="col-sm-3 control-label">
									Name of Respondent <sup>*</sup>
								</label>
								<div class="col-sm-3">

									<form:input path="respondentName"
										cssClass="form-control input-sm requiredValFld" />

								</div>

								<label for="inputEmail3" class="col-sm-2 control-label">Telephone
									Number <sup>*</sup>
								</label>
								<div class="col-sm-3">

									<form:input path="respondentPhoneNo"
										cssClass="form-control input-sm requiredValFld landlineValFld"
										maxlength="10" rel="txtTooltip"
										title="Only 6-10 digits of landline number is allowed."
										data-toggle="tooltip" data-placement="bottom" />
									<span class='requiredValFldMsg'> Please enter Telephone
									Number.</span>

								</div>



							</div>


							<div class="form-group">
								<label for="inputEmail3" class="col-sm-3 control-label">
									Mobile Number<sup>*</sup>
								</label>
								<div class="col-sm-3">

									<form:input path="respondentMobileNo"
										cssClass="form-control input-sm requiredValFld mobileValFld"
										maxlength="10" rel="txtTooltip"
										title="Only 10 digits of mobile number is allowed."
										data-toggle="tooltip" data-placement="bottom" />
									<span class='requiredValFldMsg'> Please select Mobile Number.</span>

								</div>


								<label for="inputEmail3" class="col-sm-2 control-label">
									Email Address<sup>*</sup>
								</label>
								<div class="col-sm-3">

									<form:input path="respondentEmailId"
										cssClass="form-control input-sm requiredValFld emailValFld"
										maxlength="50" rel="txtTooltip"
										title="Only valid emailId is allowed.e.g:abc@xyz.com"
										data-toggle="tooltip" data-placement="bottom" />
									<span class='requiredValFldMsg'> Please enter Email Address</span>
								</div>
							</div>













							<div class="form-group">
								<label for="inputEmail3" class="col-sm-3 control-label">
									IS RERA Register Project </label>
								<div class="col-sm-1">
									<input onclick="isReraProFun('Yes')" checked="checked"
										type="radio" name="yes"> Yes
								</div>
								<div class="col-sm-1">
									<input onclick="isReraProFun('No')" type="radio" name="yes">
									No
								</div>
							</div>

							<div id="isReraId">
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">
										Project Name<sup>*</sup>
									</label>
									<div class="col-sm-3">
										<form:input path="projectName" onchange="showInfo()"
											type="text" class="form-control requiredValFld"
											id="applicationId" />
										<span class='requiredValFldMsg'> Please select Project
											Name.</span>
									</div>

									<label for="inputEmail3" class="col-sm-2 control-label">
										Promoter Name<sup>*</sup>
									</label>
									<div class="col-sm-3">
										<form:input path="promoterName" readonly="true"
											id="promoterNameId" type="text" class="form-control" />
									</div>
								</div>

								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">
										Acknowledgement Number<sup>*</sup>
									</label>
									<div class="col-sm-3">
										<form:input path="applicationNo" readonly="true" id="ackNumId"
											type="text" class="form-control" />
									</div>
								</div>
							</div>


							<div id="isNotReraId" style="display: none">
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">
										Project Name<sup>*</sup>
									</label>
									<div class="col-sm-3">
										<form:input path="projectName" type="text"
											class="form-control requiredValFld" />
										<span class='requiredValFldMsg'> Please Enter Project
											Name.</span>
									</div>

									<label for="inputEmail3" class="col-sm-2 control-label">
										Promoter Name<sup>*</sup>
									</label>
									<div class="col-sm-3">
										<form:input path="promoterName" type="text"
											class="form-control requiredValFld" />
										<span class='requiredValFldMsg'> Please Enter Promoter
											Name.</span>
									</div>
								</div>
								
								
								<div class="form-group" hidden>
									<label for="inputEmail3" class="col-sm-3 control-label">
										Acknowledgement Number<sup>*</sup>
									</label>
									<div class="col-sm-3">
										<form:input path="applicationNo" readonly="true" 
											type="text" class="form-control" />
									</div>
								</div>
								
								
							</div>

							<div class="inner_wrapper">
								<h2>Official/Residential Address</h2>
								<br>




								<div class="form-group">



									<label for="inputEmail3" class="col-sm-3 control-label">Address
										line 1<sup>*</sup>
									</label>
									<div class="col-sm-3">

										<form:input path="respondentResAddressLine1"
											cssClass="form-control input-sm requiredValFld" />
										<span class='requiredValFldMsg'> Please select Project
											Status.</span>

									</div>
									<label for="inputEmail3" class="col-sm-2 control-label">Address
										line 2<sup>*</sup>
									</label>
									<div class="col-sm-3">
										<form:input path="respondentResAddressLine2"
											cssClass="form-control input-sm requiredValFld" />
										<span class='requiredValFldMsg'> Please select Project
											Status.</span>

									</div>


								</div>


								<div class="form-group">



									<label for="inputEmail3" class="col-sm-3 control-label">State<sup>*</sup></label>
									<div class="col-sm-3">


										<select name="respondentSateId" id="respondentSate"
											onchange="reloadChildDropdown(this)"
											class="form-control dynaselectfld requiredValFld">
											<option value='0'>--Select--</option>
											<c:forEach items="${stateUtList}" var="st">
												<option value='${st.stateUtId }'>${st.stateUtName }
												</option>
											</c:forEach>
										</select> <span class='requiredValFldMsg'> Please select State.</span>



									</div>


									<label for="inputEmail3" class="col-sm-2 control-label">District<sup>*</sup></label>
									<div class="col-sm-3">
										<select class="form-control dynaselectfld requiredValFld"
											name="respondentDistrictId" id="District-respondentSate">
											<option value="0">--Select--</option>

										</select> <span class='requiredValFldMsg'> Please select respondent District.</span>

									</div>




								</div>






								<div class="form-group">

									<label for="inputEmail3" class="col-sm-3 control-label">Pin
										Code<sup>*</sup>
									</label>
									<div class="col-sm-3">

										<form:input path="respondentResPinCode"
											cssClass="form-control input-sm requiredValFld pinCodeValFld"
											maxlength="6" rel="txtTooltip"
											title="Only 6 digits of pin number is allowed."
											data-toggle="tooltip" data-placement="bottom" />
										<span class='requiredValFldMsg'> Please select Respondent PinCode.</span>

									</div>


								</div>

							</div>




							<div class="inner_wrapper">

								<div class="form-group">
									<div class="col-md-12">
										<h2>
											Address for Service of All Notices <span>Same as above
											</span> <input type="checkbox" id="respondentCheckAddr"
												onclick="copyResponResAdd()" />
										</h2>
									</div>




								</div>





								<div class="form-group">



									<label for="inputEmail3" class="col-sm-3 control-label">Address
										line 1<sup>*</sup>
									</label>
									<div class="col-sm-3">

										<form:input path="respondentResSameAsAddressLine1"
											cssClass="form-control input-sm requiredValFld" />
										<span class='requiredValFldMsg'> Please enter Address
										line 1</span>

									</div>
									<label for="inputEmail3" class="col-sm-2 control-label">Address
										line 2<sup>*</sup>
									</label>
									<div class="col-sm-3">
										<form:input path="respondentResSameAsAddressLine2"
											cssClass="form-control input-sm requiredValFld" />
										<span class='requiredValFldMsg'> Please enter Address
										line 2.</span>

									</div>


								</div>


								<div class="form-group">



									<label for="inputEmail3" class="col-sm-3 control-label">State<sup>*</sup></label>
									<div class="col-sm-3">


										<select name="respondentSameAsSateId"
											id="respondentSameAsSate"
											onchange="reloadChildDropdown(this)"
											class="form-control dynaselectfld requiredValFld">
											<option value='0'>--Select--</option>
											<c:forEach items="${stateUtList}" var="st">
												<option value='${st.stateUtId }'>${st.stateUtName }
												</option>
											</c:forEach>
										</select> <span class='requiredValFldMsg'> Please select Respondent State.</span>



									</div>


									<label for="inputEmail3" class="col-sm-2 control-label">District<sup>*</sup></label>
									<div class="col-sm-3">
										<select class="form-control dynaselectfld requiredValFld"
											name="respondentSameAsdistrict"
											id="District-respondentSameAsSate">
											<option value="0">--Select--</option>

										</select> <span class='requiredValFldMsg'> Please select Respondent District.</span>

									</div>




								</div>






								<div class="form-group">

									<label for="inputEmail3" class="col-sm-3 control-label">Pin
										Code<sup>*</sup>
									</label>
									<div class="col-sm-3">

										<form:input path="respondentResSameAsPinCode"
											cssClass="form-control input-sm requiredValFld pinCodeValFld"
											maxlength="6" rel="txtTooltip"
											title="Only 6 digits of pin number is allowed."
											data-toggle="tooltip" data-placement="bottom" />
										<span class='requiredValFldMsg'> Please enter pincode.</span>

									</div>


								</div>





							</div>

							<!-- com -->

							<div class="inner_wrapper">

								<h1>
									Details of the <span>Complaint</span>
								</h1>
								<div class="drop_shadow"></div>
								<div class="clearfix"></div>


								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">
										Subject of Complaint<sup>*</sup>
									</label>
									<div class="col-sm-6">

										<form:input path="complaintSubject"
											cssClass="form-control input-sm requiredValFld"
											maxlength="200" />
										<span class='requiredValFldMsg'> Please select Project
											Status.</span>

									</div>




								</div>


								<div class="form-group">

									<label for="inputEmail3" class="col-sm-3 control-label">Facts
										of Complaint<sup>*</sup>
									</label>
									<div class="col-sm-6">
										<form:textarea path="complaintSummary" rows="3"
											cssClass="form-control input-sm requiredValFld"></form:textarea>
										<span class='requiredValFldMsg'> Please enter Facts
										of Complaint</span>

									</div>

								</div>

								<div class="form-group">


									<label for="inputEmail3" class="col-sm-3 control-label">Relief
										Sought from RERA<sup>*</sup>
									</label>
									<div class="col-sm-6">
										<form:input path="reliefSoughtfromRera"
											cssClass="form-control input-sm requiredValFld"
											maxlength="50" />
										<span class='requiredValFldMsg'> Please enter Relief
										Sought from RERA.</span>

									</div>





								</div>


								<div class="form-group">


									<label for="inputEmail3" class="col-sm-3 control-label">Interim
										Order Required<sup>*</sup>
									</label>
									<div class="col-sm-2">
										<div class="radio ">
											<label> <input type="radio"
												name="interimOrderRequired" id="optionsRadios1" value="YES"
												id="INTRIM_ORDER_YES" onclick="hideShow()"> Yes
											</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label> <input
												type="radio" name="interimOrderRequired"
												id="INTRIM_ORDER_NO" value="NO" onclick="hideShow()">
												No
											</label>

										</div>
									</div>



									<div class="col-sm-4 hideshow" id="itr">

										<form:input path="interimOrderPrayed"
											cssClass="form-control input-sm requiredValFld" />
										<span class='requiredValFldMsg'> Please select interim Order Prayed.</span>

									</div>


								</div>




							</div>


							<!--  -->

							<div class="inner_wrapper">

								<h1>
									Supporting<span>Documents</span>
								</h1>
								<div class="drop_shadow"></div>


								<div id='pre_project-dv' class='addmoredv'>
									<div class="drop_shadow">
										<span onclick="deloptdv(this);" style='float: right;'>DELETE</span>
									</div>

									<div class="form-group">
										<label class="col-sm-3 control-label">Caption: </label>
										<div class="col-sm-3">
											<input type="text" id="captions" name="captions"
												class="form-control requiredValFld" /> <span
												class='requiredValFldMsg'> Please enter Caption.</span>

										</div>
										<label class="col-sm-2 control-label">Attachment: </label>
										<div class="col-sm-3">
											<input type="file" id="supportDoc" name="supportDoc"
												rel="txtTooltip" class="form-control requiredValFld fiftyMBsizefile"
												title="Only image or pdf file is allowed. file size upto 50 MB"
												data-toggle="tooltip" data-placement="bottom" /> <span
												class='requiredValFldMsg'> Please select Project
												Attachment.</span>

										</div>



									</div>
								</div>
							</div>




							<div class="form-group">
								<div class="col-sm-2 pull-right" style="text-align: right;">
									<span class="glyphicon glyphicon-plus-sign theme-clr "
										aria-hidden="true"></span><span class="theme-clr addmore"
										id="pre_project"> Add
										more&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>

								</div>



							</div>

















							<!-- <div class="inner_wrapper">



								<h1>
									Payment<span></span>
								</h1>
								<div class="drop_shadow"></div>





								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">
										
									</label>
									<div class="col-sm-3">



										<select name="paymentmode" id='paymentmode'
											onchange="choosepaymentmethod(this)"
											class="form-control requiredValFld">
											<option value="0">--Select--</option>
											<option value="Khajane2 Challan">Khajane2 Challan</option>
											<option value="NEFT">NEFT</option>
											<option value="RTGS">RTGS</option>

										</select> <span class='requiredValFldMsg'> Please select payment
											mode.</span>


									</div>

									<label for="inputEmail3"
										class="col-sm-2 control-label optionfld2"> </label>
									<div class="col-sm-3">
										1. For making online payment through Khajane II please <a
											href="https://k2.karnataka.gov.in/wps/portal/Khajane-II/Scope/Remittance/"
											target="_blank"> click here</a><br />
										<br /> 2. For NEFT/RTGS below is the details:-<br /> Account
										Name: Chairman, Real Estate Ragulatory Authority Karnataka <br />
										Account Number: 520101080940037 <br /> IFSC Code: CORP0000144
										<br /> Bank Name: Corporation Bank <br /> Branch: S.C. Road,
										Bangalore <br />

									</div>

								</div>
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">
										Amount (INR)<sup>*</sup>
									</label>
									<div class="col-sm-3">

										<input class="form-control input-sm" type="text" name="amount"
											readonly="readonly" value="1000" />

									</div>

									<label for="inputEmail3"
										class="col-sm-2 control-label optionfld2"> 
									</label>
									<div class="col-sm-3 optionfld2">
										<a href="K2paymentPage?promoterName=rera&amount=1" >
<input name="online PAyment" class="btn-style" value="Click Here For Online Payment" type="button"/></a>
									</div>

								</div>

								<div class="form-group optionfld2">
									<label for="inputEmail3" class="col-sm-3 control-label">
										Khajane2 Challan OR NEFT/RTGS Transaction Ref. Number<sup>*</sup>
									</label>
									<div class="col-sm-3">
										<span class='requiredValFldMsg'> Please enter Khajane2
											Challan OR NEFT/RTGS Transaction Ref. Number .</span> <input
											type="text" name="sbiTransactionRefNo"
											class="form-control requiredValFld input-sm" maxlength="50" />
									</div>


									<label class="col-sm-2 control-label"> Attach Online
										Payment Receipt<sup>*</sup>
									</label>
									<div class="col-sm-3">
										<input type="file" class="requiredValFld"
											name="attachScanCopy" id="exampleInputFile" rel="txtTooltip"
											title="Only image or pdf file is allowed. file size upto 1 MB"
											data-toggle="tooltip" data-placement="bottom"> <span
											class='requiredValFldMsg'> Please select Attach Online
											Payment Receipt.</span>

									</div>
								</div>


								<br>




							</div>
 -->





						</div>
						<!--inner container end here-->

						<div class="inner_wrapper">

							<h1>
								<span>Declarations</span>
							</h1>
							<div class="drop_shadow"></div>

							<ul>

								<li><input type="checkbox" name="declaration1"
									id='declaration1' value="Y">&nbsp;&nbsp; I,
									complainant, here by declare that the subject matter of the
									above claim falls within the Jurisdiction of the Authority</li>
								<li><input type="checkbox" name="declaration2"
									id='declaration2' value="Y">&nbsp;&nbsp;I, complainant,
									here by declare that the matter regarding which the complaint
									has been made is not pending before any Court of Law or any
									other Authority or any other Tribunal(s)</li>
								<li><input type="checkbox" name="declaration3"
									id='declaration3' value="Y">&nbsp;&nbsp;I verify that
									the contents of the above sections are true to my personal
									knowledge and belief and I have not suppressed any material
									fact(s)</li>


							</ul>
						</div>



						<div class="button-wrapper">
							<input name="btn1" class="btn-style" value="Next"
								onclick="submitCompalint()" type="button">
						</div>



					</div>
					<!-- container end here-->

				</div>
			</div>
		</div>
	</form:form>
</body>
</html>