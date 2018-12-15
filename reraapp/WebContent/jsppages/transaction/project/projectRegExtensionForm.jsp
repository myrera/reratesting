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
    
    <div class="breadcrumb">Home /Project Extension Form<span class="pull-right user_name">Welcome :<b><%=user.getUserName() %>  </b></span></div>
<div class="container">


<!--main container start here-->
<div class="Main_containner">

<!--Inner wrapper stsrt here-->
<div class="inner_wrapper">



<div class="row">
<c:if test="${projectReg.registrationType=='INDVISUAL_REG'}">
		<div class="col-md-12 profile_top_main">
		<div class="col-md-1"><img src="<%=request.getContextPath() %>/reraimage?IMG_ID=${projectReg.promoterDetailsModel.individualPhotoGraphPath.documentId}" class="img-responsive" width="157" height="181" alt=""></div>
		<div class="col-md-10 no_pad_lft">
		
		<div class="col-md-6">
			<h1>${projectReg.promoterDetailsModel.promoterName }</h1>
			<p>${projectReg.promoterDetailsModel.addressLine1},${project.promoterDetailsModel.addressLine2} ,
			${projectReg.promoterDetailsModel.districtModel.stateUtModel.stateUtName},${projectReg.promoterDetailsModel.districtModel.districtName}, ${projectReg.promoterDetailsModel.pinCode}</p>
			<p class="text-view">Registration Type<span class="space_LR">:</span>${projectReg.registrationType}</p>
			</div>
		
		
			<div class="col-md-6">
			<p class="pull-right"><span>Registration Number: ${projectReg.projectRegistrationNo}</span></p>
			<br clear="all">
			<p class="text-view pull-right">Validity&nbsp;:&nbsp;${projectReg.createdOn.time} &nbsp;&nbsp;&nbsp;to&nbsp;&nbsp;&nbsp;${projectReg.expireDate} </p>
			</div>
			
			
		</div>
		</div>
		</c:if>
		
		<c:if test="${projectReg.registrationType=='FIRM_COMP_REG'}">
		<div class="col-md-12 profile_top_main">
		<div class="col-md-1"><img src="<%=request.getContextPath() %>/reraimage?IMG_ID=${projectReg.promoterDetailsModel.individualPhotoGraphPath.documentId}" class="img-responsive" width="157" height="181" alt=""></div>
		<div class="col-md-10 no_pad_lft">
		
		<div class="col-md-6">
			<h1>${projectReg.promoterDetailsModel.promoterName }</h1>
			<p>${projectReg.promoterDetailsModel.addressLine1},${project.promoterDetailsModel.addressLine2} ,
			${projectReg.promoterDetailsModel.districtModel.stateUtModel.stateUtName},${projectReg.promoterDetailsModel.districtModel.districtName}, ${projectReg.promoterDetailsModel.pinCode}</p>
			<p class="text-view">Registration Type<span class="space_LR">:</span>${projectReg.registrationType}</p>
			</div>
		
		
			<div class="col-md-6">
			<p class="pull-right"><span>Registration Number: ${projectReg.projectRegistrationNo}</span></p>
			<br clear="all">
			<p class="text-view pull-right">Validity&nbsp;:&nbsp;${projectReg.createdOn.time} &nbsp;&nbsp;&nbsp;to&nbsp;&nbsp;&nbsp;${projectReg.expireDate} </p>
			</div>
			
			
		</div>
		</div>
		</c:if>		
	</div>

<form:form cssClass="form-horizontal" method="post" commandName="projectExt" name="saveProjectExtensionForm" 
                                                
id="trxextForm" autocomplete="off" action="saveProjectExtensionReq" enctype="multipart/form-data">
     <%=ReraSecurity.writeToken(request) %>
    <br>

   							
<div class="inner_wrapper">
		
<h1>Project<span>Extension</span></h1>
			<div class="drop_shadow"></div>


<div class="form-group">
				<label class="col-sm-3 control-label">Extend To Date</label>
				<div class="col-sm-3">
				  <input type="text" name="extendToDate" class="form-control input-sm augCalCssClass" readonly="readonly" id="inputEmail3" placeholder="DD/MM/YYYY">
				<span class="glyphicon glyphicon-calendar augCalImgCssClass"></span>
				</div>
			<label for="inputEmail3" class="col-sm-2 control-label">Reason for Extend: </label>
				<div class="col-sm-3">
				 <textarea class="form-control input-sm" rows="3" name="reasonForExtends"></textarea>
				</div>


			</div>	

</div>
					
						
<div class="inner_wrapper" style="font-size: 13px;">
			
			<h1 style="font-size: 16px;"> Supporting Documents <span style="font-size: 16px;">(If Any)</span></h1>
			<div id="supportdocs-dv" class="addmoredv">
			<div class="drop_shadow" style="font-size: 13px;"> <span onclick="deloptdv(this);" style='float: right;'>DELETE</span></div>
				<div class="form-group" style="font-size: 13px;">
		<label for="inputEmail3" class="col-sm-3 control-label" style="font-size: 13px;">Caption:  </label>
				<div class="col-sm-3" style="font-size: 13px;">
				  <input type="text" class="form-control input-sm" id="inputEmail3" name="captions" style="font-size: 13px;">
				</div>
				
					<label for="inputEmail3" class="col-sm-3 control-label" style="font-size: 13px;">Attachment </label>
				<div class="col-sm-3" style="font-size: 13px;">
				  <input type="file" id="exampleInputFile" name="attachments" style="font-size: 13px;">
				</div>
				
	
		
	</div>
			</div>			
					
			</div>
			<div class="col-sm-2 pull-right" style="text-align: right; font-size: 13px;">
				
                        <span class="glyphicon glyphicon-plus-sign theme-clr " aria-hidden="true" style="font-size: 13px;"></span>
                        <span class="theme-clr addmore" id="supportdocs" style="font-size: 13px;">	Add more&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span> 
                 
				</div>
					
					
					
	<div class="inner_wrapper">
		
<h1>Payment <span>Details</span></h1>
			<div class="drop_shadow"></div>


				<div class="form-group">
				  
					<label for="inputEmail3" class="col-sm-3 control-label">
						Payment Mode</label>
					<div class="col-sm-3">
					       
					        
							<form:select path="paymentDetailsModel.paymentMode"
								class="form-control requiredValFld" onchange="choosepaymentmethod(this)">
								<form:option value="0" label="Select" />
								<form:option value="SBI Collect" label="SBI Collect" />
							  <%-- 	<form:option value="Banker's Cheque" label="Banker's Cheque" />
                              <form:option value="Payment Gateway" label="Payment Gateway" /> --%>

							</form:select>
							<span class='requiredValFldMsg'> Please select Payment Mode.</span>
					
					

						
						
						
					</div>

					<label for="inputEmail3" class="col-sm-2 control-label optionfld2">
						 </label>
					<div class="col-sm-3">
						<a href="https://www.onlinesbi.com/prelogin/icollecthome.htm" target="_blank">Click Here</a> for online payment through SBI Collect
				  
					
					</div>
				</div>


				<div class="form-group">
					<label for="inputEmail3" class="col-sm-3 control-label">
						Amount</label>
					<div class="col-sm-3">
						
						<input name="paymentDetailsModel.amount" class="form-control input-sm requiredValFld" value="${RegistrationFee}" readonly="readonly"/>
						
					</div>

						<label for="inputEmail3" class="col-sm-2 control-label optionfld2">
						Unique Token Number <sup>*</sup></label>
					<div class="col-sm-3">
							<input name="paymentDetailsModel.paymentToken" class="form-control input-sm" value="${paymentTokenNo}" readonly="readonly"/>	
						
						
					</div>

				</div>


				<div class="form-group">
					<label for="inputEmail3" class="col-sm-3 control-label  optionfld2">
						SBCollect Reference Number<sup>*</sup></label>
					<div class="col-sm-3">
						<form:input path="paymentDetailsModel.sbiTransactionRefNo" cssClass="form-control input-sm optionfld2 requiredValFld"/>
					<span class='requiredValFldMsg'> Please enter SBCollect Reference Number.</span>
					</div>





					<label class="col-sm-2 control-label optionfld2"> Attach Online Payment Receipt <sup>*</sup></label>
					<div class="col-sm-3 optionfld2">
						<input type="file" Class="form-control requiredValFld" rel="txtTooltip" 
						title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  
						name="scanCopyDoc" id="scanCopyDoc">
					<span class='requiredValFldMsg'> Please Online Payment Receipt.</span>
					</div>
				</div>

	

	

</div>
								

	
				<div class="clearfix" style="font-size: 13px;"></div>
				
				
				<div class="inner_wrapper" style="font-size: 13px;">
			
			<h1 style="font-size: 16px;">  <span style="font-size: 16px;">Declarations</span></h1>
			<div class="drop_shadow" style="font-size: 13px;"></div>
			
			
			
	<ul style="font-size: 13px;">
		
		<li style="font-size: 13px;"><input type="checkbox" value="" style="font-size: 13px;">&nbsp;&nbsp; I, complainant, here by declare that the subject matter of the above claim falls within the Jurisdiction of the Authority </li>
        <li style="font-size: 13px;"><input type="checkbox" value="" style="font-size: 13px;">&nbsp;&nbsp;I, complainant, here by declare that the matter regarding which the complaint has been made is not pending before any Court of Law or any other Authority or any other Tribunal(s) </li>
          <li style="font-size: 13px;"><input type="checkbox" value="" style="font-size: 13px;">&nbsp;&nbsp;I verify that the contents of the above sections are true to my personal knowledge and belief and I have not suppressed any material fact(s) </li>
		
		
	</ul>
			
				
															

			
			</div>
		
																						
																																										
																																																																																		
	<div class="button-wrapper">
   
   
   
   <input name="btn1" class="btn-style" value="Submit" type="button" onclick="extensionFormSubmit()"></div>		
	
</form:form>
	
	
	
	

	</div>
<!--inner container end here-->




<br>



</div>



</div>
			
	
	

    <script>
    function extensionFormSubmit(){
    	var _frm=$('#trxextForm');
    	if(validateForm(_frm)){
    		$(_frm).submit();
    	}
    }
    
    </script>