<%@page import="in.gov.rera.common.security.ReraSecurity"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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



	<div class="container-fluid">

		<div class="row">
			<div class="col-sm-12">
				<div class="card">
					<div class="row">
						<div class="card-header">
						<div class="row">
					<%-- 	<c:forEach items="${postRegProjectDetails}" var="list">
									<i class="fa fa-align-justify"></i> Project Details : Registration Number - ${list.projectRegistrationNo}
</c:forEach> --%>

<i class="fa fa-align-justify"></i> Project Details : Registration Number - ${postRegProjectDetails.projectRegistrationNo}
								
							</div>
						</div>

						<div class="card-block">
							<table class="table table-bordered table-striped table-condensed">
								<thead>
									<tr>

										<th>RERA Registration No.</th>
										<th>Project Name</th>
										<th>Project Type</th>
										<th>Status</th>
										<th>Action</th>
										<!-- <th>Action</th>  -->
									</tr>
								</thead>
								<tbody>
									<%-- <c:forEach items="${postRegProjectDetails}"
										var="postRegProjectDetails"> --%>
										<tr>
											<td>${postRegProjectDetails.projectRegistrationNo}</td>
											<td>${postRegProjectDetails.projectDetailsModel.projectName}</td>
											<td>${postRegProjectDetails.projectDetailsModel.projectType}
											</td>
											<td><span class="tag tag-success">${postRegProjectDetails.projectDetailsModel.projectStatus}</span>
											</td>
											<td>
												<a href="plotDetails"><button type="button" class="btn btn-primary btn-sm"
													>Update Plot Details</button></a>
											</td>
										</tr>
									<%-- </c:forEach> --%>
								</tbody>
							</table>


							<form:form class="form-horizontal" autocomplete="off" action="updatePlotDocDetails"
							 modelAttribute="postRegProjectDetails" enctype="multipart/form-data" id="updateDocDetailsForm" method="post">
        <input type="hidden" value="projectRegistrationModel.ProjectDetailsModel.projectRegId">
		<div class="form-group row">
	<div class="modal-body">
<c:choose>
<c:when test="${not empty postRegProjectDetails.projectDetailsModel.postRegAgentDetails}">
	<div class="add-more" style="border-style: ridge; padding: 20px; background-color: #F8F8F8;">
									<div class="form-group row">
										<div class="modal-body">
												<div class="form-group">
													  <div class="row">
														<label class="col-sm-2 control-label">Prospectus/Brochure</label>
														<div class="col-sm-8">
															<div class="brochure-list">
																<div class="input-group brochure-input">
																	<span class="input-group-btn"> </span>
																	 <input type="hidden" name="prospectusOrBrochureDocId" value="${postRegProjectDetails.projectDetailsModel.prospectusOrBrochureDoc.documentId}" />
																	 <input type="file"	name="prospectusOrBrochureDoc" class="form-control" /> 
																	 <a href='<%=request.getContextPath() %>/download?DOC_ID=${postRegProjectDetails.projectDetailsModel.prospectusOrBrochureDoc.documentId}'>${postRegProjectDetails.projectDetailsModel.prospectusOrBrochureDoc.fileName}</a>
																</div>
															</div>
														</div>
														<!-- <div class="col-sm-2">
															<button type="button" class="btn btn-success btn-sm btn-add-brochure">
																<span class="glyphicon glyphicon-plus"></span> Add More
															</button>
														</div> -->
													</div>  
													
													
													<div class="row">
														<label class="col-sm-2 control-label">Advertisement</label>
														<div class="col-sm-8">
															<div class="brochure-list">
																<div class="input-group brochure-input">
																	<span class="input-group-btn"> </span>
																	 <input type="hidden" name="advertisementDocId" value="${postRegProjectDetails.projectDetailsModel.advertisementDoc.documentId}" />
																	 <input type="file"	name="advertisementDoc" class="form-control" /> 
																	 <a href='<%=request.getContextPath() %>/download?DOC_ID=${postRegProjectDetails.projectDetailsModel.advertisementDoc.documentId}'>${postRegProjectDetails.projectDetailsModel.advertisementDoc.fileName}</a>
																</div>
															</div>
														</div>
													<!-- 	<div class="col-sm-2">
															<button type="button" class="btn btn-success btn-sm btn-add-brochure">
																<span class="glyphicon glyphicon-plus"></span> Add More
															</button>
														</div> -->
													</div>  
												<%-- <c:forEach items="${postRegProjectDetails.projectDetailsModel.advertisementDocList }" var="advertisementDocList">
												<div class="row">
													<label class="col-sm-2 control-label">Advertisement Copy </label>
													<div class="col-sm-8">
														<div class="advertisement-list">
															<div class="input-group advertisement-input">
																<span class="input-group-btn"> </span> 
																<input type="hidden" name="advertisementDocId" value="${advertisementDocList.documentId}" />
																<!-- <input	type="file"	name="advertisementDoc"	class="form-control" /> -->
															<a	href='<%=request.getContextPath() %>/download?DOC_ID=${advertisementDocList.documentId}'>${advertisementDocList.fileName}</a>
															</div>
														</div>
													</div>
												<!-- 	<div class="col-sm-2">
														<button type="button"
															class="btn btn-success btn-sm btn-add-advertisement">
															<span class="glyphicon glyphicon-plus"></span> Add More
														</button>
													</div> -->
													</div>
													</c:forEach> --%>
														<c:forEach items="${postRegProjectDetails.projectDetailsModel.webSiteUrlDetails }" var="webSiteUrlDetails">
													<div class="row">
													<label class="col-sm-2 control-label">Website Url</label>
													<div class="col-sm-8">
														<div class="website-list">
															<div class="input-group website-input">
																<span class="input-group-btn"> </span> 
																<input type="text"	name="webSiteUrl" value="${webSiteUrlDetails.webSiteUrl}" class="form-control" />
															</div>
														</div>
													</div>
													<br>
													</div>
													<br/>
													</c:forEach>
													
												</div>
												
														<button type="button"
															class="btn btn-primary btn-sm btn-add-website">
															<span class="glyphicon glyphicon-plus"></span> Add More
														</button>
													<br/>
												<c:forEach items="${postRegProjectDetails.projectDetailsModel.postRegAgentDetails }" var="obj">
												<div class="row">
													<label class="col-sm-2 control-label">Agent Registration No </label>
													<div class="col-sm-8">

														<div class="agentNo-list">
															<div class="input-group agent-input">
																<span class="input-group-btn"> </span>
																 <input type="text" name="agentAppNo" value="${obj.agentAppNo}" class="form-control" />
															</div>
														</div>
													</div>
													
													</div>
													<br/>
												</c:forEach>
														<button type="button"
															class="btn btn-primary btn-sm btn-add-agentNo">
															<span class="glyphicon glyphicon-plus"></span> Add More
														</button>
												
													<br/>
													<br/>
													<div class="col-sm-2">
														<input type="button" value="save"
															class="btn btn-success btn-sm pull-right"
															id="updateDetailsId">													
															</div>
										</div>
										</form>

									</div>
								</div>

</c:when>
<c:otherwise>
	<div class="add-more" style="border-style: ridge; padding: 20px; background-color: #F8F8F8;">
									<div class="form-group row">
										<div class="modal-body">

												<div class="form-group">
													<div class="row">
														<label class="col-sm-2 control-label">Prospectus/Brochure</label>
														<div class="col-sm-8">
															<div class="brochure-list">
																<div class="input-group brochure-input">
																	<span class="input-group-btn"> </span> 
																	<input type="file"	name="prospectusOrBrochureDoc" class="form-control" />
																</div>
															</div>
														</div>
													<!-- 	<div class="col-sm-2">
															<button type="button" class="btn btn-success btn-sm btn-add-brochure">
																<span class="glyphicon glyphicon-plus"></span> Add More
															</button>
														</div> -->
													</div>
												
												<div class="row">
													<label class="col-sm-2 control-label">Advertisement
														Copy </label>
													<div class="col-sm-8">
														<div class="advertisement-list">
															<div class="input-group advertisement-input">
																<span class="input-group-btn"> </span>
																 <input type="file" name="advertisementDoc"	class="form-control" />
															</div>
														</div>
													</div>
													<!-- <div class="col-sm-2">
														<button type="button"
															class="btn btn-success btn-sm btn-add-advertisement">
															<span class="glyphicon glyphicon-plus"></span> Add More
														</button>
													</div>  -->
													</div>
													<br>
													
													<div class="row">
													<label class="col-sm-2 control-label">Website Url </label>
													<div class="col-sm-8">
														<div class="website-list">
															<div class="input-group website-input">
																<span class="input-group-btn"> </span> 
																<input type="text" 	name="webSiteUrl" class="form-control" />
															</div>
														</div>
													</div>
													<div class="col-sm-2">
														<button type="button"
															class="btn btn- btn-sm btn-primary btn-add-website">
															<span class="glyphicon glyphicon-plus"></span> Add More
														</button>
													</div> 
													</div>
													
													
												</div>
												<div class="row">
													<label class="col-sm-2 control-label">Agent Registration No </label>
													<div class="col-sm-8">

														<div class="agentNo-list">
															<div class="input-group agent-input">
																<span class="input-group-btn"> </span>
																 <input type="text" name="agentAppNo" class="form-control" />
															</div>
														</div>
													</div>
													<div class="col-sm-2">
														<button type="button"
															class="btn btn-primary btn-sm btn-add-agentNo">
															<span class="glyphicon glyphicon-plus"></span> Add More
														</button>
													</div>
													</div>
													<br/>
													
													
													<br/>
													<div class="col-sm-2">
														<input type="button" value="save" class="btn btn-success btn-sm pull-right"	id="updateDetailsId">													</div>
													</div>
									</div>
								</div>

</c:otherwise>

</c:choose>

                    </div>
						</div>
		 
		 </form:form> 
					
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
    </footer> -->


</body>

</html>