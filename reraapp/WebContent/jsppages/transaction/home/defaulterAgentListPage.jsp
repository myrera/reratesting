<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="<%=request.getContextPath() %>/resources/projectjs/projectJs.js"></script>
<!--News Ticker-->
<script>
var preQueryTxt='${result.name}';
function pagging(xy){
	document.searchForm.startFrom.value=xy;
	document.searchForm.searchTxt=preQueryTxt;
	document.searchForm.submit();
	
}
</script>
<div class="breadcrumb">Home /Defaulter Agent List</div>


<!--News Ticker-->
<div class="container">

<!--main container start here-->
<div class="Main_containner">

<!--Inner wrapper start here-->
<div class="inner_wrapper">


<div class="row">
		
		<div class="col-md-12 search_result_record"> <P class="pull-right"> Total Records:  <span style="color:#dc6117;" >  ${totalRecords }  </span></P></div>
		
		
	</div>

<c:forEach items="${agentList}"  var="obj" >
<c:choose>

<c:when test="${(obj.registrationType=='INDVISUAL_REG')}">




<!--search list main start here-->
<div class="row defalter_result_list">

 <div class="col-md-2"><img src="<%=request.getContextPath() %>/reraimage?IMG_ID=${obj.agentDetailsModel.photograph.documentId}" class="img-responsive"  alt=""/></div>




		<div class="col-md-10 no_pad_lft">
		   <h1> <span style="color:#dc6117;" >Agent: </span>  ${obj.agentDetailsModel.agentName } </h1>
			<p>${obj.agentDetailsModel.agentIndividualBussAddress1} , ${obj.agentDetailsModel.agentIndividualBussAddress1},
			  ${obj.agentDetailsModel.districtModel.districtName},${obj.agentDetailsModel.districtModel.stateUtModel.stateUtName}<span class="glyphicon glyphicon-map-marker"></span></p>
			<p>Reg No. :  ${obj.agentRegistrationNo}</p>
			
			<div class="table-responsive">
				
				
				<table class="table table-bordered">
        <thead>
            <tr>
               
                <th>DATE OF REGISTRATION</th>
                <th>TYPE OF REGISTRATION</th>
                <th>CONTACT NUMBER</th>
                <th>REASON OF REVOKE</th>
                  </tr>
        </thead>
        <tbody>
            <tr>
                <td >${obj.approvedOn.time}</td>
                <td>Individual</td>
                <td>${obj.agentDetailsModel.agentPhoneNo }</td>
                <td>${obj.reasonForRevoke }</td>
               
            </tr>
                     
        </tbody>
    </table>
			</div>
			
			<p class="pull-right"> <span><a href="viewAgentDetailPage?agentID=${obj.agentRegistrationID}">Read More</a></span></p>
			
			
		</div>
	
	</div>


</c:when>





<c:when test="${(obj.registrationType=='FIRM_COMP_REG')}">




<!--search list main start here-->
<div class="row defalter_result_list">




 <div class="col-md-2"><img src="<%=request.getContextPath() %>/reraimage?IMG_ID=${obj.agentDetailsModel.photograph.documentId}" class="img-responsive"  alt=""/></div>




		<div class="col-md-10 no_pad_lft">
		   <h1> <span style="color:#dc6117;" >Agent: </span> ${obj.agentDetailsModel.firmName } </h1>
			<p>${obj.agentDetailsModel.firmAddressLine1} , ${obj.agentDetailsModel.firmAddressLine2},
			  ${obj.agentDetailsModel.districtModel.districtName},${obj.agentDetailsModel.districtModel.stateUtModel.stateUtName}<span class="glyphicon glyphicon-map-marker"></span></p>
			<p>Reg No. :  ${obj.agentRegistrationNo}</p>
			
			<div class="table-responsive">
				
				
				<table class="table table-bordered">
        <thead>
            <tr>
                <th>DIRECTOR NAME</th>
                <th>DATE OF REGISTRATION</th>
                <th>TYPE OF FIRM</th>
                <th>CONTACT NUMBER </th>
                <th>REASON OF REVOKE</th>
             
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>${obj.agentDetailsModel.partnerOrDirectorName }</td>
                <td>${obj.approvedOn.time}</td>
                <td>${obj.agentDetailsModel.firmRegistrationType }</td>
                <td>${obj.agentDetailsModel.firmMobileNo }</td>
                <td>${obj.reasonForRevoke }</td>
              
              
            </tr>
           
           
        </tbody>
    </table>
			</div>
			
				<p class="pull-right"> <span><a href="viewAgentDetailPage?agentID=${obj.agentRegistrationID}">Read More</a></span></p>
	
			
		</div>
	
	</div>
<div class="drop_shadow"></div>	

</c:when>
</c:choose>
</c:forEach>


<!--search list main end here-->	
</div>
 
    <div class="row">
    	
    	<div class="col-md-7 col-md-offset-5">
    		
   <!--  <ul class="pagination">
    <li class="disabled"><a href="#">&laquo;</a></li>
    <li class="active"><a href="#">1</a></li>
    <li><a href="#">2</a></li>
    <li><a href="#">3</a></li>
    <li><a href="#">4</a></li>
    <li><a href="#">5</a></li>
    <li><a href="#">&raquo;</a></li>
    </ul> -->
    		${result.pagging.pagginationData}
    		
    	</div>
    	
    </div>


<!--inner container end here-->
	</div>




<!-- container end here-->

</div>

