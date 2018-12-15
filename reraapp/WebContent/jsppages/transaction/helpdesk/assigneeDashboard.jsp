<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="shortcut icon" type="image/ico" href="http://www.datatables.net/favicon.ico">
<link rel="stylesheet" type="text/css" href="/reraapp/resources/css/datatable/jquery.dataTables.css">

<%@page import="in.gov.rera.common.util.ReraConstants"%>
<%@page import="in.gov.rera.common.model.UserModel"%>
<%
UserModel user=(UserModel)session.getAttribute(ReraConstants.SES_USER_ATTR);

%>
<div class="breadcrumb">Enquiry Details  <span class="pull-right user_name">Welcome :<b> <%=user.getUserName() %></b></span> </div>
<script>
$(document).ready(function() {
	var showChar = 80;
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
 
 
	function assign(ticketId, assignElement) {
		var question = "Are you sure you want to assign this ticket to "
				+ document.getElementById(assignElement).options[document
						.getElementById(assignElement).selectedIndex].text
				+ " ?";
		if (confirm(question)) {

			document.trxForm.ticketId.value = ticketId;
			document.trxForm.userId.value = document
					.getElementById(assignElement).value;
			
			document.getElementById("div1").style.display="block";
			
			document.trxForm.submit();
		}
	}
</script> 


<!--News Ticker-->
<div class="container">

	<!--main container start here-->
	<div class="Main_containner">

		<!--Inner wrapper start here-->
		<div class="inner_wrapper tsklist">






			<h1>Enquiry Details</h1><h1><a class="pull-right user_name" href="allTickets">View All Tickets</a></h1>
			<div class="drop_shadow"></div>
			<div class="clearfix"></div>
			<form name="trxForm" action="assign" method="post">
				<input type="hidden" name="ticketId"> <input type="hidden"
					name="userId">
					
					<div id="div1"> successfully Assigned</div>
					
				<div class="table-responsive">


					<table class="table table-bordered" id="taskList">
						<thead>
							<tr>
								<th>S.NO</th>
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
								<!-- <th>ASSIGN TO</th> -->


							</tr>
						</thead>
						<tbody>
							<%
								int count = 0;
							%>
							<c:forEach items="${enquiries}" var="obj">
								<tr>
 									<td><%=++count%>
									<td>${obj.ticketNumber } 
									<br/><br/>
									<select name="assigneeId${obj.id}" style="width:100%;"
										id='assigneeId${obj.id}' class="form-control requiredValFld"
										onchange="assign('${obj.id }','assigneeId${obj.id}')">
											<option value="0">--Select--</option>
											<c:forEach items="${users}" var="user">
												<option value="${user.userId}">${user.userName}</option>
											</c:forEach>
									</select>
									</td>
									<%-- <td><c:set var="crdt" value="${obj.createdOn}" /> <fmt:formatDate
											type="date" pattern="dd-MM-yyyy HH:mm" dateStyle="short"
											value="${crdt}" /></td> --%>
									<td>${obj.category.name } </td>
									<td>${obj.createdBy.userType }<br/><br/> ${obj.createdBy.userName}<br/><br/> ${obj.contactNumber}</td> 
									<td class="comment more">${obj.description }</td>
									<td><input type="button" name="return"
										value="${obj.status}" data-toggle="modal"
										data-target="#returnModal${obj.id}">

										<div class="modal fade" id="returnModal${obj.id}"
											role="dialog">
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
									<%-- <td>${obj.createdBy.userName}</td> --%>
									<%-- <td>${obj.contactNumber}</td> --%>
									
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
									
									<td><c:forEach items="${obj.attachments}" var="doc">
											<a
												href='<%=request.getContextPath() %>/download?DOC_ID=${doc.documentId}'>${doc.fileName}</a>
											<br>
										</c:forEach></td>
							<%-- 		<td><select name="assigneeId${obj.id}"
										id='assigneeId${obj.id}' class="form-control requiredValFld"
										onchange="assign('${obj.id }','assigneeId${obj.id}')">
											<option value="0">--Select--</option>
											<c:forEach items="${users}" var="user">
												<option value="${user.userId}">${user.userName}</option>
											</c:forEach>
									</select></td>
 --%>



								</tr>
							</c:forEach>
						</tbody>
					</table>

				</div>
			</form>





			<!--search list main end here-->
		</div>




		<!--inner container end here-->
	</div>




	<!-- container end here-->

</div>
</div>
