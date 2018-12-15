<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>

$(document).ready(
        function() {
           var t= $('#allProjectList').DataTable({
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
<div class="breadcrumb">Home /Project List</div>


<!--News Ticker-->
<div class="container">

<!-- <div style="float: right;padding-right: 10px;"><a href="dashboard">Back to List</a></div> -->
<br>

<!--main container start here-->
<div class="Main_containner">


<!--Inner wrapper stsrt here-->
<div class="inner_wrapper tsklist">



<h1>
				Task List <span>(Pending Enquiry)</span>
			</h1>
			<div class="drop_shadow"></div>
			<div class="clearfix"></div>

			<h1>Total Records : ${noOfPendingRequest} </h1>
	
	
	
<!-- 
<div class="drop_shadow"></div>
	<div class="clearfix"></div>	
	


 -->
<div class="table-responsive">
				
				
				<table class="table table-bordered" id="allProjectList">
        <thead>
           <tr>
						<td>S.NO</td>
						<td>APPLICATION NO</td>
						<td>PROJECT UPDATED</td>
						<td>ENQUIRY DATE</td>
						<td>PROJECT</td>
						 <th>PROJECT STATUS</th> 
						<td>PROMOTER</td>
						<td>STATUS</td>
						<th>PENALTY PAID:?</th>
						


					</tr>
        </thead>
        <tbody>
       <%
						int count = 0;
					%>
					<c:forEach items="${enquiryList}" var="obj">
<c:set var="styleDetails" value="" />
						<c:if test="${not empty obj.updatedFlag}">

							<c:set var="styleDetails" value="color: #07a507;" />
						</c:if>
						<c:if test="${empty obj.updatedFlag}">

						</c:if>
						

<tr style="${styleDetails}">
       
           <td style="${styleDetails}"><%=++count%></td>
						<td style="${styleDetails}"><a href="projectDetails?PROJECT_ID=${obj.projectRegId}">${obj.applicationNo}</a></td>
						<td style="${styleDetails}"><c:if test="${empty obj.updatedFlag}"> No</c:if> <c:if
								test="${not empty obj.updatedFlag}"> Yes</c:if></td>
						<td style="${styleDetails}"><c:forEach items="${obj.enquiryList}" var="enq"
								begin="${obj.enquiryList.size()-1}"
								end="${obj.enquiryList.size()}">
								<fmt:formatDate pattern="dd-MM-yyyy"
									value="${enq.createdOn.getTime()}" />

							</c:forEach></td>
						<td style="${styleDetails}">${obj.projectDetailsModel.projectName }</td>
						<td style="${styleDetails}">${obj.projectDetailsModel.projectStatus}</td>
						<td style="${styleDetails}">${obj.promoterDetailsModel.promoterName }</td>
						<td style="${styleDetails}">${obj.status }</td>
						 <td style="${styleDetails}">${obj.paymentDetailsModel.penaltyPaid}</td>
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


<script>

function submitfrm(){
	var _frm=$('#trxForm');
	if(validateForm(_frm)){
		$(_frm).submit();
	}
}
</script>

