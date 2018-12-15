<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script>
	$(document).ready(
			function() {
				var t =$('#allProjectList').DataTable(
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
				        "order": [[ 1, 'asc' ]]
						
						});
				
				 t.on( 'order.dt search.dt', function () {
				        t.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
				            cell.innerHTML = i+1;
				        } );
				    } ).draw();

			});
</script>


<div class="breadcrumb">Home /Project List</div>


<!--News Ticker-->
<div class="container">
	<br>

	<!--main container start here-->
	<div class="Main_containner">

		<!--Inner wrapper stsrt here-->
		<div class="inner_wrapper tsklist">



			<h1>
				View All Projects <span>List</span>
			</h1>
			<div class="drop_shadow"></div>
			<div class="clearfix"></div>


			<form class="form-horizontal" id="trxForm" autocomplete="off"
				action="viewAllProjects" method="post">
				<%--  <c:forEach items="${projectList}" var="obj"> --%>

				<div class="form-group">
					<label for="inputEmail3" class="col-sm-3 control-label">Project
						Type:</label>



					<div class="col-sm-3">
						<select name="type" class="form-control">
							<option value="0">-- Select --</option>
							<option value="Residential/Group Housing">Residential/Group
								Housing</option>
							<option value="Commercial">Commercial</option>
							<option value="Mixed Development">Mixed Development</option>
							<option value="Plotted Development">Plotted Development
							</option>
						</select> <span class='requiredValFldMsg'> Please Select Project
							Type .</span>
					</div>

					<label class="col-sm-2 control-label">Project Status:</label>
					<div class="col-sm-3">
						<select name="status" class="form-control ">
							<option value="0">-- Select --</option>
							<option value="PENDING_OPERATOR">Pending With Level 0</option>
							<option value="PENDING_AUTHORITY">Pending With Level 1</option>
							<option value="PENDING_HEADOFFICE">Pending With Level 2</option>

							<option value="APPROVED">Approved</option>
							<option value="REVOKED">Revoked</option>
							<option value="REJECTED">Rejected</option>

						</select> <span class='requiredValFldMsg'> Please Select Project
							Status .</span>
					</div>
				</div>

				<div class="form-group">
					<label for="inputEmail3" class="col-sm-3 control-label">From
						Date</label>
					<div class="col-sm-2">
						<input type="text" readonly="readonly" name="fromdate"
							class="form-control input-sm  augCalCssClass " /> <span
							class="glyphicon glyphicon-calendar augCalImgCssClass"></span>

					</div>

					<label for="inputEmail3" class="col-sm-2 control-label">To
						Date</label>
					<div class="col-sm-3">
						<input type="text" readonly="readonly" name="todate"
							class="form-control input-sm  augCalCssClass " /> <span
							class="glyphicon glyphicon-calendar augCalImgCssClass"></span>

					</div>


				</div>

				<div class="button-wrapper">

					<input name="btn1" class="btn-style" value="Filter" type="submit">
				</div>

				<h1>Total Project(s) : ${noOfPendingRequest}</h1>

				<%-- <form action="">

</form> --%>
				<div class="table-responsive">


					<table class="table table-bordered" id="allProjectList">
						<thead>
							<tr>
								<th>S.NO</th>

								<th>APPLICATION NO</th>
								<th>PROJECT</th>
								<th>PROJECT STATUS</th>
								<th>PROMOTER</th>
								<th>PROMOTTER TYPE</th>
								<th>PROPERTY TYPE</th>
								<th>STATUS</th>
								<th>PENALTY PAID:?</th>
								<th>APPLICATION DATE</th>

							</tr>
						</thead>
						<tbody>
							<%
								int count = 0;
							%>
							<c:forEach items="${projectList}" var="obj">
								<tr>
									<td><%=++count%>
									<td>${obj.applicationNo }</td>
									<td><a
										href="projectDetailsPage?PROJECT_ID=${obj.projectRegId}">
											${obj.projectDetailsModel.projectName } </a></td>
									<td>${obj.projectDetailsModel.projectStatus}</td>
									<td><a
										href="projectDetailsPage?PROJECT_ID=${obj.projectRegId}">
											${obj.promoterDetailsModel.promoterName }</a></td>
									<td>${obj.registrationType }</td>
									<td>${obj.projectDetailsModel.projectType }</td>
									<td>${obj.status }</td>
									<td>${obj.paymentDetailsModel.penaltyPaid}</td>

									<td><c:set var="crdt" value="${obj.createdOn.time}" /> <fmt:formatDate
											type="date" pattern="dd-MM-yyyy" dateStyle="short"
											value="${crdt}" /></td>
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
