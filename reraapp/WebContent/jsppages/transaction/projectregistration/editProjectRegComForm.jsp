<%@page import="in.gov.rera.common.security.ReraSecurity"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
<!DOCTYPE html >
<html>
<head>

<script
	src="<%=request.getContextPath()%>/resources/projectjs/projectJs.js"></script>
<script>
function ocCurrentStatus(slct){
var sid=	$(slct).attr('id');
var val=	$(slct).val();

if(val=='Completed'){
	$('#DV'+sid).find('.completionDocId').show();
	$('#DV'+sid).find('.noOfMonthDelayed').hide();
	$('#DV'+sid).find('.expectedCompletionDate').hide();
}else if(val=='Ongoing'){
	$('#DV'+sid).find('.completionDocId').hide();
	$('#DV'+sid).find('.noOfMonthDelayed').hide();
	$('#DV'+sid).find('.expectedCompletionDate').show();
	
}else if(val=='Delay'){
	$('#DV'+sid).find('.completionDocId').hide();
	$('#DV'+sid).find('.noOfMonthDelayed').show();
	$('#DV'+sid).find('.expectedCompletionDate').hide();
}
else{
	$('#DV'+sid).find('.completionDocId').hide();
	$('#DV'+sid).find('.noOfMonthDelayed').hide();
	$('#DV'+sid).find('.expectedCompletionDate').hide();
	
}


}




function choosePromoterType(slct){
	var val=$(slct).val();
	if(val!='Other'){
	$(".optionfld2").each(function(){
		$(this).hide();
	});	
	
	}
	else{
		$(".optionfld2").each(function(){
			$(this).show();
		});
	
	}
}


function showrelatedfld(rdo){
	var sid=	$(rdo).attr('id');
	$('#Fld'+sid).show();
	var hd=$('#Hd'+sid);
	if(hd){
		$(hd).val($(rdo).val());
	}
}
function hiderelatedfld(rdo){
	var sid=	$(rdo).attr('id');
	$('#Fld'+sid).hide();
	var hd=$('#Hd'+sid);
	if(hd){
		$(hd).val($(rdo).val());
	}
}

function checkNumber(fld){
	if(! isNumber(fld)){
		$(fld).val('');
	}
}


</script>

</head>
<body>
				<form:form class="form-horizontal"
					action="updateCompanyPromoterDetails" name="comp_form"
					commandName="projectRegistrationModel" autocomplete="off" method="post" id="trxForm" enctype= "multipart/form-data">
<%=ReraSecurity.writeToken(request) %>
	<div class="breadcrumb">Home / Real Estate Project Registration</div>

	<div class="container">

		<div class="stepwizard col-md-offset-1">
			<div class="stepwizard-row setup-panel ">


				<div class="stepwizard-step blank">
					<a href="#step-1" type="button" class="btn btn-success btn-circle">1</a>
					<p>Promoter Detail</p>
				</div>




				<div class="stepwizard-step blank">
					<a href="#step-2" type="button" class="btn btn-default btn-circle">2</a>
					<p>Project Detail</p>
				</div>




				<div class="stepwizard-step blank">
					<a href="#step-3" type="button" class="btn btn-default btn-circle"
						disabled="disabled">3</a>
					<p>Upload Documents</p>
				</div>



				<div class="stepwizard-step blank">
					<a href="#step-3" type="button" class="btn btn-default btn-circle"
						disabled="disabled">4</a>
					<p>Payment</p>
				</div>


				<div class="stepwizard-step">
					<a href="#step-3" type="button" class="btn btn-default btn-circle"
						disabled="disabled">5</a>
					<p>Confirmation</p>
				</div>


			</div>
		</div>


	</div>
	<!--News Ticker-->
	<div class="container">

		<!--main container start here-->
		<div class="Main_containner">

			<!--Inner wrapper stsrt here-->
			<div class="inner_wrapper">



				<h1>
					Promoter <span> Detail</span>
				</h1>
				<div class="border">
					<div class="orange"></div>
					<div class="black"></div>
				</div>



					<div class="form-group">
						<label class="col-sm-3 control-label">Type of Promoter</label>
						<div class="col-sm-3">
						
						   <form:hidden path="projectDetailsModel.projectDetailsId"/>
					        <form:hidden path="projectBankDetailsModel.projectBankDelsId"/>
					        <form:hidden path="externalDevelopmentWorkModel.extDevId"/>
					        <form:hidden path="projectRegId"/>
					        <form:hidden path="projectDocModel.docId"/>
					        
					       
					   

						<form:select path="promoterDetailsModel.typeOfPromoter"
								cssClass="form-control requiredValFld" onchange="choosePromoterType(this)">
							<form:option value="0">Select</form:option>
								<form:option value="Company">Company</form:option>
								<form:option value="Partnership Firm">Partnership Firm </form:option>
								<form:option value="Development Authority">Development Authority</form:option>
								<form:option value="Trust">Trust</form:option>
							
								<form:option value="Other">Other</form:option>
							</form:select>


						</div>
						<label for="inputEmail3" class="col-sm-2 control-label">Name<sup>*</sup>
						</label>
						<div class="col-sm-3">

							<form:input path="promoterDetailsModel.promoterName"
								cssClass="form-control input-sm requiredValFld" />
								<span class='requiredValFldMsg'> Please enter Name.</span>

						</div>


					</div>



					<div class="form-group">
					<c:choose>
					<c:when test="${projectRegistrationModel.promoterDetailsModel.typeOfPromoter=='Other' }">
						<label for="inputEmail3" class="col-sm-3 control-label optionfld2" > </label>
						<div class="col-sm-3 optionfld2">
							<form:input path="promoterDetailsModel.ifOther"
								cssClass="form-control input-sm requiredValFld"/>
								<span class='requiredValFldMsg'> Please enter Type of Promoter.</span>

						</div>
						</c:when>
						<c:otherwise>
						<label for="inputEmail3" class="col-sm-3 control-label optionfld2" style="display:none;"> </label>
						<div class="col-sm-3 optionfld2" style="display:none;" >
							<form:input path="promoterDetailsModel.ifOther"
								cssClass="form-control input-sm requiredValFld" readonly="true" />

						</div>
						</c:otherwise>
						</c:choose>
						<label for="inputEmail3" class="col-sm-3 control-label">
							PAN Number <sup>*</sup>
						</label>
						<div class="col-sm-3">

							<form:input path="promoterDetailsModel.panNo"
								cssClass="form-control input-sm panNoValFld requiredValFld" />
								<span class='requiredValFldMsg'> Please enter PAN Number.</span>

						</div>

					</div>




					<div class="form-group">
						<label for="inputEmail3" class="col-sm-3 control-label">E-mail<sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="promoterDetailsModel.emailId" readonly="true"
								cssClass="form-control input-sm emailValFld requiredValFld" />
								<span class='requiredValFldMsg'> Please enter Email Id.</span>
						</div>
						<label for="inputEmail3" class="col-sm-2 control-label">Mobile
							No. <sup>*</sup>
						</label>
						<div class="col-sm-3">

							<form:input path="promoterDetailsModel.mobileNo"
								cssClass="form-control input-sm mobileValFld requiredValFld" />
								<span class='requiredValFldMsg'> Please enter Mobile No.</span>


						</div>

					</div>


					<div class="form-group">

						<label for="inputEmail3" class="col-sm-3 control-label">Address
							Line 1<sup>*</sup>
						</label>
						<div class="col-sm-3">

							<form:input path="promoterDetailsModel.addressLine1"
								cssClass="form-control input-sm requiredValFld" />
								<span class='requiredValFldMsg'> Please enter Address Line 1.</span>
						</div>

						<label for="inputEmail3" class="col-sm-2 control-label">Address
							Line 2 <sup>*</sup>
						</label>
						<div class="col-sm-3">

							<form:input path="promoterDetailsModel.addressLine2"
								cssClass="form-control input-sm requiredValFld" />
								<span class='requiredValFldMsg'> Please enter Address Line 2.</span>
						</div>




					</div>



					<div class="form-group">

						<label for="inputEmail3" class="col-sm-3 control-label">State/UT<sup>*</sup>
						</label>
						<div class="col-sm-3">

							<select name="stateUtId" id="invSate"  onchange="reloadChildDropdown(this)" class="form-control requiredValFld">
						      <option value='0'> --Select-- </option>
						        <c:forEach  items="${stateUtList}" var="st">
						              <c:choose>
						                <c:when test="${st.stateUtId==projectRegistrationModel.promoterDetailsModel.districtModel.stateUtModel.stateUtId}">
						                 <option value='${st.stateUtId }' selected="selected"> ${st.stateUtName} </option>
						                </c:when>
						                  <c:otherwise>
						               <option value='${st.stateUtId}'> ${st.stateUtName} </option>
						                </c:otherwise>
						         </c:choose>
						           </c:forEach>
						
						        
						        
						        
						        
						       </select>
						<span class='requiredValFldMsg'> Please select State.</span>


						</div>

						<label for="inputEmail3" class="col-sm-2 control-label">District<sup>*</sup>
						</label>
						<div class="col-sm-3">

							<select class="form-control requiredValFld" name="permDistrictId"  id="District-invSate" >
									<option value="0"> --Select-- </option>
							
								<c:forEach  items="${projectRegistrationModel.promoterDetailsModel.districtModel.stateUtModel.districtModelSet}" var="dst">	
								
								<c:choose>
						<c:when test="${dst.districtId==projectRegistrationModel.promoterDetailsModel.districtModel.districtId}">
						<option value='${dst.districtId }' selected="selected"> ${dst.districtName } </option>
						</c:when>
						<c:otherwise>
						<option value='${dst.districtId }'> ${dst.districtName } </option>
						</c:otherwise>
						
						
						
						</c:choose>
								
							
							</c:forEach>			
							
							
							
									
																		
							</select>
                            <span class='requiredValFldMsg'> Please select District.</span>

						</div>




					</div>

					<div class="form-group">


						<label for="inputEmail3" class="col-sm-3 control-label">Company
							Registration Number<sup>*</sup>
						</label>
						<div class="col-sm-3">
							<form:input  cssClass="form-control input-sm alphanumericValFld requiredValFld" path="promoterDetailsModel.comRegistrationNo"
								id="inputEmail3" placeholder="" />
								<span class='requiredValFldMsg'> Please enter Company Registration Number.</span>
						</div>


						<label for="inputEmail3" class="col-sm-2 control-label">PIN
							Code<sup>*</sup>
						</label>
						<div class="col-sm-3">
							<form:input  cssClass="form-control input-sm pinCodeValFld requiredValFld" maxlength="6" path="promoterDetailsModel.pinCode"
								id="inputEmail3" placeholder="" />
								<span class='requiredValFldMsg'> Please enter Pin Code.</span>
						</div>
					</div>







					<div class="form-group">
						<label for="inputEmail3" class="col-sm-3 control-label">Registration
							Certificate<sup></sup>
						</label>
						<div class="col-sm-3">
							<input type="file" Class="form-control input-sm " id="regCertificateFile"  rel="txtTooltip"  title="In case of partnership firm 'NOT APPLICABLE' can be written. For Others it is mandatory" data-toggle="tooltip" data-placement="bottom"  name="regCertificateFile"/>
							<a href="download?DOC_ID=${projectRegistrationModel.promoterDetailsModel.document.documentId}"> ${projectRegistrationModel.promoterDetailsModel.document.fileName}</a>
							
						</div>

					</div>


					<br>




					<div class="inner_wrapper">



						<h1>
							Authorized Signatory <span>Details</span>
						</h1>

						<div class="drop_shadow"></div>

						<div class="form-group">
						
							<label for="inputEmail3" class="col-sm-3 control-label">Name <sup>*</sup>
							</label>
							<div class="col-sm-3">
								  <form:input path="promoterDetailsModel.projectChairmanModel.chairmanName" cssClass="form-control input-sm requiredValFld"/>
					<span class='requiredValFldMsg'> Please enter Chairman Name.</span>
								
							</div>

							<label for="inputEmail3" class="col-sm-2 control-label">
								Mobile No <sup>*</sup>
							</label>
							<div class="col-sm-3">
								
								<form:input path="promoterDetailsModel.projectChairmanModel.mobileNo" cssClass="form-control input-sm mobileValFld requiredValFld"/>
					<span class='requiredValFldMsg'> Please enter Mobile No.</span>
									
							</div>




						</div>


						<div class="form-group">

							<label for="inputEmail3" class="col-sm-3 control-label">Email
								Address<sup>*</sup>
							</label>
							<div class="col-sm-3">

								<form:input path="promoterDetailsModel.projectChairmanModel.emailId" cssClass="form-control input-sm emailValFld requiredValFld"/>
					<span class='requiredValFldMsg'> Please enter Email Address.</span>
							</div>


							<label for="inputEmail3" class="col-sm-2 control-label">Address Line1<sup>*</sup>
							</label>
							<div class="col-sm-3">
								
							<form:input path="promoterDetailsModel.projectChairmanModel.addressLine1" cssClass="form-control input-sm requiredValFld"/>
					<span class='requiredValFldMsg'> Please enter Address Line 1.</span>
							</div>



						</div>


	<div class="form-group">

							<label for="inputEmail3" class="col-sm-3 control-label">Address Line2<sup>*</sup>
							</label>
							<div class="col-sm-3">

								<form:input path="promoterDetailsModel.projectChairmanModel.addressLine2" cssClass="form-control input-sm requiredValFld"/>
					<span class='requiredValFldMsg'> Please enter Address Line 2.</span>
							</div>


							<label for="inputEmail3" class="col-sm-2 control-label">State<sup>*</sup>
							</label>
							<div class="col-sm-3">
							<select name="chStateUtId" id="chState"  onchange="reloadChildDropdown(this)" class="form-control requiredValFld">
						      <option value='0'> --Select-- </option>
						        <c:forEach  items="${stateUtList}" var="st">
						              <c:choose>
						                <c:when test="${st.stateUtId==projectRegistrationModel.promoterDetailsModel.projectChairmanModel.districtModel.stateUtModel.stateUtId}">
						                 <option value='${st.stateUtId }' selected="selected"> ${st.stateUtName} </option>
						                </c:when>
						                  <c:otherwise>
						               <option value='${st.stateUtId}'> ${st.stateUtName} </option>
						                </c:otherwise>
						         </c:choose>
						           </c:forEach>
						
						        
						        
						        
						        
						       </select>
						       <span class='requiredValFldMsg'> Please select State.</span>
						
							</div>



						</div>
						
						
						
							<div class="form-group">

							<label for="inputEmail3" class="col-sm-3 control-label">District<sup>*</sup>
							</label>
							<div class="col-sm-3">
<select class="form-control requiredValFld" name="chairManDistrictId"  id="District-chState" >
									<option value="0"> --Select-- </option>
							
								<c:forEach  items="${projectRegistrationModel.promoterDetailsModel.projectChairmanModel.districtModel.stateUtModel.districtModelSet}" var="dst">	
								
								<c:choose>
						<c:when test="${dst.districtId==projectRegistrationModel.promoterDetailsModel.projectChairmanModel.districtModel.districtId}">
						<option value='${dst.districtId }' selected="selected"> ${dst.districtName } </option>
						</c:when>
						<c:otherwise>
						<option value='${dst.districtId }'> ${dst.districtName } </option>
						</c:otherwise>
						
						
						
						</c:choose>
								
							
							</c:forEach>			
							
							
							
									
																		
							</select>
							<span class='requiredValFldMsg'> Please select District.</span>
					
							</div>


					

							<label for="inputEmail3" class="col-sm-2 control-label">Photograph<sup></sup></label>
							<div class="col-sm-3 ">
								<input type="file" class="form-control " id="chairManPhoto" name="chairManPhoto"/>
							<a href="download?DOC_ID=${projectRegistrationModel.promoterDetailsModel.projectChairmanModel.document.documentId}"> ${projectRegistrationModel.promoterDetailsModel.projectChairmanModel.document.fileName}</a>
							 
							</div>
                             


						</div>




					</div>






					<div class="inner_wrapper">


						<h1>
							Project Member <span>Details</span>
						</h1>
						
						
						<c:choose>
						<c:when test="${projectMemberSetFlag=='NO' }">
						
						
						
						<div id='member-dls-dv' class='addmoredv'>
						<div class="drop_shadow">
						<span onclick="deloptdv(this);" style='float: right;'>DELETE</span>
						</div>

						
						<div class="form-group">
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-3 control-label">
									Name<sup>*</sup>
								</label>
								<div class="col-sm-3 ">
									<input class="form-control input-sm requiredValFld" name="memberName"/>
								<span class='requiredValFldMsg'> Please enter  Name.</span>
								</div>

								<label for="inputEmail3" class="col-sm-2 control-label" >
									 Type<sup>*</sup>
								</label>
								<div class="col-sm-3">
									<select class="form-control input-sm requiredValFld " name="memberType">
									<option value="0">Select</option>
									<option value="Director">Director</option>
									<option value="Board Member">Board Member</option>
									<option value="Others">Others</option>
									</select>
								<span class='requiredValFldMsg'> Please select Type.</span>
								</div>
							</div>
 
							<div class="form-group">

								<label for="inputEmail3" class="col-sm-3 control-label">Mobile
									No<sup>*</sup>
								</label>
								<div class="col-sm-3 ">
									<input class="form-control input-sm mobileValFld requiredValFld" rel="txtTooltip" title="Only 10 digits of mobile number is allowed." data-toggle="tooltip" data-placement="bottom"  name="memberMobileNo" maxlength="10"/>
								<span class='requiredValFldMsg'> Please enter Mobile No.</span>
								</div>
								<label for="inputEmail3" class="col-sm-2 control-label">Email
									Address<sup>*</sup>
								</label>
								<div class="col-sm-3">
									<input class="form-control input-sm emailValFld requiredValFld" rel="txtTooltip" title="Only valid emailId is allowed.e.g:abc@zyx.com" data-toggle="tooltip" data-placement="bottom"  name="memberEmailId" />
								<span class='requiredValFldMsg'> Please enter Email Address.</span>
								</div>
							</div>



                            <div class="form-group">

							<label for="inputEmail3" class="col-sm-3 control-label">Address Line1<sup>*</sup></label>
							<div class="col-sm-3 ">
								<input type="text" class="form-control input-sm requiredValFld"  name="memberAddressLine1"/>
							<span class='requiredValFldMsg'> Please enter Address Line1.</span>
							</div>
							<label for="inputEmail3" class="col-sm-2 control-label">Address Line2<sup>*</sup></label>
							<div class="col-sm-3">
								<input type="text"  class="form-control input-sm requiredValFld" name="memberAddressLine2" id="memberAddressLine2"/>
							<span class='requiredValFldMsg'> Please enter Address Line2.</span>
							</div>
							
							</div>
							 
                            <div class="form-group">

							<label for="inputEmail3" class="col-sm-3 control-label">State<sup>*</sup></label>
							<div class="col-sm-3 ">
									<select name="chStateUtId" id="prMemberState"  onchange="reloadChildDropdown(this)" class="form-control dynaselectfld input-sm requiredValFld">
						      <option value='0'> --Select-- </option>
						        <c:forEach  items="${stateUtList}" var="st">
						          <option value='${st.stateUtId }'> ${st.stateUtName } </option>
						        </c:forEach>
						       </select>
							 <span class='requiredValFldMsg'> Please select State.</span>
							</div>
							<label for="inputEmail3" class="col-sm-2 control-label">District<sup>*</sup></label>
							<div class="col-sm-3">
								
								    <select class="form-control dynaselectfld input-sm requiredValFld " name="memberDistrictId"  id="District-prMemberState" >
									<option value="0"> --Select-- </option>
																		
								</select>
								<span class='requiredValFldMsg'> Please select District.</span>
							 
							</div>
							
							</div>
							
							<div class="form-group">

							<label for="inputEmail3" class="col-sm-3 control-label">Pin Code<sup>*</sup></label>
							<div class="col-sm-3 ">
								<input type="text" class="form-control input-sm pinCodeValFld requiredValFld" rel="txtTooltip" title="Only 6 digits of pin number is allowed." data-toggle="tooltip" data-placement="bottom"  name="memberPinCode"/>
							<span class='requiredValFldMsg'> Please enter Pin Code.</span>
							</div>
							<label for="inputEmail3" class="col-sm-2 control-label">Photograph<sup>*</sup></label>
							<div class="col-sm-3 ">
								<input type="file" class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  name="memberPhotoFile" id="memberPhotoFile"/>
							 <span class='requiredValFldMsg'> Please select Photograph .</span>
							</div>
							
							</div>
							
						</div>
						</div>
						
						
						
						
						</c:when>
						<c:otherwise>
						
						
                       <% int yy=0; %>
						<c:forEach items="${projectMemberSet}" var="obj">
						<%if(yy>0){ %>
							<DIV  class="addmoredv">
							<%}else{ %>
								<DIV ID="member-dls-dv" class="addmoredv">
							<%}
						yy++;%>
							<div class="drop_shadow">
								<span onclick="deloptdv(this);" style='float: right;'>DELETE</span>
						</div>
					
						

						
						<div class="form-group">
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-3 control-label">Name<sup>*</sup>
								</label>
								<div class="col-sm-3 ">
									<input class="form-control input-sm requiredValFld" name="memberName" value="${obj.memberName}"/>
									<span class='requiredValFldMsg'> Please enter Member Name.</span>
									<input type="hidden" name="prjMemberChId" value="${obj.prjMemberChId}"/>
					
								</div>

								<label for="inputEmail3" class="col-sm-2 control-label" >
									 Type<sup>*</sup>
								</label>
								<div class="col-sm-3">
									
									
									<select class="form-control requiredValFld" name="memberType">
									<option value="0"> --Select-- </option>
									<c:choose>
									<c:when test="${obj.memberType=='Director' }">
									<option value="Director" selected="selected">Director</option>
									<option value="Board Member">Board Member</option>
									<option value="Others">Others</option>
									</c:when>
									<c:when test="${obj.memberType=='Board Member' }">
									<option value="Director" >Director</option>
									<option value="Board Member" selected="selected">Board Member</option>
									<option value="Others">Others</option>
									</c:when>
									<c:otherwise>
									<option value="Director" >Director</option>
									<option value="Board Member" >Board Member</option>
									<option value="Others" selected="selected">Others</option>
									</c:otherwise>
									</c:choose>
									</select>
									<span class='requiredValFldMsg'> Please select Member Type.</span>
									
									
								</div>
							</div>











							<div class="form-group">

								<label for="inputEmail3" class="col-sm-3 control-label">Mobile
									No<sup>*</sup>
								</label>
								<div class="col-sm-3 ">
									<input class="form-control input-sm mobileValFld requiredValFld" name="memberMobileNo" value="${obj.mobileNo}"/>
									<span class='requiredValFldMsg'> Please enter Mobile Number.</span>
								</div>
								<label for="inputEmail3" class="col-sm-2 control-label">Email
									Address<sup>*</sup>
								</label>
								<div class="col-sm-3">
									<input class="form-control input-sm emailValFld requiredValFld" name="memberEmailId" value="${obj.emailId}"/>
									<span class='requiredValFldMsg'> Please enter Email Id.</span>
								</div>
							</div>



                            <div class="form-group">

							<label for="inputEmail3" class="col-sm-3 control-label">Address Line1<sup>*</sup></label>
							<div class="col-sm-3 ">
								<input type="text" class="form-control input-sm requiredValFld"  name="memberAddressLine1" value="${obj.addressLine1}"/>
								<span class='requiredValFldMsg'> Please enter Address Line 1.</span>
							</div>
							<label for="inputEmail3" class="col-sm-2 control-label">Address Line2<sup>*</sup></label>
							<div class="col-sm-3">
								<input type="text" name="memberAddressLine2" id="memberAddressLine2" value="${obj.addressLine2}"/>
								<span class='requiredValFldMsg'> Please enter Address Line 2.</span>
							</div>
							
							</div>
							
							
							     <div class="form-group">

							<label for="inputEmail3" class="col-sm-3 control-label">State<sup>*</sup></label>
							<div class="col-sm-3 ">
									<select name="chStateUtId" id="prMemberState<%=yy %>"  onchange="reloadChildDropdown(this)" class="form-control dynaselectfld requiredValFld">
						      <option value='0'> --Select-- </option>
						          <c:forEach  items="${stateUtList}" var="st">
						              <c:choose>
						                <c:when test="${st.stateUtId==obj.districtModel.stateUtModel.stateUtId}">
						                 <option value='${st.stateUtId }' selected="selected"> ${st.stateUtName} </option>
						                </c:when>
						                  <c:otherwise>
						               <option value='${st.stateUtId}'> ${st.stateUtName} </option>
						                </c:otherwise>
						
						
						
						                  </c:choose>
						           </c:forEach>
						       </select>
						       <span class='requiredValFldMsg'> Please select State.</span>
							</div>
							<label for="inputEmail3" class="col-sm-2 control-label">District<sup>*</sup></label>
							<div class="col-sm-3">
								
								    <select class="form-control dynaselectfld requiredValFld" name="memberDistrictId"  id="District-prMemberState<%=yy %>" >
									<option value="0"> --Select-- </option>
										<c:forEach  items="${obj.districtModel.stateUtModel.districtModelSet}" var="dst">	
								
						<c:choose>
						<c:when test="${dst.districtId==obj.districtModel.districtId}">
						<option value='${dst.districtId }' selected="selected"> ${dst.districtName } </option>
						</c:when>
						<c:otherwise>
						<option value='${dst.districtId }'> ${dst.districtName } </option>
						</c:otherwise>
						
						
						
						</c:choose>
								
							
							</c:forEach>											
								</select>
								<span class='requiredValFldMsg'> Please select District.</span>
							</div>
							
							</div>
							
							
							
							
							<div class="form-group">

							<label for="inputEmail3" class="col-sm-3 control-label">Pin Code<sup>*</sup></label>
							<div class="col-sm-3 ">
								<input type="text" class="form-control input-sm pinCodeValFld requiredValFld" maxlength="6"  name="memberPinCode" value="${obj.pinCode}"/>
								<span class='requiredValFldMsg'> Please enter Pin Code.</span>
							</div>
							<label for="inputEmail3" class="col-sm-2 control-label">Photograph<sup></sup></label>
							<div class="col-sm-3">
								<input type="file" class="form-control input-sm" name="memberPhotoFile" id="memberPhotoFile"/>
								<a href="download?DOC_ID=${obj.momberPhotoDoc.documentId}"> ${obj.momberPhotoDoc.fileName}</a>
							 
							</div>
							
							</div>
							
							
							
						</div>
						</DIV>
						
						
						</c:forEach>
						</c:otherwise>
						</c:choose>
						
						</div>
						    <!-- add more -->
						    
						    <div class="form-group">

							<div class="col-sm-2 pull-right" style="text-align: right;">

								<span class="glyphicon glyphicon-plus-sign theme-clr "
									aria-hidden="true"></span><span class="theme-clr addmore" id="member-dls"> Add
									more&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>

							</div>
						</div>
						














					</div>
					<br>
					<div class="inner_wrapper">
						<h1>
							 RERA Registration Details with any <span>other State/UTs</span>
						</h1>
						
						
						<c:choose>
						<c:when test="${promoterBlackListSetFlag=='NO' }">
											<div id='blacklist-dls-dv' class='addmoredv'>
						<div class="drop_shadow">
						<span onclick="deloptdv(this);" style='float: right;'>DELETE</span>
						</div>

							<div class="form-group">

								<label for="inputEmail3" class="col-sm-3 control-label">RERA Registration Number<sup>*</sup>
								</label>
								<div class="col-sm-3 ">
									<input class="form-control input-sm alphanumericValFld requiredValFld" name="certificateNo"
										id="certificateNo" />
								<span class='requiredValFldMsg'> Please enter RERA Registration Number.</span>
								</div>



								<label for="inputEmail3" class="col-sm-2 control-label">
								State/UTs<sup>*</sup>
								</label>
								<div class="col-sm-3">
									<select class="form-control input-sm requiredValFld" name="otherStateId">
									   <option value='0'> --Select-- </option>
						        <c:forEach  items="${stateUtList}" var="st">
						          <option value='${st.stateUtId }'> ${st.stateUtName } </option>
						        </c:forEach>    			
									
									</select>
									<span class='requiredValFldMsg'> Please select State/UTs .</span>
								 
								</div>
							</div>
						
				

							<div class="form-group">


								<label for="inputEmail3" class="col-sm-3 control-label">Have your said registration been revoked?</label>
								<div class="col-sm-3 ">
									<label>
									<input type='hidden' name='isBalckListFld' id='HdisBalckList' class='dynaselectfld input-sm'>
									 <input type="radio" name="isBalckList"	id="isBalckList" value="YES" class='dynaselectfld input-sm requiredValFld' onclick='showrelatedfld(this)'> Yes
									<span class='requiredValFldMsg'> Please select Yes Or No .</span>
									</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label> 
									<input type="radio" name="isBalckList" id="isBalckList" value="NO" class='dynaselectfld input-sm requiredValFld' onclick='hiderelatedfld(this)'> No
									<span class='requiredValFldMsg'> Please select Yes Or No .</span>
									</label>
								 
								</div>


								<label for="inputEmail3" class="col-sm-2 control-label">
									Reason for Revocation<sup>*</sup>
								</label>
								<div class="col-sm-3">
						<textarea  class="form-control dynaselectfld input-sm requiredValFld" style="display: none;" name="blacklist" id='FldisBalckList'></textarea>
									<span class='requiredValFldMsg'> Please select Reason for Revoked .</span>
								 
								</div>
							</div>

						</div>
						
						
						
						</c:when>
						<c:otherwise>
						
						
						 <% int zz=0; %>
						<c:forEach items="${promoterBlackListSet}" var="obj">
						
					
						<%if(zz>0){ %>
							<DIV  class="addmoredv">
							<%}else{ %>
								<DIV ID="blacklist-dls-dv" class="addmoredv">
							<%}
						  zz++;%>
							<div class="drop_shadow">
								<span onclick="deloptdv(this);" style='float: right;'>DELETE</span>
						</div>
						
						
						
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">RERA Registration Number<sup>*</sup>
								</label>
								<div class="col-sm-3 ">
								<input type="hidden" name="prmBacklistId" value="${obj.prmBacklistId}"/>
									<input class="form-control input-sm requiredValFld" name="certificateNo"
										id="certificateNo" value="${obj.certificateNo}"/>
										<span class='requiredValFldMsg'> Please enter Rera Registration Number.</span>
								</div>
								
								
								
									<label for="inputEmail3" class="col-sm-2 control-label">
								State/UTs<sup>*</sup>
								</label>
								<div class="col-sm-3">
									<select class="form-control" name="otherStateId">
									   <option value='0'> --Select-- </option>
						        <c:forEach  items="${stateUtList}" var="st">
						        <c:choose>
						        <c:when test="${st.stateUtId == obj.stateUtModel.stateUtId}">
						          <option value='${st.stateUtId }' selected="selected"> ${st.stateUtName } </option>
						          </c:when>
						          <c:otherwise>
						           <option value='${st.stateUtId }'> ${st.stateUtName } </option>
						          </c:otherwise>
						          </c:choose>
						        </c:forEach>    			
									
									</select>
								</div>

							</div>
					
						 <div class="form-group">


                          <c:choose>
                          <c:when test="${obj.isBalckList=='YES' }">

								<label for="inputEmail3" class="col-sm-3 control-label">Have your said registration been revoked?</label>
								<div class="col-sm-3 ">
								<label>
									<input type='hidden' name='isBalckListFld' id='HdisBalckList<%=zz %>' value='NO' class='dynaselectfld'>
									 <input type="radio" name="isBalckList<%=zz %>"	id="isBalckList<%=zz %>" checked="checked" value="YES" class='dynaselectfld' onclick='showrelatedfld(this)'> Yes
									</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label> 
									<input type="radio" name="isBalckList<%=zz %>" id="isBalckList<%=zz %>" value="NO" class='dynaselectfld' onclick='hiderelatedfld(this)'> No
									</label>
								</div>
								</c:when>
								<c:otherwise>
								<label for="inputEmail3" class="col-sm-3 control-label">Have your said registration been revoked?</label>
								<div class="col-sm-3 ">
								<label>
									<input type='hidden' name='isBalckListFld' id='HdisBalckList<%=zz %>' value='NO' class='dynaselectfld'>
									 <input type="radio" name="isBalckList<%=zz %>"	id="isBalckList<%=zz %>"  value="YES" class='dynaselectfld' onclick='showrelatedfld(this)'> Yes
									</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label> 
									<input type="radio" name="isBalckList<%=zz %>" id="isBalckList<%=zz %>" value="NO" checked="checked" class='dynaselectfld' onclick='hiderelatedfld(this)'> No
									</label>
								</div>
								</c:otherwise>
</c:choose>

							
							

                  
								<label for="inputEmail3" class="col-sm-2 control-label">
									Reason for Revocation<sup>*</sup>
								</label>
								<div class="col-sm-3">
						   <c:choose>
                          <c:when test="${obj.isBalckList=='YES' }">
							<textarea  class="form-control dynaselectfld input-sm requiredValFld"  name="blacklist" id='FldisBalckList<%=zz %>'>${	obj.blacklistReason }</textarea>
						
								</c:when>
									<c:otherwise>
										<textarea  class="form-control dynaselectfld input-sm requiredValFld" style="display: none;" name="blacklist" id='FldisBalckList<%=zz %>'>${	obj.blacklistReason }</textarea>
						
									</c:otherwise>
									</c:choose>
										
								</div>
								
							</div> 
							
							
							

                          
						</div>
						</c:forEach>
						</c:otherwise>
						</c:choose>
						
					</div>
					
						<div class="form-group">

							<div class="col-sm-2 pull-right" style="text-align: right;">

								<span class="glyphicon glyphicon-plus-sign theme-clr "
									aria-hidden="true"></span><span class="theme-clr addmore" id="blacklist-dls"> Add
									more&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>

							</div>
						</div>


				
					
					

					<br>









				<div class="inner_wrapper">

						<h1>
							Previous Project <span>Details</span><span
								style="font-size: 12px; padding-left: 8px; font-weight: normal; color: #000;">
								(Last 5 years only)</span>
						</h1>
                    <!-- loop -->
                    <c:choose>
                    <c:when test="${pervProjectSetFlag=='NO' }">
                    
                      <div id='perv-dels-dv' class='addmoredv'>
						<div class="drop_shadow">
						<span onclick="deloptdv(this);" style='float: right;'>DELETE</span>
						</div>

						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">
								Project Name </label>
								
							<div class="col-sm-3">
								<input type="text" class="form-control input-sm requiredValFld"
									id="pervProjectName" name="pervProjectName" >
								<span class='requiredValFldMsg'> Please enter Project Name.</span>	
							</div>
							
							

							<label for="inputEmail3" class="col-sm-2 control-label">
								Project Description <br/> <span style="font-size:10px; color:#929090;">(Maximum 500 Character)</span></label>
							<div class="col-sm-3">
								<textarea class="form-control input-sm requiredValFld" name="pervProjectDescription" id="pervProjectDescription" rows="3"></textarea>
							<span class='requiredValFldMsg'> Please enter Project Description.</span>
							</div>




						</div>




						<div class="form-group dynaselectfld" id='DVprojectCurrentStatus'>

								<label for="inputEmail3" class="col-sm-3 control-label">Current
									Status </label>
								<div class="col-sm-3">
									<select class="form-control dynaselectfld input-sm requiredValFld" name="projectCurrentStatus" id='projectCurrentStatus' onchange="ocCurrentStatus(this)" >
									<option value="0"> --Select--  </option>
										<option value="Completed">Completed </option>
									    <option value="Ongoing">Ongoing</option>
									    <option value="Delay">Delay</option>
									 
									</select>
									<span class='requiredValFldMsg'> Please select status .</span>
								 
								</div>
                                  <div class='completionDocId' style='display:none;'>
	                           		<label for="inputEmail3" class="col-sm-2 control-label">
									Project Completion Certificate</label>
								<div class="col-sm-3 ">
							      <input type="file" class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  name="completionDocId"  />
	                           <span class='requiredValFldMsg'> Please select Project Completion Certificate .</span>
	                            </div>
                                   	</div>                            
								
								<div class='noOfMonthDelayed'  style='display:none;'>
								<label for="inputEmail3" class="col-sm-2 control-label">
									No of Months Delayed </label>
								<div class="col-sm-3">
									<input class="form-control input-sm numericValFld requiredValFld" name="noOfMonthDelayed" />
								<span class='requiredValFldMsg'> Please enter No of Months Delayed.</span>
								</div>
                              </div>
                              
                              <!-- 
                                            <div class='expectedCompletionDate'  style='display:none;'>



								<label for="inputEmail3" class="col-sm-2 control-label">
									Expected Completion Date </label>
								<div class="col-sm-3">
									
										<input type="text" name="expectedCompletionDate" class="form-control input-sm requiredValFld augCalCssClass" readonly="readonly">
										 <span	class="glyphicon glyphicon-calendar augCalImgCssClass"></span>
									<span class='requiredValFldMsg'> Please Select Expected Completion Date.</span>
								</div>
</div> -->


                                          <div class='expectedCompletionDate'  style='display:none;'> 



								<label for="inputEmail3" class="col-sm-2 control-label">
									Expected Completion Date </label>
								<div class="col-sm-3">
				
										<input type="text" name="expectedCompletionDate" class="form-control input-sm requiredValFld augCalCssClass"   readonly="readonly">
										 <span	class="glyphicon glyphicon-calendar augCalImgCssClass"></span>
									<span class='requiredValFldMsg'> Please Select Expected Completion Date.</span>
								</div>
							</div> 



							</div>


							<div class="form-group">
							
								<label for="inputEmail3" class="col-sm-3 control-label">Type
									of Land </label>
								<div class="col-sm-3">
									<select class="form-control input-sm requiredValFld " name="typeOfLand">
										<option value="0">Select</option>
										<option value="Residential">Residential</option>
										<option value="Commercial">Commercial</option>
										<option value="Mixed Development">Mixed Development</option>
	
									</select>
									<span class='requiredValFldMsg'> Please select type of land .</span>
								 
								</div>
			 
							</div>


							<div class="form-group">
								<label for="inputEmail3" class="col-sm-3 control-label">
									</label>
								<div class="col-sm-3 ">
									
								</div>
							
							</div>


							<div class="form-group">
								<label for="inputEmail3" class="col-sm-3 control-label">Is
									there any case pending</label>
								<div class="col-sm-3 ">
								<input type='hidden' name="isCasesPendingFld" id='HdisCasesPending' class='dynaselectfld input-sm'>
									&nbsp;&nbsp;Yes&nbsp;&nbsp;<input type="radio" name="isCasesPending" value="YES"class='dynaselectfld requiredValFld' id="isCasesPending" onclick='showrelatedfld(this)' />
									&nbsp;&nbsp;No&nbsp;&nbsp;<input type="radio" name="isCasesPending" value="NO" class='dynaselectfld requiredValFld'	id="isCasesPending"  onclick='hiderelatedfld(this)'>
									<span class='requiredValFldMsg'> Please select Yes Or No .</span>
									<div>
									 <input type="text"	id="FldisCasesPending" maxlength="100" name="caseDetails"  style='display:none;' class="form-control alphanumericValFld dynaselectfld input-sm requiredValFld " />
									<span class='requiredValFldMsg'> Please enter pending case .</span>
									</div>
								</div>
								<label for="inputEmail3" class="col-sm-2 control-label">
									Is Payment Pertaining to Project Land Pending </label>
								<div class="col-sm-3">
									<div class="col-md-6 input-group">
									<input type='hidden' name="isPaymentPendingFld" id='HdisPaymentPending' class='dynaselectfld input-sm'>
										&nbsp;&nbsp;Yes&nbsp;&nbsp;<input type="radio" name="isPaymentPending" value="YES" class='dynaselectfld input-sm requiredValFld' id="isPaymentPending" onclick='showrelatedfld(this)'/>
										&nbsp;&nbsp;No&nbsp;&nbsp;<input type="radio" name="isPaymentPending" value="NO" class='dynaselectfld input-sm requiredValFld' id="isPaymentPending" onclick='hiderelatedfld(this)' /> 
										 <span class='requiredValFldMsg'> Please select Yes Or No.</span>
										<div>
										<input	type="text" name="pendingAmount" maxlength="12" onchange="checkNumber(this);" class="form-control dynaselectfld input-sm requiredValFld" style='display:none;' id="FldisPaymentPending" />
									 <span class='requiredValFldMsg'> Please enter Payment Pertaining to Project Land Pending .</span>
									</div>
									</div>
								</div>
							</div>

							

						<div class="form-group">

							<label for="inputEmail3" class="col-sm-3 control-label">Address</label>
							<div class="col-sm-3 ">
								<textarea class="form-control input-sm requiredValFld" name="projectAddress" id="" rows="3"></textarea>
							<span class='requiredValFldMsg'> Please enter Address.</span>
							</div>
							<label for="inputEmail3" class="col-sm-2 control-label">
								State/UT </label>
							<div class="col-sm-3">
							<select name="stateUtId" id="pervSate"  onchange="reloadChildDropdown(this)" class="form-control dynaselectfld input-sm requiredValFld">
						      <option value='0'> --Select-- </option>
						        <c:forEach  items="${stateUtList}" var="st">
						          <option value='${st.stateUtId }'> ${st.stateUtName } </option>
						        </c:forEach>
						       </select>
						       <span class='requiredValFldMsg'> Please select State.</span>
				 
							</div>
						</div>


						<div class="form-group">

							<label for="inputEmail3" class="col-sm-3 control-label">District</label>
							<div class="col-sm-3 ">
                        		<select class="form-control dynaselectfld input-sm requiredValFld " name="pervProjDistrictId"  id="District-pervSate" >
									<option value="0"> --Select-- </option>
																		
								</select>
								<span class='requiredValFldMsg'> Please select District.</span>
							 
							</div>
							<label for="inputEmail3" class="col-sm-2 control-label">
								Pin Code </label>
							<div class="col-sm-3">
								<input class="form-control input-sm pinCodeValFld requiredValFld" rel="txtTooltip" title="Only 6 digits of valid pin number is allowed." data-toggle="tooltip" data-placement="bottom"  name="projectAddrPinCode" id="projectAddrPinCode" maxlength="6"/>
							
							<span class='requiredValFldMsg'> Please enter Pin Code.</span>
							</div>
						</div>
						</div>
                    
                    
                    </c:when>
                    
                    <c:otherwise>
                    
                    
                    <% int xx=0; %>
						<c:forEach items="${projectRegistrationModel.previousProjectDetailsSet}" var="obj">
						
						
						<%if(xx>0){ %>
							<DIV  class="addmoredv">
							<%}else{ %>
								<DIV ID="perv-dels-dv" class="addmoredv">
							<%}
						xx++;%>
							<div class="drop_shadow">
								<span onclick="deloptdv(this);" style='float: right;'>DELETE</span>
						</div>
							
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">
								Project Name 
								
								
								</label>
								
							<div class="col-sm-3">
							<input type="hidden" name='pervProjectRegId' value="${obj.pervProjectRegId}"/>
								<input type="text" class="form-control input-sm requiredValFld"
									id="pervProjectName" name="pervProjectName" value="${obj.projectName}">
									<span class='requiredValFldMsg'> Please enter Project Name.</span>
							</div>
							
							

							<label for="inputEmail3" class="col-sm-2 control-label">
								Project Description</label>
							<div class="col-sm-3">
								<textarea class="form-control input-sm requiredValFld" name="pervProjectDescription"  id="pervProjectDescription" rows="3">${obj.projectDescription}</textarea>
							    <span class='requiredValFldMsg'> Please enter Project Description.</span>
							</div>




						</div>


						<div class="form-group dynaselectfld" id='DVprojectCurrentStatus<%=xx %>'>

								<label for="inputEmail3" class="col-sm-3 control-label">Current
									Status </label>
									
								<div class="col-sm-3">
										<select class="form-control dynaselectfld" name="projectCurrentStatus" 
										id='projectCurrentStatus<%=xx %>' onchange="ocCurrentStatus(this)" >
								
										<option value="1">Select </option>
									    
									    
									    <c:choose>
											<c:when test="${obj.projectCurrentStatus == 'Completed'}">
												 <option value="Completed" selected="selected">Completed </option>
												  <option value="Ongoing">Ongoing</option>
									            <option value="Delay">Delay</option>
									            
											</c:when>
											<c:when test="${obj.projectCurrentStatus == 'Ongoing'}">
											    <option value="Completed">Completed </option>
									            <option value="Ongoing"  selected="selected">Ongoing</option>
									            <option value="Delay">Delay</option>
									            
											</c:when>
											<c:when test="${obj.projectCurrentStatus == 'Delay'}">
											    <option value="Completed">Completed </option>
									            <option value="Ongoing">Ongoing</option>
									            <option value="Delay" selected="selected">Delay</option>
									            
											</c:when>
											
											
											
											
										</c:choose>
									 </select>
								</div>


							
						    <c:choose>
							<c:when test="${obj.projectCurrentStatus == 'Completed'}">
							    
							     <div class='completionDocId'>
	                           		<label for="inputEmail3" class="col-sm-2 control-label">
								Project Completion Cretificate</label>
								   <div class="col-sm-3 ">
							        <input type="file" name="completionDocId"/>
							        <a href='<%=request.getContextPath() %>/download?DOC_ID=${obj.completionDocId.documentId}'>${obj.completionDocId.fileName }</a>
	                              </div>
                                 </div>                            
								
								<div class='noOfMonthDelayed'  style='display:none;'>
							
								<label for="inputEmail3" class="col-sm-2 control-label">
									 No of Months Delayed  </label>
								<div class="col-sm-3">
									<input class="form-control requiredValFld" name="noOfMonthDelayed" />
								</div>
                              </div>
                              
                              
                               <!-- <div class='expectedCompletionDate'  style='display:none;'>
								<label for="inputEmail3" class="col-sm-2 control-label">
									Expected Completion Date </label>
								<div class="col-sm-3">
									
										<input type="text" name="expectedCompletionDate" class="form-control input-sm augCalCssClass">
										 <span	class="glyphicon glyphicon-calendar augCalImgCssClass"></span>
									
								</div>
                             </div>	 -->	
                             
                             
                                    
                               <div class='expectedCompletionDate'  style='display:none;'>
								<label for="inputEmail3" class="col-sm-2 control-label">
									Expected Completion Date </label>
								<div class="col-sm-3"> ${obj.expectedCompletionDate.time}
														     <c:set var = "crdt" value = "${obj.expectedCompletionDate.time}" />
                  <fmt:formatDate type="date"  pattern="dd/MM/yyyy" dateStyle="short" var="etd" value="${crdt}"/>
										<input type="text" name="expectedCompletionDate" value="${etd }" class="form-control input-sm augCalCssClass">
										 <span	class="glyphicon glyphicon-calendar augCalImgCssClass"></span>
									
								</div>
                             </div>		
                             
                             
							 </c:when>
							  
							 
							 <c:when test="${obj.projectCurrentStatus == 'Delay'}">
							      <div class='completionDocId' style='display:none;'>
	                           		<label for="inputEmail3" class="col-sm-2 control-label">
									Project Completion Cretificate</label>
								<div class="col-sm-3 ">
							      <input type="file" name="completionDocId"/>
							      
	                            </div>
                                   	</div>                            
								
								<div class='noOfMonthDelayed' >
								<label for="inputEmail3" class="col-sm-2 control-label">
									No of Months Delayed </label>
								<div class="col-sm-3">
									<input class="form-control requiredValFld" name="noOfMonthDelayed" />
								</div>
                              </div>
                              
                           
                           <!--    <div class='expectedCompletionDate'  style='display:none;'>



								<label for="inputEmail3" class="col-sm-2 control-label">
									Expected Completion Date </label>
								<div class="col-sm-3">
									
										<input type="text" name="expectedCompletionDate" class="form-control input-sm augCalCssClass">
										<span	class="glyphicon glyphicon-calendar augCalImgCssClass"></span>
									
								</div>
                             </div>		 -->
                             
                                <div class='expectedCompletionDate'  style='display:none;'>



								<label for="inputEmail3" class="col-sm-2 control-label">
									Expected Completion Date </label>
								<div class="col-sm-3">
																		     <c:set var = "crdt" value = "${obj.expectedCompletionDate.time}" />
                  <fmt:formatDate type="date"  pattern="dd/MM/yyyy" dateStyle="short" var="etd" value="${crdt}"/>
										<input type="text" name="expectedCompletionDate" value="${etd }" class="form-control input-sm augCalCssClass">
						<span	class="glyphicon glyphicon-calendar augCalImgCssClass"></span>
									
								</div>
                             </div>		
							 </c:when>
							 
							 
							 
							 <c:otherwise>
					
							 
							     <div class='completionDocId' style='display:none;'>
	                           		<label for="inputEmail3" class="col-sm-3 control-label">
									Project Completion Cretificate</label>
								<div class="col-sm-3 ">
							      <input type="file" name="completionDocId"/>
	                            </div>
                                   	</div>                            
								
								<div class='noOfMonthDelayed'  style='display:none;'>
								<label for="inputEmail3" class="col-sm-2 control-label">
									No of Months Delayed </label>
								<div class="col-sm-3">
									<input class="form-control" name="noOfMonthDelayed" />
								</div>
                              </div>
                              
                              
                           <!--     <div class='expectedCompletionDate' >



								<label for="inputEmail3" class="col-sm-2 control-label">
									Expected Completion Date </label>
								<div class="col-sm-3">
									
										<input type="text" name="expectedCompletionDate" class="form-control input-sm augCalCssClass">
										<span	class="glyphicon glyphicon-calendar augCalImgCssClass"></span>
									
								</div>
                                </div>		 -->
                                
                                
                                
                                
                               <%--   <div class='expectedCompletionDate' >



								<label for="inputEmail3" class="col-sm-2 control-label">
									Expected Completion Date </label>
								<div class="col-sm-3">
									
																			     <c:set var = "crdt" value = "${obj.expectedCompletionDate.time}" />
                
                  <fmt:formatDate type="date"  pattern="dd-MM-yyyy" dateStyle="short" var="etd" value="${crdt}"/>
										<input type="text" name="expectedCompletionDate" value="${etd }" class="form-control input-sm augCalCssClass">
					<span	class="glyphicon glyphicon-calendar augCalImgCssClass"></span>
									
								</div>
                                </div>		 --%>
                                   <div class='expectedCompletionDate' >



								<label for="inputEmail3" class="col-sm-2 control-label">
									Expected Completion Date </label>
								<div class="col-sm-3">
									
																			     <c:set var = "crdt" value = "${obj.expectedCompletionDate.time}" />
                
                  <fmt:formatDate type="date"  pattern="dd/MM/yyyy" dateStyle="short" var="etd" value="${crdt}"/>
										<input type="text" name="expectedCompletionDate" value="${etd }" class="form-control input-sm augCalCssClass">
					<span	class="glyphicon glyphicon-calendar augCalImgCssClass"></span>
									
								</div>
                                </div>		
							
							   </c:otherwise>
							   </c:choose>

							


							</div>


							<div class="form-group">
							
							
								<label for="inputEmail3" class="col-sm-3 control-label">Type
									of Land </label>
								<div class="col-sm-3">
									<select class="form-control" name="typeOfLand">
										<option value="0">Select</option>
										
										 <c:choose>
											<c:when test="${obj.typeOfLand == 'Residential'}">
												<option value="Residential" selected="selected">Residential</option>
										        <option value="Commercial">Commercial</option>
										        <option value="Mixed Development">Mixed Development</option>
										
											</c:when>
											<c:when test="${obj.typeOfLand == 'Commercial'}">
											   <option value="Residential">Residential</option>
										       <option value="Commercial" selected="selected">Commercial</option>
										       <option value="Mixed Development">Mixed Development</option>
										
											</c:when>
											<c:otherwise>
											 <option value="Residential">Residential</option>
										       <option value="Commercial" >Commercial</option>
										       <option value="Mixed Development" selected="selected">Mixed Development</option>
											</c:otherwise>
										</c:choose>
										
										
										
									</select>
								</div>
							
													   
							

							</div>
	                            
	                            
								
							



							<div class="form-group">


								<label for="inputEmail3" class="col-sm-3 control-label">Is
									there any case pending</label>
								<div class="col-sm-3 ">
								<c:choose>
								<c:when test="${obj.isCasesPending=='YES' }">
								<input type='hidden' name="isCasesPendingFld" id='HdisCasesPending<%=xx %>' value='YES' class='dynaselectfld'>
									&nbsp&nbspYes&nbsp&nbsp
									<input type="radio"	name="isCasesPending<%=xx %>" id="isCasesPending<%=xx %>" value="YES" checked="checked" class='dynaselectfld' onclick='showrelatedfld(this)'>
									&nbsp&nbspNo&nbsp&nbsp
									<input type="radio" name="isCasesPending<%=xx %>"id="isCasesPending<%=xx %>"  value="NO"   onclick='hiderelatedfld(this)' class='dynaselectfld'>
									<input type="text" value="${obj.caseDetails}" maxlength="100" id="FldisCasesPending<%=xx %>"  name="caseDetails" class="form-control alphanumericValFld dynaselectfld" />
                                </c:when>
                                
                                <c:otherwise>
                                <input type='hidden' name="isCasesPendingFld" id='HdisCasesPending<%=xx %>' value='NO' class='dynaselectfld'>
                                	&nbsp&nbspYes&nbsp&nbsp
									<input type="radio"	name="isCasesPending<%=xx %>" id="isCasesPending<%=xx %>" value="YES" onclick='showrelatedfld(this)' class='dynaselectfld'>
									&nbsp&nbspNo&nbsp&nbsp
									<input type="radio" name="isCasesPending<%=xx %>"id="isCasesPending<%=xx %>"  value="NO"   checked="checked"  onclick='hiderelatedfld(this)' class='dynaselectfld'>
									<input type="text" value="${obj.caseDetails}" maxlength="100" id="FldisCasesPending<%=xx %>" style='display:none;'name="caseDetails" class="form-control alphanumericValFld dynaselectfld"  />
                                </c:otherwise>
                                   </c:choose>

								</div>
								<label for="inputEmail3" class="col-sm-2 control-label">
									Is Payment Pertaining to Project Land Pending </label>
								<div class="col-sm-3">
									<div class="col-md-6 input-group">
									<c:choose>
									<c:when test="${obj.isPaymentPending=='YES' }">
									<input type='hidden' name="isPaymentPendingFld" id='HdisPaymentPending<%=xx %>' value='YES' class='dynaselectfld'>
										&nbsp&nbspYes&nbsp&nbsp<input type="radio"	name="isPaymentPending<%=xx %>" checked="checked" value="YES" id="isPaymentPending<%=xx %>" onclick='showrelatedfld(this)' class='dynaselectfld'>
										&nbsp&nbspNo&nbsp&nbsp<input type="radio" id="isPaymentPending<%=xx %>"   name="isPaymentPending<%=xx %>" value="NO" onclick='hiderelatedfld(this)'  class='dynaselectfld'>
										 <input	type="text" name="pendingAmount" maxlength="12" onchange="checkNumber(this);" id="FldisPaymentPending<%=xx %>"  value="${obj.pendingAmount}"class="form-control dynaselectfld" />
										</c:when>	
										<c:otherwise>
										<input type='hidden' name="isPaymentPendingFld" id='HdisPaymentPending<%=xx %>' value='NO' class='dynaselectfld'>
										&nbsp&nbspYes&nbsp&nbsp<input type="radio"	name="isPaymentPending<%=xx %>" value="YES" id="isPaymentPending<%=xx %>" onclick='showrelatedfld(this)' class='dynaselectfld'>
										&nbsp&nbspNo&nbsp&nbsp<input type="radio" id="isPaymentPending<%=xx %>"  checked="checked"  name="isPaymentPending<%=xx %>" value="NO" onclick='hiderelatedfld(this)'  class='dynaselectfld'>
										 <input	type="text" name="pendingAmount" maxlength="12" onchange="checkNumber(this);" id="FldisPaymentPending<%=xx %>" style='display:none;' value="${obj.pendingAmount}"class="form-control dynaselectfld" />
		
										
										</c:otherwise>
											
										</c:choose>	
											
									</div>
								</div>


							</div>

							

						<div class="form-group">

							<label for="inputEmail3" class="col-sm-3 control-label">Address</label>
							<div class="col-sm-3 ">
								<textarea class="form-control input-sm requiredValFld" name="projectAddress" id="" rows="3">${obj.projectAddress}</textarea>
							<span class='requiredValFldMsg'> Please enter Address.</span>
							</div>
							<label for="inputEmail3" class="col-sm-2 control-label">
								State/UT </label>
							<div class="col-sm-3">
							<select name="stateUtId" id="pervSate<%=xx %>"  onchange="reloadChildDropdown(this)" class="form-control dynaselectfld requiredValFld">
						      <option value='0'> --Select-- </option>
						        
						        <c:forEach  items="${stateUtList}" var="st">
						              <c:choose>
						                <c:when test="${st.stateUtId==obj.districtModel.stateUtModel.stateUtId}">
						                 <option value='${st.stateUtId }' selected="selected"> ${st.stateUtName} </option>
						                </c:when>
						                  <c:otherwise>
						               <option value='${st.stateUtId}'> ${st.stateUtName} </option>
						                </c:otherwise>
						
						
						
						                  </c:choose>
						           </c:forEach>
						
						        
						        
						       </select>
				         <span class='requiredValFldMsg'> Please Select State/UT.</span>
							</div>
							
							
						</div>


						<div class="form-group">

							<label for="inputEmail3" class="col-sm-3 control-label">District</label>
							<div class="col-sm-3 ">
                        		<select class="form-control dynaselectfld requiredValFld" name="pervProjDistrictId"  id="District-pervSate<%=xx %>" >
									<option value="0"> --Select-- </option>
						<c:forEach  items="${obj.districtModel.stateUtModel.districtModelSet}" var="dst">	
								
						<c:choose>
						<c:when test="${dst.districtId==obj.districtModel.districtId}">
						<option value='${dst.districtId }' selected="selected"> ${dst.districtName } </option>
						</c:when>
						<c:otherwise>
						<option value='${dst.districtId }'> ${dst.districtName } </option>
						</c:otherwise>
						
						
						
						</c:choose>
								
							
							</c:forEach>			
					 										
								</select>
							<span class='requiredValFldMsg'> Please Select District.</span>
							</div>
							<label for="inputEmail3" class="col-sm-2 control-label">
								Pin Code </label>
							<div class="col-sm-3">
								<input class="form-control input-sm pinCodeValFld requiredValFld" name="projectAddrPinCode" id="projectAddrPinCode" value="${obj.projectAddrPinCode}" maxlength="6"/>
								<span class='requiredValFldMsg'> Please enter Pin Code.</span>
							</div>
						</div>
						</div>
						
						
					
						
				       </DIV>
						   </c:forEach>
					</c:otherwise>
					</c:choose>
					
				  	    
	   </div>
				       				   
					<div class="form-group">
						<div class="col-sm-2 pull-right" style="text-align: right;">

							<span class="glyphicon glyphicon-plus-sign theme-clr "
								aria-hidden="true"></span> <span class="theme-clr addmore"
								id="perv-dels"> Add more&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>

						</div>
					</div>
 
		
			<!--inner container end here-->


			<div class="button-wrapper">
				<input name="btn1" class="btn-style" value="Next" type="button" onclick="saveOrUpdateCompanyPromoter()">
			</div>

			


		<!-- container end here-->



	
	</form:form>
	
</body>
</html>
