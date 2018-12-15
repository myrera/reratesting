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
<!--
 * GenesisUI - Bootstrap 4 Admin Template
 * @version v1.5.8
 * @link https://genesisui.com
 * Copyright (c) 2016 creativeLabs Łukasz Holeczek
 * @license Commercial
 -->
<!DOCTYPE html>
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
	href="<%=request.getContextPath()%>/resources/postprojregistration/img/favicon.png">
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

<style>
table {
width:100%;!important;
}

th, td {
    width: 5%;!important;
    border: 0.5px solid black ;!important;
}
</style>
<title>Project Details</title>

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

	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Modal Header</h4>
				</div>
				<div class="modal-footer"></div>
			</div>

		</div>
	</div>



	<div class="container-fluid">
<div class="panel-group" id="accordion">
<div class="panel-group" id="accordion">
								<div class="panel panel-primary">
								<!-- 	<div class="panel-heading card-header collapsed"
										data-toggle="collapse" data-target="#bar12">
										<i class="fa fa-fw fa-chevron-down"></i> <i
											class="fa fa-fw fa-chevron-right"></i> Garage and Parking Details as declared at the time of Registration

									</div> -->
									<div class="panel-body">
										<!-- The inside div eliminates the 'jumping' animation. -->
										<div class="collapse" id="bar12">
											
												<div class="form-group row">
												<label class="col-md-3 form-control-label"
													for="totNoOfGarages">Total No. of Garages</label>
												<div class="col-md-9">
													<input name="totNoOfGarages" id="totNoOfGarages" value="${projectRegistrationModel.projectDetailsModel.noOfGarageForSale}"
														class="form-control " readOnly="true"
														placeholder="only digits are allowed" />
												</div>
											</div>
										
											<div class="form-group row">
												<label class="col-md-3 form-control-label"
													for="costOfOwnership">Total No. of Open Car Parking</label>
												<div class="col-md-9">
												
											 <c:choose>
											    <c:when test="${empty projectRegistrationModel.projectDetailsModel.areaOfParkinfForSale}">
											       <input name="totNoOfOpenCarParking"  value="0" id="totNoOfOpenCarParking" readOnly="true" class="form-control" placeholder="only digits are allowed" />
											    </c:when>
											    <c:otherwise>
											        <input name="totNoOfOpenCarParking"  value="${projectRegistrationModel.projectDetailsModel.areaOfParkinfForSale}" id="totNoOfOpenCarParking" readOnly="true" class="form-control "
													placeholder="only digits are allowed" />
											    </c:otherwise>
											</c:choose>
									
												</div>
												<br/>
<!-- <p style="text-align:left"><font color="red">* Open Car Parking should not in the offset Area</font></p> -->
											</div>
											<div class="form-group row">
												<label class="col-md-3 form-control-label"
													for="totNoOfClosedCarParking">Total No. of Closed Car
													Parking</label>
												<div class="col-md-9">
												
 <c:choose>
    <c:when test="${empty projectRegistrationModel.projectDetailsModel.noOfCoveredParkingForSale}">
      <input name="totNoOfClosedCarParking" value="0" id="totNoOfClosedCarParking"  readOnly="true" class="form-control" placeholder="only digits are allowed" />
    </c:when>
    <c:otherwise>
       <input name="totNoOfClosedCarParking" value="${projectRegistrationModel.projectDetailsModel.noOfCoveredParkingForSale}" id="totNoOfClosedCarParking"  readOnly="true" class="form-control "
														placeholder="only digits are allowed" />
    </c:otherwise>
</c:choose>
											
										</div>
									</div>
								</div>
							</div>
							<c:if test="${projectRegistrationModel.projectDetailsModel.towerDetailsList.size()>0}">
							
								<div class="panel panel-primary">
									<div class="panel-heading card-header collapsed"
										data-toggle="collapse" data-target="#bar2">
										<i class="fa fa-fw fa-chevron-down"></i> <i
											class="fa fa-fw fa-chevron-right"></i> Registered Towers ( <c:out value="${projectRegistrationModel.projectDetailsModel.towerDetailsList.size()}"></c:out>
											out of <c:out value="${noOfTowers}"></c:out> Towers )
									</div>
									<div class="panel-body">
										<!-- The inside div eliminates the 'jumping' animation. -->
										<div class="collapse" id="bar2">
										<div class="row">
								<div class="col-md-12">
										<c:forEach items="${projectRegistrationModel.projectDetailsModel.towerDetailsList}" var="tower">
<%-- <p><li>${tower.towerName}</li></p> --%>
<div class="panel panel-primary">
									<div class="panel-heading card-header collapsed"
										data-toggle="collapse" data-target="#bar_${tower.towerDetailsId}">
										<i class="fa fa-fw fa-chevron-down"></i> <i
											class="fa fa-fw fa-chevron-right"></i> ${tower.towerName}
									</div>
									<div class="panel-body">
										<div class="collapse" id="bar_${tower.towerDetailsId}">
										<div class="trower-div"
											style=" padding: 20px; background-color: #F8F8F8;">
											
											<div class="form-group row">
											  <input type="hidden" name="towerDetailsId" value=""/>
												<label class="col-md-3 form-control-label"
													for="towerName">Tower Name</label>
												<div class="col-md-9">
													<input name="towerName" id="towerName" readOnly value="${tower.towerName}"
														name="towerName" class="form-control requiredValFld"
														placeholder="Enter Tower Name" />
												</div>
												
											</div>
											<div class="form-group row">
												<label class="col-md-3 form-control-label"
													for="towerName">Type of Apartment</label>
												<div class="col-md-9">
													<input name="apartmentType" id="apartmentType" readOnly value="${tower.apartmentType}"
														name="towerName" class="form-control requiredValFld"
														placeholder="Enter Tower Name" />
												</div>
												
											</div>
											
											<div class="form-group row">
												<label class="col-md-3 form-control-label"
													for="costOfOwnership">No. of Floors </label>
												<div class="col-md-9">
													<input name="totNoOfFloor" readOnly value="${tower.totNoOfFloor}" id="totNoOfFloor"
														class="form-control requiredValFld"
														placeholder="only digits are allowed" />
												</div>
												</div>
												
												<%-- <c:choose>
											<c:when test="${projectRegistrationModel.projectDetailsModel.towerDetailsList.size()==0}">
											<div class="form-group row">
												<label class="col-md-3 form-control-label"
													for="totalNoOfTowers">Total No. of Towers </label>
												<div class="col-md-9">
													<input type="number" readOnly name="totalNoOfTowers" id="totalNoOfTowers"
														class="form-control requiredValFld" value="${noOfTowers}"
														placeholder="only digits are allowed" />
												</div>
											</div>
											</c:when>
											<c:otherwise>
											<input type="hidden" name="totalNoOfTowers" id="totalNoOfTowers"
														class="form-control requiredValFld"
														placeholder="only digits are allowed" />
											</c:otherwise>
											</c:choose> --%>
										
											<div class="form-group row">
												<label class="col-md-3 form-control-label"
													for="totApartments">Total No of Units</label>
												<div class="col-md-9">
													<input name="totApartments" id="totApartments" readOnly value="${tower.totApartments}"
														class="form-control requiredValFld"
														placeholder="only digits are allowed" />
												</div>
											</div>
										
											<div class="form-group row">
												<label class="col-md-3 form-control-label"
													for="totNoOfBasement">No. of Basement</label>
												<div class="col-md-9">
													<input name="totNoOfBasement" readOnly value="${tower.totNoOfBasement}" id="totNoOfBasement"
														class="form-control requiredValFld"
														placeholder="only digits are allowed" />
												</div>
											</div>
											<div class="form-group row">
												<label class="col-md-3 form-control-label"
													for="totNoOfStills">No. of Stilts</label>
												<div class="col-md-9">
													<input name="totNoOfStills" readOnly value="${tower.totNoOfStills}" id="totNoOfStills"
														class="form-control requiredValFld"
														placeholder="only digits are allowed" />
												</div>
											</div>
											<div class="form-group row">
												<label class="col-md-3 form-control-label"
													for="totNoOfSlabsOfSuperStructure">No. of slab of super
													structure</label>
												<div class="col-md-9">
													<input name="totNoOfSlabsOfSuperStructure" readOnly value="${tower.totNoOfSlabsOfSuperStructure}" id="totNoOfSlabsOfSuperStructure"
														class="form-control requiredValFld"
														placeholder="only digits are allowed" />
												</div>
											</div>
									<%-- 		<div class="form-group row">
												<label class="col-md-3 form-control-label"
													for="totNoOfGarages">Total No. of Garages</label>
												<div class="col-md-9">
													<input name="totNoOfGarages" id="totNoOfGarages" value="${tower.totNoOfGarages}"
														class="form-control " readOnly="true"
														placeholder="only digits are allowed" />
												</div>
											</div>
											<div class="form-group row">
												<label class="col-md-3 form-control-label"
													for="costOfOwnership">Total No. of Open Car Parking</label>
												<div class="col-md-9">
											        <input name="totNoOfOpenCarParking"  value="${tower.totNoOfOpenCarParking}" id="totNoOfOpenCarParking" readOnly="true" class="form-control "
													placeholder="only digits are allowed" />
												</div>
											</div>
											<div class="form-group row">
												<label class="col-md-3 form-control-label"
													for="totNoOfClosedCarParking">Total No. of Closed Car
													Parking</label>
												<div class="col-md-9">
       <input name="totNoOfClosedCarParking" value="${tower.totNoOfClosedCarParking}" id="totNoOfClosedCarParking"  readOnly="true" class="form-control "
														placeholder="only digits are allowed" />

		</div>
		</div> --%>
		
		</div>
		<c:if test="${not empty tower.towerUnitDetailsList }">
		<div style="overflow-x:auto;">
		<table >
																<thead>
																	<tr>
																		<th>floor No</th>
																		<th>Unit No</th>
																		<th>Carpet Area</th>
																		<th>Common Area Alloted</th>
																		<th>Exclusive Common Area Allotee</th>
																		<th>Common Area Alloted To Association</th>
																		<th>Undivided Share</th>
																		<th>No of parking lots</th>
																	</tr>
																</thead>
																<tbody>
																	<c:forEach items="${tower.towerUnitDetailsList}"
																		var="towerunit">
																		<tr>
																			<td><input type="text" name="floorNo" readOnly value="${towerunit.floorNo }" /></td>
																			<td><input type="text" name="unitNo" readOnly value="${towerunit.unitNo }" /></td>
																			<td><input type="text" name="unitType" readOnly value="${towerunit.unitType }" /></td>
																			<td><input type="text" name="carpetArea" readOnly value="${towerunit.carpetArea }" /></td>
																			<td><input type="text" name="exclusiveCommonAreaAllote" readOnly value="${towerunit.exclusiveCommonAreaAllote }" /></td>
																			<td><input type="text" name="commonAreaAllotedTo" readOnly value="${towerunit.commonAreaAllotedTo }" /></td>
																			<td><input type="text" name="unDevidedShare" readOnly value="${towerunit.unDevidedShare }" /></td>
																			<td><input type="text" name="noOfParkingLots" readOnly value="${towerunit.noOfParkingLots }" /></td>
																			
																		</tr>
																	</c:forEach>
																</tbody>
															</table>
															</div>
															
															</c:if>
															<br><br>
											</div>
										</div>
										</div>
										</c:forEach>
										</div>

</div>
										</div>
										</div>
										</div>
										<br/>
										
										<c:if test="${projectRegistrationModel.projectDetailsModel.towerDetailsList.size() == noOfTowers}">
											<div class="add-more" style="border-style: ridge; padding-left: 20px; padding-right: 20px; padding-top: 20px; background-color: #F8F8F8;">
											
											
												
											<div class="form-group row">
												<p><b><font style="color:red;font-size:14px !important;padding-left:40px;">* Note : </font></b><b style="font-size:14px !important;">It's Manadatory to download the excel sheet and fill the unit wise details once you fill all required tower details </b></p>
													<label class="col-md-4 form-control-label" 	for="costOfOwnership">Download Template to upload Unit Details </label>
												<div class="col-md-2">
												 <a href="DownloadTowerDetailsExcel"><button type="button" class="btn btn-success btn-sm pull-right">Download Excel and Fill</button></a> 
												</div>
											<p style="text-align:right">Click here for <a href="/reraapp/resources/staticpage/template.xls" target="_blank" style="font-size: 15px;">Unit Details Excel User Manual</a></p>
											</div>
							</br>
							</br>
											
											 <form:form class="form-horizontal" autocomplete="off" action="uploadExcel" modelAttribute="projectRegistrationModel" enctype="multipart/form-data" id="uploadexcelForm" method="post">
											<div class="form-group row">
												<label class="col-md-3 form-control-label"
													for=""><span style="color:red; !important">*</span> Upload Unit Details Sheet  </label>
													
													<c:choose>
													<c:when test="${empty projectRegistrationModel.projectDetailsModel.unitdetailsExcelFile}">
															<div class="col-md-3">
													<input name="unitdetailsExcelFile" type = "file"  value="" id="unitdetailsExcelFile"
														class="form-control " placeholder="only digits are allowed" />
												</div>
													<div class="col-md-3">
													<button type="button" id ="uploadexcelId" class="btn btn-primary btn-sm pull-right">Upload Template</button>
												</div>
													</c:when>
													<c:otherwise>
															<div class="col-md-3">
													<input name="unitdetailsExcelFile" type = "file"  value="" id="unitdetailsExcelFile" class="form-control " />
														<a href='<%=request.getContextPath() %>/download?DOC_ID=${projectRegistrationModel.projectDetailsModel.unitdetailsExcelFile.documentId}'>
																			${projectRegistrationModel.projectDetailsModel.unitdetailsExcelFile.fileName}</a>
												</div>
													<div class="col-md-3">
													<button type="button" id ="uploadexcelId" class="btn btn-primary btn-sm pull-right">Upload Template</button>
												</div>
													
													</c:otherwise>
													</c:choose>
											</div>
											</form:form>
									
											</div>
											
											
											<br/>
										</c:if>
										</c:if>
										</div>
										
										
										
										
										<%-- 
										<c:if test="${not empty projectRegistrationModel.projectDetailsModel.towerDetailsList}">
										<c:if test="${projectRegistrationModel.projectDetailsModel.towerDetailsList.size()<noOfTowers}"> --%>
										
										
				<c:choose>
				<c:when test="${projectRegistrationModel.projectDetailsModel.towerDetailsList.size()==0}">						
		<div class="row">
			<div class="col-sm-12">
				<div class="card">
					<div class="row">
						
						<div class="card-block">
							<div class="panel-body">
								 <form:form class="form-horizontal" autocomplete="off" action="updateTowerDetails" modelAttribute="projectRegistrationModel" enctype="multipart/form-data" id="towerForm" method="post">
								 <div class="trower-div"
											style=" padding: 20px; background-color: #F8F8F8;">
	
	
											<c:choose>
											<c:when test="${projectRegistrationModel.projectDetailsModel.towerDetailsList.size()==0}">
											<div class="form-group row">
												<label class="col-md-3 form-control-label"
													for="totalNoOfTowers">Total No. of Towers </label>
												<div class="col-md-3">
													<input type="number" name="totalNoOfTowers" id="totalNoOfTowers"
														class="form-control requiredValFld"
														placeholder="only digits are allowed" />
												</div>
											</div>
											</c:when>
											<c:otherwise>
											<input type="hidden" name="totalNoOfTowers" id="totalNoOfTowers"
														class="form-control requiredValFld" value="${noOfTowers}"
														placeholder="only digits are allowed" />
											</c:otherwise>
											</c:choose>
								<div class="form-group row">
							 <h4>Add New Tower </h4> 
											<!-- 	<label class="col-md-3 form-control-label"
													for="costOfOwnership">No. of towers </label>
												<div class="col-md-9">
													<input name="totNoOfTower" id="totNoOfTower"
														class="form-control requiredValFld"
														placeholder="only digits are allowed" />
												</div> -->
												
											
											</div>
											<div class="form-group row">
											  <input type="hidden" name="towerDetailsId" value=""/>
												<label class="col-md-3 form-control-label"
													for="towerName">Tower Name</label>
												<div class="col-md-3">
													<input name="towerName" id="towerName"
														name="towerName" class="form-control requiredValFld"
														placeholder="Enter Tower Name" />
												</div>
											</div>
											
										
											<div class="form-group row">
												<label class="col-md-3 form-control-label" for="apartmentType">
													Type of Apartment </label>
												<div class="col-md-9">
													<label class="radio-inline" for="apartmentType">
														<input type="radio" id="apartmentType"
														name="apartmentType" value="Residential"
														class='dynaselectfld requiredValFld' checked="checked">
														Residential
													</label>&nbsp;<label class="radio-inline" for="apartmentType">
														<input type="radio" id="apartmentType"
														name="apartmentType" value="Commercial"> Commercial
													</label>&nbsp;<label class="radio-inline" for="apartmentType">
														<input type="radio" id="apartmentType"
														name="apartmentType" value="Mixed"> Mixed
													</label>
												</div>
											</div>
											
											
											<div class="form-group row">
												<label class="col-md-3 form-control-label"
													for="costOfOwnership">No. of Floors </label>
												<div class="col-md-3">
													<input type="number" name="totNoOfFloor" id="totNoOfFloor"
														class="form-control requiredValFld"
														placeholder="only digits are allowed" />
												</div>
											</div>
											<p style="text-align:left"><font color="red">* Note : floor no. starts with 0, for e.g if number of floors=5 then floors will be ( 0, 1, 2, 3, 4, 5)</font></p>

											<div class="form-group row">
												<label class="col-md-3 form-control-label"
													for="totApartments">Total No of Units</label>
												<div class="col-md-3">
													<input type="number" name="totApartments" id="totApartments"
														class="form-control requiredValFld"
														placeholder="only digits are allowed" />
												</div>
											</div>
										
											<div class="form-group row">
												<label class="col-md-3 form-control-label"
													for="totNoOfBasement">No. of Basement</label>
												<div class="col-md-3">
													<input type="number" name="totNoOfBasement" id="totNoOfBasement"
														class="form-control requiredValFld"
														placeholder="only digits are allowed" />
												</div>
											</div>
											<div class="form-group row">
												<label class="col-md-3 form-control-label"
													for="totNoOfStills">No. of Stilts</label>
												<div class="col-md-3">
													<input type="number" name="totNoOfStills" id="totNoOfStills"
														class="form-control requiredValFld"
														placeholder="only digits are allowed" />
												</div>
											</div>
											<div class="form-group row">
												<label class="col-md-3 form-control-label"
													for="totNoOfSlabsOfSuperStructure">No. of slab of super
													structure</label>
												<div class="col-md-3">
													<input type="number" name="totNoOfSlabsOfSuperStructure" id="totNoOfSlabsOfSuperStructure"
														class="form-control requiredValFld"
														placeholder="only digits are allowed" />
												</div>
											</div>
												</div>
											</div>
											<br>
											
											<button type="button" class="btn btn-success btn-sm pull-right" id="towerFormId">Save & Continue</button>
											
											
										</div>
								 </form:form>
							</div>
						</div>
					</div>
				</div>
				</c:when>
				<c:otherwise>
				<c:if test="${projectRegistrationModel.projectDetailsModel.towerDetailsList.size()<noOfTowers}">
						<div class="row">
			<div class="col-sm-12">
				<div class="card">
					<div class="row">
						
						<div class="card-block">
							<div class="panel-body">
								 <form:form class="form-horizontal" autocomplete="off" action="updateTowerDetails" modelAttribute="projectRegistrationModel" enctype="multipart/form-data" id="towerForm" method="post">
								 <div class="trower-div"
											style=" padding: 20px; background-color: #F8F8F8;">
	<div class="form-group row">
	 <h4>Add New Tower </h4> 
											<!-- 	<label class="col-md-3 form-control-label"
													for="costOfOwnership">No. of towers </label>
												<div class="col-md-9">
													<input name="totNoOfTower" id="totNoOfTower"
														class="form-control requiredValFld"
														placeholder="only digits are allowed" />
												</div> -->
											</div>
											<div class="form-group row">
											  <input type="hidden" name="towerDetailsId" value=""/>
												<label class="col-md-3 form-control-label"
													for="towerName">Tower Name</label>
												<div class="col-md-3">
													<input name="towerName" id="towerName"
														name="towerName" class="form-control requiredValFld"
														placeholder="Enter Tower Name" />
												</div>
											</div>
											
										
											<div class="form-group row">
												<label class="col-md-3 form-control-label" for="apartmentType">
													Type of Apartment </label>
												<div class="col-md-9">
													<label class="radio-inline" for="apartmentType">
														<input type="radio" id="apartmentType"
														name="apartmentType" value="Residential"
														class='dynaselectfld requiredValFld' checked="checked">
														Residential
													</label>&nbsp;<label class="radio-inline" for="apartmentType">
														<input type="radio" id="apartmentType"
														name="apartmentType" value="Commercial"> Commercial
													</label>&nbsp;<label class="radio-inline" for="apartmentType">
														<input type="radio" id="apartmentType"
														name="apartmentType" value="Mixed"> Mixed
													</label>
												</div>
											</div>
											<div class="form-group row">
												<label class="col-md-3 form-control-label"
													for="costOfOwnership">No. of Floors </label>
												<div class="col-md-3">
													<input type="number" name="totNoOfFloor" id="totNoOfFloor"
														class="form-control requiredValFld"
														placeholder="only digits are allowed" />
												</div>
											</div>
											<p style="text-align:left"><font color="red">* Note : floor no. starts with 0, for e.g if number of floors=5 then floors will be ( 0, 1, 2, 3, 4, 5)</font></p>
											<c:choose>
											<c:when test="${projectRegistrationModel.projectDetailsModel.towerDetailsList.size()==0}">
											<div class="form-group row">
												<label class="col-md-3 form-control-label"
													for="totalNoOfTowers">Total No. of Towers </label>
												<div class="col-md-3">
													<input type="number" name="totalNoOfTowers" id="totalNoOfTowers"
														class="form-control requiredValFld"
														placeholder="only digits are allowed" />
												</div>
											</div>
											</c:when>
											<c:otherwise>
											<input type="hidden" name="totalNoOfTowers" id="totalNoOfTowers"
														class="form-control requiredValFld" value="${noOfTowers}"
														placeholder="only digits are allowed" />
											</c:otherwise>
											</c:choose>

											<div class="form-group row">
												<label class="col-md-3 form-control-label"
													for="totApartments">Total No of Units</label>
												<div class="col-md-3">
													<input type="number" name="totApartments" id="totApartments"
														class="form-control requiredValFld"
														placeholder="only digits are allowed" />
												</div>
											</div>
										
											<div class="form-group row">
												<label class="col-md-3 form-control-label"
													for="totNoOfBasement">No. of Basement</label>
												<div class="col-md-3">
													<input type="number" name="totNoOfBasement" id="totNoOfBasement"
														class="form-control requiredValFld"
														placeholder="only digits are allowed" />
												</div>
											</div>
											<div class="form-group row">
												<label class="col-md-3 form-control-label"
													for="totNoOfStills">No. of Stilts</label>
												<div class="col-md-3">
													<input type="number" name="totNoOfStills" id="totNoOfStills"
														class="form-control requiredValFld"
														placeholder="only digits are allowed" />
												</div>
											</div>
											<div class="form-group row">
												<label class="col-md-3 form-control-label"
													for="totNoOfSlabsOfSuperStructure">No. of slab of super
													structure</label>
												<div class="col-md-3">
													<input type="number" name="totNoOfSlabsOfSuperStructure" id="totNoOfSlabsOfSuperStructure"
														class="form-control requiredValFld"
														placeholder="only digits are allowed" />
												</div>
											</div>
												</div>
											</div>
											<br>
											
											<button type="button" class="btn btn-success btn-sm pull-right" id="towerFormId">Save & Continue</button>
											
											
										</div>
								 </form:form>
							</div>
						</div>
					</div>
				</div>
				</c:if>
				</c:otherwise>
				</c:choose>
				
				
				
				
			</div>
			<!--/col-->
		</div>

	</div>
	<!-- /.conainer-fluid --> </main>



</body>

</html>