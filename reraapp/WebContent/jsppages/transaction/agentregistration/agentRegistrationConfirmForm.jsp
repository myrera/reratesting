<%@page import="in.gov.rera.common.security.ReraSecurity"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title></title>
<script src="<%=request.getContextPath() %>/resources/agentjs/agentJs.js"></script>
</head>
<body>

<div class="breadcrumb">Home / Real Estate Agent Registration</div>

<div class="container">
  
<div class="stepwizard col-md-offset-1" style="padding-right:130px;">
    <div class="stepwizard-row setup-panel">
     
     
      <div class="stepwizard-step fill">
        <a href="#step-1" type="button" class="btn btn-success btn-circle">1</a>
        <p>Applicant Detail</p>
      </div>
      <div class="stepwizard-step fill">
        <a href="#step-2" type="button" class="btn btn-success btn-circle" >2</a>
        <p>Upload Documents </p>
      </div>
      
      <div class="stepwizard-step fill">
        <a href="#step-2" type="button" class="btn btn-success btn-circle" >3</a>
        <p>Payment </p>
      </div>
    <!--   <div class="stepwizard-step fill">
        <a href="#step-2" type="button" class="btn btn-success btn-circle" >4</a>
        <p>Enquiry</p>
      </div> -->
      <div class="stepwizard-step">
        <a href="#step-3" type="button" class="btn btn-success btn-circle" >5</a>
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
<div class="inner_wrapper">

<h1>Confirmation<span></span></h1>
<div class="border"><div class="orange"></div><div class="black"></div></div>

<br>
<br>
	<form:form class="form-horizontal"  action="enquiryDetails" id="agenttrxForm1"  enctype="multipart/form-data"  
	modelAttribute="agentRegistrationModel" autocomplete="off">
					<%=ReraSecurity.writeToken(request) %>
					
				 
<h1 style="text-align: center;">Your application has been submitted successfully. Your application number is : ${agentRegistrationModel.applicationNo}</h1>
	<br/><br/><br/>
	<%-- <div class="button-wrapper">
	<input hidden type="text" name="agentRegistrationID" value="<c:out value="${agentRegistrationModel.agentRegistrationID}"/>">
	<input hidden type="text" name="agentEmailId" value="<c:out value="${agentRegistrationModel.agentDetailsModel.agentEmailId}"/>">
					<!--  onclick="nextForm1()" <input name="btn1" class="btn-style" value="Next" type="submit"  onsubmit="nextForm1()"/> -->
					 <input name="btn1"  class="btn-style" id="editDocButton1" value="Previous" type="button" onclick="pervAgentForm1('enquiryDetails')"/>
					<input name="btn1" class="btn-style" value="Next" type="submit"  onclick=" return nextFormvalidation1()" />
				</div> --%>
</form:form>

    

	</div>
<!--inner container end here-->



<!-- container end here-->


	</div>
	</div>

<!--<div class="container">
  <div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">
      <div class="gov-bodies"> <a href="#"><img src="images/got-bodies1.jpg" width="108" height="28" /> </a> <a href="#"><img src="images/got-bodies2.jpg" width="139" height="30" /> </a> <a href="#"><img src="images/got-bodies3.jpg" width="134" height="29" /> </a> <a href="#"><img src="images/got-bodies4.jpg" width="85" height="34" /> </a> <a href="#"><img src="images/got-bodies5.jpg" width="72" height="43" /> </a> <a href="#"><img src="images/got-bodies6.jpg" width="90" height="26" /> </a> <a href="#"><img src="images/got-bodies7.jpg" width="57" height="44" /> </a> <a href="#"><img src="images/got-bodies8.jpg" width="78" height="28" /> </a> <a href="#"><img src="images/got-bodies9.jpg" width="105" height="35" /> </a> </div>
    </div>
  </div>
</div>-->

<script type="text/javascript">
	function nextFormvalidation1() {
		var _frm = $("#agenttrxForm1");
		if (validateForm(_frm)) {
			$(_frm).submit();
		}else{
		return false;
		}
	}
	</script>
</body>
</html>