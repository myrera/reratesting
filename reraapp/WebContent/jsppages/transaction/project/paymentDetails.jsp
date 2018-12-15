<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@page import="in.gov.rera.common.util.ReraConstants"%>
<%@page import="in.gov.rera.common.model.UserModel"%>
<%
UserModel user=(UserModel)session.getAttribute(ReraConstants.SES_USER_ATTR);

%>

    
    <div class="breadcrumb">Home /Project Dash Board<span class="pull-right user_name">Welcome :<b><%=user.getUserName() %></b></span></div>


<!--News Ticker-->
<div class="container">



	<body>
   
   

    
		<div class="col-md-12 col-sm-12">
			
			<div class="Main_containner">

<!--Inner wrapper stsrt here-->
<%-- <div class="inner_wrapper">

	<div class="row">
		<div class="col-md-12 profile_top_main">
		<div class="col-md-1"><img src="<%=request.getContextPath() %>/reraimage?IMG_ID=${projectReg.promoterDetailsModel.individualPhotoGraphPath.documentId}" class="img-responsive" width="157" height="181" alt=""/></div>
		<div class="col-md-11 no_pad_lft">
		
		<div class="col-md-6">
			<h1><%=user.getUserName() %> </h1>
			<p>${projectReg.promoterDetailsModel.addressLine1},${project.promoterDetailsModel.addressLine2} ,
${projectReg.promoterDetailsModel.districtModel.stateUtModel.stateUtName},${projectReg.promoterDetailsModel.districtModel.districtName}, ${projectReg.promoterDetailsModel.pinCode}</p>
			<p class="text-view">Registration Type<span class="space_LR">:</span>${projectReg.registrationType}</p>
			</div>
		
		
			<div class="col-md-6">
			<p class="pull-right"><span>Registration Number:${projectReg.projectRegistrationNo}</span></p>
			<br clear="all"/>
			<p class="text-view pull-right">Validity&nbsp;:&nbsp; ${projectReg.createdOn.time} &nbsp;&nbsp;&nbsp;to&nbsp;&nbsp;&nbsp;${projectReg.expireDate.time} </p>
			</div>
			
			
		</div> --%>
		</div>
		
	</div>


<div class="drop_shadow"></div>

<form class="form-horizontal">
     
    <br>

     <div class="col-md-12">
     <h1>Payment <span> Details</span></h1>
     <div class="drop_shadow"></div>
     </div>
 
  
  
  
  
  

<c:if test="${projectReg.paymentDetailsModel.paymentMode!='Payment Gateway'}">
	
		<div class="row">
		 
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Payment Mode<span class="space_LR">:</span></p></div>
	
		<div class="col-md-3 col-sm-6 col-xs-6" ><p> ${projectReg.paymentDetailsModel.paymentMode}</p></div>
		
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Unique Token Number<span class="space_LR">:</span></p></div>
	
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${projectReg.paymentDetailsModel.paymentToken}  </p></div>
	
	
	<%-- <div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Bank Name<span class="space_LR">:</span></p></div>
     <div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.auditedBalSheetYear2.documentId}'>${project.projectDocModel.auditedBalSheetYear2.fileName }</a></p></div>
	 --%>
	 </div>
	
	
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Amount<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${projectReg.paymentDetailsModel.amount} </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Reference Number of SBCollect/NEFT/RTGS<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${projectReg.paymentDetailsModel.sbiTransactionRefNo} </p></div>
	</div>
	
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right"><span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p></p></div>
		 <div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Online Payment Receipt<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${projectReg.paymentDetailsModel.scanCopyDoc.documentId}'>${projectReg.paymentDetailsModel.scanCopyDoc.fileName} </a></p></div>
		 
	</div>
	
	
</c:if>	
	
	<c:if test="${projectReg.paymentDetailsModel.paymentMode=='Payment Gateway'}">
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Payment Mode<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${projectReg.paymentDetailsModel.paymentMode}</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Amount<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${projectReg.paymentDetailsModel.amount} </p></div>
	</div>
	
	
	<div class="row">
	<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Payment Through<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${projectReg.paymentDetailsModel.online.mode}</p></div>
	
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Transaction No.<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${projectReg.paymentDetailsModel.online.transactionNo} </p></div>
	</div>
<div class="row">
		
	</div>
	
		
	</c:if>

			
			
		
</form>
	
	
	
	

	</div>
<!--inner container end here-->





</div>
			
		</div>
	
	


<!-- container end here-->

</div>
    