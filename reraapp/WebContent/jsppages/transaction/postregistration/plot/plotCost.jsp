<!DOCTYPE html>
<%@page import="in.gov.rera.common.security.ReraSecurity"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="in.gov.rera.common.util.ReraConstants"%>
<%@page import="in.gov.rera.common.model.UserModel"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%
	UserModel user = (UserModel) session.getAttribute(ReraConstants.SES_USER_ATTR);
%>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="Root - Bootstrap 4 Admin Template">
<meta name="author" content="Łukasz Holeczek">
<meta name="keyword"
	content="Bootstrap,Admin,Template,Open,Source,AngularJS,Angular,Angular2,jQuery,CSS,HTML,RWD,Dashboard">
<link rel="shortcut icon"
	href="../resources/postprojregistration/img/favicon.png">

<title>Land Cost Details</title>



<style>
.panel-heading.collapsed .fa-chevron-down, .panel-heading .fa-chevron-right
	{
	display: none;
}

.panel-heading.collapsed .fa-chevron-right, .panel-heading .fa-chevron-down
	{
	display: inline-block;
}

i.fa {
	cursor: pointer;
	margin-right: 5px;
}

.collapsed ~.panel-body {
	padding: 0;
}

/* .add-jda-details {
  display: none;
} */
</style>


</head>

<!-- BODY options, add following classes to body to change options
          1. 'compact-nav'     	  - Switch sidebar to minified version (width 50px)
          2. 'sidebar-nav'		  - Navigation on the left
              2.1. 'sidebar-off-canvas'	- Off-Canvas
                  2.1.1 'sidebar-off-canvas-push'	- Off-Canvas which move content
                  2.1.2 'sidebar-off-canvas-with-shadow'	- Add shadow to body elements
          3. 'fixed-nav'			  - Fixed navigation
          4. 'navbar-fixed'		  - Fixed navbar
          5. 'footer-fixed'		  - Fixed navbar
      -->

<body class="navbar-fixed sidebar-nav fixed-nav">
	<header class="navbar">
		<div class="container-fluid">
			<button
				class="navbar-toggler mobile-toggler hidden-lg-up sidebar_btn"
				type="button"></button>
			<a class="navbar-brand" href="<%=request.getContextPath()%>/home"></a>
			<ul class="nav navbar-nav hidden-md-down">
				<li class="nav-item"><a
					class="nav-link navbar-toggler layout-toggler sidebar_btn" href="#"></a>
				</li>

			</ul>
		</div>
	</header>
	<div class="sidebar">
		<div class="sidebar-header">
			<img
				src="<%=request.getContextPath() %>/reraimage?IMG_ID=${projectReg.promoterDetailsModel.individualPhotoGraphPath.documentId}"
				onerror="this.src='<%=request.getContextPath()%>/resources/postprojregistration/img/avatars/user-top-icon.jpg';return false;"
				class="img-avatar" alt="User profile" />
			<div>
				<strong><%=user.getUserName()%></strong>
			</div>
			<!-- <div class="text-muted">
				<small>User &amp; user</small>
			</div> -->
		</div>
		<%@include file="/jsppages/transaction/postregistration/plot/plotleftnav.jsp"%>
	</div>
	<!-- Main content -->
	<main class="main">


	<div class="container-fluid">



		<div class="row">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-header">
							<i class="fa fa-align-justify"></i> Land Cost Details : Registration Number  -  ${projectRegistrationModel.projectRegistrationNo} 
					</div>
					<!--     <div id='success-message-area' data-alert class="alert-box alert show">
			                   Updated Successfully
			                    <a href="#" class="close-alert">&times;</a>
			                </div> -->

					<div class="card-block">
						<div class="container">
							<div class="panel-group" id="accordion">
								<div class="panel panel-primary">
									<div class="panel-heading card-header collapsed"
										data-toggle="collapse" data-target="#bar">
										<i class="fa fa-fw fa-chevron-down"></i> <i
											class="fa fa-fw fa-chevron-right"></i> Land Acquisition Cost
									</div>
										
							<div class="panel-body">
										<!-- The inside div eliminates the 'jumping' animation. -->
										<div class="collapse" id="bar">
											<form:form class="form-horizontal" autocomplete="off"
												action="updateplotCostDetails" modelAttribute="projectRegistrationModel"
												enctype="multipart/form-data" id="landCostAquiForm" method="post">
												
												<div style="border-style: ridge; padding: 20px; background-color: #F8F8F8;">
												<c:choose>
													<c:when test="${not empty projectRegistrationModel.projectDetailsModel.plotLandCostDetailsModel.plotLandAcquisitionCostModel}">
													
														<form:hidden path="projectRegId" />
														<form:hidden path="projectDetailsModel.projectDetailsId" />
														<form:hidden path="projectDetailsModel.plotLandCostDetailsModel.landCostDetailsId" />
														<form:hidden path="projectDetailsModel.plotLandCostDetailsModel.plotLandAcquisitionCostModel.landAcquisitionCostDetailsId" />
														<h5>Note :</h5>
														<ol>
														<li><p style="text-align:left"><font color="red">The cost should be as per the sale deed/ present guidance value, whichever is higher.</font></p></li>

														<li><p style="text-align:left"><font color="red">If the estimated cost needs to be updated, a request has to be sent to the authority for approval.</font></p></li>

														<!-- <li><p style="text-align:left"><font color="red">Land owner having his share to sell has to register within 7 days after submitting the first Quarter details
														and while entering the project name. The land owner should register by suffixing "(Land Owner Share)" after the project
														name. E.g. Whistling woods (Land Owner Share). If there are more than 1 land owner, then the suffix should be Land Owner Share 1,2,etc..,</font></p></li> -->
															</ol>
															<br/>
														
														<c:choose>
															<c:when test="${projectRegistrationModel.projectDetailsModel.plotLandCostDetailsModel.plotLandAcquisitionCostModel.landType == 'Own Land Of Promoter'}">
																<div class="form-group row">
&nbsp;&nbsp;&nbsp;&nbsp;
																	<label class="radio-inline" for="landType"> <input
																		type="radio" id="landType" name="landType"
																		value="Own Land Of Promoter" onclick="hidePlotJdaDetails();"
																		class='dynaselectfld requiredValFld' checked="checked">Own
																		Land Of Promoter

																	</label>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label
																		class="radio-inline" for="landType"> <input
																		value="JDA With Land owner" onclick="showPlotJdaDetails();"
																		type="radio" id=landType name="landType"
																		class='dynaselectfld requiredValFld'
																		value="JDA With Land owner">JDA With Land
																		owner
																	</label>
																</div>
															</c:when>
															<c:otherwise>
																<div class="form-group row">
&nbsp;&nbsp;&nbsp;&nbsp;
																	<label class="radio-inline" for="landType"> <input
																		type="radio" id="landType" name="landType"
																		value="Own Land Of Promoter" onclick="hidePlotJdaDetails();"
																		class='dynaselectfld requiredValFld'>Own Land
																		Of Promoter

																	</label>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label
																		class="radio-inline" for="landType"> <input
																		type="radio" id=landType name="landType" onclick="showPlotJdaDetails();"
																		class='dynaselectfld requiredValFld' checked="checked"
																		value="JDA With Land owner">JDA With Land
																		owner
																	</label>
																</div>
																</c:otherwise>
														</c:choose>
																
															<div id="jdaDetails" class="add-jda-details" >
														<!-- <p style="text-align:center"><font size=5px;>JDA With Land Owner</font></p> -->
														<div class="form-group row">
											<label class="col-md-3 form-control-label"
												for="numberOfPromoters">Number of Promoter(s)</label>
											<div class="col-md-3">
												<input type="number" id="numberOfPromoters"
													name="numberOfPromoters" value="${projectRegistrationModel.projectDetailsModel.plotLandCostDetailsModel.plotLandAcquisitionCostModel.numberOfPromoters}" 
													 class="form-control numericValFld requiredValFld"
													placeholder="only 0-9 digits are allowed"> <span
													class='requiredValFldMsg'> Please enter number of promoter(s).</span>
											</div>
											<label class="col-md-3 form-control-label"
												for="numberOfLandowners">Number of Landowner(s)</label>
											<div class="col-md-3">
												<input type="number" id="numberOfLandowners"
													name="numberOfLandowners" value="${projectRegistrationModel.projectDetailsModel.plotLandCostDetailsModel.plotLandAcquisitionCostModel.numberOfLandowners}" 
													 class="form-control numericValFld requiredValFld"
													placeholder="only 0-9 digits are allowed"> <span
													class='requiredValFldMsg'> Please enter number of Landowner(s).</span>
											</div>
										</div>
														</div>
															

														<%-- <div class="form-group row">

															<label class="col-md-3 form-control-label"
																for="landTitle"> Title of the land </label>
															<div class="col-md-9">
																<input name="landTitle"
																	value="${projectRegistrationModel.projectDetailsModel.landCostDetailsModel.landAcquisitionCostModel.landTitle}"
																	id="landTitle" class="form-control requiredValFld" />
																<span class='requiredValFldMsg'> Please enter
																	land Title.</span>
															</div>
														</div> --%>

														<div class="form-group row">
															<label class="col-md-3 form-control-label"
																for="costOfOwnership">Cost of Land ownership (as per section 5.1(i) of the rule)</label>
															<div class="col-md-9">
																<input type="number" name="costOfOwnership"
																	value="${projectRegistrationModel.projectDetailsModel.plotLandCostDetailsModel.plotLandAcquisitionCostModel.costOfOwnership}"
																	id="costOfOwnership" name="costOfOwnership" 
																	class="form-control requiredValFld" placeholder="" readOnly />
																<span class='requiredValFldMsg'> Please enter costOfOwnership.</span>
															</div>
														</div>
														
										
															<%-- <br/>
														<c:forEach items="${projectRegistrationModel.projectDetailsModel.plotLandCostDetailsModel.plotLandAcquisitionCostModel.bankDetailsModel}"
															var="amountModel">
															<div class="form-group row">
																<label class="col-md-3 form-control-label" for="amount">Amount withdrawn from the bank for the purpose of the project (INR)</label>
																<div class="col-md-9">
																	<input type="hidden" name="amtwithdrawBankDelsId" value="${amountModel.amtwithdrawBankDelsId}" />
																	 <input	value="${amountModel.amount}" id="amount" name="amount" class="form-control requiredValFld"
																		placeholder="only 0-9 digits are allowed" /> <span
																		class='requiredValFldMsg'> Please enter amount.</span>
																</div>
															</div>
															<div class="form-group row " style="">
																<label class="col-md-3 form-control-label"
																	for="amtWithDrawnDate">Date</label>
																<div class="col-md-3">
																	<fmt:formatDate type="date" pattern="yyyy-MM-dd"
																		dateStyle="short" var="formateddate"
																		value="${amountModel.amtWithDrawnDate.time}" />
																	<input type="date" name="amtWithDrawnDate"
																		value="${formateddate}"
																		class="form-control requiredValFld" /> <span
																		class='requiredValFldMsg'> Please enter date.</span>
																</div>
															</div>
															<div class="form-group row " style="">
															<label class="col-md-3 form-control-label"
																for="file-input">Certificate from Chartered Account</label>
															<div class="col-sm-3 ">
															
																<input type="file" name="certFromChartedAcc" class=""
																	rel="txtTooltip"
																	title="Only image or pdf file is allowed. file size upto 1 MB"
																	data-toggle="tooltip" data-placement="bottom" /> <a
																	href='<%=request.getContextPath() %>/download?DOC_ID=${amountModel.certFromChartedAcc.documentId}'>${amountModel.certFromChartedAcc.fileName}</a>
															</div>
															</div>
														</c:forEach> --%>
													</c:when>
													<c:otherwise>
														<h5>Note :</h5>
														<br/>
														<ol>
														<li><p style="text-align:left"><font color="red">The cost should be as per the sale deed/ present guidance value, whichever is higher.</font></p></li>

														<li><p style="text-align:left"><font color="red">If the estimated cost needs to be updated, a request has to be sent to the authority for approval.</font></p></li>

														<!-- <li><p style="text-align:left"><font color="red">Land owner having his share to sell has to register within 7 days after submitting the first Quarter details
														and while entering the project name. The land owner should register by suffixing "(Land Owner Share)" after the project
														name. E.g. Whistling woods (Land Owner Share). If there are more than 1 land owner, then the suffix should be Land Owner Share 1,2,etc..,</font></p></li> -->
															</ol>
															<br/>
														<div class="form-group row">
&nbsp;&nbsp;&nbsp;&nbsp;
															<label class="radio-inline" for="landType"> <input
																type="radio" id="landType" name="landType"
																value="Own Land Of Promoter"
																class='dynaselectfld requiredValFld' onclick="hidePlotJdaDetails();" >Own
																Land Of Promoter

															</label>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label
																class="radio-inline" for="landType"> <input
																type="radio" id=landType name="landType" onclick="showPlotJdaDetails();"
																value="JDA With Land owner">JDA With Land owner


															</label>

														</div>
														<!-- <div class="form-group row">
															<label class="col-md-3 form-control-label"
																for="landTitle"> Title of the land </label>
															<div class="col-md-9">
																<input type="text" id="landTitle" name="landTitle"
																	class="form-control requiredValFld"
																	placeholder="landTitle"> <span
																	class='requiredValFldMsg'> Please enter
																	landTitle.</span>
															</div>
														</div> -->
														<div id="jdaDetails" class="add-jda-details" style="display: none;" >
														<div class="form-group row">
											<label class="col-md-3 form-control-label"
												for="numberOfPromoters">Number of Promoter(s)</label>
											<div class="col-md-3">
												<input type="number" id="numberOfPromoters"
													name="numberOfPromoters" value=""  class="form-control numericValFld requiredValFld"
													placeholder="only 0-9 digits are allowed"> <span
													class='requiredValFldMsg'> Please enter number of promoter(s).</span>
											</div>
											<label class="col-md-3 form-control-label"
												for="numberOfLandowners">Number of Landowner(s)</label>
											<div class="col-md-3">
												<input type="number" id="numberOfLandowners"
													name="numberOfLandowners" value=""  class="form-control numericValFld requiredValFld"
													placeholder="only 0-9 digits are allowed"> <span
													class='requiredValFldMsg'> Please enter number of Landowner(s).</span>
											</div>
										</div>
														</div>
													<div class="form-group row">
															<label class="col-md-3 form-control-label"
																for="costOfOwnership">Cost of Land ownership (as per section 5.1(i) of the rule)</label>
															<div class="col-md-9">
																<input type="number" name="costOfOwnership"
																	<%-- value="${projectRegistrationModel.projectDetailsModel.landCostDetailsModel.landAcquisitionCostModel.costOfOwnership}" --%>
																	id="costOfOwnership" name="costOfOwnership" value="${projectRegistrationModel.projectDetailsModel.costOfLand}" readOnly
																	class="form-control requiredValFld" placeholder=""  />
																<span class='requiredValFldMsg'> Please enter costOfOwnership.</span>
															</div>
														</div>
														
														<!-- <div class="form-group row">
															<label class="col-md-3 form-control-label" for="amount">Amount
																withdrawn from the bank for Land Procurement (INR)</label>
															<div class="col-md-9">
																<input type="number" id="amount" name="amount" class="form-control requiredValFld"	placeholder="only 0-9 digits are allowed"> 
																<span class='requiredValFldMsg'> Please enter amount.</span>
															</div>
														</div>
														<div class="form-group row">
															<label class="col-md-3 form-control-label" for="amtWithDrawnDate">Date</label>
															<div class="col-md-3">
																<input type="date" id="amtWithDrawnDate" name="amtWithDrawnDate" class="form-control requiredValFld" placeholder="MM/dd/YYYY"> 
																<span class='requiredValFldMsg'> Please enter date.</span>
															</div>
														</div>

														<div class="form-group row">
															<label class="col-md-3 form-control-label"
																for="file-input">Certificate from Chartered Account</label>
															<div class="col-md-9">
																<input type="file" id="certFromChartedAcc"
																	name="certFromChartedAcc"
																	title="Only image or pdf file is allowed. file size upto 1 MB"
																	class="form-control requiredValFld"> <span
																	class='requiredValFldMsg'> Please Attach a file.</span>
															</div>
														</div> -->

													</c:otherwise>
												</c:choose>
												</div>
												<div class="form-group row">
													<input type="button"
														class="btn btn-sm btn-success  pull-right"
														id="landCostAquId" value="Save" />
													<!-- <i class="fa fa-dot-circle-o"></i> Submit</button>
													<button type="reset"
														class="btn btn-sm btn-danger  pull-right"
														onclick="resetlandCostAquiForm()">
														<i class="fa fa-ban"></i> Reset
													</button> -->
												</div>
												</form:form>
										</div>
										
									</div>
									
									
								</div>
							</div>

								<!------------------------------------- JDA deatils --------------------------------------->
								
							<c:if test="${projectRegistrationModel.projectDetailsModel.plotLandCostDetailsModel.plotLandAcquisitionCostModel.landType=='JDA With Land owner' 
							&& (projectRegistrationModel.projectDetailsModel.plotLandCostDetailsModel.plotLandAcquisitionCostModel.numberOfLandowners>0
							|| projectRegistrationModel.projectDetailsModel.plotLandCostDetailsModel.plotLandAcquisitionCostModel.numberOfPromoters>0)}">
							<div class="panel-group" id="accordion">
								<div class="panel panel-primary">
									<div class="panel-heading card-header collapsed"
										data-toggle="collapse" data-target="#bar4">
										<i class="fa fa-fw fa-chevron-down"></i> <i
											class="fa fa-fw fa-chevron-right"></i> JDA Details

									</div>
									<div class="panel-body">
										<!-- The inside div eliminates the 'jumping' animation. -->
										<div class="collapse" id="bar4">
											<form:form class="form-horizontal" autocomplete="off"
												action="updatePlotAcquisitionJDADetails"
												modelAttribute="projectRegistrationModel"
												enctype="multipart/form-data" id="landCostAquiJDAForm"
												method="post">
												
												<br />
												<form:hidden path="projectRegId" />
														
														<form:hidden
															path="projectDetailsModel.plotLandCostDetailsModel.plotLandAcquisitionCostModel.projectJDADetailsModel.projectJDAId" />
														<form:hidden path="projectDetailsModel.projectDetailsId" />
												<div style="border-style: ridge; padding: 20px; background-color: #F8F8F8;">
												<c:choose>
												<%-- <c:out value="${projectDetailsModel.landCostDetailsModel.landAcquisitionCostModel.projectJDADetailsModel.promoterList.size()}"></c:out> --%>
													<c:when test="${JDAStatus=='YES'}"> 
													<%-- || (projectDetailsModel.landCostDetailsModel.landAcquisitionCostModel.projectJDADetailsModel.promoterList)}"> --%>
														
														<c:if test="${projectRegistrationModel.projectDetailsModel.plotLandCostDetailsModel.plotLandAcquisitionCostModel.numberOfPromoters>0}">
													<c:forEach var="promoterincrement" begin="0" end="${numberOfPromoters-1}"><!--end should be captured from backend  -->
                                    <div class="form-group row">
											<label class="col-md-3 form-control-label" for="noOfUnitsOfShare">Promoter ${promoterincrement+1} : No of Units of share</label>
											<div class="col-md-3">
											<input type="hidden" id="promoterName" name="promoterName" value="promoter ${promoterincrement+1}">
												<input type="number" id="noOfUnitsOfShare" name="noOfUnitsOfShare_${promoterincrement}" 
													class="form-control requiredValFld numericValFld "
													placeholder="only 0-9 digits are allowed"> <span
													class='requiredValFldMsg'> Please enter number of units of share.</span>
											</div>
											<label class="col-md-3 form-control-label" for="percentageOfShare">Promoter ${promoterincrement+1} : Percentage of share</label>
											<div class="col-md-3">
												<input type="number" maxlength="3" id="percentageOfShare" name="percentageOfShare_${promoterincrement}"
													class="form-control numericValFld requiredValFld"
													placeholder="only 0-9 digits are allowed"> <span
													class='requiredValFldMsg'> Please enter number of units of share.</span>
											</div>
										</div>
                                  					</c:forEach>
                                  					</c:if>
                                  					<c:if test="${projectRegistrationModel.projectDetailsModel.plotLandCostDetailsModel.plotLandAcquisitionCostModel.numberOfLandowners>0}"> 
                                  					<c:forEach var="landownerincrement" begin="0" end="${numberOfLandowners-1}"><!--end should be captured from backend  -->
                                 
														
								<div class="form-group row">
                                    <input type="hidden" id="landOwner" name="landOwner" value="landowner ${landownerincrement+1}">
											<label class="col-md-6 form-control-label" for="isApplicable">Whether land owner ${landownerincrement+1} is going to sell his/her share?</label>
											<input type="radio" name="isApplicable_${landownerincrement}" 
											id="isApplicable_${landownerincrement}" registerCount="${landownerincrement}" onclick="showLandOwnerRegisterDetails(this)" value="Yes" class="requiredValFld">Yes <span
																		class='requiredValFldMsg'> Please select yes/No</span>

					<input type="radio" name="isApplicable_${landownerincrement}" value="No" class="requiredValFld" 
					id="isApplicable_${landownerincrement}" registerCount="${landownerincrement}" onclick="hideLandOwnerRegisterDetails(this)">No 
					<span class='requiredValFldMsg'> Please select yes/No </span>
								</div>
								<br/>
								<div class="form-group row" id="landownerRegister_${landownerincrement}" style="display: none;">
											<label class="col-md-6 form-control-label" for="isApplicable">Is the land owner ${landownerincrement+1} Registered with RERA?</label>
											<input type="radio" name="isRegistered_${landownerincrement}" 
											id="isApplicable_${landownerincrement}" landCount="${landownerincrement}" onclick="showLandOwnerDetails(this)" value="Yes" class="requiredValFld"> Yes <span
																		class='requiredValFldMsg'> Please select yes/No</span>

					<input type="radio" name="isRegistered_${landownerincrement}" value="No" class="requiredValFld" 
					id="isRegistered_${landownerincrement}" landCount="${landownerincrement}" onclick="hideLandOwnerDetails(this)">No 
					<span class='requiredValFldMsg'> Please select yes/No </span>
								</div>
								
								<br/>
								<div id="landownerRegNo_${landownerincrement}" style="display: none;">
								<div class="form-group row">
								<label class="col-md-5 form-control-label" for="landOwnerRegNo">Land Owner ${landownerincrement+1} RERA Registration Number</label>
											<div class="col-md-7">
											<input type="text" name="landOwnerRegNo_${landownerincrement}" class="form-control requiredValFld" placeholder="Land Owner Registration Number" />
										<span class='requiredValFldMsg'> Land Owner RERA Registration Number.</span>
															</div>
														</div>
								</div>
								<div id="landownerdetails_${landownerincrement}" style="display: none;">
										<p style="text-align:left"><font color="red"> * Land owner having his share to sell has to register within 7 days after submitting the first Quarter details
														and while entering the project name. The land owner should register by suffixing "(Land Owner Share)" after the project
														name. E.g. Whistling woods (Land Owner Share). If there are more than 1 land owner, then the suffix should be Land Owner Share 1,2,etc..,</font></p>
														<br/>
								</div>
														
										<table class="table table-bordered table-striped table-condensed" id="landowner-list">
                                <thead>
                                    <tr>
                                        <th colspan="2">Land Owner ${landownerincrement+1} Details</th>
                                    </tr>
                                </thead>
                                <tbody >
                                   
                                    <tr> 
                                    	<td>Name of the Land Owner</td>
                                        <td id="noOfFloors"><input class="onlycharValFld" type="text" name="landownerName_${landownerincrement}" value=""/></td>
                                    </tr>
                                    <tr> 
                                    	<td>Mobile Number</td>
                                        <td id="noOfFloors"><input type="number"  name="landownerMobileNo_${landownerincrement}" value="" rel="txtTooltip" 
                                        title="Only 10 digits of mobile number is allowed " data-toggle="tooltip" data-placement="bottom" class="form-control input-sm mobileValFld requiredValFld" maxlength="10"/>
                                        	<%-- <div class="col-sm-3">
							<form:input path="agentDetailsModel.firmMobileNo" rel="txtTooltip" title="Only 10 digits of mobile number is allowed " data-toggle="tooltip" data-placement="bottom" class="form-control input-sm mobileValFld requiredValFld " maxlength="10"/>
						
						<span class='requiredValFldMsg'> Please enter Mobile Number.</span>
						</div> --%>
                                        
                                        </td>
                                    </tr>
                                     <tr> 
                                    	<td>Address</td>
                                        <td id="noOfFloors"><textarea rows="2" cols="23"  name="landownerAddress_${landownerincrement}" value=""></textarea></td>
                                    </tr>
                                     <tr> 
                                    	<td>Email ID</td>
                                        <td id="noOfFloors"><input type="email" name="landownerEmailId_${landownerincrement}" value=""
                                        title="Only xyz@gmail.com is allowed " data-toggle="tooltip" data-placement="bottom" class="form-control input-sm emailValFld requiredValFld"
                                         /></td>
                                    </tr>
                                    <tr> 
                                    	<td>Percentage Of Share</td>
                                        <td id="noOfFloors"><input type="number" maxlength="3" name="landownerPercShare_${landownerincrement}" class="percentValFld"/></td>
                                    </tr>
                               
                                </tbody>
                            </table>
                            
                                  					</c:forEach>
                                  					</c:if>
                                  					<p style="text-align:right"><font color="red">* Once data saved cannot be edited</font></p>
										<div class="form-group row">
											<input type="button"
												class="btn btn-sm btn-success  pull-right"
												id="landCostAquJDAId" value="Save" />
											<!-- <i class="fa fa-dot-circle-o"></i> Submit</button> -->
											<!-- <button type="reset"
												class="btn btn-sm btn-danger  pull-right"
												onclick="resetlandCostAquiForm()">
												<i class="fa fa-ban"></i> Reset
											</button> -->
										</div>
													</c:when>
													<c:otherwise>
													<p style="text-align:center"><font size="5px" color="green">JDA Details updated Successfully</font></p>
										
														<c:if test="${projectRegistrationModel.projectDetailsModel.plotLandCostDetailsModel.plotLandAcquisitionCostModel.numberOfPromoters>0}">
													<c:forEach items="${projectRegistrationModel.projectDetailsModel.plotLandCostDetailsModel.plotLandAcquisitionCostModel.projectJDADetailsModel.promoterList}" var="obj">
                                    <div class="form-group row">
											<label class="col-md-3 form-control-label" for="noOfUnitsOfShare"><c:out value="${obj.promoterName}"></c:out> : No of Units of share</label>
											<div class="col-md-3">
											<input type="hidden" id="promoterName" name="promoterName" value="${obj.promoterName}">
												<input type="number" id="noOfUnitsOfShare" name="noOfUnitsOfShare" value="${obj.noOfUnitsOfShare}"
													class="form-control requiredValFld"
													placeholder="only 0-9 digits are allowed"> <span
													class='requiredValFldMsg'> Please enter number of units of share.</span>
											</div>
											<label class="col-md-3 form-control-label" for="percentageOfShare"><c:out value="${obj.promoterName}"></c:out> : Percentage of share</label>
											<div class="col-md-3">
												<input type="number" id="percentageOfShare" name="percentageOfShare" value="${obj.percentageOfShare}"
													class="form-control numericValFld requiredValFld"
													placeholder="only 0-9 digits are allowed"> <span
													class='requiredValFldMsg'> Please enter number of units of share.</span>
											</div>
										</div>
                                  					</c:forEach>
                                  					</c:if>
                                  					<c:if test="${projectRegistrationModel.projectDetailsModel.plotLandCostDetailsModel.plotLandAcquisitionCostModel.numberOfLandowners>0}"> 
                                  					<%int count=-1; %>
                                  					<c:forEach items="${projectRegistrationModel.projectDetailsModel.plotLandCostDetailsModel.plotLandAcquisitionCostModel.projectJDADetailsModel.landOwnerList}" var="obj">
                                    <% count++; %>
                                    <div class="form-group row">
                                    <input type="hidden" id="landOwner" name="landOwner" value="${obj.landOwner}">
											<label class="col-md-6 form-control-label" for="isApplicable">Whether <c:out value="${obj.landOwner}"></c:out> is going to sell his/her share?</label>
											<c:choose>
											<c:when test="${obj.isApplicable=='Yes'}">
											<input type="radio" name="isApplicable_<%=count%>"
																		value="Yes" class="requiredValFld" checked="checked">Yes <span
																		class='requiredValFldMsg'> Please select yes/No</span>

																		<input type="radio" name="isApplicable_<%=count%>" value="No"
																		class="requiredValFld">No <span
																		class='requiredValFldMsg'> Please select yes/No
																	</span>
																	</c:when>
																	<c:otherwise>
																				<input type="radio" name="isApplicable_<%=count%>"
																		value="Yes" class="requiredValFld" >Yes <span
																		class='requiredValFldMsg'> Please select yes/No</span>

																		<input type="radio" name="isApplicable_<%=count%>" value="No"
																		class="requiredValFld" checked="checked">No <span
																		class='requiredValFldMsg'> Please select yes/No
																	</span>
																	</c:otherwise>
										</c:choose>
										</div>
										<c:if test="${obj.isApplicable=='Yes'}">
										<div class="form-group row">
										<label class="col-md-6 form-control-label" for="isApplicable">Is the <c:out value="${obj.landOwner}">
										</c:out> Registered with RERA?</label>
										<c:choose>
											<c:when test="${obj.isRegistered=='Yes'}">
											<input type="radio" name="isRegistered_<%=count%>"
																		value="Yes" class="requiredValFld" checked="checked">Yes <span
																		class='requiredValFldMsg'> Please select yes/No</span>

																		<input type="radio" name="isRegistered_<%=count%>" value="No"
																		class="requiredValFld">No <span
																		class='requiredValFldMsg'> Please select yes/No
																	</span>
																	</c:when>
																	<c:otherwise>
																				<input type="radio" name="isRegistered_<%=count%>"
																		value="Yes" class="requiredValFld" >Yes <span
																		class='requiredValFldMsg'> Please select yes/No</span>

																		<input type="radio" name="isRegistered_<%=count%>" value="No"
																		class="requiredValFld" checked="checked">No <span
																		class='requiredValFldMsg'> Please select yes/No
																	</span>
																	</c:otherwise>
										</c:choose>
										</div>
										</c:if>
										<c:if test="${obj.isRegistered=='Yes'}">
										<div class="form-group row">
								<label class="col-md-6 form-control-label" for="landOwnerRegNo">land owner ${landownerincrement+1} RERA registration number</label>
											<div class="col-md-6">
											<input type="text" name="landOwnerRegNo_${landownerincrement}" value="${obj.landOwnerRegNo}" class="form-control requiredValFld" placeholder="Land Owner Registration Number" />
										<span class='requiredValFldMsg'> Land Owner Registration Number.</span>
															</div>
										</div>
										</c:if>
										<c:if test="${obj.isRegistered=='No'}">
										<p style="text-align:left"><font color="red"> * Land owner having his share to sell has to register within 7 days after submitting the first Quarter details
														and while entering the project name. The land owner should register by suffixing "(Land Owner Share)" after the project
														name. E.g. Whistling woods (Land Owner Share). If there are more than 1 land owner, then the suffix should be Land Owner Share 1,2,etc..,</font></p>
										</c:if>
										
										<table class="table table-bordered table-striped table-condensed" id="landowner-list">
                                <thead>
                                    <tr>
                                        <th colspan="2"><c:out value="${obj.landOwner}"></c:out> Details</th>
                                    </tr>
                                </thead>
                                <tbody >
                                   
                                    <tr> 
                                    	<td>Name of the Land Owner</td>
                                        <td id="noOfFloors"><input type="text" name="landownerName" value="${obj.landownerName}"/></td>
                                    </tr>
                                    <tr> 
                                    	<td>Mobile Number</td>
                                        <td id="noOfFloors"><input type="number" maxlength="10" name="landownerMobileNo" value="${obj.landownerMobileNo}"/></td>
                                    </tr>
                                     <tr> 
                                    	<td>Address</td>
                                        <td id="noOfFloors"><textarea rows="2" cols="23"  name="landownerAddress"><c:out value="${obj.landownerAddress}"></c:out></textarea></td>
                                    </tr>
                                     <tr> 
                                    	<td>Email ID</td>
                                        <td id="noOfFloors"><input type="email" name="landownerEmailId" value="${obj.landownerEmailId}"/></td>
                                    </tr>
                                     <tr> 
                                    	<td>Percentage Of Share</td>
                                        <td id="noOfFloors"><input type="number" maxlength="3" name="landownerPercShare" value="${obj.landownerPercShare}"/></td>
                                    </tr>
                               
                                </tbody>
                            </table>
                                  					</c:forEach>
                                  					</c:if> 
										
										</c:otherwise>
										</c:choose>
										</div>
										
										</form:form>
										</div>
									</div>
								</div>
							</div>
							</c:if>
							
									
									
								<!-- -------------------------------------------Approval Costs--------------------------------------------------------------- -->
								
								<div class="panel-group" id="accordion">
									<div class="panel panel-primary">
										<div class="panel-heading card-header collapsed"
											data-toggle="collapse" data-target="#bar2">
											<i class="fa fa-fw fa-chevron-down"></i> <i
												class="fa fa-fw fa-chevron-right"></i>Approval Costs
										</div>
										<div class="panel-body">
											<div class="collapse" id="bar2">
												<form:form class="form-horizontal" autocomplete="off"
													action="updatePlotApprovalCostDetails" modelAttribute="projectRegistrationModel"
													enctype="multipart/form-data" id="ApprovalCostForm" method="post">
													
													
															<form:hidden path="projectRegId" />
													<form:hidden path="projectDetailsModel.projectDetailsId" />
													<form:hidden path="projectDetailsModel.plotLandCostDetailsModel.landCostDetailsId" />
													<%-- <form:hidden path="projectDetailsModel.plotLandCostDetailsModel.approvalCostModel.approveCostDetlsId" /> --%>
															<div class="form-group row"></div>
															<div class="form-group row">
																<label class="col-md-12 form-control-label"
																	for="email-input"><h6>Amount withdrawn
																		from the bank for the purpose of the project (INR)</h6></label>
																<div class="row">
																	<div style="padding-left: 50px; padding-right: 50px;">
																		<table class="table table-bordered table-striped table-condensed" id="approval-list">
																			<thead>
																				<tr>
																					<th>Sl No.</th>
																					<th>Particulars</th>
																					<th>Is Applicable</th>
																					<th>Cost Incurred (INR)</th>
																				</tr>
																			</thead>
																			<tbody id="tb">
																			<% int costCount = -1; %>
																			 <c:choose>
														<c:when test="${empty projectRegistrationModel.projectDetailsModel.plotLandCostDetailsModel.approvalCostModel.approvalCostDetails}"> 
																			<tr>
																				<td>1</td>
																				<td>
																				<input type="text" readonly name="approvalParticular" value="Project Approval" class="form-control requiredValFld totalSum"
																					placeholder="only digits are allowed"> 
																					<span class='requiredValFldMsg'> Please enter Project Approval.</span></td>
																				<td><input type="radio" name="isApplicable_0" value="Yes" class="" approvalCount="0" class="requiredValFld" id="isApplicable_0" onclick="showApprovalCost(this);">Yes
																				 <span class='requiredValFldMsg'> Please select yes/No</span>
																					<input type="radio" name="isApplicable_0" value="No" class="" approvalCount="0" class="requiredValFld" id="isApplicable_0" onclick="hideApprovalCost(this);">No
																					 <span class='requiredValFldMsg'> Please select yes/No </span></td>
																				<td>
																				<input type="number" name="approvalAmt" value="projectApprovalAmt" id="approvalAmt_0" class="form-control  totalSum" placeholder="only digits are allowed"> 
																					<span class='requiredValFldMsg'> Please enter Project Approval.</span></td>

																			</tr>


																			<tr>
																				<td>2</td>
																				<td>
																				<input type="text" readonly name="approvalParticular" value="Stamps Duty" class="form-control requiredValFld totalSum"
																					placeholder="only digits are allowed"> 
																					<span class='requiredValFldMsg'> Please enter Project Approval.</span></td>
																				<td><input type="radio" name="isApplicable_1" value="Yes" class="" approvalCount="1" class="requiredValFld" id="isApplicable_1" onclick="showApprovalCost(this);">Yes
																				<span class='requiredValFldMsg'> Please select yes/No</span>
																					<input type="radio" name="isApplicable_1" value="No" class="" approvalCount="1" class="requiredValFld" id="isApplicable_1" onclick="hideApprovalCost(this);">No
																					 <span class='requiredValFldMsg'> Please select yes/No </span></td>
																				<td>
																				<input type="number" name="approvalAmt" value="stampsDutyAmt" id="approvalAmt_1" class="form-control requiredValFld totalSum"
																					placeholder="only digits are allowed"> 
																					<span class='requiredValFldMsg'> Please enter Stamps Duty.</span></td>

																			</tr>
																			<tr>
																				<td>3</td>
																				<td>
																				<input type="text" readonly name="approvalParticular" value="Transfer Charges" class="form-control requiredValFld totalSum"
																					placeholder="only digits are allowed"> 
																					<span class='requiredValFldMsg'> Please enter Project Approval.</span></td>
																				<td><input type="radio" name="isApplicable_2" value="Yes" class="" approvalCount="2" class="requiredValFld" id="isApplicable_2" onclick="showApprovalCost(this);">Yes 
														 <span class='requiredValFldMsg'> Please select yes/No</span> 
																					<input type="radio" name="isApplicable_2" value="No" class="" approvalCount="2" class="requiredValFld" id="isApplicable_2" onclick="hideApprovalCost(this);">No
																					 <span class='requiredValFldMsg'> Please select yes/No </span></td>
																				<td><input type="number" name="approvalAmt" value="transferCharges" id="approvalAmt_2" class="form-control requiredValFld totalSum"
																					placeholder="only digits are allowed"> <span class='requiredValFldMsg'> Please enter Transfer Charges</span></td>

																			</tr>
																			<tr>
																				<td>4</td>
																				<td>
																				<input type="text" readonly name="approvalParticular" value="Registration Charges" class="form-control requiredValFld totalSum"
																					placeholder="only digits are allowed"> 
																					<span class='requiredValFldMsg'> Please enter Project Approval.</span></td>
																				<td><input type="radio" name="isApplicable_3" value="Yes" class="" approvalCount="3" class="requiredValFld" id="isApplicable_3" onclick="showApprovalCost(this);">Yes 
														 <span class='requiredValFldMsg'> Please select yes/No</span> 
																					<input type="radio" name="isApplicable_3" value="No" class=""approvalCount="3" class="requiredValFld" id="isApplicable_3" onclick="hideApprovalCost(this);">No 
																					<span class='requiredValFldMsg'> Please select yes/No </span></td>
																				<td><input type="number" name="approvalAmt" value="registrationCharges" id="approvalAmt_3" class="form-control requiredValFld totalSum" placeholder="only digits are allowed"> 
																				<span class='requiredValFldMsg'> Please enter Registration Charges.</span></td>
																			
																			<tr>
																				<td>5</td>
																				<td>
																				<input type="text" readonly name="approvalParticular" value="Conversion Charges" class="form-control requiredValFld totalSum"
																					placeholder="only digits are allowed"> 
																					<span class='requiredValFldMsg'> Please enter Project Approval.</span></td>
																				<td><input type="radio" name="isApplicable_4" value="Yes" class="" approvalCount="4" class="requiredValFld" id="isApplicable_4" onclick="showApprovalCost(this);">Yes 
														 <span class='requiredValFldMsg'> Please select yes/No</span> 
																					<input type="radio" name="isApplicable_4" value="No" class="" approvalCount="4" class="requiredValFld" id="isApplicable_4" onclick="hideApprovalCost(this);">No 
																					<span class='requiredValFldMsg'> Please select yes/No </span></td>
																				<td><input type="number" name="approvalAmt" value="conversionCharges" id="approvalAmt_4" class="form-control requiredValFld totalSum" placeholder="only digits are allowed">  
																				<span class='requiredValFldMsg'> Please enter Conversion Charges.</span></td>

																			</tr>
																			<tr>
																				<td>6</td>
																				<td>
																				<input type="text" readonly name="approvalParticular" value="NOC-For CC" class="form-control requiredValFld totalSum"
																					placeholder="only digits are allowed"> 
																					<span class='requiredValFldMsg'> Please enter Project Approval.</span></td>
																				<td><input type="radio" name="isApplicable_5" value="Yes" class="" approvalCount="5" class="requiredValFld" id="isApplicable_5" onclick="showApprovalCost(this);">Yes 
														 <span class='requiredValFldMsg'> Please select yes/No</span> 
																					<input type="radio" name="isApplicable_5" value="No" class="" approvalCount="5" class="requiredValFld" id="isApplicable_5" onclick="hideApprovalCost(this);">No 
																					<span class='requiredValFldMsg'> Please select yes/No </span></td>
																				<td><input type="number" name="approvalAmt" value="noObjectionCertAmtForCC" id="approvalAmt_5" class="form-control requiredValFld totalSum" placeholder="only digits are allowed"> 
																				<span class='requiredValFldMsg'> Please enter noObjectionCertAmtForCC Charges.</span></td>

																			</tr>
																			<tr>
																				<td>7</td>
																				<td>
																				<input type="text" readonly name="approvalParticular" value="NOC-For KSPCB" class="form-control requiredValFld totalSum"
																					placeholder="only digits are allowed"> 
																					<span class='requiredValFldMsg'> Please enter Project Approval.</span></td>
																				<td><input type="radio" name="isApplicable_6" value="Yes" class="" approvalCount="6" class="requiredValFld" id="isApplicable_6" onclick="showApprovalCost(this);">Yes
														 <span class='requiredValFldMsg'> Please select yes/No</span> 
																					<input type="radio" name="isApplicable_6" value="No" class="" approvalCount="6" class="requiredValFld" id="isApplicable_6" onclick="hideApprovalCost(this);">No
																					<span class='requiredValFldMsg'> Please select yes/No </span></td>
																				<td><input type="number" name="approvalAmt" value="noObjectionCertAmtFORKSPCB" id="approvalAmt_6" class="form-control requiredValFld totalSum" placeholder="only digits are allowed"> 
																				<span class='requiredValFldMsg'> Please enter Conversion Charges.</span></td>
																			</tr>
																			<tr>
																				<td>8</td>
																				<td>
																				<input type="text" readonly name="approvalParticular" value="NOC-For BWSSB" class="form-control requiredValFld totalSum"
																					placeholder="only digits are allowed"> 
																					<span class='requiredValFldMsg'> Please enter Project Approval.</span></td>
																				<td><input type="radio" name="isApplicable_7" value="Yes" class="" approvalCount="7" class="requiredValFld" id="isApplicable_7" onclick="showApprovalCost(this);">Yes
														 <span class='requiredValFldMsg'> Please select yes/No</span> 
																					<input type="radio" name="isApplicable_7" value="No" class="" approvalCount="7" class="requiredValFld" id="isApplicable_7" onclick="hideApprovalCost(this);">No 
																					<span class='requiredValFldMsg'> Please select yes/No </span></td>
																				<td><input type="number" name="approvalAmt" value="noObjectionCertAmtForBWSSB" id="approvalAmt_7" class="form-control requiredValFld totalSum" placeholder="only digits are allowed"> 
																				<span class='requiredValFldMsg'> Please enter BWSSB Charges.</span></td>

																			</tr>
																			<tr>
																				<td>9</td>
																				<td>
																				<input type="text" readonly name="approvalParticular" value="NOC-For BESCOM" class="form-control requiredValFld totalSum"
																					placeholder="only digits are allowed"> 
																					<span class='requiredValFldMsg'> Please enter Project Approval.</span></td>
																				<td><input type="radio" name="isApplicable_8" value="Yes" class="" approvalCount="8" class="requiredValFld" id="isApplicable_8" onclick="showApprovalCost(this);">Yes 
														 <span class='requiredValFldMsg'> Please select yes/No</span> 
																					<input type="radio" name="isApplicable_8" value="No" class="" approvalCount="8" class="requiredValFld" id="isApplicable_8" onclick="hideApprovalCost(this);">No 
																					<span class='requiredValFldMsg'> Please select yes/No </span></td>
																				<td><input type="number" name="approvalAmt" value="noObjectionCertAmtForBESCOM" id="approvalAmt_8" class="form-control requiredValFld totalSum" placeholder="only digits are allowed"> 
																				<span class='requiredValFldMsg'> Please enter BESCOM Charges.</span></td>

																			</tr>
																			
																			

																			<tr>
																				<td>10</td>
																				
																				<td>
																				<input type="text" readonly name="approvalParticular" value="Taxes" class="form-control requiredValFld totalSum"
																					placeholder="only digits are allowed"> 
																					<span class='requiredValFldMsg'> Please enter Project Approval.</span></td>
																				
																				<td><input type="radio" name="isApplicable_9" value="Yes" class="" approvalCount="9" class="requiredValFld" id="isApplicable_9" onclick="showApprovalCost(this);">Yes
																				  <span class='requiredValFldMsg'> Please select yes/No</span> 
																					<input type="radio" name="isApplicable_9" value="No" class="" approvalCount="9" class="requiredValFld" id="isApplicable_9" onclick="hideApprovalCost(this);">No 
																					 <span class='requiredValFldMsg'> Please select yes/No </span> </td>
																				<td><input type="number" name="approvalAmt" value="taxAmt" id="approvalAmt_9" class="form-control totalSum" placeholder="only digits are allowed"> 
																				 <span class='requiredValFldMsg'> Please enter Taxes.</span></td>

																			</tr>
																			<tr>
																				<td colspan="3" style="padding-left: 25%;"><input
																					type="button" value="Total Cost for Approvals" class="btn btn-info" id="btn-approval" /></td>
																				<td ><input type="text" name="totalCostOfApprovals" 
																					class="form-control requiredValFld totalSumOfApproval" readonly="readonly"> <span
																					class='requiredValFldMsg'> Please click on Total Cost for Approvals button.</span></td>
                                                                                 
																			</tr>
																		
																		
																		
																	
																		<nav>

																			<!-- <button type="button"
																				class="btn btn-primary btn-sm pull-right btn-add-new-fields">Add
																				More</button> -->
																			
																		</nav>
																		<br>
																 </c:when>
												<c:otherwise>
												
												<c:forEach items="${projectRegistrationModel.projectDetailsModel.plotLandCostDetailsModel.approvalCostModel.approvalCostDetails}" var="obj">
														
														 <% ++costCount; %>
													<tr>
													<td><%= costCount+1 %></td> 
													 <td>  <input type="hidden" name="approveCostDetlsId" value="${obj.approveCostDetlsId}" /> 
													 <input type="text" name="approvalParticular" readonly value="${obj.approvalParticular}" class="requiredValFld"> <span
																class='requiredValFldMsg'>Please Enter Approval Name </span></td>
																
															<td><c:choose>
																	<c:when test="${obj.isApplicable == 'Yes'}">
																		<div class="col-md-9">
																			<label class="radio-inline" for="isApplicable">
																				<input type="radio"  name="isApplicable_<%=costCount %>" approvalCount="<%=costCount %>" class="requiredValFld" id="isApplicable_<%=costCount %>" onclick="showApprovalCost(this);" value="Yes" class='dynaselectfld requiredValFld' checked="checked">Yes
																			</label> <label class="radio-inline" for="isApplicable">
																				<input type="radio"  name="isApplicable_<%=costCount %>" approvalCount="<%=costCount %>" class="requiredValFld" id="isApplicable_<%=costCount %>" onclick="hideApprovalCost(this);" value="No">No
																			</label>
																		</div>
																	</c:when>
																	<c:otherwise>
																		<div class="col-md-9">
																			<label class="radio-inline" for="isApplicable">
																				<input type="radio"  name="isApplicable_<%=costCount %>" approvalCount="<%=costCount %>" class="requiredValFld" id="isApplicable_<%=costCount %>" onclick="showApprovalCost(this);" value="Yes">Yes 
																			</label> <label class="radio-inline" for="isApplicable">
																				<input type="radio"  name="isApplicable_<%=costCount %>" approvalCount="<%=costCount %>" class="requiredValFld" id="isApplicable_<%=costCount %>" onclick="hideApprovalCost(this);"  value="No" checked="checked">No
																			</label>

																		</div>
																	</c:otherwise>
																</c:choose></td>
																<c:choose>
																	<c:when test="${obj.isApplicable == 'Yes'}">
														<td><input type="number" name="approvalAmt" value="${obj.approvalAmt}"  id="approvalAmt_<%=costCount %>" class="totalSum"> <span
																class='requiredValFldMsg'>Please Enter Construction Cost Particular Name </span></td>
																</c:when>
																<c:otherwise>
																<td><input type="number" style="display: none;" name="approvalAmt" value="${obj.approvalAmt}"  id="approvalAmt_<%=costCount %>" class="totalSum"> <span
																class='requiredValFldMsg'>Please Enter Construction Cost Particular Name </span></td>
																</c:otherwise>
																</c:choose>
																
																
													</c:forEach>
													
													 <tr>
												
												
													<td colspan="3" style="padding-left: 20%;">
													<input type="button" value="Total Cost for Approvals" class="btn btn-info" id="btn-approval" /></td>
													
											    	<td><input type="text" name="totalCostOfApprovals" value="${projectRegistrationModel.projectDetailsModel.plotLandCostDetailsModel.approvalCostModel.totalCostOfApprovals}" readonly="true" class="form-control requiredValFld totalSumOfApproval" /><span
													class='requiredValFldMsg '> Please Enter Estimated Construction Cost</span></td>
												
											</tr> 
											
												
												</c:otherwise>
											</c:choose>
												
						</tbody>
					</table>
					  <input type="button" class="btn btn-sm btn-Primary  pull-right" id="btn-add-approvalAddMore" value="Add More" />
								<br/>
								<br/>
								<c:choose>
								<c:when test="${empty projectRegistrationModel.projectDetailsModel.plotLandCostDetailsModel.approvalCostModel.bankDetailsModel}">
								<div class="add-more" style="border-style: ridge; padding: 20px; background-color: #F8F8F8;">
																<div class="form-group row">
																	<label class="col-md-3 form-control-label" for="amount">Amount
																		withdrawn from the bank for the purpose of the project
																		(INR)</label>
																	<div class="col-md-9">
																		<input type="number" id="amount" name="amount"
																			class="form-control requiredValFld"
																			placeholder="only digits are allowed"> <span
																			class='requiredValFldMsg'> Please enter
																			amount.</span>
																	</div>
																</div>
																<div class="form-group row">
																	<label class="col-md-3 form-control-label"
																		for="amtWithDrawnDate">Date</label>
																	<div class="col-md-3">
																		<input type="date" id="amtWithDrawnDate"
																			name="amtWithDrawnDate"
																			class="form-control requiredValFld" placeholder="">
																		<span class='requiredValFldMsg'> Please enter
																			date.</span>
																	</div>
																</div>
																<div class="form-group row">
																	<label class="col-md-3 form-control-label"
																		for="certFromChartedAcc">Certificate from
																		Chartered Account </label>
																	<div class="col-md-9">
																		<input type="file" id="certFromChartedAcc"
																			name="certFromChartedAcc"
																			class="form-control requiredValFld"> <span
																			class='requiredValFldMsg'> Please Attach a
																			file.</span>
																	</div>
																</div>
															</div>
								
								</c:when>
								<c:otherwise>
								
								<c:forEach items="${projectRegistrationModel.projectDetailsModel.plotLandCostDetailsModel.approvalCostModel.bankDetailsModel}"
																var="amountModel">
																<div class="add-more"
																	style="border-style: ridge; padding: 20px; background-color: #F8F8F8;">
																	<div class="form-group row">
																		<label class="col-md-3 form-control-label"
																			for="amount">Amount withdrawn from the bank
																			for the purpose of the project (INR)</label>
																		<div class="col-md-9">
																			<input type="hidden" name="amtwithdrawBankDelsId"
																				value="${amountModel.amtwithdrawBankDelsId}" /> <input
																				value="${amountModel.amount}" id="amount"
																				name="amount" class="form-control requiredValFld"
																				placeholder="only digits are allowed" /> <span
																				class='requiredValFldMsg'> Please Enter
																				amount.</span>
																		</div>
																	</div>
																	<div class="form-group row">
																		<label class="col-md-3 form-control-label"
																			for="amtWithDrawnDate">Date</label>
																		<div class="col-md-3">
																			<fmt:formatDate type="date" pattern="yyyy-MM-dd"
																				dateStyle="short" var="formateddate"
																				value="${amountModel.amtWithDrawnDate.time}" />
																			<input type="date" name="amtWithDrawnDate"
																				value="${formateddate}"
																				class="form-control requiredValFld" /> <span
																				class='requiredValFldMsg'> Please Enter Date.</span>
																		</div>
																	</div>

																	<div class="form-group row">
																		<label class="col-md-3 form-control-label"
																			for="certFromChartedAcc">Certificate from
																			Chartered Account </label>
																		<div class="col-md-9">
																			<input type="hidden" name="certFromChartedAccDocId"
																				value="${amountModel.certFromChartedAcc.documentId}" />
																			<input type="file" id="certFromChartedAcc"
																				name="certFromChartedAcc"
																				title="Only image or pdf file is allowed. file size upto 1 MB">
																			<a
																				href='<%=request.getContextPath() %>/download?DOC_ID=${amountModel.certFromChartedAcc.documentId}'>
																				${amountModel.certFromChartedAcc.fileName}</a>
																		</div>
																	</div>
																</div>
															</c:forEach>
								</c:otherwise>
								</c:choose>
								
								
								
								
								
													<div class="form-group row"></div>
													<div class="form-group row">
														<input type="button"
															class="btn btn-sm btn-success pull-right"
															id="approvalCostId" value="Save" />
														<!-- <button type="submit" class="btn btn-sm btn-primary  pull-right" id="approvalCostId"><i class="fa fa-dot-circle-o"></i> Submit</button> 
														<button type="reset"
															class="btn btn-sm btn-danger  pull-right">
															<i class="fa fa-ban"></i> Reset
														</button>-->
													</div>
												</form:form>
											</div>
										</div>
									</div>

								</div>
							</div>

						</div>
					</div>
					<!--/col-->
				</div>

			</div>
			<!-- /.conainer-fluid -->
	</main>


</body>

</html>