<%@page import="in.gov.rera.common.security.ReraSecurity"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html >
<html>
<head>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script
	src="<%=request.getContextPath()%>/resources/complaintjs/complaint.js"></script>

	




</head>

<body>
	<form:form action="saveComplaint" method="post"
		cssClass="form-horizontal" id="complaint" autocomplete="off"
		commandName="complaintModel" name="paymenttrxForm11"
		enctype="multipart/form-data">
		<%=ReraSecurity.writeToken(request)%>

		<!--Banner-->


		<div class="breadcrumb">Home / Real Estate Complaint
			Registration</div>


		<!--News Ticker-->
		<div class="container">
		
		<div class="stepwizard col-md-offset-1">
    <div class="stepwizard-row setup-panel">
     
      <div class="stepwizard-step fill">
        <a href="#step-1" type="button" class="btn btn-success btn-circle">1</a>
        <p>Complaint Details</p>
      </div>
      
      <div class="stepwizard-step">
        <a href="#step-2" type="button" class="btn btn-success btn-circle">2</a>
        <p>Payment</p>
      </div>
      
    </div>
</div>

			<!--main container start here-->
			<div class="Main_containner comp">

				<!--Inner wrapper stsrt here-->
				<div class="inner_wrapper">



					<h1>Complaint Registration Form</h1>
					<div class="border">
						<div class="orange"></div>
						<div class="black"></div>
					</div>






					<div class="inner_wrapper">
						<h1>
							<span>Payment</span>
						</h1>
						<div class="drop_shadow"></div>
						<div class="clearfix"></div>

						
							





								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">
										
									</label>
									<div class="col-sm-3">



										<!-- <select name="paymentmode" id='paymentmode'
											onchange="choosepaymentmethod(this)"
											class="form-control requiredValFld">
											<option value="0">--Select--</option>
											<option value="Khajane2 Challan">Khajane2 Challan</option>
											<option value="NEFT">NEFT</option>
											<option value="RTGS">RTGS</option>

										</select> <span class='requiredValFldMsg'> Please select payment
											mode.</span> -->


									</div>

									<label for="inputEmail3"
										class="col-sm-2 control-label optionfld2"> </label>
									<!-- <div class="col-sm-3">
										1. For making online payment through Khajane II please <a
											href="https://k2.karnataka.gov.in/wps/portal/Khajane-II/Scope/Remittance/"
											target="_blank"> click here</a><br />
										<br /> 2. For NEFT/RTGS below is the details:-<br /> Account
										Name: Chairman, Real Estate Ragulatory Authority Karnataka <br />
										Account Number: 520101080940037 <br /> IFSC Code: CORP0000144
										<br /> Bank Name: Corporation Bank <br /> Branch: S.C. Road,
										Bangalore <br />

									</div> -->

								</div>
								
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">
										Complainant Name<sup></sup>
									</label>
									<div class="col-sm-3">

										<label for="inputEmail3" class="col-sm-6 control-label">
										${complainantname}<sup></sup>
									</label>

									</div>
								</div>
								
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">
										Amount (INR)<sup>*</sup>
									</label>
									<div class="col-sm-3">

										<input class="form-control input-sm" type="text" name="amount"
											readonly="readonly" value="1000" />

									</div>
									
							<c:if test="${paymentStatus=='PAYMENT_INITIATED'}">
									<label for="inputEmail3" class="col-sm-2 control-label optionfld2"> 
																	</label>
									<div class="col-sm-3 optionfld2">
							<a href="K2paymentPage?promoterName=${complainantname}&paymentToken=${paymentToken}&paymentType=COMPLAINT&amount=1" >
							<input name="online PAyment" class="btn-style" value="Click Here For Online Payment" type="button"/></a>
									</div>
							</c:if>
							<c:if test="${paymentStatus=='PAYMENT_FAILED'}">
									<label for="inputEmail3" class="col-sm-4 control-label optionfld2"> 
								<font color="red">Payment failed with reference number ${paymentReference}</font></label>
									<div class="col-sm-2 optionfld2">
							<a href="K2paymentPage?promoterName=${complainantname}&paymentToken=${paymentToken}&paymentType=COMPLAINT&amount=1" >
							<input name="online PAyment" class="btn-style" value="Reinitiate Payment" type="button"/></a>
									</div>
							</c:if>
							
							<c:if test="${paymentStatus=='PAYMENT_DONE'}">
				<label for="inputEmail3" class="col-sm-5 control-label optionfld2"><font color="green">Payment successful with reference number ${paymentReference}</font></label>
				</c:if>
				<c:if test="${paymentStatus=='PAYMENT_PENDING'}">
				<label for="inputEmail3" class="col-sm-3 control-label optionfld2">Payment pending with reference number ${paymentReference} <br/> please
				<a target="_blank" href="<%=request.getContextPath()%>/verifyChallan?challanrefNum=${paymentReference}">click here</a>
				to check the status</label>
				</c:if>
							
								</div>

								<!-- <div class="form-group optionfld2">
									<label for="inputEmail3" class="col-sm-3 control-label">
										Khajane2 Challan OR NEFT/RTGS Transaction Ref. Number<sup>*</sup>
									</label>
									<div class="col-sm-3">
										<span class='requiredValFldMsg'> Please enter Khajane2
											Challan OR NEFT/RTGS Transaction Ref. Number .</span> <input
											type="text" name="sbiTransactionRefNo"
											class="form-control requiredValFld input-sm" maxlength="50" />
									</div>


									<label class="col-sm-2 control-label"> Attach Online
										Payment Receipt<sup>*</sup>
									</label>
									<div class="col-sm-3">
										<input type="file" class="requiredValFld"
											name="attachScanCopy" id="exampleInputFile" rel="txtTooltip"
											title="Only image or pdf file is allowed. file size upto 1 MB"
											data-toggle="tooltip" data-placement="bottom"> <span
											class='requiredValFldMsg'> Please select Attach Online
											Payment Receipt.</span>

									</div>
								</div> -->


								<br>










						</div>
						<!--inner container end here-->

						<!-- <div class="inner_wrapper">

							<h1>
								<span>Declarations</span>
							</h1>
							<div class="drop_shadow"></div>

							<ul>

								<li><input type="checkbox" name="declaration1"
									id='declaration1' value="Y">&nbsp;&nbsp; I,
									complainant, here by declare that the subject matter of the
									above claim falls within the Jurisdiction of the Authority</li>
								<li><input type="checkbox" name="declaration2"
									id='declaration2' value="Y">&nbsp;&nbsp;I, complainant,
									here by declare that the matter regarding which the complaint
									has been made is not pending before any Court of Law or any
									other Authority or any other Tribunal(s)</li>
								<li><input type="checkbox" name="declaration3"
									id='declaration3' value="Y">&nbsp;&nbsp;I verify that
									the contents of the above sections are true to my personal
									knowledge and belief and I have not suppressed any material
									fact(s)</li>


							</ul>
						</div> -->


						<c:if test="${paymentStatus=='PAYMENT_DONE'}">
						<div class="button-wrapper">
						<!-- <input name="btn1" class="btn-style" value="Previous"
								onclick="submitCompalint()" type="button"> -->
							<a href="confirmComplaintPayment"><input name="btn1" class="btn-style" value="Submit" type="button"></a>
						</div>
						</c:if>



					</div>
					<!-- container end here-->

				</div>
			</div>
		</div>
	</form:form>
</body>
</html>