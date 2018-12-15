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

<title>Construction Cost details</title>

<%--   <%@ include file="/jsppages/transaction/postregistration/common_head.jsp"%> --%>
<style>
#totalCostMatching {
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
						<i class="fa fa-align-justify"></i> Construction Details:
						Registration Number -${projectRegistrationModel.projectRegistrationNo}
					</div>
					<form:form class="form-horizontal" autocomplete="off" action="updatePlotConstructionCostDetails" modelAttribute="projectRegistrationModel"
						enctype="multipart/form-data" id="constructionCostForm"
						method="post">

						<form:hidden path="projectRegId" />
						<form:hidden path="projectDetailsModel.projectDetailsId" />
						<div class="card-block">
							<table class="table table-bordered  table-condensed" id="consCost-list">
								<thead>
								<p style="text-align:left"><font color="red">* Note : 1. Competent authority means Structural Engineer, Chartered Accountant and Architect as per RERA Act.
								<br/> 2. Projects having around 2% difference in the estimated cost given at the time of registration and estimated cost entered at the time of post registration.</font></p>
									
									<tr>
										<th>Sl No.</th>
										<th>Particulars</th>
                                        <th rowspan="2">Is Applicable?</th>
										<th>Estimated Cost (in INR)</th>
									

									</tr>
								</thead>
								<tbody id="tb" class="tb1">
								<% int costCount = -1; %>
							 <c:choose>
												<c:when test="${ empty projectRegistrationModel.projectDetailsModel.plotsConstructionCostModel.plotsConstructionCostList}">
 
													<tr>
														<td>1</td>
														<td>Estimated Cost of Construction as certified by Engineer<input type="hidden" name="consCostParticular" value="Estimated Cost of Construction as certified by Engineer" class="requiredValFld">
															<span class='requiredValFldMsg'> Please Enter Construction Cost Particular Name </span></td>
														<td><input type="radio" name="isApplicable_0" value="Yes" class="" conCount="0" class="requiredValFld" id="isApplicable_0" onclick="showConstructionCost(this);">Yes 
														<span class='requiredValFldMsg'> Please select yes/No</span>
														 <input type="radio" name="isApplicable_0" value="No" class="" conCount="0" class="requiredValFld" id="isApplicable_0" onclick="hideConstructionCost(this);">No
														  <span class='requiredValFldMsg'> Please select yes/No </span></td>
														  
														  <td><input type="number" name="estConsCost" id="estConsCost_0" class="form-control count" />
														   <span class='requiredValFldMsg'> Please Enter Estimated Payable Amount</span></td>
													   </tr>

													<tr>
														<td>2</td>
														<td>On-site expenditure-Salaries of workers<input type="hidden" name="consCostParticular" value="On-site expenditure-Salaries of workers " class="requiredValFld"></td>
														<td><input type="radio" name="isApplicable_1" value="Yes" class="" conCount="1" class="requiredValFld" id="isApplicable_1" onclick="showConstructionCost(this);">Yes 
														<span class='requiredValFldMsg'> Please select yes/No</span>
														<input type="radio" name="isApplicable_1" value="No" class="" conCount="1" class="requiredValFld" id="isApplicable_1" onclick="hideConstructionCost(this);">No
															<span class='requiredValFldMsg'> Please select yes/No </span></td>
															
															<td><input type="number" name="estConsCost" id="estConsCost_1" class="form-control count" />
														   <span class='requiredValFldMsg'> Please Enter Estimated Payable Amount</span></td>
													</tr>

													<tr>
														<td>3</td>
														<td>On-site expenditure-Consultants Fees<input type="hidden" name="consCostParticular" value="On-site expenditure-Consultants Fees" class="requiredValFld">
															<span class='requiredValFldMsg'>Please Enter Construction Cost Particular Name</span></td>
														<td><input type="radio" name="isApplicable_2" value="Yes" class="" conCount="2" class="requiredValFld" id="isApplicable_2" onclick="showConstructionCost(this);">Yes
														 <span class='requiredValFldMsg'> Please select yes/No</span> 
														  <input type="radio" name="isApplicable_2" value="No" class="" conCount="2" class="requiredValFld" id="isApplicable_2" onclick="hideConstructionCost(this);">No
														   <span class='requiredValFldMsg'> Please select yes/No </span></td>
														   
														   <td><input type="number" name="estConsCost" id="estConsCost_2" class="form-control count" />
														   <span class='requiredValFldMsg'> Please Enter Estimated Payable Amount</span></td>

													</tr>

													<tr>
														<td>4</td>
														<td>On-site expenditure-Side Overhead<input type="hidden"
															name="consCostParticular" value="On-site expenditure-Side Overhead"
															class=""> <!-- <span class='requiredValFldMsg'> Please Enter Infrastructure Name </span> --></td>
														<td><input type="radio" name="isApplicable_3" value="Yes" class="" conCount="3" class="requiredValFld" id="isApplicable_3" onclick="showConstructionCost(this);">Yes 
														<span class='requiredValFldMsg'> Please select yes/No</span> 
														 <input type="radio" name="isApplicable_3" value="No" class="" conCount="3" class="requiredValFld" id="isApplicable_3" onclick="hideConstructionCost(this);">No 
														 <span class='requiredValFldMsg'> Please select yes/No </span></td>
														 
														 <td><input type="number" name="estConsCost" id="estConsCost_3" class="form-control count" />
														   <span class='requiredValFldMsg'> Please Enter Estimated Payable Amount</span></td>

													</tr>



													<tr>
														<td>5</td>
														<td>On-site expenditure-Cost Of Services(Water, Electricity, Sewage)<input type="hidden" name="consCostParticular" value="On-site expenditure-Cost Of Services(Water, Electricity, Sewage)"
															class="requiredValFld"> <span class='requiredValFldMsg'> Please Enter Construction Cost Particular Name</span></td>
														<td><input type="radio" name="isApplicable_4" value="Yes" class="" conCount="4" class="requiredValFld" id="isApplicable_4" onclick="showConstructionCost(this);">Yes 
														<!-- <span class='requiredValFldMsg'> Please select yes/No</span> --> 
														<input type="radio" name="isApplicable_4" value="No" class="" conCount="4" class="requiredValFld" id="isApplicable_4" onclick="hideConstructionCost(this);">No 
														<!-- <span class='requiredValFldMsg'> Please select yes/No </span> --></td>
														
														<td><input type="number" name="estConsCost" id="estConsCost_4" class="form-control count" />
														   <span class='requiredValFldMsg'> Please Enter Estimated Payable Amount</span></td>

													</tr>

													<tr>
														<td>6</td>
														<td>Payment of taxes<input type="hidden" name="consCostParticular" value=" Payment of taxes"> 
														<span class='requiredValFldMsg'> Please Enter Construction Cost Particular Name </span></td>
														<td><input type="radio" name="isApplicable_5" value="Yes" class="" conCount="5" class="requiredValFld" id="isApplicable_5" onclick="showConstructionCost(this);">Yes
														 
														 <span class='requiredValFldMsg'> Please select yes/No</span> 
														 <input type="radio" name="isApplicable_5" value="No" class="" conCount="5" class="requiredValFld" id="isApplicable_5" onclick="hideConstructionCost(this);">No 
														 <!-- <span class='requiredValFldMsg'> Please select yes/No </span> --></td>
														 
														 <td><input type="number" name="estConsCost"  id="estConsCost_5"class="form-control count" />
														   <span class='requiredValFldMsg'> Please Enter Estimated Payable Amount</span></td>
													</tr>

													<tr>
														<td>7</td>
														<td>Payment of cess<input type="hidden" name="consCostParticular" value="Payment of cess" class="requiredValFld">
															<span class='requiredValFldMsg'> Please Enter Construction Cost Particular Name </span></td>
														<td><input type="radio" name="isApplicable_6" value="Yes" class="" conCount="6" class="requiredValFld" id="isApplicable_6" onclick="showConstructionCost(this);">Yes 
														<span class='requiredValFldMsg'> Please select yes/No</span>
														 <input type="radio" name="isApplicable_6" value="No" class="" conCount="6" class="requiredValFld" id="isApplicable_6" onclick="hideConstructionCost(this);">No 
														 <span class='requiredValFldMsg'> Please select yes/No </span></td>
														 
														 <td><input type="number" name="estConsCost" id="estConsCost_6" class="form-control count" />
														   <span class='requiredValFldMsg'> Please Enter Estimated Payable Amount</span></td>

													</tr>

													<tr>
														<td>8</td>
														<td>Payment of fees<input type="hidden" name="consCostParticular" value="Payment of fees" class="requiredValFld">
															<span class='requiredValFldMsg'> Please Enter Construction Cost Particular Name </span></td>
														<td><input type="radio" name="isApplicable_7" value="Yes" class="" conCount="7" class="requiredValFld" id="isApplicable_7" onclick="showConstructionCost(this);">Yes
														<input type="radio" name="isApplicable_7" value="No" class="" conCount="7" class="requiredValFld" id="isApplicable_7" onclick="hideConstructionCost(this);">No 
														<span class='requiredValFldMsg'> Please select yes/No </span></td>
														
														<td><input type="number" name="estConsCost" id="estConsCost_7" class="form-control count" />
														   <span class='requiredValFldMsg'> Please Enter Estimated Payable Amount</span></td>

													</tr>

													<tr>
														<td>9</td>
														<td>Payment of charges<input type="hidden"
															name="consCostParticular" value="Payment of charges" class="requiredValFld"> 
															<span class='requiredValFldMsg'> Please Enter Construction Cost Particular Name </span></td>
														<td><input type="radio" name="isApplicable_8" value="Yes" class="" conCount="8" class="requiredValFld" id="isApplicable_8" onclick="showConstructionCost(this);">Yes 
														<span class='requiredValFldMsg'> Please select yes/No</span>
														 <input type="radio" name="isApplicable_8" value="No" class="" conCount="8" class="requiredValFld" id="isApplicable_8" onclick="hideConstructionCost(this);">No 
														 <span class='requiredValFldMsg'> Please select yes/No </span></td>
                                                              
                                                              <td><input type="number" name="estConsCost" id="estConsCost_8" class="form-control count" />
														   <span class='requiredValFldMsg'> Please Enter Estimated Payable Amount</span></td>
													</tr>

													<tr>
														<td>10</td>
														<td>Payment of Premiums<input type="hidden" name="consCostParticular" value="Payment of Premiums"
															class="requiredValFld"> <span class='requiredValFldMsg'> Please Enter Construction Cost Particular Name </span></td>
														<td><input type="radio" name="isApplicable_9" value="Yes" class="" conCount="9" class="requiredValFld" id="isApplicable_9" onclick="showConstructionCost(this);">Yes 
														<span class='requiredValFldMsg'> Please select yes/No</span>  
														<input type="radio" name="isApplicable_9" value="No" class="" conCount="9" class="requiredValFld" id="isApplicable_9" onclick="hideConstructionCost(this);">No
														 
															 <span class='requiredValFldMsg'> Please select yes/No </span> </td>
															 
															 <td><input type="number" name="estConsCost" id="estConsCost_9" class="form-control count" />
														   <span class='requiredValFldMsg'> Please Enter Estimated Payable Amount</span></td>
														</tr>	
														
														<tr>
														<td>11</td>
														<td>Principal sum and interest payable to financial institutions-Scheduled Banks<input type="hidden" name="consCostParticular" value="Principal sum and interest payable to financial institutions-Scheduled Banks" class="requiredValFld"> 
														<span class='requiredValFldMsg'>Please Enter Construction Cost Particular Name </span></td>
														<td><input type="radio" name="isApplicable_10" value="Yes" class="" conCount="10" class="requiredValFld" id="isApplicable_10" onclick="showConstructionCost(this);">Yes 
														<span class='requiredValFldMsg'> Please select yes/No</span>  
														<input type="radio" name="isApplicable_10" value="No" class="" conCount="10" class="requiredValFld" id="isApplicable_10" onclick="hideConstructionCost(this);">No
														
														 <span class='requiredValFldMsg'> Please select yes/No </span> </td>
														 
														 <td><input type="number" name="estConsCost"  id="estConsCost_10"class="form-control count" />
														   <span class='requiredValFldMsg'> Please Enter Estimated Payable Amount</span></td>
														</tr>
														<tr>
														<td>12</td>
														<td>Principal sum and interest payable to financial institutions-Non Banking financial institution (NBFC)<input type="hidden" name="consCostParticular" value="Principal sum and interest payable to financial institutions-Non Banking financial institution (NBFC)"
															class="requiredValFld">
															 <span class='requiredValFldMsg'>Please Enter Construction Cost Particular Name</span></td>
														<td><input type="radio" name="isApplicable_11" value="Yes" class="" conCount="11" class="requiredValFld" id="isApplicable_11" onclick="showConstructionCost(this);">Yes 
														<span class='requiredValFldMsg'> Please select yes/No</span>  
														<input type="radio" name="isApplicable_11" value="No" class="" conCount="11" class="requiredValFld" id="isApplicable_11" onclick="hideConstructionCost(this);">No
														 <span class='requiredValFldMsg'> Please select yes/No </span></td>
														
														<td><input type="number" name="estConsCost" id="estConsCost_11" class="form-control count" />
														   <span class='requiredValFldMsg'> Please Enter Estimated Payable Amount</span></td>
														</tr>
														<tr>
														<td>13</td>
														<td>Principal sum and interest payable to financial institutions-Money Lenders on construction funding or
                                                                 money borrowed for construction<input type="hidden" name="consCostParticular" value="Principal sum and interest payable to financial institutions-Money Lenders on construction funding or
                                                                 money borrowed for construction" class="requiredValFld"> 
															<span class='requiredValFldMsg'> Please Enter Construction Cost Particular Name </span></td>
														<td><input type="radio" name="isApplicable_12" value="Yes" class="" conCount="12" class="requiredValFld" id="isApplicable_12" onclick="showConstructionCost(this);">Yes 
														<span class='requiredValFldMsg'> Please select yes/No</span>  
														<input type="radio" name="isApplicable_12" value="No" class="" conCount="12" class="requiredValFld" id="isApplicable_12" onclick="hideConstructionCost(this);">No
														 <span class='requiredValFldMsg'> Please select yes/No </span></td>
														
														<td><input type="number" name="estConsCost" id="estConsCost_12" class="form-control count" />
														   <span class='requiredValFldMsg'> Please Enter Estimated Payable Amount</span></td>
														</tr>
														<tr>
														<td>14</td>
														<td>Outgoing Payment made to (Like, Water Supply, power etc.)<input type="hidden" name="consCostParticular" value="Outgoing Payment made to (Like, Water Supply, power etc.)" class="requiredValFld"> 
															<span class='requiredValFldMsg'> Please Enter Construction Cost Particular Name </span></td>
														<td><input type="radio" name="isApplicable_13" value="Yes" class="" conCount="13" class="requiredValFld" id="isApplicable_13" onclick="showConstructionCost(this);">Yes 
														<span class='requiredValFldMsg'> Please select yes/No</span>  
														<input type="radio" name="isApplicable_13" value="No" class="" conCount="13" class="requiredValFld" id="isApplicable_13" onclick="hideConstructionCost(this);">No
														 <span class='requiredValFldMsg'> Please select yes/No </span></td>
														
														<td><input type="number" name="estConsCost" id="estConsCost_13" class="form-control count" />
														   <span class='requiredValFldMsg'> Please Enter Estimated Payable Amount</span></td>
														</tr>
											
											<tr>
												
													<td colspan="3" style="padding-left: 25%;">
													<input type="button" value="Caluclate Total construction cost" class="btn btn-info" id="btn-construction" /></td>
												<%-- 	<c:if test=""> --%>
											    	<td><input type="number" name="estTotConstructionCost" readonly="true" class="form-control totalEstConstructionval" /><span
													class='requiredValFldMsg'> Please Enter Estimated Construction Cost</span></td>
													
													<%-- 	</c:if> --%>
											</tr>
											
												
																				
												 </c:when>
												<c:otherwise>
												
													<c:forEach items="${projectRegistrationModel.projectDetailsModel.plotsConstructionCostModel.plotsConstructionCostList}" var="obj">

														<tr>
														 <%  ++costCount; %>
															<td><%= costCount+1 %></td> 
													 <td><c:out value="${obj.consCostParticular}"></c:out> <input type="hidden" name="constructionCostDetailsId" value="${obj.constructionCostDetailsId}" /> 
													 <input type="hidden" name="consCostParticular" value="${obj.consCostParticular}" class="requiredValFld"> <span
																class='requiredValFldMsg'>Please Enter Construction Cost Particular Name </span></td>
																
															<td><c:choose>
																	<c:when test="${obj.isApplicable == 'Yes'}">
																		<div class="col-md-9">
																			<label class="radio-inline" for="isApplicable">
																				<input type="radio"  name="isApplicable_<%=costCount %>" conCount="<%=costCount %>" class="requiredValFld" id="isApplicable_<%=costCount %>" onclick="showConstructionCost(this);" value="Yes"
																				class='dynaselectfld requiredValFld' checked="checked">Yes
																			</label> <label class="radio-inline" for="isApplicable">
																				<input type="radio"  name="isApplicable_<%=costCount %>" conCount="<%=costCount %>" class="requiredValFld" id="isApplicable_<%=costCount %>" onclick="hideConstructionCost(this);" value="No">No
																			</label>
																		</div>
																	</c:when>
																	<c:otherwise>
																		<div class="col-md-9">
																			<label class="radio-inline" for="isApplicable">
																				<input type="radio"  name="isApplicable_<%=costCount %>" value="Yes" conCount="<%=costCount %>" class="requiredValFld" id="isApplicable_<%=costCount %>" onclick="showConstructionCost(this);">Yes
																			</label> <label class="radio-inline" for="isApplicable">
																				<input type="radio"  name="isApplicable_<%=costCount %>" value="No" checked="checked" conCount="<%=costCount %>" class="requiredValFld" id="isApplicable_<%=costCount %>" onclick="hideConstructionCost(this);">No
																			</label>

																		</div>
																	</c:otherwise>
																</c:choose></td>
														<td><input type="number" name="estConsCost" id="estConsCost_<%=costCount %>" value="${obj.estConsCost}" class="count "> <span
																class='requiredValFldMsg'>Please Enter Construction Cost Particular Name </span></td>
																
																
													</c:forEach>
													
													<tr>
												
												
													<td colspan="3" style="padding-left: 20%;">
													<input type="button" value="Caluclate Total construction cost" class="btn btn-info" id="btn-construction" /></td>
													
											    	<td><input type="text" name="estTotConstructionCost" value="${projectRegistrationModel.projectDetailsModel.plotsConstructionCostModel.estTotConstructionCost}" readonly="true" class="form-control requiredValFld totalEstConstructionval" /><span
													class='requiredValFldMsg'> Please Enter Estimated Construction Cost</span></td>
												
											</tr>
											
												</c:otherwise>
											</c:choose>
									
								</tbody>
							</table>
							
					 <input type="button" class="btn btn-sm btn-Primary  pull-right" id="btn-add-consCost" value="Add More" />	 
							<br/>
							<br/>
						

							<div class="row">
								<div style="padding-left: 50px; padding-right: 50px;">
									<table class="table table-bordered table-striped table-condensed">
										<thead>
										</thead>
										<tbody id="tb">

											<tr>
												<td>Total Estimated Construction Cost As declared at the time of Registration :</td>
												<td><input type="number" name="taxAmt" id="regTotalCost"
													value="${projectRegistrationModel.projectDetailsModel.estimatedCost}"
													class="form-control requiredValFld totalSum"
													readonly="true" placeholder="only digits are allowed">
													<span class=''></span></td>
											</tr>
											<tr id="totalCostMatching" bgcolor="#ff9999">
												<td colspan="2">Total Estimated Construction Cost is
													not matching As declared at the time of Registration</td>

											</tr>
										</tbody>
									</table>
								</div>
								<div class="col-md-3"></div>
							</div>
							
							<p style="text-align:left"><font color="red">* Note : This certificate is regarding project cost estimation. The format of the certificate is available in the Download section under Certificates for Post Registration.</font></p>
                                    <c:choose>
										<c:when test="${not empty projectRegistrationModel.projectDetailsModel.plotsConstructionCostModel}">
										<div class="add-more" style="border-style: ridge; padding: 20px; background-color: #F8F8F8;">
											<div>
												 <input type="hidden"
													value="${projectRegistrationModel.projectDetailsModel.plotsConstructionCostModel.plotsConstructionCostModelId }"
													name="plotsConstructionCostModelId" /> 
													</div>
													
												<div class="form-group row">
												
												<label class="col-md-3 form-control-label" for="totProjectCost">Total Project Cost</label>
												<div class="col-md-9"> 
												<input type="number" id="totProjectCost" name="totProjectCost"
												value="${projectRegistrationModel.projectDetailsModel.plotsConstructionCostModel.totProjectCost}"
												class="form-control requiredValFld" placeholder="">
													<span class='requiredValFldMsg'> Please Total Project Cost </span>
												</div>
											</div>


											<div class="form-group row">
												<label class="col-md-3 form-control-label"
													for="certFromChartedAcc">Certificate issued by Chartered Account</label>
												<div class="col-md-9">
													<input type="hidden" name="certIssuedDocId" value="${projectRegistrationModel.projectDetailsModel.plotsConstructionCostModel.certFromChartedAcc.documentId}" />
													<input type="file" id="certFromChartedAcc" name="certFromChartedAcc"
														title="Only image or pdf file is allowed. file size upto 1 MB">
														<div class="col-md-9">
													<a href='<%=request.getContextPath() %>/download?DOC_ID=${projectRegistrationModel.projectDetailsModel.plotsConstructionCostModel.certFromChartedAcc.documentId}'>
														${projectRegistrationModel.projectDetailsModel.plotsConstructionCostModel.certFromChartedAcc.fileName}</a>
												</div>
												</div>
											</div>
											<div class="form-group row">
												<label class="col-md-3 form-control-label"
													for="certificateIssuedByStructuralEng">Certificate issued by Structural Engineer </label>
												<div class="col-md-9">
													<input type="hidden" name="certIssuedStructuralEngDocId" value="${projectRegistrationModel.projectDetailsModel.plotsConstructionCostModel.certificateIssuedByStructuralEng.documentId}" />
													<input type="file" id="certificateIssuedByStructuralEng"
														name="certificateIssuedByStructuralEng"
														title="Only image or pdf file is allowed. file size upto 1 MB">
														<div class="col-md-9">
													<a
														href='<%=request.getContextPath() %>/download?DOC_ID=${projectRegistrationModel.projectDetailsModel.plotsConstructionCostModel.certificateIssuedByStructuralEng.documentId}'>
														${projectRegistrationModel.projectDetailsModel.plotsConstructionCostModel.certificateIssuedByStructuralEng.fileName}</a>
												</div>
											</div>
											</div>

											<div class="form-group row">
												<label class="col-md-3 form-control-label"
													for="percentageOfProjectCompletion">Certificate issued by Architect</label>
												<div class="col-md-9">
													<input type="hidden" name="certIssuedArcDocId"
														value="${projectRegistrationModel.projectDetailsModel.plotsConstructionCostModel.certificateIssuedByArchitect.documentId}" />
													<input type="file" id="certificateIssuedByArchitect"
														name="certificateIssuedByArchitect"
														title="Only image or pdf file is allowed. file size upto 1 MB">
														<div class="col-md-9">
													<a
														href='<%=request.getContextPath() %>/download?DOC_ID=${projectRegistrationModel.projectDetailsModel.plotsConstructionCostModel.certificateIssuedByArchitect.documentId}'>
														${projectRegistrationModel.projectDetailsModel.plotsConstructionCostModel.certificateIssuedByArchitect.fileName}</a>
												</div>
											</div>
											</div>
											</div>	
						
								</c:when>
										<c:otherwise>
										
							<div class="add-more" style="border-style: ridge; padding: 20px; background-color: #F8F8F8;">
								<div class="form-group row">
									<label class="col-md-3 form-control-label" for="totProjectCost">Total Project Cost</label>
									<div class="col-md-9">
										<input type="number" id="totProjectCost" name="totProjectCost" class="form-control requiredValFld"
											placeholder=""> <span class='requiredValFldMsg'> Please Select Amount withdrawn </span>
									</div>
								</div>

								<div class="form-group row">
									<label class="col-md-3 form-control-label" for="certFromChartedAcc">Certificate issued by Chartered Account </label>
									<div class="col-md-9">
										<input type="file" id="certFromChartedAcc" name="certFromChartedAcc" class="form-control requiredValFld">
										<span class='requiredValFldMsg'> Please Select Certificate issued by Chartered Account </span>
									</div>
								</div>
								<div class="form-group row">
									<label class="col-md-3 form-control-label"
										for="certificateIssuedByStructuralEng">Certificate issued by Structural Engineer </label>
									<div class="col-md-9">
										<input type="file" id="certificateIssuedByStructuralEng" name="certificateIssuedByStructuralEng"
											class="form-control requiredValFld"> <span class='requiredValFldMsg'> Please Select Certificate issued by Structural Engineer </span>
									</div>
								</div>
								<div class="form-group row">
									<label class="col-md-3 form-control-label"
										for="certificateIssuedByArchitect">Certificate issued by Architect </label>
									<div class="col-md-9">
										<input type="file" id="certificateIssuedByArchitect" name="certificateIssuedByArchitect"
											class="form-control requiredValFld">
									</div>
								</div>
								</div>
								</c:otherwise>
								</c:choose>


								</span> <input type="button" class="btn btn-sm btn-success  pull-right" style="width: 150px;" id="constructionCostId" value=" Save" />
							</div>
							<!--<button type="button" class="btn btn-warning btn-sm pull-right" onclick="constructionCostForm()"> Update </button> -->
                        
                                    
					</form:form>
					
				<c:if test="${(not empty projectRegistrationModel.projectDetailsModel.plotDetailsList)
				&&(not empty projectRegistrationModel.projectDetailsModel.plotScheduleModel) 
				&&(not empty projectRegistrationModel.projectDetailsModel.plotLandCostDetailsModel) }">
				<a href="<%=request.getContextPath()%>/plot/plotSummaryrDetails" style="padding-left: 400px;">
				 <input type="button" class="btn btn-sm btn-success" width="50px;" id="QuarterSubmit" value="Post Registration Submit" /></a>
					</c:if>	

							<br/>
				</div>
				
			</div>
			<!--/col-->
		</div>

	</div>
	
	
	<!-- /.conainer-fluid --> </main>


	<!--  <footer class="footer">
        <span class="text-left">
               <a href="http://www.keyfalconsolutions.com/">Branding</a> © 2016 Developers.
           </span>
        <span class="pull-right">
               Powered by <a href="http://www.keyfalconsolutions.com/">Keyfalcon Solutions</a>
           </span>
    </footer>
     -->
	<!-- Placed at the end of the document so the pages load faster -->
	<%--   <%@ include file="/jsppages/transaction/postregistration/common_footer.jsp"%> --%>
</body>

</html>