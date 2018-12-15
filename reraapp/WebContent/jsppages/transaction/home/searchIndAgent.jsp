<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<div class="breadcrumb">Home /Real Estate Search</div>


<!--News Ticker-->
<div class="container">

	<!--main container start here-->
	<div class="Main_containner">

		<!--Inner wrapper stsrt here-->
		<div class="inner_wrapper">













			<div class="clearfix"></div>


			<!--search list main start here-->
			<div class="row search_result_list_detail">
			
			
			
				<div class="col-md-3 profile_box">
					<img
						src="reraimage?IMG_ID=${agent.agentDetailsModel.photograph.documentId}"
						class="img-responsive" alt="" />

				</div>
				<div class="col-md-9  ">
					<h1>${agent.agentDetailsModel.agentName }</h1>
					<p>
						<span class="reg">Reg No. : ${agent.agentRegistrationNo}</span>
					</p>

					<div class="row profile_detail">

						<div class="row ">
							<div class="col-md-3 col-sm-3 col-xs-3 mar_top8">Father`s
								Name :</div>
							<div class="col-md-3 col-sm-3 col-xs-3 mar_top8">${agent.agentDetailsModel.agentFatherName}
							</div>
							<div class="col-md-3 col-sm-3 col-xs-3 ">Occupation :</div>
							<div class="col-md-3 col-sm-3 col-xs-3 ">${agent.agentDetailsModel.occupation}
							</div>
						</div>
						<div class="row ">

							<div class="col-md-3 col-sm-3 col-xs-3 ">Phone Number :</div>
							<div class="col-md-3 col-sm-3 col-xs-3 ">
								${agent.agentDetailsModel.landLineNumber1 }</div>

							<div class="col-md-3 col-sm-3 col-xs-3 ">Mobile Number :</div>
							<div class="col-md-3 col-sm-3 col-xs-3 ">
								${agent.agentDetailsModel.agentPhoneNo }</div>
						</div>
						<div class="row ">
						<div class="col-md-3 col-sm-3 col-xs-3 ">PAN Card No. :</div>
						<div class="col-md-3 col-sm-3 col-xs-3 ">${agent.agentDetailsModel.agentPanNo}</div>
						<div class="col-md-3 col-sm-3 col-xs-3 ">ADHAAR Card No. :</div>
						<div class="col-md-3 col-sm-3 col-xs-3  ">${agent.agentDetailsModel.agentAdhaarNo}</div>
						
						</div>
							<div class="row ">
						<div class="col-md-3 col-sm-3 col-xs-3 ">Address Line1 :</div>
						<div class="col-md-3 col-sm-3 col-xs-3 ">${agent.agentDetailsModel.agentIndividualAddressLine1}</div>

						<div class="col-md-3 col-sm-3 col-xs-3 ">Address Line2 :</div>
						<div class="col-md-3 col-sm-3 col-xs-3 ">${agent.agentDetailsModel.agentIndividualAddressLine2}</div>
					</div>
					<div class="row ">
							<div class="col-md-3 col-sm-3 col-xs-3 ">State :</div>
							<div class="col-md-3 col-sm-3 col-xs-3 ">${agent.agentDetailsModel.districtModel.stateUtModel.stateUtName}</div>
		
						<div class="col-md-3 col-sm-3 col-xs-3 ">District :</div>
						<div class="col-md-3 col-sm-3 col-xs-3 ">${agent.agentDetailsModel.districtModel.districtName}</div>
						<div class="col-md-3 col-sm-3 col-xs-3 ">Pin Code :</div>
						<div class="col-md-3 col-sm-3 col-xs-3 ">${agent.agentDetailsModel.agentIndividualPincode}</div>
						
						</div>
						<div class="row ">
							<div class="col-md-3 col-sm-3 col-xs-3 ">Business Address
								Line1 :</div>
							<div class="col-md-3 col-sm-3 col-xs-3 ">${agent.agentDetailsModel.agentIndividualBussAddress1}
							</div>
							<div class="col-md-3 col-sm-3 col-xs-3 ">Business Address
							Line2 :</div>
						<div class="col-md-3 col-sm-3 col-xs-3 ">${agent.agentDetailsModel.agentIndividualBussAddress2}
						</div>
						</div>
						
						<div class="row ">
						<div class="col-md-3 col-sm-3 col-xs-3 ">State :</div>
							<div class="col-md-3 col-sm-3 col-xs-3 ">${agent.agentDetailsModel.districtModel.stateUtModel.stateUtName}</div>
		
						<div class="col-md-3 col-sm-3 col-xs-3 ">District :</div>
						<div class="col-md-3 col-sm-3 col-xs-3 ">${agent.agentDetailsModel.agentIndividualBussDistrictModel.districtName}
						</div>

						</div>
					
						<div class="row ">
						<div class="col-md-3 col-sm-3 col-xs-3 ">Pin Code :</div>
						<div class="col-md-3 col-sm-3 col-xs-3 ">${agent.agentDetailsModel.agentIndividualBussPincode}
						</div>
						<div class="col-md-3 col-sm-3 col-xs-3 ">Photograph :</div>
						<div class="col-md-3 col-sm-3 col-xs-3">
							<a
								href="download?DOC_ID=  ${agent.agentDetailsModel.photograph.documentId }">
								${agent.agentDetailsModel.photograph.fileName } </a>
						</div>
					</div>

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

			<div class="search_detail_grid"></div>


			<div class="clearfix"></div>


			<!--search list main end here-->
		</div>

		<!--inner container end here-->
	</div>

	<!-- container end here-->