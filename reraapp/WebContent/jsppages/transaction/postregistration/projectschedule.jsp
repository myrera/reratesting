<!DOCTYPE html>

<%@page import="in.gov.rera.common.security.ReraSecurity"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@page import="in.gov.rera.common.util.ReraConstants"%>
<%@page import="in.gov.rera.common.model.UserModel"%>
<%
UserModel user=(UserModel)session.getAttribute(ReraConstants.SES_USER_ATTR);

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
	href="resources/postprojregistration/img/favicon.png">

<title>Project Schedule</title>
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
</style>

</head>

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
				<strong><%=user.getUserName()!= null?user.getUserName():""%></strong>
			</div>
			<!-- <div class="text-muted">
				<small>User &amp; user</small>
			</div> -->
		</div>
		<%@include file="/jsppages/transaction/postregistration/leftnav.jsp"%>
	</div>

	<!-- Main content -->
	<main class="main">
	
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-header">
						<div class="col-md-12">
							<i class="fa fa-align-justify"></i> Project Schedule :
							Registration Number -
							${projectRegistrationModel.projectRegistrationNo}
						</div>
					</div>
					
					<div class="card-block">
							<!-- <div class="table-responsive"> -->
					<form:form class="form-horizontal" autocomplete="off"
						action="updateProjectScheduleDetails"
						modelAttribute="projectRegistrationModel"
						enctype="multipart/form-data" id="projectScheduleForm"
						method="post">
						<%=ReraSecurity.writeToken(request) %>
						
								<form:hidden path="projectRegId" />
								<form:hidden path="projectDetailsModel.projectDetailsId" />
								<div class="panel-heading card-header collapsed"
									data-toggle="collapse" data-target="#bar">
									<i class="fa fa-fw fa-chevron-down"></i> <i
										class="fa fa-fw fa-chevron-right"></i> Sub-structure (Below general ground level)
								</div>
								<div class="panel-body">
									<!-- The inside div eliminates the 'jumping' animation. -->
									<div class="collapse" id="bar">
										<table
											class="table table-bordered table-striped table-condensed"
											id="sche-subStructure-list">
											<thead>
												<tr>
													<th rowspan="2">Sl No</th>
													<th rowspan="2">Project Work</th>
													<th rowspan="2">Is Applicable?</th>
													<th colspan="2">Estimated Date</th>
													<!--  <th colspan="2">Actual Time</th> -->

												</tr>
												<tr>


													<th>From Date</th>
													<th>To Date</th>
												</tr>
											</thead>
											<tbody>
												<% int count = -1; %>
												<c:choose>
													<c:when
														test="${not empty projectRegistrationModel.projectDetailsModel.projectScheduleModel.subStructureList}">
														<%-- <form:hidden
															path="projectDetailsModel.projectScheduleModel.projectScheduleId" /> --%>
															<input type="hidden" name="projectScheduleId"
															value="${projectRegistrationModel.projectDetailsModel.projectScheduleModel.projectScheduleId}" />
														<c:forEach
															items="${projectRegistrationModel.projectDetailsModel.projectScheduleModel.subStructureList}"
															var="obj">
															<tr>
															<% ++count; %>
																<td><%= count+1 %></td>
																<td><c:out value="${obj.typeOfWork}"></c:out><input type="hidden" name="subStructureId"
																	value="${obj.subStructureId}" /> <input type="hidden"
																	name="typeOfWork" value="${obj.typeOfWork}"
																	class="form-control requiredValFld" /> <span
																	class='requiredValFldMsg'> Please Enter Type Of
																		Work.</span></td>
																<td><c:choose>
																		<c:when test="${obj.isApplicable == 'Yes'}">
																			<div class="col-md-9">
																				<label class="radio-inline" for="isApplicable">
																					<input type="radio" id="isApplicable_<%=count%>" subcount="<%=count%>" onclick="showSubEstDate(this);"
																					name="isApplicable_<%=count %>" value="Yes"
																					class='dynaselectfld requiredValFld'
																					checked="checked">Yes<span class='requiredValFldMsg'>Please select yes/No.</span>
																				</label> <label class="radio-inline" for="isApplicable">
																					<input type="radio" class="requiredValFld" id="isApplicable_<%=count%>" subcount="<%=count%>" onclick="hideSubEstDate(this);"
																					name="isApplicable_<%=count %>" value="No">No<span class='requiredValFldMsg'>Please select yes/No.</span>
																				</label>
																			</div>
																		</c:when>
																		<c:otherwise>
																			<div class="col-md-9">
																				<label class="radio-inline" for="isApplicable">
																					<input type="radio" id="isApplicable_<%=count%>" subcount="<%=count%>" onclick="showSubEstDate(this);"
																					name="isApplicable_<%=count %>" value="Yes" class="requiredValFld">Yes<span class='requiredValFldMsg'>Please select yes/No.</span>
																				</label> <label class="radio-inline" for="isApplicable">
																					<input type="radio" class="requiredValFld" id="isApplicable_<%=count%>" subcount="<%=count%>" onclick="hideSubEstDate(this);"
																					name="isApplicable_<%=count %>" value="No"
																					checked="checked">No<span class='requiredValFldMsg'>Please select yes/No.</span>
																				</label>
																			</div>
																		</c:otherwise>
																	</c:choose></td>

																<td><fmt:formatDate type="date"
																		pattern="yyyy-MM-dd" dateStyle="short"
																		var="formateddate"
																		value="${obj.estimatedFrmDate.time}" /> <input
																	type="date" name="estimatedFrmDate"
																	value="${formateddate}" id="subestimatedFrmDate_<%=count%>"
																	class="form-control " /> <span class='requiredValFldMsg'>Please Enter Estimated From Date.</span></td>
																<td><fmt:formatDate type="date"
																		pattern="yyyy-MM-dd" dateStyle="short"
																		var="formateddate1"
																		value="${obj.estimatedToDate.time}" /> <input
																	type="date" name="estimatedToDate" id="subestimatedToDate_<%=count%>"
																	value="${formateddate1}"
																	class="form-control " /> <span class='requiredValFldMsg'>Please Enter Estimated To Date.</span></td>


																<%--  <td>
                						 <fmt:formatDate type="date"  pattern="yyyy-MM-dd" dateStyle="short" var="formateddate2" value="${obj.actualFrmDate.time}"/>
										 ${formateddate2}
										</td>  
										  <td>
                						 <fmt:formatDate type="date"  pattern="yyyy-MM-dd" dateStyle="short" var="formateddate3" value="${obj.actualToDate.time}"/>
										${formateddate3}
										</td>    --%>
															</tr>
														</c:forEach>
													</c:when>
													<c:otherwise>
														<form:hidden path="projectDetailsModel.projectDetailsId" />
														<input type="hidden" name="projectScheduleId"
															value="${projectRegistrationModel.projectDetailsModel.projectScheduleModel.projectScheduleId}" />
														
														<tr>

															<td>1</td>
															<td>Earth work and other preparation work <input type="hidden" name="typeOfWork"
																value="Earth work and other preparation work " /> <span
																class="requiredValFldMsg">Please Enter type Of Work.</span></td>
															<td><label class="radio-inline" for="inline-radio1"><input id="isApplicable_0" subcount="0" onclick="showSubEstDate(this);"
																	type="radio" name="isApplicable_0" value="Yes" class="requiredValFld">Yes
																	<span class='requiredValFldMsg'>Please select yes/No.</span> </label> <label class="radio-inline"
																for="inline-radio2"><input type="radio" id="isApplicable_0" subcount="0" onclick="hideSubEstDate(this);"
																	name="isApplicable_0" value="No" class="requiredValFld">No <span
																	class='requiredValFldMsg'>Please select yes/No.</span> </label></td>
															<td><input type="date" name="estimatedFrmDate" id="subestimatedFrmDate_0"
																class="form-control"> <span
																class='requiredValFldMsg'>Please Enter Estimated From Date.</span></td>
															<td><input type="date" name="estimatedToDate" id="subestimatedToDate_0"
																class="form-control"> <span
																class='requiredValFldMsg'>Please Enter Estimated To Date.</span></td>
														
														</tr>
														<tr>
															<td>2</td>
															<td>Fundation footing and other levelling work<input type="hidden" name="typeOfWork"
																value="Fundation footing and other levelling work" /></td>
															<td><label class="radio-inline" for="inline-radio1"><input id="isApplicable_1" subcount="1" onclick="showSubEstDate(this);"
																	type="radio" name="isApplicable_1" value="Yes" class="requiredValFld">Yes
																	<span class='requiredValFldMsg'>Please select yes/No.</span> </label> <label class="radio-inline"
																for="inline-radio2"><input type="radio" id="isApplicable_1" subcount="1" onclick="hideSubEstDate(this);"
																	name="isApplicable_1" value="No" class="requiredValFld">No <span
																	class='requiredValFldMsg'>Please select yes/No.</span> </label></td>
															<td><input type="date" name="estimatedFrmDate" id="subestimatedFrmDate_1"
																class="form-control"> <span
																class='requiredValFldMsg'>Please Enter EstimatedFrom Date.</span></td> 
															<td><input type="date" name="estimatedToDate" id="subestimatedToDate_1"
																class="form-control"> <span
																class='requiredValFldMsg'>Please Enter Estimated To Date.</span></td>
															<%--  <td> <fmt:formatDate type="date"  pattern="yyyy-MM-dd" dateStyle="short" var="formateddate2" value="${obj.actualFrmDate.time}"/>
										 ${formateddate2}</span></td>
                                        <td> 
                                        </td>   --%>
														</tr>
														<tr>
															<td>3</td>
															<td>Retaining wall (All types)<input type="hidden" name="typeOfWork"
																value="Retaining wall (All types)" /></td>
															<td><label class="radio-inline" for="inline-radio1"><input id="isApplicable_2" subcount="2" onclick="showSubEstDate(this);"
																	type="radio" name="isApplicable_2" value="Yes" class="requiredValFld">Yes
																	<span class='requiredValFldMsg'>Please select yes/No.</span> </label> <label class="radio-inline"
																for="inline-radio2"><input type="radio" id="isApplicable_2" subcount="2" onclick="hideSubEstDate(this);"
																	name="isApplicable_2" value="No" class="requiredValFld">No <span class='requiredValFldMsg'>Please select yes/No.</span> </label></td>
															<td><input type="date" name="estimatedFrmDate" id="subestimatedFrmDate_2"
																class="form-control"> <span class='requiredValFldMsg'>Please Enter Estimated From Date.</span></td>
															<td><input type="date" name="estimatedToDate" id="subestimatedToDate_2"
																class="form-control"> <span
																class='requiredValFldMsg'>Please Enter Estimated To Date.</span></td>
														</tr>
														<tr>
															<td>4</td>
															<td>Plinth Beam<input type="hidden" name="typeOfWork"
																value="Plinth Beam" /></td>
															<td><label class="radio-inline" for="inline-radio1"><input id="isApplicable_3" subcount="3" onclick="showSubEstDate(this);"
																	type="radio" name="isApplicable_3" value="Yes" class="requiredValFld">Yes
																	<span class='requiredValFldMsg'>Please select yes/No.</span> </label> <label class="radio-inline"
																for="inline-radio2"><input type="radio" id="isApplicable_3" subcount="3" onclick="hideSubEstDate(this);"
																	name="isApplicable_3" value="No" class="requiredValFld">No <span class='requiredValFldMsg'>Please select yes/No.</span> </label></td>
															<td><input type="date" name="estimatedFrmDate" id="subestimatedFrmDate_3"
																class="form-control"> <span class='requiredValFldMsg'>Please Enter Estimated From Date.</span></td>
															<td><input type="date" name="estimatedToDate" id="subestimatedToDate_3"
																class="form-control"> <span
																class='requiredValFldMsg'>Please Enter Estimated To Date.</span></td>
														</tr>
														<tr>
															<td>5</td>
															<td>Sub-structure flooring (Parking Floor, more than one floor below general ground level)<input type="hidden" name="typeOfWork"
																value="Sub-structure flooring (Parking Floor, more than one floor below general ground level)" /></td>
															<td><label class="radio-inline" for="inline-radio1"><input id="isApplicable_4" subcount="4" onclick="showSubEstDate(this);"
																	type="radio" name="isApplicable_4" value="Yes" class="requiredValFld">Yes
																	<span class='requiredValFldMsg'>Please select yes/No.</span> </label> <label class="radio-inline"
																for="inline-radio2"><input type="radio" id="isApplicable_4" subcount="4" onclick="hideSubEstDate(this);"
																	name="isApplicable_4" value="No" class="requiredValFld">No <span class='requiredValFldMsg'>Please select yes/No.</span> </label></td>
															<td><input type="date" name="estimatedFrmDate" id="subestimatedFrmDate_4"
																class="form-control"> <span class='requiredValFldMsg'>Please Enter Estimated From Date.</span></td>
															<td><input type="date" name="estimatedToDate" id="subestimatedToDate_4"
																class="form-control"> <span
																class='requiredValFldMsg'>Please Enter Estimated To Date.</span></td>
														</tr>
													</c:otherwise>
												</c:choose>
											</tbody>

										</table>

										<div class="form-group row">

											<input type="button"
												class="btn btn-sm btn-success  pull-right"
												id="projectScheduleId" value="Save" />
												<input type="button"
												class="btn btn-sm btn-Primary  pull-right"
												id="btn-add-subStructure" value="Add More" />
											<!-- <button type="button" class="btn btn-warning btn-sm pull-right btn-add-update" onclick="projectScheduleForm()"> Update </button> -->
										</div>
									</div>
								</div>
					</form:form>
				<!-- </div> -->



<!-- <div class="table-responsive"> -->
				<form:form class="form-horizontal" autocomplete="off"
					action="updateSuperStructureDetails"
					modelAttribute="projectRegistrationModel"
					enctype="multipart/form-data" id="supStructureForm" method="post">
					<%=ReraSecurity.writeToken(request) %>
					<!--  <div class="card-block"> -->
					
						<form:hidden path="projectRegId" />
						<form:hidden path="projectDetailsModel.projectDetailsId" />
						<div class="panel-heading card-header collapsed"
							data-toggle="collapse" data-target="#bar1">
							<i class="fa fa-fw fa-chevron-down"></i> <i
								class="fa fa-fw fa-chevron-right"></i> Super-structure (Above general ground level)
						</div>
						<div class="panel-body">
							<!-- The inside div eliminates the 'jumping' animation. -->
							<div class="collapse" id="bar1">
								<table
									class="table table-bordered table-striped table-condensed"
									id="sche-super-Structure-list">
									<thead>
										<tr>
											<th rowspan="2">Sl No</th>
											<th rowspan="2">Project Work</th>
											<th rowspan="2">Is Applicable?</th>
											<th colspan="2">Estimated Date</th>
											<!--  <th colspan="2">Actual Time</th> -->

										</tr>
										<tr>


											<th>From Date</th>
											<th>To Date</th>
										</tr>
									</thead>
									<tbody>
										<% int count = -1; %>
										<c:choose>
											<c:when
												test="${ not empty projectRegistrationModel.projectDetailsModel.projectScheduleModel.supStructureList}">

												<input type="hidden" name="projectScheduleId"
															value="${projectRegistrationModel.projectDetailsModel.projectScheduleModel.projectScheduleId}" />

												<c:forEach
													items="${projectRegistrationModel.projectDetailsModel.projectScheduleModel.supStructureList}"
													var="obj">
													<tr>
													<% ++count; %>
														<td><%= count+1 %></td>
														<td><c:out value="${obj.typeOfWork}"></c:out><input type="hidden" name="projWorkId"
															value="${obj.supStructureId}" /> <input type="hidden"
															name="typeOfWork" value="${obj.typeOfWork}"
															class="form-control requiredValFld" /> <span
															class='requiredValFldMsg'> Please Enter Type Of Work.</span></td>
														<td><c:choose>
																<c:when test="${obj.isApplicable == 'Yes'}">
																	<div class="col-md-9">
																		<label class="radio-inline" for="isApplicable">
																			<input type="radio" id="isApplicable_<%=count%>" supcount="<%=count%>" onclick="showSuperEstDate(this);"
																			name="isApplicable_<%=count %>" value="Yes"
																			class='dynaselectfld requiredValFld'
																			checked="checked">Yes<span class='requiredValFldMsg'>Please select yes/No.</span>
																		</label> <label class="radio-inline" for="isApplicable">
																			<input type="radio" id="isApplicable_<%=count%>" supcount="<%=count%>" onclick="hideSuperEstDate(this);"class="requiredValFld"
																			name="isApplicable_<%=count %>" value="No">No<span class='requiredValFldMsg'>Please select yes/No.</span>
																		</label>
																	</div>
																</c:when>
																<c:otherwise>
																	<div class="col-md-9">
																		<label class="radio-inline" for="isApplicable">
																			<input type="radio" id="isApplicable_<%=count%>" supcount="<%=count%>" onclick="showSuperEstDate(this);" class="requiredValFld"
																			name="isApplicable_<%=count %>" value="Yes">Yes<span class='requiredValFldMsg'>Please select yes/No.</span>
																		</label> <label class="radio-inline" for="isApplicable">
																			<input type="radio" id="isApplicable_<%=count%>" supcount="<%=count%>" onclick="hideSuperEstDate(this);" class="requiredValFld"
																			name="isApplicable_<%=count %>" value="No"
																			checked="checked">No<span class='requiredValFldMsg'>Please select yes/No.</span>
																		</label>

																	</div>
																</c:otherwise>
															</c:choose></td>



														<td><fmt:formatDate type="date" pattern="yyyy-MM-dd"
																dateStyle="short" var="formateddate"
																value="${obj.estimatedFrmDate.time}" /> <input
															type="date" name="estimatedFrmDate" id="superestimatedFrmDate_<%=count%>"
															value="${formateddate}"
															class="form-control" /> <span class='requiredValFldMsg'>Please Enter Estimated From Date.</span></td>
														<td><fmt:formatDate type="date" pattern="yyyy-MM-dd"
																dateStyle="short" var="formateddate1"
																value="${obj.estimatedToDate.time}" /> <input
															type="date" name="estimatedToDate" id="superestimatedToDate_<%=count%>"
															value="${formateddate1}"
															class="form-control" /> <span class='requiredValFldMsg'>Please Enter Estimated To Date.</span></td>


													</tr>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<form:hidden path="projectDetailsModel.projectDetailsId" />
												<input type="hidden" name="projectScheduleId"
													value="${projectRegistrationModel.projectDetailsModel.projectScheduleModel.projectScheduleId}" />
												<tr>
													<td>1</td>
													<td>RCC or MS Framed structure: Column, beam, slab, staircase etc<input type="hidden" name="typeOfWork"
														value="RCC or MS Framed structure: Column, beam, slab, staircase etc" /></td>
													<td><label class="radio-inline" for="inline-radio1"><input id="isApplicable_0" supcount="0" onclick="showSuperEstDate(this);"
															type="radio" name="isApplicable_0" id="applicable" class="requiredValFld"
															value="Yes" class="applicable">Yes <span class='requiredValFldMsg'>Please select yes/No.</span>
													</label> <label class="radio-inline" for="inline-radio2"><input id="isApplicable_0" supcount="0" onclick="hideSuperEstDate(this);"
															type="radio" name="isApplicable_0" id="applicable" class="requiredValFld"
															value="No">No <span class='requiredValFldMsg'>Please select yes/No.</span>
													</label></td>
													<td><input type="date" name="estimatedFrmDate" id="superestimatedFrmDate_0"
														id="estimatedFrmDate" class="requiredValFld"> 
                                            <span class='requiredValFldMsg'>Please Enter Estimated From Date.</span>
													</td>
													<td><input type="date" name="estimatedToDate" id="superestimatedToDate_0"
														id="estimatedToDate" class="requiredValFld"> 
                                             <span class='requiredValFldMsg'>Please Enter Estimated To Date.</span> 
													</td>
												</tr>
												<tr>
													<td>2</td>
													<td>Masonry construction: Bricks, Concrete blocks etc<input type="hidden" name="typeOfWork"
														value="Masonry construction: Bricks, Concrete blocks etc" /></td>
													<td><label class="radio-inline" for="inline-radio1"><input id="isApplicable_1" supcount="1" onclick="showSuperEstDate(this);"
															type="radio" name="isApplicable_1" id="applicable" class="requiredValFld"
															value="Yes" class="applicable">Yes <span class='requiredValFldMsg'>Please select yes/No.</span>
													</label> <label class="radio-inline" for="inline-radio2"><input id="isApplicable_1" supcount="1" onclick="hideSuperEstDate(this);"
															type="radio" name="isApplicable_1" id="applicable" class="requiredValFld"
															value="No">No <span class='requiredValFldMsg'>Please select yes/No.</span>
													</label></td>
													<td><input type="date" name="estimatedFrmDate" id="superestimatedFrmDate_1"
														id="estimatedFrmDate" class="requiredValFld"> 
                                            <span class='requiredValFldMsg'>Please Enter Estimated From Date.</span>
													</td>
													<td><input type="date" name="estimatedToDate" id="superestimatedToDate_1"
														id="estimatedToDate" class="requiredValFld"> 
                                             <span class='requiredValFldMsg'>Please Enter Estimated To Date.</span> 
													</td>
												</tr>
												<tr>
													<td>3</td>
													<td>Plastering inside and outside: Ceiling<input type="hidden" name="typeOfWork"
														value="Plastering inside and outside: Ceiling" /></td>
													<td><label class="radio-inline" for="inline-radio1"><input id="isApplicable_2" supcount="2" onclick="showSuperEstDate(this);"
															type="radio" name="isApplicable_2" id="applicable" class="requiredValFld"
															value="Yes" class="applicable">Yes <span class='requiredValFldMsg'>Please select yes/No.</span>
													</label> <label class="radio-inline" for="inline-radio2"><input id="isApplicable_2" supcount="2" onclick="hideSuperEstDate(this);"
															type="radio" name="isApplicable_2" id="applicable" class="requiredValFld"
															value="No">No <span class='requiredValFldMsg'>Please select yes/No.</span>
													</label></td>
													<td><input type="date" name="estimatedFrmDate" id="superestimatedFrmDate_2"
														id="estimatedFrmDate" class="requiredValFld"> 
                                            <span class='requiredValFldMsg'>Please Enter Estimated From Date.</span>
													</td>
													<td><input type="date" name="estimatedToDate" id="superestimatedToDate_2"
														id="estimatedToDate" class="requiredValFld"> 
                                             <span class='requiredValFldMsg'>Please Enter Estimated To Date.</span> 
													</td>
												</tr>
												<tr>
													<td>4</td>
													<td>Joinery: Doors, Windows, Ventilators<input type="hidden" name="typeOfWork"
														value="Joinery: Doors, Windows, Ventilators" /></td>
													<td><label class="radio-inline" for="inline-radio1"><input id="isApplicable_3" supcount="3" onclick="showSuperEstDate(this);"
															type="radio" name="isApplicable_3" id="applicable" class="requiredValFld"
															value="Yes" class="applicable">Yes <span class='requiredValFldMsg'>Please select yes/No.</span>
													</label> <label class="radio-inline" for="inline-radio2"><input id="isApplicable_3" supcount="3" onclick="hideSuperEstDate(this);"
															type="radio" name="isApplicable_3" id="applicable" class="requiredValFld"
															value="No">No <span class='requiredValFldMsg'>Please select yes/No.</span>
													</label></td>
													<td><input type="date" name="estimatedFrmDate" id="superestimatedFrmDate_3"
														id="estimatedFrmDate" class="requiredValFld"> 
                                            <span class='requiredValFldMsg'>Please Enter Estimated From Date.</span>
													</td>
													<td><input type="date" name="estimatedToDate" id="superestimatedToDate_3"
														id="estimatedToDate" class="requiredValFld"> 
                                             <span class='requiredValFldMsg'>Please Enter Estimated To Date.</span> 
													</td>
												</tr>
												<tr>
													<td>5</td>
													<td>Basic work of Water supply, Sanitary and Electrification<input type="hidden" name="typeOfWork"
														value="Basic work of Water supply, Sanitary and Electrification" /></td>
													<td><label class="radio-inline" for="inline-radio1"><input id="isApplicable_4" supcount="4" onclick="showSuperEstDate(this);"
															type="radio" name="isApplicable_4" id="applicable" class="requiredValFld"
															value="Yes" class="applicable">Yes <span class='requiredValFldMsg'>Please select yes/No.</span>
													</label> <label class="radio-inline" for="inline-radio2"><input id="isApplicable_4" supcount="4" onclick="hideSuperEstDate(this);"
															type="radio" name="isApplicable_4" id="applicable" class="requiredValFld"
															value="No">No <span class='requiredValFldMsg'>Please select yes/No.</span>
													</label></td>
													<td><input type="date" name="estimatedFrmDate" id="superestimatedFrmDate_4"
														id="estimatedFrmDate" class="requiredValFld"> 
                                            <span class='requiredValFldMsg'>Please Enter Estimated From Date.</span>
													</td>
													<td><input type="date" name="estimatedToDate" id="superestimatedToDate_4"
														id="estimatedToDate" class="requiredValFld"> 
                                             <span class='requiredValFldMsg'>Please Enter Estimated To Date.</span> 
													</td>
												</tr>
												<tr>
													<td>6</td>
													<td>Dadoing, Skirting, Flooring, Tiles work (All types)<input type="hidden" name="typeOfWork"
														value="Dadoing, Skirting, Flooring, Tiles work (All types)" /></td>
													<td><label class="radio-inline" for="inline-radio1"><input id="isApplicable_5" supcount="5" onclick="showSuperEstDate(this);"
															type="radio" name="isApplicable_5" id="applicable" class="requiredValFld"
															value="Yes" class="applicable">Yes <span class='requiredValFldMsg'>Please select yes/No.</span>
													</label> <label class="radio-inline" for="inline-radio2"><input id="isApplicable_5" supcount="5" onclick="hideSuperEstDate(this);"
															type="radio" name="isApplicable_5" id="applicable" class="requiredValFld"
															value="No">No <span class='requiredValFldMsg'>Please select yes/No.</span>
													</label></td>
													<td><input type="date" name="estimatedFrmDate" id="superestimatedFrmDate_5"
														id="estimatedFrmDate" class="requiredValFld"> 
                                            <span class='requiredValFldMsg'>Please Enter Estimated From Date.</span>
													</td>
													<td><input type="date" name="estimatedToDate" id="superestimatedToDate_5"
														id="estimatedToDate" class="requiredValFld"> 
                                             <span class='requiredValFldMsg'>Please Enter Estimated To Date.</span> 
													</td>
												</tr>
												<tr>
													<td>7</td>
													<td>Railing and Grill fixing <input type="hidden" name="typeOfWork"
														value="Railing and Grill fixing" /></td>
													<td><label class="radio-inline" for="inline-radio1"><input id="isApplicable_6" supcount="6" onclick="showSuperEstDate(this);"
															type="radio" name="isApplicable_6" id="applicable" class="requiredValFld"
															value="Yes" class="applicable">Yes <span class='requiredValFldMsg'>Please select yes/No.</span>
													</label> <label class="radio-inline" for="inline-radio2"><input id="isApplicable_6" supcount="6" onclick="hideSuperEstDate(this);"
															type="radio" name="isApplicable_6" id="applicable" class="requiredValFld"
															value="No">No <span class='requiredValFldMsg'>Please select yes/No.</span>
													</label></td>
													<td><input type="date" name="estimatedFrmDate" id="superestimatedFrmDate_6"
														id="estimatedFrmDate" class="requiredValFld"> 
                                            <span class='requiredValFldMsg'>Please Enter Estimated From Date.</span>
													</td>
													<td><input type="date" name="estimatedToDate" id="superestimatedToDate_6"
														id="estimatedToDate" class="requiredValFld"> 
                                             <span class='requiredValFldMsg'>Please Enter Estimated To Date.</span> 
													</td>
												</tr>
											</c:otherwise>
										</c:choose>
									</tbody>

								</table>

								<div class="form-group row">

									<input type="button" class="btn btn-sm btn-success  pull-right"
										id="supStructureId" value="Save" />
										<input type="button" class="btn btn-sm btn-Primary  pull-right"
										id="btn-add-super-Structure" value="Add More" />
									<!-- <button type="button" class="btn btn-warning btn-sm pull-right btn-add-update" onclick="projectScheduleForm()"> Update </button> -->
								</div>
							</div>
						</div>
						<!-- </div> -->
				</form:form>
				<!-- </div> -->






<!-- <div class="table-responsive"> -->
				<%-- <form:form class="form-horizontal" autocomplete="off"
					action="updateMasonaryDetails"
					modelAttribute="projectRegistrationModel"
					enctype="multipart/form-data" id="masonryForm" method="post">
					<%=ReraSecurity.writeToken(request) %>
					<!-- <div class="card-block"> -->
					
						<form:hidden path="projectRegId" />
						<form:hidden path="projectDetailsModel.projectDetailsId" />
						<div class="panel-heading card-header collapsed"
							data-toggle="collapse" data-target="#bar4">
							<i class="fa fa-fw fa-chevron-down"></i> <i
								class="fa fa-fw fa-chevron-right"></i> Masonry Works
						</div>
						<div class="panel-body">
							<!-- The inside div eliminates the 'jumping' animation. -->
							<div class="collapse" id="bar4">
								<table
									class="table table-bordered table-striped table-condensed"
									id="sche-masonry-Works-list">
									<thead>
										<tr>
											<th rowspan="2">Sl No</th>
											<th rowspan="2">Project Work</th>
											<th rowspan="2">Is Applicable?</th>
											<th colspan="2">Estimated Date</th>
											<!--  <th colspan="2">Actual Time</th> -->

										</tr>
										<tr>


											<th>From Date</th>
											<th>To Date</th>
										</tr>
									</thead>
									<tbody>
										<% int count = -1; %>
										<c:choose>
											<c:when
												test="${ not empty projectRegistrationModel.projectDetailsModel.projectScheduleModel.masonryList}">
												<input type="hidden" name="projectScheduleId"
															value="${projectRegistrationModel.projectDetailsModel.projectScheduleModel.projectScheduleId}" />

												<c:forEach
													items="${projectRegistrationModel.projectDetailsModel.projectScheduleModel.masonryList}"
													var="obj">
													<tr>
													<% ++count; %>
														<td><%= count+1 %></td>
														<td><input type="hidden" name="projWorkId"
															value="${obj.masnoryId}" /> <input type="text"
															name="typeOfWork" value="${obj.typeOfWork}"
															class="form-control requiredValFld" /> <span
															class='requiredValFldMsg'> Please Enter Type Of
																Work.</span></td>
														<td><c:choose>
																<c:when test="${obj.isApplicable == 'Yes'}">
																	<div class="col-md-9">
																		<label class="radio-inline" for="isApplicable">
																			<input type="radio" id="isApplicable_<%=count%>" mansorycount="<%=count%>" onclick="showMansoryEstDate(this);"
																			name="isApplicable_<%=count %>" value="Yes"
																			class='dynaselectfld requiredValFld'
																			checked="checked">Yes<span	class='requiredValFldMsg'>Please select yes/No.</span>
																		</label> <label class="radio-inline" for="isApplicable">
																			<input type="radio" id="isApplicable_<%=count%>" mansorycount="<%=count%>" onclick="hideMansoryEstDate(this);" class="requiredValFld"
																			name="isApplicable_<%=count %>" value="No">No<span	class='requiredValFldMsg'>Please select yes/No.</span>
																		</label>
																	</div>
																</c:when>
																<c:otherwise>
																	<div class="col-md-9">
																		<label class="radio-inline" for="isApplicable">
																			<input type="radio" id="isApplicable_<%=count%>" mansorycount="<%=count%>" onclick="showMansoryEstDate(this);" class="requiredValFld"
																			name="isApplicable_<%=count %>" value="Yes">Yes<span	class='requiredValFldMsg'>Please select yes/No.</span>
																		</label> <label class="radio-inline" for="isApplicable">
																			<input type="radio" id="isApplicable_<%=count%>" mansorycount="<%=count%>" onclick="hideMansoryEstDate(this);" class="requiredValFld"
																			name="isApplicable_<%=count %>" value="No"
																			checked="checked">No<span	class='requiredValFldMsg'>Please select yes/No.</span>
																		</label>

																	</div>
																</c:otherwise>
															</c:choose></td>



														<td><fmt:formatDate type="date" pattern="yyyy-MM-dd"
																dateStyle="short" var="formateddate"
																value="${obj.estimatedFrmDate.time}" /> <input
															type="date" name="estimatedFrmDate" id="mansoryestimatedFrmDate_<%=count%>"
															value="${formateddate}"
															class="form-control" /> <span
															class='requiredValFldMsg'>Please Enter Estimated From Date.</span></td>
														<td><fmt:formatDate type="date" pattern="yyyy-MM-dd"
																dateStyle="short" var="formateddate1"
																value="${obj.estimatedToDate.time}" /> <input
															type="date" name="estimatedToDate" id="mansoryestimatedToDate_<%=count%>"
															value="${formateddate1}"
															class="form-control" /> <span
															class='requiredValFldMsg'>Please Enter Estimated To Date.</span></td>


													</tr>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<form:hidden path="projectDetailsModel.projectDetailsId" />
												<input type="hidden" name="projectScheduleId"
													value="${projectRegistrationModel.projectDetailsModel.projectScheduleModel.projectScheduleId}" />

												<tr>
													<td>1</td>
													<td><input type="text" name="typeOfWork"
														value="Masonry work" /></td>
													<td><label class="radio-inline" for="inline-radio1"><input id="isApplicable_0" mansorycount="0" onclick="showMansoryEstDate(this);"
															type="radio" name="isApplicable_0" value="Yes" class="requiredValFld">Yes
															<span class='requiredValFldMsg'>Please select yes/No.</span>
													</label> <label class="radio-inline" for="inline-radio2"><input id="isApplicable_0" mansorycount="0" onclick="hideMansoryEstDate(this);"
															type="radio" name="isApplicable_0" value="No" class="requiredValFld">No
															<span	class='requiredValFldMsg'>Please select yes/No.</span>
													</label></td>
													<td><input type="date" name="estimatedFrmDate" id="mansoryestimatedFrmDate_0"
														class="form-control"> <span
														class='requiredValFldMsg'>Please Enter Estimated From Date.</span></td>
													<td><input type="date" name="estimatedToDate" id="mansoryestimatedToDate_0"
														class="form-control"> <span
														class='requiredValFldMsg'>Please Enter Estimated To Date.</span></td>
												</tr>

											</c:otherwise>
										</c:choose>
									</tbody>

								</table>

								<div class="form-group row">

									<input type="button" class="btn btn-sm btn-success  pull-right"
										id="masonryId" value="Save" />
										<input type="button" class="btn btn-sm btn-Primary  pull-right"
										id="btn-add-masonry-Works" value="Add More" />
									<!-- <button type="button" class="btn btn-warning btn-sm pull-right btn-add-update" onclick="projectScheduleForm()"> Update </button> -->
								</div>
							</div>
						</div>
						<!--  </div> -->
				</form:form> --%>

				<!-- <div class="table-responsive"> -->
				<form:form class="form-horizontal" autocomplete="off"
					action="updateFinInteriorDetails"
					modelAttribute="projectRegistrationModel"
					enctype="multipart/form-data" id="finishingForm" method="post">
					<%=ReraSecurity.writeToken(request) %>
					<!-- <div class="card-block"> -->
					
						<form:hidden path="projectRegId" />
						<form:hidden path="projectDetailsModel.projectDetailsId" />
						<div class="panel-heading card-header collapsed"
							data-toggle="collapse" data-target="#bar3">
							<i class="fa fa-fw fa-chevron-down"></i> <i
								class="fa fa-fw fa-chevron-right"></i> Finishing/Interior Works
						</div>
						<div class="panel-body">
							<!-- The inside div eliminates the 'jumping' animation. -->
							<div class="collapse" id="bar3">
								<table
									class="table table-bordered table-striped table-condensed"
									id="sche-interior-work-list">
									<thead>
										<tr>
											<th rowspan="2">Sl No</th>
											<th rowspan="2">Project Work</th>
											<th rowspan="2">Is Applicable?</th>
											<th colspan="2">Estimated Date</th>
											<!--  <th colspan="2">Actual Time</th> -->

										</tr>
										<tr>


											<th>From Date</th>
											<th>To Date</th>
										</tr>
									</thead>
									<tbody>
										<% int count = -1; %>
										<c:choose>
											<c:when
												test="${ not empty projectRegistrationModel.projectDetailsModel.projectScheduleModel.finishingOrInteriorWorkList}">
												<input type="hidden" name="projectScheduleId"
															value="${projectRegistrationModel.projectDetailsModel.projectScheduleModel.projectScheduleId}" />

												<c:forEach
													items="${projectRegistrationModel.projectDetailsModel.projectScheduleModel.finishingOrInteriorWorkList}"
													var="obj">
													<tr>
													<% ++count; %>
														<td><%= count+1 %></td>
														<td><c:out value="${obj.typeOfWork}"></c:out><input type="hidden" name="projWorkId"
															value="${obj.finishingInteriorId}" /> <input type="hidden"
															name="typeOfWork" value="${obj.typeOfWork}"
															class="form-control" /> <!-- <span class='requiredValFldMsg'> Please Enter Type Of Work.</span> -->
														</td>
														<td><c:choose>
																<c:when test="${obj.isApplicable == 'Yes'}">
																	<div class="col-md-9">
																		<label class="radio-inline" for="isApplicable">
																			<input type="radio" id="isApplicable_<%=count%>" schcount="<%=count%>" onclick="showEstDate(this);"
																			name="isApplicable_<%=count %>" value="Yes"
																			class='dynaselectfld requiredValFld'
																			checked="checked">Yes<span	class='requiredValFldMsg'>Please select yes/No.</span>
																		</label> <label class="radio-inline" for="isApplicable">
																			<input type="radio" id="isApplicable_<%=count%>" schcount="<%=count%>" onclick="hideEstDate(this);" class="requiredValFld"
																			name="isApplicable_<%=count %>" value="No">No<span	class='requiredValFldMsg'>Please select yes/No.</span>
																		</label>
																	</div>
																</c:when>
																<c:otherwise>
																	<div class="col-md-9">
																		<label class="radio-inline" for="isApplicable">
																			<input type="radio" id="isApplicable_<%=count%>" schcount="<%=count%>" onclick="showEstDate(this);" class="requiredValFld"
																			name="isApplicable_<%=count %>" value="Yes">Yes<span	class='requiredValFldMsg'>Please select yes/No.</span>
																		</label> <label class="radio-inline" for="isApplicable">
																			<input type="radio" id="isApplicable_<%=count%>" schcount="<%=count%>" onclick="hideEstDate(this);" class="requiredValFld"
																			name="isApplicable_<%=count %>" value="No"
																			checked="checked">No<span	class='requiredValFldMsg'>Please select yes/No.</span>
																		</label>

																	</div>
																</c:otherwise>
															</c:choose></td>



														<td><fmt:formatDate type="date" pattern="yyyy-MM-dd"
																dateStyle="short" var="formateddate"
																value="${obj.estimatedFrmDate.time}" /> <input
															type="date" name="estimatedFrmDate" id="estimatedFrmDate_<%=count%>"
															value="${formateddate}"
															class="form-control" /> <span class='requiredValFldMsg'>Please Enter Estimated From Date.</span></td>
														<td><fmt:formatDate type="date" pattern="yyyy-MM-dd"
																dateStyle="short" var="formateddate1"
																value="${obj.estimatedToDate.time}" /> <input
															type="date" name="estimatedToDate" id="estimatedToDate_<%=count%>"
															value="${formateddate1}"
															class="form-control" /> <span class='requiredValFldMsg'>Please Enter Estimated To Date.</span></td>


													</tr>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<form:hidden path="projectDetailsModel.projectDetailsId" />
												<input type="hidden" name="projectScheduleId"
													value="${projectRegistrationModel.projectDetailsModel.projectScheduleModel.projectScheduleId}" />

												<tr>
													<td>1</td>
													<td>Fitting and Fixtures<input type="hidden" name="typeOfWork"
														value="Fitting and Fixtures" /></td>
													<td><label class="radio-inline" for="inline-radio1"><input id="isApplicable_0" schcount="0" onclick="showEstDate(this);"
															type="radio" name="isApplicable_0" value="Yes" class="requiredValFld">Yes
															<span class='requiredValFldMsg'>Please select yes/No.</span>
													</label> <label class="radio-inline" for="inline-radio2"><input id="isApplicable_0" schcount="0" onclick="hideEstDate(this);"
															type="radio" name="isApplicable_0" value="No" class="requiredValFld">No <span	class='requiredValFldMsg'>Please select yes/No.</span>
													</label></td>
													<td><input type="date" name="estimatedFrmDate" id="estimatedFrmDate_0"
														class="form-control"> <span class='requiredValFldMsg'>Please Enter Estimated From Date.</span></td>
													<td><input type="date" name="estimatedToDate" id="estimatedToDate_0"
														class="form-control"> <span class='requiredValFldMsg'>Please Enter Estimated To Date.</span></td>
												</tr>
												<tr>
													<td>2</td>
													<td>Electrification, Water supply and Sanitary Finishing<input type="hidden" name="typeOfWork"
														value="Electrification, Water supply and Sanitary Finishing" /></td>
													<td><label class="radio-inline" for="inline-radio1"><input id="isApplicable_1" schcount="1" onclick="showEstDate(this);"
															type="radio" name="isApplicable_1" value="Yes" class="requiredValFld">Yes
															<span class='requiredValFldMsg'>Please select yes/No.</span>
													</label> <label class="radio-inline" for="inline-radio2"><input id="isApplicable_1" schcount="1" onclick="hideEstDate(this);"
															type="radio" name="isApplicable_1" value="No" class="requiredValFld">No <span class='requiredValFldMsg'>Please select yes/No.</span>
													</label></td>
													<td><input type="date" name="estimatedFrmDate" id="estimatedFrmDate_1"
														class="form-control"> <span class='requiredValFldMsg'> Please Enter Estimated From Date.</span></td>
													<td><input type="date" name="estimatedToDate" id="estimatedToDate_1"
														class="form-control"> <span class='requiredValFldMsg'>Please Enter Estimated To Date.</span></td>
												</tr>

												<tr>
													<td>3</td>
													<td>Wardrobe, Showcase, Kitchen cabinet, Puja work<input type="hidden" name="typeOfWork"
														value="Wardrobe, Showcase, Kitchen cabinet, Puja work" /></td>
													<td><label class="radio-inline" for="inline-radio1"><input id="isApplicable_2" schcount="2" onclick="showEstDate(this);"
															type="radio" name="isApplicable_2" value="Yes" class="requiredValFld">Yes
															<span class='requiredValFldMsg'> Please select yes/No </span>
													</label> <label class="radio-inline" for="inline-radio2"><input id="isApplicable_2" schcount="2" onclick="hideEstDate(this);"
															type="radio" name="isApplicable_2" value="No" class="requiredValFld">No <span	class='requiredValFldMsg'> Please select yes/No </span>
													</label></td>
													<td><input type="date" name="estimatedFrmDate" id="estimatedFrmDate_2"
														class="form-control"> <span class='requiredValFldMsg'>Please Enter Estimated From Date.</span></td>
													<td><input type="date" name="estimatedToDate" id="estimatedToDate_2"
														class="form-control"> <span class='requiredValFldMsg'>Please Enter Estimated To Date.</span></td>
												</tr>
												<tr>
													<td>4</td>
													<td>Fire prevention and fire fighting fitting and fixture with network<input type="hidden" name="typeOfWork"
														value="Fire prevention and fire fighting fitting and fixture with network" /></td>
													<td><label class="radio-inline" for="inline-radio1"><input id="isApplicable_3" schcount="3" onclick="showEstDate(this);"
															type="radio" name="isApplicable_3" value="Yes" class="requiredValFld">Yes
															<span class='requiredValFldMsg'>Please select yes/No.</span>
													</label> <label class="radio-inline" for="inline-radio2"><input id="isApplicable_3" schcount="3" onclick="hideEstDate(this);"
															type="radio" name="isApplicable_3" value="No" class="requiredValFld">No
															<span	class='requiredValFldMsg'>Please select yes/No.</span>
													</label></td>
													<td><input type="date" name="estimatedFrmDate" id="estimatedFrmDate_3"
														class="form-control"> <span class='requiredValFldMsg'>Please Enter Estimated From Date.</span></td>
													<td><input type="date" name="estimatedToDate" id="estimatedToDate_3"
														class="form-control"> <span class='requiredValFldMsg'>Please Enter Estimated To Date.</span></td>
												</tr>
												<tr>
													<td>5</td>
													<td>Weather Proof work<input type="hidden" name="typeOfWork"
														value="Weather Proof work" /></td>
													<td><label class="radio-inline" for="inline-radio1"><input id="isApplicable_4" schcount="4" onclick="showEstDate(this);"
															type="radio" name="isApplicable_4" value="Yes" class="requiredValFld">Yes
															<span class='requiredValFldMsg'>Please select yes/No.</span>
													</label> <label class="radio-inline" for="inline-radio2"><input id="isApplicable_4" schcount="4" onclick="hideEstDate(this);"
															type="radio" name="isApplicable_4" value="No" class="requiredValFld">No
															<span class='requiredValFldMsg'>Please select yes/No.</span>
													</label></td>
													<td><input type="date" name="estimatedFrmDate" id="estimatedFrmDate_4"
														class="form-control"> <span class='requiredValFldMsg'>Please Enter Estimated From Date.</span></td>
													<td><input type="date" name="estimatedToDate" id="estimatedToDate_4"
														class="form-control"> <span class='requiredValFldMsg'>Please Enter Estimated To Date.</span></td>
												</tr>
												<tr>
													<td>6</td>
													<td>Painting<input type="hidden" name="typeOfWork"
														value="Painting" /></td>
													<td><label class="radio-inline" for="inline-radio1"><input id="isApplicable_5" schcount="5" onclick="showEstDate(this);"
															type="radio" name="isApplicable_5" value="Yes" class="requiredValFld">Yes
															<span class='requiredValFldMsg'>Please select yes/No.</span>
													</label> <label class="radio-inline" for="inline-radio2"><input id="isApplicable_5" schcount="5" onclick="hideEstDate(this);"
															type="radio" name="isApplicable_5" value="No" class="requiredValFld">No
															<span	class='requiredValFldMsg'>Please select yes/No.</span>
													</label></td>
													<td><input type="date" name="estimatedFrmDate" id="estimatedFrmDate_5"
														class="form-control requiredValFld"> <span class='requiredValFldMsg'>Please Enter Estimated From Date.</span></td>
													<td><input type="date" name="estimatedToDate" id="estimatedToDate_5"
														class="form-control requiredValFld"> <span class='requiredValFldMsg'>Please Enter Estimated To Date.</span></td>
												</tr>
												<tr>
													<td>7</td>
													<td>Elevation work<input type="hidden" name="typeOfWork"
														value="Elevation work" /></td>
													<td><label class="radio-inline" for="inline-radio1"><input id="isApplicable_6" schcount="6" onclick="showEstDate(this);"
															type="radio" name="isApplicable_6" value="Yes" class="requiredValFld">Yes
															<span class='requiredValFldMsg'>Please select yes/No.</span>
													</label> <label class="radio-inline" for="inline-radio2"><input id="isApplicable_6" schcount="6" onclick="hideEstDate(this);"
															type="radio" name="isApplicable_6" value="No" class="requiredValFld">No
															<span	class='requiredValFldMsg'>Please select yes/No.</span>
													</label></td>
													<td><input type="date" name="estimatedFrmDate" id="estimatedFrmDate_6"
														class="form-control"> <span class='requiredValFldMsg'>Please Enter Estimated From Date.</span></td>
													<td><input type="date" name="estimatedToDate" id="estimatedToDate_6"
														class="form-control"> <span class='requiredValFldMsg'> Please Enter Estimated To Date.</span></td>
												</tr>
												<tr>
													<td>8</td>
													<td>Internal and External work including landscapes as per santioned drawings<input type="hidden" name="typeOfWork"
														value="Internal and External work including landscapes as per santioned drawings" /></td>
													<td><label class="radio-inline" for="inline-radio1"><input id="isApplicable_7" schcount="7" onclick="showEstDate(this);"
															type="radio" name="isApplicable_7" value="Yes" class="requiredValFld">Yes
															<span class='requiredValFldMsg'>Please select yes/No.</span>
													</label> <label class="radio-inline" for="inline-radio2"><input id="isApplicable_7" schcount="7" onclick="hideEstDate(this);"
															type="radio" name="isApplicable_7" value="No" class="requiredValFld">No
															<span	class='requiredValFldMsg'>Please select yes/No.</span>
													</label></td>
													<td><input type="date" name="estimatedFrmDate" id="estimatedFrmDate_7"
														class="form-control"> <span class='requiredValFldMsg'>Please Enter Estimated From Date.</span></td>
													<td><input type="date" name="estimatedToDate" id="estimatedToDate_7"
														class="form-control"> <span class='requiredValFldMsg'> Please Enter Estimated To Date.</span></td>
												</tr>
											</c:otherwise>
										</c:choose>
									</tbody>

								</table>

								<div class="form-group row">

									<input type="button" class="btn btn-sm btn-success  pull-right"
										id="finishingId" value="Save" />
										<input type="button" class="btn btn-sm btn-Primary  pull-right"
										id="btn-add-interior-work" value="Add More" />
									<!-- <button type="button" class="btn btn-warning btn-sm pull-right btn-add-update" onclick="projectScheduleForm()"> Update </button> -->
								</div>
							</div>
						</div>
				</form:form>

<div class="panel-group" id="accordion">
					<div class="panel panel-primary">
						<div class="panel-heading card-header collapsed"
							data-toggle="collapse" data-target="#bar-in">
							<i class="fa fa-fw fa-chevron-down"></i> <i
								class="fa fa-fw fa-chevron-right"></i> Internal Infrastructure

						</div>
						<div class="panel-body">
							<!-- The inside div eliminates the 'jumping' animation. -->
							<div class="collapse" id="bar-in">
								<form:form action="updateInternalInfrastructureDetails"
									method="post" enctype="multipart/form-data"
									class="form-horizontal" id="infrastructureForm"
									modelAttribute="projectRegistrationModel">
									<table id="sche-Internal-Infra-list"
										class="table table-bordered table-striped table-condensed">
										<thead>
											<tr>
												<th colspan="4">Internal Infrastructure Details</th>
											</tr>
											<tr>
												<th>SlNo.</th>
												<th>Name</th>
												<th>Is Applicable</th>
												<!--  <th>Photograph </th> -->
											</tr>
										</thead>
										<tbody>
											<% int internalCount = -1; %>
											<c:choose>

												<c:when
													test="${empty projectRegistrationModel.projectDetailsModel.projectScheduleModel.internalInfraList}">
														
													<tr>
														<td>1</td>
														<td>Internal Roads & Footpaths<input type="hidden" name="infrastructureName"
															value="Internal Roads & Footpaths" class="requiredValFld">
															<span class='requiredValFldMsg'> Please Enter
																Infrastructure Name </span></td>
														<td><label class="radio-inline" for="inline-radio1"><input
																type="radio" name="isApplicable_0" value="Yes" class="">Yes
																<!-- <span
																			class='requiredValFldMsg'> Please select
																				yes/No</span> --> </label> <label class="radio-inline"
															for="inline-radio2"> <input type="radio"
																name="isApplicable_0" value="No" class="">No<!--  <span
																			class='requiredValFldMsg'> Please select
																				yes/No </span> --></label></td>
													</tr>

													<tr>
														<td>2</td>
														<td>Water Supply<input type="hidden" name="infrastructureName"
															value="Water Supply" class="requiredValFld"></td>
														<td><label class="radio-inline" for="inline-radio1"><input
																type="radio" name="isApplicable_1" value="Yes" class="">Yes
																<!-- <span
																			class='requiredValFldMsg'> Please select
																				yes/No</span>  --></label> <label class="radio-inline"
															for="inline-radio2"> <input type="radio"
																name="isApplicable_1" value="No" class="">No <!-- <span
																			class='requiredValFldMsg'> Please select
																				yes/No </span> --></label></td>
													</tr>


													<tr>
														<td>3</td>
														<td>Sewage and Drainage System<input type="hidden" name="infrastructureName"
															value="Sewage and Drainage System"
															class="requiredValFld"></td>
														<td><label class="radio-inline" for="inline-radio1"><input
																type="radio" name="isApplicable_2" value="Yes" class="">Yes
																<span class='requiredValFldMsg'> Please select
																	yes/No</span> </label> <label class="radio-inline" for="inline-radio2">
																<input type="radio" name="isApplicable_2" value="No"
																class="">No <span class='requiredValFldMsg'>
																	Please select yes/No </span>
														</label></td>
													</tr>

													<tr>
														<td>4</td>
														<td>Parks & Tree planting<input type="hidden" name="infrastructureName"
															value="Parks & Tree planting" class="requiredValFld"></td>
														<td><label class="radio-inline" for="inline-radio1"><input
																type="radio" name="isApplicable_3" value="Yes" class="">Yes
																<span class='requiredValFldMsg'> Please select
																	yes/No</span> </label> <label class="radio-inline" for="inline-radio2">
																<input type="radio" name="isApplicable_3" value="No"
																class="">No <span class='requiredValFldMsg'>
																	Please select yes/No </span>
														</label></td>
													</tr>

													<tr>
														<td>5</td>
														<td>Street Lighting<input type="hidden" name="infrastructureName"
															value="Street Lighting" class="requiredValFld"></td>
														<td><label class="radio-inline" for="inline-radio1"><input
																type="radio" name="isApplicable_4" value="Yes" class="">Yes
																<span class='requiredValFldMsg'> Please select
																	yes/No</span> </label> <label class="radio-inline" for="inline-radio2">
																<input type="radio" name="isApplicable_4" value="No"
																class="">No <span class='requiredValFldMsg'>
																	Please select yes/No </span>
														</label></td>
													</tr>
													<tr>
														<td>6</td>
														<td>Provision for community buildings and for treatment and disposal of sewage and sullage water<input type="hidden" name="infrastructureName"
															value="Provision for community buildings and for treatment and disposal of sewage and sullage water"
															class="requiredValFld"></td>
														<td><label class="radio-inline" for="inline-radio1"><input
																type="radio" name="isApplicable_5" value="Yes" class="">Yes
																<span class='requiredValFldMsg'> Please select
																	yes/No</span> </label> <label class="radio-inline" for="inline-radio2">
																<input type="radio" name="isApplicable_5" value="No"
																class="">No <span class='requiredValFldMsg'>
																	Please select yes/No </span>
														</label></td>
													</tr>
													<tr>
														<td>7</td>
														<td>Solid waste management and disposal<input type="hidden" name="infrastructureName"
															value="Solid waste management and disposal"
															class="requiredValFld"></td>
														<td><label class="radio-inline" for="inline-radio1"><input
																type="radio" name="isApplicable_6" value="Yes" class="">Yes
																<span class='requiredValFldMsg'> Please select
																	yes/No</span> </label> <label class="radio-inline" for="inline-radio2">
																<input type="radio" name="isApplicable_6" value="No"
																class="">No <span class='requiredValFldMsg'>
																	Please select yes/No </span>
														</label></td>
													</tr>
													<tr>
														<td>8</td>
														<td>Water conservation<input type="hidden" name="infrastructureName"
															value="Water conservation" class="requiredValFld"></td>
														<td><label class="radio-inline" for="inline-radio1"><input
																type="radio" name="isApplicable_0" value="Yes" class="">Yes
																<span class='requiredValFldMsg'> Please select
																	yes/No</span> </label> <label class="radio-inline" for="inline-radio2">
																<input type="radio" name="isApplicable_0" value="No"
																class="">No <span class='requiredValFldMsg'>
																	Please select yes/No </span>
														</label></td>
													</tr>
													<tr>
														<td>9</td>
														<td>Energy management<input type="hidden" name="infrastructureName"
															value="Energy management" class="requiredValFld"></td>
														<td><label class="radio-inline" for="inline-radio1"><input
																type="radio" name="isApplicable_7" value="Yes" class="">Yes
																<span class='requiredValFldMsg'> Please select
																	yes/No</span> </label> <label class="radio-inline" for="inline-radio2">
																<input type="radio" name="isApplicable_7" value="No"
																class="">No <span class='requiredValFldMsg'>
																	Please select yes/No </span>
														</label></td>
													</tr>
													<tr>
														<td>10</td>
														<td>Fire protection and fire safety requirements<input type="hidden" name="infrastructureName"
															value="Fire protection and fire safety requirements"
															class="requiredValFld"></td>
														<td><label class="radio-inline" for="inline-radio1"><input
																type="radio" name="isApplicable_8" value="Yes" class="">Yes
																<span class='requiredValFldMsg'> Please select
																	yes/No</span> </label> <label class="radio-inline" for="inline-radio2">
																<input type="radio" name="isApplicable_8" value="No"
																class="">No <span class='requiredValFldMsg'>
																	Please select yes/No </span>
														</label></td>
													</tr>
													<tr>
														<td>11</td>
														<td>Education/Health/Other public amenities<input type="hidden" name="infrastructureName"
															value="Education/Health/Other public amenities"
															class="requiredValFld"></td>
														<td><label class="radio-inline" for="inline-radio1"><input
																type="radio" name="isApplicable_9" value="Yes" class="">Yes
																<span class='requiredValFldMsg'> Please select
																	yes/No</span> </label> <label class="radio-inline" for="inline-radio2">
																<input type="radio" name="isApplicable_9" value="No"
																class="">No <span class='requiredValFldMsg'>
																	Please select yes/No </span>
														</label></td>
													</tr>

												</c:when>
												<c:otherwise>
												<input type="hidden" name="projectScheduleId"
															value="${projectRegistrationModel.projectDetailsModel.projectScheduleModel.projectScheduleId}" />
													<c:forEach
														items="${projectRegistrationModel.projectDetailsModel.projectScheduleModel.internalInfraList}"
														var="obj">

														<tr>
														<% ++internalCount; %>
															<td><%= internalCount+1 %></td>
															<td><c:out value="${obj.infrastructureName}"></c:out><input type="hidden" name="infrastructureId"
																value="${obj.infrastructureId}" /> <input type="hidden"
																name="infrastructureName"
																value="${obj.infrastructureName}" class="requiredValFld">
																<span class='requiredValFldMsg'> Please Enter
																	Infrastructure Name </span></td>
															<td><c:choose>
																	<c:when test="${obj.isApplicable == 'Yes'}">
																		<div class="col-md-9">
																			<label class="radio-inline" for="isApplicable">
																				<input type="radio" id="isApplicable"
																				name="isApplicable_<%=internalCount %>" value="Yes"
																				class='dynaselectfld requiredValFld'
																				checked="checked">Yes
																			</label> <label class="radio-inline" for="isApplicable">
																				<input type="radio" id="isApplicable"
																				name="isApplicable_<%=internalCount %>" value="No">No
																			</label>
																		</div>
																	</c:when>
																	<c:otherwise>
																		<div class="col-md-9">
																			<label class="radio-inline" for="isApplicable">
																				<input type="radio" id="inline-radio1"
																				name="isApplicable_<%=internalCount %>" value="Yes">Yes
																			</label> <label class="radio-inline" for="isApplicable">
																				<input type="radio" id="inline-radio2"
																				name="isApplicable_<%=internalCount %>" value="No"
																				checked="checked">No
																			</label>

																		</div>
																	</c:otherwise>
																</c:choose></td>
														</tr>
													</c:forEach>
												</c:otherwise>
											</c:choose>
										</tbody>
									</table>
									<div class="form-group row">
										<input type="button"
											class="btn btn-sm btn-success  pull-right"
											id="infrastructureId" value="Save" />
											<input type="button"
											class="btn btn-sm btn-primary  pull-right"
											id="btn-add-Internal-Infra" value="Add More" />
										<!-- <button type="reset" class="btn btn-sm btn-danger  pull-right">
											<i class="fa fa-ban"></i> Reset
										</button> -->
									</div>
								</form:form>
							</div>
						</div>
					</div>
				</div>

       
			





				<div class="panel-group" id="accordion">
					<div class="panel panel-primary">
						<div class="panel-heading card-header collapsed"
							data-toggle="collapse" data-target="#bar6">
							<i class="fa fa-fw fa-chevron-down"></i> <i
								class="fa fa-fw fa-chevron-right"></i> External Infrastructure

						</div>
						<div class="panel-body">
							<!-- The inside div eliminates the 'jumping' animation. -->
							<div class="collapse" id="bar6">
								<form:form action="updateExternalInfrastructureDetails"
									method="post" enctype="multipart/form-data"
									class="form-horizontal" id="ExternalInfraForm"
									modelAttribute="projectRegistrationModel">
									<table id="sche-External-Infrastructure-list"
										class="table table-bordered table-striped table-condensed">
										<thead>
											<tr>
												<th colspan="4">External Infrastructure Details</th>
											</tr>
											<tr>
												<th>Sl No.</th>
												<th>Name</th>
												<th>Is Applicable?</th>
												<!-- <th>Percentage of Completion</th>
															<th>Photograph</th> -->
											</tr>
										</thead>
										<tbody>
											<% int externalCount = -1; %>
											<c:choose>
												<c:when
													test="${ empty projectRegistrationModel.projectDetailsModel.projectScheduleModel.externalInfrastructureList}">

													<tr>
														<td>1</td>
														<td>Internal Roads & Footpaths<input type="hidden"
															name="externalInfrastructureName"
															value="Internal Roads & Footpaths" class="requiredValFld">
															<span class='requiredValFldMsg'> Please Enter
																Infrastructure Name </span></td>
														<td><input type="radio" name="isApplicable_0"
															value="Yes" class="">Yes <!-- <span
																			class='requiredValFldMsg'> Please select
																				yes/No</span> --> <input type="radio"
															name="isApplicable_0" value="No" class="">No <!-- <span
																			class='requiredValFldMsg'> Please select
																				yes/No </span> --></td>
													</tr>

													<tr>
														<td>2</td>
														<td>externalInfrastructureName<input type="hidden"
															name="externalInfrastructureName" value="Water Supply "
															class="requiredValFld"></td>
														<td><input type="radio" name="isApplicable_1"
															value="Yes" class="">Yes <!-- <span
																			class=''> Please select yes/No</span> --> <input
															type="radio" name="isApplicable_1" value="No" class="">No
															<!-- <span
																			class=''> Please select yes/No </span> --></td>
													</tr>

													<tr>
														<td>3</td>
														<td>Sewage and Drainage System<input type="hidden"
															name="externalInfrastructureName"
															value="Sewage and Drainage System" class="requiredValFld">
															<span class='requiredValFldMsg'> Please Enter
																Infrastructure Name </span></td>
														<td><input type="radio" name="isApplicable_2"
															value="Yes" class="">Yes <!-- <span
																			class='requiredValFldMsg'> Please select
																				yes/No</span>  --> <input type="radio"
															name="isApplicable_2" value="No" class="">No <!-- <span
																			class='requiredValFldMsg'> Please select
																				yes/No </span> --></td>

													</tr>

													<tr>
														<td>4</td>
														<td>Electricity supply transformer and substation<input type="hidden"
															name="externalInfrastructureName"
															value="Electricity supply transformer and substation"
															class=""> <!-- <span
																			class='requiredValFldMsg'> Please Enter
																				Infrastructure Name </span> --></td>
														<td><input type="radio" name="isApplicable_3"
															value="Yes" class="">Yes <!-- <span
																			class=''> Please select
																				yes/No</span> --> <input type="radio"
															name="isApplicable_3" value="No" class="">No <!-- <span
																			class='requiredValFldMsg'> Please select
																				yes/No </span> --></td>

													</tr>



													<tr>
														<td>5</td>
														<td>Solid waste management and disposal<input type="hidden"
															name="externalInfrastructureName"
															value="Solid waste management and disposal"
															class="requiredValFld"> <span
															class='requiredValFldMsg'> Please Enter
																Infrastructure Name </span></td>
														<td><input type="radio" name="isApplicable_4"
															value="Yes" class="">Yes <!-- <span
																			class='requiredValFldMsg'> Please select
																				yes/No</span> --> <input type="radio"
															name="isApplicable_4" value="No" class="">No <!-- <span
																			class='requiredValFldMsg'> Please select
																				yes/No </span> --></td>

													</tr>

													<tr>
														<td>6</td>
														<td>Emergency Evacuation services<input type="hidden"
															name="externalInfrastructureName"
															value="Emergency Evacuation services"
															class="requiredValFld"> <span
															class='requiredValFldMsg'> Please Enter
																Infrastructure Name </span></td>
														<td><input type="radio" name="isApplicable_5"
															value="Yes" class="">Yes<!--  <span
																			class='requiredValFldMsg'> Please select
																				yes/No</span> --> <input type="radio"
															name="isApplicable_5" value="No" class="">No <!-- <span
																			class='requiredValFldMsg'> Please select
																	yes/No </span> --></td>
													</tr>

													<tr>
														<td>7</td>
														<td>Storm water drains<input type="hidden"
															name="externalInfrastructureName"
															value="Storm water drains" class="requiredValFld">
															<span class='requiredValFldMsg'> Please Enter
																Infrastructure Name </span></td>
														<td><input type="radio" name="isApplicable_6"
															value="Yes" class="">Yes <!-- <span
																			class='requiredValFldMsg'> Please select
																				yes/No</span> --> <input type="radio"
															name="isApplicable_6" value="No" class="">No <!-- <span
																			class='requiredValFldMsg'> Please select
																				yes/No </span> --></td>

													</tr>

													<tr>
														<td>8</td>
														<td>Use of renewable energy<input type="hidden"
															name="externalInfrastructureName"
															value="Use of renewable energy" class="requiredValFld">
															<span class='requiredValFldMsg'> Please Enter
																Infrastructure Name </span></td>
														<td><input type="radio" name="isApplicable_7"
															value="Yes" class="">Yes <!-- <span
																			class='requiredValFldMsg'> Please select
																				yes/No</span> --> <input type="radio"
															name="isApplicable_7" value="No" class="">No <!-- <span
																			class='requiredValFldMsg'> Please select
																				yes/No </span> --></td>

													</tr>

													<tr>
														<td>9</td>
														<td>Water conservation/rain water harvesting/recharge of ground water<input type="hidden"
															name="externalInfrastructureName"
															value="Water conservation/rain water harvesting/recharge of ground water"
															class="requiredValFld"> <span
															class='requiredValFldMsg'> Please Enter
																Infrastructure Name </span></td>
														<td><input type="radio" name="isApplicable_8"
															value="Yes" class="">Yes <!-- <span
																			class='requiredValFldMsg'> Please select
																				yes/No</span> --> <input type="radio"
															name="isApplicable_8" value="No" class="">No <!-- <span
																			class='requiredValFldMsg'> Please select
																				yes/No </span> --></td>

													</tr>

													<tr>
														<td>10</td>
														<td>Fire protection and fire safety requirements<input type="hidden"
															name="externalInfrastructureName"
															value="Fire protection and fire safety requirements"
															class="requiredValFld"> <span
															class='requiredValFldMsg'> Please Enter
																Infrastructure Name </span></td>
														<td><input type="radio" name="isApplicable_9"
															value="Yes" class="">Yes <!-- <span
																			class='requiredValFldMsg'> Please select
																				yes/No</span>  --> <input type="radio"
															name="isApplicable_9" value="No" class="">No<!--  <span
																			class='requiredValFldMsg'> Please select
																				yes/No </span> --></td>
												</c:when>
												<c:otherwise>
												<input type="hidden" name="projectScheduleId"
															value="${projectRegistrationModel.projectDetailsModel.projectScheduleModel.projectScheduleId}" />
													<c:forEach
														items="${projectRegistrationModel.projectDetailsModel.projectScheduleModel.externalInfrastructureList}"
														var="obj">

														<tr>
														<% ++externalCount; %>
															<td><%= externalCount+1 %></td>
															<td><c:out value="${obj.externalInfrastructureName}"></c:out><input type="hidden" name="infrastructureId"
																value="${obj.externalInfrastructureId}" /> <input
																type="hidden" name="externalInfrastructureName"
																value="${obj.externalInfrastructureName}"
																class="requiredValFld"> <span
																class='requiredValFldMsg'> Please Enter
																	Infrastructure Name </span></td>
															<td><c:choose>
																	<c:when test="${obj.isApplicable == 'Yes'}">
																		<div class="col-md-9">
																			<label class="radio-inline" for="isApplicable">
																				<input type="radio" id="isApplicable"
																				name="isApplicable_<%=externalCount %>" value="Yes"
																				class='dynaselectfld requiredValFld'
																				checked="checked">Yes
																			</label> <label class="radio-inline" for="isApplicable">
																				<input type="radio" id="isApplicable"
																				name="isApplicable_<%=externalCount %>" value="No">No
																			</label>
																		</div>
																	</c:when>
																	<c:otherwise>
																		<div class="col-md-9">
																			<label class="radio-inline" for="isApplicable">
																				<input type="radio" id="inline-radio1"
																				name="isApplicable_<%=externalCount %>" value="Yes">Yes
																			</label> <label class="radio-inline" for="isApplicable">
																				<input type="radio" id="inline-radio2"
																				name="isApplicable_<%=externalCount %>" value="No"
																				checked="checked">No
																			</label>

																		</div>
																	</c:otherwise>
																</c:choose></td>
														</tr>
													</c:forEach>
												</c:otherwise>
											</c:choose>
										</tbody>

									</table>
									<div class="form-group row">
										<input type="button"
											class="btn btn-sm btn-success pull-right"
											id="ExternalInfraId" value="Save" />
											<input type="button"
											class="btn btn-sm btn-primary  pull-right"
											id="btn-add-External-Infrastructure" value="Add More" />
										<!-- <button type="reset" class="btn btn-sm btn-danger  pull-right">
											<i class="fa fa-ban"></i> Reset
										</button> -->
									</div>
								</form:form>
							</div>
						</div>
					</div>
				</div>

				


				<div class="panel-group" id="accordion">
								<div class="panel panel-primary">
									<div class="panel-heading card-header collapsed"
										data-toggle="collapse" data-target="#bar20">
										<i class="fa fa-fw fa-chevron-down"></i> <i
											class="fa fa-fw fa-chevron-right"></i>Amenities Details

									</div>
									<div class="panel-body">
										<!-- The inside div eliminates the 'jumping' animation. -->
										<div class="collapse" id="bar20">
											<form:form action="updateAmenityDetails" method="post"
												enctype="multipart/form-data" class="form-horizontal"
												id="amenityForm"
												modelAttribute="projectRegistrationModel">
												<table id="sche-aminity-details-list"
													class="table table-bordered table-striped table-condensed">
													<thead>

														<tr>
															<th colspan="6">Amenities Details</th>
														</tr>
														<tr>
															<th>SlNo.</th>
															<th>Name</th>
															<th>Is Applicable?</th>
															<!-- <th>Percentage of Completion</th>
															<th>Photograph</th> -->
														</tr>
													</thead>
													<tbody>
														<c:choose>
															<c:when test="${ empty projectRegistrationModel.projectDetailsModel.projectScheduleModel.amenityList}">
																<tr>
																	<td>1</td>
																	<td>Power Backup<input type="hidden" name="amenityName"
																		value="Power Backup" class="requiredValFld">
																		<span class='requiredValFldMsg'> Please Enter
																			Area Name </span></td>
																	<td><input type="radio" name="isApplicable_0"
																		value="Yes" class="requiredValFld">Yes <span
																		class='requiredValFldMsg'> Please select yes/No</span>

																		<input type="radio" name="isApplicable_0" value="No"
																		class="requiredValFld">No <span
																		class='requiredValFldMsg'> Please select yes/No
																	</span></td>
																</tr>

																<tr>
																	<td>2</td>
																	<td>Smart Home Automation<input type="hidden" name="amenityName"
																		value="Smart Home Automation"> <span
																		class='requiredValFldMsg'> Please Enter Area
																			Name </span></td>
																	<td><input type="radio" name="isApplicable_1"
																		value="Yes" class="requiredValFld">Yes <span
																		class='requiredValFldMsg'> Please select yes/No</span>

																		<input type="radio" name="isApplicable_1" value="No"
																		class="requiredValFld">No <span
																		class='requiredValFldMsg'> Please select yes/No
																	</span></td>
																
																</tr>
																<tr>
																	<td>3</td>
																	<td>CCTV Surveillance<input type="hidden" name="amenityName"
																		value="CCTV Surveillance"> <span
																		class='requiredValFldMsg'> Please Enter Area
																			Name </span></td>
																	<td><input type="radio" name="isApplicable_2"
																		value="Yes" class="requiredValFld">Yes <span
																		class='requiredValFldMsg'> Please select yes/No</span>

																		<input type="radio" name="isApplicable_2" value="No"
																		class="requiredValFld">No <span
																		class='requiredValFldMsg'> Please select yes/No
																	</span></td>
																	<!-- <td><input type="text"
																		name="percentageOfCompletion" class="requiredValFld">
																		<span class='requiredValFldMsg'> Please Enter
																			Percentage Of Completion </span></td>
																	<td><input type="file" name="photograph"
																		class="requiredValFld"> <span
																		class='requiredValFldMsg'> Please Attach file </span>
																	</td> -->

																</tr>
																<tr>
																	<td>4</td>
																	<td>Club House<input type="hidden" name="amenityName"
																		value="Club House"> <span
																		class='requiredValFldMsg'> Please Enter Area
																			Name </span></td>
																	<td><input type="radio" name="isApplicable_3"
																		value="Yes" class="requiredValFld">Yes <span
																		class='requiredValFldMsg'> Please select yes/No</span>

																		<input type="radio" name="isApplicable_3" value="No"
																		class="requiredValFld">No <span
																		class='requiredValFldMsg'> Please select yes/No
																	</span></td>
																	<!-- <td><input type="text"
																		name="percentageOfCompletion" class="requiredValFld">
																		<span class='requiredValFldMsg'> Please Enter
																			Percentage Of Completion </span></td>
																	<td><input type="file" name="photograph"
																		class="requiredValFld"> <span
																		class='requiredValFldMsg'> Please Attach file </span>
																	</td> -->
																</tr>
																<tr>
																	<td>5</td>
																	<td>Community Hall<input type="hidden" name="amenityName"
																		value="Community Hall"> <span
																		class='requiredValFldMsg'> Please Enter Area
																			Name </span></td>
																	<td><input type="radio" name="isApplicable_4"
																		value="Yes" class="requiredValFld">Yes <span
																		class='requiredValFldMsg'> Please select yes/No</span>

																		<input type="radio" name="isApplicable_4" value="No"
																		class="requiredValFld">No <span
																		class='requiredValFldMsg'> Please select yes/No
																	</span></td>
																</tr>
																<tr>
																	<td>6</td>
																	<td>Outdoor Sports facility<input type="hidden" name="amenityName"
																		value="Outdoor Sports facility"> <span
																		class='requiredValFldMsg'> Please Enter Area
																			Name </span></td>
																	<td><input type="radio" name="isApplicable_5"
																		value="Yes" class="requiredValFld">Yes <span
																		class='requiredValFldMsg'> Please select yes/No</span>

																		<input type="radio" name="isApplicable_5" value="No"
																		class="requiredValFld">No <span
																		class='requiredValFldMsg'> Please select yes/No
																	</span></td>
																</tr>
																<tr>
																	<td>7</td>
																	<td>Indoor Sports facility<input type="hidden" name="amenityName"
																		value="Indoor Sports facility"> <span
																		class='requiredValFldMsg'> Please Enter Area
																			Name </span></td>
																	<td><input type="radio" name="isApplicable_6"
																		value="Yes" class="requiredValFld">Yes <span
																		class='requiredValFldMsg'> Please select yes/No</span>

																		<input type="radio" name="isApplicable_6" value="No"
																		class="requiredValFld">No <span
																		class='requiredValFldMsg'> Please select yes/No
																	</span></td>
																</tr>
																<tr>
																	<td>8</td>
																	<td>Swimming Pool<input type="hidden" name="amenityName"
																		value="Swimming Pool"> <span
																		class='requiredValFldMsg'> Please Enter Area
																			Name </span></td>
																	<td><input type="radio" name="isApplicable_7"
																		value="Yes" class="requiredValFld">Yes <span
																		class='requiredValFldMsg'> Please select yes/No</span>

																		<input type="radio" name="isApplicable_7" value="No"
																		class="requiredValFld">No <span
																		class='requiredValFldMsg'> Please select yes/No
																	</span></td>
																</tr>
																<tr>
																	<td>9</td>
																	<td>Gym<input type="hidden" name="amenityName"
																		value="Gym"> <span class='requiredValFldMsg'>
																			Please Enter Area Name </span></td>
																	<td><label class="radio-inline"
																		for="inline-radio1"><input type="radio"
																			name="isApplicable_8" value="Yes"
																			class="requiredValFld">Yes <span
																			class='requiredValFldMsg'> Please select
																				yes/No</span> </label> <label class="radio-inline"
																		for="inline-radio2"> <input type="radio"
																			name="isApplicable_8" value="No"
																			class="requiredValFld">No <span
																			class='requiredValFldMsg'> Please select
																				yes/No </span></label></td>
																</tr>
																	<tr>
																	<td>10</td>
																	<td>Parks<input type="hidden" name="amenityName"
																		value="Parks"> <span class='requiredValFldMsg'>
																			Please Enter Area Name </span></td>
																	<td><label class="radio-inline"
																		for="inline-radio1"><input type="radio"
																			name="isApplicable_9" value="Yes"
																			class="requiredValFld">Yes <span
																			class='requiredValFldMsg'> Please select
																				yes/No</span> </label> <label class="radio-inline"
																		for="inline-radio2"> <input type="radio"
																			name="isApplicable_9" value="No"
																			class="requiredValFld">No <span
																			class='requiredValFldMsg'> Please select
																				yes/No </span></label></td>
																</tr>
																	<tr>
																	<td>11</td>
																	<td>Electricity<input type="hidden" name="amenityName"
																		value="Electricity"> <span class='requiredValFldMsg'>
																			Please Enter Area Name </span></td>
																	<td><label class="radio-inline"
																		for="inline-radio1"><input type="radio"
																			name="isApplicable_10" value="Yes"
																			class="requiredValFld">Yes <span
																			class='requiredValFldMsg'> Please select
																				yes/No</span> </label> <label class="radio-inline"
																		for="inline-radio2"> <input type="radio"
																			name="isApplicable_10" value="No"
																			class="requiredValFld">No <span
																			class='requiredValFldMsg'> Please select
																				yes/No </span></label></td>
																<!-- 	<td><input type="text"
																		name="percentageOfCompletion" class="requiredValFld">
																		<span class='requiredValFldMsg'> Please Enter
																			Percentage Of Completion </span></td>
																	<td><input type="file" name="photograph"
																		class="requiredValFld"> <span
																		class='requiredValFldMsg'> Please Attach file </span>
																	</td> -->
																</tr>
																<tr>
																	<td>12</td>
																	<td>Gas<input type="hidden" name="amenityName"
																		value="Gas"> <span class='requiredValFldMsg'>
																			Please Enter Area Name </span></td>
																	<td><label class="radio-inline"
																		for="inline-radio1"><input type="radio"
																			name="isApplicable_11" value="Yes"
																			class="requiredValFld">Yes <span
																			class='requiredValFldMsg'> Please select
																				yes/No</span> </label> <label class="radio-inline"
																		for="inline-radio2"> <input type="radio"
																			name="isApplicable_11" value="No"
																			class="requiredValFld">No <span
																			class='requiredValFldMsg'> Please select
																				yes/No </span></label></td>
																<!-- 	<td><input type="text"
																		name="percentageOfCompletion" class="requiredValFld">
																		<span class='requiredValFldMsg'> Please Enter
																			Percentage Of Completion </span></td>
																	<td><input type="file" name="photograph"
																		class="requiredValFld"> <span
																		class='requiredValFldMsg'> Please Attach file </span>
																	</td> -->
																</tr>
																	
																
																			<tr>
																	<td>13</td>
																	<td>Water and Sanitation<input type="hidden" name="amenityName"
																		value="Water and Sanitation"> <span class='requiredValFldMsg'>
																			Please Enter Area Name </span></td>
																	<td><label class="radio-inline"
																		for="inline-radio1"><input type="radio"
																			name="isApplicable_12" value="Yes"
																			class="requiredValFld">Yes <span
																			class='requiredValFldMsg'> Please select
																				yes/No</span> </label> <label class="radio-inline"
																		for="inline-radio2"> <input type="radio"
																			name="isApplicable_12" value="No"
																			class="requiredValFld">No <span
																			class='requiredValFldMsg'> Please select
																				yes/No </span></label></td>
																<!-- 	<td><input type="text"
																		name="percentageOfCompletion" class="requiredValFld">
																		<span class='requiredValFldMsg'> Please Enter
																			Percentage Of Completion </span></td>
																	<td><input type="file" name="photograph"
																		class="requiredValFld"> <span
																		class='requiredValFldMsg'> Please Attach file </span>
																	</td> -->
																</tr>
																
																	<tr>
																	<td>14</td>
																	<td>Air Conditioning And incerntion<input type="hidden" name="amenityName"
																		value="Air Conditioning And incerntion"> <span class='requiredValFldMsg'>
																			Please Enter Area Name </span></td>
																	<td><label class="radio-inline"
																		for="inline-radio1"><input type="radio"
																			name="isApplicable_13" value="Yes"
																			class="requiredValFld">Yes <span
																			class='requiredValFldMsg'> Please select
																				yes/No</span> </label> <label class="radio-inline"
																		for="inline-radio2"> <input type="radio"
																			name="isApplicable_13" value="No"
																			class="requiredValFld">No <span
																			class='requiredValFldMsg'> Please select
																				yes/No </span></label></td>
																<!-- 	<td><input type="text"
																		name="percentageOfCompletion" class="requiredValFld">
																		<span class='requiredValFldMsg'> Please Enter
																			Percentage Of Completion </span></td>
																	<td><input type="file" name="photograph"
																		class="requiredValFld"> <span
																		class='requiredValFldMsg'> Please Attach file </span>
																	</td> -->
																</tr>
															</c:when>
															<c:otherwise>
																<% int amenityCount=-1;%>
																<input type="hidden" name="projectScheduleId"
															value="${projectRegistrationModel.projectDetailsModel.projectScheduleModel.projectScheduleId}" />
																<c:forEach items="${projectRegistrationModel.projectDetailsModel.projectScheduleModel.amenityList}"
																	var="amenityDetailsObj">

																	<tr>
																	<% ++amenityCount; %>
																		<td><%= amenityCount+1 %></td>
																		<td><c:out value="${amenityDetailsObj.amenityName}"></c:out><input type="hidden"
																			name="amenityDetailsId"
																			value="${amenityDetailsObj.amenityDetailsId}" />
																			<input type="hidden" name="amenityName"
																			value="${amenityDetailsObj.amenityName}"
																			class="requiredValFld"> <span
																			class='requiredValFldMsg'> Please Enter Area
																				Name </span></td>
																		<td>
																		<c:choose>
																		<c:when test="${amenityDetailsObj.isApplicable=='Yes'}">
																		<label class="radio-inline"
																		for="inline-radio1"><input type="radio"
																			name="isApplicable_<%= amenityCount %>" value="Yes"
																			class="requiredValFld" checked>Yes <span
																			class='requiredValFldMsg'> Please select
																				yes/No</span> </label> <label class="radio-inline"
																		for="inline-radio2"> <input type="radio"
																			name="isApplicable_<%= amenityCount %>" value="No"
																			class="requiredValFld">No <span
																			class='requiredValFldMsg'> Please select
																				yes/No </span></label>
																		</c:when>
																		<c:otherwise>
																		<label class="radio-inline"
																		for="inline-radio1"><input type="radio"
																			name="isApplicable_<%= amenityCount %>" value="Yes"
																			class="requiredValFld">Yes <span
																			class='requiredValFldMsg'> Please select
																				yes/No</span> </label> <label class="radio-inline"
																		for="inline-radio2"> <input type="radio"
																			name="isApplicable_<%= amenityCount %>" value="No"
																			class="requiredValFld" checked>No <span
																			class='requiredValFldMsg'> Please select
																				yes/No </span></label>
																		</c:otherwise>
																		</c:choose>
																		</td>
																		
																	</tr>
																</c:forEach>
															</c:otherwise>
														</c:choose>
													</tbody>
												</table>
												<div class="form-group row">
													<input type="button"
														class="btn btn-sm btn-success  pull-right"
														id="amenityId" value="Save" />
														<input type="button"
														class="btn btn-sm btn-primary  pull-right"
														id="btn-add-aminity-details" value="Add More" />
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

				<div class="panel-group" id="accordion">
					<div class="panel panel-primary">
						<div class="panel-heading card-header collapsed"
							data-toggle="collapse" data-target="#bar7">
							<i class="fa fa-fw fa-chevron-down"></i> <i
								class="fa fa-fw fa-chevron-right"></i> Common Area

						</div>
						<div class="panel-body">
							<!-- The inside div eliminates the 'jumping' animation. -->
							<div class="collapse" id="bar7">
								<form:form action="updateCommonDetails" method="post"
									enctype="multipart/form-data" class="form-horizontal"
									id="commonAreaForm" modelAttribute="projectRegistrationModel">
									<table id="sche-common-area-list"
										class="table table-bordered table-striped table-condensed">
										<thead>
											<tr>
												<th colspan="4">Common Area Details</th>
											</tr>
											<tr>
												<th>SlNo.</th>
												<th>Name</th>
												<th>Is Applicable</th>
												<!--  <th>Photograph </th> -->
											</tr>
										</thead>
										<tbody>
											<% int commonCount = 0; %>
											<!--  Need to create the seperate model for common Area -->
											<c:choose>
												<c:when
													test="${ empty projectRegistrationModel.projectDetailsModel.projectScheduleModel.commonAreaList}">
													<tr>
														<td>1</td>
														<td>Staircases<input type="hidden" name="commonAreaName"
															value="Staircases" class="requiredValFld"> <span
															class='requiredValFldMsg'> Please Enter
																Infrastructure Name </span></td>
														<td><label class="radio-inline" for="inline-radio1"><input
																type="radio" name="isApplicable_0" value="Yes" class="">Yes
																<span class='requiredValFldMsg'> Please select
																	yes/No</span> </label> <label class="radio-inline" for="inline-radio2">
																<input type="radio" name="isApplicable_0" value="No"
																class="">No <span class='requiredValFldMsg'>
																	Please select yes/No </span>
														</label></td>
													</tr>

													<tr>
														<td>2</td>
														<td>Lifts<input type="hidden" name="commonAreaName"
															value="Lifts" class="requiredValFld"></td>
														<td><label class="radio-inline" for="inline-radio1"><input
																type="radio" name="isApplicable_1" value="Yes" class="">Yes
																<span class='requiredValFldMsg'> Please select
																	yes/No</span> </label> <label class="radio-inline" for="inline-radio2">
																<input type="radio" name="isApplicable_1" value="No"
																class="">No <span class='requiredValFldMsg'>
																	Please select yes/No </span>
														</label></td>
													</tr>


													<tr>
														<td>3</td>
														<td>Staircases and Lift lobbies, corridor,lobbies, corridor<input type="hidden" name="commonAreaName"
															value="Staircases and Lift lobbies, corridor,lobbies, corridor"
															class="requiredValFld"></td>
														<td><label class="radio-inline" for="inline-radio1"><input
																type="radio" name="isApplicable_2" value="Yes" class="">Yes
																<span class='requiredValFldMsg'> Please select
																	yes/No</span> </label> <label class="radio-inline" for="inline-radio2">
																<input type="radio" name="isApplicable_2" value="No"
																class="">No <span class='requiredValFldMsg'>
																	Please select yes/No </span>
														</label></td>
													</tr>

													<tr>
														<td>4</td>
														<td>Fire escapes<input type="hidden" name="commonAreaName"
															value="Fire escapes" class="requiredValFld"></td>
														<td><label class="radio-inline" for="inline-radio1"><input
																type="radio" name="isApplicable_3" value="Yes" class="">Yes
																<span class='requiredValFldMsg'> Please select
																	yes/No</span> </label> <label class="radio-inline" for="inline-radio2">
																<input type="radio" name="isApplicable_3" value="No"
																class="">No <span class='requiredValFldMsg'>
																	Please select yes/No </span>
														</label></td>
													</tr>

													<tr>
														<td>5</td>
														<td>Common entrance and exit for the <br/>
														building/common portico/foyer/verandah<input type="hidden" name="commonAreaName"
															value="Common entrance and exit for the building / common portico/foyer/verandah"
															class="requiredValFld"></td>
														<td><label class="radio-inline" for="inline-radio1"><input
																type="radio" name="isApplicable_4" value="Yes" class="">Yes
																<span class='requiredValFldMsg'> Please select
																	yes/No</span> </label> <label class="radio-inline" for="inline-radio2">
																<input type="radio" name="isApplicable_4" value="No"
																class="">No <span class='requiredValFldMsg'>
																	Please select yes/No </span>
														</label></td>
													</tr>
													<tr>
														<td>6</td>
														<td>Basement<input type="hidden" name="commonAreaName"
															value="Basement" class="requiredValFld"></td>
														<td><label class="radio-inline" for="inline-radio1"><input
																type="radio" name="isApplicable_5" value="Yes" class="">Yes
																<span class='requiredValFldMsg'> Please select
																	yes/No</span> </label> <label class="radio-inline" for="inline-radio2">
																<input type="radio" name="isApplicable_5" value="No"
																class="">No <span class='requiredValFldMsg'>
																	Please select yes/No </span>
														</label></td>
													</tr>
													<tr>
														<td>7</td>
														<td>Terrace<input type="hidden" name="commonAreaName"
															value="Terrace" class="requiredValFld"></td>
														<td><label class="radio-inline" for="inline-radio1"><input
																type="radio" name="isApplicable_6" value="Yes" class="">Yes
																<span class='requiredValFldMsg'> Please select
																	yes/No</span> </label> <label class="radio-inline" for="inline-radio2">
																<input type="radio" name="isApplicable_6" value="No"
																class="">No <span class='requiredValFldMsg'>
																	Please select yes/No </span>
														</label></td>
													</tr>
													<tr>
														<td>8</td>
														<td>Outer Wall<input type="hidden" name="commonAreaName"
															value="Outer Wall" class="requiredValFld"></td>
														<td><label class="radio-inline" for="inline-radio1"><input
																type="radio" name="isApplicable_7" value="Yes" class="">Yes
																<span class='requiredValFldMsg'> Please select
																	yes/No</span> </label> <label class="radio-inline" for="inline-radio2">
																<input type="radio" name="isApplicable_7" value="No"
																class="">No <span class='requiredValFldMsg'>
																	Please select yes/No </span>
														</label></td>
													</tr>
													<tr>
														<td>9</td>
														<td>Open parking areas and common storage spaces<input type="hidden" name="commonAreaName"
															value="Open parking areas and common storage spaces"
															class="requiredValFld"></td>
														<td><label class="radio-inline" for="inline-radio1"><input
																type="radio" name="isApplicable_8" value="Yes" class="">Yes
																<span class='requiredValFldMsg'> Please select
																	yes/No</span> </label> <label class="radio-inline" for="inline-radio2">
																<input type="radio" name="isApplicable_8" value="No"
																class="">No <span class='requiredValFldMsg'>
																	Please select yes/No </span>
														</label></td>
													</tr>
													<tr>
														<td>10</td>
														<td>Provision for lodging of management staff and security staff<input type="hidden" name="commonAreaName"
															value="Provision for lodging of management staff and security staff"
															class="requiredValFld"></td>
														<td><label class="radio-inline" for="inline-radio1"><input
																type="radio" name="isApplicable_9" value="Yes" class="">Yes
																<span class='requiredValFldMsg'> Please select
																	yes/No</span> </label> <label class="radio-inline" for="inline-radio2">
																<input type="radio" name="isApplicable_9" value="No"
																class="">No <span class='requiredValFldMsg'>
																	Please select yes/No </span>
														</label></td>
													</tr>
													<tr>
														<td>11</td>
														<td>Water conservation and renewable energy<input type="hidden" name="commonAreaName"
															value="Water conservation and renewable energy"
															class="requiredValFld"></td>
														<td><label class="radio-inline" for="inline-radio1"><input
																type="radio" name="isApplicable_10" value="Yes" class="">Yes
																<!-- <span
																			class='requiredValFldMsg'> Please select
																				yes/No</span> --> </label> <label class="radio-inline"
															for="inline-radio2"> <input type="radio"
																name="isApplicable_10" value="No" class="">No <!-- <span
																			class='requiredValFldMsg'> Please select
																				yes/No </span> --></label></td>
													</tr>

												</c:when>
												<c:otherwise>
													<c:forEach
														items="${projectRegistrationModel.projectDetailsModel.projectScheduleModel.commonAreaList}"
														var="obj">

														<tr>
															<td><%= ++commonCount %></td>
															<td><c:out value="${obj.commonAreaName}"></c:out><input type="hidden" name="infrastructureId"
																value="${obj.commonAreaDetailsId}" /> <input
																type="hidden" name="commonAreaName"
																value="${obj.commonAreaName}" class="requiredValFld">
																<span class='requiredValFldMsg'> Please Enter
																	commonAreaName Name </span></td>
															<td><c:choose>
																	<c:when test="${obj.isApplicable == 'Yes'}">
																		<div class="col-md-9">
																			<label class="radio-inline" for="isApplicable">
																				<input type="radio" id="isApplicable"
																				name="isApplicable_<%=commonCount %>" value="Yes"
																				class='dynaselectfld requiredValFld'
																				checked="checked">Yes
																			</label> <label class="radio-inline" for="isApplicable">
																				<input type="radio" id="isApplicable"
																				name="isApplicable_<%=commonCount %>" value="No">No
																			</label>
																		</div>
																	</c:when>
																	<c:otherwise>
																		<div class="col-md-9">
																			<label class="radio-inline" for="isApplicable">
																				<input type="radio" id="inline-radio1"
																				name="isApplicable_<%=commonCount %>" value="Yes">Yes
																			</label> <label class="radio-inline" for="isApplicable">
																				<input type="radio" id="inline-radio2"
																				name="isApplicable_<%=commonCount %>" value="No"
																				checked="checked">No
																			</label>

																		</div>
																	</c:otherwise>
																</c:choose></td>


															<%-- 		<td><input type="text"
																			name="percentageOfCompletion"
																			value="${infrastructureObj.percentageOfCompletion}"
																			class="requiredValFld"> <span
																			class='requiredValFldMsg'> Please Enter
																				Percentage of Completion </span></td>
																		<td><input type="hidden" name="photographDocId"
																			value="${infrastructureObj.photograph.documentId}" />
																			<input type="file" name="photograph"
																			title="Only image or pdf file is allowed. file size upto 1 MB">
																			<a
																			href='<%=request.getContextPath() %>/download?DOC_ID=${infrastructureObj.photograph.documentId}'>
																				${infrastructureObj.photograph.documentName}</a></td> --%>
														</tr>
													</c:forEach>
												</c:otherwise>
											</c:choose>
										</tbody>
									</table>
									<div class="form-group row">
										<input type="button"
											class="btn btn-sm btn-success  pull-right" id="commonAreaId"
											value="Save" />
											<input type="button"
											class="btn btn-sm btn-primary  pull-right" id="btn-add-common-area"
											value="Add More" />
										<!-- <button type="reset" class="btn btn-sm btn-danger  pull-right">
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
		<!--/col-->
	</div>

	</div>
	<!-- /.conainer-fluid --> </main>


	<!--     <footer class="footer">
        <span class="text-left">
              <a href="http://www.keyfalconsolutions.com/">Branding</a> © 2016 Developers.
          </span>
        <span class="pull-right">
              Powered by <a href="http://www.keyfalconsolutions.com/">Keyfalcon Solutions</a>
          </span>
    </footer> -->

</body>

</html>