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
                <!-- <script>
	$(document).ready(function() {
		$('#processedTable').DataTable();
		$('#enquiryTable').DataTable();
		$('#approvedTable').DataTable();
	});
</script> -->


                <script>
                    $(document).ready(function() {



                        var t7 = $('#unregisteredTable').DataTable({
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
                                title: 'List of Projects Under Investigation'
                            }],
                            "columnDefs": [{
                                "searchable": false,
                                "orderable": false,
                                "targets": 0
                            }],
                            "order": [
                                [1, 'asc']
                            ]
                        });

                        t7.on('order.dt search.dt', function() {
                            t7.column(0, {
                                search: 'applied',
                                order: 'applied'
                            }).nodes().each(function(cell, i) {
                                cell.innerHTML = i + 1;
                            });
                        }).draw();


                    });
                </script>




                <script>
                    $(document).ready(
                        function() {
                            var t1 = $('#processedTable').DataTable({

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
                                "columnDefs": [{
                                    "searchable": false,
                                    "orderable": false,
                                    "targets": 0
                                }],
                                "order": [
                                    [1, 'asc']
                                ]
                            });

                            var t2 = $('#enquiryTable').DataTable({
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
                                "columnDefs": [{
                                    "searchable": false,
                                    "orderable": false,
                                    "targets": 0
                                }],
                                "order": [
                                    [1, 'asc']
                                ]
                            });
                            var t3 = $('#approvedTable').DataTable({
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
                                "columnDefs": [{
                                    "searchable": false,
                                    "orderable": false,
                                    "targets": 0
                                }],
                                "order": [
                                    [1, 'asc']
                                ]
                            });
                            var t4 = $('#allProjectsTable').DataTable({
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
                                    title: 'All Registered Applications 1'
                                }],
                                "columnDefs": [{
                                    "searchable": false,
                                    "orderable": false,
                                    "targets": 0
                                }],
                                "order": [
                                    [1, 'asc']
                                ]
                            });

                            var t5 = $('#allRejectedTable').DataTable({
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
                                    title: 'Rejected Applications 1'
                                }],
                                "columnDefs": [{
                                    "searchable": false,
                                    "orderable": false,
                                    "targets": 0
                                }],
                                "order": [
                                    [1, 'asc']
                                ]
                            });


                            t1.on('order.dt search.dt', function() {
                                t1.column(0, {
                                    search: 'applied',
                                    order: 'applied'
                                }).nodes().each(function(cell, i) {
                                    cell.innerHTML = i + 1;
                                });
                            }).draw();

                            t2.on('order.dt search.dt', function() {
                                t2.column(0, {
                                    search: 'applied',
                                    order: 'applied'
                                }).nodes().each(function(cell, i) {
                                    cell.innerHTML = i + 1;
                                });
                            }).draw();

                            t3.on('order.dt search.dt', function() {
                                t3.column(0, {
                                    search: 'applied',
                                    order: 'applied'
                                }).nodes().each(function(cell, i) {
                                    cell.innerHTML = i + 1;
                                });
                            }).draw();

                            t4.on('order.dt search.dt', function() {
                                t4.column(0, {
                                    search: 'applied',
                                    order: 'applied'
                                }).nodes().each(function(cell, i) {
                                    cell.innerHTML = i + 1;
                                });
                            }).draw();

                            t5.on('order.dt search.dt', function() {
                                t5.column(0, {
                                    search: 'applied',
                                    order: 'applied'
                                }).nodes().each(function(cell, i) {
                                    cell.innerHTML = i + 1;
                                });
                            }).draw();

                        });
                </script>
                <style>
                    #approvedTable {
                        text-transform: uppercase;
                    }
                    
                    #enquiryTable {
                        text-transform: uppercase;
                    }
                    
                    #processedTable {
                        text-transform: uppercase;
                    }
                    
                    #allProjectsTable {
                        text-transform: uppercase;
                    }
                    
                    #allRejectedTable {
                        text-transform: uppercase;
                    }
                </style>
                <div class="breadcrumb">Home / Processed Applications</div>




                <!--main container start here-->
                <div class="Main_containner">

                    <!--Inner wrapper stsrt here-->
                    <div class="inner_wrapper tsklist">







                        <form action=""></form>




                        <div class="container">
                            <!-- <h1>
				Processed Applications			</h1>
			<br> -->
                            <h1>Total number of projects processed till date:${underProcess.size()+enquiryList.size()+approvedList.size()+allRejectedList.size()}</h1>
                            <br>

                        </div>

                        <div id="exTab2" class="container">
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#1" data-toggle="tab">Applications
						under Process</a></li>
                                <li><a href="#2" data-toggle="tab">Applications under Query</a></li>
                                <li><a href="#3" data-toggle="tab">Applications Approved</a></li>
                                <!-- <li><a href="#4" data-toggle="tab">All Registered Applications <b><font style="vertical-align:super;font-size:8px;color:red">NEW</font></b> </a></li> -->
                                <li><a href="#5" data-toggle="tab">Applications Rejected<b><font style="vertical-align:super;font-size:8px;color:red">NEW</font></b> </a></li>

                            </ul>

                            <div class="tab-content ">
                                <div class="tab-pane active" id="1">
                                    <br> <br>
                                    <h1>The following is the list of projects under process by RERA Karnataka</h1> <br>
                                    <br>
                                    <h1>Total Projects: ${underProcess.size()}</h1>
                                    <br>
                                    <table class="table table-bordered" id="processedTable">
                                        <thead>
                                            <tr>
                                                <th>S.No</th>
                                                <th>ACKNOWLEDGEMENT NO</th>
                                                <th>PROMOTER</th>
                                                <th>PROJECT</th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
								int count = 0;
							%>
                                                <c:forEach items="${underProcess}" var="obj">
                                                    <tr>
                                                        <td>
                                                            <%=++count%>
                                                        </td>
                                                        <td>${obj.applicationNo }</td>
                                                        <td>${obj.promoterDetailsModel.promoterName }</td>
                                                        <td>${obj.projectDetailsModel.projectName }</td>

                                                        <%-- <td>${obj.registrationType }</td>
                <td>${obj.projectDetailsModel.projectType }</td>
                <td>${obj.approvedBy.userName }</td>
                
                   <td>
                     <c:set var = "crdt" value = "${obj.approvedOn.time}" />
                 
                  <fmt:formatDate type="date"  pattern="dd-MM-yyyy" dateStyle="short" value="${crdt}"/>
                 </td> --%>
                                                    </tr>
                                                </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="tab-pane" id="2">
                                    <br> <br>
                                    <h1>The following is the list of projects with queries raised by RERA Karnataka</h1> <br>
                                    <br>
                                    <h1>Total Projects: ${enquiryList.size()}</h1>
                                    <br>
                                    <table class="table table-bordered" id="enquiryTable">
                                        <thead>
                                            <tr>
                                                <th>S.No</th>
                                                <th>ACKNOWLEDGEMENT NO</th>
                                                <th>PROMOTER</th>
                                                <th>PROJECT</th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
								int enqcount = 0;
							%>
                                                <c:forEach items="${enquiryList}" var="obj">
                                                    <tr>
                                                        <td>
                                                            <%=++enqcount%>
                                                        </td>
                                                        <td>${obj.applicationNo }</td>
                                                        <td>${obj.promoterDetailsModel.promoterName }</td>
                                                        <td>${obj.projectDetailsModel.projectName }</td>
                                                    </tr>
                                                </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="tab-pane" id="3">
                                    <br> <br>
                                    <h1>The following is the list of projects approved by RERA Karnataka</h1> <br>
                                    <h1>Total Projects: ${approvedList.size()}</h1>
                                    <br>


                                    <table class="table table-bordered" id="approvedTable">
                                        <thead>
                                            <tr>
                                                <th>S.No</th>
                                                <th width="50px;">OLD REGISTRATION NO</th>
                                                 <th width="50px;">NEW REGISTRATION NO</th>
                                                <th>PROMOTER</th>
                                                <th>PROJECT</th>
                                                <th>Certificate</th>


                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
								int apvcount = 0;
							%>
                                                <c:forEach items="${approvedList}" var="obj">
                                                    <tr>
                                                        <td>
                                                            <%=++apvcount%>
                                                        </td>
                                                        <td id ="rectangle" width="50px;">
                                                       
                                                        <a href="<%=request.getContextPath() %>/publicDomainLoginPage" target="_blank">${obj.projectOldRegistrationNo }</a>
                                                        </td>
                                                           <td id ="rectangle" width="50px;">
                                                       
                                                        <a href="<%=request.getContextPath() %>/publicDomainLoginPage" target="_blank">${obj.projectRegistrationNo }</a>
                                                        <div class="popup" onmouseover="myFunction()"> <b><font style="vertical-align:super;font-size:8px;color:green">info</font></b>
                                                          <span class="popuptext" id="myPopup">click on link to view project & download</span>
                                                          </div></td>
                                                        <td>${obj.promoterDetailsModel.promoterName }</td>
                                                        <td>${obj.projectDetailsModel.projectName }</td>
                                                        <td><a href="<%=request.getContextPath() %>/certificate?CER_NO=${obj.projectRegistrationNo}">Download</a></td>
                                                    </tr>
                                                </c:forEach>
                                        </tbody>
                                    </table>
                                </div>

                                <div class="tab-pane" id="4">
                                    <br> <br>
                                    <h1>The following is the list of all projects registered in RERA Karnataka</h1> <br>
                                    <h1>Total Projects: ${allProjectsList.size()}</h1>
                                    <br>


                                    <table class="table table-bordered" id="allProjectsTable">
                                        <thead>
                                            <tr>
                                                <th>S.No</th>
                                                <th>ACKNOWLEDGEMENT NO</th>
                                                <th>PROMOTER</th>
                                                <th>PROJECT</th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
								int alpcount = 0;
							%>
                                                <c:forEach items="${allProjectsList}" var="obj">
                                                    <tr>
                                                        <td>
                                                            <%=++alpcount%>
                                                        </td>
                                                        <td>${obj.applicationNo }</td>
                                                        <td>${obj.promoterDetailsModel.promoterName }</td>
                                                        <td>${obj.projectDetailsModel.projectName }</td>
                                                    </tr>
                                                </c:forEach>
                                        </tbody>
                                    </table>
                                </div>

                                <div class="tab-pane" id="5">
                                    <br> <br>
                                    <h1>The following is the list of applications rejected in RERA Karnataka</h1> <br>
                                    <h1>Total Projects: ${allRejectedList.size()}</h1>
                                    <br>


                                    <table class="table table-bordered" id="allRejectedTable">
                                        <thead>
                                            <tr>
                                                <th>S.No</th>
                                                <th>ACKNOWLEDGEMENT NO</th>
                                                <th>PROMOTER</th>
                                                <th>PROJECT</th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
								int rejcount = 0;
							%>
                                                <c:forEach items="${allRejectedList}" var="obj">
                                                    <tr>
                                                        <td>
                                                            <%=++rejcount%>
                                                        </td>
                                                        <td>${obj.applicationNo }</td>
                                                        <td>${obj.promoterDetailsModel.promoterName }</td>
                                                        <td>${obj.projectDetailsModel.projectName }</td>


                                                    </tr>
                                                </c:forEach>
                                        </tbody>
                                    </table>


                                </div>
                                <div class="tab-pane" id="6"><br><br>
                                    <font color="red">
                                        <h1 style="color:red!important">
                                            Public is hereby informed that these projects are not registered with RERA and are under investigation. <br><br>And dealing with these projects is at their own risk, as they are not registered with RERA. the
                                            list of unregistered project is attached below
                                        </h1>
                                    </font><br><br>

                                    <table class="table table-bordered" id="unregisteredTable">
                                        <thead>
                                            <tr>
                                                <th width="53">Sl.no</th>
                                                <th width="120">Promoter Name</th>
                                                <th width="121">Project Name</th>
                                                <th width="261">Company Address</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">SANCITY</td>
                                                <td width="121">Silver Shine</td>
                                                <td width="261">No.11 &amp; 12,2nd Floor, P.S Plaza Jawahar Street, Platform Road, Sheshadripuram, Bengaluru, Karnataka 560020</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">SANCITY</td>
                                                <td width="121">Disha</td>
                                                <td width="261">No.11 &amp; 12,2nd Floor, P.S Plaza Jawahar Street, Platform Road, Sheshadripuram, Bengaluru, Karnataka 560020</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">SANCITY</td>
                                                <td width="121">Kaveri</td>
                                                <td width="261">No.11 &amp; 12,2nd Floor, P.S Plaza Jawahar Street, Platform Road, Sheshadripuram, Bengaluru, Karnataka 560020</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">SANCITY</td>
                                                <td width="121">Iris</td>
                                                <td width="261">No.11 &amp; 12,2nd Floor, P.S Plaza Jawahar Street, Platform Road, Sheshadripuram, Bengaluru, Karnataka 560020</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">SANCITY</td>
                                                <td width="121">Gold</td>
                                                <td width="261">No.11 &amp; 12,2nd Floor, P.S Plaza Jawahar Street, Platform Road, Sheshadripuram, Bengaluru, Karnataka 560020</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">SANCITY</td>
                                                <td width="121">Violet</td>
                                                <td width="261">No.11 &amp; 12,2nd Floor, P.S Plaza Jawahar Street, Platform Road, Sheshadripuram, Bengaluru, Karnataka 560020</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">SANCITY</td>
                                                <td width="121">Green</td>
                                                <td width="261">No.11 &amp; 12,2nd Floor, P.S Plaza Jawahar Street, Platform Road, Sheshadripuram, Bengaluru, Karnataka 560020</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">SANCITY</td>
                                                <td width="121">Sky City</td>
                                                <td width="261">No.11 &amp; 12,2nd Floor, P.S Plaza Jawahar Street, Platform Road, Sheshadripuram, Bengaluru, Karnataka 560020</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">SANCITY</td>
                                                <td width="121">Blue Bell</td>
                                                <td width="261">No.11 &amp; 12,2nd Floor, P.S Plaza Jawahar Street, Platform Road, Sheshadripuram, Bengaluru, Karnataka 560020</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">SANCITY</td>
                                                <td width="121">Diamond</td>
                                                <td width="261">No.11 &amp; 12,2nd Floor, P.S Plaza Jawahar Street, Platform Road, Sheshadripuram, Bengaluru, Karnataka 560020</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">SANCITY</td>
                                                <td width="121">Lake View</td>
                                                <td width="261">No.11 &amp; 12,2nd Floor, P.S Plaza Jawahar Street, Platform Road, Sheshadripuram, Bengaluru, Karnataka 560020</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">SANCITY</td>
                                                <td width="121">White Lotus</td>
                                                <td width="261">No.11 &amp; 12,2nd Floor, P.S Plaza Jawahar Street, Platform Road, Sheshadripuram, Bengaluru, Karnataka 560020</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">SANCITY</td>
                                                <td width="121">Vapour</td>
                                                <td width="261">No.11 &amp; 12,2nd Floor, P.S Plaza Jawahar Street, Platform Road, Sheshadripuram, Bengaluru, Karnataka 560020</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">SANCITY</td>
                                                <td width="121">Gardenia</td>
                                                <td width="261">No.11 &amp; 12,2nd Floor, P.S Plaza Jawahar Street, Platform Road, Sheshadripuram, Bengaluru, Karnataka 560020</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">SANCITY</td>
                                                <td width="121">Sunflower</td>
                                                <td width="261">No.11 &amp; 12,2nd Floor, P.S Plaza Jawahar Street, Platform Road, Sheshadripuram, Bengaluru, Karnataka 560020</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">SANCITY</td>
                                                <td width="121">Elegance</td>
                                                <td width="261">No.11 &amp; 12,2nd Floor, P.S Plaza Jawahar Street, Platform Road, Sheshadripuram, Bengaluru, Karnataka 560020</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">SANCITY</td>
                                                <td width="121">Purple</td>
                                                <td width="261">No.11 &amp; 12,2nd Floor, P.S Plaza Jawahar Street, Platform Road, Sheshadripuram, Bengaluru, Karnataka 560020</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">SANCITY</td>
                                                <td width="121">Comfort</td>
                                                <td width="261">No.11 &amp; 12,2nd Floor, P.S Plaza Jawahar Street, Platform Road, Sheshadripuram, Bengaluru, Karnataka 560020</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">SANCITY</td>
                                                <td width="121">Rachana</td>
                                                <td width="261">No.11 &amp; 12,2nd Floor, P.S Plaza Jawahar Street, Platform Road, Sheshadripuram, Bengaluru, Karnataka 560020</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">SANCITY</td>
                                                <td width="121">Independent house</td>
                                                <td width="261">No.11 &amp; 12,2nd Floor, P.S Plaza Jawahar Street, Platform Road, Sheshadripuram, Bengaluru, Karnataka 560020</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">SANCITY</td>
                                                <td width="121">Independent house</td>
                                                <td width="261">No.11 &amp; 12,2nd Floor, P.S Plaza Jawahar Street, Platform Road, Sheshadripuram, Bengaluru, Karnataka 560020</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">SANCITY</td>
                                                <td width="121">Independent house</td>
                                                <td width="261">No.11 &amp; 12,2nd Floor, P.S Plaza Jawahar Street, Platform Road, Sheshadripuram, Bengaluru, Karnataka 560020</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">SANCITY</td>
                                                <td width="121">Independent House</td>
                                                <td width="261">No.11 &amp; 12,2nd Floor, P.S Plaza Jawahar Street, Platform Road, Sheshadripuram, Bengaluru, Karnataka 560020</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">SANCITY</td>
                                                <td width="121">Independent House</td>
                                                <td width="261">No.11 &amp; 12,2nd Floor, P.S Plaza Jawahar Street, Platform Road, Sheshadripuram, Bengaluru, Karnataka 560020</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">HM contaruction</td>
                                                <td width="121">Concord Tower @ HM Symphony</td>
                                                <td width="261">HM Geneva House<br /> &nbsp;No.14, 6th Floor<br /> &nbsp;Cunningham Road<br /> &nbsp;Bangalore - 560052</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">HM contaruction</td>
                                                <td width="121">HM Granduer</td>
                                                <td width="261">HM Geneva House<br /> &nbsp;No.14, 6th Floor<br /> &nbsp;Cunningham Road<br /> &nbsp;Bangalore - 560052</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">HM contaruction</td>
                                                <td width="121">HM Tropical Tree</td>
                                                <td width="261">HM Geneva House<br /> &nbsp;No.14, 6th Floor<br /> &nbsp;Cunningham Road<br /> &nbsp;Bangalore - 560052</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">sterling</td>
                                                <td width="121">Sterling villa grande</td>
                                                <td width="261">No.8, Cubbon Road, Opp. Income Tax Building, Bangalore 560 001, India.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Enrich properties</td>
                                                <td width="121">Enrich paradise</td>
                                                <td width="261">NO.196/A, 1st Floor, 3rd Main Road, 10th Cross, CBI Road, Ganga Nagar, Bangalore - 560 032, Karnataka, INDIA</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Thiru Margadarshi Construction Pvt Ltd</td>
                                                <td width="121">Grape Garden Enclave</td>
                                                <td width="261">No 98/16, Wheelers Road Extension, Opp Canara Bank, Bangalore-560005, Karnataka, INDIA.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Thiru Margadarshi Construction Pvt Ltd</td>
                                                <td width="121">TM Prema Sankalp</td>
                                                <td width="261">No 98/16, Wheelers Road Extension, Opp Canara Bank, Bangalore-560005, Karnataka, INDIA.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Thiru Margadarshi Construction Pvt Ltd</td>
                                                <td width="121">TM Janaki Enclave</td>
                                                <td width="261">No 98/16, Wheelers Road Extension, Opp Canara Bank, Bangalore-560005, Karnataka, INDIA.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Thiru Margadarshi Construction Pvt Ltd</td>
                                                <td width="121">Bethel Heights</td>
                                                <td width="261">No 98/16, Wheelers Road Extension, Opp Canara Bank, Bangalore-560005, Karnataka, INDIA.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Thiru Margadarshi Construction Pvt Ltd</td>
                                                <td width="121">Thirumargadarshi Enclave</td>
                                                <td width="261">No 98/16, Wheelers Road Extension, Opp Canara Bank, Bangalore-560005, Karnataka, INDIA.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Thiru Margadarshi Construction Pvt Ltd</td>
                                                <td width="121">Hutchin's Corner</td>
                                                <td width="261">No 98/16, Wheelers Road Extension, Opp Canara Bank, Bangalore-560005, Karnataka, INDIA.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Aashish Developer &amp; Builders</td>
                                                <td width="121">Ashish Woods</td>
                                                <td width="261">56/2, Opp. Keerthi Gardenia, Behind Vibgyor school, Thubarahalli, Varthur Road, Bangalore-560 066</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Aashish Developer &amp; Builders</td>
                                                <td width="121">Ashish Villa</td>
                                                <td width="261">56/2, Opp. Keerthi Gardenia, Behind Vibgyor school, Thubarahalli, Varthur Road, Bangalore-560 066</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Aashish Developer &amp; Builders</td>
                                                <td width="121">Rajni Ashish Rose Phase II</td>
                                                <td width="261">56/2, Opp. Keerthi Gardenia, Behind Vibgyor school, Thubarahalli, Varthur Road, Bangalore-560 066</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Aashish Developer &amp; Builders</td>
                                                <td width="121">Ashish JK Apartments</td>
                                                <td width="261">56/2, Opp. Keerthi Gardenia, Behind Vibgyor school, Thubarahalli, Varthur Road, Bangalore-560 066</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">House of hirandani</td>
                                                <td width="121">CLUB MEADOWS</td>
                                                <td width="261">property@houseofhiranandani.com</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">House of hirandani</td>
                                                <td width="121">LAKE VERANDAHS</td>
                                                <td width="261">property@houseofhiranandani.com</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">House of hirandani</td>
                                                <td width="121">HILL CREST</td>
                                                <td width="261">property@houseofhiranandani.com</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">House of hirandani</td>
                                                <td width="121">CHANCERY</td>
                                                <td width="261">property@houseofhiranandani.com</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">House of hirandani</td>
                                                <td width="121">COTTAGES</td>
                                                <td width="261">property@houseofhiranandani.com</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">House of hirandani</td>
                                                <td width="121">CROSSGATE</td>
                                                <td width="261">property@houseofhiranandani.com</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">House of hirandani</td>
                                                <td width="121">CYPRESS</td>
                                                <td width="261">property@houseofhiranandani.com</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">House of hirandani</td>
                                                <td width="121">VILLAS</td>
                                                <td width="261">property@houseofhiranandani.com</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Bhomika projects india pvt ltd</td>
                                                <td width="121">Mahalakshmi Paradiso</td>
                                                <td width="261">#85, 17th &lsquo;D&rsquo; Cross, 38th Main, Rose Garden,J P Nagar 6th Phase, Bangalore - 560 078.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Bhomika projects india pvt ltd</td>
                                                <td width="121">Flutus-Nest</td>
                                                <td width="261">#85, 17th &lsquo;D&rsquo; Cross, 38th Main, Rose Garden,J P Nagar 6th Phase, Bangalore - 560 078.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Hindh Realty India Pvt Ltd&nbsp;</td>
                                                <td width="121">HINDH AERO City</td>
                                                <td width="261"># 400, 1st Block, 2nd Main Rd, RT Nagar,Bengaluru, Karnataka 560032&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Hindh Realty India Pvt Ltd&nbsp;</td>
                                                <td width="121">HINDH SAHANA</td>
                                                <td width="261"># 400, 1st Block, 2nd Main Rd, RT Nagar,Bengaluru, Karnataka 560032&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Hindh Realty India Pvt Ltd&nbsp;</td>
                                                <td width="121">HINDH GARDEN CITY</td>
                                                <td width="261"># 400, 1st Block, 2nd Main Rd, RT Nagar,Bengaluru, Karnataka 560032&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Hindh Realty India Pvt Ltd&nbsp;</td>
                                                <td width="121">HINDH NORTH CITY</td>
                                                <td width="261"># 400, 1st Block, 2nd Main Rd, RT Nagar,Bengaluru, Karnataka 560032&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Hindh Realty India Pvt Ltd&nbsp;</td>
                                                <td width="121">NANDHI HILL VIEW</td>
                                                <td width="261"># 400, 1st Block, 2nd Main Rd, RT Nagar,Bengaluru, Karnataka 560032&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Hindh Realty India Pvt Ltd&nbsp;</td>
                                                <td width="121">HINDH PARADISE</td>
                                                <td width="261"># 400, 1st Block, 2nd Main Rd, RT Nagar,Bengaluru, Karnataka 560032&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">ASIAN BUILDERS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                                <td width="121">ASIAN HILLSCAPE</td>
                                                <td width="261">#21, First floor, asian business centre beside asian mall, gulbauga - 585102 phone No- 08472-256999 and 08472-254888</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">ASIAN BUILDERS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                                <td width="121">ASIAN GREEN PARK</td>
                                                <td width="261">#21, First floor, asian business centre beside asian mall, gulbauga - 585102 phone No- 08472-256999 and 08472-254888</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">ASIAN BUILDERS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                                <td width="121">PRAKASH ASIAN MALL</td>
                                                <td width="261">#21, First floor, asian business centre beside asian mall, gulbauga - 585102 phone No- 08472-256999 and 08472-254888</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Yesh Developers<br /> (dharwad)</td>
                                                <td width="121">yesh sun citi</td>
                                                <td width="261">No.70/1,12th cross, off kalidasa road, jayalakshmipuram,vv mahalla, mysore-570002</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Yesh Developers<br /> (dharwad)</td>
                                                <td width="121">yesh dream citi</td>
                                                <td width="261">No.70/1,12th cross, off kalidasa road, jayalakshmipuram,vv mahalla, mysore-570002</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Yesh Developers<br /> (dharwad)</td>
                                                <td width="121">yesh dream citi-phase II</td>
                                                <td width="261">No.70/1,12th cross, off kalidasa road, jayalakshmipuram,vv mahalla, mysore-570002</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Westline Group</td>
                                                <td width="121">Signature</td>
                                                <td width="261">First Floor, Mangalore Gate Building<br /> &nbsp;Kankanady Cirle,<br /> &nbsp;Mangalore &ndash; 575002</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Westline Group</td>
                                                <td width="121">Skydale</td>
                                                <td width="261">First Floor, Mangalore Gate Building<br /> &nbsp;Kankanady Cirle,<br /> &nbsp;Mangalore &ndash; 575002</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Westline Group</td>
                                                <td width="121">Fairmont</td>
                                                <td width="261">First Floor, Mangalore Gate Building<br /> &nbsp;Kankanady Cirle,<br /> &nbsp;Mangalore &ndash; 575002</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Westline Group</td>
                                                <td width="121">Splendid Homes</td>
                                                <td width="261">First Floor, Mangalore Gate Building<br /> &nbsp;Kankanady Cirle,<br /> &nbsp;Mangalore &ndash; 575002</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Westline Group</td>
                                                <td width="121">Bonita</td>
                                                <td width="261">First Floor, Mangalore Gate Building<br /> &nbsp;Kankanady Cirle,<br /> &nbsp;Mangalore &ndash; 575002</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Vijayalakshmi Projects</td>
                                                <td width="121">GREEN MEADOWS</td>
                                                <td width="261">&nbsp;# 82/2, Ramakrishna Mutt Road, Ulsoor, Bangalore &ndash; 560 008</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Vijayalakshmi Projects</td>
                                                <td width="121">SAIRAM ORCHIDS</td>
                                                <td width="261">&nbsp;# 82/2, Ramakrishna Mutt Road, Ulsoor, Bangalore &ndash; 560 008</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Asset Builders</td>
                                                <td width="121">Alcazar</td>
                                                <td width="261">&nbsp;#476, 2nd Floor, 80 Feet Road, 6th Block, Koramangala, Bangalore - 560 095</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Definer Ventures</td>
                                                <td width="121">Definer Kingdom</td>
                                                <td width="261">&nbsp;No. 501, 1st Floor, 5th Cross, HMT Layout, R.T.Nagar, Bangalore 560 032</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Mythreyi Promoters and Developers&nbsp; Pvt Ltd.</td>
                                                <td width="121">Mythreyi Naimisha</td>
                                                <td width="261">Muncipal no 50, (Old no 23),5th Cross, Wilson Garden, Bangalore &ndash; 560 027</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Mythreyi Promoters and Developers&nbsp; Pvt Ltd.</td>
                                                <td width="121">Mythreyi Sanyog</td>
                                                <td width="261">Muncipal no 50, (Old no 23),5th Cross, Wilson Garden, Bangalore &ndash; 560 027</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">K2 Builders and Realtors</td>
                                                <td width="121">K2 WOODS</td>
                                                <td width="261">&nbsp;Metalco Plaza' , Falnir Road , Mangalore - 575 002</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">K2 Builders and Realtors</td>
                                                <td width="121">K2 HORIZON</td>
                                                <td width="261">&nbsp;Metalco Plaza' , Falnir Road , Mangalore - 575 002</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Sai Sai Ventures</td>
                                                <td width="121">Sraddha White Cliff</td>
                                                <td width="261">&nbsp;#340/A.10th main,4th Cross. Indiranagar,2nd stage,Bangalore - 560038.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Sai Sai Ventures</td>
                                                <td width="121">SAIDEEP Hulas</td>
                                                <td width="261">&nbsp;#340/A.10th main,4th Cross. Indiranagar,2nd stage,Bangalore - 560038.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Sai Sai Ventures</td>
                                                <td width="121">VR Pearl</td>
                                                <td width="261">&nbsp;#340/A.10th main,4th Cross. Indiranagar,2nd stage,Bangalore - 560038.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Sai Sai Ventures</td>
                                                <td width="121">Sreepadam Nivasa</td>
                                                <td width="261">&nbsp;#340/A.10th main,4th Cross. Indiranagar,2nd stage,Bangalore - 560038.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Sai Sai Ventures</td>
                                                <td width="121">AHP Woods</td>
                                                <td width="261">&nbsp;#340/A.10th main,4th Cross. Indiranagar,2nd stage,Bangalore - 560038.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Sai Sai Ventures</td>
                                                <td width="121">VR Shobha Meadows</td>
                                                <td width="261">&nbsp;#340/A.10th main,4th Cross. Indiranagar,2nd stage,Bangalore - 560038.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Sai Sai Ventures</td>
                                                <td width="121">VR Vatika</td>
                                                <td width="261">&nbsp;#340/A.10th main,4th Cross. Indiranagar,2nd stage,Bangalore - 560038.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Sai Sai Ventures</td>
                                                <td width="121">Samhita Royal Splendor</td>
                                                <td width="261">&nbsp;#340/A.10th main,4th Cross. Indiranagar,2nd stage,Bangalore - 560038.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Sai Sai Ventures</td>
                                                <td width="121">Sri Aditya Nivas</td>
                                                <td width="261">&nbsp;#340/A.10th main,4th Cross. Indiranagar,2nd stage,Bangalore - 560038.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Sai Sai Ventures</td>
                                                <td width="121">Nandanam Paradise</td>
                                                <td width="261">&nbsp;#340/A.10th main,4th Cross. Indiranagar,2nd stage,Bangalore - 560038.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Vishal infrabuild ltd.</td>
                                                <td width="121">Sky park</td>
                                                <td width="261">&nbsp;CTS NO 5853, 1st floor , Emerald corner , maratha colony, congress road, Belgaum</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Vishal infrabuild ltd.</td>
                                                <td width="121">Sanskruti Palm</td>
                                                <td width="261">&nbsp;CTS NO 5853, 1st floor , Emerald corner , maratha colony, congress road, Belgaum</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Vishal infrabuild ltd.</td>
                                                <td width="121">sankalpa bungalow (villa)</td>
                                                <td width="261">&nbsp;CTS NO 5853, 1st floor , Emerald corner , maratha colony, congress road, Belgaum</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">R.S.Developers</td>
                                                <td width="121">Royal Meadows</td>
                                                <td width="261"># 9/2-2, Ist Floor, Purushotham Layout, SBI Road, (Behind India Garage, St.Marks Road), Bangalore - 560 001</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">R.S.Developers</td>
                                                <td width="121">Royal Lakefront Residensicy-IV</td>
                                                <td width="261"># 9/2-2, Ist Floor, Purushotham Layout, SBI Road, (Behind India Garage, St.Marks Road), Bangalore - 560 001</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">R.S.Developers</td>
                                                <td width="121">GARDEENIA COMFORTES</td>
                                                <td width="261"># 9/2-2, Ist Floor, Purushotham Layout, SBI Road, (Behind India Garage, St.Marks Road), Bangalore - 560 001</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">R.S.Developers</td>
                                                <td width="121">RAJ ALKA PARK</td>
                                                <td width="261"># 9/2-2, Ist Floor, Purushotham Layout, SBI Road, (Behind India Garage, St.Marks Road), Bangalore - 560 001</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">R.S.Developers</td>
                                                <td width="121">Royal Shelters</td>
                                                <td width="261"># 9/2-2, Ist Floor, Purushotham Layout, SBI Road, (Behind India Garage, St.Marks Road), Bangalore - 560 001</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">R.S.Developers</td>
                                                <td width="121">Royal Residency</td>
                                                <td width="261"># 9/2-2, Ist Floor, Purushotham Layout, SBI Road, (Behind India Garage, St.Marks Road), Bangalore - 560 001</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">R.S.Developers</td>
                                                <td width="121">Royal Homes</td>
                                                <td width="261"># 9/2-2, Ist Floor, Purushotham Layout, SBI Road, (Behind India Garage, St.Marks Road), Bangalore - 560 001</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">R.S.Developers</td>
                                                <td width="121">Royal Habitat</td>
                                                <td width="261"># 9/2-2, Ist Floor, Purushotham Layout, SBI Road, (Behind India Garage, St.Marks Road), Bangalore - 560 001</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">R.S.Developers</td>
                                                <td width="121">Royal Hermitage</td>
                                                <td width="261"># 9/2-2, Ist Floor, Purushotham Layout, SBI Road, (Behind India Garage, St.Marks Road), Bangalore - 560 001</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">R.S.Developers</td>
                                                <td width="121">Royal Park Residency</td>
                                                <td width="261"># 9/2-2, Ist Floor, Purushotham Layout, SBI Road, (Behind India Garage, St.Marks Road), Bangalore - 560 001</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">R.S.Developers</td>
                                                <td width="121">Royal Lakefront Residency- I, II &amp; III</td>
                                                <td width="261"># 9/2-2, Ist Floor, Purushotham Layout, SBI Road, (Behind India Garage, St.Marks Road), Bangalore - 560 001</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">R.S.Developers</td>
                                                <td width="121">Royal Gardeenia</td>
                                                <td width="261"># 9/2-2, Ist Floor, Purushotham Layout, SBI Road, (Behind India Garage, St.Marks Road), Bangalore - 560 001</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">R.S.Developers</td>
                                                <td width="121">R. S. Green Woods</td>
                                                <td width="261"># 9/2-2, Ist Floor, Purushotham Layout, SBI Road, (Behind India Garage, St.Marks Road), Bangalore - 560 001</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">NBR Groups</td>
                                                <td width="121">NBR TRIFECTA</td>
                                                <td width="261">&nbsp;# 17/R,1st Floor,18th Cross,18th Main, Sector 3, Hsr Layout, Bangalore, 560102, Karnataka, India.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">NBR Groups</td>
                                                <td width="121">NBR HILLS VIEW</td>
                                                <td width="261">&nbsp;# 17/R,1st Floor,18th Cross,18th Main, Sector 3, Hsr Layout, Bangalore, 560102, Karnataka, India.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">NBR Groups</td>
                                                <td width="121">NBR BEVERLY HILLS</td>
                                                <td width="261">&nbsp;# 17/R,1st Floor,18th Cross,18th Main, Sector 3, Hsr Layout, Bangalore, 560102, Karnataka, India.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">NBR Groups</td>
                                                <td width="121">NBR GOLDEN VALLEY</td>
                                                <td width="261">&nbsp;# 17/R,1st Floor,18th Cross,18th Main, Sector 3, Hsr Layout, Bangalore, 560102, Karnataka, India.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">NBR Groups</td>
                                                <td width="121">NBR GREEN VALLEY PHASE 2</td>
                                                <td width="261">&nbsp;# 17/R,1st Floor,18th Cross,18th Main, Sector 3, Hsr Layout, Bangalore, 560102, Karnataka, India.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">NBR Groups</td>
                                                <td width="121">NBR ORANGE COUNTY</td>
                                                <td width="261">&nbsp;# 17/R,1st Floor,18th Cross,18th Main, Sector 3, Hsr Layout, Bangalore, 560102, Karnataka, India.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">NBR Groups</td>
                                                <td width="121">NBR MEADOWS</td>
                                                <td width="261">&nbsp;# 17/R,1st Floor,18th Cross,18th Main, Sector 3, Hsr Layout, Bangalore, 560102, Karnataka, India.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">NBR Groups</td>
                                                <td width="121">NBR GREEN VALLEY PHASE 1</td>
                                                <td width="261">&nbsp;# 17/R,1st Floor,18th Cross,18th Main, Sector 3, Hsr Layout, Bangalore, 560102, Karnataka, India.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">NBR Groups</td>
                                                <td width="121">NBR GARDEN RV</td>
                                                <td width="261">&nbsp;# 17/R,1st Floor,18th Cross,18th Main, Sector 3, Hsr Layout, Bangalore, 560102, Karnataka, India.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">NBR Groups</td>
                                                <td width="121">NBR LAKEVIEW</td>
                                                <td width="261">&nbsp;# 17/R,1st Floor,18th Cross,18th Main, Sector 3, Hsr Layout, Bangalore, 560102, Karnataka, India.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">NBR Groups</td>
                                                <td width="121">NBR HOMES</td>
                                                <td width="261">&nbsp;# 17/R,1st Floor,18th Cross,18th Main, Sector 3, Hsr Layout, Bangalore, 560102, Karnataka, India.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Vakil Housing Development Corporation Pvt. Ltd.</td>
                                                <td width="121">Vakil EnCasa</td>
                                                <td width="261">&nbsp; #78, Koramangala Industrial Area, Jyothi Nivas College Road, Bangalore &ndash; 560095, India</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Vakil Housing Development Corporation Pvt. Ltd.</td>
                                                <td width="121">Vakil Townscape</td>
                                                <td width="261">&nbsp; #78, Koramangala Industrial Area, Jyothi Nivas College Road, Bangalore &ndash; 560095, India</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Sizzle Properties</td>
                                                <td width="121">Sizzle Nandi Valley</td>
                                                <td width="261">&nbsp;# 290, 6th Cross, Vijaya Bank Colony Main Road, Dodda Banaswadi, Bangalore.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Sizzle Properties</td>
                                                <td width="121">Sizzle Gold Coast</td>
                                                <td width="261">&nbsp;# 290, 6th Cross, Vijaya Bank Colony Main Road, Dodda Banaswadi, Bangalore.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Sizzle Properties</td>
                                                <td width="121">Sizzle White Willows</td>
                                                <td width="261">&nbsp;# 290, 6th Cross, Vijaya Bank Colony Main Road, Dodda Banaswadi, Bangalore.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Sizzle Properties</td>
                                                <td width="121">Sizzle IT Meadows</td>
                                                <td width="261">&nbsp;# 290, 6th Cross, Vijaya Bank Colony Main Road, Dodda Banaswadi, Bangalore.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Sizzle Properties</td>
                                                <td width="121">Sizzle Maybelle</td>
                                                <td width="261">&nbsp;# 290, 6th Cross, Vijaya Bank Colony Main Road, Dodda Banaswadi, Bangalore.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Aprameya Properties Pvt. Ltd</td>
                                                <td width="121">Aprameya VRINDA</td>
                                                <td width="261">&nbsp;#2460. 24th Cross, 17th Main,near BDA Complex,Bangalore-560070</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Aprameya Properties Pvt. Ltd</td>
                                                <td width="121">APRAMEYA BRINDAVANAM</td>
                                                <td width="261">&nbsp;#2460. 24th Cross, 17th Main,near BDA Complex,Bangalore-560070</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Aprameya Properties Pvt. Ltd</td>
                                                <td width="121">Aprameya KUTEERAM</td>
                                                <td width="261">&nbsp;#2460. 24th Cross, 17th Main,near BDA Complex,Bangalore-560070</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Aprameya Properties Pvt. Ltd</td>
                                                <td width="121">KAVERAPPA LAYOUTS</td>
                                                <td width="261">&nbsp;#2460. 24th Cross, 17th Main,near BDA Complex,Bangalore-560070</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">SKR Infra Builders &amp; Developers</td>
                                                <td width="121">SKR Meadows</td>
                                                <td width="261">#218, 27th Main, 2nd Sector,Opp. Andhra Bank, HSR Layout Bangalore &ndash; 560 102</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Navya Builders</td>
                                                <td width="121">Navya Niketan</td>
                                                <td width="261">Regd Off: #316,The Mayfair Building,100ft Road,Indiranagar,Bangalore-560038, Indiranagar, HAL 2nd Stage, Appareddipalya, Indiranagar, Bengaluru, Karnataka 560038</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Navya Builders</td>
                                                <td width="121">Navya Nest</td>
                                                <td width="261">Regd Off: #316,The Mayfair Building,100ft Road,Indiranagar,Bangalore-560038, Indiranagar, HAL 2nd Stage, Appareddipalya, Indiranagar, Bengaluru, Karnataka 560038</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Navya Builders</td>
                                                <td width="121">Navya Delight</td>
                                                <td width="261">Regd Off: #316,The Mayfair Building,100ft Road,Indiranagar,Bangalore-560038, Indiranagar, HAL 2nd Stage, Appareddipalya, Indiranagar, Bengaluru, Karnataka 560038</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Navya Builders</td>
                                                <td width="121">Navya Elite</td>
                                                <td width="261">Regd Off: #316,The Mayfair Building,100ft Road,Indiranagar,Bangalore-560038, Indiranagar, HAL 2nd Stage, Appareddipalya, Indiranagar, Bengaluru, Karnataka 560038</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Navya Builders</td>
                                                <td width="121">Navya Nidhi</td>
                                                <td width="261">Regd Off: #316,The Mayfair Building,100ft Road,Indiranagar,Bangalore-560038, Indiranagar, HAL 2nd Stage, Appareddipalya, Indiranagar, Bengaluru, Karnataka 560041</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Navya Builders</td>
                                                <td width="121">Mayfair</td>
                                                <td width="261">Regd Off: #316,The Mayfair Building,100ft Road,Indiranagar,Bangalore-560038, Indiranagar, HAL 2nd Stage, Appareddipalya, Indiranagar, Bengaluru, Karnataka 560043</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Fateh Buildtech Pvt. Ltd</td>
                                                <td width="121">Perfect Casa-Bella</td>
                                                <td width="261">No.16, 3rd Floor, Fateh Complex, S. Kariyappa Road, Yediyur, Basvangudi,Bangalore - 560001</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Fateh Buildtech Pvt. Ltd</td>
                                                <td width="121">Perfecta Elegant</td>
                                                <td width="261">No.16, 3rd Floor, Fateh Complex, S. Kariyappa Road, Yediyur, Basvangudi,Bangalore - 560001</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Fateh Buildtech Pvt. Ltd</td>
                                                <td width="121">Perfecta Premia</td>
                                                <td width="261">No.16, 3rd Floor, Fateh Complex, S. Kariyappa Road, Yediyur, Basvangudi,Bangalore - 560001</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Fateh Buildtech Pvt. Ltd</td>
                                                <td width="121">Perfecta Charisma</td>
                                                <td width="261">No.16, 3rd Floor, Fateh Complex, S. Kariyappa Road, Yediyur, Basvangudi,Bangalore - 560001</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Fateh Buildtech Pvt. Ltd</td>
                                                <td width="121">Parasmani Regency</td>
                                                <td width="261">No.16, 3rd Floor, Fateh Complex, S. Kariyappa Road, Yediyur, Basvangudi,Bangalore - 560001</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Fateh Buildtech Pvt. Ltd</td>
                                                <td width="121">Perfecta Classica</td>
                                                <td width="261">No.16, 3rd Floor, Fateh Complex, S. Kariyappa Road, Yediyur, Basvangudi,Bangalore - 560001</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Fateh Buildtech Pvt. Ltd</td>
                                                <td width="121">Perfecta Charm</td>
                                                <td width="261">No.16, 3rd Floor, Fateh Complex, S. Kariyappa Road, Yediyur, Basvangudi,Bangalore - 560001</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Fateh Buildtech Pvt. Ltd</td>
                                                <td width="121">BHAGYASHREE APOORVA</td>
                                                <td width="261">No.16, 3rd Floor, Fateh Complex, S. Kariyappa Road, Yediyur, Basvangudi,Bangalore - 560001</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">BHAGYASHREE DEVELOPERS</td>
                                                <td width="121">BHAGYASHREE RIVIERA PHASE IV</td>
                                                <td width="261">No 1, Srihari Towers5th "A" Main Road, (Next to Baptist Hospital) Hebbal, Bangalore &ndash; 560024</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">BHAGYASHREE DEVELOPERS</td>
                                                <td width="121">BHAGYASHREE AKSHAYA</td>
                                                <td width="261">No 1, Srihari Towers5th "A" Main Road, (Next to Baptist Hospital) Hebbal, Bangalore &ndash; 560024</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">BHAGYASHREE DEVELOPERS</td>
                                                <td width="121">BHAGYASHREE RIVIERA PHASE II &amp; III</td>
                                                <td width="261">No 1, Srihari Towers5th "A" Main Road, (Next to Baptist Hospital) Hebbal, Bangalore &ndash; 560024</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">BHAGYASHREE DEVELOPERS</td>
                                                <td width="121">BDS GOLDEN RETREAT</td>
                                                <td width="261">No 1, Srihari Towers5th "A" Main Road, (Next to Baptist Hospital) Hebbal, Bangalore &ndash; 560024</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">BHAGYASHREE DEVELOPERS</td>
                                                <td width="121">BDS SHABARI NAGAR PHASE 1 &amp; 2</td>
                                                <td width="261">No 1, Srihari Towers5th "A" Main Road, (Next to Baptist Hospital) Hebbal, Bangalore &ndash; 560024</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">BHAGYASHREE DEVELOPERS</td>
                                                <td width="121">BDS LAYOUT</td>
                                                <td width="261">No 1, Srihari Towers5th "A" Main Road, (Next to Baptist Hospital) Hebbal, Bangalore &ndash; 560024</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">BHAGYASHREE DEVELOPERS</td>
                                                <td width="121">BDS NAGAR</td>
                                                <td width="261">No 1, Srihari Towers5th "A" Main Road, (Next to Baptist Hospital) Hebbal, Bangalore &ndash; 560024</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">BHAGYASHREE DEVELOPERS</td>
                                                <td width="121">BDS GARDEN</td>
                                                <td width="261">No 1, Srihari Towers5th "A" Main Road, (Next to Baptist Hospital) Hebbal, Bangalore &ndash; 560024</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">BHAGYASHREE DEVELOPERS</td>
                                                <td width="121">BHAGYASHREE ROYALE</td>
                                                <td width="261">No 1, Srihari Towers5th "A" Main Road, (Next to Baptist Hospital) Hebbal, Bangalore &ndash; 560024</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">BHAGYASHREE DEVELOPERS</td>
                                                <td width="121">BDS RESIDENCY</td>
                                                <td width="261">No 1, Srihari Towers5th "A" Main Road, (Next to Baptist Hospital) Hebbal, Bangalore &ndash; 560024</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">BHAGYASHREE DEVELOPERS</td>
                                                <td width="121">BHAGYASHREE DEFENSE ENCLAVE</td>
                                                <td width="261">No 1, Srihari Towers5th "A" Main Road, (Next to Baptist Hospital) Hebbal, Bangalore &ndash; 560024</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Krishna Enterprises (H &amp; I) India Pvt. Ltd</td>
                                                <td width="121">Krishna Mystiq</td>
                                                <td width="261">No.32, 2nd Floor, PSR Marvel,Adjacent Toyota Showroom,Adjacent Toyota Showroom,Hebbal, Bengaluru-560 024</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Krishna Enterprises (H &amp; I) India Pvt. Ltd</td>
                                                <td width="121">Krishna Brighton</td>
                                                <td width="261">No.32, 2nd Floor, PSR Marvel,Adjacent Toyota Showroom,Adjacent Toyota Showroom,Hebbal, Bengaluru-560 024</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Krishna Enterprises (H &amp; I) India Pvt. Ltd</td>
                                                <td width="121">Krishna Ascot Heights</td>
                                                <td width="261">No.32, 2nd Floor, PSR Marvel,Adjacent Toyota Showroom,Adjacent Toyota Showroom,Hebbal, Bengaluru-560 024</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Krishna Enterprises (H &amp; I) India Pvt. Ltd</td>
                                                <td width="121">Krishna Greens</td>
                                                <td width="261">No.32, 2nd Floor, PSR Marvel,Adjacent Toyota Showroom,Adjacent Toyota Showroom,Hebbal, Bengaluru-560 024</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Krishna Enterprises (H &amp; I) India Pvt. Ltd</td>
                                                <td width="121">Krishna Dwellington</td>
                                                <td width="261">No.32, 2nd Floor, PSR Marvel,Adjacent Toyota Showroom,Adjacent Toyota Showroom,Hebbal, Bengaluru-560 024</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Krishna Enterprises (H &amp; I) India Pvt. Ltd</td>
                                                <td width="121">STONEVIEW</td>
                                                <td width="261">No.32, 2nd Floor, PSR Marvel,Adjacent Toyota Showroom,Adjacent Toyota Showroom,Hebbal, Bengaluru-560 024</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Krishna Enterprises (H &amp; I) India Pvt. Ltd</td>
                                                <td width="121">home at Krishna Northwoods</td>
                                                <td width="261">No.32, 2nd Floor, PSR Marvel,Adjacent Toyota Showroom,Adjacent Toyota Showroom,Hebbal, Bengaluru-560 024</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">M/s. Durga Projects &amp; Infrastructure Pvt Ltd.</td>
                                                <td width="121">Durga Flute</td>
                                                <td width="261">NO. 125/1-18, G K Arcade, First FloorAshoka Pillar Road, Jayanagar 1ST Block,Bangalore &ndash; 560 011</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">M/s. Durga Projects &amp; Infrastructure Pvt Ltd.</td>
                                                <td width="121">Durga Waves</td>
                                                <td width="261">NO. 125/1-18, G K Arcade, First FloorAshoka Pillar Road, Jayanagar 1ST Block,Bangalore &ndash; 560 011</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">M/s. Durga Projects &amp; Infrastructure Pvt Ltd.</td>
                                                <td width="121">Durga Coral</td>
                                                <td width="261">NO. 125/1-18, G K Arcade, First FloorAshoka Pillar Road, Jayanagar 1ST Block,Bangalore &ndash; 560 011</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">M/s. Durga Projects &amp; Infrastructure Pvt Ltd.</td>
                                                <td width="121">Durga Saffron Square</td>
                                                <td width="261">NO. 125/1-18, G K Arcade, First FloorAshoka Pillar Road, Jayanagar 1ST Block,Bangalore &ndash; 560 011</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">M/s. Durga Projects &amp; Infrastructure Pvt Ltd.</td>
                                                <td width="121">Durga Rainbow</td>
                                                <td width="261">NO. 125/1-18, G K Arcade, First FloorAshoka Pillar Road, Jayanagar 1ST Block,Bangalore &ndash; 560 011</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">VKC Developers Pvt. Ltd.</td>
                                                <td width="121">Chourasia Manor II</td>
                                                <td width="261"># 22, 1st Cross, Ashwath Nagar, Marathahalli, Bangalore &ndash; 37</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">VKC Developers Pvt. Ltd.</td>
                                                <td width="121">Chourasia Pride</td>
                                                <td width="261"># 22, 1st Cross, Ashwath Nagar, Marathahalli, Bangalore &ndash; 37</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">VKC Developers Pvt. Ltd.</td>
                                                <td width="121">Chourasia Heritage</td>
                                                <td width="261"># 22, 1st Cross, Ashwath Nagar, Marathahalli, Bangalore &ndash; 37</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">VKC Developers Pvt. Ltd.</td>
                                                <td width="121">Chourasia Sapphire</td>
                                                <td width="261"># 22, 1st Cross, Ashwath Nagar, Marathahalli, Bangalore &ndash; 37</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">VKC Developers Pvt. Ltd.</td>
                                                <td width="121">Chourasia Heaven</td>
                                                <td width="261"># 22, 1st Cross, Ashwath Nagar, Marathahalli, Bangalore &ndash; 37</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">VKC Developers Pvt. Ltd.</td>
                                                <td width="121">Chourasia Manor I</td>
                                                <td width="261"># 22, 1st Cross, Ashwath Nagar, Marathahalli, Bangalore &ndash; 37</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">VKC Developers Pvt. Ltd.</td>
                                                <td width="121">Chourasia Mansion</td>
                                                <td width="261"># 22, 1st Cross, Ashwath Nagar, Marathahalli, Bangalore &ndash; 37</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">VKC Developers Pvt. Ltd.</td>
                                                <td width="121">Chourasia Crystal</td>
                                                <td width="261"># 22, 1st Cross, Ashwath Nagar, Marathahalli, Bangalore &ndash; 37</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">CMRS Group</td>
                                                <td width="121">Misty Winds</td>
                                                <td width="261">#573, AECS Layout, C Block, Main Road, Opp. ICICI Bank, Bangalore - 560037</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">CMRS Group</td>
                                                <td width="121">Pinnacle</td>
                                                <td width="261">#573, AECS Layout, C Block, Main Road, Opp. ICICI Bank, Bangalore - 560037</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">CMRS Group</td>
                                                <td width="121">Courtyard</td>
                                                <td width="261">#573, AECS Layout, C Block, Main Road, Opp. ICICI Bank, Bangalore - 560037</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">CMRS Group</td>
                                                <td width="121">Lotus</td>
                                                <td width="261">#573, AECS Layout, C Block, Main Road, Opp. ICICI Bank, Bangalore - 560037</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">CMRS Group</td>
                                                <td width="121">CMRS Quanta</td>
                                                <td width="261">#573, AECS Layout, C Block, Main Road, Opp. ICICI Bank, Bangalore - 560037</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">CMRS Group</td>
                                                <td width="121">Verdance</td>
                                                <td width="261">#573, AECS Layout, C Block, Main Road, Opp. ICICI Bank, Bangalore - 560037</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">CMRS Group</td>
                                                <td width="121">Royal Orchid</td>
                                                <td width="261">#573, AECS Layout, C Block, Main Road, Opp. ICICI Bank, Bangalore - 560037</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">CMRS Group</td>
                                                <td width="121">CMRS Sunnydew</td>
                                                <td width="261">#573, AECS Layout, C Block, Main Road, Opp. ICICI Bank, Bangalore - 560037</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">CMRS Group</td>
                                                <td width="121">CMRS Oasis</td>
                                                <td width="261">#573, AECS Layout, C Block, Main Road, Opp. ICICI Bank, Bangalore - 560037</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">CMRS Group</td>
                                                <td width="121">CMRS 12 Square</td>
                                                <td width="261">#573, AECS Layout, C Block, Main Road, Opp. ICICI Bank, Bangalore - 560037</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">SPLENDID GROUP</td>
                                                <td width="121">Splendid Elite</td>
                                                <td width="261">#1, Mahaveer Tower (Near Nandini Hotel),24th Main, J.P. Nagar 6th Phase,Bengaluru- 56007,</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">SPLENDID GROUP</td>
                                                <td width="121">Splendid Lake Dews</td>
                                                <td width="261">#1, Mahaveer Tower (Near Nandini Hotel),24th Main, J.P. Nagar 6th Phase,Bengaluru- 56007,</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">SPLENDID GROUP</td>
                                                <td width="121">Splendid Skylines</td>
                                                <td width="261">#1, Mahaveer Tower (Near Nandini Hotel),24th Main, J.P. Nagar 6th Phase,Bengaluru- 56007,</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">SPLENDID GROUP</td>
                                                <td width="121">Splendid Eternity</td>
                                                <td width="261">#1, Mahaveer Tower (Near Nandini Hotel),24th Main, J.P. Nagar 6th Phase,Bengaluru- 56007,</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Subha builders and developers</td>
                                                <td width="121">Subha Venus Signature</td>
                                                <td width="261">17/F, 18th Cross, Sector-3, HSR Layout,Bengaluru-560 102, Karnataka, India</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Subha builders and developers</td>
                                                <td width="121">Subha Nandana</td>
                                                <td width="261">17/F, 18th Cross, Sector-3, HSR Layout,Bengaluru-560 102, Karnataka, India</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Subha builders and developers</td>
                                                <td width="121">Vijaya Sri Elixir</td>
                                                <td width="261">17/F, 18th Cross, Sector-3, HSR Layout,Bengaluru-560 102, Karnataka, India</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Subha builders and developers</td>
                                                <td width="121">Vijaya Sri Golden Orchids</td>
                                                <td width="261">17/F, 18th Cross, Sector-3, HSR Layout,Bengaluru-560 102, Karnataka, India</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Provident Housing Limited</td>
                                                <td width="121">Vriksha</td>
                                                <td width="261"># 8, Ulsoor Rd, Yellappa Chetty Layout, Sivanchetti Gardens, Bengaluru, Karnataka 560042</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Provident Housing Limited</td>
                                                <td width="121">Provident Sunworth</td>
                                                <td width="261"># 8, Ulsoor Rd, Yellappa Chetty Layout, Sivanchetti Gardens, Bengaluru, Karnataka 560042</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Provident Housing Limited</td>
                                                <td width="121">Provident Welworth City</td>
                                                <td width="261"># 8, Ulsoor Rd, Yellappa Chetty Layout, Sivanchetti Gardens, Bengaluru, Karnataka 560042</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Provident Housing Limited</td>
                                                <td width="121">Rays of Dawn</td>
                                                <td width="261"># 8, Ulsoor Rd, Yellappa Chetty Layout, Sivanchetti Gardens, Bengaluru, Karnataka 560042</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Provident Housing Limited</td>
                                                <td width="121">The Tree By Provident</td>
                                                <td width="261"># 8, Ulsoor Rd, Yellappa Chetty Layout, Sivanchetti Gardens, Bengaluru, Karnataka 560042</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Provident Housing Limited</td>
                                                <td width="121">Provident Harmony</td>
                                                <td width="261"># 8, Ulsoor Rd, Yellappa Chetty Layout, Sivanchetti Gardens, Bengaluru, Karnataka 560042</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Indium Developments Pvt Ltd.</td>
                                                <td width="121">A-Block ( lake forest)</td>
                                                <td width="261">#204/C, 27th Cross, 6th Main,3rd Block, Jayanagar, Bangalore 560011</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Indium Developments Pvt Ltd.</td>
                                                <td width="121">B-Block( lake forest)</td>
                                                <td width="261">#204/C, 27th Cross, 6th Main,3rd Block, Jayanagar, Bangalore 560011</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Indium Developments Pvt Ltd.</td>
                                                <td width="121">D-Block( lake forest)</td>
                                                <td width="261">#204/C, 27th Cross, 6th Main,3rd Block, Jayanagar, Bangalore 560011</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Indium Developments Pvt Ltd.</td>
                                                <td width="121">P-Block( lake forest)</td>
                                                <td width="261">#204/C, 27th Cross, 6th Main,3rd Block, Jayanagar, Bangalore 560011</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">SV infraa</td>
                                                <td width="121">SV SPRINGWOODS</td>
                                                <td width="261">&nbsp;#51 &amp; 52, SV PLAZA, 4th Floor, 8th Main, KSRTC Layout, 2nd phase, JP Nagar, Bangalore 560078</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">SV infraa</td>
                                                <td width="121">SV LUXURIA</td>
                                                <td width="261">&nbsp;#51 &amp; 52, SV PLAZA, 4th Floor, 8th Main, KSRTC Layout, 2nd phase, JP Nagar, Bangalore 560078</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">SV infraa</td>
                                                <td width="121">SV MAPLE</td>
                                                <td width="261">&nbsp;#51 &amp; 52, SV PLAZA, 4th Floor, 8th Main, KSRTC Layout, 2nd phase, JP Nagar, Bangalore 560078</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">SV infraa</td>
                                                <td width="121">SV LIFESTYLE</td>
                                                <td width="261">&nbsp;#51 &amp; 52, SV PLAZA, 4th Floor, 8th Main, KSRTC Layout, 2nd phase, JP Nagar, Bangalore 560081</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">SV infraa</td>
                                                <td width="121">SV MILLENNIUM</td>
                                                <td width="261">&nbsp;#51 &amp; 52, SV PLAZA, 4th Floor, 8th Main, KSRTC Layout, 2nd phase, JP Nagar, Bangalore 560081</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">MJ INFRASTRUCTURE &amp; BUILDERS INDIA PVT. LTD.</td>
                                                <td width="121">AMADEUS</td>
                                                <td width="261">#27, MJ House, Mainpal County Club Road,Singasandra, Bangalore &ndash; 560068</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">MJ INFRASTRUCTURE &amp; BUILDERS INDIA PVT. LTD.</td>
                                                <td width="121">AVERSHINE</td>
                                                <td width="261">#27, MJ House, Mainpal County Club Road,Singasandra, Bangalore &ndash; 560068</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">MJ INFRASTRUCTURE &amp; BUILDERS INDIA PVT. LTD.</td>
                                                <td width="121">ASTRO</td>
                                                <td width="261">#27, MJ House, Mainpal County Club Road,Singasandra, Bangalore &ndash; 560068</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">G.R.Constructions</td>
                                                <td width="121">GRC Brundavan</td>
                                                <td width="261">&nbsp;No. 161/A, 7th Cross,1st Stage, Teachers Colony, Kumaraswamy Layout,Bangalore - 78.<br /> <br /> <br /> <br /> <br /> <br /> <br /> </td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">G.R.Constructions</td>
                                                <td width="121">SANKALPA.</td>
                                                <td width="261">&nbsp;No. 161/A, 7th Cross,1st Stage, Teachers Colony, Kumaraswamy Layout,Bangalore - 78.<br /> <br /> <br /> <br /> <br /> <br /> <br /> </td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">G.R.Constructions</td>
                                                <td width="121">SHRUSHTI</td>
                                                <td width="261">&nbsp;No. 161/A, 7th Cross,1st Stage, Teachers Colony, Kumaraswamy Layout,Bangalore - 78.<br /> <br /> <br /> <br /> <br /> <br /> <br /> </td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">G.R.Constructions</td>
                                                <td width="121">GR Comforts</td>
                                                <td width="261">&nbsp;No. 161/A, 7th Cross,1st Stage, Teachers Colony, Kumaraswamy Layout,Bangalore - 78.<br /> <br /> <br /> <br /> <br /> <br /> <br /> </td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">G.R.Constructions</td>
                                                <td width="121">GR SHREE NIVAS PHASE 1</td>
                                                <td width="261">&nbsp;No. 161/A, 7th Cross,1st Stage, Teachers Colony, Kumaraswamy Layout,Bangalore - 78.<br /> <br /> <br /> <br /> <br /> </td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">G.R.Constructions</td>
                                                <td width="121">GR SHREE NIVAS PHASE 2</td>
                                                <td width="261">&nbsp;No. 161/A, 7th Cross,1st Stage, Teachers Colony, Kumaraswamy Layout,Bangalore - 78.<br /> <br /> <br /> <br /> <br /> <br /> <br /> </td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">G.R.Constructions</td>
                                                <td width="121">GR VISTAS</td>
                                                <td width="261">&nbsp;No. 161/A, 7th Cross,1st Stage, Teachers Colony, Kumaraswamy Layout,Bangalore - 78.<br /> <br /> <br /> <br /> <br /> <br /> <br /> </td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">G.R.Constructions</td>
                                                <td width="121">GR SHANTI NIVAS</td>
                                                <td width="261">&nbsp;No. 161/A, 7th Cross,1st Stage, Teachers Colony, Kumaraswamy Layout,Bangalore - 78.<br /> <br /> <br /> <br /> <br /> <br /> <br /> </td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">G.R.Constructions</td>
                                                <td width="121">GR SAGAR NIVAS</td>
                                                <td width="261">&nbsp;No. 161/A, 7th Cross,1st Stage, Teachers Colony, Kumaraswamy Layout,Bangalore - 78.<br /> <br /> <br /> <br /> <br /> <br /> <br /> </td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">UNNATHI GROUP INDIA INC&nbsp;</td>
                                                <td width="121">SUKRUTHI GARDENIA</td>
                                                <td width="261"># 189, 2nd Floor, 1st Main, WOC Road, Mahalakshmi layout, Bangalore &ndash; 560 086</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">UNNATHI GROUP INDIA INC&nbsp;</td>
                                                <td width="121">SUNSHINE GARDENIA</td>
                                                <td width="261"># 189, 2nd Floor, 1st Main, WOC Road, Mahalakshmi layout, Bangalore &ndash; 560 086</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">UNNATHI GROUP INDIA INC&nbsp;</td>
                                                <td width="121">PRASIDDHI NEST</td>
                                                <td width="261"># 189, 2nd Floor, 1st Main, WOC Road, Mahalakshmi layout, Bangalore &ndash; 560 086</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Mana Projects Pvt. Ltd&nbsp;</td>
                                                <td width="121">Mana Foliage</td>
                                                <td width="261">3rd floor, No.20/7,Swamy legato, Kadubisanahalli,Outer ring road,Bangalore &ndash; 560103</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Mana Projects Pvt. Ltd&nbsp;</td>
                                                <td width="121">Mana Candela</td>
                                                <td width="261">4th floor, No.20/7,Swamy legato, Kadubisanahalli,Outer ring road,Bangalore &ndash; 560103</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Purnima Build Tech&nbsp;&nbsp;</td>
                                                <td width="121">Purnima Platina</td>
                                                <td width="261">&nbsp;#1147, 6th Main, 18th Cross, HSR Layout, 7th Sector,Bangalore - 560 102.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Purnima Build Tech&nbsp;&nbsp;</td>
                                                <td width="121">Purnima Classic</td>
                                                <td width="261">&nbsp;#1147, 6th Main, 18th Cross, HSR Layout, 7th Sector,Bangalore - 560 102.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Purnima Build Tech&nbsp;&nbsp;</td>
                                                <td width="121">Purnima Elite</td>
                                                <td width="261">&nbsp;#1147, 6th Main, 18th Cross, HSR Layout, 7th Sector,Bangalore - 560 102.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Purnima Build Tech&nbsp;&nbsp;</td>
                                                <td width="121">Purnima Villa</td>
                                                <td width="261">&nbsp;#1147, 6th Main, 18th Cross, HSR Layout, 7th Sector,Bangalore - 560 102.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Brigade Enterprises Limited&nbsp;</td>
                                                <td width="121">Brigade Caladium</td>
                                                <td width="261">29th &amp; 30th Floors, World Trade Center Brigade Gateway Campus, 26/1, Dr Rajkumar Road, Malleswaram - Rajajinagar, Bangalore - 560 055.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Brigade Enterprises Limited&nbsp;</td>
                                                <td width="121">Brigade Cosmopolis</td>
                                                <td width="261">30th &amp; 30th Floors, World Trade Center Brigade Gateway Campus, 26/1, Dr Rajkumar Road, Malleswaram - Rajajinagar, Bangalore - 560 055.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Brigade Enterprises Limited&nbsp;</td>
                                                <td width="121">Brigade Exotica</td>
                                                <td width="261">31st &amp; 30th Floors, World Trade Center Brigade Gateway Campus, 26/1, Dr Rajkumar Road, Malleswaram - Rajajinagar, Bangalore - 560 055.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Brigade Enterprises Limited&nbsp;</td>
                                                <td width="121">Brigade Triangle</td>
                                                <td width="261">32nd &amp; 30th Floors, World Trade Center Brigade Gateway Campus, 26/1, Dr Rajkumar Road, Malleswaram - Rajajinagar, Bangalore - 560 055.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Brigade Enterprises Limited&nbsp;</td>
                                                <td width="121">Brigade North Ridge</td>
                                                <td width="261">32nd &amp; 30th Floors, World Trade Center Brigade Gateway Campus, 26/1, Dr Rajkumar Road, Malleswaram - Rajajinagar, Bangalore - 560 055.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Brigade Enterprises Limited&nbsp;</td>
                                                <td width="121">Brigade Omega</td>
                                                <td width="261">33rd &amp; 30th Floors, World Trade Center Brigade Gateway Campus, 26/1, Dr Rajkumar Road, Malleswaram - Rajajinagar, Bangalore - 560 055.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Brigade Enterprises Limited&nbsp;</td>
                                                <td width="121">Brigade Orchards Luxury Apartments</td>
                                                <td width="261">34th &amp; 30th Floors, World Trade Center Brigade Gateway Campus, 26/1, Dr Rajkumar Road, Malleswaram - Rajajinagar, Bangalore - 560 055.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Brigade Enterprises Limited&nbsp;</td>
                                                <td width="121">Brigade Wisteria at Brigade Meadows</td>
                                                <td width="261">35th &amp; 30th Floors, World Trade Center Brigade Gateway Campus, 26/1, Dr Rajkumar Road, Malleswaram - Rajajinagar, Bangalore - 560 055.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Brigade Enterprises Limited&nbsp;</td>
                                                <td width="121">Brigade Crescent</td>
                                                <td width="261">36th &amp; 30th Floors, World Trade Center Brigade Gateway Campus, 26/1, Dr Rajkumar Road, Malleswaram - Rajajinagar, Bangalore - 560 055.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Brigade Enterprises Limited&nbsp;</td>
                                                <td width="121">Brigade Orchards parkside Retirement Homes</td>
                                                <td width="261">37th &amp; 30th Floors, World Trade Center Brigade Gateway Campus, 26/1, Dr Rajkumar Road, Malleswaram - Rajajinagar, Bangalore - 560 055.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Brigade Enterprises Limited&nbsp;</td>
                                                <td width="121">Brigade Orchards Pavilion villas</td>
                                                <td width="261">38th &amp; 30th Floors, World Trade Center Brigade Gateway Campus, 26/1, Dr Rajkumar Road, Malleswaram - Rajajinagar, Bangalore - 560 055.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Brigade Enterprises Limited&nbsp;</td>
                                                <td width="121">Brigade Gardenia Annexe</td>
                                                <td width="261">39th &amp; 30th Floors, World Trade Center Brigade Gateway Campus, 26/1, Dr Rajkumar Road, Malleswaram - Rajajinagar, Bangalore - 560 055.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Brigade Enterprises Limited&nbsp;</td>
                                                <td width="121">Brigade Altament</td>
                                                <td width="261">40th &amp; 30th Floors, World Trade Center Brigade Gateway Campus, 26/1, Dr Rajkumar Road, Malleswaram - Rajajinagar, Bangalore - 560 055.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Brigade Enterprises Limited&nbsp;</td>
                                                <td width="121">Brigade Millenium</td>
                                                <td width="261">41st &amp; 30th Floors, World Trade Center Brigade Gateway Campus, 26/1, Dr Rajkumar Road, Malleswaram - Rajajinagar, Bangalore - 560 055.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Brigade Enterprises Limited&nbsp;</td>
                                                <td width="121">Brigade pinnacle</td>
                                                <td width="261">42nd &amp; 30th Floors, World Trade Center Brigade Gateway Campus, 26/1, Dr Rajkumar Road, Malleswaram - Rajajinagar, Bangalore - 560 055.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Brigade Enterprises Limited&nbsp;</td>
                                                <td width="121">Brigade Mountain View</td>
                                                <td width="261">43rd &amp; 30th Floors, World Trade Center Brigade Gateway Campus, 26/1, Dr Rajkumar Road, Malleswaram - Rajajinagar, Bangalore - 560 055.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Brigade Enterprises Limited&nbsp;</td>
                                                <td width="121">Brigade Palmgrove</td>
                                                <td width="261">44th &amp; 30th Floors, World Trade Center Brigade Gateway Campus, 26/1, Dr Rajkumar Road, Malleswaram - Rajajinagar, Bangalore - 560 055.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">DS-MAX Properties Pvt.Ltd</td>
                                                <td width="121">DS-MAX SAROVAR</td>
                                                <td width="261"><br /> 1854, 17th Main, 30th B Cross, 5th Block, HBR Layout, Near to Ring Road, 5th Block, HBR Layout, Bengaluru- 560043</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">DS-MAX Properties Pvt.Ltd</td>
                                                <td width="121">DS-MAX Skylishcious</td>
                                                <td width="261"><br /> 1854, 17th Main, 30th B Cross, 5th Block, HBR Layout, Near to Ring Road, 5th Block, HBR Layout, Bengaluru- 560043</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">DS-MAX Properties Pvt.Ltd</td>
                                                <td width="121">DS-MAX SAVVY</td>
                                                <td width="261"><br /> 1854, 17th Main, 30th B Cross, 5th Block, HBR Layout, Near to Ring Road, 5th Block, HBR Layout, Bengaluru- 560043</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">DS-MAX Properties Pvt.Ltd</td>
                                                <td width="121">DS-MAX SAANJH</td>
                                                <td width="261"><br /> 1854, 17th Main, 30th B Cross, 5th Block, HBR Layout, Near to Ring Road, 5th Block, HBR Layout, Bengaluru- 560043</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">DS-MAX Properties Pvt.Ltd</td>
                                                <td width="121">DS-MAX SPRINKLES</td>
                                                <td width="261"><br /> 1854, 17th Main, 30th B Cross, 5th Block, HBR Layout, Near to Ring Road, 5th Block, HBR Layout, Bengaluru- 560043</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">DS-MAX Properties Pvt.Ltd</td>
                                                <td width="121">DS-MAX SIGMA-NEST</td>
                                                <td width="261"><br /> 1854, 17th Main, 30th B Cross, 5th Block, HBR Layout, Near to Ring Road, 5th Block, HBR Layout, Bengaluru- 560043</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">DS-MAX Properties Pvt.Ltd</td>
                                                <td width="121">DS-MAX SWASTIK</td>
                                                <td width="261"><br /> 1854, 17th Main, 30th B Cross, 5th Block, HBR Layout, Near to Ring Road, 5th Block, HBR Layout, Bengaluru- 560043</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">DS-MAX Properties Pvt.Ltd</td>
                                                <td width="121">DS-MAX SIGMA</td>
                                                <td width="261"><br /> 1854, 17th Main, 30th B Cross, 5th Block, HBR Layout, Near to Ring Road, 5th Block, HBR Layout, Bengaluru- 560043</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">DS-MAX Properties Pvt.Ltd</td>
                                                <td width="121">DS-MAX SEAGULL</td>
                                                <td width="261"><br /> 1854, 17th Main, 30th B Cross, 5th Block, HBR Layout, Near to Ring Road, 5th Block, HBR Layout, Bengaluru- 560043</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Shri Aruna Constructions pvt ltd&nbsp;</td>
                                                <td width="121">Aruna Pinewoods</td>
                                                <td width="261">Sri Devi Propertes, #372/373, 1st Floor 13th A Main, 80 Feet Road, Yalahanka New Town Bangalore-560064</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Shri Aruna Constructions pvt ltd&nbsp;</td>
                                                <td width="121">Trivik Windwalk</td>
                                                <td width="261">Sri Devi Propertes, #372/373, 1st Floor 13th A Main, 80 Feet Road, Yalahanka New Town Bangalore-560064</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Saiven Developers &amp; Constructions Pvt Ltd</td>
                                                <td width="121">SAIVEN MARBLE ARCH</td>
                                                <td width="261"><br /> &nbsp;#1664, 2nd Floor, 27th Main, 2nd Sector,<br /> &nbsp;HSR Layout, Bangalore - 560102, INDIA."</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Saiven Developers &amp; Constructions Pvt Ltd</td>
                                                <td width="121">SAIVEN WINDCHIMES</td>
                                                <td width="261"><br /> &nbsp;#1664, 2nd Floor, 27th Main, 2nd Sector,<br /> &nbsp;HSR Layout, Bangalore - 560102, INDIA."</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Saiven Developers &amp; Constructions Pvt Ltd</td>
                                                <td width="121">SAIVEN CAESARS PALACE</td>
                                                <td width="261"><br /> &nbsp;#1664, 2nd Floor, 27th Main, 2nd Sector,<br /> &nbsp;HSR Layout, Bangalore - 560102, INDIA."</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">ATZ Properties</td>
                                                <td width="121">ATZ Estrella</td>
                                                <td width="261"><br /> &nbsp;12/1, Plain Street, Infantry Road Cross,<br /> &nbsp;Shivaji Nagar,Bangalore-560001.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">ATZ Properties</td>
                                                <td width="121">ATZ Ultima</td>
                                                <td width="261"><br /> &nbsp;12/1, Plain Street, Infantry Road Cross,<br /> &nbsp;Shivaji Nagar,Bangalore-560001.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">ATZ Properties</td>
                                                <td width="121">ATZ Rock View</td>
                                                <td width="261"><br /> &nbsp;12/1, Plain Street, Infantry Road Cross,<br /> &nbsp;Shivaji Nagar,Bangalore-560001.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">ATZ Properties</td>
                                                <td width="121">ATZ Splendor</td>
                                                <td width="261"><br /> &nbsp;12/1, Plain Street, Infantry Road Cross,<br /> &nbsp;Shivaji Nagar,Bangalore-560001.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">ATZ Properties</td>
                                                <td width="121">ATZ Grandeur</td>
                                                <td width="261"><br /> &nbsp;12/1, Plain Street, Infantry Road Cross,<br /> &nbsp;Shivaji Nagar,Bangalore-560001.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">ATZ Properties</td>
                                                <td width="121">ATZ Gladiola Gardenia</td>
                                                <td width="261"><br /> &nbsp;12/1, Plain Street, Infantry Road Cross,<br /> &nbsp;Shivaji Nagar,Bangalore-560001.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">ATZ Properties</td>
                                                <td width="121">ATZ Palatial</td>
                                                <td width="261"><br /> &nbsp;12/1, Plain Street, Infantry Road Cross,<br /> &nbsp;Shivaji Nagar,Bangalore-560001.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Embassy GolfLinks Business Park, Royal Oaks</td>
                                                <td width="121">EMBASSY GOLFLINKS BUSINESS PARK</td>
                                                <td width="261"><br /> Off Intermediate Ring Road,<br /> Bengaluru &ndash; 560 071.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Embassy GolfLinks Business Park, Royal Oaks</td>
                                                <td width="121">EMBASSY MANYATA BUSINESS PARK</td>
                                                <td width="261"><br /> Off Intermediate Ring Road,<br /> Bengaluru &ndash; 560 071.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Embassy GolfLinks Business Park, Royal Oaks</td>
                                                <td width="121">EMBASSY TECHVILLAGE</td>
                                                <td width="261"><br /> Off Intermediate Ring Road,<br /> Bengaluru &ndash; 560 071.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Embassy GolfLinks Business Park, Royal Oaks</td>
                                                <td width="121">Embassy Knowledge Park,</td>
                                                <td width="261"><br /> Off Intermediate Ring Road,<br /> Bengaluru &ndash; 560 071.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Embassy GolfLinks Business Park, Royal Oaks</td>
                                                <td width="121">EMBASSY PRISTINE</td>
                                                <td width="261"><br /> Off Intermediate Ring Road,<br /> Bengaluru &ndash; 560 071.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">AXIS CONCEPT CONSTRUCTION PVT. LTD.</td>
                                                <td width="121">Axis Tatvam</td>
                                                <td width="261">&nbsp;#555, Axis Padegal, 4th Floor, 9th Cross, 3rd Phase, J.P. Nagar, Bangalore-560078</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">AXIS CONCEPT CONSTRUCTION PVT. LTD.</td>
                                                <td width="121">Axis Vedam</td>
                                                <td width="261">&nbsp;#555, Axis Padegal, 4th Floor, 9th Cross, 3rd Phase, J.P. Nagar, Bangalore-560078</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">AXIS CONCEPT CONSTRUCTION PVT. LTD.</td>
                                                <td width="121">Axis Amairo</td>
                                                <td width="261">&nbsp;#555, Axis Padegal, 4th Floor, 9th Cross, 3rd Phase, J.P. Nagar, Bangalore-560078</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">AXIS CONCEPT CONSTRUCTION PVT. LTD.</td>
                                                <td width="121">Axis Viviana</td>
                                                <td width="261">&nbsp;#555, Axis Padegal, 4th Floor, 9th Cross, 3rd Phase, J.P. Nagar, Bangalore-560078</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">AXIS CONCEPT CONSTRUCTION PVT. LTD.</td>
                                                <td width="121">Axis Olivia</td>
                                                <td width="261">&nbsp;#555, Axis Padegal, 4th Floor, 9th Cross, 3rd Phase, J.P. Nagar, Bangalore-560078</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">AXIS CONCEPT CONSTRUCTION PVT. LTD.</td>
                                                <td width="121">Axis Tuscan Terraces</td>
                                                <td width="261">&nbsp;#555, Axis Padegal, 4th Floor, 9th Cross, 3rd Phase, J.P. Nagar, Bangalore-560078</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">AXIS CONCEPT CONSTRUCTION PVT. LTD.</td>
                                                <td width="121">Axis Mithi</td>
                                                <td width="261">&nbsp;#555, Axis Padegal, 4th Floor, 9th Cross, 3rd Phase, J.P. Nagar, Bangalore-560078</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">AXIS CONCEPT CONSTRUCTION PVT. LTD.</td>
                                                <td width="121">Axis Citrino</td>
                                                <td width="261">&nbsp;#555, Axis Padegal, 4th Floor, 9th Cross, 3rd Phase, J.P. Nagar, Bangalore-560078</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">AXIS CONCEPT CONSTRUCTION PVT. LTD.</td>
                                                <td width="121">Oak Ridge</td>
                                                <td width="261">&nbsp;#555, Axis Padegal, 4th Floor, 9th Cross, 3rd Phase, J.P. Nagar, Bangalore-560078</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">AXIS CONCEPT CONSTRUCTION PVT. LTD.</td>
                                                <td width="121">Oak Ville</td>
                                                <td width="261">&nbsp;#555, Axis Padegal, 4th Floor, 9th Cross, 3rd Phase, J.P. Nagar, Bangalore-560078</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">AXIS CONCEPT CONSTRUCTION PVT. LTD.</td>
                                                <td width="121">Axis Sinopia</td>
                                                <td width="261">&nbsp;#555, Axis Padegal, 4th Floor, 9th Cross, 3rd Phase, J.P. Nagar, Bangalore-560078</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">AXIS CONCEPT CONSTRUCTION PVT. LTD.</td>
                                                <td width="121">Moon Mist</td>
                                                <td width="261">&nbsp;#555, Axis Padegal, 4th Floor, 9th Cross, 3rd Phase, J.P. Nagar, Bangalore-560078</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">AXIS CONCEPT CONSTRUCTION PVT. LTD.</td>
                                                <td width="121">The Palm</td>
                                                <td width="261">&nbsp;#555, Axis Padegal, 4th Floor, 9th Cross, 3rd Phase, J.P. Nagar, Bangalore-560078</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">AXIS CONCEPT CONSTRUCTION PVT. LTD.</td>
                                                <td width="121">Spring Wood</td>
                                                <td width="261">&nbsp;#555, Axis Padegal, 4th Floor, 9th Cross, 3rd Phase, J.P. Nagar, Bangalore-560078</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">AXIS CONCEPT CONSTRUCTION PVT. LTD.</td>
                                                <td width="121">Spring leaf</td>
                                                <td width="261">&nbsp;#555, Axis Padegal, 4th Floor, 9th Cross, 3rd Phase, J.P. Nagar, Bangalore-560078</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">AXIS CONCEPT CONSTRUCTION PVT. LTD.</td>
                                                <td width="121">Brock Wood</td>
                                                <td width="261">&nbsp;#555, Axis Padegal, 4th Floor, 9th Cross, 3rd Phase, J.P. Nagar, Bangalore-560078</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">AXIS CONCEPT CONSTRUCTION PVT. LTD.</td>
                                                <td width="121">Woodville</td>
                                                <td width="261">&nbsp;#555, Axis Padegal, 4th Floor, 9th Cross, 3rd Phase, J.P. Nagar, Bangalore-560078</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">AXIS CONCEPT CONSTRUCTION PVT. LTD.</td>
                                                <td width="121">RamaRaju Residency<br /> Location</td>
                                                <td width="261">&nbsp;#555, Axis Padegal, 4th Floor, 9th Cross, 3rd Phase, J.P. Nagar, Bangalore-560078</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">AXIS CONCEPT CONSTRUCTION PVT. LTD.</td>
                                                <td width="121">Axis Padegal</td>
                                                <td width="261">&nbsp;#555, Axis Padegal, 4th Floor, 9th Cross, 3rd Phase, J.P. Nagar, Bangalore-560078</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">AXIS CONCEPT CONSTRUCTION PVT. LTD.</td>
                                                <td width="121">Axis Saijyothi</td>
                                                <td width="261">&nbsp;#555, Axis Padegal, 4th Floor, 9th Cross, 3rd Phase, J.P. Nagar, Bangalore-560078</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">AXIS CONCEPT CONSTRUCTION PVT. LTD.</td>
                                                <td width="121">Axis Valencia</td>
                                                <td width="261">&nbsp;#555, Axis Padegal, 4th Floor, 9th Cross, 3rd Phase, J.P. Nagar, Bangalore-560078</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">HM GROUP</td>
                                                <td width="121">HM Zeta</td>
                                                <td width="261">&nbsp;HM Geneva House<br /> &nbsp;No.14, 6th Floor<br /> &nbsp;Cunningham Road<br /> &nbsp;Bangalore-560052,</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">HM GROUP</td>
                                                <td width="121">HM Info Park</td>
                                                <td width="261">&nbsp;HM Geneva House<br /> &nbsp;No.14, 6th Floor<br /> &nbsp;Cunningham Road<br /> &nbsp;Bangalore-560052,</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">HM GROUP</td>
                                                <td width="121">HM Tech Park</td>
                                                <td width="261">&nbsp;HM Geneva House<br /> &nbsp;No.14, 6th Floor<br /> &nbsp;Cunningham Road<br /> &nbsp;Bangalore-560052,</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">HM GROUP</td>
                                                <td width="121">HM Astrid.</td>
                                                <td width="261">&nbsp;HM Geneva House<br /> &nbsp;No.14, 6th Floor<br /> &nbsp;Cunningham Road<br /> &nbsp;Bangalore-560052,</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">HM GROUP</td>
                                                <td width="121">HM Geneva House</td>
                                                <td width="261">&nbsp;HM Geneva House<br /> &nbsp;No.14, 6th Floor<br /> &nbsp;Cunningham Road<br /> &nbsp;Bangalore-560052,</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">HM GROUP</td>
                                                <td width="121">HM Towers</td>
                                                <td width="261">&nbsp;HM Geneva House<br /> &nbsp;No.14, 6th Floor<br /> &nbsp;Cunningham Road<br /> &nbsp;Bangalore-560052,</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">HM GROUP</td>
                                                <td width="121">HM Vibha Towers</td>
                                                <td width="261">&nbsp;HM Geneva House<br /> &nbsp;No.14, 6th Floor<br /> &nbsp;Cunningham Road<br /> &nbsp;Bangalore-560052,</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">HM GROUP</td>
                                                <td width="121">HM Eleganza</td>
                                                <td width="261">&nbsp;HM Geneva House<br /> &nbsp;No.14, 6th Floor<br /> &nbsp;Cunningham Road<br /> &nbsp;Bangalore-560052,</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">HM GROUP</td>
                                                <td width="121">HM Rochester</td>
                                                <td width="261">&nbsp;HM Geneva House<br /> &nbsp;No.14, 6th Floor<br /> &nbsp;Cunningham Road<br /> &nbsp;Bangalore-560052,</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Sattva Group&nbsp;</td>
                                                <td width="121">Pipal Tree</td>
                                                <td width="261"><br /> 4th Floor, Salarpuria Windsor, #3 Ulsoor Road<br /> Bangalore 560 042</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Sattva Group&nbsp;</td>
                                                <td width="121">Laurel Heights</td>
                                                <td width="261"><br /> 4th Floor, Salarpuria Windsor, #3 Ulsoor Road<br /> Bangalore 560 042</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Sattva Group&nbsp;</td>
                                                <td width="121">Northland</td>
                                                <td width="261"><br /> 4th Floor, Salarpuria Windsor, #3 Ulsoor Road<br /> Bangalore 560 042</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Sattva Group&nbsp;</td>
                                                <td width="121">Greenage</td>
                                                <td width="261"><br /> 4th Floor, Salarpuria Windsor, #3 Ulsoor Road<br /> Bangalore 560 042</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Sattva Group&nbsp;</td>
                                                <td width="121">Luxuria</td>
                                                <td width="261"><br /> 4th Floor, Salarpuria Windsor, #3 Ulsoor Road<br /> Bangalore 560 042</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Sattva Group&nbsp;</td>
                                                <td width="121">Magnificia</td>
                                                <td width="261"><br /> 4th Floor, Salarpuria Windsor, #3 Ulsoor Road<br /> Bangalore 560 042</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Sattva Group&nbsp;</td>
                                                <td width="121">Gold Summit</td>
                                                <td width="261"><br /> 4th Floor, Salarpuria Windsor, #3 Ulsoor Road<br /> Bangalore 560 042</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Sattva Group&nbsp;</td>
                                                <td width="121">Senorita</td>
                                                <td width="261"><br /> 4th Floor, Salarpuria Windsor, #3 Ulsoor Road<br /> Bangalore 560 042</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Sattva Group&nbsp;</td>
                                                <td width="121">Melody</td>
                                                <td width="261"><br /> 4th Floor, Salarpuria Windsor, #3 Ulsoor Road<br /> Bangalore 560 042</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Sattva Group&nbsp;</td>
                                                <td width="121">Celesta</td>
                                                <td width="261"><br /> 4th Floor, Salarpuria Windsor, #3 Ulsoor Road<br /> Bangalore 560 042</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Sattva Group&nbsp;</td>
                                                <td width="121">Aspire</td>
                                                <td width="261"><br /> 4th Floor, Salarpuria Windsor, #3 Ulsoor Road<br /> Bangalore 560 042</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Sattva Group&nbsp;</td>
                                                <td width="121">King's Domain</td>
                                                <td width="261"><br /> 4th Floor, Salarpuria Windsor, #3 Ulsoor Road<br /> Bangalore 560 042</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Sattva Group&nbsp;</td>
                                                <td width="121">Casa Crescent</td>
                                                <td width="261"><br /> 4th Floor, Salarpuria Windsor, #3 Ulsoor Road<br /> Bangalore 560 042</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Sattva Group&nbsp;</td>
                                                <td width="121">MAGNIFICIA</td>
                                                <td width="261"><br /> 4th Floor, Salarpuria Windsor, #3 Ulsoor Road<br /> Bangalore 560 042</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Sattva Group&nbsp;</td>
                                                <td width="121">GALLERIA</td>
                                                <td width="261"><br /> 4th Floor, Salarpuria Windsor, #3 Ulsoor Road<br /> Bangalore 560 042</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Sattva Group&nbsp;</td>
                                                <td width="121">MINDCOMP TECH PARK</td>
                                                <td width="261"><br /> 4th Floor, Salarpuria Windsor, #3 Ulsoor Road<br /> Bangalore 560 042</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Sattva Group&nbsp;</td>
                                                <td width="121">EMINENCE</td>
                                                <td width="261"><br /> 4th Floor, Salarpuria Windsor, #3 Ulsoor Road<br /> Bangalore 560 042</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">HEXA BUILDERS</td>
                                                <td width="121">HEXA SUPREME</td>
                                                <td width="261">&nbsp;No. 314(old no.29), 33rd Cross, 17th main, <br /> &nbsp;4th 'T' Block,pattabhirama Nagar, Jayanagar, Banglore 560 011.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">CONCORDE HOUSING CORPORATION PRIVATE LIMITED</td>
                                                <td width="121">Concorde Napa Valley</td>
                                                <td width="261">#46/A, 1st Main Road, 3rd Phase, JP Nagar, <br /> Bangalore, Karnataka - 560078&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">CONCORDE HOUSING CORPORATION PRIVATE LIMITED</td>
                                                <td width="121">Concorde Tech Turf</td>
                                                <td width="261">#46/A, 1st Main Road, 3rd Phase, JP Nagar, <br /> Bangalore, Karnataka - 560078&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">CONCORDE HOUSING CORPORATION PRIVATE LIMITED</td>
                                                <td width="121">Concorde Opus One</td>
                                                <td width="261">#46/A, 1st Main Road, 3rd Phase, JP Nagar, <br /> Bangalore, Karnataka - 560078&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">CONCORDE HOUSING CORPORATION PRIVATE LIMITED</td>
                                                <td width="121">Concorde Mist Valley</td>
                                                <td width="261">#46/A, 1st Main Road, 3rd Phase, JP Nagar, <br /> Bangalore, Karnataka - 560078&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">CONCORDE HOUSING CORPORATION PRIVATE LIMITED</td>
                                                <td width="121">Concorde Wind Rush</td>
                                                <td width="261">#46/A, 1st Main Road, 3rd Phase, JP Nagar, <br /> Bangalore, Karnataka - 560078&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">CONCORDE HOUSING CORPORATION PRIVATE LIMITED</td>
                                                <td width="121">Concorde Amber</td>
                                                <td width="261">#46/A, 1st Main Road, 3rd Phase, JP Nagar, <br /> Bangalore, Karnataka - 560078&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">CONCORDE HOUSING CORPORATION PRIVATE LIMITED</td>
                                                <td width="121">Concorde Manhattans</td>
                                                <td width="261">#46/A, 1st Main Road, 3rd Phase, JP Nagar, <br /> Bangalore, Karnataka - 560078&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">CONCORDE HOUSING CORPORATION PRIVATE LIMITED</td>
                                                <td width="121">Concorde Cuppertino</td>
                                                <td width="261">#46/A, 1st Main Road, 3rd Phase, JP Nagar, <br /> Bangalore, Karnataka - 560078&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">CONCORDE HOUSING CORPORATION PRIVATE LIMITED</td>
                                                <td width="121">Concorde Midway City</td>
                                                <td width="261">#46/A, 1st Main Road, 3rd Phase, JP Nagar, <br /> Bangalore, Karnataka - 560078&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">CONCORDE HOUSING CORPORATION PRIVATE LIMITED</td>
                                                <td width="121">Concorde Sylvan View</td>
                                                <td width="261">#46/A, 1st Main Road, 3rd Phase, JP Nagar, <br /> Bangalore, Karnataka - 560078&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">CONCORDE HOUSING CORPORATION PRIVATE LIMITED</td>
                                                <td width="121">Concorde South Scape</td>
                                                <td width="261">#46/A, 1st Main Road, 3rd Phase, JP Nagar, <br /> Bangalore, Karnataka - 560078&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">CONCORDE HOUSING CORPORATION PRIVATE LIMITED</td>
                                                <td width="121">Concorde Livingston</td>
                                                <td width="261">#46/A, 1st Main Road, 3rd Phase, JP Nagar, <br /> Bangalore, Karnataka - 560078&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Vasavi Builders</td>
                                                <td width="121">Vasavi Pearl</td>
                                                <td width="261">Novel Business Center, No:10,100ft Outer Ring Road, BTM Layout 1st Stage,, Bangalore 560068</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Vasavi Builders</td>
                                                <td width="121">vasavi Residency 1</td>
                                                <td width="261">Novel Business Center, No:10,100ft Outer Ring Road, BTM Layout 1st Stage,, Bangalore 560068</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Vasavi Builders</td>
                                                <td width="121">vasavi Residency 2</td>
                                                <td width="261">Novel Business Center, No:10,100ft Outer Ring Road, BTM Layout 1st Stage,, Bangalore 560068</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Vasavi Builders</td>
                                                <td width="121">vasavi Tejus</td>
                                                <td width="261">Novel Business Center, No:10,100ft Outer Ring Road, BTM Layout 1st Stage,, Bangalore 560068</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Vasavi Builders</td>
                                                <td width="121">vasavi Icon</td>
                                                <td width="261">Novel Business Center, No:10,100ft Outer Ring Road, BTM Layout 1st Stage,, Bangalore 560068</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Vasavi Builders</td>
                                                <td width="121">vasavi Rich</td>
                                                <td width="261">Novel Business Center, No:10,100ft Outer Ring Road, BTM Layout 1st Stage,, Bangalore 560068</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Vasavi Builders</td>
                                                <td width="121">Vasavi Royal</td>
                                                <td width="261">Novel Business Center, No:10,100ft Outer Ring Road, BTM Layout 1st Stage,, Bangalore 560068</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Vasavi Builders</td>
                                                <td width="121">Friends nest</td>
                                                <td width="261">Novel Business Center, No:10,100ft Outer Ring Road, BTM Layout 1st Stage,, Bangalore 560068</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">DeFINER VENTURES</td>
                                                <td width="121">DeFINER Kingdom-I</td>
                                                <td width="261">First Floor, Achaiah Chetty Arcade, No:19, 1st cross, Achaiah<br /> &nbsp;Chetty Layout, RMV Extension, Sadashiv Nagar, Bengaluru, <br /> &nbsp;Karnataka 560080</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">DeFINER VENTURES</td>
                                                <td width="121">DeFINER Serene Drive</td>
                                                <td width="261">First Floor, Achaiah Chetty Arcade, No:19, 1st cross, Achaiah<br /> &nbsp;Chetty Layout, RMV Extension, Sadashiv Nagar, Bengaluru, <br /> &nbsp;Karnataka 560080</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">GSS</td>
                                                <td width="121">Spurthy Shelters</td>
                                                <td width="261">#1104, 1st floor, Udayaravi road, Opp. Pramathi School, Kuvempunagar, Mysore-570023.</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">GSS</td>
                                                <td width="121">Herbal Habitat</td>
                                                <td width="261">#1104, 1st floor, Udayaravi road, Opp. Pramathi School, Kuvempunagar, Mysore-570023.</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">GSS</td>
                                                <td width="121">Diya Sapphire</td>
                                                <td width="261">#1104, 1st floor, Udayaravi road, Opp. Pramathi School, Kuvempunagar, Mysore-570023.</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">GSS</td>
                                                <td width="121">Nirvana Nagar</td>
                                                <td width="261">#1104, 1st floor, Udayaravi road, Opp. Pramathi School, Kuvempunagar, Mysore-570023.</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">GSS</td>
                                                <td width="121">Manasa</td>
                                                <td width="261">#1104, 1st floor, Udayaravi road, Opp. Pramathi School, Kuvempunagar, Mysore-570023.</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">GSS</td>
                                                <td width="121">Bhairava</td>
                                                <td width="261">#1104, 1st floor, Udayaravi road, Opp. Pramathi School, Kuvempunagar, Mysore-570023.</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">GSS</td>
                                                <td width="121">Janani Sukadhayi Palms</td>
                                                <td width="261">#1104, 1st floor, Udayaravi road, Opp. Pramathi School, Kuvempunagar, Mysore-570023.</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">GSS</td>
                                                <td width="121">Anugraha Luxury Apartments</td>
                                                <td width="261">#1104, 1st floor, Udayaravi road, Opp. Pramathi School, Kuvempunagar, Mysore-570023.</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">GSS</td>
                                                <td width="121">Silver Springs</td>
                                                <td width="261">#1104, 1st floor, Udayaravi road, Opp. Pramathi School, Kuvempunagar, Mysore-570023.</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">GSS</td>
                                                <td width="121">Abhyodaya</td>
                                                <td width="261">#1104, 1st floor, Udayaravi road, Opp. Pramathi School, Kuvempunagar, Mysore-570023.</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">GSS</td>
                                                <td width="121">Akshaya Siri</td>
                                                <td width="261">#1104, 1st floor, Udayaravi road, Opp. Pramathi School, Kuvempunagar, Mysore-570023.</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">GSS</td>
                                                <td width="121">Chamundi Township</td>
                                                <td width="261">#1104, 1st floor, Udayaravi road, Opp. Pramathi School, Kuvempunagar, Mysore-570023.</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">GSS</td>
                                                <td width="121">Herbal Village</td>
                                                <td width="261">#1104, 1st floor, Udayaravi road, Opp. Pramathi School, Kuvempunagar, Mysore-570023.</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">GSS</td>
                                                <td width="121">Nithya</td>
                                                <td width="261">#1104, 1st floor, Udayaravi road, Opp. Pramathi School, Kuvempunagar, Mysore-570023.</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">GSS</td>
                                                <td width="121">Pruthvi</td>
                                                <td width="261">#1104, 1st floor, Udayaravi road, Opp. Pramathi School, Kuvempunagar, Mysore-570023.</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">SANKALP</td>
                                                <td width="121">SANKALP CENTRAL PARK - PHASE II</td>
                                                <td width="261">CORPORATE OFFICE D/6A, Temple Road, V.V.Mohalla, Mysore-570002.</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">SANKALP</td>
                                                <td width="121">SANKALP LUXURIA</td>
                                                <td width="261">CORPORATE OFFICE D/6A, Temple Road, V.V.Mohalla, Mysore-570002.</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">SANKALP</td>
                                                <td width="121">SANKALP GALAXY</td>
                                                <td width="261">CORPORATE OFFICE D/6A, Temple Road, V.V.Mohalla, Mysore-570002.</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">SANKALP</td>
                                                <td width="121">SANKALP SOLITAIRE</td>
                                                <td width="261">CORPORATE OFFICE D/6A, Temple Road, V.V.Mohalla, Mysore-570002.</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">SANKALP</td>
                                                <td width="121">SANKALP SUNSHINE</td>
                                                <td width="261">CORPORATE OFFICE D/6A, Temple Road, V.V.Mohalla, Mysore-570002.</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">SANKALP</td>
                                                <td width="121">SANKALP SIDDARTH</td>
                                                <td width="261">CORPORATE OFFICE D/6A, Temple Road, V.V.Mohalla, Mysore-570002.</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">SANKALP</td>
                                                <td width="121">SANKALP DIVYAROOPA</td>
                                                <td width="261">CORPORATE OFFICE D/6A, Temple Road, V.V.Mohalla, Mysore-570002.</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">SANKALP</td>
                                                <td width="121">VK CONVENTION CENTER</td>
                                                <td width="261">CORPORATE OFFICE D/6A, Temple Road, V.V.Mohalla, Mysore-570002.</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">SANKALP</td>
                                                <td width="121">SANKALP SERENE</td>
                                                <td width="261">CORPORATE OFFICE D/6A, Temple Road, V.V.Mohalla, Mysore-570002.</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">SANKALP</td>
                                                <td width="121">SANKALP SAROVAR</td>
                                                <td width="261">CORPORATE OFFICE D/6A, Temple Road, V.V.Mohalla, Mysore-570002.</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">SANKALP</td>
                                                <td width="121">SANKALP DAFFODIL</td>
                                                <td width="261">CORPORATE OFFICE D/6A, Temple Road, V.V.Mohalla, Mysore-570002.</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">SANKALP</td>
                                                <td width="121">SANKALP CENTRAL PARK, PHASE 1</td>
                                                <td width="261">CORPORATE OFFICE D/6A, Temple Road, V.V.Mohalla, Mysore-570002.</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">SANKALP</td>
                                                <td width="121">SANKALP BASANT</td>
                                                <td width="261">CORPORATE OFFICE D/6A, Temple Road, V.V.Mohalla, Mysore-570002.</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">SANKALP</td>
                                                <td width="121">SANKALP MAHAL</td>
                                                <td width="261">CORPORATE OFFICE D/6A, Temple Road, V.V.Mohalla, Mysore-570002.</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">SANKALP</td>
                                                <td width="121">SANKALP ORCHID</td>
                                                <td width="261">CORPORATE OFFICE D/6A, Temple Road, V.V.Mohalla, Mysore-570002.</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">SANKALP</td>
                                                <td width="121">SANKALP JASMINE</td>
                                                <td width="261">CORPORATE OFFICE D/6A, Temple Road, V.V.Mohalla, Mysore-570002.</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">SANKALP</td>
                                                <td width="121">SANKALP GARDENIA</td>
                                                <td width="261">CORPORATE OFFICE D/6A, Temple Road, V.V.Mohalla, Mysore-570002.</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">SANKALP</td>
                                                <td width="121">SANKALP PRABHU</td>
                                                <td width="261">CORPORATE OFFICE D/6A, Temple Road, V.V.Mohalla, Mysore-570002.</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">SANKALP</td>
                                                <td width="121">SANKALP VISHNU</td>
                                                <td width="261">CORPORATE OFFICE D/6A, Temple Road, V.V.Mohalla, Mysore-570002.</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">SANKALP</td>
                                                <td width="121">SANKALP CHAITHANYA</td>
                                                <td width="261">CORPORATE OFFICE D/6A, Temple Road, V.V.Mohalla, Mysore-570002.</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">SANKALP</td>
                                                <td width="121">SANKALP PRAKRITHI</td>
                                                <td width="261">CORPORATE OFFICE D/6A, Temple Road, V.V.Mohalla, Mysore-570002.</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">SANKALP</td>
                                                <td width="121">SANKALP LAKSHMI</td>
                                                <td width="261">CORPORATE OFFICE D/6A, Temple Road, V.V.Mohalla, Mysore-570002.</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">SANKALP</td>
                                                <td width="121">SANKALP PARVATHI</td>
                                                <td width="261">CORPORATE OFFICE D/6A, Temple Road, V.V.Mohalla, Mysore-570002.</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">SANKALP</td>
                                                <td width="121">SANKALP PEARL</td>
                                                <td width="261">CORPORATE OFFICE D/6A, Temple Road, V.V.Mohalla, Mysore-570002.</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">SANKALP</td>
                                                <td width="121">SANKALP SAPPHIRE</td>
                                                <td width="261">CORPORATE OFFICE D/6A, Temple Road, V.V.Mohalla, Mysore-570002.</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">SANKALP</td>
                                                <td width="121">SANKALP MANIMANDIRA</td>
                                                <td width="261">CORPORATE OFFICE D/6A, Temple Road, V.V.Mohalla, Mysore-570002.</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">SANKALP</td>
                                                <td width="121">SANKALP ENCLAVE</td>
                                                <td width="261">CORPORATE OFFICE D/6A, Temple Road, V.V.Mohalla, Mysore-570002.</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">SANKALP</td>
                                                <td width="121">SANKALP APARTMENTS</td>
                                                <td width="261">CORPORATE OFFICE D/6A, Temple Road, V.V.Mohalla, Mysore-570002.</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Pathak Developers Pvt.Ltd</td>
                                                <td width="121">Pratham Prerana</td>
                                                <td width="261">2997/2, Rukma Complex, 2 nd floor, Kalidasa Road, V V Mohalla, Mysore - 570002</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Pathak Developers Pvt.Ltd</td>
                                                <td width="121">Pratham Mayflower</td>
                                                <td width="261">2997/2, Rukma Complex, 2 nd floor, Kalidasa Road, V V Mohalla, Mysore - 570002</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Pathak Developers Pvt.Ltd</td>
                                                <td width="121">Pratham Splendour</td>
                                                <td width="261">2997/2, Rukma Complex, 2 nd floor, Kalidasa Road, V V Mohalla, Mysore - 570002</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Pathak Developers Pvt.Ltd</td>
                                                <td width="121">Pratham Alpine</td>
                                                <td width="261">2997/2, Rukma Complex, 2 nd floor, Kalidasa Road, V V Mohalla, Mysore - 570002</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Pathak Developers Pvt.Ltd</td>
                                                <td width="121">Pratham Pragathi</td>
                                                <td width="261">2997/2, Rukma Complex, 2 nd floor, Kalidasa Road, V V Mohalla, Mysore - 570002</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Pathak Developers Pvt.Ltd</td>
                                                <td width="121">Pratham Lakshmi</td>
                                                <td width="261">2997/2, Rukma Complex, 2 nd floor, Kalidasa Road, V V Mohalla, Mysore - 570002</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Pathak Developers Pvt.Ltd</td>
                                                <td width="121">Pratham Shilp</td>
                                                <td width="261">2997/2, Rukma Complex, 2 nd floor, Kalidasa Road, V V Mohalla, Mysore - 570002</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Pathak Developers Pvt.Ltd</td>
                                                <td width="121">Pratham Mahaveer</td>
                                                <td width="261">2997/2, Rukma Complex, 2 nd floor, Kalidasa Road, V V Mohalla, Mysore - 570002</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Pathak Developers Pvt.Ltd</td>
                                                <td width="121">Pratham Glory</td>
                                                <td width="261">2997/2, Rukma Complex, 2 nd floor, Kalidasa Road, V V Mohalla, Mysore - 570002</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Pathak Developers Pvt.Ltd</td>
                                                <td width="121">Pratham Mayur</td>
                                                <td width="261">2997/2, Rukma Complex, 2 nd floor, Kalidasa Road, V V Mohalla, Mysore - 570002</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Pathak Developers Pvt.Ltd</td>
                                                <td width="121">Pratham Mehwish</td>
                                                <td width="261">2997/2, Rukma Complex, 2 nd floor, Kalidasa Road, V V Mohalla, Mysore - 570002</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Pathak Developers Pvt.Ltd</td>
                                                <td width="121">Pratham Aakruthi</td>
                                                <td width="261">2997/2, Rukma Complex, 2 nd floor, Kalidasa Road, V V Mohalla, Mysore - 570002</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Pathak Developers Pvt.Ltd</td>
                                                <td width="121">Pratham Empire</td>
                                                <td width="261">2997/2, Rukma Complex, 2 nd floor, Kalidasa Road, V V Mohalla, Mysore - 570002</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Pathak Developers Pvt.Ltd</td>
                                                <td width="121">Pratham Diya</td>
                                                <td width="261">2997/2, Rukma Complex, 2 nd floor, Kalidasa Road, V V Mohalla, Mysore - 570002</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Pathak Developers Pvt.Ltd</td>
                                                <td width="121">Pratham Ashirvad</td>
                                                <td width="261">2997/2, Rukma Complex, 2 nd floor, Kalidasa Road, V V Mohalla, Mysore - 570002</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Pathak Developers Pvt.Ltd</td>
                                                <td width="121">Pratham Tulip 2</td>
                                                <td width="261">2997/2, Rukma Complex, 2 nd floor, Kalidasa Road, V V Mohalla, Mysore - 570002</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Pathak Developers Pvt.Ltd</td>
                                                <td width="121">Pratham Tulip 1</td>
                                                <td width="261">2997/2, Rukma Complex, 2 nd floor, Kalidasa Road, V V Mohalla, Mysore - 570002</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Pathak Developers Pvt.Ltd</td>
                                                <td width="121">Pratham Temple Bells</td>
                                                <td width="261">2997/2, Rukma Complex, 2 nd floor, Kalidasa Road, V V Mohalla, Mysore - 570002</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Pathak Developers Pvt.Ltd</td>
                                                <td width="121">Pratham Shrushti</td>
                                                <td width="261">2997/2, Rukma Complex, 2 nd floor, Kalidasa Road, V V Mohalla, Mysore - 570002</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Pathak Developers Pvt.Ltd</td>
                                                <td width="121">Pratham Shelters - Studio Apartment</td>
                                                <td width="261">2997/2, Rukma Complex, 2 nd floor, Kalidasa Road, V V Mohalla, Mysore - 570002</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Pathak Developers Pvt.Ltd</td>
                                                <td width="121">Pratham Sai Geetanjali</td>
                                                <td width="261">2997/2, Rukma Complex, 2 nd floor, Kalidasa Road, V V Mohalla, Mysore - 570002</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Pathak Developers Pvt.Ltd</td>
                                                <td width="121">Pratham Residency</td>
                                                <td width="261">2997/2, Rukma Complex, 2 nd floor, Kalidasa Road, V V Mohalla, Mysore - 570002</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Pathak Developers Pvt.Ltd</td>
                                                <td width="121">Pratham Pooja</td>
                                                <td width="261">2997/2, Rukma Complex, 2 nd floor, Kalidasa Road, V V Mohalla, Mysore - 570002</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Pathak Developers Pvt.Ltd</td>
                                                <td width="121">Pratham Panchami</td>
                                                <td width="261">2997/2, Rukma Complex, 2 nd floor, Kalidasa Road, V V Mohalla, Mysore - 570002</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Pathak Developers Pvt.Ltd</td>
                                                <td width="121">Pratham Nirmala</td>
                                                <td width="261">2997/2, Rukma Complex, 2 nd floor, Kalidasa Road, V V Mohalla, Mysore - 570002</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Pathak Developers Pvt.Ltd</td>
                                                <td width="121">Pratham Mishra</td>
                                                <td width="261">2997/2, Rukma Complex, 2 nd floor, Kalidasa Road, V V Mohalla, Mysore - 570002</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Pathak Developers Pvt.Ltd</td>
                                                <td width="121">Pratham Jayalakshmi Annex</td>
                                                <td width="261">2997/2, Rukma Complex, 2 nd floor, Kalidasa Road, V V Mohalla, Mysore - 570002</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Pathak Developers Pvt.Ltd</td>
                                                <td width="121">Pratham Habitat</td>
                                                <td width="261">2997/2, Rukma Complex, 2 nd floor, Kalidasa Road, V V Mohalla, Mysore - 570002</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Pathak Developers Pvt.Ltd</td>
                                                <td width="121">Pratham Geetanjali</td>
                                                <td width="261">2997/2, Rukma Complex, 2 nd floor, Kalidasa Road, V V Mohalla, Mysore - 570002</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Pathak Developers Pvt.Ltd</td>
                                                <td width="121">Pratham Chaya</td>
                                                <td width="261">2997/2, Rukma Complex, 2 nd floor, Kalidasa Road, V V Mohalla, Mysore - 570002</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Pathak Developers Pvt.Ltd</td>
                                                <td width="121">Pratham Bharadwaj</td>
                                                <td width="261">2997/2, Rukma Complex, 2 nd floor, Kalidasa Road, V V Mohalla, Mysore - 570002</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Pathak Developers Pvt.Ltd</td>
                                                <td width="121">Pratham Avenue</td>
                                                <td width="261">2997/2, Rukma Complex, 2 nd floor, Kalidasa Road, V V Mohalla, Mysore - 570002</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Pathak Developers Pvt.Ltd</td>
                                                <td width="121">Pratham Aradhana</td>
                                                <td width="261">2997/2, Rukma Complex, 2 nd floor, Kalidasa Road, V V Mohalla, Mysore - 570002</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Pathak Developers Pvt.Ltd</td>
                                                <td width="121">Pratham Aditya</td>
                                                <td width="261">2997/2, Rukma Complex, 2 nd floor, Kalidasa Road, V V Mohalla, Mysore - 570002</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Pathak Developers Pvt.Ltd</td>
                                                <td width="121">Pratham Sunshine</td>
                                                <td width="261">2997/2, Rukma Complex, 2 nd floor, Kalidasa Road, V V Mohalla, Mysore - 570002</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Manasa Developers</td>
                                                <td width="121">Manasa Mayura</td>
                                                <td width="261"># 2877- G2, 6th cross, V.V. Mohalla, Mysore, Karnataka, India. Pincode:570002</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Manasa Developers</td>
                                                <td width="121">Manasa Subbindra</td>
                                                <td width="261"># 2877- G2, 6th cross, V.V. Mohalla, Mysore, Karnataka, India. Pincode:570002</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Manasa Developers</td>
                                                <td width="121">Manasa Sri Ranga</td>
                                                <td width="261"># 2877- G2, 6th cross, V.V. Mohalla, Mysore, Karnataka, India. Pincode:570002</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Manasa Developers</td>
                                                <td width="121">Manasa Enclave</td>
                                                <td width="261"># 2877- G2, 6th cross, V.V. Mohalla, Mysore, Karnataka, India. Pincode:570002</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Manasa Developers</td>
                                                <td width="121">Manasa Chinmayee</td>
                                                <td width="261"># 2877- G2, 6th cross, V.V. Mohalla, Mysore, Karnataka, India. Pincode:570002</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Manasa Developers</td>
                                                <td width="121">Manasa Enclave</td>
                                                <td width="261"># 2877- G2, 6th cross, V.V. Mohalla, Mysore, Karnataka, India. Pincode:570002</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Manasa Developers</td>
                                                <td width="121">Manasa Royal</td>
                                                <td width="261"># 2877- G2, 6th cross, V.V. Mohalla, Mysore, Karnataka, India. Pincode:570002</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Manasa Developers</td>
                                                <td width="121">Manasa Chinmayee</td>
                                                <td width="261"># 2877- G2, 6th cross, V.V. Mohalla, Mysore, Karnataka, India. Pincode:570002</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Manasa Developers</td>
                                                <td width="121">Manasa Silver Oak</td>
                                                <td width="261"># 2877- G2, 6th cross, V.V. Mohalla, Mysore, Karnataka, India. Pincode:570002</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Manasa Developers</td>
                                                <td width="121">Manasa Palm Spring</td>
                                                <td width="261"># 2877- G2, 6th cross, V.V. Mohalla, Mysore, Karnataka, India. Pincode:570002</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Manasa Developers</td>
                                                <td width="121">Manasa Anantha Leela</td>
                                                <td width="261"># 2877- G2, 6th cross, V.V. Mohalla, Mysore, Karnataka, India. Pincode:570002</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Manasa Developers</td>
                                                <td width="121">Manasa Castle</td>
                                                <td width="261"># 2877- G2, 6th cross, V.V. Mohalla, Mysore, Karnataka, India. Pincode:570002</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Manasa Developers</td>
                                                <td width="121">Manasa Gardenia</td>
                                                <td width="261"># 2877- G2, 6th cross, V.V. Mohalla, Mysore, Karnataka, India. Pincode:570002</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Manasa Developers</td>
                                                <td width="121">Manasa Royal</td>
                                                <td width="261"># 2877- G2, 6th cross, V.V. Mohalla, Mysore, Karnataka, India. Pincode:570002</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Manasa Developers</td>
                                                <td width="121">Manasa Serene</td>
                                                <td width="261"># 2877- G2, 6th cross, V.V. Mohalla, Mysore, Karnataka, India. Pincode:570002</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Manasa Developers</td>
                                                <td width="121">Manasa vasantha</td>
                                                <td width="261"># 2877- G2, 6th cross, V.V. Mohalla, Mysore, Karnataka, India. Pincode:570002</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Manasa Developers</td>
                                                <td width="121">Manasa Devine</td>
                                                <td width="261"># 2877- G2, 6th cross, V.V. Mohalla, Mysore, Karnataka, India. Pincode:570002</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Manasa Developers</td>
                                                <td width="121">Manasa Tej</td>
                                                <td width="261"># 2877- G2, 6th cross, V.V. Mohalla, Mysore, Karnataka, India. Pincode:570002</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Manasa Developers</td>
                                                <td width="121">Manasa Heritage</td>
                                                <td width="261"># 2877- G2, 6th cross, V.V. Mohalla, Mysore, Karnataka, India. Pincode:570002</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Yesh developers(hubli)</td>
                                                <td width="121">shree paradise</td>
                                                <td width="261">Shop no.9,10,19,20, vivekanand corner,3rd floor, desai cross, deshpande nagar,Hubli.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Yesh developers(hubli)</td>
                                                <td width="121">yesh venkatagiri-premium villa plots</td>
                                                <td width="261">Shop no.9,10,19,20, vivekanand corner,3rd floor, desai cross, deshpande nagar,Hubli.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Yesh developers(hubli)</td>
                                                <td width="121">smart city apartment</td>
                                                <td width="261">Shop no.9,10,19,20, vivekanand corner,3rd floor, desai cross, deshpande nagar,Hubli.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Yesh developers(hubli)</td>
                                                <td width="121">yesh farm plots</td>
                                                <td width="261">Shop no.9,10,19,20, vivekanand corner,3rd floor, desai cross, deshpande nagar,Hubli.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Yesh developers(hubli)</td>
                                                <td width="121">yesh golden blossom</td>
                                                <td width="261">Shop no.9,10,19,20, vivekanand corner,3rd floor, desai cross, deshpande nagar,Hubli.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Yesh developers(hubli)</td>
                                                <td width="121">yesh golden heights</td>
                                                <td width="261">Shop no.9,10,19,20, vivekanand corner,3rd floor, desai cross, deshpande nagar,Hubli.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Yesh developers(hubli)</td>
                                                <td width="121">yesh row houses</td>
                                                <td width="261">Shop no.9,10,19,20, vivekanand corner,3rd floor, desai cross, deshpande nagar,Hubli.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Yesh developers(hubli)</td>
                                                <td width="121">yesh sai home</td>
                                                <td width="261">Shop no.9,10,19,20, vivekanand corner,3rd floor, desai cross, deshpande nagar,Hubli.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Yesh developers(hubli)</td>
                                                <td width="121">yesh mahabaleshwar layout</td>
                                                <td width="261">Shop no.9,10,19,20, vivekanand corner,3rd floor, desai cross, deshpande nagar,Hubli.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Yesh developers(hubli)</td>
                                                <td width="121">yesh classic phase-II</td>
                                                <td width="261">Shop no.9,10,19,20, vivekanand corner,3rd floor, desai cross, deshpande nagar,Hubli.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Yesh developers(hubli)</td>
                                                <td width="121">yesh sai layout</td>
                                                <td width="261">Shop no.9,10,19,20, vivekanand corner,3rd floor, desai cross, deshpande nagar,Hubli.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Yesh developers(hubli)</td>
                                                <td width="121">vishweshwariaha layout</td>
                                                <td width="261">Shop no.9,10,19,20, vivekanand corner,3rd floor, desai cross, deshpande nagar,Hubli.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Yesh developers(hubli)</td>
                                                <td width="121">yesh sai home</td>
                                                <td width="261">Shop no.9,10,19,20, vivekanand corner,3rd floor, desai cross, deshpande nagar,Hubli.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Yesh developers(hubli)</td>
                                                <td width="121">yesh mahabaleshwar layout</td>
                                                <td width="261">Shop no.9,10,19,20, vivekanand corner,3rd floor, desai cross, deshpande nagar,Hubli.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Yesh developers(hubli)</td>
                                                <td width="121">yesh classic phase-II</td>
                                                <td width="261">Shop no.9,10,19,20, vivekanand corner,3rd floor, desai cross, deshpande nagar,Hubli.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Yesh developers(hubli)</td>
                                                <td width="121">yesh sai layout</td>
                                                <td width="261">Shop no.9,10,19,20, vivekanand corner,3rd floor, desai cross, deshpande nagar,Hubli.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Yesh developers(hubli)</td>
                                                <td width="121">vishweshwariaha layout</td>
                                                <td width="261">Shop no.9,10,19,20, vivekanand corner,3rd floor, desai cross, deshpande nagar,Hubli.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">imam Hussain A.D(proprietor)</td>
                                                <td width="121">ummathi group</td>
                                                <td width="261">2nd floor opp.Axis bank,<br /> P.B road,toll naka,<br /> dharwad-580001,<br /> karnataka.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">R V Developers</td>
                                                <td width="121">Mount forest</td>
                                                <td width="261">"1st Floor, hiremath building,<br /> old income tax office road,<br /> vidhyanagar, hubli dharwad,<br /> Dharwad, Karnataka."</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">R V Developers</td>
                                                <td width="121">Topavana</td>
                                                <td width="261">"1st Floor, hiremath building,<br /> old income tax office road,<br /> vidhyanagar, hubli dharwad,<br /> Dharwad, Karnataka."</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">UNITED INFRASTRUCTURES</td>
                                                <td width="121">United Elysium</td>
                                                <td width="261">"SY.NO: 84, Seegahalli village,<br /> Bhidharahalii hobli,<br /> krishnarajapuram,<br /> bengalore,<br /> karnataka-560067."</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">UNITED INFRASTRUCTURES</td>
                                                <td width="121">united Elysium 2</td>
                                                <td width="261">"SY.NO: 84, Seegahalli village,<br /> Bhidharahalii hobli,<br /> krishnarajapuram,<br /> bengalore,<br /> karnataka-560067."</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">shriya properties</td>
                                                <td width="121">shriya pearl residential apartment</td>
                                                <td width="261">"13, gokul road, arjun vihar,<br /> gandhu nagar, hubli,<br /> karnataka-580030."</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">shriya properties</td>
                                                <td width="121">shriya venus residentail apartment</td>
                                                <td width="261">"13, gokul road, arjun vihar,<br /> gandhu nagar, hubli,<br /> karnataka-580030."</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">shriya properties</td>
                                                <td width="121">shriya jupiter business complex</td>
                                                <td width="261">"13, gokul road, arjun vihar,<br /> gandhu nagar, hubli,<br /> karnataka-580030."</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">shriya properties</td>
                                                <td width="121">shriya spoorthi residential apartment</td>
                                                <td width="261">"13, gokul road, arjun vihar,<br /> gandhu nagar, hubli,<br /> karnataka-580030."</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">shriya properties</td>
                                                <td width="121">shriya shrivari, residential apartment</td>
                                                <td width="261">"13, gokul road, arjun vihar,<br /> gandhu nagar, hubli,<br /> karnataka-580030."</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">shriya properties</td>
                                                <td width="121">shriya green woods, rwsidential apartment</td>
                                                <td width="261">"13, gokul road, arjun vihar,<br /> gandhu nagar, hubli,<br /> karnataka-580030."</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">shrinidhi infrastructures and developers</td>
                                                <td width="121">Eeshavarya</td>
                                                <td width="261">shri sai basava sadan,<br /> H.No-12, shrur park, 1st stage,<br /> hosur-unekal by pass road,<br /> vidhya nagar,<br /> Hubli-580031.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">shrinidhi infrastructures and developers</td>
                                                <td width="121">Kanhaiya residency</td>
                                                <td width="261">shri sai basava sadan,<br /> H.No-12, shrur park, 1st stage,<br /> hosur-unekal by pass road,<br /> vidhya nagar,<br /> Hubli-580031.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">VANISHREE BUILDERS</td>
                                                <td width="121">Sai Ram apartment</td>
                                                <td width="261">"vinayak complex,<br /> 1st main, 2nd cross, jayanagar,<br /> dharwad-580003."</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">ROTSON CONSTRUCTION</td>
                                                <td width="121">Rotson Park</td>
                                                <td width="261">"vernekar building, <br /> opp.state bank of mysore,<br /> deshpande nagar,<br /> hubli-dharwad<br /> pin code-580029"</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">ROTSON CONSTRUCTION</td>
                                                <td width="121">Rotson sai Pride</td>
                                                <td width="261">"vernekar building, <br /> opp.state bank of mysore,<br /> deshpande nagar,<br /> hubli-dharwad<br /> pin code-580029"</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Maxworth Realty India limited</td>
                                                <td width="121">Maxworth Suryodaya</td>
                                                <td width="261">"#22/1, Railway parallel road,<br /> opp.reddy petrol bunk,<br /> Nehru nagar, Banglore-560001.<br /> (project in hubli-dharwad)."</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Highcity Infraventures Limited</td>
                                                <td width="121">Highcity Pristine</td>
                                                <td width="261">"25, sai krupa wing A,<br /> Puttanna road,<br /> Basavangudi, <br /> Banglore-560004."</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Midmac Developers pvt.ltd</td>
                                                <td width="121">Midmac central park</td>
                                                <td width="261">"Address: Midmac Developers Pvt Ltd,<br /> &nbsp;1st Floor, Central Building,<br /> &nbsp;Above Reliance, <br /> Digital, Hubli, <br /> Karnataka 580021"</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Midmac Developers pvt.ltd</td>
                                                <td width="121">Midmac metro Park</td>
                                                <td width="261">"Address: Midmac Developers Pvt Ltd,<br /> &nbsp;1st Floor, Central Building,<br /> &nbsp;Above Reliance, <br /> Digital, Hubli, <br /> Karnataka 580021"</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Midmac Developers pvt.ltd</td>
                                                <td width="121">midmac palm meadows</td>
                                                <td width="261">"Address: Midmac Developers Pvt Ltd,<br /> &nbsp;1st Floor, Central Building,<br /> &nbsp;Above Reliance, <br /> Digital, Hubli, <br /> Karnataka 580021"</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Midmac Developers pvt.ltd</td>
                                                <td width="121">midmac midford garden</td>
                                                <td width="261">"Address: Midmac Developers Pvt Ltd,<br /> &nbsp;1st Floor, Central Building,<br /> &nbsp;Above Reliance, <br /> Digital, Hubli, <br /> Karnataka 580021"</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Midmac Developers pvt.ltd</td>
                                                <td width="121">midmac langford garden</td>
                                                <td width="261">"Address: Midmac Developers Pvt Ltd,<br /> &nbsp;1st Floor, Central Building,<br /> &nbsp;Above Reliance, <br /> Digital, Hubli, <br /> Karnataka 580021"</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">shriya propertise</td>
                                                <td width="121">shriya samruddi,</td>
                                                <td width="261">"13, gokul road, arjun vihar,<br /> gandhu nagar, hubli,<br /> karnataka-580030."</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">shriya propertise</td>
                                                <td width="121">shriya swastik</td>
                                                <td width="261">"13, gokul road, arjun vihar,<br /> gandhu nagar, hubli,<br /> karnataka-580030."</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">shriya propertise</td>
                                                <td width="121">shriya mansion</td>
                                                <td width="261">"13, gokul road, arjun vihar,<br /> gandhu nagar, hubli,<br /> karnataka-580030."</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">shriya propertise</td>
                                                <td width="121">shriya enclave</td>
                                                <td width="261">"13, gokul road, arjun vihar,<br /> gandhu nagar, hubli,<br /> karnataka-580030."</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">ELFIN INFRA BUILDERS PVT.LTD</td>
                                                <td width="121">Elfin meadows</td>
                                                <td width="261">"Elfin castle 433/20,<br /> belvanki colony,<br /> 1st cross'kheshwapur',<br /> Hubli, karnataka.<br /> phone.no:0836-4253563"</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">ELFIN INFRA BUILDERS PVT.LTD</td>
                                                <td width="121">Elfin park</td>
                                                <td width="261">"Elfin castle 433/20,<br /> belvanki colony,<br /> 1st cross'kheshwapur',<br /> Hubli, karnataka.<br /> phone.no:0836-4253563"</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">ELFIN INFRA BUILDERS PVT.LTD</td>
                                                <td width="121">Elfin castle</td>
                                                <td width="261">"Elfin castle 433/20,<br /> belvanki colony,<br /> 1st cross'kheshwapur',<br /> Hubli, karnataka.<br /> phone.no:0836-4253563"</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">ELFIN INFRA BUILDERS PVT.LTD</td>
                                                <td width="121">Elfin estate</td>
                                                <td width="261">"Elfin castle 433/20,<br /> belvanki colony,<br /> 1st cross'kheshwapur',<br /> Hubli, karnataka.<br /> phone.no:0836-4253563"</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">ELFIN INFRA BUILDERS PVT.LTD</td>
                                                <td width="121">Elfin Halyal park</td>
                                                <td width="261">"Elfin castle 433/20,<br /> belvanki colony,<br /> 1st cross'kheshwapur',<br /> Hubli, karnataka.<br /> phone.no:0836-4253563"</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">ELFIN INFRA BUILDERS PVT.LTD</td>
                                                <td width="121">Elfin haritage</td>
                                                <td width="261">"Elfin castle 433/20,<br /> belvanki colony,<br /> 1st cross'kheshwapur',<br /> Hubli, karnataka.<br /> phone.no:0836-4253563"</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">ELFIN INFRA BUILDERS PVT.LTD</td>
                                                <td width="121">Elfin Oakwoods</td>
                                                <td width="261">"Elfin castle 433/20,<br /> belvanki colony,<br /> 1st cross'kheshwapur',<br /> Hubli, karnataka.<br /> phone.no:0836-4253563"</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Omkar developers and builders</td>
                                                <td width="121">Diamond Hills</td>
                                                <td width="261">"1st floor, bhagyalaxmi complex,<br /> opp.Ramesh Bhavan,<br /> Keshwapur,<br /> Hubli-580023,<br /> karnataka."</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Omkar developers and builders</td>
                                                <td width="121">Diamond Hills phase -II</td>
                                                <td width="261">"1st floor, bhagyalaxmi complex,<br /> opp.Ramesh Bhavan,<br /> Keshwapur,<br /> Hubli-580023,<br /> karnataka."</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">sri durga developers</td>
                                                <td width="121">Durga neeli S golden heights</td>
                                                <td width="261">"UGF, Laxmi complex, <br /> opp.trupti international, court circle,<br /> traffic island, hubli,<br /> neeligin road, hubli, <br /> karnataka-580021"</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">sri durga developers</td>
                                                <td width="121">Durga neeli s residential park</td>
                                                <td width="261">"UGF, Laxmi complex, <br /> opp.trupti international, court circle,<br /> traffic island, hubli,<br /> neeligin road, hubli, <br /> karnataka-580021"</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Geomac Infrastructure</td>
                                                <td width="121">Geomac Esencia</td>
                                                <td width="261">A 2nd floor, Meenakshi Arcade,<br /> Deshpande Nagar,Hubli,<br /> karnataka-580029.<br /> phone:0836-4259777</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Geomac Infrastructure</td>
                                                <td width="121">Geomac Exotica</td>
                                                <td width="261">A 2nd floor, Meenakshi Arcade,<br /> Deshpande Nagar,Hubli,<br /> karnataka-580029.<br /> phone:0836-4259777</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Geomac Infrastructure</td>
                                                <td width="121">Silver crest</td>
                                                <td width="261">A 2nd floor, Meenakshi Arcade,<br /> Deshpande Nagar,Hubli,<br /> karnataka-580029.<br /> phone:0836-4259777</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">KATARIA BUILTECK PVT LTD</td>
                                                <td width="121">KB RESIDENCY</td>
                                                <td width="261">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Sy No: 51, Ground floor, K. B. Royal Apartment, R. S. Gardenia Layout, Bommasandra, Hosur Main Road, Bangalore - 560 099.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">KATARIA BUILTECK PVT LTD</td>
                                                <td width="121">Kataria Builteck Apartments</td>
                                                <td width="261">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Sy No: 51, Ground floor, K. B. Royal Apartment, R. S. Gardenia Layout, Bommasandra, Hosur Main Road, Bangalore - 560 099.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">KATARIA BUILTECK PVT LTD</td>
                                                <td width="121">Kataria Builteck Royale</td>
                                                <td width="261">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Sy No: 51, Ground floor, K. B. Royal Apartment, R. S. Gardenia Layout, Bommasandra, Hosur Main Road, Bangalore - 560 099.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">KATARIA BUILTECK PVT LTD</td>
                                                <td width="121">Kataria Builteck Eco City</td>
                                                <td width="261">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Sy No: 51, Ground floor, K. B. Royal Apartment, R. S. Gardenia Layout, Bommasandra, Hosur Main Road, Bangalore - 560 099.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">KATARIA BUILTECK PVT LTD</td>
                                                <td width="121">Kataria Builteck Paradise</td>
                                                <td width="261">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Sy No: 51, Ground floor, K. B. Royal Apartment, R. S. Gardenia Layout, Bommasandra, Hosur Main Road, Bangalore - 560 099.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Raja Hosing Ltd.</td>
                                                <td width="121">Raja Aristos</td>
                                                <td width="261">&nbsp;Raja Mahalakshmi, F-2, # 12, Basappa Road, Shantinagar, Bangalore - 560 027.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Raja Hosing Ltd.</td>
                                                <td width="121">Raja Sannidhi</td>
                                                <td width="261">&nbsp;Raja Mahalakshmi, F-2, # 12, Basappa Road, Shantinagar, Bangalore - 560 027.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Raja Hosing Ltd.</td>
                                                <td width="121">Raja Prakruthi</td>
                                                <td width="261">&nbsp;Raja Mahalakshmi, F-2, # 12, Basappa Road, Shantinagar, Bangalore - 560 027.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Pride Group Pride Hulkul</td>
                                                <td width="121">Pride horizon</td>
                                                <td width="261">901, 9th Floor,<br /> &nbsp;No. 116 Lalbagh Road,<br /> &nbsp;Bangalore &ndash; 560 027.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Pride Group Pride Hulkul</td>
                                                <td width="121">Pride Regalia</td>
                                                <td width="261">901, 9th Floor,<br /> &nbsp;No. 116 Lalbagh Road,<br /> &nbsp;Bangalore &ndash; 560 027.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Pride Group Pride Hulkul</td>
                                                <td width="121">Pride Picassa</td>
                                                <td width="261">901, 9th Floor,<br /> &nbsp;No. 116 Lalbagh Road,<br /> &nbsp;Bangalore &ndash; 560 027.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Pride Group Pride Hulkul</td>
                                                <td width="121">Pride Pavilion</td>
                                                <td width="261">901, 9th Floor,<br /> &nbsp;No. 116 Lalbagh Road,<br /> &nbsp;Bangalore &ndash; 560 027.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Pride Group Pride Hulkul</td>
                                                <td width="121">Pride Pristine</td>
                                                <td width="261">901, 9th Floor,<br /> &nbsp;No. 116 Lalbagh Road,<br /> &nbsp;Bangalore &ndash; 560 027.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Pride Group Pride Hulkul</td>
                                                <td width="121">Pride Vatika</td>
                                                <td width="261">901, 9th Floor,<br /> &nbsp;No. 116 Lalbagh Road,<br /> &nbsp;Bangalore &ndash; 560 027.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Pride Group Pride Hulkul</td>
                                                <td width="121">Green Meadows</td>
                                                <td width="261">901, 9th Floor,<br /> &nbsp;No. 116 Lalbagh Road,<br /> &nbsp;Bangalore &ndash; 560 027.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Pride Group Pride Hulkul</td>
                                                <td width="121">Pride Crosswinds Villa Plots</td>
                                                <td width="261">901, 9th Floor,<br /> &nbsp;No. 116 Lalbagh Road,<br /> &nbsp;Bangalore &ndash; 560 027.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Pride Group Pride Hulkul</td>
                                                <td width="121">Pride Crosswinds Villa</td>
                                                <td width="261">901, 9th Floor,<br /> &nbsp;No. 116 Lalbagh Road,<br /> &nbsp;Bangalore &ndash; 560 027.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">MAK Group Builders</td>
                                                <td width="121">MAK Mall</td>
                                                <td width="261"><br /> 4th floor, Mak Mall, Kankanady,<br /> Mangalore-575002</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">MAK Group Builders</td>
                                                <td width="121">MAK Grand</td>
                                                <td width="261"><br /> 4th floor, Mak Mall, Kankanady,<br /> Mangalore-575002</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">MAK Group Builders</td>
                                                <td width="121">MAK Riveira</td>
                                                <td width="261"><br /> 4th floor, Mak Mall, Kankanady,<br /> Mangalore-575002</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">MAK Group Builders</td>
                                                <td width="121">Oberle Towers</td>
                                                <td width="261"><br /> 4th floor, Mak Mall, Kankanady,<br /> Mangalore-575002</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">MAK Group Builders</td>
                                                <td width="121">MAK Eden Enclave</td>
                                                <td width="261"><br /> 4th floor, Mak Mall, Kankanady,<br /> Mangalore-575002</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">MAK Group Builders</td>
                                                <td width="121">Mak Oberle Complex</td>
                                                <td width="261"><br /> 4th floor, Mak Mall, Kankanady,<br /> Mangalore-575002</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">MAK Group Builders</td>
                                                <td width="121">MAK Gateway</td>
                                                <td width="261"><br /> 4th floor, Mak Mall, Kankanady,<br /> Mangalore-575002</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">MAK Group Builders</td>
                                                <td width="121">MAK Jasmin</td>
                                                <td width="261"><br /> 4th floor, Mak Mall, Kankanady,<br /> Mangalore-575002</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">MAK Group Builders</td>
                                                <td width="121">The Mak Flora</td>
                                                <td width="261"><br /> 4th floor, Mak Mall, Kankanady,<br /> Mangalore-575002</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">MAK Group Builders</td>
                                                <td width="121">Mak Mark</td>
                                                <td width="261"><br /> 4th floor, Mak Mall, Kankanady,<br /> Mangalore-575002</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">MAK Group Builders</td>
                                                <td width="121">Mak Lifestyle</td>
                                                <td width="261"><br /> 4th floor, Mak Mall, Kankanady,<br /> Mangalore-575002</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Red Rocks Builders and Developers</td>
                                                <td width="121">Valley View</td>
                                                <td width="261">Airport Road, Near Madhuvan's Village Restaurant, Yeyyadi, Mangaluru, Karnataka 575008</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Red Rocks Builders and Developers</td>
                                                <td width="121">Redrocks Tonalite</td>
                                                <td width="261">Airport Road, Near Madhuvan's Village Restaurant, Yeyyadi, Mangaluru, Karnataka 575008</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Red Rocks Builders and Developers</td>
                                                <td width="121">Redrocks Heights</td>
                                                <td width="261">Airport Road, Near Madhuvan's Village Restaurant, Yeyyadi, Mangaluru, Karnataka 575008</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Red Rocks Builders and Developers</td>
                                                <td width="121">Plots in Shakthi Nagar</td>
                                                <td width="261">Airport Road, Near Madhuvan's Village Restaurant, Yeyyadi, Mangaluru, Karnataka 575008</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Red Rocks Builders and Developers</td>
                                                <td width="121">Residential Plots</td>
                                                <td width="261">Airport Road, Near Madhuvan's Village Restaurant, Yeyyadi, Mangaluru, Karnataka 575008</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Red Rocks Builders and Developers</td>
                                                <td width="121">Redrocks Blueberry Greens</td>
                                                <td width="261">Airport Road, Near Madhuvan's Village Restaurant, Yeyyadi, Mangaluru, Karnataka 575008</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Red Rocks Builders and Developers</td>
                                                <td width="121">Redrocks Hilltop</td>
                                                <td width="261">Airport Road, Near Madhuvan's Village Restaurant, Yeyyadi, Mangaluru, Karnataka 575008</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">ABISH BUILDERS PVT LTD</td>
                                                <td width="121">Abish Diamond</td>
                                                <td width="261">"Ground Floor, Punja Building <br /> &nbsp;M.G.Road, Mangalore<br /> &nbsp;PIN- 575003"</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">ABISH BUILDERS PVT LTD</td>
                                                <td width="121">Abish Ruby</td>
                                                <td width="261">"Ground Floor, Punja Building <br /> &nbsp;M.G.Road, Mangalore<br /> &nbsp;PIN- 575003"</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">ABISH BUILDERS PVT LTD</td>
                                                <td width="121">Abish - A</td>
                                                <td width="261">"Ground Floor, Punja Building <br /> &nbsp;M.G.Road, Mangalore<br /> &nbsp;PIN- 575003"</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">ABISH BUILDERS PVT LTD</td>
                                                <td width="121">Abish - B</td>
                                                <td width="261">"Ground Floor, Punja Building <br /> &nbsp;M.G.Road, Mangalore<br /> &nbsp;PIN- 575003"</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">ABISH BUILDERS PVT LTD</td>
                                                <td width="121">Abish Enclave</td>
                                                <td width="261">"Ground Floor, Punja Building <br /> &nbsp;M.G.Road, Mangalore<br /> &nbsp;PIN- 575003"</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">ABISH BUILDERS PVT LTD</td>
                                                <td width="121">Abish Manor</td>
                                                <td width="261">"Ground Floor, Punja Building <br /> &nbsp;M.G.Road, Mangalore<br /> &nbsp;PIN- 575003"</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">ABISH BUILDERS PVT LTD</td>
                                                <td width="121">Abish Homes</td>
                                                <td width="261">"Ground Floor, Punja Building <br /> &nbsp;M.G.Road, Mangalore<br /> &nbsp;PIN- 575003"</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Marian Projects Private Limited</td>
                                                <td width="121">Marian Paradise Avenue</td>
                                                <td width="261">3rd Floor, Rambhavan Complex, Kodialbail, Mangalore &ndash; 575003</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Marian Projects Private Limited</td>
                                                <td width="121">Proximus</td>
                                                <td width="261">4th Floor, Rambhavan Complex, Kodialbail, Mangalore &ndash; 575003</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Marian Projects Private Limited</td>
                                                <td width="121">Gardens &ndash; A Block</td>
                                                <td width="261">5th Floor, Rambhavan Complex, Kodialbail, Mangalore &ndash; 575003</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Marian Projects Private Limited</td>
                                                <td width="121">Gardens &ndash; B Block</td>
                                                <td width="261">6th Floor, Rambhavan Complex, Kodialbail, Mangalore &ndash; 575003</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Marian Projects Private Limited</td>
                                                <td width="121">Little Gardens</td>
                                                <td width="261">7th Floor, Rambhavan Complex, Kodialbail, Mangalore &ndash; 575003</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Marian Projects Private Limited</td>
                                                <td width="121">The Corniche</td>
                                                <td width="261">8th Floor, Rambhavan Complex, Kodialbail, Mangalore &ndash; 575003</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Marian Projects Private Limited</td>
                                                <td width="121">Manjuniketan</td>
                                                <td width="261">9th Floor, Rambhavan Complex, Kodialbail, Mangalore &ndash; 575003</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Marian Projects Private Limited</td>
                                                <td width="121">Astra</td>
                                                <td width="261">10th Floor, Rambhavan Complex, Kodialbail, Mangalore &ndash; 575003</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Marian Projects Private Limited</td>
                                                <td width="121">Lake View</td>
                                                <td width="261">11th Floor, Rambhavan Complex, Kodialbail, Mangalore &ndash; 575003</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Marian Projects Private Limited</td>
                                                <td width="121">Sri Lakshmi</td>
                                                <td width="261">12th Floor, Rambhavan Complex, Kodialbail, Mangalore &ndash; 575003</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Marian Projects Private Limited</td>
                                                <td width="121">Valley View</td>
                                                <td width="261">13th Floor, Rambhavan Complex, Kodialbail, Mangalore &ndash; 575003</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Marian Projects Private Limited</td>
                                                <td width="121">Iris</td>
                                                <td width="261">14th Floor, Rambhavan Complex, Kodialbail, Mangalore &ndash; 575003</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">ABHIMAN Constructions</td>
                                                <td width="121">Abhiman Texas</td>
                                                <td width="261">"9th Floor, Abhiman Chambers,<br /> Near Bunts Hostel Circle, Kadri Road,<br /> Mangalore - 575 003"</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">ABHIMAN Constructions</td>
                                                <td width="121">Abhiman Heights</td>
                                                <td width="261">"9th Floor, Abhiman Chambers,<br /> Near Bunts Hostel Circle, Kadri Road,<br /> Mangalore - 575 003"</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">ABHIMAN Constructions</td>
                                                <td width="121">Abhiman Hills</td>
                                                <td width="261">"9th Floor, Abhiman Chambers,<br /> Near Bunts Hostel Circle, Kadri Road,<br /> Mangalore - 575 003"</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">ABHIMAN Constructions</td>
                                                <td width="121">Abhiman Palace</td>
                                                <td width="261">"9th Floor, Abhiman Chambers,<br /> Near Bunts Hostel Circle, Kadri Road,<br /> Mangalore - 575 003"</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">ABHIMAN Constructions</td>
                                                <td width="121">Abhiman Gardens</td>
                                                <td width="261">"9th Floor, Abhiman Chambers,<br /> Near Bunts Hostel Circle, Kadri Road,<br /> Mangalore - 575 003"</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">ABHIMAN Constructions</td>
                                                <td width="121">Sanjay</td>
                                                <td width="261">"9th Floor, Abhiman Chambers,<br /> Near Bunts Hostel Circle, Kadri Road,<br /> Mangalore - 575 003"</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">ABHIMAN Constructions</td>
                                                <td width="121">Abhiman Mansion</td>
                                                <td width="261">"9th Floor, Abhiman Chambers,<br /> Near Bunts Hostel Circle, Kadri Road,<br /> Mangalore - 575 003"</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">ABHIMAN Constructions</td>
                                                <td width="121">Laxminarayan Apartments</td>
                                                <td width="261">"9th Floor, Abhiman Chambers,<br /> Near Bunts Hostel Circle, Kadri Road,<br /> Mangalore - 575 003"</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">ABHIMAN Constructions</td>
                                                <td width="121">Srinivasa Apartments</td>
                                                <td width="261">"9th Floor, Abhiman Chambers,<br /> Near Bunts Hostel Circle, Kadri Road,<br /> Mangalore - 575 003"</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">PLAMA Developers Limited</td>
                                                <td width="121">Plama Serenity</td>
                                                <td width="261">"2nd Floor, PLAMA Center<br /> &nbsp;Bejai-Kapikad road<br /> &nbsp;Bejai, Mangalore- 575004<br /> &nbsp;Karnataka, India"</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">PLAMA Developers Limited</td>
                                                <td width="121">Plama Crest</td>
                                                <td width="261">"2nd Floor, PLAMA Center<br /> &nbsp;Bejai-Kapikad road<br /> &nbsp;Bejai, Mangalore- 575004<br /> &nbsp;Karnataka, India"</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">PLAMA Developers Limited</td>
                                                <td width="121">Plama Grande</td>
                                                <td width="261">"2nd Floor, PLAMA Center<br /> &nbsp;Bejai-Kapikad road<br /> &nbsp;Bejai, Mangalore- 575004<br /> &nbsp;Karnataka, India"</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">PLAMA Developers Limited</td>
                                                <td width="121">Plama Gardenia</td>
                                                <td width="261">"2nd Floor, PLAMA Center<br /> &nbsp;Bejai-Kapikad road<br /> &nbsp;Bejai, Mangalore- 575004<br /> &nbsp;Karnataka, India"</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">PLAMA Developers Limited</td>
                                                <td width="121">Plama Castle</td>
                                                <td width="261">"2nd Floor, PLAMA Center<br /> &nbsp;Bejai-Kapikad road<br /> &nbsp;Bejai, Mangalore- 575004<br /> &nbsp;Karnataka, India"</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">PLAMA Developers Limited</td>
                                                <td width="121">Plama Citius</td>
                                                <td width="261">"2nd Floor, PLAMA Center<br /> &nbsp;Bejai-Kapikad road<br /> &nbsp;Bejai, Mangalore- 575004<br /> &nbsp;Karnataka, India"</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">PLAMA Developers Limited</td>
                                                <td width="121">Plama Nest</td>
                                                <td width="261">"2nd Floor, PLAMA Center<br /> &nbsp;Bejai-Kapikad road<br /> &nbsp;Bejai, Mangalore- 575004<br /> &nbsp;Karnataka, India"</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">PLAMA Developers Limited</td>
                                                <td width="121">Plama Mall</td>
                                                <td width="261">"2nd Floor, PLAMA Center<br /> &nbsp;Bejai-Kapikad road<br /> &nbsp;Bejai, Mangalore- 575004<br /> &nbsp;Karnataka, India"</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">PLAMA Developers Limited</td>
                                                <td width="121">Plama Habitat</td>
                                                <td width="261">"2nd Floor, PLAMA Center<br /> &nbsp;Bejai-Kapikad road<br /> &nbsp;Bejai, Mangalore- 575004<br /> &nbsp;Karnataka, India"</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">PLAMA Developers Limited</td>
                                                <td width="121">Plama Oceanic</td>
                                                <td width="261">"2nd Floor, PLAMA Center<br /> &nbsp;Bejai-Kapikad road<br /> &nbsp;Bejai, Mangalore- 575004<br /> &nbsp;Karnataka, India"</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">PLAMA Developers Limited</td>
                                                <td width="121">Plama Icon</td>
                                                <td width="261">"2nd Floor, PLAMA Center<br /> &nbsp;Bejai-Kapikad road<br /> &nbsp;Bejai, Mangalore- 575004<br /> &nbsp;Karnataka, India"</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">PLAMA Developers Limited</td>
                                                <td width="121">Plama Residency</td>
                                                <td width="261">"2nd Floor, PLAMA Center<br /> &nbsp;Bejai-Kapikad road<br /> &nbsp;Bejai, Mangalore- 575004<br /> &nbsp;Karnataka, India"</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">PLAMA Developers Limited</td>
                                                <td width="121">Plama Diamond</td>
                                                <td width="261">"2nd Floor, PLAMA Center<br /> &nbsp;Bejai-Kapikad road<br /> &nbsp;Bejai, Mangalore- 575004<br /> &nbsp;Karnataka, India"</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">PLAMA Developers Limited</td>
                                                <td width="121">Plama Elite</td>
                                                <td width="261">"2nd Floor, PLAMA Center<br /> &nbsp;Bejai-Kapikad road<br /> &nbsp;Bejai, Mangalore- 575004<br /> &nbsp;Karnataka, India"</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Land Trades Builders &amp; Developers</td>
                                                <td width="121">Milestone 25</td>
                                                <td width="261">"1st Floor, New Milagres Mansion, <br /> Falnir Road, Mangalore - 575001 <br /> Karnataka, India"</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Land Trades Builders &amp; Developers</td>
                                                <td width="121">Emerald Bay</td>
                                                <td width="261">"1st Floor, New Milagres Mansion, <br /> Falnir Road, Mangalore - 575001 <br /> Karnataka, India"</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Land Trades Builders &amp; Developers</td>
                                                <td width="121">Insignia</td>
                                                <td width="261">"1st Floor, New Milagres Mansion, <br /> Falnir Road, Mangalore - 575001 <br /> Karnataka, India"</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Land Trades Builders &amp; Developers</td>
                                                <td width="121">Lenhil Ferns</td>
                                                <td width="261">"1st Floor, New Milagres Mansion, <br /> Falnir Road, Mangalore - 575001 <br /> Karnataka, India"</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Land Trades Builders &amp; Developers</td>
                                                <td width="121">Solitaire</td>
                                                <td width="261">"1st Floor, New Milagres Mansion, <br /> Falnir Road, Mangalore - 575001 <br /> Karnataka, India"</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Land Trades Builders &amp; Developers</td>
                                                <td width="121">molody</td>
                                                <td width="261">"1st Floor, New Milagres Mansion, <br /> Falnir Road, Mangalore - 575001 <br /> Karnataka, India"</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Bhandary Builders</td>
                                                <td width="121">Bhandary Heights</td>
                                                <td width="261">"1st Floor, Kalpataru Complex<br /> Opposite Kadri Arch, Mallikatta<br /> Mangalore -575002"</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Bhandary Builders</td>
                                                <td width="121">Bhandary Park Inn</td>
                                                <td width="261">"1st Floor, Kalpataru Complex<br /> Opposite Kadri Arch, Mallikatta<br /> Mangalore -575002"</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Bhandary Builders</td>
                                                <td width="121">Bhandary Meridian</td>
                                                <td width="261">"1st Floor, Kalpataru Complex<br /> Opposite Kadri Arch, Mallikatta<br /> Mangalore -575002"</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Bhandary Builders</td>
                                                <td width="121">Bhandary Garden</td>
                                                <td width="261">"1st Floor, Kalpataru Complex<br /> Opposite Kadri Arch, Mallikatta<br /> Mangalore -575002"</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Bhandary Builders</td>
                                                <td width="121">Bhandary Pacific</td>
                                                <td width="261">"1st Floor, Kalpataru Complex<br /> Opposite Kadri Arch, Mallikatta<br /> Mangalore -575002"</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Bhandary Builders</td>
                                                <td width="121">Bhandary Vijaya Enclave</td>
                                                <td width="261">"1st Floor, Kalpataru Complex<br /> Opposite Kadri Arch, Mallikatta<br /> Mangalore -575002"</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Bhandary Builders</td>
                                                <td width="121">Bhandary Solitaire</td>
                                                <td width="261">"1st Floor, Kalpataru Complex<br /> Opposite Kadri Arch, Mallikatta<br /> Mangalore -575002"</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">IN-LAND INFRASTRUCTURE DEVELOPERS PVT LTD <br /> &nbsp;IN-LAND BUILDERS</td>
                                                <td width="121">INLAND ESTORIA</td>
                                                <td width="261">"3rd Floor, IN-LAND ORNATE, <br /> &nbsp;Navbharath Circle, Kodialbail, <br /> &nbsp;Mangalore - 575003."</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">IN-LAND INFRASTRUCTURE DEVELOPERS PVT LTD <br /> &nbsp;IN-LAND BUILDERS</td>
                                                <td width="121">INLAND WINDSORS VILLAS</td>
                                                <td width="261">"3rd Floor, IN-LAND ORNATE, <br /> &nbsp;Navbharath Circle, Kodialbail, <br /> &nbsp;Mangalore - 575003."</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">IN-LAND INFRASTRUCTURE DEVELOPERS PVT LTD <br /> &nbsp;IN-LAND BUILDERS</td>
                                                <td width="121">INLAND SOVEREIGN</td>
                                                <td width="261">"3rd Floor, IN-LAND ORNATE, <br /> &nbsp;Navbharath Circle, Kodialbail, <br /> &nbsp;Mangalore - 575003."</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">IN-LAND INFRASTRUCTURE DEVELOPERS PVT LTD <br /> &nbsp;IN-LAND BUILDERS</td>
                                                <td width="121">INLAND ECHELON</td>
                                                <td width="261">"3rd Floor, IN-LAND ORNATE, <br /> &nbsp;Navbharath Circle, Kodialbail, <br /> &nbsp;Mangalore - 575003."</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">IN-LAND INFRASTRUCTURE DEVELOPERS PVT LTD <br /> &nbsp;IN-LAND BUILDERS</td>
                                                <td width="121">INLAND EON</td>
                                                <td width="261">"3rd Floor, IN-LAND ORNATE, <br /> &nbsp;Navbharath Circle, Kodialbail, <br /> &nbsp;Mangalore - 575003."</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">IN-LAND INFRASTRUCTURE DEVELOPERS PVT LTD <br /> &nbsp;IN-LAND BUILDERS</td>
                                                <td width="121">INLAND ELAN</td>
                                                <td width="261">"3rd Floor, IN-LAND ORNATE, <br /> &nbsp;Navbharath Circle, Kodialbail, <br /> &nbsp;Mangalore - 575003."</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">IN-LAND INFRASTRUCTURE DEVELOPERS PVT LTD <br /> &nbsp;IN-LAND BUILDERS</td>
                                                <td width="121">INLAND ETHOS</td>
                                                <td width="261">"3rd Floor, IN-LAND ORNATE, <br /> &nbsp;Navbharath Circle, Kodialbail, <br /> &nbsp;Mangalore - 575003."</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">IN-LAND INFRASTRUCTURE DEVELOPERS PVT LTD <br /> &nbsp;IN-LAND BUILDERS</td>
                                                <td width="121">INLAND SALUTE</td>
                                                <td width="261">"3rd Floor, IN-LAND ORNATE, <br /> &nbsp;Navbharath Circle, Kodialbail, <br /> &nbsp;Mangalore - 575003."</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">IN-LAND INFRASTRUCTURE DEVELOPERS PVT LTD <br /> &nbsp;IN-LAND BUILDERS</td>
                                                <td width="121">INLAND GALORE</td>
                                                <td width="261">"3rd Floor, IN-LAND ORNATE, <br /> &nbsp;Navbharath Circle, Kodialbail, <br /> &nbsp;Mangalore - 575003."</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">IN-LAND INFRASTRUCTURE DEVELOPERS PVT LTD <br /> &nbsp;IN-LAND BUILDERS</td>
                                                <td width="121">INLAND PRISTINE</td>
                                                <td width="261">"3rd Floor, IN-LAND ORNATE, <br /> &nbsp;Navbharath Circle, Kodialbail, <br /> &nbsp;Mangalore - 575003."</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">IN-LAND INFRASTRUCTURE DEVELOPERS PVT LTD <br /> &nbsp;IN-LAND BUILDERS</td>
                                                <td width="121">INLAND ORNATE</td>
                                                <td width="261">"3rd Floor, IN-LAND ORNATE, <br /> &nbsp;Navbharath Circle, Kodialbail, <br /> &nbsp;Mangalore - 575003."</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">IN-LAND INFRASTRUCTURE DEVELOPERS PVT LTD <br /> &nbsp;IN-LAND BUILDERS</td>
                                                <td width="121">INLAND AVENUE</td>
                                                <td width="261">"3rd Floor, IN-LAND ORNATE, <br /> &nbsp;Navbharath Circle, Kodialbail, <br /> &nbsp;Mangalore - 575003."</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">IN-LAND INFRASTRUCTURE DEVELOPERS PVT LTD <br /> &nbsp;IN-LAND BUILDERS</td>
                                                <td width="121">INLAND EBONY</td>
                                                <td width="261">"3rd Floor, IN-LAND ORNATE, <br /> &nbsp;Navbharath Circle, Kodialbail, <br /> &nbsp;Mangalore - 575003."</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">IN-LAND INFRASTRUCTURE DEVELOPERS PVT LTD <br /> &nbsp;IN-LAND BUILDERS</td>
                                                <td width="121">INLAND EXCELLENCY</td>
                                                <td width="261">"3rd Floor, IN-LAND ORNATE, <br /> &nbsp;Navbharath Circle, Kodialbail, <br /> &nbsp;Mangalore - 575003."</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">IN-LAND INFRASTRUCTURE DEVELOPERS PVT LTD <br /> &nbsp;IN-LAND BUILDERS</td>
                                                <td width="121">INLAND MONARCH</td>
                                                <td width="261">"3rd Floor, IN-LAND ORNATE, <br /> &nbsp;Navbharath Circle, Kodialbail, <br /> &nbsp;Mangalore - 575003."</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">IN-LAND INFRASTRUCTURE DEVELOPERS PVT LTD <br /> &nbsp;IN-LAND BUILDERS</td>
                                                <td width="121">INLAND EMINENCE</td>
                                                <td width="261">"3rd Floor, IN-LAND ORNATE, <br /> &nbsp;Navbharath Circle, Kodialbail, <br /> &nbsp;Mangalore - 575003."</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">IN-LAND INFRASTRUCTURE DEVELOPERS PVT LTD <br /> &nbsp;IN-LAND BUILDERS</td>
                                                <td width="121">INLAND AVENUE</td>
                                                <td width="261">"3rd Floor, IN-LAND ORNATE, <br /> &nbsp;Navbharath Circle, Kodialbail, <br /> &nbsp;Mangalore - 575003."</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">IN-LAND INFRASTRUCTURE DEVELOPERS PVT LTD <br /> &nbsp;IN-LAND BUILDERS</td>
                                                <td width="121">GOLDEN CHAMBERS</td>
                                                <td width="261">"3rd Floor, IN-LAND ORNATE, <br /> &nbsp;Navbharath Circle, Kodialbail, <br /> &nbsp;Mangalore - 575003."</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">IN-LAND INFRASTRUCTURE DEVELOPERS PVT LTD <br /> &nbsp;IN-LAND BUILDERS</td>
                                                <td width="121">STERLING CHAMBERS</td>
                                                <td width="261">"3rd Floor, IN-LAND ORNATE, <br /> &nbsp;Navbharath Circle, Kodialbail, <br /> &nbsp;Mangalore - 575003."</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">IN-LAND INFRASTRUCTURE DEVELOPERS PVT LTD <br /> &nbsp;IN-LAND BUILDERS</td>
                                                <td width="121">EMBASSY COURT</td>
                                                <td width="261">"3rd Floor, IN-LAND ORNATE, <br /> &nbsp;Navbharath Circle, Kodialbail, <br /> &nbsp;Mangalore - 575003."</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">IN-LAND INFRASTRUCTURE DEVELOPERS PVT LTD <br /> &nbsp;IN-LAND BUILDERS</td>
                                                <td width="121">INLAND ENCORE</td>
                                                <td width="261">"3rd Floor, IN-LAND ORNATE, <br /> &nbsp;Navbharath Circle, Kodialbail, <br /> &nbsp;Mangalore - 575003."</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">IN-LAND INFRASTRUCTURE DEVELOPERS PVT LTD <br /> &nbsp;IN-LAND BUILDERS</td>
                                                <td width="121">INLAND EVOKE</td>
                                                <td width="261">"3rd Floor, IN-LAND ORNATE, <br /> &nbsp;Navbharath Circle, Kodialbail, <br /> &nbsp;Mangalore - 575003."</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">IN-LAND INFRASTRUCTURE DEVELOPERS PVT LTD <br /> &nbsp;IN-LAND BUILDERS</td>
                                                <td width="121">EMBASSY PLAZA</td>
                                                <td width="261">"3rd Floor, IN-LAND ORNATE, <br /> &nbsp;Navbharath Circle, Kodialbail, <br /> &nbsp;Mangalore - 575003."</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">IN-LAND INFRASTRUCTURE DEVELOPERS PVT LTD <br /> &nbsp;IN-LAND BUILDERS</td>
                                                <td width="121">INLAND CLUSTERS</td>
                                                <td width="261">"3rd Floor, IN-LAND ORNATE, <br /> &nbsp;Navbharath Circle, Kodialbail, <br /> &nbsp;Mangalore - 575003."</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">IN-LAND INFRASTRUCTURE DEVELOPERS PVT LTD <br /> &nbsp;IN-LAND BUILDERS</td>
                                                <td width="121">INLAND MAJESTIC</td>
                                                <td width="261">"3rd Floor, IN-LAND ORNATE, <br /> &nbsp;Navbharath Circle, Kodialbail, <br /> &nbsp;Mangalore - 575003."</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">IN-LAND INFRASTRUCTURE DEVELOPERS PVT LTD <br /> &nbsp;IN-LAND BUILDERS</td>
                                                <td width="121">INLAND ENCLAVE</td>
                                                <td width="261">"3rd Floor, IN-LAND ORNATE, <br /> &nbsp;Navbharath Circle, Kodialbail, <br /> &nbsp;Mangalore - 575003."</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">IN-LAND INFRASTRUCTURE DEVELOPERS PVT LTD <br /> &nbsp;IN-LAND BUILDERS</td>
                                                <td width="121">INLAND ELITE</td>
                                                <td width="261">"3rd Floor, IN-LAND ORNATE, <br /> &nbsp;Navbharath Circle, Kodialbail, <br /> &nbsp;Mangalore - 575003."</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">K2 Builders and Realtors</td>
                                                <td width="121">K2 AQUA</td>
                                                <td width="261">Metalco Plaza' , Falnir Road , Mangalore - 575 002</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">K2 Builders and Realtors</td>
                                                <td width="121">K2 SENNA</td>
                                                <td width="261">Metalco Plaza' , Falnir Road , Mangalore - 575 002</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">K2 Builders and Realtors</td>
                                                <td width="121">K2 HABITAT</td>
                                                <td width="261">Metalco Plaza' , Falnir Road , Mangalore - 575 002</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">K2 Builders and Realtors</td>
                                                <td width="121">MEADOWS</td>
                                                <td width="261">Metalco Plaza' , Falnir Road , Mangalore - 575 002</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">K2 Builders and Realtors</td>
                                                <td width="121">CREST</td>
                                                <td width="261">Metalco Plaza' , Falnir Road , Mangalore - 575 002</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">DIVAKAR CONSTRUCTIONS</td>
                                                <td width="121">Diya residency</td>
                                                <td width="261">Shop No. 6, Ground Floor, Dev Plaza,<br /> Kadri Temple Road, Mangalore 575002</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">DIVAKAR CONSTRUCTIONS</td>
                                                <td width="121">Alpha homes</td>
                                                <td width="261">Shop No. 6, Ground Floor, Dev Plaza,<br /> Kadri Temple Road, Mangalore 575002</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">DIVAKAR CONSTRUCTIONS</td>
                                                <td width="121">Vandana callisto</td>
                                                <td width="261">Shop No. 6, Ground Floor, Dev Plaza,<br /> Kadri Temple Road, Mangalore 575002</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Rohan Corporation</td>
                                                <td width="121">Zorion</td>
                                                <td width="261">Balmatta Road, Bendorewell<br /> Mangalore - 575002</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Rohan Corporation</td>
                                                <td width="121">PRIMERO</td>
                                                <td width="261">Balmatta Road, Bendorewell<br /> Mangalore - 575002</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Rohan Corporation</td>
                                                <td width="121">VENTURA</td>
                                                <td width="261">Balmatta Road, Bendorewell<br /> Mangalore - 575002</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Rohan Corporation</td>
                                                <td width="121">MICASA</td>
                                                <td width="261">Balmatta Road, Bendorewell<br /> Mangalore - 575002</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Rohan Corporation</td>
                                                <td width="121">GLOBAL COURT</td>
                                                <td width="261">Balmatta Road, Bendorewell<br /> Mangalore - 575002</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Rohan Corporation</td>
                                                <td width="121">PETER's COTE</td>
                                                <td width="261">Balmatta Road, Bendorewell<br /> Mangalore - 575002</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Rohan Corporation</td>
                                                <td width="121">BIANCA</td>
                                                <td width="261">Balmatta Road, Bendorewell<br /> Mangalore - 575002</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Rohan Corporation</td>
                                                <td width="121">BELLISSIMA</td>
                                                <td width="261">Balmatta Road, Bendorewell<br /> Mangalore - 575002</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Rohan Corporation</td>
                                                <td width="121">HILL CREST</td>
                                                <td width="261">Balmatta Road, Bendorewell<br /> Mangalore - 575002</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Rohan Corporation</td>
                                                <td width="121">CATALONIA II</td>
                                                <td width="261">Balmatta Road, Bendorewell<br /> Mangalore - 575002</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Rohan Corporation</td>
                                                <td width="121">DAIJIWORLD RESIDENCY</td>
                                                <td width="261">Balmatta Road, Bendorewell<br /> Mangalore - 575002</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Rohan Corporation</td>
                                                <td width="121">INFINITY</td>
                                                <td width="261">Balmatta Road, Bendorewell<br /> Mangalore - 575002</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Rohan Corporation</td>
                                                <td width="121">EXOTICA</td>
                                                <td width="261">Balmatta Road, Bendorewell<br /> Mangalore - 575002</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Rohan Corporation</td>
                                                <td width="121">LUMINUS</td>
                                                <td width="261">Balmatta Road, Bendorewell<br /> Mangalore - 575002</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Rohan Corporation</td>
                                                <td width="121">CATALONIA</td>
                                                <td width="261">Balmatta Road, Bendorewell<br /> Mangalore - 575002</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Rohan Corporation</td>
                                                <td width="121">SILICONIA</td>
                                                <td width="261">Balmatta Road, Bendorewell<br /> Mangalore - 575002</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Rohan Corporation</td>
                                                <td width="121">PLAMA HABITAT</td>
                                                <td width="261">Balmatta Road, Bendorewell<br /> Mangalore - 575002</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Rohan Corporation</td>
                                                <td width="121">CONCORD</td>
                                                <td width="261">Balmatta Road, Bendorewell<br /> Mangalore - 575002</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Rohan Corporation</td>
                                                <td width="121">SERENITY</td>
                                                <td width="261">Balmatta Road, Bendorewell<br /> Mangalore - 575002</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">BHOOMI GROUPS</td>
                                                <td width="121">FERN</td>
                                                <td width="261">Monalisa Residency 1st Floor, Bejai Church Raod. Mangalore - 575 004&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">BHOOMI GROUPS</td>
                                                <td width="121">SRI NIDHI</td>
                                                <td width="261">Monalisa Residency 1st Floor, Bejai Church Raod. Mangalore - 575 004&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">BHOOMI GROUPS</td>
                                                <td width="121">DHRUVA RESIDENCY</td>
                                                <td width="261">Monalisa Residency 1st Floor, Bejai Church Raod. Mangalore - 575 004&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">AK Builders &amp; Developers</td>
                                                <td width="121">IVY Apartment</td>
                                                <td width="261">2nd Floor, Mangalore Gate,<br /> Kankanady Bypass Road,<br /> Mangalore - 575002</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">AK Builders &amp; Developers</td>
                                                <td width="121">AK Mall</td>
                                                <td width="261">3rd Floor, Mangalore Gate,<br /> Kankanady Bypass Road,<br /> Mangalore - 575002</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">ACE DEVELOPERS</td>
                                                <td width="121">Wood Haven</td>
                                                <td width="261">First floor, Inland Ornate,<br /> Navabharath Circle, <br /> Mangalore 575 003.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">ACE DEVELOPERS</td>
                                                <td width="121">Willows Residences</td>
                                                <td width="261">First floor, Inland Ornate,<br /> Navabharath Circle, <br /> Mangalore 575 003.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">ACE DEVELOPERS</td>
                                                <td width="121">Paradise Manor</td>
                                                <td width="261">First floor, Inland Ornate,<br /> Navabharath Circle, <br /> Mangalore 575 003.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">ACE DEVELOPERS</td>
                                                <td width="121">Olympia Residency</td>
                                                <td width="261">First floor, Inland Ornate,<br /> Navabharath Circle, <br /> Mangalore 575 003.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">ACE DEVELOPERS</td>
                                                <td width="121">Casa Royle</td>
                                                <td width="261">First floor, Inland Ornate,<br /> Navabharath Circle, <br /> Mangalore 575 003.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">ACE DEVELOPERS</td>
                                                <td width="121">Ocean Fortune Residency</td>
                                                <td width="261">First floor, Inland Ornate,<br /> Navabharath Circle, <br /> Mangalore 575 003.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">ACE DEVELOPERS</td>
                                                <td width="121">Hill Crest</td>
                                                <td width="261">First floor, Inland Ornate,<br /> Navabharath Circle, <br /> Mangalore 575 003.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">ACE DEVELOPERS</td>
                                                <td width="121">Gola Residency</td>
                                                <td width="261">First floor, Inland Ornate,<br /> Navabharath Circle, <br /> Mangalore 575 003.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Janata Constructions Co.</td>
                                                <td width="121">EXOTICA</td>
                                                <td width="261">No.201,Mahendra Arcade,<br /> K R Rao Road, Kodialbail,<br /> Mangalore - 575003</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Janata Constructions Co.</td>
                                                <td width="121">MAURISHKA PARK</td>
                                                <td width="261">No.201,Mahendra Arcade,<br /> K R Rao Road, Kodialbail,<br /> Mangalore - 575003</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Janata Constructions Co.</td>
                                                <td width="121">DEEPA APARTMENT 'SUNNY'</td>
                                                <td width="261">No.201,Mahendra Arcade,<br /> K R Rao Road, Kodialbail,<br /> Mangalore - 575003</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Janata Constructions Co.</td>
                                                <td width="121">Hotel Deepa Comforts &amp; Divya Enclave</td>
                                                <td width="261">No.201,Mahendra Arcade,<br /> K R Rao Road, Kodialbail,<br /> Mangalore - 575003</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Janata Constructions Co.</td>
                                                <td width="121">Maurishka Towers</td>
                                                <td width="261">No.201,Mahendra Arcade,<br /> K R Rao Road, Kodialbail,<br /> Mangalore - 575003</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Janata Constructions Co.</td>
                                                <td width="121">SHIVADEEP RESIDENCY</td>
                                                <td width="261">No.201,Mahendra Arcade,<br /> K R Rao Road, Kodialbail,<br /> Mangalore - 575003</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Agraja Builders &amp; Developers</td>
                                                <td width="121">Agraja Ambari</td>
                                                <td width="261">2nd Floor, Pam Arcade,<br /> Opp Indian Oil Petrol Pump,Near Infosys,<br /> Kottara Chowki, Mangalore - 575006 ."</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Agraja Builders &amp; Developers</td>
                                                <td width="121">The Legend</td>
                                                <td width="261">3rd Floor, Pam Arcade,<br /> Opp Indian Oil Petrol Pump,Near Infosys,<br /> Kottara Chowki, Mangalore - 575006 ."</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Agraja Builders &amp; Developers</td>
                                                <td width="121">Vivanta</td>
                                                <td width="261">4th Floor, Pam Arcade,<br /> Opp Indian Oil Petrol Pump,Near Infosys,<br /> Kottara Chowki, Mangalore - 575006 ."</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Agraja Builders &amp; Developers</td>
                                                <td width="121">Shilas By Agraja</td>
                                                <td width="261">5th Floor, Pam Arcade,<br /> Opp Indian Oil Petrol Pump,Near Infosys,<br /> Kottara Chowki, Mangalore - 575006 ."</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Agraja Builders &amp; Developers</td>
                                                <td width="121">Bappanadu Residency</td>
                                                <td width="261">6th Floor, Pam Arcade,<br /> Opp Indian Oil Petrol Pump,Near Infosys,<br /> Kottara Chowki, Mangalore - 575006 ."</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Agraja Builders &amp; Developers</td>
                                                <td width="121">Sarovar by Agraja</td>
                                                <td width="261">7th Floor, Pam Arcade,<br /> Opp Indian Oil Petrol Pump,Near Infosys,<br /> Kottara Chowki, Mangalore - 575006 ."</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Agraja Builders &amp; Developers</td>
                                                <td width="121">Agraja Garden</td>
                                                <td width="261">8th Floor, Pam Arcade,<br /> Opp Indian Oil Petrol Pump,Near Infosys,<br /> Kottara Chowki, Mangalore - 575006 ."</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Agraja Builders &amp; Developers</td>
                                                <td width="121">LAYOUT FOR NANDAVANA</td>
                                                <td width="261">9th Floor, Pam Arcade,<br /> Opp Indian Oil Petrol Pump,Near Infosys,<br /> Kottara Chowki, Mangalore - 575006 ."</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Agraja Builders &amp; Developers</td>
                                                <td width="121">LAYOUT FOR VRINDHAVANA</td>
                                                <td width="261">10th Floor, Pam Arcade,<br /> Opp Indian Oil Petrol Pump,Near Infosys,<br /> Kottara Chowki, Mangalore - 575006 ."</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">PROVIDENCE BUILDERS &amp; DEVELOPERS</td>
                                                <td width="121">&nbsp;</td>
                                                <td width="261">Bejai new road, Mangalore - 575 004</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">PROVIDENCE BUILDERS &amp; DEVELOPERS</td>
                                                <td width="121">Providence Elegance</td>
                                                <td width="261">Bejai new road, Mangalore - 575 004</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">PROVIDENCE BUILDERS &amp; DEVELOPERS</td>
                                                <td width="121">Providence Cascade</td>
                                                <td width="261">Bejai new road, Mangalore - 575 004</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">PROVIDENCE BUILDERS &amp; DEVELOPERS</td>
                                                <td width="121">Providence Dasha</td>
                                                <td width="261">Bejai new road, Mangalore - 575 004</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">PROVIDENCE BUILDERS &amp; DEVELOPERS</td>
                                                <td width="121">Providence Dasha</td>
                                                <td width="261">Bejai new road, Mangalore - 575 004</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">PROVIDENCE BUILDERS &amp; DEVELOPERS</td>
                                                <td width="121">Abode-2</td>
                                                <td width="261">Bejai new road, Mangalore - 575 004</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">PROVIDENCE BUILDERS &amp; DEVELOPERS</td>
                                                <td width="121">Abode-1</td>
                                                <td width="261">Bejai new road, Mangalore - 575 004</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">PROVIDENCE BUILDERS &amp; DEVELOPERS</td>
                                                <td width="121">Evergreen Enclave</td>
                                                <td width="261">Bejai new road, Mangalore - 575 004</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Mayur Builders &amp; Developers</td>
                                                <td width="121">Mayur Park</td>
                                                <td width="261">Ganesh Mahal Complex,<br /> K.S.Rao Road ,<br /> Mangalore - 575001</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Mayur Builders &amp; Developers</td>
                                                <td width="121">Mayur Pride</td>
                                                <td width="261">Ganesh Mahal Complex,<br /> K.S.Rao Road ,<br /> Mangalore - 575001</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Mayur Builders &amp; Developers</td>
                                                <td width="121">Mayur commercials</td>
                                                <td width="261">Ganesh Mahal Complex,<br /> K.S.Rao Road ,<br /> Mangalore - 575001</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Mayur Builders &amp; Developers</td>
                                                <td width="121">Mayur Residency</td>
                                                <td width="261">Ganesh Mahal Complex,<br /> K.S.Rao Road ,<br /> Mangalore - 575001</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">Mayur Builders &amp; Developers</td>
                                                <td width="121">Mayur Ganesh Mahal</td>
                                                <td width="261">Ganesh Mahal Complex,<br /> K.S.Rao Road ,<br /> Mangalore - 575001</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">VISHWAS BAWA BUILDERS</td>
                                                <td width="121">Vishwas Aloevera</td>
                                                <td width="261">Vishwas Crown Building,<br /> near Cochin Bakery,<br /> Kankanady,<br /> Mangaluru, Karnataka 575001</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">VISHWAS BAWA BUILDERS</td>
                                                <td width="121">Vishwas Sujatha Residency</td>
                                                <td width="261">Vishwas Crown Building,<br /> near Cochin Bakery,<br /> Kankanady,<br /> Mangaluru, Karnataka 575001</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">VISHWAS BAWA BUILDERS</td>
                                                <td width="121">Vishwas Jasmine</td>
                                                <td width="261">Vishwas Crown Building,<br /> near Cochin Bakery,<br /> Kankanady,<br /> Mangaluru, Karnataka 575001</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">VISHWAS BAWA BUILDERS</td>
                                                <td width="121">Vishwas Thribhuvan</td>
                                                <td width="261">Vishwas Crown Building,<br /> near Cochin Bakery,<br /> Kankanady,<br /> Mangaluru, Karnataka 575001</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">VISHWAS BAWA BUILDERS</td>
                                                <td width="121">Vishwas Neha Residency</td>
                                                <td width="261">Vishwas Crown Building,<br /> near Cochin Bakery,<br /> Kankanady,<br /> Mangaluru, Karnataka 575001</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">VISHWAS BAWA BUILDERS</td>
                                                <td width="121">Vishwas Darshan</td>
                                                <td width="261">Vishwas Crown Building,<br /> near Cochin Bakery,<br /> Kankanady,<br /> Mangaluru, Karnataka 575001</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">VISHWAS BAWA BUILDERS</td>
                                                <td width="121">Vishwas Kuteera</td>
                                                <td width="261">Vishwas Crown Building,<br /> near Cochin Bakery,<br /> Kankanady,<br /> Mangaluru, Karnataka 575001</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">VISHWAS BAWA BUILDERS</td>
                                                <td width="121">Vishwas Samrat</td>
                                                <td width="261">Vishwas Crown Building,<br /> near Cochin Bakery,<br /> Kankanady,<br /> Mangaluru, Karnataka 575001</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">VISHWAS BAWA BUILDERS</td>
                                                <td width="121">Vishwas Diamond</td>
                                                <td width="261">Vishwas Crown Building,<br /> near Cochin Bakery,<br /> Kankanady,<br /> Mangaluru, Karnataka 575001</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">VISHWAS BAWA BUILDERS</td>
                                                <td width="121">Vishwas Crystal</td>
                                                <td width="261">Vishwas Crown Building,<br /> near Cochin Bakery,<br /> Kankanady,<br /> Mangaluru, Karnataka 575001</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">VISHWAS BAWA BUILDERS</td>
                                                <td width="121">Vishwas Crown</td>
                                                <td width="261">Vishwas Crown Building,<br /> near Cochin Bakery,<br /> Kankanady,<br /> Mangaluru, Karnataka 575001</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">VISHWAS BAWA BUILDERS</td>
                                                <td width="121">Vishwas Dwaraka</td>
                                                <td width="261">Vishwas Crown Building,<br /> near Cochin Bakery,<br /> Kankanady,<br /> Mangaluru, Karnataka 575001</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">VISHWAS BAWA BUILDERS</td>
                                                <td width="121">Vishwas Sahara Heights</td>
                                                <td width="261">Vishwas Crown Building,<br /> near Cochin Bakery,<br /> Kankanady,<br /> Mangaluru, Karnataka 575001</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">VISHWAS BAWA BUILDERS</td>
                                                <td width="121">Vishwas Planet</td>
                                                <td width="261">Vishwas Crown Building,<br /> near Cochin Bakery,<br /> Kankanady,<br /> Mangaluru, Karnataka 575001</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">VISHWAS BAWA BUILDERS</td>
                                                <td width="121">Vishwas Sathyam</td>
                                                <td width="261">Vishwas Crown Building,<br /> near Cochin Bakery,<br /> Kankanady,<br /> Mangaluru, Karnataka 575001</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">VISHWAS BAWA BUILDERS</td>
                                                <td width="121">Vishwas Asha Kiran</td>
                                                <td width="261">Vishwas Crown Building,<br /> near Cochin Bakery,<br /> Kankanady,<br /> Mangaluru, Karnataka 575001</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">VISHWAS BAWA BUILDERS</td>
                                                <td width="121">Vishwas Homes</td>
                                                <td width="261">Vishwas Crown Building,<br /> near Cochin Bakery,<br /> Kankanady,<br /> Mangaluru, Karnataka 575001</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">VISHWAS BAWA BUILDERS</td>
                                                <td width="121">Vishwas Mithra</td>
                                                <td width="261">Vishwas Crown Building,<br /> near Cochin Bakery,<br /> Kankanady,<br /> Mangaluru, Karnataka 575001</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">VISHWAS BAWA BUILDERS</td>
                                                <td width="121">Vishwas Neptune</td>
                                                <td width="261">Vishwas Crown Building,<br /> near Cochin Bakery,<br /> Kankanady,<br /> Mangaluru, Karnataka 575001</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">VISHWAS BAWA BUILDERS</td>
                                                <td width="121">Vishwas Paradise</td>
                                                <td width="261">Vishwas Crown Building,<br /> near Cochin Bakery,<br /> Kankanady,<br /> Mangaluru, Karnataka 575001</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">VISHWAS BAWA BUILDERS</td>
                                                <td width="121">Vishwas Residency</td>
                                                <td width="261">Vishwas Crown Building,<br /> near Cochin Bakery,<br /> Kankanady,<br /> Mangaluru, Karnataka 575001</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">VISHWAS BAWA BUILDERS</td>
                                                <td width="121">Vishwas Orchid</td>
                                                <td width="261">Vishwas Crown Building,<br /> near Cochin Bakery,<br /> Kankanady,<br /> Mangaluru, Karnataka 575001</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">VISHWAS BAWA BUILDERS</td>
                                                <td width="121">Vishwas Imperial</td>
                                                <td width="261">Vishwas Crown Building,<br /> near Cochin Bakery,<br /> Kankanady,<br /> Mangaluru, Karnataka 575001</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">VISHWAS BAWA BUILDERS</td>
                                                <td width="121">Vishwas Avenue</td>
                                                <td width="261">Vishwas Crown Building,<br /> near Cochin Bakery,<br /> Kankanady,<br /> Mangaluru, Karnataka 575001</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">VISHWAS BAWA BUILDERS</td>
                                                <td width="121">Vishwas Jupiter</td>
                                                <td width="261">Vishwas Crown Building,<br /> near Cochin Bakery,<br /> Kankanady,<br /> Mangaluru, Karnataka 575001</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">VISHWAS BAWA BUILDERS</td>
                                                <td width="121">Vishwas View</td>
                                                <td width="261">Vishwas Crown Building,<br /> near Cochin Bakery,<br /> Kankanady,<br /> Mangaluru, Karnataka 575001</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">VISHWAS BAWA BUILDERS</td>
                                                <td width="121">Vishwas Pearl</td>
                                                <td width="261">Vishwas Crown Building,<br /> near Cochin Bakery,<br /> Kankanady,<br /> Mangaluru, Karnataka 575001</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">VISHWAS BAWA BUILDERS</td>
                                                <td width="121">Vishwas Green View</td>
                                                <td width="261">Vishwas Crown Building,<br /> near Cochin Bakery,<br /> Kankanady,<br /> Mangaluru, Karnataka 575001</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">VISHWAS BAWA BUILDERS</td>
                                                <td width="121">Vishwas Natasha Residency</td>
                                                <td width="261">Vishwas Crown Building,<br /> near Cochin Bakery,<br /> Kankanady,<br /> Mangaluru, Karnataka 575001</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">VISHWAS BAWA BUILDERS</td>
                                                <td width="121">Vishwas Manor</td>
                                                <td width="261">Vishwas Crown Building,<br /> near Cochin Bakery,<br /> Kankanady,<br /> Mangaluru, Karnataka 575001</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">VISHWAS BAWA BUILDERS</td>
                                                <td width="121">Vishwas Anmol</td>
                                                <td width="261">Vishwas Crown Building,<br /> near Cochin Bakery,<br /> Kankanady,<br /> Mangaluru, Karnataka 575001</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">VISHWAS BAWA BUILDERS</td>
                                                <td width="121">Vishwas Royal</td>
                                                <td width="261">Vishwas Crown Building,<br /> near Cochin Bakery,<br /> Kankanady,<br /> Mangaluru, Karnataka 575001</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">VISHWAS BAWA BUILDERS</td>
                                                <td width="121">Vishwas Garden</td>
                                                <td width="261">Vishwas Crown Building,<br /> near Cochin Bakery,<br /> Kankanady,<br /> Mangaluru, Karnataka 575001</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">VISHWAS BAWA BUILDERS</td>
                                                <td width="121">Vishwas Regency</td>
                                                <td width="261">Vishwas Crown Building,<br /> near Cochin Bakery,<br /> Kankanady,<br /> Mangaluru, Karnataka 575001</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Kalkura Builders &amp; Developers</td>
                                                <td width="121">Kalkura Palace</td>
                                                <td width="261">Opp.Palimar Mutt, Car Street, Udupi. Karnataka.</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Kalkura Builders &amp; Developers</td>
                                                <td width="121">Kalkura KRSNA</td>
                                                <td width="261">Opp.Palimar Mutt, Car Street, Udupi. Karnataka.</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Kalkura Builders &amp; Developers</td>
                                                <td width="121">Kalkura Braahhmee</td>
                                                <td width="261">Opp.Palimar Mutt, Car Street, Udupi. Karnataka.</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Kalkura Builders &amp; Developers</td>
                                                <td width="121">Kalkura Balakrsna</td>
                                                <td width="261">Opp.Palimar Mutt, Car Street, Udupi. Karnataka.</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Kalkura Builders &amp; Developers</td>
                                                <td width="121">Kalkura Klassik</td>
                                                <td width="261">Opp.Palimar Mutt, Car Street, Udupi. Karnataka.</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">JOHN CONSTRUCTION</td>
                                                <td width="121">John's Ark</td>
                                                <td width="261"><br /> 1st Floor, ""Krishna Kripa"" Complex<br /> Behind Service Bus Stand, Udupi.</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Khain Properties</td>
                                                <td width="121">Nilaya</td>
                                                <td width="261"><br /> 2nd floor, Devraj Towers<br /> Court Road, Udupi - 576 101</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Khain Properties</td>
                                                <td width="121">Khain Serenity</td>
                                                <td width="261"><br /> 2nd floor, Devraj Towers<br /> Court Road, Udupi - 576 101</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Khain Properties</td>
                                                <td width="121">Khain Annappa Heritage</td>
                                                <td width="261"><br /> 2nd floor, Devraj Towers<br /> Court Road, Udupi - 576 101</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Khain Properties</td>
                                                <td width="121">Residential plot layout</td>
                                                <td width="261"><br /> 2nd floor, Devraj Towers<br /> Court Road, Udupi - 576 101</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Khain Properties</td>
                                                <td width="121">Khain Silent Meadows</td>
                                                <td width="261"><br /> 2nd floor, Devraj Towers<br /> Court Road, Udupi - 576 101</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Archana Projects</td>
                                                <td width="121">Pretty Archana</td>
                                                <td width="261">&nbsp;<br /> 1st Floor, Ananth Towers,<br /> Court Road,<br /> UDUPI - 576 101</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Archana Projects</td>
                                                <td width="121">Little Archana</td>
                                                <td width="261">&nbsp;<br /> 1st Floor, Ananth Towers,<br /> Court Road,<br /> UDUPI - 576 101</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Archana Projects</td>
                                                <td width="121">Archana Residence</td>
                                                <td width="261">&nbsp;<br /> 1st Floor, Ananth Towers,<br /> Court Road,<br /> UDUPI - 576 101</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Archana Projects</td>
                                                <td width="121">Archana Arcade</td>
                                                <td width="261">&nbsp;<br /> 1st Floor, Ananth Towers,<br /> Court Road,<br /> UDUPI - 576 101</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Archana Projects</td>
                                                <td width="121">Archana Meadows</td>
                                                <td width="261">&nbsp;<br /> 1st Floor, Ananth Towers,<br /> Court Road,<br /> UDUPI - 576 101</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">MNK Sarvamangala land developers&nbsp;</td>
                                                <td width="121">Phase-2 Raghavendra layout</td>
                                                <td width="261">&nbsp;#17/1 jalahalli cross, chokkasandra, old&nbsp; oriental insurance building bangalore-5600057</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">MNK Sarvamangala land developers&nbsp;</td>
                                                <td width="121">Mahalakshmi layout</td>
                                                <td width="261">&nbsp;#17/1 jalahalli cross, chokkasandra, old&nbsp; oriental insurance building bangalore-5600057</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Shah's life styl</td>
                                                <td width="121">SHAH'S reality</td>
                                                <td width="261">37, shah mension, 1st floor,oppclock tower, station road, Davangere 577001</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Lotus land mark</td>
                                                <td width="121">Lotus siddhi</td>
                                                <td width="261">opp Airforce ground gate, MG road, chougulewade 1.5kms away from tilaknadi, 1st railway gate towards guruprasad colony belgaum, karnataka 590006</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Lotus land mark</td>
                                                <td width="121">Lotus county</td>
                                                <td width="261">opp Airforce ground gate, MG road, chougulewade 1.5kms away from tilaknadi, 1st railway gate towards guruprasad colony belgaum, karnataka 590006</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">SAI RAM DEVELOPRES AND BUILDERS</td>
                                                <td width="121">Suman Plaza</td>
                                                <td width="261">Mr manjunath shivappa makkalageri 975/2, suman plaza, shop no F-2, Ayodhya nagar, civil hospital Road, belgaum</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">shri parvati construction co. belgaum&nbsp;</td>
                                                <td width="121">Mathura arcade</td>
                                                <td width="261">Office no.2884/a1/1, 1st floor ,opp. Mangaldeep khade bazar, Belgaum</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">shri parvati construction co. belgaum&nbsp;</td>
                                                <td width="121">Indra chaya</td>
                                                <td width="261">Office no.2884/a1/1, 1st floor ,opp. Mangaldeep khade bazar, Belgaum</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">shri parvati construction co. belgaum&nbsp;</td>
                                                <td width="121">Ravindrashetty, Bgm</td>
                                                <td width="261">Office no.2884/a1/1, 1st floor ,opp. Mangaldeep khade bazar, Belgaum</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">shri parvati construction co. belgaum&nbsp;</td>
                                                <td width="121">Rose villa, Beg</td>
                                                <td width="261">Office no.2884/a1/1, 1st floor ,opp. Mangaldeep khade bazar, Belgaum</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">shri parvati construction co. belgaum&nbsp;</td>
                                                <td width="121">Almeda</td>
                                                <td width="261">Office no.2884/a1/1, 1st floor ,opp. Mangaldeep khade bazar, Belgaum</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">shri parvati construction co. belgaum&nbsp;</td>
                                                <td width="121">Shri parvati layout</td>
                                                <td width="261">Office no.2884/a1/1, 1st floor ,opp. Mangaldeep khade bazar, Belgaum</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">shri parvati construction co. belgaum&nbsp;</td>
                                                <td width="121">Shri parvati layout</td>
                                                <td width="261">Office no.2884/a1/1, 1st floor ,opp. Mangaldeep khade bazar, Belgaum</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">shri parvati construction co. belgaum&nbsp;</td>
                                                <td width="121">Karanjimath Elevation</td>
                                                <td width="261">Office no.2884/a1/1, 1st floor ,opp. Mangaldeep khade bazar, Belgaum</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Makaan.com Pvt Ltd</td>
                                                <td width="121">2BHK Apartment</td>
                                                <td width="261">Plot No.25, Institutional area sector-32, gurgaon-122001</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">NASCO Developers</td>
                                                <td width="121">Nasco lavender</td>
                                                <td width="261">Ranade colony, 1st cross , Hindwadi, Belgaum 590011</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">NASCO Developers</td>
                                                <td width="121">Nasco nanawadi</td>
                                                <td width="261">Ranade colony, 1st cross , Hindwadi, Belgaum 590011</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">NASCO Developers</td>
                                                <td width="121">Nasco Eden Phase-2</td>
                                                <td width="261">Ranade colony, 1st cross , Hindwadi, Belgaum 590011</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">NASCO Developers</td>
                                                <td width="121">Nasco Elegance (complited)</td>
                                                <td width="261">Ranade colony, 1st cross , Hindwadi, Belgaum 590011</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">NASCO Developers</td>
                                                <td width="121">Nasco May Fair Residencice (completed)</td>
                                                <td width="261">Ranade colony, 1st cross , Hindwadi, Belgaum 590011</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">HEDA Builders Pvt Ltd&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                                <td width="121">HEDA Orchids</td>
                                                <td width="261">Heda builders pvt .ltd<br /> no.18/B, heda menson opp.IOCL building,<br /> khanapur road,<br /> tilakwadi, belgaum.</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Noorani corble developers</td>
                                                <td width="121">One City Home (completed)</td>
                                                <td width="261">Noorani corble Pvt Ltd&nbsp; One city road (New goods shed road), Shastri nagar , Belgaum, 590001</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Raj Housing Development Pvt Ltd</td>
                                                <td width="121">Raj Nagari</td>
                                                <td width="261">Raja Mahalakshmi, F-2, #12 Basappa Rd, Bheemanna Garden, Lakshmiamma Garden, shantinagar, Bengaluru, 560027</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">NCC Urban Infrastructure Limited</td>
                                                <td width="121">Nagarjuna Meadows phase ll</td>
                                                <td width="261">NCC Urban Windsor, 3rd floor, New airport road, Opp. Jakkur Aerodrome, Bengaluru- 560064</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">MVS Builders</td>
                                                <td width="121">MVS Orchids</td>
                                                <td width="261">#20, "kalpavruksha", 1st Floor , 1st Cross, 2nd Main , KEB Layout BTM 1ST STSGE, bewngaluru - 560076&nbsp;&nbsp;&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Sri Srinivasa</td>
                                                <td width="121">Spring Hills</td>
                                                <td width="261">"# 45, 1st Floor, 18th Main, 3rd Sector, HSR Layout,<br /> &nbsp;Bengaluru - 560 102"</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">VR Infrastructures</td>
                                                <td width="121">VR Sai Brundavanam</td>
                                                <td width="261">#26, Akshaya dhama, 1st cross, Venugopal Reddy Layout, Sarvagna Road, Arekere, Bangalore - 76, Karnataka, INDIA</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">INFRATHON PROJECTS PVT LTD</td>
                                                <td width="121">Infrathon Ecofront</td>
                                                <td width="261">#45, 1st Floor, Industry House, Race Course Road, Bangalore - 560 001</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">RBD Shelters LLP</td>
                                                <td width="121">Private Apartments</td>
                                                <td width="261">"Tiara" # 682, 9th 'A' Main Road, Indira Nagar, 1st stageOpp. Oriental Bank of Commerce<br /> Bangalore - 560038</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">RBD Shelters LLP</td>
                                                <td width="121">Private Residences</td>
                                                <td width="261">"Tiara" # 682, 9th 'A' Main Road, Indira Nagar, 1st stageOpp. Oriental Bank of Commerce<br /> Bangalore - 560038</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">RBD Shelters LLP</td>
                                                <td width="121">Park Plaza (completed)</td>
                                                <td width="261">"Tiara" # 682, 9th 'A' Main Road, Indira Nagar, 1st stageOpp. Oriental Bank of Commerce<br /> Bangalore - 560038</td>
                                            </tr>
                                            <tr>
                                                <td width="53">&nbsp;</td>
                                                <td width="120">Shriram Land Development India Pvt Ltd</td>
                                                <td width="121">Shriram Hamsadwani</td>
                                                <td width="261">33-44, 1&amp;2,8th main ,4th cross, Sadashivanagar RMV extension, Bengaluru-560080</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">ASIAN BUILDERS</td>
                                                <td width="121">ASIAN LIFE STYLE</td>
                                                <td width="261">&nbsp;#21, First floor, asian business centre beside asian mall, gulbauga - 585102 phone No- 08472-256999 and 08472-254888</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">ASIAN BUILDERS</td>
                                                <td width="121">ASIAN GARDENIA</td>
                                                <td width="261">&nbsp;#21, First floor, asian business centre beside asian mall, gulbauga - 585102 phone No- 08472-256999 and 08472-254888</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">ASIAN BUILDERS</td>
                                                <td width="121">ASIAN MALL</td>
                                                <td width="261">&nbsp;#21, First floor, asian business centre beside asian mall, gulbauga - 585102 phone No- 08472-256999 and 08472-254888</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">ASIAN BUILDERS</td>
                                                <td width="121">ASIAN BUSINESS CENTRE</td>
                                                <td width="261">&nbsp;#21, First floor, asian business centre beside asian mall, gulbauga - 585102 phone No- 08472-256999 and 08472-254888</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">ASIAN BUILDERS</td>
                                                <td width="121">A.K ASIAN GRAND</td>
                                                <td width="261">&nbsp;#21, First floor, asian business centre beside asian mall, gulbauga - 585102 phone No- 08472-256999 and 08472-254888</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">ASIAN BUILDERS</td>
                                                <td width="121">ASIAN TOWER</td>
                                                <td width="261">&nbsp;#21, First floor, asian business centre beside asian mall, gulbauga - 585102 phone No- 08472-256999 and 08472-254888</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">ASIAN BUILDERS</td>
                                                <td width="121">ASIAN COMPLEX</td>
                                                <td width="261">&nbsp;#21, First floor, asian business centre beside asian mall, gulbauga - 585102 phone No- 08472-256999 and 08472-254888</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">ASIAN BUILDERS</td>
                                                <td width="121">ASIAN ARCADE</td>
                                                <td width="261">&nbsp;#21, First floor, asian business centre beside asian mall, gulbauga - 585102 phone No- 08472-256999 and 08472-254888</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">ASIAN BUILDERS</td>
                                                <td width="121">ASIAN RESIDENCY</td>
                                                <td width="261">&nbsp;#21, First floor, asian business centre beside asian mall, gulbauga - 585102 phone No- 08472-256999 and 08472-254888</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">ASIAN BUILDERS</td>
                                                <td width="121">ASIAN PLAZA</td>
                                                <td width="261">&nbsp;#21, First floor, asian business centre beside asian mall, gulbauga - 585102 phone No- 08472-256999 and 08472-254888</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">S R Constructions</td>
                                                <td width="121">ROYAL RESIDENCY</td>
                                                <td width="261">Add - S K Towers, culbarga karnataka 585102</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">S R Constructions</td>
                                                <td width="121">&nbsp;</td>
                                                <td width="261">Add - S K Towers, culbarga karnataka 585102</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">S R Constructions</td>
                                                <td width="121">S R Anmol</td>
                                                <td width="261">Add - S K Towers, culbarga karnataka 585102</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">S R Constructions</td>
                                                <td width="121">S R Embassy</td>
                                                <td width="261">Add - S K Towers, culbarga karnataka 585102</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">S R Constructions</td>
                                                <td width="121">S R Plaza</td>
                                                <td width="261">Add - S K Towers, culbarga karnataka 585102</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">S R Constructions</td>
                                                <td width="121">Crystal Residency</td>
                                                <td width="261">Add - S K Towers, culbarga karnataka 585102</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">S R Constructions</td>
                                                <td width="121">Crystal Plaza</td>
                                                <td width="261">Add - S K Towers, culbarga karnataka 585102</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">S R Constructions</td>
                                                <td width="121">High Court Bench</td>
                                                <td width="261">Add - S K Towers, culbarga karnataka 585102</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">S R Constructions</td>
                                                <td width="121">S K Tower.</td>
                                                <td width="261">Add - S K Towers, culbarga karnataka 585102</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">5 Elements Realty</td>
                                                <td width="121">Hillside</td>
                                                <td width="261">Add - S K Towers, culbarga karnataka 585102</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">5 Elements Realty</td>
                                                <td width="121">Ajantha prime</td>
                                                <td width="261">Add - S K Towers, culbarga karnataka 585102</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">5 Elements Realty</td>
                                                <td width="121">Silion citi</td>
                                                <td width="261">Add - S K Towers, culbarga karnataka 585102</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">5 Elements Realty</td>
                                                <td width="121">Lotus live pure</td>
                                                <td width="261">Add - S K Towers, culbarga karnataka 585102</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">5 Elements Realty</td>
                                                <td width="121">G R Luxuria</td>
                                                <td width="261">Add - S K Towers, culbarga karnataka 585102</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">SHANKESHWAR BUILDERS</td>
                                                <td width="121">Shubvastu Residency</td>
                                                <td width="261">Add : 1st floor, raj guru Ashish Complex mahaveer&nbsp; road bijapur, Karnataka - 586101</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td width="120">SHANKESHWAR BUILDERS</td>
                                                <td width="121">Shubvastu Residency</td>
                                                <td width="261">Add : 1st floor, raj guru Ashish Complex mahaveer&nbsp; road bijapur, Karnataka - 586101</td>
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
                <script>
               
              /*   document.getElementById("rectangle").onmouseover = function() {mouseOver()};
                document.getElementById("rectangle").onmouseout = function() {mouseOut()};

                function mouseOver() {
                	 document.getElementById("rectangle").style.width = "140px";
                  document.getElementById("rectangle").style.width = "140px";
                  document.getElementById("rectangle").style.height = "140px";
                  document.getElementById("rectangle").style.background = "#37CA90";
                }

                function mouseOut() {
                	document.getElementById("rectangle").style.width = "";
                    document.getElementById("rectangle").style.height = "";
                    document.getElementById("rectangle").style.background = "";
                } */
                
                
                function myFunction() {
                    var popup = document.getElementById("myPopup");
                    popup.classList.toggle("show");
                }
                </script>