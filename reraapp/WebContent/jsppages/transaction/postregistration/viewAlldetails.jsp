<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>

$(document).ready(
        function() {
            var t= $('#allProjectList').DataTable({
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
<div class="breadcrumb"><!-- Home /Approved Project List --></div>


<!--News Ticker-->
<div class="container">

<!--main container start here-->
<div class="Main_containner">

<!--Inner wrapper stsrt here-->
<div class="inner_wrapper tsklist">



<center><h1>All Approved Project <span>List</span></h1></center>
<div class="drop_shadow"></div>
	<div class="clearfix"></div><%-- 
<h1>Total Records : ${totalRecords} </h1> --%>

<form action="">

</form>
<div class="table-responsive">
				
				
				<table class="table table-bordered" id="allProjectList">
        <thead>
            <tr>
            <th>S.NO</th>
            	<th>REGISTRATION NO</th>
                <th>PROJECT</th>
                 <th>PROJECT STATUS</th>  
                
                
            </tr>
        </thead>
        <tbody>
        <%int count=0; %>


        <c:forEach items="${projectList}" var="obj">
            <tr>
             <td><%= ++count %></td>
             <td> <a href="postRegDetailsPage?PROJECT_ID=${obj.projectRegId}"> ${obj.projectRegistrationNo }</a></td>
                  <td>${obj.projectDetailsModel.projectName }  </td>
                  <td>${obj.projectDetailsModel.projectStatus}</td>
                   
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
