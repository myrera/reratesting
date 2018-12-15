	<%@page import="in.gov.rera.common.security.ReraSecurity"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="in.gov.rera.common.util.ReraConstants"%>
<%@page import="in.gov.rera.common.model.UserModel"%>
<%
UserModel user=(UserModel)session.getAttribute(ReraConstants.SES_USER_ATTR);

%>

<script>

</script>
    
    <div class="breadcrumb">Home /Registration Renewal Form<span class="pull-right user_name">Welcome :<b><%=user.getUserName() %>  </b></span></div>
<div class="container">


<!--main container start here-->
<div class="Main_containner">

<!--Inner wrapper stsrt here-->
<div class="inner_wrapper">



<div class="row">
<c:if test="${agentReg.registrationType=='INDVISUAL_REG'}">
		<div class="col-md-12 profile_top_main">
		<div class="col-md-1"><img src="<%=request.getContextPath()%>/reraimage?IMG_ID=${agentReg.agentDetailsModel.photograph.documentId}" class="img-responsive" width="157" height="181" alt=""></div>
		<div class="col-md-10 no_pad_lft">
		
		<div class="col-md-6">
			<h1><%=user.getUserName() %></h1>
			<p><p>${agentReg.agentDetailsModel.agentIndividualAddressLine1 },${agentReg.agentDetailsModel.agentIndividualAddressLine2 } ,${agentReg.agentDetailsModel.agentIndividualPincode }
</p>
			<p class="text-view">Registration Type<span class="space_LR">:</span>${agentReg.registrationType}</p>
			</div>
		
		
			<div class="col-md-6">
			<p class="pull-right"><span>Registration Number: ${agentReg.agentRegistrationNo}</span></p>
			<br clear="all">
			<p class="text-view pull-right">Validity&nbsp;:&nbsp;${agentReg.approvedOn.time} &nbsp;&nbsp;&nbsp;to&nbsp;&nbsp;&nbsp;${agentReg.expireDate.time} </p>
			</div>
			
			
		</div>
		</div>
		</c:if>
		
		<c:if test="${agentReg.registrationType=='FIRM_COMP_REG'}">
		<div class="col-md-12 profile_top_main">
		<div class="col-md-1"><img src="<%=request.getContextPath()%>/reraimage?IMG_ID=${agentReg.agentDetailsModel.photograph.documentId}" class="img-responsive" width="157" height="181" alt=""></div>
		<div class="col-md-10 no_pad_lft">
		
		<div class="col-md-6">
			<h1><%=user.getUserName() %></h1>
			<p>${agentReg.agentDetailsModel.firmAddressLine1 } ,${agentReg.agentDetailsModel.firmAddressLine2}, ${agentReg.agentDetailsModel.districtModel.stateUtModel.stateUtName}
${agentReg.agentDetailsModel.districtModel.districtName},${agentReg.agentDetailsModel.firmRegistrationNo}</p>
			<p class="text-view">Registration Type<span class="space_LR">:</span>${agentReg.registrationType}</p>


			</div>
		
		
			<div class="col-md-6">
			<p class="pull-right"><span>Registration Number: ${agentReg.agentDetailsModel.firmRegistrationNo}</span></p>
			<br clear="all">
			<p class="text-view pull-right">Validity&nbsp;:&nbsp;${agentReg.approvedOn.time} &nbsp;&nbsp;&nbsp;to&nbsp;&nbsp;&nbsp;${agentReg.expireDate.time} </p>
			</div>
			
			
		</div>
		</div>
		</c:if>
	</div>

<form:form cssClass="form-horizontal" autocomplete="off" modelAttribute="agentReq" name="saveAgentRegRenewalReqForm" id="trxRenForm" method="post"
 action="saveAgentRegRenewalReq" enctype="multipart/form-data">
 <%=ReraSecurity.writeToken(request) %>
     
    <br>

   							
		
						
<div class="inner_wrapper" style="font-size: 13px;">
			
			<h1 style="font-size: 16px;">  <span style="font-size: 16px;">Supporting Documents(If Any)</span></h1>
			<div id="supportdoc-dv" class="addmoredv">
			<div class="drop_shadow" style="font-size: 13px;">  <span onclick="deloptdv(this);" style='float: right;'>DELETE</span></div>
		<div class="form-group" style="font-size: 13px;">
		<label for="inputEmail3" class="col-sm-3 control-label" style="font-size: 13px;">Caption:  </label>
				<div class="col-sm-3" style="font-size: 13px;">
				  <input type="text" class="form-control input-sm" id="inputEmail3" name="captions" style="font-size: 13px;">
				</div>
				
					<label for="inputEmail3" class="col-sm-3 control-label" style="font-size: 13px;">Attachment </label>
				<div class="col-sm-3" style="font-size: 13px;">
				  <input type="file" id="exampleInputFile" name="attachments" class="form-control" style="font-size: 13px;">
				</div>
				
	
		
	</div>
			</div>			
					
			</div>
			<div class="col-sm-2 pull-right" style="text-align: right; font-size: 13px;">
				
                        <span class="glyphicon glyphicon-plus-sign theme-clr " aria-hidden="true" style="font-size: 13px;"></span>
                        <span class="theme-clr addmore" id="supportdoc" style="font-size: 13px;">	Add more&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span> 
                 
				</div>
					
					
					
	<div class="inner_wrapper">
		
<h1>Payment <span>Details</span></h1>
			<div class="drop_shadow"></div>



				<div class="form-group">
				<label for="inputEmail3" class="col-sm-3 control-label"> Payment Mode</label>
						<div class="col-sm-3">
						
					        
					        
							<select name ="regPaymentDetailsModel.paymentMode" id='paymentmode' onchange="choosepaymentmethod(this)"
								class="form-control requiredValFld">
								<option value="0"> --Select-- </option>
								<option value="SBI Collect" > SBI Collect </option>
							<!--	<option value="Banker's Cheque" > Banker's Cheque </option>
                                 <option value="Payment Gateway" > Payment Gateway </option>
 -->
							</select>
					
					<span class='requiredValFldMsg'> Please select Payment Mode</span>
		
				</div>
				
				<label for="inputEmail3" class="col-sm-2 control-label optionfld2">  </label>
				<div class="col-sm-3 optionfld2">
							<a href="https://www.onlinesbi.com/prelogin/icollecthome.htm" target="_blank">Click Here</a> for online payment through SBI Collect
			
					
				</div>
	
	         </div>
	
	
		<div class="form-group">
		<label for="inputEmail3" class="col-sm-3 control-label"> Amount (INR)</label>
				<div class="col-sm-3">
				
				<input class="form-control input-sm" type="text" name="regPaymentDetailsModel.amount" readonly="readonly" value="${regFee}" />
				
				</div>
				
				<label for="inputEmail3" class="col-sm-2 control-label optionfld2"> 	Unique Token Number<sup>*</sup> </label>
				<div class="col-sm-3 optionfld2">
				<input name="regPaymentDetailsModel.paymentToken" value="${paymentTokenNo}" readonly="readonly"  class="form-control input-sm requiredValFld"></input>
				<span class='requiredValFldMsg'> Please enter Unique Token Number.</span>
				</div>
		
	</div>
	
	<div class="form-group optionfld2">
	<label for="inputEmail3" class="col-sm-3 control-label"> SBI Transaction ID<sup>*</sup></label>
				<div class="col-sm-3">
				<input type="text" name="regPaymentDetailsModel.sbiTransactionRefNo" class="form-control  input-sm requiredValFld"  />
				<span class='requiredValFldMsg'> Please enter SBI Transaction ID.</span>
				</div>
		
				
			<label class="col-sm-2 control-label">  Attach Online Payment Receipt <sup>*</sup></label>
				<div class="col-sm-3">
				  <input type="file" class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" 
				  data-toggle="tooltip" data-placement="bottom"  name="scanCopyDoc"  id="exampleInputFile">
				<span class='requiredValFldMsg'> Please  Attach Online Payment Receipt.</span>
				</div>	
	</div>
	

</div>
								

	
				<div class="clearfix" style="font-size: 13px;"></div>
				
				
				<div class="inner_wrapper" style="font-size: 13px;">
			
			<h1 style="font-size: 16px;">  <span style="font-size: 16px;">Declarations</span></h1>
			<div class="drop_shadow" style="font-size: 13px;"></div>
			
			
			
	<ul style="font-size: 13px;">
          <li style="font-size: 13px;"><input type="checkbox" value="" style="font-size: 13px;">&nbsp;&nbsp;I verify that the contents of the above sections are true to my personal knowledge and belief and I have not suppressed any material fact(s) </li>
		
		
	</ul>
			
				
															

			
			</div>
		
																						
																																										
																																																																																		
	<div class="button-wrapper">
   
   
   
   <input name="btn1" class="btn-style" value="Submit" type="button" onclick="submitRenewForm()"></div>		
	
</form:form>
	
	
	
	

	</div>
<!--inner container end here-->




<br>



</div>



</div>
			
	
<script>
function submitRenewForm(){
	var _frm=$('#trxRenForm')
	if(validateForm(_frm)){
		$(_frm).submit();
	}
}
</script>

    