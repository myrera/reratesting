<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>

<!--News Ticker-->

<div class="container">
	<!--main container start here-->
	<div class="col-md-12 col-sm-12">
		<div class="Main_containner dashboard">
			<div class="inner_wrapper">
				<h1>LO Users Report</h1>

				<div class="drop_shadow"></div>
				<div class="clearfix"></div>
<form class="form-horizontal">
<div class="table-responsive">

<% int pendingRevenueNewcount=0; %>
<jsp:useBean id="now" class="java.util.Date"/>
        <fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="today" scope="request"/>
<c:forEach items="${newProjectsRevenuelist}" var="obj">
<c:set var = "crdt" value = "${obj.createdOn.time}"/>
        <fmt:parseNumber value="${crdt.time / (1000*60*60*24)}" integerOnly="true" var="created" scope="request"/>
        <c:if test="${today-created gt 5}">
<%++pendingRevenueNewcount; %>
</c:if>
</c:forEach>

<% int pendingAgentsReturncount=0; %>
<c:forEach items="${returnedAgentslist}" var="obj">
<c:set var = "crdt" value = "${obj.createdOn.time}"/>
        <fmt:parseNumber value="${crdt.time / (1000*60*60*24)}" integerOnly="true" var="created" scope="request"/>
        <c:if test="${today-created gt 2}">
<%++pendingAgentsReturncount; %>
</c:if>
</c:forEach>

<% int pendingAccNewcount=0; %>
<c:forEach items="${newProjectsAcclist}" var="obj">
<c:set var = "crdt" value = "${obj.createdOn.time}"/>
        <fmt:parseNumber value="${crdt.time / (1000*60*60*24)}" integerOnly="true" var="created" scope="request"/>
        <c:if test="${today-created gt 5}">
<%++pendingAccNewcount; %>
</c:if>
</c:forEach>

<% int pendingTCPNewcount=0; %>
<c:forEach items="${newProjectsTCPlist}" var="obj">
<c:set var = "crdt" value = "${obj.createdOn.time}"/>
        <fmt:parseNumber value="${crdt.time / (1000*60*60*24)}" integerOnly="true" var="created" scope="request"/>
        <c:if test="${today-created gt 5}">
<%++pendingTCPNewcount; %>
</c:if>
</c:forEach>

<% int pendingENGGNewcount=0; %>
<c:forEach items="${newProjectsENGGlist}" var="obj">
<c:set var = "crdt" value = "${obj.createdOn.time}"/>
        <fmt:parseNumber value="${crdt.time / (1000*60*60*24)}" integerOnly="true" var="created" scope="request"/>
        <c:if test="${today-created gt 5}">
<%++pendingENGGNewcount; %>
</c:if>
</c:forEach>

<% int pendingRevenueReturncount=0; %>
<c:forEach items="${returnedProjectsRevenuelist}" var="obj">
<c:set var = "crdt" value = "${obj.createdOn.time}"/>
        <fmt:parseNumber value="${crdt.time / (1000*60*60*24)}" integerOnly="true" var="created" scope="request"/>
        <c:if test="${today-created gt 2}">
<%++pendingRevenueReturncount; %>
</c:if>
</c:forEach>

<% int pendingACCReturncount=0; %>
<c:forEach items="${returnedProjectsACClist}" var="obj">
<c:set var = "crdt" value = "${obj.createdOn.time}"/>
        <fmt:parseNumber value="${crdt.time / (1000*60*60*24)}" integerOnly="true" var="created" scope="request"/>
        <c:if test="${today-created gt 2}">
<%++pendingACCReturncount; %>
</c:if>
</c:forEach>

<% int pendingTCPReturncount=0; %>
<c:forEach items="${returnedProjectsTCPlist}" var="obj">
<c:set var = "crdt" value = "${obj.createdOn.time}"/>
        <fmt:parseNumber value="${crdt.time / (1000*60*60*24)}" integerOnly="true" var="created" scope="request"/>
        <c:if test="${today-created gt 2}">
<%++pendingTCPReturncount; %>
</c:if>
</c:forEach>

<% int pendingENGGReturncount=0; %>
<c:forEach items="${returnedProjectsENGGlist}" var="obj">
<c:set var = "crdt" value = "${obj.createdOn.time}"/>
        <fmt:parseNumber value="${crdt.time / (1000*60*60*24)}" integerOnly="true" var="created" scope="request"/>
        <c:if test="${today-created gt 2}">
<%++pendingENGGReturncount; %>
</c:if>
</c:forEach>


					<table class="table table-bordered" id="">
						<thead>
							<tr>
								<th colspan="5"><center>LO Projects Report</center></th>
							</tr>
						</thead>
						<thead>
							<tr>
								<th>LO User</th>
								<th>New projects</th>
								<th>Updated projects</th>
								<th>Returned projects</th>
							</tr>
						</thead>
						<tbody>
        <tr>
    <th>REVENUE</th>
    <td><%=pendingRevenueNewcount%></td>
    <td>${projectsUpdatedREV}</td>
    <td><%=pendingRevenueReturncount%></td>
 		 </tr>
 		 <tr>
        <th>ACCOUNTS</th>
    <td><%=pendingAccNewcount%></td>
    <td>${projectsUpdatedACC}</td>
    <td><%=pendingACCReturncount%></td>
 		 </tr>
 		  <tr>
        <th>TCP</th>
    <td><%=pendingTCPNewcount%></td>
    <td>${projectsUpdatedTCP} </td>
    <td><%=pendingTCPReturncount%></td>
 		 </tr>
 		 <tr>
        <th>ENGG</th>
    <td><%=pendingENGGNewcount%></td>
    <td>${projectsUpdatedENGG}</td>
    <td><%=pendingENGGReturncount%></td>
 		 </tr>
 		  
    </tbody>
    <thead>
							<tr>
								<th colspan="5"><center>LO Agents Report</center></th>
							</tr>
						</thead>
						<tbody>
        <tr>
    <th>AGENTS LO</th>
    <td>${agentsNew}</td>
    <td>${agentsUpdated}</td>
    <td><%=pendingAgentsReturncount%></td>
 		 </tr>
 		 </tbody>
					</table>
				</div>
				</form>
				<br><br><br>
				</div>
				</div>
				</div>
				</div>
				
</body>
</html>