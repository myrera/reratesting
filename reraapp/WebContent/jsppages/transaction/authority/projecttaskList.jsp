<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>


<div class="breadcrumb">Home /Task List</div>


<!--News Ticker-->
<div class="container">

<!--main container start here-->
<div class="Main_containner">

<!--Inner wrapper start here-->
<div class="inner_wrapper tsklist">


                <script>
                document.getElementById("taskalertpending").innerHTML="PENDING";
                
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

<% int pendingcount=0; %>
<jsp:useBean id="now" class="java.util.Date"/>
        <fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="today" scope="request"/>
<c:forEach items="${projectList}" var="obj">
<c:set var = "crdt" value = "${obj.createdOn.time}"/>
        <fmt:parseNumber value="${crdt.time / (1000*60*60*24)}" integerOnly="true" var="created" scope="request"/>
        <c:if test="${today-created gt 2}">
<%++pendingcount; %>
</c:if>
</c:forEach>


<h1>Task List<span> (New Projects)</span></h1>
<div class="drop_shadow"></div>
	<div class="clearfix"></div>
<h1>Total Project(s) : ${noOfPendingRequest} </h1>
<h1>Total Pending Project(s) <span>For Verification : </span><%=pendingcount%></h1>
<div class="table-responsive">
				
				
				<table class="table table-bordered" id="projectTaskList">
        <thead>
            <tr>
                <th>S.NO</th>
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
  <c:set var = "crdt" value = "${obj.createdOn.time}"/>
        <fmt:parseNumber value="${crdt.time / (1000*60*60*24)}" integerOnly="true" var="created" scope="request"/>
        <c:choose>
        <c:when test="${today-created gt 2}">
        
	<c:choose>
		<c:when test="${obj.projectRemarks.revenueVerificationStatus =='OK' && obj.projectRemarks.accountsVerificationStatus =='OK'
  					&& obj.projectRemarks.tcpVerificationStatus =='OK' && obj.projectRemarks.enggVerificationStatus =='OK' }">
			<tr style="background-color:#B8FCBD;">
				<td><%= ++count %><blink id="taskalertpending"><b><font style="vertical-align:super;font-size:8px;color:red">PENDING</font></b></blink> </td>
				<td><a
					href="projectDetails?PROJECT_ID=${obj.projectRegId}">
						${obj.applicationNo } </a></td>
				<td><a href="projectDetails?PROJECT_ID=${obj.projectRegId}">${obj.projectDetailsModel.projectName}</a></td>
				<td>${obj.projectDetailsModel.projectStatus}</td>
				<td>${obj.promoterDetailsModel.promoterName }</td>
				<td>${obj.registrationType}</td>
				<td>${obj.projectDetailsModel.projectType }</td>
				<td>${obj.paymentDetailsModel.amount }</td>
				<td>${obj.paymentDetailsModel.paymentMode}</td>
				<td>${obj.paymentDetailsModel.penaltyPaid}</td>
				<td><fmt:formatDate type="date" pattern="dd-MM-yyyy" dateStyle="short"	value="${crdt}" /></td>
			</tr>
		</c:when>
		<c:when
			test="${obj.projectRemarks.revenueVerificationStatus =='NOT OK' && obj.projectRemarks.accountsVerificationStatus =='NOT OK'
            && obj.projectRemarks.tcpVerificationStatus =='NOT OK' && obj.projectRemarks.enggVerificationStatus =='NOT OK' }">
			<tr style="background-color:#FDDDD4;">
				<td><%= ++count %><blink id="taskalertpending"><b><font style="vertical-align:super;font-size:8px;color:red">PENDING</font></b></blink> </td>
				<td><a href="projectDetails?PROJECT_ID=${obj.projectRegId}"> ${obj.applicationNo } </a></td>
				<td><a	href="projectDetails?PROJECT_ID=${obj.projectRegId}">${obj.projectDetailsModel.projectName } </a></td>
				<td>${obj.projectDetailsModel.projectStatus}</td>
				<td>${obj.promoterDetailsModel.promoterName }</td>
				<td>${obj.registrationType}</td>
				<td>${obj.projectDetailsModel.projectType }</td>
				<td>${obj.paymentDetailsModel.amount }</td>
				<td>${obj.paymentDetailsModel.paymentMode}</td>
				<td>${obj.paymentDetailsModel.penaltyPaid}</td>
				<td><fmt:formatDate type="date" pattern="dd-MM-yyyy" dateStyle="short" value="${crdt}" /></td>
			</tr>
		</c:when>
		<c:otherwise>
		<tr>
			<td><%=++count%><blink id="taskalertpending"><b><font style="vertical-align:super;font-size:8px;color:red">PENDING</font></b></blink> </td>
			<td><a href="projectDetails?PROJECT_ID=${obj.projectRegId}">${obj.applicationNo } </a></td>
			<td><a href="projectDetails?PROJECT_ID=${obj.projectRegId}">${obj.projectDetailsModel.projectName } </a></td>
			<td>${obj.projectDetailsModel.projectStatus}</td>
			<td>${obj.promoterDetailsModel.promoterName }</td>
			<td>${obj.registrationType}</td>
			<td>${obj.projectDetailsModel.projectType }</td>
			<td>${obj.paymentDetailsModel.amount }</td>
			<td>${obj.paymentDetailsModel.paymentMode}</td>
			<td>${obj.paymentDetailsModel.penaltyPaid}</td>
			<td><fmt:formatDate type="date" pattern="dd-MM-yyyy" dateStyle="short" value="${crdt}" /></td>
		</tr>
		</c:otherwise>
	</c:choose>
	</c:when>
	<c:otherwise>
	<c:choose>
		<c:when test="${obj.projectRemarks.revenueVerificationStatus =='OK' && obj.projectRemarks.accountsVerificationStatus =='OK'
  					&& obj.projectRemarks.tcpVerificationStatus =='OK' && obj.projectRemarks.enggVerificationStatus =='OK' }">
			<tr style="background-color:#B8FCBD;">
				<td><%= ++count %></td>
				<td><a
					href="projectDetails?PROJECT_ID=${obj.projectRegId}">
						${obj.applicationNo } </a></td>
				<td><a href="projectDetails?PROJECT_ID=${obj.projectRegId}">${obj.projectDetailsModel.projectName}</a></td>
				<td>${obj.projectDetailsModel.projectStatus}</td>
				<td>${obj.promoterDetailsModel.promoterName }</td>
				<td>${obj.registrationType}</td>
				<td>${obj.projectDetailsModel.projectType }</td>
				<td>${obj.paymentDetailsModel.amount }</td>
				<td>${obj.paymentDetailsModel.paymentMode}</td>
				<td>${obj.paymentDetailsModel.penaltyPaid}</td>
				<td><fmt:formatDate type="date" pattern="dd-MM-yyyy" dateStyle="short"	value="${crdt}" /></td>
			</tr>
		</c:when>
		<c:when
			test="${obj.projectRemarks.revenueVerificationStatus =='NOT OK' && obj.projectRemarks.accountsVerificationStatus =='NOT OK'
            && obj.projectRemarks.tcpVerificationStatus =='NOT OK' && obj.projectRemarks.enggVerificationStatus =='NOT OK' }">
			<tr style="background-color:#FDDDD4;">
				<td><%= ++count %></td>
				<td><a href="projectDetails?PROJECT_ID=${obj.projectRegId}"> ${obj.applicationNo } </a></td>
				<td><a	href="projectDetails?PROJECT_ID=${obj.projectRegId}">${obj.projectDetailsModel.projectName } </a></td>
				<td>${obj.projectDetailsModel.projectStatus}</td>
				<td>${obj.promoterDetailsModel.promoterName }</td>
				<td>${obj.registrationType}</td>
				<td>${obj.projectDetailsModel.projectType }</td>
				<td>${obj.paymentDetailsModel.amount }</td>
				<td>${obj.paymentDetailsModel.paymentMode}</td>
				<td>${obj.paymentDetailsModel.penaltyPaid}</td>
				<td><fmt:formatDate type="date" pattern="dd-MM-yyyy" dateStyle="short" value="${crdt}" /></td>
			</tr>
		</c:when>
		<c:otherwise>
		<tr>
			<td><%=++count%></td>
			<td><a href="projectDetails?PROJECT_ID=${obj.projectRegId}">${obj.applicationNo } </a></td>
			<td><a href="projectDetails?PROJECT_ID=${obj.projectRegId}">${obj.projectDetailsModel.projectName } </a></td>
			<td>${obj.projectDetailsModel.projectStatus}</td>
			<td>${obj.promoterDetailsModel.promoterName }</td>
			<td>${obj.registrationType}</td>
			<td>${obj.projectDetailsModel.projectType }</td>
			<td>${obj.paymentDetailsModel.amount }</td>
			<td>${obj.paymentDetailsModel.paymentMode}</td>
			<td>${obj.paymentDetailsModel.penaltyPaid}</td>
			<td><fmt:formatDate type="date" pattern="dd-MM-yyyy" dateStyle="short" value="${crdt}" /></td>
		</tr>
		</c:otherwise>
	</c:choose>
	</c:otherwise>
	</c:choose>
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
	</body>
	</html>
