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
						<i class="fa fa-align-justify"></i> Project Schedule :
						Registration Number -
						${projectRegistrationModel.projectRegistrationNo}
						
					</div>
					
					<div class="card-block">
					<div class="container">
					<!-------------------civil works  ---------------------------------------->
					
					<form:form class="form-horizontal" autocomplete="off" action="updatePlotScheduleDetails" modelAttribute="projectRegistrationModel"
						enctype="multipart/form-data" id="plotCivilWorkForm" method="post">
						<%=ReraSecurity.writeToken(request)%>
						
								<form:hidden path="projectRegId" />
								<form:hidden path="projectDetailsModel.projectDetailsId" />
								<div class="panel-group" id="accordion">
									<div class="panel panel-primary">
										<div class="panel-heading card-header collapsed"
											data-toggle="collapse" data-target="#bar1">
											<i class="fa fa-fw fa-chevron-down"></i> <i
												class="fa fa-fw fa-chevron-right"></i>Civil Works

										</div>
										<div class="panel-body">
											<!-- The inside div eliminates the 'jumping' animation. -->
											<div class="collapse" id="bar1">
												<table
													class="table table-bordered table-striped table-condensed"
													id="plotsche-list">
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
														<%
															int count = -1;
																int i = 0;
														%>
														<c:choose>
															<c:when
																test="${ not empty projectRegistrationModel.projectDetailsModel.plotScheduleModel.civilWorkList}">
																<form:hidden
																	path="projectDetailsModel.plotScheduleModel.plotScheduleModelId" />
																<input type="hidden" name="plotScheduleModelId"
																	value="${projectRegistrationModel.projectDetailsModel.plotScheduleModel.plotScheduleModelId}" />
																<c:forEach
																	items="${projectRegistrationModel.projectDetailsModel.plotScheduleModel.civilWorkList}"
																	var="obj">
																	<tr>
																		<td><%=++i%></td>

																		<%
																			++count;
																		%>

																		<td>
																		<c:out value="${obj.typeOfWork}"></c:out>
																		<input type="hidden" name="civilWorkId"
																			value="${obj.civilWorkId}" /> <input type="hidden"
																			name="typeOfWork" value="${obj.typeOfWork}"
																			class="form-control requiredValFld" /> <span
																			class='requiredValFldMsg'> Please Enter Type Of Work.</span></td>
																		<td><c:choose>
																				<c:when test="${obj.isApplicable == 'Yes'}">
																					<div class="col-md-9">
																						<label class="radio-inline" for="isApplicable">
																							<input type="radio" id="isApplicable_<%=count%>" schcount="<%=count%>" onclick="showEstDate(this);"
																							name="isApplicable_<%=count%>" value="Yes"
																							class='dynaselectfld requiredValFld'
																							checked="checked">Yes<span class='requiredValFldMsg'>Please select yes/No.</span>
																						</label> <label class="radio-inline" for="isApplicable">
																							<input type="radio" class="requiredValFld" id="isApplicable_<%=count%>" schcount="<%=count%>" onclick="hideEstDate(this);"
																							name="isApplicable_<%=count%>" value="No">No<span class='requiredValFldMsg'>Please select yes/No.</span>
																						</label>
																					</div>
																				</c:when>
																				<c:otherwise>
																					<div class="col-md-9">
																						<label class="radio-inline" for="isApplicable">
																							<input type="radio" class="requiredValFld" id="inline-radio1" id="isApplicable_<%=count%>" schcount="<%=count%>" onclick="showEstDate(this);"
																							name="isApplicable_<%=count%>" value="Yes">Yes<span class='requiredValFldMsg'>Please select yes/No.</span>
																						</label> <label class="radio-inline" for="isApplicable">
																							<input type="radio" class="requiredValFld" id="inline-radio2" id="isApplicable_<%=count%>" schcount="<%=count%>" onclick="hideEstDate(this);"
																							name="isApplicable_<%=count%>" value="No" checked>No<span class='requiredValFldMsg'>Please select yes/No.</span>
																						</label>

																					</div>
																				</c:otherwise>
																			</c:choose></td>
																			<%-- <c:if test="${obj.isApplicable == 'Yes'}"> --%>
																		<td><fmt:formatDate type="date"
																				pattern="yyyy-MM-dd" dateStyle="short"
																				var="formateddate"
																				value="${obj.estimatedFrmDate.time}" /> <input id="estimatedFrmDate_<%=count%>"
																			type="date" name="estimatedFrmDate"
																			value="${formateddate}"
																			class="form-control " /> <span class='requiredValFldMsg'>Please Enter Estimated From Date.</span></td>
																		<td><fmt:formatDate type="date"
																				pattern="yyyy-MM-dd" dateStyle="short"
																				var="formateddate1"
																				value="${obj.estimatedToDate.time}" /> <input id="estimatedToDate_<%=count%>"
																			type="date" name="estimatedToDate"
																			value="${formateddate1}"
																			class="form-control " /> <span class='requiredValFldMsg'>Please Enter Estimated To Date.</span></td>
																		<%-- </c:if> --%>

																	</tr>

																</c:forEach>
																<!-- <button type="button"
															class="btn btn-success btn-sm pull-right btn-add-tdr">Add
															More</button> -->
															</c:when>
															<c:otherwise>
																<form:hidden path="projectDetailsModel.projectDetailsId" />
																<input type="hidden" name="plotScheduleModelId"
																	value="${projectRegistrationModel.projectDetailsModel.plotScheduleModel.plotScheduleModelId}" />
																<tr>

																	<td>1</td>
																	<td>Ground Clearance/Formation Of Plots<input type="hidden" name="typeOfWork"
																		value="Ground Clearance/Formation Of Plots" /> <span
																		class="requiredValFldMsg"> Please Enter type Of Work.</span></td>
																	<td><label class="radio-inline"
																		for="inline-radio1"><input type="radio"
																			name="isApplicable_0" value="Yes" id="isApplicable_0" schcount="0" onclick="showEstDate(this);"
																			class="requiredValFld">Yes <span class='requiredValFldMsg'>Please select yes/No.</span> </label> <label class="radio-inline"
																		for="inline-radio2"><input type="radio"
																			name="isApplicable_0" value="No" id="isApplicable_0" schcount="0" onclick="hideEstDate(this);"
																			class="requiredValFld">No <span class='requiredValFldMsg'>Please select yes/No.</span> </label></td>
																	<td><input type="date" name="estimatedFrmDate" id="estimatedFrmDate_0"
																		class="form-control"> <span
																		class='requiredValFldMsg'>Please Enter Estimated From Date.</span></td>
																	<td><input type="date" name="estimatedToDate" id="estimatedToDate_0"
																		class="form-control"> <span class='requiredValFldMsg'>Please Enter Estimated To Date.</span></td>
																</tr>
																<tr>
																	<td>2</td>
																	<td>Formation Of Road, Footpath<input type="hidden" name="typeOfWork"
																		value="Formation Of Road, Footpath" /></td>
																	<td><label class="radio-inline"
																		for="inline-radio1"><input type="radio" id="isApplicable_1" schcount="1" onclick="showEstDate(this);"
																			name="isApplicable_1" value="Yes"
																			class="requiredValFld">Yes <span class='requiredValFldMsg'>Please select yes/No.</span> </label> <label class="radio-inline"
																		for="inline-radio2"><input type="radio" id="isApplicable_1" schcount="1" onclick="hideEstDate(this);"
																			name="isApplicable_1" value="No"
																			class="requiredValFld">No <span class='requiredValFldMsg'>Please select yes/No.</span> </label></td>
																	<td><input type="date" name="estimatedFrmDate" id="estimatedFrmDate_1"
																		class="form-control"> <span class='requiredValFldMsg'>Please Enter Estimated From Date.</span></td>
																	<td><input type="date" name="estimatedToDate" id="estimatedToDate_1"
																		class="form-control"> <span class='requiredValFldMsg'>Please Enter Estimated To Date.</span></td>
																</tr>
																<tr>
																	<td>3</td>
																	<td>Construction Of WaterSupply Infrastucture<input type="hidden" name="typeOfWork"
																		value="Construction Of WaterSupply Infrastucture" /></td>
																	<td><label class="radio-inline"
																		for="inline-radio1"><input type="radio" id="isApplicable_2" schcount="2" onclick="showEstDate(this);"
																			name="isApplicable_2" value="Yes"
																			class="requiredValFld">Yes <span class='requiredValFldMsg'>Please select yes/No.</span> </label> <label class="radio-inline"
																		for="inline-radio"><input type="radio" id="isApplicable_2" schcount="2" onclick="hideEstDate(this);"
																			name="isApplicable_2" value="No"
																			class="requiredValFld">No <span class='requiredValFldMsg'>Please select yes/No.</span> </label></td>
																	<td><input type="date" name="estimatedFrmDate" id="estimatedFrmDate_2"
																		class="form-control"> <span class='requiredValFldMsg'> Please Enter Estimated From Date.</span></td>
																	<td><input type="date" name="estimatedToDate" id="estimatedToDate_2"
																		class="form-control"> <span class='requiredValFldMsg'>Please Enter Estimated To Date.</span></td>
																</tr>

																<tr>
																	<td>4</td>
																	<td>Construction Of Sewage System Infrastucture<input type="hidden" name="typeOfWork"
																		value="Construction Of Sewage System Infrastucture" /></td>
																	<td><label class="radio-inline"
																		for="inline-radio1"><input type="radio" id="isApplicable_3" schcount="3" onclick="showEstDate(this);"
																			name="isApplicable_3" value="Yes"
																			class="requiredValFld">Yes <span class='requiredValFldMsg'>Please select yes/No.</span> </label> <label class="radio-inline"
																		for="inline-radio"><input type="radio" id="isApplicable_3" schcount="3" onclick="hideEstDate(this);"
																			name="isApplicable_3" value="No"
																			class="requiredValFld">No <span class='requiredValFldMsg'> Please select yes/No.</span> </label></td>
																	<td><input type="date" name="estimatedFrmDate" id="estimatedFrmDate_3"
																		class="form-control"> <span class='requiredValFldMsg'> Please Enter Estimated From Date.</span></td>
																	<td><input type="date" name="estimatedToDate" id="estimatedToDate_3"
																		class="form-control"> <span class='requiredValFldMsg'>Please Enter Estimated To Date.</span></td>
																</tr>
																<tr>
																	<td>5</td>
																	<td>Power Supply Work(Tansformer And Substation)<input type="hidden" name="typeOfWork"
																		value="Power Supply Work(Tansformer And Substation)" /></td>
																	<td><label class="radio-inline"
																		for="inline-radio1"><input type="radio" id="isApplicable_4" schcount="4" onclick="showEstDate(this);"
																			name="isApplicable_4" value="Yes"
																			class="requiredValFld">Yes <span class='requiredValFldMsg'>Please select yes/No.</span> </label> <label class="radio-inline"
																		for="inline-radio"><input type="radio" id="isApplicable_4" schcount="4" onclick="hideEstDate(this);"
																			name="isApplicable_4" value="No"
																			class="requiredValFld">No <span class='requiredValFldMsg'>Please select yes/No.</span> </label></td>
																	<td><input type="date" name="estimatedFrmDate" id="estimatedFrmDate_4"
																		class="form-control"> <span class='requiredValFldMsg'>Please Enter Estimated From Date.</span></td>
																	<td><input type="date" name="estimatedToDate" id="estimatedToDate_4"
																		class="form-control"> <span class='requiredValFldMsg'> Please Enter Estimated To Date.</span></td>
																</tr>
																<tr>
																	<td>6</td>
																	<td>Construction Of Storm Water Drainage<input type="hidden" name="typeOfWork"
																		value="Construction Of Storm Water Drainage" /></td>
																	<td><label class="radio-inline"
																		for="inline-radio1"><input type="radio" id="isApplicable_5" schcount="5" onclick="showEstDate(this);"
																			name="isApplicable_5" value="Yes"
																			class="requiredValFld">Yes <span class='requiredValFldMsg'>Please select yes/No.</span> </label> <label class="radio-inline"
																		for="inline-radio"><input type="radio" id="isApplicable_5" schcount="5" onclick="hideEstDate(this);"
																			name="isApplicable_5" value="No"
																			class="requiredValFld">No <span class='requiredValFldMsg'> Please select yes/No.</span> </label></td>
																	<td><input type="date" name="estimatedFrmDate" id="estimatedFrmDate_5"
																		class="form-control"> <span class='requiredValFldMsg'> Please Enter Estimated From Date.</span></td>
																	<td><input type="date" name="estimatedToDate" id="estimatedToDate_5"
																		class="form-control"> <span class='requiredValFldMsg'> Please Enter Estimated To Date.</span></td>
																</tr>
																<tr>
																	<td>7</td>
																	<td>Solid Waste Management and Disposal<input type="hidden" name="typeOfWork"
																		value="Solid Waste Management and Disposal" /></td>
																	<td><label class="radio-inline"
																		for="inline-radio1"><input type="radio" id="isApplicable_6" schcount="6" onclick="showEstDate(this);"
																			name="isApplicable_6" value="Yes"
																			class="requiredValFld">Yes <span class='requiredValFldMsg'>Please select yes/No.</span> </label> <label class="radio-inline"
																		for="inline-radio"><input type="radio" id="isApplicable_6" schcount="6" onclick="hideEstDate(this);"
																			name="isApplicable_6" value="No"
																			class="requiredValFld">No <span class='requiredValFldMsg'>Please select yes/No.</span> </label></td>
																	<td><input type="date" name="estimatedFrmDate" id="estimatedFrmDate_6"
																		class="form-control"> <span class='requiredValFldMsg'>Please Enter Estimated From Date.</span></td>
																	<td><input type="date" name="estimatedToDate" id="estimatedToDate_6"
																		class="form-control"> <span class='requiredValFldMsg'>Please Enter Estimated To Date.</span></td>
																</tr>
																<tr>
																	<td>8</td>
																	<td>Tree Plantation And LandScape Work<input type="hidden" name="typeOfWork"
																		value="Tree Plantation And LandScape Work" /></td>
																	<td><label class="radio-inline"
																		for="inline-radio1"><input type="radio" id="isApplicable_7" schcount="7" onclick="showEstDate(this);"
																			name="isApplicable_7" value="Yes"
																			class="requiredValFld">Yes <span class='requiredValFldMsg'>Please select yes/No.</span> </label> <label class="radio-inline"
																		for="inline-radio"><input type="radio" id="isApplicable_7" schcount="7" onclick="hideEstDate(this);"
																			name="isApplicable_7" value="No"
																			class="requiredValFld">No <span
																			class='requiredValFldMsg'>Please select yes/No.</span> </label></td>
																	<td><input type="date" name="estimatedFrmDate" id="estimatedFrmDate_7"
																		class="form-control"> <span class='requiredValFldMsg'>Please Enter Estimated From Date.</span></td>
																	<td><input type="date" name="estimatedToDate" id="estimatedToDate_7"
																		class="form-control"> <span class='requiredValFldMsg'>Please Enter Estimated To Date.</span></td>
																</tr>
																<tr>
																	<td>9</td>
																	<td>Street Lighting<input type="hidden" name="typeOfWork"
																		value="Street Lighting" /></td>
																	<td><label class="radio-inline"
																		for="inline-radio1"><input type="radio" id="isApplicable_8" schcount="8" onclick="showEstDate(this);"
																			name="isApplicable_8" value="Yes"
																			class="requiredValFld">Yes <span class='requiredValFldMsg'>Please select yes/No.</span> </label> <label class="radio-inline"
																		for="inline-radio"><input type="radio" id="isApplicable_8" schcount="8" onclick="hideEstDate(this);"
																			name="isApplicable_8" value="No"
																			class="requiredValFld">No <span class='requiredValFldMsg'>Please select yes/No.</span> </label></td>
																	<td><input type="date" name="estimatedFrmDate" id="estimatedFrmDate_8"
																		class="form-control"> <span class='requiredValFldMsg'>Please Enter Estimated From Date.</span></td>
																	<td><input type="date" name="estimatedToDate" id="estimatedToDate_8"
																		class="form-control"> <span class='requiredValFldMsg'>Please Enter Estimated To Date.</span></td>
																</tr>
																<tr>
																	<td>10</td>
																	<td>Other Miscellaneous Work<input type="hidden" name="typeOfWork"
																		value="Other Miscellaneous Work" /></td>
																	<td><label class="radio-inline"
																		for="inline-radio1"><input type="radio" id="isApplicable_9" schcount="9" onclick="showEstDate(this);"
																			name="isApplicable_9" value="Yes"
																			class="requiredValFld">Yes <span class='requiredValFldMsg'>Please select yes/No.</span> </label> <label class="radio-inline"
																		for="inline-radio"><input type="radio" id="isApplicable_9" schcount="9" onclick="hideEstDate(this);"
																			name="isApplicable_9" value="No"
																			class="requiredValFld">No <span class='requiredValFldMsg'>Please select yes/No.</span> </label></td>
																	<td><input type="date" name="estimatedFrmDate" id="estimatedFrmDate_9"
																		class="form-control"> <span class='requiredValFldMsg'>Please Enter Estimated From Date.</span></td>
																	<td><input type="date" name="estimatedToDate" id="estimatedToDate_9"
																		class="form-control"> <span class='requiredValFldMsg'>Please Enter Estimated To Date.</span></td>
																</tr>

															</c:otherwise>

														</c:choose>
													</tbody>

												</table>


												<nav>
													<input type="button"
														class="btn btn-sm btn-success  pull-right" id="plotCivilWorkId"
														value="Save">
													<button type="button"
														class="btn btn-primary btn-sm pull-right btn-add-plotSc">Add
														More</button>

													<!-- <button type="button" class="btn btn-primary btn-sm pull-right btn-add-projsch">Add More</button> -->
													<!--  <a href="landCostDetails"><input type="button" class="btn btn-sm btn-success  pull-right" id="projectScheduleId" value="Save"/></a> -->
													<!-- <button type="button" class="btn btn-warning btn-sm pull-right btn-add-update" onclick="projectScheduleForm()"> Update </button> -->
												</nav>
												<br /> <br />
											</div>
										</div>
									</div>
								</div>
					</form:form>
					
					<!----------------------- Common Areas To be used by the Purchaser ------------------------------------------------------------>
					
					
					<div class="panel-group" id="accordion">
				<div class="panel panel-primary">
					<div class="panel-heading card-header collapsed"
						data-toggle="collapse" data-target="#bar5">
						<i class="fa fa-fw fa-chevron-down"></i> <i
							class="fa fa-fw fa-chevron-right"></i>Common Areas To be used by
						the Purchaser

					</div>
					<div class="panel-body">
						<!-- The inside div eliminates the 'jumping' animation. -->
						<div class="collapse" id="bar5">
							<form:form action="updatePlotScheduleCommonAreasPurchaserDetails"
								method="post" enctype="multipart/form-data"
								class="form-horizontal" id="commonAreasPurchaserDetailsForm"
								modelAttribute="projectRegistrationModel">
								<table
									class="table table-bordered table-striped table-condensed"
									id="plot-common-list">
									<thead>
										<tr>
											<th rowspan="2">Sl No</th>
											<th rowspan="2">Common Areas</th>
											<th rowspan="2">Is Applicable?</th>
									</thead>
									<tbody>
										<%
											int count = -1;
										%>
										<c:choose>
											<c:when
												test="${ not empty projectRegistrationModel.projectDetailsModel.plotScheduleModel.commonAreasPurchaserList}">
												<input type="hidden" name=plotScheduleModelId
													value="${projectRegistrationModel.projectDetailsModel.plotScheduleModel.plotScheduleModelId}" />
													
												<c:forEach
													items="${projectRegistrationModel.projectDetailsModel.plotScheduleModel.commonAreasPurchaserList}"
													var="obj">
													<tr>
													<%++count;%>
														<td><%=count+1%></td>
														<td><input type="hidden"
															name="commonAreasToBeUsedByPurchaserId"
															value="${obj.commonAreasToBeUsedByPurchaserId}" /> <input
															type="text" name="commonArea" value="${obj.commonArea}"
															class="form-control requiredValFld" /> <span
															class='requiredValFldMsg'> Please Enter Common
																Area.</span></td>


														<td><c:choose>
																<c:when test="${obj.isApplicable == 'Yes'}">
																	<div class="col-md-9">
																		<label class="radio-inline" for="isApplicable">
																			<input type="radio" id="isApplicable"
																			name="isApplicable_<%=count%>" value="Yes"
																			class='dynaselectfld requiredValFld'
																			checked="checked">Yes
																		</label> <label class="radio-inline" for="isApplicable">
																			<input type="radio" id="isApplicable"
																			name="isApplicable_<%=count%>" value="No">No
																		</label>
																	</div>
																</c:when>
																<c:otherwise>
																	<div class="col-md-9">
																		<label class="radio-inline" for="isApplicable">
																			<input type="radio" id="inline-radio1"
																			name="isApplicable_<%=count%>" value="Yes">Yes
																		</label> <label class="radio-inline" for="isApplicable">
																			<input type="radio" id="inline-radio2"
																			name="isApplicable_<%=count%>" value="No"
																			checked="checked">No
																		</label>

																	</div>
																</c:otherwise>
															</c:choose></td>


													</tr>
												</c:forEach>
											</c:when>
											<c:otherwise>


												<form:hidden path="projectDetailsModel.projectDetailsId" />
												<input type="hidden" name=plotScheduleModelId
													value="${projectRegistrationModel.projectDetailsModel.plotScheduleModel.plotScheduleModelId}" />
												<tr>

													<td>1</td>
													<td><input type="text" name="commonArea"
														value="Power Backup" class="form-control requiredValFld" />
														<span class='requiredValFldMsg'> Please Enter
															Common Area.</span></td>
													<td><label class="radio-inline" for="inline-radio1"><input
															type="radio" name="isApplicable_0" value="Yes"
															class="requiredValFld">Yes <span
															class='requiredValFldMsg'> Please select yes/No </span> </label>
														<label class="radio-inline" for="inline-radio2"><input
															type="radio" name="isApplicable_0" value="No"
															class="requiredValFld">No <span
															class='requiredValFldMsg'> Please select yes/No </span> </label></td>

												</tr>
												<tr>
													<td>2</td>
													<td><input type="text" name="commonArea"
														value="Smart home automation"
														class="form-control requiredValFld" /> <span
														class='requiredValFldMsg'> Please Enter Common
															Area.</span></td>
													<td><label class="radio-inline" for="inline-radio1"><input
															type="radio" name="isApplicable_1" value="Yes"
															class="requiredValFld">Yes <span
															class='requiredValFldMsg'> Please select yes/No </span> </label>
														<label class="radio-inline" for="inline-radio2"><input
															type="radio" name="isApplicable_1" value="No"
															class="requiredValFld">No <span
															class='requiredValFldMsg'> Please select yes/No </span> </label></td>

												</tr>
												<tr>
													<td>3</td>
													<td><input type="text" name="commonArea"
														value="CCTV surveillance"
														class="form-control requiredValFld" /> <span
														class='requiredValFldMsg'> Please Enter Common
															Area.</span></td>
													<td><label class="radio-inline" for="inline-radio1"><input
															type="radio" name="isApplicable_2" value="Yes"
															class="requiredValFld">Yes <span
															class='requiredValFldMsg'> Please select yes/No </span> </label>
														<label class="radio-inline" for="inline-radio2"><input
															type="radio" name="isApplicable_2" value="No"
															class="requiredValFld">No <span
															class='requiredValFldMsg'> Please select yes/No </span> </label></td>

												</tr>
												<tr>
													<td>4</td>
													<td><input type="text" name="commonArea"
														value="Club House" class="form-control requiredValFld" />
														<span class='requiredValFldMsg'> Please Enter
															Common Area.</span></td>
													<td><label class="radio-inline" for="inline-radio1"><input
															type="radio" name="isApplicable_3" value="Yes"
															class="requiredValFld">Yes <span
															class='requiredValFldMsg'> Please select yes/No </span> </label>
														<label class="radio-inline" for="inline-radio2"><input
															type="radio" name="isApplicable_3" value="No"
															class="requiredValFld">No <span
															class='requiredValFldMsg'> Please select yes/No </span> </label></td>

												</tr>
												<tr>
													<td>5</td>
													<td><input type="text" name="commonArea"
														value="Community Hall" class="form-control requiredValFld" />
														<span class='requiredValFldMsg'> Please Enter
															Common Area.</span></td>
													<td><label class="radio-inline" for="inline-radio1"><input
															type="radio" name="isApplicable_4" value="Yes"
															class="requiredValFld">Yes <span
															class='requiredValFldMsg'> Please select yes/No </span> </label>
														<label class="radio-inline" for="inline-radio2"><input
															type="radio" name="isApplicable_4" value="No"
															class="requiredValFld">No <span
															class='requiredValFldMsg'> Please select yes/No </span> </label></td>

												</tr>

												<tr>
													<td>6</td>
													<td><input type="text" name="commonArea"
														value="Outdoor Sports facility"
														class="form-control requiredValFld" /> <span
														class='requiredValFldMsg'> Please Enter Common
															Area.</span></td>
													<td><label class="radio-inline" for="inline-radio1"><input
															type="radio" name="isApplicable_5" value="Yes"
															class="requiredValFld">Yes <span
															class='requiredValFldMsg'> Please select yes/No </span> </label>
														<label class="radio-inline" for="inline-radio2"><input
															type="radio" name="isApplicable_5" value="No"
															class="requiredValFld">No <span
															class='requiredValFldMsg'> Please select yes/No </span> </label></td>

												</tr>
												<tr>
													<td>7</td>
													<td><input type="text" name="commonArea"
														value="Indoor sports facility"
														class="form-control requiredValFld" /> <span
														class='requiredValFldMsg'> Please Enter Common
															Area.</span></td>
													<td><label class="radio-inline" for="inline-radio1"><input
															type="radio" name="isApplicable_6" value="Yes"
															class="requiredValFld">Yes <span
															class='requiredValFldMsg'> Please select yes/No </span> </label>
														<label class="radio-inline" for="inline-radio2"><input
															type="radio" name="isApplicable_6" value="No"
															class="requiredValFld">No <span
															class='requiredValFldMsg'> Please select yes/No </span> </label></td>

												</tr>
												<tr>
													<td>8</td>
													<td><input type="text" name="commonArea"
														value="Swimming Pools" class="form-control requiredValFld" />
														<span class='requiredValFldMsg'> Please Enter
															Common Area.</span></td>
													<td><label class="radio-inline" for="inline-radio1"><input
															type="radio" name="isApplicable_7" value="Yes"
															class="requiredValFld">Yes <span
															class='requiredValFldMsg'> Please select yes/No </span> </label>
														<label class="radio-inline" for="inline-radio2"><input
															type="radio" name="isApplicable_7" value="No"
															class="requiredValFld">No <span
															class='requiredValFldMsg'> Please select yes/No </span> </label></td>

												</tr>
												<tr>
													<td>9</td>
													<td><input type="text" name="commonArea" value="Gym"
														class="form-control requiredValFld" /> <span
														class='requiredValFldMsg'> Please Enter Common
															Area.</span></td>
													<td><label class="radio-inline" for="inline-radio1"><input
															type="radio" name="isApplicable_8" value="Yes"
															class="requiredValFld">Yes <span
															class='requiredValFldMsg'> Please select yes/No </span> </label>
														<label class="radio-inline" for="inline-radio2"><input
															type="radio" name="isApplicable_8" value="No"
															class="requiredValFld">No <span
															class='requiredValFldMsg'> Please select yes/No </span> </label></td>

												</tr>
												<tr>
													<td>10</td>
													<td><input type="text" name="commonArea" value="Parks"
														class="form-control requiredValFld" /> <span
														class='requiredValFldMsg'> Please Enter Common
															Area.</span></td>
													<td><label class="radio-inline" for="inline-radio1"><input
															type="radio" name="isApplicable_9" value="Yes"
															class="requiredValFld">Yes <span
															class='requiredValFldMsg'> Please select yes/No </span> </label>
														<label class="radio-inline" for="inline-radio2"><input
															type="radio" name="isApplicable_9" value="No"
															class="requiredValFld">No <span
															class='requiredValFldMsg'> Please select yes/No </span> </label></td>

												</tr>
												<tr>
													<td>11</td>
													<td><input type="text" name="commonArea"
														value="Electricity" class="form-control requiredValFld" />
														<span class='requiredValFldMsg'> Please Enter
															Common Area.</span></td>
													<td><label class="radio-inline" for="inline-radio1"><input
															type="radio" name="isApplicable_10" value="Yes"
															class="requiredValFld">Yes <span
															class='requiredValFldMsg'> Please select yes/No </span> </label>
														<label class="radio-inline" for="inline-radio2"><input
															type="radio" name="isApplicable_10" value="No"
															class="requiredValFld">No <span
															class='requiredValFldMsg'> Please select yes/No </span> </label></td>

												</tr>
												<tr>
													<td>12</td>
													<td><input type="text" name="commonArea" value="Gas"
														class="form-control requiredValFld" /> <span
														class='requiredValFldMsg'> Please Enter Common
															Area.</span></td>
													<td><label class="radio-inline" for="inline-radio1"><input
															type="radio" name="isApplicable_11" value="Yes"
															class="requiredValFld">Yes <span
															class='requiredValFldMsg'> Please select yes/No </span> </label>
														<label class="radio-inline" for="inline-radio2"><input
															type="radio" name="isApplicable_11" value="No"
															class="requiredValFld">No <span
															class='requiredValFldMsg'> Please select yes/No </span> </label></td>

												</tr>
												<tr>
													<td>13</td>
													<td><input type="text" name="commonArea"
														value="Water and Sanitation"
														class="form-control requiredValFld" /> <span
														class='requiredValFldMsg'> Please Enter Common
															Area.</span></td>
													<td><label class="radio-inline" for="inline-radio1"><input
															type="radio" name="isApplicable_12" value="Yes"
															class="requiredValFld">Yes <span
															class='requiredValFldMsg'> Please select yes/No </span> </label>
														<label class="radio-inline" for="inline-radio2"><input
															type="radio" name="isApplicable_12" value="No"
															class="requiredValFld">No <span
															class='requiredValFldMsg'> Please select yes/No </span> </label></td>

												</tr>
												<tr>
													<td>14</td>
													<td><input type="text" name="commonArea"
														value="Air conditioning and incarnation"
														class="form-control requiredValFld" /> <span
														class='requiredValFldMsg'> Please Enter Common
															Area.</span></td>
													<td><label class="radio-inline" for="inline-radio1"><input
															type="radio" name="isApplicable_13" value="Yes"
															class="requiredValFld">Yes <span
															class='requiredValFldMsg'> Please select yes/No </span> </label>
														<label class="radio-inline" for="inline-radio2"><input
															type="radio" name="isApplicable_13" value="No"
															class="requiredValFld">No <span
															class='requiredValFldMsg'> Please select yes/No </span> </label></td>

												</tr>
											</c:otherwise>
										</c:choose>
									</tbody>
								</table>
								<nav>

									<input type="button" class="btn btn-sm btn-success  pull-right"
										id="PurchaserDetailsId" value="Save" />
										<button type="button"
														class="btn btn-primary btn-sm pull-right btn-add-plotcommon">Add
														More</button>
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
<br/>

<!----------------------- Common Areas To be Relinquished to local Authority /Planning Authority------------------------------------------------------------>

					<div class="panel-group" id="accordion">
						<div class="panel panel-primary">
							<div class="panel-heading card-header collapsed"
								data-toggle="collapse" data-target="#bar4">
								<i class="fa fa-fw fa-chevron-down"></i> <i
									class="fa fa-fw fa-chevron-right"></i>Common Areas To be
								Relinquished to local Authority /Planning Authority

							</div>
							<div class="panel-body">
								<!-- The inside div eliminates the 'jumping' animation. -->
								<div class="collapse" id="bar4">
									<form:form
										action="updatePlotScheduleCommonAreasAuthorityDetails"
										method="post" enctype="multipart/form-data"
										class="form-horizontal" id="commonAreasAuthorityForm"
										modelAttribute="projectRegistrationModel">

										<div class="add-more"
											style="border-style: ridge; padding: 20px; background-color: #F8F8F8;">
											<p style="text-align: center">
												<font>Public and Semi Public Sites</font>
											</p>

											<c:choose>
												<c:when
													test="${ not empty projectRegistrationModel.projectDetailsModel.plotScheduleModel.plotsCommonAreaRelinquisedAuthorityModel}">
													<form:hidden
														path="projectDetailsModel.plotScheduleModel.plotScheduleModelId" />
													<div class="add-more"
														style="border-style: ridge; padding: 20px; background-color: #F8F8F8;">
													<div class="form-group row">
														<label class="col-md-3 form-control-label"
															for="noOfPublicOrSemiPubSites">No. of Public and semi Public Sites </label>
														<div class="col-md-9">
															<input type="number" id="noOfPublicOrSemiPubSites"
																name="noOfPublicOrSemiPubSites"
																value="${projectRegistrationModel.projectDetailsModel.plotScheduleModel.plotsCommonAreaRelinquisedAuthorityModel.noOfPublicOrSemiPubSites}"
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
															<input type="number" id="totAreaOfPublicOrSemiPubSites"
																name="totAreaOfPublicOrSemiPubSites"
																value="${projectRegistrationModel.projectDetailsModel.plotScheduleModel.plotsCommonAreaRelinquisedAuthorityModel.totAreaOfPublicOrSemiPubSites}"
																class="form-control requiredValFld"
																placeholder="Only digits are allowed"> <span
																class='requiredValFldMsg'> Please Enter Area of
																site</span>
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
																<input type="number" id="totNoOfParkAndOpenSpace"
																	name="totNoOfParkAndOpenSpace"
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
															<input type="number" id="totAreaOfParkAndOpenSpace"
																name="totAreaOfParkAndOpenSpace"
																value="${projectRegistrationModel.projectDetailsModel.plotScheduleModel.plotsCommonAreaRelinquisedAuthorityModel.totAreaOfParkAndOpenSpace}"
																class="form-control requiredValFld"
																placeholder="Only digits are allowed"> <span
																class='requiredValFldMsg'> Please Enter Area of
																site</span>
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
																<input type="number" id="totAreaOfRoad"
																	name="totAreaOfRoad"
																	value="${projectRegistrationModel.projectDetailsModel.plotScheduleModel.plotsCommonAreaRelinquisedAuthorityModel.totAreaOfRoad}"
																	class="form-control requiredValFld"
																	placeholder="Only digits are allowed"> <span
																	class='requiredValFldMsg'> Please Enter Area of
																	site</span>
															</div>
														</div>
													</div>

												</c:when>

												<c:otherwise>


														<div class="add-more"
														style="border-style: ridge; padding: 20px; background-color: #F8F8F8;">
													<div class="form-group row">
														<label class="col-md-3 form-control-label"
															for="noOfPublicOrSemiPubSites">No. of Public and
															Semi Pubic Sites </label>
														<div class="col-md-9">
															<input type="number" id="noOfPublicOrSemiPubSites"
																name="noOfPublicOrSemiPubSites"
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
															<input type="number" id="totAreaOfPublicOrSemiPubSites"
																name="totAreaOfPublicOrSemiPubSites"
																class="form-control requiredValFld"
																placeholder="Only digits are allowed"> <span
																class='requiredValFldMsg'> Please Enter Area of
																site</span>
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
																<input type="number" id="totNoOfParkAndOpenSpace"
																	name="totNoOfParkAndOpenSpace"
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
															<input type="number" id="totAreaOfParkAndOpenSpace"
																name="totAreaOfParkAndOpenSpace"
																class="form-control requiredValFld"
																placeholder="Only digits are allowed"> <span
																class='requiredValFldMsg'> Please Enter Area of
																site</span>
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
																<input type="number" id="totAreaOfRoad"
																	name="totAreaOfRoad"
																	class="form-control requiredValFld"
																	placeholder="Only digits are allowed"> <span
																	class='requiredValFldMsg'> Please Enter Area of
																	site</span>
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
													id="commonAuthorityId" value="Save" />
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
			
		</div>
		</div>
	
	<!--/col--> <!-- /.conainer-fluid --> </main>


</body>

</html>









