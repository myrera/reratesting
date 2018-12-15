<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>




<div class="breadcrumb">All Approved projects to RERA</div>


<!--News Ticker-->
<div class="container">

<!--main container start here-->
<div class="Main_containner">

<!--Inner wrapper start here-->
<div class="inner_wrapper tsklist">


                <script>
                    $(document).ready(
                        function() {
                           var t= $('#projectTaskList').DataTable({
                                dom: 'Bfrtip',
                                lengthMenu: [
                                    [10, 25, 50, -1],
                                    ['10 rows', '25 rows', '50 rows',
                                        'Show all'
                                    ]
                                ],
                                buttons: ['pageLength', {
                                    extend: 'excel',
                                    text: 'Export Into Excel',
                                    title: 'Applications Approved'
                                }]
                            ,
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



<h1><span> All Approved Projects</span></h1>
<div class="drop_shadow"></div>
	<div class="clearfix"></div>
<h1>Total Project(s) : ${noOfPendingRequest} </h1>
<div class="table-responsive">
				
				
				<table class="table table-bordered" id="projectTaskList">
        <thead>
						<tr>
							<th>S.NO</th>
							<th>APPLICATION NUMBER</th>
							<th>PROJECT NAME</th>
							<th>PROMOTER NAME</th>
							<th>DISTRICT</th>
							<th>TALUK</th>
							<th>ADDRESS</th>
						</tr>
					</thead>
        <tbody>
        <%
        	int count = 0;
        %>
        <c:forEach items="${projectList}" var="obj">
            <tr>
            <td><%= ++count %></td>
              <td> <a href="<%=request.getContextPath()%>/publicDomain/projectDetails?PROJECT_ID=${obj.projId}"> ${obj.applicationNo } </a></td>
             
                  <td> <a href="<%=request.getContextPath()%>/publicDomain/projectDetails?PROJECT_ID=${obj.projId}"> ${obj.projectDetailsModel.projectName }  </a></td>
                <td>${obj.promoterDetailsModel.promoterName }</td>
                <td>${obj.projectDetailsModel.districtModel.districtName }</td>
                <td>  ${obj.projectDetailsModel.subDistrictModel.subDistrictName}
                 </td>
                <td><p>${obj.projectDetailsModel.addressLine1}, ${obj.projectDetailsModel.addressLine2}</td>
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
