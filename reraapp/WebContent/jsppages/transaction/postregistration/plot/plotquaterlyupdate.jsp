<!DOCTYPE html>
<%@page import="in.gov.rera.common.security.ReraSecurity"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@page import="in.gov.rera.common.util.ReraConstants"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page import="in.gov.rera.common.model.UserModel"%>
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
<meta name="author" content="Åukasz Holeczek">
<meta name="keyword"
	content="Bootstrap,Admin,Template,Open,Source,AngularJS,Angular,Angular2,jQuery,CSS,HTML,RWD,Dashboard">
<link rel="shortcut icon"
	href="../resources/postprojregistration/img/favicon.png">

<title>Plot Quaterly Updatde</title>


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

/* #litigationdetails {
  display: none;
}

#showCaseFile {
	display: none;
}

#modificationdetails {
	display: none;
} */

/* #plotmodification {
	display: none;
} */

/* #associationdetails {
	display: none;
}

#welfaredetails {
	display: none;
} */

#annualReport {
  display: none;
}

#quarterReport {
  display: none;
}

</style>



</head>
<script>
	$(document.body).on('click', '.btn-remove-civilwork', function() {
		$(this).closest('tr').remove();
	});
</script>



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
				src="<%=request.getContextPath()%>/resources/postprojregistration/img/avatars/user-top-icon.jpg"
				class="img-avatar" alt="Avatar">
			<div>
				<strong><%=user.getUserName()%></strong>
			</div>
			<!-- <div class="text-muted">
				<small>User &amp; user</small>
			</div> -->
		</div>
		<%@include
			file="/jsppages/transaction/postregistration/plot/plotleftnav.jsp"%>
	</div>

	<!-- Main content -->
	<main class="main">


	<div class="container-fluid">
		<div class="row">
			<div class="card-header">
				<div class="row">
					<i class="fa fa-align-justify"></i> Project Details : Registration
					Number - ${projectRegistrationModel.projectRegistrationNo}

					
				</div>
			</div>

			<div class="card-block">
				<div class="container">



					
					<!---------------------------Plot Details  -->
					
					<div class="panel-group" id="accordion">
						<div class="panel panel-primary">
							<div class="panel-heading card-header collapsed"
								data-toggle="collapse" data-target="#bar3">
								<i class="fa fa-fw fa-chevron-down"></i> <i
									class="fa fa-fw fa-chevron-right"></i>Plot Details
							</div>
							<div class="panel-body">
								<!-- The inside div eliminates the 'jumping' animation. -->
								<div class="collapse" id="bar3">
									<form:form class="form-horizontal" autocomplete="off"
										action="updateQuarterPlotDetails"
										modelAttribute="projectRegistrationModel"
										enctype="multipart/form-data" id="quarterplotForm"
										method="post">
										<c:choose>
					<c:when test="${not empty projectRegistrationModel.projectDetailsModel.plotDetailsList}">
										<c:choose>
											<c:when test="${ empty quarter.plotDetails}">
												<div class="trower-div"
													style="border-style: ridge; padding: 20px; background-color: #F8F8F8;">
													<c:forEach
														items="${projectRegistrationModel.projectDetailsModel.plotDetailsList}"
														var="obj">


														<table
															class="table table-bordered table-striped table-condensed"
															id="common-list">
															<thead>
																<tr>
																	<th rowspan="2">Category</th>
																	<th rowspan="2">Total No. of Plots</th>
																	<th rowspan="2">No. of Plots Booked</th>
																	<th rowspan="2">No. of Plots Available</th>
															</thead>
															<tbody>
																<%-- <c:forEach items="${projectRegistrationModel.projectDetailsModel.projectScheduleModel.projectWorkModel}" var="obj"> --%>
																<tr>
																	<td>EWS(6x9)</td>
																	<td>
																		<%-- <input  type="hidden" name="" value="${obj.}"/> --%>
																		<input type="text" name="totalnoOfEWSPlots"
																		id="totalnoOfEWSPlots"
																		value="${obj.totalnoOfEWSPlots}" readOnly
																		class="form-control requiredValFld" /> <span
																		class='requiredValFldMsg'> </span>
																	</td>
																	<td><input type="text"
																		name="totalnoOfEWSPlotsBooked"
																		id="totalnoOfEWSPlotsBooked" value=""
																		class="form-control requiredValFld" /> <span
																		class='requiredValFldMsg'> </span></td>
																	<td><input type="text" readOnly
																		name="totalnoOfEWSPlotsAvailable" 
																		id="totalnoOfEWSPlotsAvailable" value=""
																		class="form-control requiredValFld" /> <span
																		class='requiredValFldMsg'> Please Enter
																			Percentage of Completion.</span></td>

																</tr>
																<tr>
																	<td>LIG(9x12)</td>
																	<td>
																		<%-- <input  type="hidden" name="" value="${obj.}"/> --%>
																		<input type="text" name="totalnoOfLIGPlots"
																		id="totalnoOfLIGPlots" readOnly
																		value="${obj.totalnoOfLIGPlots}"
																		class="form-control requiredValFld" /> <span
																		class='requiredValFldMsg'> </span>
																	</td>
																	<td><input type="text"
																		name="totalnoOfLIGPlotsBooked"
																		id="totalnoOfLIGPlotsBooked" value=""
																		class="form-control requiredValFld" /> <span
																		class='requiredValFldMsg'> </span></td>
																	<td><input type="text" readOnly
																		name="totalnoOfLIGPlotsAvailable" 
																		id="totalnoOfLIGPlotsAvailable" value=""
																		class="form-control requiredValFld" /> <span
																		class='requiredValFldMsg'> Please Enter
																			Percentage of Completion.</span></td>

																</tr>
																<tr>
																	<td>MIG(9x15)</td>
																	<td>
																		<%-- <input  type="hidden" name="" value="${obj.}"/> --%>
																		<input type="text" name="totalnoOfMIGPlots"
																		id="totalnoOfMIGPlots" readOnly
																		value="${obj.totalnoOfMIGPlots}"
																		class="form-control requiredValFld" /> <span
																		class='requiredValFldMsg'> </span>
																	</td>
																	<td><input type="text"
																		name="totalnoOfMIGPlotsBooked"
																		id="totalnoOfMIGPlotsBooked" value=""
																		class="form-control requiredValFld" /> <span
																		class='requiredValFldMsg'> </span></td>
																	<td><input type="text" readOnly
																		name="totalnoOfMIGPlotsAvailable" 
																		id="totalnoOfMIGPlotsAvailable" value=""
																		class="form-control requiredValFld" /> <span
																		class='requiredValFldMsg'></span></td>

																</tr>
																<tr>
																	<td>HIG(15x24)</td>
																	<td>
																		<%-- <input  type="hidden" name="" value="${obj.}"/> --%>
																		<input type="text" name="totalnoOfHIGPlots"
																		id="totalnoOfHIGPlots" readOnly
																		value="${obj.totalnoOfHIGPlots}"
																		class="form-control requiredValFld" /> <span
																		class='requiredValFldMsg'> </span>
																	</td>
																	<td><input type="text"
																		name="totalnoOfHIGPlotsBooked"
																		id="totalnoOfHIGPlotsBooked" value=""
																		class="form-control requiredValFld" /> <span
																		class='requiredValFldMsg'> </span></td>
																	<td><input type="text" readOnly
																		name="totalnoOfHIGPlotsAvailable"
																		id="totalnoOfHIGPlotsAvailable" value=""
																		class="form-control requiredValFld" /> <span
																		class='requiredValFldMsg'> </span></td>

																</tr>
																<tr>
																	<td>Others</td>
																	<td>
																		<%-- <input  type="hidden" name="" value="${obj.}"/> --%>
																		<input type="text" name="totalnoOfOtherPlots"
																		id="totalnoOfOtherPlots" readOnly
																		value="${obj.totalnoOfOtherPlots}"
																		class="form-control requiredValFld" /> <span
																		class='requiredValFldMsg'> </span>
																	</td>
																	<td><input type="text"
																		name="totalnoOfOtherPlotsBooked"
																		id="totalnoOfOtherPlotsBooked" value=""
																		class="form-control requiredValFld" /> <span
																		class='requiredValFldMsg'> </span></td>
																	<td><input type="text" readOnly
																		name="totalnoOfOtherPlotsAvailable" 
																		id="totalnoOfOtherPlotsAvailable" value=""
																		class="form-control requiredValFld" /> <span
																		class='requiredValFldMsg'> </span></td>

																</tr>
																</tr>
																<tr>
																	<td>Total</td>
																	<td>
																		<%-- <input  type="hidden" name="" value="${obj.}"/> --%>
																		<input type="text" name="totalnoOfOtherPlots"
																		id="totalnoOfOtherPlots" readOnly
																		value="${obj.totalNumberOfPlots}"
																		class="form-control requiredValFld" /> <span
																		class='requiredValFldMsg'> </span>
																	</td>
																	<td><input type="text"
																		name="totalNumberOfPlotsBooked" 
																		id="totalNumberOfPlotsBooked" value=""
																		class="form-control requiredValFld" /> <span
																		class='requiredValFldMsg'> </span></td>
																	<td><input type="text"
																		name="totalNumberOfPlotsAvailable"  
																		id="totalNumberOfPlotsAvailable" value="" readOnly
																		class="form-control requiredValFld" /> <span
																		class='requiredValFldMsg'> </span></td>

																</tr>


															</tbody>
														</table>

													</c:forEach>

													<nav>
														<input type="button"
															class="btn btn-sm btn-success  pull-right"
															id="quarterplotsId" value="Save" />
													</nav>
													<br>
												</div>
											</c:when>
											<c:otherwise>

												<div class="trower-div"
													style="border-style: ridge; padding: 20px; background-color: #F8F8F8;">
													<c:forEach
														items="${projectRegistrationModel.projectDetailsModel.plotDetailsList}"
														var="obj">
														<%-- <div class="form-group row">
											  <input type="hidden" name="towerDetailsId" value=""/>
												<label class="col-md-3 form-control-label"
													for="totalNoOfPlots">Total number of Plots</label>
												<div class="col-md-9">
													<input name="totalNumberOfPlots" id="totalNumberOfPlots" value="${obj.totalNumberOfPlots}"
														name="towerName" class="form-control requiredValFld"
														placeholder="only digits are allowed" / readOnly>
												</div>
											</div> --%>

														<table
															class="table table-bordered table-striped table-condensed"
															id="common-list">
															<thead>
																<tr>
																	<th rowspan="2">Category</th>
																	<th rowspan="2">Total No. of Plots</th>
																	<th rowspan="2">No. of Plots Booked</th>
																	<th rowspan="2">No. of Plots Available</th>
															</thead>
															<tbody>
																<%-- <c:forEach items="${projectRegistrationModel.projectDetailsModel.projectScheduleModel.projectWorkModel}" var="obj"> --%>
																<tr>
																	<td>EWS(6x9)</td>
																	<td>
																		<%-- <input  type="hidden" name="" value="${obj.}"/> --%>
																		<input type="text" name="totalnoOfEWSPlots"
																		id="totalnoOfEWSPlots"
																		value="${obj.totalnoOfEWSPlots}" readOnly
																		class="form-control requiredValFld" /> <span
																		class='requiredValFldMsg'> </span>
																	</td>
																	<td><input type="text"
																		name="totalnoOfEWSPlotsBooked"
																		id="totalnoOfEWSPlotsBooked"
																		value="${quarter.plotDetails.totalnoOfEWSPlotsBooked}"
																		class="form-control requiredValFld" /> <span
																		class='requiredValFldMsg'> </span></td>
																	<td><input type="text"
																		name="totalnoOfEWSPlotsAvailable" 
																		id="totalnoOfEWSPlotsAvailable"
																		value="${quarter.plotDetails.totalnoOfEWSPlotsAvailable}"
																		class="form-control requiredValFld" /> <span
																		class='requiredValFldMsg'> </span></td>

																</tr>
																<tr>
																	<td>LIG(9x12)</td>
																	<td>
																		<%-- <input  type="hidden" name="" value="${obj.}"/> --%>
																		<input type="text" name="totalnoOfLIGPlots"
																		id="totalnoOfLIGPlots" readOnly
																		value="${obj.totalnoOfLIGPlots}"
																		class="form-control requiredValFld" /> <span
																		class='requiredValFldMsg'> </span>
																	</td>
																	<td><input type="text"
																		name="totalnoOfLIGPlotsBooked"
																		id="totalnoOfLIGPlotsBooked"
																		value="${quarter.plotDetails.totalnoOfLIGPlotsBooked}"
																		class="form-control requiredValFld" /> <span
																		class='requiredValFldMsg'> </span></td>
																	<td><input type="text"
																		name="totalnoOfLIGPlotsAvailable" 
																		id="totalnoOfLIGPlotsAvailable"
																		value="${quarter.plotDetails.totalnoOfLIGPlotsAvailable}"
																		class="form-control requiredValFld" /> <span
																		class='requiredValFldMsg'> </span></td>

																</tr>
																<tr>
																	<td>MIG(9x15)</td>
																	<td>
																		<%-- <input  type="hidden" name="" value="${obj.}"/> --%>
																		<input type="text" name="totalnoOfMIGPlots"
																		id="totalnoOfMIGPlots" readOnly
																		value="${obj.totalnoOfMIGPlots}"
																		class="form-control requiredValFld" /> <span
																		class='requiredValFldMsg'> </span>
																	</td>
																	<td><input type="text"
																		name="totalnoOfMIGPlotsBooked"
																		id="totalnoOfMIGPlotsBooked"
																		value="${quarter.plotDetails.totalnoOfMIGPlotsBooked}"
																		class="form-control requiredValFld" /> <span
																		class='requiredValFldMsg'> </span></td>
																	<td><input type="text"
																		name="totalnoOfMIGPlotsAvailable" 
																		id="totalnoOfMIGPlotsAvailable"
																		value="${quarter.plotDetails.totalnoOfMIGPlotsAvailable}"
																		class="form-control requiredValFld" /> <span
																		class='requiredValFldMsg'></span></td>

																</tr>
																<tr>
																	<td>HIG(15x24)</td>
																	<td>
																		<%-- <input  type="hidden" name="" value="${obj.}"/> --%>
																		<input type="text" name="totalnoOfHIGPlots"
																		id="totalnoOfHIGPlots" readOnly
																		value="${obj.totalnoOfHIGPlots}"
																		class="form-control requiredValFld" /> <span
																		class='requiredValFldMsg'> </span>
																	</td>
																	<td><input type="text"
																		name="totalnoOfHIGPlotsBooked"
																		id="totalnoOfHIGPlotsBooked"
																		value="${quarter.plotDetails.totalnoOfHIGPlotsBooked}"
																		class="form-control requiredValFld" /> <span
																		class='requiredValFldMsg'> </span></td>
																	<td><input type="text"
																		name="totalnoOfHIGPlotsAvailable" 
																		id="totalnoOfHIGPlotsAvailable"
																		value="${quarter.plotDetails.totalnoOfHIGPlotsAvailable}"
																		class="form-control requiredValFld" /> <span
																		class='requiredValFldMsg'> </span></td>

																</tr>
																<tr>
																	<td>Others</td>
																	<td>
																		<%-- <input  type="hidden" name="" value="${obj.}"/> --%>
																		<input type="text" name="totalnoOfOtherPlots"
																		id="totalnoOfOtherPlots" readOnly
																		value="${obj.totalnoOfOtherPlots}"
																		class="form-control requiredValFld" /> <span
																		class='requiredValFldMsg'> </span>
																	</td>
																	<td><input type="text"
																		name="totalnoOfOtherPlotsBooked"
																		id="totalnoOfOtherPlotsBooked"
																		value="${quarter.plotDetails.totalnoOfOtherPlotsBooked}"
																		class="form-control requiredValFld" /> <span
																		class='requiredValFldMsg'> </span></td>
																	<td><input type="text"
																		name="totalnoOfOtherPlotsAvailable" 
																		id="totalnoOfOtherPlotsAvailable"
																		value="${quarter.plotDetails.totalnoOfOtherPlotsAvailable}"
																		class="form-control requiredValFld" /> <span
																		class='requiredValFldMsg'> </span></td>

																</tr>
																<tr>
																	<td>Total</td>
																	<td>
																		<%-- <input  type="hidden" name="" value="${obj.}"/> --%>
																		<input type="text" name="totalnoOfOtherPlots"
																		id="totalnoOfOtherPlots" readOnly
																		value="${obj.totalNumberOfPlots}"
																		class="form-control requiredValFld" /> <span
																		class='requiredValFldMsg'> </span>
																	</td>
																	<td><input type="text"
																		name="totalNumberOfPlotsBooked" 
																		id="totalNumberOfPlotsBooked"
																		value="${quarter.plotDetails.totalNumberOfPlotsBooked}"
																		class="form-control requiredValFld" /> <span
																		class='requiredValFldMsg'> </span></td>
																	<td><input type="text"
																		name="totalNumberOfPlotsAvailable" 
																		id="totalNumberOfPlotsAvailable"
																		value="${quarter.plotDetails.totalNumberOfPlotsAvailable}"
																		class="form-control requiredValFld" /> <span
																		class='requiredValFldMsg'> </span></td>

																</tr>


															</tbody>
														</table>


														<!-- <div class="form-group row">
												<label class="col-md-3 form-control-label"
													for="noOfPlotsBooked">Total No. of Plots booked</label>
												<div class="col-md-9">
													<input name="noOfPlotsBooked" id="noOfPlotsBooked"
														class="form-control requiredValFld"
														placeholder="only digits are allowed" />
												</div>
											</div>
											<div class="form-group row">
												<label class="col-md-3 form-control-label"
													for="noOfPlotsAvailable">Total No. of Plots Available</label>
												<div class="col-md-9">
													<input name="noOfPlotsAvailable" id="noOfPlotsAvailable"
														class="form-control requiredValFld" value=""
														placeholder="only digits are allowed" />
												</div>
											</div> -->
													</c:forEach>

													<nav>
														<input type="button"
															class="btn btn-sm btn-success  pull-right"
															id="quarterplotsId" value="Save" />
													</nav>
													<br>
												</div>
											</c:otherwise>
										</c:choose>
										</c:when>
					<c:otherwise>
					 <div class="add-more" style="border-style: ridge; padding: 20px; background-color: #D3D3D3;">
					Note : Please enter the Plot Details to update Every Quarter</div>
					</c:otherwise>
					</c:choose>
									</form:form>
								</div>
							</div>

						</div>
					</div>
					
					
					<!------------------------------------ civil works details --------------------------->
					
										<div class="panel-group" id="accordion">
						<div class="panel panel-primary">
							<div class="panel-heading card-header collapsed"
								data-toggle="collapse" data-target="#bar">
								<i class="fa fa-fw fa-chevron-down"></i> <i
									class="fa fa-fw fa-chevron-right"></i> Civil Works

							</div>
							<div class="panel-body">
								<!-- The inside div eliminates the 'jumping' animation. -->
								<div class="collapse" id="bar">

									<!--civil works content -->



									<form:form action="updatePlottedCivilWorksDetails" method="post" id="updateCivilWorksForm" enctype="multipart/form-data"
										class="form-horizontal" modelAttribute="projectRegistrationModel">

										<%--                             <input  type="hidden" name="projWorkId" value="${projectRegistrationModel.projectDetailsModel.projectScheduleModel.projectWorkModel.projWorkId}"/> --%>
										<table class="table table-bordered table-striped table-condensed" id="quarter-sche-list">

											<thead>

												<tr>

													<!--   <th>SlNo.</th> -->

													<th>Project Work</th>

													<th>Estimated Start Date</th>

													<th>Estimated End Date</th>

													<th>Actual Start Date</th>

													<th>Actual End Date</th>

													<th>Action</th>

												</tr>

											</thead>

											<tbody>
												
												<c:choose>
													<c:when test="${not empty projectRegistrationModel.projectDetailsModel.plotScheduleModel.civilWorkList}">
														<form:hidden path="projectDetailsModel.plotScheduleModel.plotScheduleModelId" />
														<c:choose>
														<c:when test="${empty quarter.quarterCivilWorkList}">
														<% int quartcount = -1; %>
														<c:forEach items="${projectRegistrationModel.projectDetailsModel.plotScheduleModel.civilWorkList}" var="obj">
																					
															<c:if test="${obj.isApplicable == 'Yes'}">
															<% ++quartcount; %>	
																<tr>
																	<td>
																	<c:out value="${obj.typeOfWork}"></c:out>
																	 <input type="hidden" name="typeOfWork" value="${obj.typeOfWork}" class="form-control requiredValFld" />
																	  <span class='requiredValFldMsg'> Please Enter Type Of Work.</span>
																	  </td>
																	  
																	<td><fmt:formatDate type="date" pattern="yyyy-MM-dd" dateStyle="short" var="formateddate" value="${obj.estimatedFrmDate.time}" />
																	 <input type="date" readOnly name="estimatedFrmDate" value="${formateddate}" class="form-control requiredValFld" />
																	  <span class='requiredValFldMsg'>Please Enter Estimated From Date.</span>
																	</td>
																	
																	<td><fmt:formatDate type="date" pattern="yyyy-MM-dd" dateStyle="short" var="formateddate1" value="${obj.estimatedToDate.time}" /> 
																	<input type="date" readOnly name="estimatedToDate" value="${formateddate1}" class="form-control requiredValFld" />
																	 <span class='requiredValFldMsg'>Please Enter Estimated To Date </span>
																	 </td>
																	 
																	<td><input type="date"  name="actualFrmDate" id="actualFrmDate_<%=quartcount%>" class="form-control requiredValFld" placeholder="MM/dd/YYYY">
																				 <span class='requiredValFldMsg'>Please enter actualFromdate.</span></td>

																			<td><input type="date"  name="actualToDate" id="actualToDate_<%=quartcount%>" class="form-control requiredValFld" placeholder="MM/dd/YYYY">
																				 <span class='requiredValFldMsg'>Please enter actualToDate.</span></td>
																		<td> 
																	<input type="button" value="delete" class="btn-remove-civilwork">
																	</td>
																		</tr>
															</c:if>
														</c:forEach>
															</c:when>
															<c:otherwise>
															<% int quartcount = -1; %>
																			<c:forEach items="${quarter.quarterCivilWorkList}" var="obj">
																			<%++quartcount; %>
																<tr>
																	<td>
																	<c:out value="${obj.typeOfWork}"></c:out>
																	<input type="hidden" name="quarterlyCivilWorkId" value="${obj.quarterlyCivilWorkId}" /> 
																	 <input type="hidden" name="typeOfWork" value="${obj.typeOfWork}" class="form-control requiredValFld" />
																	  <span class='requiredValFldMsg'> Please Enter Type Of Work.</span>
																	  </td>
																	  
																	<td><fmt:formatDate type="date" pattern="yyyy-MM-dd" dateStyle="short" var="formateddate" value="${obj.estimatedFrmDate.time}" />
																	 <input type="date" readOnly name="estimatedFrmDate" value="${formateddate}" class="form-control requiredValFld" />
																	  <span class='requiredValFldMsg'> Please Enter Estimated From Date.</span>
																	</td>
																	
																	<td><fmt:formatDate type="date" pattern="yyyy-MM-dd" dateStyle="short" var="formateddate1" value="${obj.estimatedToDate.time}" /> 
																	<input type="date" readOnly name="estimatedToDate" value="${formateddate1}" class="form-control requiredValFld" />
																	 <span class='requiredValFldMsg'> Please Enter Estimated To Date </span>
																	 </td>
																			<td><fmt:formatDate type="date" pattern="yyyy-MM-dd" dateStyle="short"
																					var="formateddate" value="${obj.actualFrmDate.time}" />
																					 <input type="date" name=actualFrmDate value="${formateddate}" id="actualFrmDate_<%=quartcount%>" class="form-control requiredValFld" />
																					 <span class='requiredValFldMsg'> Please enter date.</span>
																			</td>

																			<td><fmt:formatDate type="date" pattern="yyyy-MM-dd" dateStyle="short" var="formateddate" value="${obj.actualToDate.time}" />
																				<input type="date" name=actualToDate value="${formateddate}" id="actualToDate_<%=quartcount%>" class="form-control requiredValFld" />
																				<span class='requiredValFldMsg'> Please enter actualToDate.</span>
																			</td>
																			<td> 
																	<input type="button" value="delete" class="btn-remove-civilwork">
																	</td>
																			</tr>
																			</c:forEach>
																		</c:otherwise>
																	</c:choose>
																	<!-- <td> 
																	<input type="button" value="delete" class="btn-remove-civilwork">
																	</td> -->
																
													</c:when>
													<c:otherwise>
														<br>
														<br>
																<tr bgcolor="#FFA07A">
																	<td colspan="6" style="width: 100%;">Note : Please
																		enter the project Schedule Details to update Every
																		Quarter</td>
																</tr>
													</c:otherwise>
												</c:choose>

											</tbody>

										</table>


										<div class="form-group row">
											<input type="button"
												class="btn btn-sm btn-success  pull-right"
												id="quaterupdateCivilWorkId" value="Save" />
											<!-- <button type="reset" class="btn btn-sm btn-danger pull-right">
												<i class="fa fa-ban"></i> Reset
											</button> -->
										</div>
									</form:form>

								</div>
					
     <!------------ Status of Common Areas To be Relinquished to local Authority /Planning Authority----------- -->
     
					<div class="panel-group" id="accordion">
						<div class="panel panel-primary">
							<div class="panel-heading card-header collapsed"
								data-toggle="collapse" data-target="#bar4">
								<i class="fa fa-fw fa-chevron-down"></i> <i
									class="fa fa-fw fa-chevron-right"></i> Status of Common Areas
								To be Relinquished to local Authority /Planning Authority

							</div>
							<div class="panel-body">
								<!-- The inside div eliminates the 'jumping' animation. -->
								<div class="collapse" id="bar4">

									<form:form action="updateQuarterlyCommonAreasAuthorityDetails" method="post" enctype="multipart/form-data"
										class="form-horizontal" id="updateQuarterlyCommonAreasAuthorityDetailsForm"	modelAttribute="projectRegistrationModel">
										<c:choose>
											<c:when test="${ not empty projectRegistrationModel.projectDetailsModel.plotScheduleModel.plotsCommonAreaRelinquisedAuthorityModel}">
												
													 <c:choose>
														<c:when test="${ empty quarter.quarterlyPlotsCommonAuthorityModel}">
														<div class="add-more"
													style="border-style: ridge; padding: 20px; background-color: #F8F8F8;">
													<p style="text-align: center">
														<font>Public and Semi Public Sites</font>
													</p>
													<div class="form-group row">
														<label class="col-md-3 form-control-label" for="noOfPublicOrSemiPubSites">
														No. of Public and Semi Pubic Sites  </label>
														<div class="col-md-9">
															<input type="text" readOnly id="noOfPublicOrSemiPubSites" name="noOfPublicOrSemiPubSites"
																value="${projectRegistrationModel.projectDetailsModel.plotScheduleModel.plotsCommonAreaRelinquisedAuthorityModel.noOfPublicOrSemiPubSites}"
																class="form-control requiredValFld" placeholder="Only digits are allowed">
																 <span class='requiredValFldMsg'> Please Enter No. of Sites </span>
														</div>
													</div>
													<div class="form-group row">
														<label class="col-md-3 form-control-label"
															for="totAreaOfPublicOrSemiPubSites">Area of
															Public and Semi Pubic Sites(in Sq.m) </label>
														<div class="col-md-9">
															<input type="text" id="totAreaOfPublicOrSemiPubSites"
																name="totAreaOfPublicOrSemiPubSites" readOnly
																value="${projectRegistrationModel.projectDetailsModel.plotScheduleModel.plotsCommonAreaRelinquisedAuthorityModel.totAreaOfPublicOrSemiPubSites}"
																class="form-control requiredValFld"
																placeholder="Only digits are allowed"> <span
																class='requiredValFldMsg'> Please Enter Area of
																site</span>
														</div>
													</div>

													<div class="form-group row">
														<label class="col-md-3 form-control-label"
															for="percentageOfCompletionOfSites">Percentage of Completion
															(%) </label>
														<div class="col-md-9">
															<input type="number" id="percentageOfCompletionOfSites"
																name="percentageOfCompletionOfSites"
																class="form-control requiredValFld"
																placeholder="Only digits are allowed"> <span
																class='requiredValFldMsg'> Please Enter
																Percentage of Completion </span>
														</div>
													</div>

													<div class="form-group row">
														<label class="col-md-3 form-control-label"
															for="sitesPhotograph">Upload Photograph </label>
														<div class="col-md-9">
															<input type="file" id="file-input" name="sitesPhotograph"
																class="form-control requiredValFld"> <span
																class='requiredValFldMsg'> Please attach
																photograph </span>
														</div>
													</div>
												</div>


												<div class="add-more"
													style="border-style: ridge; padding: 20px; background-color: #F8F8F8;">
													<p style="text-align: center">
														<font>Parks and Open Spaces</font>
													</p>
													<div class="form-group row">
														<label class="col-md-3 form-control-label"
															for="totNoOfParkAndOpenSpace">No. of Parks and
															Open Spaces </label>
														<div class="col-md-9">
															<input type="text" id="totNoOfParkAndOpenSpace"
																name="totNoOfParkAndOpenSpace"  readOnly
																value="${projectRegistrationModel.projectDetailsModel.plotScheduleModel.plotsCommonAreaRelinquisedAuthorityModel.totNoOfParkAndOpenSpace}"
																class="form-control requiredValFld"
																placeholder="Only digits are allowed"> <span
																class='requiredValFldMsg'> Please Enter No. of
																Sites </span>
														</div>
													</div>

													<div class="form-group row">
														<label class="col-md-3 form-control-label"
															for="totAreaOfParkAndOpenSpace">Area of Parks and
															Open Spaces(in Sq.m) </label>
														<div class="col-md-9">
															<input type="text" id="totAreaOfParkAndOpenSpace"
																name="totAreaOfParkAndOpenSpace" readOnly
																value="${projectRegistrationModel.projectDetailsModel.plotScheduleModel.plotsCommonAreaRelinquisedAuthorityModel.totAreaOfParkAndOpenSpace}"
																class="form-control requiredValFld"
																placeholder="Only digits are allowed"> <span
																class='requiredValFldMsg'> Please Enter Area of
																site</span>
														</div>
													</div>

													<div class="form-group row">
														<label class="col-md-3 form-control-label"
															for="percentageOfCompletionOfOpenSpace">Percentage of Completion
															(%) </label>
														<div class="col-md-9">
															<input type="number" id="percentageOfCompletionOfOpenSpace"
																name="percentageOfCompletionOfOpenSpace"
																class="form-control requiredValFld"
																placeholder="Only digits are allowed"> <span
																class='requiredValFldMsg'> Please Enter
																Percentage of Completion </span>
														</div>
													</div>

													<div class="form-group row">
														<label class="col-md-3 form-control-label"
															for="openSpacePhotograph">Upload Photograph </label>
														<div class="col-md-9">
															<input type="file" id="file-input" name="openSpacePhotograph"
																class="form-control requiredValFld"> <span
																class='requiredValFldMsg'> Please attach
																photograph </span>
														</div>
													</div>
												</div>


												<div class="add-more"
													style="border-style: ridge; padding: 20px; background-color: #F8F8F8;">
													<p style="text-align: center">
														<font>Road and Transportation</font>
													</p>

													<div class="form-group row">
														<label class="col-md-3 form-control-label"
															for="totAreaOfRoad">Area of
															Road/Transportation(in Sq.m) </label>
														<div class="col-md-9">
															<input type="text" id="totAreaOfRoad"
																name="totAreaOfRoad" readOnly
																value="${projectRegistrationModel.projectDetailsModel.plotScheduleModel.plotsCommonAreaRelinquisedAuthorityModel.totAreaOfRoad}"
																 class="form-control requiredValFld"
																placeholder="Only digits are allowed"> <span
																class='requiredValFldMsg'> Please Enter Area of
																site</span>
														</div>
													</div>

													<div class="form-group row">
														<label class="col-md-3 form-control-label"
															for="percentageOfCompletionOfRoad">Percentage of Completion
															(%) </label>
														<div class="col-md-9">
															<input type="number" id="percentageOfCompletionOfRoad"
																name="percentageOfCompletionOfRoad"
																class="form-control requiredValFld"
																placeholder="Only digits are allowed"> <span
																class='requiredValFldMsg'> Please Enter
																Percentage of Completion </span>
														</div>
													</div>

													<div class="form-group row">
														<label class="col-md-3 form-control-label"
															for="roadPhotograph">Upload Photograph </label>
														<div class="col-md-9">
															<input type="file" id="file-input" name="roadPhotograph"
																class="form-control requiredValFld"> <span
																class='requiredValFldMsg'> Please attach
																photograph </span>
														</div>
													</div>
												</div>
											</c:when>	
											<c:otherwise>	
											
												<div class="add-more"
													style="border-style: ridge; padding: 20px; background-color: #F8F8F8;">
													<p style="text-align: center">
														<font>Public and Semi Public Sites</font>
													</p>

													<div class="form-group row">
														<label class="col-md-3 form-control-label"
															for="noOfPublicOrSemiPubSites">No. of Public and
															Semi Pubic Sites </label>
														<div class="col-md-9">
															<input type="text" id="noOfPublicOrSemiPubSites"
																name="noOfPublicOrSemiPubSites" readOnly
																value="${quarter.quarterlyPlotsCommonAuthorityModel.noOfPublicOrSemiPubSites}"
																class="form-control requiredValFld"
																placeholder="Only digits are allowed"> <span
																class='requiredValFldMsg'> Please Enter No. of
																Sites </span>
														</div>
													</div>
													<div class="form-group row">
														<label class="col-md-3 form-control-label"
															for="totAreaOfPublicOrSemiPubSites">Area of
															Public and Semi Pubic Sites(in Sq.m) </label>
														<div class="col-md-9">
															<input type="text" id="totAreaOfPublicOrSemiPubSites" readOnly
																name="totAreaOfPublicOrSemiPubSites"
																value="${quarter.quarterlyPlotsCommonAuthorityModel.totAreaOfPublicOrSemiPubSites}"
																class="form-control requiredValFld"
																placeholder="Only digits are allowed"> <span
																class='requiredValFldMsg'> Please Enter Area of
																site</span>
														</div>
													</div>

													<div class="form-group row">
														<label class="col-md-3 form-control-label"
															for="percentageOfCompletionOfSites">Percentage of Completion
															(%) </label>
														<div class="col-md-9">
															<input type="number" id="percentageOfCompletionOfSites" value="${quarter.quarterlyPlotsCommonAuthorityModel.percentageOfCompletionOfSites}"
																name="percentageOfCompletionOfSites"
																class="form-control requiredValFld"
																placeholder="Only digits are allowed"> <span
																class='requiredValFldMsg'> Please Enter
																Percentage of Completion </span>
														</div>
													</div>

													<div class="form-group row">
														<label class="col-md-3 form-control-label"
															for="sitesPhotograph">Upload Photograph </label>
														<div class="col-md-9">
															<input type="file" id="file-input" name="sitesPhotograph" value="${quarter.quarterlyPlotsCommonAuthorityModel.sitesPhotograph}"
																class="form-control requiredValFld"> <span
																class='requiredValFldMsg'> Please attach
																photograph </span>
														</div>
													</div>
												</div>

												<div class="add-more"
													style="border-style: ridge; padding: 20px; background-color: #F8F8F8;">
													<p style="text-align: center">
														<font>Parks and Open Spaces</font>
													</p>
													<div class="form-group row">
														<label class="col-md-3 form-control-label"
															for="totNoOfParkAndOpenSpace">No. of Parks and
															Open Spaces </label>
														<div class="col-md-9">
															<input type="text" readOnly id="totNoOfParkAndOpenSpace" name="totNoOfParkAndOpenSpace" value="${quarter.quarterlyPlotsCommonAuthorityModel.totNoOfParkAndOpenSpace}"
																class="form-control requiredValFld"
																placeholder="Only digits are allowed"> <span
																class='requiredValFldMsg'> Please Enter No. of
																Sites </span>
														</div>
													</div>

													<div class="form-group row">
														<label class="col-md-3 form-control-label"
															for="totAreaOfParkAndOpenSpace">Area of Parks and
															Open Spaces(in Sq.m) </label>
														<div class="col-md-9">
															<input type="text" readOnly id="totAreaOfParkAndOpenSpace" name="totAreaOfParkAndOpenSpace" value="${quarter.quarterlyPlotsCommonAuthorityModel.totAreaOfParkAndOpenSpace}"
																class="form-control requiredValFld"
																placeholder="Only digits are allowed"> <span
																class='requiredValFldMsg'> Please Enter Area of
																site</span>
														</div>
													</div>
													<div class="form-group row">
														<label class="col-md-3 form-control-label"
															for="percentageOfCompletionOfOpenSpace">Percentage of Completion
															(%) </label>
														<div class="col-md-9">
															<input type="number" id="percentageOfCompletionOfOpenSpace" value="${quarter.quarterlyPlotsCommonAuthorityModel.percentageOfCompletionOfOpenSpace}"
																name="percentageOfCompletionOfOpenSpace"
																class="form-control requiredValFld"
																placeholder="Only digits are allowed"> <span
																class='requiredValFldMsg'> Please Enter
																Percentage of Completion </span>
														</div>
													</div>

													<div class="form-group row">
														<label class="col-md-3 form-control-label"
															for="openSpacePhotograph">Upload Photograph </label>
														<div class="col-md-9">
															<input type="file" id="file-input" name="openSpacePhotograph" value="${quarter.quarterlyPlotsCommonAuthorityModel.openSpacePhotograph}"
																class="form-control requiredValFld"> <span
																class='requiredValFldMsg'> Please attach
																photograph </span>
														</div>
													</div>

												</div>

												<div class="add-more"
													style="border-style: ridge; padding: 20px; background-color: #F8F8F8;">
													<p style="text-align: center">
														<font>Road and Transportation</font>
													</p>

													<div class="form-group row">
														<label class="col-md-3 form-control-label"
															for="totAreaOfRoad">Area of
															Road/Transportation(in Sq.m) </label>
														<div class="col-md-9">
															<input type="text" readOnly id="totAreaOfRoad" name="totAreaOfRoad" value="${quarter.quarterlyPlotsCommonAuthorityModel.totAreaOfRoad}"
																class="form-control requiredValFld"
																placeholder="Only digits are allowed"> <span
																class='requiredValFldMsg'> Please Enter Area of
																site</span>
														</div>
													</div>
													<div class="form-group row">
														<label class="col-md-3 form-control-label"
															for="percentageOfCompletion">Percentage of Completion
															(%) </label>
														<div class="col-md-9">
															<input type="number" id="percentageOfCompletionOfRoad" name="percentageOfCompletionOfRoad" value="${quarter.quarterlyPlotsCommonAuthorityModel.percentageOfCompletionOfRoad}"
																class="form-control requiredValFld"
																placeholder="Only digits are allowed"> <span
																class='requiredValFldMsg'> Please Enter
																Percentage of Completion </span>
														</div>
													</div>

													<div class="form-group row">
														<label class="col-md-3 form-control-label"
															for="roadPhotograph">Upload Photograph </label>
														<div class="col-md-9">
															<input type="file" id="file-input" name="roadPhotograph" value="${quarter.quarterlyPlotsCommonAuthorityModel.roadPhotograph}"
																class="form-control requiredValFld"> <span
																class='requiredValFldMsg'> Please attach
																photograph </span>
														</div>
													</div>

												</div>
	                                        </c:otherwise>
					                 </c:choose>
				            </c:when>
				            <c:otherwise>
				            
				            <div class="add-more" style="border-style: ridge; padding: 20px; background-color: #D3D3D3;">
																	Note : Please
																		enter the project Schedule Details to update Every
																		Quarter
																</div>
				            </c:otherwise>
				    </c:choose>

										<div class="form-group row">
											<input type="button"
												class="btn btn-sm btn-success  pull-right"
												id="quarterlyCommonAuthId" value="Save" />
											<!-- <button type="reset"
												class="btn btn-sm btn-danger  pull-right">
												<i class="fa fa-ban"></i> Reset
											</button> -->
										</div>
									</form:form>
								</div>
							</div>
						</div>
					</div>



					 <!------------------------ Status of Common Areas To be used by the Purchaser------------------------------- -->



					<div class="panel-group" id="accordion">
						<div class="panel panel-primary">
							<div class="panel-heading card-header collapsed"
								data-toggle="collapse" data-target="#bar5">
								<i class="fa fa-fw fa-chevron-down"></i> <i
									class="fa fa-fw fa-chevron-right"></i> Status of Common Areas
								To be used by the Purchaser

							</div>
							<div class="panel-body">
								<!-- The inside div eliminates the 'jumping' animation. -->
								<div class="collapse" id="bar5">
									<form:form action="updateQuarterlyCommonAreasPurchaserDetails" method="post"
										enctype="multipart/form-data" class="form-horizontal"
										id="quarterlyCommonPurchaserForm" modelAttribute="projectRegistrationModel">
										<table
											class="table table-bordered table-striped table-condensed"
											id="common-list">
											<thead>
												<tr>
													
													<th rowspan="2">Common Areas</th>
													<th rowspan="2">Percentage of Completion</th>
													<!-- <th rowspan="2">Photograph</th> -->
											</thead>
											<tbody>
												<c:choose>
													<c:when
														test="${ not empty projectRegistrationModel.projectDetailsModel.plotScheduleModel.commonAreasPurchaserList}">
														<%-- <form:hidden
															path="projectDetailsModel.plotScheduleModel.plotScheduleModelId" /> --%>
															<c:choose>
																<c:when test="${empty quarter.quarterCommonAreasPurchaserList }">
																

														<c:forEach items="${projectRegistrationModel.projectDetailsModel.plotScheduleModel.commonAreasPurchaserList}" var="obj">
															<c:if test="${obj.isApplicable == 'Yes'}">
															<tr>

																<td><%-- <input type="hidden" name="commonAreasToBeUsedByPurchaserId" value="${obj.commonAreasToBeUsedByPurchaserId}"  />--%>
																	 <input type="text" name="commonArea" value="${obj.commonArea}" class="form-control requiredValFld" />
																	 <span class='requiredValFldMsg'> Please Enter Common Area.</span></td>
																	 
																	 
																	 <td>
																		<input type="number" name="percentageOfCompletion" maxlength="3" value="" class="requiredValFld"> 
																		<span class='requiredValFldMsg'> Please Enter percentage of Completion</span>
																		</td>
																		</tr>
																		
																			</c:if>
																</c:forEach>
																</c:when>

																<c:otherwise>
																
																<c:forEach items="${quarter.quarterCommonAreasPurchaserList}" var="purchaserObj">
																
																<tr>
																<td>
																	 <input type="text" name="commonArea" value="${purchaserObj.commonArea}" class="form-control requiredValFld" />
																	 <span class='requiredValFldMsg'> Please Enter Common Area.</span>
															    </td>
																
																			
															     <td>
															     <input type="number" name="percentageOfCompletion" maxlength="3" value="${purchaserObj.percentageOfCompletion}" class="form-control requiredValFld" />
															 <span class='requiredValFldMsg'> Please Enter Percentage of Completion.</span>
															 </td>
															 </tr>
																				
																		<%-- <td><input type="file" id="photograph" name="photograph" value="${obj.photograph}" class="form-control requiredValFld">
																		 <span class='requiredValFldMsg'> Please Select attachment for Photograph</span></td> --%>
																			
																			</c:forEach>
																		</c:otherwise>
																		
																	</c:choose>
																	
													</c:when>
													<c:otherwise>
														<br>
														<br>
														<tr bgcolor="#FFA07A">
																	<td colspan="6" style="width: 100%;">Note : Please
																		enter the project Schedule Details to update Every
																		Quarter</td>
																</tr>
													</c:otherwise>
												</c:choose>

											</tbody>
										</table>
										<nav>
											<!-- <button type="button"
												class="btn btn-primary btn-sm pull-right btn-add-projcommon">Add
												More</button> -->
											<input type="button"
												class="btn btn-sm btn-success  pull-right"
												id="quarterlyCommonPurchaserId" value="Save" />
											<!-- <button type="reset"
												class="btn btn-sm btn-danger  pull-right">
												<i class="fa fa-ban"></i> Reset
											</button> -->
										</nav>
										<br />
										<br />
									</form:form>
								</div>
							</div>
						</div>
					</div>
					
				
 		<!--------------------------- construction cost details ------------------------------------------------->
 		
 						<div class="panel-group" id="accordion">
								<div class="panel panel-primary">
									<div class="panel-heading card-header collapsed"
										data-toggle="collapse" data-target="#bar16">
										<i class="fa fa-fw fa-chevron-down"></i> <i
											class="fa fa-fw fa-chevron-right"></i>Construction Cost
										Details
									</div>
									<div class="panel-body">
										<!-- The inside div eliminates the 'jumping' animation. -->
										<div class="collapse" id="bar16">
											<form:form class="form-horizontal" autocomplete="off"
												action="updatePlotConstructionCostDetails"
												modelAttribute="projectRegistrationModel"
												enctype="multipart/form-data" id="constructionCostForm"
												method="post">

												<form:hidden path="projectRegId" />
												<form:hidden path="projectDetailsModel.projectDetailsId" />
												<div class="card-block">
													<table class="table table-bordered  table-condensed">
														<thead>
															<tr>
																<th>Sl No.</th>

																<th>Particulars</th>

																<th>Estimated Cost (in INR)</th>
																<th>Actual Cost (in INR)</th>

															</tr>
														</thead>
														<tbody id="tb" class="tb1">
															<c:choose>
															<c:when test="${not empty projectRegistrationModel.projectDetailsModel.plotsConstructionCostModel.plotsConstructionCostList}">
															<c:choose>
																<c:when test="${empty quarter.quarterPlotsConstructionCostList}">
																
																	<tr>
																	
																	</tr>
																	<% int costCount = -1; %>
																	<c:forEach items="${projectRegistrationModel.projectDetailsModel.plotsConstructionCostModel.plotsConstructionCostList}" var="obj">

														<tr>
														<c:if test="${obj.isApplicable == 'Yes'}">
														 <% 
														 ++costCount;
														%>
															<td><%= costCount+1 %></td> 
													 <td><c:out value="${obj.consCostParticular}"></c:out> 
													 <input type="hidden" name="consCostParticular" value="${obj.consCostParticular}" class="form-control requiredValFld"> <span
																class='requiredValFldMsg'>Please Enter Construction Cost Particular Name </span></td>
																
															
														<td><input type="number" name="estConsCost" readonly="true" value="${obj.estConsCost}" class="count form-control requiredValFld" > <span
																class='requiredValFldMsg'>Please Enter Construction Cost Particular Name </span></td>
															<td><input type="number" name="actConsCost" class="count form-control requiredValFld"> <span
																class='requiredValFldMsg'>Please Enter Construction Cost Particular Name </span></td>	
															</c:if>	
													</c:forEach>
															
													 </c:when>
															 <c:otherwise>
															
																	 <% int costCount = -1; %>
																	<c:forEach items="${quarter.quarterPlotsConstructionCostList}" var="obj">

														<tr>
														
														 <% 
														 ++costCount;
														%>
															<td><%= costCount+1 %></td> 
													 <td> <c:out value="${obj.consCostParticular}"></c:out> <input type="hidden" name="constructionCostDetailsId" value="${obj.constructionCostDetailsId}" /> 
													 <input type="hidden" name="consCostParticular" readonly="true" value="${obj.consCostParticular}" class="form-control requiredValFld"> <span
																class='requiredValFldMsg'>Please Enter Construction Cost Particular Name </span></td>
																
															
														<td><input type="number" name="estConsCost" readonly="true" value="${obj.estConsCost}" class="count form-control requiredValFld"> <span
																class='requiredValFldMsg'>Please Enter Construction Cost Particular Name </span></td>
															<td><input type="number" name="actConsCost" value="${obj.actConsCost}" class="count form-control requiredValFld"> <span
																class='requiredValFldMsg'>Please Enter Construction Cost Particular Name </span></td>	
													</tr>	
													</c:forEach>

																</c:otherwise>
																</c:choose>
																</c:when>
																<c:otherwise>
																<br>
																<br>
																<tr >
																	<td colspan="6" style="width: 100%;">Note : Please enter the Construction Cost Details to update Every Quarter</td>
																</tr>
																</c:otherwise>
															</c:choose>
														</tbody>
													</table>
													<input type="button"
														class="btn btn-sm btn-success  pull-right" style="width: 150px;" id="constructionCostId" value=" Save" />
												</div>
											</form:form>
										</div>
									</div>
								</div>
							</div>

					<!------------------------------- Status of Approvals / NOCs required for the project -------------------------------------------->

					<div class="panel-group" id="accordion">
						<div class="panel panel-primary">
							<div class="panel-heading card-header collapsed"
								data-toggle="collapse" data-target="#bar9">
								<i class="fa fa-fw fa-chevron-down"></i> <i
									class="fa fa-fw fa-chevron-right"></i> Status of Approvals /
								NOCs required for the project

							</div>
							<div class="panel-body">
								<!-- The inside div eliminates the 'jumping' animation. -->
								<div class="collapse" id="bar9">
									<form:form action="updatePlotApprovalsOrNocDetails" method="post"
										enctype="multipart/form-data" class="form-horizontal"
										id="approvalPlotNocForm" modelAttribute="projectRegistrationModel">
										<table id="common-noc"
											class="table table-bordered table-striped table-condensed">
											<thead>

												<tr>
													<th>SlNo.</th>
													<th>Details of Approvals / NOCs</th>
													<th>Applicable?</th>
													<th>Status Of Approval</th>
													<th>Date of Application</th>
													<th>Upload Document</th>

												</tr>

											</thead>
											<tbody>

												<c:choose>
													<c:when test="${ empty quarter.approvalsAndNOCDetails}">
														<tr>
															<td>1</td>
															<td>Water supply and sewage board<input type="hidden"
																name="detailsOfApprovalsOrNoc"
																value="Water supply and sewage board"></td>
															<td><label class="radio-inline" for="inline-radio1"><input id="isApplicable_0" nocCount="0" onclick="showStatusOfNoc(this)"
																	type="radio" name="isApplicable_0" value="Yes"
																	class="requiredValFld">Yes <span class='requiredValFldMsg'>Please select yes/No.</span> </label> 
																	<label class="radio-inline" for="inline-radio2">
																	<input type="radio" name="isApplicable_0" value="No" id="isApplicable_0" nocCount="0" onclick="hideStatusOfNoc(this)"
																	class="requiredValFld">No <span class='requiredValFldMsg'>Please select yes/No.</span>
															</label></td>
															<td><select id="nocStatus_0" name="status" noccount="0" onchange="requiredNOC(this)"
																class="form-control input-sm" size="1">
																	<option value="0">select</option>
																	<option value="Approved">Approved</option>
																	<option value="Applied">Applied</option>
																	<option value="To Be Applied">To Be Applied</option>
															</select><span class='requiredValFldMsg'>Please select Status.</span></td>
															<td><input type="date" name="dateOfApplication" id="nocDate_0"
																class=""> <span class='requiredValFldMsg'>Please select Date Of Application.</span></td>
															<td><input type="file" name="uploadDoc" id="nocDoc_0"
																class=""> <span class='requiredValFldMsg'>Please Upload Document.</span></td>
														</tr>
														<tr>
															<td>2</td>
															<td>KSPCB- PCB (10 Acres to 125 Acres)<input type="hidden" 
																name="detailsOfApprovalsOrNoc"
																value="KSPCB- PCB (10 Acres to 125 Acres)"></td>
															<td><label class="radio-inline" for="inline-radio1"><input id="isApplicable_1" nocCount="1" onclick="showStatusOfNoc(this)"
																	type="radio" name="isApplicable_1" value="Yes" class="requiredValFld">Yes<span class='requiredValFldMsg'>Please select yes/No.</span></label>
																<label class="radio-inline" for="inline-radio2">
																	<input type="radio" name="isApplicable_1" class="requiredValFld" value="No" id="isApplicable_1" nocCount="1" onclick="hideStatusOfNoc(this)">No
																	<span class='requiredValFldMsg'>Please select yes/No.</span>
															</label></td>
															<td><select id="nocStatus_1" name="status" noccount="1" onchange="requiredNOC(this)"
																class="form-control input-sm" size="1">
																	<option value="0">select</option>
																	<option value="Approved">Approved</option>
																	<option value="Applied">Applied</option>
																	<option value="To Be Applied">To Be Applied</option>
															</select><span class='requiredValFldMsg'>Please select Status.</span></td>
															<td><input type="date" name="dateOfApplication" id="nocDate_1"
																class=""> <span class='requiredValFldMsg'>Please select Date Of Application.</span></td>
															<td><input type="file" name="uploadDoc" class="" id="nocDoc_1"> <span class='requiredValFldMsg'>Please Upload Document.</span></td>
														</tr>
														 <tr>
															<td>3</td>
															<td>KSPCB- MOEF (Above 50 Acres)<input type="hidden"
																name="detailsOfApprovalsOrNoc"
																value="KSPCB- MOEF (Above 50 Acres)"></td>
															<td><label class="radio-inline" for="inline-radio1"><input id="isApplicable_2" nocCount="2" onclick="showStatusOfNoc(this)"
																	type="radio" name="isApplicable_2" class="requiredValFld" value="Yes">Yes<span class='requiredValFldMsg'>Please select yes/No.</span></label>
																<label class="radio-inline" for="inline-radio2">
																	<input type="radio" name="isApplicable_2" class="requiredValFld" value="No" id="isApplicable_2" nocCount="2" onclick="hideStatusOfNoc(this)">No
																	<span class='requiredValFldMsg'>Please select yes/No.</span>
															</label></td>
															<td><select id="nocStatus_2" name="status" noccount="2" onchange="requiredNOC(this)"
																class="form-control input-sm" size="1">
																	<option value="0">select</option>
																	<option value="Approved">Approved</option>
																	<option value="Applied">Applied</option>
																	<option value="To Be Applied">To Be Applied</option>
															</select><span class='requiredValFldMsg'>Please select Status.</span></td>
															<td><input type="date" name="dateOfApplication" id="nocDate_2"
																class=""> <span class='requiredValFldMsg'>Please select Date Of Application.</span></td>
															<td><input type="file" name="uploadDoc" id="nocDoc_2"
																class=""> <span class='requiredValFldMsg'>Please Upload Document.</span></td>
														</tr>
														<tr>
															<td>4</td>
															<td>Engineering Department (PWD) for completion of development works<input type="hidden"
																name="detailsOfApprovalsOrNoc"
																value="Engineering Department (PWD) for completion of development works"></td>
															<td><label class="radio-inline" for="inline-radio1"><input id="isApplicable_3" nocCount="3" onclick="showStatusOfNoc(this)"
																	type="radio" name="isApplicable_3" value="Yes" class="requiredValFld">Yes<span class='requiredValFldMsg'>Please select yes/No.</span></label>
																<label class="radio-inline" for="inline-radio2">
																	<input type="radio" name="isApplicable_3" value="No" class="requiredValFld" id="isApplicable_3" nocCount="3" onclick="hideStatusOfNoc(this)">No
																	<span class='requiredValFldMsg'>Please select yes/No.</span>
															</label></td>
															<td><select id="nocStatus_3" name="status" noccount="3" onchange="requiredNOC(this)"
																class="form-control input-sm" size="1">
																	<option value="0">select</option>
																	<option value="Approved">Approved</option>
																	<option value="Applied">Applied</option>
																	<option value="To Be Applied">To Be Applied</option>
															</select><span class='requiredValFldMsg'>Please select Status.</span></td>
															<td><input type="date" name="dateOfApplication" id="nocDate_3"
																class=""> <span class='requiredValFldMsg'>Please select Date Of Application.</span></td>
															<td><input type="file" name="uploadDoc" id="nocDoc_3"
																class=""> <span class='requiredValFldMsg'>Please Upload Document.</span></td>
														</tr>
														<tr>
															<td>5</td>
															<td>KPTCL- BESCOM<input type="hidden"
																name="detailsOfApprovalsOrNoc" value="KPTCL- BESCOM"></td>
															<td><label class="radio-inline" for="inline-radio1"><input id="isApplicable_4" nocCount="4" onclick="showStatusOfNoc(this)"
																	type="radio" name="isApplicable_4" value="Yes" class="requiredValFld">Yes<span class='requiredValFldMsg'>Please select yes/No.</span></label>
																<label class="radio-inline" for="inline-radio2">
																	<input type="radio" name="isApplicable_4" value="No" class="requiredValFld" id="isApplicable_4" nocCount="4" onclick="hideStatusOfNoc(this)">No
																	<span class='requiredValFldMsg'>Please select yes/No.</span>
															</label></td>
															<td><select id="nocStatus_4" name="status" noccount="4" onchange="requiredNOC(this)"
																class="form-control input-sm" size="1">
																	<option value="0">select</option>
																	<option value="Approved">Approved</option>
																	<option value="Applied">Applied</option>
																	<option value="To Be Applied">To Be Applied</option>
															</select><span class='requiredValFldMsg'>Please select Status.</span></td>
															<td><input type="date" name="dateOfApplication" id="nocDate_4"
																class=""> <span class='requiredValFldMsg'>Please select Date Of Application.</span></td>
															<td><input type="file" name="uploadDoc" id="nocDoc_4"
																class=""> <span class='requiredValFldMsg'>Please Upload Document.</span></td>
														</tr>
														<tr>
															<td>6</td>
															<td>Horticulture department<input type="hidden"
																name="detailsOfApprovalsOrNoc"
																value="Horticulture department"></td>
															<td><label class="radio-inline" for="inline-radio1"><input id="isApplicable_5" nocCount="5" onclick="showStatusOfNoc(this)"
																	type="radio" name="isApplicable_5" value="Yes" class="requiredValFld">Yes<span class='requiredValFldMsg'>Please select yes/No.</span></label>
																<label class="radio-inline" for="inline-radio2">
																	<input type="radio" name="isApplicable_5" value="No" class="requiredValFld" id="isApplicable_5" nocCount="5" onclick="hideStatusOfNoc(this)">No
																	<span class='requiredValFldMsg'>Please select yes/No.</span>
															</label></td>
															<td><select id="nocStatus_5" name="status" noccount="5" onchange="requiredNOC(this)"
																class="form-control input-sm" size="1">
																	<option value="0">select</option>
																	<option value="Approved">Approved</option>
																	<option value="Applied">Applied</option>
																	<option value="To Be Applied">To Be Applied</option>
															</select><span class='requiredValFldMsg'>Please select Status.</span></td>
															<td><input type="date" name="dateOfApplication" id="nocDate_5"
																class=""> <span class='requiredValFldMsg'>Please select Date Of Application.</span></td>
															<td><input type="file" name="uploadDoc" id="nocDoc_5"
																class=""><span class='requiredValFldMsg'>Please Upload Document.</span></td>
														</tr>
														<tr>
															<td>7</td>
															<td>Fire and Safety<input type="hidden"
																name="detailsOfApprovalsOrNoc" value="Fire and Safety"></td>
															<td><label class="radio-inline" for="inline-radio1"><input id="isApplicable_6" nocCount="6" onclick="showStatusOfNoc(this)"
																	type="radio" name="isApplicable_6" value="Yes" class="requiredValFld">Yes<span class='requiredValFldMsg'>Please select yes/No.</span></label>
																<label class="radio-inline" for="inline-radio2">
																	<input type="radio" name="isApplicable_6" class="requiredValFld" value="No" id="isApplicable_6" nocCount="6" onclick="hideStatusOfNoc(this)">No
																	<span class='requiredValFldMsg'>Please select yes/No.</span>
															</label></td>
															<td><select id="nocStatus_6" name="status" noccount="6" onchange="requiredNOC(this)"
																class="form-control input-sm" size="1">
																	<option value="0">select</option>
																	<option value="Approved">Approved</option>
																	<option value="Applied">Applied</option>
																	<option value="To Be Applied">To Be Applied</option>
															</select><span class='requiredValFldMsg'>Please select Status.</span></td>
															<td><input type="date" name="dateOfApplication" id="nocDate_6"
																class=""> <span class='requiredValFldMsg'>Please select Date Of Application.</span></td>
															<td><input type="file" name="uploadDoc" id="nocDoc_6"
																class=""> <span class='requiredValFldMsg'>Please Upload Document.</span></td>
														</tr>
														<tr>
															<td>8</td>
															<td>Labour and Education Department<input type="hidden"
																name="detailsOfApprovalsOrNoc"
																value="Labour and Education Department"></td>
															<td><label class="radio-inline" for="inline-radio1"><input id="isApplicable_7" nocCount="7" onclick="showStatusOfNoc(this)"
																	type="radio" name="isApplicable_7" value="Yes" class="requiredValFld">Yes<span class='requiredValFldMsg'>Please select yes/No.</span></label>
																<label class="radio-inline" for="inline-radio2">
																	<input type="radio" name="isApplicable_7" class="requiredValFld" value="No" id="isApplicable_7" nocCount="7" onclick="hideStatusOfNoc(this)">No
																	<span class='requiredValFldMsg'>Please select yes/No.</span>
															</label></td>
															<td><select id="nocStatus_7" name="status" noccount="7" onchange="requiredNOC(this)"
																class="form-control input-sm" size="1">
																	<option value="0">select</option>
																	<option value="Approved">Approved</option>
																	<option value="Applied">Applied</option>
																	<option value="To Be Applied">To Be Applied</option>
															</select><span class='requiredValFldMsg'>Please select Status.</span></td>
															<td><input type="date" name="dateOfApplication" id="nocDate_7"
																class=""> <span class='requiredValFldMsg'>Please select Date Of Application.</span></td>
															<td><input type="file" name="uploadDoc" id="nocDoc_7"
																class=""> <span class='requiredValFldMsg'>Please Upload Document.</span></td>
														</tr>
														<tr>
															<td>9</td>
															<td>Airport Authority<input type="hidden"
																name="detailsOfApprovalsOrNoc" value="Airport Authority"></td>
															<td><label class="radio-inline" for="inline-radio1"><input id="isApplicable_8" nocCount="8" onclick="showStatusOfNoc(this)"
																	type="radio" name="isApplicable_8" value="Yes" class="requiredValFld">Yes<span class='requiredValFldMsg'>Please select yes/No.</span></label>
																<label class="radio-inline" for="inline-radio2">
																	<input type="radio" name="isApplicable_8" class="requiredValFld" value="No" id="isApplicable_8" nocCount="8" onclick="hideStatusOfNoc(this)">No
																	<span class='requiredValFldMsg'>Please select yes/No.</span>
															</label></td>
															<td><select id="nocStatus_8" name="status" noccount="8" onchange="requiredNOC(this)"
																class="form-control input-sm" size="1">
																	<option value="0">select</option>
																	<option value="Approved">Approved</option>
																	<option value="Applied">Applied</option>
																	<option value="To Be Applied">To Be Applied</option>
															</select><span class='requiredValFldMsg'>Please select Status.</span></td>
															<td><input type="date" name="dateOfApplication" id="nocDate_8"
																class=""> <span class='requiredValFldMsg'>Please select Date Of Application.</span></td>
															<td><input type="file" name="uploadDoc" id="nocDoc_8"
																class=""> <span class='requiredValFldMsg'>Please Upload Document.</span></td>
														</tr>
														<tr>
															<td>10</td>
															<td>BSNL/Telecommunication Department<input type="hidden"
																name="detailsOfApprovalsOrNoc"
																value="BSNL/Telecommunication Department"></td>
															<td><label class="radio-inline" for="inline-radio1"><input id="isApplicable_9" nocCount="9" onclick="showStatusOfNoc(this)"
																	type="radio" name="isApplicable_9" value="Yes" class="requiredValFld">Yes<span class='requiredValFldMsg'>Please select yes/No.</span></label>
																<label class="radio-inline" for="inline-radio2">
																	<input type="radio" name="isApplicable_9" value="No" class="requiredValFld" id="isApplicable_9" nocCount="9" onclick="hideStatusOfNoc(this)">No
																	<span class='requiredValFldMsg'>Please select yes/No.</span>
															</label></td>
															<td><select id="nocStatus_9" name="status" noccount="9" onchange="requiredNOC(this)"
																class="form-control input-sm" size="1">
																	<option value="0">select</option>
																	<option value="Approved">Approved</option>
																	<option value="Applied">Applied</option>
																	<option value="To Be Applied">To Be Applied</option>
															</select><span class='requiredValFldMsg'>Please select Status.</span></td>
															<td><input type="date" name="dateOfApplication" id="nocDate_9"
																class=""> <span class='requiredValFldMsg'>Please select Date Of Application.</span></td>
															<td><input type="file" name="uploadDoc" id="nocDoc_9"
																class=""> <span class='requiredValFldMsg'>Please Upload Document.</span></td>
														</tr>
														<tr>
															<td>11</td>
															<td>Airport Authority of India<input type="hidden"
																name="detailsOfApprovalsOrNoc"
																value="Airport Authority of India"></td>
															<td><label class="radio-inline" for="inline-radio1"><input id="isApplicable_10" nocCount="10" onclick="showStatusOfNoc(this)"
																	type="radio" name="isApplicable_10" value="Yes" class="requiredValFld">Yes<span class='requiredValFldMsg'>Please select yes/No.</span></label>
																<label class="radio-inline" for="inline-radio2">
																	<input type="radio" name="isApplicable_10" value="No" class="requiredValFld" id="isApplicable_10" nocCount="10" onclick="hideStatusOfNoc(this)">No
																	<span class='requiredValFldMsg'>Please select yes/No.</span>
															</label></td>
															<td><select name="status" id="nocStatus_10" noccount="10" onchange="requiredNOC(this)"
																class="form-control input-sm" size="1">
																	<option value="0">select</option>
																	<option value="Approved">Approved</option>
																	<option value="Applied">Applied</option>
																	<option value="To Be Applied">To Be Applied</option>
															</select><span class='requiredValFldMsg'>Please select Status.</span></td>
															<td><input type="date" name="dateOfApplication" id="nocDate_10"
																class=""> <span class='requiredValFldMsg'>Please select Date Of Application.</span></td>
															<td><input type="file" name="uploadDoc" class="" id="nocDoc_10"> <span class='requiredValFldMsg'>Please Upload Document.</span></td>
														</tr> 
													</c:when>
													<c:otherwise>
														<%
															int count = -1;
																		int i = 0;
														%>
														<c:forEach items="${quarter.approvalsAndNOCDetails}"
															var="plotApprovalsAndNOCDetailsObj">
															<tr>
																<td><%=++i%></td>
																<%
																	count++;
																%>
																
																<td>
																<c:out value="${plotApprovalsAndNOCDetailsObj.detailsOfApprovalsOrNoc}"></c:out>
																<input type="hidden"
																	name="approvalsAndNocDetailsId"
																	value="${plotApprovalsAndNOCDetailsObj.approvalsAndNocDetailsId}" />
																	<input type="hidden" name="detailsOfApprovalsOrNoc"
																	value="${plotApprovalsAndNOCDetailsObj.detailsOfApprovalsOrNoc}"></td>
																<td><c:choose>
																		<c:when
																			test="${plotApprovalsAndNOCDetailsObj.isApplicable == 'Yes'}">

																			<div class="col-md-9">
																				<label class="radio-inline" for="isApplicable">
																					<input type="radio" class="requiredValFld" id="isApplicable_<%=count%>" nocCount="<%=count%>" onclick="showStatusOfNoc(this)"
																					name='isApplicable_<%=count%>' value="Yes"
																					class='dynaselectfld requiredValFld'
																					checked="checked">Yes<span class='requiredValFldMsg'>Please select yes/No.</span>
																				</label> <label class="radio-inline" for="isApplicable">
																					<input class="requiredValFld" type="radio" id="isApplicable_<%=count%>" nocCount="<%=count%>" onclick="hideStatusOfNoc(this)"
																					name='isApplicable_<%=count%>' value="No">No<span class='requiredValFldMsg'>Please select yes/No.</span>
																				</label>
																			</div>
																		</c:when>
																		<c:otherwise>
																			<div class="col-md-9">
																				<label class="radio-inline" for="isApplicable">
																					<input class="requiredValFld" type="radio" id="isApplicable_<%=count%>" nocCount="<%=count%>" onclick="showStatusOfNoc(this)"
																					name='isApplicable_<%=count%>' value="Yes">Yes<span class='requiredValFldMsg'>Please select yes/No.</span>
																				</label> <label class="radio-inline" for="isApplicable">
																					<input class="requiredValFld" type="radio" id="isApplicable_<%=count%>" nocCount="<%=count%>" onclick="hideStatusOfNoc(this)"
																					name='isApplicable_<%=count%>' value="No"
																					checked="checked">No<span class='requiredValFldMsg'>Please select yes/No.</span>
																				</label>
																			</div>
																		</c:otherwise>
																	</c:choose></td>
																<td>

																	<div class="form-group row">
																		<div class="col-md-16">
																			<select class="form-control" name="status" id="nocStatus_<%=count%>" noccount="<%=count%>" onchange="requiredNOC(this)">
																				<option value="0">--Select
																					${plotApprovalsAndNOCDetailsObj.status}--</option>
																				<c:choose>
																					<c:when
																						test="${plotApprovalsAndNOCDetailsObj.status=='Approved' }">
																						<option value="Approved" selected="selected">Approved</option>
																						<option value="Applied">Applied</option>
																						<option value="To Be Applied">To Be
																							Applied</option>
																					</c:when>
																					<c:when
																						test="${plotApprovalsAndNOCDetailsObj.status=='Applied' }">
																						<option value="Approved">Approved</option>
																						<option value="Applied" selected="selected">Applied</option>
																						<option value="To Be Applied">To Be
																							Applied</option>
																					</c:when>
																					<c:when
																						test="${plotApprovalsAndNOCDetailsObj.status=='To Be Applied' }">
																						<option value="Approved">Approved</option>
																						<option value="Applied">Applied</option>
																						<option value="To Be Applied" selected="selected">To
																							Be Applied</option>
																					</c:when>
																					<c:otherwise>
																						<option value="Approved">Approved</option>
																						<option value="Applied">Applied</option>
																						<option value="To Be Applied">To Be
																							Applied</option>
																					</c:otherwise>
																				</c:choose>
																			</select><span class='requiredValFldMsg'>Please select Status.</span>
																		</div>
																	</div>
																</td>

																<td><fmt:formatDate type="date"
																		pattern="yyyy-MM-dd" dateStyle="short"
																		var="formateddate1"
																		value="${plotApprovalsAndNOCDetailsObj.dateOfApplication.time}" />
																	<input type="date" name="dateOfApplication"  id="nocDate_<%=count%>"
																	value="${formateddate1}"
																	class="form-control " /> <span class='requiredValFldMsg'>Please select Date Of Application.</span></td>
																<td><input type="hidden" name="uploadDocId" id="nocDoc_<%=count%>"
																	value="${plotApprovalsAndNOCDetailsObj.uploadDoc.documentId}" />
																	<input type="file" name="uploadDoc" title="Only image or pdf file is allowed. file size upto 1 MB"><span class='requiredValFldMsg'>Please Upload Document.</span>
																	<a href='<%=request.getContextPath() %>/download?DOC_ID=${plotApprovalsAndNOCDetailsObj.uploadDoc.documentId}'>
																		${plotApprovalsAndNOCDetailsObj.uploadDoc.fileName}</a></td>
															</tr>
														</c:forEach>
													</c:otherwise>
												</c:choose>

											</tbody>
										</table>
										<div class="form-group row">
											<input type="button"
												class="btn btn-sm btn-success  pull-right"
												id="approvalPlotNocId" value="Save" />
											<!-- <button type="reset"
												class="btn btn-sm btn-danger  pull-right">
												<i class="fa fa-ban"></i> Reset
											</button> -->
											<!-- <button type="button"
												class="btn btn-primary btn-sm pull-right btn-add-plotnoc">Add
												More</button> -->
										</div>
									</form:form>
								</div>
							</div>
						</div>
					</div>
					
		<!-----------------------------Litigation Details  ----------------------------------->
							
					<div class="panel-group" id="accordion">
						<div class="panel panel-primary">
							<div class="panel-heading card-header collapsed"
								data-toggle="collapse" data-target="#bar10">
								<i class="fa fa-fw fa-chevron-down"></i> <i
									class="fa fa-fw fa-chevron-right"></i>Litigation Details
							</div>
							<div class="panel-body">
								<!-- The inside div eliminates the 'jumping' animation. -->
								<div class="collapse" id="bar10">
									<form:form action="updatePlotLitigationDetails" method="post"
										enctype="multipart/form-data" id="litigationForm"
										class="form-horizontal"
										modelAttribute="projectRegistrationModel">
										<form:hidden path="projectRegId" />
										<form:hidden path="projectRegId" />
										
										<div style="border-style: ridge; padding: 20px; background-color: #F8F8F8;">
										<c:choose>
											<c:when test="${ empty quarter.litigationDetails}">
												<div class="form-group row"></div>
												<div class="form-group row">
													<label class="col-md-3 form-control-label">Any
														litigations on the project (incl. land)? </label>
													<div class="col-md-9">
														<label class="radio-inline" for="inline-radio1"> <input
															type="radio" id="inline-radio1"
															name="anyLitigationOnProject" onclick="showPlotLitigation();" value="Yes"
															class="requiredValFld">Yes <span
															class='requiredValFldMsg'> Please select yes/No </span>
														</label> <label class="radio-inline" for="inline-radio2">
															<input type="radio" id="inline-radio2"
															name="anyLitigationOnProject" onclick="hidePlotLitigation();" value="No">No
														</label>
													</div>
												</div>
												<div id="litigationdetails" style="display: none;">
												<div class="form-group row">
													<label class="col-md-3 form-control-label">Type of
														Case </label>
													<div class="col-md-9">
														<select id="select" name="caseType"
															class="form-control input-sm" size="1"
															style="width: 200px;">
															<option value="0">--select--</option>
															<option value="Commercial">Commercial</option>
															<option value="Civil">Civil</option>
															<option value="Others">Others</option>
														</select>
													</div>
												</div>
												<div class="form-group row">
													<label class="col-md-3 form-control-label" for="text-input">Name
														of the Court / Authority </label>
													<div class="col-md-9">
														<input type="text" id="text-input"
															name="courtOrAuthorityName"
															class="form-control requiredValFld"
															placeholder="AuthorityName"> <span
															class='requiredValFldMsg'> Please Enter Court Or
															AuthorityName </span>
													</div>
												</div>
												<div class="form-group row">
													<label class="col-md-3 form-control-label" for="text-input">Case
														No. </label>
													<div class="col-md-9">
														<input type="number" id="text-input" name="caseNo"
															class="form-control requiredValFld"
															placeholder="only digits 0-9 allowed"> <span
															class='requiredValFldMsg'> Please Enter Case No. </span>
													</div>
												</div>
												<div class="form-group row">
													<label class="col-md-3 form-control-label" for="text-input">Year

													</label>
													<div class="col-md-9">
														<input type="number" id="text-input" name="litigationYear"
															class="form-control requiredValFld" placeholder="eg:2018">
														<span class='requiredValFldMsg'> Please select Year
														</span>
													</div>
												</div>
																										<div class="form-group row">
															<label class="col-md-3 form-control-label">Whether
																any Preventive Order issued? (Injunction / Interim Order
																/ Final Order / Stay Order) </label>
															<div class="col-md-9">
																<label class="radio-inline" for="inline-radio1">
																	<input type="radio" id="inline-radio1"
																	name="anyPreventiveOrderIssued" value="Yes"
																	class="requiredValFld" onclick="showPlotCaseFile();">Yes
																</label> <label class="radio-inline" for="inline-radio2">
																	<input type="radio" id="inline-radio2"
																	name="anyPreventiveOrderIssued" value="No" onclick="hidePlotCaseFile();">No
																</label>

															</div>
														</div>
														<div class="form-group row" id="showCaseFile" style="display: none;">
															<label class="col-md-3 form-control-label"
																for="file-input">Preventive Order (Injunction /
																Interim Order / Final Order / Stay Order </label>
															<div class="col-md-3">
																<input type="file" id="file-input"
																	name="preventiveOrderDoc" class="requiredValFld">
																<span class='requiredValFldMsg'> Please select
																	Preventive Order </span>
															</div>
															<label class="col-md-3 form-control-label">Present
																Status</label>
															<div class="col-md-3">
																<select id="select" name="litigationStatus"
																	class="form-control input-sm" size="1"
																	style="width: 200px;">
																	<option value="0">--select--</option>
																	<option value="Pending">Pending </option>
																	<option value="Disposed">Disposed</option>
																</select>
															</div>
														</div>
														</div>
											</c:when>
											<c:otherwise>
												<c:forEach items="${quarter.litigationDetails}"
													var="litigationDetails">
													<div class="form-group row"></div>
													<div class="form-group row">
														<label class="col-md-3 form-control-label">Any
															litigations on the project (incl. land)? </label>

														
														<c:choose>
															<c:when
																test="${litigationDetails.anyLitigationOnProject == 'Yes'}">
																<div class="col-md-9">
																	<label class="radio-inline"
																		for="anyLitigationOnProject"> <input
																		type="radio" id="anyLitigationOnProject" onclick="showPlotLitigation();"
																		name='anyLitigationOnProject' value="Yes"
																		class='dynaselectfld requiredValFld' checked="checked">Yes
																	</label> <label class="radio-inline"
																		for="anyLitigationOnProject"> <input onclick="hidePlotLitigation();"
																		type="radio" id="anyLitigationOnProject"
																		name='anyLitigationOnProject' value="No">No
																	</label>
																</div>
															</c:when>
															<c:otherwise>
																<div class="col-md-9">
																	<label class="radio-inline"
																		for="anyLitigationOnProject"> <input
																		type="radio" id="inline-radio1" onclick="showPlotLitigation();"
																		name='anyLitigationOnProject' value="Yes">Yes
																	</label> <label class="radio-inline"
																		for="anyLitigationOnProject"> <input
																		type="radio" id="inline-radio2" onclick="hidePlotLitigation();"
																		name='anyLitigationOnProject' value="No"
																		checked="checked">No
																	</label>
																</div>
															</c:otherwise>
														</c:choose>
													</div>
								<div id="litigationdetails">
													<div class="form-group row">
														<label class="col-md-3 form-control-label">Type of
															Case </label>
														<div class="col-md-9">
															<select id="select" name="caseType"
																class="form-control input-sm" size="1"
																style="width: 200px;">
																<option value="0">select</option>
																<c:choose>
																	<c:when
																		test="${litigationDetails.caseType == 'Commercial'}">
																		<option value="Commercial" selected="selected">Commercial
																		</option>
																		<option value="Civil">Civil</option>
																		<option value="Others">Others</option>
																	</c:when>
																	<c:when test="${litigationDetails.caseType == 'Civil'}">
																		<option value="Commercial">Commercial</option>
																		<option value="Civil" selected="selected">Civil</option>
																		<option value="Others">Others</option>
																	</c:when>
																	<c:when
																		test="${litigationDetails.caseType == 'Others'}">
																		<option value="Commercial">Commercial</option>
																		<option value="Civil">Civil</option>
																		<option value="Others" selected="selected">Others</option>
																	</c:when>
																	<c:otherwise>
																		<option value="Commercial">Commercial</option>
																		<option value="Civil">Civil</option>
																		<option value="Others">Others</option>
																	</c:otherwise>
																</c:choose>
															</select>
														</div>
													</div>
													<div class="form-group row">
														<label class="col-md-3 form-control-label"
															for="text-input">Name of the Court / Authority </label>
														<div class="col-md-9">

															<input type="hidden" id="text-input"
																name="litigationDetailsId"
																value="${litigationDetails.litigationDetailsId}"
																class="form-control" placeholder=""> <input
																type="text" id="text-input" name="courtOrAuthorityName"
																value="${litigationDetails.courtOrAuthorityName}"
																class="form-control requiredValFld" placeholder="">
															<span class='requiredValFldMsg'> Please Enter
																Court Or AuthorityName </span>
														</div>
													</div>
													<div class="form-group row">
														<label class="col-md-3 form-control-label"
															for="text-input">Case No. </label>
														<div class="col-md-9">
															<input type="number" id="text-input" name="caseNo"
																value="${litigationDetails.caseNo}"
																class="form-control requiredValFld" placeholder="">
															<span class='requiredValFldMsg'> Please Enter Case
																No. </span>
														</div>
													</div>
													<div class="form-group row">
														<label class="col-md-3 form-control-label"
															for="text-input">Year </label>
														<div class="col-md-9">
															<fmt:formatDate type="date" pattern="yyyy"
																dateStyle="short" var="formateddate1"
																value="${litigationDetails.litigationYear.time}" />
															<input type="number" name="litigationYear"
																value="${formateddate1}"
																class="form-control requiredValFld" /> <span
																class='requiredValFldMsg'> Please select Year </span>
														</div>
													</div>
													<div class="form-group row">
														<label class="col-md-3 form-control-label">Whether
															any Preventive Order issued? (Injunction / Interim Order
															/ Final Order / Stay Order) </label>

														<c:choose>
															<c:when
																test="${litigationDetails.anyPreventiveOrderIssued == 'Yes'}">
																<div class="col-md-9">
																	<label class="radio-inline"
																		for="anyPreventiveOrderIssued"> <input
																		type="radio" id="anyPreventiveOrderIssued" onclick="showPlotCaseFile();"
																		name='anyPreventiveOrderIssued' value="Yes"
																		class='dynaselectfld requiredValFld' checked="checked">Yes
																	</label> <label class="radio-inline"
																		for="anyPreventiveOrderIssued"> <input onclick="hidePlotCaseFile();"
																		type="radio" id="anyPreventiveOrderIssued"
																		name='anyPreventiveOrderIssued' value="No">No
																	</label>
																</div>
															</c:when>
															<c:otherwise>
																<div class="col-md-9">
																	<label class="radio-inline"
																		for="anyPreventiveOrderIssued"> <input
																		type="radio" id="inline-radio1" onclick="showPlotCaseFile();"
																		name='anyPreventiveOrderIssued' value="Yes">Yes
																	</label> <label class="radio-inline"
																		for="anyPreventiveOrderIssued"> <input
																		type="radio" id="inline-radio2" onclick="hidePlotCaseFile();"
																		name='anyPreventiveOrderIssued' value="No"
																		checked="checked">No
																	</label>
																</div>
															</c:otherwise>
														</c:choose>
													</div>
													<div id="showCaseFile">
													<div class="form-group row">
														<label class="col-md-3 form-control-label"
															for="file-input">Preventive Order (Injunction /
															Interim Order / Final Order / Stay Order</label>
														<div class="col-md-3">
															<input type="hidden" name="preventiveOrderDocId"
																value="${litigationDetails.preventiveOrderDoc.documentId}" />
															<input type="file" name="preventiveOrderDoc"
																title="Only image or pdf file is allowed. file size upto 1 MB">
															<a
																href='<%=request.getContextPath() %>/download?DOC_ID=${litigationDetails.preventiveOrderDoc.documentId}'>
																${litigationDetails.preventiveOrderDoc.fileName}</a>
														</div>
													
														<label class="col-md-3 form-control-label">Present
															Status</label>

														<div class="col-md-3">
															<select class="form-control requiredValFld"
																name="litigationStatus" style="width: 200px;">
																<option value="0">--Select--</option>
																<c:choose>
																	<c:when
																		test="${litigationDetails.litigationStatus=='Pending' }">
																		<option value="Pending" selected="selected">Pending</option>
																		<option value="Disposed">Disposed</option>
																	</c:when>
																	<c:when
																		test="${litigationDetails.litigationStatus=='Disposed' }">
																		<option value="Disposed" selected="selected">Disposed</option>
																		<option value="Pending">Pending</option>
																	</c:when>
																	<c:otherwise>
																		<option value="Disposed">Disposed</option>
																		<option value="Pending">Pending</option>
																	</c:otherwise>
																</c:choose>
															</select> <span class='requiredValFldMsg'> Please Present
																Status .</span>

														</div>
													</div>
												
													</div>
													</div>

												</c:forEach>
											</c:otherwise>
										</c:choose>
										</div>
										<br/>

										<div class="form-group row">
											<input type="button"
												class="btn btn-sm btn-success  pull-right" id="litigationId"
												value="Save" />
											<!-- <button type="reset"
												class="btn btn-sm btn-danger  pull-right">
												<i class="fa fa-ban"></i> Reset
											</button> -->
										</div>
									</form:form>

								</div>
							</div>
						</div>
					</div>
					
					<!-- ---------------------------Modification details -->
					<div class="panel-group" id="accordion">
						<div class="panel panel-primary">
							<div class="panel-heading card-header collapsed"
								data-toggle="collapse" data-target="#bar11">
								<i class="fa fa-fw fa-chevron-down"></i> <i
									class="fa fa-fw fa-chevron-right"></i>Modification, Amendment
								or Revision to License, Permit or Approval
							</div>
							<div class="panel-body">
								<!-- The inside div eliminates the 'jumping' animation. -->
								<div class="collapse" id="bar11">
									<form action="updatePlotModificationDetails" method="post"
										enctype="multipart/form-data" class="form-horizontal "
										id="modificationForm">
										<div style="border-style: ridge; padding: 20px; background-color: #F8F8F8;">
										<c:choose>
											<c:when test="${ empty quarter.modificationDetails}">

												<div class="form-group row">
													<label class="col-md-3 form-control-label">Is any
														there modification to approvals? </label>
													<div class="col-md-9">
														<label class="radio-inline"
															for="isModificationRequiredToApprove"> <input
															type="radio" id="isModificationRequiredToApprove"
															name="isModificationRequiredToApprove" value="Yes" onclick="showPlotModificationDetails();"
															class="requiredValFld">Yes <span
															class='requiredValFldMsg'> Please select Yes/No </span>
														</label> <label class="radio-inline" for="inline-radio2">
															<input type="radio" id="isModificationRequiredToApprove" onclick="hidePlotModificationDetails();"
															name="isModificationRequiredToApprove" value="No">No
														</label>
													</div>
												</div>
												<div id="modificationdetails" style="display: none;">
												<div class="form-group row">
													<label class="col-md-3 form-control-label" for="text-input">Issued
														by Authority</label>
													<div class="col-md-9">
														<input type="text" id="text-input"
															name="issuedByAuthority"
															class="form-control requiredValFld"
															placeholder="Authority Name"> <span
															class='requiredValFldMsg'> Please select Issued by
															Authority</span>
													</div>
												</div>
												<div class="form-group row">
													<label class="col-md-3 form-control-label" for="file-input">Upload
														approval document </label>
													<div class="col-md-9">
														<input type="file" id="file-input"
															name="uploadApprovalDoc"
															class="form-control requiredValFld"> <span
															class='requiredValFldMsg'> Please select Upload
															approval document</span>
													</div>
												</div>

												<div class="form-group row">
													<label class="col-md-3 form-control-label">Written
														consent of at least two-third of Allottees </label>

													<!--   <label class="col-md-3 form-control-label">   Is any Association formed? </label> -->
													<div class="col-md-9">
														<label class="radio-inline" for="isAssocitionFormed">
															<input type="radio" id="isAssocitionFormed"
															name='writtenConsentOfAllotee' value="Yes"
															class='dynaselectfld requiredValFld' onclick="showPlotMoreModificationDetails();" >Yes
															<span class='requiredValFldMsg' > Please select
																yes/No</span>
														</label> <label class="radio-inline" for="isAssocitionFormed">
															<input type="radio" id="isAssocitionFormed"
															name='writtenConsentOfAllotee' onclick="hidePlotMoreModificationDetails();" value="No">No
														</label>
													</div>
												</div>
									
												<div id="plotmodification" style="display: none;">
												<div class="form-group row">
													<label class="col-md-3 form-control-label" for="file-input">Upload
														document</label>
													<div class="col-md-9">
														<input type="file" id="file-input" name="uploadDoc"
															class="form-control requiredValFld"> <span
															class='requiredValFldMsg'> Please select Upload
															document</span>
													</div>
												</div>
												<div class="form-group row">
													<label class="col-md-3 form-control-label" for="file-input">Modified
														Plan </label>
													<div class="col-md-9">
														<input type="file" id="file-input" name="modifiedDoc"
															class="form-control requiredValFld"> <span
															class='requiredValFldMsg'> Please Upload Modified
															Plan</span>
													</div>
												</div>
												<div class="form-group row">
													<label class="col-md-3 form-control-label" for="text-input">Plan
														Number</label>
													<div class="col-md-9">
														<input type="text" id="text-input"
															name="modificationPlanNo"
															class="form-control requiredValFld"
															placeholder="Please Enter Plan number"> <span
															class='requiredValFldMsg'> Please Enter Plan
															number</span>
													</div>
												</div>





												<div class="form-group row">
													<label class="col-md-3 form-control-label" for="file-input">Date
														Of Approval</label>
													<div class="col-md-9">
														<input type="date" name="dateOfApproval">
													</div>
												</div>

												<div class="form-group row">
													<label class="col-md-3 form-control-label" for="file-input">Details
														Of Plot Released</label>
													<div class="col-md-9">
														<input type="file" id="file-input"
															name="detailsOfPlotReleased"
															class="form-control requiredValFld"> <span
															class='requiredValFldMsg'> Please select Details
															Of Plot Released document</span>
													</div>
												</div>


												<div class="form-group row">
													<label class="col-md-3 form-control-label" for="file-input">No
														Objection Certificate Issued</label>
													<div class="col-md-9">
														<input type="file" id="file-input"
															name="plotNocCertificate"
															class="form-control requiredValFld"> <span
															class='requiredValFldMsg'> Please select No
															Objection Certificate Issued</span>
													</div>
												</div>
												</div>
												</div>
											</c:when>
											<c:otherwise>
												<c:forEach items="${quarter.modificationDetails }"
													var="modificationDetailsObj">
													<div class="form-group row"></div>
													<div class="form-group row">
														<label class="col-md-3 form-control-label">Is any
															there modification to approvals? </label>
														<c:choose>
															<c:when
																test="${modificationDetailsObj.isModificationRequiredToApprove == 'Yes'}">
																<div class="col-md-9">
																	<label class="radio-inline"
																		for="isModificationRequiredToApprove"> <input onclick="showPlotModificationDetails();"
																		type="radio" id="isModificationRequiredToApprove"
																		name='isModificationRequiredToApprove' value="Yes"
																		class='dynaselectfld requiredValFld' checked="checked">Yes
																	</label> <label class="radio-inline"
																		for="isModificationRequiredToApprove"> <input onclick="hidePlotModificationDetails();"
																		type="radio" id="isModificationRequiredToApprove"
																		name='isModificationRequiredToApprove' value="No">No
																	</label>
																</div>
															</c:when>
															<c:otherwise>
																<div class="col-md-9">
																	<label class="radio-inline"
																		for="isModificationRequiredToApprove"> <input
																		type="radio" id="inline-radio1" onclick="showPlotModificationDetails();"
																		name='isModificationRequiredToApprove' value="Yes">Yes
																	</label> <label class="radio-inline" for="isAssocitionFormed">
																		<input type="radio" id="inline-radio2" onclick="hidePlotModificationDetails();"
																		name='isModificationRequiredToApprove' value="No"
																		checked="checked">No
																	</label>
																</div>
															</c:otherwise>
														</c:choose>
													</div>
													<div id="modificationdetails">
													<div class="form-group row">
														<label class="col-md-3 form-control-label"
															for="text-input">Issued by Authority</label>
														<div class="col-md-9">

															<input type="hidden" id="text-input"
																name="modificationDetailsId"
																value="${modificationDetailsObj.modificationDetailsId}"
																class="form-control" placeholder=""> <input
																type="text" id="text-input" name="issuedByAuthority"
																value="${modificationDetailsObj.issuedByAuthority}"
																class="form-control requiredValFld" placeholder="">
															<span class='requiredValFldMsg'> Please select
																Issued by Authority</span>
														</div>
													</div>
													<div class="form-group row">
														<label class="col-md-3 form-control-label"
															for="file-input">Upload approval document </label>
														<div class="col-md-9">
															<input type="hidden" name="uploadApprovalDocId"
																value="${modificationDetailsObj.uploadApprovalDoc.documentId}" />
															<input type="file" name="uploadApprovalDoc"
																title="Only image or pdf file is allowed. file size upto 1 MB">
															<a
																href='<%=request.getContextPath() %>/download?DOC_ID=${modificationDetailsObj.uploadApprovalDoc.documentId}'>
																${modificationDetailsObj.uploadApprovalDoc.fileName}</a>
														</div>
													</div>


													<div class="form-group row">
														<label class="col-md-3 form-control-label">Written
															consent of at least two-third of Allottees </label>

														<c:choose>
															<c:when
																test="${modificationDetailsObj.writtenConsentOfAllotee == 'Yes'}">
																<div class="col-md-9">
																	<label class="radio-inline"
																		for="writtenConsentOfAllotee"> <input onclick="showPlotMoreModificationDetails();"
																		type="radio" id="writtenConsentOfAllotee"
																		name='writtenConsentOfAllotee' value="Yes"
																		class='dynaselectfld requiredValFld' checked="checked">Yes
																	</label> <label class="radio-inline"
																		for="writtenConsentOfAllotee"> <input onclick="hidePlotMoreModificationDetails();"
																		type="radio" id="writtenConsentOfAllotee"
																		name='writtenConsentOfAllotee' value="No">No
																	</label>
																</div>
															</c:when>
															<c:otherwise>
																<div class="col-md-9">
																	<label class="radio-inline"
																		for="writtenConsentOfAllotee"> <input
																		type="radio" id="inline-radio1" onclick="showPlotMoreModificationDetails();"
																		name='writtenConsentOfAllotee' value="Yes">Yes
																	</label> <label class="radio-inline"
																		for="writtenConsentOfAllotee"> <input
																		type="radio" id="inline-radio2" onclick="hidePlotMoreModificationDetails();"
																		name='writtenConsentOfAllotee' value="No"
																		checked="checked">No
																	</label>
																</div>
															</c:otherwise>
														</c:choose>
													</div>
													
													<div id="plotmodification">
													<div class="form-group row">
														<label class="col-md-3 form-control-label"
															for="file-input">Upload document</label>
														<div class="col-md-9">
															<input type="hidden" name="uploadApprovalDocId"
																value="${modificationDetailsObj.uploadDoc.documentId}" />
															<input type="file" name="uploadDoc"
																title="Only image or pdf file is allowed. file size upto 1 MB">
															<a
																href='<%=request.getContextPath() %>/download?DOC_ID=${modificationDetailsObj.uploadDoc.documentId}'>
																${modificationDetailsObj.uploadDoc.fileName}</a>
														</div>
													</div>
													<div class="form-group row">
														<label class="col-md-3 form-control-label"
															for="file-input">Modified Plan </label>
														<div class="col-md-9">
															<input type="hidden" name="modifiedDocId"
																value="${modificationDetailsObj.modifiedDoc.documentId}" />
															<input type="file" name="modifiedDoc"
																title="Only image or pdf file is allowed. file size upto 1 MB">
															<a
																href='<%=request.getContextPath() %>/download?DOC_ID=${modificationDetailsObj.modifiedDoc.documentId}'>
																${modificationDetailsObj.modifiedDoc.fileName}</a>
														</div>
													</div>
													<div class="form-group row">
														<label class="col-md-3 form-control-label"
															for="text-input">Plan Number</label>
														<div class="col-md-9">
															<input type="text" id="text-input"
																name="modificationPlanNo"
																value="${modificationDetailsObj.modificationPlanNo}"
																class="form-control requiredValFld"
																placeholder="Please Enter Plan number"> <span
																class='requiredValFldMsg'> Please Enter Plan
																number</span>
														</div>
													</div>
													<div class="form-group row">
														<label class="col-md-3 form-control-label"
															for="dateOfApproval">Date Of Approval</label>
														<div class="col-md-9">
															<fmt:formatDate type="date" pattern="yyyy-MM-dd"
																dateStyle="short" var="formateddate2"
																value="${modificationDetailsObj.dateOfApproval.time}" />
															<input type="date" value="${formateddate2}"
																name="dateOfApproval">
														</div>
													</div>
													<div class="form-group row">
														<label class="col-md-3 form-control-label"
															for="file-input">Details Of Plot Released</label>
														<div class="col-md-9">
															<input type="hidden" name="detailsOfPlotReleasedId"
																value="${modificationDetailsObj.detailsOfPlotReleased.documentId}" />
															<input type="file" name="detailsOfPlotReleased"
																title="Only image or pdf file is allowed. file size upto 1 MB">
															<a
																href='<%=request.getContextPath() %>/download?DOC_ID=${modificationDetailsObj.detailsOfPlotReleased.documentId}'>
																${modificationDetailsObj.detailsOfPlotReleased.fileName}</a>
														</div>
													</div>

													<div class="form-group row">
														<label class="col-md-3 form-control-label"
															for="file-input">No Objection Certificate Issued</label>
														<div class="col-md-9">
															<input type="hidden" name="plotNocCertificateId"
																value="${modificationDetailsObj.plotNocCertificate.documentId}" />
															<input type="file" name="plotNocCertificate"
																title="Only image or pdf file is allowed. file size upto 1 MB">
															<a
																href='<%=request.getContextPath() %>/download?DOC_ID=${modificationDetailsObj.plotNocCertificate.documentId}'>
																${modificationDetailsObj.plotNocCertificate.fileName}</a>
														</div>
													</div>
													</div>
													</div>

												</c:forEach>
											</c:otherwise>

										</c:choose>
										</div>
										<br/>
										<div class="form-group row">
											<input type="button"
												class="btn btn-sm btn-success  pull-right"
												id="modificationId" value="Save" />
											<!-- <button type="reset"
												class="btn btn-sm btn-danger  pull-right">
												<i class="fa fa-ban"></i> Reset
											</button> -->
										</div>
									</form>

								</div>
							</div>
						</div>
					</div>
					
					<!-- association details -->
					<div class="panel-group" id="accordion">
						<div class="panel panel-primary">
							<div class="panel-heading card-header collapsed"
								data-toggle="collapse" data-target="#bar12">
								<i class="fa fa-fw fa-chevron-down"></i> <i
									class="fa fa-fw fa-chevron-right"></i> Association of Allottees
							</div>
							<div class="panel-body">
								<!-- The inside div eliminates the 'jumping' animation. -->
								<div class="collapse" id="bar12">
									<form:form action="updatePlotAssociationDetails" method="post"
										enctype="multipart/form-data" class="form-horizontal"
										id="associationForm">
										<div style="border-style: ridge; padding: 20px; background-color: #F8F8F8;">

										<c:choose>
											<c:when test="${ empty quarter.associationDetails}">
												<div class="form-group row"></div>
												<div class="form-group row">
													<label class="col-md-3 form-control-label"> Is any
														Association formed? </label>
													<div class="col-md-9">
														<label class="radio-inline" for="inline-radio1"><input
															type="radio" name="isAssocitionFormed" onclick="showPlotAssociationDetails();" value="Yes"
															class="requiredValFld">Yes <span
															class='requiredValFldMsg'> Please select Is any
																Association formed?</span> </label> <label class="radio-inline"
															for="inline-radio2"> <input type="radio" onclick="hidePlotAssociationDetails();"
															name="isAssocitionFormed" value="No">No
														</label>
													</div>
												</div>
												
												<div id="associationdetails" style="display: none;">
												<div class="form-group row">
													<label class="col-md-3 form-control-label"
														for="associationName">Name of the Association </label>
													<div class="col-md-9">
														<input type="text" id="associationName"
															name="associationName"
															class="form-control requiredValFld" placeholder="">
														<span class='requiredValFldMsg'> Please select Name
															of the Association</span>
													</div>
												</div>

												<div class="form-group row">
													<label class="col-md-3 form-control-label"
														for="registeredDoc ">Registration document </label>
													<div class="col-md-9">
														<input type="file" id="registeredDoc" name="registeredDoc"
															class="requiredValFld"> <span
															class='requiredValFldMsg'> Please upload document</span>
													</div>
												</div>
												</div>
											</c:when>
											<c:otherwise>
												<div class="form-group row"></div>
												<div class="form-group row">
													<label class="col-md-3 form-control-label"> Is any
														Association formed? </label>
													<c:choose>
														<c:when
															test="${quarter.associationDetails.isAssocitionFormed == 'Yes'}">
															<div class="col-md-9">
																<label class="radio-inline" for="isAssocitionFormed">
																	<input type="radio" id="isAssocitionFormed" onclick="showPlotAssociationDetails();"
																	name='isAssocitionFormed' value="Yes"
																	class='dynaselectfld requiredValFld' checked="checked">Yes
																</label> <label class="radio-inline" for="isAssocitionFormed">
																	<input type="radio" id="isAssocitionFormed" onclick="hidePlotAssociationDetails();"
																	name='isAssocitionFormed' value="No">No
																</label>
															</div>
														</c:when>
														<c:otherwise>
															<div class="col-md-9">
																<label class="radio-inline" for="isAssocitionFormed">
																	<input type="radio" id="inline-radio1" onclick="showPlotAssociationDetails();"
																	name='isAssocitionFormed' value="Yes">Yes
																</label> <label class="radio-inline" for="isAssocitionFormed">
																	<input type="radio" id="inline-radio2" onclick="hidePlotAssociationDetails();"
																	name='isAssocitionFormed' value="No" checked="checked">No
																</label>
															</div>
														</c:otherwise>
													</c:choose>
												</div>

												<div id="associationdetails">
												<div class="form-group row">
													<label class="col-md-3 form-control-label"
														for="associationName">Name of the Association</label>
													<div class="col-md-9">
														<input type="text" id="associationName"
															name="associationName"
															value="${quarter.associationDetails.associationName}"
															class="form-control requiredValFld" placeholder="">
														<span class='requiredValFldMsg'> Please select Name
															of the Association</span>
													</div>
												</div>

												<div class="form-group row">
													<label class="col-md-3 form-control-label"
														for="registeredDoc">Registration document </label>
													<div class="col-md-9">
														<input type="hidden" name="registeredDocId"
															value="${quarter.associationDetails.registeredDoc.documentId}" />
														<input type="file" name="registeredDoc"
															title="Only image or pdf file is allowed. file size upto 1 MB">
														<a
															href='<%=request.getContextPath() %>/download?DOC_ID=${quarter.associationDetails.registeredDoc.documentId}'>
															${quarter.associationDetails.registeredDoc.fileName}</a>
													</div>
												</div>
												</div>
											</c:otherwise>
										</c:choose>
										</div>
										<br/>
										<div class="form-group row">
											<input type="button"
												class="btn btn-sm btn-success  pull-right"
												id="associationId" value="Save" />
											<!-- <button type="reset"
												class="btn btn-sm btn-danger  pull-right">
												<i class="fa fa-ban"></i> Reset
											</button> -->
										</div>
									</form:form>
								</div>
							</div>
							
							<!----------------------------------welfare fund ------------------- -->

							<div class="panel-group" id="accordion">
								<div class="panel panel-primary">
									<div class="panel-heading card-header collapsed"
										data-toggle="collapse" data-target="#bar13">
										<i class="fa fa-fw fa-chevron-down"></i> <i
											class="fa fa-fw fa-chevron-right"></i> Construction Workers
										Welfare Fund Registration
									</div>
									<div class="panel-body">
										<!-- The inside div eliminates the 'jumping' animation. -->
										<div class="collapse" id="bar13">
											<form:form action="updatePlotConstructionWelfareDetails"
												method="post" enctype="multipart/form-data"
												class="form-horizontal" id="welfareForm">
												<div style="border-style: ridge; padding: 20px; background-color: #F8F8F8;">

												<c:choose>
													<c:when test="${ empty quarter.welfareFundDetails}">
														<div class="form-group row">
															<label class="col-md-3 form-control-label"> Is
																Applicable? </label>
															<div class="col-md-9">
																<label class="radio-inline" for="inline-radio1"><input
																	type="radio" name="isWelfareFundApplicable" value="Yes"
																	class="requiredValFld" onclick="showPlotWelfareDetails();">Yes <span
																	class='requiredValFldMsg'> Please select Is any
																		Association formed?</span> </label> <label class="radio-inline"
																	for="inline-radio2"> <input type="radio"
																	name="isWelfareFundApplicable" value="No" onclick="hidePlotWelfareDetails();">No
																</label>
															</div>
														</div>

														<div id="welfaredetails" style="display: none;">
														<div class="form-group row">
															<label class="col-md-3 form-control-label"
																for="plotWelfareFundRegNo">Registration
																Number </label>
															<div class="col-md-9">
																<input type="text" id="plotWelfareFundRegNo"
																	name="plotWelfareFundRegNo" 
																	class="form-control requiredValFld" placeholder="">
																<span class='requiredValFldMsg'> Please select
																	Name of the Association</span>
															</div>
														</div>

														<div class="form-group row">
															<label class="col-md-3 form-control-label"
																for="welfareFundregisteredDoc ">Registration
																document </label>
															<div class="col-md-9">
																<input type="file" id="welfareFundregisteredDoc"
																	name="welfareFundregisteredDoc" class="requiredValFld">
																<span class='requiredValFldMsg'> Please upload
																	Registration Document</span>
															</div>
														</div>
														</div>
													</c:when>
													<c:otherwise>
														<div class="form-group row"></div>
														<div class="form-group row">
															<label class="col-md-3 form-control-label"> Is Applicable? </label>
															<c:choose>
																<c:when
																	test="${quarter.welfareFundDetails.isWelfareFundApplicable == 'Yes'}">
																	<div class="col-md-9">
																		<label class="radio-inline"
																			for="isWelfareFundApplicable"> <input onclick="showPlotWelfareDetails();"
																			type="radio" id="isWelfareFundApplicable"
																			name='isWelfareFundApplicable' value="Yes"
																			class='dynaselectfld requiredValFld'
																			checked="checked">Yes
																		</label> <label class="radio-inline"
																			for="isWelfareFundApplicable"> <input onclick="hidePlotWelfareDetails();"
																			type="radio" id="isWelfareFundApplicable"
																			name='isWelfareFundApplicable' value="No">No
																		</label>
																	</div>
																</c:when>
																<c:otherwise>
																	<div class="col-md-9">
																		<label class="radio-inline"
																			for="isWelfareFundApplicable"> <input
																			type="radio" id="inline-radio1" onclick="showPlotWelfareDetails();"
																			name='isWelfareFundApplicable' value="Yes">Yes
																		</label> <label class="radio-inline"
																			for="isWelfareFundApplicable"> <input
																			type="radio" id="inline-radio2" onclick="hidePlotWelfareDetails();"
																			name='isWelfareFundApplicable' value="No"
																			checked="checked">No
																		</label>
																	</div>
																</c:otherwise>
															</c:choose>
														</div>

														<div id="welfaredetails">
														<div class="form-group row">
															<label class="col-md-3 form-control-label"
																for="plotWelfareFundRegNo">Name of the
																Association</label>
															<div class="col-md-9">
																<input type="text" id="plotWelfareFundRegNo"
																	name="plotWelfareFundRegNo"
																	value="${quarter.welfareFundDetails.plotWelfareFundRegNo}"
																	class="form-control requiredValFld" placeholder="">
																<span class='requiredValFldMsg'> Please select
																	Name of the Association</span>
															</div>
														</div>

														<div class="form-group row">
															<label class="col-md-3 form-control-label"
																for="welfareFundregisteredDoc">Registration
																document </label>
															<div class="col-md-9">
																<input type="hidden" name="welfareFundregisteredDocId"
																	value="${quarter.welfareFundDetails.welfareFundregisteredDoc.documentId}" />
																<input type="file" name="welfareFundregisteredDoc"
																	title="Only image or pdf file is allowed. file size upto 1 MB">
																<a
																	href='<%=request.getContextPath() %>/download?DOC_ID=${quarter.welfareFundDetails.welfareFundregisteredDoc.documentId}'>
																	${quarter.welfareFundDetails.welfareFundregisteredDoc.fileName}</a>
															</div>
														</div>
														</div>
													</c:otherwise>
												</c:choose>
												</div>
												<br/>
												<div class="form-group row">
													<input type="button"
														class="btn btn-sm btn-success  pull-right" id="welfareId"
														value="Save" />
													<!-- <button type="reset"
														class="btn btn-sm btn-danger  pull-right">
														<i class="fa fa-ban"></i> Reset
													</button> -->
												</div>
											</form:form>
										</div>
									</div>
									</div>
									</div>
									</div>
									



								</div>
								
								<!-------------------------- Bank details------------------------------------- -->

							</div>
						</div>
					</div>

					<div class="panel-group" id="accordion">
						<div class="panel panel-primary">
							<div class="panel-heading card-header collapsed"
								data-toggle="collapse" data-target="#bar2">
								<i class="fa fa-fw fa-chevron-down"></i> <i
									class="fa fa-fw fa-chevron-right"></i> Bank Details
							</div>
							<div class="panel-body">
								<!-- The inside div eliminates the 'jumping' animation. -->
								<div class="collapse" id="bar2">
									<form:form action="updatePlotBankDetails" method="post"
										enctype="multipart/form-data" class="form-horizontal"
										id="bankForm" modelAttribute="projectRegistrationModel">
										<div style="border-style: ridge; padding: 20px; background-color: #F8F8F8;">
										<c:choose>
											<c:when test="${ empty quarter.bankDetails}">
												<div class="form-group row"></div>
												<div class="form-group row">
													<label class="col-md-3 form-control-label"
														for="percentageOfProjectCompletion">Percentage of
														completion of project</label>
													<div class="col-md-9">
														<input type="number" id="percentageOfProjectCompletion" maxlength=3
															name="percentageOfProjectCompletion"
															class="form-control requiredValFld" placeholder="Only digits are allowed">
														<span class='requiredValFldMsg'> Please Select
															Percentage of completion of project</span>
													</div>
												</div>

												<div class="form-group row">
													<label class="col-md-3 form-control-label"
														for="totAdvanceAmt">Total advance amount collected
														from prospective purchasers (in INR) </label>
													<div class="col-md-9">
														<input type="number" id="totAdvanceAmt" name="totAdvanceAmt"
															class="form-control requiredValFld" placeholder="Only digits are allowed">
														<span class='requiredValFldMsg'> Please Select
															Total advance amount</span>
													</div>
												</div>

												<div class="form-group row">
													<label class="col-md-3 form-control-label"
														for="amtWithdrawnFromBank">Amount withdrawn from
														the bank for the purpose of the project (INR) in this
														Quarter </label>
													<div class="col-md-9">
														<input type="number" id="amtWithdrawnFromBank"
															name="amtWithdrawnFromBank"
															class="form-control requiredValFld" placeholder="Only digits are allowed">
														<span class='requiredValFldMsg'> Please Select
															Amount withdrawn </span>
													</div>
												</div>
												<p style="text-align: left">
													<font color="red">* Please refer RERA portal for the
														Certificate Format</font>
												</p>
												<div class="form-group row">
													<label class="col-md-3 form-control-label"
														for="certFromChartedAcc">Certificate issued by
														Chartered Account </label>
													<div class="col-md-9">
														<input type="file" id="certFromChartedAcc"
															name="certFromChartedAcc"
															class="form-control requiredValFld"> <span
															class='requiredValFldMsg'> Please Select
															Certificate issued by Chartered Account </span>
													</div>
												</div>
												<div class="form-group row">
													<label class="col-md-3 form-control-label"
														for="certificateIssuedByStructuralEng">Certificate
														issued by Structural Engineer </label>
													<div class="col-md-9">
														<input type="file" id="certificateIssuedByStructuralEng"
															name="certificateIssuedByStructuralEng"
															class="form-control requiredValFld"> <span
															class='requiredValFldMsg'> Please Select
															Certificate issued by Structural Engineer </span>
													</div>
												</div>
												<div class="form-group row">
													<label class="col-md-3 form-control-label"
														for="certificateIssuedByArchitect">Certificate
														issued by Architect </label>
													<div class="col-md-9">
														<input type="file" id="certificateIssuedByArchitect"
															name="certificateIssuedByArchitect"
															class="form-control requiredValFld">
													</div>
												</div>

												<div id="quarterReport">
												<div class="form-group row">
													<label class="col-md-3 form-control-label"
														for="financialReport">Quarterly Financial Report </label>
													<div class="col-md-9">
														<input type="file" id="financialReport"
															name="financialReport"
															class="form-control">
													</div>
												</div>
												</div>
												
												<div id="annualReport">
												<div  class="form-group row">
													<label class="col-md-3 form-control-label"
														for="annualfinancialReport">Annual Financial Report </label>
													<div class="col-md-9">
														<input type="file" id="annualfinancialReport"
															name="annualfinancialReport"
															class="form-control">
													</div>
												</div>
												</div>
											</c:when>
											<c:otherwise>
												<div class="form-group row">
													<label class="col-md-3 form-control-label"
														for="percentageOfProjectCompletion">Percentage of
														completion of project</label>
													<div class="col-md-9">
														<input type="number" maxlength="3"
															value="${quarter.bankDetails.percentageOfProjectCompletion}"
															name="percentageOfProjectCompletion" id="percentageOfProjectCompletion"
															class="form-control requiredValFld" placeholder="Only digits are allowed">
														<span class='requiredValFldMsg'> Please Select
															Percentage of completion of project</span>
													</div>
												</div>
												<div class="form-group row">
													<label class="col-md-3 form-control-label"
														for="totAdvanceAmt">Total advance amount collected
														from prospective purchasers (in INR) </label>
													<div class="col-md-9">
														<input type="number" id="totAdvanceAmt" name="totAdvanceAmt"
															value="${quarter.bankDetails.totAdvanceAmt}"
															class="form-control requiredValFld" placeholder="Only digits are allowed">
														<span class='requiredValFldMsg'> Please Select
															Total advance amount</span>
													</div>
												</div>
												<div class="form-group row">
													<label class="col-md-3 form-control-label"
														for="amtWithdrawnFromBank">Amount withdrawn from
														the bank for the purpose of the project (INR) </label>
													<div class="col-md-9">
														<input type="number" id="amtWithdrawnFromBank"
															name="amtWithdrawnFromBank"
															value="${quarter.bankDetails.amtWithdrawnFromBank}"
															class="form-control requiredValFld" placeholder="Only digits are allowed">
														<span class='requiredValFldMsg'> Please Select
															Amount withdrawn </span>
													</div>
												</div>

												<div class="form-group row">
													<label class="col-md-3 form-control-label"
														for="certFromChartedAcc">Certificate issued by
														Chartered Account</label>
													<div class="col-md-9">
														<input type="hidden" name="certIssuedDocId"
															value="${quarter.bankDetails.certFromChartedAcc.documentId}" />
														<input type="file" id="certFromChartedAcc"
															name="certFromChartedAcc"
															title="Only image or pdf file is allowed. file size upto 1 MB">
														<a
															href='<%=request.getContextPath() %>/download?DOC_ID=${quarter.bankDetails.certFromChartedAcc.documentId}'>
															${quarter.bankDetails.certFromChartedAcc.fileName}</a>
													</div>
												</div>


												<div class="form-group row">
													<label class="col-md-3 form-control-label"
														for="certificateIssuedByStructuralEng">Certificate
														issued by Structural Engineer </label>
													<div class="col-md-9">
														<input type="hidden" name="certIssuedStructuralEngDocId"
															value="${quarter.bankDetails.certificateIssuedByStructuralEng.documentId}" />
														<input type="file" id="certificateIssuedByStructuralEng"
															name="certificateIssuedByStructuralEng"
															title="Only image or pdf file is allowed. file size upto 1 MB">
														<a
															href='<%=request.getContextPath() %>/download?DOC_ID=${quarter.bankDetails.certificateIssuedByStructuralEng.documentId}'>
															${quarter.bankDetails.certificateIssuedByStructuralEng.fileName}</a>
													</div>
												</div>

												<div class="form-group row">
													<label class="col-md-3 form-control-label"
														for="certificateIssuedByArchitect">Certificate
														issued by Architect</label>
													<div class="col-md-9">
														<input type="hidden" name="certIssuedArcDocId"
															value="${quarter.bankDetails.certificateIssuedByArchitect.documentId}" />
														<input type="file" id="certificateIssuedByArchitect"
															name="certificateIssuedByArchitect"
															title="Only image or pdf file is allowed. file size upto 1 MB">
														<a href='<%=request.getContextPath() %>/download?DOC_ID=${quarter.bankDetails.certificateIssuedByArchitect.documentId}'>
															${quarter.bankDetails.certificateIssuedByArchitect.fileName}</a>
													</div>
												</div>
												<c:choose>
												
												<c:when test="${quarter.bankDetails.percentageOfProjectCompletion==100}">
												<div class="form-group row">
													<label class="col-md-3 form-control-label"
														for="annualfinancialReport">Annual Financial Report</label>
													<div class="col-md-9">
														<input type="hidden" name="annualfinancialReportId"
															value="${quarter.bankDetails.annualfinancialReport.documentId}" />
														<input type="file" id="annualfinancialReport"
															name="annualfinancialReport" title="Only image or pdf file is allowed. file size upto 1 MB">
														<a href='<%=request.getContextPath() %>/download?DOC_ID=${quarter.bankDetails.annualfinancialReport.documentId}'>
															${quarter.bankDetails.annualfinancialReport.fileName}</a>
													</div>
												</div>
												</c:when>
												<c:otherwise>
												<div class="form-group row">
													<label class="col-md-3 form-control-label"
														for="financialReport">Quarterly Financial Report</label>
													<div class="col-md-9">
														<input type="hidden" name="financialReportId"
															value="${quarter.bankDetails.financialReport.documentId}" />
														<input type="file" id="financialReport"
															name="financialReport"
															title="Only image or pdf file is allowed. file size upto 1 MB">
														<a href='<%=request.getContextPath() %>/download?DOC_ID=${quarter.bankDetails.financialReport.documentId}'>
															${quarter.bankDetails.financialReport.fileName}</a>
													</div>
												</div>
												</c:otherwise>
												</c:choose>
												
											</c:otherwise>
										</c:choose>
										</div>
										<br/>
										<div class="form-group row">
											<input type="button"
												class="btn btn-sm btn-success  pull-right"
												id="bankdetailsId" value="Save" />
											<!--  <button type="submit" class="btn btn-sm btn-primary  pull-right"><i class="fa fa-dot-circle-o"></i> Submit</button> -->
											<!-- <button type="reset"
												class="btn btn-sm btn-danger  pull-right">
												<i class="fa fa-ban"></i> Reset
											</button> -->
										</div>
									</form:form>
								
					</div>
							</div>

							<br>
							<br> 
							
					<c:if test="${(not empty quarter.plotDetails)&&(not empty quarter.quarterCivilWorkList)&&(not empty quarter.quarterCivilWorkList)
							&&(not empty quarter.quarterCommonAreasPurchaserList)&&(not empty quarter.approvalsAndNOCDetails)
							&&(not empty quarter.litigationDetails)&&(not empty quarter.modificationDetails)&&(not empty quarter.associationDetails)
							&&(not empty quarter.welfareFundDetails)&&(not empty quarter.bankDetails)&&(quarter.bankDetails.percentageOfProjectCompletion !='100')}">
							<a href="<%=request.getContextPath()%>/plotquarter/plotQuarterDetails?quarterId=${quarter.quaterlyId}"
								style="padding-left: 400px;"> <input type="button"
								class="btn btn-sm btn-success" width="50px;" id="QuarterSubmit"
								value="Quarter Submit" /></a>
					</c:if>
							
					<c:if  test="${quarter.bankDetails.percentageOfProjectCompletion =='100' }">
					<center><p style="color: blue"><b>please fill final approvals and Project Summary details.</b></p></center>
					</c:if>
							
							
						</div>
					</div>
					
					
				</div>

			</div>
		</div>
	</div>

	<!-- /.conainer-fluid --> </main>


	<!--  <footer class="footer">
        <span class="text-left">
                <a href="http://www.keyfalconsolutions.com/">Branding</a> Â© 2017 Developers.
            </span>
        <span class="pull-right">
                Powered by <a href="http://www.keyfalconsolutions.com/">Keyfalcon Solutions</a>
            </span>
    </footer>
 -->

</body>

</html>