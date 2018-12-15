<%@page import="in.gov.rera.common.security.ReraSecurity"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script src="<%=request.getContextPath() %>/resources/agentjs/agentJs.js"></script>
<script>
function choosepaymentmethod(slct){
	var val=$(slct).val();
	if(val=='Payment Gateway'){
	$(".optionfld2").each(function(){
		$(this).hide();
	});	
	document.paymenttrxForm1.action='agentRegPaymentGateway';
	}
	else{
		$(".optionfld2").each(function(){
			$(this).show();
		});
		document.paymenttrxForm1.action='agentRegPayment';
	}
}
</script>

<form:form class="form-horizontal" autocomplete="off" id="agenttrxForm1" action="agentRegPayment" name="paymenttrxForm1" method="POST"
 enctype="multipart/form-data" modelAttribute="agentRegistrationModel">
 	<%=ReraSecurity.writeToken(request) %>
 <form:hidden path="agentRegistrationID"/>
<div class="breadcrumb">Home / Real Estate Agent Registration</div>

<div class="container">
  
 
<div class="stepwizard col-md-offset-1">
    <div class="stepwizard-row setup-panel">
     
      <div class="stepwizard-step fill">
        <a href="#step-1" type="button" class="btn btn-success btn-circle">1</a>
        <p>Applicant Detail</p>
      </div>
      
      <div class="stepwizard-step fill">
        <a href="#step-2" type="button" class="btn btn-success btn-circle" >2</a>
        <p>Upload Documents </p>
      </div>
      
      <div class="stepwizard-step blank">
        <a href="#step-2" type="button" class="btn btn-success btn-circle" >3</a>
        <p>Payment </p>
      </div>
      
      <div class="stepwizard-step ">
        <a href="#step-3" type="button" class="btn btn-default btn-circle" disabled="disabled">4</a>
        <p>Confirmation</p>
      </div>
      
    </div>
  </div>
  
    
</div>
<!--News Ticker-->
<div class="container">

<!--main container start here-->
<div class="Main_containner">

<!--Inner wrapper start here-->
<div class="inner_wrapper">



<h1>Payment<span>Details</span></h1>
<div class="border">
<div class="orange"> </div>
<div class="black"></div></div>

        


				<div class="form-group">
				<label for="inputEmail3" class="col-sm-3 control-label"> <!-- Payment Mode<sup>*</sup> --></label>
						<div class="col-sm-3">
							<!-- <select name ="paymentmode" id='paymentmode' onchange="choosepaymentmethod(this)"
								class="form-control requiredValFld">
								<option value="0"> --Select-- </option>
								<option value="Khajane2 Challan" >Khajane2 Challan</option>
								<option value="NEFT" >NEFT</option>
								<option value="RTGS" >RTGS</option>
											</select>
					
					<span class='requiredValFldMsg'> Please select Payment Mode</span> -->
		
				</div>
				
				<label for="inputEmail3" class="col-sm-2 control-label optionfld2">  </label>
				<!-- <div class="col-sm-3">
	      1.  For making online payment through Khajane II please <a href="https://k2.karnataka.gov.in/wps/portal/Khajane-II/Scope/Remittance/" target="_blank"> click here</a><br/><br/>
					    2.  For NEFT/RTGS below is the details:-<br/>
					        Account Name:  Chairman, Real Estate Ragulatory Authority Karnataka     <br/>
					        Account Number: 520101080940037    <br/>
					        IFSC Code:     CORP0000144      <br/>
					        Bank Name:  Corporation Bank         <br/>
					        Branch:    S.C. Road, Bangalore          <br/> 
			
					
					</div> -->
	
	         </div>
	
	
		<div class="form-group">
		<label for="inputEmail3" class="col-sm-3 control-label"> Amount (INR)<sup>*</sup></label>
				<div class="col-sm-3">
				<c:choose>
				<c:when test="${agentRegistrationModel.registrationType=='FIRM_COMP_REG' }">
				<input class="form-control input-sm" type="text" name="amount" readonly="readonly" value="200000" />
				</c:when>
				<c:otherwise>
				<input class="form-control input-sm" type="text" name="amount"  readonly="readonly"  value="25000" />
				</c:otherwise>
				</c:choose>
				</div>
				
				<c:choose>
				<c:when test="${agentRegistrationModel.registrationType=='FIRM_COMP_REG' }">
				<c:if test="${paymentStatus=='PAYMENT_INITIATED'}">
				<label for="inputEmail3" class="col-sm-2 control-label optionfld2"> </label>
				<div class="col-sm-3 optionfld2">
				<a href="K2paymentPage?promoterName=${agentname}&paymentToken=${paymentTokenNo}&paymentType=AGENT_REG&amount=1">
<input name="online PAyment" class="btn-style" value="Click Here For Online Payment" type="button"/></a>
				</div>
				</c:if>
				<c:if test="${paymentStatus=='PAYMENT_FAILED'}">
				<label for="inputEmail3" class="col-sm-4 control-label optionfld2"><font color="red">Payment failed with reference number ${paymentReference}</font></label>
				<div class="col-sm-2 optionfld2">
				<a href="K2paymentPage?promoterName=${agentname}&paymentToken=${paymentTokenNo}&paymentType=AGENT_REG&amount=1">
<input name="online PAyment" class="btn-style" value="Reinitiate Payment" type="button"/></a>
				</div>
				</c:if>
				</c:when>
				
				<c:otherwise>
				<c:if test="${paymentStatus=='PAYMENT_INITIATED'}">
				<label for="inputEmail3" class="col-sm-2 control-label optionfld2"> </label>
				<div class="col-sm-3 optionfld2">
				<a href="K2paymentPage?promoterName=${agentname}&amount=1&paymentToken=${paymentTokenNo}&paymentType=AGENT_REG">
<input name="online PAyment" class="btn-style" value="Click Here For Online Payment" type="button"/></a>
				</div>
				</c:if>
				<c:if test="${paymentStatus=='PAYMENT_FAILED'}">
				<label for="inputEmail3" class="col-sm-4 control-label optionfld2"><font color="red">Payment failed with reference number ${paymentReference}</font></label>
				<div class="col-sm-2 optionfld2">
				<a href="K2paymentPage?promoterName=${agentname}&amount=1&paymentToken=${paymentTokenNo}&paymentType=AGENT_REG">
<input name="online PAyment" class="btn-style" value="Reinitiate Payment" type="button"/></a>
				</div>
				</c:if>
				</c:otherwise>
				</c:choose>
				
				<c:if test="${paymentStatus=='PAYMENT_DONE'}">
				<label for="inputEmail3" class="col-sm-5 control-label optionfld2"><font color="green">Payment successful with reference number ${paymentReference}</font></label>
				</c:if>
				<c:if test="${paymentStatus=='PAYMENT_PENDING'}">
				<label for="inputEmail3" class="col-sm-5 control-label optionfld2"><font color="blue">Payment pending with reference number ${paymentReference} <br/> please
				<a target="_blank" href="<%=request.getContextPath()%>/verifyChallan?challanrefNum=${paymentReference}">click here</a>
				to check the status </font>
				</label>
				</c:if>
	</div>
	
	<!-- <div class="form-group optionfld2">
	<label for="inputEmail3" class="col-sm-3 control-label"> Khajane2 Challan OR NEFT/RTGS Transaction Ref. Number<sup>*</sup></label>
				<div class="col-sm-3">
				<input type="text" name="sbiTransactionRefNo" class="form-control  input-sm requiredValFld"  />
				<span class='requiredValFldMsg'> Please enter Khajane2 Challan OR NEFT/RTGS Transaction Ref. Number.</span>
				</div>
		
				
			<label class="col-sm-2 control-label"> Attach Online Payment Receipt <sup>*</sup></label>
				<div class="col-sm-3">
				  <input type="file" class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  name="attachScanCopy"  id="exampleInputFile">
				<span class='requiredValFldMsg'> Please Attach Online Payment Receipt.</span>
				</div>	
	</div> -->
			
	
		<br>
<div class="form-group">

	<input type="checkbox" class="requiredValFld" name="showonpublicdomain"></input> Except Aadhaar Card Number, all other information will be added to the public domain
		
		 <span class='requiredValFldMsg'> Please affirm the declarations.</span>					
 </div>
	
<br>
	<div class="form-group">

		<input type="checkbox" class="requiredValFld" name="affirm" id="affirm"></input> [I/We] solemnly affirm and declare that the particulars given in herein are correct to [my /our] knowledge and belief and nothing material has been concealed by [me/us] therefrom
		<span class='requiredValFldMsg'> Please affirm the declarations.</span>
		
	</div>
			
			
	</div>





<c:if test="${agentRegistrationModel.registrationType=='INDVISUAL_REG'}">

<jsp:include page="previewtAgentRegIndviForm.jsp" />

</c:if>

<c:if test="${agentRegistrationModel.registrationType=='FIRM_COMP_REG'}">

<jsp:include page="previewAgentRegistrationCompanyForm.jsp" />

</c:if>

<div class="button-wrapper">
   
   <!-- editAgentUploadDoc -->
   <input name="btn1"  class="btn-style" id="editDocButton" value="Previous" type="button" onclick="pervAgentForm1('editAgentUploadDoc')"/>
   
   <c:if test="${paymentStatus=='PAYMENT_DONE'}">
   <input name="btn1" class="btn-style" value="Submit" type="button" onclick="nextConfirmationForm()">
   </c:if>
   <%--
   	<input name="btn1" class="btn-style" value="Preview Registration Form" data-toggle="modal" data-target="#myModal" type="button">
    --%>
   
   </div>

<br>



</div>

<!-- container end here-->


	</div>
</form:form>