<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="in.gov.rera.common.util.DateUtil"%>
	<%@page import="in.gov.rera.common.security.ReraSecurity"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>





<div class="breadcrumb">Home / Out Reach </div>



<div class="Main_containner">


	<br> <br>
	<form:form cssClass="form-horizontal" id="trxForm" autocomplete="off" action="saveOutReachRegDetails" modelAttribute="outReachRegistrationModel"
		 enctype="multipart/form-data" method="post">
		
		
	<div class="row">

		<div class="col-md-1"></div>


		<div class="col-md-9">
			<div class="card">
				<div class="card-block">

					<div class="row">
						<div class="col-md-2"> Participant Name <sup>*</sup></div>
						<div class="col-md-3">
							<input type="text" class="form-control requiredValFld" name ="participantName"
								placeholder="Name of the participant">
								<span class='requiredValFldMsg'> Please enter Name of the participan</span>
						</div>
					</div>
					<br>

					<div class="row">
						<div class="col-md-2">Phone Number<sup>*</sup></div>
						<div class="col-md-3">
							<input type="number" min="0" class="form-control requiredValFld" name="phnNo" maxlength="10"
								placeholder="Phone Number" rel="txtTooltip" title="Only digits are allowed." data-toggle="tooltip" data-placement="bottom">
								<span class='requiredValFldMsg'> Please enter Phone Number</span>
						</div>
					</div>

					<br>

					<div class="row">
						<div class="col-md-2">Email ID<sup>*</sup></div>
						<div class="col-md-3">
							<input type="email" required="required" class="form-control requiredValFld emailValFld" name="emailId" placeholder="Email">
							<span class='requiredValFldMsg'> Please enter Email</span>
						</div>
					</div>

					<br>
					<div class="row">
						<div class="col-md-2">Participant Category<sup>*</sup></div>
												
						<div class="col-md-3">
								<select id="select_id" onclick="showOther()" class="form-control requiredValFld" name="categoryName">
								<option value="0" >--Select--</option>
								<option value="Builder" >Builder</option>
								<option value="Agent" > Agent</option>
								<option value="Purchaser" >Purchaser</option>
								<option value="Government" >Government</option>
								<option  value="Others" >Others</option>
							</select>
						<span class='requiredValFldMsg'> Please select Category</span>
						</div>
								<div class="col-md-2">
							<input id="specId" style="display: none"  name="isOther" type="text" class="form-control requiredValFld" placeholder="Please Specify">
							<span class='requiredValFldMsg'> Please Enter Others</span>
						</div>
					</div>
		
			

					<br>
					
				


					<div class="row">
						<div class="col-md-2">Name Of builder /agent/purchaser/etc<sup>*</sup></div>
						<div class="col-md-3">
							<input type="text" class="form-control requiredValFld" name="builderName" placeholder="Name">
							<span class='requiredValFldMsg'> Please enter Name Of Builder/Agent/Purchaser/etc</span>
						</div>
					</div>

					<br>

					<div class="row">
						<div class="col-md-2">Event<sup>*</sup></div>
						<div class="col-md-3">

							<select class="form-control requiredValFld" name="eventName">
						    	<option value="0" >--Select--</option>
								<option value="Hubli - 14th November" >Hubli - 14th November</option>
								<option value="Mysore - 21st November" >Mysore - 21st November</option>
								<option value="Mangalore - 28th November" >Mangalore - 28th November</option>
							</select>
						<span class='requiredValFldMsg'> Please select Event</span>
						</div>
					</div>

					<br>


					<div class="row">
						<div class="col-md-2">Participant Address<sup>*</sup></div>
						<div class="col-md-3">
							<input type="text" class="form-control requiredValFld" placeholder="Address" name="address">
							<span class='requiredValFldMsg'> Please enter Address</span>
						</div>
						<div class="col-md-2">

							
						<select class="form-control requiredValFld" name='distName' >
						
							<option value='0'> --Select-- </option>
						<c:forEach items="${distList}" var="dst">
						<option value='${dst.districtName }'> ${dst.districtName } </option>
						</c:forEach>
						</select>
						<span class='requiredValFldMsg'> Please select District</span>
						</div>
						<div class="col-md-2">
							<input type="number" class="form-control requiredValFld" placeholder="Pin Code" min="0"  maxlength="6" name = "pinCode" rel="txtTooltip" title="Only digits are allowed." data-toggle="tooltip" data-placement="bottom">
							<span class='requiredValFldMsg'> Please enter Pincode</span>
						</div>

					</div> 

					<br>
					
						<div class="row">
						<div class="col-md-2"></div>
						<div class="col-md-2">
						
						<input	name="btn1" class="btn-style" value="Submit"  type="button" onclick="submitfrm();">
						
						</div>
						</div>
					

				</div>
			</div>
		</div>
	</div></form:form>


	<br> <br>


</div>

<script>

function showOther(){
	var selVal= document.getElementById("select_id").value;
	if(selVal == "Others")
	document.getElementById("specId").style.display  = 'block';
	else
		document.getElementById("specId").style.display  = 'none';
}

function hideOther(){
	document.getElementById("specId").style.display  = 'none';
}

function submitfrm(){
	var _frm=$('#trxForm');
	if(validateForm(_frm)){
		alert("Successfully Registered");
		$(_frm).submit();
	}
}

</script>





