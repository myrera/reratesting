<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE tiles-definitions PUBLIC "-//Apache Software Foundation//DTD Tiles Configuration 2.1//EN" "http://tiles.apache.org/dtds/tiles-config_2_1.dtd">

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	 <meta http-equiv="X-Frame-Options" content="deny">
	<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
	<title><tiles:getAsString name="title" /></title>
	
<!-- Bootstrap -->
<link href="<%=request.getContextPath() %>/resources/css/bootstrap.min.css" rel="stylesheet"/>
<link href="<%=request.getContextPath()%>/resources/css/style.css" rel="stylesheet"/>
<link href="<%=request.getContextPath()%>/resources/css/font-awesome.min.css" rel="stylesheet"/>
<script src="<%=request.getContextPath() %>/resources/js/jquery.min.js"></script>
		   <script type="text/javascript">
       function myFunction() {
    window.print();
}
    </script>
    
    <style>
	
		.col-sm-3  col-xs-3{ width:25% !important;}
	
	</style>
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

<script>
if(top!=self){
    top.location.replace(document.location);
    document.location='';
}
<%if(!request.getContextPath().equals("/")){%>
_ctxpath='<%=request.getContextPath()%>/';
<%}%>

	 if (!navigator.onLine) 
{ 
	document.body.innerHTML = 'Loading...'; 
	window.location = 'ErrorPage.html'; 
} 

</script>
</head>
 
<body>
		
<div class="container">

<!--main container start here-->
<div class="Main_containner">	
<div align="center" style="padding-bottom: 5px;"> <img src="<%=request.getContextPath() %>/resources/images/reralogo.png" style="height:180px;width:180px;" /></div>

<div align="center" style="padding-bottom: 20px; font-size: 18px; font-weight: bold;"> KARNATAKA RERA APPLICATION</div>
		<section id="site-content">
			<tiles:insertAttribute name="body" />
		</section>
		<div class="button-wrapper">
 <button class="btn btn-primary hidden-print" onclick="myFunction()"><span class="glyphicon glyphicon-print" aria-hidden="true"></span> Print</button>

<br>



</div>
		
		</div></div>

		
		
</body>
</html>