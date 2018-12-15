<%@page import="in.gov.rera.common.security.ReraSecurity"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<!--main container start here-->
	<div class="Main_containner comp">

<a class="pull-right user_name" href="javascript:history.back()">Back to List</a>
<br>
		<!--Inner wrapper stsrt here-->
		<div class="inner_wrapper">



			<h1>Complaint Application</h1>
			<div class="border">
				<div class="orange"></div>
				<div class="black"></div>
			</div>


			<form class="form-horizontal">




				<div class="inner_wrapper">
					<h1>
						Details of the <span>Complainant</span>
					</h1>
					<div class="drop_shadow"></div>
					<div class="clearfix"></div>




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
							<p>${complaintModel.applicateEmailId}</p>
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
							<p class="text-view">${complaintModel.respondentEmailId}</p>
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
								<p>${complaintModel.complaintPaymentDetailsModel.paymentMode}</p>
							</div>

						</div>



						<div class="row">
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p class="text-right">
									Unique Token Number<span class="space_LR">:</span>
								</p>
							</div>
							<div class="col-md-9 col-sm-9 col-xs-9">
								<p>${complaintModel.complaintPaymentDetailsModel.paymentToken}</p>
							</div>

						</div>


						<div class="row">
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p class="text-right">
									Amount (INR) <span class="space_LR">:</span>
								</p>
							</div>
							<div class="col-md-9 col-sm-9 col-xs-9">
								<p>${complaintModel.complaintPaymentDetailsModel.amount}</p>
							</div>

						</div>


						<div class="row">
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p class="text-right">
									Khajane2 Challan Number <span class="space_LR">:</span>
								</p>
							</div>
							<div class="col-md-9 col-sm-9 col-xs-9">
								<p>${complaintModel.complaintPaymentDetailsModel.sbiTransactionRefNo}</p>
							</div>

						</div>
						
						<div class="row">
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p class="text-right">
									Online Payment Receipt<span class="space_LR">:</span>
								</p>
							</div>
							<div class="col-md-9 col-sm-9 col-xs-9">
								<p><a href='<%=request.getContextPath() %>/download?DOC_ID=${complaintModel.complaintPaymentDetailsModel.attachScanCopy.documentId}'>${complaintModel.complaintPaymentDetailsModel.attachScanCopy.fileName }</a></p>
							</div>

						</div>
						

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



<%=ReraSecurity.writeToken(request) %>
<input type='hidden' name='COMPLAINT_ID' value="${complaintModel.compId}" />
  <input type='hidden' name='STATUS' />
  
  
  
	<div class="form-group">
		<label for="inputEmail3" class="col-sm-3 control-label"> Remarks:</label>
				<div class="col-sm-3">
				<textarea name="REMARKS" class="form-control input-sm requiredValFld" ></textarea>
				<span class='requiredValFldMsg'> Please enter your remark.</span>
				</div>
				
			
		
	</div>
	
	
	
	<br/><br/>
<!-- <div class="button-wrapper">
   
   editAgentUploadDoc
   <input name="btn1"  class="btn-style" id="editDocButton" value="Forward" type="button" onclick="submitTrxForm('FORWARD')"/>
   
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   <input name="btn1" class="btn-style" value="Enquiry" type="button"  data-toggle="modal" data-target="#myModal" />
     
     
   
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   
    <input name="btn1" class="btn-style" value="Enquiry On Complainent" type="button"  data-toggle="modal" data-target="#CompmyModal" />   
     
   <input name="btn1" class="btn-style" value="Move to Approval Queue" type="button" 
									onclick="submitTrxForm('PREPARE_APPROVAL')" /></div>
 -->







			</form>





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
	
	
	<%-- <div hidden>
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
 
</div>  --%>
	

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
														Authority L1 </label> <input type="checkbox" name="Accounts"
													value="Accounts" id="Accounts" />
												</span>
                                                                            <textarea name="accountsEnqAuthRemarks" id="accountsEnqAuthRemarks" class="form-control"> </textarea>
                                                                        </div>
                                                                        <div class="col-sm-2">
                                                                           

                                                                        </div>

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
<br>

<label for="inputEmail3" class="col-sm-3 control-label"> Enquiry On:</label>
	
	<div class="radio">
							<label> <input type="radio" name="enquiryOn"  class="requiredValFld" id="optionsRadios1" value="RESPONDENT" > Respondent
							<span class='requiredValFldMsg'> Please select Enquiry On.</span>
							</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label>
							<input	type="radio" name="enquiryOn"  class="requiredValFld" id="optionsRadios2" value="COMPLAINANT">Complainant 
							</label>
							</div><br/><br/><br>


                                        <div class="form-group">
                                               <label for="inputEmail3" class="col-sm-3 control-label">
									Subject <sup>*</sup>
								</label>
                                                            <div class="col-sm-6">
                                                               <input type="text" name="subject"
										value="RERA Karnataka:  Enquiry on Complaint Application No : ${complaintModel.complaintNo }"
										class="form-control input-sm" maxlength="200" />
                                                            </div>
                                                        </div>

                                              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;          <div class="form-group">
                                                           <!--  <label for="inputEmail3" class="col-sm-3 control-label">Enquiry<sup>*</sup><br><br> -->
                                                           <div class="col-md-3 ">

           												   <h1>
                                                           Insert Operator <span>Comments</span>
                                                        </h1>
                                                        <div class="drop_shadow"></div>
                                                        <div class="clearfix"></div>

									<button onclick="return pasteWithCursor('ac')" class="btn btn-sm">Authority L1</button> &nbsp&nbsp&nbsp&nbsp   
									<br>

								</div>
                                                            
                                                            
                                                             <c:forEach items="${template}" var="tempText">
                                                               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="re" value="v1" onclick="templateFun(${tempText.templateId})"> ${tempText.templateText}
                                                                </c:forEach>
								<!-- </label> -->
								
                                                               
                                                            <br>
                                                 <div class="col-sm-6">

                                                                <div>
                                                                    <textarea id="textareaId1" name="summary" rows="7" class="form-control requiredValFld input-sm"> 
					 		    	</textarea>
                                                                </div>

                                                                    <span class='requiredValFldMsg'> Please enter enquiry
										details</span>
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
                              if (!checkenqVal())
                                    return; 

                                var _frm = $("#enquiryForm");
                                if (validateForm(_frm)) {
                                    $(_frm).submit();
                                }
                            }
                            
                          
                        </script>
