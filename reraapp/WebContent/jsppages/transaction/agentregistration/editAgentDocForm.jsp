<%@page import="in.gov.rera.common.security.ReraSecurity"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@ page isELIgnored="false"%>

<html>
<head>
<script src="<%=request.getContextPath() %>/resources/agentjs/agentJs.js"></script>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title></title>

<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">

</head>
<body>
<div class="breadcrumb">Home / Real Estate Agent Registration</div>

<div class="container">
  
<div class="stepwizard col-md-offset-1">
    <div class="stepwizard-row setup-panel">
     
     
      <div class="stepwizard-step fill">
        <a href="#step-1" type="button" class="btn btn-success btn-circle">1</a>
        <p>Applicant Detail</p>
      </div>
     
      <div class="stepwizard-step blank">
        <a href="#step-2" type="button" class="btn btn-success btn-circle" >2</a>
        <p>Upload Documents </p>
      </div>
      
      <div class="stepwizard-step blank">
        <a href="#step-2" type="button" class="btn btn-default btn-circle" >3</a>
        <p>Payment </p>
      </div>
      
      <div class="stepwizard-step ">
        <a href="#step-3" type="button" class="btn btn-default btn-circle" disabled="disabled">4</a>
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



<h1>Upload<span> Document</span></h1>
<div class="border"><div class="orange"></div><div class="black"></div></div>


<form:form class="form-horizontal" modelAttribute="agentRegistrationModel" action="editAgentRegUpload"
 id="agenttrxForm1" method="POST" autocomplete="off"  enctype="multipart/form-data" >
	<%=ReraSecurity.writeToken(request) %>
				<form:hidden  path="agentRegistrationID"/>
				  <form:hidden path="agentDetailsModel.agentRegDetailID"/>
				  <form:hidden path="registrationType"/>
				   <form:hidden path="registrationStage"/>
	
			<div class="form-group">
				<label class="col-sm-3 control-label"> PAN Card</label>
				<div class="col-sm-3">
				 				  	
				  		
							
							
							
								
						<div class="Containerdvphotospn"> 
					<span class='filenamephotospn'><a href="download?DOC_ID=${UploadDetails.panCardPath.documentId}"> ${UploadDetails.panCardPath.fileName} </a></span>
						<span onclick="editfilefieldenable(this)" style='float:right;cursor:pointer;'  id="photospn" >
					
					 EDIT   </span>
					
					        <div class="Containerphotospn" style="display:none;">
							<input type="file" class="form-control requiredValFld"  rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  name="panCardDocFile" id="panCardFile" />
							<span class='requiredValFldMsg'> Please select Pan Card.</span>
							</div>
					 </div>
						
							
							
							
							
							
							
							
							
							
							
							
							
				</div>
		

				<label class="col-sm-2 control-label"> Address proof</label>
				<div class="col-sm-3">
				
				
				
						<div class="Containerdvaddressproof"> 
					<span class='filenameaddressproof'><a href="download?DOC_ID=${UploadDetails.addressProofPath.documentId}"> ${UploadDetails.addressProofPath.fileName} </a></span>
						<span onclick="editfilefieldenable(this)" style='float:right;cursor:pointer;' id='addressproof'>
				
					 EDIT   </span>
					
					        <div class="Containeraddressproof" style="display:none;">
							<input type="file" class="form-control requiredValFld"  rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  name="addressProofPath" id="addressProofPath" />
							<span class='requiredValFldMsg'> Please select Address Proof.</span>
							</div>
					 </div>
				
				
				
				
			
				
							
				</div>
			
			</div>
		
			
		

 </form:form>
	</div>
<!--inner container end here-->


<div class="button-wrapper">
 <c:choose>
<c:when test="${agentRegistrationModel.registrationType=='FIRM_COMP_REG' }">
   <input name="btn1" class="btn-style" value="Previous" id="preDocButton" type="button" onclick="pervAgentForm('editAgentComForm')"/>
   </c:when>
   <c:otherwise>
    <input name="btn1" class="btn-style" value="Previous" id="preDocButton" type="button" onclick="pervAgentForm('editIndAgentForm')"/>
   </c:otherwise>
   </c:choose>
   
   
   <input name="btn1" class="btn-style" value="Next" type="button" onclick="updateAgentDocs()"/>
   </div>
  

<br>



</div>
<!-- container end here-->


	</div>

</body>
</html>