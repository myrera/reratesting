<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="s" %>


<div class="breadcrumb">Home /All Project List</div>


<!--News Ticker-->
<div class="container">

<!--main container start here-->
<div class="Main_containner">

<!--Inner wrapper stsrt here-->
<div class="inner_wrapper tsklist">



<h1>View All Project <span>List</span></h1>
<div class="drop_shadow"></div>
	<div class="clearfix"></div>
<h1>Total Records :  </h1>

			<c:if test="${param.act eq 'del'}">
				<div class="alert alert-success">
					<strong></strong> Project Details Deleted Successfully.
				</div>
			</c:if>


			<form action="">

</form>
<div class="table-responsive">
				
				
				<table class="table table-bordered" id="allProjectList">
        <thead>
            <tr>
            <th>S.NO</th>
            	<th>PROJECT NAME</th>
                <th>PROMOTER NAME</th>
                 <th>EMAIL ID</th>  
                <th>MOBILE/TEL No</th>
                <th>STATUS</th>
                <!-- <th>CORPORATE ADDRESS</th>
                <th>PIN CODE</th>
                 <th>DISTRICT</th>
                <th>TALUK</th> -->
                 <th>PROJECT LOCATION</th>
                <th>WEBSITE ADDRESS</th>
                 <th>SOURCE</th>
                  <th>Action</th>
                
            </tr>
        </thead>
        <tbody>
        <%int count=0; %>


        <c:forEach items="${ projectList}" var="obj">
            <tr>
             <td><%= ++count %></td>
             
                  <td><a href="unregisteredProjectDetails?pkId=${obj.unregProjectDetailsId}">${obj.projectName} </a></td>
                  <td>${obj.promoterName}</td>
                  <td>${obj.emailID }</td>
                  <td>${obj.phoneNumber }</td>
                  <td>${obj.status}</td>
                 <%--  <td>${obj.corpAddress}</td>
                  <td>${obj.pinCode }</td>
                  <td>${obj.district }</td>
                  <td>${obj.taluk }</td> --%>
                  <td>${obj.projectLocation }</td>
                  <td>${obj.websiteAddress }</td>
                  <td>${obj.source }</td>
                  <s:url var="proj_del" value="/unRegProject/deleteProject">
                     <s:param name="ProjectId" value="${obj.unregProjectDetailsId}"/>
                  </s:url> 
                 <td> <a  href="${proj_del}"><input type="button" value="delete" class="btn btn-sm btn-primary btn-remove-item">
                 </a>
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
	<script>

		$(document.body).on('click', '.btn-remove-item', function() {
			alert("Are you sure, you want to delete project details");
			$(this).closest('tr').remove();
		});
	
	
	</script>
	
