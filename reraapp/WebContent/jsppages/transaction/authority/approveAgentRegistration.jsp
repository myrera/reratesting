

<%@page import="in.gov.rera.common.security.ReraSecurity"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
  <%@page import="in.gov.rera.common.model.UserModel"%>
<%@page import="in.gov.rera.common.util.ReraConstants"%>
   <%
   String roleAccess=(String)session.getAttribute(ReraConstants.ROLE_ACCESS);
	UserModel user = (UserModel) session.getAttribute(ReraConstants.SES_USER_ATTR);
%>


<div class="breadcrumb">Home /Agent Registration Details</div>
<a class="pull-right user_name" href="javascript:history.back()">Back to List</a>
  
    
		<div class="col-md-12 col-sm-12 ">
			
			<div class="Main_containner">

<form name="approvalForm" id="approvalFormId" autocomplete="off" action="approveAgentRegistration" method="post">
<!--Inner wrapper stsrt here-->
<div class="inner_wrapper">




<h1>Agent Registration<span> Detail</span></h1>
<span class="pull-right user_name">Ack Number :<b>
						${agent.applicationNo }</b></span>
						<br>
				<span class="pull-right user_name">Agent Name :<b> ${agent.agentDetailsModel.agentName}</b></span><br>
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
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agent.agentDetailsModel.agentIndividualAddressLine1} </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Address 2<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agent.agentDetailsModel.agentIndividualAddressLine2} </p></div>
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
			

     
  </div>



    <div id="menu2" class="tab-pane fade">
     
      
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

   
			
		
    </div>
    <div id="menu3" class="tab-pane fade">
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
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Khajane2 Challan Number <span class="space_LR">:</span></p></div>
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

     
    </div>
  </div>

	
		
	</div>

<br/>

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
			
			
			

			<%-- <div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Verified By<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agent.operator.loginId}</p></div>
	</div>
<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Document Status<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agent.documentStatus}</p></div>
	</div>
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Remarks<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agent.operatorRemarks}</p></div>
	</div> --%>
	
	<br/>
<%=ReraSecurity.writeToken(request) %>
<input type='hidden' name='AGENT_ID' value="${agent.agentRegistrationID}" />
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
  <% if(user.getLoginId()!=null && user.getLoginId().equals("rera.secretary")){%>
	   
<div class="button-wrapper">
 
   <!-- editAgentUploadDoc -->
 <!--   <input name="btn1"  class="btn-style" id="editDocButton" value="Forward" type="button" onclick="submitTrxForm('FORWARD')"/> -->
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   <input name="btn1" class="btn-style" value="Enquiry" type="button"  data-toggle="modal" data-target="#myModal" />
   
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   <input name="btn1" class="btn-style" value="Move to Approval Queue" type="button" 
									onclick="submitTrxForm('PREPARE_APPROVAL')" />

    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="btn1" class="btn-style" value="Reject" type="button" data-toggle="modal" data-target="#rejectModal"/>
   <input type='hidden' name='AGENT_REG_ID' value="${agent.agentRegistrationID }" /> 
    <input type='hidden' name='STATUS' /> <input type='hidden' name='TCP' /> 
    <input type='hidden' name='ENGG' /> 
    <input type='hidden' name='ACCOUNT' />                     
   <input name="btn3" class="btn-style" value="ReturnToOperator" type="button" onclick="returnTrxForm()" />
   </div>
   <%}else{ %>
   
   <%} %>
 <%}else{  %>
<div class="button-wrapper">
 
   <!-- editAgentUploadDoc -->
 <!--   <input name="btn1"  class="btn-style" id="editDocButton" value="Forward" type="button" onclick="submitTrxForm('FORWARD')"/> -->
   
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   <input name="btn1" class="btn-style" value="Enquiry" type="button"  data-toggle="modal" data-target="#myModal" />
   
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   <input name="btn1" class="btn-style" value="Move to Approval Queue" type="button" 
									onclick="submitTrxForm('PREPARE_APPROVAL')" />
   
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="btn1" class="btn-style" value="Reject" type="button" data-toggle="modal" data-target="#rejectModal"/>
    <input type='hidden' name='AGENT_REG_ID' value="${agent.agentRegistrationID }" /> 
    <input type='hidden' name='STATUS' /> <input type='hidden' name='TCP' /> 
    <input type='hidden' name='ENGG' /> 
    <input type='hidden' name='ACCOUNT' />                     
   <input name="btn3" class="btn-style" value="ReturnToOperator" type="button" onclick="returnTrxForm()" />
    <a href="<%=request.getContextPath()%>/agentCert?AID=${agent.agentRegistrationID}" target="_blank">
    <input name="btn1" class="btn-style" value="View Certificate" type="button"   /> </a>
  <!--  <button type="button" class="close" data-dismiss="modal">Close</button> -->
                                     
                                     
   </div>
  <%  }  %>





</form>



	
	
	
	

	</div>
<!--inner container end here-->

	   <div hidden>
                            <c:forEach items="${template}" var="templateText">
                                <textarea id="tmp${templateText.templateId}" rows="1" cols="1"> <c:out
			value="${templateText.templateContent}" /> </textarea>
                            </c:forEach>

                        </div>
	
	
	

<div hidden>
 	<c:choose>
	<c:when test="${not empty project.projectRemarks.remarksList}">
		<c:forEach items="${project.projectRemarks.remarksList}" var="remarks"  varStatus="loop">
		 <c:if test="${loop.last}"> 
		
		 	<textarea id="ac" rows="1" cols="1"> ${remarks.accountsOprRemarks} </textarea>
			
			 </c:if> 
		</c:forEach>
	</c:when>
		<c:otherwise>
		 	<textarea id="ac" rows="1" cols="1"></textarea>
			
		</c:otherwise>
	</c:choose>
	
	<%-- <% If(project.projectRemarks.remarksList  != null) {%>

<% for(int orderNum =0;i< orderList.size();++orderNum  ) { %>
   <li> <%= orderList.get(orderNum )%> </li>
<% } %>
<% }else{ %>
  No Order Found
<% } %> --%>
	
	
</div> 



        
        
           <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
         
        </div>
				<div class="modal-body">

					<form class="form-horizontal" action="sendAgentRegEnquiry"
						id="enquiryForm" method="post" name='enquiryForm'>

						<%=ReraSecurity.writeToken(request)%>
						<input type='hidden' name='AGENT_ID'
							value="${agent.agentRegistrationID}" />
						<div class="inner_wrapper">


							<h1>
								Enquiry related to <span>(Make one or more selections
									below)</span>
							</h1>
							<div class="drop_shadow"></div>
							<div class="clearfix"></div>

							<div class="enqsendto">

								<div class="form-group">
									<div class="row">
										<div class="col-sm-12">
											<div class="col-sm-2 col-sm-offset-2">
												<span class="pull-right"> <label for="inputEmail3"
													class="control-label" style="margin-right: 15px;">
														Operator </label> <input type="checkbox" name="Accounts"
													value="Accounts" id="Accounts" />
												</span>
												<textarea name="accountsEnqAuthRemarks"
													id="accountsEnqAuthRemarks" class="form-control"> </textarea>
											</div>
											<div class="col-sm-2"></div>

										</div>
									</div>
								</div>
							</div>


							<br> <br>

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
									<input type="text" name="subject"
										value="RERA Karnataka:  Enquiry on Agent Application No : ${agent.applicationNo }"
										class="form-control input-sm" maxlength="200" />
								</div>
							</div>

							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<div class="form-group">
								<!--  <label for="inputEmail3" class="col-sm-3 control-label">Enquiry<sup>*</sup><br><br> -->
								<div class="col-md-3 ">

									<h1>
										Insert Operator <span>Comments</span>
									</h1>
									<div class="drop_shadow"></div>
									<div class="clearfix"></div>

									<button onclick="return pasteWithCursor('ac')"
										class="btn btn-sm">Operator</button>
									&nbsp&nbsp&nbsp&nbsp <br>

								</div>


								<c:forEach items="${template}" var="tempText">
                                                               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
										type="radio" name="re" value="v1"
										onclick="templateFun(${tempText.templateId})"> ${tempText.templateText}
                                                                </c:forEach>
								<!-- </label> -->


								<br>
								<div class="col-sm-6">

									<div>
										<textarea id="textareaId1" name="summary" rows="7"
											class="form-control requiredValFld input-sm"> 
					 		    	</textarea>
									</div>

									<span class='requiredValFldMsg'> Please enter enquiry
										details</span>
								</div>



							</div>

						</div>

							<div class="button-wrapper">
							<input name="btn3" class="btn-style" value="Send Enquiry" type="button" onclick="sendEnquiry()" />
							<button type="button" class="close" data-dismiss="modal">Close</button>
						</div>


						
				</div>

				</form>

                                    </div>

                                </div>
                            </div>



</div>
		
		 <div class="pop_main">

                            <div class="modal fade" id="rejectModal" role="dialog">
                                <div class="modal-dialog">

                                    <!-- Modal content-->
                                    <div class="modal-content">
                                        <div class="modal-header">

                                            <button type="button" class="close" data-dismiss="modal">&times;</button>

                                        </div>
                                        <div class="modal-body">

                                            <form class="form-horizontal" action="rejectAgentRegistration" autocomplete="off" id="rejectForm" method="post" name='rejectForm'>
                                                <%=ReraSecurity.writeToken(request)%>
                                                    <input type="hidden" name="agentId" value="${agent.agentRegistrationID}">
                                                    <div class="inner_wrapper">


                                                        
                                                       

                                                       

                                                        <br> <br>

                                                        <h1>
                                                            Details of the <span>Rejection</span>
                                                        </h1>
                                                        <div class="drop_shadow"></div>
                                                        <div class="clearfix"></div>


                                                        <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-3 control-label">
									Subject <sup>*</sup>
								</label>
                                                            <div class="col-sm-6">
                                                                <input type="text" name="rejectSubject" value="RERA Karnataka: Rejected -  ${agent.agentDetailsModel.firmName} Ack Number : ${agent.applicationNo }" class="form-control input-sm" maxlength="200" />
                                                            </div>
                                                        </div>

                                                        <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-3 control-label">Reason<sup>*</sup>
								</label>
                                                            <div class="col-sm-6">

                                                                <div>
                                                                    <textarea id="reasonForRejection"  rows="7" class="form-control requiredValFld input-sm" name="reasonForRejection"> 
					 		    	</textarea>
                                                                </div>

                                                                    <span class='requiredValFldMsg'> Please enter Rejection
										details</span>
                                                            </div>
<!--
                                                            
-->
                                                        </div>

                                                    </div>
						<div class="button-wrapper">
							<input name="btn3" class="btn-style" value="Reject" type="button" onclick="submitTrxForm('REJECTED')" />
							<button type="button" class="close" data-dismiss="modal">Close</button>
						</div>
						</div>

                                        </form>

                                    </div>

                                </div>
                            </div>
                        </div>
  
			
	
	<script>
document.getElementById("textareaId1").value = document.getElementById("tmp1").value;	
</script>

  <script>
                            function templateFun(dataIs) {

                                document.getElementById("textareaId1").value = document.getElementById("tmp" + dataIs).value;
                            }
                        </script>

<script>
	function pasteWithCursor( idIs ) {
		var valueIs = document.getElementById( idIs ).value;
		var cursorPos = $('#textareaId1').prop('selectionStart');
		var v = $('#textareaId1').val();
		var textBefore = v.substring(0, cursorPos);
		var textAfter = v.substring(cursorPos, v.length);
		$('#textareaId1').val(textBefore + valueIs + textAfter);                                                    

		return false;
	};
</script>    



  <script>
                            function submitTrxForm(_out) {
                                document.approvalForm.STATUS.value = _out;
                                
                                if (_out == 'REJECTED') {
                        			if (confirm('Do you want to reject this application?')) {
                        				document.rejectForm.submit();

                        			}
                        		} 
                                else  if (_out == 'FORWARD') {
                                    if (confirm('Do you want to forward this application?')) {
                                        document.approvalForm.submit();

                                    }
                                } else {
                                    if (confirm('Are you sure that you want to approve this application?')) {
                                        if (confirm('Have you reconciled credit of fee in the RERA account against this application?')) {
                                        	document.approvalForm.action="prepareAgentRegistration";  
                                        	document.approvalForm.submit();

                                        }

                                    }
                                }
                            }

                            function setVal(chk) {
                                var nm = $(chk).val();
                                var ch = $(chk).prop('checked');
                                if (ch) {
                                    if (nm == 'account') {
                                        document.approvalForm.ACCOUNT.value = "OK";
                                    } else if (nm == 'revenue') {
                                        document.approvalForm.REVENUE.value = "OK";
                                    } else if (nm == 'tcp') {
                                        document.approvalForm.TCP.value = "OK";
                                    } else {
                                        document.approvalForm.ENGG.value = "OK";
                                    }
                                } else {
                                    if (nm == 'account') {
                                        document.approvalForm.ACCOUNT.value = "";
                                    } else if (nm == 'revenue') {
                                        document.approvalForm.REVENUE.value = "";
                                    } else if (nm == 'tcp') {
                                        document.approvalForm.TCP.value = "";
                                    } else {
                                        document.approvalForm.ENGG.value = "";
                                    }
                                }
                            }

                            function checkenqVal() {

                                if (!(document.getElementById('Accounts').checked)) {
                                    alert("Please select operator to forward");
                                    return false;
                                }

                                isValid = true;

                                isValid = checkRemarksEntry(
                                    document.getElementById('Accounts').checked, document
                                    .getElementById('accountsEnqAuthRemarks').value,
                                    "Account");


                                return isValid;
                            }

                          
                            function checkRemarksEntry(checkedBox, remarks, operatorName) {

                                if (checkedBox && remarks.trim().length == 0) {
                                    alert("Please enter remarks for operator");
                                    return false;
                                }
                                return true;
                            }

                            function sendEnquiry() {
                                if (!checkenqVal())
                                    return;

                                var _frm = $("#enquiryForm");
                                if (validateForm(_frm)) {
                                    $(_frm).submit();
                                }
                            }
                            
                            //added by renuka 
                            
                            function returnTrxForm() {
                                document.approvalForm.action = "returnAgentRegistration";
                                document.approvalForm.STATUS.value = "RETURN";
                                if (confirm('Do you want to return the application to the reviewer?')) {
                                    document.approvalForm.submit();

                                }
                            }

                            
                        </script>

                  
	


<!-- container end here-->




