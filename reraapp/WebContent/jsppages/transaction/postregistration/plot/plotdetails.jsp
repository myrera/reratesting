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

		<div class="row">
			<div class="col-sm-12">
				<div class="card">
					<div class="row">
						<div class="card-header">
							<div class="row">
								
									<i class="fa fa-align-justify"></i> Plot Details : Registration Number  -  ${projectRegistrationModel.projectRegistrationNo}
								


							</div>
						</div>
						<div class="card-block">
							<div class="panel-body">
								<!-- The inside div eliminates the 'jumping' animation. -->
								<%-- <div class="" id="bar">
								<form:form >
										
							<!-- 			<a href="floordetails"><button type="button" class="btn btn-primary btn-sm pull-right btn-add-tower">Continue</button>
</a> -->

		


										<br />
								</div>
								 </form:form> --%>
								 
								 <form:form id="plotForm" class="form-horizontal" autocomplete="off" action="updatePlotDetails" modelAttribute="projectRegistrationModel" enctype="multipart/form-data"  method="post">
								 <c:choose>
								  <c:when test="${not empty projectRegistrationModel.projectDetailsModel.plotDetailsList}">
								  <%-- <form:hidden path="projectRegId" />
								<form:hidden path="projectDetailsModel.plotDetailsList.plotsDetailsId" /> --%>
								 <div class="trower-div"
											style="border-style: ridge; padding: 20px; background-color: #F8F8F8;">
							<c:forEach items="${projectRegistrationModel.projectDetailsModel.plotDetailsList}" var="obj">
							
									<div class="form-group row">
											  <!-- <input type="hidden" name="plotsDetailsId" value="obj.plotsDetailsId"/> -->
											  <input type="hidden" name="plotsDetailsId" value="obj.plotsDetailsId"/>
												<label class="col-md-3 form-control-label"
													for="totalNumberOfPlots">Total number of Plots</label>
												<div class="col-md-9">
													<input type="number" name="totalNumberOfPlots" id="totalNumberOfPlots" value="${obj.totalNumberOfPlots}"
														name="totalNoOfPlots" class="form-control requiredValFld"
														placeholder="only digits are allowed" />
												</div>
											</div>
											
											<div class="form-group row">
											<!--   <input type="hidden" name="towerDetailsId" value=""/> -->
												<label class="col-md-3 form-control-label"
													for="totalnoOfEWSPlots">Number of EWS(6x9) Plots</label>
												<div class="col-md-9">
													<input type="number" name="totalnoOfEWSPlots" id="totalnoOfEWSPlots" value="${obj.totalnoOfEWSPlots}"
														name="towerName" class="form-control requiredValFld"
														placeholder="only digits are allowed" />
												</div>
											</div>
											
											<div class="form-group row">
											  <!-- <input type="hidden" name="towerDetailsId" value=""/> -->
												<label class="col-md-3 form-control-label"
													for="totalnoOfLIGPlots">Number of LIG(9x12) Plots</label>
												<div class="col-md-9">
													<input type="number" name="totalnoOfLIGPlots" id="totalnoOfLIGPlots" value="${obj.totalnoOfLIGPlots}"
														name="towerName" class="form-control requiredValFld"
														placeholder="only digits are allowed" />
												</div>
											</div>
											
											<div class="form-group row">
											  <!-- <input type="hidden" name="towerDetailsId" value=""/> -->
												<label class="col-md-3 form-control-label"
													for="totalnoOfMIGPlots">Number of MIG(9x15) Plots</label>
												<div class="col-md-9">
													<input type="number" name="totalnoOfMIGPlots" id="totalnoOfMIGPlots" value="${obj.totalnoOfMIGPlots}"
														name="towerName" class="form-control requiredValFld"
														placeholder="only digits are allowed" />
												</div>
											</div>
											
											<div class="form-group row">
											  <!-- <input type="hidden" name="towerDetailsId" value=""/> -->
												<label class="col-md-3 form-control-label"
													for="totalnoOfHIGPlots">Number of HIG(15x24) Plots</label>
												<div class="col-md-9">
													<input type="number" name="totalnoOfHIGPlots" id="totalnoOfHIGPlots" value="${obj.totalnoOfHIGPlots}"
														name="towerName" class="form-control requiredValFld"
														placeholder="only digits are allowed" />
												</div>
											</div>
											
											<div class="form-group row">
											  <!-- <input type="hidden" name="towerDetailsId" value=""/> -->
												<label class="col-md-3 form-control-label"
													for="totalnoOfOtherPlots">Number of Other Plots</label>
												<div class="col-md-9">
													<input type="number" name="totalnoOfOtherPlots" id="totalnoOfOtherPlots" value="${obj.totalnoOfOtherPlots}"
														name="towerName" class="form-control requiredValFld"
														placeholder="only digits are allowed" />
												</div>
											</div>

			<!-- 								<div class="form-group row">
												<label class="col-md-3 form-control-label"
													for="approvedPlanAttachment">Approved Plan with Site Number</label>
												<div class="col-md-9">
													<input type="file" id="approvedPlanAttachment" name="approvedPlanAttachment" class="form-control requiredValFld">
                                 <span class='requiredValFldMsg'> Please Select attachment for approved plan </span> 
												</div>
											</div> -->
										
											<%-- <div class="form-group row">
												<label class="col-md-3 form-control-label"
													for="totalNumberOfPlotsBooked">No. of Plots booked</label>
												<div class="col-md-9">
													<input name="totalNumberOfPlotsBooked" id="totalNumberOfPlotsBooked"
														class="form-control requiredValFld" value="${obj.totalNumberOfPlotsBooked}"
														placeholder="only digits are allowed" />
												</div>
											</div>
											<div class="form-group row">
												<label class="col-md-3 form-control-label"
													for="totalNumberOfPlotsAvailable">No. of Plots Available</label>
												<div class="col-md-9">
													<input name="totalNumberOfPlotsAvailable" id="totalNumberOfPlotsAvailable"
														class="form-control requiredValFld" value="${obj.totalNumberOfPlotsAvailable}"
														placeholder="only digits are allowed" />
												</div>
											</div> --%>
											</c:forEach>
				<button type="button" class="btn btn-success btn-sm pull-right" id="plotFormId">Save</button>
										<br>
										</div>
										</c:when>
								 <c:otherwise>
								 <div class="trower-div"
											style="border-style: ridge; padding: 20px; background-color: #F8F8F8;">

											<div class="form-group row">
												<label class="col-md-3 form-control-label"
													for="totalNumberOfPlots">Total number of Plots</label>
												<div class="col-md-9">
													<input type="number" name="totalNumberOfPlots" id="totalNumberOfPlots" value=""
														name="totalNoOfPlots" class="form-control requiredValFld"
														placeholder="only digits are allowed" />
												</div>
											</div>
											
											<div class="form-group row">
											  <input type="hidden" name="towerDetailsId" value=""/>
												<label class="col-md-3 form-control-label"
													for="totalnoOfEWSPlots">Number of EWS(6x9) Plots</label>
												<div class="col-md-9">
													<input type="number" name="totalnoOfEWSPlots" id="totalnoOfEWSPlots" value=""
														name="towerName" class="form-control requiredValFld"
														placeholder="only digits are allowed" />
												</div>
											</div>
											
											<div class="form-group row">
											  <input type="hidden" name="towerDetailsId" value=""/>
												<label class="col-md-3 form-control-label"
													for="totalnoOfLIGPlots">Number of LIG(9x12) Plots</label>
												<div class="col-md-9">
													<input type="number" name="totalnoOfLIGPlots" id="totalnoOfLIGPlots" value=""
														name="towerName" class="form-control requiredValFld"
														placeholder="only digits are allowed" />
												</div>
											</div>
											
											<div class="form-group row">
											  <input type="hidden" name="towerDetailsId" value=""/>
												<label class="col-md-3 form-control-label"
													for="totalnoOfMIGPlots">Number of MIG(9x15) Plots</label>
												<div class="col-md-9">
													<input type="number" name="totalnoOfMIGPlots" id="totalnoOfMIGPlots" value=""
														name="towerName" class="form-control requiredValFld"
														placeholder="only digits are allowed" />
												</div>
											</div>
											
											<div class="form-group row">
											  <input type="hidden" name="towerDetailsId" value=""/>
												<label class="col-md-3 form-control-label"
													for="totalnoOfHIGPlots">Number of HIG(15x24) Plots</label>
												<div class="col-md-9">
													<input type="number" name="totalnoOfHIGPlots" id="totalnoOfHIGPlots" value=""
														name="towerName" class="form-control requiredValFld"
														placeholder="only digits are allowed" />
												</div>
											</div>
											
											<div class="form-group row">
											  <input type="hidden" name="towerDetailsId" value=""/>
												<label class="col-md-3 form-control-label"
													for="totalnoOfOtherPlots">Number of Other Plots</label>
												<div class="col-md-9">
													<input type="number" name="totalnoOfOtherPlots" id="totalnoOfOtherPlots" value=""
														name="towerName" class="form-control requiredValFld"
														placeholder="only digits are allowed" />
												</div>
											</div>

			<!-- 								<div class="form-group row">
												<label class="col-md-3 form-control-label"
													for="approvedPlanAttachment">Approved Plan with Site Number</label>
												<div class="col-md-9">
													<input type="file" id="approvedPlanAttachment" name="approvedPlanAttachment" class="form-control requiredValFld">
                                 <span class='requiredValFldMsg'> Please Select attachment for approved plan </span> 
												</div>
											</div> -->
										
											<!-- <div class="form-group row">
												<label class="col-md-3 form-control-label"
													for="totalNumberOfPlotsBooked">No. of Plots booked</label>
												<div class="col-md-9">
													<input name="totalNumberOfPlotsBooked" id="totalNumberOfPlotsBooked"
														class="form-control requiredValFld"
														placeholder="only digits are allowed" />
												</div>
											</div>
											<div class="form-group row">
												<label class="col-md-3 form-control-label"
													for="totalNumberOfPlotsAvailable">No. of Plots Available</label>
												<div class="col-md-9">
													<input name="totalNumberOfPlotsAvailable" id="totalNumberOfPlotsAvailable"
														class="form-control requiredValFld" value=""
														placeholder="only digits are allowed" />
												</div>
											</div> -->
											
											
											<button type="button" class="btn btn-success btn-sm pull-right" id="plotFormId">Save</button>
										<br>
										</div>
										</c:otherwise> 
								 </c:choose>
								 </form:form>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--/col-->
		</div>

	</div>
	<!-- /.conainer-fluid --> </main>



</body>

</html>