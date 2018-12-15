<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<link rel="shortcut icon" type="image/ico" href="http://www.datatables.net/favicon.ico">

<script>
document.getElementById("taskalertpending").innerHTML="PENDING";

$(document).ready(function() {
	var t=$('#projectUpdateTasklist').DataTable({"columnDefs": [ {
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


<!--News Ticker-->
<div class="container">

<!--main container start here-->
<div class="Main_containner">

<!--Inner wrapper stsrt here-->
<div class="inner_wrapper tsklist">

<% int pendingcount=0; %>
<jsp:useBean id="now" class="java.util.Date"/>
        <fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="today" scope="request"/>
<c:forEach items="${projectList}" var="obj">
<c:set var = "crdt" value = "${obj.createdOn.time}"/>
        <fmt:parseNumber value="${crdt.time / (1000*60*60*24)}" integerOnly="true" var="created" scope="request"/>
        <c:if test="${today-created gt 3}">
<%++pendingcount; %>
</c:if>
</c:forEach>

<h1>Task List <span>(Updated Registration)</span></h1>
<div class="drop_shadow"></div>
	<div class="clearfix"></div>
<h1>Total Project(s) : ${noOfPendingRequest} </h1>
<h1>Total Pending Project(s) :  <%=pendingcount%></h1>
<div class="table-responsive">
				
				
				<table class="table table-bordered" id="projectUpdateTasklist">
        <thead>
            <tr>
            <th>S.NO</th>
             <th>APPLICATION NUMBER</th>
                <th>PROJECT</th>
                <th>PROMOTER</th>
                  <th>EMAIL ID</th>
                <th>PROMOTER TYPE</th>
                 <th>PROPERTY TYPE</th>
                <th>REGISTRATION FEE </th>
                <th>PAY MODE</th>
                <th>UPDATED ON </th>
                
            </tr>
        </thead>
        <tbody>
        <%int count=0; %>
        <c:forEach items="${projectList}" var="obj">
        <c:set var = "crdt" value = "${obj.createdOn.time}"/>
            <fmt:parseNumber value="${crdt.time / (1000*60*60*24)}" integerOnly="true" var="created" scope="request"/>
        <c:choose>
        <c:when test="${today-created gt 3}">
        <tr id="taskalertcolor" >     
            	<td><%= ++count %><p id="taskalertpending"><b><font style="vertical-align:super;font-size:8px;color:red">PENDING</font></b></p></td>
            	<td> <a href="projectDetails?PROJECT_ID=${obj.projectRegId}"> ${obj.applicationNo } </a></td>
                <td> <a href="projectDetails?PROJECT_ID=${obj.projectRegId}"> ${obj.projectDetailsModel.projectName } </a></td>
                <td>${obj.promoterDetailsModel.promoterName }</td>
                <td>${obj.promoterDetailsModel.emailId }</td>
                <td>${obj.registrationType }</td>
                <td>${obj.projectDetailsModel.projectType }</td>
                <td>${obj.paymentDetailsModel.amount }</td>
                <td>${obj.paymentDetailsModel.paymentMode}</td>
                <td><fmt:formatDate type="date"  pattern="dd-MM-yyyy" dateStyle="short" value="${crdt}"/>
                </td>
            </tr>
        </c:when>
        <c:otherwise>
        <tr>     
            	<td><%= ++count %></td>
            	<td> <a href="projectDetails?PROJECT_ID=${obj.projectRegId}"> ${obj.applicationNo } </a></td>
                <td> <a href="projectDetails?PROJECT_ID=${obj.projectRegId}"> ${obj.projectDetailsModel.projectName } </a></td>
                <td>${obj.promoterDetailsModel.promoterName }</td>
                <td>${obj.promoterDetailsModel.emailId }</td>
                <td>${obj.registrationType }</td>
                <td>${obj.projectDetailsModel.projectType }</td>
                <td>${obj.paymentDetailsModel.amount }</td>
                <td>${obj.paymentDetailsModel.paymentMode}</td>
                <td><fmt:formatDate type="date"  pattern="dd-MM-yyyy" dateStyle="short" value="${crdt}"/>
                </td>
            </tr>
        
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
	</div>
