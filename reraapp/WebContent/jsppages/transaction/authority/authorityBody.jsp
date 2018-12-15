<%@page import="java.util.List"%>

<%@page import="java.util.Map"%>

<%@page import="in.gov.rera.common.util.ReraConstants"%>

<%@page import="in.gov.rera.common.model.UserModel"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	UserModel user = (UserModel) session.getAttribute(ReraConstants.SES_USER_ATTR);
%>

<div class="breadcrumb">
	Dash Board <span class="pull-right user_name">Welcome :<b> <%=user.getUserName()%></b></span>
</div>





<!--News Ticker-->

<div class="container">





	<!--main container start here-->

	<div class="col-md-12 col-sm-12">

		<div class="Main_containner dashboard">

			<div class="inner_wrapper">


				<h1>Dashboard</h1>

				<div class="drop_shadow"></div>

				<div class="row">
					<div class="col-md-5">
							<div class="panel panel-default ">
							 <div class="panel-heading" style="text-align: center"  >Total Applications ( Overall ) </div>
			        <div class="panel-body">
						<canvas id="totalApplication" width="450" height="300"></canvas>
					</div></div></div>
					<div class="col-md-7">
									<div class="panel panel-default ">
							 <div class="panel-heading" style="text-align: center" >Total Applications ( Weekly )</div>
			        <div class="panel-body">
						<canvas id="totalApplicationMonthly" width="800" height="365"></canvas>
					</div></div></div>
				</div>



            <%--  <br> <br> <br>

				<div class="row">
					<div class="col-md-5">
									<div class="panel panel-default ">
							 <div class="panel-heading" style="text-align: center" >Application Processed (Overall)</div>
			        <div class="panel-body">
						<canvas id="applicationProcessed" width="800" height="530"></canvas>
					</div></div></div>
					<div class="col-md-7">
									<div class="panel panel-default ">
							 
							  <div class="panel-heading" style="text-align: center" >Application Processed Status (Weekly)</div>
							 
			        <div class="panel-body">
						
							<canvas id="applicationProcessedWeekly" width="800" height="365"></canvas>
					</div></div></div>
				</div> --%>


            <%--  <br> <br> <br>
				<div class="row">
					<div class="col-md-4"></div>
					<div class="col-md-8">
									<div class="panel panel-default ">
							 <div class="panel-heading" style="text-align: center" >Application Processed Status By Month</div>
			        <div class="panel-body"> 
					<canvas id="applicationProcessedMonthly" width="800" height="300"></canvas>
					</div></div></div>
				</div> --%>


				<br> <br> <br>


				<div class="row">
					<div class="col-md-5">
									<div class="panel panel-default ">
							 <div class="panel-heading" style="text-align: center" > Projects Processed ( Overall ) </div>
			        <div class="panel-body">
						<canvas id="revenueOverAll" width="450" height="320"></canvas>
					</div></div></div>
					<div class="col-md-7">
									<div class="panel panel-default ">
							 <div class="panel-heading" style="text-align: center" > Projects Processed ( Weekly ) </div>
			        <div class="panel-body">
						<canvas id="revenueWeekly" width="800" height="385"></canvas>
					</div></div></div>
				</div>




				<script>
			
				
				
					function barChartWithLegend(chartType, chartId,
							xxLabelList, barDataObj, chartHeader) {
						var myChart = new Chart(
								document.getElementById(chartId),
								{
									type : chartType,
									data : {
										labels : xxLabelList,
										datasets : barDataObj
									},
									options : {
										barShowLables : false,
							/* 			title : {
											display : true,
											text : chartHeader
										},
 */
										animation: {
								            duration: 0,
								            easing: "easeOutQuart",
								            onComplete: function () {
								                var ctx = this.chart.ctx;
								                ctx.font = Chart.helpers.fontString(Chart.defaults.global.defaultFontFamily, 'normal', Chart.defaults.global.defaultFontFamily);
								                ctx.textAlign = 'center';
								                ctx.textBaseline = 'bottom';

								                this.data.datasets.forEach(function (dataset) {
								                    for (var i = 0; i < dataset.data.length; i++) {
								                        var model = dataset._meta[Object.keys(dataset._meta)[0]].data[i]._model,
								                            scale_max = dataset._meta[Object.keys(dataset._meta)[0]].data[i]._yScale.maxHeight;
								                        ctx.fillStyle = '#444';
								                        var y_pos = model.y - 5;
								                        // Make sure data value does not get overflown and hidden
								                        // when the bar's value is too close to max value of scale
								                        // Note: The y value is reverse, it counts from top down
								                        if ((scale_max - model.y) / scale_max >= 0.93)
								                            y_pos = model.y + 20; 
								                        ctx.fillText(dataset.data[i], model.x, y_pos);
								                    }
								                });               
								            }
								        }

									},
								});
					}

					function barChart(chartType, chartId, xxLabelList,
							barDataObj, chartHeader) {
						var myChart = new Chart(
								document.getElementById(chartId),
								{
									type : chartType,
									data : {
										labels : xxLabelList,
										datasets : barDataObj
									},
									options : {
										barShowLables : false,
				/* 						title : {
											display : true,
											text : chartHeader
										}, */
										legend : {

											display : false
										},
										animation: {
								            duration: 0,
								            easing: "easeOutQuart",
								            onComplete: function () {
								                var ctx = this.chart.ctx;
								                ctx.font = Chart.helpers.fontString(Chart.defaults.global.defaultFontFamily, 'normal', Chart.defaults.global.defaultFontFamily);
								                ctx.textAlign = 'center';
								                ctx.textBaseline = 'bottom';

								                this.data.datasets.forEach(function (dataset) {
								                    for (var i = 0; i < dataset.data.length; i++) {
								                        var model = dataset._meta[Object.keys(dataset._meta)[0]].data[i]._model,
								                            scale_max = dataset._meta[Object.keys(dataset._meta)[0]].data[i]._yScale.maxHeight;
								                        ctx.fillStyle = '#444';
								                        var y_pos = model.y - 5;
								                        // Make sure data value does not get overflown and hidden
								                        // when the bar's value is too close to max value of scale
								                        // Note: The y value is reverse, it counts from top down
								                        if ((scale_max - model.y) / scale_max >= 0.93)
								                            y_pos = model.y + 20; 
								                        ctx.fillText(dataset.data[i], model.x, y_pos);
								                    }
								                });               
								            }
								        }
									},
								});
					}

					function getScriptObject(data) {
						var str = data.substr(1).slice(0, -1);
						return str.split(",");
					}

					// Total application 

					var totalApplicationsLabel = new Array();
					<c:forEach items="${totalApplicationLabel}" var="application">
					totalApplicationsLabel
							.push('<c:out value="${application}"/>');
					</c:forEach>
					var labels = totalApplicationsLabel;
					var totalAppColor = [ 'rgba(255,99,132,1)',
							'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)' ];
					var totalApplicationData = <c:out value="${totalApplicationData}"/>
						var array = [];
					for(var i=0 ; i<totalApplicationData.length ; i++ ){
						var arraydata = [];
						arraydata.push( totalApplicationData[i] )
						var barDataObj = {
								label : labels[i],
								data : arraydata ,
								backgroundColor : totalAppColor[i],
							}
						
						array.push(barDataObj);
					}

	
					barChartWithLegend('bar', 'totalApplication', labels, array,
							'Total Applications');

					// Total application By month 

					var labels1 = getScriptObject("<c:out value="${totalApplicationMonthLabel}"/>");
					var totalApplicationMonthData = new Array();
					<c:forEach items="${totalApplicationMonthData}" var="application">
					totalApplicationMonthData
							.push('<c:out value="${application}"/>');
					</c:forEach>

					var array1 = [];
					for (var i = 0; i < totalApplicationMonthData.length; i++) {
						var localObj = {
							label : labels[i],
							backgroundColor : totalAppColor[i],
							data : getScriptObject(totalApplicationMonthData[i])
						}
						array1.push(localObj);
					}

					barChartWithLegend('bar', 'totalApplicationMonthly',
							labels1, array1, 'Total Applications By Month');

					//  application processed  

	/* 				var applicationProcessedLabel = new Array();
					<c:forEach items="${applicationProcessedLabel}" var="application">
					applicationProcessedLabel
							.push('<c:out value="${application}"/>');
					</c:forEach>

					var applicationProcessedColor = ["rgba(0,10,220,0.5)","#e4c3e4","rgba(220,10,0,.5)","#D3D3D3" ]
					var applicationProcessedData = <c:out value="${applicationProcessedData}"/>
						var applicationProcessedArray = [];
					for(var i=0 ; i<applicationProcessedData.length ; i++){
						var dataArrayIs = [];
						dataArrayIs.push( applicationProcessedData[i] )
						var applicationProcessedObject = {
								label : applicationProcessedLabel[i],
								data : dataArrayIs,
								backgroundColor : applicationProcessedColor[i],
							}						
						applicationProcessedArray.push(applicationProcessedObject);
					}

					barChartWithLegend('horizontalBar', 'applicationProcessed',
							applicationProcessedLabel,
							applicationProcessedArray,
							'Application Processed By Year'); */

					//  application processed  By Month

			/* 		var applicationProcessedMonthLabel = getScriptObject("<c:out value="${applicationProcessedMonthLabel}"/>");
					var applicationProcessedMonthData = new Array();
					<c:forEach items="${applicationProcessedMonthData}" var="application">
					applicationProcessedMonthData
							.push('<c:out value="${application}"/>');
					</c:forEach>

					var applicationProcessedMonthDataArray = [];
					for (var i = 0; i < applicationProcessedMonthData.length; i++) {
						var localObj = {
							label : applicationProcessedLabel[i],
							backgroundColor : applicationProcessedColor[i],
							data : getScriptObject(applicationProcessedMonthData[i])
						}
						applicationProcessedMonthDataArray.push(localObj);
					}

					barChartWithLegend('bar', 'applicationProcessedMonthly',
							applicationProcessedMonthLabel,
							applicationProcessedMonthDataArray,
							'Application Processed Status By Month'); */

					//  application processed  By Weekly

/* 					var applicationProcessedWeeklyLabel = getScriptObject("<c:out value="${applicationProcessedWeeklyLabel}"/>");
					var applicationProcessedWeeklyData = new Array();
					<c:forEach items="${applicationProcessedWeeklyData}" var="application">
					applicationProcessedWeeklyData
							.push('<c:out value="${application}"/>');
					</c:forEach>

					var applicationProcessedWeeklyDataArray = [];
					for (var i = 0; i < applicationProcessedWeeklyData.length; i++) {
						var localObj = {
							label : applicationProcessedLabel[i],
							backgroundColor : applicationProcessedColor[i],
							data : getScriptObject(applicationProcessedWeeklyData[i]),

						}
						applicationProcessedWeeklyDataArray.push(localObj);
					}

					barChartWithLegend('bar', 'applicationProcessedWeekly',
							applicationProcessedWeeklyLabel,
							applicationProcessedWeeklyDataArray,
							'Application Processed Status By Weekly'); */

					//  project processed  overall

					var projectProcessedOverAllLabel = new Array();
					<c:forEach items="${projectProcessedOverAllLabel}" var="application">
					projectProcessedOverAllLabel
							.push('<c:out value="${application}"/>');
					</c:forEach>

					var projectProcessedColor = [ 'rgba(255,99,132,1)',
							'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)',
							'green', ]
					var projectProcessedOverAllData = <c:out value="${projectProcessedOverAllData}"/>
					
						var projectProcessedOverAllDataArray = [];
					for(var i=0; i<projectProcessedOverAllData.length ; i++){
						var arrayDataIs = [];
						arrayDataIs.push(projectProcessedOverAllData[i])
						var projectProcessedOverAllDataObject = {
								label : projectProcessedOverAllLabel[i],
								data : arrayDataIs,
								backgroundColor : projectProcessedColor[i],
							}
						projectProcessedOverAllDataArray.push(projectProcessedOverAllDataObject);
					}
		
					barChartWithLegend('bar', 'revenueOverAll',
							projectProcessedOverAllLabel,
							projectProcessedOverAllDataArray,
							'Projects Processed (Overall)');

					//  project processed  by weekly

					var projectProcessedOverWeeklyLabel = getScriptObject("<c:out value="${projectProcessedOverWeeklyLabel}"/>");
					var projectProcessedOverWeeklyData = new Array();
					<c:forEach items="${projectProcessedOverWeeklyData}" var="application">
					projectProcessedOverWeeklyData
							.push('<c:out value="${application}"/>');
					</c:forEach>

					var projectProcessedOverWeeklyDataArray = [];
					for (var i = 0; i < projectProcessedOverWeeklyData.length; i++) {
						var localObj = {
							label : projectProcessedOverAllLabel[i],
							borderColor : projectProcessedColor[i],
							data : getScriptObject(projectProcessedOverWeeklyData[i]),
							fill : false,
						}
						projectProcessedOverWeeklyDataArray.push(localObj);
					}

					barChartWithLegend('line', 'revenueWeekly',
							projectProcessedOverWeeklyLabel,
							projectProcessedOverWeeklyDataArray,
							'Projects Processed (Weekly)');
					
					
					
					
				</script>



				<script>
					/* 	new Chart(document.getElementById("applicationProcessed"),

						{

							type : 'horizontalBar',

							data : {

								labels : [ "Total", "Processed", "Under Enquiry",

								"Approved" ],

								datasets : [ {

									label : "Population (millions)",

									backgroundColor : [ "#3e95cd", "#8e5ea2",
											"#3cba9f",

											"#e8c3b9" ],

									data : [ 2478, 5267, 734, 784, 433 ]

								} ]

							},

							options : {

								legend : {

									display : false

								},

								title : {

									display : true,

									text : 'Application Processed Status 2017'

								}

							}

						}); */
				</script>





				<script>
					/* 				new Chart(document
											.getElementById("applicationProcessedMonthly"),

									{

										type : 'bar',

										data : {

											labels : [ "january", "february", "march", "april",
													"may",

													"june" ],

											datasets : [ {

												label : "Total",

												backgroundColor : "#3e95cd",

												data : [ 133, 221, 783, 2478, 7874, 9833, ]

											}, {

												label : "Processed",

												backgroundColor : "#8e5ea2",

												data : [ 408, 547, 675, 734, 7382, 2222 ]

											}, {

												label : "Under Enquiry",

												backgroundColor : "#3cba9f",

												data : [ 408, 547, 675, 734, 3728, 3229 ]

											}, {

												label : "Approved",

												backgroundColor : "#e8c3b9",

												data : [ 408, 547, 675, 734, 3728, 3229 ]

											} ]

										},

										options : {

											title : {

												display : true,

												text : 'Application Processed Status By Month'

											}

										}

									}); */
				</script>









				<script>
					/* new Chart(
							document
									.getElementById("applicationProcessedWeekly"),
							{

								type : 'bar',

								data : {

									labels : [ "Week-1", "Week-2", "Week-3",
											"Week-4" ],

									datasets : [ {

										label : "Total",

										backgroundColor : "#3e95cd",

										data : [ 133, 221, 783, 2478, ]

									}, {

										label : "Processed",

										backgroundColor : "#8e5ea2",

										data : [ 408, 547, 675, 734, ]

									}, {

										label : "Under Enquiry",

										backgroundColor : "#3cba9f",

										data : [ 408, 547, 675, 739 ]

									}, {

										label : "Approved",

										backgroundColor : "#e8c3b9",

										data : [ 408, 547, 675, 734 ]

									} ]

								},

								options : {

									title : {

										display : true,

										text : 'Application Processed Status By Weekly'

									}

								}

							}); */
				</script>





				<script>
					/* 			var ctx = document.getElementById("revenueOverAll")
										.getContext('2d');

								var myChart = new Chart(
										ctx,
										{

											type : 'bar',

											data : {

												labels : [ "Account", "TCP", "Engineering",
														"Revenue" ],

												datasets : [ {

													label : '# Overall',

													data : [ 1443, 1932, 233, 898 ],

													backgroundColor : [
															'rgba(255,99,132,1)',

															'rgba(54, 162, 235, 1)',
															'rgba(255, 206, 86, 1)',
															'rgba(255,99,132,1)',

													],

													borderWidth : 1

												} ]

											},

											options : {

												barShowLables : false,

												title : {

													display : true,

													text : 'Projects Processeb By Revenue (Overall)'

												},

												legend : {

													display : false

												},

											},

										}); */
				</script>





				<script>
					/* new Chart(document.getElementById("revenueWeekly"), {

						type : 'line',

						data : {

							labels : [ "Week-1", "Week-2", "Week-3", "Week-4",
									"Week-5", "Week-6" ],

							datasets : [ {

								data : [ 707, 111, 133, 221, 783, 248 ],

								label : "Account",

								borderColor : "#3e95cd",

								fill : false

							}, {

								data : [ 282, 350, 411, 502, 635, 809 ],

								label : "TCP",

								borderColor : "#8e5ea2",

								fill : false

							}, {

								data : [ 168, 170, 178, 190, 203, 276 ],

								label : "Engineering",

								borderColor : "#3cba9f",

								fill : false

							}, {

								data : [ 40, 20, 10, 16, 24, 38 ],

								label : "Revenue",

								borderColor : "#e8c3b9",

								fill : false

							}

							]

						},

						options : {

							title : {

								display : true,

								text : 'Projects Processed By Revenue (Weekly)'

							}

						}

					});  */
				</script>














			</div>


		</div>


	</div>


</div>