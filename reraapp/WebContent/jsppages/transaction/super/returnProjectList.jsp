<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>

$(document).ready(
        function() {
            var t=$('#allProjectList').DataTable({
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
<div class="breadcrumb">Home /Project List</div>


<!--News Ticker-->
<div class="container">


<br>

<!--main container start here-->
<div class="Main_containner">


<!--Inner wrapper stsrt here-->
<div class="inner_wrapper tsklist">



<h1>Task List<span>(Returned and Updated)</span></h1>
<div class="drop_shadow"></div>
	<div class="clearfix"></div>
	
	<h1>Total Project(s) : ${noOfPendingRequest} </h1>
	
	
	


<!-- 
<div class="drop_shadow"></div>
	<div class="clearfix"></div>	
	


 -->
<div class="table-responsive">
				
				
				<table class="table table-bordered" id="allProjectList">
        <thead>
            <tr>
            	<th>S.NO</th>
            	<th>APPLICATION NO</th>
                <th>PROJECT</th>
                 <th>PROJECT STATUS</th>   
                <th>PROMOTER</th>
                <th>PROMOTTER TYPE</th>
                <th>PROPERTY TYPE</th>
                <th>STATUS </th>
                <th>PENALTY PAID:?</th>
                <th>APPLICATION DATE </th>
                
            </tr>
        </thead>
        <tbody>
       <% int count=0; %>
        <c:forEach items="${projectList}" var="obj">
            <tr>
            <td>  <%= ++count %> </td>
             <td><a href="projectDetails?PROJECT_ID=${obj.projectRegId}">${obj.applicationNo}</a></td>
                  <td>  ${obj.projectDetailsModel.projectName } </td>
                  <td>${obj.projectDetailsModel.projectStatus}</td>
                <td>${obj.promoterDetailsModel.promoterName }</td>
                <td>${obj.registrationType }</td>
                <td>${obj.projectDetailsModel.projectType }</td>
                <td>${obj.status }</td>
                 <td>${obj.paymentDetailsModel.penaltyPaid}</td>
                
                     <td>
                      <c:set var = "crdt" value = "${obj.createdOn.time}" />
                 
                  <fmt:formatDate type="date"  pattern="dd-MM-yyyy" dateStyle="short" value="${crdt}"/>
                 </td>
            </tr>
            
              
	 
           </c:forEach>
          
        </tbody>
    </table>
	


<!--search list main end here-->	
</div>

    


<!--inner container end here-->
	</div>




<!-- container end here-->

</div>

</div>

<script>

function submitfrm(){
	var _frm=$('#trxForm');
	if(validateForm(_frm)){
		$(_frm).submit();
	}
}
</script>

