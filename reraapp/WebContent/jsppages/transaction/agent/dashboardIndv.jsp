<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

     <%@ page isELIgnored="false"%>
        <%@page import="in.gov.rera.common.util.ReraConstants"%>
<%@page import="in.gov.rera.common.model.UserModel"%>
<%
UserModel user=(UserModel)session.getAttribute(ReraConstants.SES_USER_ATTR);

%>

    
    <div class="breadcrumb">Home /Agent Dash Board<span class="pull-right user_name">Welcome :<b><%=user.getUserName() %></b></span></div>


<!--News Ticker-->
<div class="container">



	<body>
   
   

    
		<div class="col-md-12 col-sm-12">
			
			<div class="Main_containner">

<!--Inner wrapper stsrt here-->
<div class="inner_wrapper">

	<div class="row">
		<div class="col-md-12 profile_top_main">
		<div class="col-md-1">
		<img src="<%=request.getContextPath()%>/reraimage?IMG_ID=${agentReg.agentDetailsModel.photograph.documentId}" class="img-responsive" width="157" height="181" alt=""/>
		
		
		</div>
		<div class="col-md-11 no_pad_lft">
		
		<div class="col-md-6">
			<h1><%=user.getUserName() %></h1>
			<p>${agentReg.agentDetailsModel.agentIndividualBussAddress1 },${agentReg.agentDetailsModel.agentIndividualBussAddress2 } ,${agentReg.agentDetailsModel.agentIndividualPincode }
</p>
			<p class="text-view">Registration Type<span class="space_LR">:</span>${agentReg.registrationType}</p>
			</div>
		
		
			<div class="col-md-6">
			<p class="pull-right"><span>Registration Number:${agentReg.agentRegistrationNo} </span></p>
			<br clear="all"/>
			<p class="text-view pull-right">Validity&nbsp;:&nbsp;${agentReg.approvedOn.time} &nbsp;&nbsp;&nbsp;to&nbsp;&nbsp;&nbsp;${agentReg.expireDate.time} </p>
			</div>
			
			
		</div>
		</div>
		
	</div>


<div class="drop_shadow"></div>

<form class="form-horizontal">
     
    <br>

     <div class="col-md-12">
     <h1>Basic <span> Detail</span></h1>
     <div class="drop_shadow"></div>
     </div>
 
  
  
  
  
  

<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Father's Name <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agentReg.agentDetailsModel.agentFatherName }</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Registration Type<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agentReg.registrationType } </p></div>
	</div>


<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Pan Number<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agentReg.agentDetailsModel.agentPanNo }</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Email<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agentReg.agentDetailsModel.agentEmailId } </p></div>
	</div>

					
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Adhaar Number<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agentReg.agentDetailsModel.agentAdhaarNo }</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Mobile Number<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agentReg.agentDetailsModel.agentPhoneNo }  </p></div>
	</div>
							
											
<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Address 1<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agentReg.agentDetailsModel.agentIndividualBussAddress1 } </p></div>
	
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Address 2<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agentReg.agentDetailsModel.agentIndividualBussAddress2 } </p></div>
	</div>

		<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">State/UT <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agentReg.agentDetailsModel.districtModel.stateUtModel.stateUtName } </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">District<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agentReg.agentDetailsModel.districtModel.districtName } </p></div>
	</div>
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Pin Code <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agentReg.agentDetailsModel.agentIndividualPincode } </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Photograph<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agentReg.agentDetailsModel.photograph.fileName } </p></div>
	</div>
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Business Address 1 <span class="space_LR">:</span></p></div>
			<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agentReg.agentDetailsModel.agentIndividualBussAddress1 } </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Business Address 2<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agentReg.agentDetailsModel.agentIndividualBussAddress2 } </p></div>
	</div>
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">State <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agentReg.agentDetailsModel.districtModel.stateUtModel.stateUtName }</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">District<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agentReg.agentDetailsModel.districtModel.districtName } </p></div>
	</div>
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Pin Code<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agentReg.agentDetailsModel.agentIndividualBussPincode}</p></div>
		
	</div>			
											
			<div class="inner_wrapper">
			
			<h1>Operation For <span>Registration</span></h1>
			<div class="drop_shadow"></div>

	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">District <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agentReg.districtModel.districtName}</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Tehsil/SubDistrict<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agentReg.subDistrictModel.subDistrictName}  </p></div>
	</div>
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Approving Authority<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agentReg.approvingAuthority}</p></div>
		
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Hard Copy Submission Office <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agentReg.office.officeName}</p></div>
		
	</div>
	
	</div>
												

<div class="inner_wrapper">
			
			<h1>Previous <span> Registration Details</span></h1>
			<c:forEach items="${agentReg.agentDetailsModel.regPreviousDatailsModelSet}" var="obj">
			<div class="drop_shadow"></div>

	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Registration Number<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${obj.preRegistrationNo }</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">State/UT<span class="space_LR">:</span></p></div>
		
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${obj.districtModel.stateUtModel.stateUtName }</p></div>
	</div>
	
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">District <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${obj.districtModel.districtName} </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Certificate<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${obj.certificateDoc.documentId }' >${obj.certificateDoc.fileName } </a></p></div>
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
    