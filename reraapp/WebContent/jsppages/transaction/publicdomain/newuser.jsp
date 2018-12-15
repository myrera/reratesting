<%@page import="in.gov.rera.common.security.ReraSecurity"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="<%=request.getContextPath() %>/resources/agentjs/agentJs.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">




<!--News Ticker-->
<div class="container mar_top_20">






	<div class="col-md-6 col-md-offset-3">

		
		
		<!--main container start here-->
		<div class="Main_containner">

			<!--Inner wrapper stsrt here-->
			<div class="inner_wrapper">



				<h1>
					New User <span>Registration</span>
				</h1>

				<div class="drop_shadow"></div>

				${ERROR_MSG}

				<form:form class="form-horizontal" method="post"
					action="Registration" id="loginFormID" name="registrationForm" >
					

					<%=ReraSecurity.writeToken(request)%>
					<div class="form-group has-feedback">
						<label for="inputPassword3" class="col-sm-3 control-label">Name
						</label>
						<div class="col-sm-9">

							<input type="text" class="form-control requiredValFld" name="name" id="name">
								<span class='requiredValFldMsg'> Please enter Name</span>
						</div>
					</div>
					
					<div class="form-group  has-feedback ">
						<label for="inputEmail3" class="col-sm-3 control-label">Type</label>
						<div class="col-sm-9">
							<select name="type" id='type'
								class="form-control requiredValFld" onchange="showothers()">
								<option value="0">--Select--</option>
								<option value="PROJECT">Promoter </option>
								<option value="AGENT">Agent</option>
							<!--<option value="PROJECT UNREGISTERED">Promoter - New User</option>
								<option value="AGENT UNREGISTERED">Agent - New User</option> -->
								<option value="COMPLAINANT">Complainant</option>
								<option value="BUYER">Buyer</option>
								<option value="OTHERS">Others</option>
							</select>
							<span class='requiredValFldMsg'> Please select type</span>

						</div>
					</div>
						<div class="form-group has-feedback" hidden="true" id="othersDiv">
						<label for="inputPassword3" class="col-sm-3 control-label">Please
							Specify Type </label>
						<div class="col-sm-9">
							<input type="text" class="form-control " name="other"
								id="other">
						</div>
					</div>
					
						<div class="form-group has-feedback" id="phoneDiv">
						<label for="inputPassword3" class="col-sm-3 control-label" 	>Phone
						</label>
						<div class="col-sm-9">
							<input type="text" class="form-control requiredValFld" name="contactNumber"
								id="contactNumber" maxlength="10" rel="txtTooltip"
									title="Only 10 digits of mobile number is allowed." data-toggle="tooltip" data-placement="bottom">
								<span class='requiredValFldMsg'> Please enter phone number</span>
						</div>
					</div>
					
					<div class="form-group has-feedback" id="emailDiv">
						<label for="inputPassword3" class="col-sm-3 control-label">Email
							Address </label>
						<div class="col-sm-9">
							<input type="text" class="form-control emailValFld" name="email"
								id="email" title="xyz@gmail.com">
								<span class='requiredValFldMsg'> Please enter Email Address</span>
						</div>
					</div>
					
				
					
				<!-- 	<div class="form-group has-feedback" hidden="true" id="application">
						<label for="inputPassword3" class="col-sm-3 control-label">Application
							Number </label>
						<div class="col-sm-9">
							<input type="text" class="form-control requiredValFld" name="applicationNumber"
								 id="applicationId"  onchange="showInfo()">
								<span class='requiredValFldMsg'> Please enter application number</span>
						</div>
					</div> -->
					
					
				
					

					<div class="form-group">
						<div class="col-sm-offset-3 col-sm-9">
						 <input name="btn1" class="btn-style" value="Register" type="button" onclick="registerForm()"/>

						</div>
					</div>
				</form:form>
				<br> <br>



				<div class="clearfix"></div>
				<!--search list main end here-->
			</div>

		</div>


		<!--inner container end here-->
	</div>


</div>

<!-- container end here-->

<script>
var applicationArray = new Array();
var applicationNameList = new Array();

function showothers(){
	if(document.getElementById('type').value=='OTHERS'){
		document.getElementById('othersDiv').hidden='';
	}else{
		document.getElementById('othersDiv').hidden='true';
		document.getElementById('other').value=document.getElementById('type').value;
		
	}
	
	/* if(document.getElementById('type').value=='PROJECT'||document.getElementById('type').value=='AGENT'){

		document.getElementById('application').hidden='';
		document.getElementById('emailDiv').hidden='true';
		document.getElementById('phoneDiv').hidden='true';
		
	}else{
		document.getElementById('phoneDiv').hidden='';
		document.getElementById('emailDiv').hidden='';
		document.getElementById('other').value=document.getElementById('type').value;
		document.getElementById('application').hidden='true';
		
	} */
	
	
	
	if(document.getElementById('type').value=='PROJECT'){
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
	}
	
	if(document.getElementById('type').value=='AGENT'){
		<c:forEach items="${agentModelList}" var="application">
		
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
	}
	
	if(document.getElementById('type').value=='COMPLAINANT'){
		<c:forEach items="${complaintmodelList}" var="application">
		
		var localObj = {
			appNo : '<c:out value="${application.complaintNo}"/>'
		};
		var count = 0;
		count = count + 1;
		if (count < 10)
			applicationNameList
					.push('<c:out value="${application.complaintNo}"/>');
		applicationArray.push(localObj);
		</c:forEach>
	}
	
}

var  _chkclk=true;
function registerForm() {
	 var frm= $("#loginFormID");
	   if(validateForm(frm)){
		   if(_chkclk){   
			   _chkclk=false;
			$(frm).submit();
		   }   }
	
}

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




