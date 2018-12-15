<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="in.gov.rera.common.util.ReraConstants"%>
<%@page import="in.gov.rera.common.model.UserModel"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%
UserModel user=(UserModel)session.getAttribute(ReraConstants.SES_USER_ATTR);

%>
<div class="breadcrumb">Enquiry Details  <span class="pull-right user_name">Welcome :<b> <%=user.getUserName() %></b></span> </div>
<script>
$(document).ready(function() {
	var showChar = 100;
	var ellipsestext = "...";
	var moretext = "more";
	var lesstext = "less";
	$('.more').each(function() {
		var content = $(this).html();

		if(content.length > showChar) {

			var c = content.substr(0, showChar);
			var h = content.substr(showChar-1, content.length - showChar);

			var html = c + '<span class="moreelipses">'+ellipsestext+'</span>&nbsp;<span class="morecontent"><span>' + h + '</span>&nbsp;&nbsp;<a href="" class="morelink">'+moretext+'</a></span>';

			$(this).html(html);
		}

	});

	$(".morelink").click(function(){
		if($(this).hasClass("less")) {
			$(this).removeClass("less");
			$(this).html(moretext);
		} else {
			$(this).addClass("less");
			$(this).html(lesstext);
		}
		$(this).parent().prev().toggle();
		$(this).prev().toggle();
		return false;
	});
});
</script>

<script>
	$(document).ready(
			
			function() {
				var t=$('#taskList').DataTable(
						{
							dom : 'Bfrtip',
							lengthMenu : [
									[ 10, 25, 50, -1 ],
									[ '10 rows', '25 rows', '50 rows',
											'Show all' ] ],
							buttons : [ 'pageLength', {
								extend : 'excel',
								text : 'Export Into Excel',
								title : 'Applications Approved'
							} ],
							"columnDefs": [ {
					            "searchable": false,
					            "orderable": false,
					            "targets": 0
					        } ],
					        "order": [[ 0, 'asc' ]]
							
							});
					
					 t.on( 'order.dt search.dt', function () {
					        t.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
					            cell.innerHTML = i+1;
					        } );
					    } ).draw();

				});

	function returnTicket(ticketId) {
		document.trxForm.ticketId.value = ticketId;
		document.trxForm.type.value = 'RETURN';
	}
	function respondTicket(ticketId) {
		document.trxForm.ticketId.value = ticketId;
		document.trxForm.type.value = 'RESPOND';
	}

	function submitTrxForm() {
		document.trxForm.remarks.value = document.getElementById("comments").value;
		if (document.trxForm.type.value == 'RETURN') {
			document.trxForm.action = 'return';
		} else {
			document.trxForm.action = 'respond';
			alert("Ticket is closed and forwarded to Customer");
		}

		return true;
	}

	function setId(ticketId) {
		document.respondForm.ticketId.value = ticketId;
	}

	
	function selectType() {
		
		var ischecked_method=false;

		for ( var i = 0; i < document.getElementsByName('ticketId').length; i++) {
		    if(document.getElementsByName('ticketId')[i].checked) {

		        ischecked_method = true;

		        break;

		    }

		}


		if (document.respondForm.type.value == 'return') {
		document.respondForm.action = 'return';
		document.getElementById('showHide').style.display = "block";

		document.getElementById('publicComment').checked=false;

		} else {

		document.respondForm.action = 'respond';

		document.getElementById('showHide').style.display = "none";

		document.getElementById('publicComment').checked=true;

		}

		if(!ischecked_method){

		alert("Please select the ticket to perform action");

		return true;

		}
		}
</script>
<script>
function loginUser(){
	var type = document.respondForm.type.value;
	if (type == '') {
		alert('Please Select Action Type');
		return false;
	} else if (document.respondForm.type.value == 'return') {
		 if(0 == $('#assignId').val()){
			alert("Please select Assign To")
			$('#assignId').focus();
			return false;
			} 
	} else if (document.respondForm.type.value == 'respond') {
		 if( $('#remarks').val() == ''){
			alert("Please select Remarks")
			$('#remarks').focus();
			return false;
			} 
	}
	$("#respondForm").submit();

}
</script>



<!--News Ticker-->
<div class="container">

	<!--main container start here-->
	<div class="Main_containner">

		<!--Inner wrapper start here-->
		<div class="inner_wrapper tsklist">






			<h1>Enquiry Details</h1><h1><a class="pull-right user_name" href="<%=request.getContextPath() %>/helpdesk/viewAllTicketsByUser">View All Tickets</a></h1>
			<div class="drop_shadow"></div>
			<div class="clearfix"></div>


			<div class="table-responsive">


				<table class="table table-bordered" id="taskList">
					<thead>
						<tr>
							<th>S.NO</th>
							<th>SELECT</th>
							<th>TICKET NUMBER</th>
							<!-- <th>ENQUIRY DATE</th> -->
							<th>CATEGORY</th>
							<th>ENQUIRY TYPE</th>
							<th>DESCRIPTION</th>
							<th>STATUS</th>
							<!-- <th>CREATED BY</th> -->
							<!-- <th>CONTACT NUMBER</th> -->
							<th>APPLICATION NUMBER</th>
							<th>ATTACHMENTS</th>



						</tr>
					</thead>
					<tbody>
						<%
							int count = 0;
						%>
						<c:forEach items="${enquiries}" var="obj">
							<tr>
							<td><%=++count%>
								<td><input type="radio" name="ticketId"  data-toggle="modal" style="height:25px; width:25px;"
									data-target="#respondModal" 	value="${obj.id}" onclick='setId("${obj.id}")'>
								<%-- 	<div id="tid">${obj.id}</div> --%>
									</td>
								<td>${obj.ticketNumber }</td>
							<%-- 	<td><c:set var="crdt" value="${obj.createdOn}" /> <fmt:formatDate
										type="date" pattern="dd-MM-yyyy HH:mm" dateStyle="short"
										value="${crdt}" /></td> --%>
								<td>${obj.category.name }</td>
								<td>${obj.createdBy.userType }<br/><br/>${obj.createdBy.userName}<br/><br/>${obj.contactNumber}</td>
								<td class="comment more">${obj.description }</td>
								<td><input type="button" name="return"
									value="${obj.status}" data-toggle="modal"
									data-target="#returnModal${obj.id}">

									<div class="modal fade" id="returnModal${obj.id}" role="dialog">
										<div class="modal-dialog">

											<!-- Modal content-->
											<div class="modal-content">
												<div class="modal-header">
													<span>Status Details</span>
													<button type="button" class="close" data-dismiss="modal">&times;</button>
												</div>
												<div class="modal-body">

													<div class="table-responsive">
														<table class="table table-bordered">
															<thead>
																<tr>
																	<th>DATE</th>
																	<th>Assignor</th>
																	<th>Assignee</th>
																	<th>Status</th>
																	<th>Comments</th>
																	<th>Attachments</th>
																</tr>
															</thead>
															<tbody>
																<c:forEach items="${obj.logs}" var="log">

																	<tr>

																		<td><c:set var="crdt" value="${log.createdOn}" />
																			<fmt:formatDate type="date"
																				pattern="dd-MM-yyyy HH:mm" dateStyle="short"
																				value="${crdt}" /></td>
																		<td>${log.assignor.userName}</td>
																		<td>${log.assignee.userName}</td>
																		<td>${log.status}</td>
																		<td>${log.description}</td>
																		<td><c:forEach items="${log.attachments}"
																				var="doc">
																				<a
																					href='<%=request.getContextPath() %>/download?DOC_ID=${doc.documentId}'>${doc.fileName}</a>
																				<br>
																			</c:forEach></td>
																	</tr>
																</c:forEach>
															</tbody>


														</table>
													</div>










												</div>

											</div>
										</div>
									</div></td>
								<%-- <td>${obj.createdBy.userName}</td>
								<td>${obj.contactNumber}</td>
								 --%>
								  <td>
								  <c:set var = "appno" value = "${obj.applicationNumber}"/>
								  <c:choose>
								 <c:when test="${fn:startsWith(appno, 'AG/')}">
									   <a href="agentDetails?applicationNumber=${appno}">${appno}</a> 
									  </c:when>
									   <c:when test="${fn:startsWith(appno, 'PR/')}">
									   <a href="project?applicationNumber=${appno}">${appno}</a> 
									  </c:when>
									  <c:otherwise>
									  <a href="complaintDetails?applicationNumber=${appno}">${appno}</a>
									  </c:otherwise>
									  </c:choose>
									  </td> 
							<%-- 	 <c:set var = "string" value = "${obj.applicationNumber}"/>
						      <c:if test = "${fn:startsWith(string, 'AG/')}">
						       <td><a href="agentDetails?applicationNumber=${obj.applicationNumber}">${obj.applicationNumber}</a></td>  
						      </c:if>
						       <c:if test = "${fn:startsWith(string, 'PR/')}">
						       <td><a href="project?applicationNumber=${obj.applicationNumber}">${obj.applicationNumber}</a></td>  
						      </c:if>	
						       <c:if test = "${fn:startsWith(string, 'CMP/')}">
						       <td><a href="complaintDetails?applicationNumber=${obj.applicationNumber}">${obj.applicationNumber}</a></td>  
						      </c:if>	 --%>
								<td><c:forEach items="${obj.attachments}" var="doc">
										<a
											href='<%=request.getContextPath() %>/download?DOC_ID=${doc.documentId}'>${doc.fileName}</a>
										<br>
									</c:forEach></td>
							</tr>
							
							
						
						</c:forEach>
					</tbody>
				</table>

			</div>


			<div class="pop_main">
				<div class="modal fade" id="respondModal" role="dialog">
					<div class="modal-dialog">
						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
							</div>
							<div class="modal-body">

								<form:form class="form-horizontal " method="post"
									action="return" id="respondForm" name="respondForm"
									autocomplete="off" enctype="multipart/form-data">

									<input type="hidden" id="ticketId1" name="ticketId" value="">

									<br>
									<br>
									<div class="form-group">

										<div class="form-group  has-feedback ">
											<label for="inputEmail3" class="col-sm-3 control-label">Action
												Type</label>
											<div class="col-sm-9">
												<input type="radio" name="type" value="return"
													onclick="selectType()"> &nbsp; Return
												&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="type"
													value="respond" onclick="selectType()"> &nbsp;
												Respond
											</div>
										</div>
									</div>

									<div class="form-group">

										<div class="form-group  has-feedback ">
											<label for="inputEmail3" class="col-sm-3 control-label">Remarks</label>
											<div class="col-sm-9">
												<textarea name="remarks" class="form-control requiredValFld"
													id="remarks" cols="20"></textarea>
												<span class='requiredValFldMsg'> Please enter
													remarks.</span>
											</div>
										</div>
									</div>

									<div class="form-group  has-feedback " id="showHide">
										<label for="inputEmail3" class="col-sm-3 control-label ">Assign
											to</label>
										<div class="col-sm-9">

											<select name="assignId" id='assignId'
												class="form-control requiredValFld">
												<option value="0">--Select--</option>
												<c:forEach items="${users}" var="user">
													<option value="${user.userId}">${user.userName}</option>
												</c:forEach>
											</select> <span class='requiredValFldMsg'> Please assign ticket
												to a user</span>
										</div>
									</div>

									<div class="form-group  has-feedback ">
										<label for="inputEmail3" class="col-sm-3 control-label">Comment
											Visible to public ?</label>
										<div class="col-sm-9">

											<input type="checkbox" class="form-control"
												name="publicComment" id="publicComment">

										</div>
									</div>


									<div class="form-group has-feedback">
										<label for="inputPassword3" class="col-sm-3 control-label">Attachment
											1 </label>
										<div class="col-sm-9">
											<input type="file" Class="form-control requiredValFld"
												rel="txtTooltip"
												title="Only image or pdf file is allowed. file size upto 1 MB"
												data-toggle="tooltip" data-placement="bottom"
												name="attachment1" id="attachment1"> <span
												class='requiredValFldMsg'> Please Online Payment
												Receipt.</span>
										</div>
									</div>
									<br>
									<div class="form-group has-feedback">
										<label for="inputPassword3" class="col-sm-3 control-label">Attachment
											2 </label>
										<div class="col-sm-9">
											<input type="file" Class="form-control requiredValFld"
												rel="txtTooltip"
												title="Only image or pdf file is allowed. file size upto 1 MB"
												data-toggle="tooltip" data-placement="bottom"
												name="attachment2" id="attachment2"> <span
												class='requiredValFldMsg'> Please Online Payment
												Receipt.</span>
										</div>
									</div>
									<br>
									<div class="form-group has-feedback">
										<label for="inputPassword3" class="col-sm-3 control-label">Attachment
											3 </label>
										<div class="col-sm-9">
											<input type="file" Class="form-control requiredValFld"
												rel="txtTooltip"
												title="Only image or pdf file is allowed. file size upto 1 MB"
												data-toggle="tooltip" data-placement="bottom"
												name="attachment3" id="attachment3"> <span
												class='requiredValFldMsg'> Please Online Payment
												Receipt.</span>
										</div>
									</div>
									<br>
									<div class="form-group">
										<div class="col-sm-offset-3 col-sm-9">
  <input name="btn1" class="btn-style" value="Send" type="button" onclick="loginUser();" />
										</div>
									</div>
								</form:form>


							</div>

						</div>
					</div>
				</div>
			</div>

			<!--inner container end here-->
	</div>




	<!-- container end here-->

</div>
</div>





</div>

