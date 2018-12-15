<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script>
$(document).ready(function() {
	var t=$('#agentRenewalTasklist').DataTable({"columnDefs": [ {
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


<div class="breadcrumb">Home /Agent Renewal Task List</div>


<!--News Ticker-->
<div class="container">

<!--main container start here-->
<div class="Main_containner">

<!--Inner wrapper stsrt here-->
<div class="inner_wrapper tsklist">



<h1> Agent Renewal <span>Task List</span></h1>
<div class="drop_shadow"></div>
	<div class="clearfix"></div>
<h1>Total Requests : ${noOfPendingRequest} </h1>
<div class="table-responsive">
				
				
				<table class="table table-bordered" id="agentRenewalTasklist">
        <thead>
            <tr>
                <th>S.NO</th>
                <th>APPLICATION No.</th>
                <th>AGENT NAME</th>
                 <th>REGISTRATION VALIDITY</th>
                <th>REGISTRATION FEE </th>
                <th>PAY MODE</th>
                <th>APPLICATION DATE </th>
                
            </tr>
        </thead>
        <tbody>
        <%int count=0; %>
        <c:forEach items="${agentRenwalList}" var="obj">
            <tr>
            <td> <%= ++count %></td>
               <td><a href="agentRenewalDetails?AGENTREQ_ID=${obj.agentRegLogId}"> ${obj.agentRegistration.applicationNo}</a></td>
                  
                  <c:choose>
                  <c:when test="${obj.agentRegistration.registrationType=='INDVISUAL_REG' }">
                  <td>${obj.agentRegistration.agentDetailsModel.agentName } </td>
              
                  </c:when>
                  <c:otherwise>
                  <td>${obj.agentRegistration.agentDetailsModel.firmName } </td>
               
                  </c:otherwise>
                  </c:choose>
                    <td>${obj.agentRegistration.approvedOn.time } To ${obj.agentRegistration.expireDate.time } </td>
               
                <td>${obj.regPaymentDetailsModel.amount }</td>
                <td>${obj.regPaymentDetailsModel.paymentMode}
              
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
