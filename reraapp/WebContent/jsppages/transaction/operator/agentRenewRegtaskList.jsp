<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


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



<h1> Task List<span>(Registration Renewal)</span></h1>
<div class="drop_shadow"></div>
	<div class="clearfix"></div>
<h1>Total Requests : ${noOfPendingRequest} </h1>

<div class="table-responsive">
				
				
				<table class="table table-bordered" id="agentRenewalTasklist">
        <thead>
            <tr>
                <th> S.NO</th>
                <th>Registration No.</th>
                <th>Agent Name</th>
                 <th>Registration Validity</th>
                <th>REGISTRATION FEE </th>
                <th>PAY MODE</th>
                <th>APPLICATION DATE </th>
                
            </tr>
        </thead>
        <tbody>
       <% int count=0; %>
        <c:forEach items="${agentRenwalList}" var="obj">
        <c:set var = "crdt" value = "${obj.createdOn.time}"/>
        
        <tr >
            	<td> <%= ++count %><p id="taskalertpending"><b><font style="vertical-align:super;font-size:8px;color:red">PENDING</font></b></p></td>
              	<td><a href="agentDetails?AGENT_ID=${obj.agentRegistrationID}"> ${obj.applicationNo } </a> </td>
                  <c:choose>
                  <c:when test="${obj.registrationType=='INDIVIDUAL_REG' }">
                  	<td><a href="agentDetails?AGENT_ID=${obj.agentRegistrationID}"> ${obj.agentDetailsModel.agentName } </a> </td>
                	<td> ${obj.agentDetailsModel.agentEmailId } </td>
                	<td>Individual</td>
                  </c:when>
                  <c:otherwise>
                  	<td><a href="agentDetails?AGENT_ID=${obj.agentRegistrationID}"> ${obj.agentDetailsModel.firmName } </a></td>
                    <td> ${obj.agentDetailsModel.firmEmail } </td>
                	<td>Company/Firm</td>
                  </c:otherwise>
                  </c:choose>
                <td>${obj.agentDetailsModel.regPaymentDetailsModel.amount }</td>
                <td>${obj.agentDetailsModel.regPaymentDetailsModel.paymentMode}</td>
                <td><fmt:formatDate type="date"  pattern="dd-MM-yyyy" dateStyle="short" value="${crdt}"/></td>
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
