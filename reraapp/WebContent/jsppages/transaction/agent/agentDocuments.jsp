<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

     <%@ page isELIgnored="false"%>
        <%@page import="in.gov.rera.common.util.ReraConstants"%>
<%@page import="in.gov.rera.common.model.UserModel"%>
<%
UserModel user=(UserModel)session.getAttribute(ReraConstants.SES_USER_ATTR);

%>
    
    <div class="breadcrumb">Home /Agent Documents<span class="pull-right user_name">Welcome :<b><%=user.getUserName() %></b></span></div>


<!--News Ticker-->
<div class="container">
<div class="inner_wrapper">



<form class="form-horizontal">
     
    <br>

     <div class="col-md-12">
     <h1>Document <span> List</span></h1>
     <div class="drop_shadow"></div>
	 </div>
 
  

<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">PAN Card <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${agentReg.agentDetailsModel.regUploadDetailsModel.panCardPath.documentId }' >${agentReg.agentDetailsModel.regUploadDetailsModel.panCardPath.fileName }</a> </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Address Proof<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${agentReg.agentDetailsModel.regUploadDetailsModel.addressProofPath.documentId }'>${agentReg.agentDetailsModel.regUploadDetailsModel.addressProofPath.fileName }</a> </p></div>
	</div>
		
		


			
			
		
</form>
	
	
	
	

	</div>
<%-- ${agentReg }

projectReg
Agent Documet --%>

<!-- container end here-->

</div>
    