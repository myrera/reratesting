<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>




                <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
                <script src="https://cdn.datatables.net/buttons/1.4.2/js/dataTables.buttons.min.js"></script>
                <script src="https://cdn.datatables.net/buttons/1.4.2/js/buttons.flash.min.js"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
                <script src="https://cdn.datatables.net/buttons/1.4.2/js/buttons.html5.min.js"></script>
                <script src="https://cdn.datatables.net/buttons/1.4.2/js/buttons.print.min.js"></script>


                <link href="https://cdn.datatables.net/buttons/1.4.2/css/buttons.dataTables.min.css" rel="stylesheet" />


                <script>
                    $(document).ready(
                        function() {
                            var t1=$('#processedTable').DataTable({

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
                                dom: 'Bfrtip',
                                lengthMenu: [
                                    [10, 25, 50, -1],
                                    ['10 rows', '25 rows', '50 rows',
                                        'Show all'
                                    ]
                                ],
                                buttons: ['pageLength', {
                                    extend: 'pdf',
                                    orientation: 'landscape',
                                    pageSize: 'LEGAL',
                                    text: 'Export Into PDF',
                                    title: 'List Of All Project Applicants'
                                }],
            					"columnDefs": [ {
            			            "searchable": false,
            			            "orderable": false,
            			            "targets": 0
            			        } ],
            			        "order": [[ 1, 'asc' ]]
                            });
                            
                            t1.on( 'order.dt search.dt', function () {
            			        t1.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
            			            cell.innerHTML = i+1;
            			        } );
            			    } ).draw();

                            var t2=$('#enquiryTable').DataTable({
                                dom: 'Bfrtip',
                                lengthMenu: [
                                    [10, 25, 50, -1],
                                    ['10 rows', '25 rows', '50 rows',
                                        'Show all'
                                    ]
                                ],
                                buttons: ['pageLength', {
                                    extend: 'pdf',
                                    text: 'Export Into PDF',
                                    title: 'List of All Agents Applicants'
                                }],
            					"columnDefs": [ {
            			            "searchable": false,
            			            "orderable": false,
            			            "targets": 0
            			        } ],
            			        "order": [[ 1, 'asc' ]]
                            });
                            
                            t2.on( 'order.dt search.dt', function () {
            			        t2.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
            			            cell.innerHTML = i+1;
            			        } );
            			    } ).draw();
                            
                            var t3=$('#approvedTable').DataTable({
                                dom: 'Bfrtip',
                                lengthMenu: [
                                    [10, 25, 50, -1],
                                    ['10 rows', '25 rows', '50 rows',
                                        'Show all'
                                    ]
                                ],
                                buttons: ['pageLength', {
                                    extend: 'pdf',
                                    text: 'Export Into PDF',
                                    title: 'Applications Approved'
                                }],
            					"columnDefs": [ {
            			            "searchable": false,
            			            "orderable": false,
            			            "targets": 0
            			        } ],
            			        "order": [[ 1, 'asc' ]]
                            });
                            t3.on( 'order.dt search.dt', function () {
            			        t3.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
            			            cell.innerHTML = i+1;
            			        } );
            			    } ).draw();

                        });
                </script>


                <style>
                    #approvedTable {
                        text-transform: uppercase;
                    }
                    
                    #processedTable {
                        text-transform: uppercase;
                    }
                </style>
                <div class="breadcrumb">Home / Agents List </div>



                <!--main container start here-->
                <div class="Main_containner">

                    <!--Inner wrapper stsrt here-->
                    <div class="inner_wrapper tsklist">


                        <div class="container"></div>

                        <div id="exTab2" class="container">
                            <ul class="nav nav-tabs">
                                <!-- <li class="active"><a href="#1" data-toggle="tab">List Of
						All Project Applicants </a></li> -->
                                <li><a href="#2" data-toggle="tab">List of All Agent
						Applicants</a></li>
                                <li><a href="#3" data-toggle="tab">List of Approved Agents</a></li>

                                <!-- 				<li><a href="#4" data-toggle="tab"> List of Projects/promoters Paid Amount </a></li>
				<li><a href="#5" data-toggle="tab"> Penalty Details </a></li> -->
                            </ul>

                            <div class="tab-content ">

                                <div class="tab-pane active table-responsive" id="2">


                                    <br> <br>
                                    <h1>Total Agents: ${allAgentslist.size()}</h1>
                                    <br>
                                    <table class="cell-border nowrap" id="enquiryTable">
                                        <thead>
                                            <tr>
                                                <th>S.No</th>
                                                <th>APPLICATION DATE</th>
                                                <th>APPLICATION NO</th>
                                                <th>AGENT NAME</th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
								int enqcount = 0;
							%>
                                                <c:forEach items="${allAgentslist}" var="obj">
                                                    <tr>
                                                        <td style="text-align: center">
                                                            <%=++enqcount%>
                                                        </td>

                                                        <td style="text-align: center">
                                                            <c:set var="crdt" value="${obj.createdOn.time}" />
                                                            <fmt:formatDate type="date" pattern="dd-MM-yyyy" dateStyle="short" value="${crdt}" />
                                                        </td>
                                                        <td style="text-align: center">${obj.applicationNo }</td>

                                                        <c:choose>
                                                            <c:when test="${obj.registrationType=='INDIVIDUAL_REG' }">
                                                                <td style="text-align: center">
                                                                    ${obj.agentDetailsModel.agentName }</td>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <td style="text-align: center">${obj.agentDetailsModel.firmName }</td>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </tr>
                                                </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="tab-pane table-responsive" id="3">
                                    <br> <br>

                                    <h1>Total Approved Agents: ${agentsApprovedList.size()}</h1>
                                    <br>


                                    <table class="cell-border nowrap" id="approvedTable">
                                        <thead>
                                            <tr>
                                                <th>S.No</th>
                                                <th>APPLICATION DATE</th>
                                                <th>OLD APPLICATION NO</th>
                                                <th>NEW APPLICATION NO</th>
                                                <th>AGENT NAME</th>
                                                <th>CERTIFICATE</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
								int enqcount4 = 0;
							%>
                                                <c:forEach items="${agentsApprovedList}" var="obj">
                                                    <tr>
                                                        <td style="text-align: center">
                                                            <%=++enqcount4%>
                                                        </td>

                                                        <td style="text-align: center">
                                                            <c:set var="crdt" value="${obj.createdOn.time}" />
                                                            <fmt:formatDate type="date" pattern="dd-MM-yyyy" dateStyle="short" value="${crdt}" />
                                                        </td>
                                                         <td style="text-align: center">${obj.agentOldRegistrationNo }</td>
                                                        <td style="text-align: center">${obj.agentRegistrationNo }</td>

                                                        <c:choose>
                                                            <c:when test="${obj.registrationType=='INDIVIDUAL_REG' }">
                                                                <td style="text-align: center">
                                                                    ${obj.agentDetailsModel.agentName }</td>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <td style="text-align: center">${obj.agentDetailsModel.firmName }</td>
                                                            </c:otherwise>
                                                        </c:choose>
                                                         <td><a href="<%=request.getContextPath() %>/certificate?CER_NO=${obj.agentRegistrationNo }">Download</a></td>
                                                    </tr>
                                                </c:forEach>
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