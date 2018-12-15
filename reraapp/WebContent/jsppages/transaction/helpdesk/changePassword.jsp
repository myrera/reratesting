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

    
    <div class="breadcrumb">Home /Change Password<span class="pull-right user_name">Welcome :<b><%=user.getUserName() %></b></span></div>


<!--News Ticker-->
<div class="container">
<!--main container start here-->
<div class="Main_containner">

<!--Inner wrapper stsrt here-->
<div class="inner_wrapper ">

<form:form class="form-horizontal" autocomplete="off" action="${pageContext.request.contextPath}/helpdeskChangePassword"  method="post" name="changePass" id="changePass">
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
				<input name="btn1" class="btn-style" value="Submit" type="button" onclick="checkOldPassword1()">
				</div>						
	</div>		
																								
																									
																										
			
<div class="button-wrapper">
   </div>
			
			
		
</form:form>

<!-- container end here-->

</div>
</div>
</div>
    <script>
    

    function checkOldPassword1(){
    	var currentPass=  $('#password').val();
    	var oldPassword=  $('#oldPassword').val();
    	
    	 
    	
    	var newpassword=$('#new_password').val();
    	var conFirmPassword=$('#conFirmPassword').val();
    	
    	if(oldPassword.trim()==''){
    		alert("Please enter your oldPassword");
    		$('#oldPassword').focus();
    	    return false;
    	}
     
    /* 	if(oldPassword.trim()!=currentPass){
    		alert("Please enter your valid old Password");
    		$('#oldPassword').focus();
    		return false;
    	}
      */
    	if(newpassword.trim()==''){
    		alert("Please enter your new  Password");
    		$('#new_password').focus();
    		return false;
    	}else{
    		 var minNumberofChars = 8;
    		//    var maxNumberofChars = 8;
    		    var regularExpression  = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,16}$/;

    		    if(newpassword.length < minNumberofChars){
    		    	alert("Password must contain atleast 8 characters ");
    		    	$('#new_password').focus();
    		        return false;
    		    }
    		    if(!regularExpression.test(newpassword)) {
    		        alert("password should contain atleast one number and one special character");
    		        $('#new_password').focus();
    		        return false;
    		    }
    	}
    	
    	
    	if(conFirmPassword.trim()==''){
    		alert("Please enter your new  confirm password");
    		$('#conFirmPassword').focus();
    		return false;
    	}
    	if(newpassword!=conFirmPassword){
    		alert("Entered password does not match");
    		return false;
    		
    	}
    	
    	 $('#password').val(Base64.encode(currentPass));
    	 $('#newpassword').val(Base64.encode(newpassword));
    	
    	 
    	  $('#oldPassword').val('');
    		$('#new_password').val('');
    	$('#conFirmPassword').val('');
    	
    	$('#changePass').submit();
    	
    	
     
    }
    </script>