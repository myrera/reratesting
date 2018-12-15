<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script>
	/* $(document).ready(function() {
	 $('#allProjectList').DataTable();
	 } ); */

	function submitForm(url, applicationName) {
		var displayText = "Are you sure you want to release " + applicationName
				+ " for temp login? \n\n";
		displayText = displayText
				+ "Please Note:\nReleasing projects for temp login through this icon shall reset the verification status of all four operators to Not-Verified. ";

		if (confirm(displayText)) {
			window.location = url;

		}
	}

	//
	//Updates "Select all" control in a data table
	//
	function updateDataTableSelectAllCtrl(table) {
		var $table = table.table().node();
		var $chkbox_all = $('tbody input[type="checkbox"]', $table);
		var $chkbox_checked = $('tbody input[type="checkbox"]:checked', $table);
		var chkbox_select_all = $('thead input[name="select_all"]', $table)
				.get(0);

		// If none of the checkboxes are checked
		if ($chkbox_checked.length === 0) {
			chkbox_select_all.checked = false;
			if ('indeterminate' in chkbox_select_all) {
				chkbox_select_all.indeterminate = false;
			}

			// If all of the checkboxes are checked
		} else if ($chkbox_checked.length === $chkbox_all.length) {
			chkbox_select_all.checked = true;
			if ('indeterminate' in chkbox_select_all) {
				chkbox_select_all.indeterminate = false;
			}

			// If some of the checkboxes are checked
		} else {
			chkbox_select_all.checked = true;
			if ('indeterminate' in chkbox_select_all) {
				chkbox_select_all.indeterminate = true;
			}
		}
	}

	$(document)
			.ready(
					function() {
						// Array holding selected row IDs
						var rows_selected = [];
						var table = $('#example')
								.DataTable(
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
											'columnDefs' : [ {
												'targets' : 0,
												'searchable' : false,
												'orderable' : false,
												'width' : '1%',
												'className' : 'dt-body-center',
												'render' : function(data, type,
														full, meta) {
													return '<input type="checkbox">';
												}
											} ],
											'order' : [ [ 1, 'asc' ] ],
											'rowCallback' : function(row, data,
													dataIndex) {
												// Get row ID
												var rowId = data[2];

												// If row ID is in the list of selected row IDs
												if ($.inArray(rowId,
														rows_selected) !== -1) {
													$(row)
															.find(
																	'input[type="checkbox"]')
															.prop('checked',
																	true);
													$(row).addClass('selected');
												}
											}
										});

						// Handle click on checkbox
						$('#example tbody')
								.on(
										'click',
										'input[type="checkbox"]',
										function(e) {
											var $row = $(this).closest('tr');

											// Get row data
											var data = table.row($row).data();

											// Get row ID
											var rowId = data[2];

											// Determine whether row ID is in the list of selected row IDs
											var index = $.inArray(rowId,
													rows_selected);

											// If checkbox is checked and row ID is not in list of selected row IDs
											if (this.checked && index === -1) {
												rows_selected.push(rowId);

												// Otherwise, if checkbox is not checked and row ID is in list of selected row IDs
											} else if (!this.checked
													&& index !== -1) {
												rows_selected.splice(index, 1);
											}

											if (this.checked) {
												$row.addClass('selected');
											} else {
												$row.removeClass('selected');
											}

											// Update state of "Select all" control
											updateDataTableSelectAllCtrl(table);

											// Prevent click event from propagating to parent
											e.stopPropagation();
										});

						// Handle click on table cells with checkboxes
						$('#example').on(
								'click',
								'tbody td, thead th:first-child',
								function(e) {
									$(this).parent().find(
											'input[type="checkbox"]').trigger(
											'click');
								});

						// Handle click on "Select all" control
						$('thead input[name="select_all"]',
								table.table().container())
								.on(
										'click',
										function(e) {
											if (this.checked) {
												$(
														'#example tbody input[type="checkbox"]:not(:checked)')
														.trigger('click');
											} else {
												$(
														'#example tbody input[type="checkbox"]:checked')
														.trigger('click');
											}

											// Prevent click event from propagating to parent
											e.stopPropagation();
										});

						// Handle table draw event
						table.on('draw', function() {
							// Update state of "Select all" control
							updateDataTableSelectAllCtrl(table);
						});

						// Handle form submission event
						$('#frm-example').on(
								'submit',
								function(e) {
									
									if(confirm("Are you sure to disable temp login for selected application!\nBy disabling temp login the promoter not be able to update any information using temporary login. \n\nYou may reset this by using the 'reset temp login' button." ) == true ){
										
							
									
									var form = this;

									// Iterate over all selected checkboxes
									$.each(rows_selected,
											function(index, rowId) {
												// Create a hidden element
												$(form).append(
														$('<input>').attr(
																'type',
																'hidden').attr(
																'name', 'getId')
																.val(rowId));
											});
									
								     // FOR DEMONSTRATION ONLY     
								      
								      // Output form data to a console     
								      $('#example-console').text($(form).serialize());
								      console.log("Form submission", $(form).serialize());
								       
								      // Remove added elements
								   //   $('input[name="id\[\]"]', form).remove();
								       
								      // Prevent actual form submission
								   //   e.preventDefault();
							
									}
									});

					});
</script>
<div class="breadcrumb">Home /Pending Project Status</div>


<!--News Ticker-->
<div class="container">

	<!--main container start here-->
	<div class="Main_containner">

		<!--Inner wrapper start here-->
		<div class="inner_wrapper tsklist">



			<h1>
				Pending Project Status <span>List</span>
			</h1>
			<div class="drop_shadow"></div>
			<div class="clearfix"></div>
			<h1>Total Records : ${noOfPendingRequest}</h1>

<form id="frm-example" action="pendingProjectStatusToSave" method="POST" commandName="applicationList" >
			<div class="table-responsive">
			
			<div class="row" >
			<div class="col-md-2">
			<button class="btn btn-sm" >Disable Temp Login</button> 
			</div>
			</div>
			<br>
				<table class="table table-bordered" id="example">
					<thead>
						<tr>
							<!-- <th rowspan="2"><input name="select_all" value="1"
								type="checkbox"></th> -->
							<th rowspan="2">S.NO</th>
							<th rowspan="2">APPLICATION NUMBER</th>
					    	<th rowspan="2">APPLICATION DATE </th>
							<th rowspan="2">PROJECT</th>
							<th rowspan="2">PROJECT STATUS</th>
							<th rowspan="2">PENALTY PAID:?</th>
							<th rowspan="2">PROMOTER</th>
							<th colspan="4">STATUS</th>
						

						</tr>
						<tr>
							<th width="25%">ACCOUNTS</th>
							<th width="25%">REVENUE</th>
							<th width="25%">TCP</th>
							<th width="25%">ENGINEERS</th>

						</tr>
					</thead>
					<tbody>
						<%
							int count = 0;
						%>

						<c:forEach items="${projectList}" var="obj">
							<tr>
								
								<td><%=++count%></td>
								<td>${obj.applicationNo }</td>
								                 <td>
                    <c:set var = "crdt" value = "${obj.createdOn.time}" />
                  <fmt:formatDate type="date"  pattern="dd-MMM-yyyy" dateStyle="short" value="${crdt}"/>
                 </td>
								<td>${obj.projectDetailsModel.projectName }</td>
								<td>${obj.projectDetailsModel.projectStatus}</td>
								<td>${obj.paymentDetailsModel.penaltyPaid}</td>
								<td>${obj.promoterDetailsModel.promoterName }</td>
								<td align="center" style="vertical-align: middle"><c:set
										var="isRemarksTrue" value="false" /> <c:choose>
										<c:when test="${obj.projectRemarks.accountsStatus =='OK' }">
											<i  aria-hidden="true"
												style="color: green">Assigned</i>
											<%-- <c:set var="isRemarksTrue" value="true" /> --%>
										</c:when>
										<c:otherwise>

											<i class="fa fa-times" aria-hidden="true"
												style="color: #be6422;"></i>
										</c:otherwise>

									</c:choose></td>
								<td align="center" style="vertical-align: middle"><c:choose>
										<c:when test="${obj.projectRemarks.revenueStatus =='OK' }">
											<i  aria-hidden="true"
												style="color: green">Assigned</i>
											<c:set var="isRemarksTrue" value="true" />
										</c:when>
										<c:otherwise>

											<i class="fa fa-times" aria-hidden="true"
												style="color: #be6422;"></i>
										</c:otherwise>

									</c:choose></td>
								<td align="center" style="vertical-align: middle"><c:choose>
										<c:when test="${obj.projectRemarks.tcpStatus =='OK' }">
											<i aria-hidden="true"
												style="color: green">Assigned</i>
											<c:set var="isRemarksTrue" value="true" />
										</c:when>
										<c:otherwise>

											<i class="fa fa-times" aria-hidden="true"
												style="color: #be6422;"></i>
										</c:otherwise>

									</c:choose></td>
								<td align="center" style="vertical-align: middle"><c:choose>
										<c:when test="${obj.projectRemarks.enggStatus =='OK' }">
											<c:set var="isRemarksTrue" value="true" />
											<i aria-hidden="true"
												style="color: green">Assigned</i>
										</c:when>
										<c:otherwise>

											<i class="fa fa-times" aria-hidden="true"
												style="color: #be6422;"></i>
										</c:otherwise>

									</c:choose></td>

								<%-- <td align="center" style="vertical-align: middle"><c:choose>
										<c:when
											test="${empty obj.updatedFlag and ( not empty obj.enquiryList or isRemarksTrue=='false')}">
											<i class="fa fa-2x fa-sign-out" aria-hidden="true"
												style="color: grey;"></i>
										</c:when>
										<c:otherwise>
											<a
												onclick="javascript:submitForm('resetPendingProjectStatus?PROJECT_ID=${obj.projectRegId}','${obj.applicationNo }')"><i
												class="fa fa-2x fa-sign-out" aria-hidden="true"
												style="color: #be6422;"></i></a>
										</c:otherwise>
									</c:choose></td> --%>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			
<!-- 			<p>Press <b>Submit</b> and check console for URL-encoded form data that would be submitted.</p>

<p><button>Submit</button></p>

<b>Data submitted to the server:</b><br>
<pre id="example-console">
</pre> -->
</form>





			<!--search list main end here-->
		</div>




		<!--inner container end here-->
	</div>




	<!-- container end here-->

</div>
</div>
