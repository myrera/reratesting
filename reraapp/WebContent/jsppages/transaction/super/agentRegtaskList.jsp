<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<script>

$(document).ready(function() {
	var t=$('#allProjectList').DataTable({"columnDefs": [ {
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

<div class="breadcrumb">Home /Agent Task List</div>


<!--News Ticker-->
<div class="container">

<!--main container start here-->
<div class="Main_containner">

<!--Inner wrapper stsrt here-->
<div class="inner_wrapper tsklist">



<h1> Agent <span>Task List</span></h1>
<div class="drop_shadow"></div>
	<div class="clearfix"></div>
<h1>Total Requests : ${noOfPendingRequest} </h1>
<div class="table-responsive">
				
				
				<table class="table table-bordered" id="allProjectList">
        <thead>
            <tr>
            <th>S.NO</th>
             <th>APPLICATION NO</th>
                <th>AGENT NAME</th>
                <th>REGISTRATION TYPE</th>
                <th>REGISTRATION FEE</th>
                <th>PAYMENT MODE</th>
                <th>APPLICATION DATE</th>
                
            </tr>
        </thead>
        <tbody>
         <%int count=0; %>
        <c:forEach items="${agentList}" var="obj">
            <tr>
              <td>
            <%= ++count %> </td>
                     <td><a href="agentDetails?AGENT_ID=${obj.agentRegistrationID}"> ${obj.applicationNo } </a> </td>
           
                  <c:choose>
                  <c:when test="${obj.registrationType=='INDIVIDUAL_REG' }">
                  <td><a href="agentDetails?AGENT_ID=${obj.agentRegistrationID}"> ${obj.agentDetailsModel.agentName } </a> </td>
                <td>Individual</td>
                
                  </c:when>
                  <c:otherwise>
                  <td><a href="agentDetails?AGENT_ID=${obj.agentRegistrationID}"> ${obj.agentDetailsModel.firmName } </a></td>
                <td>Company/Firm</td>
                
                  </c:otherwise>
                  </c:choose>
                  
               
                <td>${obj.agentDetailsModel.regPaymentDetailsModel.amount }</td>
                <td>${obj.agentDetailsModel.regPaymentDetailsModel.paymentMode}
              
               </td>
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
