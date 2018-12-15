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
<meta name="author" content="Łukasz Holeczek">
<meta name="keyword"
	content="Bootstrap,Admin,Template,Open,Source,AngularJS,Angular,Angular2,jQuery,CSS,HTML,RWD,Dashboard">
<link rel="shortcut icon"
	href="../resources/postprojregistration/img/favicon.png">

<title>Quaterly Updatde</title>


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
} */

/* #modificationdetails {
	display: none;
}

#moremodificationdetails {
	display: none;
} 

#associationdetails {
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
<!-- <script>
	$(document.body).on('click', '.btn-remove-civilwork', function() {
		$(this).closest('tr').remove();
	});
</script> -->

<!-- BODY options, add following classes to body to change options
            1. 'compact-nav'     	  - Switch sidebar to minified version (width 50px)
            2. 'sidebar-nav'		  - Navigation on the left
                2.1. 'sidebar-off-canvas'	- Off-Canvas
                    2.1.1 'sidebar-off-canvas-push'	- Off-Canvas which move content
                    2.1.2 'sidebar-off-canvas-with-shadow'	- Add shadow to body elements
            3. 'fixed-nav'			  - Fixed navigation
            4. 'navbar-fixed'		  - Fixed navbarRa
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
				src="<%=request.getContextPath()%>/resources/postprojregistration/img/avatars/user-top-icon.jpg"
				class="img-avatar" alt="Avatar">
			<div>
				<strong><%=user.getUserName()%></strong>
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
						<i class="fa fa-align-justify"></i> Quarterly Update : Registration Number -
						${projectRegistrationModel.projectRegistrationNo}
					</div>
					<div class="card-block">
						<div class="container">


						
					<!------------------------------Building details  ------------------------------->
				<%-- 	<div class="panel-group" id="accordion">
									<div class="panel panel-primary">
										<div class="panel-heading card-header collapsed"
											data-toggle="collapse"
											data-target="#bar_tower">
											<i class="fa fa-fw fa-chevron-down"></i> <i
												class="fa fa-fw fa-chevron-right"></i> Status of
											<b>Construction of Towers</b>
										</div>
										<div class="panel-body">
					<div class="collapse" id="bar_tower">
					<c:choose>
					
					<c:when test="${not empty TowerList}"> --%>
					
					<% int buildCount = 0; %>
							<c:forEach items="${TowerList}"	var="tower">
								<div class="panel-group" id="accordion">
									<div class="panel panel-primary">
										<div class="panel-heading card-header collapsed"
											data-toggle="collapse"
											data-target="#bar_${tower.towerDetailsId}">
											<i class="fa fa-fw fa-chevron-down"></i> <i
												class="fa fa-fw fa-chevron-right"></i> Status of
											Construction of Tower Name - <b>${tower.towerName}</b>
										</div>
										<div class="panel-body">
											<!-- The inside div eliminates the 'jumping' animation. -->
											<div class="collapse" id="bar_${tower.towerDetailsId}">
												<form:form action="updateBuildingDetails" method="post"
													enctype="multipart/form-data" class="form-horizontal"
													id="buildingForm_${ projectRegistrationModel.projectDetailsModel.towerDetailsList.size()-1}"
													modelAttribute="projectRegistrationModel">
													<div class="form-group row"></div>


													<div class="add-more"
														style="border-style: ridge; padding: 20px; background-color: #F8F8F8;">
														<%-- 	<c:choose>
													<c:when test="${ empty quarter.buildingDetails}"> --%>
													<input type="hidden" name="towerDetailsId" value="${tower.towerDetailsId}" />
													<input type="hidden" name="blockName" value="${tower.towerName}" />
														<div class="form-group row">
															<label class="col-md-3 form-control-label"
																for="percentageOfCompletion">Percentage of
																Completion </label>
															<div class="col-md-9">
																<input type="text" id="percentageOfCompletion"
																	name="percentageOfCompletion" maxlength="3"
																	class="form-control requiredValFld" placeholder="">
																<span class='requiredValFldMsg'> Please Enter Percentage of Completion </span>
															</div>
														</div>

														<div class="form-group row">
															<label class="col-md-3 form-control-label "
																for="photograph">photograph</label>
															<div class="col-md-9">
																<input type="file" name="photograph" class="requiredValFld"
																	title="Only image or pdf file is allowed. file size upto 1 MB">
																	<span class='requiredValFldMsg'> Please upload photograph</span>

															</div>
														</div>
														
														<div class="form-group row">
															<label class="col-md-2 form-control-label"
																for="photograph">Total No of Parking</label>
															<div class="col-md-2">
																<input type="number" readOnly name="totNoOfParking" id="totNoOfParking" value="${tower.totNoOfParking}"
																	title="Only image or pdf file is allowed. file size upto 1 MB">

															</div>
															<label class="col-md-2 form-control-label"
																for="noOfParkingBooked">No Of parking Booked</label>
															<div class="col-md-2">
																<input type="number" name="noOfParkingBooked" class="requiredValFld"  id="noOfParkingBooked"
																	title="Only image or pdf file is allowed. file size upto 1 MB">
																	<span class='requiredValFldMsg'> Please Enter Number of Booked Parking slots</span>

															</div>
															<label class="col-md-2 form-control-label"
																for="noOfParkingAvail">No Of parking Available</label>
															<div class="col-md-2">
																<input type="number" name="noOfParkingAvail" class="requiredValFld" id="noOfParkingAvail"
																	title="Only image or pdf file is allowed. file size upto 1 MB">
																	<span class='requiredValFldMsg'> Please Enter Number of Available Parking slots</span>
															</div>
														</div>

														<div class="add-more"
															style="border-style: ridge; padding: 20px; background-color: #F8F8F8;">
															<div>
																<h5>Floor Details</h5>
															</div>
															<table
																class="table table-bordered table-striped table-condensed"
																id="sche-list">
																<thead>
																	<tr>
																		<th rowspan="2">Floor No</th>
																		<th rowspan="2">Percentage Of Completion</th>
																	</tr>
																</thead>
																<tbody>
																	<c:forEach items="${tower.floorDetailsList}"
																		var="floor">
																		<tr>
																			<td><input type="text" name="floorNo"
																				value="${floor.floorNo }" readOnly /></td>
																			<td><input type="text"
																				name="percentageOfCompletionFloor" class="requiredValFld" maxlength="3" value="" />
																				<span class='requiredValFldMsg'> Please Enter Percentage of completion</span></td>
																				
																		</tr>
																	</c:forEach>
																</tbody>
															</table>
														</div>


														<div class="form-group row"></div>
														<!-- ----------------------------------------------------------------------------- -->
														<div class="add-more"
															style="border-style: ridge; padding: 20px; background-color: #F8F8F8;">
															<div>
																<h5>Apartment Details</h5>
															</div>
															<table
																class="table table-bordered table-striped table-condensed"
																id="sche-list">
																<thead>
																	<tr>
																		<th rowspan="2">Apartment type</th>
																		<th rowspan="2">Total No Of Apartment</th>
																		<th rowspan="2">Total Apartment Booked</th>
																		<th rowspan="2">Total Apartment Available</th>
																	</tr>
																</thead>
																<tbody>
																	<c:forEach items="${mapList}" var="apartment">
																		<c:forEach items="${apartment}" var="obj">
																	<c:if test="${obj.key == tower.towerDetailsId }">
																	<%int count=-1;%>
																	<c:forEach items="${obj.value}" var="unitDetaisObj">
																	<%count++; %>
																		<tr>
																		<td><input type="text" name="apartmentType" readOnly value="${unitDetaisObj.key}" /></td>
																		<td><input type="text" id="totalApartments_${tower.towerDetailsId}_<%=count%>" name="totNoOfApartment"
																				readOnly value="${unitDetaisObj.value}" /></td>
															            <td><input type="text" id="bookedApartments_${tower.towerDetailsId}_<%=count%>" bookedCount='${tower.towerDetailsId}_<%=count%>' class="requiredValFld" onclick="calcualteAvblApartments(this)" onKeyUp="calcualteAvblApartments(this)" name="noOfApartmentsBooked" />
															            <span class='requiredValFldMsg'> Please Enter Booked Appartments</span></td>
																		<td><input readOnly type="text" id="availableApartments_${tower.towerDetailsId}_<%=count%>" name="noOfApartmentsRemained" /></td>
																		</tr>
															        </c:forEach>
																	</c:if>
																		</c:forEach>
																		
																	</c:forEach>
  
																</tbody>
															</table>
														</div>
														<br />
														<p style="text-align: right">
															<font color="red">* Once data saved cannot be
																edited</font>
														</p>
														<br />
														
													</div>
													<p style="color: red;">The Tower Details entered can be viewed in Quarterly Saved Tower Details</p>
													<div class="form-group row">
														<input type="submit"
															class="btn btn-sm btn-primary  pull-right"
															id="buildingId_${ projectRegistrationModel.projectDetailsModel.towerDetailsList.size()-1}"
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
							</c:forEach>
							<%-- </c:when>
					<c:otherwise>
					 <div class="add-more" style="border-style: ridge; padding: 20px; background-color: #D3D3D3;">
					Note : It's Manadatory to download the excel sheet and fill the unit wise details under building Details section to update Every Quarter</div>
					</c:otherwise>
					</c:choose>	
					</div>
					</div>
					</div>
					</div> --%>				

					<!------------------------------Saved Building details  ------------------------------->
							<c:if test="${not empty quarter.buildingDetails}">
								<div class="panel-group" id="accordion">
									<div class="panel panel-primary">
										<div class="panel-heading card-header collapsed"
											data-toggle="collapse" data-target="#bar_quarterTower">
											<i class="fa fa-fw fa-chevron-down"></i> <i
												class="fa fa-fw fa-chevron-right"></i><b>Quarterly Saved Tower Details </b>
										</div>
										
										<div class="panel-body">
											<div class="collapse" id="bar_quarterTower">
												<c:forEach items="${quarter.buildingDetails}"
													var="buildingObj">
													<%-- testttsttst
														<c:if test="${buildingObj.TowerIdRef != tower.towerDetailsId)}">
								<p>${tower.towerName}</p>
								</c:if> --%>
							
													<div class="panel-group" id="accordion">
														<div class="panel panel-primary">
															<div class="panel-heading card-header collapsed"
																data-toggle="collapse"
																data-target="#bar_${buildingObj.buildingDetailsId}">
																<i class="fa fa-fw fa-chevron-down"></i> <i
																	class="fa fa-fw fa-chevron-right"></i> Quarterly Saved
																Tower Details - <b>${buildingObj.blockName}</b>
															</div>
															<div class="panel-body">
																<div class="collapse" id="bar_${buildingObj.buildingDetailsId}">
																	
																	<div class="add-more" style="border-style: ridge; padding: 20px; background-color: #F8F8F8;">
																	<div class="form-group row">
																		<label class="col-md-3 form-control-label"
																			for="percentageOfCompletion">Percentage of
																			Completion </label>
																		<div class="col-md-9">
																			<input type="text" id="percentageOfCompletion"
																				name="percentageOfCompletion" maxlength="3"
																				value="${buildingObj.percentageOfCompletion}"
																				class="form-control requiredValFld" placeholder="">
																			<span class='requiredValFldMsg'> Please Enter
																				Percentage of Completion </span>
																		</div>
																	</div>
 
																	<div class="form-group row">
																		<label class="col-md-3 form-control-label"
																			for="photograph">photograph</label>
																		<div class="col-md-9">
																			<input type="file" name="photograph"
																				title="Only image or pdf file is allowed. file size upto 1 MB">

																		</div>
																	</div>
																	<div class="form-group row">
															<label class="col-md-2 form-control-label"
																for="totNoOfParking">Total No of Parking</label>
															<div class="col-md-2">
																<input type="number" readOnly id="totNoOfParking" name="totNoOfParking" value="${buildingObj.totNoOfParking}"
																	title="Only image or pdf file is allowed. file size upto 1 MB">

															</div>
															<label class="col-md-2 form-control-label"
																for="noOfParkingBooked">No Of parking Booked</label>
															<div class="col-md-2">
																<input type="number" id="noOfParkingBooked" name="noOfParkingBooked" value="${buildingObj.noOfParkingBooked}"
																	title="Only image or pdf file is allowed. file size upto 1 MB">

															</div>
															<label class="col-md-2 form-control-label"
																for="noOfParkingAvail">No Of parking Available</label>
															<div class="col-md-2">
																<input type="number" id="noOfParkingAvail"name="noOfParkingAvail" value="${buildingObj.noOfParkingAvail}"
																	title="Only image or pdf file is allowed. file size upto 1 MB">

															</div>
														</div>
														
																		<div>
																			<h5>Floor Details</h5>
																		</div>
																		<table
																			class="table table-bordered table-striped table-condensed"
																			id="sche-list">
																			<thead>
																				<tr>
																					<th rowspan="2">Floor No</th>
																					<th rowspan="2">Percentage Of Completion</th>
																				</tr>
																			</thead>
																			<tbody>
																				<c:forEach items="${buildingObj.floorDetails}"
																					var="floor">
																					<tr>
																						<td><input type="text" name="floorNo"
																							value="${floor.floorNo }" /></td>
																						<td><input type="text"
																							name="percentageOfCompletionFloor" maxlength="3"
																							value="${floor.percentageOfCompletionFloor}" /></td>
																					</tr>
																				</c:forEach>
																			</tbody>
																		</table>


																	<div class="form-group row"></div>
																	<!-- ----------------------------------------------------------------------------- -->
																		<div>
																			<h5>Apartment Details</h5>
																		</div>
																		<table
																			class="table table-bordered table-striped table-condensed"
																			id="sche-list">
																			<thead>
																				<tr>
																					<th rowspan="2">Apartment type</th>
																				<th rowspan="2">Total No Of Apartment</th>
																					<th rowspan="2">Total Apartment Booked</th>
																					<th rowspan="2">Total Apartment Available</th>
																				</tr>
																			</thead>
																			<tbody>
																				<c:forEach items="${buildingObj.apartmentDetails}"
																					var="apartment">
																					<tr>
																						<td><input type="text" name="apartmentType"
																							value="${apartment.apartmentType }" /></td>
																						<td><input type="text"
																							name="totNoOfApartment"
																							value="${apartment.totNoOfApartment }" /></td>
																						<td><input type="text"
																							name="noOfApartmentsBooked"
																							value="${apartment.noOfApartmentsBooked }" /></td>
																						<td><input type="text"
																							name="noOfApartmentsRemained"
																							value="${apartment.noOfApartmentsRemained }" /></td>
																					</tr>
																				</c:forEach>
																			</tbody>
																		</table>
																	</div>

																	<br />
																	<br />



																</div>
															</div>
														</div>
													</div>
												</c:forEach>




											</div>
										</div>
									</div>
								</div>
							</c:if>

						


						<!------------------------------SubStructure Details  -------------------------------> 
							<div class="panel-group" id="accordion">
								<div class="panel panel-primary">
									<div class="panel-heading card-header collapsed"
										data-toggle="collapse" data-target="#bar">
										<i class="fa fa-fw fa-chevron-down"></i> <i
											class="fa fa-fw fa-chevron-right"></i>Status of Sub Structure

									</div>
									<div class="panel-body">
										<!-- The inside div eliminates the 'jumping' animation. -->
										<div class="collapse" id="bar">
											<form:form action="updateSubStructureWorks" method="post"
												id="quaterSubStructureupdateForm"
												enctype="multipart/form-data" class="form-horizontal"
												modelAttribute="projectRegistrationModel">
												<table class="table table-bordered table-striped table-condensed"
													id="quarter-sub-sche-list">
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


														<%
															int count11 = 0;
														%>
														<c:choose>
															<c:when
																test="${not empty projectRegistrationModel.projectDetailsModel.projectScheduleModel.subStructureList}">
																<form:hidden
																	path="projectDetailsModel.projectScheduleModel.projectScheduleId" />


																<c:choose>
																	<c:when test="${empty quarter.subStructureList}">
																	<%int count=-1; %>
																		<c:forEach items="${projectRegistrationModel.projectDetailsModel.projectScheduleModel.subStructureList}" var="obj">
																			<c:if test="${obj.isApplicable == 'Yes'}">
																			<%++count; %>
																				<tr>
																					<td>
																					<c:out value="${obj.typeOfWork}"></c:out>
																					<input type="hidden" name="projWorkId"
																						value="${obj.subStructureId}" /> <input
																						type="hidden" name="typeOfWork"
																						value="${obj.typeOfWork}"
																						class="form-control requiredValFld" /> <span
																						class='requiredValFldMsg'> Please Enter
																							Type Of Work.</span></td>
																					<td><fmt:formatDate type="date"
																							pattern="yyyy-MM-dd" dateStyle="short"
																							var="formateddate"
																							value="${obj.estimatedFrmDate.time}" /> <input readOnly
																						type="date" name="estimatedFrmDate"
																						value="${formateddate}"
																						class="form-control requiredValFld" /> <span
																						class='requiredValFldMsg'> Please Enter Estimated From Date.</span></td>
																					<td><fmt:formatDate type="date"
																							pattern="yyyy-MM-dd" dateStyle="short"
																							var="formateddate1"
																							value="${obj.estimatedToDate.time}" /> <input readOnly
																						type="date" name="estimatedToDate"
																						value="${formateddate1}"
																						class="form-control requiredValFld" /> <span
																						class='requiredValFldMsg'> Please Enter Estimated To Date </span></td>
																					<td><input type="date" id="subactualFrmDate_<%=count%>"
																						name="actualFrmDate" 
																						class="form-control requiredValFld"
																						placeholder="MM/dd/YYYY"> <span
																						class='requiredValFldMsg'> Please enter Actual From date.</span></td>

																					<td><input type="date" id="subactualToDate_<%=count %>"
																						name="actualToDate"
																						class="form-control requiredValFld"
																						placeholder="MM/dd/YYYY"> <span
																						class='requiredValFldMsg'> Please enter actualToDate.</span></td>
																					<td><input type="button" value="delete"
																						class="btn-remove-civilwork"></td>
																				</tr>
																			</c:if>
																		</c:forEach>
																	</c:when>
																	<c:otherwise>
																		<%-- <input  type="hidden" name="quarterSubStructureId" value="${quarter.subStructureList.quarterSubStructureId}"/> --%>
																		<%int count=-1; %>
																		<c:forEach items="${quarter.subStructureList}" var="obj">
																			<%++count; %>
																			<tr>
																				<td>
																					<%-- <input  type="hidden" name="quarterSubStructureId" value="${obj.quarterSubStructureId}"/> --%>
																					<c:out value="${obj.typeOfWork}"></c:out>
																					<input type="hidden" name="typeOfWork"
																					value="${obj.typeOfWork}"
																					class="form-control requiredValFld" /> <span
																					class='requiredValFldMsg'> Please Enter Type Of Work.</span>
																				</td>
																				<td><fmt:formatDate type="date"
																						pattern="yyyy-MM-dd" dateStyle="short"
																						var="formateddate"
																						value="${obj.estimatedFrmDate.time}" /> <input readOnly
																					type="date" name="estimatedFrmDate"
																					value="${formateddate}"
																					class="form-control requiredValFld" /> <span
																					class='requiredValFldMsg'> Please Enter
																						Estimated From Date.</span></td>
																				<td><fmt:formatDate type="date"
																						pattern="yyyy-MM-dd" dateStyle="short"
																						var="formateddate1"
																						value="${obj.estimatedToDate.time}" /> <input readOnly
																					type="date" name="estimatedToDate"
																					value="${formateddate1}"
																					class="form-control requiredValFld" /> <span
																					class='requiredValFldMsg'> Please Enter Estimated To Date </span></td>
																				<td><fmt:formatDate type="date"
																						pattern="yyyy-MM-dd" dateStyle="short"
																						var="formateddate"
																						value="${obj.actualFrmDate.time}" /> <input
																					type="date" name=actualFrmDate id="subactualFrmDate_<%=count%>"
																					value="${formateddate}"
																					class="form-control requiredValFld" /><span
																					class='requiredValFldMsg'> Please enter Actual From date.</span></td>

																				<td><fmt:formatDate type="date"
																						pattern="yyyy-MM-dd" dateStyle="short"
																						var="formateddate"
																						value="${obj.actualToDate.time}" /> <input
																					type="date" name=actualToDate id="subactualToDate_<%=count%>"
																					value="${formateddate}"
																					class="form-control requiredValFld" /><span
																					class='requiredValFldMsg'> Please enter actualToDate.</span></td>
																				<td><input type="button" value="delete"
																					class="btn-remove-civilwork"></td>
																			</tr>
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
												<div class="form-group row">
													<input type="button"
														class="btn btn-sm btn-success  pull-right"
														id="quaterSubStructureupdateId" value="Save" />
													<!-- <button type="reset" class="btn btn-sm btn-danger pull-right">	<i class="fa fa-ban"></i> Reset	</button> -->
												</div>
											</form:form>
										</div>
									</div>
								</div>
							</div>



							<!---------------------------------------- Sup structure ---------------------------------------------- -->
							<div class="panel-group" id="accordion">
								<div class="panel panel-primary">
									<div class="panel-heading card-header collapsed"
										data-toggle="collapse" data-target="#bar-sup">
										<i class="fa fa-fw fa-chevron-down"></i> <i
											class="fa fa-fw fa-chevron-right"></i>Status of Super
										Structure

									</div>
									<div class="panel-body">
										<!-- The inside div eliminates the 'jumping' animation. -->
										<div class="collapse" id="bar-sup">
											<form:form action="updateSuperStructureWorks" method="post"
												id="quaterSupStructureupdateForm"
												enctype="multipart/form-data" class="form-horizontal"
												modelAttribute="projectRegistrationModel">
												<table
													class="table table-bordered table-striped table-condensed"
													id="quarter-sup-sche-list">
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


														<% int count11 = 0;%>
														<c:choose>
															<c:when
																test="${not empty projectRegistrationModel.projectDetailsModel.projectScheduleModel.supStructureList}">
																<form:hidden
																	path="projectDetailsModel.projectScheduleModel.projectScheduleId" />
																<c:choose>
																	<c:when test="${empty quarter.superStructureList}">
																		<%int count=-1; %>
																		<c:forEach
																			items="${projectRegistrationModel.projectDetailsModel.projectScheduleModel.supStructureList}"
																			var="obj">
																			<c:if test="${obj.isApplicable == 'Yes'}">
																			<%++count; %>
																				<tr>
																					<td>
																					<c:out value="${obj.typeOfWork}"></c:out>
																					<input type="hidden" name="projWorkId"
																						value="${obj.supStructureId}" /> <input
																						type="hidden" name="typeOfWork"
																						value="${obj.typeOfWork}"
																						class="form-control requiredValFld" /> <span
																						class='requiredValFldMsg'> Please Enter Type Of Work.</span></td>
																					<td><fmt:formatDate type="date"
																							pattern="yyyy-MM-dd" dateStyle="short"
																							var="formateddate"
																							value="${obj.estimatedFrmDate.time}" /> <input readOnly
																						type="date" name="estimatedFrmDate"
																						value="${formateddate}"
																						class="form-control requiredValFld" /> <span
																						class='requiredValFldMsg'> Please Enter Estimated From Date.</span></td>
																					<td><fmt:formatDate type="date"
																							pattern="yyyy-MM-dd" dateStyle="short"
																							var="formateddate1"
																							value="${obj.estimatedToDate.time}" /> <input readOnly
																						type="date" name="estimatedToDate"
																						value="${formateddate1}"
																						class="form-control requiredValFld" /> <span
																						class='requiredValFldMsg'> Please Enter Estimated To Date </span></td>
																					<td><input type="date" id="supactualFrmDate_<%=count%>"
																						name="actualFrmDate"
																						class="form-control requiredValFld"
																						placeholder="MM/dd/YYYY"> <span
																						class='requiredValFldMsg'> Please enter Actual From date.</span></td>

																					<td><input type="date" id="supactualToDate_<%=count%>"
																						name="actualToDate"
																						class="form-control requiredValFld"
																						placeholder="MM/dd/YYYY"> <span
																						class='requiredValFldMsg'> Please enter actualToDate.</span></td>
																					<td><input type="button" value="delete"
																						class="btn-remove-civilwork"></td>
																				</tr>
																			</c:if>
																		</c:forEach>
																	</c:when>
																	<c:otherwise>
																		<%-- <input  type="hidden" name="quarterSupStructureId" value="${quarter.superStructureList.quarterSupStructureId}"/> --%>
																		<%int count=-1; %>
																		<c:forEach items="${quarter.superStructureList}"
																			var="obj">
																			<%++count; %>
																			<tr>
																				<td>
																				<c:out value="${obj.typeOfWork}"></c:out>
																				<input type="hidden" name="projWorkId"
																					value="${obj.supStructureId}" /> <input type="hidden"
																					name="typeOfWork" value="${obj.typeOfWork}"
																					class="form-control requiredValFld" /> <span
																					class='requiredValFldMsg'> Please Enter Type
																						Of Work.</span></td>
																				<td><fmt:formatDate type="date"
																						pattern="yyyy-MM-dd" dateStyle="short"
																						var="formateddate"
																						value="${obj.estimatedFrmDate.time}" /> <input readOnly
																					type="date" name="estimatedFrmDate"
																					value="${formateddate}"
																					class="form-control requiredValFld" /> <span
																					class='requiredValFldMsg'> Please Enter
																						Estimated From Date.</span></td>
																				<td><fmt:formatDate type="date"
																						pattern="yyyy-MM-dd" dateStyle="short"
																						var="formateddate1"
																						value="${obj.estimatedToDate.time}" /> <input readOnly
																					type="date" name="estimatedToDate"
																					value="${formateddate1}"
																					class="form-control requiredValFld" /> <span
																					class='requiredValFldMsg'> Please Enter Estimated To Date </span></td>
																				<td><fmt:formatDate type="date"
																						pattern="yyyy-MM-dd" dateStyle="short"
																						var="formateddate"
																						value="${obj.actualFrmDate.time}" /> <input
																					type="date" name=actualFrmDate id="supactualFrmDate_<%=count%>"
																					value="${formateddate}"
																					class="form-control requiredValFld" /><span
																					class='requiredValFldMsg'> Please enter Actual From date.</span></td>

																				<td><fmt:formatDate type="date"
																						pattern="yyyy-MM-dd" dateStyle="short"
																						var="formateddate"
																						value="${obj.actualToDate.time}" /> <input
																					type="date" name=actualToDate id="supactualToDate_<%=count%>"
																					value="${formateddate}"
																					class="form-control requiredValFld" /><span
																					class='requiredValFldMsg'> Please enter actualToDate.</span></td>
																				<td><input type="button" value="delete"
																					class="btn-remove-civilwork"></td>
																			</tr>
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
												<div class="form-group row">
													<input type="button"
														class="btn btn-sm btn-success  pull-right"
														id="quaterSupStructureupdateId" value="Save" />
													<!-- <button type="reset" class="btn btn-sm btn-danger pull-right">	<i class="fa fa-ban"></i> Reset	</button> -->
												</div>
											</form:form>
										</div>
									</div>
								</div>
							</div>


							<!---------------------------------------- Masonry Works---------------------------------------------- -->
							<%-- <div class="panel-group" id="accordion">
								<div class="panel panel-primary">
									<div class="panel-heading card-header collapsed"
										data-toggle="collapse" data-target="#bar-mas">
										<i class="fa fa-fw fa-chevron-down"></i> <i
											class="fa fa-fw fa-chevron-right"></i> Status of Masonry
										Works

									</div>
									<div class="panel-body">
										<!-- The inside div eliminates the 'jumping' animation. -->
										<div class="collapse" id="bar-mas">
											<form:form action="updatequarterMasonryDetails" method="post"
												id="quaterupdateForm" enctype="multipart/form-data"
												class="form-horizontal"
												modelAttribute="projectRegistrationModel">
												<table
													class="table table-bordered table-striped table-condensed"
													id="quarter-masonry-sche-list">
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
															<c:when
																test="${not empty projectRegistrationModel.projectDetailsModel.projectScheduleModel.masonryList}">
																<form:hidden
																	path="projectDetailsModel.projectScheduleModel.projectScheduleId" />
																<c:choose>
																	<c:when test="${empty quarter.masonryList}">
																	
																		<%int count=-1; %>
																		<c:forEach
																			items="${projectRegistrationModel.projectDetailsModel.projectScheduleModel.masonryList}"
																			var="obj">
																			<c:if test="${obj.isApplicable == 'Yes'}">
																			<%++count; %>
																				<tr>
																					<td><input type="hidden" name="masnoryId"
																						value="${obj.masnoryId}" /> <input type="text"
																						name="typeOfWork" value="${obj.typeOfWork}"
																						class="form-control requiredValFld" /> <span
																						class='requiredValFldMsg'> Please Enter
																							Type Of Work.</span></td>
																					<td><fmt:formatDate type="date"
																							pattern="yyyy-MM-dd" dateStyle="short"
																							var="formateddate"
																							value="${obj.estimatedFrmDate.time}" /> <input readOnly
																						type="date" name="estimatedFrmDate"
																						value="${formateddate}"
																						class="form-control requiredValFld" /> <span
																						class='requiredValFldMsg'> Please Enter
																							Estimated From Date.</span></td>
																					<td><fmt:formatDate type="date"
																							pattern="yyyy-MM-dd" dateStyle="short"
																							var="formateddate1"
																							value="${obj.estimatedToDate.time}" /> <input readOnly
																						type="date" name="estimatedToDate"
																						value="${formateddate1}"
																						class="form-control requiredValFld" /> <span
																						class='requiredValFldMsg'> Please Enter
																							Estimated To Date </span></td>
																					<td><input type="date" id="masactualFrmDate_<%=count%>"
																						name="actualFrmDate"
																						class="form-control requiredValFld"
																						placeholder="MM/dd/YYYY"> <span
																						class='requiredValFldMsg'>  Please enter Actual From date.</span></td>

																					<td><input type="date" id="masactualToDate_<%=count%>"
																						name="actualToDate" 
																						class="form-control requiredValFld"
																						placeholder="MM/dd/YYYY"> <span
																						class='requiredValFldMsg'> Please enter actualToDate.</span></td>
																					<td><input type="button" value="delete"
																						class="btn-remove-civilwork"></td>
																				</tr>
																			</c:if>
																		</c:forEach>
																	</c:when>
																	<c:otherwise>
																	<%int count=-1; %>
																		<c:forEach items="${quarter.masonryList}" var="obj">
																		<%++count; %>
																			<tr>
																				<td><input type="hidden" name="masnoryId"
																					value="${obj.masnoryId}" /> <input type="text"
																					name="typeOfWork" value="${obj.typeOfWork}"
																					class="form-control requiredValFld" /> <span
																					class='requiredValFldMsg'> Please Enter Type
																						Of Work.</span></td>
																				<td><fmt:formatDate type="date"
																						pattern="yyyy-MM-dd" dateStyle="short"
																						var="formateddate"
																						value="${obj.estimatedFrmDate.time}" /> <input readOnly
																					type="date" name="estimatedFrmDate"
																					value="${formateddate}"
																					class="form-control requiredValFld" /> <span
																					class='requiredValFldMsg'> Please Enter
																						Estimated From Date.</span></td>
																				<td><fmt:formatDate type="date"
																						pattern="yyyy-MM-dd" dateStyle="short"
																						var="formateddate1"
																						value="${obj.estimatedToDate.time}" /> <input readOnly
																					type="date" name="estimatedToDate"
																					value="${formateddate1}"
																					class="form-control requiredValFld" /> <span
																					class='requiredValFldMsg'> Please Enter
																						Estimated To Date </span></td>
																				<td><fmt:formatDate type="date"
																						pattern="yyyy-MM-dd" dateStyle="short"
																						var="formateddate2"
																						value="${obj.actualFrmDate.time}" /> <input
																					type="date" name="actualFrmDate" id="masactualFrmDate_<%=count%>"
																					value="${formateddate2}"
																					class="form-control requiredValFld" /> <span
																					class='requiredValFldMsg'> Please Enter Actual From Date.</span></td>
																				<td><fmt:formatDate type="date"
																						pattern="yyyy-MM-dd" dateStyle="short"
																						var="formateddate3"
																						value="${obj.actualToDate.time}" /> <input
																					type="date" name="actualToDate" id="masactualToDate_<%=count%>"
																					value="${formateddate3}"
																					class="form-control requiredValFld" /> <span
																					class='requiredValFldMsg'> Please Enter Actual To Date </span></td>
																				<td><input type="button" value="delete"
																					class="btn-remove-civilwork"></td>
																			</tr>
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
												<div class="form-group row">
													<input type="button"
														class="btn btn-sm btn-success  pull-right"
														id="quaterupdateId" value="Save" />
													<!-- <button type="reset" class="btn btn-sm btn-danger pull-right">	<i class="fa fa-ban"></i> Reset	</button> -->
												</div>
											</form:form>
										</div>
									</div>
								</div>
							</div> --%>

							<!---------------------------------------- finishingOrInteriorWorkList structure ---------------------------------------------- -->
							<div class="panel-group" id="accordion">
								<div class="panel panel-primary">
									<div class="panel-heading card-header collapsed"
										data-toggle="collapse" data-target="#bar-fin">
										<i class="fa fa-fw fa-chevron-down"></i> <i
											class="fa fa-fw fa-chevron-right"></i> Status of Finishing Or
										Interior Structure

									</div>
									<div class="panel-body">
										<!-- The inside div eliminates the 'jumping' animation. -->
										<div class="collapse" id="bar-fin">
											<form:form action="updateQuarterFinInteriorDetails"
												method="post" id="quaterupdatefinInteriorForm"
												enctype="multipart/form-data" class="form-horizontal"
												modelAttribute="projectRegistrationModel">
												<table
													class="table table-bordered table-striped table-condensed"
													id="quarter-finishing-sche-list">
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
															<c:when
																test="${not empty projectRegistrationModel.projectDetailsModel.projectScheduleModel.finishingOrInteriorWorkList}">
																<form:hidden
																	path="projectDetailsModel.projectScheduleModel.projectScheduleId" />
																<c:choose>
																	<c:when
																		test="${empty quarter.finishingOrInteriorWorkList}">
																		<%int count=-1; %>
																		<c:forEach
																			items="${projectRegistrationModel.projectDetailsModel.projectScheduleModel.finishingOrInteriorWorkList}"
																			var="obj">
																			<c:if test="${obj.isApplicable == 'Yes'}">
																			<%++count; %>
																				<tr>
																					<td>
																						<%--      <input  type="hidden" name="finishingInteriorId" value="${obj.finishingInteriorId}"/> --%>
																						<c:out value="${obj.typeOfWork}"></c:out>
																						<input type="hidden" name="typeOfWork"
																						value="${obj.typeOfWork}"
																						class="form-control requiredValFld" /> <span
																						class='requiredValFldMsg'> Please Enter
																							Type Of Work.</span>
																					</td>
																					<td><fmt:formatDate type="date"
																							pattern="yyyy-MM-dd" dateStyle="short"
																							var="formateddate"
																							value="${obj.estimatedFrmDate.time}" /> <input readOnly
																						type="date" name="estimatedFrmDate"
																						value="${formateddate}" readOnly
																						class="form-control requiredValFld" /> <span
																						class='requiredValFldMsg'> Please Enter
																							Estimated From Date.</span></td>
																					<td><fmt:formatDate type="date"
																							pattern="yyyy-MM-dd" dateStyle="short"
																							var="formateddate1"
																							value="${obj.estimatedToDate.time}" /> <input readOnly
																						type="date" name="estimatedToDate"
																						value="${formateddate1}" readOnly
																						class="form-control requiredValFld" /> <span
																						class='requiredValFldMsg'> Please Enter
																							Estimated To Date </span></td>
																					<td><input type="date" id="actualFrmDate_<%=count%>"
																						name="actualFrmDate"
																						class="form-control requiredValFld"
																						placeholder="MM/dd/YYYY"> <span
																						class='requiredValFldMsg'> Please enter Actual From date.</span></td>

																					<td><input type="date" id="actualToDate_<%=count%>"
																						name="actualToDate"
																						class="form-control requiredValFld"
																						placeholder="MM/dd/YYYY"> <span
																						class='requiredValFldMsg'> Please enter actualToDate.</span></td>
																					<td><input type="button" value="delete"
																						class="btn-remove-civilwork"></td>
																				</tr>
																			</c:if>
																		</c:forEach>
																	</c:when>
																	<c:otherwise>
																	<%int count=-1; %>
																		<c:forEach
																			items="${quarter.finishingOrInteriorWorkList}"
																			var="obj">
																			<%++count; %>
																			<tr>
																				<td>
																				<c:out value="${obj.typeOfWork}"></c:out>
																				<input type="hidden"
																					name="finishingInteriorId"
																					value="${obj.finishingInteriorId}" /> <input
																					type="hidden" name="typeOfWork"
																					value="${obj.typeOfWork}"
																					class="form-control requiredValFld" /> <span
																					class='requiredValFldMsg'> Please Enter Type
																						Of Work.</span></td>
																				<td><fmt:formatDate type="date"
																						pattern="yyyy-MM-dd" dateStyle="short"
																						var="formateddate"
																						value="${obj.estimatedFrmDate.time}" /> <input readOnly
																					type="date" name="estimatedFrmDate"
																					value="${formateddate}" readOnly
																					class="form-control requiredValFld" /> <span
																					class='requiredValFldMsg'> Please Enter
																						Estimated From Date.</span></td>
																				<td><fmt:formatDate type="date"
																						pattern="yyyy-MM-dd" dateStyle="short"
																						var="formateddate1"
																						value="${obj.estimatedToDate.time}" /> <input readOnly
																					type="date" name="estimatedToDate"
																					value="${formateddate1}" readOnly
																					class="form-control requiredValFld" /> <span
																					class='requiredValFldMsg'> Please Enter
																						Estimated To Date </span></td>
																				<td><fmt:formatDate type="date"
																						pattern="yyyy-MM-dd" dateStyle="short"
																						var="formateddate"
																						value="${obj.actualFrmDate.time}" /> <input
																					type="date" name="estimatedFrmDate" id="actualFrmDate_<%=count%>"
																					value="${formateddate}"
																					class="form-control requiredValFld" /> <span
																					class='requiredValFldMsg'> Please enter Actual From date.</span></td>
																				<td><fmt:formatDate type="date"
																						pattern="yyyy-MM-dd" dateStyle="short"
																						var="formateddate1"
																						value="${obj.actualToDate.time}" /> <input
																					type="date" name="estimatedToDate" id="actualToDate_<%=count%>"
																					value="${formateddate1}"
																					class="form-control requiredValFld" /> <span
																					class='requiredValFldMsg'> Please enter Actual To date.</span></td>
																				<td><input type="button" value="delete"
																					class="btn-remove-civilwork"></td>
																			</tr>
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
												<div class="form-group row">
													<input type="button"
														class="btn btn-sm btn-success  pull-right"
														id="quaterupdateFinInteriorId" value="Save" />
													<!-- <button type="reset" class="btn btn-sm btn-danger pull-right">	<i class="fa fa-ban"></i> Reset	</button> -->
												</div>
											</form:form>
										</div>
									</div>
								</div>
							</div>

							<!-- ------------------------------------------------------------internal infrastructure -->

							<div class="panel-group" id="accordion">
								<div class="panel panel-primary">
									<div class="panel-heading card-header collapsed"
										data-toggle="collapse" data-target="#bar7">
										<i class="fa fa-fw fa-chevron-down"></i> <i
											class="fa fa-fw fa-chevron-right"></i> Status of Construction
										of Internal Infrastructure
									</div>
									<div class="panel-body">
										<!-- The inside div eliminates the 'jumping' animation. -->
										<div class="collapse" id="bar7">
											<form:form action="updateInfrastructureDetails" method="post"
												enctype="multipart/form-data" class="form-horizontal"
												id="infrastructureForm"
												modelAttribute="projectRegistrationModel">
												<table
													class="table table-bordered table-striped table-condensed">
													<thead>
														<tr>
															<th colspan="3">Internal Infrastructure Details</th>
														</tr>
														<tr>
															<th>SlNo.</th>
															<th>Name</th>
															<th>Percentage of Completion</th>
															<!--  <th>Photograph </th> -->
														</tr>
													</thead>
													<tbody>
														<c:choose>
															<c:when
																test="${not empty projectRegistrationModel.projectDetailsModel.projectScheduleModel.internalInfraList}">
																<form:hidden
																	path="projectDetailsModel.projectScheduleModel.projectScheduleId" />
																<c:choose>
																	<c:when test="${empty quarter.infrastructureDetails }">
																		<%
																			int internalCount = 0;
																		%>
																		<c:forEach
																			items="${projectRegistrationModel.projectDetailsModel.projectScheduleModel.internalInfraList}"
																			var="obj">
																			<c:if test="${obj.isApplicable == 'Yes'}">
																				<tr>
																					<td><%=++internalCount%></td>
																					<td>
																					<c:out value="${obj.infrastructureName}"></c:out>
																					<input type="hidden"
																						name="infrastructureName"
																						value="${obj.infrastructureName}"
																						class="form-control requiredValFld" /> <span
																						class='requiredValFldMsg'> Please Enter
																							Type Of Work.</span></td>
																					<td><input type="number"
																						name="percentageOfCompletion" value="" maxlength="3"
																						class="requiredValFld"> <span
																						class='requiredValFldMsg'> Please Enter
																							Estimated From Date.</span></td>

																					<!-- <td><input type="button" value="delete" class="btn-remove-civilwork"></td> -->
																				</tr>
																			</c:if>
																		</c:forEach>
																	</c:when>
																	<c:otherwise>
																		<%
																			int internalCount = 0;
																		%>
																		<c:forEach items="${quarter.infrastructureDetails}" var="obj">
																			<tr>
																				<td><%=++internalCount%></td>
																				<td>
																				<c:out value="${obj.infrastructureName}"></c:out>
																				<input type="hidden"
																					name="infrastructureId"
																					value="${obj.infrastructureId}" /> <input
																					type="hidden" name="infrastructureName"
																					value="${obj.infrastructureName}"
																					class="form-control requiredValFld" /> <span
																					class='requiredValFldMsg'> Please Enter Type
																						Of Work.</span></td>
																				<td><input type="number"
																					name="percentageOfCompletion" maxlength="3"
																					value="${obj.percentageOfCompletion}"
																					class="requiredValFld"> <span
																					class='requiredValFldMsg'> Please Enter
																						Estimated From Date.</span></td>
																				<!-- <td><input type="button" value="delete" class="btn-remove-civilwork"></td> -->
																			</tr>
																		</c:forEach>
																	</c:otherwise>
																</c:choose>
															</c:when>
															<c:otherwise>
																<tr bgcolor="#FFA07A">
																	<td colspan="3" style="width: 100%;">Note : Please
																		enter the project Schedule Details to update Every
																		Quarter</td>
																</tr>
															</c:otherwise>
														</c:choose>
													</tbody>
												</table>
												<div class="form-group row">
													<input type="button"
														class="btn btn-sm btn-success pull-right"
														id="infrastructureId" value="Save" />
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

							<!---------------------------------------- External Infrastructure---------------------------------------------- -->
							<div class="panel-group" id="accordion">
								<div class="panel panel-primary">
									<div class="panel-heading card-header collapsed"
										data-toggle="collapse" data-target="#bar-ext">
										<i class="fa fa-fw fa-chevron-down"></i> <i
											class="fa fa-fw fa-chevron-right"></i>Status of Construction
										of External Infrastructure

									</div>
									<div class="panel-body">
										<!-- The inside div eliminates the 'jumping' animation. -->
										<div class="collapse" id="bar-ext">
											<form:form action="updateExternalstructureDetails"
												method="post" id="quaterExternalupdateForm"
												enctype="multipart/form-data" class="form-horizontal"
												modelAttribute="projectRegistrationModel">
												<table
													class="table table-bordered table-striped table-condensed"
													id="sche-list">
													<thead>
														<tr>
															<th colspan="3">External Infrastructure</th>
														</tr>
														<tr>
															<th>SlNo.</th>
															<th>Name</th>
															<th>Percentage of Completion</th>
															<!-- <th>Action</th> -->

														</tr>
													</thead>
													<tbody>
														<c:choose>
															<c:when
																test="${not empty projectRegistrationModel.projectDetailsModel.projectScheduleModel.externalInfrastructureList}">
																<form:hidden
																	path="projectDetailsModel.projectScheduleModel.projectScheduleId" />
																<%
																	int externalCount = 0;
																%>
																<c:choose>
																	<c:when
																		test="${empty quarter.externalinfrastructureDetails }">
																		<c:forEach
																			items="${projectRegistrationModel.projectDetailsModel.projectScheduleModel.externalInfrastructureList}"
																			var="obj">
																			<c:if test="${obj.isApplicable == 'Yes'}">
																				<tr>
																					<td><%=++externalCount%></td>
																					<td>
																					<c:out value="${obj.externalInfrastructureName}"></c:out>
																					<input type="hidden"
																						name="externalInfrastructureName"
																						value="${obj.externalInfrastructureName}"
																						class="form-control requiredValFld" /> <span
																						class='requiredValFldMsg'> Please Enter
																							Type Of Work.</span></td>
																					<td><input type="number"
																						name="percentageOfCompletion" value="" maxlength="3"
																						class="requiredValFld"> <span
																						class='requiredValFldMsg'> Please Enter
																							Percentage of completion.</span></td>
																					<!-- <td><input type="button" value="delete" class="btn-remove-civilwork"></td> -->
																				</tr>
																			</c:if>
																		</c:forEach>
																	</c:when>
																	<c:otherwise>
																		<c:forEach
																			items="${quarter.externalinfrastructureDetails}"
																			var="obj">
																			<tr>
																				<td><%=++externalCount%></td>
																				<td>
																				<c:out value="${obj.externalInfrastructureName}"></c:out>
																				<input type="hidden"
																					name="externalInfrastructureId"
																					value="${obj.externalInfrastructureId}" /> <input
																					type="hidden" name="externalInfrastructureName"
																					value="${obj.externalInfrastructureName}"
																					class="form-control requiredValFld" /> <span
																					class='requiredValFldMsg'> Please Enter Type
																						Of Work.</span></td>
																				<td><input type="number"
																					name="percentageOfCompletion" maxlength="3"
																					value="${obj.percentageOfCompletion}"
																					class="requiredValFld"> <span
																					class='requiredValFldMsg'> Please Enter
																						Estimated From Date.</span></td>

																				<!-- <td><input type="button" value="delete" class="btn-remove-civilwork"></td> -->
																			</tr>
																		</c:forEach>
																	</c:otherwise>
																</c:choose>
															</c:when>
															<c:otherwise>
																<br>
																<br>
																<tr bgcolor="#FFA07A">
																	<td colspan="3" style="width: 100%;">Note : Please
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
														id="quaterExternalupdateId" value="Save" />
													<!-- <button type="reset" class="btn btn-sm btn-danger pull-right">	<i class="fa fa-ban"></i> Reset	</button> -->
												</div>
											</form:form>
										</div>
									</div>
								</div>
							</div>

							<!------------------------------- Amenity details ------------------------------------>



							<div class="panel-group" id="accordion">
								<div class="panel panel-primary">
									<div class="panel-heading card-header collapsed"
										data-toggle="collapse" data-target="#bar20">
										<i class="fa fa-fw fa-chevron-down"></i> <i
											class="fa fa-fw fa-chevron-right"></i>Status of Amenities
										Details

									</div>
									<div class="panel-body">
										<!-- The inside div eliminates the 'jumping' animation. -->
										<div class="collapse" id="bar20">
											<form:form action="updatequarterAmenityDetails" method="post"
												enctype="multipart/form-data" class="form-horizontal"
												id="amenityForm" modelAttribute="projectRegistrationModel">
												<table
													class="table table-bordered table-striped table-condensed">
													<thead>

														<tr>
															<th colspan="6">Amenities Details</th>
														</tr>
														<tr>
															<th>SlNo.</th>
															<th>Name</th>
															<th>Percentage of Completion</th>
															<!-- <th>Percentage of Completion</th>
															<th>Photograph</th> -->
														</tr>
													</thead>
													<tbody>
														<c:choose>
															<c:when
																test="${ not empty projectRegistrationModel.projectDetailsModel.projectScheduleModel.amenityList}">
																<%
																	int amenityCount = 0;
																%>
																<c:choose>
																	<c:when test="${empty quarter.amenityList }">
																		<c:forEach
																			items="${projectRegistrationModel.projectDetailsModel.projectScheduleModel.amenityList}"
																			var="amenityDetailsObj">
																			<c:if
																				test="${amenityDetailsObj.isApplicable == 'Yes'}">
																				<tr>
																					<td><%=++amenityCount%></td>
																					<td>
																					<c:out value="${amenityDetailsObj.amenityName}"></c:out>
																					<input type="hidden" name="amenityName"
																						value="${amenityDetailsObj.amenityName}"
																						class="requiredValFld"> <span
																						class='requiredValFldMsg'> Please Enter
																							Area Name </span></td>
																					<td><input type="number" name="percOfCompletion" maxlength="3"
																						value="" class="requiredValFld"> <span
																						class='requiredValFldMsg'> Please Enter
																							percentage of Completion</span></td>
																				</tr>
																			</c:if>
																		</c:forEach>
																	</c:when>
																	<c:otherwise>
																		<%
																			int savedamenityCount = 0;
																		%>
																		<c:forEach items="${quarter.amenityList}"
																			var="amenityDetailsObj">
																			<tr>
																				<td><%=++savedamenityCount%></td>
																				<td>
																				<c:out value="${amenityDetailsObj.amenityName}"></c:out>
																				<input type="hidden" name="amenityName"
																					value="${amenityDetailsObj.amenityName}"
																					class="requiredValFld"> <span
																					class='requiredValFldMsg'> Please Enter Area
																						Name </span></td>
																				<td><input type="number" name="percOfCompletion" maxlength="3"
																					value="${amenityDetailsObj.percOfCompletion}"
																					class="requiredValFld"> <span
																					class='requiredValFldMsg'> Please Enter
																						percentage of Completion</span></td>
																			</tr>
																		</c:forEach>
																	</c:otherwise>
																</c:choose>


															</c:when>
															<c:otherwise>
																<br>
																<br>
																<tr bgcolor="#FFA07A">
																	<td colspan="3" style="width: 100%;">Note : Please
																		enter the project Schedule Details to update Every
																		Quarter</td>
																</tr>
															</c:otherwise>
														</c:choose>
													</tbody>
												</table>
												<br>
												<!-- <button type="button" class="btn btn-primary btn-sm pull-right btn-add-amenity">Add More</button> -->

												<div class="form-group row">
													<input type="button"
														class="btn btn-sm btn-success  pull-right" id="amenityId"
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

							<!----------------------------------------------------------------- status of common areas -->

							<div class="panel-group" id="accordion">
								<div class="panel panel-primary">
									<div class="panel-heading card-header collapsed"
										data-toggle="collapse" data-target="#bar8">
										<i class="fa fa-fw fa-chevron-down"></i> <i
											class="fa fa-fw fa-chevron-right"></i>Status of Construction
										of Common Areas

									</div>
									<div class="panel-body">
										<!-- The inside div eliminates the 'jumping' animation. -->
										<div class="collapse" id="bar8">
											<form:form action="updateCommonAreaDetails" method="post"
												enctype="multipart/form-data" class="form-horizontal"
												id="commonAreaForm"
												modelAttribute="projectRegistrationModel">
												<table
													class="table table-bordered table-striped table-condensed">
													<thead>

														<tr>
															<th colspan="4">Common Area Details</th>
														</tr>
														<tr>
															<th>Sl No.</th>
															<th>Name</th>
															<th>Percentage of Completion</th>
															<!-- <th>Photograph</th> -->
														</tr>
													</thead>
													<tbody>
														<c:choose>
															<c:when
																test="${ not empty projectRegistrationModel.projectDetailsModel.projectScheduleModel.commonAreaList}">
																<%
																	int CommonCount = 0;
																%>
																<c:choose>
																	<c:when test="${empty quarter.commonAreaDetails }">
																<c:forEach
																			items="${projectRegistrationModel.projectDetailsModel.projectScheduleModel.commonAreaList}"
																			var="commonAreaObj">
																			<c:if test="${commonAreaObj.isApplicable == 'Yes'}">
																				<tr>
																					<td><%=++CommonCount%></td>
																					<td>
																					<c:out value="${commonAreaObj.commonAreaName}"></c:out>
																					<input type="hidden" name="commonAreaName"
																						value="${commonAreaObj.commonAreaName}"
																						class="requiredValFld"> <span
																						class='requiredValFldMsg'> Please Enter
																							Area Name </span></td>
																					<td><input type="number"
																						name="percentageOfCompletion" value="" maxlength="3"
																						class="requiredValFld"> <span
																						class='requiredValFldMsg'> Please Enter
																							percentage of Completion</span></td>
																				</tr>
																			</c:if>
																		</c:forEach>
																	</c:when>
																	<c:otherwise>
																		<c:forEach items="${quarter.commonAreaDetails}"
																			var="amenityDetailsObj">
																			<tr>
																				<td><%=++CommonCount%></td>
																				<td>
																				<c:out value="${commonAreaObj.commonAreaName}"></c:out>
																				<input type="hidden" name="commonAreaName"
																					value="${amenityDetailsObj.commonAreaName}"
																					class="requiredValFld"> <span
																					class='requiredValFldMsg'> Please Enter Area
																						Name </span></td>
																				<td><input type="number"
																					name="percentageOfCompletion"
																					value="${amenityDetailsObj.percentageOfCompletion}" maxlength="3"
																					class="requiredValFld"> <span
																					class='requiredValFldMsg'> Please Enter
																						percentage of Completion</span>
																						

								</td>
																			</tr>
																		</c:forEach>
																	</c:otherwise>
																</c:choose>
															</c:when>
															<c:otherwise>
																<br>
																<br>
																<tr bgcolor="#FFA07A">
																	<td colspan="3" style="width: 100%;">Note : Please
																		enter the project Schedule Details to update Every
																		Quarter</td>
																</tr>
															</c:otherwise>
														</c:choose>
													</tbody>
												</table>
												<div class="form-group row">
													<input type="button"
														class="btn btn-sm btn-success pull-right"
														id="commonAreaId" value="Save" />
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
							
							
							<!------------------------------status of approvals  -------------------------------><!--   -->
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
											<form:form action="updateApprovalsOrNocDetails" method="post"
												enctype="multipart/form-data" class="form-horizontal"
												id="approvalNocForm"
												modelAttribute="projectRegistrationModel">
												<table id="common-noc"
													class="table table-bordered table-striped table-condensed">
													<thead>

														<tr>
															<th>Sl No.</th>
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
																	class="requiredValFld" >Yes <span class='requiredValFldMsg'> Please select yes/No </span> </label> <label class="radio-inline" for="inline-radio2">
																	<input type="radio" name="isApplicable_0" value="No" id="isApplicable_0" nocCount="0" onclick="hideStatusOfNoc(this)"
																	class="requiredValFld">No <span class='requiredValFldMsg'> Please select yes/No </span>
															</label></td>
															<td ><select  name="status" id="nocStatus_0" noccount="0" onchange="requiredNOC(this)"
																class="form-control input-sm" size="1">
																	<option value="0">select</option>
																	<option value="Approved">Approved</option>
																	<option value="Applied">Applied</option>
																	<option value="To Be Applied">To Be Applied</option>
															</select><span class='requiredValFldMsg'>Please select Status.</span></td>
															<td ><input type="date" name="dateOfApplication" id="nocDate_0"
																class=""> <span
																class='requiredValFldMsg'> Please select Date Of Application </span></td>
															<td ><input type="file" name="uploadDoc" id="nocDoc_0"
																class=""> <span
																class='requiredValFldMsg'> Please Upload Document </span></td>
														</tr>
														<tr>
															<td>2</td>
															<td>KSPCB- PCB (10 Acres to 125 Acres)<input type="hidden"
																name="detailsOfApprovalsOrNoc"
																value="KSPCB- PCB (10 Acres to 125 Acres)"></td>
															<td><label class="radio-inline" for="inline-radio1"><input class="requiredValFld"
																	type="radio" name="isApplicable_1" id="isApplicable_1" nocCount="1" onclick="showStatusOfNoc(this)" value="Yes">Yes
																	<span class='requiredValFldMsg'> Please select yes/No </span></label>
																<label class="radio-inline" for="inline-radio2">
																	<input type="radio" id="isApplicable_1" class="requiredValFld" nocCount="1" onclick="hideStatusOfNoc(this)" name="isApplicable_1" value="No">No
															<span class='requiredValFldMsg'> Please select yes/No </span></label></td>
															<td><select name="status" id="nocStatus_1" noccount="1" onchange="requiredNOC(this)"
																class="form-control input-sm" size="1">
																	<option value="0">select</option>
																	<option value="Approved">Approved</option>
																	<option value="Applied">Applied</option>
																	<option value="To Be Applied">To Be Applied</option>
															</select><span class='requiredValFldMsg'>Please select Status.</span></td>
															<td><input id="nocDate_1" type="date" name="dateOfApplication" 
																class=""> <span
																class='requiredValFldMsg'> Please select Date Of Application </span></td>
															<td><input type="file" name="uploadDoc" id="nocDoc_1"
																class=""> <span
																class='requiredValFldMsg'> Please Upload Document </span></td>
														</tr>
														<tr>
															<td>3</td>
															<td>KSPCB- MOEF (Above 50 Acres)<input type="hidden"
																name="detailsOfApprovalsOrNoc"
																value="KSPCB- MOEF (Above 50 Acres)"></td>
															<td><label class="radio-inline" for="inline-radio1"><input class="requiredValFld" id="isApplicable_2" nocCount="2" onclick="showStatusOfNoc(this)"
																	type="radio" name="isApplicable_2" value="Yes">Yes<span class='requiredValFldMsg'> Please select yes/No </span></label>
																<label class="radio-inline" for="inline-radio2">
																	<input type="radio" name="isApplicable_2" class="requiredValFld" id="isApplicable_2" nocCount="2" onclick="hideStatusOfNoc(this)" value="No">No
															<span class='requiredValFldMsg'> Please select yes/No </span></label></td>
															<td><select name="status" id="nocStatus_2" noccount="2" onchange="requiredNOC(this)"
																class="form-control input-sm" size="1">
																	<option value="0">select</option>
																	<option value="Approved">Approved</option>
																	<option value="Applied">Applied</option>
																	<option value="To Be Applied">To Be Applied</option>
															</select><span class='requiredValFldMsg'>Please select Status.</span></td>
															<td><input type="date" name="dateOfApplication" id="nocDate_2"
																class=""> <span class='requiredValFldMsg'> Please select Date Of Application </span></td>
															<td><input type="file" name="uploadDoc" id="nocDoc_2"
																class=""> <span class='requiredValFldMsg'> Please Upload Document </span></td>
														</tr>
														<tr>
															<td>4</td>
															<td>Engineering Department (PWD) for completion of development works<input type="hidden"
																name="detailsOfApprovalsOrNoc"
																value="Engineering Department (PWD) for completion of development works"></td>
															<td><label class="radio-inline" for="inline-radio1"><input class="requiredValFld" id="isApplicable_3" nocCount="3" onclick="showStatusOfNoc(this)"
																	type="radio" name="isApplicable_3" value="Yes">Yes<span class='requiredValFldMsg'> Please select yes/No </span></label>
																<label class="radio-inline" for="inline-radio2">
																	<input type="radio" name="isApplicable_3" class="requiredValFld" id="isApplicable_3" nocCount="3" onclick="hideStatusOfNoc(this)" value="No">No
															<span class='requiredValFldMsg'> Please select yes/No </span></label></td>
															<td><select name="status" id="nocStatus_3" noccount="3" onchange="requiredNOC(this)"
																class="form-control input-sm" size="1">
																	<option value="0">select</option>
																	<option value="Approved">Approved</option>
																	<option value="Applied">Applied</option>
																	<option value="To Be Applied">To Be Applied</option>
															</select><span class='requiredValFldMsg'>Please select Status.</span></td>
															<td><input type="date" name="dateOfApplication" id="nocDate_3"
																class=""> <span class='requiredValFldMsg'> Please select Date Of Application </span></td>
															<td><input type="file" name="uploadDoc" id="nocDoc_3"
																class=""> <span class='requiredValFldMsg'> Please Upload Document </span></td>
														</tr>
														<tr>
															<td>5</td>
															<td>KPTCL- BESCOM<input type="hidden"
																name="detailsOfApprovalsOrNoc" value="KPTCL- BESCOM"></td>
															<td><label class="radio-inline" for="inline-radio1"><input id="isApplicable_4" nocCount="4" onclick="showStatusOfNoc(this)"
																	type="radio" class="requiredValFld" name="isApplicable_4" value="Yes">Yes<span class='requiredValFldMsg'> Please select yes/No </span></label>
																<label class="radio-inline" for="inline-radio2">
																	<input type="radio" class="requiredValFld" name="isApplicable_4" id="isApplicable_4" nocCount="4" onclick="hideStatusOfNoc(this)" value="No">No
															<span class='requiredValFldMsg'> Please select yes/No </span></label></td>
															<td><select name="status" id="nocStatus_4" noccount="4" onchange="requiredNOC(this)"
																class="form-control input-sm" size="1">
																	<option value="0">select</option>
																	<option value="Approved">Approved</option>
																	<option value="Applied">Applied</option>
																	<option value="To Be Applied">To Be Applied</option>
															</select><span class='requiredValFldMsg'>Please select Status.</span></td>
															<td><input type="date" name="dateOfApplication" id="nocDate_4"
																class=""> <span class='requiredValFldMsg'> Please select Date Of Application </span></td>
															<td><input type="file" name="uploadDoc" id="nocDoc_4"
																class=""> <span class='requiredValFldMsg'> Please Upload Document </span></td>
														</tr>
														<tr>
															<td>6</td>
															<td>Horticulture department<input type="hidden"
																name="detailsOfApprovalsOrNoc"
																value="Horticulture department"></td>
															<td><label class="radio-inline" for="inline-radio1"><input class="requiredValFld" id="isApplicable_5" nocCount="5" onclick="showStatusOfNoc(this)"
																	type="radio" name="isApplicable_5" value="Yes">Yes<span class='requiredValFldMsg'> Please select yes/No </span></label>
																<label class="radio-inline" for="inline-radio2">
																	<input type="radio" class="requiredValFld" name="isApplicable_5" id="isApplicable_5" nocCount="5" onclick="hideStatusOfNoc(this)" value="No">No
															<span class='requiredValFldMsg'> Please select yes/No </span></label></td>
															<td><select name="status" id="nocStatus_5" noccount="5" onchange="requiredNOC(this)"
																class="form-control input-sm" size="1">
																	<option value="0">select</option>
																	<option value="Approved">Approved</option>
																	<option value="Applied">Applied</option>
																	<option value="To Be Applied">To Be Applied</option>
															</select><span class='requiredValFldMsg'>Please select Status.</span></td>
															<td><input type="date" name="dateOfApplication" id="nocDate_5"
																class=""> <span class='requiredValFldMsg'> Please select Date Of Application </span></td>
															<td><input type="file" name="uploadDoc" id="nocDoc_5"
																class=""> <span class='requiredValFldMsg'> Please Upload Document </span></td>
														</tr>
														<tr>
															<td>7</td>
															<td>Fire and Safety<input type="hidden"
																name="detailsOfApprovalsOrNoc" value="Fire and Safety"></td>
															<td><label class="radio-inline" for="inline-radio1"><input class="requiredValFld" id="isApplicable_6" nocCount="6" onclick="showStatusOfNoc(this)"
																	type="radio" name="isApplicable_6" value="Yes">Yes<span class='requiredValFldMsg'> Please select yes/No </span></label>
																<label class="radio-inline" for="inline-radio2">
																	<input class="requiredValFld" type="radio" name="isApplicable_6" id="isApplicable_6" nocCount="6" onclick="hideStatusOfNoc(this)" value="No">No
															<span class='requiredValFldMsg'> Please select yes/No </span></label></td>
															<td><select name="status" id="nocStatus_6" noccount="6" onchange="requiredNOC(this)"
																class="form-control input-sm" size="1">
																	<option value="0">select</option>
																	<option value="Approved">Approved</option>
																	<option value="Applied">Applied</option>
																	<option value="To Be Applied">To Be Applied</option>
															</select><span class='requiredValFldMsg'>Please select Status.</span></td>
															<td><input type="date" name="dateOfApplication" id="nocDate_6"
																class=""> <span class='requiredValFldMsg'> Please select Date Of Application </span></td>
															<td><input type="file" name="uploadDoc" id="nocDoc_6"
																class=""> <span class='requiredValFldMsg'> Please Upload Document </span></td>
														</tr>
														<tr>
															<td>8</td>
															<td>Labour and Education Department<input type="hidden"
																name="detailsOfApprovalsOrNoc"
																value="Labour and Education Department"></td>
															<td><label class="radio-inline" for="inline-radio1"><input class="requiredValFld" id="isApplicable_7" nocCount="7" onclick="showStatusOfNoc(this)"
																	type="radio" name="isApplicable_7" value="Yes">Yes<span class='requiredValFldMsg'> Please select yes/No </span></label>
																<label class="radio-inline" for="inline-radio2">
																	<input type="radio" class="requiredValFld" name="isApplicable_7" id="isApplicable_7" nocCount="7" onclick="hideStatusOfNoc(this)" value="No">No
															<span class='requiredValFldMsg'> Please select yes/No </span></label></td>
															<td><select name="status" id="nocStatus_7" noccount="7" onchange="requiredNOC(this)"
																class="form-control input-sm" size="1">
																	<option value="0">select</option>
																	<option value="Approved">Approved</option>
																	<option value="Applied">Applied</option>
																	<option value="To Be Applied">To Be Applied</option>
															</select><span class='requiredValFldMsg'>Please select Status.</span></td>
															<td><input type="date" name="dateOfApplication" id="nocDate_7"
																class=""> <span class='requiredValFldMsg'> Please select Date Of Application </span></td>
															<td><input type="file" name="uploadDoc" id="nocDoc_7"
																class=""> <span class='requiredValFldMsg'> Please Upload Document </span></td>
														</tr>
														<tr>
															<td>9</td>
															<td>Airport Authority<input type="hidden"
																name="detailsOfApprovalsOrNoc" value="Airport Authority"></td>
															<td><label class="radio-inline" for="inline-radio1"><input class="requiredValFld" id="isApplicable_8" nocCount="8" onclick="showStatusOfNoc(this)"
																	type="radio" name="isApplicable_8" value="Yes">Yes<span class='requiredValFldMsg'> Please select yes/No </span></label>
																<label class="radio-inline" for="inline-radio2">
																	<input type="radio" name="isApplicable_8" class="requiredValFld" id="isApplicable_8" nocCount="8" onclick="hideStatusOfNoc(this)" value="No">No
															<span class='requiredValFldMsg'> Please select yes/No </span></label></td>
															<td><select name="status" id="nocStatus_8" noccount="8" onchange="requiredNOC(this)"
																class="form-control input-sm" size="1">
																	<option value="0">select</option>
																	<option value="Approved">Approved</option>
																	<option value="Applied">Applied</option>
																	<option value="To Be Applied">To Be Applied</option>
															</select><span class='requiredValFldMsg'>Please select Status.</span></td>
															<td><input type="date" name="dateOfApplication" id="nocDate_8"
																class=""> <span class='requiredValFldMsg'> Please select Date Of Application </span></td>
															<td><input type="file" name="uploadDoc" id="nocDoc_8"
																class=""> <span class='requiredValFldMsg'> Please Upload Document </span></td>
														</tr>
														<tr>
															<td>10</td>
															<td>BSNL/Telecommunication Department<input type="hidden"
																name="detailsOfApprovalsOrNoc"
																value="BSNL/Telecommunication Department"></td>
															<td><label class="radio-inline" for="inline-radio1"><input class="requiredValFld" id="isApplicable_9" nocCount="9" onclick="showStatusOfNoc(this)"
																	type="radio" name="isApplicable_9" value="Yes">Yes<span class='requiredValFldMsg'> Please select yes/No </span></label>
																<label class="radio-inline" for="inline-radio2">
																	<input type="radio" name="isApplicable_9" class="requiredValFld" id="isApplicable_9" nocCount="9" onclick="hideStatusOfNoc(this)" value="No">No
															<span class='requiredValFldMsg'> Please select yes/No </span></label></td>
															<td><select name="status" id="nocStatus_9" noccount="9" onchange="requiredNOC(this)"
																class="form-control input-sm" size="1">
																	<option value="0">select</option>
																	<option value="Approved">Approved</option>
																	<option value="Applied">Applied</option>
																	<option value="To Be Applied">To Be Applied</option>
															</select><span class='requiredValFldMsg'>Please select Status.</span></td>
															<td><input type="date" name="dateOfApplication" id="nocDate_9"
																class=""> <span class='requiredValFldMsg'> Please select Date Of Application </span></td>
															<td><input type="file" name="uploadDoc" id="nocDoc_9" class=""> 
															<span class='requiredValFldMsg'> Please Upload Document </span></td>
														</tr>
														<tr>
															<td>11</td>
															<td>Airport Authority of India<input type="hidden"
																name="detailsOfApprovalsOrNoc"
																value="Airport Authority of India"></td>
															<td><label class="radio-inline" for="inline-radio1"><input class="requiredValFld" id="isApplicable_10" nocCount="10" onclick="showStatusOfNoc(this)"
																	type="radio" name="isApplicable_10" value="Yes">Yes<span class='requiredValFldMsg'> Please select yes/No </span></label>
																<label class="radio-inline" for="inline-radio2">
																	<input class="requiredValFld" type="radio" name="isApplicable_10" id="isApplicable_10" nocCount="10" onclick="hideStatusOfNoc(this)" value="No">No
															<span class='requiredValFldMsg'> Please select yes/No </span></label></td>
															<td><select name="status" id="nocStatus_10" noccount="10" onchange="requiredNOC(this)"
																class="form-control input-sm" size="1">
																	<option value="0">select</option>
																	<option value="Approved">Approved</option>
																	<option value="Applied">Applied</option>
																	<option value="To Be Applied">To Be Applied</option>
															</select><span class='requiredValFldMsg'>Please select Status.</span></td>
															<td><input type="date" name="dateOfApplication" id="nocDate_10"
																class=""> <span class='requiredValFldMsg'> Please select Date Of Application </span></td>
															<td><input type="file" name="uploadDoc" id="nocDoc_10"
																class=""> <span class='requiredValFldMsg'> Please Upload Document </span></td>
														</tr>

															</c:when>
															<c:otherwise>
																<%
																	int count = -1;
																				int i = 0;
																%>
																<c:forEach items="${quarter.approvalsAndNOCDetails}"
																	var="approvalsAndNOCDetailsObj">
																	<tr>
																		<td><%=++i%></td>
																		<%
																			count++;
																		%>
																		<td>
																		<c:out value="${approvalsAndNOCDetailsObj.detailsOfApprovalsOrNoc}"></c:out>
																		<input type="hidden"
																			name="approvalsAndNocDetailsId"
																			value="${approvalsAndNOCDetailsObj.approvalsAndNocDetailsId}" />
																			<input type="hidden" name="detailsOfApprovalsOrNoc"
																			value="${approvalsAndNOCDetailsObj.detailsOfApprovalsOrNoc}"></td>
																		<td><c:choose>
																				<c:when
																					test="${approvalsAndNOCDetailsObj.isApplicable == 'Yes'}">

																					<div class="col-md-9">
																						<label class="radio-inline" for="isApplicable">
																							<input type="radio" id="isApplicable_<%=count%>" nocCount="<%=count%>" onclick="showStatusOfNoc(this)"
																							name='isApplicable_<%=count%>' value="Yes"
																							class='dynaselectfld requiredValFld'
																							checked="checked">Yes<span class='requiredValFldMsg'> Please select Yes/No</span>
																						</label> <label class="radio-inline" for="isApplicable">
																							<input type="radio" id="isApplicable_<%=count%>" nocCount="<%=count%>" onclick="hideStatusOfNoc(this)" class='dynaselectfld requiredValFld'
																							name='isApplicable_<%=count%>' value="No">No<span class='requiredValFldMsg'> Please select Yes/No</span>
																						</label>
																					</div>
																				</c:when>
																				<c:otherwise>
																					<div class="col-md-9">
																						<label class="radio-inline" for="isApplicable">
																							<input type="radio" id="isApplicable_<%=count%>" nocCount="<%=count%>" onclick="showStatusOfNoc(this)" class='dynaselectfld requiredValFld'
																							name='isApplicable_<%=count%>' value="Yes">Yes<span class='requiredValFldMsg'> Please select Yes/No</span>
																						</label> <label class="radio-inline" for="isApplicable">
																							<input type="radio" id="isApplicable_<%=count%>" nocCount="<%=count%>" onclick="hideStatusOfNoc(this)" class='dynaselectfld requiredValFld'
																							name='isApplicable_<%=count%>' value="No"
																							checked="checked">No<span class='requiredValFldMsg'> Please select Yes/No</span>
																						</label>
																					</div>
																				</c:otherwise>
																			</c:choose></td>
																		<td>
																			<div class="form-group row">
																				<div class="col-md-16">
																					<select class="form-control" id="nocStatus_<%=count%>" noccount="<%=count%>" onchange="requiredNOC(this)"
																						name="status">
																						<option value="0"> --Select ${approvalsAndNOCDetailsObj.status}-- </option>
																						<c:choose>
																							<c:when
																								test="${approvalsAndNOCDetailsObj.status=='Approved' }">
																								<option value="Approved" selected="selected">Approved</option>
																								<option value="Applied">Applied</option>
																								<option value="To Be Applied">To Be Applied</option>
																							</c:when>
																							<c:when
																								test="${approvalsAndNOCDetailsObj.status=='Applied' }">
																								<option value="Approved">Approved</option>
																								<option value="Applied" selected="selected">Applied</option>
																								<option value="To Be Applied">To Be Applied</option>
																							</c:when>
																							<c:when
																								test="${approvalsAndNOCDetailsObj.status=='To Be Applied' }">
																								<option value="Approved">Approved</option>
																								<option value="Applied">Applied</option>
																								<option value="To Be Applied"
																									selected="selected">To Be Applied</option>
																							</c:when>
																							<c:otherwise>
																								<option value="Approved">Approved</option>
																								<option value="Applied">Applied</option>
																								<option value="To Be Applied">To Be Applied</option>
																							</c:otherwise>
																						</c:choose>
																					</select> <span class='requiredValFldMsg'> Please Select Status .</span>
																				</div>
																			</div>
																		</td>

																		<td><fmt:formatDate type="date"
																				pattern="yyyy-MM-dd" dateStyle="short"
																				var="formateddate1"
																				value="${approvalsAndNOCDetailsObj.dateOfApplication.time}" />
																			<input type="date" name="dateOfApplication"
																			value="${formateddate1}" id="nocDate_<%=count%>"
																			class="form-control " /> <span class='requiredValFldMsg'> Please select Date Of Application </span></td>
																		<td><input type="hidden" name="uploadDocId"
																			value="${approvalsAndNOCDetailsObj.uploadDoc.documentId}" />
																			<input type="file" name="uploadDoc" id="nocDoc_<%=count%>"
																			title="Only image or pdf file is allowed. file size upto 1 MB"><span class='requiredValFldMsg'> Please select Document </span>
																			<a href='<%=request.getContextPath() %>/download?DOC_ID=${approvalsAndNOCDetailsObj.uploadDoc.documentId}'>
																				${approvalsAndNOCDetailsObj.uploadDoc.fileName}</a></td>
																	</tr>
																</c:forEach>
															</c:otherwise>
														</c:choose>

													</tbody>
												</table>
												<div class="form-group row">
													<input type="button"
														class="btn btn-sm btn-success  pull-right"
														id="approvalNocId" value="Save" />
														<!-- <button type="button"
												class="btn btn-primary btn-sm pull-right btn-add-projnoc">Add
												More</button> -->
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
							
							<!------------------------------Litigation Details  -------------------------------> 
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
											<form:form action="updateLitigationDetails" method="post"
												enctype="multipart/form-data" id="litigationForm"
												class="form-horizontal"
												modelAttribute="projectRegistrationModel">
												<form:hidden path="projectRegId" />
												<form:hidden path="projectRegId" />
												                <%
                                                                 int count=-1;
                                                                 %>
												<c:choose>
													<c:when test="${ empty quarter.litigationDetails}">
														<div class="form-group row"></div>
														<div class="add-more-litigation" style="border-style: ridge; padding: 20px; background-color: #F8F8F8;">
														<div class="form-group row">
															<label class="col-md-3 form-control-label">Any
																litigations on the project (incl. land)? </label>
															<div class="col-md-9">
																<label class="radio-inline" for="inline-radio1">
																	<input type="radio" name="anyLitigationOnProject_0" value="Yes" onclick="showLitigation();" class="requiredValFld">Yes <span
																	class='requiredValFldMsg'> Please select yes/No
																</span>
																</label> <label class="radio-inline" for="inline-radio2">
																<input type="hidden" id="count_add_more" value="0">
																	<input type="radio" id="inline-radio2"
																	name="anyLitigationOnProject_0" value="No" onclick="hideLitigation();">No
																</label>
															</div>
														</div>
														<div id="litigationdetails" style="display: none;">
														<div class="form-group row">
															<label class="col-md-3 form-control-label">Type
																of Case </label>
															<div class="col-md-9">
																<select id="select" name="caseType"
																	class="form-control input-sm" size="1"
																	style="width: 200px;">
																	<option value="0"> --select--</option>
																	<option value="Commercial">Commercial </option>
																	<option value="Civil">Civil</option>
																	<option value="Others">Others</option>
																</select>
															</div>
														</div>
														<div class="form-group row">
															<label class="col-md-3 form-control-label"
																for="text-input">Name of the Court /Tribunal/ Authority </label>
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
															<label class="col-md-3 form-control-label"
																for="text-input">Case No. </label>
															<div class="col-md-9">
																<input type="text" id="text-input" name="caseNo"
																	class="form-control requiredValFld"
																	placeholder="only digits 0-9 allowed"> <span
																	class='requiredValFldMsg'> Please Enter Case No.
																</span>
															</div>
														</div>
														<div class="form-group row">
															<label class="col-md-3 form-control-label"
																for="text-input">Year </label>
															<div class="col-md-9">
																<input type="text" id="text-input" name="litigationYear"
																	class="form-control requiredValFld"
																	placeholder="eg:2018"> <span
																	class='requiredValFldMsg'> Please select Year </span>
															</div>
														</div>
														<div class="form-group row">
															<label class="col-md-3 form-control-label">Whether
																any Preventive Order issued? (Injunction / Interim Order
																/ Final Order / Stay Order) </label>
															<div class="col-md-9">
																<label class="radio-inline" for="inline-radio1">
																	<input type="radio" id="isCaseApplicable_0" caseCount="0" onclick="showCaseFile(this);"
																	name="anyPreventiveOrderIssued_0" value="Yes"
																	class="requiredValFld" >Yes
																</label> <label class="radio-inline" for="inline-radio2">
																	<input type="radio" id="isCaseApplicable_0" caseCount="0"
																	name="anyPreventiveOrderIssued_0" value="No" onclick="hideCaseFile(this);">No
																</label>

															</div>
														</div>
														<div id="showCaseFile_0" style="display: none;">
														<div class="form-group row">
															<label class="col-md-3 form-control-label"
																for="file-input">Preventive Order (Injunction /
																Interim Order / Final Order / Stay Order </label>
															<div class="col-md-3">
																<input type="file" id="file-input"
																	name="preventiveOrderDoc" class="">
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
														<div class="form-group row" >
															<label class="col-md-3 form-control-label">Any Future Orders in this regard</label>
															<div class="col-md-3">
																<input type="file" id="file-input"
																	name="furtherOrderDoc" class="requiredValFld">
																<span class='requiredValFldMsg'> Please select
																	Preventive Order </span>

															</div>
														</div>
														</div>
														</div>
														</div>
														
														<!-- <div class="form-group row" id="showCaseFile">
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
														</div> -->
													</c:when>
													<c:otherwise>
														<c:forEach items="${quarter.litigationDetails}"
															var="litigationDetails">
															<input type="hidden" id="count_add_more" value="${quarter.litigationDetails.size()-1}">
															<div class ="add-more-litigation" style="border-style: ridge;padding: 20px;background-color: #F8F8F8;">
															<div class="form-group row">
																<label class="col-md-3 form-control-label">Any
																	litigations on the project (incl. land)? </label>
                                                                 
                                                                <% ++count; %>
																<c:choose>
																	<c:when
																		test="${litigationDetails.anyLitigationOnProject == 'Yes'}">
																		<div class="col-md-9">
																			<label class="radio-inline"
																				for="anyLitigationOnProject"> <input
																				type="radio" id="anyLitigationOnProject" onclick="showLitigation();"
																				name="anyLitigationOnProject_<%=count %>" value="Yes"
																				class='dynaselectfld requiredValFld'
																				checked="checked">Yes
																			</label> <label class="radio-inline"
																				for="anyLitigationOnProject"> <input
																				type="radio" id="anyLitigationOnProject"
																				name="anyLitigationOnProject_<%=count %>" value="No">No
																			</label>
																		</div>
																	</c:when>
																	<c:otherwise>
																		<div class="col-md-9">
																			<label class="radio-inline"
																				for="anyLitigationOnProject"> <input onclick="hideLitigation();"
																				type="radio" id="inline-radio1"
																				name='anyLitigationOnProject_<%=count %>' value="Yes">Yes
																			</label> <label class="radio-inline"
																				for="anyLitigationOnProject"> <input
																				type="radio" id="inline-radio2"
																				name='anyLitigationOnProject_<%=count %>' value="No"
																				checked="checked">No
																			</label>
																		</div>
																	</c:otherwise>
																</c:choose>
															</div>
															<div id="litigationdetails">
															<div class="form-group row">
																<label class="col-md-3 form-control-label">Type
																	of Case </label>
																<div class="col-md-9">
																	<select id="select" name="caseType"
																		class="form-control input-sm" size="1"
																		style="width: 200px;">
																		<option value="0"> select</option>
																		<c:choose>
																			<c:when
																				test="${litigationDetails.caseType == 'Commercial'}">
																				<option value="Commercial" selected="selected">Commercial </option>
																				<option value="Civil">Civil</option>
																				<option value="Others">Others</option>
																			</c:when>
																			<c:when
																				test="${litigationDetails.caseType == 'Civil'}">
																				<option value="Commercial">Commercial </option>
																				<option value="Civil" selected="selected">Civil</option>
																				<option value="Others">Others</option>
																			</c:when>
																			<c:when
																				test="${litigationDetails.caseType == 'Others'}">
																				<option value="Commercial">Commercial </option>
																				<option value="Civil">Civil</option>
																				<option value="Others" selected="selected">Others</option>
																			</c:when>
																			<c:otherwise>
																				<option value="Commercial">Commercial </option>
																				<option value="Civil">Civil</option>
																				<option value="Others">Others</option>
																			</c:otherwise>
																		</c:choose>
																	</select>
																</div>
															</div>
															<div class="form-group row">
																<label class="col-md-3 form-control-label"
																	for="text-input">Name of the Court /Tribunal/ Authority
																</label>
																<div class="col-md-9">

																	<input type="hidden" id="text-input"
																		name="litigationDetailsId"
																		value="${litigationDetails.litigationDetailsId}"
																		class="form-control" placeholder=""> <input
																		type="text" id="text-input"
																		name="courtOrAuthorityName"
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
																	<input type="text" id="text-input" name="caseNo"
																		value="${litigationDetails.caseNo}"
																		class="form-control requiredValFld" placeholder="">
																	<span class='requiredValFldMsg'> Please Enter
																		Case No. </span>
																</div>
															</div>
															<div class="form-group row">
																<label class="col-md-3 form-control-label"
																	for="text-input">Year </label>
																<div class="col-md-9">
																	<fmt:formatDate type="date" pattern="yyyy"
																		dateStyle="short" var="formateddate1"
																		value="${litigationDetails.litigationYear.time}" />
																	<input type="text" name="litigationYear"
																		value="${formateddate1}"
																		class="form-control requiredValFld" /> <span
																		class='requiredValFldMsg'> Please select Year </span>
																</div>
															</div>
															<div class="form-group row">
																<label class="col-md-3 form-control-label">Whether
																	any Preventive Order issued? (Injunction / Interim
																	Order / Final Order / Stay Order) </label>

																<c:choose>
																	<c:when
																		test="${litigationDetails.anyPreventiveOrderIssued == 'Yes'}">
																		<div class="col-md-9">
																			<label class="radio-inline"
																				for="anyPreventiveOrderIssued"> <input
																				type="radio" id="isCaseApplicable_<%=count%>" caseCount="<%=count%>" onclick="showCaseFile(this);"
																				name='anyPreventiveOrderIssued_<%=count%>' value="Yes"
																				class='dynaselectfld requiredValFld'
																				checked="checked" onclick="showSavedCaseFile();">Yes
																			</label> <label class="radio-inline"
																				for="anyPreventiveOrderIssued"> <input
																				type="radio" id="isCaseApplicable_<%=count%>" caseCount="<%=count%>" onclick="hideCaseFile(this);"
																				name='anyPreventiveOrderIssued_<%=count %>' value="No">No
																			</label>
																		</div>
																	</c:when>
																	<c:otherwise>
																		<div class="col-md-9">
																			<label class="radio-inline"
																				for="anyPreventiveOrderIssued"> <input
																				type="radio" id="isCaseApplicable_<%=count%>" caseCount="<%=count%>" onclick="showCaseFile(this);"
																				name='anyPreventiveOrderIssued_<%=count %>' value="Yes">Yes
																			</label> <label class="radio-inline"
																				for="anyPreventiveOrderIssued"> <input
																				type="radio" id="isCaseApplicable_<%=count%>" caseCount="<%=count%>" onclick="hideCaseFile(this);"
																				name='anyPreventiveOrderIssued_<%=count %>' value="No"
																				checked="checked" onclick="">No
																			</label>
																		</div>
																	</c:otherwise>
																</c:choose>
															</div>
															<div id="showCaseFile_<%=count%>">
															<div class="form-group row" >
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
																		<option value="0"> --Select-- </option>
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
															<div class="form-group row" >
															<label class="col-md-3 form-control-label"
																	for="file-input">Any further orders in this regard</label>
																<div class="col-md-3">
																	<input type="hidden" name="furtherOrderDocId"
																		value="${litigationDetails.furtherOrderDoc.documentId}" />
																	<input type="file" name="furtherOrderDoc"
																		title="Only image or pdf file is allowed. file size upto 1 MB">
																	<a
																		href='<%=request.getContextPath() %>/download?DOC_ID=${litigationDetails.furtherOrderDoc.documentId}'>
																		${litigationDetails.furtherOrderDoc.fileName}</a>
																</div>
																</div>
																</div>
																</div>
															</div>
														</c:forEach>
														<div id="add-litigation">
														</div>
													</c:otherwise>
												</c:choose>

												<div class="form-group row">
													<input type="button"
														class="btn btn-sm btn-success  pull-right"
														id="litigationId" value="Save" />
														 <input type="button"  class="btn btn-sm btn-Primary btn-add-Litigation pull-right" id="btn-add-Litigation" value="Add More" />	
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
							
							<!------------------------------Modification Details  -------------------------------> 
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
											<form action="updateModificationDetails" method="post"
												enctype="multipart/form-data" class="form-horizontal "
												id="modificationForm">
<div style="border-style: ridge; padding: 20px; background-color: #F8F8F8;">
												<c:choose>
													<c:when test="${ empty quarter.modificationDetails}">
														
														<div class="form-group row">
														<p style="text-align:left"><font color="red">* Note: Section 14 to be followed for any modification.</font></p>
															<label class="col-md-3 form-control-label">Is any
																there modification to approvals? </label>
															<div class="col-md-9">
																<label class="radio-inline"
																	for="isModificationRequiredToApprove"> <input
																	type="radio" id="isModificationRequiredToApprove"
																	name="isModificationRequiredToApprove" value="Yes"
																	class="requiredValFld"
																	onclick="showModificationDetails();">Yes <span
																	class='requiredValFldMsg'> Please select Yes/No
																</span>
																</label> <label class="radio-inline" for="inline-radio2">
																	<input type="radio"
																	id="isModificationRequiredToApprove"
																	name="isModificationRequiredToApprove" value="No"
																	onclick="hideModificationDetails();">No
																</label>
															</div>
														</div>
														<div id="modificationdetails" style="display: none;">
															<div class="form-group row">
																<label class="col-md-3 form-control-label"
																	for="text-input">Issued by Authority</label>
																<div class="col-md-9">
																	<input type="text" id="text-input"
																		name="issuedByAuthority"
																		class="form-control requiredValFld"
																		placeholder="Authority Name"> <span
																		class='requiredValFldMsg'> Please select Issued
																		by Authority</span>
																</div>
															</div>
															<div class="form-group row">
																<label class="col-md-3 form-control-label"
																	for="file-input">Upload approval document </label>
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
																		class='dynaselectfld requiredValFld'
																		onclick="showMoreModificationDetails();">Yes <span
																		class='requiredValFldMsg'> Please select yes/No</span>
																	</label> <label class="radio-inline" for="isAssocitionFormed">
																		<input type="radio" id="isAssocitionFormed"
																		name='writtenConsentOfAllotee' value="No"
																		onclick="hideMoreModificationDetails();">No
																	</label>
																</div>
															</div>
															<div id="moremodificationdetails" style="display: none;">
																<div class="form-group row">
																	<label class="col-md-3 form-control-label"
																		for="file-input">Upload document</label>
																	<div class="col-md-9">
																		<input type="file" id="file-input" name="uploadDoc"
																			class="form-control requiredValFld"> <span
																			class='requiredValFldMsg'> Please select
																			Upload document</span>
																	</div>
																</div>
																<div class="form-group row">
																	<label class="col-md-3 form-control-label"
																		for="file-input">Modified Plan </label>
																	<div class="col-md-9">
																		<input type="file" id="file-input" name="modifiedDoc"
																			class="form-control requiredValFld"> <span
																			class='requiredValFldMsg'> Please Upload
																			Modified Plan</span>
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
															<p style="text-align:left"><font color="red">* Note: Section 14 to be followed for any modification.</font></p>
																<label class="col-md-3 form-control-label">Is
																	any there modification to approvals? </label>
																<c:choose>
																	<c:when
																		test="${modificationDetailsObj.isModificationRequiredToApprove == 'Yes'}">
																		<div class="col-md-9">
																		
																			<label class="radio-inline"
																				for="isModificationRequiredToApprove"> <input
																				type="radio" id="isModificationRequiredToApprove"
																				name='isModificationRequiredToApprove' onclick="showModificationDetails();" value="Yes"
																				class='dynaselectfld requiredValFld'
																				checked="checked">Yes
																			</label> <label class="radio-inline"
																				for="isModificationRequiredToApprove"> <input
																				type="radio" id="isModificationRequiredToApprove" onclick="hideModificationDetails();"
																				name='isModificationRequiredToApprove' value="No">No
																			</label>
																		</div>
																	</c:when>
																	<c:otherwise>
																		<div class="col-md-9">
																			<label class="radio-inline"
																				for="isModificationRequiredToApprove"> <input
																				type="radio" id="inline-radio1" onclick="showModificationDetails();"
																				name='isModificationRequiredToApprove' value="Yes">Yes
																			</label> <label class="radio-inline" for="isAssocitionFormed">
																				<input type="radio" id="inline-radio2" onclick="hideModificationDetails();"
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
																					for="writtenConsentOfAllotee"> <input
																					type="radio" id="writtenConsentOfAllotee" onclick="showMoreModificationDetails();"
																					name='writtenConsentOfAllotee' value="Yes"
																					class='dynaselectfld requiredValFld'
																					checked="checked">Yes
																				</label> <label class="radio-inline"
																					for="writtenConsentOfAllotee"> <input onclick="hideMoreModificationDetails();"
																					type="radio" id="writtenConsentOfAllotee"
																					name='writtenConsentOfAllotee' value="No">No
																				</label>
																			</div>
																		</c:when>
																		<c:otherwise>
																			<div class="col-md-9">
																				<label class="radio-inline"
																					for="writtenConsentOfAllotee"> <input
																					type="radio" id="inline-radio1" onclick="showMoreModificationDetails();"
																					name='writtenConsentOfAllotee' value="Yes">Yes
																				</label> <label class="radio-inline"
																					for="writtenConsentOfAllotee"> <input
																					type="radio" id="inline-radio2" onclick="hideMoreModificationDetails();"
																					name='writtenConsentOfAllotee' value="No"
																					checked="checked">No
																				</label>
																			</div>
																		</c:otherwise>
																	</c:choose>
																</div>
																
																<div id="moremodificationdetails">
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
							
							<!------------------------------Association Details  -------------------------------> 
							<div class="panel-group" id="accordion">
								<div class="panel panel-primary">
									<div class="panel-heading card-header collapsed"
										data-toggle="collapse" data-target="#bar12">
										<i class="fa fa-fw fa-chevron-down"></i> <i
											class="fa fa-fw fa-chevron-right"></i> Association of
										Allottees

									</div>
									<div class="panel-body">
										<!-- The inside div eliminates the 'jumping' animation. -->
										<div class="collapse" id="bar12">
											<form:form action="updateAssociationDetails" method="post"
												enctype="multipart/form-data" class="form-horizontal"
												id="associationForm">
									<div style="border-style: ridge; padding: 20px; background-color: #F8F8F8;">
												<c:choose>
													<c:when test="${ empty quarter.associationDetails}">
														<div class="form-group row"></div>
														<div class="form-group row">
															<label class="col-md-3 form-control-label"> Is
																any Association formed? </label>
															<div class="col-md-9">
																<label class="radio-inline" for="inline-radio1"><input
																	type="radio" name="isAssocitionFormed" value="Yes"
																	class="requiredValFld"
																	onclick="showAssociationDetails();">Yes <span
																	class='requiredValFldMsg'> Please select Is any
																		Association formed?</span> </label> <label class="radio-inline"
																	for="inline-radio2"> <input type="radio"
																	name="isAssocitionFormed" value="No"
																	onclick="hideAssociationDetails();">No
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
																	<span class='requiredValFldMsg'> Please select
																		Name of the Association</span>
																</div>
															</div>

															<div class="form-group row">
																<label class="col-md-3 form-control-label"
																	for="registeredDoc ">Registration document </label>
																<div class="col-md-9">
																	<input type="file" id="registeredDoc"
																		name="registeredDoc" class="requiredValFld"> <span
																		class='requiredValFldMsg'> Please upload
																		document</span>
																</div>
															</div>
														</div>
													</c:when>
													<c:otherwise>
														<div class="form-group row"></div>
														<div class="form-group row">
															<label class="col-md-3 form-control-label"> Is
																any Association formed? </label>
															<c:choose>
																<c:when
																	test="${quarter.associationDetails.isAssocitionFormed == 'Yes'}">
																	<div class="col-md-9">
																		<label class="radio-inline" for="isAssocitionFormed">
																			<input type="radio" id="isAssocitionFormed"
																			name='isAssocitionFormed' value="Yes" onclick="showAssociationDetails();"
																			class='dynaselectfld requiredValFld'
																			checked="checked">Yes
																		</label> <label class="radio-inline" for="isAssocitionFormed">
																			<input type="radio" id="isAssocitionFormed" onclick="hideAssociationDetails();"
																			name='isAssocitionFormed' value="No">No
																		</label>
																	</div>
																</c:when>
																<c:otherwise>
																	<div class="col-md-9">
																		<label class="radio-inline" for="isAssocitionFormed">
																			<input type="radio" id="inline-radio1" onclick="showAssociationDetails();"
																			name='isAssocitionFormed' value="Yes">Yes
																		</label> <label class="radio-inline" for="isAssocitionFormed">
																			<input type="radio" id="inline-radio2" onclick="hideAssociationDetails();"
																			name='isAssocitionFormed' value="No"
																			checked="checked">No
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
																	<span class='requiredValFldMsg'> Please select
																		Name of the Association</span>
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
								</div>
							</div>


						<!------------------------------Welfare Fund Details  -------------------------------> 
							<div class="panel-group" id="accordion">
								<div class="panel panel-primary">
									<div class="panel-heading card-header collapsed"
										data-toggle="collapse" data-target="#bar15">
										<i class="fa fa-fw fa-chevron-down"></i> <i
											class="fa fa-fw fa-chevron-right"></i> Construction Workers
										Welfare Fund Registration
									</div>
									<div class="panel-body">
										<!-- The inside div eliminates the 'jumping' animation. -->
										<div class="collapse" id="bar15">
											<form:form action="updateProjectConstructionWelfareDetails"
												method="post" enctype="multipart/form-data"
												class="form-horizontal" id="updateProjectWelfareFundDetails">
												<div style="border-style: ridge; padding: 20px; background-color: #F8F8F8;">
												<c:choose>
													<c:when test="${ empty quarter.projectWelfareFundDetails}">
														<div class="form-group row"></div>
														<div class="form-group row">
															<label class="col-md-3 form-control-label"> Is
																Welfare Fund Registration Applicable </label>
															<div class="col-md-9">
																<label class="radio-inline" for="inline-radio1"><input
																	type="radio" name="isApplicable" value="Yes"
																	class="requiredValFld" onclick="showWelfareDetails();">Yes
																	<span class='requiredValFldMsg'> </span> </label> <label
																	class="radio-inline" for="inline-radio2"> <input
																	type="radio" name="isApplicable" value="No"
																	onclick="hideWelfareDetails();">No
																</label>
															</div>
														</div>

														<div id="welfaredetails" style="display: none;">
															<div class="form-group row">
																<label class="col-md-3 form-control-label"
																	for="projecteFundRegNo">Registration No Of
																	WelFare Fund</label>
																<div class="col-md-9">
																	<input type="text" id="associationName"
																		name="projecteFundRegNo"
																		class="form-control requiredValFld" placeholder="">
																	<span class='requiredValFldMsg'> Please select
																		Registration</span>
																</div>
															</div>

															<div class="form-group row">
																<label class="col-md-3 form-control-label"
																	for="welfareFundregisteredDoc">Registration
																	document </label>
																<div class="col-md-9">
																	<input type="file" id="welfareFundregisteredDoc" 
																		name="welfareFundregisteredDoc" class="requiredValFld">
																	<span class='requiredValFldMsg'> Please upload document</span>
																</div>
															</div>
														</div>
													</c:when>
													<c:otherwise>
														<div class="form-group row"></div>
														<div class="form-group row">
															<label class="col-md-3 form-control-label"> Is
																Welfare Fund Registration Applicable </label>
															<c:choose>
																<c:when
																	test="${quarter.projectWelfareFundDetails.isApplicable == 'Yes'}">
																	<div class="col-md-9">
																		<label class="radio-inline" for="isApplicable">
																			<input type="radio" id="isApplicable" onclick="showWelfareDetails();"
																			name='isApplicable' value="Yes"
																			class='dynaselectfld requiredValFld'
																			checked="checked">Yes
																		</label> <label class="radio-inline" for="isApplicable">
																			<input type="radio" id="isApplicable" onclick="hideWelfareDetails();"
																			name='isApplicable' value="No">No
																		</label>
																	</div>
																</c:when>
																<c:otherwise>
																	<div class="col-md-9">
																		<label class="radio-inline" for="isApplicable">
																			<input type="radio" id="inline-radio1" onclick="showWelfareDetails();"
																			name='isApplicable' value="Yes">Yes
																		</label> <label class="radio-inline" for="isApplicable">
																			<input type="radio" id="inline-radio2" onclick="hideWelfareDetails();"
																			name='isApplicable' value="No" checked="checked">No
																		</label>
																	</div>
																</c:otherwise>
															</c:choose>
														</div>

														<div id="welfaredetails">
															<div class="form-group row">
																<label class="col-md-3 form-control-label"
																	for="projecteFundRegNo">Registration No Of
																	WelFare Fund</label>
																<div class="col-md-9">
																	<input type="text" id="projecteFundRegNo"
																		name="projecteFundRegNo"
																		value="${quarter.projectWelfareFundDetails.projecteFundRegNo}"
																		class="form-control requiredValFld" placeholder="">

																</div>
															</div>

															<div class="form-group row">
																<label class="col-md-3 form-control-label"
																	for="welfareFundregisteredDoc">Registration
																	document </label>
																<div class="col-md-9">
																	<input type="hidden" name="welfareFundregisteredDocId"
																		value="${quarter.projectWelfareFundDetails.welfareFundregisteredDoc.documentId}" />
																	<input type="file" name="welfareFundregisteredDoc"
																		title="Only image or pdf file is allowed. file size upto 1 MB">
																	<a
																		href='<%=request.getContextPath() %>/download?DOC_ID=${quarter.projectWelfareFundDetails.welfareFundregisteredDoc.documentId}'>
																		${quarter.projectWelfareFundDetails.welfareFundregisteredDoc.fileName}</a>
																</div>
															</div>
														</div>

													</c:otherwise>
												</c:choose>
												</div>
												<br/>
												<div class="form-group row">
													<input type="button"
														class="btn btn-sm btn-success pull-right"
														id="projectWelFareId" value="Save" />
													<!-- <button type="reset"
														class="btn btn-sm btn-danger pull-right">
														<i class="fa fa-ban"></i> Reset
													</button> -->
												</div>
											</form:form>
										</div>
									</div>
								</div>
							</div>
							
							<!------------------------------Bank details  ------------------------------->
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
											<form:form action="updateProjectBankDetails" method="post"
												enctype="multipart/form-data" class="form-horizontal"
												id="bankForm" modelAttribute="projectRegistrationModel">
												<div style="border-style: ridge; padding: 20px; background-color: #F8F8F8;">
												<c:choose>
													<c:when test="${ empty quarter.bankDetails}">
														<div class="form-group row"></div>
														<div class="form-group row">
															<label class="col-md-3 form-control-label"
																for="percentageOfProjectCompletion">Percentage
																of completion of project</label>
															<div class="col-md-9">
																<input type="number" id="percentageOfProjectCompletion"
																	name="percentageOfProjectCompletion" maxlength="3"
																	class="form-control requiredValFld" placeholder="">
																<span class='requiredValFldMsg'> Please Select
																	Percentage of completion of project</span>
															</div>
														</div>

														<div class="form-group row">
															<label class="col-md-3 form-control-label"
																for="totAdvanceAmt">Total advance amount
																collected from prospective purchasers (INR) in this
																Quarter </label>
															<div class="col-md-9">
																<input type="number" id="totAdvanceAmt"
																	name="totAdvanceAmt"
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
															<font color="red">* Please refer RERA portal for
																the Certificate Format</font>
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
																for="financialReport">Quarterly Financial Report
															</label>
															<div class="col-md-9">
																<input type="file" id="financialReport"
																	name="financialReport"
																	class="form-control requiredValFld">
															</div>
														</div>
														</div>

														<div id="annualReport">
															<div class="form-group row">
																<label class="col-md-3 form-control-label"
																	for="annualfinancialReport">Annual Financial
																	Report </label>
																<div class="col-md-9">
																	<input type="file" id="annualfinancialReport"
																		name="annualfinancialReport"
																		class="form-control requiredValFld">
																</div>
															</div>
														</div>
													</c:when>
													<c:otherwise>
														<div class="form-group row">
															<label class="col-md-3 form-control-label"
																for="percentageOfProjectCompletion">Percentage
																of completion of project</label>
															<div class="col-md-9">
																<input type="number"
																	value="${quarter.bankDetails.percentageOfProjectCompletion}" maxlength="3"
																	name="percentageOfProjectCompletion"
																	class="form-control requiredValFld" placeholder="Only digits are allowed">
																<span class='requiredValFldMsg'> Please Select
																	Percentage of completion of project</span>
															</div>
														</div>
														<div class="form-group row">
															<label class="col-md-3 form-control-label"
																for="totAdvanceAmt">Total advance amount
																collected from prospective purchasers (in INR) </label>
															<div class="col-md-9">
																<input type="number" id="totAdvanceAmt"
																	name="totAdvanceAmt"
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
																<a
																	href='<%=request.getContextPath() %>/download?DOC_ID=${quarter.bankDetails.certificateIssuedByArchitect.documentId}'>
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
														<input type="file" id="financialReport" name="financialReport"
															title="Only image or pdf file is allowed. file size upto 1 MB">
														<a
															href='<%=request.getContextPath() %>/download?DOC_ID=${quarter.bankDetails.financialReport.documentId}'>
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
								</div>
							</div>

						<!------------------------------Construction cost Details  -------------------------------> 
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
												action="updateConstructionCostDetails"
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
															<c:when test="${not empty projectRegistrationModel.projectDetailsModel.constructionCostModel.constructionCostList}">
															<c:choose>
																<c:when test="${empty quarter.quarterConstructionCostList}">
																
																	<tr>
																		<%-- <td><input type="hidden" value="${quarter.constructionCostQuarteDetlsl.constructionCostDetailsId }"
																			name="constructionCostDetailsId" /></td> --%>
																	</tr>
																	<% int costCount = -1; %>
																	<c:forEach items="${projectRegistrationModel.projectDetailsModel.constructionCostModel.constructionCostList}" var="obj">

														<tr>
														<c:if test="${obj.isApplicable == 'Yes'}">
														 <% 
														 ++costCount;
														%>
															<td><%= costCount+1 %></td> 
													 <td><c:out value="${obj.consCostParticular}"></c:out> <%-- <input type="hidden" name="consCostParticularId" value="${obj.consCostParticularId}" />  --%>
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
																
																<%-- <tr>
																<td><input type="hidden" name="consCostParticularId" value="${obj.consCostParticularId}" /></td>
																 </tr> --%>
																	 <% int costCount = -1; %>
																	<c:forEach items="${quarter.quarterConstructionCostList}" var="obj">

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
																	<td colspan="6" style="width: 100%;">Note : Please
																		enter the Construction Cost Details to update Every
																		Quarter</td>
																</tr>
																</c:otherwise>
															</c:choose>
														</tbody>
														<!-- 	<tfoot id="totals">
									<tr>
										<td></td>
										<td style="padding-left: 25%;"><input type="button"
											value="Caluclate Total construction cost"
											class="btn btn-info" id="btn" /></td>
										<td><input type="text" name="estTotConstructionCost"
											class="form-control requiredValFld totalEstConstructionval"
											readonly="readonly"> <span class='requiredValFldMsg'>
												Please click on Caluclate Total construction cost button</span></td>
										<td><input type="text"  name="actTotConstructionCost"
											class="form-control requiredValFld totalActConstructionval"
											readonly="readonly"> <span class='requiredValFldMsg'>
												Please click on Caluclate Total construction cost button</span></td> 
									</tr>
								</tfoot> -->
													</table>

													<%-- <div class="row">
														<div style="padding-left: 50px; padding-right: 50px;">
															<table
																class="table table-bordered table-striped table-condensed">
																<thead>
																	<tr>


																	</tr>
																</thead>
																<tbody id="tb">
																	<tr>
																		<td>Total Estimated Construction Cost As declared
																			at the time of Registration :</td>
																		<td><input type="text" name="taxAmt"
																			value="${projectRegistrationModel.projectDetailsModel.estimatedCost}"
																			class="form-control requiredValFld totalSum"
																			readonly="true" placeholder="only digits are allowed">
																			<span class=''></span></td>
																	</tr>
																</tbody>
															</table>
														</div>
														<div class="col-md-3"></div>
													</div> --%>
													<input type="button"
														class="btn btn-sm btn-success  pull-right"
														style="width: 150px;" id="constructionCostId"
														value=" Save" />
												</div>
												<!--                         <button type="button" class="btn btn-warning btn-sm pull-right" onclick="constructionCostForm()"> Update </button> -->


											</form:form>
										</div>
									</div>
								</div>
							</div>
                   

							<br>
							<br> 
							
							<c:if test="${(not empty quarter.buildingDetails)&&(not empty quarter.subStructureList)&&(not empty quarter.superStructureList)
&&(not empty quarter.finishingOrInteriorWorkList)&&(not empty quarter.infrastructureDetails)&&(not empty quarter.externalinfrastructureDetails)
&&(not empty quarter.amenityList)&&(not empty quarter.commonAreaDetails)&&(not empty quarter.approvalsAndNOCDetails)&&(not empty quarter.litigationDetails)
&&(not empty quarter.modificationDetails)&&(not empty quarter.associationDetails)&&(not empty quarter.projectWelfareFundDetails)&&(not empty quarter.bankDetails)
&&(not empty quarter.quarterConstructionCostList)&&(quarter.bankDetails.percentageOfProjectCompletion !='100')}">

							<a href="<%=request.getContextPath()%>/quarter/projectQuarterDetails?quarterId=${quarter.quaterlyId}"
								style="padding-left: 400px;"> <input type="button"
								class="btn btn-sm btn-primary" width="50px;" id="QuarterSubmit"
								value="Quarter Submit" />
							</a>
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
                <a href="http://www.keyfalconsolutions.com/">Branding</a> © 2017 Developers.
            </span>
        <span class="pull-right">
                Powered by <a href="http://www.keyfalconsolutions.com/">Keyfalcon Solutions</a>
            </span>
    </footer>
 -->

</body>

</html>