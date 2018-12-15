<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

     <%@ page isELIgnored="false"%>
     <%@page import="in.gov.rera.common.util.ReraConstants"%>
<%@page import="in.gov.rera.common.model.UserModel"%>
<%
UserModel user=(UserModel)session.getAttribute(ReraConstants.SES_USER_ATTR);

%>

 <body>   
    <div class="breadcrumb">Home /Project Dash Board<span class="pull-right user_name">Welcome :<b><%=user.getUserName() %> </b></span></div>


<!--News Ticker-->
<div class="container">

<div class="col-md-12 col-sm-12">
			
			<div class="Main_containner">

<!--Inner wrapper start here-->
<div class="inner_wrapper">

	<div class="row">
		<div class="col-md-12 profile_top_main">
		<div class="col-md-1"><img src="<%=request.getContextPath() %>/reraimage?IMG_ID=${projectReg.promoterDetailsModel.individualPhotoGraphPath.documentId}" class="img-responsive" width="157" height="181" alt=""/></div>
		<div class="col-md-11 no_pad_lft">
		
		<div class="col-md-6">
			<h1>${projectReg.promoterDetailsModel.promoterName } </h1>
			<p>${projectReg.promoterDetailsModel.addressLine1},${projectReg.promoterDetailsModel.addressLine2} ,
			${projectReg.promoterDetailsModel.districtModel.stateUtModel.stateUtName},${projectReg.promoterDetailsModel.districtModel.districtName}, ${projectReg.promoterDetailsModel.pinCode}</p>
			<p class="text-view">Registration Type<span class="space_LR">:</span>${projectReg.registrationType}</p>
			</div>
		
		
			<div class="col-md-6">
			<p class="pull-right"><span>Registration Number &nbsp;:&nbsp;&nbsp;${projectReg.projectRegistrationNo}</span></p>
			<br clear="all"/>
			<p class="text-view pull-right">Validity&nbsp;:&nbsp;${projectReg.createdOn.time} &nbsp;&nbsp;&nbsp;to&nbsp;&nbsp;&nbsp;${projectReg.expireDate.time}</p>
			</div>
			
			
		</div>
		</div>
		
	</div>


<div class="drop_shadow"></div>

<form class="form-horizontal">
     
    <br>

     <div class="col-md-12">
     <h1>Promoter  <span> Details</span></h1>
    <div class="border"><div class="orange"></div><div class="black"></div></div>
	 </div>
 
  
<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Promoter Name<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${projectReg.promoterDetailsModel.promoterName }</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Father's Name <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${projectReg.promoterDetailsModel.promoterIndividualFatherName}</p></div>
	
</div>
		
		
<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">PAN Number<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${projectReg.promoterDetailsModel.panNo} </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Adhaar Number<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${projectReg.promoterDetailsModel.adhaarNo} </p></div>
		
	</div>


<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Phone Number<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${projectReg.promoterDetailsModel.telephoneNo}  </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">E-mail<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${projectReg.promoterDetailsModel.emailId} </p></div>
	
	</div>

					
	<div class="row">
			<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Fax Number<span class="space_LR">:</span></p></div>
		    <div class="col-md-3 col-sm-6 col-xs-6" ><p>${projectReg.promoterDetailsModel.faxNumber}  </p></div>
			<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Mobile No<span class="space_LR">:</span></p></div>
		    <div class="col-md-3 col-sm-6 col-xs-6" ><p>${projectReg.promoterDetailsModel.mobileNo}  </p></div>
		</div>
							
											
<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Address Line 1 <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${projectReg.promoterDetailsModel.addressLine1}  </p></div>
			<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Address Line 2 <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${projectReg.promoterDetailsModel.addressLine2}  </p></div>
		
		
	</div>
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">State.UT <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${projectReg.promoterDetailsModel.districtModel.stateUtModel.stateUtName} </p></div>
			<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">District<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${projectReg.promoterDetailsModel.districtModel.districtName} </p></div>
			
	</div>
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">PIN Code <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${projectReg.promoterDetailsModel.pinCode}</p></div>
		
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Photograph<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${projectReg.promoterDetailsModel.individualPhotoGraphPath.documentId}'>${projectReg.promoterDetailsModel.individualPhotoGraphPath.fileName}</a></a>  </p></div>
		
	</div>

		<div class="row">
	</div>
																	
																																																																										
								

		
<div class="inner_wrapper">
		
<h1>Previous Project  <span>Details</span></h1>
			<div class="drop_shadow"></div>

	
      <c:forEach items="${projectReg.previousProjectDetailsSet}" var="preobj">
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Project Name<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${preobj.projectName}</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Project Description<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${preobj.projectDescription} </p></div>
	</div>
	
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Current Status <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${preobj.projectCurrentStatus} </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Type of Land<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${preobj.typeOfLand}  </p></div>
	</div>
	
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">If Delayed<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${preobj.ifDelayed} </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">No of Months<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${preobj.noOfMonthDelayed}  </p></div>
	</div>
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">If Ongoing <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${preobj.ifOngoing} </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Expected Completion Date<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${preobj.expectedCompletionDate} </p></div>
	</div>
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">If Completed <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${preobj.projectCurrentStatus} </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Project Completion Cretificate<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${preobj.completionDocId.documentId}'>${preobj.completionDocId.fileName }</a> </p></div>
	</div>
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Address<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${preobj.projectAddress} </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">State/UT<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${preobj.districtModel.stateUtModel.stateUtName}  </p></div>
	</div>
	
	
		<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">District<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${preobj.districtModel.districtName} </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Pin Code<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${preobj.projectAddrPinCode}  </p></div>
	</div>
	</c:forEach>
</div>
		
																						
																																										
																																																																																		
			
	
</form>
	
	
	
	

	</div>
<!--inner container end here-->





</div>
			
		</div>
	
	


<!-- container end here-->

</div>
    