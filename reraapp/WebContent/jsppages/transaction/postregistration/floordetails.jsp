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
<!-- <script>
    window.onload = function() {
       
    };
    var noOfFloors=sessionStorage.getItem('numberOfFloors');
    for (i = 0; i < 10; i++) {
    	document.getElementById("noOfFloors").innerHTML = i;
    }
</script> -->
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
		<%@include file="/jsppages/transaction/postregistration/leftnav.jsp"%>
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
								<div class="col-md-6">
									<i class="fa fa-align-justify"></i> Floor Details
								</div>
							</div>
						</div>
						<div class="card-block">
<div class="panel-heading card-header collapsed" data-toggle="collapse" data-target="#bar1">
                                        <b>Provide the Floor Details</b>
                                            </div>
                                            
                                            <form:form class="form-horizontal" autocomplete="off" action="updateFloorDetails" modelAttribute="projectRegistrationModel" enctype="multipart/form-data" id="updatefloorForm" method="post">
                                                 <div class="panel-body">
                                            <!-- The inside div eliminates the 'jumping' animation. -->
                                            <div >
                            
                           
                                   <c:choose>
                                   <c:when test="${empty floorList}">
                                     <table class="table table-bordered table-striped table-condensed" id="floor-list">
                                <thead>
                                    <tr>
                                        <th rowspan="2">Floor No. </th>
                                        
                                        <th rowspan="2">No. of Units</th>
                                    </tr>
                                </thead>
                                <tbody >
                                   <% int count = -1; %>
                                   <c:forEach var="floorincrement" begin="0" end="${noOfFloors}"><!--end should be captured from backend  -->
                                    <tr> 
                                      <%--   <td id="noOfFloors"><c:out value="${floorincrement}"/></td> --%>
                                        <td id="noOfFloors"><input id="" type="text" name="floorNo" value="${floorincrement}" readonly="true" /></td>
                                        <td><input type="text" id="totNoOfApartment_<%= ++count%>" name="totNoOfApartment" /></td>
                                    </tr>
                               
                                  </c:forEach>
                                  
                                  <c:forEach items="${projectRegistrationModel.projectDetailsModel.towerDetailsList}" var="tower" 
                                  begin="${projectRegistrationModel.projectDetailsModel.towerDetailsList.size()-1}" end="${projectRegistrationModel.projectDetailsModel.towerDetailsList.size()}">
								<input type="hidden" name="totApartments" id="totApartments" readOnly value="${tower.totApartments}"/>
                                  </c:forEach>
                                    </tbody>
                            </table>
                              <button type="button" class="btn btn-primary btn-sm pull-right" id="floorFormId">Save </button> 
                                            <br/>
                           <br/>

                                   </c:when>
                                   <c:otherwise>
                                     <table class="table table-bordered table-striped table-condensed" id="floor-list">
                                <thead>
                                    <tr>
                                        <th rowspan="2">Floor No. </th>
                                        
                                        <th rowspan="2">No. of Units</th>
                                    </tr>
                                </thead>
                                <tbody >
                                      <%int apcount=-1; %>
                                <c:forEach items="${floorList}" var="obj">
                                <tr>
                                <td id="noOfFloors"><input id="" type="text" name="floorNo" value="${obj.floorNo}" readonly="true" /></td>
                                <td><input type="text" id="totNoOfApartment_<%= ++apcount%>" name="totNoOfApartment"  value="${obj.totNoOfApartment}" /></td>
                             </tr>   </c:forEach>
                                  
                                  <c:forEach items="${projectRegistrationModel.projectDetailsModel.towerDetailsList}" var="tower" 
                                  begin="${projectRegistrationModel.projectDetailsModel.towerDetailsList.size()-1}" end="${projectRegistrationModel.projectDetailsModel.towerDetailsList.size()}">
								<input type="hidden" name="totApartments" id="totApartments" readOnly value="${tower.totApartments}"/>
                                
                                  </c:forEach>
                                    </tbody>
                            </table>
                              <button type="button" class="btn btn-primary btn-sm pull-right" id="floorFormId">Save </button> 
                                            <br/>
                           <br/>
							<p style="text-align:right"><font color="red">* choose Add More Tower Details for additional Tower details</font></p>
							<a href="towerdetails"><button type="button" class="btn btn-success btn-sm pull-right btn-add-tower">Add More Tower Details</button></a>
                           <br/>
                                   </c:otherwise>
                                   
                                   </c:choose>
                                   
                                   <%--  --%>
                                   
                                  
                                  
                                <%--   <c:if test="${fn:length(attachments) > 0}">
    						<c:forEach var="attachment" items="${attachments}" varStatus="loopCount">
        				<c:if test="${loopCount.count eq 1}">
         						attachment.id
       					 </c:if>
    					</c:forEach>
						</c:if> --%>
                              
                            </div>
                            
                            </div>
                                
                                            </form:form>
                                       
								</div>
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