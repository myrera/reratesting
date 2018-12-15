<%@page import="in.gov.rera.common.security.ReraSecurity"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  
    <script>
    function submitForm(){
    	var _frm=$('#trxForm');
    	if(validateForm(_frm)){
    		$(_frm).submit();
    	}
    }
    var str=0;
    function showotp(){
    	str=str+1;
    	if(str==5){
    		str=0;
    		$('#otpspanid').show();
    	}else{
    		$('#otpspanid').hide();
    	}
    }
    </script>
	<form:form method="POST" autocomplete="off"  action="reportusverifyOTP" id="trxForm">
		<%-- <%=ReraSecurity.writeToken(request) %> --%>

		<div class="breadcrumb">Home / Real Estate Help Desk login</div>


		<!--News Ticker-->
		<div class="container">

			<!--main container start here-->
			<div class="Main_containner">

				<!--Inner wrapper stsrt here-->
				<div class="inner_wrapper">

                 

					<h1>
						Login <span> Form</span>
					</h1>
					<div class="border">
						<div class="orange"></div>
						<div class="black"></div>
					</div>

<div>
<b>NOTE:</b>  <span onclick="showotp()">One Time Password has been sent on given email Id.</span>
<%String msg=(String)session.getAttribute("ERROR_MSG");
if(msg!=null){
	session.setAttribute("ERROR_MSG", null);

%>
<br/><br/>
<span style="color:red;"><%=msg %></span>
<%} %>

</div>

					<form class="form-horizontal">
						<br> 
						
						<br>


						<div class="form-group">
							<label class="col-sm-2 control-label" id="emailIdLabel">Email Id<sup>*</sup></label>
							<div class="col-sm-3">
								<input type="text" class="form-control input-sm"id="emailId" placeholder="" value="${emailId}" readonly="readonly" name="emailId" />
									
							</div>


						</div>


						<div class="form-group">
							<label class="col-sm-2 control-label">One Time Password<sup>*</sup></label>
							<div class="col-sm-3">
								<input type="text" class="form-control input-sm  requiredValFld" id="otp" placeholder="Please enter One Time Password." name="oneTimePass" />
									<span class='requiredValFldMsg'> Please enter One Time Password.</span>
									<span id="otpspanid" style="display: none;">OTP is :${otppass}</span>
							</div>

                      <input type="hidden"  name="otpKey"  value="${otpKey}">
                        <input type="hidden"  name="mobileNo"  value="${mobileNo}"> 
						</div>


					</form>


					<br> <br>



				</div>
				<!--inner container end here-->


				<div class="button-wrapper">
					<input name="btn1" class="btn-style" value="Login" type="button" onclick="submitForm();"/>
				</div>

				<br>



			</div>
			<!-- container end here-->


		</div>


	</form:form>

	
	