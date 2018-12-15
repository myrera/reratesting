

<%@page import="in.gov.rera.common.security.ReraSecurity"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>




<div class="breadcrumb">Home /Agent Details</div>
<a class="pull-right user_name" href="javascript:history.back()">Back to List</a>


   
  
    
		<div class="col-md-12 col-sm-12 ">
			
			<div class="Main_containner">

<!--Inner wrapper stsrt here-->
<div class="inner_wrapper">




<h1>Agent Registration<span> Details</span></h1>

<span class="pull-right user_name">Ack Number :<b>
						${agent.applicationNo }</b></span>
						<br>
				<span class="pull-right user_name">Company / Firm Name :<b> ${agent.agentDetailsModel.firmName}</b></span><br>
<div class="border"><div class="orange"></div><div class="black"></div></div>



<!-----------------------------Tab start here--------------------------------->

	<div class="tab_main">
		
		  <ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#home">Agent Detail</a></li>
			
			<li><a data-toggle="tab" href="#menu2">Uploaded Documents</a></li>
			<li><a data-toggle="tab" href="#menu3">	Payment</a></li>
			<li><a data-toggle="tab" href="#menu4">Enquiry Details</a></li>
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
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Certificate<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${agent.agentDetailsModel.firmCertificatDoc.documentId}' >${agent.agentDetailsModel.firmCertificatDoc.fileName}</a>  </p></div>
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
		
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Director Photograph<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${agent.agentDetailsModel.photograph.documentId}' >${agent.agentDetailsModel.photograph.fileName}</a></p></div>
		
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
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${obj.certificateDoc.documentId}' >${obj.certificateDoc.fileName }</a></p></div>
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
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${agent.agentDetailsModel.regUploadDetailsModel.addressProofPath.documentId}'> ${agent.agentDetailsModel.regUploadDetailsModel.addressProofPath.fileName }</a> </p></div>
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
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agent.agentDetailsModel.k2PaymentDetailsModel.paymentMode}</p></div> 
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Unique Token Number<span class="space_LR">:</span></p></div>
		
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agent.agentDetailsModel.k2PaymentDetailsModel.paymentToken}  </p></div>
	</div>
	
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Amount<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agent.agentDetailsModel.k2PaymentDetailsModel.amount} </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Khajane2 Challan Number <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agent.agentDetailsModel.k2PaymentDetailsModel.k2ReferenceNumber} </p></div>
	</div>
	
	
	<%-- <div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right"><span class="space_LR"></span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p> </p></div>
	 <div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Online Payment Receipt<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${agent.agentDetailsModel.regPaymentDetailsModel.attachScanCopy.documentId}'>${agent.agentDetailsModel.regPaymentDetailsModel.attachScanCopy.fileName} </a></p></div>
		</div> --%>
		
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
	
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Transaction No.<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agent.agentDetailsModel.regPaymentDetailsModel.online.transactionNo} </p></div>
	
	</div>
	
		
	</c:if>
</div>
	

</div>
    <br>
    
      <div id="menu4" class="tab-pane fade">
                        <div class="inner_wrapper">
                            <div class="panel-group" id="accordion">
                                <c:if test="${agent.enquiryList !=null}">
                                    <c:forEach items="${agent.enquiryList}" var="enq">
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a data-toggle="collapse" data-parent="#accordion" href="#${enq.enquiryId}">
                                                        <h1>
                                                            Enquiry sent on
                                                            <fmt:formatDate pattern="dd-MM-yyyy" value="${enq.createdOn.getTime()}" />
                                                            <c:if test="${enq.raisedBy.userName !=null}">
                                                                <span>by ${enq.raisedBy.userName}</span>
                                                            </c:if>
                                                        </h1>
                                                    </a>
                                                </h4>
                                            </div>
                                            <div id="${enq.enquiryId}" class="panel-collapse collapse in">
                                                <div class="panel-body">
                                                    Subject: ${enq.subject}<br>
                                                    <br> ${enq.enquiryText}
                                                    <br>
                                                    <c:if test="${enq.replyText !=null}">
                                                        <br>
                                                        <b>Reply Received:</b><br> ${enq.replyText}
                                                    </c:if>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </c:if>
                            </div>
                        </div>
                    </div>
                    <br>

     
	
</form>
    </div>
  </div>
		
	</div>

		<table id="remarksTable" border="2">
			<tr>
				<th style="width: 33%" colspan="3">Operator Remarks</th>
				<th style="width: 33%" colspan="2">Secretary Remarks</th>
				<!-- <th style="width: 33%" colspan="2">Chairman Remaks</th> -->
			</tr>
			<tr>
				<th>Verified By</th>
				<th>Document Status</th>
				<th>Remarks</th>
				<th>Verified By</th>
				<th>Remarks</th>

				<!--  <th>Verified By</th>
                          <th>Document Status</th> 
                           <th>Remarks</th> -->
			</tr>
			<tr>
				<td>${agent.operator.loginId}</td>
				<td>${agent.documentStatus}</td>
				<td>${agent.operatorRemarks}</td>

				<td>${agent.authorityUser.loginId}</td>
				<td>${agent.authorityRemarks }</td>
			</tr>
		</table>
		<br>
<form name="approvalForm" id="approvalFormID" autocomplete="off" action="fowardAgentRegistration" class="form-horizontal"  method="post" >
	<%=ReraSecurity.writeToken(request)%>
<input type='hidden' name='AGENT_ID' value="${agent.agentRegistrationID}" />
  <input type='hidden' name='STATUS' />
	
	  <c:if test="${agent.status=='PENDING_OPERATOR'}">
	<div class="form-group">
	<label for="inputEmail3" class="col-sm-3 control-label"> Document Status: </label>
				<div class="col-sm-3">
				<select name="DOCS_STATUS" id="docsStatusID" class="form-control requiredValFld" >
				<option value="0"> --Select-- </option>
				<option value="All Document Matched"> All Document Matched </option>
				<option value="Document Not Matched"> Document Not Matched </option>
				</select>
				<span class='requiredValFldMsg'> Please select document status.</span>
				</div>
		<label for="inputEmail3" class="col-sm-2 control-label"> Forward To: </label>
				<div class="col-sm-3">
			
				<select name="ASSIGN_TO" id="znToApp" class="form-control requiredValFld" >
				<option value="0"> --Select-- </option>
				<c:forEach items="${userList }" var="zn">
				<option value="${zn.userId }"> ${zn.userName} </option>
				</c:forEach>
				</select>
				<span class='requiredValFldMsg'> Please select Authority User.</span>
					</div>
				
			
		
	</div>
	
	<div class="form-group">
	<label for="inputEmail3" class="col-sm-3 control-label">Remarks: </label>
				<div class="col-sm-3">
			
				<textarea name="REMARKS" id="oprRemarksID" class="form-control requiredValFld" rows="8" cols="80"></textarea>
				<span class='requiredValFldMsg'> Please enter Remarks.</span>
				</div>
		
				
			
		
	</div>
	<br/><br/><br/><br/>
<div class="button-wrapper">
   
   
   
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   <input name="btn1" class="btn-style" value="Forward" type="button"  onclick="submitTrxForm('FORWARD')" /></div>
</c:if>


</form>



	
	
	
	

	</div>
<!--inner container end here-->
<script>
function submitTrxForm(_out){
	var frm=$('#approvalFormID');
	if(validateForm(frm)){
document.approvalForm.STATUS.value=_out;
if(_out=='REJECTED'){
if(confirm('Are you sure reject this application?')){
//document.approvalForm.submit();

}
}
else{
if(confirm('Are you sure forward this application?')){
document.approvalForm.submit();

}}
}
}
</script>




</div>
			
	
	
	


<!-- container end here-->

