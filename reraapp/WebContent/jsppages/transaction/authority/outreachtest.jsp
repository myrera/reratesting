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
						<div class="col-md-2">Name of the participant <span>*</span></div>
						<div class="col-md-3">
								
								<form:input path="outReachRegistrationModel.participant"  
									cssClass="form-control requiredValFld input-sm augCalCssClass "/>
									<span class='requiredValFldMsg'> Please enter Participant Name.</span>
								
								
						</div>
					</div>
					<br>

					<div class="row">
						<div class="col-md-2">Phone Number</div>
						<div class="col-md-3">
							<form:input path="outReachRegistrationModel.mobile" class="form-control" 
								placeholder="Phone Number" />
						</div>
					</div>

					<br>

					<div class="row">
						<div class="col-md-2">Email</div>
						<div class="col-md-3">
							<form:input path="outReachRegistrationModel.email" class="form-control"  placeholder="Email"/>
						</div>
					</div>

					<br>
					<div class="row">
						<div class="col-md-2"></div>
						<div class="col-md-1">
							<form:input path="outReachRegistrationModel.category" onclick="hideOther()" type="radio" name="yes"/> Builder
						</div>
						<div class="col-md-1">
							<form:input path="outReachRegistrationModel.category"  onclick="hideOther()" type="radio" name="yes" /> Agent
						</div>
												
						<div class="col-md-2">
							<form:input path="outReachRegistrationModel.category"  onclick="hideOther()" type="radio" name="yes" /> Purchaser
						</div>
			
					</div>

					<br>
					
						<div class="row">
						<div class="col-md-2"></div>
						
						<div class="col-md-2">
							<form:input path="outReachRegistrationModel.category"  onclick="hideOther()" type="radio" name="yes"/> Government
						</div>
		
						<div class="col-md-1">
							<form:input path="outReachRegistrationModel.category"  onclick="showOther()" type="radio" name="yes"/> Others
						</div>
					<div class="col-md-2">
							<form:input path="outReachRegistrationModel.ifOther"  id="specId" style="display: none"     class="form-control" placeholder="Please Specify"/>
						</div>
					</div>

					<br>


					<div class="row">
						<div class="col-md-2">Name Of Builder/Agent/Purchaser/etc</div>
						<div class="col-md-3">
							<form:input path="outReachRegistrationModel.builderName"  class="form-control"  placeholder="Builder Name"/>
						</div>
					</div>

					<br>

					<div class="row">
						<div class="col-md-2">Event</div>
						<div class="col-md-3">

							 <form:select class="form-control" path="outReachRegistrationModel.event">
								<form:option value="Hubli" label="Hubli - 14th November" ></form:option>
								<form:option value="Mysore" label="Mysore - 21st November"></form:option>>
								<form:option value="Mangalore" label="Mangalore - 28th November" ></form:option>
							</form:select>

						</div>
					</div>

					<br>


					<div class="row">
						<div class="col-md-2">Addres</div>
						<div class="col-md-3">
							<form:input path="outReachRegistrationModel.address" class="form-control" placeholder="Address"/>
						</div>
				<!-- 		  <div class="col-md-2">

							<select class="form-control" name="distName">
								<option>Select District</option>
								<option>District-1</option>
								<option>District-2</option>
								<option>District-3</option>
							</select>

						</div>  -->
						<div class="col-md-2">
							<form:input path="outReachRegistrationModel.pinCode" class="form-control" placeholder="Pin Code"/>
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
	document.getElementById("specId").style.display  = 'block';
}

function hideOther(){
	document.getElementById("specId").style.display  = 'none';
}

function submitfrm(){
	var _frm=$('#trxForm');
	if(validateForm(_frm)){
		$(_frm).submit();
	}
}

</script>





