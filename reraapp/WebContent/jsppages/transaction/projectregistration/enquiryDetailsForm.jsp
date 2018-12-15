<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="in.gov.rera.common.util.DateUtil"%>
	<%@page import="in.gov.rera.common.security.ReraSecurity"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script
	src="<%=request.getContextPath()%>/resources/projectjs/projectJs.js"></script>
<style>

.dash_detail_grid .table-responsive {margin-top:25px;width:750px; left:50px; text-align:center; font-size:16px !important;
 position: relative;  }
.dash_detail_grid table th{ background-color:#b3b3b3;border-color:#992400; border: 2px !important; text-align: center;
font-size: 16px; padding: 8px; 
font-weight:600; text-transform: uppercase; color: #676767;}
.dash_detail_grid table td{ border-color:#992400; border-width:2px; color:#676767; font-size: 14px; 
background-color:#fff; padding: 8px; }
</style>
</head>



<script>
//penaltyAmtDIV

function showhideflds(sel){
	
	if(sel.value=='Yes'){
		$('#penaltyAmtDIV').show();
	}else{
		$('#penaltyAmtDIV').hide();
	}
	
}

function submitfrm(){
	var _frm=$('#trxForm');
	if(validateForm(_frm)){
		$(_frm).submit();
	}
}

</script>


		<form:form cssClass="form-horizontal" id="trxForm" autocomplete="off" action="saveEnquiryDetails" modelAttribute="enquiryModel"
		 enctype="multipart/form-data" method="post">
		 <%=ReraSecurity.writeToken(request) %>

	<div class="breadcrumb">Home / Real Estate Project Registration</div>

	<div class="container">

	
	</div>
	
	<!--News Ticker-->
	<div class="container">

		<!--main container start here-->
		<div class="Main_containner">
		<br>

							<div class="inner_wrapper">
							
							<div style="float: right;padding-right: 10px;"><a href="viewAppList">Back to List</a></div>
							
						
							
							<br>
							
								<h1>
									Enquiry <span> Details </span>
								</h1>
								<div class="drop_shadow"></div>

								<table class="table table-bordered">
									<tr>
										<th style="text-align:center">Enquiry Raised On</th>
										<th style="text-align:center">Subject</th>
										<th  style="text-align:center">Enquiry Text</th>
										<th  style="text-align:center">Enquiry Raised By</th>
										
									</tr>
									<c:if test="${projectRegistrationModel.enquiryList !=null}">
									<c:forEach items="${projectRegistrationModel.enquiryList}" var="enq">
										  <input type="hidden" name="enquiryId" value="${enq.enquiryId}" />  
										   <input type="hidden" name="enquiryText" value="${enq.enquiryText}" />  
										    <input type="hidden" name="subject" value="${enq.subject}" />  
										      <input type="hidden" name="emailId" value="${enq.emailId}"/> 
										<tr><td>
										<fmt:formatDate pattern="dd-MM-yyyy"
									value="${enq.createdOn.getTime()}" /></td>
											<td>${enq.subject}</td>
											<td>${enq.enquiryText}</td>
											<td>${projectRegistrationModel.authorityUser.userName}</td>
										</tr>
										</c:forEach>
										</c:if>
								</table>
								<br>
								<div class="col-sm-3">
<br><br>
									REPLY : <textarea name="replyText" id="replyID"
										class="form-control requiredValFld" ></textarea>
									<span class='requiredValFldMsg'> Please enter reply.</span>
								</div>
							
						</div>
						
						
					
						

			</div>
			<!--inner container end here-->


			<div class="button-wrapper">
				
					<input	name="btn1" class="btn-style" value="Update"  type="button" onclick="submitfrm();">
			</div>

			<br>



		</div>
		<!-- container end here-->


	</form:form>
	
	<script>
	
	</script>
