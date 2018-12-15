<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.net.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript">
time = 0;
interval = setInterval(function() {
    //time--;
    //document.getElementById('time').innerHTML = "" + time + " seconds"
    if (time == 0) {
        // stop timer
        clearInterval(interval);
        // click
        document.getElementById('redirect').click();            
    }
}, 1000)

</script>
<title>Payment Receipt</title>

</head>
<body>
<%
String encoded = URLEncoder.encode(request.getParameter("encdata"),"UTF-8");
//out.println("encoded String is: "+encoded); 
String dept_code=request.getParameter("dept_code");
//out.println("dept_code String is: "+dept_code); 
%>


<a href="<%=request.getContextPath()%>/reraapp/paymentSuccessPage?encdata=<%=encoded%>&dept_code=<%=dept_code%>">
<input type="button" value="Redirecting Please Wait............." id="redirect"/></a>
</body>
</html>