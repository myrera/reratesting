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
	
	
	
     <!-- Icons -->
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" />
    
    <link href="<%=request.getContextPath()%>/resources/postprojregistration/css/simple-line-icons.css" rel="stylesheet">

    <!-- Premium Icons -->
    <link href="<%=request.getContextPath()%>/resources/postprojregistration/css/glyphicons.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/postprojregistration/css/glyphicons-filetypes.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/postprojregistration/css/glyphicons-social.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/postprojregistration/js/DatePicker/flora.datepick.css" rel="stylesheet"/>

    <!-- Main styles for this application -->
    <link href="<%=request.getContextPath()%>/resources/postprojregistration/css/style.css" rel="stylesheet">
    
        <script src="<%=request.getContextPath() %>/resources/js/jquery.min.js"></script>
           <%--   <script src="<%=request.getContextPath() %>/resources/js/DatePicker/jquery.datepick.js"></script>
              <script src="<%=request.getContextPath() %>/resources/js/bootstrap.min.js"></script>
              <script src="<%=request.getContextPath() %>/resources/js/news-ticker.js"></script>
              <script src="<%=request.getContextPath() %>/resources/js/common.js"></script>  
              <script src="<%=request.getContextPath() %>/resources/js/commdropdown.js"></script> 
              <script src="<%=request.getContextPath() %>/resources/js/validation.js"></script> 
              <script src="<%=request.getContextPath() %>/resources/js/tripleencoding.js"></script>  --%> 
        
	           <!--  <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script> 
	            <script src=" https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap.min.js"></script> 
                <script src="https://cdn.datatables.net/buttons/1.4.2/js/dataTables.buttons.min.js"></script> -->
                <!-- <script src="https://cdn.datatables.net/buttons/1.4.2/js/buttons.flash.min.js"></script> -->
                <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
                <!-- <script src="https://cdn.datatables.net/buttons/1.4.2/js/buttons.html5.min.js"></script>
                <script src="https://cdn.datatables.net/buttons/1.4.2/js/buttons.print.min.js"></script> -->
                
                
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.5/jspdf.debug.js" integrity="sha384-CchuzHs077vGtfhGYl9Qtc7Vx64rXBXdIAZIPbItbNyWIRTdG0oYAqki3Ry13Yzu" crossorigin="anonymous"></script>
   <script src="<%=request.getContextPath()%>/resources/pdf/jspdf.debug.js" ></script>
 <script src="<%=request.getContextPath()%>/resources/pdf/jspdf.plugin.autotable.js"></script>


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
		
		
			
		<section id="site-content">
			<tiles:insertAttribute name="body" />
		</section>
		
		<footer id="bfooter">
			<tiles:insertAttribute name="bfooter" />
		</footer>

		
		
</body>
</html>