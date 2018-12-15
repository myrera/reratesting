<%@page import="in.gov.rera.common.security.ReraSecurity"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<!--News Ticker-->
<div class="container mar_top_20">




	
	
	
<div class="col-md-6 col-md-offset-3">	
	

<!--main container start here-->
<div class="Main_containner">

<!--Inner wrapper stsrt here-->
<div class="inner_wrapper">



<h1>Forget  <span>Password</span></h1>
<div class="drop_shadow"></div>

${ERROR_MSG}

<form class="form-horizontal login" method="post" action="retrievePassword" id="retrievePasswordForm" autocomplete="off" name="retrievePasswordForm">
<%=ReraSecurity.writeToken(request) %>
  <div class="form-group  has-feedback ">
    <label for="inputEmail3" class="col-sm-3 control-label">User Type:</label>
  <div class="col-sm-9">
      <span class="glyphicon glyphicon-user form-control-feedback"></span>
      <select type="text" class="form-control" name="uType" id="loginId">
      <option value='0'> --Select-- </option>
       <option value='AGENT'> Agent </option>
        <option value='PROMOTER'> Promoter </option>
      </select>
     
    </div>
  </div>
  <div class="form-group has-feedback">
    <label for="inputPassword3" class="col-sm-3 control-label">Registration No.: </label>
    <div class="col-sm-9">
     <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      <input type="text" class="form-control" name="regNo" id="regNo" placeholder="Please Enter Your Register Number">
    </div>
  </div>
  
  <div class="form-group">
    <div class="col-sm-offset-3 col-sm-9">
      <input name="btn1" class="btn-style" value="Retrieve Password" type="button" onclick="submitTrxForm()" />    
    </div>
  </div>
</form>
<br>
<br>



	<div class="clearfix"></div>
<!--search list main end here-->	
</div>

</div>

	</div>


	</div>

<script>
function submitTrxForm(){
	var _frm=$('#retrievePasswordForm');
	if(validateForm(_frm)){
		$(_frm).submit();
	}
}
</script>