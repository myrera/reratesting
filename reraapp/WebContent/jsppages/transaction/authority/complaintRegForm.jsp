<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="in.gov.rera.common.util.DateUtil"%>
	<%@page import="in.gov.rera.common.security.ReraSecurity"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="/resources/js/DatePicker/jquery.datepick.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/projectjs/projectJs.js"></script>
	<script src="<%=request.getContextPath() %>/resources/agentjs/agentJs.js"></script>
	<link rel="stylesheet"	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
                                                
<!--News Ticker-->
<div class="container">
	<br>

	<!--main container start here-->
	<div class="Main_containner">

		<!--Inner wrapper stsrt here-->
		<div class="inner_wrapper tsklist">




                                                    <h1>
                                                        Complaints <span>RERA Karnataka</span>
                                                    </h1>
                                                    <div class="drop_shadow"></div>
                                                <div class="clearfix"></div>

	  <form:form cssClass="form-horizontal" id="trxForm" autocomplete="off" action="saveComplaintDetails" modelAttribute="ComplaintModelReport"
		 enctype="multipart/form-data" method="post">  
		
	
		
	<div class="row">

		<div class="col-md-1"></div>


		<div class="col-md-9">
			<div>
				<div class="card-block">

					<div class="row">
						<div class="col-md-3 control-label">Complaint No </div>
						<div class="col-md-3">
							<input type="text" class="form-control requiredValFld" name ="complaintNo" onchange="showInfo()" id="applicationId"
								placeholder="Complaint Number">
								<span class='requiredValFldMsg'> Please enter complaint Number</span>
						</div>
							
						
					</div>
					<br>
					<div class="row">
					
					<div class="col-md-3 control-label">Petitioner </div>
						<div class="col-md-3">
							<input type="text" class="form-control requiredValFld" name ="petitioner" id="promoterNameId" 
								placeholder="Name of the petitioner">
								<span class='requiredValFldMsg'> Please enter Name of the petitioner</span>
						</div>
					</div>
					<br>
					<div class="row">
					<div class="col-md-3 control-label">Respondent Name </div>
						<div class="col-md-3">
							<input type="text" class="form-control requiredValFld" name ="respondentName" id="respondentName" 
								placeholder="Name of the Respondent">
								<span class='requiredValFldMsg'> Please enter Name of the Respondent</span>
						</div>
					</div>
					<br>
				<div class="row">
				<label for="inputEmail3" class="col-md-3 control-label">District</label>
						<div class="col-md-3"> 
						<select class="form-control" name='distName' >
						<option value='0'> --Select District-- </option>
						<c:forEach items="${distList}" var="dst">
						<option value='${dst.districtName }'> ${dst.districtName } </option>
						</c:forEach>
						</select>
						</div>
					</div> 
					<br>
					<div class="row">
					<label for="inputEmail3" class="col-md-3 control-label">Order Date </label>
								<div class="col-md-3">
										<input type="text" name="orderDate" class="form-control input-sm requiredValFld augCalCssClass"   readonly="readonly">
										 <span	class="glyphicon glyphicon-calendar augCalImgCssClass"></span>
									<span class='requiredValFldMsg'> Please Select order  Date.</span>
								</div>
								</div>
								<br>
								<br>
					<div class="row">
						<div class="col-md-3 control-label">Order Copy  </div>
						<div class="col-md-3">
							<input type="file" class="form-control thirtyMBsizefile" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="reportDocOne" name="orderCopy"/>
						</div>
					</div>
					<br>
													<div class="button-wrapper">
                                                        <input name="btn1" class="btn-style" value="Save" type="button" onclick="submitfrm();" />
                                                       <!--  <button type="button" class="close" data-dismiss="modal">Close</button> -->
                                                    </div>
					

				</div>
			</div>
		</div>
	</div>  </form:form>  


	<br> <br>
</div>

</div>


<script>

function submitfrm(){
	var _frm=$('#trxForm');
	if(validateForm(_frm)){
		alert("Successfully Registered");
		$(_frm).submit();
	}
}

/* (document).ready(function() {
    (".text").hide()

}); */
function getResults(elem) {
    elem.checked && elem.value == "Yes" ? (".text").show() : (".text").hide();
};


var applicationArray = new Array();
var applicationNameList = new Array();
 <c:forEach items="${complaintmodelList}" var="application">
	var localObj = {
		appNo : '<c:out value="${application.complaintNo}"/>'
	};
	var count = 0;
	count = count + 1;
	if (count < 10)
		applicationNameList
				.push('<c:out value="${application.complaintNo}"/>');
	applicationArray.push(localObj);
	</c:forEach>
	
$(function() {
		$("#applicationId").autocomplete(
				{
					source : function(request, response) {
						var results = $.ui.autocomplete.filter(
								applicationNameList, request.term);

						response(results.slice(0, 5));
					}
				});
	});

	function showInfo() {
		var selectedApp = document.getElementById('applicationId').value;
		console.log(selectedApp)
		for (var i = 0; i < applicationArray.length; i++) {
			if (selectedApp == applicationArray[i].applicationNo) {
				document.getElementById('applicationId').value = applicationArray[i].appNo;
			}
		}
	}


function ShowHideDiv() {
    var chkYes = document.getElementById("chkYes");
    var dvtext = document.getElementById("dvtext");
    dvtext.style.display = chkYes.checked ? "block" : "none";
}

</script>






