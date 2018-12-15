<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="in.gov.rera.common.util.ReraConstants"%>
<%@page import="in.gov.rera.common.model.UserModel"%>
<%
UserModel user=(UserModel)session.getAttribute(ReraConstants.SES_USER_ATTR);

%>
<div class="breadcrumb">Enquiry Details  <span class="pull-right user_name">Welcome :<b> <%=user.getUserName() %></b></span> </div>
s


<!--News Ticker-->
<div class="container">

	<!--main container start here-->
	<div class="Main_containner">

		<!--Inner wrapper start here-->
		<div class="inner_wrapper tsklist">






			<h1>Enquiry Details</h1>
			<div class="drop_shadow"></div>
			<div class="clearfix"></div>
			<h1>Your enquiry details has been successfully submitted.</h1>
			<div class="table-responsive">


				<table class="table table-bordered" id="taskList">
					<thead>
						<tr>

							<th>TICKET NUMBER</th>
							<th>ENQUIRY DATE</th>
							<th>CATEGORY</th>
							<th>DESCRIPTION</th>
							<th>STATUS</th>
<th>ATTACHMENTS</th>


						</tr>
					</thead>
					<tbody>
						<%
							int count = 0;
						%>
						<c:forEach items="${enquiries}" var="obj">
							<tr>

								<td>${obj.ticketNumber }</td>
								<td><c:set var="crdt" value="${obj.createdOn}" /> <fmt:formatDate
										type="date" pattern="dd-MM-yyyy" dateStyle="short"
										value="${crdt}" /></td>
								<td>${obj.category.name }</td>
								<td>${obj.description }</td>
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
																</tr>
															</thead>
															<tbody>
																<c:forEach items="${obj.logs}" var="log">

																	<tr>

																		<td><c:set var="crdt" value="${log.createdOn}" />
																			<fmt:formatDate type="date" pattern="dd-MM-yyyy HH:mm"
																				dateStyle="short" value="${crdt}" /></td>
																		<td>${log.assignor.userName}</td>
																		<td>${log.assignee.userName}</td>
																		<td>${log.status}</td>
																		<td>${log.description}</td>
																		
																	</tr>
																</c:forEach>
															</tbody>


														</table>
													</div>










												</div>

											</div>
										</div>
									</div></td>
									
									<td>
							<c:forEach  items="${obj.attachments}" var="doc">
							<a href='<%=request.getContextPath() %>/download?DOC_ID=${doc.documentId}'>${doc.fileName}</a>
							<br>
							</c:forEach>
							</td>
							</tr>

						</c:forEach>
					</tbody>
				</table>
			</div>






			<!--search list main end here-->
		</div>




		<!--inner container end here-->
	</div>




	<!-- container end here-->

</div>
</div>
