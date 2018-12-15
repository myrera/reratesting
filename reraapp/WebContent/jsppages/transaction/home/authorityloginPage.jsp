<%@page import="in.gov.rera.common.security.ReraSecurity"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<script>
function loginUser(){
var unam=	$('#loginIdfld').val();
var upass=	$('#passwordfld').val();
if(unam==''){
	alert('Pease enter login Id.');
	$('#loginIdfld').focus();
	return false;
}
if(upass==''){
	alert('Pease enter password.');
	$('#passwordfld').focus();
	return false;	
}
$('#uloginId').val( Base64.encode(unam));
$('#upassword').val( Base64.encode(upass));
$('#loginIdfld').val('');
$('#passwordfld').val('');
$('#loginFormID').submit();
}
</script>



<!--News Ticker-->
<div class="container mar_top_20">




	
	
	
<div class="col-md-6 col-md-offset-3">	
	

<!--main container start here-->
<div class="Main_containner">

<!--Inner wrapper stsrt here-->
<div class="inner_wrapper">



<h1>Authority <span>Login</span></h1>
<div class="drop_shadow"></div>

${ERROR_MSG}

<form:form class="form-horizontal login"  method="post" id="loginFormID"  action="authorityLogin" name="loginForm" autocomplete="off">

<input type="hidden" name="loginId" id="uloginId" />
<input type="hidden" name="password" id="upassword" />


<%=ReraSecurity.writeToken(request) %>
  <div class="form-group  has-feedback ">
    <label for="inputEmail3" class="col-sm-3 control-label">Login Id :</label>
  <div class="col-sm-9">
      <span class="glyphicon glyphicon-user form-control-feedback"></span>
      <input type="text" class="form-control" name="loginIdfld" id="loginIdfld" autocomplete="off" placeholder="Please Enter Your login ID">
     
    </div>
  </div>
  <div class="form-group has-feedback">
    <label for="inputPassword3" class="col-sm-3 control-label">Password</label>
    <div class="col-sm-9">
     <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      <input type="password" class="form-control" name="passwordfld" id="passwordfld" autocomplete="new-password" placeholder="Please Enter Your Password">
    </div>
  </div>
  
  <div class="form-group">
    <div class="col-sm-offset-3 col-sm-9">
      <input name="btn1" class="btn-style" value="Login" type="button" onclick="loginUser();" />
    </div>
  </div>
</form:form>
<br>
<br>



	<div class="clearfix"></div>
<!--search list main end here-->	
</div>

</div>


<!--inner container end here-->
	</div>


	</div>

<!-- container end here-->
