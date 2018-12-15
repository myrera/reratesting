<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!--Banner-->
<div class="breadcrumb">Home /Real Estate Search</div>


<!--News Ticker-->
<div class="container">

	<!--main container start here-->
	<div class="Main_containner">

		<!--Inner wrapper start here  root object   projectReg-->
		<div class="inner_wrapper">



			<h1>
				<span>${project.projectDetailsModel.projectName} </span><div class="row">
	<h1><div class="pull-right">Last Updated <span>On &nbsp;&nbsp;&nbsp;</span>${project.lastUpdatedOn.time}</div></h1>
	</div>	
			
			</h1>
			<div class="drop_shadow"></div>

			<div class="clearfix"></div>


			<!--search list main start here-->
			<div class="row search_result_list_detail">
				<div class="col-md-3 profile_box">


					<img
						src="reraimage?IMG_ID=${project.promoterDetailsModel.projectChairmanModel.document.documentId}"
						class="img-responsive" alt="" />
					<h1>
						${project.promoterDetailsModel.projectChairmanModel.chairmanName}<br>Chairman,
						${project.projectDetailsModel.projectName}
					</h1>
				</div>
				<div class="col-md-9  ">
					<h1>${project.projectDetailsModel.projectName}</h1>
					<p>
						${project.projectDetailsModel.addressLine1} ,${
						project.projectDetailsModel.addressLine2},${project.projectDetailsModel.subDistrictModel.districtModel.districtName}
						<span class="glyphicon glyphicon-map-marker"></span>
					</p>
					<p>
						<span class="reg">Reg No. : ${
							project.projectRegistrationNo}</span>
							<span class="reg">Reg Type : ${project.registrationType}</span>
					</p>

					<div class="row profile_detail">


						<div class="row ">
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p class="text-right">
									Promoter <span class="space_LR">:</span>
								</p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p>${project.promoterDetailsModel.promoterName}</p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p class="text-right">
									Date of Registration <span class="space_LR">:</span>
								</p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p>${project.approvedOn.time }</p>
							</div>
						</div>



						<div class="row">
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p class="text-right">
									Project Address <span class="space_LR">:</span>
								</p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p>${project.projectDetailsModel.addressLine1} ,${
									project.projectDetailsModel.addressLine2}</p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p class="text-right">
									Total Area of Project Land <span class="space_LR">:</span>
								</p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p>${ project.projectDetailsModel.totalAreaOfLand} sq ft.</p>
							</div>
						</div>
							<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Total Open Area (Sq Mtr)<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.projectDetailsModel.totalOpenArea}</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Estimated Cost of Construction (INR) <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.projectDetailsModel.estimatedCost}  </p></div>
	</div>
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Cost of Land (INR)<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.projectDetailsModel.costOfLand}</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Total Project Cost (INR) <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.projectDetailsModel.totalProjectCost}  </p></div>
	</div>
						
	

	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Approving Authority<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.projectDetailsModel.approvingAuthority} </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right"></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p></p></div>
	</div>

						<div class="row">
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p class="text-right">
									Project Type <span class="space_LR">:</span>
								</p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p>

${project.projectDetailsModel.projectType }

								
								</p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p class="text-right">
									Project Start Date <span class="space_LR">:</span>
								</p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p>
									<fmt:formatDate type="date" pattern="dd-MM-yyyy"
										dateStyle="short"
										value="${project.projectDetailsModel.startDate.time}" />
								</p>
							</div>
						</div>
						<div class="row">
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p class="text-right">
									Project End Date <span class="space_LR">:</span>
								</p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p>
									<fmt:formatDate type="date" pattern="dd-MM-yyyy"
										dateStyle="short"
										value="${project.projectDetailsModel.completionDate.time}" />
								</p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p class="text-right">
									Project Status <span class="space_LR">:</span>
								</p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p>

${project.projectDetailsModel.projectStatus}
								</p>
							</div>
						</div>


 

<%-- <div class="row">
	<h1><div class="pull-right">Last Updated <span>On &nbsp;&nbsp;&nbsp;</span>${project.developmentDetailSet.currentStatus.updatedOn.time}</div></h1>
	</div> --%>	
				
				
						<div class="row">
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p class="text-right">
								 Total Open Area (Sq ft.) <span class="space_LR">:</span>
								</p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p>${project.projectDetailsModel.totalOpenArea}
								 </p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p class="text-right">
									Total Coverd Area(Sq ft.) <span class="space_LR">:</span>
								</p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p>${ project.projectDetailsModel.totalCoverdArea} sq Mt.</p>
							</div>
						</div>


						<div class="row">
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p class="text-right">
								Project Address Line 1 <span class="space_LR">:</span>
								</p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p>${project.projectDetailsModel.addressLine1} 
									 </p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p class="text-right">
									District <span class="space_LR">:</span>
								</p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p>${ project.projectDetailsModel.districtModel.stateUtModel.stateUtName} </p>
							</div>
						</div> 



						<div class="row">
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p class="text-right">
									Tehsil/Sub  District<span class="space_LR">:</span>
								</p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p>${project.projectDetailsModel.districtModel.districtName } 
									 </p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p class="text-right">
									No of Garage <span class="space_LR">:</span>
								</p>
							</div>
							
							<fmt:parseNumber var = "i" integerOnly = "true"   type = "number" value = "${ project.projectDetailsModel.noOfGarageForSale}" />
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p>${i}</p>
							</div>
						</div>


						<div class="row">
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p class="text-right">
									Area of Garage(Sq ft.) <span class="space_LR">:</span>
								</p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p>${project.projectDetailsModel.areaOfGarageForSale}  
									 </p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p class="text-right">
									No of Parking open <span class="space_LR">:</span>
								</p>
							</div>
							 <fmt:parseNumber var = "i" integerOnly = "true"   type = "number" value = "${ project.projectDetailsModel.noOfParkinfForSale }" />
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p>${i}</p>
							</div>
						</div>



						<div class="row">
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p class="text-right">
									Area of Parking open <span class="space_LR">:</span>
								</p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p>${project.projectDetailsModel.areaOfParkinfForSale}  
									 </p>
							</div>
						 
						 
							
						  
						
						</div>
						
			<div class="row">
							
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p class="text-right">
									No of Garage Sold Out <span class="space_LR">:</span>
								</p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p>${project.projectDetailsModel.garageSoldout}  
									 </p>
							</div>
							
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p class="text-right">
									No Of Parking Sold Out  <span class="space_LR">:</span>
								</p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p>${project.projectDetailsModel.parkingSoldout}  
									 </p>
							</div>
						 
						  
						</div>			
						
						
 







					</div>

				</div>
			</div>
			<div class="drop_shadow"></div>
			<div class="clearfix"></div>

			<h1>Project Description</h1>
			<p>${project.projectDetailsModel.projectDescription}</p>
			<br>



			<div class="search_detail_grid">

				<div class="inner_wrapper">

					<h1>
						Promoter <span>Details</span>
					</h1>
					<div class="drop_shadow"></div>
					<div class="clearfix"></div>

					<div class="table-responsive martop">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>Type of Promoter</th>
									<th>Name</th>
									<th>E-mail</th>
									<th>Mobile Number</th>


								</tr>
							</thead>
							<tbody>
								<tr>
									<td>${project.promoterDetailsModel.typeOfPromoter}</td>


									<td>${project.promoterDetailsModel.promoterName}</td>
									<td>${ project.promoterDetailsModel.emailId}</td>
									<td>${ project.promoterDetailsModel.mobileNo}</td>


								</tr>


							</tbody>
						</table>
					</div>

					<h1>
					Authorized Signatory <span>Details</span>
					</h1>
					<div class="drop_shadow"></div>
					<div class="clearfix"></div>

					<div class="table-responsive martop">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>Name</th>
									<th>Mobile</th>
									<th>E-mail</th>
									<th>Address</th>



								</tr>
							</thead>
							<tbody>
								<tr>
									<td>${project.promoterDetailsModel.projectChairmanModel.chairmanName}</td>
									<td>${project.promoterDetailsModel.projectChairmanModel.mobileNo}</td>
									<td>${
										project.promoterDetailsModel.projectChairmanModel.emailId}</td>
									<td>${
										project.promoterDetailsModel.projectChairmanModel.addressLine1},
										${project.promoterDetailsModel.projectChairmanModel.addressLine2},
										${project.promoterDetailsModel.projectChairmanModel.districtModel.districtName},
										${project.promoterDetailsModel.projectChairmanModel.districtModel.stateUtModel.stateUtName}</td>



								</tr>


							</tbody>
						</table>
					</div>

					<h1>
						Project Head <span>Details</span>
					</h1>
					<div class="drop_shadow"></div>
					<div class="clearfix"></div>
					<div class="table-responsive martop">
						<table class="table table-bordered ">
							<thead>
								<tr>
									<th> Name</th>
									<th> Type</th>
									<th>Mobile No</th>
									<th>Email Address</th>
									<th>Address</th>
									<th>Pin Code</th>
									<th>Photograph</th>



								</tr>
							</thead>
							<tbody>
								<c:forEach
									items="${project.promoterDetailsModel.projectChairmanModel.memberSet}"
									var="obj">
									<tr>

										<td>${obj.memberName}</td>
										<td>${obj.memberType}</td>
										<td>${obj.mobileNo}</td>
										<td>${obj.emailId}</td>
										<td>${obj.addressLine1},${obj.addressLine2}</td>
										<td>${obj.pinCode}</td>
										<td><a
											href="download?DOC_ID=${obj.momberPhotoDoc.documentId}">
												${obj.momberPhotoDoc.fileName}</a></td>


									</tr>
								</c:forEach>



							</tbody>
						</table>
					</div>



					<h1>
					RERA Registration Details with any <span>other State/UTs</span>
					</h1>
					<div class="drop_shadow"></div>
					<div class="clearfix"></div>
					<div class="table-responsive martop">
						<table class="table table-bordered ">
							<thead>
								<tr>
									<th>Have registration been revoked?</th>
									<th>Certificate Number</th>
									<th>Reason for revoked</th>

								</tr>
							</thead>
							<tbody>

								<c:forEach
									items="${project.promoterDetailsModel.promoterBlackSet}"
									var="obj">
									<tr>
										<td>${obj.isBalckList}
										<td>${obj.certificateNo}</td>
										<td>${obj.blacklistReason}
										  </td>
									</tr>
								</c:forEach>






							</tbody>
						</table>
					</div>








					<div class="inner_wrapper">

						<div class="table-responsive">
							<h1>
								Development <span>Details</span>
							</h1>
							<div class="drop_shadow"></div>
							<table class="table table-bordered">
								<thead>
									<tr>
										<th>Type of Inventory</th>
										<th>No of Inventory</th>
										<th>Carpet Area <br />(Sq Mtr)
										</th>
										<th>Area of exclusive balcony/verandah <br />(Sq Mtr )
										</th>
										<th>Area of exclusive open terrace if any<br />(Sq Mtr)
										</th>
										<th>No Of Inventory Completed</th>
										<th>No Of Inventory Sold</th>

									</tr>
								</thead>
								<tbody>
									<c:forEach items="${project.developmentDetailSet}" var="objDev">
										<tr>
											<td>${objDev.typeOfInventory}</td>
											<td>${objDev.noOfInventory}</td>
											<td>${objDev.carpetArea}</td>
											<td>${objDev.areaOfExclusive}</td>
											<td>${objDev.areaOfExclusiveOpenTerrace}</td>
											
										<td>
										${objDev.currentStatus.totalCompleted}
										   
										</td>
										<td>
										${objDev.currentStatus.totalSold}
										   
										</td>
											
										</tr>
									</c:forEach>

								</tbody>
							</table>
						</div>





						<h1>
							Associated <span> Vendor</span>
						</h1>
						<div class="border">
							<div class="orange"></div>
							<div class="black"></div>
						</div>




						<h1>
							Project <span>Agent</span>
						</h1>
						<div class="table-responsive">

							<table class="table table-bordered">
								<thead>
									<tr>
										<th>Agent Registration No.</th>
										<th>Agent Name</th>

                                         <th>Address</th>

									</tr>
								</thead>
								<tbody>
									<c:forEach items="${project.projectAgentDetailSet}"
										var="objAgent">
   <c:if test="${objAgent.status=='CONFIRMED'}">

										<tr>
											<td>${objAgent.agent.agentRegistrationNo}</td>
											<td>${objAgent.agent.agentDetailsModel.agentName}</td>
											<td>${objAgent.agent.agentDetailsModel.agentIndividualAddressLine1}</td>


										</tr>
										</c:if>
									</c:forEach>


								</tbody>
							</table>







							<h1>
								Project <span>Architects</span>
							</h1>

							<div class="table-responsive">

								<table class="table table-bordered">
									<thead>
										<tr>
											<th>Architect Name</th>
											<th>Email</th>
											<th>Address</th>
											<!-- <th>Address Line 2</th> -->
											<th>Pin Code</th>
											<th>Year of Establishment</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${project.projectArchitectDetailSet}"
											var="objArchitech">
  <c:if test="${objArchitech.status=='CONFIRMED'}">
											<tr>
												<td>${objArchitech.architectName}</td>
												<td>${objArchitech.emailId}</td>
												<td>${objArchitech.addressLine1},${objArchitech.addressLine2},${objArchitech.districtModel.districtName},${objArchitech.districtModel.stateUtModel.stateUtName}</td>
												
												<td>${objArchitech.pinCode}</td>
												<td>${objArchitech.yearOfEstablishment}</td>

											</tr>
											</c:if>
										</c:forEach>


									</tbody>
								</table>
							</div>



							<h1>
								Structural <span>Engineers</span>
							</h1>
							<div class="drop_shadow"></div>
							<div class="clearfix"></div>
							<div class="table-responsive">

								<table class="table table-bordered">
									<thead>
										<tr>
											<th>Engineer Name</th>
											<th>Email</th>
											<th>Address</th>
											<!-- <th>Address Line 2</th> -->
											<th>Pin Code</th>
											<th>Year of Establishment</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${project.structuralEngineerDetailSet}"
											var="objEngineer">
	  <c:if test="${objEngineer.status=='CONFIRMED'}">
											<tr>
												<td>${objEngineer.engineerName}</td>
												<td>${objEngineer.emailId}</td>
												<td>${objEngineer.addressLine1},${objEngineer.addressLine2},${objEngineer.districtModel.districtName},${objEngineer.districtModel.stateUtModel.stateUtName}</td>
								
												<td>${objEngineer.pinCode}</td>
												<td>${objEngineer.yearOfEstablishment}</td>
											</tr>
											</c:if>
										</c:forEach>


									</tbody>
								</table>
							</div>




							<h1>
								Project <span>Contrators</span>
							</h1>
							<div class="drop_shadow"></div>
							<div class="clearfix"></div>
							<div class="table-responsive">

								<table class="table table-bordered">
									<thead>
										<tr>
											<th>Contractors Name</th>
											<th>Email</th>
											<th>Address</th>
											<!-- <th>Address Line 2</th> -->
											<th>Pin Code</th>
											<th>Year of Establishment</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${project.projectContratorDetailSet}"
											var="objContractor">
  <c:if test="${objContractor.status=='CONFIRMED'}">
											<tr>
												<td>${objContractor.contractorName}</td>
												<td>${objContractor.emailId}</td>
												<td>${objContractor.addressLine1},${objContractor.addressLine2},${objContractor.districtModel.districtName},${objContractor.districtModel.stateUtModel.stateUtName}</td>
										
												<td>${objContractor.pinCode}</td>
												<td>${objContractor.yearOfEstablishment}</td>
											</tr>
</c:if>										</c:forEach>

									</tbody>
								</table>
							</div>
							
							
							<h1>
								External Development <span>Work</span>
							</h1>
							<div class="drop_shadow"></div>
							<div class="clearfix"></div>
							<div class="table-responsive">

								<table class="table table-bordered">
									<thead>
										<tr>
											<th>Road System</th>
											<th>Water Supply</th>
											<th>Sewage and Drainage System</th>
											<!-- <th>Address Line 2</th> -->
											<th>Electricity Supply Transformer And Sub Station</th>
											<th>Solid Waste Management And Disposal</th>
										</tr>
									</thead>
									<tbody>
										
									

											<tr>
												<td>${project.externalDevelopmentWorkModel.roadSysetmDevBy }&nbsp;&nbsp;&nbsp;&nbsp; ${project.externalDevelopmentWorkModel.currentStatus.roadSysetmDevStatus}% Completed</td>
												<td>${project.externalDevelopmentWorkModel.waterSupplyBy }&nbsp;&nbsp;&nbsp;&nbsp; ${project.externalDevelopmentWorkModel.currentStatus.waterSupplyStatus}% Completed</td>
												<td>${project.externalDevelopmentWorkModel.sewegeAndDrainageSystemDevBy } &nbsp;&nbsp;&nbsp;&nbsp; ${project.externalDevelopmentWorkModel.currentStatus.sewegeAndDrainageStatus}% Completed</td>
										
												<td>${project.externalDevelopmentWorkModel.electricityAndTrasfomerSupply } &nbsp;&nbsp;&nbsp;&nbsp; ${project.externalDevelopmentWorkModel.currentStatus.electricityStatus}% Completed </td>
												<td>${project.externalDevelopmentWorkModel.solidWasteSupplyBy } &nbsp;&nbsp;&nbsp;&nbsp; ${project.externalDevelopmentWorkModel.currentStatus.solidWasteStatus}% Completed</td>
											</tr>
										

									</tbody>
								</table>
								
								
								
								
								<h1>
								Other External Development <span>Work</span>
							</h1>
							<div class="drop_shadow"></div>
							<div class="clearfix"></div>
							<div class="table-responsive">

								<table class="table table-bordered">
									<thead>
										<tr>
											<th>Work Description</th>
											<th>Water Supply</th>
											
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${project.externalDevelopmentWorkModel.extOtherDevSet}" var="obj">
									

											<tr>
												<td>${obj.workDesc }</p> &nbsp;&nbsp;&nbsp;&nbsp;${obj.currentStatus.status} % Completed</td>
												<td>${obj.externalDevelopmentWorkModel.waterSupplyBy }&nbsp;&nbsp;&nbsp;&nbsp; ${obj.externalDevelopmentWorkModel.currentStatus.waterSupplyStatus}% Completed</td>
														</tr>
										
													</c:forEach>
									</tbody>
								</table>
								
								
								
								
								
								
							</div>
							
							
							
							
							
							
							
							
							
							
							
							
							
						</div>
						<%-- <div class="table-responsive">

							<h1>
								Project <span>Details</span>
							</h1>
							<div class="drop_shadow"></div>
							<table class="table table-bordered">
								<thead>
									<tr>
										<th>Total Open Area <br>(Sq ft.)
										</th>
										<th>Total Coverd Area <br> (Sq ft.)
										</th>
										<th>Project Address <br> Line 1
										</th>
										<th>District</th>
										<th>Tehsil/Sub <br>District
										</th>
										<th>No of Garage</th>
										<th>Area of Garage <br> (Sq Mtr)
										</th>
										<th>No of Parking open</th>
										<th>Area of Parking open</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>${project.projectDetailsModel.totalOpenArea}</td>
										<td>${project.projectDetailsModel.totalCoverdArea}</td>
										<td>${project.projectDetailsModel.addressLine1}</td>
										<td>${project.projectDetailsModel.districtModel.stateUtModel.stateUtName}</td>
										<td>${project.projectDetailsModel.districtModel.districtName}</td>
										<td>${project.projectDetailsModel.noOfGarageForSale}</td>
										<td>${project.projectDetailsModel.areaOfGarageForSale}</td>
										<td>${project.projectDetailsModel.noOfParkinfForSale}</td>
										<td>${project.projectDetailsModel.areaOfParkinfForSale}</td>
									</tr>


								</tbody>
							</table>
						</div> --%>
					</div>


					<div class="construc_update_main">
						<h1>
							CONSTRUCTION <span>UPDATES</span> <b>Updated On march 2017</b>
						</h1>
						<div class="row">
							<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 center">
								
								<ul>
							<c:forEach items="${project.projectPhotoDetailSet }" var="poto">
						<li>	 <img src="reraimage?IMG_ID=${poto.documentId}" class="img-responsive"  alt=""/>	</li>
    </c:forEach>
     
     
     
     					
								</ul>
							</div>
						</div>
					</div>
					<br>

					<h1>Document</h1>
					<div class="border">
						<div class="orange"></div>
						<div class="black"></div>
					</div>


					<h1>Promoter Documents</h1>
					<div class="drop_shadow_Sm"></div>
					<div class="document_list">
						<div class="col-sm-4">
							<ul>
								<li><a href="">PAN Card</a></li>
								<li><a
									href="download?DOC_ID=${UploadDetails.panCardPath.documentId}">
										${UploadDetails.panCardPath.fileName} </a></li>

							</ul>
						</div>
						<div class=" col-sm-4">
							<ul>
								<li><a href="">Director Report (Last 3 Years)</a></li>
							</ul>
						</div>
					</div>
					<br>

					<div class="clearfix"></div>


					<h1>Project Documents</h1>
					<div class="drop_shadow_Sm"></div>
					<div class="document_list">
						<div class="col-sm-4">
							<ul>
								<li><a href="">Commencement Certificate</a></li>
								<li><a href="">Approved Sanctioned Plan</a></li>
								<li><a href="">Approved Layout Plan</a></li>
								<li><a href="">Legal Title Deed (Agreement)</a></li>
							</ul>
						</div>
						<div class=" col-sm-4">
							<ul>
								<li><a href="">Land documents & Location</a></li>
								<li><a href="">Sanctioned Layout Plan</a></li>
								<li><a href="">Area Development Plan</a></li>
							</ul>
						</div>
						<div class=" col-sm-4">
							<ul>
								<li><a href="">Performa of Allotment Letter</a></li>
								<li><a href="">Brochure of Current Project</a></li>
								<li><a href="">Project Related Documents</a></li>
							</ul>
						</div>

					</div>
					<h1>Financial Document</h1>
					<div class="drop_shadow_Sm"></div>
					<div class="document_list">
						<div class="col-sm-4">
							<ul>
								<li><a href="">Audited Balance Sheet (Last 3 Years)</a></li>
								<li><a href="">Audited Report (Last 3 Years)</a></li>
							</ul>
						</div>
						<div class=" col-sm-4">
							<ul>
								<li><a href="">Audited Profit/Loss Sheet (Last 3 Years)</a></li>
							</ul>
						</div>
						<div class=" col-sm-4">
							<ul>
								<li><a href="">Cash Flow Statement (Last 3 Years)</a></li>
							</ul>
						</div>
					</div>
					<br>


					<h1>Declaration</h1>
					<div class="drop_shadow_Sm"></div>
					<div class="document_list">
						<div class="col-sm-4">
							<ul>
								<li><a href="">Declaration (Form B)</a></li>
							</ul>
						</div>
					</div>
					<br>
					
					
					<h1>Other Documents</h1>
					<div class="drop_shadow_Sm"></div>
					<div class="document_list">
						<div class="col-sm-4"><c:forEach items="${project.projectDocModel.otherDocumentSet }" var="doc" >
							<ul>
								<li><a href="">${doc.caption }:</a></li>
							</ul>
							</c:forEach>
						</div>
					</div>
					<br>
					
					
					
<%-- <c:forEach items="${projectReg.projectDocModel.otherDocumentSet }" var="doc" >
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right"><span class="space_LR">${doc.caption }:</span></p></div>
			<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${doc.documentId}'>${doc.fileName }</a> </p></div>
	
	</div>
</c:forEach>
			 --%>		
					
					
					
					
					
					
					

					<h1>Photographs</h1>
					<div class="drop_shadow_Sm"></div>
					<div class="row phto1">
						
							 <ul class="thumbnails ">
    
    <c:forEach items="${project.projectPhotoDetailSet}" var="projectPhoto">
    
      <li class="col-md-4">
            <div class="thumbnail"> 

                <img src="<%=request.getContextPath() %>/reraimage?IMG_ID=${projectPhoto.documentId}" class="img-responsive">
               
            </div>
        </li>
    
    
    
	  
    </c:forEach>
</ul>
						

					</div>
					<br>
					<div class="clearfix"></div>

					<!--search list main end here-->
				</div>

				<!--inner container end here-->
			</div>
		</div>
	</div>
</div>
