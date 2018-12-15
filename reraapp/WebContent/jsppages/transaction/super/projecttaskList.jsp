<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<script>
$(document).ready(function() {
	var t=$('#projectList').DataTable({"columnDefs": [ {
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

<!--Inner wrapper start here-->
<div class="inner_wrapper tsklist">



<h1>Task List<span> (New Projects)</span></h1>
<div class="drop_shadow"></div>
	<div class="clearfix"></div>
<h1>Total Project(s) : ${noOfPendingRequest} </h1>
<div class="table-responsive">
				
				
				<table class="table table-bordered" id="projectList">
        <thead>
            <tr>
            <th>S.NO</th>
                <th>APPLICATION NO</th>
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
        <c:choose>
		<c:when test="${obj.projectRemarks.underSecVerificationStatus =='OK' }">
			<tr style="background-color:#B8FCBD;">
            <td>
            <%= ++count %> </td>
              <td> <a href="projectDetails?PROJECT_ID=${obj.projectRegId}"> ${obj.applicationNo } </a></td>
             
                  <td> <a href="projectDetails?PROJECT_ID=${obj.projectRegId}"> ${obj.projectDetailsModel.projectName }  </a></td>
                 <td>${obj.projectDetailsModel.projectStatus}</td>
                <td>${obj.promoterDetailsModel.promoterName }</td>
 				<td>${obj.projectDetailsModel.projectType }</td>
                <td>${obj.registrationType }</td>
                <td>${obj.projectDetailsModel.projectType }</td>
                <td>${obj.paymentDetailsModel.amount }</td>
                <td>
                ${obj.paymentDetailsModel.paymentMode}
               
               </td>
               
                 <td>
                   <c:set var = "crdt" value = "${obj.createdOn.time}" />
                 
                  <fmt:formatDate type="date"  pattern="dd-MM-yyyy" dateStyle="short" value="${crdt}"/>
                 </td>
            </tr>
		</c:when>
		<c:when
			test="${obj.projectRemarks.underSecVerificationStatus =='NOT OK'}">
			<tr style="background-color:#FDDDD4;">
            <td>
            <%= ++count %> </td>
              <td> <a href="projectDetails?PROJECT_ID=${obj.projectRegId}"> ${obj.applicationNo } </a></td>
             
                  <td> <a href="projectDetails?PROJECT_ID=${obj.projectRegId}"> ${obj.projectDetailsModel.projectName }  </a></td>
                 <td>${obj.projectDetailsModel.projectStatus}</td>
                <td>${obj.promoterDetailsModel.promoterName }</td>
 				<td>${obj.projectDetailsModel.projectType }</td>
                <td>${obj.registrationType }</td>
                <td>${obj.projectDetailsModel.projectType }</td>
                <td>${obj.paymentDetailsModel.amount }</td>
                <td>
                ${obj.paymentDetailsModel.paymentMode}
               
               </td>
               
                 <td>
                   <c:set var = "crdt" value = "${obj.createdOn.time}" />
                 
                  <fmt:formatDate type="date"  pattern="dd-MM-yyyy" dateStyle="short" value="${crdt}"/>
                 </td>
            </tr>
		</c:when>
		<c:otherwise>
		<tr>
            <td>
            <%= ++count %> </td>
              <td> <a href="projectDetails?PROJECT_ID=${obj.projectRegId}"> ${obj.applicationNo } </a></td>
             
                  <td> <a href="projectDetails?PROJECT_ID=${obj.projectRegId}"> ${obj.projectDetailsModel.projectName }  </a></td>
                 <td>${obj.projectDetailsModel.projectStatus}</td>
                <td>${obj.promoterDetailsModel.promoterName }</td>
 				<td>${obj.projectDetailsModel.projectType }</td>
                <td>${obj.registrationType }</td>
                <td>${obj.projectDetailsModel.projectType }</td>
                <td>${obj.paymentDetailsModel.amount }</td>
                <td>
                ${obj.paymentDetailsModel.paymentMode}
               
               </td>
               
                 <td>
                   <c:set var = "crdt" value = "${obj.createdOn.time}" />
                 
                  <fmt:formatDate type="date"  pattern="dd-MM-yyyy" dateStyle="short" value="${crdt}"/>
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
