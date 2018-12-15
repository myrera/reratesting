<%@page import="java.io.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%

try{
	File fl=new File("/home/ubuntu/DMS/");
	
	%>
	<%=fl.exists() %><br/>
	<%=fl.getName() %>	<%=fl.getAbsolutePath() %><br/>
	
	<%=fl.canWrite() %>  <%=fl.canRead() %>  <br/>
	<% 
	fl.setWritable(true,false);
	fl.setReadable(true);
	File f1=new File(fl,"test");
	
	f1.mkdir();
	
}
catch(Exception ex){

	%>
	<%=ex.getMessage() %>
	
	<%
	for(StackTraceElement st : 	ex.getStackTrace()){
		%>
		<%=st.getFileName() %> <%=st.getMethodName() %> <%=st.getLineNumber() %> <br/>
		<%
	}
	
}

%>