<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>

$(document).ready(
		function() {
			var t= $('#allProjectList').DataTable(
					{
						dom : 'Bfrtip',
						lengthMenu : [
								[ 10, 25, 50, -1 ],
								[ '10 rows', '25 rows', '50 rows',
										'Show all' ] ],
						buttons : [ 'pageLength', {
							extend : 'excel',
							text : 'Export Into Excel',
							title : 'Applications Approved'
						} ]
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
<div class="breadcrumb">Home /Approved Agent List</div>


<!--News Ticker-->
<div class="container">

<!--main container start here-->
<div class="Main_containner">

<!--Inner wrapper stsrt here-->
<div class="inner_wrapper tsklist">



<h1>View All Approved  <span>Agents List</span></h1>
<div class="drop_shadow"></div>


	<div class="clearfix"></div>
<h1>Total Records : ${totalRecords} </h1>

<form action="" >



</form>



<div class="table-responsive">
				
				
				<table class="table table-bordered" id="allProjectList">
        <thead>
            <tr>
            <th>S.NO</th>  
           		 <th>REGISTRATION NO</th>
                <th>AGENT NAME</th>
                <th>REGISTRATION TYPE</th>
                <th>APPROVED BY </th>
                <th>APPROVED ON </th>
                
            </tr>
        </thead>
        <tbody>
        <%int count=0; %>
        <c:forEach items="${agentList}" var="obj">
            <tr>
            <td><%= ++count %>
                   <td>${obj.agentRegistrationNo }</td>
                  <c:choose>
                  <c:when test="${obj.registrationType=='INDIVIDUAL_REG' }">
                  <td><a href="agentDetailsPage?AGENT_ID=${obj.agentRegistrationID}"> ${obj.agentDetailsModel.agentName } </a> </td>
                <td>Individual</td>
                
                  </c:when>
                  <c:otherwise>
                  <td><a href="agentDetailsPage?AGENT_ID=${obj.agentRegistrationID}"> ${obj.agentDetailsModel.firmName } </a></td>
                <td>Company/Firm</td>
                
                  </c:otherwise>
                  </c:choose>
                  
               
                 <td>${obj.approvedBy.userName }</td>
                
                   <td>
                     <c:set var = "crdt" value = "${obj.approvedOn.time}" />
                 
                  <fmt:formatDate type="date"  pattern="dd-MM-yyyy" dateStyle="short" value="${crdt}"/>
                 </td>
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
