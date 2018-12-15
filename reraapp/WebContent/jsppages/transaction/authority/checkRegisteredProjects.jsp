<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<script
	src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/buttons/1.4.2/js/dataTables.buttons.min.js"></script>
<script
	src="https://cdn.datatables.net/buttons/1.4.2/js/buttons.flash.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
<script
	src="https://cdn.datatables.net/buttons/1.4.2/js/buttons.html5.min.js"></script>
<script
	src="https://cdn.datatables.net/buttons/1.4.2/js/buttons.print.min.js"></script>

<link
	href="https://cdn.datatables.net/buttons/1.4.2/css/buttons.dataTables.min.css"
	rel="stylesheet" />
<!-- <script>
	$(document).ready(function() {
		$('#processedTable').DataTable();
		$('#enquiryTable').DataTable();
		$('#approvedTable').DataTable();
	});
</script> -->

<script>
	$(document).ready(
			function() {
				var t1 = $('#unregProjectsTable').DataTable(
						{

							/* 				 dom: 'lBfrtip', // diplay show entries
							 buttons: [
							 'pdf',
							 'copy', 'csv', 'excel',  'print'
							 ]   */

							/* 			"buttons" : [ {
							 extend : 'collection',
							 text : 'Export',
							 buttons : [ 'copy', 'excel', 'csv', 'print', {
							 extend : 'pdf',
							 title : 'Processed Applications'
							 }, ]
							 } ] */
							dom : 'Bfrtip',
							lengthMenu : [
									[ 10, 25, 50, -1 ],
									[ '10 rows', '25 rows', '50 rows',
											'Show all' ] ],
							buttons : [ 'pageLength', {
								extend : 'pdf',
								orientation : 'landscape',
								pageSize : 'LEGAL',
								text : 'Export Into PDF',
								title : 'All Unregistred Projects'
							} ],
							"columnDefs" : [ {
								"searchable" : false,
								"orderable" : false,
								"targets" : 0
							} ],
							"order" : [ [ 1, 'asc' ] ]
						});

				var t2 = $('#UnderInvstTable').DataTable(
						{
							dom : 'Bfrtip',
							lengthMenu : [
									[ 10, 25, 50, -1 ],
									[ '10 rows', '25 rows', '50 rows',
											'Show all' ] ],
							buttons : [ 'pageLength', {
								extend : 'pdf',
								text : 'Export Into PDF',
								title : 'List of All Agents Applicants'
							} ],
							"columnDefs" : [ {
								"searchable" : false,
								"orderable" : false,
								"targets" : 0
							} ],
							"order" : [ [ 0, 'asc' ] ]
						});

				t1.on('order.dt search.dt', function() {
					t1.column(0, {
						search : 'applied',
						order : 'applied'
					}).nodes().each(function(cell, i) {
						cell.innerHTML = i + 1;
					});
				}).draw();

				t2.on('order.dt search.dt', function() {
					t2.column(0, {
						search : 'applied',
						order : 'applied'
					}).nodes().each(function(cell, i) {
						cell.innerHTML = i + 1;
					});
				}).draw();
				/*  
				 t3.on( 'order.dt search.dt', function () {
				     t3.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
				         cell.innerHTML = i+1;
				     } );
				 } ).draw();
				 
				 t4.on( 'order.dt search.dt', function () {
				        t4.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
				            cell.innerHTML = i+1;
				        } );
				    } ).draw();
				 
				 t5.on( 'order.dt search.dt', function () {
				       t5.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
				           cell.innerHTML = i+1;
				       } );
				   } ).draw(); */

			});
</script>
<style>

/* #approvedTable
 {
	text-transform: uppercase;
} */
#UnderInvstTable {
	text-transform: uppercase;
}

#unregProjectsTable {
	text-transform: uppercase;
}
/* #allProjectsTable
 {
	text-transform: uppercase;
}
#allRejectedTable
 {
	text-transform: uppercase;
} */
</style>
<div class="breadcrumb">Home / Report Unregistered Projects</div>




<!--main container start here-->
<div class="Main_containner">

	<!--Inner wrapper stsrt here-->
	<div class="inner_wrapper tsklist">







		<form action=""></form>




		<div class="container">
			<!-- <h1>
				Processed Applications			</h1>
			<br> -->
			<%-- 	<h1>Total number of projects processed till date:${underProcess.size()+enquiryList.size()+approvedList.size()}</h1> --%>

			<h1>
				Report Unregistered Ongoing or New Projects to <span>RERA
					Karnataka</span>
			</h1>
			<div class="drop_shadow"></div>
			<div class="clearfix"></div>


			<div>
				<p>
					<font size="3%"> As per the Real Estate (Regulation and
						Development) Act, 2016 any ongoing or new real estate project
						(residential, commercial, plotted development/layout, <br>villa
						or mixed development) with more than 8 units or above 500 sq.mt of
						land area need to be registered under RERA. <br>
					<br> Below is the list of projects that have either applied to RERA or under investigation for
					not  applying to RERA Karnataka .<br>
					
				<!-- 	<b><font style="font-size:14px;color:red">Please Note :</font></b> <b><font style="font-size:14px;">All projects in the first list are not approved to see a detailed list of projects
					 and their current status <a href="viewApprovedProjectsInHomePage"> click here.</a></font></b><br> -->
					
					 If you are aware of any unregistered projects not
						listed below then please report the details to RERA Karnataka by <a
						href="reportRegForm"> click here.</a>
					</font>
				</p>
			</div>


			<br>

		</div>

		<div id="exTab2" class="container">
			<ul class="nav nav-tabs">
				<li class="active"><a href="#1" data-toggle="tab">All
						Applied Projects</a></li>
				<li><a href="#2" data-toggle="tab">Projects under
						Investigation</a></li>

				<!-- <li><a href="#4" data-toggle="tab">All Registered Applications <b><font style="vertical-align:super;font-size:8px;color:red">NEW</font></b> </a></li> -->

			</ul>

			<div class="tab-content ">
				<div class="tab-pane active" id="1">
					<br> <br>
					<!-- <h1>
				 Report Unregistered Ongoing or New Projects to  <span>RERA Karnataka</span>
			</h1>
			<div class="drop_shadow"></div>
			<div class="clearfix"></div>
			
			
			<div>
                                                       <p><font size="3%">
                                                           As per the Real Estate (Regulation and Development) Act, 2016 any ongoing or new real estate project (residential, commercial, plotted development/layout,
                                                           <br>villa or mixed development) with more than 8 units or above 500 sq.mt of land area need to be registered under RERA. 

<br><br>
Below is the list of projects registered with RERA Karnataka. 
If you are aware of any unregistered projects not listed below then please report the details to RERA Karnataka by <a href="reportRegForm"> clicking here.</a>
</font>
                                                      </p>
                                                    </div> -->
					<br> <br>
					<%-- 	<h1>Total Projects: ${noOfPendingRequest}</h1> --%>
					<br>
					<table class="table table-bordered" id="unregProjectsTable">
						<thead>
							<tr>
								<th>S.NO</th>

								<th>APPLICATION NO</th>
								<th>APPLICATION DATE</th>
								<th>PROJECT</th>
								<th>PROJECT STATUS</th>
								<th>PROMOTER</th>





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
									<td style="text-align: center"><c:set var="crdt"
											value="${obj.createdOn.time}" /> <fmt:formatDate type="date"
											pattern="dd-MM-yyyy" dateStyle="short" value="${crdt}" /></td>
									<td>${obj.projectDetailsModel.projectName }</td>
									<td>${obj.projectDetailsModel.projectStatus}</td>
									<td>${obj.promoterDetailsModel.promoterName }</td>





								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="tab-pane" id="2">

					<div class="container">
						<!-- <h1>
				Processed Applications			</h1>
			<br> -->
						<br> <br>
						<h1>Projects Under Investigation</h1>
						<br>

					</div>

					<font color='red'>
						<h1 style='color: red !important'>
							"Public is hereby informed that these projects are not registered
							with RERA and are under INVESTIGATION.<br>
							<br> The Public is warned that dealing with these projects
							is at their own risk as these are not registered with RERA."
						</h1>
					</font><br>
					<h1>NOTE: This list is updated (Addition & Deletion) on every
						Friday at 1 PM based on replies received from the Promoters in
						response to notices issued by RERA.</h1>

					<br> <br>
					<table class="table table-bordered" id="UnderInvstTable">

				<thead>
					<tr>
						<th width="73">SL. NO.
						</th>
						<th width="289">PROMOTER NAME
						</th>
						<th width="245">PROJECT NAME
						</th>
						<th width="245">STATUS
						</th>
						<th width="460">CORPORATE ADDRESS
						</th>
						<th width="88">Published  Date 
						</th>
					</tr>
				</thead>
<tbody>
<tr>
<td style="color:#C4A80D" width="57">1</td>
<td style="color:#C4A80D" width="268">TATA Housing,</td>
<td style="color:#C4A80D" width="223">The promont&nbsp;</td>
<td style="color:#C4A80D" width="200">No Reply</td>
<td style="color:#C4A80D" width="481">A wing, cronche AL Lateef No.25, cunnigham Road, Bangalore</td>
<td style="color:#C4A80D" width="183">21-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">2</td>
<td style="color:#008000" width="268">Agraja Builders &amp; Developers</td>
<td style="color:#008000" width="223">Agraja Ambari</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">2nd Floor, Pam Arcade, Opp Indian Oil Petrol Pump,<br /> Near Infosys, Kottara Chowki, Mangalore - 575006.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">3</td>
<td style="color:#008000" width="268">Agraja Builders &amp; Developers</td>
<td style="color:#008000" width="223">The Legend</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">2nd Floor, Pam Arcade, Opp Indian Oil Petrol Pump,<br /> Near Infosys, Kottara Chowki, Mangalore - 575006.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">4</td>
<td style="color:#008000" width="268">Agraja Builders &amp; Developers</td>
<td style="color:#008000" width="223">Vivanta</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">2nd Floor, Pam Arcade, Opp Indian Oil Petrol Pump,<br /> Near Infosys, Kottara Chowki, Mangalore - 575006.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">5</td>
<td style="color:#008000" width="268">Agraja Builders &amp; Developers</td>
<td style="color:#008000" width="223">Shilas By Agraja</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">2nd Floor, Pam Arcade, Opp Indian Oil Petrol Pump,<br /> Near Infosys, Kottara Chowki, Mangalore - 575006.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">6</td>
<td style="color:#008000" width="268">Agraja Builders &amp; Developers</td>
<td style="color:#008000" width="223">Bappanadu Residency</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">2nd Floor, Pam Arcade, Opp Indian Oil Petrol Pump,<br /> Near Infosys, Kottara Chowki, Mangalore - 575006.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">7</td>
<td style="color:#008000" width="268">Agraja Builders &amp; Developers</td>
<td style="color:#008000" width="223">Sarovar by Agraja</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">2nd Floor, Pam Arcade, Opp Indian Oil Petrol Pump,<br /> Near Infosys, Kottara Chowki, Mangalore - 575006.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">8</td>
<td style="color:#008000" width="268">Agraja Builders &amp; Developers</td>
<td style="color:#008000" width="223">Agraja Garden</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">2nd Floor, Pam Arcade, Opp Indian Oil Petrol Pump,<br /> Near Infosys, Kottara Chowki, Mangalore - 575006.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">9</td>
<td style="color:#008000" width="268">Agraja Builders &amp; Developers</td>
<td style="color:#008000" width="223">LAYOUT FOR NANDAVANA</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">2nd Floor, Pam Arcade, Opp Indian Oil Petrol Pump,<br /> Near Infosys, Kottara Chowki, Mangalore - 575006.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">10</td>
<td style="color:#008000" width="268">Agraja Builders &amp; Developers</td>
<td style="color:#008000" width="223">LAYOUT FOR VRINDHAVANA</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">2nd Floor, Pam Arcade, Opp Indian Oil Petrol Pump,<br /> Near Infosys, Kottara Chowki, Mangalore - 575006.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">11</td>
<td style="color:#008000" width="268">ATZ Properties</td>
<td style="color:#008000" width="223">ATZ Estrella</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">12/1, Plain Street, Infantry Road Cross, Shivaji Nagar,Bangalore-560001.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">12</td>
<td style="color:#008000" width="268">M/S. Durga Projects &amp; Infrastructure Pvt Ltd.</td>
<td style="color:#008000" width="223">Durga Flute</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 125/1-18, G K Arcade, First Floorashoka Pillar Road, Jayanagar 1st Block,Bengaluru&ndash;560011.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">13</td>
<td style="color:#008000" width="268">VKC Developers Pvt. Ltd.</td>
<td style="color:#008000" width="223">Chourasia Manor Ii</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 22, 1st Cross, Ashwath Nagar, Marathahalli, <br /> Bengaluru-560037.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">14</td>
<td style="color:#008000" width="268">VKC Developers Pvt. Ltd.</td>
<td style="color:#008000" width="223">Chourasia Pride</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 22, 1st Cross, Ashwath Nagar, Marathahalli, <br /> Bengaluru-560037.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">15</td>
<td style="color:#008000" width="268">VKC Developers Pvt. Ltd.</td>
<td style="color:#008000" width="223">Chourasia Heritage</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 22, 1st Cross, Ashwath Nagar, Marathahalli, <br /> Bengaluru-560037.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">16</td>
<td style="color:#008000" width="268">VKC Developers Pvt. Ltd.</td>
<td style="color:#008000" width="223">Chourasia Sapphire</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 22, 1st Cross, Ashwath Nagar, Marathahalli, <br /> Bengaluru-560037.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">17</td>
<td style="color:#008000" width="268">VKC Developers Pvt. Ltd.</td>
<td style="color:#008000" width="223">Chourasia Heaven</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 22, 1st Cross, Ashwath Nagar, Marathahalli, <br /> Bengaluru-560037.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">18</td>
<td style="color:#008000" width="268">VKC Developers Pvt. Ltd.</td>
<td style="color:#008000" width="223">Chourasia Manor I</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 22, 1st Cross, Ashwath Nagar, Marathahalli, <br /> Bengaluru-560037.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">19</td>
<td style="color:#008000" width="268">VKC Developers Pvt. Ltd.</td>
<td style="color:#008000" width="223">Chourasia Mansion</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 22, 1st Cross, Ashwath Nagar, Marathahalli, <br /> Bengaluru-560037.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">20</td>
<td style="color:#008000" width="268">VKC Developers Pvt. Ltd.</td>
<td style="color:#008000" width="223">Chourasia Crystal</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 22, 1st Cross, Ashwath Nagar, Marathahalli, <br /> Bengaluru-560037.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">21</td>
<td style="color:#008000" width="268">HM Group</td>
<td style="color:#008000" width="223">Hm Tropical Tree</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">Hm Geneva House, No.14, 6th Floor, Cunningham Road, Bengaluru-560052.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">22</td>
<td style="color:#008000" width="268">HM Group</td>
<td style="color:#008000" width="223">Hm Astrid.</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">Hm Geneva House, No.14, 6th Floor, Cunningham Road, Bengaluru-560052.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">23</td>
<td style="color:#008000" width="268">HM Group</td>
<td style="color:#008000" width="223">Hm Rochester</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">Hm Geneva House, No.14, 6th Floor, Cunningham Road, Bengaluru-560052.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">24</td>
<td style="color:#008000" width="268">HM Group</td>
<td style="color:#008000" width="223">Hm Zeta</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">Hm Geneva House, No.14, 6th Floor, Cunningham Road, Bengaluru-560052.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">25</td>
<td style="color:#008000" width="268">SV Infraa</td>
<td style="color:#008000" width="223">SV Maple</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 51 &amp; 52, Sv Plaza, 4th Floor, 8th Main, Ksrtc Layout, 2nd Phase, Jp Nagar, Bengaluru 560078.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">26</td>
<td style="color:#008000" width="268">SV Infraa</td>
<td style="color:#008000" width="223">SV Lifestyle</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 51 &amp; 52, Sv Plaza, 4th Floor, 8th Main, Ksrtc Layout, 2nd Phase, Jp Nagar, Bengaluru 560078.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">27</td>
<td style="color:#008000" width="268">SV Infraa</td>
<td style="color:#008000" width="223">SV Millennium</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 51 &amp; 52, Sv Plaza, 4th Floor, 8th Main, Ksrtc Layout, 2nd Phase, Jp Nagar, Bengaluru 560078.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">28</td>
<td style="color:#008000" width="268">Shah's Life Styl</td>
<td style="color:#008000" width="223">Shah's Reality</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 37, Shah Mension, 1st Floor,Oppclock Tower, Station Road, Davangere 577001.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">29</td>
<td style="color:#008000" width="268">Pathak Developers Pvt.Ltd</td>
<td style="color:#008000" width="223">Pratham Mayflower</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 2997/2, Rukma Complex, 2 Nd Floor, Kalidasa Road, V V Mohalla, Mysore - 570002.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">30</td>
<td style="color:#008000" width="268">Pathak Developers Pvt.Ltd</td>
<td style="color:#008000" width="223">Pratham Splendour</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 2997/2, Rukma Complex, 2 Nd Floor, Kalidasa Road, V V Mohalla, Mysore - 570002.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">31</td>
<td style="color:#008000" width="268">Pathak Developers Pvt.Ltd</td>
<td style="color:#008000" width="223">Pratham Alpine</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 2997/2, Rukma Complex, 2 Nd Floor, Kalidasa Road, V V Mohalla, Mysore - 570002.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">32</td>
<td style="color:#008000" width="268">Pathak Developers Pvt.Ltd</td>
<td style="color:#008000" width="223">Pratham Pragathi</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 2997/2, Rukma Complex, 2 Nd Floor, Kalidasa Road, V V Mohalla, Mysore - 570002.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">33</td>
<td style="color:#008000" width="268">Pathak Developers Pvt.Ltd</td>
<td style="color:#008000" width="223">Pratham Lakshmi</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 2997/2, Rukma Complex, 2 Nd Floor, Kalidasa Road, V V Mohalla, Mysore - 570002.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">34</td>
<td style="color:#008000" width="268">Pathak Developers Pvt.Ltd</td>
<td style="color:#008000" width="223">Pratham Shilp</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 2997/2, Rukma Complex, 2 Nd Floor, Kalidasa Road, V V Mohalla, Mysore - 570002.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">35</td>
<td style="color:#008000" width="268">Pathak Developers Pvt.Ltd</td>
<td style="color:#008000" width="223">Pratham Mahaveer</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 2997/2, Rukma Complex, 2 Nd Floor, Kalidasa Road, V V Mohalla, Mysore - 570002.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">36</td>
<td style="color:#008000" width="268">Pathak Developers Pvt.Ltd</td>
<td style="color:#008000" width="223">Pratham Glory</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 2997/2, Rukma Complex, 2 Nd Floor, Kalidasa Road, V V Mohalla, Mysore - 570002.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">37</td>
<td style="color:#008000" width="268">Pathak Developers Pvt.Ltd</td>
<td style="color:#008000" width="223">Pratham Mayur</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 2997/2, Rukma Complex, 2 Nd Floor, Kalidasa Road, V V Mohalla, Mysore - 570002.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">38</td>
<td style="color:#008000" width="268">Pathak Developers Pvt.Ltd</td>
<td style="color:#008000" width="223">Pratham Mehwish</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 2997/2, Rukma Complex, 2 Nd Floor, Kalidasa Road, V V Mohalla, Mysore - 570002.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">39</td>
<td style="color:#008000" width="268">Pathak Developers Pvt.Ltd</td>
<td style="color:#008000" width="223">Pratham Aakruthi</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 2997/2, Rukma Complex, 2 Nd Floor, Kalidasa Road, V V Mohalla, Mysore - 570002.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">40</td>
<td style="color:#008000" width="268">Pathak Developers Pvt.Ltd</td>
<td style="color:#008000" width="223">Pratham Empire</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 2997/2, Rukma Complex, 2 Nd Floor, Kalidasa Road, V V Mohalla, Mysore - 570002.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">41</td>
<td style="color:#008000" width="268">Pathak Developers Pvt.Ltd</td>
<td style="color:#008000" width="223">Pratham Diya</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 2997/2, Rukma Complex, 2 Nd Floor, Kalidasa Road, V V Mohalla, Mysore - 570002.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">42</td>
<td style="color:#008000" width="268">Pathak Developers Pvt.Ltd</td>
<td style="color:#008000" width="223">Pratham Ashirvad</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 2997/2, Rukma Complex, 2 Nd Floor, Kalidasa Road, V V Mohalla, Mysore - 570002.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">43</td>
<td style="color:#008000" width="268">Pathak Developers Pvt.Ltd</td>
<td style="color:#008000" width="223">Pratham Tulip 2</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 2997/2, Rukma Complex, 2 Nd Floor, Kalidasa Road, V V Mohalla, Mysore - 570002.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">44</td>
<td style="color:#008000" width="268">Pathak Developers Pvt.Ltd</td>
<td style="color:#008000" width="223">Pratham Tulip 1</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 2997/2, Rukma Complex, 2 Nd Floor, Kalidasa Road, V V Mohalla, Mysore - 570002.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">45</td>
<td style="color:#008000" width="268">Pathak Developers Pvt.Ltd</td>
<td style="color:#008000" width="223">Pratham Temple Bells</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 2997/2, Rukma Complex, 2 Nd Floor, Kalidasa Road, V V Mohalla, Mysore - 570002.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">46</td>
<td style="color:#008000" width="268">Pathak Developers Pvt.Ltd</td>
<td style="color:#008000" width="223">Pratham Shrushti</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 2997/2, Rukma Complex, 2 Nd Floor, Kalidasa Road, V V Mohalla, Mysore - 570002.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">47</td>
<td style="color:#008000" width="268">Pathak Developers Pvt.Ltd</td>
<td style="color:#008000" width="223">Pratham Shelters - Studio Apartment</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 2997/2, Rukma Complex, 2 Nd Floor, Kalidasa Road, V V Mohalla, Mysore - 570002.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">48</td>
<td style="color:#008000" width="268">Pathak Developers Pvt.Ltd</td>
<td style="color:#008000" width="223">Pratham Sai Geetanjali</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 2997/2, Rukma Complex, 2 Nd Floor, Kalidasa Road, V V Mohalla, Mysore - 570002.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">49</td>
<td style="color:#008000" width="268">Pathak Developers Pvt.Ltd</td>
<td style="color:#008000" width="223">Pratham Residency</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 2997/2, Rukma Complex, 2 Nd Floor, Kalidasa Road, V V Mohalla, Mysore - 570002.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">50</td>
<td style="color:#008000" width="268">Pathak Developers Pvt.Ltd</td>
<td style="color:#008000" width="223">Pratham Pooja</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 2997/2, Rukma Complex, 2 Nd Floor, Kalidasa Road, V V Mohalla, Mysore - 570002.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">51</td>
<td style="color:#008000" width="268">Pathak Developers Pvt.Ltd</td>
<td style="color:#008000" width="223">Pratham Panchami</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 2997/2, Rukma Complex, 2 Nd Floor, Kalidasa Road, V V Mohalla, Mysore - 570002.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">52</td>
<td style="color:#008000" width="268">Pathak Developers Pvt.Ltd</td>
<td style="color:#008000" width="223">Pratham Nirmala</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 2997/2, Rukma Complex, 2 Nd Floor, Kalidasa Road, V V Mohalla, Mysore - 570002.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">53</td>
<td style="color:#008000" width="268">Pathak Developers Pvt.Ltd</td>
<td style="color:#008000" width="223">Pratham Mishra</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 2997/2, Rukma Complex, 2 Nd Floor, Kalidasa Road, V V Mohalla, Mysore - 570002.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">54</td>
<td style="color:#008000" width="268">Pathak Developers Pvt.Ltd</td>
<td style="color:#008000" width="223">Pratham Jayalakshmi Annex</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 2997/2, Rukma Complex, 2 Nd Floor, Kalidasa Road, V V Mohalla, Mysore - 570002.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">55</td>
<td style="color:#008000" width="268">Pathak Developers Pvt.Ltd</td>
<td style="color:#008000" width="223">Pratham Habitat</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 2997/2, Rukma Complex, 2 Nd Floor, Kalidasa Road, V V Mohalla, Mysore - 570002.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">56</td>
<td style="color:#008000" width="268">Pathak Developers Pvt.Ltd</td>
<td style="color:#008000" width="223">Pratham Geetanjali</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 2997/2, Rukma Complex, 2 Nd Floor, Kalidasa Road, V V Mohalla, Mysore - 570002.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">57</td>
<td style="color:#008000" width="268">Pathak Developers Pvt.Ltd</td>
<td style="color:#008000" width="223">Pratham Chaya</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 2997/2, Rukma Complex, 2 Nd Floor, Kalidasa Road, V V Mohalla, Mysore - 570002.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">58</td>
<td style="color:#008000" width="268">Pathak Developers Pvt.Ltd</td>
<td style="color:#008000" width="223">Pratham Bharadwaj</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 2997/2, Rukma Complex, 2 Nd Floor, Kalidasa Road, V V Mohalla, Mysore - 570002.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">59</td>
<td style="color:#008000" width="268">Pathak Developers Pvt.Ltd</td>
<td style="color:#008000" width="223">Pratham Avenue</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 2997/2, Rukma Complex, 2 Nd Floor, Kalidasa Road, V V Mohalla, Mysore - 570002.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">60</td>
<td style="color:#008000" width="268">Pathak Developers Pvt.Ltd</td>
<td style="color:#008000" width="223">Pratham Aradhana</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 2997/2, Rukma Complex, 2 Nd Floor, Kalidasa Road, V V Mohalla, Mysore - 570002.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">61</td>
<td style="color:#008000" width="268">Pathak Developers Pvt.Ltd</td>
<td style="color:#008000" width="223">Pratham Aditya</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 2997/2, Rukma Complex, 2 Nd Floor, Kalidasa Road, V V Mohalla, Mysore - 570002.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">62</td>
<td style="color:#008000" width="268">Pathak Developers Pvt.Ltd</td>
<td style="color:#008000" width="223">Pratham Sunshine</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 2997/2, Rukma Complex, 2 Nd Floor, Kalidasa Road, V V Mohalla, Mysore - 570002.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">63</td>
<td style="color:#008000" width="268">Pathak Developers Pvt.Ltd</td>
<td style="color:#008000" width="223">Manasa Mayura</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 2997/2, Rukma Complex, 2 Nd Floor, Kalidasa Road, V V Mohalla, Mysore - 570002.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">64</td>
<td style="color:#008000" width="268">Pathak Developers Pvt.Ltd</td>
<td style="color:#008000" width="223">Manasa Subbindra</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 2997/2, Rukma Complex, 2 Nd Floor, Kalidasa Road, V V Mohalla, Mysore - 570002.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">65</td>
<td style="color:#008000" width="268">Sattva Group</td>
<td style="color:#008000" width="223">Pipal Tree</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">4th Floor, Salarpuria Windsor, # 3 Ulsoor Road, <br /> Bengaluru- 560042.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">66</td>
<td style="color:#008000" width="268">Sattva Group</td>
<td style="color:#008000" width="223">Galleria</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">4th Floor, Salarpuria Windsor, # 3 Ulsoor Road, <br /> Bengaluru- 560042.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">67</td>
<td style="color:#008000" width="268">Asset Builders</td>
<td style="color:#008000" width="223">Alcazar</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 476, 2nd Floor, 80 Feet Road, 6th Block, Koramangala, Bengaluru - 560 095</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">68</td>
<td style="color:#008000" width="268">Sancity</td>
<td style="color:#008000" width="223">Silver Shine</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 11 &amp; 12, 2nd Floor, P.S Plaza Jawahar Street, Platform Road, Sheshadripuram, Bengaluru, Karnataka 560020.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">69</td>
<td style="color:#008000" width="268">Sancity</td>
<td style="color:#008000" width="223">Disha</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 11 &amp; 12, 2nd Floor, P.S Plaza Jawahar Street, Platform Road, Sheshadripuram, Bengaluru, Karnataka 560020.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">70</td>
<td style="color:#008000" width="268">Sancity</td>
<td style="color:#008000" width="223">Kaveri</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 11 &amp; 12, 2nd Floor, P.S Plaza Jawahar Street, Platform Road, Sheshadripuram, Bengaluru, Karnataka 560020.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">71</td>
<td style="color:#008000" width="268">Sancity</td>
<td style="color:#008000" width="223">Iris</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 11 &amp; 12, 2nd Floor, P.S Plaza Jawahar Street, Platform Road, Sheshadripuram, Bengaluru, Karnataka 560020.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">72</td>
<td style="color:#008000" width="268">Sancity</td>
<td style="color:#008000" width="223">Gold</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 11 &amp; 12, 2nd Floor, P.S Plaza Jawahar Street, Platform Road, Sheshadripuram, Bengaluru, Karnataka 560020.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">73</td>
<td style="color:#008000" width="268">Sancity</td>
<td style="color:#008000" width="223">Violet</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 11 &amp; 12, 2nd Floor, P.S Plaza Jawahar Street, Platform Road, Sheshadripuram, Bengaluru, Karnataka 560020.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">74</td>
<td style="color:#008000" width="268">Sancity</td>
<td style="color:#008000" width="223">Green</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 11 &amp; 12, 2nd Floor, P.S Plaza Jawahar Street, Platform Road, Sheshadripuram, Bengaluru, Karnataka 560020.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">75</td>
<td style="color:#008000" width="268">Sancity</td>
<td style="color:#008000" width="223">Sky City</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 11 &amp; 12, 2nd Floor, P.S Plaza Jawahar Street, Platform Road, Sheshadripuram, Bengaluru, Karnataka 560020.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">76</td>
<td style="color:#008000" width="268">Sancity</td>
<td style="color:#008000" width="223">Blue Bell</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 11 &amp; 12, 2nd Floor, P.S Plaza Jawahar Street, Platform Road, Sheshadripuram, Bengaluru, Karnataka 560020.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">77</td>
<td style="color:#008000" width="268">Sancity</td>
<td style="color:#008000" width="223">Diamond</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 11 &amp; 12, 2nd Floor, P.S Plaza Jawahar Street, Platform Road, Sheshadripuram, Bengaluru, Karnataka 560020.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">78</td>
<td style="color:#008000" width="268">Sancity</td>
<td style="color:#008000" width="223">Lake View</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 11 &amp; 12, 2nd Floor, P.S Plaza Jawahar Street, Platform Road, Sheshadripuram, Bengaluru, Karnataka 560020.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">79</td>
<td style="color:#008000" width="268">Sancity</td>
<td style="color:#008000" width="223">White Lotus</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 11 &amp; 12, 2nd Floor, P.S Plaza Jawahar Street, Platform Road, Sheshadripuram, Bengaluru, Karnataka 560020.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">80</td>
<td style="color:#008000" width="268">Sancity</td>
<td style="color:#008000" width="223">Vapour</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 11 &amp; 12, 2nd Floor, P.S Plaza Jawahar Street, Platform Road, Sheshadripuram, Bengaluru, Karnataka 560020.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">81</td>
<td style="color:#008000" width="268">Sancity</td>
<td style="color:#008000" width="223">Gardenia</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 11 &amp; 12, 2nd Floor, P.S Plaza Jawahar Street, Platform Road, Sheshadripuram, Bengaluru, Karnataka 560020.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">82</td>
<td style="color:#008000" width="268">Sancity</td>
<td style="color:#008000" width="223">Sunflower</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 11 &amp; 12, 2nd Floor, P.S Plaza Jawahar Street, Platform Road, Sheshadripuram, Bengaluru, Karnataka 560020.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">83</td>
<td style="color:#008000" width="268">Sancity</td>
<td style="color:#008000" width="223">Elegance</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 11 &amp; 12, 2nd Floor, P.S Plaza Jawahar Street, Platform Road, Sheshadripuram, Bengaluru, Karnataka 560020.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">84</td>
<td style="color:#008000" width="268">Sancity</td>
<td style="color:#008000" width="223">Purple</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 11 &amp; 12, 2nd Floor, P.S Plaza Jawahar Street, Platform Road, Sheshadripuram, Bengaluru, Karnataka 560020.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">85</td>
<td style="color:#008000" width="268">Sancity</td>
<td style="color:#008000" width="223">Comfort</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 11 &amp; 12, 2nd Floor, P.S Plaza Jawahar Street, Platform Road, Sheshadripuram, Bengaluru, Karnataka 560020.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">86</td>
<td style="color:#008000" width="268">Sancity</td>
<td style="color:#008000" width="223">Rachana</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 11 &amp; 12, 2nd Floor, P.S Plaza Jawahar Street, Platform Road, Sheshadripuram, Bengaluru, Karnataka 560020.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">87</td>
<td style="color:#008000" width="268">Sancity</td>
<td style="color:#008000" width="223">Independent House</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 11 &amp; 12, 2nd Floor, P.S Plaza Jawahar Street, Platform Road, Sheshadripuram, Bengaluru, Karnataka 560020.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">88</td>
<td style="color:#008000" width="268">Sancity</td>
<td style="color:#008000" width="223">Independent House</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 11 &amp; 12, 2nd Floor, P.S Plaza Jawahar Street, Platform Road, Sheshadripuram, Bengaluru, Karnataka 560020.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">89</td>
<td style="color:#008000" width="268">Sancity</td>
<td style="color:#008000" width="223">Independent House</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 11 &amp; 12, 2nd Floor, P.S Plaza Jawahar Street, Platform Road, Sheshadripuram, Bengaluru, Karnataka 560020.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">90</td>
<td style="color:#008000" width="268">Sancity</td>
<td style="color:#008000" width="223">Independent House</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 11 &amp; 12, 2nd Floor, P.S Plaza Jawahar Street, Platform Road, Sheshadripuram, Bengaluru, Karnataka 560020.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">91</td>
<td style="color:#008000" width="268">Sancity</td>
<td style="color:#008000" width="223">Independent House</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 11 &amp; 12, 2nd Floor, P.S Plaza Jawahar Street, Platform Road, Sheshadripuram, Bengaluru, Karnataka 560020.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">92</td>
<td style="color:#008000" width="268">Fateh Buildtech Pvt. Ltd</td>
<td style="color:#008000" width="223">Perfect Casa-Bella</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">No.16, 3rd Floor, Fateh Complex, S. Kariyappa Road, Yediyur, Basvangudi,Bangalore - 560001.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">93</td>
<td style="color:#008000" width="268">Fateh Buildtech Pvt. Ltd</td>
<td style="color:#008000" width="223">Perfecta Elegant</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">No.16, 3rd Floor, Fateh Complex, S. Kariyappa Road, Yediyur, Basvangudi,Bangalore - 560001.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">94</td>
<td style="color:#008000" width="268">Fateh Buildtech Pvt. Ltd</td>
<td style="color:#008000" width="223">Perfecta Premia</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">No.16, 3rd Floor, Fateh Complex, S. Kariyappa Road, Yediyur, Basvangudi,Bangalore - 560001.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">95</td>
<td style="color:#008000" width="268">Fateh Buildtech Pvt. Ltd</td>
<td style="color:#008000" width="223">Perfecta Charisma</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">No.16, 3rd Floor, Fateh Complex, S. Kariyappa Road, Yediyur, Basvangudi,Bangalore - 560001.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">96</td>
<td style="color:#008000" width="268">Fateh Buildtech Pvt. Ltd</td>
<td style="color:#008000" width="223">Parasmani Regency</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">No.16, 3rd Floor, Fateh Complex, S. Kariyappa Road, Yediyur, Basvangudi,Bangalore - 560001.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">97</td>
<td style="color:#008000" width="268">Fateh Buildtech Pvt. Ltd</td>
<td style="color:#008000" width="223">Perfecta Classica</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">No.16, 3rd Floor, Fateh Complex, S. Kariyappa Road, Yediyur, Basvangudi,Bangalore - 560001.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">98</td>
<td style="color:#008000" width="268">Fateh Buildtech Pvt. Ltd</td>
<td style="color:#008000" width="223">Perfecta Charm</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">No.16, 3rd Floor, Fateh Complex, S. Kariyappa Road, Yediyur, Basvangudi,Bangalore - 560001.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">99</td>
<td style="color:#008000" width="268">Fateh Buildtech Pvt. Ltd</td>
<td style="color:#008000" width="223">BHAGYASHREE APOORVA</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">No.16, 3rd Floor, Fateh Complex, S. Kariyappa Road, Yediyur, Basvangudi,Bangalore - 560001.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">100</td>
<td style="color:#008000" width="268">S R Constructions</td>
<td style="color:#008000" width="223">ROYAL RESIDENCY</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">S K Towers, Gulbarga Karnataka 585102</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">101</td>
<td style="color:#008000" width="268">S R Constructions</td>
<td style="color:#008000" width="223">S R Anmol</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">S K Towers, Gulbarga Karnataka 585102</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">102</td>
<td style="color:#008000" width="268">S R Constructions</td>
<td style="color:#008000" width="223">S R Plaza</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">S K Towers, Gulbarga Karnataka 585102</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">103</td>
<td style="color:#008000" width="268">S R Constructions</td>
<td style="color:#008000" width="223">Crystal Residency</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">S K Towers, Gulbarga Karnataka 585102</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">104</td>
<td style="color:#008000" width="268">S R Constructions</td>
<td style="color:#008000" width="223">Crystal Plaza</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">S K Towers, Gulbarga Karnataka 585102</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">105</td>
<td style="color:#008000" width="268">S R Constructions</td>
<td style="color:#008000" width="223">High Court Bench</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">S K Towers, Gulbarga Karnataka 585102</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">106</td>
<td style="color:#008000" width="268">S R Constructions</td>
<td style="color:#008000" width="223">S K Tower.</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">S K Towers, Gulbarga Karnataka 585102</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">107</td>
<td style="color:#008000" width="268">Indium Developments Pvt Ltd.</td>
<td style="color:#008000" width="223">A-Block ( lake forest)</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">#204/C, 27th Cross, 6th Main,3rd Block, Jayanagar, Bengaluru 560011</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">108</td>
<td style="color:#008000" width="268">Indium Developments Pvt Ltd.</td>
<td style="color:#008000" width="223">B-Block( lake forest)</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">#204/C, 27th Cross, 6th Main,3rd Block, Jayanagar, Bengaluru 560011</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">109</td>
<td style="color:#008000" width="268">Indium Developments Pvt Ltd.</td>
<td style="color:#008000" width="223">D-Block( lake forest)</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">#204/C, 27th Cross, 6th Main,3rd Block, Jayanagar, Bengaluru 560011</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">110</td>
<td style="color:#008000" width="268">Indium Developments Pvt Ltd.</td>
<td style="color:#008000" width="223">P-Block( lake forest)</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">#204/C, 27th Cross, 6th Main,3rd Block, Jayanagar, Bengaluru 560011</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">111</td>
<td style="color:#008000" width="268">Nanda Shelters Builders &amp; Developers</td>
<td style="color:#008000" width="223">Nanda Prakruthi</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">14-A, 27th Cross, Jayanagar 4th Block, Bengaluru-560011.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">112</td>
<td style="color:#008000" width="268">ROTSON CONSTRUCTION</td>
<td style="color:#008000" width="223">Rotson Park</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">Vernekar Building,&nbsp;opp.State Bank of Mysore, Deshpande Nagar, Hubli-Dharwad-580029</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">113</td>
<td style="color:#008000" width="268">ROTSON CONSTRUCTION</td>
<td style="color:#008000" width="223">Rotson sai Pride</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">Vernekar Building,&nbsp;opp.State Bank of Mysore, Deshpande Nagar, Hubli-Dharwad-580029</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">114</td>
<td style="color:#008000" width="268">VISHWAS BAWA BUILDERS</td>
<td style="color:#008000" width="223">Vishwas Aloevera</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">Vishwas Crown Building, near Cochin Bakery,Kankanady, Mangaluru, Karnataka 575001</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">115</td>
<td style="color:#008000" width="268">VISHWAS BAWA BUILDERS</td>
<td style="color:#008000" width="223">Vishwas Sujatha Residency</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">Vishwas Crown Building, near Cochin Bakery,Kankanady, Mangaluru, Karnataka 575001</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">116</td>
<td style="color:#008000" width="268">VISHWAS BAWA BUILDERS</td>
<td style="color:#008000" width="223">Vishwas Jasmine</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">Vishwas Crown Building, near Cochin Bakery,Kankanady, Mangaluru, Karnataka 575001</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">117</td>
<td style="color:#008000" width="268">VISHWAS BAWA BUILDERS</td>
<td style="color:#008000" width="223">Vishwas Thribhuvan</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">Vishwas Crown Building, near Cochin Bakery,Kankanady, Mangaluru, Karnataka 575001</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">118</td>
<td style="color:#008000" width="268">VISHWAS BAWA BUILDERS</td>
<td style="color:#008000" width="223">Vishwas Neha Residency</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">Vishwas Crown Building, near Cochin Bakery,Kankanady, Mangaluru, Karnataka 575001</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">119</td>
<td style="color:#008000" width="268">VISHWAS BAWA BUILDERS</td>
<td style="color:#008000" width="223">Vishwas Darshan</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">Vishwas Crown Building, near Cochin Bakery,Kankanady, Mangaluru, Karnataka 575001</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">120</td>
<td style="color:#008000" width="268">VISHWAS BAWA BUILDERS</td>
<td style="color:#008000" width="223">Vishwas Kuteera</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">Vishwas Crown Building, near Cochin Bakery,Kankanady, Mangaluru, Karnataka 575001</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">121</td>
<td style="color:#008000" width="268">VISHWAS BAWA BUILDERS</td>
<td style="color:#008000" width="223">Vishwas Samrat</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">Vishwas Crown Building, near Cochin Bakery,Kankanady, Mangaluru, Karnataka 575001</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">122</td>
<td style="color:#008000" width="268">VISHWAS BAWA BUILDERS</td>
<td style="color:#008000" width="223">Vishwas Diamond</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">Vishwas Crown Building, near Cochin Bakery,Kankanady, Mangaluru, Karnataka 575001</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">123</td>
<td style="color:#008000" width="268">VISHWAS BAWA BUILDERS</td>
<td style="color:#008000" width="223">Vishwas Crystal</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">Vishwas Crown Building, near Cochin Bakery,Kankanady, Mangaluru, Karnataka 575001</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">124</td>
<td style="color:#008000" width="268">VISHWAS BAWA BUILDERS</td>
<td style="color:#008000" width="223">Vishwas Crown</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">Vishwas Crown Building, near Cochin Bakery,Kankanady, Mangaluru, Karnataka 575001</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">125</td>
<td style="color:#008000" width="268">VISHWAS BAWA BUILDERS</td>
<td style="color:#008000" width="223">Vishwas Dwaraka</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">Vishwas Crown Building, near Cochin Bakery,Kankanady, Mangaluru, Karnataka 575001</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">126</td>
<td style="color:#008000" width="268">VISHWAS BAWA BUILDERS</td>
<td style="color:#008000" width="223">Vishwas Sahara Heights</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">Vishwas Crown Building, near Cochin Bakery,Kankanady, Mangaluru, Karnataka 575001</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">127</td>
<td style="color:#008000" width="268">VISHWAS BAWA BUILDERS</td>
<td style="color:#008000" width="223">Vishwas Planet</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">Vishwas Crown Building, near Cochin Bakery,Kankanady, Mangaluru, Karnataka 575001</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">128</td>
<td style="color:#008000" width="268">VISHWAS BAWA BUILDERS</td>
<td style="color:#008000" width="223">Vishwas Sathyam</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">Vishwas Crown Building, near Cochin Bakery, Kankanady, Mangaluru, Karnataka 575001</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">129</td>
<td style="color:#008000" width="268">VISHWAS BAWA BUILDERS</td>
<td style="color:#008000" width="223">Vishwas Asha Kiran</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">Vishwas Crown Building, near Cochin Bakery, Kankanady, Mangaluru, Karnataka 575001</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">130</td>
<td style="color:#008000" width="268">VISHWAS BAWA BUILDERS</td>
<td style="color:#008000" width="223">Vishwas Homes</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">Vishwas Crown Building, near Cochin Bakery,Kankanady, Mangaluru, Karnataka 575001</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">131</td>
<td style="color:#008000" width="268">VISHWAS BAWA BUILDERS</td>
<td style="color:#008000" width="223">Vishwas Mithra</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">Vishwas Crown Building, near Cochin Bakery,Kankanady, Mangaluru, Karnataka 575001</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">132</td>
<td style="color:#008000" width="268">VISHWAS BAWA BUILDERS</td>
<td style="color:#008000" width="223">Vishwas Neptune</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">Vishwas Crown Building, near Cochin Bakery,Kankanady, Mangaluru, Karnataka 575001</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">133</td>
<td style="color:#008000" width="268">VISHWAS BAWA BUILDERS</td>
<td style="color:#008000" width="223">Vishwas Paradise</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">Vishwas Crown Building, near Cochin Bakery,Kankanady, Mangaluru, Karnataka 575001</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">134</td>
<td style="color:#008000" width="268">VISHWAS BAWA BUILDERS</td>
<td style="color:#008000" width="223">Vishwas Residency</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">Vishwas Crown Building, near Cochin Bakery,Kankanady, Mangaluru, Karnataka 575001</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">135</td>
<td style="color:#008000" width="268">VISHWAS BAWA BUILDERS</td>
<td style="color:#008000" width="223">Vishwas Orchid</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">Vishwas Crown Building, near Cochin Bakery,Kankanady, Mangaluru, Karnataka 575001</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">136</td>
<td style="color:#008000" width="268">VISHWAS BAWA BUILDERS</td>
<td style="color:#008000" width="223">Vishwas Imperial</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">Vishwas Crown Building, near Cochin Bakery,Kankanady, Mangaluru, Karnataka 575001</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">137</td>
<td style="color:#008000" width="268">VISHWAS BAWA BUILDERS</td>
<td style="color:#008000" width="223">Vishwas Avenue</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">Vishwas Crown Building, near Cochin Bakery,Kankanady, Mangaluru, Karnataka 575001</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">138</td>
<td style="color:#008000" width="268">VISHWAS BAWA BUILDERS</td>
<td style="color:#008000" width="223">Vishwas Jupiter</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">Vishwas Crown Building, near Cochin Bakery,Kankanady, Mangaluru, Karnataka 575001</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">139</td>
<td style="color:#008000" width="268">VISHWAS BAWA BUILDERS</td>
<td style="color:#008000" width="223">Vishwas View</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">Vishwas Crown Building, near Cochin Bakery,Kankanady, Mangaluru, Karnataka 575001</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">140</td>
<td style="color:#008000" width="268">VISHWAS BAWA BUILDERS</td>
<td style="color:#008000" width="223">Vishwas Pearl</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">Vishwas Crown Building, near Cochin Bakery,Kankanady, Mangaluru, Karnataka 575001</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">141</td>
<td style="color:#008000" width="268">VISHWAS BAWA BUILDERS</td>
<td style="color:#008000" width="223">Vishwas Green View</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">Vishwas Crown Building, near Cochin Bakery,Kankanady, Mangaluru, Karnataka 575001</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">142</td>
<td style="color:#008000" width="268">VISHWAS BAWA BUILDERS</td>
<td style="color:#008000" width="223">Vishwas Natasha Residency</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">Vishwas Crown Building, near Cochin Bakery,Kankanady, Mangaluru, Karnataka 575001</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">143</td>
<td style="color:#008000" width="268">VISHWAS BAWA BUILDERS</td>
<td style="color:#008000" width="223">Vishwas Manor</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">Vishwas Crown Building, near Cochin Bakery,Kankanady, Mangaluru, Karnataka 575001</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">144</td>
<td style="color:#008000" width="268">VISHWAS BAWA BUILDERS</td>
<td style="color:#008000" width="223">Vishwas Anmol</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">Vishwas Crown Building, near Cochin Bakery,Kankanady, Mangaluru, Karnataka 575001</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">145</td>
<td style="color:#008000" width="268">VISHWAS BAWA BUILDERS</td>
<td style="color:#008000" width="223">Vishwas Royal</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">Vishwas Crown Building, near Cochin Bakery,Kankanady, Mangaluru, Karnataka 575001</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">146</td>
<td style="color:#008000" width="268">VISHWAS BAWA BUILDERS</td>
<td style="color:#008000" width="223">Vishwas Garden</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">Vishwas Crown Building, near Cochin Bakery,Kankanady, Mangaluru, Karnataka 575001</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">147</td>
<td style="color:#008000" width="268">VISHWAS BAWA BUILDERS</td>
<td style="color:#008000" width="223">Vishwas Regency</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">Vishwas Crown Building, near Cochin Bakery,Kankanady, Mangaluru, Karnataka 575001</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">148</td>
<td style="color:#008000" width="268">SAI SAI VENTURES</td>
<td style="color:#008000" width="223">SAIDEEP HULAS</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">&nbsp;#340/A.10TH MAIN,4TH CROSS. INDIRANAGAR,2ND STAGE,BENGALURU - 560038.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">149</td>
<td style="color:#008000" width="268">SAI SAI VENTURES</td>
<td style="color:#008000" width="223">VR PEARL</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">&nbsp;#340/A.10TH MAIN,4TH CROSS. INDIRANAGAR,2ND STAGE,BENGALURU - 560038.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">150</td>
<td style="color:#008000" width="268">SAI SAI VENTURES</td>
<td style="color:#008000" width="223">SREEPADAM NIVASA</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">&nbsp;#340/A.10TH MAIN,4TH CROSS. INDIRANAGAR,2ND STAGE,BENGALURU - 560038.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">151</td>
<td style="color:#008000" width="268">SAI SAI VENTURES</td>
<td style="color:#008000" width="223">AHP WOODS</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">&nbsp;#340/A.10TH MAIN,4TH CROSS. INDIRANAGAR,2ND STAGE,BENGALURU - 560038.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">152</td>
<td style="color:#008000" width="268">SAI SAI VENTURES</td>
<td style="color:#008000" width="223">VR SHOBHA MEADOWS</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">&nbsp;#340/A.10TH MAIN,4TH CROSS. INDIRANAGAR,2ND STAGE,BENGALURU - 560038.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">153</td>
<td style="color:#008000" width="268">SAI SAI VENTURES</td>
<td style="color:#008000" width="223">VR VATIKA</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">&nbsp;#340/A.10TH MAIN,4TH CROSS. INDIRANAGAR,2ND STAGE,BENGALURU - 560038.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">154</td>
<td style="color:#008000" width="268">SAI SAI VENTURES</td>
<td style="color:#008000" width="223">SAMHITA ROYAL SPLENDOR</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">&nbsp;#340/A.10TH MAIN,4TH CROSS. INDIRANAGAR,2ND STAGE,BENGALURU - 560038.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">155</td>
<td style="color:#008000" width="268">SAI SAI VENTURES</td>
<td style="color:#008000" width="223">SRI ADITYA NIVAS</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">&nbsp;#340/A.10TH MAIN,4TH CROSS. INDIRANAGAR,2ND STAGE,BENGALURU - 560038.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">156</td>
<td style="color:#008000" width="268">SAI SAI VENTURES</td>
<td style="color:#008000" width="223">NANDANAM PARADISE</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">&nbsp;#340/A.10TH MAIN,4TH CROSS. INDIRANAGAR,2ND STAGE,BENGALURU - 560038.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">157</td>
<td style="color:#008000" width="268">Shri Aruna Constructions pvt ltd&nbsp;</td>
<td style="color:#008000" width="223">Trivik Windwalk</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">Sri Devi Propertes, #372/373, 1st Floor 13th A Main, 80 Feet Road, Yalahanka New Town Bengaluru-560064</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">158</td>
<td style="color:#008000" width="268">Taras Datri Developers</td>
<td style="color:#008000" width="223">Trillium Apartments</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">Thimmaiah Main Road Rajajinagar,Bangalore - 560010.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">159</td>
<td style="color:#008000" width="268">Taras Datri Developers</td>
<td style="color:#008000" width="223">Silver Waves Royal</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">Thimmaiah Main Road Rajajinagar,Bangalore - 560010.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">160</td>
<td style="color:#008000" width="268">ATZ Properties</td>
<td style="color:#008000" width="223">ATZ Grandeur</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 12/1, Plain Street, Infantry Road Cross,&nbsp;Shivaji Nagar,Bengaluru-560001.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">161</td>
<td style="color:#008000" width="268">ATZ Properties</td>
<td style="color:#008000" width="223">ATZ Gladiola Gardenia</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 12/1, Plain Street, Infantry Road Cross,&nbsp;Shivaji Nagar,Bengaluru-560001.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">162</td>
<td style="color:#008000" width="268">ATZ Properties</td>
<td style="color:#008000" width="223">ATZ Palatial</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 12/1, Plain Street, Infantry Road Cross,&nbsp;Shivaji Nagar,Bengaluru-560001.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">163</td>
<td style="color:#008000" width="268">Taras Datri Developers,</td>
<td style="color:#008000" width="223">TD GOLDEN OAK</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">Thimmaiah Main Road Rajajinagar,Bangalore - 560010</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">164</td>
<td style="color:#008000" width="268">Taras Datri Developers,</td>
<td style="color:#008000" width="223">TD PALM AVENUE&nbsp;</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">Thimmaiah Main Road Rajajinagar,Bangalore - 560010</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">165</td>
<td style="color:#008000" width="268">Sriven Properties</td>
<td style="color:#008000" width="223">Serenity</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 65, 8th "B" Main, Vinayaka Tower, 1st Floor, 27th Cross, Near Maiyas Hotel, 4th Block Jayanagar, Bengaluru-560011.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">166</td>
<td style="color:#008000" width="268">Sriven Properties</td>
<td style="color:#008000" width="223">Metropole</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 65, 8th "B" Main, Vinayaka Tower, 1st Floor, 27th Cross, Near Maiyas Hotel, 4th Block Jayanagar, Bengaluru-560011.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">167</td>
<td style="color:#008000" width="268">Purnima Build Tech</td>
<td style="color:#008000" width="223">Purnima Platina</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">#1147, 6th Main, 18th Cross, HSR Layout, 7th Sector,<br /> Bengaluru - 560 102.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">168</td>
<td style="color:#008000" width="268">Purnima Build Tech</td>
<td style="color:#008000" width="223">Purnima Classic</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">#1147, 6th Main, 18th Cross, HSR Layout, 7th Sector,<br /> Bengaluru - 560 102.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">169</td>
<td style="color:#008000" width="268">Purnima Build Tech</td>
<td style="color:#008000" width="223">Purnima Elite</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">#1147, 6th Main, 18th Cross, HSR Layout, 7th Sector,<br /> Bengaluru - 560 102.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">170</td>
<td style="color:#008000" width="268">Purnima Build Tech</td>
<td style="color:#008000" width="223">Purnima Villa</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">#1147, 6th Main, 18th Cross, HSR Layout, 7th Sector,<br /> Bengaluru - 560 102.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">171</td>
<td style="color:#008000" width="268">UNNATHI GROUP INDIA INC</td>
<td style="color:#008000" width="223">SUKRUTHI GARDENIA</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 189, 2nd Floor, 1st Main, WOC Road, Mahalakshmi layout, <br /> Bengaluru - 560 086</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">172</td>
<td style="color:#008000" width="268">UNNATHI GROUP INDIA INC</td>
<td style="color:#008000" width="223">SUNSHINE GARDENIA</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 189, 2nd Floor, 1st Main, WOC Road, Mahalakshmi layout, <br /> Bengaluru - 560 086</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">173</td>
<td style="color:#008000" width="268">UNNATHI GROUP INDIA INC</td>
<td style="color:#008000" width="223">PRASIDDHI NEST</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 189, 2nd Floor, 1st Main, WOC Road, Mahalakshmi layout, <br /> Bengaluru - 560 086</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">174</td>
<td style="color:#008000" width="268">ABHIMAN Constructions</td>
<td style="color:#008000" width="223">Abhiman Texas</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">9th Floor, Abhiman Chambers, Near Bunts Hostel Circle, Kadri Road, Mangalore-575003.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">175</td>
<td style="color:#008000" width="268">ABHIMAN Constructions</td>
<td style="color:#008000" width="223">Abhiman Heights</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">9th Floor, Abhiman Chambers, Near Bunts Hostel Circle, Kadri Road, Mangalore-575003.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">176</td>
<td style="color:#008000" width="268">ABHIMAN Constructions</td>
<td style="color:#008000" width="223">Abhiman Hills</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">9th Floor, Abhiman Chambers, Near Bunts Hostel Circle, Kadri Road, Mangalore-575003.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">177</td>
<td style="color:#008000" width="268">ABHIMAN Constructions</td>
<td style="color:#008000" width="223">Abhiman Palace</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">9th Floor, Abhiman Chambers, Near Bunts Hostel Circle, Kadri Road, Mangalore-575003.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">178</td>
<td style="color:#008000" width="268">ABHIMAN Constructions</td>
<td style="color:#008000" width="223">Abhiman Gardens</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">9th Floor, Abhiman Chambers, Near Bunts Hostel Circle, Kadri Road, Mangalore-575003.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">179</td>
<td style="color:#008000" width="268">ABHIMAN Constructions</td>
<td style="color:#008000" width="223">Sanjay</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">9th Floor, Abhiman Chambers, Near Bunts Hostel Circle, Kadri Road, Mangalore-575003.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">180</td>
<td style="color:#008000" width="268">ABHIMAN Constructions</td>
<td style="color:#008000" width="223">Abhiman Mansion</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">9th Floor, Abhiman Chambers, Near Bunts Hostel Circle, Kadri Road, Mangalore-575003.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">181</td>
<td style="color:#008000" width="268">ABHIMAN Constructions</td>
<td style="color:#008000" width="223">Laxminarayan</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">9th Floor, Abhiman Chambers, Near Bunts Hostel Circle, Kadri Road, Mangalore-575003.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">182</td>
<td style="color:#008000" width="268">ABHIMAN Constructions</td>
<td style="color:#008000" width="223">Srinivasa Apartments</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">9th Floor, Abhiman Chambers, Near Bunts Hostel Circle, Kadri Road, Mangalore-575003.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">183</td>
<td style="color:#008000" width="268">Sizzle Properties</td>
<td style="color:#008000" width="223">Sizzle Gold Coast</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 290, 6th Cross, Vijaya Bank Colony Main Road, Dodda Banaswadi, Bengaluru.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">184</td>
<td style="color:#008000" width="268">Sizzle Properties</td>
<td style="color:#008000" width="223">Sizzle White Willows</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 290, 6th Cross, Vijaya Bank Colony Main Road, Dodda Banaswadi, Bengaluru.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">185</td>
<td style="color:#008000" width="268">Sizzle Properties</td>
<td style="color:#008000" width="223">Sizzle IT Meadows</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 290, 6th Cross, Vijaya Bank Colony Main Road, Dodda Banaswadi, Bengaluru.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">186</td>
<td style="color:#008000" width="268">Sizzle Properties</td>
<td style="color:#008000" width="223">Sizzle Maybelle</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 290, 6th Cross, Vijaya Bank Colony Main Road, Dodda Banaswadi, Bengaluru.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">187</td>
<td style="color:#008000" width="268">HMA land</td>
<td style="color:#008000" width="223">MANDARA APARTMENTS</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 5, Mezzanine Floor, Thapar House 37, Montieth Road, Egmore,&nbsp;Chennai - 600 008</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">188</td>
<td style="color:#008000" width="268">Central Government Telecom andinformation Techology Employees Housing Coperative Society ltd</td>
<td style="color:#008000" width="223">SHREE VARADHAGIRI</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 6/2, 1st Floor, 1st Main Road, Next to Kodava Samaj, Vasanth Nagar, Bangalore-560052.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">189</td>
<td style="color:#008000" width="268">Central Government Telecom andinformation Techology Employees Housing Coperative Society ltd</td>
<td style="color:#008000" width="223">SHREEDHARAGIRI - DEVANAHALLI - BANGALORE</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 6/2, 1st Floor, 1st Main Road, Next to Kodava Samaj, Vasanth Nagar, Bangalore-560052.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">190</td>
<td style="color:#008000" width="268">Central Government Telecom andinformation Techology Employees Housing Coperative Society ltd</td>
<td style="color:#008000" width="223">BHUVANAGIRI - IVC ROAD - BANGALORE</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 6/2, 1st Floor, 1st Main Road, Next to Kodava Samaj, Vasanth Nagar, Bangalore-560052.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">191</td>
<td style="color:#008000" width="268">Central Government Telecom andinformation Techology Employees Housing Coperative Society ltd</td>
<td style="color:#008000" width="223">SAPTHAGIRI NAGAR</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 6/2, 1st Floor, 1st Main Road, Next to Kodava Samaj, Vasanth Nagar, Bangalore-560052.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">192</td>
<td style="color:#008000" width="268">Central Government Telecom andinformation Techology Employees Housing Coperative Society ltd</td>
<td style="color:#008000" width="223">SHREE SHIVAGIRI</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 6/2, 1st Floor, 1st Main Road, Next to Kodava Samaj, Vasanth Nagar, Bangalore-560052.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">193</td>
<td style="color:#008000" width="268">Central Government Telecom andinformation Techology Employees Housing Coperative Society ltd</td>
<td style="color:#008000" width="223">GREEN LAND TOWNSHIP</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 6/2, 1st Floor, 1st Main Road, Next to Kodava Samaj, Vasanth Nagar, Bangalore-560052.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">194</td>
<td style="color:#008000" width="268">Central Government Telecom andinformation Techology Employees Housing Coperative Society ltd</td>
<td style="color:#008000" width="223">NESARA</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 6/2, 1st Floor, 1st Main Road, Next to Kodava Samaj, Vasanth Nagar, Bangalore-560052.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">195</td>
<td style="color:#008000" width="268">Central Government Telecom andinformation Techology Employees Housing Coperative Society ltd</td>
<td style="color:#008000" width="223">BRAMHAGIRI TOWN</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 6/2, 1st Floor, 1st Main Road, Next to Kodava Samaj, Vasanth Nagar, Bangalore-560052.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">196</td>
<td style="color:#008000" width="268">Vaibhavi Properties</td>
<td style="color:#008000" width="223">Bramhalingeshwara Enclave</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 739, 60th Cross, Rajajinagar, 5th Block, Bhasham circle, Bengaluru.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">197</td>
<td style="color:#008000" width="268">JOHN CONSTRUCTION</td>
<td style="color:#008000" width="223">John's Ark</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">1st Floor, Krishna Kripa Complex, Behind Service Bus Stand, Udupi-576101.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">198</td>
<td style="color:#008000" width="268">CMRS Group</td>
<td style="color:#008000" width="223">CMRS Sunnydew</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 573, AECS Layout, C Block, Main Road, Opp. ICICI Bank, <br /> Bengaluru-560037.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">199</td>
<td style="color:#008000" width="268">CMRS Group</td>
<td style="color:#008000" width="223">Lotus</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 573, AECS Layout, C Block, Main Road, Opp. ICICI Bank, <br /> Bengaluru-560037.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">200</td>
<td style="color:#008000" width="268">CMRS Group</td>
<td style="color:#008000" width="223">CMRS 12 Square</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">#573, AECS Layout, C Block, Main Road, Opp. ICICI Bank, Bengaluru - 560037</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">201</td>
<td style="color:#008000" width="268">Gravity Homes</td>
<td style="color:#008000" width="223">Gravity Homes</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">#18B, Bharat Apartments, 3rd Floor, 5th Main&nbsp; Road, 39th Cross, 5th Block, Jayanagar, Bangaluru-560041.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">202</td>
<td style="color:#008000" width="268">Subha Builders and Developers</td>
<td style="color:#008000" width="223">Subha Venus Signature</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 17/F, 18th Cross, Sector-3, HSR Layout, Bengaluru-560102.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">203</td>
<td style="color:#008000" width="268">Subha Builders and Developers</td>
<td style="color:#008000" width="223">Subha Nandana</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 17/F, 18th Cross, Sector-3, HSR Layout, Bengaluru-560102.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">204</td>
<td style="color:#008000" width="268">ACE DEVELOPERS</td>
<td style="color:#008000" width="223">Willows Residences</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">1st Floor, Inland Ornate,Navabharath Circle, Mangalore 575003.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">205</td>
<td style="color:#008000" width="268">SRE SANNIDHI INFRA</td>
<td style="color:#008000" width="223">SANNIDHI PRIDE</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 32, 1st Floor, K.K. Plaza, 2nd Main, Hanumanthanagar, Bengaluru-560019.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">206</td>
<td style="color:#008000" width="268">SRE SANNIDHI INFRA</td>
<td style="color:#008000" width="223">SANNIDHI ELITE</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 32, 1st Floor, K.K. Plaza, 2nd Main, Hanumanthanagar, Bengaluru-560019.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">207</td>
<td style="color:#008000" width="268">SRE SANNIDHI INFRA</td>
<td style="color:#008000" width="223">SANNIDHI CASLTE</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 32, 1st Floor, K.K. Plaza, 2nd Main, Hanumanthanagar, Bengaluru-560019.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">208</td>
<td style="color:#008000" width="268">DNA INFRA,</td>
<td style="color:#008000" width="223">DNA Opus</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 179, 3rd Floor, 10 A Main Road, Double Road, Indiranagar 2nd stage,&nbsp;<br /> Bengaluru-560038.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">209</td>
<td style="color:#008000" width="268">Valmark, The Residency</td>
<td style="color:#008000" width="223">Valmark Apas</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">10th Floor, #133/1, Residency Road, Bangalore &ndash; 560 025.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">210</td>
<td style="color:#008000" width="268">Valmark, The Residency</td>
<td style="color:#008000" width="223">Valmark Aastha</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">10th Floor, #133/1, Residency Road, Bangalore &ndash; 560 025.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">211</td>
<td style="color:#008000" width="268">Valmark, The Residency</td>
<td style="color:#008000" width="223">Amoda</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">10th Floor, #133/1, Residency Road, Bangalore &ndash; 560 025.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">212</td>
<td style="color:#008000" width="268">Vasundara Builders &amp; Developers</td>
<td style="color:#008000" width="223">Vasundara Skyscape</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 5, Shop No. 1, Vasanthapura Main Road,Near Water Pipe Line,&nbsp;Bikasipura, Bengaluru-560061.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">213</td>
<td style="color:#008000" width="268">Gopalan Enterprises Pvt. Ltd.</td>
<td style="color:#008000" width="223">Gopalan Admirality Court</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 5, Richmond Road, Bengaluru-560025.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">214</td>
<td style="color:#008000" width="268">Gopalan Enterprises Pvt. Ltd.</td>
<td style="color:#008000" width="223">Gopalan Atlantis</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 5, Richmond Road, Bengaluru-560025.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">215</td>
<td style="color:#008000" width="268">Gopalan Enterprises Pvt. Ltd.</td>
<td style="color:#008000" width="223">Gopalan Admirality Premier</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 5, Richmond Road, Bengaluru-560025.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">216</td>
<td style="color:#008000" width="268">Gopalan Enterprises Pvt. Ltd.</td>
<td style="color:#008000" width="223">Gopalan Admirality Royal</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 5, Richmond Road, Bengaluru-560025.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">217</td>
<td style="color:#008000" width="268">Gopalan Enterprises Pvt. Ltd.</td>
<td style="color:#008000" width="223">Gopalan Sanskriti</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 5, Richmond Road, Bengaluru-560025.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">218</td>
<td style="color:#008000" width="268">Gopalan Enterprises Pvt. Ltd.</td>
<td style="color:#008000" width="223">Gopalan Urban Woods</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 5, Richmond Road, Bengaluru-560025.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">219</td>
<td style="color:#008000" width="268">Gopalan Enterprises Pvt. Ltd.</td>
<td style="color:#008000" width="223">Gopalan Destination</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 5, Richmond Road, Bengaluru-560025.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">220</td>
<td style="color:#008000" width="268">Gopalan Enterprises Pvt. Ltd.</td>
<td style="color:#008000" width="223">Gopalan Fortune City</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 5, Richmond Road, Bengaluru-560025.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">221</td>
<td style="color:#008000" width="268">Gopalan Enterprises Pvt. Ltd.</td>
<td style="color:#008000" width="223">Gopalan Ipark</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 5, Richmond Road, Bengaluru-560025.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">222</td>
<td style="color:#008000" width="268">Rai Estates and Builders Pvt. Ltd</td>
<td style="color:#008000" width="223">Vardaman Nagar</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 10, New Sayyaji rao road, Bamboo Bazar, Mysore-570021.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">223</td>
<td style="color:#008000" width="268">Rai Estates and Builders Pvt. Ltd</td>
<td style="color:#008000" width="223">Spring Meadows</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 10, New Sayyaji rao road, Bamboo Bazar, Mysore-570021.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">224</td>
<td style="color:#008000" width="268">Rai Estates and Builders Pvt. Ltd</td>
<td style="color:#008000" width="223">PARADISE ENCLAVE</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 10, New Sayyaji rao road, Bamboo Bazar, Mysore-570021.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">225</td>
<td style="color:#008000" width="268">Rai Estates and Builders Pvt. Ltd</td>
<td style="color:#008000" width="223">GREEN PARK</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 10, New Sayyaji rao road, Bamboo Bazar, Mysore-570021.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">226</td>
<td style="color:#008000" width="268">Rai Estates and Builders Pvt. Ltd</td>
<td style="color:#008000" width="223">MISTY MEADOWS</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 10, New Sayyaji rao road, Bamboo Bazar, Mysore-570021.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">227</td>
<td style="color:#008000" width="268">Eden Properties</td>
<td style="color:#008000" width="223">MAGNOLIA</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 38, SMS Arcade Building, 2nd Cross, Behind SBM Bank, Amar Regency, Horamavu, Bengaluru-560043.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">228</td>
<td style="color:#008000" width="268">Eden Properties</td>
<td style="color:#008000" width="223">Spring Vista</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 38, SMS Arcade Building, 2nd Cross, Behind SBM Bank, Amar Regency, Horamavu, Bengaluru-560043.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">229</td>
<td style="color:#008000" width="268">Eden Properties</td>
<td style="color:#008000" width="223">Dollar Collony</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 38, SMS Arcade Building, 2nd Cross, Behind SBM Bank, Amar Regency, Horamavu, Bengaluru-560043.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">230</td>
<td style="color:#008000" width="268">Eden Properties</td>
<td style="color:#008000" width="223">WHITE COUNTY,</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 38, SMS Arcade Building, 2nd Cross, Behind SBM Bank, Amar Regency, Horamavu, Bengaluru-560043.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">231</td>
<td style="color:#008000" width="268">Eden Properties</td>
<td style="color:#008000" width="223">Green Park</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 38, SMS Arcade Building, 2nd Cross, Behind SBM Bank, Amar Regency, Horamavu, Bengaluru-560043.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">232</td>
<td style="color:#008000" width="268">Navya Builders</td>
<td style="color:#008000" width="223">Navya Niketan</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">#316,The Mayfair Building,100ft Road,Indiranagar,Bengaluru-560038, Indiranagar, HAL 2nd Stage, Appareddipalya, Indiranagar, Bengaluru, Karnataka - 560038</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">233</td>
<td style="color:#008000" width="268">Navya Builders</td>
<td style="color:#008000" width="223">Navya Nest</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">#316,The Mayfair Building,100ft Road,Indiranagar,Bengaluru-560038, Indiranagar, HAL 2nd Stage, Appareddipalya, Indiranagar, Bengaluru, Karnataka - 560038</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">234</td>
<td style="color:#008000" width="268">Navya Builders</td>
<td style="color:#008000" width="223">Navya Delight</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">#316,The Mayfair Building,100ft Road,Indiranagar,Bengaluru-560038, Indiranagar, HAL 2nd Stage, Appareddipalya, Indiranagar, Bengaluru, Karnataka - 560038</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">235</td>
<td style="color:#008000" width="268">Navya Builders</td>
<td style="color:#008000" width="223">Navya Elite</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">#316,The Mayfair Building,100ft Road,Indiranagar,Bengaluru-560038, Indiranagar, HAL 2nd Stage, Appareddipalya, Indiranagar, Bengaluru, Karnataka - 560038</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">236</td>
<td style="color:#008000" width="268">Navya Builders</td>
<td style="color:#008000" width="223">Navya Nidhi</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">#316,The Mayfair Building,100ft Road,Indiranagar,Bengaluru-560038, Indiranagar, HAL 2nd Stage, Appareddipalya, Indiranagar, Bengaluru, Karnataka - 560038</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">237</td>
<td style="color:#008000" width="268">Navya Builders</td>
<td style="color:#008000" width="223">Mayfair</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">#316,The Mayfair Building,100ft Road,Indiranagar,Bengaluru-560038, Indiranagar, HAL 2nd Stage, Appareddipalya, Indiranagar, Bengaluru, Karnataka - 560038</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">238</td>
<td style="color:#008000" width="268">Trinco Property</td>
<td style="color:#008000" width="223">Trinco Green City</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 305A, Anand Onyx, 2nd Floor, 15th Cross Sarakki, 100 Feet Road, JP Nagar, 5th Phase, Bengaluru-560 078.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">239</td>
<td style="color:#008000" width="268">Trinco Property</td>
<td style="color:#008000" width="223">Lakshmi Residency</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 305A, Anand Onyx, 2nd Floor, 15th Cross Sarakki, 100 Feet Road,JP Nagar, 5th Phase, Bengaluru- 560 078.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">240</td>
<td style="color:#008000" width="268">MVS Builders</td>
<td style="color:#008000" width="223">MVS Orchids</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">#20, kalpavruksha, 1st Floor , 1st Cross, 2nd Main , KEB Layout BTM 1ST STSGE, Bengaluru - 560076</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">241</td>
<td style="color:#008000" width="268">CORNERSTONE HOUSE</td>
<td style="color:#008000" width="223">Campan Valley</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 583, 9th Main Road, Off CMH Road, Indiranagar 1st Stage, Bengaluru - 560038</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">242</td>
<td style="color:#008000" width="268">SLV STRUCTURES</td>
<td style="color:#008000" width="223">SLV Suhas Celestia</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 989, 1st floor, 5th cross, HRBR layout, Bengaluru-560043.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">243</td>
<td style="color:#008000" width="268">HEDA Builders Pvt Ltd</td>
<td style="color:#008000" width="223">HEDA Orchids</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">Heda builders pvt .ltd, no.18/B, heda menson opp.IOCL building,khanapur road,tilakwadi, Belgaum.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">244</td>
<td style="color:#008000" width="268">HABITAT VENTURES</td>
<td style="color:#008000" width="223">Habitat Mayflower</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">#26, Shankarmutt Road, Basavanagudi, Bangalore - 560 004</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">245</td>
<td style="color:#008000" width="268">HABITAT VENTURES</td>
<td style="color:#008000" width="223">Habitat Cedar</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">#26, Shankarmutt Road, Basavanagudi, Bangalore - 560 004</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">246</td>
<td style="color:#008000" width="268">SNR Square Pvt Ltd.</td>
<td style="color:#008000" width="223">SNR WHITE PETALS</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 18/1, 3rd Floor,Jain Bhavan, Andree Road, Shantinagar, Bengaluru-560027.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">247</td>
<td style="color:#008000" width="268">Enrich Properties</td>
<td style="color:#008000" width="223">Enrich Kempegowda Enclave</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 196/A, 1st Floor, 3rd Main, 10th Cross, CBI Road, Opp. Hotel Krishna Delicacy, Ganga Nagar, Bengaluru-560032.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">248</td>
<td style="color:#008000" width="268">Enrich properties</td>
<td style="color:#008000" width="223">Enrich paradise</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 196/A, 1st Floor, 3rd Main Road, 10th Cross, CBI Road, Ganga Nagar, Bengaluru - 560 032</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">249</td>
<td style="color:#008000" width="268">Janapriya Properties</td>
<td style="color:#008000" width="223">JANAPRIYA AIRPORTCITY</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 2653/1, Skanda Sai, 1st Floor, E-Block, Sahakarnagar, Bengaluru-560092.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">250</td>
<td style="color:#008000" width="268">Janapriya Properties</td>
<td style="color:#008000" width="223">ANAPRIYA CHAMPAK</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 2653/1, Skanda Sai, 1st Floor, E-Block, Sahakarnagar, Bengaluru-560092.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">251</td>
<td style="color:#008000" width="268">Janapriya Properties</td>
<td style="color:#008000" width="223">JANAPRIYA VAMSEE GARDEN</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 2653/1, Skanda Sai, 1st Floor, E-Block, Sahakarnagar, Bengaluru-560092.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">252</td>
<td style="color:#008000" width="268">Janapriya Properties</td>
<td style="color:#008000" width="223">JANAPRIYA SIGNATURE</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 2653/1, Skanda Sai, 1st Floor, E-Block, Sahakarnagar, Bengaluru-560092.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">253</td>
<td style="color:#008000" width="268">Land Link</td>
<td style="color:#008000" width="223">ASHOKA PARK</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">#9, City Point, Kodialbail,Mangalore - 57500.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">254</td>
<td style="color:#008000" width="268">Land Links</td>
<td style="color:#008000" width="223">HILL POINT III</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">#9, City Point, Kodialbail,Mangalore - 57500.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">255</td>
<td style="color:#008000" width="268">Land Links</td>
<td style="color:#008000" width="223">ROYAL PALMS</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">#9, City Point, Kodialbail,Mangalore - 57500.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">256</td>
<td style="color:#008000" width="268">Land Links</td>
<td style="color:#008000" width="223">Land Links Pearl</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">#9, City Point, Kodialbail,Mangalore - 57500.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">257</td>
<td style="color:#008000" width="268">Land Links</td>
<td style="color:#008000" width="223">Al Helen</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">#9, City Point, Kodialbail,Mangalore - 57500.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">258</td>
<td style="color:#008000" width="268">Land Links</td>
<td style="color:#008000" width="223">Land Links Pinnacle</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">#9, City Point, Kodialbail,Mangalore - 57500.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">259</td>
<td style="color:#008000" width="268">DIVAKAR Constructions</td>
<td style="color:#008000" width="223">Alpha homes</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">Shop No. 6, Ground Floor, Dev Plaza, Kadri Temple Road, Mangalore 575002</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">260</td>
<td style="color:#008000" width="268">DIVAKAR Constructions</td>
<td style="color:#008000" width="223">Vandana callisto</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">Shop No. 6, Ground Floor, Dev Plaza, Kadri Temple Road, Mangalore 575002</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">261</td>
<td style="color:#008000" width="268">Nanda Shelters builders &amp; developers,</td>
<td style="color:#008000" width="223">Nanda Ashirwad</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">14-A, 27th Cross, Jayanagar 4th Block, Bengaluru-560011.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">262</td>
<td style="color:#008000" width="268">T3 URBAN DEVELOPERS LTD.</td>
<td style="color:#008000" width="223">Sooryakanthi</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 201, Corporate Arena, Aarey Piramal Cross Road, Near Railway Station, Goregaon (west), Mumbai-400062.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">263</td>
<td style="color:#008000" width="268">T3 URBAN DEVELOPERS LTD.</td>
<td style="color:#008000" width="223">Sevantige</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 201, Corporate Arena, Aarey Piramal Cross Road, Near Railway Station, Goregaon (west), Mumbai-400062.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">264</td>
<td style="color:#008000" width="268">T3 URBAN DEVELOPERS LTD.</td>
<td style="color:#008000" width="223">Sugandhi</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 201, Corporate Arena, Aarey Piramal Cross Road, Near Railway Station, Goregaon (west), Mumbai-400062.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">265</td>
<td style="color:#008000" width="268">T3 URBAN DEVELOPERS LTD.</td>
<td style="color:#008000" width="223">Kamala</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 201, Corporate Arena, Aarey Piramal Cross Road, Near Railway Station, Goregaon (west), Mumbai-400062.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">266</td>
<td style="color:#008000" width="268">T3 URBAN DEVELOPERS LTD.</td>
<td style="color:#008000" width="223">Sugandhhi</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 201, Corporate Arena, Aarey Piramal Cross Road, Near Railway Station, Goregaon (west), Mumbai-400062.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">267</td>
<td style="color:#008000" width="268">Srinivasa Developers</td>
<td style="color:#008000" width="223">SAIPOORNA RAMARA</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">#110/2, Harlur off Sarjapur Road,Bengaluru 560102</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">268</td>
<td style="color:#008000" width="268">Srinivasa Developers</td>
<td style="color:#008000" width="223">SAI POORNA HIGH-END</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">#110/2, Harlur off Sarjapur Road,Bengaluru 560102</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">269</td>
<td style="color:#008000" width="268">Srinivasa Developers</td>
<td style="color:#008000" width="223">SAI POORNA PREMIER</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">#110/2, Harlur off Sarjapur Road,Bengaluru 560102</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">270</td>
<td style="color:#008000" width="268">V2 INNOVATIVE SHELTERS PVT. LTD.</td>
<td style="color:#008000" width="223">LAKESHORE</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">240/B,5TH CROSS,VIVEKNAGAR,BANGALORE-560047.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">271</td>
<td style="color:#008000" width="268">NASCO DEVELOPERS</td>
<td style="color:#008000" width="223">NASCO NANAWADI</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">RANADE COLONY, 1ST CROSS , HINDWADI, BELGAUM 590011</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">272</td>
<td style="color:#008000" width="268">NASCO DEVELOPERS</td>
<td style="color:#008000" width="223">NASCO EDEN PHASE-2</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">RANADE COLONY, 1ST CROSS , HINDWADI, BELGAUM 590011</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">273</td>
<td style="color:#008000" width="268">NASCO DEVELOPERS</td>
<td style="color:#008000" width="223">NASCO ELEGANCE (COMPLETED)</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">RANADE COLONY, 1ST CROSS , HINDWADI, BELGAUM 590011</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">274</td>
<td style="color:#008000" width="268">NASCO DEVELOPERS</td>
<td style="color:#008000" width="223">NASCO MAY FAIR RESIDENCICE (COMPLETED)</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">RANADE COLONY, 1ST CROSS , HINDWADI, BELGAUM 590011</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">275</td>
<td style="color:#008000" width="268">Connect Habitats</td>
<td style="color:#008000" width="223">Connect Glenview</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">No- Capital Avenue, Opp SBI, Hamilton Circle Statebank, Mangaluru-575001.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">276</td>
<td style="color:#008000" width="268">Connect Habitats</td>
<td style="color:#008000" width="223">Connect Elara</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">No- Capital Avenue, Opp SBI, Hamilton Circle Statebank, Mangaluru-575001.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">277</td>
<td style="color:#008000" width="268">Davanam Constructions Private Limited</td>
<td style="color:#008000" width="223">Davanam Construction</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 148, Embassy Square, Infantry Road, Infantry Road, Bengaluru-560001.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">278</td>
<td style="color:#008000" width="268">Sonestaa Group</td>
<td style="color:#008000" width="223">Sonestaa Silver Oak</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 94/2, 94/3, 94/4, 41, Bellandur village, Varthur hobli, Bengaluru-560103.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">279</td>
<td style="color:#008000" width="268">SLV Housing Development Corporation</td>
<td style="color:#008000" width="223">Gokul Gardens</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 1, Sri Krishna Mansion, Chunchagatta Main Road,&nbsp;New Bank colony, Konanakunte, Bangaluru-560062.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">280</td>
<td style="color:#008000" width="268">SLV Housing Development Corporation</td>
<td style="color:#008000" width="223">Sri Krishna Gardens</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 1, Sri Krishna Mansion, Chunchagatta Main Road,&nbsp;New Bank colony, Konanakunte, Bangaluru-560062.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">281</td>
<td style="color:#008000" width="268">SLV Housing Development Corporation</td>
<td style="color:#008000" width="223">Sri Lakshmi Gardens</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 1, Sri Krishna Mansion, Chunchagatta Main Road,&nbsp;New Bank colony, Konanakunte, Bangaluru-560062.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">282</td>
<td style="color:#008000" width="268">SLV Housing Development Corporation</td>
<td style="color:#008000" width="223">Sri Shruthi Gardens</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 1, Sri Krishna Mansion, Chunchagatta Main Road,&nbsp;New Bank colony, Konanakunte, Bangaluru-560062.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">283</td>
<td style="color:#008000" width="268">Sri Srinivasa</td>
<td style="color:#008000" width="223">Spring Hills</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 45, 1st Floor, 18th Main, 3rd Sector, HSR Layout, Bengaluru - 560102</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">284</td>
<td style="color:#008000" width="268">Sri balaji builders And Developers,</td>
<td style="color:#008000" width="223">Jaitra Towers</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 887, 19th Main, Ideal Homes Township, Rajrajeshwari nagar,&nbsp;Bengaluru-560098</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">285</td>
<td style="color:#008000" width="268">BHAGYASHREE DEVELOPERS</td>
<td style="color:#008000" width="223">BDS GOLDEN RETREAT</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">No 1, Srihari Towers5th "A" Main Road, (Next to Baptist Hospital) Hebbal, Bengaluru - 560024</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">286</td>
<td style="color:#008000" width="268">BHAGYASHREE DEVELOPERS</td>
<td style="color:#008000" width="223">BDS SHABARI NAGAR PHASE 1 &amp; 2</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">No 1, Srihari Towers5th "A" Main Road, (Next to Baptist Hospital) Hebbal, Bengaluru - 560024</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">287</td>
<td style="color:#008000" width="268">BHAGYASHREE DEVELOPERS</td>
<td style="color:#008000" width="223">BDS LAYOUT</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">No 1, Srihari Towers5th "A" Main Road, (Next to Baptist Hospital) Hebbal, Bengaluru - 560024</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">288</td>
<td style="color:#008000" width="268">BHAGYASHREE DEVELOPERS</td>
<td style="color:#008000" width="223">BDS NAGAR</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">No 1, Srihari Towers5th "A" Main Road, (Next to Baptist Hospital) Hebbal, Bengaluru - 560024</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">289</td>
<td style="color:#008000" width="268">BHAGYASHREE DEVELOPERS</td>
<td style="color:#008000" width="223">BDS GARDEN</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">No 1, Srihari Towers5th "A" Main Road, (Next to Baptist Hospital) Hebbal, Bengaluru - 560024</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">290</td>
<td style="color:#008000" width="268">BHAGYASHREE DEVELOPERS</td>
<td style="color:#008000" width="223">BHAGYASHREE ROYALE</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">No 1, Srihari Towers5th "A" Main Road, (Next to Baptist Hospital) Hebbal, Bengaluru - 560024</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">291</td>
<td style="color:#008000" width="268">BHAGYASHREE DEVELOPERS</td>
<td style="color:#008000" width="223">BDS RESIDENCY</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">No 1, Srihari Towers5th "A" Main Road, (Next to Baptist Hospital) Hebbal, Bengaluru - 560024</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">292</td>
<td style="color:#008000" width="268">BHAGYASHREE DEVELOPERS</td>
<td style="color:#008000" width="223">BHAGYASHREE DEFENSE ENCLAVE</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">No 1, Srihari Towers5th "A" Main Road, (Next to Baptist Hospital) Hebbal, Bengaluru - 560024</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">293</td>
<td style="color:#008000" width="268">Bhadra Landmarks Pvt Ltd</td>
<td style="color:#008000" width="223">sujay Apex</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 59/4, "BHADRA", 1st Floor, Market Rd, Basavanagudi, Bengaluru-560004</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">294</td>
<td style="color:#008000" width="268">Bhadra Landmarks Pvt Ltd</td>
<td style="color:#008000" width="223">Bhadara City</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 59/4, "BHADRA", 1st Floor, Market Rd, Basavanagudi, Bengaluru-560004</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">295</td>
<td style="color:#008000" width="268">Bhadra Landmarks Pvt Ltd</td>
<td style="color:#008000" width="223">Girinagar plots</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 59/4, "BHADRA", 1st Floor, Market Rd, Basavanagudi, Bengaluru-560004</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">296</td>
<td style="color:#008000" width="268">Sonestaa Group</td>
<td style="color:#008000" width="223">Sonestaa iWoods</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 94/2, 94/3, 94/4, 41, Bellandur village, Varthur hobli, <br /> Bengaluru-560103.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">297</td>
<td style="color:#008000" width="268">Sonestaa Group</td>
<td style="color:#008000" width="223">Sonestaa Meadows</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 94/2, 94/3, 94/4, 41, Bellandur village, Varthur hobli, <br /> Bengaluru-560103.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">298</td>
<td style="color:#008000" width="268">S.SUDHAKAR</td>
<td style="color:#008000" width="223">VAHE PROJECTS LTD</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">SITE NO. 1 SY NO29/1 3RD CROSS, NARAYANAPPA BADAWANE, BEHIND VARTHUR HIGH SCHOOL, VARTHUR, BANGALORE 560087</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">299</td>
<td style="color:#008000" width="268">VANISHREE BUILDERS</td>
<td style="color:#008000" width="223">Sai Ram apartment</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481">Vinayak Complex, 1st main, 2nd cross, Jayanagar, Dharwad-580003.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">300</td>
<td style="color:#008000" width="268">SHRIVASA VENTURES</td>
<td style="color:#008000" width="223">Skandashri Paradise</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 92, Kumar Mansion, 2nd Floor, 22nd Main Raod, Near BSK BDA Complex, Banashankari 2nd Stage, Bengaluru-560070.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">301</td>
<td style="color:#008000" width="268">SHRIVASA VENTURES</td>
<td style="color:#008000" width="223">Skandashri 2</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 92, Kumar Mansion, 2nd Floor, 22nd Main Raod, Near BSK BDA Complex, Banashankari 2nd Stage, Bengaluru-560070.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">302</td>
<td style="color:#008000" width="268">SHRIVASA VENTURES</td>
<td style="color:#008000" width="223">Blue Bells</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 92, Kumar Mansion, 2nd Floor, 22nd Main Raod, Near BSK BDA Complex, Banashankari 2nd Stage, Bengaluru-560070.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td style="color:#008000" width="57">303</td>
<td style="color:#008000" width="268">SHRIVASA VENTURES</td>
<td style="color:#008000" width="223">Shrivasa Palm greens</td>
<td style="color:#008000" width="200">Reply Received but Not Satisfactory&nbsp;</td>
<td style="color:#008000" width="481"># 92, Kumar Mansion, 2nd Floor, 22nd Main Raod, Near BSK BDA Complex,&nbsp;Banashankari 2nd Stage Bengaluru-560070.</td>
<td style="color:#008000" width="183">11-05-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">304</td>
<td width="164" style="font-weight: 400;">Accent Properties Builders &amp; Developers </td>
<td width="170" style="font-weight: 400;">UR Castle</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">209, 45th Cross, Near-Sangam Circle, <br /> Jayanagar 8th Block, 8th Block, Jayanagar, Bengaluru, Karnataka 560082</td>
<td>07-05-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">305</td>
<td width="164" style="font-weight: 400;">Accent Properties Builders &amp; Developers </td>
<td width="170" style="font-weight: 400;">A B City</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">209, 45th Cross, Near-Sangam Circle, <br /> Jayanagar 8th Block, 8th Block, Jayanagar, Bengaluru, Karnataka 560082</td>
<td>07-05-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">306</td>
<td width="164" style="font-weight: 400;">Accent Properties Builders &amp; Developers </td>
<td width="170" style="font-weight: 400;">Reddy Layout</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">209, 45th Cross, Near-Sangam Circle, <br /> Jayanagar 8th Block, 8th Block, Jayanagar, Bengaluru, Karnataka 560082</td>
<td>07-05-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">307</td>
<td width="164" style="font-weight: 400;">Richmond Builders Pvt Ltd.</td>
<td width="170" style="font-weight: 400;">Richmond Pride</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">#702,1st Floor, 33rd Cross,<br /> 10th main,4th Block,<br /> Jaya Nagar, BANGALORE-560011</td>
<td>07-05-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">308</td>
<td width="164" style="font-weight: 400;">Richmond Builders Pvt Ltd.</td>
<td width="170" style="font-weight: 400;">RICH MOND LAKE VIEW</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">#702,1st Floor, 33rd Cross,<br /> 10th main,4th Block,<br /> Jaya Nagar, BANGALORE-560011</td>
<td>07-05-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">309</td>
<td width="164" style="font-weight: 400;">Aisshwarya Group</td>
<td width="170" style="font-weight: 400;">AISSHWARYA SAMSKRUTHI</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">No.495, Aisshwarya Icon,<br /> &nbsp;Level 4, C.M.H Road, <br /> Indiranagar, Bangalore - 560038</td>
<td>07-05-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">310</td>
<td width="164" style="font-weight: 400;">AVANI BUILDERS</td>
<td width="170" style="font-weight: 400;">Avani Gardens</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">#251/3, Manipal Hospital <br /> Main Road, BEML 5th Stage, <br /> 1st Phase,Rajarajeshwari Nagar</td>
<td>07-05-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">311</td>
<td width="164" style="font-weight: 400;">AVANI BUILDERS</td>
<td width="170" style="font-weight: 400;">Avani Hills</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">#251/3, Manipal Hospital <br /> Main Road, BEML 5th Stage, <br /> 1st Phase,Rajarajeshwari Nagar</td>
<td>07-05-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">312</td>
<td width="164" style="font-weight: 400;">BSR Developers</td>
<td width="170" style="font-weight: 400;">Akruthi Green Woods Phase - I</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Sri Manjunatha Arcade, <br /> No.669, 2nd Floor, 9th Main,<br /> Vll Sector, HSR Layout, <br /> Bangalore - 560102.</td>
<td>07-05-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">313</td>
<td width="164" style="font-weight: 400;">BSR Developers</td>
<td width="170" style="font-weight: 400;">Akruthi Green Woods Phase - II</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Sri Manjunatha Arcade, No.669, <br /> 2nd Floor, 9th Main,<br /> Vll Sector, HSR Layout,<br /> &nbsp;Bangalore - 560102.</td>
<td>07-05-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">314</td>
<td width="164" style="font-weight: 400;">Aakruti Group</td>
<td width="170" style="font-weight: 400;">Aakruti Amity.</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Aakruti Amity, Ananth Nagar Phase II, <br /> Huskur Gate, <br /> Hosur Main Road, Bangalore - 560100.</td>
<td>07-05-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">315</td>
<td width="164" style="font-weight: 400;">Mithraa Builders and Developers,</td>
<td width="170" style="font-weight: 400;">Nobi Homes phase-2</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">C7, Kudremukh Colony, <br /> Koramangala 2ndBlock, Surjapura Road, <br /> Opp-Amity School, Near Water Tank, <br /> Bangalore - 560034</td>
<td>07-05-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">316</td>
<td width="164" style="font-weight: 400;">Saroj Builds &amp; Properties Pvt Ltd</td>
<td width="170" style="font-weight: 400;">Saroj Harmony</a></td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Saroj Square, 1st Floor, #1, Silver Spring Road, <br /> Marathahalli, Near Kundalahalli Gate, <br /> Bangalore 560037,</td>
<td>07-05-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">317</td>
<td width="164" style="font-weight: 400;">Saroj Builds &amp; Properties Pvt Ltd</td>
<td width="170" style="font-weight: 400;">Saroj Daffodils</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Saroj Square, 1st Floor, #1, Silver Spring Road, <br /> Marathahalli, Near Kundalahalli Gate, <br /> Bangalore 560037,</td>
<td>07-05-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">318</td>
<td width="164" style="font-weight: 400;">Radiant Structures Private Limited</td>
<td width="170" style="font-weight: 400;">White Orchid</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Sathyams&rdquo;, #48/49, 1st Floor, <br /> 9th Cross, Sarakki Main Road <br /> Opp. Rajashekar Hospital, <br /> J.P. Nagar 1st Phase, <br /> Bangalore-560 078</td>
<td>07-05-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">319</td>
<td width="164" style="font-weight: 400;">Radiant Structures Private Limited</td>
<td width="170" style="font-weight: 400;">RADIANT ELITAIRE,</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Sathyams&rdquo;, #48/49, 1st Floor, <br /> 9th Cross, Sarakki Main Road <br /> Opp. Rajashekar Hospital, <br /> J.P. Nagar 1st Phase, <br /> Bangalore-560 078</td>
<td>07-05-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">320</td>
<td width="164" style="font-weight: 400;">Radiant Structures Private Limited</td>
<td width="170" style="font-weight: 400;">RADIANT HERITAGE,</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Sathyams&rdquo;, #48/49, 1st Floor, <br /> 9th Cross, Sarakki Main Road <br /> Opp. Rajashekar Hospital, <br /> J.P. Nagar 1st Phase, <br /> Bangalore-560 078</td>
<td>07-05-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">321</td>
<td width="164" style="font-weight: 400;">Radiant Structures Private Limited</td>
<td width="170" style="font-weight: 400;">RADIANT ROYAL WOODS,</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Sathyams&rdquo;, #48/49, 1st Floor, <br /> 9th Cross, Sarakki Main Road <br /> Opp. Rajashekar Hospital, <br /> J.P. Nagar 1st Phase, <br /> Bangalore-560 078</td>
<td>07-05-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">322</td>
<td width="164" style="font-weight: 400;">Radiant Structures Private Limited</td>
<td width="170" style="font-weight: 400;">RADIANT SILVER BELL II,</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Sathyams&rdquo;, #48/49, 1st Floor, <br /> 9th Cross, Sarakki Main Road <br /> Opp. Rajashekar Hospital, <br /> J.P. Nagar 1st Phase, <br /> Bangalore-560 078</td>
<td>07-05-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">323</td>
<td width="164" style="font-weight: 400;">Radiant Structures Private Limited</td>
<td width="170" style="font-weight: 400;">RADIANT LAKE VIEW,</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Sathyams&rdquo;, #48/49, 1st Floor, <br /> 9th Cross, Sarakki Main Road <br /> Opp. Rajashekar Hospital, <br /> J.P. Nagar 1st Phase, <br /> Bangalore-560 078</td>
<td>07-05-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">324</td>
<td width="164" style="font-weight: 400;">Radiant Structures Private Limited</td>
<td width="170" style="font-weight: 400;">RADIANT JASMINE TERRACE</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Sathyams&rdquo;, #48/49, 1st Floor,<br /> 9th Cross, Sarakki Main Road<br /> Opp. Rajashekar Hospital,<br /> J.P. Nagar 1st Phase,<br /> Bangalore-560 078</td>
<td>07-05-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">325</td>
<td width="164" style="font-weight: 400;">Radiant Structures Private Limited</td>
<td width="170" style="font-weight: 400;">RADIANT KAREL</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Sathyams&rdquo;, #48/49, 1st Floor, <br /> 9th Cross, Sarakki Main Road <br /> Opp. Rajashekar Hospital, <br /> J.P. Nagar 1st Phase, <br /> Bangalore-560 078</td>
<td>07-05-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">326</td>
<td width="164" style="font-weight: 400;">Global Developers</td>
<td width="170" style="font-weight: 400;">Golden Pearl Villas</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Dusit Towers, 2nd Floor, No-14 <br /> BTM Layout 1st Stage <br /> Bangalore, Karnataka 560068</td>
<td>07-05-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">327</td>
<td width="164" style="font-weight: 400;">Global Developers</td>
<td width="170" style="font-weight: 400;">Global Sunrise</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Dusit Towers, 2nd Floor, No-14 <br /> BTM Layout 1st Stage <br /> Bangalore, Karnataka 560068</td>
<td>07-05-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">328</td>
<td width="164" style="font-weight: 400;">Global Developers</td>
<td width="170" style="font-weight: 400;">Global Paradise</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Dusit Towers, 2nd Floor, No-14 <br /> BTM Layout 1st Stage <br /> Bangalore, Karnataka 560068</td>
<td>07-05-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">329</td>
<td width="164" style="font-weight: 400;">L G Builders &amp; developers pvt ltd</td>
<td width="170" style="font-weight: 400;">LG Tranquil Woods</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">No. 427/1782, 1783, 1804 <br /> 1st Stage, 5th Block, 15th Main, <br /> HBR Layout, Hennur-Hebbal Ring Road, <br /> Bengaluru &ndash; 560 043,</td>
<td>07-05-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">330</td>
<td width="164" style="font-weight: 400;">L G Builders &amp; developers pvt ltd</td>
<td width="170" style="font-weight: 400;">LG Green County</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">No. 427/1782, 1783, 1804 <br /> 1st Stage, 5th Block, 15th Main, <br /> HBR Layout, Hennur-Hebbal Ring Road, <br /> Bengaluru &ndash; 560 043,&nbsp;</td>
<td>07-05-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">331</td>
<td width="164" style="font-weight: 400;">DNR CORPORATION PVT. LTD.</td>
<td width="170" style="font-weight: 400;">DNR Atmosphere</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">231/66, Main Varthur Road <br /> Ramagundanhalli <br /> Whitefield, Bengaluru-560066 </td>
<td>07-05-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">332</td>
<td width="164" style="font-weight: 400;">Aashrithaa Properties Pvt Ltd</td>
<td width="170" style="font-weight: 400;">VENUS COUNTY PREMIUM</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"><br /> #785/10, 2nd Floor,14th cross, Above Adlabs,Jayanagar 7th block, K.R. road,, Bangalore-560082</td>
<td>07-05-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">333</td>
<td width="164" style="font-weight: 400;">ADITYA CONSTRUCTIONS</td>
<td width="170" style="font-weight: 400;">ADITYA SUNSHINE</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"><br /> #610, 4th Floor, Vandana Arcade<br /> 10th A Main Road, 4th block<br /> Jayanagar, Bangalore - 560 011</td>
<td width="101">30-04-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">334</td>
<td width="164" style="font-weight: 400;">ADITYA CONSTRUCTIONS</td>
<td width="170" style="font-weight: 400;">VKR GLORY</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">ADITYA CONSTRUCTIONS<br /> #610, 4th Floor, Vandana Arcade<br /> 10th A Main Road, 4th block<br /> Jayanagar, Bangalore - 560 011</td>
<td width="101">30-04-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">335</td>
<td width="164" style="font-weight: 400;">ADITYA CONSTRUCTIONS</td>
<td width="170" style="font-weight: 400;">ADITYA OM ENCLAVE</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">ADITYA CONSTRUCTIONS<br /> #610, 4th Floor, Vandana Arcade<br /> 10th A Main Road, 4th block<br /> Jayanagar, Bangalore - 560 011</td>
<td width="101">30-04-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">336</td>
<td width="164" style="font-weight: 400;">ADITYA CONSTRUCTIONS</td>
<td width="170" style="font-weight: 400;">ADITYA ENCLAVE</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">ADITYA CONSTRUCTIONS<br /> #610, 4th Floor, Vandana Arcade<br /> 10th A Main Road, 4th block<br /> Jayanagar, Bangalore - 560 011</td>
<td width="101">30-04-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">337</td>
<td width="164" style="font-weight: 400;">ADITYA CONSTRUCTIONS</td>
<td width="170" style="font-weight: 400;">ADITYA SHANTHA LAKSHMI</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">ADITYA CONSTRUCTIONS<br /> #610, 4th Floor, Vandana Arcade<br /> 10th A Main Road, 4th block<br /> Jayanagar, Bangalore - 560 011</td>
<td width="101">30-04-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">338</td>
<td width="164" style="font-weight: 400;">Aarya Sai greens</td>
<td width="170" style="font-weight: 400;">Aarya Sai greens</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Sri.J gopal .reddy S/o of Jayarama reddy , Sy.no 61, 2nd cross,B.C.M layout,Muthsandra road, Varthur, Bangalore-560087</td>
<td width="101">30-04-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">339</td>
<td width="164" style="font-weight: 400;">Gravity Residents </td>
<td width="170" style="font-weight: 400;">Gravity temple bells</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Gravity Residents,<br /> Gravity temple bell.<br /> singapur Paradise,<br /> vidyaranyapura PO<br /> Bangalore-97</td>
<td width="101">30-04-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">340</td>
<td width="164" style="font-weight: 400;">Dreamz GK Infra india Pvt Ltd</td>
<td width="170" style="font-weight: 400;">Deramz Sampoorna</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">disha chaaudhry,M.D ( dreamz infra India Pvt lTD) #S8, 2ND FLOOR, AISHWARYA RESIDENCY 1ST CROSS, oPP.wATER TANK,btm LST BLOCK, BANGALORE- 560053</td>
<td width="101">30-04-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">341</td>
<td width="164" style="font-weight: 400;">MRKR constrictions And Industries Pvt Ltd</td>
<td width="170" style="font-weight: 400;">Mera homes apartments</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">survey No. 118/2, 132 &amp; 133, Seegaehalli Village, Whitefield, Bangalore, Karnataka, INDIA.</td>
<td width="101">30-04-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">342</td>
<td width="164" style="font-weight: 400;">VAASTU DEVELOPERS &amp; PROMOTERS</td>
<td width="170" style="font-weight: 400;">VAASTU NAGAR PHASE - 1</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">No. #34, Ground Floor, 1st Cross, G- Block, <br /> <br /> Behind Big Market, Sahakara nagar Bangalore-5600 092</td>
<td width="101">30-04-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">343</td>
<td width="164" style="font-weight: 400;">VAASTU DEVELOPERS &amp; PROMOTERS</td>
<td width="170" style="font-weight: 400;">Sri Shirdi Sai Vaastu Nagar</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">"No. #34, Ground Floor, 1st Cross, G- Block, <br /> <br /> Behind Big Market, Sahakara nagar Bangalore-5600 092"</td>
<td width="101">30-04-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">344</td>
<td width="164" style="font-weight: 400;">severaj estates agency</td>
<td width="170" style="font-weight: 400;">severaj estates agency</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Madison Complex 3rd floor,no1 kodihalli Main road banglore- 560008</td>
<td width="101">30-04-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">345</td>
<td width="164" style="font-weight: 400;">Puja Mega structure pvt Ltd</td>
<td width="170" style="font-weight: 400;">Puja Navarathna</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">#408/B, 24th cross, 13th main, banashankari 2nd stage, bangalore-560070</td>
<td width="101">30-04-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">346</td>
<td width="164" style="font-weight: 400;">koteswara Rao Podapati</td>
<td width="170" style="font-weight: 400;">shivani sunshine</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">#56, office room, shivani sunshine, central jail road, chudasandra Anekal Taluk, sarjapura hobli, near chudasandra circle, banglore- 560099</td>
<td width="101">30-04-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">347</td>
<td width="164" style="font-weight: 400;">vivek Fernandes</td>
<td width="170" style="font-weight: 400;">Vellankanni heights</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">2nd floor, Assisi Complex Bejai, Church road, Bejai, mangaluru,575004</td>
<td width="101">30-04-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">348</td>
<td width="164" style="font-weight: 400;">BSNL Employee's Welfare House Building Co-operative Society Ltd.,</td>
<td width="170" style="font-weight: 400;">BSNL Sri Sai City</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">No.19(New No.32), 1st Floor, 10th Cross, Sampige Road , Malleswaram, Bangalore-560003.</td>
<td width="101">30-04-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">349</td>
<td width="164" style="font-weight: 400;">BSNL Employee's Welfare House Building Co-operative Society Ltd.,</td>
<td width="170" style="font-weight: 400;">Amurutha Sarovara Layout</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">No.19(New No.32), 1st Floor, 10th Cross, Sampige Road , Malleswaram, Bangalore-560003.</td>
<td width="101">30-04-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">350</td>
<td width="164" style="font-weight: 400;">BSNL Employee's Welfare House Building Co-operative Society Ltd.,</td>
<td width="170" style="font-weight: 400;">Raj Residency</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">No.19(New No.32), 1st Floor, 10th Cross, Sampige Road , Malleswaram, Bangalore-560003.</td>
<td width="101">30-04-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">351</td>
<td width="164" style="font-weight: 400;">BSNL Employee's Welfare House Building Co-operative Society Ltd.,</td>
<td width="170" style="font-weight: 400;">BSNL Nandi Hills Residency</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">No.19(New No.32), 1st Floor, 10th Cross, Sampige Road , Malleswaram, Bangalore-560003.</td>
<td width="101">30-04-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">352</td>
<td width="164" style="font-weight: 400;">BSNL Employee's Welfare House Building Co-operative Society Ltd.,</td>
<td width="170" style="font-weight: 400;">TripuraSundari Nagara</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">No.19(New No.32), 1st Floor, 10th Cross, Sampige Road , Malleswaram, Bangalore-560003.</td>
<td width="101">30-04-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">353</td>
<td width="164" style="font-weight: 400;">BSNL Employee's Welfare House Building Co-operative Society Ltd.,</td>
<td width="170" style="font-weight: 400;">Maadhava Nagar Phase I</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">No.19(New No.32), 1st Floor, 10th Cross, Sampige Road , Malleswaram, Bangalore-560003.</td>
<td width="101">30-04-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">354</td>
<td width="164" style="font-weight: 400;">BSNL Employee's Welfare House Building Co-operative Society Ltd.,</td>
<td width="170" style="font-weight: 400;">Maadhava Nagar Phase II</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">No.19(New No.32), 1st Floor, 10th Cross, Sampige Road , Malleswaram, Bangalore-560003.</td>
<td width="101">30-04-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">355</td>
<td width="164" style="font-weight: 400;">BSNL Employee's Welfare House Building Co-operative Society Ltd.,</td>
<td width="170" style="font-weight: 400;">BSNL Sun City</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">No.19(New No.32), 1st Floor, 10th Cross, Sampige Road , Malleswaram, Bangalore-560003.</td>
<td width="101">30-04-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">356</td>
<td width="164" style="font-weight: 400;">BSNL Employee's Welfare House Building Co-operative Society Ltd.,</td>
<td width="170" style="font-weight: 400;">BSNL SRINAGAR</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">No.19(New No.32), 1st Floor, 10th Cross, Sampige Road , Malleswaram, Bangalore-560003.</td>
<td width="101">30-04-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">357</td>
<td width="164" style="font-weight: 400;">GRAND MAJESTIC MALL,</td>
<td width="170" style="font-weight: 400;">GRAND MAJESTIC MALL,</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"><br /> &nbsp; #12, 2nd Cross, 6th Main, opp.Gubbi veeranna Theatre, Gandhinagar , Bangalore-560009. <br /> </td>
<td width="101">30-04-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">358</td>
<td width="164" style="font-weight: 400;">ADITYA CONSTRUCTIONS</td>
<td width="170" style="font-weight: 400;">ADITYA MOTHER PALACE</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">ADITYA CONSTRUCTIONS #610, 4th Floor, Vandana Arcade 10th A Main Road, 4th block Jayanagar, Bangalore - 560 011</td>
<td>11-04-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">359</td>
<td width="164" style="font-weight: 400;">ND Developers Pvt Ltd,</td>
<td width="170" style="font-weight: 400;">N D Passion Elite</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 398, 1st &amp; 2nd Floor, 7th Cross Mico Layout, <br /> BTM Layout 2nd stage, Bangalore - 560076.</td>
<td>11-04-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">360</td>
<td width="164" style="font-weight: 400;">ND Developers Pvt Ltd,</td>
<td width="170" style="font-weight: 400;">N D Passion Pent house</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 398, 1st &amp; 2nd Floor, 7th Cross Mico Layout, <br /> BTM Layout 2nd stage, Bangalore - 560076.</td>
<td>11-04-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">361</td>
<td width="164" style="font-weight: 400;">Virani Group</td>
<td width="170" style="font-weight: 400;">Lake Mist</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 10/5, JRK Gardens,State bank Colony,Opp. petrol Bunk, <br /> Anandpura, T.C.Palya,Bangalore &ndash; 560036.</td>
<td>11-04-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">362</td>
<td width="164" style="font-weight: 400;">Virani Group</td>
<td width="170" style="font-weight: 400;">JRK Gardens</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 10/5, JRK Gardens,State bank Colony,Opp. petrol Bunk, <br /> Anandpura, T.C.Palya,Bangalore &ndash; 560036.</td>
<td>11-04-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">363</td>
<td width="164" style="font-weight: 400;">Aaiera Builders &amp; Developers</td>
<td width="170" style="font-weight: 400;">Aaiera pelican</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 21, 80 feet Road, 5th Block Koramangala, <br /> Bengaluru-560095</td>
<td>11-04-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">364</td>
<td width="164" style="font-weight: 400;">Aashrithaa Properties Pvt. Ltd.</td>
<td width="170" style="font-weight: 400;">VENUS COUNTY PREMIUM</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 785/10, 2nd Floor, 14th Cross, Jayanagar 7th block, KR Road, Bangalore-560082</td>
<td>11-04-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">365</td>
<td width="164" style="font-weight: 400;">Aashrithaa Properties Pvt. Ltd.</td>
<td width="170" style="font-weight: 400;">NAKSHATRA TOWNSHIP</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 785/10, 2nd Floor, 14th Cross, Jayanagar 7th block, KR Road, Bangalore-560082</td>
<td>11-04-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">366</td>
<td width="164" style="font-weight: 400;">Akme Projects Limited</td>
<td width="170" style="font-weight: 400;">Akme Encore</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 1146, 12th Main, 1st Cross, HAL II Stage <br /> Indira Nagar, Bangalore-560038.</td>
<td>11-04-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">367</td>
<td width="164" style="font-weight: 400;">Akme Projects Limited</td>
<td width="170" style="font-weight: 400;">Encore Commercial</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 1146, 12th Main, 1st Cross, HAL II Stage <br /> Indira Nagar, Bangalore-560038.</td>
<td>11-04-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">368</td>
<td width="164" style="font-weight: 400;">Bridravana city belagavi</td>
<td width="170" style="font-weight: 400;">bridavana pride block iii</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Bridavana City, H.S Patil Complex, 2nd Floor, Next to HDFC Bank, Congress Road, Belgavi-590006.</td>
<td>11-04-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">369</td>
<td width="164" style="font-weight: 400;">Stalin Abraham</td>
<td width="170" style="font-weight: 400;">ABODE BREEZE</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">ABODE CREATIONS Pvt ltd , # 787, 4th Cross, 16th Main, BTM 2nd Stage, Bangalore- 560076</td>
<td>11-04-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">370</td>
<td width="164" style="font-weight: 400;">M/S nitesh Estates Limited</td>
<td width="170" style="font-weight: 400;">nitesh british columbia</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">7th Floor, Nitesh Timessquare, # 8, M.G Road, <br /> Bangalore- 560001.</td>
<td>11-04-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">371</td>
<td width="164" style="font-weight: 400;">Sipani properties Pvt Ltd</td>
<td width="170" style="font-weight: 400;">Sipani bliss phase2</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 439, 18th Main, 6th Block, Kormanagala, <br /> Bangalore-560095</td>
<td>11-04-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">372</td>
<td width="164" style="font-weight: 400;">AK Maxx Properties &amp;Aastha Properties</td>
<td width="170" style="font-weight: 400;">Sai Golden Orchids</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 222, 3rd Floor, 80 Feet Road, 12th Block, Nagarbhavi, Near Namura Thindi Hotel, Bangalore-560072</td>
<td>11-04-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">373</td>
<td width="164" style="font-weight: 400;">Patel Realty</td>
<td width="170" style="font-weight: 400;">Townsvile new town</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Patel Realty , 5th floor, Onxy Center, n.5 museum Road, Bangalore- 560001</td>
<td>11-04-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">374</td>
<td width="164" style="font-weight: 400;">Patel Realty</td>
<td width="170" style="font-weight: 400;">Townsvile new town</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Patel Realty , 5th floor, Onxy Center, n.5 museum Road, Bangalore- 560001</td>
<td>11-04-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">375</td>
<td width="164" style="font-weight: 400;">Sree Shivashakti Properties</td>
<td width="170" style="font-weight: 400;">Sree Shivashakti Properties</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Shree Shivashakti Properties, Metro Mall, Near City Bus Stand, Hubli-Dharwad-580023</td>
<td>11-04-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">376</td>
<td width="164" style="font-weight: 400;">PRAVEEN KUMAR B E</td>
<td width="170" style="font-weight: 400;">PRABHAVATHI COMFORTS</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 27/89, 4th &lsquo;B&rsquo; Cross, 30th Main, <br /> BTM Layout II Stage, Bangalore- 560076&nbsp;</td>
<td>11-04-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">377</td>
<td width="164" style="font-weight: 400;">M/S GGR Housing India Pvt Ltd,</td>
<td width="170" style="font-weight: 400;">Peram Adithya Grand Layout,</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Sri Perm Giri Director Of Peram Adithya Grand Layout, <br /> M/S GGR Housing India Pvt Ltd, # 217/A 3rd Main road, East of NGEF, Kasturi Nagar, Bangalore - 560043</td>
<td>11-04-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">378</td>
<td width="164" style="font-weight: 400;">Premier Properties</td>
<td width="170" style="font-weight: 400;">Premier Properties</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">M.B Nagakumar Properties Premier Properties, <br /> # 2270/1, Chittarajan Mahal, Vinoba Road, Jayalakshmipuram, Mysore-570012&nbsp;</td>
<td>11-04-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">379</td>
<td width="164" style="font-weight: 400;">Kristal Groups India Ltd</td>
<td width="170" style="font-weight: 400;">Kristal traven</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Latha K Nambodari, Kristal Groups India Ltd, <br /> Bellenduru Village, Bellanduru.</td>
<td>11-04-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">380</td>
<td width="164" style="font-weight: 400;">UJJWALA PROPERTIES,</td>
<td width="170" style="font-weight: 400;">UJJWALA VINAYAKA LAYOUT</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 13, KVR Arcade, 3rd Floor, 1st Main Road, <br /> Goraguntepalya, Behind Gokuldas Images,<br /> Yeshwanthpur, BANGALORE-560022</td>
<td>11-04-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">381</td>
<td width="164" style="font-weight: 400;">UJJWALA PROPERTIES,</td>
<td width="170" style="font-weight: 400;">UJJWALA VINAYAKA LAYOUT phase-2</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 13, KVR Arcade, 3rd Floor, 1st Main Road, <br /> Goraguntepalya, Behind Gokuldas Images,<br /> Yeshwanthpur, BANGALORE-560022</td>
<td>11-04-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">382</td>
<td width="164" style="font-weight: 400;">UJJWALA PROPERTIES,</td>
<td width="170" style="font-weight: 400;">UJJWALA SHANTHINIKETHANA</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 13, KVR Arcade, 3rd Floor, 1st Main Road, <br /> Goraguntepalya, Behind Gokuldas Images,<br /> Yeshwanthpur, BANGALORE-560022</td>
<td>11-04-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">383</td>
<td width="164" style="font-weight: 400;">Saravana Buildwell Pvt. Ltd.</td>
<td width="170" style="font-weight: 400;">ESPLANADE</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 1, 2nd Floor, G P Complex, 1st Main, RMV 2nd Stage, <br /> New BEL Road, Bangalore-560094.</td>
<td>23-03-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">384</td>
<td width="164" style="font-weight: 400;">Saravana Buildwell Pvt. Ltd.</td>
<td width="170" style="font-weight: 400;">TRANQUIL HEIGHTS</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 1, 2nd Floor, G P Complex, 1st Main, RMV 2nd Stage, <br /> New BEL Road, Bangalore-560094.</td>
<td>23-03-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">385</td>
<td width="164" style="font-weight: 400;">YGAM BUILDERS AND DEVELOPERS</td>
<td width="170" style="font-weight: 400;">Royal Embassy</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 16/39, 2nd Main, KGS Layout, Near ST. Mary&rsquo;s School,<br /> Vijaynagar, Bangalore &ndash; 560040.</td>
<td>23-03-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">386</td>
<td width="164" style="font-weight: 400;">Pragathi Developers</td>
<td width="170" style="font-weight: 400;">Pragathi Royale-II</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 692, 1st Floor, 17th Cross, 26th Main,<br /> beside nandini hotel, Opp: Green city hospital, 6th Phase, J.P Nagar, Bengaluru - 560078</td>
<td>23-03-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">387</td>
<td width="164" style="font-weight: 400;">Pragathi Developers</td>
<td width="170" style="font-weight: 400;">Pragathi Sindhoor</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 692, 1st Floor, 17th Cross, 26th Main,<br /> beside nandini hotel, Opp: Green city hospital, 6th Phase, J.P Nagar, Bengaluru - 560078</td>
<td>23-03-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">388</td>
<td width="164" style="font-weight: 400;">POWER HILLS</td>
<td width="170" style="font-weight: 400;">Samruddhi Uplands</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 51, Ground Floor, 18th Cross, HSR Layout,<br /> Sector 3, Bangalore &ndash; 560102.</td>
<td>23-03-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">389</td>
<td width="164" style="font-weight: 400;">POWER HILLS</td>
<td width="170" style="font-weight: 400;">Atlantis Breeze</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 51, Ground Floor, 18th Cross, HSR Layout,<br /> Sector 3, Bangalore &ndash; 560102.</td>
<td>23-03-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">390</td>
<td width="164" style="font-weight: 400;">&nbsp;Aastha Properties</td>
<td width="170" style="font-weight: 400;">DTCP Aprooved Sites near Kempegowda International Airport</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 1, 1st Stage,&nbsp; 3rd phase, 9th Cross, Chandralayout,<br /> Near Vijaya Bank, Behind Hotel Divar <br /> Bangalore-560040.</td>
<td>23-03-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">391</td>
<td width="164" style="font-weight: 400;">&nbsp;Aastha Properties</td>
<td width="170" style="font-weight: 400;">BMRDA approved sites in Mysore road&nbsp;</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 1, 1st Stage,&nbsp; 3rd phase, 9th Cross, Chandralayout,<br /> Near Vijaya Bank, Behind Hotel Divar <br /> Bangalore-560040.</td>
<td>23-03-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">392</td>
<td width="164" style="font-weight: 400;">&nbsp;Aastha Properties</td>
<td width="170" style="font-weight: 400;">BMRDA approved sites Near Nelamangala, Tumkur road&nbsp;</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 1, 1st Stage,&nbsp; 3rd phase, 9th Cross, Chandralayout,<br /> Near Vijaya Bank, Behind Hotel Divar <br /> Bangalore-560040.</td>
<td>23-03-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">393</td>
<td width="164" style="font-weight: 400;">&nbsp;Samrudhi Properties</td>
<td width="170" style="font-weight: 400;">Shree Jnanakshi Rajarajeshwari Layout&nbsp;</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 14, R R layout, Opp. HP Petrol Bunk,<br /> Nagadevanahalli, Kenchanapuracross bustop,<br /> Kengeri Outer Ring Road,<br /> Bengaluru-560056.</td>
<td>23-03-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">394</td>
<td width="164" style="font-weight: 400;">Durga Shree Ventures</td>
<td width="170" style="font-weight: 400;">DSV Banashankari Enclave</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 292, ANJANADRI, 11th BLOCK, 2nd Stage,<br /> Nagarbhavi, Bangalore-560072.</td>
<td>23-03-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">395</td>
<td width="164" style="font-weight: 400;">Durga Shree Ventures</td>
<td width="170" style="font-weight: 400;">DSV Muneshwara Enclave</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 292, ANJANADRI, 11th BLOCK, 2nd Stage,<br /> Nagarbhavi, Bangalore-560072.</td>
<td>23-03-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">396</td>
<td width="164" style="font-weight: 400;">Durga Shree Ventures</td>
<td width="170" style="font-weight: 400;">DSV Elite</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 292, ANJANADRI, 11th BLOCK, 2nd Stage,<br /> Nagarbhavi, Bangalore-560072.</td>
<td>23-03-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">397</td>
<td width="164" style="font-weight: 400;">Durga Shree Ventures</td>
<td width="170" style="font-weight: 400;">DSV Chowdeshwari Enclave</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 292, ANJANADRI, 11th BLOCK, 2nd Stage,<br /> Nagarbhavi, Bangalore-560072.</td>
<td>23-03-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">398</td>
<td width="164" style="font-weight: 400;">ANNCIYA ESTATES,</td>
<td width="170" style="font-weight: 400;">Annciya Serene&nbsp;</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 296/4,1st C Cross, Kormangala 1St Block,<br /> Near Asia Pacific School, Bangalore-560034.</td>
<td>23-03-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">399</td>
<td width="164" style="font-weight: 400;">GK builders and developers</td>
<td width="170" style="font-weight: 400;">Gokul Gardens</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 3/A, RAYAN INTERNATIONAL SCHOOL ROAD, OPP. TO NCC MISTY WOODS, JAYAMUNINAGAR, YELAHANKA, BANGALORE-560 063</td>
<td>16-03-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">400</td>
<td width="164" style="font-weight: 400;">Spatika Developers &amp; Construction Pvt Ltd,</td>
<td width="170" style="font-weight: 400;">Spatika Green park&nbsp;</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Hayavadana, # 322, 4th A Cross, OMBR Layout, <br /> Banasawadi, Bangalore-560043.</td>
<td>16-03-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">401</td>
<td width="164" style="font-weight: 400;">UPKAR GROUP&nbsp;</td>
<td width="170" style="font-weight: 400;">royal garden</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 28,&nbsp; 9th Cross , 2nd Block, RV College, Jayanagar, Bangalore&ndash;560011.</td>
<td>16-03-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">402</td>
<td width="164" style="font-weight: 400;">DS-MAX Properties Pvt.Ltd,</td>
<td width="170" style="font-weight: 400;">SKYGRAND</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 1854, 17th Main, 30th B Cross, 5th Block, HBR Layout, <br /> Near to Ring Road,&nbsp; Bengaluru- 560043.</td>
<td>16-03-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">403</td>
<td width="164" style="font-weight: 400;">DS-MAX Properties Pvt.Ltd,</td>
<td width="170" style="font-weight: 400;">SKYSUPREME</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 1854, 17th Main, 30th B Cross, 5th Block, HBR Layout, <br /> Near to Ring Road,&nbsp; Bengaluru- 560043.</td>
<td>16-03-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">404</td>
<td width="164" style="font-weight: 400;">Patel Realty</td>
<td width="170" style="font-weight: 400;">Townsvile new town</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Patel Realty , 5th floor, Onxy Center, n.5 museum Road, Bangalore- 560001</td>
<td>16-03-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">405</td>
<td width="164" style="font-weight: 400;">Promenade builders Pvt ltd</td>
<td width="170" style="font-weight: 400;">Promenade builders Pvt ltd</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">No.41/1, 2nd Main Road, Opp.rajesh Hotel, Vyalikaval Bangalore- 560003</td>
<td>16-03-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">406</td>
<td width="164" style="font-weight: 400;">Unishire Developers</td>
<td width="170" style="font-weight: 400;">unishire esplanade</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">No.36, railway parallel road neharu Nagar Bangalore- 560020</td>
<td>16-03-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">407</td>
<td width="164" style="font-weight: 400;">MN builders &amp; developers</td>
<td width="170" style="font-weight: 400;">MN Guru Akshitha</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 24/A, 1st Floor, 7th Cross, Nanjappa Garden, Babusapalya, Bangalore-560043.</td>
<td>16-03-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">408</td>
<td width="164" style="font-weight: 400;">MN builders &amp; developers</td>
<td width="170" style="font-weight: 400;">MN Guru Gokulam</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 24/A, 1st Floor, 7th Cross, Nanjappa Garden, Babusapalya, Bangalore-560043.</td>
<td>16-03-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">409</td>
<td width="164" style="font-weight: 400;">MN builders &amp; developers</td>
<td width="170" style="font-weight: 400;">MN Brindavanam</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 24/A, 1st Floor, 7th Cross, Nanjappa Garden, Babusapalya, Bangalore-560043.</td>
<td>16-03-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">410</td>
<td width="164" style="font-weight: 400;">MN builders &amp; developers</td>
<td width="170" style="font-weight: 400;">Hema Eternia</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 24/A, 1st Floor, 7th Cross, Nanjappa Garden, Babusapalya, Bangalore-560043.</td>
<td>16-03-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">411</td>
<td width="164" style="font-weight: 400;">Rays Rock Builders</td>
<td width="170" style="font-weight: 400;">Royal Enclave aparments</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 404 North block , Saptagiri Nivas 26th Main 6th Phase JP Nagar, Banagalore- 560078</td>
<td>16-03-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">412</td>
<td width="164" style="font-weight: 400;">Sarovar infratec LLP</td>
<td width="170" style="font-weight: 400;">Sarovar Surya</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">2nd Floor, No. 8, Nithin Arcade Banaswadi Amin Road, Bangalore-560043</td>
<td>16-03-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">413</td>
<td width="164" style="font-weight: 400;">c/o managing director, GNC reddy , GNR properties Pvt Ltd,</td>
<td width="170" style="font-weight: 400;">Hill view</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">#1056, GNR VILLA, 36th Cross, 28th Main , 80ft Road, Jayanagar 4th Block, Bangalore- 560041</td>
<td>16-03-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">414</td>
<td width="164" style="font-weight: 400;">HOUSE OF HIRANANDINI&nbsp;</td>
<td width="170" style="font-weight: 400;">KING STONE&nbsp;</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 757/B, 100feet Road, Hal 2 Nod Stage , Indiranagar, Bengaluru-560038.</td>
<td width="101">07-03-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">415</td>
<td width="164" style="font-weight: 400;">LAKEPOINT BUILDERS&nbsp; ( House of Hiranandini)</td>
<td width="170" style="font-weight: 400;">CHANCERY&nbsp;</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 757/B, 100feet Road, Hal 2 Nod Stage , Indiranagar, Bengaluru-560038.</td>
<td width="101">07-03-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">416</td>
<td width="164" style="font-weight: 400;">LAKEPOINT BUILDERS&nbsp; ( House of Hiranandini)</td>
<td width="170" style="font-weight: 400;">COTTAGES&nbsp;</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 757/B, 100feet Road, Hal 2 Nod Stage , Indiranagar, Bengaluru-560038.</td>
<td width="101">07-03-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">417</td>
<td width="164" style="font-weight: 400;">LAKEPOINT BUILDERS&nbsp; ( House of Hiranandini)</td>
<td width="170" style="font-weight: 400;">CROSSGATE&nbsp;</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 757/B, 100feet Road, Hal 2 Nod Stage , Indiranagar, Bengaluru-560038.</td>
<td width="101">07-03-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">418</td>
<td width="164" style="font-weight: 400;">LAKEPOINT BUILDERS&nbsp; ( House of Hiranandini)</td>
<td width="170" style="font-weight: 400;">CYPRESS</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 757/B, 100feet Road, Hal 2 Nod Stage , Indiranagar, Bengaluru-560038.</td>
<td width="101">07-03-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">419</td>
<td width="164" style="font-weight: 400;">LAKEPOINT BUILDERS&nbsp; ( House of Hiranandini)</td>
<td width="170" style="font-weight: 400;">VILLAS&nbsp;</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 757/B, 100feet Road, Hal 2 Nod Stage , Indiranagar, Bengaluru-560038.</td>
<td width="101">07-03-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">420</td>
<td width="164" style="font-weight: 400;">SUADELA CONSTRUCTIONS (House of Hiranandani)</td>
<td width="170" style="font-weight: 400;">CLU MEADOWS</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 757/B, 100feet Road, Hal 2 Nod Stage , Indiranagar, Bengaluru-560038.</td>
<td width="101">07-03-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">421</td>
<td width="164" style="font-weight: 400;">SUADELA CONSTRUCTIONS (House of Hiranandani)</td>
<td width="170" style="font-weight: 400;">LAKE VERANDAHS</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 757/B, 100feet Road, Hal 2 Nod Stage , Indiranagar, Bengaluru-560038.</td>
<td width="101">07-03-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">422</td>
<td width="164" style="font-weight: 400;">SUADELA CONSTRUCTIONS (House of Hiranandani)</td>
<td width="170" style="font-weight: 400;">HILL CREST&nbsp;</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 757/B, 100feet Road, Hal 2 Nod Stage , Indiranagar, Bengaluru-560038.</td>
<td width="101">07-03-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">423</td>
<td width="164" style="font-weight: 400;">PRAJA PROPERTIES</td>
<td width="170" style="font-weight: 400;">PRAJA NEST</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 2818, HEMA SUDEEP ARCADE, 3RD CROSS, 14TH MAIN, <br /> SAHAKARNAGAR, BENGALURU-560092</td>
<td width="101">07-03-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">424</td>
<td width="164" style="font-weight: 400;">PRAJA PROPERTIES</td>
<td width="170" style="font-weight: 400;">PRAJA GARUDA VANA</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 2818, HEMA SUDEEP ARCADE, 3RD CROSS, 14TH MAIN, <br /> SAHAKARNAGAR, BENGALURU-560092</td>
<td width="101">07-03-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">425</td>
<td width="164" style="font-weight: 400;">PRAJA PROPERTIES</td>
<td width="170" style="font-weight: 400;">PRAJA ADITYA ENCLAVE</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 2818, HEMA SUDEEP ARCADE, 3RD CROSS, 14TH MAIN, <br /> SAHAKARNAGAR, BENGALURU-560092</td>
<td width="101">07-03-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">426</td>
<td width="164" style="font-weight: 400;">PRAJA PROPERTIES</td>
<td width="170" style="font-weight: 400;">PRAJA VISHNU RESIDENCY</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 2818, HEMA SUDEEP ARCADE, 3RD CROSS, 14TH MAIN, <br /> SAHAKARNAGAR, BENGALURU-560092</td>
<td width="101">07-03-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">427</td>
<td width="164" style="font-weight: 400;">PRAJA PROPERTIES</td>
<td width="170" style="font-weight: 400;">PRAJA KARNA DIVINE</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 2818, HEMA SUDEEP ARCADE, 3RD CROSS, 14TH MAIN, <br /> SAHAKARNAGAR, BENGALURU-560092</td>
<td width="101">07-03-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">428</td>
<td width="164" style="font-weight: 400;">PRAJA PROPERTIES</td>
<td width="170" style="font-weight: 400;">PRAJA SVS HOME CITY</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 2818, HEMA SUDEEP ARCADE, 3RD CROSS, 14TH MAIN, <br /> SAHAKARNAGAR, BENGALURU-560092</td>
<td width="101">07-03-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">429</td>
<td width="164" style="font-weight: 400;">BM Developers</td>
<td width="170" style="font-weight: 400;">BM Rosewood</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 1668/A, 2nd Floor, GV Complex, 14th Main Road, HSR Layout, <br /> Adjacent to UCO Bank, Bengaluru.</td>
<td width="101">07-03-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">430</td>
<td width="164" style="font-weight: 400;">BM Developers</td>
<td width="170" style="font-weight: 400;">BM Luxuria</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 1668/A, 2nd Floor, GV Complex, 14th Main Road, HSR Layout, <br /> Adjacent to UCO Bank, Bengaluru.</td>
<td width="101">07-03-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">431</td>
<td width="164" style="font-weight: 400;">BM Developers</td>
<td width="170" style="font-weight: 400;">BM Royal Orchid</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 1668/A, 2nd Floor, GV Complex, 14th Main Road, HSR Layout, <br /> Adjacent to UCO Bank, Bengaluru.</td>
<td width="101">07-03-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">432</td>
<td width="164" style="font-weight: 400;">Akshaya Developers</td>
<td width="170" style="font-weight: 400;">Akshaya Temple Tree</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 28, BEML Main Road, Hal 3rd Stage, Bengaluru-560075</td>
<td width="101">07-03-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">433</td>
<td width="164" style="font-weight: 400;">Akshaya Developers</td>
<td width="170" style="font-weight: 400;">Crossandra</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 28, BEML Main Road, Hal 3rd Stage, Bengaluru-560075</td>
<td width="101">07-03-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">434</td>
<td width="164" style="font-weight: 400;">isha Infra Projects</td>
<td width="170" style="font-weight: 400;">iSHA Misty Green</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 109,110, Channasandra Inner Circle, Adjacent to the water tank,<br /> Hope Form Circle, Whitefield, Bengaluru.</td>
<td width="101">07-03-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">435</td>
<td width="164" style="font-weight: 400;">isha Infra Projects</td>
<td width="170" style="font-weight: 400;">iSHA Brindavan</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 109,110, Channasandra Inner Circle, Adjacent to the water tank,<br /> Hope Form Circle, Whitefield, Bengaluru.</td>
<td width="101">07-03-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">436</td>
<td width="164" style="font-weight: 400;">isha Infra Projects</td>
<td width="170" style="font-weight: 400;">iSHA CASABLANCA</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 109,110, Channasandra Inner Circle, Adjacent to the water tank,<br /> Hope Form Circle, Whitefield, Bengaluru.</td>
<td width="101">07-03-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">437</td>
<td width="164" style="font-weight: 400;">BSR Constructions</td>
<td width="170" style="font-weight: 400;">BSR TOWERS</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Mr. S. Sudhakar Reddy<br /> # 100/37/5, Near Silk Board ,Rupena Agrahara, <br /> Hosur Road, Bengaluru &ndash; 560068</td>
<td width="101">07-03-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">438</td>
<td width="164" style="font-weight: 400;">BSR Constructions</td>
<td width="170" style="font-weight: 400;">Sai Garden</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Mr. S. Sudhakar Reddy<br /> # 100/37/5, Near Silk Board,Rupena Agrahara, <br /> Hosur Road, Bengaluru &ndash; 560068</td>
<td width="101">07-03-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">439</td>
<td width="164" style="font-weight: 400;">BSR Constructions</td>
<td width="170" style="font-weight: 400;">Royal Enclave</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Mr. S. Sudhakar Reddy<br /> # 100/37/5, Near Silk Board,Rupena Agrahara, <br /> Hosur Road, Bengaluru &ndash; 560068</td>
<td width="101">07-03-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">440</td>
<td width="164" style="font-weight: 400;">S&amp;S Properties</td>
<td width="170" style="font-weight: 400;">SREE SAI SAMRUDHI</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">S.R.Towers, # 886, 4th Block, 6th Cross, <br /> H.B.R. Layout, Bengaluru - 560043.</td>
<td width="101">07-03-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">441</td>
<td width="164" style="font-weight: 400;">S&amp;S Properties</td>
<td width="170" style="font-weight: 400;">SREE SAI AEROCITY</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">S.R.Towers, # 886, 4th Block, 6th Cross, <br /> H.B.R. Layout, Bengaluru - 560043.</td>
<td width="101">07-03-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">442</td>
<td width="164" style="font-weight: 400;">S&amp;S Properties</td>
<td width="170" style="font-weight: 400;">SREE SAI GREENS PHASE ll</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">S.R.Towers, # 886, 4th Block, 6th Cross, <br /> H.B.R. Layout, Bengaluru - 560043.</td>
<td width="101">07-03-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">443</td>
<td width="164" style="font-weight: 400;">Arine Developers</td>
<td width="170" style="font-weight: 400;">White pearl</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 929, C.G.J Complex, 2nd Floor, BTM 4th Stage,<br /> Vijaya Bank Layout, Opp to IBP Petrol Station, Bengaluru - 560076.</td>
<td width="101">07-03-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">444</td>
<td width="164" style="font-weight: 400;">Arine Developers</td>
<td width="170" style="font-weight: 400;">Vibrant SUNRISE</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 929, C.G.J Complex, 2nd Floor, BTM 4th Stage,<br /> Vijaya Bank Layout, Opp to IBP Petrol Station, Bengaluru - 560076.</td>
<td width="101">07-03-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">445</td>
<td width="164" style="font-weight: 400;">Arine Developers</td>
<td width="170" style="font-weight: 400;">AMARYLLIS</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 929, C.G.J Complex, 2nd Floor, BTM 4th Stage,<br /> Vijaya Bank Layout, Opp to IBP Petrol Station, Bengaluru - 560076.</td>
<td width="101">07-03-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">446</td>
<td width="164" style="font-weight: 400;">ACE builders developers</td>
<td width="170" style="font-weight: 400;">Hill view</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 87 B, 2nd Floor, 30th cross, 7th A main , 4 th block jayanagar, <br /> Bengaluru- 560011</td>
<td width="101">07-03-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">447</td>
<td width="164" style="font-weight: 400;">AMR housing devvelopements Corporation,</td>
<td width="170" style="font-weight: 400;">AMR Oaks</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">40th cross, Jayanagar 8th Block, Bagalore- 560070</td>
<td width="101">07-03-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">448</td>
<td width="164" style="font-weight: 400;">Siri Homes,</td>
<td width="170" style="font-weight: 400;">Siri Malpe</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 8 , uttarahalli Amin Rd, Canara Bank colony, uttarhalli hobli, <br /> Bagalore- 560061</td>
<td width="101">07-03-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">449</td>
<td width="164" style="font-weight: 400;">BRL Ventures Pvt Ltd,</td>
<td width="170" style="font-weight: 400;">CMRS Courtyard</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 573, AECS Layout, C block main road, Opp ICICI Bank, Bengaluru-560037</td>
<td width="101">07-03-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">450</td>
<td width="164" style="font-weight: 400;">TATA Housing,</td>
<td width="170" style="font-weight: 400;">Tata Value</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">A wing cronche AL lateef no 25, Cunnigham Road, Bengaluru-560037.</td>
<td width="101">07-03-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">451</td>
<td width="164" style="font-weight: 400;">Nitesh Estates Limited,</td>
<td width="170" style="font-weight: 400;">Nitesh Hunter Valley</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Level 7 Nitesh time square, # 8, Mg Road, Bengaluru-560001.</td>
<td width="101">07-03-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">452</td>
<td width="164" style="font-weight: 400;">Unishire Projects,</td>
<td width="170" style="font-weight: 400;">Unishire Panamera</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 36, Railway parallel road, Kumar park west, Nehru Nagar <br /> Bengaluru-560020</td>
<td width="101">07-03-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">453</td>
<td width="164" style="font-weight: 400;">Keshava K,</td>
<td width="170" style="font-weight: 400;">Maw Meadows III</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">KMP house, # 12/2, Yamuna Bai Road, Madhav Nagar, Bengaluru-560020</td>
<td width="101">07-03-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">454</td>
<td width="164" style="font-weight: 400;">Splendid time Squre</td>
<td width="170" style="font-weight: 400;">Splendid time Squre</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Wheelr road, Cox town, Bengaluru- 560005</td>
<td width="101">07-03-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">455</td>
<td width="164" style="font-weight: 400;">Brindavana city</td>
<td width="170" style="font-weight: 400;">Brindavan City Pride</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">2nd floor, patil Complex, Next to HDFC Bank, Congress Road, <br /> Tilalwadi, Belagavi-590006.</td>
<td width="101">07-03-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">456</td>
<td width="164" style="font-weight: 400;">Pionier developers</td>
<td width="170" style="font-weight: 400;">Pionier residency</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">V Kriran, # 1140, 17th cross, 7th main sector HSR layout, <br /> Bengaluru- 560095</td>
<td width="101">07-03-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">457</td>
<td width="164" style="font-weight: 400;">Dee Mandala Estate And Properties Pvt Ltd</td>
<td width="170" style="font-weight: 400;">Dee Mandala Estate</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">177, First Main, 12th 'A' Cross, Second Stage, West Of Chord Road, Mahalakshmipuram, Bengaluru-560086,</td>
<td width="101">07-03-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">458</td>
<td width="164" style="font-weight: 400;">ARCADE CONSTRUCTIONS</td>
<td width="170" style="font-weight: 400;">Arcade Elegance</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">#1615/7, Vishal Complex, 1st Floor, 'E' Block, AECS Layout, <br /> Kundalahalli, K.R. Puram Hobli , Bengaluru - 560037</td>
<td width="101">07-03-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">459</td>
<td width="164" style="font-weight: 400;">GITANJALI DEVELOPERS</td>
<td width="170" style="font-weight: 400;">honeypool</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 179, 15th Main Road, 17th Cross, JP nagar, 5th Phase, <br /> Bengaluru-560078.</td>
<td width="101">07-03-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">460</td>
<td width="164" style="font-weight: 400;">Hilife Homes</td>
<td width="170" style="font-weight: 400;">HILIFE NATURE</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Sy. No-71/2&amp;3, Sharma Road, Whitefield, K.R.Puram Road, <br /> Belathur (Near Sathya Said Asshram) Whitefield, Bengaluru-560067.</td>
<td width="101">24-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">461</td>
<td width="164" style="font-weight: 400;">AKSHAYA BUILDERS DEVELOPERS PROMOTERS</td>
<td width="170" style="font-weight: 400;">TEMPLE TREE</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 28, BEML Main Road, HAL 3rd Stage, Bengaluru-560075.</td>
<td width="101">24-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">462</td>
<td width="164" style="font-weight: 400;">AKSHAYA BUILDERS DEVELOPERS PROMOTERS</td>
<td width="170" style="font-weight: 400;">united Crossandra</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 28, BEML Main Road, HAL 3rd Stage, Bengaluru-560075.</td>
<td width="101">24-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">463</td>
<td width="164" style="font-weight: 400;">SREEREDDY PROPERTIES PVT LTD</td>
<td width="170" style="font-weight: 400;">SreeReddy Mahalasha</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 4C1002, 3rd Floor, 100Ft Road, HRBR 1st Block, Banaswadi,<br /> Bengaluru-560043.</td>
<td width="101">24-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">464</td>
<td width="164" style="font-weight: 400;">SREEREDDY PROPERTIES PVT LTD</td>
<td width="170" style="font-weight: 400;">Sree SunMoon</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 4C1002, 3rd Floor, 100Ft Road, HRBR 1st Block, Banaswadi,<br /> Bengaluru-560043.</td>
<td width="101">24-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">465</td>
<td width="164" style="font-weight: 400;">SREEREDDY PROPERTIES PVT LTD</td>
<td width="170" style="font-weight: 400;">SreeReddy Jayani</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 4C1002, 3rd Floor, 100Ft Road, HRBR 1st Block, Banaswadi,<br /> Bengaluru-560043.</td>
<td width="101">24-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">466</td>
<td width="164" style="font-weight: 400;">SREEREDDY PROPERTIES PVT LTD</td>
<td width="170" style="font-weight: 400;">SreeReddy Saish</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 4C1002, 3rd Floor, 100Ft Road, HRBR 1st Block, Banaswadi,<br /> Bengaluru-560043.</td>
<td width="101">24-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">467</td>
<td width="164" style="font-weight: 400;">SREEREDDY PROPERTIES PVT LTD</td>
<td width="170" style="font-weight: 400;">SreeReddy Shakthi</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 4C1002, 3rd Floor, 100Ft Road, HRBR 1st Block, Banaswadi,<br /> Bengaluru-560043.</td>
<td width="101">24-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">468</td>
<td width="164" style="font-weight: 400;">SREEREDDY PROPERTIES PVT LTD</td>
<td width="170" style="font-weight: 400;">SreeReddy Arma</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 4C1002, 3rd Floor, 100Ft Road, HRBR 1st Block, Banaswadi,<br /> Bengaluru-560043.</td>
<td width="101">24-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">469</td>
<td width="164" style="font-weight: 400;">SREEREDDY PROPERTIES PVT LTD</td>
<td width="170" style="font-weight: 400;">SreeReddy Renuga</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 4C1002, 3rd Floor, 100Ft Road, HRBR 1st Block, Banaswadi,<br /> Bengaluru-560043.</td>
<td width="101">24-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">470</td>
<td width="164" style="font-weight: 400;">Regal Investments Constructions <br /> &amp; Holdings Pvt Ltd</td>
<td width="170" style="font-weight: 400;">Rich Tribute</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 42/1, Dickenson Road, Bengaluru- 560042.</td>
<td width="101">24-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">471</td>
<td width="164" style="font-weight: 400;">VERACIOUS BUILDERS &amp; DEVELOPERS (P) LTD.</td>
<td width="170" style="font-weight: 400;">Veracious Vani Vilas</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 302. Oxford Chambers, Rustambagh, Old Airport Road, Bengaluru.</td>
<td width="101">24-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">472</td>
<td width="164" style="font-weight: 400;">VERACIOUS BUILDERS &amp; DEVELOPERS (P) LTD.</td>
<td width="170" style="font-weight: 400;">Veracious Zarita</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 302. Oxford Chambers, Rustambagh, Old Airport Road, Bengaluru.</td>
<td width="101">24-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">473</td>
<td width="164" style="font-weight: 400;">VERACIOUS BUILDERS &amp; DEVELOPERS (P) LTD.</td>
<td width="170" style="font-weight: 400;">Veracious Villarica</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 302. Oxford Chambers, Rustambagh, Old Airport Road, Bengaluru.</td>
<td width="101">24-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">474</td>
<td width="164" style="font-weight: 400;">ZONASHA ESTATES AND PROJECTS</td>
<td width="170" style="font-weight: 400;">Zonasha Paradiso</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 1075, 2nd Floor, 12th Main, 8th Cross, Indiranagar, Bengaluru-560038.</td>
<td width="101">24-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">475</td>
<td width="164" style="font-weight: 400;">ZONASHA ESTATES AND PROJECTS</td>
<td width="170" style="font-weight: 400;">Zonasha Vista</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 1075, 2nd Floor, 12th Main, 8th Cross, Indiranagar, Bengaluru-560038.</td>
<td width="101">24-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">476</td>
<td width="164" style="font-weight: 400;">ZONASHA ESTATES AND PROJECTS</td>
<td width="170" style="font-weight: 400;">Zonasha Elegance</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 1075, 2nd Floor, 12th Main, 8th Cross, Indiranagar, Bengaluru-560038.</td>
<td width="101">24-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">477</td>
<td width="164" style="font-weight: 400;">Skylite Constructions</td>
<td width="170" style="font-weight: 400;">Skylite Vesta Villas&nbsp;&nbsp;</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 23,&nbsp; RI Keerthi Complex, 3rd floor, 14th Main, 15th cross, <br /> Opp B.D.A complex, H.S.R Layout,&nbsp; 4th sector, Bengaluru-560102</td>
<td width="101">24-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">478</td>
<td width="164" style="font-weight: 400;">Krishna Excel stonne Developers and builders&nbsp;</td>
<td width="170" style="font-weight: 400;">Krishna Excel stonne Developers and builders&nbsp;</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Mr. Kanaiha Naidu , No. 128, Green Garden Layouts, Munnekolala, Bengaluru-560037.</td>
<td width="101">24-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">479</td>
<td width="164" style="font-weight: 400;">GM Infinite&nbsp;</td>
<td width="170" style="font-weight: 400;">GM- Infinite E-city&nbsp;</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">GM pearl, # 06, BTM Lyout, 1st Stage, 1st Phase, Bengaluru-560068.</td>
<td width="101">24-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">480</td>
<td width="164" style="font-weight: 400;">Skylark Realty Pvt ltd&nbsp;</td>
<td width="170" style="font-weight: 400;">Udgan green Luxury&nbsp;</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">2nd floor, SM Towers, # 34, Outer ring Road, Bellandur, <br /> Bengaluru-560103.</td>
<td width="101">24-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">481</td>
<td width="164" style="font-weight: 400;">Sri krishna Sankalpa Pvt Ltd&nbsp;</td>
<td width="170" style="font-weight: 400;">Krishna Spring&nbsp;</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 445, 33rd Cross, 7th Main, 4th Block, jayanagar, Bengaluru-560011.</td>
<td width="101">24-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">482</td>
<td width="164" style="font-weight: 400;">Strecon Builders And Developers&nbsp;</td>
<td width="170" style="font-weight: 400;">Samrudhi hills&nbsp;</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Salmara, Karkala, Udupi-574104.</td>
<td width="101">24-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">483</td>
<td width="164" style="font-weight: 400;">GGR housing India Pvt Ltd&nbsp;</td>
<td width="170" style="font-weight: 400;">Adithya Grand&nbsp;</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Sri Prem Giri Babu, Director of Peram Adithya Grand Layout, No. 217/A, 3rd Main Road, East of NGEF Kasturi Nagar, Bengaluru- 560043.</td>
<td width="101">24-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">484</td>
<td width="164" style="font-weight: 400;">Sree reddy properties Pvt Ltd&nbsp;</td>
<td width="170" style="font-weight: 400;">Sree sun moon&nbsp;</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 4C , 1002 3rd Floor, 100 Feet Road, Horamaavu Singnal, HRBR 1st Block , Basavanagudi, Bengaluru-560043.</td>
<td width="101">24-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">485</td>
<td width="164" style="font-weight: 400;">Apna sapna Holidays Pvt ltd&nbsp;</td>
<td width="170" style="font-weight: 400;">Apna Aangana&nbsp;</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 65-67, 1st &amp; 2nd Floor, Sri Sadguru Complex Opp. IIM, Bannergahatta Road, Bengaluru-560076.</td>
<td width="101">24-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">486</td>
<td width="164" style="font-weight: 400;">Rk Realty&nbsp;</td>
<td width="170" style="font-weight: 400;">Salauria Sliver&nbsp;</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 303, Jyothi Residency, 1st Cross, Kaggadasapura, C.V Raman Nagar, Bengaluru- 560093.</td>
<td width="101">24-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">487</td>
<td width="164" style="font-weight: 400;">Lotus springs&nbsp;</td>
<td width="170" style="font-weight: 400;">Lotus springs&nbsp;</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 1666/44, 5th Cross Road, BSK 1st , Stage , 2nd Block , Srinagar, <br /> Bengaluru- 560050.</td>
<td width="101">24-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">488</td>
<td width="164" style="font-weight: 400;">Swapana builders&nbsp;</td>
<td width="170" style="font-weight: 400;">Winnig edge&nbsp;</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 4, GF2, Swapana Siddhi Pradha, 1st Cross, Cauvery Nagar, Church Road, Musugesh Playa, Bengaluru-560017.</td>
<td width="101">24-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">489</td>
<td width="164" style="font-weight: 400;">Vaishnavi Infrastucture corridar enterprise Pvt Ltd&nbsp;</td>
<td width="170" style="font-weight: 400;">Vaishnavi Mandara&nbsp;</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 43/1 , Tumkur Road, Next to Union Bank of India , Bengaluru-560022.</td>
<td width="101">24-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">490</td>
<td width="164" style="font-weight: 400;">sri sai Supreme Apartments&nbsp;</td>
<td width="170" style="font-weight: 400;">sri sai Supreme Apartments&nbsp;</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 37/10, Ishwaya Towers , Meanee Avenue Tank Road, Opp. Lakeside Hopsital Ulsoor , Bengaluru-560042.</td>
<td width="101">24-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">491</td>
<td width="164" style="font-weight: 400;">Kristal Chrysolate</td>
<td width="170" style="font-weight: 400;">Kristal Chrysolate</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 1, kristal Sapphire, 4th cross, 29th Main, BTM 2nd Stage , <br /> Bengaluru-560076</td>
<td width="101">24-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">492</td>
<td width="164" style="font-weight: 400;">KMP house&nbsp;</td>
<td width="170" style="font-weight: 400;">Orchids&nbsp;</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 12/2 , Yamuna Bai Road, Madhavanagar Bengaluru560001.</td>
<td width="101">24-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">493</td>
<td width="164" style="font-weight: 400;">TGS Dhanalakshami&nbsp;</td>
<td width="170" style="font-weight: 400;">TGS Dhanalakshami&nbsp;</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 12-70/6, 2nd 'B' Main, Kempanna Layouts, Hulimavu , <br /> Bannerghatta Road, Bengaluru- 560076&nbsp;</td>
<td width="101">24-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">494</td>
<td width="164" style="font-weight: 400;">Skyline Constructions and Housing Pvt Ltd.</td>
<td width="170" style="font-weight: 400;">Skyline Aura&nbsp;</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 405, 4th Floor Devatha Plaza, Residency Road, Bengaluru-560001.</td>
<td width="101">24-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">495</td>
<td width="164" style="font-weight: 400;">Skyline Constructions and Housing Pvt Ltd.</td>
<td width="170" style="font-weight: 400;">Skyline Retreat&nbsp;</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 405, 4th Floor Devatha Plaza, Residency Road, Bengaluru-560001.</td>
<td width="101">24-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">496</td>
<td width="164" style="font-weight: 400;">Spatika Developers &amp; Construction Pvt Ltd,</td>
<td width="170" style="font-weight: 400;">Spatika Green Hills&nbsp;</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Hayavadana, 322, 4th A Cross, OMBR Layout, <br /> Banasawadi, Bengaluru-560043.</td>
<td width="101">24-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">497</td>
<td width="164" style="font-weight: 400;">Spatika Developers &amp; Construction Pvt Ltd,</td>
<td width="170" style="font-weight: 400;">Nandi Nature Residency&nbsp;</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Hayavadana, 322, 4th A Cross, OMBR Layout, <br /> Banasawadi, Bengaluru-560043.</td>
<td width="101">24-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">498</td>
<td width="164" style="font-weight: 400;">Parasmani Luxury Homes</td>
<td width="170" style="font-weight: 400;">Parasmani Gold Crest</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 108, Maxworth Mansion, Lalbagh Fort Road,<br /> Near Minerva Circle, Bengaluru-560004.</td>
<td width="101">24-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">499</td>
<td width="164" style="font-weight: 400;">Parasmani Luxury Homes</td>
<td width="170" style="font-weight: 400;">Parasmani Green leaf</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 108, Maxworth Mansion, Lalbagh Fort Road,<br /> Near Minerva Circle, Bengaluru-560004.</td>
<td width="101">24-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">500</td>
<td width="164" style="font-weight: 400;">Parasmani Luxury Homes</td>
<td width="170" style="font-weight: 400;">Parasmani Harmony</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 108, Maxworth Mansion, Lalbagh Fort Road,<br /> Near Minerva Circle, Bengaluru-560004.</td>
<td width="101">24-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">501</td>
<td width="164" style="font-weight: 400;">Parasmani Luxury Homes</td>
<td width="170" style="font-weight: 400;">Parasmani Lifestyle&nbsp;</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 108, Maxworth Mansion, Lalbagh Fort Road,<br /> Near Minerva Circle, Bengaluru-560004.</td>
<td width="101">24-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">502</td>
<td width="164" style="font-weight: 400;">Parasmani Luxury Homes</td>
<td width="170" style="font-weight: 400;">Parasmani Springs</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 108, Maxworth Mansion, Lalbagh Fort Road,<br /> Near Minerva Circle, Bengaluru-560004.</td>
<td width="101">24-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">503</td>
<td width="164" style="font-weight: 400;">R &amp; R Infrastructure</td>
<td width="170" style="font-weight: 400;">Rose Residency&nbsp;</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 15, 11 nd &lsquo;B&rsquo; Main Road, Manasaba Apts, Sultan Palya,<br /> R.T. Nagar, Bengaluru-560032.</td>
<td width="101">24-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">504</td>
<td width="164" style="font-weight: 400;">Sindhu Developers&nbsp;</td>
<td width="170" style="font-weight: 400;">Sindhu Amzon&nbsp;</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Sindu Amzon, Tower 2, Ground Floor, 79/8, Outer Ringroad, Varthur Hobli, Near Belandur Central Mall, Belandur, Bdngaluru-560103.</td>
<td width="101">24-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">505</td>
<td width="164" style="font-weight: 400;">ARYAN HOMETEC</td>
<td width="170" style="font-weight: 400;">ARYAN AQUILAA</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 617, 15th Cross, 100ft. Ring Road, J P Nagar 6th Phase, Bengaluru-560078.</td>
<td width="101">16-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">506</td>
<td width="164" style="font-weight: 400;">Kay Arr &amp; C0</td>
<td width="170" style="font-weight: 400;">Kay Arr Silkeen</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># B - 001, 002, 302, Kay Arr Trumph Tower 5/2, Eagle Street, <br /> Lang Ford Town, Bengaluru-560025.</td>
<td width="101">16-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">507</td>
<td width="164" style="font-weight: 400;">VAIBHAVI PROPERTIES</td>
<td width="170" style="font-weight: 400;">Maanya Mansion Apartment</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 739 , 60TH CROSS 5TH BLOCK, BASHYAM CIRCLE, RAJAJINAGAR, <br /> Bengaluru-560010.</td>
<td width="101">16-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">508</td>
<td width="164" style="font-weight: 400;">VAIBHAVI PROPERTIES</td>
<td width="170" style="font-weight: 400;">Kwality Raaga Apartment</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 739 , 60TH CROSS 5TH BLOCK, BASHYAM CIRCLE, RAJAJINAGAR, <br /> Bengaluru-560010.</td>
<td width="101">16-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">509</td>
<td width="164" style="font-weight: 400;">VAIBHAVI PROPERTIES</td>
<td width="170" style="font-weight: 400;">Mega City Project</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 739 , 60TH CROSS 5TH BLOCK, BASHYAM CIRCLE, RAJAJINAGAR, <br /> Bengaluru-560010.</td>
<td width="101">16-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">510</td>
<td width="164" style="font-weight: 400;">VAIBHAVI PROPERTIES</td>
<td width="170" style="font-weight: 400;">Vijaya Enclave</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 739 , 60TH CROSS 5TH BLOCK, BASHYAM CIRCLE, RAJAJINAGAR, <br /> Bengaluru-560010.</td>
<td width="101">16-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">511</td>
<td width="164" style="font-weight: 400;">VAIBHAVI PROPERTIES</td>
<td width="170" style="font-weight: 400;">Green Valley Residency</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 739 , 60TH CROSS 5TH BLOCK, BASHYAM CIRCLE, RAJAJINAGAR, <br /> Bengaluru-560010.</td>
<td width="101">16-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">512</td>
<td width="164" style="font-weight: 400;">Thrive 360East Developers</td>
<td width="170" style="font-weight: 400;">Thrive 360East Xanadu</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Palm Arcade, 2nd Floor, 153, 1st Main Road, 3rd Block,<br /> HBR Layout, Bengaluru-560043.</td>
<td width="101">16-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">513</td>
<td width="164" style="font-weight: 400;">Thrive 360East Developers</td>
<td width="170" style="font-weight: 400;">Thrive 360East Muses&rsquo; Abode</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Palm Arcade, 2nd Floor, 153, 1st Main Road, 3rd Block,<br /> HBR Layout, Bengaluru-560043.</td>
<td width="101">16-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">514</td>
<td width="164" style="font-weight: 400;">Thrive 360East Developers</td>
<td width="170" style="font-weight: 400;">Elegance</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Palm Arcade, 2nd Floor, 153, 1st Main Road, 3rd Block,<br /> HBR Layout, Bengaluru-560043.</td>
<td width="101">16-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">515</td>
<td width="164" style="font-weight: 400;">Amrutha Shelters Pvt. Ltd.</td>
<td width="170" style="font-weight: 400;">Amrutha Value</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Flat No. 304, Amrutha's Sparking Nest, Sy.No.83/2, Mahadevapura,<br /> Bengaluru-560048.</td>
<td width="101">16-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">516</td>
<td width="164" style="font-weight: 400;">Amrutha Shelters Pvt. Ltd.</td>
<td width="170" style="font-weight: 400;">Amrutha Sarovar</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Flat No. 304, Amrutha's Sparking Nest, Sy.No.83/2, Mahadevapura,<br /> Bengaluru-560048.</td>
<td width="101">16-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">517</td>
<td width="164" style="font-weight: 400;">Emrald Group</td>
<td width="170" style="font-weight: 400;">ESTANCIA</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 40,2nd Floor,14th Main, 7th Sector,HSR layout,<br /> Near BDA Complex, Bengaluru 560102</td>
<td width="101">16-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">518</td>
<td width="164" style="font-weight: 400;">Emrald Group</td>
<td width="170" style="font-weight: 400;">ESTILA</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 40,2nd Floor,14th Main, 7th Sector,HSR layout,<br /> Near BDA Complex, Bengaluru-560102.</td>
<td width="101">16-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">519</td>
<td width="164" style="font-weight: 400;">MMG Constructions LLP</td>
<td width="170" style="font-weight: 400;">MMG VB City</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 617, 1st Floor, New Kantharaj Urs Road, Chamaraja Mohalla (Near Vijayabank Circle), Kuvempunagar, Mysore-570023.</td>
<td width="101">16-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">520</td>
<td width="164" style="font-weight: 400;">MMG Constructions LLP</td>
<td width="170" style="font-weight: 400;">MMG Greens</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 617, 1st Floor, New Kantharaj Urs Road, Chamaraja Mohalla (Near Vijayabank Circle), Kuvempunagar, Mysore-570023.</td>
<td width="101">16-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">521</td>
<td width="164" style="font-weight: 400;">MMG Constructions LLP</td>
<td width="170" style="font-weight: 400;">MMG Ambari Enclave</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 617, 1st Floor, New Kantharaj Urs Road, Chamaraja Mohalla (Near Vijayabank Circle), Kuvempunagar, Mysore-570023.</td>
<td width="101">16-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">522</td>
<td width="164" style="font-weight: 400;">Vyasti Group</td>
<td width="170" style="font-weight: 400;">Vyasti Blossom</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 763, First Floor, Gowri Arch 33rd &lsquo;A&rsquo; Cross, 9th Main, Jayanagar 4th Block, Bengaluru-560011.</td>
<td width="101">16-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">523</td>
<td width="164" style="font-weight: 400;">Vyasti Group</td>
<td width="170" style="font-weight: 400;">Vyasti Nature Nest</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 763, First Floor, Gowri Arch 33rd &lsquo;A&rsquo; Cross, 9th Main, Jayanagar 4th Block, Bengaluru-560011.</td>
<td width="101">16-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">524</td>
<td width="164" style="font-weight: 400;">Vyasti Group</td>
<td width="170" style="font-weight: 400;">Vyasti Serenity -2</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 763, First Floor, Gowri Arch 33rd &lsquo;A&rsquo; Cross, 9th Main, Jayanagar 4th Block, Bengaluru-560011.</td>
<td width="101">16-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">525</td>
<td width="164" style="font-weight: 400;">Vyasti Group</td>
<td width="170" style="font-weight: 400;">Vyasti Flora</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 763, First Floor, Gowri Arch 33rd &lsquo;A&rsquo; Cross, 9th Main, Jayanagar 4th Block, Bengaluru-560011.</td>
<td width="101">16-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">526</td>
<td width="164" style="font-weight: 400;">Vyasti Group</td>
<td width="170" style="font-weight: 400;">Vyasti Tranquil</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 763, First Floor, Gowri Arch 33rd &lsquo;A&rsquo; Cross, 9th Main, Jayanagar 4th Block, Bengaluru-560011.</td>
<td width="101">16-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">527</td>
<td width="164" style="font-weight: 400;">Vyasti Group</td>
<td width="170" style="font-weight: 400;">Vyasti Golf View</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 763, First Floor, Gowri Arch 33rd &lsquo;A&rsquo; Cross, 9th Main, Jayanagar 4th Block, Bengaluru-560011.</td>
<td width="101">16-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">528</td>
<td width="164" style="font-weight: 400;">G9 Projects</td>
<td width="170" style="font-weight: 400;">G9 Vistara</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 64, 7th Main, Kamakshi Hospital Road, Near Dhanalakshmi Bank, Saraswathipuram, Mysore-570009.</td>
<td width="101">16-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">529</td>
<td width="164" style="font-weight: 400;">G9 Projects</td>
<td width="170" style="font-weight: 400;">G9 Vaatika</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 64, 7th Main, Kamakshi Hospital Road, Near Dhanalakshmi Bank, Saraswathipuram, Mysore-570009.</td>
<td width="101">16-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">530</td>
<td width="164" style="font-weight: 400;">G9 Projects</td>
<td width="170" style="font-weight: 400;">G9 Vihaa</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 64, 7th Main, Kamakshi Hospital Road, Near Dhanalakshmi Bank, Saraswathipuram, Mysore-570009.</td>
<td width="101">16-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">531</td>
<td width="164" style="font-weight: 400;">G9 Projects</td>
<td width="170" style="font-weight: 400;">G9 Vasathi</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 64, 7th Main, Kamakshi Hospital Road, Near Dhanalakshmi Bank, Saraswathipuram, Mysore-570009.</td>
<td width="101">16-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">532</td>
<td width="164" style="font-weight: 400;">KBL GROUPS</td>
<td width="170" style="font-weight: 400;">KBL CITY</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 1063/49, 1st Main, 5th cross, Vidyaranyapuram, <br /> Opp.Ramalingeswara Temple, Mysore-570008.</td>
<td width="101">16-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">533</td>
<td width="164" style="font-weight: 400;">KBL GROUPS</td>
<td width="170" style="font-weight: 400;">KBL Gardenia</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 1063/49, 1st Main, 5th cross, Vidyaranyapuram, <br /> Opp.Ramalingeswara Temple, Mysore-570008.</td>
<td width="101">16-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">534</td>
<td width="164" style="font-weight: 400;">KBL GROUPS</td>
<td width="170" style="font-weight: 400;">KBL Enclave</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 1063/49, 1st Main, 5th cross, Vidyaranyapuram, <br /> Opp.Ramalingeswara Temple, Mysore-570008.</td>
<td width="101">16-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">535</td>
<td width="164" style="font-weight: 400;">KBL GROUPS</td>
<td width="170" style="font-weight: 400;">KBL Century</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 1063/49, 1st Main, 5th cross, Vidyaranyapuram, <br /> Opp.Ramalingeswara Temple, Mysore-570008.</td>
<td width="101">16-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">536</td>
<td width="164" style="font-weight: 400;">LNT Infra Hubli</td>
<td width="170" style="font-weight: 400;">LNT Palm Gardens</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 3, Second Floor, Ankush Arcade, Station raod, Hubballi-580020.</td>
<td width="101">16-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">537</td>
<td width="164" style="font-weight: 400;">LNT Infra Hubli</td>
<td width="170" style="font-weight: 400;">LNT Sunshine</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 3, Second Floor, Ankush Arcade, Station raod, Hubballi-580020.</td>
<td width="101">16-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">538</td>
<td width="164" style="font-weight: 400;">LNT Infra Hubli</td>
<td width="170" style="font-weight: 400;">LNT Pride</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 3, Second Floor, Ankush Arcade, Station raod, Hubballi-580020.</td>
<td width="101">16-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">539</td>
<td width="164" style="font-weight: 400;">Bhima Properties</td>
<td width="170" style="font-weight: 400;">Bhima Mrigashira</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 997, 1st Floor, Above Shree Mahalakshmi Sweets, 3rd Main Road, Vidyaranyapuram, Mysuru-570008.</td>
<td width="101">16-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">540</td>
<td width="164" style="font-weight: 400;">Bhima Properties</td>
<td width="170" style="font-weight: 400;">Bhima Ashvini Phase 2</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 997, 1st Floor, Above Shree Mahalakshmi Sweets, 3rd Main Road, Vidyaranyapuram, Mysuru-570008.</td>
<td width="101">16-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">541</td>
<td width="164" style="font-weight: 400;">Bhima Properties</td>
<td width="170" style="font-weight: 400;">Bhima Krithika</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 997, 1st Floor, Above Shree Mahalakshmi Sweets, 3rd Main Road, Vidyaranyapuram, Mysuru-570008.</td>
<td width="101">16-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">542</td>
<td width="164" style="font-weight: 400;">Bhima Properties</td>
<td width="170" style="font-weight: 400;">Bhima Pama Enclave</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 997, 1st Floor, Above Shree Mahalakshmi Sweets, 3rd Main Road, Vidyaranyapuram, Mysuru-570008.</td>
<td width="101">16-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">543</td>
<td width="164" style="font-weight: 400;">i1 Properties Pvt. Ltd.</td>
<td width="170" style="font-weight: 400;">SS Swadhama</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 61, 24th Main, 7th Cross, J.P.Nagar 2nd Phase, Bengaluru-560078.</td>
<td width="101">16-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">544</td>
<td width="164" style="font-weight: 400;">i1 Properties Pvt. Ltd.</td>
<td width="170" style="font-weight: 400;">i1 Amrutha Residency</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 61, 24th Main, 7th Cross, J.P.Nagar 2nd Phase, Bengaluru-560078.</td>
<td width="101">16-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">545</td>
<td width="164" style="font-weight: 400;">i1 Properties Pvt. Ltd.</td>
<td width="170" style="font-weight: 400;">SLR Comforts</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 61, 24th Main, 7th Cross, J.P.Nagar 2nd Phase, Bengaluru-560078.</td>
<td width="101">16-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">546</td>
<td width="164" style="font-weight: 400;">i1 Properties Pvt. Ltd.</td>
<td width="170" style="font-weight: 400;">i1 SHAKTHI SHELTERS</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 61, 24th Main, 7th Cross, J.P.Nagar 2nd Phase, Bengaluru-560078.</td>
<td width="101">16-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">547</td>
<td width="164" style="font-weight: 400;">ABM Buildtech Pvt Ltd</td>
<td width="170" style="font-weight: 400;">ABM Residency</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 12/A-2, ABM Tower, 24th Main, 14th Cross, J P Nagar, 1st Phase, <br /> Bengaluru-560078.</td>
<td width="101">16-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">548</td>
<td width="164" style="font-weight: 400;">ABM Buildtech Pvt Ltd</td>
<td width="170" style="font-weight: 400;">ABM Lake view</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 12/A-2, ABM Tower, 24th Main, 14th Cross, J P Nagar, 1st Phase, <br /> Bengaluru-560078.</td>
<td width="101">16-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">549</td>
<td width="164" style="font-weight: 400;">HPR MAX PROPERTIES,</td>
<td width="170" style="font-weight: 400;">Residential sites of mysore road</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 293/51, 52ND CROSS, 10th Main Road, 4th Block, Rajajinagar, <br /> Bengaluru-560010.</td>
<td width="101">16-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">550</td>
<td width="164" style="font-weight: 400;">Someshwara Constructions &amp; Developers</td>
<td width="170" style="font-weight: 400;">Someshwara Enclave,<br /> &nbsp;Mysore&nbsp;</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 46, 11th Main Road, 18th Cross , Malleshwaram West, <br /> Bengaluru- 560003 (Near MESC college).</td>
<td width="101">16-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">551</td>
<td width="164" style="font-weight: 400;">Sri Nandi Developers and Construction</td>
<td width="170" style="font-weight: 400;">Residential sites</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 14/101, 19th Main, 1st &lsquo;N&rsquo; block, Rajajinagar, <br /> (Opp, Vidyavardhaka Sangha), Bengaluru-560010.</td>
<td width="101">16-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">552</td>
<td width="164" style="font-weight: 400;">ECO DREAM PROPERTIES</td>
<td width="170" style="font-weight: 400;">Obel banjara</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 105, 3rd Main, Hoysalanagar, Bengaluru-560016.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">553</td>
<td width="164" style="font-weight: 400;">ECO DREAM PROPERTIES</td>
<td width="170" style="font-weight: 400;">JAYA HIBISCUS</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 105, 3rd Main, Hoysalanagar, Bengaluru-560016.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">554</td>
<td width="164" style="font-weight: 400;">ECO DREAM PROPERTIES</td>
<td width="170" style="font-weight: 400;">NANDANAM PARADISE</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 105, 3rd Main, Hoysalanagar, Bengaluru-560016.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">555</td>
<td width="164" style="font-weight: 400;">PRISHA PROPERTIES INDIA PVT LTD</td>
<td width="170" style="font-weight: 400;">Golden Valley</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 820, Golden House 2nd Floor, 80ft Road, 8th BlockKoramangala, <br /> Bengaluru-560095.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">556</td>
<td width="164" style="font-weight: 400;">PRISHA PROPERTIES INDIA PVT LTD</td>
<td width="170" style="font-weight: 400;">Bhuvana Greens</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 820, Golden House 2nd Floor, 80ft Road, 8th BlockKoramangala, <br /> Bengaluru-560095.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">557</td>
<td width="164" style="font-weight: 400;">TRANSCITY DEVELOPERS</td>
<td width="170" style="font-weight: 400;">Trans Aakruthi</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 32, II Floor, Above shantisagar hotel,Bashyam Circle, Sadashivnagar, Bengaluru-560080.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">558</td>
<td width="164" style="font-weight: 400;">TRANSCITY DEVELOPERS</td>
<td width="170" style="font-weight: 400;">Trans Keerthi</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 32, II Floor, Above shantisagar hotel,Bashyam Circle, Sadashivnagar, Bengaluru-560080.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">559</td>
<td width="164" style="font-weight: 400;">TRANSCITY DEVELOPERS</td>
<td width="170" style="font-weight: 400;">Trans Prasiddhi</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 32, II Floor, Above shantisagar hotel,Bashyam Circle, Sadashivnagar, Bengaluru-560080.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">560</td>
<td width="164" style="font-weight: 400;">TRANSCITY DEVELOPERS</td>
<td width="170" style="font-weight: 400;">Trans Praghathi</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 32, II Floor, Above shantisagar hotel,Bashyam Circle, Sadashivnagar, Bengaluru-560080.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">561</td>
<td width="164" style="font-weight: 400;">TRANSCITY DEVELOPERS</td>
<td width="170" style="font-weight: 400;">TRANSPOOTHI.</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 32, II Floor, Above shantisagar hotel,Bashyam Circle, Sadashivnagar, Bengaluru-560080.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">562</td>
<td width="164" style="font-weight: 400;">Chithaary Developers</td>
<td width="170" style="font-weight: 400;">Chithaary Kamala</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">No. 130, "Chithaary House", 8th Main, 3rd Phase, J.P. Nagar, <br /> Bengaluru-560078.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">563</td>
<td width="164" style="font-weight: 400;">Chithaary Developers</td>
<td width="170" style="font-weight: 400;">Chithaary Vidhula</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">No. 130, "Chithaary House", 8th Main, 3rd Phase, J.P. Nagar, <br /> Bengaluru-560078.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">564</td>
<td width="164" style="font-weight: 400;">Chithaary Developers</td>
<td width="170" style="font-weight: 400;">Chithaary Sumukha</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">No. 130, "Chithaary House", 8th Main, 3rd Phase, J.P. Nagar, <br /> Bengaluru-560078.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">565</td>
<td width="164" style="font-weight: 400;">Chithaary Developers</td>
<td width="170" style="font-weight: 400;">Fateh Chithaary</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">No. 130, "Chithaary House", 8th Main, 3rd Phase, J.P. Nagar, <br /> Bengaluru-560078.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">566</td>
<td width="164" style="font-weight: 400;">Chithaary Developers</td>
<td width="170" style="font-weight: 400;">Chithaary CIRO</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">No. 130, "Chithaary House", 8th Main, 3rd Phase, J.P. Nagar, <br /> Bengaluru-560078.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">567</td>
<td width="164" style="font-weight: 400;">Chithaary Developers</td>
<td width="170" style="font-weight: 400;">Chithaary Harmony</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">No. 130, "Chithaary House", 8th Main, 3rd Phase, J.P. Nagar, <br /> Bengaluru-560078.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">568</td>
<td width="164" style="font-weight: 400;">The Creative Homes (TCH)</td>
<td width="170" style="font-weight: 400;">Sonavi Residency</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 90 , "Le-CHATEAU", Infantry Road, Bengaluru-560001.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">569</td>
<td width="164" style="font-weight: 400;">The Creative Homes (TCH)</td>
<td width="170" style="font-weight: 400;">Garden Residency 1</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 90 , "Le-CHATEAU", Infantry Road, Bengaluru-560001.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">570</td>
<td width="164" style="font-weight: 400;">The Creative Homes (TCH)</td>
<td width="170" style="font-weight: 400;">Garden Residency 2</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 90 , "Le-CHATEAU", Infantry Road, Bengaluru-560001.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">571</td>
<td width="164" style="font-weight: 400;">The Creative Homes (TCH)</td>
<td width="170" style="font-weight: 400;">Garden Residency 3</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 90 , "Le-CHATEAU", Infantry Road, Bengaluru-560001.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">572</td>
<td width="164" style="font-weight: 400;">Donata Group</td>
<td width="170" style="font-weight: 400;">Donata County</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">35/1, 7th Cross, Vasanthnagar, Bengaluru-560052.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">573</td>
<td width="164" style="font-weight: 400;">Donata Group</td>
<td width="170" style="font-weight: 400;">Donata County Annexe</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">35/1, 7th Cross, Vasanthnagar, Bengaluru-560052.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">574</td>
<td width="164" style="font-weight: 400;">ADITHI PROJECTS</td>
<td width="170" style="font-weight: 400;">ADITHI ELITE</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Flat No. 6051, Sobha Carnation, Bellandur, Bengaluru 560102 Bengaluru</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">575</td>
<td width="164" style="font-weight: 400;">Vestaa Groups</td>
<td width="170" style="font-weight: 400;">Thirumala Blossom</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 1514, 19th Main Rd1st Sector, HSR Layout, Bengaluru-560102.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">576</td>
<td width="164" style="font-weight: 400;">Vestaa Groups</td>
<td width="170" style="font-weight: 400;">Vestaa Polaris</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 1514, 19th Main Rd1st Sector, HSR Layout, Bengaluru-560102.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">577</td>
<td width="164" style="font-weight: 400;">Vestaa Groups</td>
<td width="170" style="font-weight: 400;">Thirumala Lakshmi Grand</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 1514, 19th Main Rd1st Sector, HSR Layout, Bengaluru-560102.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">578</td>
<td width="164" style="font-weight: 400;">Vestaa Groups</td>
<td width="170" style="font-weight: 400;">MN Credence Flora</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 1514, 19th Main Rd1st Sector, HSR Layout, Bengaluru-560102.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">579</td>
<td width="164" style="font-weight: 400;">SNR Square Pvt Ltd.</td>
<td width="170" style="font-weight: 400;">SNR LUXURIA - Luxuria</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 18/1, 3rd Floor,Jain Bhavan, Andree Road, Shantinagar, Bengaluru-560027.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">580</td>
<td width="164" style="font-weight: 400;">SNR Square Pvt Ltd.</td>
<td width="170" style="font-weight: 400;">SNR SILVER RIPPLES</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 18/1, 3rd Floor,Jain Bhavan, Andree Road, Shantinagar, Bengaluru-560027.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">581</td>
<td width="164" style="font-weight: 400;">CMM Groups</td>
<td width="170" style="font-weight: 400;">CMM Golden Heights"Residential Villa House</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 1/1, 1st Floor, 2nd Main, Opp.Shanti Sagar Hotel, R.T Nagar, <br /> Bengaluru-560032.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">582</td>
<td width="164" style="font-weight: 400;">CMM Groups</td>
<td width="170" style="font-weight: 400;">RESIDENTIAL LAYOUT</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 1/1, 1st Floor, 2nd Main, Opp.Shanti Sagar Hotel, R.T Nagar, <br /> Bengaluru-560032.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">583</td>
<td width="164" style="font-weight: 400;">CMM Groups</td>
<td width="170" style="font-weight: 400;">VENKATESHWARA HOUSING SOCIETY</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 1/1, 1st Floor, 2nd Main, Opp.Shanti Sagar Hotel, R.T Nagar, <br /> Bengaluru-560032.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">584</td>
<td width="164" style="font-weight: 400;">CMM Groups</td>
<td width="170" style="font-weight: 400;">CMM Golden Heights</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 1/1, 1st Floor, 2nd Main, Opp.Shanti Sagar Hotel, R.T Nagar, <br /> Bengaluru-560032.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">585</td>
<td width="164" style="font-weight: 400;">PRIVILEGE HOMZ</td>
<td width="170" style="font-weight: 400;">SAI SPRINGS</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">127/A, 4th Main Rd, Munivenkatppa Layout, Bilekahalli, Bengaluru-560076</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">586</td>
<td width="164" style="font-weight: 400;">PRIVILEGE HOMZ</td>
<td width="170" style="font-weight: 400;">SAI ASHRAYA</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">127/A, 4th Main Rd, Munivenkatppa Layout, Bilekahalli, Bengaluru-560076</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">587</td>
<td width="164" style="font-weight: 400;">PRIVILEGE HOMZ</td>
<td width="170" style="font-weight: 400;">SAI GOKULAM</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">127/A, 4th Main Rd, Munivenkatppa Layout, Bilekahalli, Bengaluru-560076</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">588</td>
<td width="164" style="font-weight: 400;">AV Developers</td>
<td width="170" style="font-weight: 400;">Av Serene Street</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 571, 1st Floor, 1st Cross, 8th Block, Koramangala, Bengaluru-560095.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">589</td>
<td width="164" style="font-weight: 400;">SGR Construction</td>
<td width="170" style="font-weight: 400;">SGR Pearl</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 384, 1st cross, 9th Main, 7th block, Padmanabhanagar, BSK 3rdStage,<br /> Bengaluru-560070.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">590</td>
<td width="164" style="font-weight: 400;">SGR Construction</td>
<td width="170" style="font-weight: 400;">SGR Lavilla</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 384, 1st cross, 9th Main, 7th block, Padmanabhanagar, BSK 3rdStage,<br /> Bengaluru-560070.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">591</td>
<td width="164" style="font-weight: 400;">LBI Properties</td>
<td width="170" style="font-weight: 400;">LBI Bliss</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Devarachikkanahalli Main Rd, Vijaya Bank Layout, Bommanahalli,<br /> Bengaluru-560076</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">592</td>
<td width="164" style="font-weight: 400;">MALIBU PROJECTS</td>
<td width="170" style="font-weight: 400;">Rising City</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 88, Green Glen Layout, Bellandur, 50 Feet Road, Bengaluru-560103.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">593</td>
<td width="164" style="font-weight: 400;">MALIBU PROJECTS</td>
<td width="170" style="font-weight: 400;">Sparkling Wings</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 88, Green Glen Layout, Bellandur, 50 Feet Road, Bengaluru-560103.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">594</td>
<td width="164" style="font-weight: 400;">Surath Builders</td>
<td width="170" style="font-weight: 400;">Sunny Side</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 112, 1st Floor, Vyshya Bank Layout, 9th Main, 1st cross,<br /> Near Reliance fresh, BTM 1st stage, Bengaluru-560076.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">595</td>
<td width="164" style="font-weight: 400;">Surath Builders</td>
<td width="170" style="font-weight: 400;">sun shine</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 112, 1st Floor, Vyshya Bank Layout, 9th Main, 1st cross,<br /> Near Reliance fresh, BTM 1st stage, Bengaluru-560076.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">596</td>
<td width="164" style="font-weight: 400;">Surath Builders</td>
<td width="170" style="font-weight: 400;">sliver star</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 112, 1st Floor, Vyshya Bank Layout, 9th Main, 1st cross,<br /> Near Reliance fresh, BTM 1st stage, Bengaluru-560076.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">597</td>
<td width="164" style="font-weight: 400;">Surath Builders</td>
<td width="170" style="font-weight: 400;">infinity</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 112, 1st Floor, Vyshya Bank Layout, 9th Main, 1st cross,<br /> Near Reliance fresh, BTM 1st stage, Bengaluru-560076.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">598</td>
<td width="164" style="font-weight: 400;">Surath Builders</td>
<td width="170" style="font-weight: 400;">sunshine dwelling</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 112, 1st Floor, Vyshya Bank Layout, 9th Main, 1st cross,<br /> Near Reliance fresh, BTM 1st stage, Bengaluru-560076.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">599</td>
<td width="164" style="font-weight: 400;">MANANI PROJECTS PVT LTD</td>
<td width="170" style="font-weight: 400;">Manani Enclave</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 906, Raj Arcade, 4th Floor, 5th A Cross, H.R.B.R 1st Block, Near BWSSB Water Tank, Kalyan Nagar, Outer Ring Road, Bengaluru-560043.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">600</td>
<td width="164" style="font-weight: 400;">MANANI PROJECTS PVT LTD</td>
<td width="170" style="font-weight: 400;">Manani Garden</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 906, Raj Arcade, 4th Floor, 5th A Cross, H.R.B.R 1st Block, Near BWSSB Water Tank, Kalyan Nagar, Outer Ring Road, Bengaluru-560043.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">601</td>
<td width="164" style="font-weight: 400;">MANANI PROJECTS PVT LTD</td>
<td width="170" style="font-weight: 400;">Manani Webcity</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 906, Raj Arcade, 4th Floor, 5th A Cross, H.R.B.R 1st Block, Near BWSSB Water Tank, Kalyan Nagar, Outer Ring Road, Bengaluru-560043.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">602</td>
<td width="164" style="font-weight: 400;">MANANI PROJECTS PVT LTD</td>
<td width="170" style="font-weight: 400;">Manani Green City<br /> &nbsp;Phase 2</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 906, Raj Arcade, 4th Floor, 5th A Cross, H.R.B.R 1st Block, Near BWSSB Water Tank, Kalyan Nagar, Outer Ring Road, Bengaluru-560043.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">603</td>
<td width="164" style="font-weight: 400;">MANANI PROJECTS PVT LTD</td>
<td width="170" style="font-weight: 400;">Manani Woods II</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 906, Raj Arcade, 4th Floor, 5th A Cross, H.R.B.R 1st Block, Near BWSSB Water Tank, Kalyan Nagar, Outer Ring Road, Bengaluru-560043.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">604</td>
<td width="164" style="font-weight: 400;">MANANI PROJECTS PVT LTD</td>
<td width="170" style="font-weight: 400;">Manani Paradise<br /> &nbsp;Phase 2 &amp; 3</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 906, Raj Arcade, 4th Floor, 5th A Cross, H.R.B.R 1st Block, Near BWSSB Water Tank, Kalyan Nagar, Outer Ring Road, Bengaluru-560043.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">605</td>
<td width="164" style="font-weight: 400;">MANANI PROJECTS PVT LTD</td>
<td width="170" style="font-weight: 400;">Manani ELA</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 906, Raj Arcade, 4th Floor, 5th A Cross, H.R.B.R 1st Block, Near BWSSB Water Tank, Kalyan Nagar, Outer Ring Road, Bengaluru-560043.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">606</td>
<td width="164" style="font-weight: 400;">MANANI PROJECTS PVT LTD</td>
<td width="170" style="font-weight: 400;">Manani Residency</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 906, Raj Arcade, 4th Floor, 5th A Cross, H.R.B.R 1st Block, Near BWSSB Water Tank, Kalyan Nagar, Outer Ring Road, Bengaluru-560043.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">607</td>
<td width="164" style="font-weight: 400;">MANANI PROJECTS PVT LTD</td>
<td width="170" style="font-weight: 400;">Manani Vista</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 906, Raj Arcade, 4th Floor, 5th A Cross, H.R.B.R 1st Block, Near BWSSB Water Tank, Kalyan Nagar, Outer Ring Road, Bengaluru-560043.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">608</td>
<td width="164" style="font-weight: 400;">MANANI PROJECTS PVT LTD</td>
<td width="170" style="font-weight: 400;">Manani Spring</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 906, Raj Arcade, 4th Floor, 5th A Cross, H.R.B.R 1st Block, Near BWSSB Water Tank, Kalyan Nagar, Outer Ring Road, Bengaluru-560043.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">609</td>
<td width="164" style="font-weight: 400;">MANANI PROJECTS PVT LTD</td>
<td width="170" style="font-weight: 400;">Manani Gateway</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 906, Raj Arcade, 4th Floor, 5th A Cross, H.R.B.R 1st Block, Near BWSSB Water Tank, Kalyan Nagar, Outer Ring Road, Bengaluru-560043.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">610</td>
<td width="164" style="font-weight: 400;">MANANI PROJECTS PVT LTD</td>
<td width="170" style="font-weight: 400;">Manani Oak Garden</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 906, Raj Arcade, 4th Floor, 5th A Cross, H.R.B.R 1st Block, Near BWSSB Water Tank, Kalyan Nagar, Outer Ring Road, Bengaluru-560043.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">611</td>
<td width="164" style="font-weight: 400;">MANANI PROJECTS PVT LTD</td>
<td width="170" style="font-weight: 400;">Manani Meadows</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 906, Raj Arcade, 4th Floor, 5th A Cross, H.R.B.R 1st Block, Near BWSSB Water Tank, Kalyan Nagar, Outer Ring Road, Bengaluru-560043.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">612</td>
<td width="164" style="font-weight: 400;">ICON Homz</td>
<td width="170" style="font-weight: 400;">ICON LAURELS</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 47/9, Jai Plaza Symphony, 9th main, Sector6, HSR Layout,<br /> Bengaluru-560102.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">613</td>
<td width="164" style="font-weight: 400;">ICON Homz</td>
<td width="170" style="font-weight: 400;">Vensai Icon Temple Tree</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 47/9, Jai Plaza Symphony, 9th main, Sector6, HSR Layout,<br /> Bengaluru-560102.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">614</td>
<td width="164" style="font-weight: 400;">ICON Homz</td>
<td width="170" style="font-weight: 400;">ICON Malgudi</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 47/9, Jai Plaza Symphony, 9th main, Sector6, HSR Layout,<br /> Bengaluru-560102.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">615</td>
<td width="164" style="font-weight: 400;">V VENTURE</td>
<td width="170" style="font-weight: 400;">Summit</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 332, 38th Cross Road, 28th Main Road, 9th Block, East End Main Road, Jayanagar, Bengaluru-560069</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">616</td>
<td width="164" style="font-weight: 400;">SHRI DIYA PROJECTS PVT LTD,</td>
<td width="170" style="font-weight: 400;">Shri Diya &ldquo;ORNATE&rdquo;</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 180, 1st Floor, 8th Main, 14th Cross, 6th sector, H.S.R. Layout, <br /> Bengaluru-560020.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">617</td>
<td width="164" style="font-weight: 400;">Valdis Group</td>
<td width="170" style="font-weight: 400;">Deccan Palms</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 3, Hall 10 A, 3rd Floor, Brindavan Complex, BTM 1st Stage,<br /> Bengaluru-560068.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">618</td>
<td width="164" style="font-weight: 400;">Valdis Group</td>
<td width="170" style="font-weight: 400;">GOUTHAMI MEADOWS</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 3, Hall 10 A, 3rd Floor, Brindavan Complex, BTM 1st Stage,<br /> Bengaluru-560068.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">619</td>
<td width="164" style="font-weight: 400;">Valdis Group</td>
<td width="170" style="font-weight: 400;">Green fields</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 3, Hall 10 A, 3rd Floor, Brindavan Complex, BTM 1st Stage,<br /> Bengaluru-560068.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">620</td>
<td width="164" style="font-weight: 400;">Valdis Group</td>
<td width="170" style="font-weight: 400;">Maison Douce</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 3, Hall 10 A, 3rd Floor, Brindavan Complex, BTM 1st Stage,<br /> Bengaluru-560068.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">621</td>
<td width="164" style="font-weight: 400;">Valdis Group</td>
<td width="170" style="font-weight: 400;">PRIME CITY</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 3, Hall 10 A, 3rd Floor, Brindavan Complex, BTM 1st Stage,<br /> Bengaluru-560068.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">622</td>
<td width="164" style="font-weight: 400;">Valdis Group</td>
<td width="170" style="font-weight: 400;">The Edge</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 3, Hall 10 A, 3rd Floor, Brindavan Complex, BTM 1st Stage,<br /> Bengaluru-560068.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">623</td>
<td width="164" style="font-weight: 400;">Valdis Group</td>
<td width="170" style="font-weight: 400;">Vikas Nagar Concept City</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 3, Hall 10 A, 3rd Floor, Brindavan Complex, BTM 1st Stage,<br /> Bengaluru-560068.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">624</td>
<td width="164" style="font-weight: 400;">Valdis Group</td>
<td width="170" style="font-weight: 400;">GCA Rainbow</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 3, Hall 10 A, 3rd Floor, Brindavan Complex, BTM 1st Stage,<br /> Bengaluru-560068.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">625</td>
<td width="164" style="font-weight: 400;">PUJA MEGA STRUCTURES PVT LTD</td>
<td width="170" style="font-weight: 400;">Puja Navarathna</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 408/B, 24th Cross,13th Main, Banashankari, 2nd Stage, Bengaluru -560070.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">626</td>
<td width="164" style="font-weight: 400;">PUJA MEGA STRUCTURES PVT LTD</td>
<td width="170" style="font-weight: 400;">Puja Nakshatra</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 408/B, 24th Cross,13th Main, Banashankari, 2nd Stage, Bengaluru -560070.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">627</td>
<td width="164" style="font-weight: 400;">PUJA MEGA STRUCTURES PVT LTD</td>
<td width="170" style="font-weight: 400;">Puja Sarovara</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 408/B, 24th Cross,13th Main, Banashankari, 2nd Stage, Bengaluru -560070.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">628</td>
<td width="164" style="font-weight: 400;">Saranya Group</td>
<td width="170" style="font-weight: 400;">Saranya Shantiniketan</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 18, Sy No-48, Green Garden Layout, Sai Baba Temple Road, <br /> Munnekolala, Bengaluru-560037.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">629</td>
<td width="164" style="font-weight: 400;">Saranya Group</td>
<td width="170" style="font-weight: 400;">Saranya Sunshine</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 18, Sy No-48, Green Garden Layout, Sai Baba Temple Road, <br /> Munnekolala, Bengaluru-560037.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">630</td>
<td width="164" style="font-weight: 400;">Saranya Group</td>
<td width="170" style="font-weight: 400;">Saranya Silverstone</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 18, Sy No-48, Green Garden Layout, Sai Baba Temple Road, <br /> Munnekolala, Bengaluru-560037.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">631</td>
<td width="164" style="font-weight: 400;">Samhita Builders</td>
<td width="170" style="font-weight: 400;">Samhita Rainbow</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">7th Floor, Arden Fair, Pai Layout, Opp Bennaganahalli Flyover, <br /> Old Madras Road, Bangaluru-560016.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">632</td>
<td width="164" style="font-weight: 400;">Samhita Builders</td>
<td width="170" style="font-weight: 400;">Samhita Maruti Home's</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">7th Floor, Arden Fair, Pai Layout, Opp Bennaganahalli Flyover, <br /> Old Madras Road, Bangaluru-560016.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">633</td>
<td width="164" style="font-weight: 400;">Samhita Builders</td>
<td width="170" style="font-weight: 400;">Samhita Greenwoods</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">7th Floor, Arden Fair, Pai Layout, Opp Bennaganahalli Flyover, <br /> Old Madras Road, Bangaluru-560016.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">634</td>
<td width="164" style="font-weight: 400;">Samhita Builders</td>
<td width="170" style="font-weight: 400;">Samhita Royal Splendor</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">7th Floor, Arden Fair, Pai Layout, Opp Bennaganahalli Flyover, <br /> Old Madras Road, Bangaluru-560016.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">635</td>
<td width="164" style="font-weight: 400;">Samhita Builders</td>
<td width="170" style="font-weight: 400;">Samhitha Sarovar</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">7th Floor, Arden Fair, Pai Layout, Opp Bennaganahalli Flyover, <br /> Old Madras Road, Bangaluru-560016.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">636</td>
<td width="164" style="font-weight: 400;">Ziva Ventures</td>
<td width="170" style="font-weight: 400;">PLATINUM GREEN</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 869, 8th Cross, 80 Feet Road, 8th Block, Koramangala, Bengaluru-560095.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">637</td>
<td width="164" style="font-weight: 400;">Ziva Ventures</td>
<td width="170" style="font-weight: 400;">Mount Zoe Phase 2</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 869, 8th Cross, 80 Feet Road, 8th Block, Koramangala, Bengaluru-560095.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">638</td>
<td width="164" style="font-weight: 400;">Monika developers and Promoters,</td>
<td width="170" style="font-weight: 400;">SLV ENCLAVE</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 31, 1st Cross, Approova Layout, Nagarabhavi 2nd Stage, Bengaluru-560072.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">639</td>
<td width="164" style="font-weight: 400;">N. J. BUILDERS &amp; PROMOTERS</td>
<td width="170" style="font-weight: 400;">NJ DAFFODIL,</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">4 th Floor, Near City Hospital, Malikkate, Mangalore-575003.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">640</td>
<td width="164" style="font-weight: 400;">N. J. BUILDERS &amp; PROMOTERS</td>
<td width="170" style="font-weight: 400;">EDEN ENCLAVE</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">4 th Floor, Near City Hospital, Malikkate, Mangalore-575003.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">641</td>
<td width="164" style="font-weight: 400;">N. J. BUILDERS &amp; PROMOTERS</td>
<td width="170" style="font-weight: 400;">COTTAGE</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">4 th Floor, Near City Hospital, Malikkate, Mangalore-575003.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">642</td>
<td width="164" style="font-weight: 400;">HNGC BUILDERS &amp; DEVELOPERS</td>
<td width="170" style="font-weight: 400;">Icon City</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">NH-66, Surathkal, Mangalore -575014.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">643</td>
<td width="164" style="font-weight: 400;">HNGC BUILDERS &amp; DEVELOPERS</td>
<td width="170" style="font-weight: 400;">Icon Tower</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">NH-66, Surathkal, Mangalore -575014.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">644</td>
<td width="164" style="font-weight: 400;">HNGC BUILDERS &amp; DEVELOPERS</td>
<td width="170" style="font-weight: 400;">Garden City</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">NH-66, Surathkal, Mangalore -575014.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">645</td>
<td width="164" style="font-weight: 400;">HNGC BUILDERS &amp; DEVELOPERS</td>
<td width="170" style="font-weight: 400;">Green City</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">NH-66, Surathkal, Mangalore -575014.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">646</td>
<td width="164" style="font-weight: 400;">HNGC BUILDERS &amp; DEVELOPERS</td>
<td width="170" style="font-weight: 400;">City Max</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">NH-66, Surathkal, Mangalore -575014.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">647</td>
<td width="164" style="font-weight: 400;">S4 Associates</td>
<td width="170" style="font-weight: 400;">S4 Sky Rock Villa</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Regal Towers, # 54 &amp; 55, First floor Near, KSRTC, Bejai, Mangalore-575004.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">648</td>
<td width="164" style="font-weight: 400;">S4 Associates</td>
<td width="170" style="font-weight: 400;">S4 Sea Rock Villa</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Regal Towers, # 54 &amp; 55, First floor Near, KSRTC, Bejai, Mangalore-575004.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">649</td>
<td width="164" style="font-weight: 400;">JPS Infra Developers</td>
<td width="170" style="font-weight: 400;">JPS SAMRUDDHI</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 13-2-105, SLN Complex, GHS Road, Mangalore &ndash; 575001.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">650</td>
<td width="164" style="font-weight: 400;">Shri Mookambika Constructions</td>
<td width="170" style="font-weight: 400;">FLORENTINE</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Ground floor, Essel Center, M.G Road, Mangalore-575003.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">651</td>
<td width="164" style="font-weight: 400;">Shri Mookambika Constructions</td>
<td width="170" style="font-weight: 400;">BONDEL</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Ground floor, Essel Center, M.G Road, Mangalore-575003.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">652</td>
<td width="164" style="font-weight: 400;">Shri Mookambika Constructions</td>
<td width="170" style="font-weight: 400;">RMP</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Ground floor, Essel Center, M.G Road, Mangalore-575003.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">653</td>
<td width="164" style="font-weight: 400;">Shri Mookambika Constructions</td>
<td width="170" style="font-weight: 400;">SAI GRAND VIEW</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Ground floor, Essel Center, M.G Road, Mangalore-575003.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">654</td>
<td width="164" style="font-weight: 400;">Aashiya Developers</td>
<td width="170" style="font-weight: 400;">Aashiya Developers</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Gaibusab S/O Khasimsab Yalligutli, Ward No.10, H No. 192/4, Behind Old IB, Hubli Bypas Road, Baglukot-587103.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">655</td>
<td width="164" style="font-weight: 400;">Roma Builders</td>
<td width="170" style="font-weight: 400;">Roma Epicurean&nbsp;</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># P-1, Raycon Orchad Apartments, 4th Cross, 'A'&nbsp; Block, AECS Layout, Kundala Halli, Bengaluru-560037.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">656</td>
<td width="164" style="font-weight: 400;">Eternity Developers</td>
<td width="170" style="font-weight: 400;">Eternity Developers</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 11, Hayes Road, Bengaluru-560025.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">657</td>
<td width="164" style="font-weight: 400;">Nandhini Hotel Pvt. Ltd.</td>
<td width="170" style="font-weight: 400;">Nandhini Hotel Pvt. Ltd.</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 114/1, Lalbagh Fort Road, Minerva Circle, Bengaluru-560004.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">658</td>
<td width="164" style="font-weight: 400;">Maitri Developers</td>
<td width="170" style="font-weight: 400;">Shilpitha Splendor</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Sri Kote Ashirwad Tower, Outer Ring Road, Doddanekundi, Marathalli, Bengaluru-560075.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">659</td>
<td width="164" style="font-weight: 400;">Maxworth Realty India Pvt Ltd</td>
<td width="170" style="font-weight: 400;">Max Meadows</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">KMP House, 12/2, Yamuna Bal Road, Madhava Nagar Road, <br /> Bengaluru-560001.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">660</td>
<td width="164" style="font-weight: 400;">Maxworth Realty India Pvt Ltd</td>
<td width="170" style="font-weight: 400;">Max Sindoor</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">KMP House, 12/2, Yamuna Bal Road, Madhava Nagar Road, <br /> Bengaluru-560001.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">661</td>
<td width="164" style="font-weight: 400;">Maxworth Realty India Pvt Ltd</td>
<td width="170" style="font-weight: 400;">Max Spandana</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">KMP House, 12/2, Yamuna Bal Road, Madhava Nagar Road, <br /> Bengaluru-560001.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">662</td>
<td width="164" style="font-weight: 400;">Maxworth Realty India Pvt Ltd</td>
<td width="170" style="font-weight: 400;">Max Keerthana</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">KMP House, 12/2, Yamuna Bal Road, Madhava Nagar Road, <br /> Bengaluru-560001.</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">663</td>
<td width="164" style="font-weight: 400;">Maxworth Home Ltd</td>
<td width="170" style="font-weight: 400;">Maxworth Nagar</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">MAXWORTH HOME LIMITED , Maxworth Nagar, s.kolathur, kovilambakkam post. Chennai-600129</td>
<td width="101">09-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">664</td>
<td width="164" style="font-weight: 400;">Adhvaytha Developers</td>
<td width="170" style="font-weight: 400;">Silicon Greens</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 115, 2ndFloor, 10thMain, 14th Cross,Sector-6, HSR Layout, Bengaluru.&nbsp;</td>
<td width="101">02-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">665</td>
<td width="164" style="font-weight: 400;">Adhvaytha Developers</td>
<td width="170" style="font-weight: 400;">Adhvaytha JAS</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 115, 2ndFloor, 10thMain, 14th Cross,Sector-6, HSR Layout, Bengaluru.&nbsp;</td>
<td width="101">02-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">666</td>
<td width="164" style="font-weight: 400;">Adhvaytha Developers</td>
<td width="170" style="font-weight: 400;">Adhvaytha Greens</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 115, 2ndFloor, 10thMain, 14th Cross,Sector-6, HSR Layout, Bengaluru.&nbsp;</td>
<td width="101">02-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">667</td>
<td width="164" style="font-weight: 400;">Adhvaytha Developers</td>
<td width="170" style="font-weight: 400;">Adhvaytha Midas</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 115, 2ndFloor, 10thMain, 14th Cross,Sector-6, HSR Layout, Bengaluru.&nbsp;</td>
<td width="101">02-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">668</td>
<td width="164" style="font-weight: 400;">MCB Aassetz</td>
<td width="170" style="font-weight: 400;">MCB Amaravati</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 50 HMT Layout, 1st floor, 7th Cross, R.T. Nagar (Behind Aircel Showroom), Bengaluru-560032.</td>
<td width="101">02-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">669</td>
<td width="164" style="font-weight: 400;">MCB Aassetz</td>
<td width="170" style="font-weight: 400;">Nityotsava New Town</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 50 HMT Layout, 1st floor, 7th Cross, R.T. Nagar (Behind Aircel Showroom), Bengaluru-560032.</td>
<td width="101">02-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">670</td>
<td width="164" style="font-weight: 400;">MCB Aassetz</td>
<td width="170" style="font-weight: 400;">Palmvielle</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 50 HMT Layout, 1st floor, 7th Cross, R.T. Nagar (Behind Aircel Showroom), Bengaluru-560032.</td>
<td width="101">02-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">671</td>
<td width="164" style="font-weight: 400;">MCB Aassetz</td>
<td width="170" style="font-weight: 400;">Tranquil Town</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 50 HMT Layout, 1st floor, 7th Cross, R.T. Nagar (Behind Aircel Showroom), Bengaluru-560032.</td>
<td width="101">02-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">672</td>
<td width="164" style="font-weight: 400;">MCB Aassetz</td>
<td width="170" style="font-weight: 400;">Kadamba Township</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 50 HMT Layout, 1st floor, 7th Cross, R.T. Nagar (Behind Aircel Showroom), Bengaluru-560032.</td>
<td width="101">02-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">673</td>
<td width="164" style="font-weight: 400;">MCB Aassetz</td>
<td width="170" style="font-weight: 400;">MCB Lakshya</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 50 HMT Layout, 1st floor, 7th Cross, R.T. Nagar (Behind Aircel Showroom), Bengaluru-560032.</td>
<td width="101">02-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">674</td>
<td width="164" style="font-weight: 400;">VR Residency Pvt Ltd</td>
<td width="170" style="font-weight: 400;">VR Shobha Meadows</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># LIG &ndash; 65D, Ground Floor, KHB Colony, Near Police Station, Hoskote, Bengaluru-562114.</td>
<td width="101">02-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">675</td>
<td width="164" style="font-weight: 400;">VR Residency Pvt Ltd</td>
<td width="170" style="font-weight: 400;">VR Elegance</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># LIG &ndash; 65D, Ground Floor, KHB Colony, Near Police Station, Hoskote, Bengaluru-562114.</td>
<td width="101">02-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">676</td>
<td width="164" style="font-weight: 400;">SJ DEVELOPERS</td>
<td width="170" style="font-weight: 400;">SJ Splendour Nest</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 118, 8TH CROSS, 1ST MAIN ROAD PAI LAYOUT, K R PURAM NEAR TIN FACTORY, Bengaluru-560016.</td>
<td width="101">02-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">677</td>
<td width="164" style="font-weight: 400;">Purvacity Group&nbsp;</td>
<td width="170" style="font-weight: 400;">Telecom Smart City</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 255, Vijayalakshmi Buggi Sadan 4th floor, 1st Cross, Ganganagar Layout, Bengaluru-560032.&nbsp;</td>
<td width="101">02-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">678</td>
<td width="164" style="font-weight: 400;">Purvacity Group&nbsp;</td>
<td width="170" style="font-weight: 400;">Purvacity Garden City&nbsp;</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 255,Vijayalakshmi Buggi Sadan 4th floor, 1st Cross, Ganganagar Layout, Bengaluru-560032.&nbsp;</td>
<td width="101">02-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">679</td>
<td width="164" style="font-weight: 400;">ESCON Developers</td>
<td width="170" style="font-weight: 400;">ADITHYA ELIXIR</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 32, 14th Main Road,&nbsp;Opp. to BDA Complex, 4th Sector, HSR Layout, <br /> Bengaluru-560034.</td>
<td width="101">02-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">680</td>
<td width="164" style="font-weight: 400;">ESCON Developers</td>
<td width="170" style="font-weight: 400;">ADITHYA HOMES PHASE III</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 32, 14th Main Road,&nbsp;Opp. to BDA Complex, 4th Sector, HSR Layout, <br /> Bengaluru-560034.</td>
<td width="101">02-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">681</td>
<td width="164" style="font-weight: 400;">ESCON Developers</td>
<td width="170" style="font-weight: 400;">ADITHYA HOMES</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 32, 14th Main Road,&nbsp;Opp. to BDA Complex, 4th Sector, HSR Layout, <br /> Bengaluru-560034.</td>
<td width="101">02-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">682</td>
<td width="164" style="font-weight: 400;">ESCON Developers</td>
<td width="170" style="font-weight: 400;">inf valley&nbsp;</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 32, 14th Main Road,&nbsp;Opp. to BDA Complex, 4th Sector, HSR Layout, <br /> Bengaluru-560034.</td>
<td width="101">02-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">683</td>
<td width="164" style="font-weight: 400;">M/s. Balaji Developers</td>
<td width="170" style="font-weight: 400;">Balaji Eternal Bliss</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Behind Prashanth Layout, (Near Hope Farm) Whitefield, Bengaluru-560066.</td>
<td width="101">02-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">684</td>
<td width="164" style="font-weight: 400;">M/s. Balaji Developers</td>
<td width="170" style="font-weight: 400;">Balaji Casa Blanca</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Behind Prashanth Layout, (Near Hope Farm) Whitefield, Bengaluru-560066.</td>
<td width="101">02-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">685</td>
<td width="164" style="font-weight: 400;">WHITE OAK REALTY PARTNERS,</td>
<td width="170" style="font-weight: 400;">Worp 62</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 755 BOGINENI, KRISHNA TEMPLE ROAD, INDIRANAGAR, 1ST STAGE, Bengaluru-560038.</td>
<td width="101">02-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">686</td>
<td width="164" style="font-weight: 400;">WHITE OAK REALTY PARTNERS,</td>
<td width="170" style="font-weight: 400;">Worp 65</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 755 BOGINENI, KRISHNA TEMPLE ROAD, INDIRANAGAR, 1ST STAGE, Bengaluru-560038.</td>
<td width="101">02-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">687</td>
<td width="164" style="font-weight: 400;">WHITE OAK REALTY PARTNERS,</td>
<td width="170" style="font-weight: 400;">Worp 81</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 755 BOGINENI, KRISHNA TEMPLE ROAD, INDIRANAGAR, 1ST STAGE, Bengaluru-560038.</td>
<td width="101">02-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">688</td>
<td width="164" style="font-weight: 400;">WHITE OAK REALTY PARTNERS,</td>
<td width="170" style="font-weight: 400;">Worp 99</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 755 BOGINENI, KRISHNA TEMPLE ROAD, INDIRANAGAR, 1ST STAGE, Bengaluru-560038.</td>
<td width="101">02-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">689</td>
<td width="164" style="font-weight: 400;">WHITE OAK REALTY PARTNERS,</td>
<td width="170" style="font-weight: 400;">Worp Down Town Park&nbsp;</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 755 BOGINENI, KRISHNA TEMPLE ROAD, INDIRANAGAR, 1ST STAGE, Bengaluru-560038.</td>
<td width="101">02-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">690</td>
<td width="164" style="font-weight: 400;">WHITE OAK REALTY PARTNERS,</td>
<td width="170" style="font-weight: 400;">Bogineni</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 755 BOGINENI, KRISHNA TEMPLE ROAD, INDIRANAGAR, 1ST STAGE, Bengaluru-560038.</td>
<td width="101">02-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">691</td>
<td width="164" style="font-weight: 400;">Synergyone House,</td>
<td width="170" style="font-weight: 400;">Woods Ville</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Opp. Kendriya Vihar, Venkatala,NH -7, Airport Road, Yelahanka, Bangaluru.</td>
<td width="101">02-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">692</td>
<td width="164" style="font-weight: 400;">Synergyone House,</td>
<td width="170" style="font-weight: 400;">Synergyone Icon City&nbsp;</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Opp. Kendriya Vihar, Venkatala,NH -7, Airport Road, Yelahanka, Bangaluru.</td>
<td width="101">02-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">693</td>
<td width="164" style="font-weight: 400;">ALPS Prime Spaces Private Limited</td>
<td width="170" style="font-weight: 400;">Aurora</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Vaibhav Residency,Flat No. 201, Plot No. 2, 16 A Cross,Neeladri Nagar, Phase I,Electronic City, Bengaluru - 560 100</td>
<td width="101">02-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">694</td>
<td width="164" style="font-weight: 400;">ALPS Prime Spaces Private Limited</td>
<td width="170" style="font-weight: 400;">ALPS Northbrook</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Vaibhav Residency, Flat # 201, Plot # 2, 16 A Cross, Neeladri Nagar, Phase I, Electronic City, Bengaluru-560100.</td>
<td width="101">02-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">695</td>
<td width="164" style="font-weight: 400;">Aban developers&nbsp;</td>
<td width="170" style="font-weight: 400;">Aban&nbsp;Dazzle</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 450, 2nd Floor, 6th Main, 7th Cross, BTM 2nd Stage,&nbsp;MICO Layout, Bengaluru-560076.</td>
<td width="101">02-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">696</td>
<td width="164" style="font-weight: 400;">Anubhava&nbsp;Group</a></td>
<td width="170" style="font-weight: 400;">Ishwerya QUARTZ</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 37/1A, Meanee Avenue, Tank Road Cross, Opp:Lake Side Hospital, <br /> Bengaluru-560042.</td>
<td width="101">02-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">697</td>
<td width="164" style="font-weight: 400;">Anubhava&nbsp;Group</a></td>
<td width="170" style="font-weight: 400;">Ishwerya IRIS</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 37/1A, Meanee Avenue, Tank Road Cross, Opp:Lake Side Hospital, <br /> Bengaluru-560042.</td>
<td width="101">02-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">698</td>
<td width="164" style="font-weight: 400;">Anubhava&nbsp;Group</a></td>
<td width="170" style="font-weight: 400;">Ishwerya ELITE</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 37/1A, Meanee Avenue, Tank Road Cross, Opp:Lake Side Hospital, <br /> Bengaluru-560042.</td>
<td width="101">02-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">699</td>
<td width="164" style="font-weight: 400;">Anubhava&nbsp;Group</a></td>
<td width="170" style="font-weight: 400;">Ishwerya MAY FLOWER</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 37/1A, Meanee Avenue, Tank Road Cross, Opp:Lake Side Hospital, <br /> Bengaluru-560042.</td>
<td width="101">02-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">700</td>
<td width="164" style="font-weight: 400;">Anubhava&nbsp;Group</a></td>
<td width="170" style="font-weight: 400;">Ishwerya PRIMROSE</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 37/1A, Meanee Avenue, Tank Road Cross, Opp:Lake Side Hospital, <br /> Bengaluru-560042.</td>
<td width="101">02-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">701</td>
<td width="164" style="font-weight: 400;">Anubhava&nbsp;Group</a></td>
<td width="170" style="font-weight: 400;">Ishwerya OPAL</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 37/1A, Meanee Avenue, Tank Road Cross, Opp:Lake Side Hospital, <br /> Bengaluru-560042.</td>
<td width="101">02-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">702</td>
<td width="164" style="font-weight: 400;">Anubhava&nbsp;Group</a></td>
<td width="170" style="font-weight: 400;">Ishwerya CORAL</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 37/1A, Meanee Avenue, Tank Road Cross, Opp:Lake Side Hospital, <br /> Bengaluru-560042.</td>
<td width="101">02-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">703</td>
<td width="164" style="font-weight: 400;">Anubhava&nbsp;Group</a></td>
<td width="170" style="font-weight: 400;">Sai BRINDA</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 37/1A, Meanee Avenue, Tank Road Cross, Opp:Lake Side Hospital, <br /> Bengaluru-560042.</td>
<td width="101">02-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">704</td>
<td width="164" style="font-weight: 400;">Anubhava&nbsp;Group</a></td>
<td width="170" style="font-weight: 400;">Ishwerya LOTUS</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 37/1A, Meanee Avenue, Tank Road Cross, Opp:Lake Side Hospital, <br /> Bengaluru-560042.</td>
<td width="101">02-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">705</td>
<td width="164" style="font-weight: 400;">Anubhava&nbsp;Group</a></td>
<td width="170" style="font-weight: 400;">Ishwerya CLASSIC</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 37/1A, Meanee Avenue, Tank Road Cross, Opp:Lake Side Hospital, <br /> Bengaluru-560042.</td>
<td width="101">02-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">706</td>
<td width="164" style="font-weight: 400;">Dwarakamai's Housing pvt ltd</td>
<td width="170" style="font-weight: 400;">Jupiter</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 563, Sai Dhamam, AECS Main Road, Near rangam Super Market, Kundana Halli Gate, Marthahalli, Bengaluru-560037.</td>
<td width="101">02-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">707</td>
<td width="164" style="font-weight: 400;">Aavani Promoter and Developers</td>
<td width="170" style="font-weight: 400;">Avani Jasmine</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Hotel Navaratna Complex, K.S. Rao Road, Mangalore-575001.</td>
<td width="101">02-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">708</td>
<td width="164" style="font-weight: 400;">BHARATHI BUILDERS &amp; DEVELOPERS</td>
<td width="170" style="font-weight: 400;">Bharathi Greens</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">2nd Floor, Plama Center, Near Bharath Mall,&nbsp; Bejai Kapikad Road,<br /> Mangalore-575004.</td>
<td width="101">02-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">709</td>
<td width="164" style="font-weight: 400;">WALK IN BUILDERS AND DEVELOPERS</td>
<td width="170" style="font-weight: 400;">Walk-In Arcadia</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">City Hospital Building, Ground Floor, Kadri, Mangalore-575003.</td>
<td width="101">02-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">710</td>
<td width="164" style="font-weight: 400;">White Stone Developers</td>
<td width="170" style="font-weight: 400;">Whitestone Gateway</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Al-Rahaba Plaza, Shop No. C-14,1st Floor, D.No. -20-2-156/31, Near State Bank<br /> Mangalore-575001</td>
<td width="101">02-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">711</td>
<td width="164" style="font-weight: 400;">P. Ashok Kumar and P Manjula</td>
<td width="170" style="font-weight: 400;">EDEN BLOSSOMS&nbsp;</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">M/S Sai Snigdha constructions Pvt Ltd,&nbsp; No. 60,1st Cross, JP nagar, 4Th Phase Dollar , Bangalore- 560078</td>
<td width="101">02-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">712</td>
<td width="164" style="font-weight: 400;">M. Suresh&nbsp;</td>
<td width="170" style="font-weight: 400;">Eshanya Green Valley&nbsp;</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 23/1, Papiah layouts 3rd Dross, Ganesh road Horamavu,<br /> Bengaluru Rural-560043.</td>
<td width="101">02-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">713</td>
<td width="164" style="font-weight: 400;">Maxworth realty India limited&nbsp;</td>
<td width="170" style="font-weight: 400;">Sadana II</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># G1, nest Amaze2, # 72, Sri Alamelumangapuram Colony, sholinganalluruv Kanchipuram-600119.</td>
<td width="101">02-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">714</td>
<td width="164" style="font-weight: 400;">Thanuja,&nbsp;</td>
<td width="170" style="font-weight: 400;">Golden days&nbsp;&nbsp;</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">E-304 Bren celestia Apartments, Kaikondarahalli Jn, Sarjapura Main Road,Bengaluru urban-560035.</td>
<td width="101">02-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">715</td>
<td width="164" style="font-weight: 400;">N. Srinivasa</td>
<td width="170" style="font-weight: 400;">Vaishnavi Mandara&nbsp;</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 14 Sterling Heights , Flats 201,9th Cross, Malleswaram, <br /> Bengaluru-560003.</td>
<td width="101">02-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">716</td>
<td width="164" style="font-weight: 400;">Mr. Kirti k. Mehta</td>
<td width="170" style="font-weight: 400;">Unishire Atrium</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">So- Abul Kalam,Srigram Salkocha, Dhubri -783348.</td>
<td width="101">02-02-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">717</td>
<td width="164" style="font-weight: 400;">Sitrus Projects Pvt. Ltd.</td>
<td width="170" style="font-weight: 400;">SAI MEADOWS</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 147, 1st Floor, Vasavi Complex,1st Main Seshadripuram,&nbsp;Bangalore - 560020.</td>
<td>28-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">718</td>
<td width="164" style="font-weight: 400;">Sitrus Projects Pvt. Ltd.</td>
<td width="170" style="font-weight: 400;">SITRUS VALLEY</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 147, 1st Floor, Vasavi Complex,1st Main Seshadripuram,&nbsp;Bangalore - 560020.</td>
<td>28-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">719</td>
<td width="164" style="font-weight: 400;">Sitrus Projects Pvt. Ltd.</td>
<td width="170" style="font-weight: 400;">SITRUS MEADOWS</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 147, 1st Floor, Vasavi Complex,1st Main Seshadripuram,&nbsp;Bangalore - 560020.</td>
<td>28-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">720</td>
<td width="164" style="font-weight: 400;">Kyros Realty Pvt Ltd</td>
<td width="170" style="font-weight: 400;">Kyros Pegasus</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Sakamma Complex, 3rd Floor, Sanjeevini Nagar, Kodigehalli Main Road, Sahakar Nagar Post, Bangalore-560 092</td>
<td>28-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">721</td>
<td width="164" style="font-weight: 400;">Kyros Realty Pvt Ltd</td>
<td width="170" style="font-weight: 400;">Kyros Sentinel&rsquo;s Pride</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Sakamma Complex,3rd Floor,Sanjeevini Nagar,Kodigehalli Main Road, Sahakar Nagar Post,Bangalore-560 092</td>
<td>28-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">722</td>
<td width="164" style="font-weight: 400;">Kyros Realty Pvt Ltd</td>
<td width="170" style="font-weight: 400;">KYROS SPRING VISTA</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Sakamma Complex,3rd Floor,Sanjeevini Nagar,Kodigehalli Main Road, Sahakar Nagar Post,Bangalore-560 092</td>
<td>28-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">723</td>
<td width="164" style="font-weight: 400;">Bijith international builders&nbsp;</td>
<td width="170" style="font-weight: 400;">Bijith Krupa,&nbsp;</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Survey No. 58/2, 58/3, 58/4 Doddaballapur Main Road, NH 207, Opposite Jain Temple, Devanahalli Town ,Bangalore Rural 562110,&nbsp;</td>
<td>28-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">724</td>
<td width="164" style="font-weight: 400;">Sri nandi developers and constructions&nbsp;</td>
<td width="170" style="font-weight: 400;">UJJWAL GARDEN RESIDENCY&nbsp;</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 14/101, 19th Main, 1st &lsquo;N&rsquo; block, Rajajinagar (Opp, Vidyavardhaka Sangha) Bangalore- 560 010</td>
<td>28-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">725</td>
<td width="164" style="font-weight: 400;">Sri nandi developers and constructions&nbsp;</td>
<td width="170" style="font-weight: 400;">LAKE MIST&nbsp;&nbsp;</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 14/101, 19th Main, 1st &lsquo;N&rsquo; block, Rajajinagar (Opp, Vidyavardhaka Sangha) Bangalore- 560 010</td>
<td>28-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">726</td>
<td width="164" style="font-weight: 400;">Sri nandi developers and constructions&nbsp;</td>
<td width="170" style="font-weight: 400;">SRINIDHI VSL GREEN VIEW&nbsp;</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 14/101, 19th Main, 1st &lsquo;N&rsquo; block, Rajajinagar (Opp, Vidyavardhaka Sangha) Bangalore- 560 010</td>
<td>28-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">727</td>
<td width="164" style="font-weight: 400;">Sri nandi developers and constructions&nbsp;</td>
<td width="170" style="font-weight: 400;">VSL Srindhi Green Valley&nbsp;</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 14/101, 19th Main, 1st &lsquo;N&rsquo; block, Rajajinagar (Opp, Vidyavardhaka Sangha) Bangalore- 560 010</td>
<td>28-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">728</td>
<td width="164" style="font-weight: 400;">Sri nandi developers and constructions&nbsp;</td>
<td width="170" style="font-weight: 400;">Nandi Brundavana Residency-&nbsp;</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 14/101, 19th Main, 1st &lsquo;N&rsquo; block, Rajajinagar (Opp, Vidyavardhaka Sangha) Bangalore- 560 010</td>
<td>28-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">729</td>
<td width="164" style="font-weight: 400;">Sri nandi developers and constructions&nbsp;</td>
<td width="170" style="font-weight: 400;">Nandi Nature Residency</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 14/101, 19th Main, 1st &lsquo;N&rsquo; block, Rajajinagar (Opp, Vidyavardhaka Sangha) Bangalore- 560 010</td>
<td>28-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">730</td>
<td width="164" style="font-weight: 400;">DAMDEN</td>
<td width="170" style="font-weight: 400;">Damden Aaladamara</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Damden Yerra, Thavarakere Main Road, Koramangala, Bangalore-560029.</td>
<td>28-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">731</td>
<td width="164" style="font-weight: 400;">DAMDEN</td>
<td width="170" style="font-weight: 400;">Damden Zephyr</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Damden Yerra, Thavarakere Main Road, Koramangala, Bangalore-560029.</td>
<td>28-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">732</td>
<td width="164" style="font-weight: 400;">DAMDEN</td>
<td width="170" style="font-weight: 400;">Damden Sienna</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Damden Yerra, Thavarakere Main Road, Koramangala, Bangalore-560029.</td>
<td>28-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">733</td>
<td width="164" style="font-weight: 400;">DAMDEN</td>
<td width="170" style="font-weight: 400;">Damden Neptunia</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Damden Yerra, Thavarakere Main Road, Koramangala, Bangalore-560029.</td>
<td>28-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">734</td>
<td width="164" style="font-weight: 400;">DAMDEN</td>
<td width="170" style="font-weight: 400;">Damden Yerra</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Damden Yerra, Thavarakere Main Road, Koramangala, Bangalore-560029.</td>
<td>28-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">735</td>
<td width="164" style="font-weight: 400;">DAMDEN</td>
<td width="170" style="font-weight: 400;">Damden Hermitage</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Damden Yerra, Thavarakere Main Road, Koramangala, Bangalore-560029.</td>
<td>28-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">736</td>
<td width="164" style="font-weight: 400;">DAMDEN</td>
<td width="170" style="font-weight: 400;">Damden Centrum</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Sy.No.36/37 Hebbal Industrial Area Damden Junction, Ring Road, Mysore - 570 016</td>
<td>28-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">737</td>
<td width="164" style="font-weight: 400;">DAMDEN</td>
<td width="170" style="font-weight: 400;">Damden Solarium</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Sy.No.36/37 Hebbal Industrial Area Damden Junction, Ring Road, Mysore - 570 016</td>
<td>28-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">738</td>
<td width="164" style="font-weight: 400;">DAMDEN</td>
<td width="170" style="font-weight: 400;">Damden Faunus</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Sy.No.36/37 Hebbal Industrial Area Damden Junction, Ring Road, Mysore - 570 016</td>
<td>28-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">739</td>
<td width="164" style="font-weight: 400;">DAMDEN</td>
<td width="170" style="font-weight: 400;">Damden City Square</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Sy.No.36/37 Hebbal Industrial Area Damden Junction, Ring Road, Mysore - 570 016</td>
<td>28-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">740</td>
<td width="164" style="font-weight: 400;">DAMDEN</td>
<td width="170" style="font-weight: 400;">Damden Arbor</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Sy.No.36/37 Hebbal Industrial Area Damden Junction, Ring Road, Mysore - 570 016</td>
<td>28-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">741</td>
<td width="164" style="font-weight: 400;">DAMDEN</td>
<td width="170" style="font-weight: 400;">Damden Pruthvi</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Sy.No.36/37 Hebbal Industrial Area Damden Junction, Ring Road, Mysore - 570 016</td>
<td>28-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">742</td>
<td width="164" style="font-weight: 400;">DAMDEN</td>
<td width="170" style="font-weight: 400;">Damden Beryl</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Sy.No.36/37 Hebbal Industrial Area Damden Junction, Ring Road, Mysore - 570 016</td>
<td>28-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">743</td>
<td width="164" style="font-weight: 400;">Mahaveer Developers</td>
<td width="170" style="font-weight: 400;">Adishwar Nagar</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># C-1,New Kanthraj Urs Road, Opposite Apollo Hospital, Sigma Mall,Kuvempunagar<br /> Mysuru-570023</td>
<td>28-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">744</td>
<td width="164" style="font-weight: 400;">Mahaveer Developers</td>
<td width="170" style="font-weight: 400;">Mahaveer Nagar</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># C-1,New Kanthraj Urs Road, Opposite Apollo Hospital, Sigma Mall,Kuvempunagar<br /> Mysuru-570023</td>
<td>28-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">745</td>
<td width="164" style="font-weight: 400;">FN Infrastructures Pvt Ltd</td>
<td width="170" style="font-weight: 400;">FN Infrastructures Pvt Ltd Silver Springs</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">SR complex #2, Ground Floor, Tavarekere Main Road, S.G Palya, DRC Post, Kormangala, Bangalore - 560029</td>
<td>28-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">746</td>
<td width="164" style="font-weight: 400;">FN Infrastructures Pvt Ltd</td>
<td width="170" style="font-weight: 400;">FN Infrastructures Pvt Ltd Pruthvi</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">SR complex #2, Ground Floor, Tavarekere Main Road, S.G Palya, DRC Post, Kormangala, Bangalore - 560029</td>
<td>28-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">747</td>
<td width="164" style="font-weight: 400;">Land Links</td>
<td width="170" style="font-weight: 400;">Green Park</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">#9, City Point, Kodialbail,Mangalore - 57500.</td>
<td>28-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">748</td>
<td width="164" style="font-weight: 400;">Lakshmishyam Developers</td>
<td width="170" style="font-weight: 400;">Grand Meridian</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">#3-58, NH-66 light road, Kaup, Udupi-574106</td>
<td>28-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">749</td>
<td width="164" style="font-weight: 400;">Aditi Builders</td>
<td width="170" style="font-weight: 400;">Aditi Aradhya</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Baliga Arcade, VST Road, Udupi-576101</td>
<td>28-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">750</td>
<td width="164" style="font-weight: 400;">Sri Balaji Builders &amp; Developers.</td>
<td width="170" style="font-weight: 400;">Moon light residency off mysore road</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"><br /> #24, Hoysala Circle, off&nbsp; Bangalore one, KENGERI, Bangalore-560060.</td>
<td>28-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">751</td>
<td width="164" style="font-weight: 400;">KARNATAKA STATE TELECOM,IT,BT AND <br /> OTHER EMPLOYEES HOUSING CO-OPERATIVE SOCIETY LTD.(R)</td>
<td width="170" style="font-weight: 400;">Telecom Nest @ Rajankunte&nbsp;</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">&nbsp;#41, NATARAJA COMPLEX, SOUTH END ROAD,<br /> SHESHADRIPURAM POST, MALLESHWARAM,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br /> Malleshwaram West, Bengaluru- 560003.</td>
<td>28-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">752</td>
<td width="164" style="font-weight: 400;">AKMAXX&nbsp; Properties,</td>
<td width="170" style="font-weight: 400;">SRI SAI ASHIRWAD Phase-2&nbsp;</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">&nbsp;#11, Krishna Tower, Income Tax Layout, Chandra Layout Main Road, Vijayanagar, Bangalore-560040</td>
<td>28-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">753</td>
<td width="164" style="font-weight: 400;">UPKAR TOWERS,</td>
<td width="170" style="font-weight: 400;">UPKAR Spring Valley&nbsp;</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 28,&nbsp; 9th Cross , 2nd Block, RV College, Jayanagar, Bangalore &ndash; 560011.</td>
<td>28-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">754</td>
<td width="164" style="font-weight: 400;">Shiva developers,</td>
<td width="170" style="font-weight: 400;">RAJARAJESHWARI RESIDENCY&nbsp;</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 3, Leela arcade, 2nd floor, behind BDA complex, 3rd block, <br /> Nagarbhavi 2nd stage, Bengaluru &ndash; 560072</td>
<td>28-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">755</td>
<td width="164" style="font-weight: 400;">AK Maxx Properties</td>
<td width="170" style="font-weight: 400;">Sri Sai Nirvana</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">#11, Krishna Tower, Income Tax Layout, Chandra Layout Main Road, Vijayanagar, Bengaluru-560040.</td>
<td>12-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">756</td>
<td width="164" style="font-weight: 400;">AK Maxx Properties</td>
<td width="170" style="font-weight: 400;">Sri Sai Darshan</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">#11, Krishna Tower, Income Tax Layout, Chandra Layout Main Road, Vijayanagar, Bengaluru-560040.</td>
<td>12-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">757</td>
<td width="164" style="font-weight: 400;">Aastha Properties</td>
<td width="170" style="font-weight: 400;">Sai Golden Orchids</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">#1,&nbsp; 1st Stage,&nbsp; 3rd phase, 9th Cross, Chandralayout, Bengaluru-560040.</td>
<td>12-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">758</td>
<td width="164" style="font-weight: 400;">Yashasvi Group</td>
<td width="170" style="font-weight: 400;">Green Avenues</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Althan-Bhimrad Road, Near Check Post, Bhimrad, Surat, Gujarat.</td>
<td>12-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">759</td>
<td width="164" style="font-weight: 400;">Adithya Garden</td>
<td width="170" style="font-weight: 400;">Adithya Garden</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">#103, 80 Feet Road, BDA Layout , Anjanapura, Bengaluru-560072.</td>
<td>12-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">760</td>
<td width="164" style="font-weight: 400;">Charana Promoters And Developers</td>
<td width="170" style="font-weight: 400;">Vishwas Enclave</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">first floor, Inland Ornate,Navabharath Circle, Mangalore 575003.</td>
<td>12-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">761</td>
<td width="164" style="font-weight: 400;">Avani Ventures</td>
<td width="170" style="font-weight: 400;">Gajaria Enclave Phase-2</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 120, Sondekoppa Road, Vinayaka Nagar, Nelamangala,</td>
<td>12-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">762</td>
<td width="164" style="font-weight: 400;">Green Valley</td>
<td width="170" style="font-weight: 400;">Green Valley</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 442, 3rd Floor, 5th Main, 6th Avenue, Teachers Colony, Koramangala, Bengaluru-560034.</td>
<td>12-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">763</td>
<td width="164" style="font-weight: 400;">MRR Groups</td>
<td width="170" style="font-weight: 400;">MRR Groups</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 540/11-12, Opp.Sub Registrar Office, Mysore Road, Kengri, Bengaluru-560060.</td>
<td>12-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">764</td>
<td width="164" style="font-weight: 400;">B.L.V.S Enclave</td>
<td width="170" style="font-weight: 400;">B.L.V.S Enclave</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">#87,11th Cross, Malleshwaram, Bengaluru-560003.</td>
<td>12-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">765</td>
<td width="164" style="font-weight: 400;">Railway Employees Co-Operative Housing Society Ltd</td>
<td width="170" style="font-weight: 400;">Railway Lake View</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 1099, 2nd Floor, 1st &lsquo;B&rsquo; Main Road, 10th &lsquo;B&rsquo; Cross, Yelahanka, New Town,&nbsp; Bengaluru-560064.</td>
<td>12-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">766</td>
<td width="164" style="font-weight: 400;">Adhik Properties</td>
<td width="170" style="font-weight: 400;">Brundavana Phase-2</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 315, 5th Main Road, 2nd Block, 3rd Stage (Near Carmel School), Basaveshwaranagar, Bengaluru-560079.</td>
<td>12-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">767</td>
<td width="164" style="font-weight: 400;">Sai Skanda Propeties</td>
<td width="170" style="font-weight: 400;">Sai Krishana Layout</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 82/1, Ganeshagudi, Savera Layout, Sondekoppa Road, Nelamangala town, Near Siddaganga College, Bengaluru-562123.</td>
<td>12-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">768</td>
<td width="164" style="font-weight: 400;">Sai Skanda Propeties</td>
<td width="170" style="font-weight: 400;">Sai Krishna Residency</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 82/1, Ganeshagudi, Savera Layout, Sondekoppa Road, Nelamangala town, Near Siddaganga College, Bengaluru-562123.</td>
<td>12-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">769</td>
<td width="164" style="font-weight: 400;">Sai Skanda Propeties</td>
<td width="170" style="font-weight: 400;">Sai Balaji Layout</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 82/1, Ganeshagudi, Savera Layout, Sondekoppa Road, Nelamangala town, Near Siddaganga College, Bengaluru-562123.</td>
<td>12-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">770</td>
<td width="164" style="font-weight: 400;">Sai Skanda Propeties</td>
<td width="170" style="font-weight: 400;">Sai Subramanya Residence</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 82/1, Ganeshagudi, Savera Layout, Sondekoppa Road, Nelamangala town, Near Siddaganga College, Bengaluru-562123.</td>
<td>12-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">771</td>
<td width="164" style="font-weight: 400;">Sai Skanda Propeties</td>
<td width="170" style="font-weight: 400;">Sai Maruti Enclave</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 82/1, Ganeshagudi, Savera Layout, Sondekoppa Road, Nelamangala town, Near Siddaganga College, Bengaluru-562123.</td>
<td>12-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">772</td>
<td width="164" style="font-weight: 400;">Aditya Townership Promoters</td>
<td width="170" style="font-weight: 400;">Aditya Townership Promoters</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">540, 2nd floor 8th main vijayanagar, Bengaluru- 560040, Karnataka</td>
<td>12-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">773</td>
<td width="164" style="font-weight: 400;">Carp Properties</td>
<td width="170" style="font-weight: 400;">Carp Properties</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 5a, Abi Deepi Nest, Devatha Layout Hennur Cross,Bengaluru-560043.</td>
<td>12-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">774</td>
<td width="164" style="font-weight: 400;">RK Enterprises</td>
<td width="170" style="font-weight: 400;">The California Holiday Village</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 18, 1st Floor, Opp. Karnagaka Agro Industries, New International Airport Road, Hebbal, Bengaluru-560024.</td>
<td>12-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">775</td>
<td width="164" style="font-weight: 400;">RK Enterprises</td>
<td width="170" style="font-weight: 400;">The California Country</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 18, 1st Floor, Opp. Karnagaka Agro Industries, New International Airport Road, Hebbal, Bengaluru-560024.</td>
<td>12-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">776</td>
<td width="164" style="font-weight: 400;">RK Enterprises</td>
<td width="170" style="font-weight: 400;">Rainbow Residency</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 18, 1st Floor, Opp. Karnagaka Agro Industries, New International Airport Road, Hebbal, Bengaluru-560024.</td>
<td>12-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">777</td>
<td width="164" style="font-weight: 400;">Manjushree Land Developers &amp; Constructions</td>
<td width="170" style="font-weight: 400;">Maruthi Doctors Township</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Near M.V.J Medical College, Hoskote,&nbsp; Bengaluru East Taluk-560067.</td>
<td>12-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">778</td>
<td width="164" style="font-weight: 400;">Trinco Property</td>
<td width="170" style="font-weight: 400;">Trinco Tranquil</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 305A, Anand Onyx, 2nd Floor, 15th Cross Sarakki, 100 Feet Road, JP Nagar, 5th Phase, Bengaluru - 560 078.</td>
<td>12-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">779</td>
<td width="164" style="font-weight: 400;">Vyasti Properties</td>
<td width="170" style="font-weight: 400;">Vyasti Properties</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 763, 1st Floor, Gowri Arch, 33rd A Cross, 9th Main, Jayanagar 4th Block, Bengaluru-560011.</td>
<td>12-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">780</td>
<td width="164" style="font-weight: 400;">RM Green Squares</td>
<td width="170" style="font-weight: 400;">Villa Plots @ Sarjapur</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 147, Sixth Ave San Francisco, CA.</td>
<td>12-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">781</td>
<td width="164" style="font-weight: 400;">Ponni Delta Retirement Community</td>
<td width="170" style="font-weight: 400;">Trichy</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">(info@ponnidelta.com)</td>
<td>12-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">782</td>
<td width="164" style="font-weight: 400;">Homeland Properties</td>
<td width="170" style="font-weight: 400;">HOME MEADOWS</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 53, Ground Floor, 10th Cross, 2nd Stage, 2nd Cross, Mahalakshmipuram, Bengaluru-560086.</td>
<td>12-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">783</td>
<td width="164" style="font-weight: 400;">Equninox Global Shelters</td>
<td width="170" style="font-weight: 400;">Equninox Global Shelters</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 1099,2nd Floor, 16th&lsquo;B&rsquo; Main Road, 16th &lsquo;B&rsquo; Cross, Yelahanka New Town, Bengaluru-560064.</td>
<td>12-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">784</td>
<td width="164" style="font-weight: 400;">Sapthagiri Developers</td>
<td width="170" style="font-weight: 400;">Sapthagiri Sannidhi</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 48, 23rd Main, Marenahalli, JP Nagar, 2nd Phase, Behind Mayura Bakery, Bengaluru-560078.</td>
<td>12-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">785</td>
<td width="164" style="font-weight: 400;">Upkar Group</td>
<td width="170" style="font-weight: 400;">Upkar Oakland</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 28,&nbsp; 9th Cross , 2nd Block, RV College, Jayanagar, Bengaluru-560011.</td>
<td>12-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">786</td>
<td width="164" style="font-weight: 400;">Durga Shree Ventures</td>
<td width="170" style="font-weight: 400;">Sri Saiashirwadphase-2</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 292, Anjanaadri Complex, 11th Block , 2nd Stage, Nagarbhavi, Bengaluru-560072.</td>
<td>12-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">787</td>
<td width="164" style="font-weight: 400;">Durga Shree Ventures</td>
<td width="170" style="font-weight: 400;">Dsv Model Village Phase-9</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 292, Anjanaadri Complex, 11th Block , 2nd Stage, Nagarbhavi, Bengaluru-560072.</td>
<td>12-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">788</td>
<td width="164" style="font-weight: 400;">Durga Shree Ventures</td>
<td width="170" style="font-weight: 400;">Magadi Road</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 292, Anjanaadri Complex, 11th Block , 2nd Stage, Nagarbhavi, Bengaluru-560072.</td>
<td>12-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">789</td>
<td width="164" style="font-weight: 400;">Kalyan Builders &amp; Developers</td>
<td width="170" style="font-weight: 400;">Moonlight Residency</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">#18, 2nd Floor, Jnanabharathi Main Road, Nagarbhavi, Opp To Madduramma Temple, Bengaluru-560072.</td>
<td>12-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">790</td>
<td width="164" style="font-weight: 400;">Merusri Real Estate Developers Pvt. Ltd.</td>
<td width="170" style="font-weight: 400;">Merusri Bharathi</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">2nd Floor, Trinity Squar, 'A' Block, Sahakara Nagar, Bengaluru-560092.</td>
<td>12-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">791</td>
<td width="164" style="font-weight: 400;">Merusri Real Estate Developers Pvt. Ltd.</td>
<td width="170" style="font-weight: 400;">Merusri Satyavan</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">2nd Floor, Trinity Squar, 'A' Block, Sahakara Nagar, Bengaluru-560092.</td>
<td>12-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">792</td>
<td width="164" style="font-weight: 400;">Sharanya Promoters And Developers</td>
<td width="170" style="font-weight: 400;">Sharanya Promoters And Developers</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 6, 2nd Floor, 2nd Main, 2nd Stage, Chandra Layout, Bengaluru-560040.</td>
<td>12-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">793</td>
<td width="164" style="font-weight: 400;">ACE DEVELOPERS</td>
<td width="170" style="font-weight: 400;">Hill Crest</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">First floor, Inland Ornate,Navabharath Circle, Mangalore 575003.</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">794</td>
<td width="164" style="font-weight: 400;">AK Builders &amp; Developers</td>
<td width="170" style="font-weight: 400;">IVY Apartment</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">2nd Floor, Mangalore Gate,Kankanady Bypass Road,Mangalore - 575002</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">795</td>
<td width="164" style="font-weight: 400;">AK Builders &amp; Developers</td>
<td width="170" style="font-weight: 400;">AK Mall</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">3rd Floor, Mangalore Gate,Kankanady Bypass Road,Mangalore -575002</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">796</td>
<td width="164" style="font-weight: 400;">Aprameya Properties Pvt. Ltd</td>
<td width="170" style="font-weight: 400;">Aprameya VRINDA</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">#2460. 24th Cross, 17th Main,near BDA Complex,Bengaluru-560070</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">797</td>
<td width="164" style="font-weight: 400;">Aprameya Properties Pvt. Ltd</td>
<td width="170" style="font-weight: 400;">APRAMEYA BRINDAVANAM</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">#2460. 24th Cross, 17th Main,near BDA Complex,Bengaluru-560070</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">798</td>
<td width="164" style="font-weight: 400;">Aprameya Properties Pvt. Ltd</td>
<td width="170" style="font-weight: 400;">Aprameya KUTEERAM</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">#2460. 24th Cross, 17th Main,near BDA Complex,Bengaluru-560070</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">799</td>
<td width="164" style="font-weight: 400;">Aprameya Properties Pvt. Ltd</td>
<td width="170" style="font-weight: 400;">KAVERAPPA LAYOUTS</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">#2460. 24th Cross, 17th Main,near BDA Complex,Bengaluru-560070</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">800</td>
<td width="164" style="font-weight: 400;">Bhomika Projects India Pvt Ltd</td>
<td width="170" style="font-weight: 400;">Mahalakshmi Paradiso</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">#85, 17th &lsquo;D&rsquo; Cross, 38th Main, Rose Garden,J P Nagar 6th Phase, Bengaluru - 560 078.</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">801</td>
<td width="164" style="font-weight: 400;">Bhomika Projects India Pvt Ltd</td>
<td width="170" style="font-weight: 400;">Flutus-Nest</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">#85, 17th &lsquo;D&rsquo; Cross, 38th Main, Rose Garden,J P Nagar 6th Phase, Bengaluru - 560 078.</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">802</td>
<td width="164" style="font-weight: 400;">CMRS Group</td>
<td width="170" style="font-weight: 400;">Misty Winds</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">#573, AECS Layout, C Block, Main Road, Opp. ICICI Bank, Bengaluru - 560037</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">803</td>
<td width="164" style="font-weight: 400;">CMRS Group</td>
<td width="170" style="font-weight: 400;">Courtyard</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">#573, AECS Layout, C Block, Main Road, Opp. ICICI Bank, Bengaluru - 560037</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">804</td>
<td width="164" style="font-weight: 400;">CMRS Group</td>
<td width="170" style="font-weight: 400;">CMRS Quanta</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">#573, AECS Layout, C Block, Main Road, Opp. ICICI Bank, Bengaluru - 560037</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">805</td>
<td width="164" style="font-weight: 400;">CMRS Group</td>
<td width="170" style="font-weight: 400;">Verdance</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">#573, AECS Layout, C Block, Main Road, Opp. ICICI Bank, Bengaluru - 560037</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">806</td>
<td width="164" style="font-weight: 400;">CMRS Group</td>
<td width="170" style="font-weight: 400;">Royal Orchid</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">#573, AECS Layout, C Block, Main Road, Opp. ICICI Bank, Bengaluru - 560037</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">807</td>
<td width="164" style="font-weight: 400;">CMRS Group</td>
<td width="170" style="font-weight: 400;">CMRS Oasis</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">#573, AECS Layout, C Block, Main Road, Opp. ICICI Bank, Bengaluru - 560037</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">808</td>
<td width="164" style="font-weight: 400;">Geomac Infrastructure&nbsp;</td>
<td width="170" style="font-weight: 400;">Geomac Esencia</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">2nd floor, Meenakshi Arcade,Deshpande Nagar,Hubli, Karnataka-580029.</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">809</td>
<td width="164" style="font-weight: 400;">Geomac Infrastructure&nbsp;&nbsp;</td>
<td width="170" style="font-weight: 400;">Geomac Exotica</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">2nd floor, Meenakshi Arcade,Deshpande Nagar,Hubli, Karnataka-580029.</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">810</td>
<td width="164" style="font-weight: 400;">HEXA Buiders</td>
<td width="170" style="font-weight: 400;">HEXA SUPREME</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">No. 314(old no.29), 33rd Cross, 17th main,&nbsp; 4th 'T' Block,pattabhirama Nagar, Jayanagar, Banglore 560 011.</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">811</td>
<td width="164" style="font-weight: 400;">Highcity Infraventures Limited</td>
<td width="170" style="font-weight: 400;">Highcity Pristine</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">25, sai krupa wing A, Puttanna road, Basavangudi, Banglore-560004.</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">812</td>
<td width="164" style="font-weight: 400;">Hindh Realty India Pvt Ltd</td>
<td width="170" style="font-weight: 400;">HINDH AERO City</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 400, 1st Block, 2nd Main Rd, RT Nagar,Bengaluru, Karnataka - 560032</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">813</td>
<td width="164" style="font-weight: 400;">Hindh Realty India Pvt Ltd</td>
<td width="170" style="font-weight: 400;">HINDH SAHANA</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 400, 1st Block, 2nd Main Rd, RT Nagar,Bengaluru, Karnataka - 560032</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">814</td>
<td width="164" style="font-weight: 400;">Hindh Realty India Pvt Ltd</td>
<td width="170" style="font-weight: 400;">HINDH GARDEN CITY</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 400, 1st Block, 2nd Main Rd, RT Nagar,Bengaluru, Karnataka - 560032</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">815</td>
<td width="164" style="font-weight: 400;">Hindh Realty India Pvt Ltd</td>
<td width="170" style="font-weight: 400;">HINDH NORTH CITY</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 400, 1st Block, 2nd Main Rd, RT Nagar,Bengaluru, Karnataka - 560032</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">816</td>
<td width="164" style="font-weight: 400;">Hindh Realty India Pvt Ltd</td>
<td width="170" style="font-weight: 400;">NANDHI HILL VIEW</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 400, 1st Block, 2nd Main Rd, RT Nagar,Bengaluru, Karnataka - 560032</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">817</td>
<td width="164" style="font-weight: 400;">Hindh Realty India Pvt Ltd</td>
<td width="170" style="font-weight: 400;">HINDH PARADISE</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;"># 400, 1st Block, 2nd Main Rd, RT Nagar,Bengaluru, Karnataka - 560032</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">818</td>
<td width="164" style="font-weight: 400;">Imam Hussain A.D(proprietor)</td>
<td width="170" style="font-weight: 400;">Ummathi Group</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">2nd floor opp.Axis bank,P.B road,toll naka,Dharwad-580001,</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">819</td>
<td width="164" style="font-weight: 400;">INFRATHON PROJECTS PVT LTD</td>
<td width="170" style="font-weight: 400;">Infrathon Ecofront</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">#45, 1st Floor, Industry House, Race Course Road, Bengaluru - 560001</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">820</td>
<td width="164" style="font-weight: 400;">K2 Builders and Realtors</td>
<td width="170" style="font-weight: 400;">K2 WOODS</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Metalco Plaza' , Falnir Road , Mangalore - 575 002</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">821</td>
<td width="164" style="font-weight: 400;">K2 Builders and Realtors</td>
<td width="170" style="font-weight: 400;">K2 HORIZON</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Metalco Plaza' , Falnir Road , Mangalore - 575 002</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">822</td>
<td width="164" style="font-weight: 400;">K2 Builders and Realtors</td>
<td width="170" style="font-weight: 400;">K2 AQUA</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Metalco Plaza' , Falnir Road , Mangalore - 575 002</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">823</td>
<td width="164" style="font-weight: 400;">K2 Builders and Realtors</td>
<td width="170" style="font-weight: 400;">K2 SENNA</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Metalco Plaza' , Falnir Road , Mangalore - 575 002</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">824</td>
<td width="164" style="font-weight: 400;">K2 Builders and Realtors</td>
<td width="170" style="font-weight: 400;">K2 HABITAT</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Metalco Plaza' , Falnir Road , Mangalore - 575 002</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">825</td>
<td width="164" style="font-weight: 400;">K2 Builders and Realtors</td>
<td width="170" style="font-weight: 400;">MEADOWS</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Metalco Plaza' , Falnir Road , Mangalore - 575 002</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">826</td>
<td width="164" style="font-weight: 400;">K2 Builders and Realtors</td>
<td width="170" style="font-weight: 400;">CREST</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Metalco Plaza' , Falnir Road , Mangalore - 575 002</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">827</td>
<td width="164" style="font-weight: 400;">KATARIA BUILTECK PVT LTD</td>
<td width="170" style="font-weight: 400;">Kataria Builteck Apartments</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Sy NoQ 51, Ground floor, K. B. Royal Apartment, R. S. Gardenia Layout, Bommasandra, Hosur Main Road, Bengaluru - 560 099.</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">828</td>
<td width="164" style="font-weight: 400;">KATARIA BUILTECK PVT LTD</td>
<td width="170" style="font-weight: 400;">Kataria Builteck Royale</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Sy NoQ 51, Ground floor, K. B. Royal Apartment, R. S. Gardenia Layout, Bommasandra, Hosur Main Road, Bengaluru - 560 099.</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">829</td>
<td width="164" style="font-weight: 400;">KATARIA BUILTECK PVT LTD</td>
<td width="170" style="font-weight: 400;">Kataria Builteck Eco City</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Sy NoQ 51, Ground floor, K. B. Royal Apartment, R. S. Gardenia Layout, Bommasandra, Hosur Main Road, Bengaluru - 560 099.</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">830</td>
<td width="164" style="font-weight: 400;">KATARIA BUILTECK PVT LTD</td>
<td width="170" style="font-weight: 400;">Kataria Builteck Paradise</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Sy NoQ 51, Ground floor, K. B. Royal Apartment, R. S. Gardenia Layout, Bommasandra, Hosur Main Road, Bengaluru - 560 099.</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">831</td>
<td width="164" style="font-weight: 400;">Maxworth Realty India Limited</td>
<td width="170" style="font-weight: 400;">Maxworth Suryodaya</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">#22/1, Railway parallel road,opp.reddy petrol bunk,Nehru nagar, Banglore-560001.</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">832</td>
<td width="164" style="font-weight: 400;">MNK Sarvamangala Land Developers</td>
<td width="170" style="font-weight: 400;">Phase-2 Raghavendra Layout</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">#17/1 Jalahalli cross, Chokkasandra, Old&nbsp; Oriental Insurance building Bengaluru-5600057</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">833</td>
<td width="164" style="font-weight: 400;">MNK Sarvamangala Land Developers</td>
<td width="170" style="font-weight: 400;">Mahalakshmi layout</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">#17/1 Jalahalli cross, Chokkasandra, Old&nbsp; Oriental Insurance building Bengaluru-5600057</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">834</td>
<td width="164" style="font-weight: 400;">NASCO Developers</td>
<td width="170" style="font-weight: 400;">Nasco lavender</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Ranade colony, 1st cross , Hindwadi, Belgaum 590011</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">835</td>
<td width="164" style="font-weight: 400;">Omkar Developers and Builders</td>
<td width="170" style="font-weight: 400;">Diamond Hills</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">1st floor, bhagyalaxmi complex,opp.Ramesh Bhavan,Keshwapur,Hubli-580023,karnataka.</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">836</td>
<td width="164" style="font-weight: 400;">Omkar Developers and Builders</td>
<td width="170" style="font-weight: 400;">Diamond Hills phase -II</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">1st floor, bhagyalaxmi complex,opp.Ramesh Bhavan,Keshwapur,Hubli-580023,karnataka.</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">837</td>
<td width="164" style="font-weight: 400;">Providence Builders &amp; Developers</td>
<td width="170" style="font-weight: 400;">Providence Elegance</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Bejai new road, Mangalore - 575 004</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">838</td>
<td width="164" style="font-weight: 400;">Providence Builders &amp; Developers</td>
<td width="170" style="font-weight: 400;">Providence Cascade</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Bejai new road, Mangalore - 575 004</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">839</td>
<td width="164" style="font-weight: 400;">Providence Builders &amp; Developers</td>
<td width="170" style="font-weight: 400;">Providence Dasha</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Bejai new road, Mangalore - 575 004</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">840</td>
<td width="164" style="font-weight: 400;">Providence Builders &amp; Developers</td>
<td width="170" style="font-weight: 400;">Abode-2</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Bejai new road, Mangalore - 575 004</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">841</td>
<td width="164" style="font-weight: 400;">Providence Builders &amp; Developers</td>
<td width="170" style="font-weight: 400;">Abode-1</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Bejai new road, Mangalore - 575 004</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">842</td>
<td width="164" style="font-weight: 400;">Providence Builders &amp; Developers</td>
<td width="170" style="font-weight: 400;">Evergreen Enclave</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Bejai new road, Mangalore - 575 004</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">843</td>
<td width="164" style="font-weight: 400;">R V Developers</td>
<td width="170" style="font-weight: 400;">Mount forest</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">1st Floor, hiremath building, Old Income Tax Office Road, Vidhyanagar, Hubli-Dharwad, Dharwad, Karnataka.</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">844</td>
<td width="164" style="font-weight: 400;">R V Developers</td>
<td width="170" style="font-weight: 400;">Topavana</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">1st Floor, hiremath building, Old Income Tax Office Road, Vidhyanagar, Hubli-Dharwad, Dharwad, Karnataka.</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">845</td>
<td width="164" style="font-weight: 400;">R.S.Developers</td>
<td width="170" style="font-weight: 400;">Royal Meadows</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">1st Floor, hiremath building, Old Income Tax Office Road, Vidhyanagar, Hubli-Dharwad, Dharwad, Karnataka.</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">846</td>
<td width="164" style="font-weight: 400;">R.S.Developers</td>
<td width="170" style="font-weight: 400;">Royal Lakefront Residensicy-IV</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">1st Floor, hiremath building, Old Income Tax Office Road, Vidhyanagar, Hubli-Dharwad, Dharwad, Karnataka.</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">847</td>
<td width="164" style="font-weight: 400;">R.S.Developers</td>
<td width="170" style="font-weight: 400;">GARDEENIA COMFORTES</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">1st Floor, hiremath building, Old Income Tax Office Road, Vidhyanagar, Hubli-Dharwad, Dharwad, Karnataka.</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">848</td>
<td width="164" style="font-weight: 400;">R.S.Developers</td>
<td width="170" style="font-weight: 400;">RAJ ALKA PARK</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">1st Floor, hiremath building, Old Income Tax Office Road, Vidhyanagar, Hubli-Dharwad, Dharwad, Karnataka.</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">849</td>
<td width="164" style="font-weight: 400;">R.S.Developers</td>
<td width="170" style="font-weight: 400;">Royal Shelters</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">1st Floor, hiremath building, Old Income Tax Office Road, Vidhyanagar, Hubli-Dharwad, Dharwad, Karnataka.</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">850</td>
<td width="164" style="font-weight: 400;">R.S.Developers</td>
<td width="170" style="font-weight: 400;">Royal Residency</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">1st Floor, hiremath building, Old Income Tax Office Road, Vidhyanagar, Hubli-Dharwad, Dharwad, Karnataka.</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">851</td>
<td width="164" style="font-weight: 400;">R.S.Developers</td>
<td width="170" style="font-weight: 400;">Royal Homes</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">1st Floor, hiremath building, Old Income Tax Office Road, Vidhyanagar, Hubli-Dharwad, Dharwad, Karnataka.</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">852</td>
<td width="164" style="font-weight: 400;">R.S.Developers</td>
<td width="170" style="font-weight: 400;">Royal Habitat</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">1st Floor, hiremath building, Old Income Tax Office Road, Vidhyanagar, Hubli-Dharwad, Dharwad, Karnataka.</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">853</td>
<td width="164" style="font-weight: 400;">R.S.Developers</td>
<td width="170" style="font-weight: 400;">Royal Hermitage</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">1st Floor, hiremath building, Old Income Tax Office Road, Vidhyanagar, Hubli-Dharwad, Dharwad, Karnataka.</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">854</td>
<td width="164" style="font-weight: 400;">R.S.Developers</td>
<td width="170" style="font-weight: 400;">Royal Park Residency</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">1st Floor, hiremath building, Old Income Tax Office Road, Vidhyanagar, Hubli-Dharwad, Dharwad, Karnataka.</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">855</td>
<td width="164" style="font-weight: 400;">R.S.Developers</td>
<td width="170" style="font-weight: 400;">Royal Lakefront Residency- I, II &amp; III</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">1st Floor, hiremath building, Old Income Tax Office Road, Vidhyanagar, Hubli-Dharwad, Dharwad, Karnataka.</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">856</td>
<td width="164" style="font-weight: 400;">R.S.Developers</td>
<td width="170" style="font-weight: 400;">Royal Gardeenia</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">1st Floor, hiremath building, Old Income Tax Office Road, Vidhyanagar, Hubli-Dharwad, Dharwad, Karnataka.</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">857</td>
<td width="164" style="font-weight: 400;">R.S.Developers</td>
<td width="170" style="font-weight: 400;">R. S. Green Woods</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">1st Floor, hiremath building, Old Income Tax Office Road, Vidhyanagar, Hubli-Dharwad, Dharwad, Karnataka.</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">858</td>
<td width="164" style="font-weight: 400;">Red Rocks Builders and Developers</td>
<td width="170" style="font-weight: 400;">Valley View</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Airport Road, Near Madhuvan's Village Restaurant, Yeyyadi, Mangaluru, Karnataka 575008</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">859</td>
<td width="164" style="font-weight: 400;">Red Rocks Builders and Developers</td>
<td width="170" style="font-weight: 400;">Redrocks Tonalite</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Airport Road, Near Madhuvan's Village Restaurant, Yeyyadi, Mangaluru, Karnataka 575008</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">860</td>
<td width="164" style="font-weight: 400;">Red Rocks Builders and Developers</td>
<td width="170" style="font-weight: 400;">Redrocks Heights</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Airport Road, Near Madhuvan's Village Restaurant, Yeyyadi, Mangaluru, Karnataka 575008</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">861</td>
<td width="164" style="font-weight: 400;">Red Rocks Builders and Developers</td>
<td width="170" style="font-weight: 400;">Plots in Shakthi Nagar</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Airport Road, Near Madhuvan's Village Restaurant, Yeyyadi, Mangaluru, Karnataka 575008</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">862</td>
<td width="164" style="font-weight: 400;">Red Rocks Builders and Developers</td>
<td width="170" style="font-weight: 400;">Residential Plots</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Airport Road, Near Madhuvan's Village Restaurant, Yeyyadi, Mangaluru, Karnataka 575008</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">863</td>
<td width="164" style="font-weight: 400;">Red Rocks Builders and Developers</td>
<td width="170" style="font-weight: 400;">Redrocks Blueberry Greens</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Airport Road, Near Madhuvan's Village Restaurant, Yeyyadi, Mangaluru, Karnataka 575008</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">864</td>
<td width="164" style="font-weight: 400;">Red Rocks Builders and Developers</td>
<td width="170" style="font-weight: 400;">Redrocks Hilltop</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Airport Road, Near Madhuvan's Village Restaurant, Yeyyadi, Mangaluru, Karnataka 575008</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">865</td>
<td width="164" style="font-weight: 400;">SAI RAM Developers and Builders</td>
<td width="170" style="font-weight: 400;">Suman Plaza</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Mr Manjunath Shivappa Makkalageri 975/2, suman plaza, shop no F-2, Ayodhya nagar, Civil Hospital Road, Belgaum</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">866</td>
<td width="164" style="font-weight: 400;">SKR Infra Builders &amp; Developers</td>
<td width="170" style="font-weight: 400;">SKR Meadows</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">#218, 27th Main, 2nd Sector,Opp. Andhra Bank, HSR Layout Bengaluru - 560 102</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">867</td>
<td width="164" style="font-weight: 400;">Vasavi Builders</td>
<td width="170" style="font-weight: 400;">Vasavi Pearl</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Novel Business Center, NoQ10,100ft Outer Ring Road, BTM Layout 1st Stage, Bengaluru 560068</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">868</td>
<td width="164" style="font-weight: 400;">Vasavi Builders</td>
<td width="170" style="font-weight: 400;">vasavi Residency 1</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Novel Business Center, NoQ10,100ft Outer Ring Road, BTM Layout 1st Stage, Bengaluru 560068</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">869</td>
<td width="164" style="font-weight: 400;">Vasavi Builders</td>
<td width="170" style="font-weight: 400;">vasavi Residency 2</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Novel Business Center, NoQ10,100ft Outer Ring Road, BTM Layout 1st Stage, Bengaluru 560068</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">870</td>
<td width="164" style="font-weight: 400;">Vasavi Builders</td>
<td width="170" style="font-weight: 400;">vasavi Tejus</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Novel Business Center, NoQ10,100ft Outer Ring Road, BTM Layout 1st Stage, Bengaluru 560068</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">871</td>
<td width="164" style="font-weight: 400;">Vasavi Builders</td>
<td width="170" style="font-weight: 400;">vasavi Icon</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Novel Business Center, NoQ10,100ft Outer Ring Road, BTM Layout 1st Stage, Bengaluru 560068</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">872</td>
<td width="164" style="font-weight: 400;">Vasavi Builders</td>
<td width="170" style="font-weight: 400;">vasavi Rich</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Novel Business Center, NoQ10,100ft Outer Ring Road, BTM Layout 1st Stage, Bengaluru 560068</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">873</td>
<td width="164" style="font-weight: 400;">Vasavi Builders</td>
<td width="170" style="font-weight: 400;">Vasavi Royal</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Novel Business Center, NoQ10,100ft Outer Ring Road, BTM Layout 1st Stage, Bengaluru 560068</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">874</td>
<td width="164" style="font-weight: 400;">Vasavi Builders</td>
<td width="170" style="font-weight: 400;">Friends nest</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">Novel Business Center, NoQ10,100ft Outer Ring Road, BTM Layout 1st Stage, Bengaluru 560068</td>
<td>05-01-2018</td>
</tr>
<tr>
<td width="47" style="font-weight: 400;">875</td>
<td width="164" style="font-weight: 400;">VR Infrastructures</td>
<td width="170" style="font-weight: 400;">VR Sai Brundavanam</td>
<td width="200" style="font-weight: 400;">No Reply</td>
<td width="338" style="font-weight: 400;">#26, Akshaya dhama, 1st cross, Venugopal Reddy Layout, Sarvagna Road, Arekere, Bengaluru - 76, Karnataka</td>
<td>05-01-2018</td>
</tr>

</tbody>
</table>

				</div>

			</div>
		</div>

		<hr></hr>


		<!--search list main end here-->
	</div>




	<!--inner container end here-->
</div>




<!-- container end here-->


