<!--
 * GenesisUI - Bootstrap 4 Admin Template
 * @version v1.5.8
 * @link https://genesisui.com
 * Copyright (c) 2016 creativeLabs Łukasz Holeczek
 * @license Commercial
 -->
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
                            <i class="fa fa-align-justify"></i> Project Summary : Registration Number  -  ${projectRegistrationModel.projectRegistrationNo} 
                            </div>
                             <%-- <div class="col-md-6">
                             <select name="projectRegId" id="projectSummary"  class=" form-control  requiredValFld" style="width: 180px !important; min-width: 180px; max-width: 180px;vertical-align:right;" >
							<option value="0"> --Select-- </option>
							<c:forEach items="${projectList}" var="listmodal">
							<c:choose>
							<c:when test="${listmodal.projectRegId==projectRegistrationModel.projectRegId }">
								<option value="${listmodal.projectRegId}" selected="selected"> ${listmodal.projectRegistrationNo} </option>
							</c:when>
							<c:otherwise>
								<option value="${listmodal.projectRegId}"> ${listmodal.projectRegistrationNo} </option>
							</c:otherwise>
							</c:choose>
							</c:forEach>
							</select> 
                        </div> --%>
                        </div>
      
		<form:form class="form-horizontal" autocomplete="off"
			action="updateProjectSummaryDetails"
			modelAttribute="projectRegistrationModel"
			enctype="multipart/form-data" id="projectSummaryForm" method="post">
			<c:choose>
				<c:when test="${ not empty projectRegistrationModel.projectDetailsModel.projectSummary}">
					<table class="table table-bordered table-striped table-condensed">
						<thead>

							<tr>
								<th>SlNo.</th>
								<th>Particulars</th>
								<th>Estimated Cost (in INR)</th>
								<th>Actual Cost (in INR) Till the last Quarter End</th>

							</tr>

						</thead>

						<tbody>
							<tr>
								<td><input type="hidden"
									value="${projectRegistrationModel.projectDetailsModel.projectSummary.projectSummaryId }"
									name="projectSummaryId" /></td>
							</tr>
							<tr>
								<td>1</td>
								<td>Land Cost</td>
								<td><input type="text" name="estLandCost"
									value="${projectRegistrationModel.projectDetailsModel.projectSummary.estLandCost }"
									class="requiredValFld"> <span class='requiredValFldMsg'>
										Please Enter Estimated Land Cost</span></td>
								<td><input type="text" name="actLandCost"
									value="${projectRegistrationModel.projectDetailsModel.projectSummary.actLandCost }"
									class="requiredValFld"> <span class='requiredValFldMsg'>
										Please Enter Actual Land Cost</span></td>
							</tr>

							<tr>
								<td>2</td>
								<td>Construction Cost</td>
								<td><input type="text" name="estConstructionCost"
									value="${projectRegistrationModel.projectDetailsModel.projectSummary.estConstructionCost }"
									class="requiredValFld"> <span class='requiredValFldMsg'>
										Please Enter Estimated Construction Cost</span></td>
								<td><input type="text" name="actConstructionCost"
									value="${projectRegistrationModel.projectDetailsModel.projectSummary.actConstructionCost }"
									class="requiredValFld"> <span class='requiredValFldMsg'>
										Please Enter Actual Construction Cost</span></td>

							</tr>
							<tr>
								<td>3</td>
								<td>Cost for Approvals, NOCs, Licenses and others</td>
								<td><input type="text" name="estCostOfApprove"
									value="${projectRegistrationModel.projectDetailsModel.projectSummary.estCostOfApprove }"
									class="requiredValFld"> <span class='requiredValFldMsg'>
										Please Enter Estimated Cost Of Approve</span></td>
								<td><input type="text" name="actCostOfApprove"
									value="${projectRegistrationModel.projectDetailsModel.projectSummary.actCostOfApprove }"
									class="requiredValFld"> <span class='requiredValFldMsg'>
										Please Enter Actual Cost Of Approve</span></td>
							</tr>
							
							<tr>
								
								<td colspan="2" style="padding-left:25%;"><input type="button"
											value="Caluclate Total Cost"
											class="btn btn-totalsummaryinfo" id="totalProjSummaryCost" /></td>
								<td><input type="text" name="estTotalCost" id="estTotalCost" value="${projectRegistrationModel.projectDetailsModel.projectSummary.estTotalCost }" class="form-control requiredValFld totalSum" readonly="true"></td>
								<td><input type="text" name="actTotalCost" id="actTotalCost" value="${projectRegistrationModel.projectDetailsModel.projectSummary.actTotalCost }" class="form-control requiredValFld totalSum" readonly="true"></td>
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
																			<td><input type="text" name="taxAmt" value="${projectRegistrationModel.projectDetailsModel.totalProjectCost}"
																						class="form-control requiredValFld totalSum" readonly="true"
																						placeholder="only digits are allowed"> <span
																						class=''></span></td>
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
						
						<p style="text-align:left;padding:20px"><font color="red">*Note:  If the receivable of the ongoing project is less than the estimated cost of balance construction, then the promoter shall deposit 100 percent of the amounts to be realized in the separate account.</font></p>

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
												value="${projectRegistrationModel.projectDetailsModel.projectSummary.amtCollectedFromAllotee }" class="requiredValFld"> 
												<span class='requiredValFldMsg'> Please Enter Amount collected from Allottees</span></td>
											<td><input type="number" name="amtUtilizedforConstruction" id="amtUtilized"
												value="${projectRegistrationModel.projectDetailsModel.projectSummary.amtUtilizedforConstruction }" class="requiredValFld"> 
												<span class='requiredValFldMsg'> Please Enter Amount utilized for Construction </span></td>
											<td><input type="number" name="balanceAmt" id="balanceAmt" readonly="readonly" value="${projectRegistrationModel.projectDetailsModel.projectSummary.balanceAmt }"
												class=""></td>
											<td><input type="number" name="amtUtilPercentage" id="AmtPer" readonly="readonly" value="${projectRegistrationModel.projectDetailsModel.projectSummary.amtUtilPercentage }"
												class=""></td>
										</tr>
						</tbody>
					</table>
<%-- <c:if test="${projectRegistrationModel.projectDetailsModel.landCostDetailsModel.transferDevRightsDetailsModel.isTdrApplicable == 'Yes'}">
					<table class="table table-bordered table-striped table-condensed">
						<tbody>

							<tr>
								<td>FAR Sanctioned</td>
								<td><input type="hidden" name="tdrStatus" value="YES">
								<input type="text" name="farSanctioned"
									value="${projectRegistrationModel.projectDetailsModel.projectSummary.farSanctioned }"
									class="requiredValFld"> <span class='requiredValFldMsg'>Please
										Enter far Sanctioned </span></td>

							</tr>

						</tbody>
						<tbody>
							<tr>
								<td>FAR Achieved</td>
								<td><input type="text" name="farAchieved"
									value="${projectRegistrationModel.projectDetailsModel.projectSummary.farAchieved }"
									class="requiredValFld"> <span class='requiredValFldMsg'>Please
										Enter far Achieved </span></td>
							</tr>
						</tbody>
					</table>
					</c:if> --%>

				</c:when>
				<c:otherwise>
					<table class="table table-bordered table-striped table-condensed">
						<thead>

							<tr>
								<th>SlNo.</th>
								<th>Particulars</th>
								<th>Estimated Cost (in INR)</th>
								<th>Actual Cost (in INR) Till the last Quarter End</th>

							</tr>

						</thead>

						<tbody>
							<tr>
								<td><input type="hidden"
									value="${projectRegistrationModel.projectDetailsModel.projectSummary.projectSummaryId }"
									name="constructionCostDetailsId" /></td>
							</tr>
							<tr>
								<td>1</td>
								<td><input type="text" name="perticularsname"
									value="Land Cost" class="requiredValFld"> <span
									class='requiredValFldMsg'> Please Enter Perticulars.</span></td>
								<td><input type="text" name="estLandCost" id="estLandCost" value="${projectRegistrationModel.projectDetailsModel.costOfLand}" readonly="true"
									class="requiredValFld"> <span class='requiredValFldMsg'>
										Please Enter Estimated Land Cost</span></td>
								<td><input type="text" name="actLandCost" id="actLandCost"
									class="requiredValFld"> <span class='requiredValFldMsg'>
										Please Enter Actual Land Cost</span></td>
							</tr>

							<tr>
								<td>2</td>
								<td><input type="text" name="perticularsname"
									value="Construction Cost" class="requiredValFld"> <span
									class='requiredValFldMsg'> Please Enter Perticulars.</span></td>
								<td><input type="text" name="estConstructionCost"   id="estConstructionCost"  value="${projectRegistrationModel.projectDetailsModel.constructionCostModel.estTotConstructionCost}" readonly="true"
									class="requiredValFld"> <span class='requiredValFldMsg'>
										Please Enter Estimated Construction Cost</span></td>
								<td><input type="text" name="actConstructionCost"  id="actConstructionCost"
									class="requiredValFld"> <span class='requiredValFldMsg'>
										Please Enter Actual Construction Cost</span></td>

							</tr>
							<tr>
								<td>3</td>
								<td><input type="text" name="perticularsname"
									value="Cost for Approvals, NOCs, Licenses and others"
									class="requiredValFld"> <span class='requiredValFldMsg'>
										Please Enter Perticulars.</span></td>
								<td><input type="text" name="estCostOfApprove" id="estCostOfApprove" value="${projectRegistrationModel.projectDetailsModel.landCostDetailsModel.approvalCostDetailsModel.totalCostOfApprovals}" readonly="true"
									class="requiredValFld"> <span class='requiredValFldMsg'>
										Please Enter Estimated Cost Of Approve</span></td>
								<td><input type="text" name="actCostOfApprove" id="actCostOfApprove"
									class="requiredValFld"> <span class='requiredValFldMsg'>
										Please Enter Actual Cost Of Approve</span></td>
							</tr>
							
					<%-- 		<tr>
								<td></td>
								<td><input type="text" name="perticularsname" 	value="Total Cost" >
										</span></td>
								<td><input type="text" name="estCostOfApprove" value="${projectRegistrationModel.projectDetailsModel.landCostDetailsModel.approvalCostDetailsModel.totalCostOfApprovals}" disabled="disabled"
									class=""> </td>
								<td><input type="text" name="actCostOfApprove" disabled="disabled"
									class="requiredValFld"> <span class='requiredValFldMsg'>
										Please Enter Actual Cost Of Approve</span></td>
							</tr> --%>
							<tr>
								
								<td colspan="2" style="padding-left:25%;"><input type="button"
											value="Caluclate Total Cost"
											class="btn btn-totalsummaryinfo" id="totalProjSummaryCost" /></td>
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
																			<td><input type="text" name="taxAmt" value="${projectRegistrationModel.projectDetailsModel.totalProjectCost}"
																						class="form-control requiredValFld totalSum" readonly="true"
																						placeholder="only digits are allowed"> <span
																						class=''></span></td>
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
						
						<p style="text-align:left"><font color="red">* Once data saved cannot be edited</font></p>

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
<%-- <c:if test="${projectRegistrationModel.projectDetailsModel.landCostDetailsModel.transferDevRightsDetailsModel.isTdrApplicable == 'Yes'}">
					<table class="table table-bordered table-striped table-condensed">
						<tbody>

							<tr>
								<td>FAR Sanctioned</td>
								<td>
								<input type="hidden" name="tdrStatus" value="YES">
									<input type="text" name="farSanctioned" value="${projectRegistrationModel.projectDetailsModel.landCostDetailsModel.transferDevRightsDetailsModel.farSanctioned}" readOnly
									class="requiredValFld"> <span class='requiredValFldMsg'>Please
										Enter far Sanctioned</span></td>

							</tr>

						</tbody>
						<tbody>
							<tr>
								<td>FAR Achieved</td>
								<td><input type="text" name="farAchieved"
									class="requiredValFld"> <span
									class='requiredValFldMsg'>Please Enter far Achieved </span></td>

							</tr>
						</tbody>
					</table>
					</c:if> --%>

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


	<!-- <footer class="footer">
        <span class="text-left">
             <a href="http://www.keyfalconsolutions.com/">Branding</a> © 2016 Developers.
         </span>
        <span class="pull-right">
             Powered by <a href="http://www.keyfalconsolutions.com/">Keyfalcon Solutions</a>
         </span>
    </footer> -->


</body>

</html>