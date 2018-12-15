<!DOCTYPE html>
<%@page import="in.gov.rera.common.security.ReraSecurity"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="in.gov.rera.common.util.ReraConstants"%>
<%@page import="in.gov.rera.common.model.UserModel"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
    <link rel="shortcut icon" href="../resources/postprojregistration/img/favicon.png">
    
<%--     <link href="<%=request.getContextPath() %>/resources/css/bootstrap.min.css" rel="stylesheet"/>--%>
<link href="<%=request.getContextPath()%>/resources/css/style.css?rr=78889" rel="stylesheet"/>
<%-- <link href="<%=request.getContextPath()%>/resources/css/font-awesome.min.css" rel="stylesheet"/>  --%>
<%-- <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/datatable/jquery.dataTables.css"> --%>

    <title>Land Cost Details </title>

    

    <style>
        .panel-heading.collapsed .fa-chevron-down,
        .panel-heading .fa-chevron-right {
            display: none;
        }
        
        .panel-heading.collapsed .fa-chevron-right,
        .panel-heading .fa-chevron-down {
            display: inline-block;
        }
        
        i.fa {
            cursor: pointer;
            margin-right: 5px;
        }
        
        .collapsed~.panel-body {
            padding: 0;
        }
    </style>


</head>



<body class="navbar-fixed sidebar-nav fixed-nav">
    <header class="navbar">
        <div class="container-fluid">
            <button class="navbar-toggler mobile-toggler hidden-lg-up sidebar_btn" type="button"></button>
            <a class="navbar-brand" href="<%=request.getContextPath()%>/home"></a>
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
				src="<%=request.getContextPath() %>/reraimage?IMG_ID=${projectReg.promoterDetailsModel.individualPhotoGraphPath.documentId}"
				onerror="this.src='<%=request.getContextPath()%>/resources/postprojregistration/img/avatars/user-top-icon.jpg';return false;"
				class="img-avatar" alt="User profile"/>
			<div>
				<strong><%=user.getUserName()%></strong>
			</div>
			<!-- <div class="text-muted">
				<small>User &amp; user</small>
			</div> -->
		</div> 
		<%--  <%@include file="/jsppages/transaction/postregistration/leftnav.jsp"%> --%>
	</div>
    <!-- Main content -->
    <main class="main">


        <div class="container-fluid">



            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                              <!--     <div id='success-message-area' data-alert class="alert-box alert show">
			                   Updated Successfully
			                    <a href="#" class="close-alert">&times;</a>
			                </div> -->
                         
                        <div class="card-block">
                            <div class="container">
                                <div class="panel-group" id="accordion">
                                    <div class="container">


<!--Inner wrapper stsrt here-->
<div class="inner_wrapper">



<h1>Important points to remember before filing the application</h1>
<div class="border"><div class="orange"></div><div class="black"></div></div>

<br>

<!-- <label class="col-sm-2 control-label">1. </label> -->
  <h2>
    1. Refer RERA Act and Rules before filing the application.
  </h2>

  <h2>
    2. All the measurement of areas should be provided in MKS system of units (meter, sq. meter, cubic meter etc. whichever applicable).
  </h2>
  
  <h2>
    3.  If any promoter provides false information or contravenes the provisions  of Section 4,
        he/she shall be liable to pay a penalty which may extend up to 5% of the estimated cost of the real estate 
        project as determined by the Authority as per the RERA Act Section 60.
  </h2>
    
  <h2>
    4. At any given time, the Promoter shall maintain only one scheduled bank account for each project for any kind of transactions and minimum of 70% of the amount realized for the real estate project
       from the allottees will have to be used only for the construction.
      (Refer Sec 4 (2) (l) (D) of the Act and Rule 4 & 5).
      </h2>
  
  <h2>
     5. All the details provided like Number of units, Common areas etc. should be as per the Sanctioned plan issued by the competent Authority.
     

  </h2>
  

	<br>
	<br>	

<!--inner container end here-->


<div class="button-wrapper">
   <center><a href="postRegProjectDetails" ><input name="btn1" class="btn-style" value="I Agree" type="button"></a></center>
</div>

<br>

</div>
<!-- container end here-->
</div>


                                    

                                </div>
                            </div>
                            <!--/col-->
                        </div>

                    </div>
                    <!-- /.conainer-fluid -->
    </main>


  <!--   <footer class="footer">
        <span class="text-left">
              <a href="http://www.keyfalconsolutions.com/">Branding</a> © 2016 Developers.
          </span>
        <span class="pull-right">
              Powered by <a href="http://www.keyfalconsolutions.com/">Keyfalcon Solutions</a>
          </span>
    </footer> -->

</body>

</html>