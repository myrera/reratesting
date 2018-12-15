<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>




<div class="breadcrumb">Enquiry Details</div>


<!--News Ticker-->
<div class="container">

<!--main container start here-->
<div class="Main_containner">

<!--Inner wrapper start here-->
<div class="inner_wrapper tsklist">


                



<h1>Enquiry Details</h1>
<div class="drop_shadow"></div>
	<div class="clearfix"></div>

<div class="table-responsive">
				
				
				<table class="table table-bordered" id="taskList">
        <thead>
            <tr>
               
                <th>TICKET NUMBER</th>
                  <th>ENQUIRY DATE</th>
                     <th>CATEGORY</th>
                <th>DESCRIPTION</th>
                <th>STATUS</th>
                
                
            </tr>
        </thead>
        <tbody>
        <%int count=0; %>
        <c:forEach items="${enquiries}" var="obj">
            <tr>
            
              <td>  ${obj.ticketNumber } </td>
              <td>
             <c:set var = "crdt" value = "${obj.createdOn}" />
             <fmt:formatDate type="date"  pattern="dd-MM-yyyy" dateStyle="short" value="${crdt}"/>
             </td>
              <td> ${obj.category.name }  </td>
                  <td> ${obj.description }  </td>
                 <td>${obj.status}</td>
                
               
                 
                
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
