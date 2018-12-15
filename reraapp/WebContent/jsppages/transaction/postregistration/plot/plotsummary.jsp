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

<title>Project Summary</title>
<style>
#totalSummaryCostMatching {
  display: none;
} 
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
                            <i class="fa fa-align-justify"></i> Project Summary : Registration Number  -  ${projectRegistrationModel.projectRegistrationNo}
                            <%--  <div class="col-md-6">
                             <select name="projectRegId" id="projectSummary"  class=" form-control  requiredValFld" style="width: 180px !important; min-width: 180px; max-width: 180px;vertical-align:right;" >
							<option value="0"> --Select-- </option>
							<c:forEach items="${projectList}" var="listmodal">
							<c:choose>
							<c:when test="${listmodal.projectRegId==projectRegistrationModel.projectRegId }">
								<option value="${listmodal.projectRegId}" selected="selected"> ${listmodal.applicationNo} </option>
							</c:when>
							<c:otherwise>
								<option value="${listmodal.projectRegId}"> ${listmodal.applicationNo} </option>
							</c:otherwise>
							</c:choose>
							</c:forEach>
							</select> 
                        </div> --%>
                        </div>
      
		<form:form class="form-horizontal" autocomplete="off"
			action="updatePlotSummaryDetails"
			modelAttribute="projectRegistrationModel"
			enctype="multipart/form-data" id="projectSummaryForm" method="post">
			<c:choose>
				<c:when test="${not empty projectRegistrationModel.projectDetailsModel.plotSummary}">
					<table class="table table-bordered table-striped table-condensed">
						<thead>

							<tr>
								<th>SlNo.</th>
								<th>Particulars</th>
								<th>Estimated Cost (in INR)</th>
								<th>Actual Cost (in INR)</th>

							</tr>

						</thead>

						<tbody>
							<tr>
								<td>1</td>
								<td>Land Cost</td>
								<td><input type="hidden"
									value="${projectRegistrationModel.projectDetailsModel.plotSummary.plotSummaryId }"
									name="plotSummaryId" />
									<input type="text" name="estLandCost" id="estLandCost"
									value="${projectRegistrationModel.projectDetailsModel.plotSummary.estLandCost }"
									class="requiredValFld"> <span class='requiredValFldMsg'>
										Please Enter Estimated Land Cost</span></td>
								<td><input type="number" name="actLandCost" id="actLandCost"
									value="${projectRegistrationModel.projectDetailsModel.plotSummary.actLandCost }"
									class="requiredValFld"> <span class='requiredValFldMsg'>
										Please Enter Actual Land Cost</span></td>
							</tr>

							<tr>
								<td>2</td>
								<td>Construction Cost</td>
								<td><input type="text" name="estConstructionCost" id="estConstructionCost"
									value="${projectRegistrationModel.projectDetailsModel.plotSummary.estConstructionCost}"
									class="requiredValFld"> <span class='requiredValFldMsg'>
										Please Enter Estimated Construction Cost</span></td>
								<td><input type="number" name="actConstructionCost" id="actConstructionCost"
									value="${projectRegistrationModel.projectDetailsModel.plotSummary.actConstructionCost }"
									class="requiredValFld"> <span class='requiredValFldMsg'>
										Please Enter Actual Construction Cost</span></td>

							</tr>
							<tr>
								<td>3</td>
								<td>Cost for Approvals, NOCs, Licenses and others</td>
								<td><input type="text" name="estCostOfApprove" id="estCostOfApprove"
									value="${projectRegistrationModel.projectDetailsModel.plotSummary.estCostOfApprove }"
									class="requiredValFld"> <span class='requiredValFldMsg'>
										Please Enter Estimated Cost Of Approve</span></td>
								<td><input type="number" name="actCostOfApprove" id="actCostOfApprove"
									value="${projectRegistrationModel.projectDetailsModel.plotSummary.actCostOfApprove }"
									class="requiredValFld"> <span class='requiredValFldMsg'>
										Please Enter Actual Cost Of Approve</span></td>
							</tr>
							<tr>
								
								<td colspan="2" style="padding-left:25%;"><input type="button"
											value="Caluclate Total Cost"
											class="btn btn-totalsummaryinfo" id="totalPlotSummary" /></td>
								<td><input type="text" name="estTotalCost" id="estTotalCost" value="${projectRegistrationModel.projectDetailsModel.plotSummary.estTotalCost }" class="form-control requiredValFld totalSum" readonly="true"></td>
								<td><input type="text" name="actTotalCost" id="actTotalCost" value="${projectRegistrationModel.projectDetailsModel.plotSummary.actTotalCost }" class="form-control requiredValFld totalSum" readonly="true"></td>
							</tr>
						</tbody>
					</table>
					
															<div class="row">
																	<div style="padding-left: 50px; padding-right: 50px;">
																		<table
																			class="table table-bordered table-striped table-condensed">
																			<thead>
																				<tr>
																					
																					
																				</tr>
																			</thead>
																			<tbody id="tb">
																			<tr>
																			<td>Total Project Cost As declared at the time of Registration :
																			</td>
																			<td><input type="text" name="taxAmt" id="projectCost" value="${projectRegistrationModel.projectDetailsModel.totalProjectCost}"
																						class="form-control requiredValFld totalSum" readonly="true"
																						placeholder="only digits are allowed"> <span
																						></span></td>
																			</tr>
																			<tr id="totalSummaryCostMatching" bgcolor="#ff9999">
																			<td colspan="2">Total Estimated and Actual Costs are not matching</td>
																			
																			</tr>
																			</tbody>
																			</table>
																	</div>
																	<div class="col-md-3"></div>
																</div>
					<table class="table table-bordered table-striped table-condensed">
						<thead>

							<tr>
								<th>Total Amount collected Till Date </th>
								<th>Amount utilized for the project</th>
								<th>Balance Amount </th>
								<th>Amount utilized in percentage %</th>
							</tr>

						</thead>
						<tbody>
										<tr>
											<td><input type="number" name="amtCollectedFromAllotee"
												id="amtCollected"
												value="${projectRegistrationModel.projectDetailsModel.plotSummary.amtCollectedFromAllotee}" class="requiredValFld"> 
												<span class='requiredValFldMsg'> Please Enter Amount collected from Allottees</span></td>
											<td><input type="number" name="amtUtilizedforConstruction" id="amtUtilized"
												value="${projectRegistrationModel.projectDetailsModel.plotSummary.amtUtilizedforConstruction}" class="requiredValFld"> 
												<span class='requiredValFldMsg'> Please Enter Amount utilized for Construction </span></td>
											<td><input type="number" name="balanceAmt" id="balanceAmt" readonly="readonly" value="${projectRegistrationModel.projectDetailsModel.plotSummary.balanceAmt}"
												class=""></td>
											<td><input type="number" name="amtUtilPercentage" id="AmtPer" readonly="readonly" value="${projectRegistrationModel.projectDetailsModel.plotSummary.amtUtilPercentage}"
												class=""></td>
										</tr>
						</tbody>
					</table>

				</c:when>
				<c:otherwise>
					<table class="table table-bordered table-striped table-condensed">
						<thead>

							<tr>
								<th>SlNo.</th>
								<th>Particulars</th>
								<th>Estimated Cost (in INR)</th>
								<th>Actual Cost (in INR)</th>

							</tr>

						</thead>

						<tbody>
							<tr>
								<td>1</td>
								<td>Land Cost<input type="hidden"
									value="${projectRegistrationModel.projectDetailsModel.plotSummary.plotSummaryId}"
									name="plotSummaryId" />
									<input type="hidden" name="perticularsname"
									value="Land Cost" class="requiredValFld" readOnly> <span
									class='requiredValFldMsg'> Please Enter Particulars.</span></td>
								<td><input type="text" name="estLandCost" id="estLandCost" value="${projectRegistrationModel.projectDetailsModel.costOfLand}"
																						class="form-control requiredValFld totalSum" readonly="true"
																						></td>
								<td><input type="number" name="actLandCost" id="actLandCost"
									class="form-control requiredValFld totalSum"> <span class='requiredValFldMsg'>
										Please Enter Actual Land Cost</span></td>
							</tr>

							<tr>
								<td>2</td>
								<td>Construction Cost<input type="hidden" name="perticularsname" 
									value="Construction Cost" class="requiredValFld" readOnly> <span
									class='requiredValFldMsg'> Please Enter Perticulars.</span></td>
								<td><input type="number" name="estConstructionCost" id="estConstructionCost" value="${projectRegistrationModel.projectDetailsModel.plotsConstructionCostModel.estTotConstructionCost}"
																						class="form-control requiredValFld totalSum" readonly="true"
																						></td>
								<td><input type="number" name="actConstructionCost" id="actConstructionCost"
									class="form-control requiredValFld totalSum"> <span class='requiredValFldMsg'>
										Please Enter Actual Construction Cost</span></td>

							</tr>
							<tr>
								<td>3</td>
								<td>Cost for Approvals, NOCs, Licenses and others<input type="hidden" name="perticularsname"
									value="Cost for Approvals, NOCs, Licenses and others"
									class="requiredValFld" readOnly> <span class='requiredValFldMsg'>
										Please Enter Perticulars.</span></td>
								<td><input type="text" name="estCostOfApprove" id="estCostOfApprove" value="${projectRegistrationModel.projectDetailsModel.plotLandCostDetailsModel.approvalCostModel.totalCostOfApprovals}" class="form-control requiredValFld totalSum" readonly="true"></td>
								<td><input type="number" name="actCostOfApprove" id="actCostOfApprove"
									class="form-control requiredValFld totalSum" > <span class='requiredValFldMsg'>
										Please Enter Actual Cost Of Approve</span></td>
							</tr>
							<tr>
								
								<td colspan="2" style="padding-left:25%;"><input type="button"
											value="Caluclate Total Cost"
											class="btn btn-totalsummaryinfo" id="totalPlotSummary" /></td>
								<td><input type="text" name="estTotalCost" id="estTotalCost" value="" class="form-control requiredValFld totalSum" readonly="true"></td>
								<td><input type="text" name="actTotalCost" id="actTotalCost" value="" class="form-control requiredValFld totalSum" readonly="true"></td>
							</tr>
						</tbody>
					</table>
 																<div class="row">
																	<div style="padding-left: 50px; padding-right: 50px;">
																		<table
																			class="table table-bordered table-striped table-condensed">
																			<thead>
																				<tr>
																					
																					
																				</tr>
																			</thead>
																			<tbody id="tb">
																			<tr>
																			<td>Total Project Cost As declared at the time of Registration :
																			</td>
																			<td><input type="text" name="taxAmt" id="projectCost" value="${projectRegistrationModel.projectDetailsModel.totalProjectCost}"
																						class="form-control requiredValFld totalSum" readonly="true"
																						placeholder="only digits are allowed"> <span
																						></span></td>
																			</tr>
																			<tr id="totalSummaryCostMatching" bgcolor="#ff9999">
																			<td colspan="2">Total Estimated and Actual Costs are not matching</td>
																			
																			</tr>
																			</tbody>
																			</table>
																	</div>
																	<div class="col-md-3"></div>
																</div>
					<table class="table table-bordered table-striped table-condensed">
						<thead>

							<tr>
								<th>Total Amount collected Till Date </th>
								<th>Amount utilized for the project</th>
								<th>Balance Amount </th>
								<th>Amount utilized in percentage %</th>
							</tr>

						</thead>
						<tbody>
							<tr>
								<td><input type="text" name="amtCollectedFromAllotee" id="amtCollected" class="requiredValFld"> 
									<span class='requiredValFldMsg'> Please Enter Amount collected from Allottees</span></td>
								<td><input type="text" name="amtUtilizedforConstruction" id="amtUtilized" class="requiredValFld"> 
								<span class='requiredValFldMsg'> Please Enter Amount utilized for Construction </span></td>
								<td><input type="text" name="balanceAmt" id="balanceAmt" readonly="readonly"
									class="requiredValFld"> <span class='requiredValFldMsg'>Please Enter Amount utilized for Approvals and others</span></td>
								<td><input type="text" name="amtUtilPercentage" id="AmtPer" readonly="readonly" class="requiredValFld caluclateAmt"> 
									<span class='requiredValFldMsg'>Please Enter Balance Amount </span></td>
							</tr>
						</tbody>
					</table>


				</c:otherwise>
			</c:choose>

			<input type="button" class="btn btn-sm btn-success  pull-right"
				id="projectSummaryId" value="Save" />
		</form:form>
		</div>
		</div>
		</div>
	</div>
	<!-- /.conainer-fluid --> </main>





</body>

</html>