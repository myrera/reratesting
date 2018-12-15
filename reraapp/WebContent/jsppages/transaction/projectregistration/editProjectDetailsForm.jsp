<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
	<%@page import="in.gov.rera.common.security.ReraSecurity"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script
	src="<%=request.getContextPath()%>/resources/projectjs/projectJs.js?yyw=000220"></script>


<script>
<c:forEach items="${allApplicantsList}" var="application">

var localObj = {
	appNo : '<c:out value="${application.applicationNo}"/>'
};
var count = 0;
count = count + 1;
if (count < 10)
	applicationNameList
			.push('<c:out value="${application.applicationNo}"/>');
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
		if (selectedApp == applicationArray[i].applicationNo) {
			document.getElementById('applicationId').value = applicationArray[i].appNo;
		}
	}
}

</script>

<script>

function noOfMonthDelayed(sel){
	var val=$(sel).val();
	if(val=='Delayed'){
		$('#delayedfldId').show();
	}else{
		$('#delayedfldId').hide();
	}
}




function getAgentDetails(span) {
	
	var sid=$(span).attr('id');
	var agentRegNo=$('#fldno'+sid).val();
	$.ajax({
		type : "GET",
		url : "getAgentDetailforProjectReg",
		data : "agentRegNo=" + agentRegNo+"&SID="+sid,
		success : function(response){
			alert(response);
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

		error : function(e) {alert('Error: ' +"Invalid agent no");}

	});

}

</script>
	<div class="breadcrumb">Home / Real Estate Project Registration</div>

	<div class="container">

		<div class="stepwizard col-md-offset-1">
			<div class="stepwizard-row setup-panel ">


				<div class="stepwizard-step fill">
					<a href="#step-1" type="button" class="btn btn-success btn-circle">1</a>
					<p>Promoter Detail</p>
				</div>




				<div class="stepwizard-step blank">
					<a href="#step-2" type="button" class="btn btn-success btn-circle">2</a>
					<p>Project Detail</p>
				</div>




				<div class="stepwizard-step blank">
					<a href="#step-3" type="button" class="btn btn-default btn-circle"
						disabled="disabled">3</a>
					<p>Upload Documents</p>
				</div>



				<div class="stepwizard-step blank">
					<a href="#step-3" type="button" class="btn btn-default btn-circle"
						disabled="disabled">4</a>
					<p>Payment</p>
				</div>




			</div>
		</div>


	</div>
	<!--News Ticker-->
	<div class="container">

		<!--main container start here-->
		<div class="Main_containner">

			<!--Inner wrapper start here-->
			<div class="inner_wrapper">



				<h1>
					Project <span> Detail</span>
				</h1>
				<div class="border">
					<div class="orange"></div>
					<div class="black"></div>
				</div>


				<form:form class="form-horizontal" autocomplete="off" action="updateProjectDetails" modelAttribute="projectRegistrationModel" enctype="multipart/form-data" id="trxForm" method="post">
					<%=ReraSecurity.writeToken(request) %>
						<form:hidden path="projectDetailsModel.projectDetailsId" />
						<form:hidden path="projectBankDetailsModel.projectBankDelsId" />
						<form:hidden path="externalDevelopmentWorkModel.extDevId" />
						<form:hidden path="projectRegId" />
						<form:hidden path="projectDocModel.docId" />


                    <!-- PROJECT DETAILS START -->


					<div class="form-group">
						<form:hidden path="projectRegId" />
						<label class="col-sm-3 control-label">Project Name<sup>*</sup></label> <input
							type="hidden" id="nextForm" name="nextForm" value="docUploadFrom" />

						<div class="col-sm-3">
							<form:input path="projectDetailsModel.projectName"
								id="currentProjectName" cssClass="form-control input-sm requiredValFld" />
								<span class='requiredValFldMsg'> Please enter Project Name.</span>
						</div>
						<label for="inputEmail3" class="col-sm-2 control-label">Project
							Description<sup>*</sup></label>
						<div class="col-sm-3">
<textarea name="projectDetailsModel.workDetails" rows="3" id="currentProjectDesc" class="form-control input-sm requiredValFld">${projectRegistrationModel.projectDetailsModel.projectDescription }</textarea>
							
								<span class='requiredValFldMsg'> Please enter Project Description.</span>
						</div>


					</div>





					<div class="form-group">
						<label for="inputEmail3" class="col-sm-3 control-label">Project	Type <sup>*</sup></label>
						<div class="col-sm-3">

							<form:select path="projectDetailsModel.projectType"
								class="form-control requiredValFld">
								<form:option value="0" label="Select" />
								<form:option value="Residential/Group Housing" label="Residential/Group Housing" />
								<form:option value="Commercial" label="Commercial" />
								<form:option value="Mixed Development" label="Mixed Development" />
								<form:option value="Plotted Development" label="Plotted Development" />
								

							</form:select>
								<span class='requiredValFldMsg'> Please select Project Type.</span>

						</div>
						<label for="inputEmail3" class="col-sm-2 control-label">Project
							Status<sup>*</sup></label>
						<div class="col-sm-3">
                                <form:select path="projectDetailsModel.projectStatus" id="pstatusId" onchange="showhideflds(this)"
								cssClass="form-control requiredValFld">
								<form:option value="0" label=" --Select-- " />
								<form:option value="New Project Launch" label="New Project Launch" />
								<form:option value="Ongoing" label="Ongoing" />
								<form:option value="Completed" label="Completed" />

							</form:select>
								<span class='requiredValFldMsg'> Please select Project Status.</span>
								
						</div>

					</div>
					



					<div class="form-group">
						<label for="inputEmail3" class="col-sm-3 control-label">Project
							Start Date<sup>*</sup></label>
						<div class="col-sm-3">
							<div class="col-md-12 input-group">

								<form:input path="projectDetailsModel.startDate" readonly="true"
									cssClass="form-control input-sm augCalCssClass requiredValFld" id="startdatefld" />
									<span class='requiredValFldMsg'> Please enter Project Start Date.</span>
								<span class="glyphicon glyphicon-calendar augCalImgCssClass"></span>

							</div>


						</div>
						<label for="inputEmail3" class="col-sm-2 control-label">Project
							End Date<sup>*</sup></label>
						<div class="col-sm-3">
							<div class="col-md-12 input-group">
								<form:input path="projectDetailsModel.completionDate"
									readonly="true" cssClass="form-control input-sm augCalCssClass requiredValFld" id="enddatefld"/>
									<span class='requiredValFldMsg'> Please enter Project End Date.</span>
								<span class="glyphicon glyphicon-calendar augCalImgCssClass"></span>

							</div>

						</div>

					</div>




						<div class="form-group">

						<label for="inputEmail3" class="col-sm-3 control-label">Total
							Area Of Land (Sq Mtr)<sup>*</sup></label>
						<div class="col-sm-3">

							<form:input path="projectDetailsModel.totalAreaOfLand" rel="txtTooltip" title="Only digits are allowed." data-toggle="tooltip" data-placement="bottom" 
								cssClass="form-control input-sm numericValFld  requiredValFld" />
								<span class='requiredValFldMsg'> Please enter Total	Area Of Land.</span>
						</div>
						
						
						<label for="inputEmail3" class="col-sm-2 control-label">Total
							Covered Area (Sq Mtr)<sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="projectDetailsModel.totalCoverdArea" rel="txtTooltip" title="Only digits are allowed." data-toggle="tooltip" data-placement="bottom" 
								cssClass="form-control input-sm  numericValFld requiredValFld" />
								<span class='requiredValFldMsg'> Please enter Total	Covered Area.</span>
						</div>
						
					</div>



					<div class="form-group">


						<label for="inputEmail3" class="col-sm-3 control-label">Total
							Open Area (Sq Mtr)<sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="projectDetailsModel.totalOpenArea" rel="txtTooltip" title="Only digits are allowed." data-toggle="tooltip" data-placement="bottom" 
								cssClass="form-control input-sm numericValFld  requiredValFld" />
								<span class='requiredValFldMsg'> Please enter Total Open Area.</span>
						</div>


						<label for="inputEmail3" class="col-sm-2 control-label">Estimated Cost of Construction (INR)<sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="projectDetailsModel.estimatedCost" rel="txtTooltip" title="Only digits are allowed." data-toggle="tooltip" data-placement="bottom" 
								cssClass="form-control input-sm numericValFld  requiredValFld" />
								<span class='requiredValFldMsg'> Please enter Estimated Cost of Construction.</span>
						</div>




					</div>
					
					
						<div class="form-group">


						<label for="inputEmail3" class="col-sm-3 control-label">Cost of Land (INR)<sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="projectDetailsModel.costOfLand" rel="txtTooltip" title="Only digits are allowed." data-toggle="tooltip" data-placement="bottom" 
								cssClass="form-control input-sm numericValFld  requiredValFld" />
								<span class='requiredValFldMsg'> Please enter Cost of Land.</span>
						</div>


						<label for="inputEmail3" class="col-sm-2 control-label">Total Project Cost (INR)<sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="projectDetailsModel.totalProjectCost" rel="txtTooltip" title="Only digits are allowed." data-toggle="tooltip" data-placement="bottom" 
								cssClass="form-control input-sm numericValFld  requiredValFld" />
								<span class='requiredValFldMsg'> Please enter Total Project Cost.</span>
						</div>




					</div>
					

					<div class="form-group">
						<label for="inputEmail3" class="col-sm-3 control-label">Project
							Address Line 1<sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="projectDetailsModel.addressLine1"
								cssClass="form-control input-sm requiredValFld" />
								<span class='requiredValFldMsg'> Please enter Project Address Line 1.</span>
						</div>
						<label for="inputEmail3" class="col-sm-2 control-label">Project
							Address Line 2<sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="projectDetailsModel.addressLine2"
								cssClass="form-control input-sm requiredValFld" />
								<span class='requiredValFldMsg'> Please Project Address Line 2.</span>
						</div>
					</div>

                          <div class="form-group">
						<label for="inputEmail3" class="col-sm-3 control-label">District<sup>*</sup></label>
						<div class="col-sm-3">
							<select class="form-control requiredValFld" name='projectDistrictId' id="projectDist" onchange="reloadSubDistrict(this)">
							<option value='0'> --Select-- </option>
						<c:forEach items="${RERA_STATEUT.distList}" var="dst">
						<c:choose>
						<c:when test="${dst.districtId==projectRegistrationModel.projectDetailsModel.districtModel.districtId}">
						<option value='${dst.districtId }' selected="selected" > ${dst.districtName } </option>
						</c:when>
						<c:otherwise>
						<option value='${dst.districtId }'> ${dst.districtName } </option>
						</c:otherwise>
						</c:choose>
						</c:forEach>
						
						</select>
						<span class='requiredValFldMsg'> Please select District.</span>
						
						</div>
						<label for="inputEmail3" class="col-sm-2 control-label">Tehsil/Sub District<sup>*</sup></label>
						<div class="col-sm-3">
							<select  name="subDistrictId" id="SubDistrict-projectDist"	class="form-control requiredValFld">
						
						<option value='0'> --Select-- </option>
					                                                                     
						<c:forEach items="${projectRegistrationModel.projectDetailsModel.districtModel.subDistrictModelSet}" var="sub">
						<c:choose>
						<c:when test="${sub.subDistrictId==projectRegistrationModel.projectDetailsModel.subDistrictModel.subDistrictId}">
						<option value='${sub.subDistrictId }' selected="selected" > ${sub.subDistrictName } </option>
						</c:when>
						<c:otherwise>
						<option value='${sub.subDistrictId }'> ${sub.subDistrictName } </option>
						</c:otherwise>
						</c:choose>
						</c:forEach>

							</select>
							<span class='requiredValFldMsg'> Please select Tehsil/Sub District.</span>
						</div>

					</div>


	<div class="form-group">
						<label for="inputEmail3" class="col-sm-3 control-label">
							Plan Approving Authority<sup>*</sup></label>
						<div class="col-sm-3">
													
                        		<select name="profficeid" class="form-control">
                        		<option value="0"> --Select-- </option>
                        		<c:forEach items="${authList}" var="of">
                        		<c:choose>
                        		<c:when test="${of.officeId == projectRegistrationModel.projectDetailsModel.office.officeId}">
                        		<option value="${of.officeId }" selected="selected"> ${of.officeName } </option>
                        		</c:when>
                        		<c:otherwise>
                        		<option value="${of.officeId }"> ${of.officeName } </option>
                        		</c:otherwise>
                        		</c:choose>
                        		</c:forEach>
                        		</select>					

								<span class='requiredValFldMsg'> Please enter Plan  Approving Authority.</span>
						</div>

							



					</div>




					<div class="form-group">
						<label for="inputEmail3" class="col-sm-3 control-label">No of Garage<sup>*</sup></label>
						<div class="col-sm-3">
												
					  <fmt:parseNumber var = "y" integerOnly = "true"   type = "number" value = "${projectRegistrationModel.projectDetailsModel.noOfGarageForSale}" />
						<%-- <input type="hidden" name="projectDetailsModel.noOfGarageForSale" value="${y}" /> --%>  
						
				<form:input path="projectDetailsModel.noOfGarageForSale" value="${y}" 	maxlength="6"  rel="txtTooltip" title="Only digits are allowed." data-toggle="tooltip" data-placement="bottom"

								cssClass="form-control input-sm numericValFld requiredValFld" />
								<span class='requiredValFldMsg'> Please enter No Of Garage.</span>
						</div>

						<label for="inputEmail3" class="col-sm-2 control-label">
							Area of Garage (Sq Mtr)<sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="projectDetailsModel.areaOfGarageForSale" rel="txtTooltip" title="Only digits are allowed." data-toggle="tooltip" data-placement="bottom"
								maxlength="6"	cssClass="form-control input-sm numericValFld  requiredValFld" />
								<span class='requiredValFldMsg'> Please enter Area Of Garage.</span>
						</div>


					</div>


					<div class="form-group">
						<label for="inputEmail3" class="col-sm-3 control-label">No
							of Open Parking <sup>*</sup></label>
						
						<div class="col-sm-3">
							<form:input path="projectDetailsModel.noOfParkinfForSale"  rel="txtTooltip" title="Only digits are allowed." data-toggle="tooltip" data-placement="bottom"
							maxlength="6"		cssClass="form-control input-sm numericValFld requiredValFld" />
								<span class='requiredValFldMsg'> Please enter No Of Open Parking.</span>
						</div>

						<label for="inputEmail3" class="col-sm-2 control-label">
							Area Of Open Parking (Sq Mtr)<sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="projectDetailsModel.areaOfParkinfForSale" rel="txtTooltip" title="Only digits are allowed." data-toggle="tooltip" data-placement="bottom"
								maxlength="6"	cssClass="form-control input-sm  numericValFld requiredValFld" />
								<span class='requiredValFldMsg'> Please enter Area Of Open Parking.</span>
						</div>


					</div>



					<div class="form-group">
						<label for="inputEmail3" class="col-sm-3 control-label">No
							of Covered Parking<sup>*</sup></label>
						
						
						<div class="col-sm-3">
							<form:input path="projectDetailsModel.noOfCoveredParkingForSale"  rel="txtTooltip" title="Only digits are allowed." data-toggle="tooltip" data-placement="bottom"
								maxlength="6"	cssClass="form-control input-sm numericValFld requiredValFld" />
								<span class='requiredValFldMsg'> Please enter No Of Covered Parking.</span>
						</div>

						<label for="inputEmail3" class="col-sm-2 control-label">
							Area Of Covered Parking (Sq Mtr)<sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="projectDetailsModel.areaOfCoveredParkingForSale" rel="txtTooltip" title="Only digits are allowed." data-toggle="tooltip" data-placement="bottom"
							maxlength="6"	cssClass="form-control input-sm  numericValFld  requiredValFld" />
								<span class='requiredValFldMsg'> Please enter Area Of Covered Parking.</span>
						</div>


					</div>
					
					
					<div style="float: left;padding-right: 10px;"><h1>Boundary endpoints of the project</h1></div>
<div class="drop_shadow">
						
						</div>
						
						<div class="form-group">

						<label for="inputEmail3" class="col-sm-3 control-label">North Latitude<sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="projectDetailsModel.northlatitude"
								id="currentProjectName" cssClass="form-control input-sm requiredValFld" />
								<span class='requiredValFldMsg'>  Please enter North Latitude.</span>
						</div>
						
						
						<label for="inputEmail3" class="col-sm-2 control-label">North Longitude
							<sup>*</sup></label>
						
						<div class="col-sm-3">
							<form:input path="projectDetailsModel.northlongitude"
								id="currentProjectName" cssClass="form-control input-sm requiredValFld" />
								<span class='requiredValFldMsg'>  Please enter North Longitude.</span>
						</div>
						
					</div>
						
						<div class="form-group">

						<label for="inputEmail3" class="col-sm-3 control-label">East Latitude<sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="projectDetailsModel.eastlatitude"
								id="currentProjectName" cssClass="form-control input-sm requiredValFld" />
								<span class='requiredValFldMsg'>  Please enter East Latitude.</span>
						</div>
						
						
						<label for="inputEmail3" class="col-sm-2 control-label">East Longitude
							<sup>*</sup></label>
						
						<div class="col-sm-3">
							<form:input path="projectDetailsModel.eastlongitude"
								id="currentProjectName" cssClass="form-control input-sm requiredValFld" />
								<span class='requiredValFldMsg'>  Please enter East Longitude.</span>
						</div>
						
					</div>
					
					<div class="form-group">

						<label for="inputEmail3" class="col-sm-3 control-label">West Latitude<sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="projectDetailsModel.westlatitude"
								id="currentProjectName" cssClass="form-control input-sm requiredValFld" />
								<span class='requiredValFldMsg'>  Please enter West Latitude.</span>
						</div>
						
						
						<label for="inputEmail3" class="col-sm-2 control-label">West Longitude
							<sup>*</sup></label>
						
						<div class="col-sm-3">
							<form:input path="projectDetailsModel.westlongitude"
								id="currentProjectName" cssClass="form-control input-sm requiredValFld" />
								<span class='requiredValFldMsg'>  Please enter West Longitude.</span>
						</div>
						
					</div>
						
		<div class="form-group">

						<label for="inputEmail3" class="col-sm-3 control-label">South Latitude<sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="projectDetailsModel.southlatitude"
								id="currentProjectName" cssClass="form-control input-sm requiredValFld" />
								<span class='requiredValFldMsg'>  Please enter South Latitude.</span>
						</div>
						
						
						<label for="inputEmail3" class="col-sm-2 control-label">South Longitude
							<sup>*</sup></label>
						
						<div class="col-sm-3">
							<form:input path="projectDetailsModel.southlongitude"
								id="currentProjectName" cssClass="form-control input-sm requiredValFld" />
								<span class='requiredValFldMsg'>  Please enter South Longitude.</span>
						</div>
						
					</div>
					
					<div class="drop_shadow">
						
						</div>


			<br>



<script>

function showhideflds(sel){
	var val=$(sel).val();
	if(val=='Ongoing'){
		$('#prongonigsts').show();
	}else{
		$('#prongonigsts').hide();
		$('#delaysection').hide();
	}
}


function delayedYesFldChk(rd){
	
	
		$('#delaysection').show();
	
}

function delayedNoFldChk(rd){
		$('#delaysection').hide();
}
</script>
<c:if test="${projectRegistrationModel.projectDetailsModel.projectStatus=='Ongoing' }">
<div class="inner_wrapper" id="prongonigsts" >
</c:if>	
<c:if test="${projectRegistrationModel.projectDetailsModel.projectStatus!='Ongoing' }">
<div class="inner_wrapper" id="prongonigsts" style="display: none;">
</c:if>	

					<h1>
							Project Ongoing Status <span>Details</span>
						</h1>
                                                                  
						<div class="drop_shadow">  </div>
						
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">Extent of development carried out till date (0% to 99%)<sup>*</sup></label>
							<div class="col-sm-3">

								<form:input type="text" path="projectDetailsModel.devCompletion"
									cssClass="form-control input-sm requiredValFld numericValFld" id="devCompletion" maxlength="2" title="e.g. Type of Flats/Plots/Villa etc." data-toggle="tooltip" data-placement="bottom"  />
									<span class='requiredValFldMsg'> Please enter Extent of development carried till date.</span>
							</div>

							<label for="inputEmail3" class="col-sm-2 control-label">Extent of development pending (0% to 99%)<sup>*</sup></label>
							<div class="col-sm-3">
								<form:input type="text" path="projectDetailsModel.devPending" rel="txtTooltip" maxlength="2" title="Only digits are allowed." data-toggle="tooltip" data-placement="bottom" 
									cssClass="form-control input-sm numericValFld numericValFld requiredValFld" id="devPending" />
									<span class='requiredValFldMsg'> Please enter Extent of development pending.</span>
							</div>

						</div>
						
						

						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">Total amount of money collected form allottee<sup>*</sup></label>
							<div class="col-sm-3">

								<form:input type="text" path="projectDetailsModel.totalAmtClctedFrmAllotee"
									cssClass="form-control input-sm requiredValFld numericValFld" id="totalAmtClctedFrmAllotee"  title="e.g. Type of Flats/Plots/Villa etc." data-toggle="tooltip" data-placement="bottom"  />
									<span class='requiredValFldMsg'> Please enter Total amount of money collected form allottee.</span>
							</div>

							<label for="inputEmail3" class="col-sm-2 control-label">Total amount of money used from development of project<sup>*</sup></label>
							<div class="col-sm-3">
								<form:input type="text" path="projectDetailsModel.totalAmtUsedInPrjct" rel="txtTooltip" title="Only digits are allowed." data-toggle="tooltip" data-placement="bottom" 
									cssClass="form-control input-sm numericValFld numericValFld requiredValFld" id="totalAmtUsedInPrjct" />
									<span class='requiredValFldMsg'> Please enter Total amount of money used for development of project.</span>
							</div>

						</div>


						<div class="form-group">

							<label for="inputEmail3" class="col-sm-3 control-label">Total amount of balance money lying with promoter<sup>*</sup></label>
							<div class="col-sm-3">
								<form:input type="text" path="projectDetailsModel.totalBalAmtOfAlte" cssClass="form-control input-sm requiredValFld" rel="txtTooltip" title="Only digits are allowed." data-toggle="tooltip" data-placement="bottom" 
									id="totalBalAmtOfAlte" />
									<span class='requiredValFldMsg'> Please enter Total amount of balance money lying with promoter.</span>
							</div>


							<label for="inputEmail3" class="col-sm-2 control-label">Is there any subsequent modification in plan<sup>*</sup></label>
							<div class="col-sm-3">
							<c:if test="${projectRegistrationModel.projectDetailsModel.isSubSqChangeInPlan=='Yes' }">
								<input type="radio" checked="checked" name="projectDetailsModel.isSubSqChangeInPlan" class="requiredValFld" value="Yes" />Yes &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="radio" name="projectDetailsModel.isSubSqChangeInPlan" class="requiredValFld" value="No" />No
									</c:if>
									<c:if test="${projectRegistrationModel.projectDetailsModel.isSubSqChangeInPlan=='No' }">
								<input type="radio" name="projectDetailsModel.isSubSqChangeInPlan" class="requiredValFld" value="Yes" />Yes &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="radio"  checked="checked"  name="projectDetailsModel.isSubSqChangeInPlan" class="requiredValFld" value="No" />No
									</c:if>
									<span class='requiredValFldMsg'> Please select Any Subsequent Modification in Plan.</span>
							</div>



						</div>

						<div class="form-group">

							<label for="inputEmail3" class="col-sm-3 control-label">Is the project delayed</label>
							<div class="col-sm-3 ">
							<c:if test="${projectRegistrationModel.projectDetailsModel.isDelayed=='Yes' }">
							<input type="radio" name="projectDetailsModel.isDelayed" checked="checked" class=" requiredValFld" value="Yes"  onclick="delayedYesFldChk(this)"/>Yes &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="radio" name="projectDetailsModel.isDelayed" class="requiredValFld" value="No"  onclick="delayedNoFldChk(this)" />No
								
								</c:if><c:if test="${projectRegistrationModel.projectDetailsModel.isDelayed=='No' }">
									<input type="radio" name="projectDetailsModel.isDelayed" class=" requiredValFld" value="Yes"  onclick="delayedYesFldChk(this)"/>Yes &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="radio" name="projectDetailsModel.isDelayed" checked="checked" class="requiredValFld" value="No"  onclick="delayedNoFldChk(this)" />No
						
								
								</c:if>
									<span class='requiredValFldMsg'> Please select Is the project delayed.</span>
									
							</div>

						</div>
		
<c:if test="${projectRegistrationModel.projectDetailsModel.isDelayed=='Yes' }">
<div id="delaysection" >
</c:if>	
<c:if test="${projectRegistrationModel.projectDetailsModel.isDelayed=='No' }">
<div id="delaysection" style="display: none;">
</c:if>	


                      <div class="form-group">
						<label for="inputEmail3" class="col-sm-3 control-label">Reason For Delayed<sup>*</sup></label>
						<div class="col-sm-3">
							
                              <form:input path="projectDetailsModel.reasonForDelayed"
									 cssClass="form-control input-sm  requiredValFld" />
									 <span class='requiredValFldMsg'> Please enter reason for delayed.</span>

						</div>
						
						<label for="inputEmail3" class="col-sm-2 control-label">No of Month (Delayed)<sup>*</sup></label>
						<div class="col-sm-3">
							<div class="col-md-12 input-group ">
								<form:input path="projectDetailsModel.noOfMonthDelayed"
									 cssClass="form-control input-sm  requiredValFld" />
									<span class='requiredValFldMsg'> Please enter no. of month delayed.</span>
								

							</div>

						</div>
                         </div>

						<div class="form-group">

							<label for="inputEmail3" class="col-sm-3 control-label">Expected Completion Date<sup>*</sup></label>
							<div class="col-sm-3">
								<form:input type="text" path="projectDetailsModel.estimatedEndDate" readonly="readonly" cssClass="form-control input-sm  augCalCssClass requiredValFld" />
								<span class="glyphicon glyphicon-calendar augCalImgCssClass"></span>
									<span class='requiredValFldMsg'> Please enter Expected Completion Date.</span>
							</div>
							<label for="inputEmail3" class="col-sm-2 control-label">Certificate form Architect,Engineer,CA etc.<sup>*</sup></label>
							<div class="col-sm-3">
								    <input type="file" name="delayedCert" class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom" />
									 <a href="download?DOC_ID=${projectRegistrationModel.projectDetailsModel.delayedCertDoc.documentId}">
									 ${projectRegistrationModel.projectDetailsModel.delayedCertDoc.fileName }</a>
									<span class='requiredValFldMsg'> Please select Certificate.</span>
							</div>

						</div>		
						
						
					
						
						
									
						
	</div>					
						
						



										
					
		          <!-- PROJECT DETAILS END -->
		          					<br>


					<div class="inner_wrapper">



						<h1>
							Development <span>Details</span>
						</h1>
						
<c:choose>
				<c:when test="${developmentStatus=='NO' }">		
						
                     <div  id='dev_work-dv' class='addmoredv'>
						<div class="drop_shadow">  <span onclick="deloptdv(this);" style='float: right;'>DELETE</span> </div>

						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">Type
								of Inventory<sup>*</sup></label>
							<div class="col-sm-3">

								<input type="text" name="typeOfInventory"
									class="form-control input-sm requiredValFld" id="typeOfInventory" name="typeOfInventory" />
									<span class='requiredValFldMsg'> Please enter Type Of Inventory.</span>
							</div>

							<label for="inputEmail3" class="col-sm-2 control-label">No.
								of Inventory Available For Sale<sup>*</sup></label>
							<div class="col-sm-3">
								<input type="text" name=noOfInventory rel="txtTooltip" title="Only digits are allowed." data-toggle="tooltip" data-placement="bottom" 
									class="form-control input-sm numericValFld requiredValFld" id="noOfInventory" />
									<span class='requiredValFldMsg'> Please enter No Of Inventory Available For Sale.</span>
							</div>




						</div>


						<div class="form-group">

							<label for="inputEmail3" class="col-sm-3 control-label">Carpet
								Area (Sq Mt)<sup>*</sup></label>
							<div class="col-sm-3">
								<input type="text" name=carpetArea class="form-control input-sm   requiredValFld" rel="txtTooltip" title="Only digits are allowed." data-toggle="tooltip" data-placement="bottom" 
									id="carpetArea" />
									<span class='requiredValFldMsg'> Please enter Carpet Area.</span>
							</div>


							<label for="inputEmail3" class="col-sm-2 control-label">Area
								of exclusive balcony/verandah (Sq Mt)<sup>*</sup></label>
							<div class="col-sm-3">
								<input type="text" name=areaOfExclusive rel="txtTooltip" title="Only digits are allowed." data-toggle="tooltip" data-placement="bottom" 
									class="form-control input-sm   requiredValFld" id="areaOfExclusive" />
									<span class='requiredValFldMsg'> Please enter Area Of Exclusive Balcony/Verandah.</span>
							</div>



						</div>

						<div class="form-group">

							<label for="inputEmail3" class="col-sm-3 control-label">Area
								of exclusive open terrace if any (Sq Mt)</label>
							<div class="col-sm-3 ">
								<input type="text" name=areaOfExclusiveOpenTerrace rel="txtTooltip" title="Only digits are allowed." data-toggle="tooltip" data-placement="bottom" 
									class="form-control input-sm   " id="areaOfExclusiveOpenTerrace" />
									
							</div>

						</div>

					</div>
						
						
						
						
				</c:when>
				<c:otherwise>
						
						
						
						<% int dd=0;%>
						<c:forEach items="${developmentSet}" var="obj">
<% if(dd==0){%>
	<div id="dev_work-dv" class='addmoredv'> 
	<%}else{ %>
	<div  class='addmoredv'>
	<%} dd++; %>
						<div class="drop_shadow">  <span onclick="deloptdv(this);" style='float: right;'>DELETE</span></div>
						
						

								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">Type
										of Inventory<sup>*</sup></label>
									<div class="col-sm-3">
										<input type="hidden" name="devId" id="devId"
											value="${obj.devId}" />
											 <input type="text"
											name="typeOfInventory" class="form-control input-sm requiredValFld"
											id="typeOfInventory" value="${obj.typeOfInventory}" />
											<span class='requiredValFldMsg'> Please enter Type Of Inventory.</span>
									</div>

									<label for="inputEmail3" class="col-sm-2 control-label">No
										of Inventory<sup>*</sup></label>
									<div class="col-sm-3">
										<input type="text" name=noOfInventory
											class="form-control input-sm requiredValFld" id="noOfInventory"
											value="${obj.noOfInventory}" />
											<span class='requiredValFldMsg'> Please enter No Of Inventory.</span>
									</div>
								</div>


								<div class="form-group">

									<label for="inputEmail3" class="col-sm-3 control-label">Carpet
										Area (Sq Mt)<sup>*</sup></label>
									<div class="col-sm-3">
										<input type="text" name=carpetArea rel="txtTooltip" title="Only digits are allowed." data-toggle="tooltip" data-placement="bottom"
											class="form-control input-sm requiredValFld" id="carpetArea"
											value="${obj.carpetArea}" />
											<span class='requiredValFldMsg'> Please enter Carpet Area.</span>
									</div>


									<label for="inputEmail3" class="col-sm-2 control-label">Area
										of exclusive balcony/verandah (Sq Mt)<sup>*</sup></label>
									<div class="col-sm-3">
										<input type="text" name=areaOfExclusive rel="txtTooltip" title="Only digits are allowed." data-toggle="tooltip" data-placement="bottom"
											class="form-control input-sm requiredValFld" id="areaOfExclusive"
											value="${obj.areaOfExclusive}" />
											<span class='requiredValFldMsg'> Please enter Area Of Exclusive Balcony/Verandah.</span>
									</div>



								</div>

								<div class="form-group">

									<label for="inputEmail3" class="col-sm-3 control-label">Area
										of exclusive open terrace if any (Sq Mt)</label>
									<div class="col-sm-3 ">
										<input type="text" name=areaOfExclusiveOpenTerrace rel="txtTooltip" title="Only digits are allowed." data-toggle="tooltip" data-placement="bottom"
											class="form-control input-sm" id="areaOfExclusiveOpenTerrace"
											value="${obj.areaOfExclusiveOpenTerrace}" />
											
											
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
									<span class="theme-clr addmore" id='dev_work'> Add More&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>

							</div>
						</div>

					<div class="inner_wrapper">



						<h1>
							Internal Development <span>Work</span>
						</h1>

						<div class="drop_shadow"></div>

						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">Road System<sup>*</sup></label>
							<div class="col-sm-3">
								<form:select path="externalDevelopmentWorkModel.roadSysetmDevBy"
									class="form-control requiredValFld">
									<form:option value="0" label="Select" />
									<form:option value="Local Authority" label="Local Authority" />
									<form:option value="Self Development" label="Self Development" />

								</form:select>
									<span class='requiredValFldMsg'> Please select Road System.</span>

							</div>

							<label for="inputEmail3" class="col-sm-2 control-label">Water
								Supply<sup>*</sup></label>
							<div class="col-sm-3">
								<form:select path="externalDevelopmentWorkModel.waterSupplyBy"
									class="form-control requiredValFld">
									<form:option value="0" label="Select" />
									<form:option value="Local Authority" label="Local Authority" />
									<form:option value="Self Development" label="Self Development" />

								</form:select>
								<span class='requiredValFldMsg'> Please select Water Supply.</span>
							</div>
						</div>


						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">Sewege
								and Drainage System<sup>*</sup></label>
							<div class="col-sm-3">
								<form:select
									path="externalDevelopmentWorkModel.sewegeAndDrainageSystemDevBy"
									class="form-control requiredValFld">
									<form:option value="0" label="Select" />
									<form:option value="Local Authority" label="Local Authority" />
									<form:option value="Self Development" label="Self Development" />

								</form:select>
								<span class='requiredValFldMsg'> Please select Sewege and Drainage System.</span>
							</div>

							<label for="inputEmail3" class="col-sm-2 control-label">Electricity
								Supply Transformer And Sub Station<sup>*</sup></label>
							<div class="col-sm-3">
								<form:select
									path="externalDevelopmentWorkModel.electricityAndTrasfomerSupply"
									class="form-control requiredValFld">
									<form:option value="0" label="Select" />
									<form:option value="Local Authority" label="Local Authority" />
									<form:option value="Self Development" label="Self Development" />

								</form:select>
								<span class='requiredValFldMsg'> Please select Electricity Supply Transformer And Sub Station.</span>
							</div>
						</div>

						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">Solid
								Waste Management And Disposal</label>
							<div class="col-sm-3">
								<form:select
									path="externalDevelopmentWorkModel.solidWasteSupplyBy"
									class="form-control requiredValFld">
									<form:option value="0" label="Select" />
									<form:option value="Local Authority" label="Local Authority" />
									<form:option value="Self Development" label="Self Development" />

								</form:select>
								<span class='requiredValFldMsg'> Please select Solid Waste Management And Disposal.</span>
							</div>


						</div>
                       
                       
                       <!--  Added 4 new fields  -->
						
										
				<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">Fire Fighting facility
								<sup>*</sup></label>
							<div class="col-sm-3">
								<form:select
									path="externalDevelopmentWorkModel.fireFighting"
									class="form-control requiredValFld">
									<form:option value="0" label="Select" />
									<form:option value="Local Authority" label="Local Authority" />
									<form:option value="Self Development" label="Self Development" />
								</form:select>
								<span class='requiredValFldMsg'> Please select Fire Fighting facility.</span>
							</div>

							<label for="inputEmail3" class="col-sm-2 control-label">Drinking Water Facility<sup>*</sup></label>
							<div class="col-sm-3">
								<form:select
									path="externalDevelopmentWorkModel.drinkingWater"
									class="form-control requiredValFld">
									<form:option value="0" label="Select" />
									<form:option value="Local Authority" label="Local Authority" />
									<form:option value="Self Development" label="Self Development" />

								</form:select>
								<span class='requiredValFldMsg'> Please select Drinking Water Facility.</span>
							</div>
						</div>
												<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">Emergency Evacuation Services<sup>*</sup></label>
							<div class="col-sm-3">
								<form:select
									path="externalDevelopmentWorkModel.emergencyEvacuation"
									class="form-control requiredValFld">
									<form:option value="0" label="Select" />
									<form:option value="Local Authority" label="Local Authority" />
									<form:option value="Self Development" label="Self Development" />
								</form:select>
								<span class='requiredValFldMsg'> Please select Emergency evacuation services.</span>
							</div>

							<label for="inputEmail3" class="col-sm-2 control-label">Use of Renewable Energy<sup>*</sup></label>
							<div class="col-sm-3">
								<form:select
									path="externalDevelopmentWorkModel.renewableEnergy"
									class="form-control requiredValFld">
									<form:option value="0" label="Select" />
									<form:option value="Local Authority" label="Local Authority" />
									<form:option value="Self Development" label="Self Development" />

								</form:select>
								<span class='requiredValFldMsg'> Please select Use of renewable energy.</span>
							</div>
						</div>


<div class="inner_wrapper">

						<label for="inputEmail3" class="col-sm-3 control-label">
							Other External Development Works</label>
					
					<c:choose>		
<c:when test="${extOtherDevStatus=='NO' }">
	<DIV ID="other_dev_work-dv" class="addmoredv">
							<div class="drop_shadow">
								<span onclick="deloptdv(this);" style='float: right;'>DELETE</span>
						</div>


							<div class="form-group">
								<label for="inputEmail3" class="col-sm-3 control-label">Work
									Description</label>
								<div class="col-sm-3">
									<input type="text" name="extDevWorkDesc" class="form-control requiredValFld" />
									<span class='requiredValFldMsg'> Please enter work Description.</span>
	                                
						
								</div>



								<div class="col-sm-3">
									<select name="developeBy" class="form-control requiredValFld">
										<option value="0">Select</option>
										<option value="Local Authority">Local Authority</option>
										<option value="Self Development">Self Development</option>

									</select>
									<span class='requiredValFldMsg'> Please select One.</span>

								</div>


							</div>
						</DIV>


</c:when>						

<c:otherwise>
                    <!-- loop -->
                    <% int xx=0; %>
						<c:forEach items="${extOtherDevSet}" var="obj">
						<%if(xx>0){ %>
							<DIV  class="addmoredv">
							<%}else{ %>
								<DIV ID="other_dev_work-dv" class="addmoredv">
							<%}
						   xx++;%>
							<div class="drop_shadow">
								<span onclick="deloptdv(this);" style='float: right;'>DELETE</span>
						   </div>
						
						<input type="hidden" name="extOtherDevId" value="${obj.extOtherDevId}"/>
						
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-3 control-label">Work
									Description</label>
								<div class="col-sm-3">
									<input type="text" name="extDevWorkDesc" class="form-control requiredValFld" value="${obj.workDesc}"/>
	        							<span class='requiredValFldMsg'> Please enter Work Description.</span>
								</div>

								<div class="col-sm-3">
									<select name="developeBy" class="form-control requiredValFld">
										<option value="0">Select</option>
										<c:choose>
											<c:when test="${obj.developeBy == 'Local Authority'}">
												<option value="Local Authority" selected="selected">Local Authority</option>
												<option value="Self Development">Self Development</option>
											</c:when>
											<c:otherwise>
												<option value="Local Authority">Local Authority</option>
												<option value="Self Development" selected="selected">Self Development</option>

											</c:otherwise>
										</c:choose>

									</select>
											<span class='requiredValFldMsg'> Please select here.</span>
								</div>
                            

							</div>
							</DIV>
							</c:forEach>
							</c:otherwise>
					</c:choose>

</div>
						<div class="col-sm-2 pull-right" style="text-align: right;">

							<span class="glyphicon glyphicon-plus-sign theme-clr "
								aria-hidden="true"></span>
								<span class="theme-clr addmore" id="other_dev_work"> Add More&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>

						</div>
						




					</div>


					<br>


					<div class="inner_wrapper">



						<h1>
							Project Bank <span>Details</span>
						</h1>

						<div class="drop_shadow"></div>

						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">Bank
								Name<sup>*</sup></label>
							<div class="col-sm-3">
							
								<select  name="projectBankId" class="form-control requiredValFld" >
								   
						         <option value='0'> --Select-- </option>
						          <c:forEach  items="${bankList}" var="b">
						              <c:choose>
						                <c:when test="${b.bankId==projectRegistrationModel.projectBankDetailsModel.bankModel.bankId}">
						                 <option value='${b.bankId }' selected="selected"> ${b.bankName} </option>
						                </c:when>
						                  <c:otherwise>
						                    <option value='${b.bankId}'> ${b.bankName } </option>
						                </c:otherwise>
						                  </c:choose>
						           </c:forEach>
						         
						         
						       
								</select>	
								<span class='requiredValFldMsg'> Please select Bank Name.</span>
							</div>

							<label for="inputEmail3" class="col-sm-2 control-label">Branch
								Name<sup>*</sup></label>
							<div class="col-sm-3">
								<form:input path="projectBankDetailsModel.bankBranch"
									cssClass="form-control input-sm requiredValFld" />
									<span class='requiredValFldMsg'> Please enter Branch Name.</span>
							</div>
						</div>



						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">Account
								No.<sup>*</sup></label>
							<div class="col-sm-3">
								<form:input path="projectBankDetailsModel.accountNumber" rel="txtTooltip" title="Only digits are allowed." data-toggle="tooltip" data-placement="bottom"
									cssClass="form-control input-sm numericValFld requiredValFld" maxlength="17"/>
									<span class='requiredValFldMsg'> Please enter Account Number.</span>
							</div>

							<label for="inputEmail3" class="col-sm-2 control-label">IFSC
								Code<sup>*</sup></label>
							<div class="col-sm-3">
								<form:input path="projectBankDetailsModel.ifscCode"
									cssClass="form-control input-sm alphanumericValFld requiredValFld" />
									<span class='requiredValFldMsg'> Please enter IFSC Code.</span>
							</div>
						</div>


						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">State/UT<sup>*</sup></label>
							<div class="col-sm-3">
								<select
									name="bankStateUtId"
									class="form-control requiredValFld" id="bnkStateUtId"  onchange="reloadChildDropdown(this)">
						
                                      <c:forEach  items="${stateUtList}" var="st">
						              <c:choose>
						                <c:when test="${st.stateUtId==projectRegistrationModel.projectBankDetailsModel.districtModel.stateUtModel.stateUtId}">
						                 <option value='${st.stateUtId }' selected="selected"> ${st.stateUtName} </option>
						                </c:when>
						                  <c:otherwise>
						               <option value='${st.stateUtId}'> ${st.stateUtName} </option>
						                </c:otherwise>
						                  </c:choose>
						           </c:forEach>
								</select>
								<span class='requiredValFldMsg'> Please select State.</span>
								
								
								
								

							</div>

							<label for="inputEmail3" class="col-sm-2 control-label">District<sup>*</sup></label>
							<div class="col-sm-3">
								<select
									name="bankDistrictId" id="District-bnkStateUtId"
									class="form-control requiredValFld">
									<option value="0" > --Select-- </option>
									

                          <c:forEach  items="${projectRegistrationModel.projectBankDetailsModel.districtModel.stateUtModel.districtModelSet}" var="dst">	
								
								<c:choose>
						<c:when test="${dst.districtId==projectRegistrationModel.projectBankDetailsModel.districtModel.districtId}">
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



					<!-- Agent start -->

					<div class="inner_wrapper">
						<h1>
							Associated Vendor <span>Details</span>
						</h1>

						<div class="inner_wrapper">
							<h1>
								Project <span>Agent</span>
							</h1>

<c:choose>
<c:when test="${agentStatus=='NO'}">


							<div id='project-agent-dv' class='addmoredv'>

								<div class="drop_shadow">
									<span onclick="deloptdv(this);" style='float: right;'>DELETE</span>
								</div>

								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">Agent RERA Registration No.</label>
									<div class="col-sm-3">
										<div class="col-md-12 input-group">
											<input type="text" id="fldnogetagent" name="agentRegNo" class="form-control  dynaselectfld requiredValFld"  id="applicationId"  onchange="showInfo()" >
												 <span class='requiredValFldMsg'> Please enter Agent Registration Number.</span>
												 <label class="input-group-addon btn"
												    for="testdate" >
												 <span id='getagent' class="glyphicon glyphicon-search dynaselectfld" onclick="getAgentDetails(this)"> </span>
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
										<input class="form-control input-sm dynaselectfld" id='fldnamenogetagent' disabled name="agentName" />
									</div>

									<label for="inputEmail3" class="col-sm-2 control-label dynaselectfld">
										Agent Address</label>
									<div class="col-sm-3">
										<input class="form-control input-sm dynaselectfld" id='fldaddressnogetagent' disabled name="agentAddress" />
									</div>


								</div>

							</div>



</c:when>
<c:otherwise>

                  <% int agnt=0; %>
                  <c:forEach items="${ agentSet}" var="agent">
                  <%if(agnt==0){ %>

							<div id='project-agent-dv' class='addmoredv'>
<%}else{ %>
<div class='addmoredv'>

<%} agnt++; %>

								<div class="drop_shadow">
									<span onclick="deloptdv(this);" style='float: right;'>DELETE</span>
								</div>

								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">Agent
										Registration No.</label>
									<div class="col-sm-3">
										<div class="col-md-12 input-group">
											<input type="text" id="" name="agentRegNo" class="form-control alphanumericValFld requiredValFld"	value="${agent.agent.agentRegistrationNo }"> 
												<span class='requiredValFldMsg'> Please enter agent Registration Number.</span>
												<label class="input-group-addon btn"
												for="testdate" onclick="getAgentDetails();">
												 <span	class="glyphicon glyphicon-search dynaselectfld" id='getagent<%=agnt %>'  onclick="getAgentDetails(this)"></span>
											</label>
										</div>
									</div>
									
									  <label for="inputEmail3" id='resultgetagent<%=agnt %>' class="col-sm-2 control-label dynaselectfld"> </label>


								</div>



								
								<div class="form-group">


									<label for="inputEmail3" class="col-sm-3 control-label">Agent
										Name</label>
									<div class="col-sm-3">
										<input class="form-control input-sm dynaselectfld" id='fldnamenogetagent<%=agnt %>' disabled name="agentName" />
									</div>

									<label for="inputEmail3" class="col-sm-2 control-label dynaselectfld">
										Agent Address</label>
									<div class="col-sm-3">
										<input class="form-control input-sm dynaselectfld" id='fldaddressnogetagent<%=agnt %>' disabled name="agentAddress" />
									</div>


								</div>

							</div>
</c:forEach>
</c:otherwise>
</c:choose>
						
						<div class="form-group">

							<div class="col-sm-3 pull-right" style="text-align: right;">

								<span class="glyphicon glyphicon-plus-sign theme-clr "
									aria-hidden="true"></span>
									<span id='project-agent' class="theme-clr addmore"> Add
									More&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>

							</div>
						</div>
						</div>
						<!-- agent end -->

						<br>




						<!--Project  Architects start-->

						<div class="inner_wrapper">
							<h1>
								Project <span>Architects${arcSet}</span>
							</h1>

<c:choose>

<c:when test="${architectStatus=='NO' }">
                           <DIV id="projectArc-dv" class ="addmoredv">
							
							<div class="drop_shadow">
								<span onclick="deloptdv(this);" style='float: right;'>DELETE</span></div>
							
							
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-3 control-label">Architect
									Name<sup>*</sup></label>
								<div class="col-sm-3">
									<input class="form-control input-sm requiredValFld" type="text"
										name="architectName"  />
										<span class='requiredValFldMsg'> Please enter Architect Name.</span>

								</div>

								<label for="inputEmail3" class="col-sm-2 control-label">
								 Email ID<sup>*</sup></label>
								<div class="col-sm-3">
									<input class="form-control input-sm emailValFld requiredValFld" name="arctEmailId" rel="txtTooltip" title="Only valid eamilId is allowed.e.g:abc@xyz.com" data-toggle="tooltip" data-placement="bottom" 
										 />
										 <span class='requiredValFldMsg'> Please enter Email Id.</span>
								</div>



							</div>

                             <div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">Addrees Line 1<sup>*</sup>
									 </label>
									<div class="col-sm-3">
										<input class="form-control input-sm requiredValFld" name="arctAddressLine1"
											id="arctAddressLine1" />
											<span class='requiredValFldMsg'> Please enter Address Line 1.</span>
									</div>

									<label for="inputEmail3" class="col-sm-2 control-label">
										Address Line 2<sup>*</sup></label>
									<div class="col-sm-3">
										<input class="form-control input-sm requiredValFld" name="arctAddressLine2"
											id="arctAddressLine2" />
											<span class='requiredValFldMsg'> Please enter Address Line 2.</span>
									</div>

								</div>
								
								
								
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">State<sup>*</sup>
									 </label>
									<div class="col-sm-3">
										
					          <select name="arctStateUtId" id="arctSate"  onchange="reloadChildDropdown(this)" class="form-control dynaselectfld requiredValFld">
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
								
								  <select class="form-control dynaselectfld requiredValFld" name="arctProjDistrictId"  id="District-arctSate" >
									<option value="1"> --Select-- </option>
																		
								</select>
											<span class='requiredValFldMsg'> Please select District.</span>
									</div>

								</div>
								
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">Pin Code<sup>*</sup>
									 </label>
									<div class="col-sm-3">
										<input class="form-control input-sm pinCodeValFld requiredValFld" name="arctPineCode" rel="txtTooltip" title="Only 6 digits of pin number is allowed." data-toggle="tooltip" data-placement="bottom" 
											id="arctPineCode" />
											<span class='requiredValFldMsg'> Please enter Pin Code.</span>
									</div>

									<label for="inputEmail3" class="col-sm-2 control-label">
										Year
										of establishment<sup>*</sup></label>
									<div class="col-sm-3">
										<input class="form-control input-sm requiredValFld" name="arctYearOfEst"
											id="arctYearOfEst" />
											<span class='requiredValFldMsg'> Please enter Year Of Establishment.</span>
									</div>

								</div>
								


								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">Number of Key projects completed<sup>*</sup></label>
									<div class="col-sm-3">
										<input class="form-control input-sm requiredValFld"
											name="arctKeyProjectCompleted" id="arctKeyProjectCompleted" />
											<span class='requiredValFldMsg'> Please enter Number of Key projects completed .</span>
									</div>

									<label for="inputEmail3" class="col-sm-2 control-label">
										Reg. Number With COA<sup>*</sup></label>
									<div class="col-sm-3">
										<input class="form-control input-sm requiredValFld"
											name="regOfCoaNo" id="regOfCoaNo" />
											<span class='requiredValFldMsg'> Please enter COA No.</span>
									</div>

								</div>
								

                           </DIV>


</c:when>



<c:otherwise>
							 <% int xx10=0; %>
						         <c:forEach items="${architectSet}" var="obj">
						       
							
						        <%if(xx10>0){ %>
							    <DIV  class="addmoredv">
							       <%}else{ %>
								      <DIV ID="projectArc-dv" class="addmoredv">
							      <%}
						           xx10++;%>
						           
							    <div class="drop_shadow">
								   <span onclick="deloptdv(this);" style='float: right;'>DELETE</span>
						       </div>

								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">
										Architect Name<sup>*</sup></label>
									<div class="col-sm-3">
										<input class="form-control input-sm requiredValFld" type="text"
											name="architectName"  value="${obj.architectName}"/>
											<span class='requiredValFldMsg'> Please enter Architect Name.</span>
											  <input  type="hidden" name="projectArchId"  value="${obj.projectArchId}"/>
                                           
									</div>

									<label for="inputEmail3" class="col-sm-2 control-label">
										 Email ID<sup>*</sup></label>
									<div class="col-sm-3">
										<input class="form-control input-sm emailValFld requiredValFld" name="arctEmailId" rel="txtTooltip" title="Only valid emailId is allowed.e.gabc@xyz.com" data-toggle="tooltip" data-placement="bottom"
											 value='${obj.emailId}' />
											 <span class='requiredValFldMsg'> Please enter Email Id.</span>
									</div>



								</div>


							 <div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">Addrees Line 1<sup>*</sup>
									 </label>
									<div class="col-sm-3">
										<input class="form-control input-sm requiredValFld" name="arctAddressLine1"
											id="arctAddressLine1" value="${obj.addressLine1}" />
											<span class='requiredValFldMsg'> Please enter Address Line 1.</span>
									</div>

									<label for="inputEmail3" class="col-sm-2 control-label">
										Address Line 2<sup>*</sup></label>
									<div class="col-sm-3">
										<input class="form-control input-sm requiredValFld" name="arctAddressLine2"
											id="arctAddressLine2" value="${obj.addressLine2}"/>
											<span class='requiredValFldMsg'> Please enter Address Line 2.</span>
									</div>

								</div>
								
								
								
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">State<sup>*</sup>
									 </label>
									<div class="col-sm-3">
										
					          <select name="arctStateUtId" id="arctSate<%=xx10 %>"  onchange="reloadChildDropdown(this)" class="form-control dynaselectfld requiredValFld">
						      <option value='0'> --Select-- </option>
						         <c:forEach  items="${stateUtList}" var="st">
						              <c:choose>
						                <c:when test="${st.stateUtId==obj.districtModel.stateUtModel.stateUtId}">
						                 <option value='${st.stateUtId }' selected="selected"> ${st.stateUtName} </option>
						                </c:when>
						                  <c:otherwise>
						                  <option value='${st.stateUtId}'> ${st.stateUtName} </option>
						                </c:otherwise>
						
						
						
						                  </c:choose>
						           </c:forEach>
						       </select>
											<span class='requiredValFldMsg'> Please select State.</span>
									</div>

									<label for="inputEmail3" class="col-sm-2 control-label">
										District<sup>*</sup></label>
									<div class="col-sm-3">
								
								  <select class="form-control dynaselectfld requiredValFld" name="arctProjDistrictId"  id="District-arctSate<%=xx10 %>" >
										<option value="0"> --Select-- </option>
									<option selected="selected" value="${obj.districtModel.districtId}"> ${obj.districtModel.districtName} </option>
									
																		
								</select>
											<span class='requiredValFldMsg'> Please select District.</span>
									</div>

								</div>
								
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">Pin Code<sup>*</sup>
									 </label>
									<div class="col-sm-3">
										<input class="form-control input-sm pinCodeValFld requiredValFld" name="arctPineCode" rel="txtTooltip" title="Only 6 digits of pin number is allowed." data-toggle="tooltip" data-placement="bottom"
											id="arctPineCode" value='${obj.pinCode}'/>
											<span class='requiredValFldMsg'> Please enter Pin Code.</span>
									</div>

									<label for="inputEmail3" class="col-sm-2 control-label">
										Year
										of establishment<sup>*</sup></label>
									<div class="col-sm-3">
										<input class="form-control input-sm requiredValFld" name="arctYearOfEst"
											id="arctYearOfEst" value='${obj.yearOfEstablishment}'/>
											<span class='requiredValFldMsg'> Please enter Year Of Establishment.</span>
									</div>

								</div>
								


								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">Number of Key Projects completed<sup>*</sup></label>
									<div class="col-sm-3">
										<input class="form-control input-sm requiredValFld"
											name="arctKeyProjectCompleted" id="arctKeyProjectCompleted" value='${obj.keyProject}' />
											<span class='requiredValFldMsg'> Please enter Number of Key Projects Completed.</span>
									</div>

									<label for="inputEmail3" class="col-sm-2 control-label">
										Reg. Of COA No.<sup>*</sup></label>
									<div class="col-sm-3">
										<input class="form-control input-sm requiredValFld"
											name="regOfCoaNo" id="regOfCoaNo" value="${obj.regOfCoaNo}" />
											<span class='requiredValFldMsg'> Please enter COA No.</span>
									</div>

								</div>
								
								
								

                              </DIV>

						    
							  </c:forEach>
							  </c:otherwise>
	</c:choose>					
						
	                </div>

						<div class="form-group">

							<div class="col-sm-3 pull-right" style="text-align: right;">

								<span class="glyphicon glyphicon-plus-sign theme-clr "
									aria-hidden="true"></span> <span class="theme-clr addmore"
									id="projectArc"> Add More&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>

							</div>
						</div>
						                    
					
						

						<!--Project  Architects end-->

						<br>



						<!--Structural Engineers start -->

						<div class="inner_wrapper">
							<h1>
								Structural <span>Engineers</span>
							</h1>
							 
							 <c:choose>
							 <c:when test="${stcEngStatus=='NO' }">
							 
							 
							   <DIV id="structuralEng-dv" class="addmoredv">
							<div class="drop_shadow"> <span onclick="deloptdv(this);" style='float: right;'>DELETE</span>   </div>
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-3 control-label">Engineer
									Name<sup>*</sup></label>
								<div class="col-sm-3">
									<input class="form-control input-sm requiredValFld" name="engineerName"
										id="engineerName" />
										<span class='requiredValFldMsg'> Please enter Engineer Name.</span>
								</div>

								<label for="inputEmail3" class="col-sm-2 control-label">
								 Email ID<sup>*</sup></label>
								<div class="col-sm-3">
									<input class="form-control input-sm emailValFld requiredValFld" rel="txtTooltip" title="Only valid emailId is allowed.e.g:abc@xyz.com" data-toggle="tooltip" data-placement="bottom" id="strcEmailId" name="strcEmailId"
										 />
										 <span class='requiredValFldMsg'> Please enter Email Id.</span>
								</div>



							</div>

                             <div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">Addrees Line 1<sup>*</sup>
									 </label>
									<div class="col-sm-3">
										<input class="form-control input-sm requiredValFld" name="strcAddressLine1"
											id="strcAddressLine1" />
											<span class='requiredValFldMsg'> Please enter Address Line 1.</span>
									</div>

									<label for="inputEmail3" class="col-sm-2 control-label">
										Address Line 2<sup>*</sup></label>
									<div class="col-sm-3">
										<input class="form-control input-sm requiredValFld" name="strcAddressLine2"
											id="strcAddressLine2" />
											<span class='requiredValFldMsg'> Please enter Address Line 2.</span>
									</div>

								</div>
								
								
								
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">State<sup>*</sup>
									 </label>
									<div class="col-sm-3">
										
					          <select name="strcStateUtId" id="strcSate"  onchange="reloadChildDropdown(this)" class="form-control dynaselectfld requiredValFld">
						      <option value='0'> --Select-- </option>
						        <c:forEach  items="${stateUtList}" var="st">
						          <option value='${st.stateUtId }'> ${st.stateUtName } </option>
						        </c:forEach>
						       </select>
										<span class='requiredValFldMsg'>Please select State.</span>	
									</div>

									<label for="inputEmail3" class="col-sm-2 control-label">
										District<sup>*</sup></label>
									<div class="col-sm-3">
								
								  <select class="form-control dynaselectfld requiredValFld" name="strcProjDistrictId"  id="District-strcSate" >
									<option value="1"> --Select-- </option>
																		
								</select>
											<span class='requiredValFldMsg'>Please select District.</span>
									</div>

								</div>
								
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">Pin Code<sup>*</sup>
									 </label>
									<div class="col-sm-3">
										<input class="form-control input-sm pinCodeValFld requiredValFld" name="strcPineCode" rel="txtTooltip" title="Only 6 digits of pin number is allowed." data-toggle="tooltip" data-placement="bottom" 
											id="strcPineCode" />
											<span class='requiredValFldMsg'> Please enter Pin Code.</span>
									</div>

									<label for="inputEmail3" class="col-sm-2 control-label">
										Year
										of establishment<sup>*</sup></label>
									<div class="col-sm-3">
										<input class="form-control input-sm requiredValFld" name="strcYearOfEst"
											id="strcYearOfEst" />
											<span class='requiredValFldMsg'> Please enter Year Of Establishment.</span>
									</div>

								</div>
								


								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">Number of Key projects completed<sup>*</sup></label>
									<div class="col-sm-3">
										<input class="form-control input-sm requiredValFld"
											name="strcKeyProjectCompleted" id="strcKeyProjectCompleted" />
											<span class='requiredValFldMsg'>Please enter Number of Key projects completed.</span>
									</div>

									<label for="inputEmail3" class="col-sm-2 control-label">
										Local Authority Licence Number<sup>*</sup></label>
									<div class="col-sm-3">
										<input class="form-control input-sm requiredValFld"
											name="localAuthorityLicenceNumber" id="localAuthorityLicenceNumber" />
											<span class='requiredValFldMsg'>Please enter Local Authority Licence Number.</span>
									</div>

								</div>
																					
							</DIV>
							
							 
							 
							 </c:when>
							 <c:otherwise>
							 
							<% int xx2=0; %>
						         <c:forEach items="${stcEngSet}" var="obj">
							
						        <%if(xx2>0){ %>
							    <DIV  class="addmoredv">
							       <%}else{ %>
								      <DIV ID="structuralEng-dv" class="addmoredv">
							      <%}
						           xx2++;%>
							
								<div class="drop_shadow">
									<span onclick="deloptdv(this);" style='float: right;'>DELETE</span>
								</div>

								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">
										Engineer Name<sup>*</sup></label>
									<div class="col-sm-3">
										<input class="form-control input-sm requiredValFld" name="engineerName"  value="${obj.engineerName}"
											id="engineerName" />
											<span class='requiredValFldMsg'> Please enter Engineer Name.</span>
											<input type="hidden" name="strcStcEngId" value="${obj.projStcEngId}"/>
									</div>

									<label for="inputEmail3" class="col-sm-2 control-label">
								 Email ID<sup>*</sup></label>
								<div class="col-sm-3">
									<input class="form-control input-sm emailValFld requiredValFld" id="strcEmailId" rel="txtTooltip" title="Only valid emailId is allowed.e.g:abc@xyz.com" data-toggle="tooltip" data-placement="bottom" name="strcEmailId"
										value='${obj.emailId}' />
										<span class='requiredValFldMsg'> Please enter Email Id.</span>
								</div>



							</div>

                             <div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">Addrees Line 1<sup>*</sup>
									 </label>
									<div class="col-sm-3">
										<input class="form-control input-sm requiredValFld" name="strcAddressLine1"
											id="strcAddressLine1" value='${obj.addressLine1}'/>
											<span class='requiredValFldMsg'> Please enter Address Line 1.</span>
									</div>

									<label for="inputEmail3" class="col-sm-2 control-label">
										Address Line 2<sup>*</sup></label>
									<div class="col-sm-3">
										<input class="form-control input-sm requiredValFld" name="strcAddressLine2"
											id="strcAddressLine2" value='${obj.addressLine2}' />
											<span class='requiredValFldMsg'> Please enter Address Line 2.</span>
									</div>

								</div>
								
								
								
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">State<sup>*</sup>
									 </label>
									<div class="col-sm-3">
										
					          <select name="strcStateUtId" id="strcSate<%=xx2 %>"  onchange="reloadChildDropdown(this)" class="form-control dynaselectfld requiredValFld">
						      <option value='0'> --Select-- </option>
						          <c:forEach  items="${stateUtList}" var="st">
						              <c:choose>
						                <c:when test="${st.stateUtId==obj.districtModel.stateUtModel.stateUtId}">
						                 <option value='${st.stateUtId }' selected="selected"> ${st.stateUtName} </option>
						                </c:when>
						                  <c:otherwise>
						                  <option value='${st.stateUtId}'> ${st.stateUtName} </option>
						                </c:otherwise>
						
						
						
						                  </c:choose>
						           </c:forEach>
						       </select>
											<span class='requiredValFldMsg'> Please select State.</span>
									</div>

									<label for="inputEmail3" class="col-sm-2 control-label">
										District<sup>*</sup></label>
									<div class="col-sm-3">
								
								  <select class="form-control dynaselectfld requiredValFld" name="strcProjDistrictId"  id="District-strcSate<%=xx2 %>" >
										<option value="0"> --Select-- </option>
									<option selected="selected" value="${obj.districtModel.districtId}"> ${obj.districtModel.districtName} </option>
																		
								</select>
											<span class='requiredValFldMsg'> Please select District.</span>
									</div>

								</div>
								
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">Pin Code<sup>*</sup>
									 </label>
									<div class="col-sm-3">
										<input class="form-control input-sm pinCodeValFld requiredValFld" name="strcPineCode"
										 rel="txtTooltip" title="Only 6 digits of pin number is allowed." data-toggle="tooltip" data-placement="bottom"
											id="strcPineCode" value="${obj.pinCode}" />
											<span class='requiredValFldMsg'> Please enter Pin Code.</span>
									</div>

									<label for="inputEmail3" class="col-sm-2 control-label">
										Year
										of establishment<sup>*</sup></label>
									<div class="col-sm-3">
										<input class="form-control input-sm requiredValFld" name="strcYearOfEst"
											id="strcYearOfEst" value="${obj.yearOfEstablishment}" />
											<span class='requiredValFldMsg'> Please enter Year Of Establishment.</span>
									</div>

								</div>
								


								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">Number of Key projects completed<sup>*</sup></label>
									<div class="col-sm-3">
										<input class="form-control input-sm requiredValFld"
											name="strcKeyProjectCompleted" id="strcKeyProjectCompleted" value="${obj.keyProject}" />
										<span class='requiredValFldMsg'> Please enter Number of Key Project Completed.</span>
									</div>

									<label for="inputEmail3" class="col-sm-2 control-label">
										Local Authority Licence Number<sup>*</sup></label>
									<div class="col-sm-3">
										<input class="form-control input-sm requiredValFld"
											name="localAuthorityLicenceNumber" id="localAuthorityLicenceNumber" value="${obj.localAuthorityLicenceNumber }" />
											<span class='requiredValFldMsg'>Please enter Local Authority Licence Number.</span>
									</div>
								</div>
								

							</DIV>
							</c:forEach>
							</c:otherwise>
							</c:choose>
							
					  </div>
                        
						<div class="form-group">

							<div class="col-sm-3 pull-right" style="text-align: right;">

								<span class="glyphicon glyphicon-plus-sign theme-clr "
									aria-hidden="true"></span><span class="theme-clr addmore"
									id="structuralEng"> Add
									More&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>

							</div>
						</div>

                       </div>
						<!--Structural Engineers end -->
						<br>


						<!--Project  Contractors -->

						<div class="inner_wrapper">
							<h1>
								Project <span>Contractors</span>
							</h1>

                     <c:choose>

<c:when test="${projContratorStatus=='NO' }">

    <DIV id="projectContractors-dv" class="addmoredv">

							<div class="drop_shadow"> <span onclick="deloptdv(this);" style='float: right;'>DELETE</span> </div>


                             


							<div class="form-group">
             

								<label for="inputEmail3" class="col-sm-3 control-label">Contractor
									Name<sup>*</sup></label>
								<div class="col-sm-3">
									<input class="form-control input-sm requiredValFld" name="contractorName"
										id="contractorName">
										<span class='requiredValFldMsg'> Key projects Contractor Name.</span>
								</div>

								
								<label for="inputEmail3" class="col-sm-2 control-label">
								 Email ID<sup>*</sup></label>
								<div class="col-sm-3">
									<input class="form-control input-sm emailValFld requiredValFld" id="cntrEmailId" name="cntrEmailId" rel="txtTooltip" title="Only valid emailId is allowed.e.g:abc@xyz.com" data-toggle="tooltip" data-placement="bottom" 
										 />
										 <span class='requiredValFldMsg'> Key projects Email Id.</span>
								</div>



							</div>

                             <div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">Addrees Line 1<sup>*</sup>
									 </label>
									<div class="col-sm-3">
										<input class="form-control input-sm requiredValFld" name="cntrAddressLine1"
											id="cntrAddressLine1" />
											<span class='requiredValFldMsg'> Key projects Address Line 1.</span>
									</div>

									<label for="inputEmail3" class="col-sm-2 control-label">
										Address Line 2<sup>*</sup></label>
									<div class="col-sm-3">
										<input class="form-control input-sm requiredValFld" name="cntrAddressLine2"
											id="cntrAddressLine2" />
											<span class='requiredValFldMsg'> Key projects Address Line 2.</span>
									</div>

								</div>
								
								
								
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">State<sup>*</sup>
									 </label>
									<div class="col-sm-3">
										
					          <select name="cntrStateUtId" id="cntrSate"  onchange="reloadChildDropdown(this)" class="form-control dynaselectfld requiredValFld">
						      <option value='0'> --Select-- </option>
						        <c:forEach  items="${stateUtList}" var="st">
						          <option value='${st.stateUtId }'> ${st.stateUtName } </option>
						        </c:forEach>
						       </select>
											<span class='requiredValFldMsg'>Please select State.</span>
									</div>

									<label for="inputEmail3" class="col-sm-2 control-label">
										District<sup>*</sup></label>
									<div class="col-sm-3">
								
								  <select class="form-control dynaselectfld requiredValFld" name="cntrProjDistrictId"  id="District-cntrSate" >
									<option value="1"> --Select-- </option>
																		
								</select>
								<span class='requiredValFldMsg'>Please select District.</span>
											
									</div>

								</div>
								
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">Pin Code<sup>*</sup>
									 </label>
									<div class="col-sm-3">
										<input class="form-control input-sm pinCodeValFld requiredValFld" name="cntrPineCode" rel="txtTooltip" title="Only 6 digits of pin number is allowed." data-toggle="tooltip" data-placement="bottom"
											id="cntrPineCode" />
											<span class='requiredValFldMsg'> Please enter Pin Code.</span>
									</div>

									<label for="inputEmail3" class="col-sm-2 control-label">
										Year
										of establishment<sup>*</sup></label>
									<div class="col-sm-3">
										<input class="form-control input-sm requiredValFld" name="cntrYearOfEst"
											id="cntrYearOfEst" />
											<span class='requiredValFldMsg'>Please enter Year Of Establishment.</span>
									</div>

								</div>
								


								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">Number of Projects completed</label>
									<div class="col-sm-3">
										<input class="form-control input-sm requiredValFld" name="cntrKeyProjectCompleted" id="cntrKeyProjectCompleted" />
										<span class='requiredValFldMsg'>Please enter Number of Projects completed.</span>
									</div>

									<label for="inputEmail3" class="col-sm-2 control-label">
										</label>
									<div class="col-sm-3">
										
									</div>

								</div>
             
             
             
             
                    	</DIV>


</c:when>

<c:otherwise>




                              <% int xx3=0; %>
						         <c:forEach items="${projContratorSet}" var="obj">
							     
											
						        <%if(xx3>0){ %>
							    <DIV  class="addmoredv">
							       <%}else{ %>
								      <DIV ID="projectContractors-dv" class="addmoredv">
							      <%}
						           xx3++;%>


						
                                 <div class="drop_shadow">
 									<span onclick="deloptdv(this);" style='float: right;'>DELETE</span>
								</div>




								<div class="form-group">


									<label for="inputEmail3" class="col-sm-3 control-label">Contractor Name<sup>*</sup></label>
									<div class="col-sm-3">
									   <input type="hidden" name="projectCntrId" value="${obj.projectCntrId}"/> 
										<input class="form-control input-sm requiredValFld" name="contractorName"
											 value="${obj.contractorName}" />
											 <span class='requiredValFldMsg'> Please enter Contractor Name.</span>
											 
									</div>

	                            <label for="inputEmail3" class="col-sm-2 control-label">
								 Email ID<sup>*</sup></label>
								<div class="col-sm-3">
									<input class="form-control input-sm emailValFld requiredValFld" rel="txtTooltip" title="Only valid emailId is allowed.e.g:abc@xyz.com" data-toggle="tooltip" data-placement="bottom" id="cntrEmailId" name="cntrEmailId" value="${obj.emailId}"
										 />
										 <span class='requiredValFldMsg'> Please enter Email Id.</span>
								</div>



							</div>

                             <div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">Addrees Line 1<sup>*</sup>
									 </label>
									<div class="col-sm-3">
										<input class="form-control input-sm requiredValFld" name="cntrAddressLine1"
											id="cntrAddressLine1" value="${obj.addressLine1}"/>
											<span class='requiredValFldMsg'> Please enter Address Line 1.</span>
									</div>

									<label for="inputEmail3" class="col-sm-2 control-label">
										Address Line 2<sup>*</sup></label>
									<div class="col-sm-3">
										<input class="form-control input-sm requiredValFld" name="cntrAddressLine2"
											id="cntrAddressLine2" value="${obj.addressLine2}"/>
											<span class='requiredValFldMsg'> Please enter Address Line 2.</span>
									</div>

								</div>
								
								
								
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">State<sup>*</sup>
									 </label>
									<div class="col-sm-3">
										
					          <select name="cntrStateUtId" id="cntrSate<%=xx3 %>"  onchange="reloadChildDropdown(this)" class="form-control dynaselectfld requiredValFld">
						      <option value='0'> --Select-- </option>
						        <c:forEach  items="${stateUtList}" var="st">
						              <c:choose>
						                <c:when test="${st.stateUtId==obj.districtModel.stateUtModel.stateUtId}">
						                 <option value='${st.stateUtId }' selected="selected"> ${st.stateUtName} </option>
						                </c:when>
						                  <c:otherwise>
						                  <option value='${st.stateUtId}'> ${st.stateUtName} </option>
						                </c:otherwise>
						
						
						
						                  </c:choose>
						           </c:forEach>
						       </select>
											<span class='requiredValFldMsg'> Please select State.</span>
									</div>

									<label for="inputEmail3" class="col-sm-2 control-label">
										District<sup>*</sup></label>
									<div class="col-sm-3">
								
								  <select class="form-control dynaselectfld requiredValFld" name="cntrProjDistrictId"  id="District-cntrSate<%=xx3 %>" >
								  <option value="0"> --Select-- </option>
									<option selected="selected" value="${obj.districtModel.districtId}"> ${obj.districtModel.districtName} </option>
																		
								</select>
											<span class='requiredValFldMsg'> Please select District.</span>
									</div>

								</div>
								
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">Pin Code<sup>*</sup>
									 </label>
									<div class="col-sm-3">
										<input class="form-control input-sm pinCodeValFld requiredValFld" name="cntrPineCode" rel="txtTooltip" title="Only 6 digits of pin number is allowed." data-toggle="tooltip" data-placement="bottom"
											id="cntrPineCode" value="${obj.pinCode}"/>
											<span class='requiredValFldMsg'> Please enter Pin Code.</span>
									</div>

									<label for="inputEmail3" class="col-sm-2 control-label">
										Year
										of establishment<sup>*</sup></label>
									<div class="col-sm-3">
										<input class="form-control input-sm requiredValFld" name="cntrYearOfEst"
											id="cntrYearOfEst" value="${obj.yearOfEstablishment}"/>
											<span class='requiredValFldMsg'> Please enter Year Of Establishment.</span>
									</div>

								</div>
								


								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">Key Projects completed<sup>*</sup></label>
									<div class="col-sm-3">
										<input class="form-control input-sm requiredValFld" name="cntrKeyProjectCompleted" id="cntrKeyProjectCompleted"  value="${obj.keyProject}" />
										<span class='requiredValFldMsg'> Please enter Key Projects Completed.</span>
									</div>

									<label for="inputEmail3" class="col-sm-2 control-label">
										</label>
									<div class="col-sm-3">
										
									</div>

								</div>


							  </DIV>
							 </c:forEach>
			
			</c:otherwise>
			</c:choose>
			
			
			</div>
						
						<div class="form-group">

							<div class="col-sm-3 pull-right" style="text-align: right;">

								<span class="glyphicon glyphicon-plus-sign theme-clr "
									aria-hidden="true"></span>
									<span class="theme-clr addmore"	id="projectContractors"> Add More&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>

							</div>
						</div>
						
						
						<!--Project  Contractors end-->


					
                 
				</form:form>
			</div>
            
			<div class="button-wrapper">
			<c:choose>
			<c:when  test="${projectRegistrationModel.registrationType=='INDIVIDUAL_REG' }">
				<input name="btn1" class="btn-style" value="Previous" type="button"	onclick="pervForm('editRegInvForm')" /> 
				</c:when>
				<c:otherwise>
				<input name="btn1" class="btn-style" value="Previous" type="button"	onclick="pervForm('editPromoterComDels')" />
				</c:otherwise>
			</c:choose>		
					
					 <input name="btn1"	class="btn-style" value="Next" type="button" onclick="saveOrUpdateProjectDetailsForm()" />
			</div>

             <!-- <div class="button-wrapper">
				<input name="btn1" class="btn-style" value="Previous" type="button"
					onclick="pervForm('editRegInvForm')" /> <input name="btn1"
					class="btn-style" value="Next" type="button"
					onclick="saveOrUpdateProjectDetailsForm()" />
			</div>
              -->

			<br>



		</div>
	</div>
