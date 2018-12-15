<%@page import="in.gov.rera.common.security.ReraSecurity"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
  
    <script>
    function submitForm(){
    	var _frm=$('#trxForm');
    	if(validateForm(_frm)){
    		$(_frm).submit();
    	}
    }
    </script>
	<form:form method="POST" autocomplete="off" action="sendOTPToEmailId" id="trxForm">
		<%=ReraSecurity.writeToken(request) %>

 
<br>  
		<div class="breadcrumb">Home / Real Estate Report Unregistered Projects login</div>


<div class="row">
<div class="col-md-10">
</div>
<!-- <div class="col-md-2" >
<h3><a href="/reraApp"  style="color: #be6422"> Back to Home</a> </h3>
</div> -->
</div>
<br>
     
		<!--News Ticker-->
		<div class="container">

			<!--main container start here-->
			<div class="Main_containner">

				<!--Inner wrapper stsrt here-->
				<div class="inner_wrapper">

                 

					<h1>
						Login <span> Form</span>
					</h1>
					<div class="border">
						<div class="orange"></div>
						<div class="black"></div>
					</div>

<div>
<b>NOTE:</b> Please enter Email Id / Mobile Number.
<%String msg=(String)session.getAttribute("ERROR_MSG");
if(msg!=null){
	session.setAttribute("ERROR_MSG", null);

%>
<br/><br/>
<span style="color:red;"><%=msg %></span>
<%} %>

</div>

					<form class="form-horizontal">
						<br> 
						
						
						<div class="form-group">
						<div class="col-md-2">Name :</div>
						<div class="col-md-3">
							<input type="text" class="form-control" name ="name"
								placeholder="Name">
						</div>
							<div class="col-md-2">Mobile Number :</div>
						<div class="col-md-3">
							<input type="text" min="0" class="form-control " name="mobileNo" maxlength="10"
								placeholder="Phone Number" rel="txtTooltip" title="Only digits are allowed." data-toggle="tooltip" data-placement="bottom">
								
						</div>
						
					</div>
					<br>
					<br>
						
											<div class="form-group">
							<label class="col-sm-2 control-label" id="emailIdLabel">Email ID:</label>
							<div class="col-sm-3">
								<input type="email" class="form-control input-sm emailValFld "
									id="emailId" placeholder="" name="emailId">
									
							</div>
							
							
						</div>




					</form>


					<br> <br>



				</div>
				<!--inner container end here-->


				<div class="button-wrapper">
					<input name="btn1" class="btn-style" value="Next" type="button" onclick=" submitForm();"/>
				</div>

				<br>



			</div>
			<!-- container end here-->


		</div>


	</form:form>

	
	