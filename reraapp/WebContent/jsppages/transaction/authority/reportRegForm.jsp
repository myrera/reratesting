<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="in.gov.rera.common.util.DateUtil"%>
	<%@page import="in.gov.rera.common.security.ReraSecurity"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="<%=request.getContextPath() %>/resources/agentjs/agentJs.js"></script>	
<!-- <div class="breadcrumb">Home / Reports Us</div> -->


          
                                      
                                                
<!--News Ticker-->
<div class="container">
	<br>

	<!--main container start here-->
	<div class="Main_containner">

		<!--Inner wrapper stsrt here-->
		<div class="inner_wrapper tsklist">




                                                    <h1>
                                                        Report Unregistered Ongoing or New Projects to <span>RERA Karnataka</span>
                                                    </h1>
                                                    <div class="drop_shadow"></div>
                                                <div class="clearfix"></div>

	  <form:form cssClass="form-horizontal" id="trxForm" autocomplete="off" action="saveReportProblemDetails" modelAttribute="reportProblemModel"
		 enctype="multipart/form-data" method="post">  
		
	
<%-- 	<input type='hidden' name='reportId' value="${sessionScope.project.reportId }" />
 --%>		
	<div class="row">

		<div class="col-md-1"></div>


		<div class="col-md-9">
			<div>
				<div class="card-block">

					<div class="row">
						<div class="col-md-3 control-label">Name of the Project </div>
						<div class="col-md-3">
							<input type="text" class="form-control requiredValFld" name ="projectName" onchange="showInfo()" id="applicationId"
								placeholder="Name of the Project">
								<span class='requiredValFldMsg'> Please enter Name of the Project</span>
						</div>
							
						
					</div>
					<br>
					<div class="row">
					
					<div class="col-md-3 control-label">Name of the Promoter </div>
						<div class="col-md-3">
							<input type="text" class="form-control requiredValFld" name ="promoterName" id="promoterNameId" 
								placeholder="Name of the Promoter">
								<span class='requiredValFldMsg'> Please enter Name of the Promoter</span>
						</div>
					
					</div>
					
					<br>

					<br>
					<div class="row">
						<div class="col-md-3 control-label">Promoter Phone Number</div>
						<div class="col-md-3">
							<input type="text" min="0" class="form-control requiredValFld" name="mobileNo" maxlength="10"
								placeholder="Phone Number" rel="txtTooltip" title="Only digits are allowed." data-toggle="tooltip" data-placement="bottom">
								<span class='requiredValFldMsg'> Please enter phone number</span>
						</div>
						
					</div>
					<br>
					<div class="row">
					
					<div class="col-md-3 control-label">Promoter Email Address </div>
						<div class="col-md-3">
							<input type="text" class="form-control" name ="promoterEmail" id="promoterEmail" 
								placeholder="Promoter Email">
								
						</div>
					
					</div>
					<br>
					<div class="row">
					
					
							<div class="col-md-3 control-label">Project/Promoter Website</div>
						<div class="col-md-3">
							<input type="text" class="form-control " name="website" placeholder="Websites or Links">
						</div>
					</div>

					<br>
					
					<br>

				<div class="row">
						<div class="col-md-3 control-label">Project Address</div>
						<div class="col-md-3">
							<input type="text" class="form-control requiredValFld" placeholder="Address" name="address">
							<span class='requiredValFldMsg'> Please enter Project Address</span>
						</div>
						<div class="col-md-2"> 
						<select class="form-control" name='distName' >
						
							<option value='0'> --Select District-- </option>
						<c:forEach items="${distList}" var="dst">
						<option value='${dst.districtName }'> ${dst.districtName } </option>
						</c:forEach>
						</select>
						</div>
						<div class="col-md-2">
						 <input type="text" class="form-control" placeholder="Pin Code" min="0"  maxlength="6" name = "pincode" rel="txtTooltip" title="Only digits are allowed." data-toggle="tooltip" data-placement="bottom">
						</div>

					</div> 

					<br>
					
					
					<br>
					
					
					
						
						
					
					<div class="row">
						
						
						<div class="col-md-3 control-label">Any Other Relevant Details  </div>
						<div class="col-md-3">
							<input type="text" class="form-control" name="otherDetails" placeholder="Other Relevant Details">
						</div>
						
					</div>
					
					<br>
					<br>
					<div class="row">
						<div class="col-md-3 control-label">Any Related Documents </div>
						<div class="col-md-3">
							<input type="file" class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="reportDocOne" name="reportDocOne"/>
							 
						</div>
						<div class="col-md-3">
							
							<input type="file" class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="reportDocTwo" name="reportDocTwo"/>
							 
						</div>
						
						<div class="col-md-3">
							<input type="file" class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="reportDocThree" name="reportDocThree"/>
							 
						</div>
						
					</div>
					
					 

					<br>
					
						
													<div class="button-wrapper">
                                                        <input name="btn1" class="btn-style" value="Submit" type="button" onclick="submitfrm();" />
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

(document).ready(function() {
    (".text").hide()

});
function getResults(elem) {
    elem.checked && elem.value == "Yes" ? (".text").show() : (".text").hide();
};






var applicationArray = new Array();
var applicationNameList = new Array();
<c:forEach items="${allApplicantsList}" var="application">

var localObj = {
	projectName : '<c:out value="${application.projectDetailsModel.projectName}"/>',
	promoterName : '<c:out value="${application.promoterDetailsModel.promoterName}"/>',
	appNo : '<c:out value="${application.applicationNo}"/>'
};
var count = 0;
count = count + 1;
if (count < 10)
	applicationNameList
			.push('<c:out value="${application.projectDetailsModel.projectName}"/>');
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
		if (selectedApp == applicationArray[i].projectName) {
			document.getElementById('promoterNameId').value = applicationArray[i].promoterName;
			document.getElementById('ackNumId').value = applicationArray[i].appNo;
		}
	}
}


function ShowHideDiv() {
    var chkYes = document.getElementById("chkYes");
    var dvtext = document.getElementById("dvtext");
    dvtext.style.display = chkYes.checked ? "block" : "none";
}

</script>






