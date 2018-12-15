<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!--News Ticker-->
<script>
var preQueryTxt='${result.name}';
function pagging(xy){
	document.searchForm.startFrom.value=xy;
	document.searchForm.searchTxt=preQueryTxt;
	document.searchForm.submit();
	
}
</script>
<div class="breadcrumb">Home /Real Estate Search</div>


<!--News Ticker-->
<div class="container">

<!--main container start here-->
<div class="Main_containner">

<!--Inner wrapper stsrt here-->
<div class="inner_wrapper">
<form action='search' method='post' name='searchForm' onsubmit="if(this.searchTxt=='') {return false;}">
<input type="hidden" name="startFrom" value="0" id="startFromID" />
							
<div class="container">
  <div class="row">
    <div class="col-md-8 col-sm-12 col-xs-12 col-md-offset-2">
      <div class="advanced-seach pad_top0">
        <div class="flipkart-navbar-search smallsearch col-sm-12 col-xs-12 dropdown">
          <div class="row">
      <div class="input-group">
      <input id="searchTextID" type="text" class="form-control" name="searchTxt" placeholder="Search project name, Builder or Agent" value="${result.name }">
      <span class="input-group-addon"> <button class="flipkart-navbar-button btn simp-search">Modify Search </button> 

        </span>
     </div>


  
  </div>
 </div>
        
        <div class="clearfix"></div>

     
      
      </div>
    </div>
  </div>
</div>


	


<!--Filter strart here-->
<div class="col-md-12 filter_strip">
	
<div class="col-md-2 filter-head"><p>Filters</p></div>

<div class="col-md-10 right_part">
	
	
	<div class="form-inline" style="display: block;">
    <div class="form-group pull-right">
          <select class="form-control">
          <option>Construction Status</option>
          </select>
    </div>
    <div class="form-group pull-right">
    <select class="form-control">
          <option>Property Type</option>
            </select>
    </div>
    <div class="form-group pull-right">
    <select class="form-control ">
          <option>Size</option>
     </select>
    </div>
    
     <div class="form-group pull-right">
    <select class="form-control ">
          <option>Agent</option>
     </select>
    </div>
    
        <div class="form-group pull-right">
    <select class="form-control ">
          <option>Promoter</option>
     </select>
    </div>
    
     <div class="form-group pull-right">
    <select class="form-control ">
          <option>Year</option>
     </select>
    </div>
   
  </div>
	
	
</div>

<div class="clearfix"></div>

<!--Filter end here	-->
</div>






</form>
<br>

<div class="clearfix"></div>
<div class="row">
		
		<div class="col-md-12 search_result_record">Result for:  <span style="color:#dc6117;" >${result.name }</span> <P class="pull-right">   Showing record ${result.startFrom } to ${result.lastIndex } out of <span style="color:#dc6117;" >${result.totalRecords} Records </span></P></div>
		
		
	</div>

<c:forEach items="${result.recordList}"  var="obj" >
<c:choose>
<c:when test="${obj.objectType=='PROJECT'}">




<!--search list main start here-->
<div class="row search_result_list">
	    <div class="col-md-3">
	    	
	    
	    	
	    	<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
    <%int xxx=0; %>
    <c:forEach items="${obj.object.projectPhotoDetailSet }" var="photo">
    <%if(xxx==0){ %>
      <li data-target="#myCarousel" data-slide-to="<%=xxx %>" class="active"></li>
      <%} else{%>
        <li data-target="#myCarousel" data-slide-to="<%=xxx %>" ></li>
      <%} xxx=xxx+1; %>
     
      
      </c:forEach>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">

<% xxx=0; %>
    <c:forEach items="${obj.object.projectPhotoDetailSet }" var="poto">
    <%if(xxx==0){ %>
     
     
      <div class="item active">
      <img src="reraimage?IMG_ID=${poto.documentId}" class="img-responsive"  alt=""/>	
      </div>
     
     
      <%} else{%>
      
        <div class="item">
      <img src="reraimage?IMG_ID=${poto.documentId}" class="img-responsive"  alt=""/>
      </div>
      
      <%} xxx=xxx+1; %>
     
      
      </c:forEach>

     
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
	    	
	    	
	    	
	    </div>
	    
	    
	    
  
  
  
  
  		<div class="col-md-9 no_pad_lft">
		   <h1><span style="color:#dc6117;" >Project: </span> ${obj.object.projectDetailsModel.projectName} </h1>
			<p>${obj.object.projectDetailsModel.addressLine1}  , ${obj.object.projectDetailsModel.addressLine1}, 
			${obj.object.projectDetailsModel.subDistrictModel.subDistrictName},${obj.object.projectDetailsModel.subDistrictModel.districtModel.districtName},
			${obj.object.projectDetailsModel.subDistrictModel.districtModel.stateUtModel.stateUtName}
			  <span class="glyphicon glyphicon-map-marker"></span></p>
			<p>Reg No. : ${obj.object.projectRegistrationNo}</p>
			
			<div class="table-responsive">
				
				
				<table class="table table-bordered">
        <thead>
            <tr>
                <th>PROMOTER</th>
                <th>PROMOTER TYPE</th>
                <th>TOTAL AREA</th>
              <th>PROPERTY TYPE</th>
                <th>STATUS </th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td> ${obj.object.promoterDetailsModel.promoterName}</td>
                <td>${obj.object.promoterDetailsModel.promoterName} </td>
                <td>${obj.object.projectDetailsModel.totalAreaOfLand} (sq Mtr)</td>
                <td>${obj.object.projectDetailsModel.projectType}</td>
                <td>${obj.object.projectDetailsModel.projectStatus}</td>
            </tr>
           
        </tbody>
    </table>
			</div>
			
			<!--<p class="pull-right"> <span><a href="viewProjectDetailPage?projectID=${obj.object.projectRegId}">Read More</a></span></p>-->
			
			<p class="pull-right"> <span><a href="#">Read More</a></span></p>
			
	</div>
	</div>
<div class="drop_shadow"></div>	

</c:when>


<c:when test="${(obj.objectType=='AGENT') and (obj.object.registrationType=='INDIVIDUAL_REG')}">




<!--search list main start here-->
<div class="row search_result_list">

 <div class="col-md-3"><img src="reraimage?IMG_ID=${obj.object.agentDetailsModel.photograph.documentId}" class="img-responsive"  alt=""/></div>




		<div class="col-md-9 no_pad_lft">
		   <h1> <span style="color:#dc6117;" >Agent: </span>  ${obj.object.agentDetailsModel.agentName } </h1>
			<p>${obj.object.agentDetailsModel.agentIndividualBussAddress1} , ${obj.object.agentDetailsModel.agentIndividualBussAddress1},
			  ${obj.object.agentDetailsModel.districtModel.districtName},${obj.object.agentDetailsModel.districtModel.stateUtModel.stateUtName}<span class="glyphicon glyphicon-map-marker"></span></p>
			<p>Reg No. :  ${obj.object.agentRegistrationNo}</p>
			
			<div class="table-responsive">
				
				
				<table class="table table-bordered">
        <thead>
            <tr>
               
                <th>DATE OF REGISTRATION</th>
                <th>TYPE OF REGISTRATION</th>
                <th>CONTACT NUMBER</th>
                <th>EMAIL ADDRESS</th>
                  </tr>
        </thead>
        <tbody>
            <tr>
                <td >${obj.object.approvedOn.time}</td>
                <td>Individual</td>
                <td>${obj.object.agentDetailsModel.agentPhoneNo }</td>
                <td>${obj.object.agentDetailsModel.agentEmailId }</td>
               
            </tr>
                     
        </tbody>
    </table>
			</div>
			
			<!--<p class="pull-right"> <span><a href="viewAgentDetailPage?agentID=${obj.object.agentRegistrationID}">Read More</a></span></p>-->
			<p class="pull-right"> <span><a href="#">Read More</a></span></p>
			
			
			
		</div>
	
	</div>
<div class="drop_shadow"></div>	

</c:when>





<c:when test="${(obj.objectType=='AGENT') and (obj.object.registrationType=='FIRM_COMP_REG')}">




<!--search list main start here-->
<div class="row search_result_list">




 <div class="col-md-3"><img src="reraimage?IMG_ID=${obj.object.agentDetailsModel.photograph.documentId}" class="img-responsive"  alt=""/></div>




		<div class="col-md-9 no_pad_lft">
		   <h1> <span style="color:#dc6117;" >Agent: </span> ${obj.object.agentDetailsModel.firmName } </h1>
			<p>${obj.object.agentDetailsModel.firmAddressLine1} , ${obj.object.agentDetailsModel.firmAddressLine2},
			  ${obj.object.agentDetailsModel.districtModel.districtName},${obj.object.agentDetailsModel.districtModel.stateUtModel.stateUtName}<span class="glyphicon glyphicon-map-marker"></span></p>
			<p>Reg No. :  ${obj.object.agentRegistrationNo}</p>
			
			<div class="table-responsive">
				
				
				<table class="table table-bordered">
        <thead>
            <tr>
                <th>DIRECTOR NAME</th>
                <th>DATE OF REGISTRATION</th>
                <th>TYPE OF FIRM</th>
                <th>CONTACT NUMBER </th>
                <th>EMAIL ADDRESS</th>
             
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>${obj.object.agentDetailsModel.partnerOrDirectorName }</td>
                <td>${obj.object.approvedOn.time}</td>
                <td>${obj.object.agentDetailsModel.firmRegistrationType }</td>
                <td>${obj.object.agentDetailsModel.firmMobileNo }</td>
                <td>${obj.object.agentDetailsModel.firmEmail }</td>
              
            </tr>
           
           
        </tbody>
    </table>
			</div>
			
				<!--<p class="pull-right"> <span><a href="viewAgentDetailPage?agentID=${obj.object.agentRegistrationID}">Read More</a></span></p>-->
				<p class="pull-right"> <span><a href="#">Read More</a></span></p>
	
			
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

