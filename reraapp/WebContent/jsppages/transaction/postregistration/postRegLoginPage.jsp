<%@page import="in.gov.rera.common.security.ReraSecurity"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<script>
function postRegUserLogin(){
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
	
<h1 >Post Registration</h1>
	<p>
	Please Login or Register for the Post Registration and Quarterly Update.<br/></br>
	
	Click here for
	<a href="<%=request.getContextPath() %>/resources/staticpage/User Manual - Apartments.pdf" target="_blank"> Apartments User Manual</a>
	and <a href="<%=request.getContextPath() %>/resources/staticpage/User Manual -Plots.pdf" target="_blank"> Plots User Manual</a>
	</p> 
	<br>
<!--main container start here
<div class="Main_containner">

<!--Inner wrapper stsrt here-->
<div class="inner_wrapper">



<h1><span>Login</span></h1>
<div class="drop_shadow"></div>

${ERROR_MSG}

<form:form class="form-horizontal login" method="post" action="postRegUserLogin"  id="loginFormID" name="loginForm" autocomplete="off" >
<input type="hidden" name="loginId" id="uloginId" />
<input type="hidden" name="password" id="upassword" />

<%=ReraSecurity.writeToken(request) %>
  <div class="form-group  has-feedback ">
    <label for="inputEmail3" class="col-sm-3 control-label">Login Id</label>
  <div class="col-sm-9">
      <span class="glyphicon glyphicon-user form-control-feedback"></span>
      <input type="text" class="form-control" name="loginIdfld" id="loginIdfld" autocomplete="off" placeholder="Please Enter Your Login Id">
     
    </div>
  </div>
  <div class="form-group has-feedback">
    <label for="inputPassword3" class="col-sm-3 control-label">Password </label>
    <div class="col-sm-9">
     <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      <input type="password" class="form-control" name="passwordfld" id="passwordfld"
       autocomplete="new-password" placeholder="Please Enter Your Password">
    </div>
  </div>
  
  <div class="form-group">
    <div class="col-sm-offset-3 col-sm-9">
      <input name="btn1" class="btn-style" value="Login" type="button" onclick="postRegUserLogin();" />
       &nbsp;&nbsp;&nbsp;&nbsp;    <a href="<%=request.getContextPath() %>/postRegNewUser">New User ?</a>
       
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
