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
                    
                    function assign( ticketId, assignElement){
                    	var question="Are you sure you want to assign this ticket to "+ document.getElementById(assignElement).options[document.getElementById(assignElement).selectedIndex].text +" ?";
                    	if(confirm(question)){
                    		
                    	document.trxForm.ticketId.value=ticketId;
                    	document.trxForm.userId.value=document.getElementById(assignElement).value;
                    	alert("Successfully Assigned");
                    	document.trxForm.submit();
                    	}
                    }
                    
                    
                    
</script>

<%
UserModel user=(UserModel)session.getAttribute(ReraConstants.SES_USER_ATTR);

%>
<div class="breadcrumb">Enquiry Details  <span class="pull-right user_name">Welcome:<b> <%=user.getUserName() %></b></span> </div>



<!--News Ticker-->
<div class="container">

<!--main container start here-->
<div class="Main_containner">

<!--Inner wrapper start here-->
<div class="inner_wrapper tsklist">


                



<h1>Enquiry Details</h1><h1><a class="pull-right user_name" href="<%=request.getContextPath() %>/helpdesk/authority?applicationNumber=">Assign Tickets</a></h1>
<div class="drop_shadow"></div>
	<div class="clearfix"></div>
<form name="trxForm" action="assign">
<input type="hidden" name="ticketId">
<input type="hidden" name="userId">		



<div class="table-responsive">
				
			
				<table class="table table-bordered" id="taskList">
        <thead>
            <tr>
               <th>S.NO</th>
                <th>TICKET NUMBER</th>
                  <th>ENQUIRY DATE</th>
                  <th>CATEGORY</th>
                <th>DESCRIPTION</th>
                  <th>STATUS</th>
               
                <th>CONTACT NO</th>
                <th>ACK NUMBER</th>
                 <th>STATUS</th>
               <!--  <th>ATTACHMENTS</th> -->
             
                
                
            </tr>
        </thead>
        <tbody>
        <%int count=0; %>
        <c:forEach items="${enquiries}" var="obj">
            <tr>
              <td><%=++count%>
              <td>  ${obj.enquiry.ticketNumber } </td>
                <td>
             <c:set var = "crdt" value = "${obj.enquiry.createdOn}" />
             <fmt:formatDate type="date"  pattern="dd-MM-yyyy HH:mm" dateStyle="short" value="${crdt}"/>
             </td>
                <td>  ${obj.enquiry.category.name} </td>
                <td> ${obj.enquiry.description }  </td>
                  
              <td><input type="button" name="return"
										value="${obj.status}" data-toggle="modal"
										data-target="#returnModal${obj.id}">

										<div class="modal fade" id="returnModal${obj.id}"
											role="dialog">
											<div class="modal-dialog">

												<!-- Modal content-->
												<div class="modal-content">
													<div class="modal-header">
														<span>Status Details</span>
														<button type="button" class="close" data-dismiss="modal">&times;</button>
													</div>
													<div class="modal-body">

														<div class="table-responsive">
															<table class="table table-bordered">
																<thead>
																	<tr>
																		<th>DATE</th>
																		<th>Assignor</th>
																		<th>Assignee</th>
																		<th>Comments</th>
																		<th>Attachments</th>
																	</tr>
																</thead>
																<tbody>

																		<tr>
																			<td><c:set var="crdt" value="${obj.createdOn}" />
																				<fmt:formatDate type="date"
																					pattern="dd-MM-yyyy HH:mm" dateStyle="short"
																					value="${crdt}" /></td>
																			<td>${obj.assignor.userName}</td>
																			<td>${obj.assignee.userName}</td>
																	<td>${obj.description}</td>
																			<td><c:forEach items="${obj.enquiry.attachments}"
																					var="doc">
																					<a
																						href='<%=request.getContextPath() %>/download?DOC_ID=${doc.documentId}'>${doc.fileName}</a>
																					<br>
																				</c:forEach></td>
																		</tr>
																</tbody>


															</table>
														</div>


													</div>

												</div>
											</div>
										</div></td>
                
                
		         <td>${obj.enquiry.contactNumber}</td>
				<td><c:set var="appno" value="${obj.enquiry.applicationNumber}" />
				<c:choose>
					<c:when test="${fn:startsWith(appno, 'AG/')}">
						<a href="agentDetails?applicationNumber=${appno}">${appno}</a>
					</c:when>
					<c:when test="${fn:startsWith(appno, 'PR/')}">
						<a href="project?applicationNumber=${appno}">${appno}</a>
					</c:when>
					<c:otherwise>
						<a href="complaintDetails?applicationNumber=${appno}">${appno}</a>
					</c:otherwise>
				</c:choose></td> 
				  <td> ${obj.status }  </td>
             </tr>
      </c:forEach>
        </tbody>
    </table>
    
			</div>
</form>
	
		
	
	

<!--search list main end here-->	
</div>

    


<!--inner container end here-->
	</div>




<!-- container end here-->

</div>
	</div>
