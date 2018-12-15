<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<!--main container start here-->
	<div class="Main_containner comp">

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









			</form>





		</div>
	</div>
	<!--inner container end here-->


	<!-- container end here-->





</body>
</html>