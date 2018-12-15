<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<script>
$(document).ready(function() {
	var t=$('#projectExtTasklist').DataTable({"columnDefs": [ {
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
} );
</script>


<div class="breadcrumb">Home /Task List</div>

<!--main container start here-->
<div class="Main_containner">

<!--Inner wrapper stsrt here-->
<div class="inner_wrapper tsklist">



<h1>Task List<span>(Project Extension)</span></h1>
<div class="drop_shadow"></div>
	<div class="clearfix"></div>
<h1>Total Project(s) : ${noOfPendingRequest} </h1>
<div class="table-responsive">
				
				
				<table class="table table-bordered" id="projectExtTasklist">
        <thead>
            <tr>
            <th>S.NO</th>
                	<th>APPLICATION NO</th>
                 <th>REGISTRATION VALIDITY</th>
                <th>EXTEND DATE</th>
                 <th>PROJECT</th>
                  <th>PROJECT STATUS</th>   
                <th>PROMOTER</th>
                <th>REGISTRATION FEE </th>
                <th>PAY MODE</th>
                <th>PENALTY PAID:?</th>
                <th>APPLICATION DATE </th>
                
            </tr>
        </thead>
        <tbody>
         <%int count=0; %>
        <c:forEach items="${projectExtList}" var="obj">
            <tr>
              <td><%= ++count %></td>
                  <td> <a href="projectExtDetails?PROJECT_ID=${obj.projectExtId}"> ${obj.projectRegistration.applicationNo } </a></td>
             
                <td>${obj.projectRegistration.approvedOn.time } To ${obj.projectRegistration.expireDate.time }</td>
                <td>${obj.extendToDate.time }</td>
                  <td>${obj.projectRegistration.projectDetailsModel.projectName }</td>
                  <td>${obj.projectDetailsModel.projectStatus}</td>
                <td>${obj.projectRegistration.promoterDetailsModel.promoterName }</td>
                 <td>${obj.paymentDetailsModel.amount }</td>
                <td>${obj.paymentDetailsModel.paymentMode}</td>
                 <td>${obj.paymentDetailsModel.penaltyPaid}</td>
                <td>${obj.createdOn.time }</td>
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
