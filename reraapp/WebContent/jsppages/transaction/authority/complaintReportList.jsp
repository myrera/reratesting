<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="in.gov.rera.common.util.ReraConstants"%>
<%@page import="in.gov.rera.common.model.UserModel"%>

<script>
                    $(document).ready(
                    		function() {
                				var t=$('#taskList').DataTable(
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
                							} ],
                							"columnDefs": [ {
                					            "searchable": false,
                					            "orderable": false,
                					            "targets": 0
                					        } ],
                					        "order": [[ 0, 'asc' ]]
                							
                							});
                					
                					 t.on( 'order.dt search.dt', function () {
                					        t.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
                					            cell.innerHTML = i+1;
                					        } );
                					    } ).draw();

                				});
                    
                    
</script>
<%-- 
<%
UserModel user=(UserModel)session.getAttribute(ReraConstants.SES_USER_ATTR);

%>
<div class="breadcrumb">Enquiry Details  <span class="pull-right user_name">Welcome:<b> <%=user.getUserName() %></b></span> </div>

 --%>

<!--News Ticker-->
<div class="container">

<!--main container start here-->
<div class="Main_containner">

<!--Inner wrapper start here-->
<div class="inner_wrapper tsklist">
<h1>List of judgement by RERA KARNATAKA</h1>
<div class="table-responsive">
				<table class="table table-bordered" id="taskList">
        <thead>
            <tr>
               <th>S.NO</th>
                <th>COMPLAINT NO</th>
                <th>ORDER DATE</th>
                <th>PETITIONER</th>
                <th>RESPONDENT NAME</th>
                <th>DISTRICT</th>
                <th>ORDERCOPY ATTACHMENT</th>
            </tr>
        </thead>
        <tbody>
        <%int count=0; %>
        <c:forEach items="${allApplicantsList}" var="obj">
         <tr>
              <td><%= ++count%></td>
              <td>  ${obj.complaintNo} </td>
              <td>
	             <c:set var = "crdt" value = "${obj.orderDate.time}" />
	             <fmt:formatDate type="date"  pattern="dd-MM-yyyy HH:mm" dateStyle="short" value="${crdt}"/>
              </td>
              <td>  ${obj.petitioner} </td>
              <td>  ${obj.respondentName } </td>
              <td> ${obj.distName}  </td>
			  <td><a href='<%=request.getContextPath() %>/download?DOC_ID=${obj.orderCopy.documentId}'>${obj.complaintNo}.pdf</a>
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
