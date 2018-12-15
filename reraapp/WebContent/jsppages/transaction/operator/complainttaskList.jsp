<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<div class="breadcrumb">Home /Task List</div>


<!--News Ticker-->
<div class="container">

<!--main container start here-->
<div class="Main_containner">

<!--Inner wrapper stsrt here-->
<div class="inner_wrapper tsklist">



<h1>Task <span>List</span></h1>
<div class="drop_shadow"></div>
	<div class="clearfix"></div>
<h1>Pending Requests : ${noOfPendingRequest} </h1>
<div class="table-responsive">
				
				
				<table class="table table-bordered">
        <thead>
            <tr>
                <th>COMPLAINT NO</th>
                <th>COMPLAINT BY</th>
                
                <th>COMPLAINT DATE</th>
                <th>COMPLAINT SUBJECT</th>
             
                
            </tr>
        </thead>
        <tbody>
        <c:forEach items="${complaintList}" var="obj">
            <tr>
                <td> <a href="complaintDetails?id=${obj.compId}"> ${obj.complaintNo} </a></td>
                <td>${obj.applicateName}</td>
             
                  <td>${obj.complaintDate.time }</td>
                    <td>${obj.complaintSubject}</td>
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
