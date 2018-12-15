<%@page import="in.gov.rera.common.security.ReraSecurity"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="<%=request.getContextPath() %>/resources/agentjs/agentJs.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script>
	var applicationNameList = new Array();
	<c:forEach items="${allApplicantsList}" var="application">

	var count = 0;
	count = count + 1;
	if (count < 10)
		applicationNameList.push('<c:out value="${application.projectRegistrationNo}"/>');
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

		document.getElementById('applicationId').value=applicationNameList[i];
		//console.log(selectedApp)

	}

</script>



<!--News Ticker-->
<div class="container mar_top_20">






	<div class="col-md-9 col-md-offset-3">

		
		
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
					action="postRegRegistration" id="loginFormID" name="registrationForm" >
					

					<%=ReraSecurity.writeToken(request)%>
					
					
					<div class="form-group has-feedback"  id="application">
						<label for="inputPassword3" class="col-md-6 control-label">Please Enter Permanent Application
							Number </label>
						<div class="col-md-6">
							<input type="text" class="form-control requiredValFld" name="applicationNumber"
								 id="applicationId" onchange="showInfo()">
								<span class='requiredValFldMsg'> Please enter Permanent Application Number</span>
						</div>
					</div>
					
					<div class="form-group">
						<div class="col-sm-offset-3 col-md-9" style="padding-left:80px;">
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
var  _chkclk=true;
function registerForm() {
	 var frm= $("#loginFormID");
	   if(validateForm(frm)){
		   if(_chkclk){   
			   _chkclk=false;
			$(frm).submit();
		   }   }
	
}

	
</script>




