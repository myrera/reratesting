

<%@page import="in.gov.rera.common.security.ReraSecurity"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@page import="in.gov.rera.common.model.UserModel"%>
<%@page import="in.gov.rera.common.util.ReraConstants"%>
   <%
   String roleAccess=(String)session.getAttribute(ReraConstants.ROLE_ACCESS);
	UserModel user = (UserModel) session.getAttribute(ReraConstants.SES_USER_ATTR);
%>




<div class="breadcrumb">Home /Agent Detail</div>



   
  
    
		<div class="col-md-12 col-sm-12 ">
			
			<div class="Main_containner">

<!--Inner wrapper stsrt here-->
<div class="inner_wrapper">




<h1>Agent Renewal Request<span> Detail</span></h1>
<div class="border"><div class="orange"></div><div class="black"></div></div>



<!-----------------------------Tab start here--------------------------------->

	<div class="tab_main">
		
		  <ul class="nav nav-tabs">
		  <li class="active"><a data-toggle="tab" href="#regrequest">Renewal Request</a></li>
			<li><a data-toggle="tab" href="#home">Agent Detail</a></li>
			
			<li><a data-toggle="tab" href="#menu2">Uploaded Documents</a></li>
			<li><a data-toggle="tab" href="#menu3">	Payment</a></li>
		  </ul>



 <div class="tab-content">
 
 
 
     <div id="regrequest" class="tab-pane fade in active">
 
     <form class="form-horizontal">
     
    <br>

    <div class="col-md-12">
     <h1>Registration Details <span></span></h1>
     <div class="drop_shadow"></div>
	 </div>
 
  

<div class="row">
        <div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Registration No.<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agent.agentRegistrationNo}</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Validity<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>from ${agent.approvedOn.time } to ${agent.expireDate.time }</p></div>
</div>
		<div class="inner_wrapper">
		
		<h1>Supporting   <span>Documents</span></h1>
	 <div class="drop_shadow"></div>

<c:forEach items="${agentReq.supportingDocs}" var="obj">
<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Caption <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${obj.caption}</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Attachment<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${obj.documentId}'>  ${obj.fileName}</a> </p></div>
	</div>
</c:forEach>
</div>
	
								
		
<div class="inner_wrapper">
		
		<h1>Payment   <span>Details</span></h1>
			
			<div class="drop_shadow"></div>
<c:if test="${agentReq.regPaymentDetailsModel.paymentMode!='Payment Gateway'}">
<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Payment Mode<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agentReq.regPaymentDetailsModel.paymentMode}</p></div> 
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Unique Token Number<span class="space_LR">:</span></p></div>
		
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agentReq.regPaymentDetailsModel.paymentToken}  </p></div>
	</div>
	
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Amount<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agentReq.regPaymentDetailsModel.amount} </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Reference Number of SBCollect/NEFT/RTGS<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agentReq.regPaymentDetailsModel.sbiTransactionRefNo} </p></div>
	</div>
	
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right"><span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p> </p></div>
	 <div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Online Payment Receipt<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${agentReq.regPaymentDetailsModel.attachScanCopy.documentId}'>${agentReq.regPaymentDetailsModel.attachScanCopy.fileName} </a></p></div>
		
	</div>
	
		</c:if>
	
	<c:if test="${agentReq.regPaymentDetailsModel.paymentMode=='Payment Gateway'}">
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Payment Mode<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agentReq.regPaymentDetailsModel.paymentMode}</p></div>
	</div>
	
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Amount<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agentReq.regPaymentDetailsModel.amount} </p></div>
	
	</div>
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Payment Through<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agentReq.regPaymentDetailsModel.online.mode}</p></div>
	</div>
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Transaction No.<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agentReq.regPaymentDetailsModel.online.transactionNo} </p></div>
	
	</div>	
	
		
	</c:if>
						
						
			</div>									
			

			
			
		
</form>
     
  </div>
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
    <div id="home" class="tab-pane fade">
 
     <form class="form-horizontal">
     
    <br>

     <div class="col-md-12">
     <h1>Agent <span> Detail</span></h1>
     <div class="drop_shadow"></div>
	 </div>
 
  

<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right ">Agent Type <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p class="text-view">${agent.registrationType}</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Name<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p> ${agent.agentDetailsModel.firmName }</p></div>
</div>
		<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Mobile Number<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agent.agentDetailsModel.firmMobileNo} </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">LandLine Number<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agent.agentDetailsModel.firmLandLineNo1} </p></div>
	</div>
		
<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Address 1 <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agent.agentDetailsModel.firmAddressLine1 } </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Address 2<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agent.agentDetailsModel.firmAddressLine2} </p></div>
	</div>
	
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Company Registration Number <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agent.agentDetailsModel.firmRegistrationNo } </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Registration Type<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agent.agentDetailsModel.firmRegistrationType} </p></div>
	</div>
	


<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Major Activities<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agent.agentDetailsModel.firmActivities}</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Email<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agent.agentDetailsModel.firmEmail}  </p></div>
	</div>

					
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Fax Number<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agent.agentDetailsModel.firmFaxNumber}</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Mobile<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agent.agentDetailsModel.firmMobileNo	}  </p></div>
	</div>
							
											
<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">State/UT<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agent.agentDetailsModel.districtModel.stateUtModel.stateUtName} </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">District<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agent.agentDetailsModel.districtModel.districtName}  </p></div>
	</div>

		<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">PIN Code <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agent.agentDetailsModel.firmPincode} </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Photograph<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agent.agentDetailsModel.firmCertificatDoc.fileName}  </p></div>
	</div>
					
					
					<div class="inner_wrapper">
			
			<h1>Operation For <span>Registration</span></h1>
			<div class="drop_shadow"></div>

	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">District <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agent.districtModel.districtName}</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Tehsil/SubDistrict<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agent.subDistrictModel.subDistrictName}  </p></div>
	</div>
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Approving Authority<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agent.approvingAuthority}</p></div>
		
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Hard Copy Submission Office <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agent.office.officeName}</p></div>
		
	</div>
	
	</div>
					
					
					
					
<div class="inner_wrapper">
			
			<h1>Partner/Director <span> Details</span></h1>
			<div class="drop_shadow"></div>

	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Partner/Director Name <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agent.agentDetailsModel.partnerOrDirectorName}</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Email<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agent.agentDetailsModel.partnerOrDirectorEmailAddress}  </p></div>
	</div>
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Address 1<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agent.agentDetailsModel.partnerOrDirectorAddressLine1}</p></div>
		
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Address 2<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agent.agentDetailsModel.partnerOrDirectorAddressLine2}</p></div>
		
	</div>
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">State/UT<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agent.agentDetailsModel.districtModel.stateUtModel.stateUtName} </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">District<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agent.agentDetailsModel.districtModel.districtName}  </p></div>
	</div>
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Mobile Number<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agent.agentDetailsModel.partnerOrDirectorPhoneNO}</p></div>
		
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Photograph<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agent.agentDetailsModel.partnerOrDirectorPhotographPath.fileName}</p></div>
		
	</div>
	
	</div>
	
								
		
<div class="inner_wrapper">
		
		<h1>Previous Agent   <span>Details</span><span style="font-size: 12px; padding-left: 8px; font-weight: normal; color: #000;"> (Last 5 years only)</span></h1>
			<c:forEach items="${agent.agentDetailsModel.regPreviousDatailsModelSet}" var="obj">
			<div class="drop_shadow"></div>

	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Registration Number<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${obj.preRegistrationNo}</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">State/UT<span class="space_LR">:</span></p></div>
		
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${obj.districtModel.stateUtModel.stateUtName }</p></div>
	</div>
	
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">District <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${obj.districtModel.districtName}</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Certificate<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${obj.certificateDoc.fileName }</p></div>
	</div>
	
	

	
	

			</c:forEach>
						
			</div>									
			

			
			
		
</form>
     
  </div>



    <div id="menu2" class="tab-pane fade">
     
      <form class="form-horizontal">
      
      <br>


        <div class="col-md-12">
     <h1>Uploaded <span> Documents</span></h1>
     <div class="drop_shadow"></div>
	 </div>
 
<div class="clearfix"></div>

      
     <div class="inner_wrapper">
			
			<h1>Agent <span> Document </span></h1>
			<div class="drop_shadow"></div>

	
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">PAN Card <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${agent.agentDetailsModel.regUploadDetailsModel.panCardPath.documentId}' > ${agent.agentDetailsModel.regUploadDetailsModel.panCardPath.fileName }</a> </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Address Proof<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${agent.agentDetailsModel.regUploadDetailsModel.addressProofPath.documentId}' > ${agent.agentDetailsModel.regUploadDetailsModel.addressProofPath.fileName }</a> </p></div>
	</div>

		</div>	
    <br>

   
			
		

	
	
		

		
</form>
    </div>
    <div id="menu3" class="tab-pane fade">
      <form class="form-horizontal">
     <div class="inner_wrapper">
		
<h1>Agent Payment  <span>Details</span></h1>
			<div class="drop_shadow"></div>
<c:if test="${agent.agentDetailsModel.regPaymentDetailsModel.paymentMode!='Payment Gateway'}">

	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Payment Mode<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agent.agentDetailsModel.regPaymentDetailsModel.paymentMode}</p></div> 
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Unique Token Number<span class="space_LR">:</span></p></div>
		
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agent.agentDetailsModel.regPaymentDetailsModel.paymentToken}  </p></div>
	</div>
	
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Amount<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agent.agentDetailsModel.regPaymentDetailsModel.amount} </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Reference Number of SBCollect/NEFT/RTGS<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agent.agentDetailsModel.regPaymentDetailsModel.sbiTransactionRefNo} </p></div>
	</div>
	
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right"><span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p> </p></div>
	 <div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Online Payment Receipt<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${agent.agentDetailsModel.regPaymentDetailsModel.attachScanCopy.documentId}'>${agent.agentDetailsModel.regPaymentDetailsModel.attachScanCopy.fileName} </a></p></div>
		</div>
	
	
	</c:if>
	
	<c:if test="${agent.agentDetailsModel.regPaymentDetailsModel.paymentMode=='Payment Gateway'}">
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Payment Mode<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agent.agentDetailsModel.regPaymentDetailsModel.paymentMode}</p></div>
	</div>
	
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Amount<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agent.agentDetailsModel.regPaymentDetailsModel.amount} </p></div>
	
	</div>
	
		
	</c:if>
</div>
	

</div>
    <br>

     
	
</form>
    </div>
  </div>


		
		
		
		
	</div>


<form name="approvalForm" autocomplete="off" action="approveAgentRegRenwal" class="form-horizontal"   method="post" >
<%=ReraSecurity.writeToken(request) %>
<input type='hidden' name='AGENT_ID' value="${agentReq.agentRegLogId}" />
  <input type='hidden' name='STATUS' />
	
		<div class="form-group">
		<label for="inputEmail3" class="col-sm-3 control-label"> Remarks: </label>
				<div class="col-sm-3">
				<textarea name="REMARKS" class="form-control input-sm requiredValFld" ></textarea>
				<span class='requiredValFldMsg'> Please enter your remark.</span>
				</div>
				
			
		
	</div>
	<br/><br/><br/><br/>
	
	 <% if(roleAccess!=null && roleAccess.equals("READ")){%>
<div class="button-wrapper">
   <!-- editAgentUploadDoc -->
   <% if(user.getLoginId()!=null && user.getLoginId().equals("rera.secretary")){%>
   <input name="btn1" class="btn-style " value="Enquiry" type="button"  data-toggle="modal" data-target="#myModal" />
    
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   <input name="btn1" class="btn-style" value="Move to Approval Queue" type="button" 
									onclick="submitTrxForm('PREPARE_APPROVAL')" />
   <%}else{ %>
   
   <%} %>
	   
	   
   
 <%}else{  %>
<div class="button-wrapper">
   
   <!-- editAgentUploadDoc -->
   <input name="btn1"  class="btn-style" id="editDocButton" value="Reject" type="button" onclick="submitTrxForm('REJECTED')"/>
   
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   <input name="btn1" class="btn-style" value="Enquiry" type="button"  data-toggle="modal" data-target="#myModal" />
     
   
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   <input name="btn1" class="btn-style" value="Move to Approval Queue" type="button" 
									onclick="submitTrxForm('PREPARE_APPROVAL')" /></div>                                                   
  <%  }  %>




</form>



	
	
	
	

	</div>
<!--inner container end here-->
<script>
function submitTrxForm(_out){
document.approvalForm.STATUS.value=_out;
if(_out=='REJECTED'){
if(confirm('Are you sure reject this application?')){
//document.approvalForm.submit();

}
}
else{
if(confirm('Are you sure forward this application?')){
document.approvalForm.submit();

}
}
}
</script>




</div>
			
	
	
	


<!-- container end here-->

	


<!-- container end here-->


	<div class="pop_main">
	
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
         
        </div>
        <div class="modal-body">
        
			<form class="form-horizontal" action="sendAgentRenewRegEnquiry"  id="enquiryForm" 	 method="post" name='enquiryForm'>
       
                           <input type='hidden' name='AGENT_ID' value="${agent.agentRegistrationID}" />
							<div class="inner_wrapper">

								<h1>
									Details of the <span>Enquiry</span>
								</h1>
								<div class="drop_shadow"></div>
								<div class="clearfix"></div>


								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">
										Subject <sup>*</sup>
									</label>
									<div class="col-sm-6">

										<input type="text" mane="subject" class="form-control input-sm" maxlength="200" />

									</div>




								</div>


								<div class="form-group">

									<label for="inputEmail3" class="col-sm-3 control-label">Enquiry<sup>*</sup>
									</label>
									<div class="col-sm-6">
										<textarea name="summary" rows="3"
											cssClass="form-control input-sm"> </textarea>
									</div>

								</div>

<div class="button-wrapper">
			<input name="btn3" class="btn-style" value="Send Enquiry" type="button" onclick="sendEnquiry()"/>
			 <button type="button" class="close" data-dismiss="modal">Close</button>
		</div>                                                   

		



							</div>
       
       </form>
       
        </div>
        
        </div>
        </div>
        </div>
        </div>
