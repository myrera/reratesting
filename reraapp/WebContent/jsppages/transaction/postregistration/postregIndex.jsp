<%-- <%@page import="in.gov.rera.common.security.ReraSecurity"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> --%>


<!DOCTYPE html>
<%@page import="in.gov.rera.common.security.ReraSecurity"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="in.gov.rera.common.util.ReraConstants"%>
<%@page import="in.gov.rera.common.model.UserModel"%>
<%
UserModel user=(UserModel)session.getAttribute(ReraConstants.SES_USER_ATTR);

%>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Root - Bootstrap 4 Admin Template">
    <meta name="author" content="Łukasz Holeczek">
    <meta name="keyword" content="Bootstrap,Admin,Template,Open,Source,AngularJS,Angular,Angular2,jQuery,CSS,HTML,RWD,Dashboard">
    <link rel="shortcut icon" href="resources/postprojregistration/img/favicon.png">

    <title>Post Registration</title>
    
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
            <button class="navbar-toggler mobile-toggler hidden-lg-up sidebar_btn" type="button"></button>
            <a class="navbar-brand" href="#"></a>
            <ul class="nav navbar-nav hidden-md-down">
                <li class="nav-item">
                    <a class="nav-link navbar-toggler layout-toggler sidebar_btn" href="#"></a>
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
			<div class="text-muted">
				<small>User &amp; user</small>
			</div>
		</div> 
		 <%@include file="/jsppages/transaction/postregistration/leftnav.jsp"%>
	</div>
    <%-- <div class="sidebar">

        <div class="sidebar-header">
            <img src="<%=request.getContextPath() %>/resources/postprojregistration/img/avatars/8.jpg" class="img-avatar" alt="Avatar">
            <div>
                <strong>Jhon</strong>
            </div>
            <div class="text-muted">
                <small>User &amp; user</small>
            </div>


        </div>

        <nav class="sidebar-nav">
            <ul class="nav">

                <li class="divider"></li>
                <li class="nav-item nav-dropdown">
                    <a class="nav-link " href="<%=request.getContextPath() %>/project/postRegProjectDetails"><i class="fa fa-tasks"></i> Project Detail</a>
                </li>
                <li class="nav-item nav-dropdown">
                    <a class="nav-link " href="<%=request.getContextPath() %>/projectschedule"><i class="fa fa-tasks"></i> Project Schedule</a>
                </li>

                <li class="nav-item nav-dropdown">
                    <a class="nav-link nav-dropdown-toggle" href="#"><i class="fa fa-rupee"></i> Cost Details</a>
                    <ul class="nav-dropdown-items">
                        <li class="nav-item">
                            <a class="nav-link" href="<%=request.getContextPath() %>/landcostdetails"><i class="fa fa-map-marker"></i> Land </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="<%=request.getContextPath() %>/constructioncostdetails"><i class="fa fa-building-o"></i>Construction </a>
                        </li>

                    </ul>
                </li>
                <li class="nav-item nav-dropdown">
                    <a class="nav-link " href="<%=request.getContextPath() %>/quaterlyupdate"><i class="fa fa-area-chart"></i> Quaterly Update</a>
                </li>
                <li class="nav-item nav-dropdown">
                    <a class="nav-link " href="<%=request.getContextPath() %>/projectsummary"><i class="fa fa-list-alt"></i> Project Summary</a>
                </li>
                <li class="nav-item nav-dropdown">
                    <a class="nav-link " href="<%=request.getContextPath() %>/finalapproval"><i class="fa fa-check"></i> Final Approvals</a>
                </li>
            </ul>
        </nav>
     </div> --%>

    <!-- Main content -->
    <main class="main">


        <div class="container-fluid">


        </div>
        <!-- /.conainer-fluid -->
    </main>

<!-- 
    <footer class="footer">
        <span class="text-left">
            <a href="http://www.keyfalconsolutions.com/">Branding</a> © 2016 Developers.
        </span>
        <span class="pull-right">
            Powered by <a href="http://www.keyfalconsolutions.com/">Keyfalcon Solutions</a>
        </span>
    </footer> -->

<%--    <%@ include file="/jsppages/transaction/postregistration/common_footer.jsp"%> --%>
</body>

</html>