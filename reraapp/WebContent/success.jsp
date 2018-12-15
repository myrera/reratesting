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
        document.getElementById('paymentReceipt').click();            
    }
}, 1000)

</script>
<title>payment receipt</title>
</head>
<body>
<br/>
<br/>
<%
//String decoded = URLDecoder.decode(request.getParameter("encdata"),"UTF-8");
//out.println("Decoded String is: "+decoded); 
String encoded =URLEncoder.encode(request.getParameter("encdata"), "UTF-8");
String dept=request.getParameter("dept_code");
//out.println("dept is: "+dept); 
%>
<a href="http://localhost:8080/reraapp/paymentSuccessPage?encdata=<%=encoded%>&dept_code=<%=dept%>"><input type="button" id="paymentReceipt" value="receipt"/></a>

</body>
</html>