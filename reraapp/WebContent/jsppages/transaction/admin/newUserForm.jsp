<%@page import="in.gov.rera.common.security.ReraSecurity"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
       <%@page import="in.gov.rera.common.util.ReraConstants"%>
<%@page import="in.gov.rera.common.model.UserModel"%>
<%
UserModel user=(UserModel)session.getAttribute(ReraConstants.SES_USER_ATTR);

%>

<script>
function checkUserType(sel){
		var val=sel.value;
		if(val=='OPERATOR'){
			$('#opTypeId').show();
		}else{
			$('#opTypeId').hide();
		}
		
	}

</script>
    
    <div class="breadcrumb">Home /New User Form<span class="pull-right user_name">Welcome :<b><%=user.getUserName() %></b></span></div>


<!--News Ticker-->
<div class="container">
<!--main container start here-->
<div class="Main_containner">

<!--Inner wrapper stsrt here-->
<div class="inner_wrapper ">

<form:form cssClass="form-horizontal" action="createNewUser"  modelAttribute="userModel" method="post" name="createNewUser-form" autocomplete="off" id="createNewUser-form">
 <%=ReraSecurity.writeToken(request) %>
     <div class="col-md-12">
     <h1>New User <span> Form</span></h1>
  
    <div class="border"><div class="orange"></div><div class="black"></div></div>
	 </div>
 
  	
		
					<div class="form-group">
					
						<label class="col-sm-3 control-label">User Name<sup>*</sup></label>

						<div class="col-sm-3">
							<form:input path="userName"
								id="userName" cssClass="form-control input-sm requiredValFld" />
								<span class='requiredValFldMsg'> Please enter User Name.</span>
						</div>
						<label for="inputEmail3" class="col-sm-2 control-label">Email ID<sup>*</sup></label>
						<div class="col-sm-3">
	<form:input path="emailId"
								id="emailId" cssClass="form-control input-sm requiredValFld" />
							
								<span class='requiredValFldMsg'> Please enter emailId.</span>
						</div>


					</div>														
				
					<div class="form-group">
						
						<label class="col-sm-3 control-label">Login Id<sup>*</sup></label>

						<div class="col-sm-3">
							<form:input path="loginId"
								id="loginId" cssClass="form-control input-sm requiredValFld" />
								<span class='requiredValFldMsg'> Please enter login Id.</span>
						</div>
						<label for="inputEmail3" class="col-sm-2 control-label">User Type<sup>*</sup></label>
						<div class="col-sm-3">

							<form:select path="userType" class="form-control requiredValFld" onchange="checkUserType(this);" >
								<form:option value="0" label=" -- Select -- " />
								<form:option value="OPERATOR" label="Operator" />
								<form:option value="AUTHORITY" label="Authority" />
								<form:option value="CHIEFAUTHORITY" label="Chief Authority" />
								<form:option value="JUNIOR" label="HELPDESK - JUNIOR" />
								<form:option value="HD ACCOUNTS" label="HELPDESK - ACCOUNTS" />
								<form:option value="HD ENGINEER" label="HELPDESK - ENGINEER" />
								<form:option value="MANAGER" label="HELPDESK - MANAGER" />
								<form:option value="LEGAL" label="HELPDESK - LEGAL" />
								<form:option value="TECHNICAL" label="HELPDESK - TECHNICAL" />
								<form:option value="HD U.AUTHORITY" label="HELPDESK - U.SECRETARY" />
								<form:option value="HD CHIEF AUTHORITY" label="HELPDESK - CHAIRMAN" />
							</form:select>
								<span class='requiredValFldMsg'> Please select user type.</span>
						</div>


					</div>	
					
				<div class="form-group" id="opTypeId" style="display: none;">
						
						
						<label for="inputEmail3" class="col-sm-3 control-label">Operator Type<sup>*</sup></label>
						<div class="col-sm-3">

							<form:select path="authorityType" class="form-control requiredValFld" >
								<form:option value="0" label=" -- Select -- " />
								<form:option value="OP_REVENUE" label="Revenue" />
								<form:option value="OP_ACCOUNTS" label="Accounts" />
								<form:option value="OP_TCP" label="TCP" />
                                <form:option value="OP_ENGG" label="Engineer" />
							</form:select>
								<span class='requiredValFldMsg'> Please select Operator type.</span>
						</div>


					</div>	
					
			
				
	<div class="form-group">		
				
				<div class="col-sm-3 col-md-offset-3">
				<input name="btn1" class="btn-style" value="Create User" type="button" onclick="createUser()">
				</div>						
	</div>		
																								
																									
																										

			
			
		
</form:form>

<!-- container end here-->

</div>
</div>
</div>
   
    <script>
    function createUser(){
    	var _frm=$('#createNewUser-form');
    	if(validateForm(_frm)){
    		$(_frm).submit();
    	}
    }
    </script>
      