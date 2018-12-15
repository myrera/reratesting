<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE tiles-definitions PUBLIC "-//Apache Software Foundation//DTD Tiles Configuration 2.1//EN" "http://tiles.apache.org/dtds/tiles-config_2_1.dtd">

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	 <meta http-equiv="X-Frame-Options" content="deny">
	<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
	<title><tiles:getAsString name="title" /></title>
	
<!-- Bootstrap -->
<link href="<%=request.getContextPath() %>/resources/css/bootstrap.min.css" rel="stylesheet"/>
<link href="<%=request.getContextPath()%>/resources/css/style.css?rr=78889" rel="stylesheet"/>
<link href="<%=request.getContextPath()%>/resources/css/font-awesome.min.css" rel="stylesheet"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/datatable/jquery.dataTables.css">


<script src="<%=request.getContextPath() %>/resources/js/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/jquery.ticker.js?xzx=099"></script>
<script src="<%=request.getContextPath() %>/resources/js/site.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/common.js"></script> 
<script src="<%=request.getContextPath() %>/resources/js/commdropdown.js"></script> 
 <script src="<%=request.getContextPath() %>/resources/js/tripleencoding.js"></script>  
       <script src="<%=request.getContextPath() %>/resources/js/validation.js"></script>  
      <script src="<%=request.getContextPath() %>/resources/js/raphael-min.js"></script> 
     <script src="<%=request.getContextPath() %>/resources/js/morris.min.js"></script>  
     <script type="text/javascript" language="javascript" src="<%=request.getContextPath() %>/resources/js/jquery.dataTables.js">
	</script>
	<script src="<%=request.getContextPath() %>/resources/js/DatePicker/jquery.datepick.js"></script>
	<link href="<%=request.getContextPath()%>/resources/js/DatePicker/flora.datepick.css" rel="stylesheet"/>
	
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
		<header id="header">
			<tiles:insertAttribute name="header" />
		</header>
	
		<section id="sidemenu">
			<tiles:insertAttribute name="menu" />
		</section>
			
		<section id="site-content">
			<tiles:insertAttribute name="body" />
		</section>

		
		
			<footer id="bfooter">
			<tiles:insertAttribute name="bfooter" />
		</footer>
</body>
</html>