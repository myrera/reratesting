<%@page import="in.gov.rera.common.security.ReraSecurity"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<html>
<head>
<script src="<%=request.getContextPath() %>/resources/agentjs/agentJs.js"></script>

</head>
<body>


<div class="breadcrumb">Home / Real Estate Agent Registration</div>


<!--News Ticker-->
<div class="container">

<!--main container start here-->
<div class="Main_containner">

<!--Inner wrapper stsrt here-->
<div class="inner_wrapper">



<h1>Registration <span> Form</span></h1>
<div class="border"><div class="orange"></div><div class="black"></div></div>
<div>
<b>NOTE:</b>
<br/>
Please use dedicated email id and remember it for all future official communication. 

</div>

<form:form class="form-horizontal" method="POST" autocomplete="off" modelAttribute="agentRegistrationModel" action="invOrComAgentRegForm" id="trxForm">
	<%=ReraSecurity.writeToken(request) %>
<br>


<label class="col-sm-2 control-label">Agent Type</label>
<div class="radio ">
  <label>
    <input type="radio" name="reg_type" id="optionsRadios1" value="individual" onclick="changeLabelText('#emailIdLabel','Email ID','agentRegInvForm')"  >
    Individual
  </label>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <label>
    <input type="radio" name="reg_type" id="optionsRadios1" value="firm" checked onclick="changeLabelText('#emailIdLabel','Business Email ID','agentRegComForm')" >
     Societies / Company/Partnership firm /Proprietorship Firm /Development Authority /Trust
   
  </label>
  
</div>
	<br>

	
	<div class="form-group">
				<label class="col-sm-2 control-label" id="emailIdLabel">Email ID<sup>*</sup></label>
				<div class="col-sm-3">
				  <input type="email" id="emailId" rel="txtTooltip" title="Email ID should be in proper format e.g. xyz@domain.com" data-toggle="tooltip" data-placement="bottom" class="form-control input-sm requiredValFld" name="emailId" placeholder=""></input>
				<span class='requiredValFldMsg'> Please enter Email Id.</span>
				</div>
		

			</div>	
		

			
			

	
	
	<br>
<br>

	
</form:form>
	</div>
<!--inner container end here-->


<div class="button-wrapper">
   <input name="btn1" class="btn-style" value="Next" type="button" onclick="agentForm()"></div>

<br>



</div>
<!-- container end here-->
</div>




</body>
</html>

