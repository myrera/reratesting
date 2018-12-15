<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>




<div class="breadcrumb">Home /Task List</div>


<!--News Ticker-->
<div class="container">

<!--main container start here-->
<div class="Main_containner">

<!--Inner wrapper start here-->
<div class="inner_wrapper tsklist">


                <script>
                    $(document).ready(
                        function() {
                           var t= $('#reportList').DataTable({
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
                                    title: 'Report List'
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



<h1>Report For<span> Problem List</span></h1>
<div class="drop_shadow"></div>
	<div class="clearfix"></div>

<div class="table-responsive">
				
				
				<table class="table table-bordered" id="reportList">
        <thead>
            <tr>
                <th>S.NO</th>
                
                  <th>PROJECT NAME</th>
                     <th>PROMOTER NAME</th>
                <th>PROMOTER CONTACT </th>
                <th>STATUS</th>
                <th>REPORTER CONTACT</th>
                 <th>REPORTER EMAIL</th>
               
                
            </tr>
        </thead>
        <tbody>
        <%int count=0; %>
        <c:forEach items="${reportList}" var="obj">
        <c:if test="${obj.status != null}">
            <tr>
            <td><%= ++count %></td>
              <td><a href="unregisteredProjectDetails?reportId=${obj.reportId}">${obj.projectName}</a></td>
              <td>${obj.promoterName}</td>
              <td>${obj.promoterMobileNo}</td>
              <td>${obj.status}</td>
              <td>${obj.mobileNo}</td>
              <td>${obj.email}</td>
                 
                
            </tr>
            </c:if>
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
