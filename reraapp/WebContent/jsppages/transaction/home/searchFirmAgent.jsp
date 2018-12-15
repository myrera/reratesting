<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<div class="breadcrumb">Home /Real Estate Search</div>


<!--News Ticker-->
<div class="container">

<!--main container start here-->
<div class="Main_containner">

<!--Inner wrapper stsrt here-->
<div class="inner_wrapper">



<h1><span>${agent.agentDetailsModel.firmName }</span></h1>
<div class="drop_shadow"></div>





	


<div class="clearfix"></div>


<!--search list main start here-->     
<div class="row search_result_list_detail">
	    <div class="col-md-3 profile_box"><img src="reraimage?IMG_ID=${agent.agentDetailsModel.photograph.documentId}" class="img-responsive"  alt=""/>
	  
	   </div>
		<div class="col-md-9  ">
		 <h1>${agent.agentDetailsModel.firmName }</h1>
			<!--  <p>${agent.agentDetailsModel.firmAddressLine1},${agent.agentDetailsModel.firmAddressLine2},${agentDetailsModel.districtModel.districtName}   <span class="glyphicon glyphicon-map-marker"></span></p>-->
			<p><span class="reg">Reg No. : ${agent.agentRegistrationNo}</span></p>
			
			
			<div class="row profile_detail">
				<div class="row ">
			<div class="col-md-3 col-sm-3 col-xs-3 mar_top8">Email : </div>
			<div class="col-md-3 col-sm-3 col-xs-3 mar_top8">${agent.agentDetailsModel.firmEmail} </div>
			<div class="col-md-3 col-sm-3 col-xs-3 ">Registration Type :</div>
			<div class="col-md-3 col-sm-3 col-xs-3 ">${agent.agentDetailsModel.firmRegistrationType} </div>
			</div>
			<div class="row ">
			<div class="col-md-3 col-sm-3 col-xs-3 ">Phone Number :</div>
			<div class="col-md-3 col-sm-3 col-xs-3 "> ${agent.agentDetailsModel.firmLandLineNo1 }</div>
			<div class="col-md-3 col-sm-3 col-xs-3 ">Major Activities :</div>
			<div class="col-md-3 col-sm-3 col-xs-3">${agent.agentDetailsModel.firmActivities}</div>
			</div>
			<div class="row ">
			<div class="col-md-3 col-sm-3 col-xs-3 ">Mobile No :</div>
			<div class="col-md-3 col-sm-3 col-xs-3 ">${agent.agentDetailsModel.firmMobileNo}</div>
			<div class="col-md-3 col-sm-3 col-xs-3 ">Landline No. :</div>
			<div class="col-md-3 col-sm-3 col-xs-3 ">${agent.agentDetailsModel.firmLandLineNo1}</div>
			</div>
			<div class="row ">
			<div class="col-md-3 col-sm-3 col-xs-3 ">Address Line1 :</div>
			<div class="col-md-3 col-sm-3 col-xs-3 ">${agent.agentDetailsModel.firmAddressLine1}</div>
			<div class="col-md-3 col-sm-3 col-xs-3 ">Address Line2 :</div>
			<div class="col-md-3 col-sm-3 col-xs-3 ">${agent.agentDetailsModel.firmAddressLine2}</div>
			</div>
			<div class="row ">
			<div class="col-md-3 col-sm-3 col-xs-3 ">State :</div>
			<div class="col-md-3 col-sm-3 col-xs-3 ">${agent.agentDetailsModel.districtModel.stateUtModel.stateUtName}</div>
			<div class="col-md-3 col-sm-3 col-xs-3 ">District :</div>
			<div class="col-md-3 col-sm-3 col-xs-3 ">${agent.agentDetailsModel.districtModel.districtName}</div>
			</div>
			<div class="row ">
			<div class="col-md-3 col-sm-3 col-xs-3 ">Pin Code :</div>
			<div class="col-md-3 col-sm-3 col-xs-3 ">${agent.agentDetailsModel.firmPincode}   </div>
			<div class="col-md-3 col-sm-3 col-xs-3 ">Company Registration Number :</div>
			<div class="col-md-3 col-sm-3 col-xs-3 ">${agent.agentDetailsModel.firmRegistrationNo}</div>
					
			</div>
			
		</div>
</div>
<div class="drop_shadow"></div>	
<div class="clearfix"></div>

<div class="search_detail_grid">
	
<div class="inner_wrapper">	

<h1>Partner/Director  <span>Details</span></h1>
				<div class="drop_shadow"></div>
				<div class="clearfix"></div>	
			
<div class="table-responsive martop">
				<table class="table table-bordered">
        <thead>
            <tr>
                <th>Partner / Director Name</th>
                <th>Email Address</th>
                <th>Address</th>
                <th>Mobile</th>
                
              
                
               
                
            </tr>
        </thead>
        <tbody>
             
            <tr>
                <td >${agent.agentDetailsModel.partnerOrDirectorName}</td>
                <td>${ agent.agentDetailsModel.partnerOrDirectorEmailAddress}</td>
                <td>${ agent.agentDetailsModel.partnerOrDirectorAddressLine1},${ agent.agentDetailsModel.partnerOrDirectorAddressLine2}</td>
                <td>${ agent.agentDetailsModel.partnerOrDirectorPhoneNO}</td>
                
            </tr>
            
            
      
           
        </tbody>
    </table>
</div>


	</div>


<div class="inner_wrapper">	

<h1>Associated <span>With:</span></h1>
				<div class="drop_shadow"></div>
				<div class="clearfix"></div>	
			
<div class="table-responsive martop">
				<table class="table table-bordered">
        <thead>
            <tr>
                <th>Project Name</th>
                <th>Promoter Name</th>
                <th>Project Address</th>
                <th>Project Type</th>
                <th>Total Land Area</th>
              <th>Status</th>
                
               
                
            </tr>
        </thead>
        <tbody>
         <c:forEach  items="${projectList}" var="project">    
         <c:if test="${project.status=='CONFIRMED'}">
            <tr>
                <td >${project.project.projectDetailsModel.projectName}</td>
                <td>${project.project.promoterDetailsModel.promoterName}</td>
                <td>${project.project.projectDetailsModel.addressLine1} ,  ${project.project.projectDetailsModel.addressLine2}</td>
                 <td>${project.project.projectDetailsModel.projectType}</td>
                <td>${ project.project.projectDetailsModel.totalAreaOfLand} sq Mt.</td>
           <td>   ${project.project.projectDetailsModel.projectStatus}</td>
                
                
             
            </tr>
            </c:if>
            </c:forEach>
            
      
           
        </tbody>
    </table>
</div>


	</div>





</div>
			










<div class="clearfix"></div>

<!--search list main end here-->	
</div>




<!--inner container end here-->
	</div>




