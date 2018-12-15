
<%@page import="in.gov.rera.common.security.ReraSecurity"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<div class="breadcrumb">Home /Project Details</div>

<a class="pull-right user_name" href="javascript:history.back()">Back
	to List</a>



<div class="col-md-12 col-sm-12 ">

	<div class="Main_containner">

		<form name="approvalForm" id="approvalFormId" autocomplete="off"
			class="form-horizontal" action="forwardProjectRegistration"
			method="post">
			<!--Inner wrapper start here-->
			<div class="inner_wrapper">




				<h1>
					Project Registration<span> Detail</span>
				</h1>
				<span class="pull-right user_name">Ack Number :<b>
						${project.applicationNo }</b></span> <br> <span
					class="pull-right user_name">Project Name :<b>
						${project.projectDetailsModel.projectName }</b></span> <br>
				<div class="border">
					<div class="orange"></div>
					<div class="black"></div>
				</div>



				<!-----------------------------Tab start here--------------------------------->

				<div class="tab_main">

					<ul class="nav nav-tabs">
						<li class="active"><a data-toggle="tab" href="#home">Promoter
								Detail</a></li>
						<li><a data-toggle="tab" href="#menu1">Project Detail</a></li>
						<li><a data-toggle="tab" href="#menu2">Uploaded Documents</a></li>
						<li><a data-toggle="tab" href="#menu3"> Payment</a></li>
						<li><a data-toggle="tab" href="#menu4"> Enquiry Details</a></li>
					</ul>



					<div class="tab-content">
						<div id="home" class="tab-pane fade in active">



							<br>

							<div class="col-md-12">
								<h1>
									Promoter <span> Detail</span>
								</h1>
								<div class="drop_shadow"></div>
							</div>



							<div class="row">
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right ">
										Firm Type <span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-view">Individual</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										Name<span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>${project.promoterDetailsModel.promoterName }</p>
								</div>
							</div>


							<div class="row">
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										Father's Name <span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>${project.promoterDetailsModel.promoterIndividualFatherName}</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										PAN Number<span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>${project.promoterDetailsModel.panNo}</p>
								</div>
							</div>


							<div class="row">
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										Adhaar Number<span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>${project.promoterDetailsModel.adhaarNo}</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										Phone Number<span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>${project.promoterDetailsModel.telephoneNo}</p>
								</div>
							</div>


							<div class="row">
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										E-mail<span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>${project.promoterDetailsModel.emailId}</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										Fax Number<span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>${project.promoterDetailsModel.faxNumber}</p>
								</div>
							</div>


							<div class="row">
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										Address <span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>${project.promoterDetailsModel.addressLine1},${project.promoterDetailsModel.addressLine2}
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										State/UT<span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>${project.promoterDetailsModel.districtModel.stateUtModel.stateUtName}
									</p>
								</div>
							</div>

							<div class="row">
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										PIN Code <span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>${project.promoterDetailsModel.pinCode}</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										Photograph<span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>
										<a
											href='<%=request.getContextPath() %>/download?DOC_ID=${project.promoterDetailsModel.individualPhotoGraphPath.documentId}'>${project.promoterDetailsModel.individualPhotoGraphPath.fileName}</a>
									</p>
								</div>
							</div>




							<div class="inner_wrapper">

								<h1>
									Promoter Blacklist <span> Details</span>
								</h1>
								<div class="drop_shadow"></div>
								<c:forEach
									items="${project.promoterDetailsModel.promoterBlackSet}"
									var="blckListObj">



									<div class="row">
										<div class="col-md-3 col-sm-6 col-xs-6">
											<p class="text-right">
												Have you ever been blacklisted <span class="space_LR">:</span>
											</p>
										</div>
										<c:if test="${blckListObj.isBalckList==true}">
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>Yes</p>
											</div>
										</c:if>
										<c:if test="${blckListObj.isBalckList==false}">
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>No</p>
											</div>
										</c:if>
										<div class="col-md-3 col-sm-6 col-xs-6">
											<p class="text-right">
												Certificate Number<span class="space_LR">:</span>
											</p>
										</div>
										<div class="col-md-3 col-sm-6 col-xs-6">
											<p>${blckListObj.certificateNo}</p>
										</div>
									</div>

									<div class="row">
										<div class="col-md-3 col-sm-6 col-xs-6">
											<p class="text-right">
												Reason for blacklist<span class="space_LR">:</span>
											</p>
										</div>
										<div class="col-md-3 col-sm-6 col-xs-6">
											<p>${blckListObj.blacklistReason}</p>
										</div>

									</div>
								</c:forEach>
							</div>


							<div class="inner_wrapper">

								<h1>
									Previous Project <span>Details</span><span
										style="font-size: 12px; padding-left: 8px; font-weight: normal; color: #000;">
										(Last 5 years only)</span>
								</h1>
								<div class="drop_shadow"></div>
								<c:forEach items="${project.previousProjectDetailsSet}"
									var="preobj">
									<div class="row">
										<div class="col-md-3 col-sm-6 col-xs-6">
											<p class="text-right">
												Project Name<span class="space_LR">:</span>
											</p>
										</div>
										<div class="col-md-3 col-sm-6 col-xs-6">
											<p>${preobj.projectName}</p>
										</div>
										<div class="col-md-3 col-sm-6 col-xs-6">
											<p class="text-right">
												Project Description<span class="space_LR">:</span>
											</p>
										</div>
										<div class="col-md-3 col-sm-6 col-xs-6">
											<p>${preobj.projectDescription}</p>
										</div>
									</div>


									<div class="row">
										<div class="col-md-3 col-sm-6 col-xs-6">
											<p class="text-right">
												Current Status <span class="space_LR">:</span>
											</p>
										</div>
										<div class="col-md-3 col-sm-6 col-xs-6">
											<p>${preobj.projectCurrentStatus}</p>
										</div>
										<div class="col-md-3 col-sm-6 col-xs-6">
											<p class="text-right">
												Type of Land<span class="space_LR">:</span>
											</p>
										</div>
										<div class="col-md-3 col-sm-6 col-xs-6">
											<p>${preobj.typeOfLand}</p>
										</div>
									</div>


									<div class="row">
										<div class="col-md-3 col-sm-6 col-xs-6">
											<p class="text-right">
												If Delayed<span class="space_LR">:</span>
											</p>
										</div>
										<div class="col-md-3 col-sm-6 col-xs-6">
											<p>${preobj.ifDelayed}</p>
										</div>
										<div class="col-md-3 col-sm-6 col-xs-6">
											<p class="text-right">
												No of Months<span class="space_LR">:</span>
											</p>
										</div>
										<div class="col-md-3 col-sm-6 col-xs-6">
											<p>${preobj.noOfMonthDelayed}</p>
										</div>
									</div>

									<div class="row">
										<div class="col-md-3 col-sm-6 col-xs-6">
											<p class="text-right">
												If Ongoing <span class="space_LR">:</span>
											</p>
										</div>
										<div class="col-md-3 col-sm-6 col-xs-6">
											<p>${preobj.ifOngoing}</p>
										</div>
										<div class="col-md-3 col-sm-6 col-xs-6">
											<p class="text-right">
												Expected Completion Date<span class="space_LR">:</span>
											</p>
										</div>
										<div class="col-md-3 col-sm-6 col-xs-6">
											<p>${preobj.expectedCompletionDate.time}</p>
										</div>
									</div>
									<div class="row">
										<div class="col-md-3 col-sm-6 col-xs-6">
											<p class="text-right">
												Address<span class="space_LR">:</span>
											</p>
										</div>
										<div class="col-md-3 col-sm-6 col-xs-6">
											<p>${preobj.projectAddress}</p>
										</div>
										<div class="col-md-3 col-sm-6 col-xs-6">
											<p class="text-right">
												State/UT<span class="space_LR">:</span>
											</p>
										</div>
										<div class="col-md-3 col-sm-6 col-xs-6">
											<p>${preobj.districtModel.stateUtModel.stateUtName}</p>
										</div>
									</div>


									<div class="row">
										<div class="col-md-3 col-sm-6 col-xs-6">
											<p class="text-right">
												District<span class="space_LR">:</span>
											</p>
										</div>
										<div class="col-md-3 col-sm-6 col-xs-6">
											<p>${preobj.districtModel.districtName}</p>
										</div>
										<div class="col-md-3 col-sm-6 col-xs-6">
											<p class="text-right">
												Pin Code<span class="space_LR">:</span>
											</p>
										</div>
										<div class="col-md-3 col-sm-6 col-xs-6">
											<p>${preobj.projectAddrPinCode}</p>
										</div>
									</div>
								</c:forEach>
							</div>



						</div>



						<div id="menu1" class="tab-pane fade">

							<br>

							<div class="col-md-12">
								<h1>
									Project <span> Detail</span>
								</h1>
								<div class="drop_shadow"></div>
							</div>



							<div class="row">
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right ">
										Project Name <span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-view">${project.projectDetailsModel.projectName}</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										Project <span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>${project.projectDetailsModel.projectDescription}</p>
								</div>
							</div>


							<div class="row">
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										Project Type<span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>${project.projectDetailsModel.projectType}</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										Project Status<span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>${project.projectDetailsModel.projectStatus}</p>
								</div>
							</div>


							<div class="row">
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										Project Start Date<span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>



										<fmt:formatDate type="date" pattern="dd-MM-yyyy"
											dateStyle="short"
											value="${project.projectDetailsModel.startDate.time}" />


									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										Project End Date<span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>

										<fmt:formatDate type="date" pattern="dd-MM-yyyy"
											dateStyle="short"
											value="${project.projectDetailsModel.completionDate.time}" />



									</p>
								</div>
							</div>


							<div class="row">
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										Total Area Of Land (Sq Mtr)<span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>${project.projectDetailsModel.totalAreaOfLand}</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										Total Coverd Area (Sq Mtr) <span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>${project.projectDetailsModel.totalCoverdArea}</p>
								</div>
							</div>

							<div class="row">
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										Total Open Area (Sq Mtr)<span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>${project.projectDetailsModel.totalOpenArea}</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										Estimated Cost of Construction (INR) <span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>${project.projectDetailsModel.estimatedCost}</p>
								</div>
							</div>

							<div class="row">
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										Cost of Land (INR)<span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>${project.projectDetailsModel.costOfLand}</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										Total Project Cost (INR) <span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>${project.projectDetailsModel.totalProjectCost}</p>
								</div>
							</div>


							<div class="row">
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										Project Address Line <span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>${project.projectDetailsModel.addressLine1},
										${project.projectDetailsModel.addressLine2}</p>
								</div>

							</div>

							<div class="row">
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										District<span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>${project.projectDetailsModel.subDistrictModel.districtModel.districtName}
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										Tehsil/Sub District<span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>
										${project.projectDetailsModel.subDistrictModel.subDistrictName}
									</p>
								</div>
							</div>

							<%-- <div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Latitude<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.projectDetailsModel.latitude} </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Longitude<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p> ${project.projectDetailsModel.longitude} </p></div>
	</div> --%>


							<div class="row">
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										Nort Latitude<span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>${project.projectDetailsModel.northlatitude}</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										Nort Longitude<span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>${project.projectDetailsModel.northlongitude}</p>
								</div>
							</div>

							<div class="row">
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										East Latitude<span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>${project.projectDetailsModel.eastlatitude}</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										East Longitude<span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>${project.projectDetailsModel.eastlongitude}</p>
								</div>
							</div>


							<div class="row">
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										West Latitude<span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>${project.projectDetailsModel.westlatitude}</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										West Longitude<span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>${project.projectDetailsModel.westlongitude}</p>
								</div>
							</div>

							<div class="row">
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										South Latitude<span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>${project.projectDetailsModel.southlatitude}</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										South Longitude<span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>${project.projectDetailsModel.southlongitude}</p>
								</div>
							</div>

							<div class="row">
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										Approving Authority<span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>${project.projectDetailsModel.office.officeName}</p>
								</div>
							</div>


							<div class="row">
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										No of Garage for Sale<span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>${project.projectDetailsModel.noOfGarageForSale}</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										Area of Garage for Sale (Sq Mtr)<span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>${project.projectDetailsModel.areaOfGarageForSale}</p>
								</div>
							</div>


							<div class="row">
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										No of Open Parking for Sale <span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>${project.projectDetailsModel.noOfParkinfForSale}</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										Area of Open Parking for Sale (Sq Mtr)<span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>${project.projectDetailsModel.areaOfParkinfForSale}</p>
								</div>
							</div>


							<div class="row">
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										No of Covered Parking for Sale <span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>${project.projectDetailsModel.noOfCoveredParkingForSale}
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										Area of Covered Parking for Sale (Sq Mtr)<span
											class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>${project.projectDetailsModel.areaOfCoveredParkingForSale}
									</p>
								</div>
							</div>














							<div class="inner_wrapper">

								<h1>
									Project Ongoing <span> Status</span>
								</h1>
								<div class="drop_shadow"></div>

								<div class="row">
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Extent of development carried till date<span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>${project.projectDetailsModel.devCompletion}%</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Extent of development pending<span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>${project.projectDetailsModel.devPending}%</p>
									</div>
								</div>

								<div class="row">
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Total amount of money collected form allotee<span
												class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>${project.projectDetailsModel.totalAmtClctedFrmAllotee}</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Total amount of money used from development of project<span
												class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>${project.projectDetailsModel.totalAmtUsedInPrjct}</p>
									</div>

								</div>

								<div class="row">
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Total amount of balance maney lying with promoter<span
												class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>${project.projectDetailsModel.totalBalAmtOfAlte}</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Is Any Subsequent Modification in Plan<span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>${project.projectDetailsModel.isSubSqChangeInPlan}</p>
									</div>


								</div>

								<div class="row">
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Is Delay in the Project<span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>${project.projectDetailsModel.isDelayed}</p>
									</div>

								</div>

								<div class="row">
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Reason For Delay<span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>${project.projectDetailsModel.reasonForDelayed}</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											No of Month Delay<span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>${project.projectDetailsModel.noOfMonthDelayed}</p>
									</div>


								</div>

								<div class="row">
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Expected Completion Date<span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>${project.projectDetailsModel.estimatedEndDate.time}</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Certificate form Architect,Engineer,CA etc.<span
												class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>
											<a
												href="<%=request.getContextPath() %>/download?DOC_ID=${project.projectDetailsModel.delayedCertDoc.documentId}">
												${project.projectDetailsModel.delayedCertDoc.fileName }</a>
										</p>
									</div>


								</div>


							</div>



							<div class="inner_wrapper">

								<h1>
									Development <span> Details</span>
								</h1>
								<div class="drop_shadow"></div>
								<c:forEach items="${project.developmentDetailSet}" var="devObj">


									<div class="row">
										<div class="col-md-3 col-sm-6 col-xs-6">
											<p class="text-right">
												Type of Inventory<span class="space_LR">:</span>
											</p>
										</div>
										<div class="col-md-3 col-sm-6 col-xs-6">
											<p>${devObj.typeOfInventory}</p>
										</div>
										<div class="col-md-3 col-sm-6 col-xs-6">
											<p class="text-right">
												No of Inventory<span class="space_LR">:</span>
											</p>
										</div>
										<div class="col-md-3 col-sm-6 col-xs-6">
											<p>${devObj.noOfInventory}</p>
										</div>
									</div>

									<div class="row">
										<div class="col-md-3 col-sm-6 col-xs-6">
											<p class="text-right">
												Carpet Area (Sq Mtr)<span class="space_LR">:</span>
											</p>
										</div>
										<div class="col-md-3 col-sm-6 col-xs-6">
											<p>${devObj.carpetArea}Sq Mtr</p>
										</div>
										<div class="col-md-3 col-sm-6 col-xs-6">
											<p class="text-right">
												Area of exclusive balcony/verandah (Sq Mtr)<span
													class="space_LR">:</span>
											</p>
										</div>
										<div class="col-md-3 col-sm-6 col-xs-6">
											<p>${devObj.areaOfExclusive}Sq Mtr</p>
										</div>

									</div>

									<div class="row">
										<div class="col-md-3 col-sm-6 col-xs-6">
											<p class="text-right">
												Area of exclusive open terrace if any (Sq Mtr)<span
													class="space_LR">:</span>
											</p>
										</div>
										<div class="col-md-3 col-sm-6 col-xs-6">
											<p>${devObj.areaOfExclusiveOpenTerrace}Sq Mtr</p>
										</div>


									</div>

								</c:forEach>
							</div>




							<div class="inner_wrapper">

								<h1>
									External Development <span>Work</span>
								</h1>
								<div class="drop_shadow"></div>

								<div class="row">
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Road And Road System<span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>${project.externalDevelopmentWorkModel.roadSysetmDevBy }</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Water Supply<span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>${project.externalDevelopmentWorkModel.waterSupplyBy }
										</p>
									</div>
								</div>


								<div class="row">
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Sewege and Drainage System <span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>${project.externalDevelopmentWorkModel.sewegeAndDrainageSystemDevBy }
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Electricity Supply Trasfomer And Sub Stattion<span
												class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>${project.externalDevelopmentWorkModel.electricityAndTrasfomerSupply }
										</p>
									</div>
								</div>


								<div class="row">
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Solid Waste Managment And Disposal<span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>${project.externalDevelopmentWorkModel.solidWasteSupplyBy }
										</p>
									</div>

								</div>

								<!-- Added 4 new fields -->

								<div class="row">
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Fire Fighting facility <span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>${project.externalDevelopmentWorkModel.fireFighting }</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Drinking Water Facility<span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>${project.externalDevelopmentWorkModel.drinkingWater}</p>
									</div>
								</div>
								<div class="row">
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Emergency Evacuation Services <span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>${project.externalDevelopmentWorkModel.emergencyEvacuation }
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Use of Renewable Energy<span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>${project.externalDevelopmentWorkModel.renewableEnergy}
										</p>
									</div>
								</div>


							</div>



							<div class="inner_wrapper">

								<h1>
									Project <span>Bank</span>
								</h1>
								<div class="drop_shadow"></div>

								<div class="row">
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Bank Name<span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>${project.projectBankDetailsModel.bankModel.bankName}</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Branch<span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>${project.projectBankDetailsModel.bankBranch}</p>
									</div>

								</div>
								<div class="row">
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Account No.<span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>${project.projectBankDetailsModel.accountNumber}</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											ifscCode<span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>${project.projectBankDetailsModel.ifscCode}</p>
									</div>

								</div>

								<div class="row">
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											State<span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>${project.projectBankDetailsModel.districtModel.stateUtModel.stateUtName}
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											District<span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>${project.projectBankDetailsModel.districtModel.districtName}
										</p>
									</div>

								</div>


							</div>






							<div class="inner_wrapper">

								<h1>
									Associated Vendor <span>Work</span>
								</h1>

								<div class="inner_wrapper">

									<h1>
										Project <span>Agent</span>
									</h1>
									<div class="drop_shadow"></div>
									<c:forEach items="${project.projectAgentDetailSet}"
										var="preAgentObj">
										<c:if test="${preAgentObj.status=='CONFIRMED'}">
											<div class="row">
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														Agent Registration No.<span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${preAgentObj.agent.agentRegistrationNo}</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														Agent Name<span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${preAgentObj.agent.agentDetailsModel.agentName}</p>
												</div>
											</div>


											<div class="row">
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														Agent Address<span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>
														${preAgentObj.agent.agentDetailsModel.agentIndividualAddressLine1}
													</p>
												</div>

											</div>
										</c:if>
									</c:forEach>



								</div>

								<div class="inner_wrapper">

									<h1>
										Project <span>Architects</span>
									</h1>


									<c:forEach items="${project.projectArchitectDetailSet}"
										var="arctObj">
										<c:if test="${arctObj.status=='CONFIRMED'}">
											<div class="drop_shadow"></div>
											<div class="row">
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														Name<span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${arctObj.architectName}</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														EmailID<span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${arctObj.emailId}</p>
												</div>
											</div>


											<div class="row">
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														Sate<span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${arctObj.districtModel.stateUtModel.stateUtName}</p>
													<p></p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														District<span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${arctObj.districtModel.districtName}</p>
												</div>
											</div>

											<div class="row">
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														Address line<span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${arctObj.addressLine1},${arctObj.addressLine2}</p>
													<p></p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														Pine Code<span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${arctObj.pinCode}</p>
												</div>
											</div>


											<div class="row">
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														Year Of Establishment<span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${arctObj.yearOfEstablishment}</p>
													<p></p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														Number of Project Completed <span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${arctObj.keyProject }</p>
												</div>
											</div>
											<div class="row">
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														Reg. Of COA No.<span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${arctObj.regOfCoaNo}</p>
													<p></p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right"></p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p></p>
												</div>
											</div>
										</c:if>

									</c:forEach>


								</div>

								<div class="inner_wrapper">

									<h1>
										Structural <span>Engineers</span>
									</h1>

									<c:forEach items="${project.structuralEngineerDetailSet}"
										var="strObj">
										<c:if test="${strObj.status=='CONFIRMED'}">
											<div class="drop_shadow"></div>
											<div class="row">
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														Name<span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${strObj.engineerName}</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														EmailID<span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${strObj.emailId}</p>
												</div>
											</div>


											<div class="row">
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														Sate<span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${strObj.districtModel.stateUtModel.stateUtName}</p>
													<p></p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														District<span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${strObj.districtModel.districtName}</p>
												</div>
											</div>

											<div class="row">
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														Address line<span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${strObj.addressLine1},${strObj.addressLine2}</p>
													<p></p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														Pine Code<span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${strObj.pinCode}</p>
												</div>
											</div>


											<div class="row">
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														Year Of Establishment<span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${strObj.yearOfEstablishment}</p>
													<p></p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														Number of Project Completed<span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${strObj.keyProject }</p>
												</div>
											</div>

											<div class="row">
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														Local Authority Licence Number<span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${strObj.localAuthorityLicenceNumber}</p>
													<p></p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right"></p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p></p>
												</div>
											</div>

										</c:if>
									</c:forEach>



								</div>

								<div class="inner_wrapper">

									<h1>
										Project <span>Contrators</span>
									</h1>


									<c:forEach items="${project.projectContratorDetailSet}"
										var="strObj">
										<c:if test="${strObj.status=='CONFIRMED'}">
											<div class="drop_shadow"></div>

											<div class="row">
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														Name<span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${strObj.contractorName}</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														EmailID<span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${strObj.emailId}</p>
												</div>
											</div>


											<div class="row">
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														Sate<span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${strObj.districtModel.stateUtModel.stateUtName}</p>
													<p></p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														District<span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${strObj.districtModel.districtName}</p>
												</div>
											</div>

											<div class="row">
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														Address line<span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${strObj.addressLine1},${strObj.addressLine2}</p>
													<p></p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														Pine Code<span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${strObj.pinCode}</p>
												</div>
											</div>


											<div class="row">
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														Year Of Establishment<span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${strObj.yearOfEstablishment}</p>
													<p></p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														Number Of Project Completed<span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${strObj.keyProject }</p>
												</div>
											</div>


										</c:if>

									</c:forEach>




								</div>

							</div>


						</div>


						<div id="menu2" class="tab-pane fade">

							<br>




							<div class="inner_wrapper">

								<h1>
									Promoter <span> Document </span>
								</h1>
								<div class="drop_shadow"></div>


								<div class="row">
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											PAN Card <span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>
											<a
												href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.panCardDoc.documentId}'>${project.projectDocModel.panCardDoc.fileName }</a>
										</p>
									</div>
								</div>


							</div>



							<div class="inner_wrapper">

								<h1>
									Project <span>Approval</span>
								</h1>
								<div class="drop_shadow"></div>

								<div class="row">
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Commencement Certificate<span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>
											<a
												href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.commencementCertDoc.documentId}'>${project.projectDocModel.commencementCertDoc.fileName }</a>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Approved Building/Plotting Plan<span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>
											<a
												href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.approveSacPlanDoc.documentId}'>${project.projectDocModel.approveSacPlanDoc.fileName }</a>
										</p>
									</div>
								</div>





								<div class="row">
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Approved Layout Plan <span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>
											<a
												href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.approveLayoutPlanDoc.documentId}'>${project.projectDocModel.approveLayoutPlanDoc.fileName }</a>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Proforma For Sale Deed <span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>
											<a
												href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.agreementFileDoc.documentId}'>${project.projectDocModel.agreementFileDoc.fileName }</a>
										</p>
									</div>
								</div>

								<div class="row">
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Existing Layout Plan <span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>
											<a
												href="download?DOC_ID=${project.projectDocModel.extendedLayoutPlanDoc.documentId}">
												${project.projectDocModel.extendedLayoutPlanDoc.fileName} </a>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Existing Section Plan and Specification <span
												class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>
											<a
												href="download?DOC_ID=${project.projectDocModel.extendedSacPlanDoc.documentId}">
												${project.projectDocModel.extendedSacPlanDoc.fileName} </a>
										</p>
									</div>
								</div>

								<div class="row">
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Sale Deed & RTC<span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>
											<a
												href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.landLocationFileDoc.documentId}'>${project.projectDocModel.landLocationFileDoc.fileName }</a>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Approved Section Of Building/Infrastructure Plan of Plotting<span
												class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>
											<a
												href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.sanctionedLayoutPlanDoc.documentId}'>${project.projectDocModel.sanctionedLayoutPlanDoc.fileName }</a>
										</p>
									</div>
								</div>

								<div class="row">
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Area Development Plan Of Project Area<span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>
											<a
												href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.areaDevelopmentDoc.documentId}'>${project.projectDocModel.areaDevelopmentDoc.fileName }</a>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Performa of Allotment Letter<span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>
											<a
												href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.performaOfAllotmentLetterDoc.documentId}'>${project.projectDocModel.performaOfAllotmentLetterDoc.fileName }</a>
										</p>
									</div>
								</div>
								<div class="row">
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Brochure of Current Project<span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>
											<a
												href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.brochureOfCurrentProjectDoc.documentId}'>${project.projectDocModel.brochureOfCurrentProjectDoc.fileName }</a>
										</p>
									</div>
									<%-- <div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">All NOCs from Authority<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.projectRelatedDoc.documentId}'>${project.projectDocModel.projectRelatedDoc.fileName }</a> </p></div> --%>
								</div>
								<div class="row">
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Project Specification<span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>
											<a
												href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.projectSpecificDoc.documentId}'>${project.projectDocModel.projectSpecificDoc.fileName }</a>
										</p>
									</div>

									<!--  Added new field -->
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Encumbrance Certificate<span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>
											<a
												href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.encumbranceCertificateDoc.documentId}'>${project.projectDocModel.encumbranceCertificateDoc.fileName }</a>
										</p>
									</div>
								</div>

								<!--  Start added new 3 docs -->
								<div class="row">
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Conveyance Deed / Title Deed (Khatha)<span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>
											<a
												href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.titleDeed.documentId}'>${project.projectDocModel.titleDeed.fileName }</a>
										</p>
									</div>

									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Collaboration Agreement/Development Agreement/Joint
											Development Agreement/Other Agreement<span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>
											<a
												href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.jointDevelopmentAgreement.documentId}'>${project.projectDocModel.jointDevelopmentAgreement.fileName }</a>
										</p>
									</div>

								</div>



								<!-- Added by Suneetha -->
								<div class="row">
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Any other document (Rights/Title/Interest/Name) <span
												class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>
											<a
												href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectAddDocModel.anyOtherDoc.documentId}'>${project.projectAddDocModel.anyOtherDoc.fileName }</a>
										</p>
									</div>

									<!-- </div>
	
	
	<div class="row"> -->
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Conversion Certificate under Sec 95 of the KLR Act 1961 <span
												class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>
											<a
												href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectAddDocModel.section95.documentId}'>${project.projectAddDocModel.section95.fileName }</a>
										</p>
									</div>

								</div>
								<div class="row">
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Approval/NOC under Sec 14 of the KTCP Act<span
												class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>
											<a
												href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectAddDocModel.section14.documentId}'>${project.projectAddDocModel.section14.fileName }</a>
										</p>
									</div>

									<!-- </div>
	
	<div class="row"> -->
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Approval/NOC under section 109 of KLR Act 1961 <span
												class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>
											<a
												href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectAddDocModel.section109.documentId}'>${project.projectAddDocModel.section109.fileName }</a>
										</p>
									</div>

								</div>


								<!-- Added by Suneetha -->
								<%-- <div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Utilisation certificate<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectAddDocModel.utilisationCert.documentId}'>${project.projectAddDocModel.utilisationCert.fileName }</a></p></div>
		
	</div>
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Transfer of development rights certificate<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectAddDocModel.transferOfDevRightsCert.documentId}'>${project.projectAddDocModel.transferOfDevRightsCert.fileName }</a></p></div>
		
	</div>
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Relinquishment Deed<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectAddDocModel.relinquishmenDeed.documentId}'>${project.projectAddDocModel.relinquishmenDeed.fileName }</a></p></div>
		
	</div> --%>

								<div class="drop_shadow"></div>

								<h1>
									No Objection <span>Certificates</span>
								</h1>
								<div class="drop_shadow"></div>

								<div class="row">
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Fire Force Department<span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>
											<a
												href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectAddDocModel.fireForceDept.documentId}'>${project.projectAddDocModel.fireForceDept.fileName }</a>
										</p>
									</div>

									<!-- </div>
	
	<div class="row"> -->
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Airport Authority of India<span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>
											<a
												href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectAddDocModel.airportAuthorityOfIndia.documentId}'>${project.projectAddDocModel.airportAuthorityOfIndia.fileName }</a>
										</p>
									</div>

								</div>

								<div class="row">
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											BESCOM<span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>
											<a
												href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectAddDocModel.bescom.documentId}'>${project.projectAddDocModel.bescom.fileName }</a>
										</p>
									</div>

									<!-- </div>
	
	<div class="row"> -->
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											BWSSB<span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>
											<a
												href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectAddDocModel.bwssb.documentId}'>${project.projectAddDocModel.bwssb.fileName }</a>
										</p>
									</div>

								</div>

								<div class="row">
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											KSPCB<span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>
											<a
												href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectAddDocModel.kspcb.documentId}'>${project.projectAddDocModel.kspcb.fileName }</a>
										</p>
									</div>

									<!-- </div>
	
	<div class="row"> -->
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											SEIAA<span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>
											<a
												href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectAddDocModel.seiaa.documentId}'>${project.projectAddDocModel.seiaa.fileName }</a>
										</p>
									</div>

								</div>

								<div class="row">
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											BSNL<span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>
											<a
												href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectAddDocModel.bsnl.documentId}'>${project.projectAddDocModel.bsnl.fileName }</a>
										</p>
									</div>

									<!-- </div>
	
		  <div class="row"> -->
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											NOC in case of building proposals abutting to neighbouring
											properties<span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>
											<a
												href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectAddDocModel.nocBuildingAbuttingToNeighbourProperties.documentId}'>${project.projectAddDocModel.nocBuildingAbuttingToNeighbourProperties.fileName }</a>
										</p>
									</div>

								</div>

								<div class="row">
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Lift Authorities<span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>
											<a
												href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectAddDocModel.liftAuthorities.documentId}'>${project.projectAddDocModel.liftAuthorities.fileName }</a>
										</p>
									</div>

									<!-- </div>  
	
	<div class="row"> -->
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Urban Land Ceiling<span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>
											<a
												href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectAddDocModel.urbanLandCeiling.documentId}'>${project.projectAddDocModel.urbanLandCeiling.fileName }</a>
										</p>
									</div>

								</div>

								<div class="row">
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											BMRCL<span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>
											<a
												href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectAddDocModel.bmrcl.documentId}'>${project.projectAddDocModel.bmrcl.fileName }</a>
										</p>
									</div>

									<!-- </div>
	
	 <div class="row"> -->
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Bangalore Urban Arts Commission<span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>
											<a
												href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectAddDocModel.bangaloreUrbanArtsCommission.documentId}'>${projectprojectReg.projectAddDocModel.bangaloreUrbanArtsCommission.fileName }</a>
										</p>
									</div>

								</div>

								<div class="row">
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Inspector of Factories Controller of explosives Railways<span
												class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>
											<a
												href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectAddDocModel.inspectorOfFactoriesCntrlOfExplosivesRailways.documentId}'>${project.projectAddDocModel.inspectorOfFactoriesCntrlOfExplosivesRailways.fileName }</a>
										</p>
									</div>

									<!-- </div>
	
	<div class="row"> -->
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Dist Magistrate<span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>
											<a
												href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectAddDocModel.distMagistrate.documentId}'>${project.projectAddDocModel.distMagistrate.fileName }</a>
										</p>
									</div>

								</div>

								<div class="row">
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Coastal Regulation Zone Authority<span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>
											<a
												href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectAddDocModel.coastalRegulationZoneAuthority.documentId}'>${projectReg.projectAddDocModel.coastalRegulationZoneAuthority.fileName }</a>
										</p>
									</div>

									<!-- </div>
	
	<div class="row"> -->
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Certificate from Registered Engineer indicating the
											structural safety of the building (for Apartments)<span
												class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>
											<a
												href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectAddDocModel.engrIndicateStructural.documentId}'>${project.projectAddDocModel.engrIndicateStructural.fileName }</a>
										</p>
									</div>

								</div>

								<div class="row">
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Sectional Drawing of the apartments<span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>
											<a
												href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectAddDocModel.sectionalDrawingOfTheApartments.documentId}'>${project.projectAddDocModel.sectionalDrawingOfTheApartments.fileName }</a>
										</p>
									</div>

									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Change of Land Use<span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>
											<a
												href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.changeOfLandUse.documentId}'>${project.projectDocModel.changeOfLandUse.fileName }</a>
										</p>
									</div>

								</div>
								<!-- End of Suneetha -->

								<div class="row">
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Existing Layout Plan<span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>
											<a
												href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.existingLayoutPlan.documentId}'>${project.projectDocModel.existingLayoutPlan.fileName }</a>
										</p>
									</div>


									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Existing Section Plan and Specification<span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>
											<a
												href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.existingSectionPlanandSpec.documentId}'>${project.projectDocModel.existingSectionPlanandSpec.fileName }</a>
										</p>
									</div>

								</div>

								<%-- <div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Change of Land Use<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.changeOfLandUse.documentId}'>${project.projectDocModel.changeOfLandUse.fileName }</a></p></div>
		
	</div> --%>

								<div class="drop_shadow"></div>
								<h1>
									Benefit of Development <span>Rights</span>
								</h1>
								<div class="drop_shadow"></div>

								<div class="row">
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-left">
											Utilisation certificate<span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>
											<a
												href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectAddDocModel.utilisationCert.documentId}'>${project.projectAddDocModel.utilisationCert.fileName }</a>
										</p>
									</div>

									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-left">
											Transfer of development rights certificate<span
												class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>
											<a
												href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectAddDocModel.transferOfDevRightsCert.documentId}'>${project.projectAddDocModel.transferOfDevRightsCert.fileName }</a>
										</p>
									</div>

								</div>

								<div class="row">
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-left">
											Relinquishment Deed<span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>
											<a
												href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectAddDocModel.relinquishmenDeed.documentId}'>${project.projectAddDocModel.relinquishmenDeed.fileName }</a>
										</p>
									</div>
									
									
										<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-left">
											Advocate Search Report<span
												class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>
											<a
												href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectAddDocModel.advocatesearchreport.documentId}'>${project.projectAddDocModel.advocatesearchreport.fileName }</a>
										</p>
									</div>

								</div>


								<!--  end added new 3 docs -->

							</div>

							<div class="inner_wrapper">

								<h1>
									Financial <span>Document</span>
								</h1>
								<div class="drop_shadow"></div>

								<div class="row">
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Audited Balance Sheet (2014)<span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>
											<a
												href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.auditedBalSheetDoc1.documentId}'>${project.projectDocModel.auditedBalSheetDoc1.fileName }</a>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Audited Balance Sheet (2015)<span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>
											<a
												href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.auditedBalSheetDoc2.documentId}'>${project.projectDocModel.auditedBalSheetDoc2.fileName }</a>
										</p>
									</div>
								</div>


								<div class="row">
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Audited Balance Sheet (2016) <span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>
											<a
												href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.auditedBalSheetDoc3.documentId}'>${project.projectDocModel.auditedBalSheetDoc3.fileName }</a>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Audited ProfitLoss Statement (2014) <span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>
											<a
												href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.auditedProfitLossSheetDoc1.documentId}'>${project.projectDocModel.auditedProfitLossSheetDoc1.fileName }</a>
										</p>
									</div>
								</div>


								<div class="row">
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Audited ProfitLoss Statement (2015) <span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>
											<a
												href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.auditedProfitLossSheetDoc2.documentId}'>${project.projectDocModel.auditedProfitLossSheetDoc2.fileName }</a>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Audited ProfitLoss Statement (2016) <span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>
											<a
												href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.auditedProfitLossSheetDoc3.documentId}'>${project.projectDocModel.auditedProfitLossSheetDoc3.fileName }</a>
										</p>
									</div>
								</div>

								<div class="row">
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Director's Report (2014) <span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>
											<a
												href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.directorReportDoc1.documentId}'>${project.projectDocModel.directorReportDoc1.fileName }</a>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Director's Report (2015) <span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>
											<a
												href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.directorReportDoc2.documentId}'>${project.projectDocModel.directorReportDoc2.fileName }</a>
										</p>
									</div>
								</div>

								<div class="row">
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Director's Report (2016) <span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>
											<a
												href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.directorReportDoc3.documentId}'>${project.projectDocModel.directorReportDoc3.fileName }</a>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Cash Flow Statement (2014) <span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>
											<a
												href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.cashFlowStmtFileDoc1.documentId}'>${project.projectDocModel.cashFlowStmtFileDoc1.fileName }</a>
										</p>
									</div>
								</div>

								<div class="row">
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Cash Flow Statement (2015) <span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>
											<a
												href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.cashFlowStmtFileDoc2.documentId}'>${project.projectDocModel.cashFlowStmtFileDoc2.fileName }</a>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Cash Flow Statement (2016) <span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>
											<a
												href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.cashFlowStmtFileDoc3.documentId}'>${project.projectDocModel.cashFlowStmtFileDoc3.fileName }</a>
										</p>
									</div>
								</div>

								<div class="row">
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Auditors Report (2014) <span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>
											<a
												href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.auditorsDoc1.documentId}'>${project.projectDocModel.auditorsDoc1.fileName }</a>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Auditors Report (2015) <span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>
											<a
												href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.auditorsDoc2.documentId}'>${project.projectDocModel.auditorsDoc2.fileName }</a>
										</p>
									</div>
								</div>

								<div class="row">
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Auditors Report (2016) <span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>
											<a
												href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.auditorsDoc3.documentId}'>${project.projectDocModel.auditorsDoc3.fileName }</a>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Income Tax Return (2014) <span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>
											<a
												href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.incomeTaxReturn1.documentId}'>${project.projectDocModel.incomeTaxReturn1.fileName }</a>
										</p>
									</div>
								</div>

								<div class="row">
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Income Tax Return (2015) <span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>
											<a
												href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.incomeTaxReturn2.documentId}'>${project.projectDocModel.incomeTaxReturn2.fileName }</a>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Income Tax Return (2016) <span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>
											<a
												href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.incomeTaxReturn3.documentId}'>${project.projectDocModel.incomeTaxReturn3.fileName }</a>
										</p>
									</div>
								</div>

							</div>
							<div class="inner_wrapper">

								<h1>Declaration</h1>
								<div class="drop_shadow"></div>

								<div class="row">
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Declaration (Form B)<span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>
											<a
												href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.declarationFormbDoc.documentId}'>${project.projectDocModel.declarationFormbDoc.fileName }</a>
										</p>
									</div>

								</div>

							</div>



							<div class="inner_wrapper">

								<h1>
									Project <span>Photo</span>
								</h1>
								<div class="drop_shadow"></div>


								<c:forEach items="${project.projectPhotoDetailSet}"
									var="projectPhoto">
									<div class="drop_shadow"></div>

									<div class="row">
										<div class="col-md-3 col-sm-6 col-xs-6">
											<p class="text-right">
												Project Photo Uploaded<span class="space_LR">:</span>
											</p>
										</div>
										<div class="col-md-3 col-sm-6 col-xs-6">
											<p>
												<a
													href='<%=request.getContextPath() %>/download?DOC_ID=${projectPhoto.documentId}'>${projectPhoto.documentName}</a>
											</p>
										</div>

									</div>

								</c:forEach>


							</div>



						</div>



						<div id="menu3" class="tab-pane fade">


							<br>

							<div class="col-md-12">
								<h1>
									Payment <span> Detail</span>
								</h1>
								<div class="drop_shadow"></div>
							</div>





							<c:if
								test="${project.paymentDetailsModel.paymentMode!='Payment Gateway'}">
								<div class="row">

									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Payment Mode<span class="space_LR">:</span>
										</p>
									</div>

									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>${project.paymentDetailsModel.paymentMode}</p>
									</div>

									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Unique Token Number<span class="space_LR">:</span>
										</p>
									</div>

									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>${project.paymentDetailsModel.paymentToken}</p>
									</div>


									<%-- <div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Bank Name<span class="space_LR">:</span></p></div>
     <div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.auditedBalSheetYear2.documentId}'>${project.projectDocModel.auditedBalSheetYear2.fileName }</a></p></div>
	 --%>
								</div>



								<div class="row">
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Amount<span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>${project.paymentDetailsModel.amount}</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Khajane2 Challan Number <span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>${project.paymentDetailsModel.sbiTransactionRefNo}</p>
									</div>
								</div>


								<div class="row">
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											<span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p></p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Online Payment Receipt<span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>
											<a
												href='<%=request.getContextPath() %>/download?DOC_ID=${project.paymentDetailsModel.scanCopyDoc.documentId}'>${project.paymentDetailsModel.scanCopyDoc.fileName}
											</a>
										</p>
									</div>

								</div>
							</c:if>

							<c:if
								test="${project.paymentDetailsModel.paymentMode=='Payment Gateway'}">

								<div class="row">
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Payment Mode<span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>${project.paymentDetailsModel.paymentMode}</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Amount<span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>${project.paymentDetailsModel.amount}</p>
									</div>

								</div>


								<div class="row">

									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Payment Through<span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>${project.paymentDetailsModel.online.mode}</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Transaction No.<span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>${project.paymentDetailsModel.online.transactionNo}</p>
									</div>
								</div>
								<div class="row"></div>

							</c:if>

					
						<c:if test="${userType == 'OP_ACCOUNTS' }">
						
						<br><label class="col-sm-2 control-label">Is Payment verified</label>
						<div class="radio">
						<label> <input type="radio" name="isPaymentVerified"  class="requiredValFld" id="optionsRadios1" value="yes" > Yes
						<span class='requiredValFldMsg'> Please select payment.</span>
						</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label>
						<input	type="radio" name="isPaymentVerified"  class="requiredValFld" id="optionsRadios2" value="no" >No
						</label>
						</div>
						<br></c:if>




						</div>
						
						


						<div id="menu4" class="tab-pane fade">
							<div class="inner_wrapper">
								<div class="panel-group" id="accordion">
									<c:if test="${project.enquiryList !=null}">
										<c:forEach items="${project.enquiryList}" var="enq">
											<div class="panel panel-default">
												<div class="panel-heading">
													<h4 class="panel-title">
														<a data-toggle="collapse" data-parent="#accordion"
															href="#${enq.enquiryId}">
															<h1>
																Enquiry sent on
																<fmt:formatDate pattern="dd-MM-yyyy"
																	value="${enq.createdOn.getTime()}" />
																<c:if test="${enq.raisedBy.userName !=null}">
																	<span>by ${enq.raisedBy.userName}</span>
																</c:if>
															</h1>
														</a>
													</h4>
												</div>
												<div id="${enq.enquiryId}"
													class="panel-collapse collapse in">
													<div class="panel-body">
														Subject: ${enq.subject}<br>
														<br> ${enq.enquiryText}
														<br>
														<c:if test="${enq.replyText !=null}">
														<br>
														<b>Reply Received:</b><br>
														${enq.replyText}
														</c:if>
													</div>
												</div>
											</div>
										</c:forEach>
									</c:if>
								</div>
							</div>
						</div>



						<div class="inner_wrapper">


							<h1>
								Penalty <span> Details </span>
							</h1>
							<div class="drop_shadow"></div>

							<div class="row">
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										Penalty Paid<span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>${project.paymentDetailsModel.penaltyPaid}</p>
								</div>

								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										Penalty Amount<span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>${project.paymentDetailsModel.penaltyAmt}</p>
								</div>

								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										Penalty Paid Receipt<span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>
										<a
											href='<%=request.getContextPath() %>/download?DOC_ID=${project.paymentDetailsModel.penaltyPaidReceipt.documentId}'>${project.paymentDetailsModel.penaltyPaidReceipt.fileName}
										</a>
									</p>
								</div>

							</div>


						</div>


					</div>






				</div>


				<br />
				<table id="remarksTable" border="2">
					<tr>
						<th style="width: 33%" colspan="3">Reviewer Remarks</th>
						<th style="width: 33%" colspan="2">Secretary Remaks</th>
						<th style="width: 33%" colspan="2">Chairman Remaks</th>
					</tr>
					<tr>
						<th>Section</th>
						<th>Date</th>
						<th>Remarks</th>
						<th>Date</th>
						<th>Remarks</th>
						<th>Date</th>
						<th>Remarks</th>
					</tr>
					<c:forEach items="${project.projectRemarks.remarksList}"
						var="remarks">
						<c:if test="${remarks.status!='NEW'}">
							<tr>
								<td>Account</td>
								<td>${remarks.oprAccRemarkDateStr }</td>
								<td>${remarks.accountsOprRemarks}</td>
								<td>${remarks.authRemarkDateStr }</td>
								<td>${remarks.accountsAuthRemarks }</td>
								<td>${remarks.supRemarkDateStr }</td>
								<td>${remarks.accountsSupRemarks }</td>
							</tr>
							<tr>
								<td>Revenue</td>
								<td>${remarks.oprRevRemarkDateStr }</td>
								<td>${remarks.revenueOprRemarks }</td>
								<td>${remarks.authRemarkDateStr }</td>
								<td>${remarks.revenueAuthRemarks }</td>
								<td>${remarks.supRemarkDateStr }</td>
								<td>${remarks.revenueSupRemarks }</td>
							</tr>
							<tr>
								<td>TCP</td>
								<td>${remarks.oprTcpRemarkDateStr }</td>
								<td>${remarks.tcpOprRemarks }</td>
								<td>${remarks.authRemarkDateStr }</td>
								<td>${remarks.tcpAuthRemarks }</td>
								<td>${remarks.supRemarkDateStr }</td>
								<td>${remarks.tcpSupRemarks }</td>
							</tr>
							<tr>
								<td>Engineer</td>
								<td>${remarks.oprEnggRemarkDateStr }</td>
								<td>${remarks.enggOprRemarks }</td>
								<td>${remarks.authRemarkDateStr }</td>
								<td>${remarks.enggAuthRemarks }</td>
								<td>${remarks.supRemarkDateStr }</td>
								<td>${remarks.enggSupRemarks }</td>
							</tr>
							<tr>
								<td colspan="7"></td>
							</tr>
						</c:if>
					</c:forEach>
				</table>

				<br /> <br /> <br />

				<%=ReraSecurity.writeToken(request)%>
				<input type='hidden' name='PROJECT_ID'
					value="${project.projectRegId }" /> <input type='hidden'
					name='STATUS' />

			<%-- 	<c:if test="${not empty project.enquiryList && not empty project.updatedFlag}">
					 <c:if test="${project.status=='PENDING_OPERATOR'}">
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-3 control-label">
							Remarks: </label>
						<div class="col-sm-3">

							<textarea name="REMARKS" id="oprRemarksID"
								class="form-control requiredValFld" rows="8" cols="80"></textarea>
							<span class='requiredValFldMsg'> Please enter Remarks.</span>
						</div>




					</div>
					<br />
					<br />
					<br />
					<br />
					<div class="button-wrapper">



						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input name="btn1"
							class="btn-style" value="Forward" type="button"
							onclick="submitTrxForm('FORWARD')" />
					</div> </c:if>

				</c:if>
				 --%>
				<%-- 
				<c:if test="${empty project.enquiryList}">
				 <c:if test="${project.status=='PENDING_OPERATOR'}">
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-3 control-label">
							Remarks: </label>
						<div class="col-sm-3">

							<textarea name="REMARKS" id="oprRemarksID"
								class="form-control requiredValFld" rows="8" cols="80"></textarea>
							<span class='requiredValFldMsg'> Please enter Remarks.</span>
						</div>




					</div>
					<br />
					<br />
					<br />
					<br />
					<div class="button-wrapper">



						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input name="btn1"
							class="btn-style" value="Forward" type="button"
							onclick="submitTrxForm('FORWARD')" />
					</div> </c:if>

				</c:if> --%>
		</form>






	</div>
	<!--inner container end here-->





</div>

</div>




<!-- container end here-->

</div>
<script>
	function submitTrxForm(_out) {
		var frm = $('#approvalFormId');
		if (validateForm(frm)) {
			document.approvalForm.STATUS.value = _out;
			if (_out == 'REJECTED') {
				if (confirm('Are you sure reject this application?')) {
					//document.approvalForm.submit();

				}
			} else {
				if (confirm('Are you sure forward this application?')) {
					document.approvalForm.submit();
				}
			}
		}
	}
</script>
