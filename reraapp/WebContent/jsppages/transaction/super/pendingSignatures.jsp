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
    				        "order": [[ 2, 'asc' ]]
    						
    						});
    				
    				 t.on( 'order.dt search.dt', function () {
    				        t.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
    				            cell.innerHTML = i+1;
    				        } );
    				    } ).draw();

    			});
                </script>



<h1>Task List<span> ( Pending Approvals )</span></h1>
<div class="drop_shadow"></div>
	<div class="clearfix"></div>
<h1>Total Project(s) : ${noOfPendingRequest} </h1>

<font color="RED">${ERROR_MSG}</font>
<div class="table-responsive">
				
				
				<table class="table table-bordered" id="projectTaskList1">
        <thead>
            <tr>
                <th>Select</th>
                <th>APPLICATION NUMBER</th>
                  <th>PROJECT</th>
                     <th>PROJECT STATUS</th>
                <th>PROMOTER</th>
                <th>PROMOTER TYPE</th>
                 <th>PROPERTY TYPE</th>
                <th>REGISTRATION FEE </th>
                <th>PAY MODE</th>
                <th>PENALTY PAID:?</th>
                <th>APPLICATION DATE </th>
                
            </tr>
        </thead>
        <tbody>
        <%int count=0; %>
  <c:forEach items="${projectList}" var="obj">
	
			<tr >
				<td><input type="checkbox" class="checkdoc" value="${obj.projectRegId}" name="projectIds"></td>
				<td><a
					href="projectDetails?PROJECT_ID=${obj.projectRegId}">
						${obj.applicationNo } </a></td>
				<td><a
					href="projectDetails?PROJECT_ID=${obj.projectRegId}">${obj.projectDetailsModel.projectName } </a></td>
				<td>${obj.projectDetailsModel.projectStatus}</td>
				<td>${obj.promoterDetailsModel.promoterName }</td>
				<td>${obj.registrationType}</td>
				<td>${obj.projectDetailsModel.projectType }</td>
				<td>${obj.paymentDetailsModel.amount }</td>
				<td>${obj.paymentDetailsModel.paymentMode}</td>
				<td>${obj.paymentDetailsModel.penaltyPaid}</td>
				<td><c:set var="crdt" value="${obj.createdOn.time}" />
				 <fmt:formatDate type="date" pattern="dd-MM-yyyy" dateStyle="short"	value="${crdt}" />
				</td>
			</tr>
		
		
		
</c:forEach>
        </tbody>
    </table>
			</div>

	<form:form method="post" action="approve"
	id="downloadForm" name="downloadForm" autocomplete="off">

	<input type="hidden" name="projectIds">
<input name="btn1" class="btn-style" id="DownloadDocButton"
	value="Approve" type="button" onclick="getValue()" />

</form:form>
		
	
	

<!--search list main end here-->	
</div>

    


<!--inner container end here-->
	</div>




<!-- container end here-->

</div>
	</div>
	
	
	
	
<script>




function getValue(){

/* declare an checkbox array */

var chkArray = [];

/* look for all checkboes that have a class 'chk' attached to it and
check if it was checked */

$(".checkdoc:checked").each(function() {

chkArray.push($(this).val());

});

var selected;

selected = chkArray.join(',') ;


/* check if there is selected checkboxes, by default the length is 1
as it contains one single comma */

if(selected.length > 0){

document.getElementById('downloadForm').projectIds.value=selected;


document.getElementById('downloadForm').submit();

}else{

alert("Please select projects to approve");

}

}

</script>
