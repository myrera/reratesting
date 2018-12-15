<%@page import="in.gov.rera.common.security.ReraSecurity"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
<!DOCTYPE html >

<head>
<script
	src="<%=request.getContextPath()%>/resources/projectjs/projectJs.js"></script>
<script>
function choosepaymentmethod(slct){
	var val=$(slct).val();
	if(val=='Payment Gateway'){
	$(".optionfld2").each(function(){
		$(this).hide();
	});	
	document.paymenttrxForm1.action='projectRegPaymentGateway';
	}
	else{
		$(".optionfld2").each(function(){
			$(this).show();
		});
		document.paymenttrxForm1.action='saveProjectPayment';
	}
}

function showhideflds(sel){
	
	if(sel.value=='Yes'){
		$('#penaltyAmtDIV').show();
		$('#paymentButtonId').hide();
	}else{
		$('#penaltyAmtDIV').hide();
		$('#paymentButtonId').show();
	}
	
}

</script>

<script>
function submitPenalty(){
	alert("hi");
var frm= $("#penaltyAmtId");
$(frm).submit();
}

</script>
</head>

	<div class="container">

		<div class="stepwizard col-md-offset-1">
			<div class="stepwizard-row setup-panel ">


				<div class="stepwizard-step fill">
					<a href="#step-1" type="button" class="btn btn-success btn-circle">1</a>
					<p>Promoter Detail</p>
				</div>




				<div class="stepwizard-step fill">
					<a href="#step-2" type="button" class="btn btn-success	 btn-circle">2</a>
					<p>Project Detail</p>
				</div>



				<div class="stepwizard-step fill">
					<a href="#step-3" type="button" class="btn btn-success btn-circle">3</a>
					<p>Upload Documents</p>
				</div>



				<div class="stepwizard-step fill">
					<a href="#step-3" type="button" class="btn btn-success btn-circle">4</a>
					<p>Payment</p>
				</div>


				<div class="stepwizard-step">
					<a href="#step-3" type="button" class="btn btn-default btn-circle" disabled="disabled" >5</a>
					<p>Confirmation</p>
				</div>


			</div>
		</div>


	</div>




<div class="container">

	<!--main container start here-->
	<div class="Main_containner">

		<!--Inner wrapper start here-->
		<div class="inner_wrapper">



			<h1>
				Payment<span></span>
			</h1>
			<div class="border">
				<div class="orange"></div>
				<div class="black"></div>
			</div>

                  		

			<form:form class="form-horizontal" autocomplete="off" action="saveProjectPayment" modelAttribute="projectRegistrationModel" id="trxForm"
			 method="post" enctype="multipart/form-data" name='paymenttrxForm1'>
			 <%=ReraSecurity.writeToken(request) %>
   
    <c:if test="${errorMsg!='NO' }"><div align="center" style="color:red;"> Your online transaction has been rejected by gateway.Reason is : ${errorMsg } </div></c:if>

				<div class="form-group">
				  
					<label for="inputEmail3" class="col-sm-3 control-label"></label>
					<div class="col-sm-3">
					        <input type="hidden" name="nextForm" value="projectConfirmation"/>
					        <form:hidden path="projectDetailsModel.projectDetailsId"/>
					        <form:hidden path="projectBankDetailsModel.projectBankDelsId"/>
					        <form:hidden path="externalDevelopmentWorkModel.extDevId"/>
					         <form:hidden path="projectRegId"/>
					         <form:hidden path="projectDocModel.docId"/>
					        
							<%-- <form:select path="paymentDetailsModel.paymentMode"
								cssClass="form-control requiredValFld" >
								<form:option value="0" label="Select" />
								<form:option value="Khajane2 Challan" label="Khajane2 Challan" />
								<form:option value="NEFT" label="NEFT" />
								<form:option value="RTGS" label="RTGS" />
							</form:select>
							<span class='requiredValFldMsg'> Please select Payment Mode.</span> --%>
					
					</div>

					<label for="inputEmail3" class="col-sm-2 control-label optionfld2">
					 </label>
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
					<label for="inputEmail3" class="col-sm-3 control-label">
						Amount<sup>*</sup></label>
					<div class="col-sm-3">
						
						<input name="paymentDetailsModel.amount" class="form-control input-sm requiredValFld" value="${RegistrationFee}" readonly="readonly"/>
						
					</div>

					
						<c:if test="${paymentStatus=='PAYMENT_INITIATED'}">
						<label for="inputEmail3" class="col-sm-3 control-label optionfld2"></label>
					<div class="col-sm-3">
							<a href="K2paymentPage?promoterName=${promotername}&paymentToken=${paymentToken}&paymentType=PROJECT_REG&amount=1">
<input name="online PAyment" class="btn-style" value="Click Here For Online Payment" type="button"/></a>
					</div>
					</c:if>
					
					<c:if test="${paymentStatus=='PAYMENT_FAILED'}">
					<label for="inputEmail3" class="col-sm-4 control-label optionfld2"><font color="red">Payment failed with reference number ${paymentReference}</font></label>
					<div class="col-sm-2">
							<a href="K2paymentPage?promoterName=${promotername}&paymentToken=${paymentToken}&paymentType=PROJECT_REG&amount=1">
<input name="online PAyment" class="btn-style" value="Reinitiate Payment" type="button"/></a>
					</div>
					</c:if>
					
					<c:if test="${paymentStatus=='PAYMENT_DONE'}">
				<label for="inputEmail3" class="col-sm-5 control-label optionfld2"><font color="green">Payment successful with reference number ${paymentReference}</font></label>
				</c:if>
				<c:if test="${paymentStatus=='PAYMENT_PENDING'}">
				<label for="inputEmail3" class="col-sm-5 control-label optionfld2"><font color="blue">Payment pending with reference number ${paymentReference} <br/> please
				<a target="_blank" href="<%=request.getContextPath()%>/verifyChallan?challanrefNum=${paymentReference}">click here</a>
				to check the status</font></label>
				</c:if>

				</div>

				<div class="form-group">
					<label for="inputEmail3" class="col-sm-3 control-label  optionfld2"></label>
					<div class="col-sm-3">
					<!-- 	<form:input path="paymentDetailsModel.sbiTransactionRefNo" cssClass="form-control input-sm optionfld2 requiredValFld"/>
					<span class='requiredValFldMsg'> Please enter Reference Number Khajane2 OR NEFT/RTGS Transaction Ref. Number.</span>-->
					</div>

					<label class="col-sm-2 control-label optionfld2"></label>
					<div class="col-sm-3 optionfld2">
					<!-- 	<input type="file" Class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  name="scanCopyDoc" id="scanCopyDoc">
					<span class='requiredValFldMsg'> Please  Attach Online Payment Receipt.</span>-->
					</div>
				</div> 
				
				
				
				



	<div class="inner_wrapper">



						<h1>
							Penalty <span>Details</span>
						</h1>

						<div class="drop_shadow"></div>
						
							   
						<div class="form-group">
						<label class="col-sm-3 control-label">Is Penalty Applicable?
						
						</label>
						<div class="col-sm-3">
						<c:choose>
						<c:when test="${penaltyStatus=='YES'}">
						 <select name="penaltyPaid" id='ispenltyid' class="form-control requiredValFld">
                             <!-- <option value="0"> --Select-- </option>
                           
                              <option value="No">No </option> -->
                                 <option value="Yes" selected> Yes </option>
                             </select>
						</c:when>
						<c:otherwise>
						 <select name="penaltyPaid" id='ispenltyid' class="form-control requiredValFld" onchange="showhideflds(this);">
                             <option value="0"> --Select-- </option>
                           
                              <option value="No" selected>No </option>
                                 <option value="Yes"> Yes </option>
                             </select>
						</c:otherwise>
						</c:choose>
                            
								
						</div> 
									
						 </div> 
					  <c:choose>
					  <c:when test="${penaltyStatus=='YES'}">
					  <div class="form-group" id="penaltyAmtDIV">
						
						 <label class="col-sm-3 control-label">Amount
						</label>
					
						<div class="col-sm-3">
							
							<input type="number" class="form-control requiredValFld" name="amount" readonly id="penaltyAmtId" value="${amount}"/>
							
						</div> 
						<c:if test="${penaltyPaymentStatus=='PENALTY_PAYMENT_INITIATED'}">
						<label class="col-sm-3 control-label"> </label>
						<div class="col-sm-3">
						
							<a href=''  onclick="this.href='K2paymentPage?promoterName=${promotername}&paymentToken=${paymentToken}&paymentType=PENALTY&amount='+document.getElementById('penaltyAmtId').value">
<input name="online PAyment" class="btn-style" value="Click Here For Online Payment" type="button"/></a>
						</div>
						</c:if>
						
						<c:if test="${penaltyPaymentStatus=='PENALTY_PAYMENT_FAILED'}">
						<label class="col-sm-4 control-label"><font color="red">Payment failed with reference number ${penaltyPaymentReference}</font> </label>
						<div class="col-sm-2">
							<a href=''  onclick="this.href='K2paymentPage?promoterName=${promotername}&paymentToken=${paymentToken}&paymentType=PENALTY&amount='+document.getElementById('penaltyAmtId').value">
<input name="online PAyment" class="btn-style" value="Reinitiate Payment" type="button"/></a>
						</div>
						</c:if>
						
				<c:if test="${penaltyPaymentStatus=='PENALTY_PAYMENT_DONE'}">
				<label for="inputEmail3" class="col-sm-5 control-label optionfld2"><font color="green">Payment successful with reference number ${penaltyPaymentReference}</font></label>
				</c:if>
				
				<c:if test="${penaltyPaymentStatus=='PENALTY_PAYMENT_PENDING'}">
				<label for="inputEmail3" class="col-sm-5 control-label optionfld2"><font color="blue">Payment pending with reference number ${penaltyPaymentReference} <br/> please
				<a target="_blank" href="<%=request.getContextPath()%>/verifyChallan?challanrefNum=${penaltyPaymentReference}">click here</a>
				to check the status</font></label>
				</c:if>
						</div>
					  </c:when>
					  <c:otherwise>
					  <div class="form-group" id="penaltyAmtDIV" style="display: none;">
						<p style="text-align:left"><font color="blue">Disclaimer : you have selected penalty payment applicable as <b>YES.</b>
						Hence pay penalty to complete the <b>Registration.</b>
						If penalty is not applicable kindly reset penalty applicable to <b>NO</b> and click on submit.</font></p>
						
						 <label class="col-sm-3 control-label">Amount
						</label>
					
						<div class="col-sm-3">
							
							<input type="number" class="form-control requiredValFld" name="amount" id="penaltyAmtId" />
							
						</div> 
						<c:if test="${penaltyPaymentStatus=='PENALTY_PAYMENT_INITIATED'}">
						<label class="col-sm-3 control-label"> </label>
						<div class="col-sm-3">
						
							<a href=''  onclick="this.href='K2paymentPage?promoterName=${promotername}&paymentToken=${paymentToken}&paymentType=PENALTY&amount='+document.getElementById('penaltyAmtId').value">
<input name="online PAyment" class="btn-style" value="Click Here For Online Payment" type="button"/></a>
						</div>
						</c:if>
						
						</div>
					  </c:otherwise>
					  </c:choose>
                            	
					
						</div>
						
						</div>

				<br>

                  <div class="form-group">

					<input type="checkbox" name="showonpublicdomain" class="requiredValFld"> Except Aadhaar Card Number, all other information will be added to the public domain
					<span class='requiredValFldMsg'> Please affirm the declarations .</span>

				</div>
            
				<div class="form-group">

				<input type="checkbox" name="checkAffidavit" class="requiredValFld"> I/We solemnly affirm and declare that
							the particulars given in herein are correct to [my /our]
							knowledge and belief and nothing material has been concealed by
							[me/us] therefrom 
							<span class='requiredValFldMsg'> Please affirm the declarations .</span>

				</div>
				
				<br> 

			</form:form>





		</div>
		<!--inner container end here-->


		<div class="button-wrapper">

			<input name="btn1" class="btn-style" value="Previous" onclick="pervForm('editUploadDoc')" type="button">
			<c:if test="${paymentStatus=='PAYMENT_DONE' ||
			(paymentStatus=='PAYMENT_DONE' && penaltyPaymentStatus=='PENALTY_PAYMENT_DONE' )}">
			<input name="btn3" class="btn-style" value="Submit" id="paymentButtonId" type="button" onclick="saveOrUpdatePayment()"/>
			</c:if>
			
			<%--
			<input name="btn2" class="btn-style" value="Preview Registration Form"  type="button"  data-toggle="modal" data-target="#myModal">
			 --%>
			 
		</div>

		<br>



	</div>
	


</div>





<%-- <div class="pop_main">
	
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <!--<h4 class="modal-title">Modal <span>Header</span></h4>
          <div class="border"><div class="orange"></div><div class="black"></div></div>-->
        </div>
        <div class="modal-body">
        
        <c:choose>
        <c:when test="${projectRegistrationModel.registrationType=='FIRM_COMP_REG' }">
        <jsp:include page="previewProjectRegComForm.jsp"  />
        </c:when>
        <c:otherwise>
         <jsp:include page="previewRegInvForm.jsp"  />
        </c:otherwise>
        
        </c:choose>
        </div>
        
        </div>
        </div>
        </div>
        </div> --%>
        
        















