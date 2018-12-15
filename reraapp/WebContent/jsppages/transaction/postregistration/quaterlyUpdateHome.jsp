<%@page import="in.gov.rera.common.security.ReraSecurity"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="in.gov.rera.common.util.ReraConstants"%>
<%@page import="in.gov.rera.common.model.UserModel"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

<title>Project Details -</title>

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
                         <div class="col-md-12">
                            <i class="fa fa-align-justify"></i> Quarterly Update : Registration Number  -  ${projectRegistrationModel.projectRegistrationNo} 
                            </div>
                           <%--   <div class="col-md-6">
                             <select name="projectRegId" id="quarterSecProjId"  class=" form-control  requiredValFld" style="width: 180px !important; min-width: 180px; max-width: 180px;vertical-align:right;" >
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
					<div class="card-block">
						<table class="table table-bordered table-striped table-condensed">
							<thead>
								<tr>
									<th>Sl No.</th>
									<th>Quarterly Update Date</th>
									<th>Actual Quarter Updated Date</th>

								</tr>
							</thead>
							<tbody>
								<% int count = 0;%>
					<jsp:useBean id="now" class="java.util.Date"/>
								<c:forEach items="${quaterlyUpdate}" var="quaterlyUpdate">
									<tr>
										<td><%=++count%></td>
										
										<td>
										<c:set var="crdt" value="${quaterlyUpdate.updateDate.time}" /> 
										<fmt:formatDate type="date" pattern="dd-MM-yyyy" dateStyle="short" var="today" value="${now}" />
										<fmt:formatDate type="date" pattern="dd-MM-yyyy" dateStyle="short" var="qdate" value="${crdt}" />
										<c:choose>
										<c:when test="${crdt gt now || today==qdate}">
										<a href="quaterlyUpdate?QUARTER_ID=${quaterlyUpdate.quaterlyId}">
										<fmt:formatDate type="date" pattern="dd-MM-yyyy" dateStyle="short" value="${crdt}" />
										</a>
										</c:when>
										<c:otherwise>
										<a  style="background:gray">
										<fmt:formatDate type="date" pattern="dd-MM-yyyy" dateStyle="short" value="${crdt}" />
										</a>
										<a  href="quaterlyUpdate?QUARTER_ID=${quaterlyUpdate.quaterlyId}" style="background:gray">
										</a>
										</c:otherwise>
										</c:choose>

										</td>
										<td>
										<c:set var="udt" value="${quaterlyUpdate.actualUpdateDate.time}" /> <fmt:formatDate
											type="date" pattern="dd-MM-yyyy" dateStyle="short"
											value="${udt}" />
										</td>

									</tr>
								</c:forEach>
							</tbody>
						</table>

					</div>
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