

<%@page import="in.gov.rera.common.security.ReraSecurity"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<style>
span#value {
    position: relative;
    top: 6px;
}

</style> 

<div class="breadcrumb">Home /Complaint Registration Details</div>
<a class="pull-right user_name" href="javascript:history.back()">Back to List</a>


   
  
    
		<div class="col-md-12 col-sm-12 ">
			
			<div class="Main_containner">

<!--Inner wrapper stsrt here-->
<div class="inner_wrapper">




<h1>Complaint Registration<span> Details</span></h1>

<span class="pull-right user_name">Ack Number :<b>
						${complaintModel.complaintNo}</b></span>
						<br>
				<span class="pull-right user_name"> Name :<b> ${complaintModel.applicateName}</b></span><br>
<div class="border"><div class="orange"></div><div class="black"></div></div>



<!-----------------------------Tab start here--------------------------------->

	<div class="tab_main">
		
		  <ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#home">Complaint Details</a></li>
			<li><a data-toggle="tab" href="#menu2">Enquiry Details</a></li>
		  </ul>



 <div class="tab-content">
    <div id="home" class="tab-pane fade in active">
 
     <form class="form-horizontal">
     
    <br>

     <div class="col-md-12">
     <h1>Complaint <span> Detail</span></h1>
     <div class="drop_shadow"></div>
	 </div>
 
  		<div class="row">
						<div class="col-md-3 col-sm-6 col-xs-6">
							<p class="text-right">
								Name of Complainant <span class="space_LR">:</span>
							</p>
						</div>
						<div class="col-md-3 col-sm-6 col-xs-6">
							<p>${complaintModel.applicateName}</p>
						</div>
						<div class="col-md-3 col-sm-6 col-xs-6">
							<p class="text-right">
								Telephone Number <span class="space_LR">:</span>
							</p>
						</div>
						<div class="col-md-3 col-sm-6 col-xs-6">
							<p>${complaintModel.applicatePhoneNo}</p>
						</div>


					</div>


					<div class="row">
						<div class="col-md-3 col-sm-6 col-xs-6">
							<p class="text-right">
								Mobile Number <span class="space_LR">:</span>
							</p>
						</div>
						<div class="col-md-3 col-sm-6 col-xs-6">
							<p>${complaintModel.applicateMobileNo}</p>
						</div>
						<div class="col-md-3 col-sm-6 col-xs-6">
							<p class="text-right">
								Email Address<span class="space_LR">:</span>
							</p>
						</div>
						<div class="col-md-3 col-sm-6 col-xs-6">
							<p id ="compId">${complaintModel.applicateEmailId}</p>
						</div>
					</div>
				<div class="row">
					<div class="col-md-3 col-sm-6 col-xs-6">
						<p class="text-right">
							Aadhaar No<span class="space_LR">:</span>
						</p>
					</div>
					<div class="col-md-3 col-sm-6 col-xs-6">
						<p>${complaintModel.applicateAdharNo}</p>
					</div>
					<div class="col-md-3 col-sm-6 col-xs-6">
						<p class="text-right">
							Aadhaar Card attachment<span class="space_LR">:</span>
						</p>
					</div>
					 <div class="col-md-3 col-sm-6 col-xs-6">
					
						 <p><a href='<%=request.getContextPath() %>/download?DOC_ID=${complaintModel.AAdharCardPath.documentId}'>${complaintModel.AAdharCardPath.fileName }</a></p> 
						
					</div> 
					
					<%--  <c:forEach items="${complaintModel.docList}" var="obj">
						<div class="row">
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p><a href='<%=request.getContextPath() %>/download?DOC_ID=${obj.documentId}'>${obj.fileName }</a></p>
							</div>
						</div>
                    </c:forEach> --%>
				</div>


				<div class="inner_wrapper">
						<h2>Official/ Residential Address</h2>
						<br>

						<div class="row">
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p class="text-right">
									Address line 1 <span class="space_LR">:</span>
								</p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p>${complaintModel.applicateResAddressLine1}</p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p class="text-right">
									Address line 2 <span class="space_LR">:</span>
								</p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p>${complaintModel.applicateResAddressLine2}</p>
							</div>

						</div>



						<div class="row">
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p class="text-right">
									State<span class="space_LR">:</span>
								</p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p>${complaintModel.appResdistrictModel.stateUtModel.stateUtName}</p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p class="text-right">
									District<span class="space_LR">:</span>
								</p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p>${complaintModel.appResdistrictModel.districtName}</p>
							</div>

						</div>

						<div class="row">
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p class="text-right">
									Pin Code<span class="space_LR">:</span>
								</p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p>${complaintModel.applicateResPinCode}</p>
							</div>

						</div>





					</div>




					<div class="inner_wrapper">

						<div class="form-group">
							<div class="col-md-12">
								<h2>Address for Service of All Notices</h2>
							</div>




						</div>

						<div class="row">
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p class="text-right">
									Address line 1 <span class="space_LR">:</span>
								</p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p>${complaintModel.applicateResSameAsAddressLine1}</p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p class="text-right">
									Address line 2 <span class="space_LR">:</span>
								</p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p>${complaintModel.applicateResSameAsAddressLine2}</p>
							</div>

						</div>



						<div class="row">
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p class="text-right">
									State<span class="space_LR">:</span>
								</p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p>${complaintModel.appResSameAsdistrictModel.stateUtModel.stateUtName}</p>

							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p class="text-right">
									District<span class="space_LR">:</span>
								</p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p>${complaintModel.appResdistrictModel.districtName}</p>

							</div>

						</div>

						<div class="row">
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p class="text-right">
									Pin Code<span class="space_LR">:</span>
								</p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p>${complaintModel.applicateResSameAsPinCode}</p>


							</div>

						</div>





					</div>



				



				<div class="inner_wrapper">

					<h1>
						Details of the <span>Respondent</span>
					</h1>
					<div class="drop_shadow"></div>
					<div class="clearfix"></div>



					<div class="row">
						<div class="col-md-3 col-sm-6 col-xs-6">
							<p class="text-right ">
								Name of Respondent<span class="space_LR">:</span>
							</p>
						</div>
						<div class="col-md-3 col-sm-6 col-xs-6">

							<p class="text-view">${complaintModel.respondentName}</p>

						</div>
						<div class="col-md-3 col-sm-6 col-xs-6">
							<p class="text-right">
								Telephone Number<span class="space_LR">:</span>
							</p>
						</div>
						<div class="col-md-3 col-sm-6 col-xs-6">
							<p>${complaintModel.respondentPhoneNo}</p>
						</div>
					</div>


					<div class="row">
						<div class="col-md-3 col-sm-6 col-xs-6">
							<p class="text-right ">
								Mobile Number<span class="space_LR">:</span>
							</p>
						</div>
						<div class="col-md-3 col-sm-6 col-xs-6">
							<p class="text-view">${complaintModel.respondentMobileNo}</p>
						</div>
						<div class="col-md-3 col-sm-6 col-xs-6">
							<p class="text-right ">
								Email Address<span class="space_LR">:</span>
							</p>
						</div>
						<div class="col-md-3 col-sm-6 col-xs-6">
							<p class="text-view" id="resId">${complaintModel.respondentEmailId}</p>
						</div>

					</div>
					
					<div class="row">
						<div class="col-md-3 col-sm-6 col-xs-6">
							<p class="text-right ">
								Project Name<span class="space_LR">:</span>
							</p>
						</div>
						<div class="col-md-3 col-sm-6 col-xs-6">
							<p class="text-view">${complaintModel.projectName}</p>
						</div>
						
						<div class="col-md-3 col-sm-6 col-xs-6">
							<p class="text-right ">
								Project Registration No:<span class="space_LR">:</span>
							</p>
						</div>
						<div class="col-md-3 col-sm-6 col-xs-6">
							<p class="text-view">${complaintModel.applicationNo}</p>
						</div>

					</div>
					
					<div class="row">
						<div class="col-md-3 col-sm-6 col-xs-6">
							<p class="text-right ">
								Promoter Name<span class="space_LR">:</span>
							</p>
						</div>
						<div class="col-md-3 col-sm-6 col-xs-6">
							<p class="text-view">${complaintModel.promoterName}</p>
						</div>
				</div>
						




					<div class="inner_wrapper">
						<h2>Official/ Residential Address</h2>
						<br>



						<div class="row">
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p class="text-right">
									Address line 1 <span class="space_LR">:</span>
								</p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p>${complaintModel.respondentResAddressLine1}</p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p class="text-right">
									Address line 2 <span class="space_LR">:</span>
								</p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p>${complaintModel.respondentResAddressLine2}</p>
							</div>

						</div>



						<div class="row">
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p class="text-right">
									State<span class="space_LR">:</span>
								</p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p>${complaintModel.respondentdistrictModel.stateUtModel.stateUtName}</p>

							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p class="text-right">
									District<span class="space_LR">:</span>
								</p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p>${complaintModel.respondentdistrictModel.districtName}</p>

							</div>

						</div>

						<div class="row">
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p class="text-right">
									Pincode<span class="space_LR">:</span>
								</p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p>${complaintModel.respondentResPinCode}</p>

							</div>

						</div>








					</div>




					<div class="inner_wrapper">

						<div class="form-group">
							<div class="col-md-12">
								<h2>Address for Service of All Notices</h2>
							</div>
						</div>


						<div class="row">
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p class="text-right">
									Address line 1 <span class="space_LR">:</span>
								</p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p>${complaintModel.respondentResSameAsAddressLine1}</p>

							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p class="text-right">
									Address line 2 <span class="space_LR">:</span>
								</p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p>${complaintModel.respondentResSameAsAddressLine2}</p>

							</div>

						</div>



						<div class="row">
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p class="text-right">
									State<span class="space_LR">:</span>
								</p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
						<p>${complaintModel.appResSameAsdistrictModel.stateUtModel.stateUtName}</p>

							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p class="text-right">
									District<span class="space_LR">:</span>
								</p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p>${complaintModel.appResSameAsdistrictModel.districtName}</p>

							</div>

						</div>

						<div class="row">
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p class="text-right">
									Pincode<span class="space_LR">:</span>
								</p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
							<p>${complaintModel.respondentResSameAsPinCode}</p>
							
								
							</div>

						</div>










					</div>



					<div class="inner_wrapper">

						<div class="form-group">
							<div class="col-md-12">
								<h1>
									Details of the <span>Complaint</span>
								</h1>
								<div class="drop_shadow"></div>
							</div>

						</div>

						<div class="row">
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p class="text-right">
									Subject of Complaint <span class="space_LR">:</span>
								</p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p>${complaintModel.complaintSubject}</p>
							</div>

						</div>



						<div class="row">
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p class="text-right">
									Facts of Complaints<span class="space_LR">:</span>
								</p>
							</div>
							<div class="col-md-9 col-sm-9 col-xs-9">
								<p>${complaintModel.complaintSummary}</p>
							</div>

						</div>


						<div class="row">
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p class="text-right">
									Relief Sought from RERA <span class="space_LR">:</span>
								</p>
							</div>
							<div class="col-md-9 col-sm-9 col-xs-9">
								<p>${complaintModel.reliefSoughtfromRera}</p>
							</div>

						</div>


						<div class="row">
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p class="text-right">
									Interim Order Required<span class="space_LR">:</span>
								</p>
							</div>
							<div class="col-md-9 col-sm-9 col-xs-9">
								<p>${complaintModel.interimOrderPrayed}</p>
							</div>

						</div>



					</div>
					
					
					
					
						<div class="inner_wrapper">

						<div class="form-group">
							<div class="col-md-12">
								<h1>
									Payment<span> Details</span>
								</h1>
								<div class="drop_shadow"></div>
							</div>

						</div>


						<div class="row">
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p class="text-right">
									Payment Mode <span class="space_LR">:</span>
								</p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p>${complaintModel.k2PaymentDetailsModel.paymentMode}</p>
							</div>

						</div>



						<div class="row">
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p class="text-right">
									Unique Token Number<span class="space_LR">:</span>
								</p>
							</div>
							<div class="col-md-9 col-sm-9 col-xs-9">
								<p>${complaintModel.k2PaymentDetailsModel.paymentToken}</p>
							</div>

						</div>


						<div class="row">
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p class="text-right">
									Amount (INR) <span class="space_LR">:</span>
								</p>
							</div>
							<div class="col-md-9 col-sm-9 col-xs-9">
								<p>${complaintModel.k2PaymentDetailsModel.amount}</p>
							</div>

						</div>


						<div class="row">
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p class="text-right">
									Khajane2 Challan Number <span class="space_LR">:</span>
								</p>
							</div>
							<div class="col-md-9 col-sm-9 col-xs-9">
								<p>${complaintModel.k2PaymentDetailsModel.k2ReferenceNumber}</p>
							</div>

						</div>
						
						<%-- <div class="row">
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p class="text-right">
									Online Payment Receipt<span class="space_LR">:</span>
								</p>
							</div>
							<div class="col-md-9 col-sm-9 col-xs-9">
								<p><a href='<%=request.getContextPath() %>/download?DOC_ID=${complaintModel.complaintPaymentDetailsModel.attachScanCopy.documentId}'>${complaintModel.complaintPaymentDetailsModel.attachScanCopy.fileName }</a></p>
							</div>

						</div> --%>
						

					</div>
					



					<div class="inner_wrapper">
                    
						<div class="form-group">
							<div class="col-md-12">
								<h1>
									<span>Attachments</span>
								</h1>
								<div class="drop_shadow"></div>
							</div>

						</div>
                		 <c:forEach items="${complaintModel.docList}" var="obj">
				
						<div class="row">
							
                        	<div class="col-md-3 col-sm-6 col-xs-6">
								<p class="text-right">
									Attachment <span class="space_LR">:</span>
								</p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p><a href='<%=request.getContextPath() %>/download?DOC_ID=${obj.documentId}'>${obj.fileName }</a></p>
							</div>


						</div>
                    </c:forEach>

					</div>
						


</div>
					<div class="inner_wrapper">

						<h1>
							<span>Declarations</span>
						</h1>
						<div class="drop_shadow"></div>



						<ul>

							<li>I, complainant, here by declare that the subject matter
								of the above claim falls within the Jurisdiction of the
								Authority</li>
							<li>I, complainant, here by declare that the matter
								regarding which the complaint has been made is not pending
								before any Court of Law or any other Authority or any other
								Tribunal(s)</li>
							<li>I verify that the contents of the above sections are
								true to my personal knowledge and belief and I have not
								suppressed any material fact(s)</li>


						</ul>





					</div>


 </div>
     
    
    <br>
    
      <div id="menu2" class="tab-pane fade">
                        <div class="inner_wrapper">
                            <div class="panel-group" id="accordion">
                                <c:if test="${complaintModel.enquiryList !=null}">
                                    <c:forEach items="${complaintModel.enquiryList}" var="enq">
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
                                
                                <c:if test="${complaintModel.enquiryList ==null || empty complaintModel.enquiryList}">
                                <h1>No Enquiry data available</h1>
                                </c:if>
                            </div>
                        </div>
                    </div>
                    
                  
                    <br>
 </div>
	

 
		
	

		<%=ReraSecurity.writeToken(request) %>
<input type='hidden' name='COMPLAINT_ID' value="${complaintModel.compId}" />
  <input type='hidden' name='STATUS' />
  <br><br>
  
  <!-- <label for="inputEmail3" class="col-sm-3 control-label"> Send Enquiry To:</label>
	
	<div class="radio">
							<label> <input type="radio" name="enquiryOn"  class="requiredValFld" id="optionsRadios1" value="RESPONDENT" > Respondent
							<span class='requiredValFldMsg'> Please select Send Enquiry To.</span>
							</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label>
							<input	type="radio" name="enquiryOn"  class="requiredValFld" id="optionsRadios2" value="COMPLAINANT">Complainant 
							</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label>
							<input	type="radio" name="enquiryOn"  class="requiredValFld" id="optionsRadios3" value="BOTH">Both 
							</label>
							</div> -->
  
	<div class="form-group">
		<label for="inputEmail3" class="col-sm-3 control-label"> Remarks:</label>
				<div class="col-sm-3">
				<textarea name="REMARKS" class="form-control input-sm requiredValFld" ></textarea>
				<span class='requiredValFldMsg'> Please enter your remark.</span>
				</div>
				
			
		
	</div>
	
	<input type='hidden' name='enquiryOn' value="${complaintModel.enquiryOn}" />
	
	<br/><br/><br>
<div class="button-wrapper">
   
   <!-- editAgentUploadDoc -->
<!--    <input name="btn1"  class="btn-style" id="editDocButton" value="Forward" type="button" onclick="submitTrxForm('FORWARD')"/> -->
   
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   <input name="btn1" class="btn-style" value="Enquiry" type="button"  data-toggle="modal" data-target="#myModal" />
     
     
   
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   
   <!--  <input name="btn1" class="btn-style" value="Enquiry On Complainent" type="button"  data-toggle="modal" data-target="#CompmyModal" />   --> 
     
   <!-- <input name="btn1" class="btn-style" value="Move to Approval Queue" type="button" 
									onclick="submitTrxForm('PREPARE_APPROVAL')" /> --></div>








			</form>

  </div>

</div>

		</div>
	</div>
	<!--inner container end here-->


	<!-- container end here-->
   <div hidden>
                            <c:forEach items="${template}" var="templateText">
                                <textarea id="tmp${templateText.templateId}" rows="1" cols="1"> <c:out
			value="${templateText.templateContent}" /> </textarea>
                            </c:forEach>

                        </div>
	
	

           <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
         
        </div>
        <div class="modal-body">
        
			<form class="form-horizontal" action="sendComplaintRegEnquiry"  id="enquiryForm" 	 method="post" name='enquiryForm'>
       
                                                <%=ReraSecurity.writeToken(request)%>
                                                   <input type='hidden' name='COMPLAINT_ID' value="${complaintModel.compId}" />
                                                   
                                                    <div class="inner_wrapper"> 



                                                        <br> <br>

                                                        <h1>
                                                            Details of the <span>Enquiry</span>
                                                        </h1>
                                                        <div class="drop_shadow"></div>
                                                        <div class="clearfix"></div>
<br>

<label for="inputEmail3" class="col-sm-3 control-label"> Send Enquiry To:</label>
	
	<div class="radio">
							<label> <input type="radio" name="enquiryOn"  class="requiredValFld" id="optionsRadios1" value="RESPONDENT" > Respondent
							<span class='requiredValFldMsg'> Please select Send Enquiry To.</span>
							</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label>
							<input	type="radio" name="enquiryOn"  class="requiredValFld" id="optionsRadios2" value="COMPLAINANT">Complainant 
							</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label>
							<input	type="radio" name="enquiryOn"  class="requiredValFld" id="optionsRadios3" value="BOTH">Both 
							</label>
							</div><br/>
							
							<div class="row">
							
							<div class="form-group" id="dispmailId" style="display: none">
							               <label  class="col-sm-3 control-label">
									Email ID : 
								</label>
                                                            <div class="col-sm-6">
                                                                <span id="value"></span> 
                                                            </div>
                                                       </div>
                                                       </div>
                                    
                                 			<!-- <span id="value"></span> -->
                                 			
                                 			<!-- <div class="form-group" id="dispmailId" style="display: none">
                                 			<div  class="col-sm-3 control-label">
                                               <label> Email Id : </label>
                                            </div>  
                                               <span id="value"></span> 
                                           
                               
                                                        </div>-->
                                 			
                                 			
                                 			
                                    <%-- <input type="text" name='enquiryOn' value="${complaintModel.enquiryOn}" readonly="readonly" /> --%>
                                    
                                   
                                    <%-- <span id="emailId">${complaintModel.getRespondentEmailId()}</span>
                                    
                                
                                      <span id="emailId">${complaintModel.getApplicateEmailId()}</span> --%>
                                    

                                        <div class="form-group">
                                               <label for="inputEmail3" class="col-sm-3 control-label">
									Subject : <sup>*</sup>
								</label>
                                                            <div class="col-sm-6">
                                                               <input type="text" name="subject"
										value="RERA Karnataka:  Enquiry on Complaint Application No : ${complaintModel.complaintNo }"
										class="form-control input-sm" maxlength="200" />
                                                            </div>
                                                        </div>

                                              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;          <div class="form-group">
                                                           
                                                            
                                                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   
                                                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; 
                                                             <c:forEach items="${template}" var="tempText">
                                                               
                                                               <input type="radio" name="re" value="v1" onclick="templateFun(${tempText.templateId})"> ${tempText.templateText}
                                                                </c:forEach>
								 
								
                                                               
                                                            <br>
                                                            
                                                            
                                                            
                                      <div class="form-group">
                                               <label for="inputEmail3" class="col-sm-3 control-label">
									<!-- Subject <sup>*</sup> -->
								</label>
                                                            <div class="col-sm-6">
                                                               <textarea id="textareaId1" name="summary" rows="7" class="form-control requiredValFld input-sm"> 
					 		    	</textarea>
                                                            </div>
                                                        </div>
                                                            
                                                            

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
                            
                            
      


</body>
</html>

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
$(document).ready(function(){
$("input[type='radio']").change(function(){
	var selected = $("input[type='radio']:checked");
	var selradio=selected.val();

	var respId=$("#resId").text();
	 var compId=$("#compId").text();	

		
		if(selradio=="RESPONDENT")
		    {
			   $("#dispmailId").css("display","block");
			   $("#value").text(respId);
			
			}
			else if(selradio=="COMPLAINANT")
			{
				$("#dispmailId").css("display","block");
				$("#value").text(compId);
				
			}
			else
			{
				$("#dispmailId").css("display","block");
				$("#value").html(respId + " , "+ compId);
			}
				
			$("#selectedval").text(selradio);

		});

});





</script>

  <script>

                          
                            function checkenqVal() {

                                if (!(document.getElementById('Accounts').checked)) {
                                    alert("Please select authority to forward");
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
                                    alert("Please enter remarks for authority");
                                    return false;
                                }
                                return true;
                            }

                            function sendEnquiry() {
                             /*  if (!checkenqVal())
                                    return;  */

                                var _frm = $("#enquiryForm");
                                if (validateForm(_frm)) {
                                    $(_frm).submit();
                                }
                            }
                            
                          
                        </script>
		