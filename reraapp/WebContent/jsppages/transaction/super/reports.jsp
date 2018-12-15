<%@page import="in.gov.rera.common.security.ReraSecurity"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<script>
$(document).ready(function() {
    $('#mis').DataTable( {
        dom: 'Bfrtip',
        buttons: [ {
            extend: 'excel',
            text: 'Export to Excel',
            title: 'Applications'
        }],
        "order": [[ 0, "asc" ]]
    } );
} );
</script>



<!--News Ticker-->

<div class="container">
	<!--main container start here-->
	<div class="col-md-12 col-sm-12">
		<div class="Main_containner dashboard">
			<div class="inner_wrapper">
				<h1>Report</h1>

				<div class="drop_shadow"></div>
				<div class="clearfix"></div>
<form class="form-horizontal">
<div class="table-responsive">


					<table class="table table-bordered" id="mis">
						<thead>
							<tr>
								<th>SL. NO</th>
								<th>MONTH</th>
								<th>REGISTRATION</th>
								<th>APPROVED</th>
								<th>REJECTED</th>
								<th>WITHDRAWN</th>
								<th>TOTAL DISPOSED</th>
								<th>PENDING</th>
								<th>HO</th>
								<th>SECRETARY</th>
								<th>ACCOUNTS</th>
								<th>REVENUE</th>
								<th>TCP</th>
								<th>ENGG</th>
								<th>PROMOTER/DEVELOPER</th>
								
								
							</tr>
						</thead>
						<tbody>
							<%
								int count = 0;
							%>
							<c:forEach items="${reports}" var="obj" >
								<tr>
									 <td><%= ++count %></td>
									<td>${obj.month }</td>
									<td>
											${obj.registration } </td>
									<td>${obj.approved}</td>
									<td>${obj.rejected }</td>
									<td>${obj.withdrawn}</td>
									<td>${obj.totalDisposed }</td>
									<td>${obj.pending }</td>
									<td>${obj.headOffice }</td>
									<td>${obj.secretary }</td>
									<td>${obj.accounts}</td>
									<td>${obj.revenue}</td>
									<td>${obj.tcp}</td>
									<td>${obj.engg}</td>
									<td>${obj.promoter}</td>
									
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				</form>
				<br><br><br>
				<h1>Monthly Reports</h1>
				<div class="drop_shadow"></div>
				<form action="reports" class="form-group">
					<div class="col-sm-2">
						<b class="pull-right">Select Month : </b>
					</div>
					<div class="col-sm-2">
						<select name="month" id="month" class="form-control">
							<option value="" disabled>Select Month</option>
						</select>
					</div>
					<div class="col-sm-2">
						<b class="pull-right">Select Year : </b>
					</div>
					<div class="col-sm-2">
						<select name="year" id="year" class="form-control">
							<option value="" disabled>Select Year</option>
						</select>
					</div>
					<div class="col-sm-2">
						<button type="submit" class="btn" style="background-color: #be6422;">
							Search</button>
					</div>
				</form>
				<br> <br> <br> <br> <br> <br>
				<div class="drop_shadow"></div>

				<div class="row">
					<div class="col-md-6">
						<div class="panel panel-default ">
							<div class="panel-heading" style="text-align: center">
								Project Applications</div>
							<div class="panel-body">
								<canvas id="registerId" width="800" height="350"></canvas>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="panel panel-default ">
							<div class="panel-heading" style="text-align: center">
								Pending Project Applications </div>
							<div class="panel-body">
								<canvas id="pendlingId" width="800" height="350"></canvas>
							</div>
						</div>
					</div>
				</div>

				<script>
					function barChartSingle(chartType, chartId, xxLabelList,
							barDataObj, chartHeader) {
						var myChart = new Chart(
								document.getElementById(chartId),
								{
									type : chartType,
									data : {
										labels : xxLabelList,
										datasets : [ barDataObj ]
									},

									options : {
										legend : {
											display : false
										},

										animation : {
											duration : 0,
											easing : "easeOutQuart",
											onComplete : function() {
												var ctx = this.chart.ctx;
												ctx.font = Chart.helpers
														.fontString(
																Chart.defaults.global.defaultFontFamily,
																'normal',
																Chart.defaults.global.defaultFontFamily);
												ctx.textAlign = 'center';
												ctx.textBaseline = 'bottom';

												this.data.datasets
														.forEach(function(
																dataset) {
															for (var i = 0; i < dataset.data.length; i++) {
																var model = dataset._meta[Object
																		.keys(dataset._meta)[0]].data[i]._model, scale_max = dataset._meta[Object
																		.keys(dataset._meta)[0]].data[i]._yScale.maxHeight;
																ctx.fillStyle = '#444';
																var y_pos = model.y - 5;
																// Make sure data value does not get overflown and hidden
																// when the bar's value is too close to max value of scale
																// Note: The y value is reverse, it counts from top down
																if ((scale_max - model.y)
																		/ scale_max >= 0.93)
																	y_pos = model.y + 20;
																ctx
																		.fillText(
																				dataset.data[i],
																				model.x,
																				y_pos);
															}
														});
											}
										},

										scales : {
											yAxes : [ {
												ticks : {
													beginAtZero : true
												}
											} ]
										}

									}

								});
					}

					function getScriptObject(data) {
						var str = data.substr(1).slice(0, -1);
						return str.split(",");
					}

					// register application   

					var registerProjectlabel = new Array();
					var pendingProjectlabel = new Array();
					<c:forEach items="${registerProjectlabel}" var="application">
					registerProjectlabel
							.push('<c:out value="${application}"/>');
					</c:forEach>
					
					<c:forEach items="${pendingProjectlabel}" var="pending">
					pendingProjectlabel
							.push('<c:out value="${pending}"/>');
					</c:forEach>

					var chartColor = [ 'rgba(255,99,132,1)',
							'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)',
							'#00ffbf', 'grey', '#00bfff' ]
					var registerProjectData = <c:out value="${registerProjectData}"/>

					var registerProjectArray = {
						label : "Register application",
						data : registerProjectData,
						backgroundColor : chartColor,
					}

					barChartSingle('bar', 'registerId', registerProjectlabel,
							registerProjectArray, 'Register Application');

					// Pending

					var pendlingProjectData = <c:out value="${pendingProjectData}"/>

					var pendlingProjectDataArray = {
						label : 'Pendling',
						backgroundColor : chartColor,
						data : pendlingProjectData,

					}

					barChartSingle('bar', 'pendlingId', pendingProjectlabel,
							pendlingProjectDataArray, 'Pending Projects');
				</script>



				<script type="text/javascript">
					var currntDate = new Date();

					for (y = 2015; y <= currntDate.getFullYear(); y++) {
						var optn = document.createElement("OPTION");
						optn.text = y;
						optn.value = y;
						// if year is 2015 selected
						var selectYear = <c:out value="${year}"/>;
						if (y == selectYear) {
							optn.selected = true;
						}
						document.getElementById('year').options.add(optn);
					}
				</script>

				<script type="text/javascript">
					var d = new Date();
					var monthArray = new Array();
					monthArray[0] = "January";
					monthArray[1] = "February";
					monthArray[2] = "March";
					monthArray[3] = "April";
					monthArray[4] = "May";
					monthArray[5] = "June";
					monthArray[6] = "July";
					monthArray[7] = "August";
					monthArray[8] = "September";
					monthArray[9] = "October";
					monthArray[10] = "November";
					monthArray[11] = "December";
					for (m = 0; m <= 11; m++) {
						var optn = document.createElement("OPTION");
						optn.text = monthArray[m];
						// server side month start from one
						optn.value = (m + 1);

						// if june selected
						var selectMonth = <c:out value="${month}"/>;
						if (m == selectMonth*1 -1 ) {
							optn.selected = true;
						}
						document.getElementById('month').options.add(optn);
					}
				</script>






			</div>
		</div>
	</div>
</div>
