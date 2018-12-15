<%@page import="in.gov.rera.common.security.ReraSecurity"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
       <%@page import="in.gov.rera.common.util.ReraConstants"%>
    <head>
    <script src="<%=request.getContextPath() %>/resources/agentjs/agentJs.js"></script>
    
    </head>   
<%@page import="in.gov.rera.common.model.UserModel"%>
<%
UserModel user=(UserModel)session.getAttribute(ReraConstants.SES_USER_ATTR);

%>

    
    <div class="breadcrumb">Home /Change Password1111<span class="pull-right user_name">Welcome :<b><%=user.getUserName() %></b></span></div>


<!--News Ticker-->
<div class="container">
<!--main container start here-->
<div class="Main_containner">

<!--Inner wrapper stsrt here-->
<div class="inner_wrapper ">

<form:form class="form-horizontal" autocomplete="off" action="${pageContext.request.contextPath}/changePassword"  method="post" name="changePass" id="changePass">
    <%=ReraSecurity.writeToken(request) %>
     <input type="hidden" name="password" id="password"  value='<%=user.getPassword() %>'/>
     <input type="hidden" name="newpassword"  id="newpassword" />
    <br>

     <div class="col-md-12">
     <h1>Change <span> Password</span></h1>
     ${CHNGPASS_MSG}
    <div class="border"><div class="orange"></div><div class="black"></div></div>
	 </div>
 
  	
			<div class="form-group">
				<label class="col-sm-3 control-label">Old Password</label>
				<div class="col-sm-3">
				 <input type="hidden" name="loginId" value="<%=user.getLoginId() %>">
				  <input type="text" name="oldPassword" class="form-control input-sm" id="oldPassword" placeholder="" >
				</div>
		
			</div>	
			
				
			<div class="form-group">		
				<label for="inputEmail3" class="col-sm-3 control-label">New Password </label>
				<div class="col-sm-3">
				<input type="password" name="new_password" class="form-control input-sm" id="new_password" placeholder="">
				</div>						
	</div>								
					
			<div class="form-group">		
				<label for="inputEmail3" class="col-sm-3 control-label">Confirm  Password </label>
				<div class="col-sm-3">
				<input type="password" name="conFirmPassword" class="form-control input-sm" id="conFirmPassword" placeholder="">
				</div>						
	</div>								
																
																		
			
	
				
	<div class="form-group">		
				
				<div class="col-sm-3 col-md-offset-3">
				<input name="btn1" class="btn-style" value="Submit" type="button" onclick="checkOldPassword()">
				</div>						
	</div>		
																								
																									
																										
			
<div class="button-wrapper">
   </div>
			
			
		
</form:form>

<!-- container end here-->

</div>
</div>
</div>
    