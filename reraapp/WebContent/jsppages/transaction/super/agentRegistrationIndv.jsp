

<%@page import="in.gov.rera.common.security.ReraSecurity"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<div class="breadcrumb">Home /Agent Registration Details</div>


   
   
  
    
		<div class="col-md-12 col-sm-12 ">
			
			<div class="Main_containner">

<!--Inner wrapper stsrt here-->
<div class="inner_wrapper">




<h1>Agent Registration<span> Detail</span></h1>
<div class="border"><div class="orange"></div><div class="black"></div></div>



<!-----------------------------Tab start here--------------------------------->

	<div class="tab_main">
		
		  <ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#home">Agent Detail</a></li>
			
			<li><a data-toggle="tab" href="#menu2">Uploaded Documents</a></li>
			<li><a data-toggle="tab" href="#menu3">	Payment</a></li>
		  </ul>



 <div class="tab-content">
    <div id="home" class="tab-pane fade in active">
 
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
		<div class="col-md-3 col-sm-6 col-xs-6" ><p> ${agent.agentDetailsModel.agentName }</p></div>
</div>
		
		
<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Father's Name <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agent.agentDetailsModel.agentFatherName }</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Registration Type<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agent.registrationType } </p></div>
	</div>


<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Pan Number<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agent.agentDetailsModel.agentPanNo }</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Email<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agent.agentDetailsModel.agentEmailId } </p></div>
	</div>

					
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Adhaar Number<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agent.agentDetailsModel.agentAdhaarNo }</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Mobile Number<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agent.agentDetailsModel.agentPhoneNo }  </p></div>
	</div>
							
											
<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Address 1<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agent.agentDetailsModel.agentIndividualBussAddress1 } </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Address 2<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agent.agentDetailsModel.agentIndividualBussAddress2 } </p></div>
	</div>

		<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">State/UT <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agent.agentDetailsModel.districtModel.stateUtModel.stateUtName } </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">District<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agent.agentDetailsModel.districtModel.districtName } </p></div>
	</div>
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Pin Code <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agent.agentDetailsModel.agentIndividualPincode } </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Photograph<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p> <a href='<%=request.getContextPath() %>/download?DOC_ID=${agent.agentDetailsModel.photograph.documentId }'>  ${agent.agentDetailsModel.photograph.fileName }</a> </p></div>
	</div>
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Business Address 1 <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agent.agentDetailsModel.agentIndividualBussAddress1 } </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Business Address 2<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agent.agentDetailsModel.agentIndividualBussAddress2 } </p></div>
	</div>
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">State <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agent.agentDetailsModel.districtModel.stateUtModel.stateUtName }</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">District<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agent.agentDetailsModel.districtModel.districtName } </p></div>
	</div>
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Pin Code<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agent.agentDetailsModel.agentIndividualBussPincode}</p></div>
		
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
		
		<h1>Previous Agent   <span>Details</span><span style="font-size: 12px; padding-left: 8px; font-weight: normal; color: #000;"> (Last 5 years only)</span></h1>
			<c:forEach items="${agent.agentDetailsModel.regPreviousDatailsModelSet}" var="obj">
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
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${obj.certificateDoc.documentId }' >   ${obj.certificateDoc.fileName } </a></p></div>
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
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${agent.agentDetailsModel.regUploadDetailsModel.panCardPath.documentId}' >   ${agent.agentDetailsModel.regUploadDetailsModel.panCardPath.fileName }</a> </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Address Proof<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${agent.agentDetailsModel.regUploadDetailsModel.addressProofPath.documentId}' >  ${agent.agentDetailsModel.regUploadDetailsModel.addressProofPath.fileName } </a> </p></div>
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
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Khajane2 Challan Number<span class="space_LR">:</span></p></div>
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
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Payment Through<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agent.agentDetailsModel.regPaymentDetailsModel.online.mode}</p></div>
	</div>
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Transaction No.<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agent.agentDetailsModel.regPaymentDetailsModel.online.transactionNo} </p></div>
	
	</div>
	
		
	</c:if>
</div>
	

</div>
    <br>

     
	
</form>
    </div>
  </div>


		
		
		
		
	</div>

<c:if test="${agent.status=='APPROVED'}">

<form name="trxForm" autocomplete="off" action="revokeAgentRegistration" method="post" >
<%=ReraSecurity.writeToken(request) %>
<input type='hidden' name='AGENT_ID' value="${agent.agentRegistrationID}" />
 
	<div class="form-group">
		<label for="inputEmail3" class="col-sm-3 control-label"> Reason: </label>
				<div class="col-sm-3">
				<textarea name="REASON" class="form-control input-sm requiredValFld" ></textarea>
				<span class='requiredValFldMsg'> Please enter your reason.</span>
				</div>
				
			
		
	</div>
	<br/><br/><br/><br/>
<div class="button-wrapper">
   
   <!-- editAgentUploadDoc -->
   <input name="btn1"  class="btn-style" id="editDocButton" value="Revoke Registration" type="button" onclick="revokeRegistration()"/>
   
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   <input name="btn1" class="btn-style" value="Enquiry" type="button"  />
   
   
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <a href="<%=request.getContextPath() %>/agentCert?AID=${agent.agentRegistrationID}" target="_blank"> <input name="btn1" class="btn-style" value="View Certificate" type="button"   /> </a></div>



</form>
</c:if>
</div>

	</div>
<!--inner container end here-->
<script>
function revokeRegistration(){
	
	if(document.trxForm.REASON.value!=''){
		if(confirm('Are you sure to revoke this registration?')){
		document.trxForm.submit();	
		}
	}
	else{
		alert('Please enter reason.');
	}
}
</script>


	


<!-- container end here-->
