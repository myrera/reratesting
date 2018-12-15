	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">


</head>
<body>
	

	<div class="breadcrumb">Home / Real Estate Project Registration</div>

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
					<a href="#step-3" type="button" class="btn btn-success btn-circle">5</a>
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



				<h1>
					Confirmation<span></span>
				</h1>
				<div class="border">
					<div class="orange"></div>
					<div class="black"></div>
				</div>



				<br> <br>

				<h1 style="text-align: center;">Your project registration application  has been	submitted successfully. Your acknowledgement number is ${projectRegistrationModel.applicationNo } </h1>
	<br/><br/><br/>
	
              	</div>
				<br> <br> <br>





			</div>
			<!--inner container end here-->


			<br>



		</div>
		<!-- container end here-->


	</div>


</body>
</html>