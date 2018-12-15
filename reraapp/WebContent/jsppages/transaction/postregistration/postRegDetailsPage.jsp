	<%@page import="in.gov.rera.common.security.ReraSecurity"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
   
	    <%@page import="in.gov.rera.common.model.UserModel"%>
<%@page import="in.gov.rera.common.util.ReraConstants"%>
   <%
   String roleAccess=(String)session.getAttribute(ReraConstants.ROLE_ACCESS);
	UserModel user = (UserModel) session.getAttribute(ReraConstants.SES_USER_ATTR);
%>


<div class="breadcrumb"><!-- Home /Project Details --></div>

<!-- <a class="pull-right user_name" href="viewAllDetails">Back to List</a> -->

		<div class="col-md-12 col-sm-12 ">
			
			<div class="Main_containner">

<!--Inner wrapper stsrt here-->
<div class="inner_wrapper">


<span class="pull-right user_name">Registration Number :<b>
						${project.projectRegistrationNo }</b></span>
						<br>
				<span class="pull-right user_name">Project Name :<b> ${project.projectDetailsModel.projectName }</b></span>
				<br>

<div class="border"><div class="orange"></div><div class="black"></div></div>



<!-----------------------------Tab start here--------------------------------->

	<div class="tab_main">
		
		  <!-- <ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#home">Apartment Details</a></li>
			<li><a data-toggle="tab" href="#menu1">Cost Details</a></li>
			<li><a data-toggle="tab" href="#menu2">Project schedule Details</a></li>
			<li><a data-toggle="tab" href="#menu3">Payment</a></li>
			<li><a data-toggle="tab" href="#menu4">Enquiry Details</a></li>
		  </ul> -->



 <div class="tab-content">
    <div id="home" class="tab-pane fade in active">
 
  
     
    <br>

     <div class="col-md-12">
     <h5>Apartment Details </h5>
     <div class="drop_shadow"></div>
	 </div>
 
  

<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right ">Tower Name<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p class="text-view">${tdm.towerName}</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">No. of towers<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${tdm.totNoOfTower}</p></div>
</div>
		
		
<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Type of Apartment<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${tdm.apartmentType}</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">No. of floors<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${tdm.totNoOfFloor} </p></div>
	</div>


<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">No. of apartments<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${tdm.totApartments} </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">No. of basements<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${tdm.totNoOfBasement}  </p></div>
	</div>

					
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">No. of stilts<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${tdm.totNoOfStills} </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">No. of slab super structure<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${tdm.totNoOfSlabsOfSuperStructure}  </p></div>
	</div>
							
											
<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Total No. of garages<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${tdm.totNoOfGarages}</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">No. of Garages Booked<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${tdm.noOfGaragesBooked} </p></div>
	</div>
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">No. of Garages available<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${tdm.noOfGaragesAvailable} </p></div>
	</div>

		<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Total No. of Open Car Parking<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${tdm.totNoOfOpenCarParking}</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Total No. of Closed Car Parking<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${tdm.totNoOfClosedCarParking}</p></div>
	</div>
	<br/>
	<br/>
	<h5>Cost Details </h5>	
	<br/>
	<h5>1. Land Cost Details </h5>	
	<br/>
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right ">Title of the land<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p class="text-view">${lcdm.landAcquisitionCostModel.landTitle}</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Land Type<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${lcdm.landAcquisitionCostModel.landType} </p></div>
</div>
		
		
<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Cost of ownership<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${lcdm.landAcquisitionCostModel.costOfOwnership}</p></div>
	</div>
		

 <%--   <div class="row">
   <c:forEach items="lcdm.landAcquisitionCostModel.amountWithdrawlBankDetailsModel" var="lc2">
   <div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Amount withdrawn from the bank for the purpose of the project (INR)<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${lc2.amount}  </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Date
		<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>
      <fmt:formatDate type="date"  pattern="dd-MM-yyyy" dateStyle="short" value="${lc2.amtWithDrawnDate.time}"/></p></div>
	</c:forEach>
	</div> --%>
	

					
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Is TDR applicable?<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${lcdm.transferDevRightsDetailsModel.isTdrApplicable}</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">TDR Sanction Area(in Sq. M)<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${lcdm.transferDevRightsDetailsModel.tdrSanctionArea} </p></div>
	</div>
		<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Sanctioning Authority<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${lcdm.transferDevRightsDetailsModel.tdrSanctioningAuthority} </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">TDR Purchase Amount (in INR)<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${lcdm.transferDevRightsDetailsModel.tdrPurchaseAmt}   </p></div>
	</div>
	
<%-- 	<div class="row">
	 <c:forEach items="lcdm.transferDevRightsDetailsModel.amountWithdrawlBankDetailsModel" var="lc3">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Amount withdrawn from the bank for the purpose of the project (INR)<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${lc3.amount}</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Date<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>
      <fmt:formatDate type="date"  pattern="dd-MM-yyyy" dateStyle="short" value="${lc3.amtWithDrawnDate.time}"/></p></div>
      </c:forEach>
	</div> --%>
						
							
											
    <div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Project Approval<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${lcdm.approvalCostDetailsModel.projectApprovalAmt}</p></div>
		
	</div>

		<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Stamps Duty<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${lcdm.approvalCostDetailsModel.stampsDutyAmt}</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Transfer Charges<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p> ${lcdm.approvalCostDetailsModel.transferCharges} </p></div>
	</div>
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Registration Charges<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${lcdm.approvalCostDetailsModel.registrationCharges}</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Conversion Charges<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p> ${lcdm.approvalCostDetailsModel.conversionCharges}</p></div>
	</div>
	
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">NOC-For CC<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${lcdm.approvalCostDetailsModel.noObjectionCertAmtForCC}</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">NOC-For KSPCB<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${lcdm.approvalCostDetailsModel.noObjectionCertAmtFORKSPCB}</p></div>
	</div>
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">NOC-For BWSSB<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${lcdm.approvalCostDetailsModel.noObjectionCertAmtForBWSSB}</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">	NOC-For BESCOM<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${lcdm.approvalCostDetailsModel.noObjectionCertAmtForBESCOM}</p></div>
	</div>
	
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Other NOC<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${lcdm.approvalCostDetailsModel.noObjectionCertAmtForOtherNOC}</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Taxes<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${lcdm.approvalCostDetailsModel.taxAmt}</p></div>
	</div>
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Total cost of Approvals<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${lcdm.approvalCostDetailsModel.totalCostOfApprovals}</p></div>
	</div>
	<br/>
	<h5>2. Construction Cost Details </h5>	
	<br/>
		<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Estimated Cost of Construction as certified by Engineer<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${ccdm.estConstrCostByEngg}</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Estimated Cost of Construction incurred as per the books of 
accounts as verified by the Chartered Accountant<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${ccdm.estConstrCostByEngg}</p></div>
	</div>															
	<br/>
	<br/>
	<h5>Quarterly Update Details </h5>	
	<br/>					
		<h5>1. Bank Details </h5>											
<br/>
<div class="row">
<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										Percentage of completion of project<span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>${qudm.bankDetails.percentageOfProjectCompletion}</p>
								</div>
							</div>
							<div class="row">
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										Total advance amount collected from prospective purchasers (in
										INR)<span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>${qudm.bankDetails.totAdvanceAmt}</p>
								</div>
							</div>
							<div class="row">
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										Amount withdrawn from the bank for the purpose of the project
										(INR)<span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>${qudm.bankDetails.amtWithdrawnFromBank}</p>
								</div>
							</div>
							<%-- <div class="row">
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										Certificate issued by Chartered Account<span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>${qudm.bankDetails.certFromChartedAcc}</p>
								</div>
							</div>
							<div class="row">
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										Certificate issued by Structural Engineer<span
											class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>${qudm.bankDetails.certificateIssuedByStructuralEng}</p>
								</div>
							</div>
							<div class="row">
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										Certificate issued by Architect<span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>${qudm.bankDetails.certificateIssuedByArchitect}</p>
								</div>
							</div> --%>
<br/>					
		<h5>2. Apartment Details </h5>											
<br/>

<div class="row">
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p class="text-right">
									Type of Apartment<span class="space_LR">:</span>
								</p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p>${tdm.apartmentType}</p>
							</div>
														
						</div>


						<div class="row">
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p class="text-right">
									No. of apartments<span class="space_LR">:</span>
								</p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p>${tdm.totApartments}</p>
							</div>
							
						</div>
						
						<div class="row">
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p class="text-right">
									No. of Apartments Booked<span class="space_LR">:</span>
								</p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p>${tdm.noOfApartmentsBooked}</p>
							</div>
							
						</div>
						
						<div class="row">
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p class="text-right">
									No. of Apartments Remaining<span class="space_LR">:</span>
								</p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p>${tdm.noOfApartmentsRemained}</p>
							</div>
							
						</div>
						
						<br/>					
		<h5>3. Garages & Parking Details </h5>											
<br/>
<div class="row">
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p class="text-right">
									Total No. of garages<span class="space_LR">:</span>
								</p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p>${tdm.totNoOfGarages}</p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p class="text-right">
									No. of Garages Booked<span class="space_LR">:</span>
								</p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p>${tdm.noOfGaragesBooked}</p>
							</div>
						</div>
						<div class="row">
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p class="text-right">
									No. of Garages Remaining<span class="space_LR">:</span>
								</p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p>${tdm.noOfGaragesAvailable}</p>
							</div>
						</div>

						<div class="row">
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p class="text-right">
									Total No. of Open Car Parking<span class="space_LR">:</span>
								</p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p>${tdm.totNoOfOpenCarParking}</p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p class="text-right">
									Total No. of Closed Car Parking<span class="space_LR">:</span>
								</p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p>${tdm.totNoOfClosedCarParking}</p>
							</div>
						</div>

     
  </div>
  
  
  
    <div id="" class="tab-pane fade">
     
    <br>

     <div class="col-md-12">
     
     <div class="drop_shadow"></div>
	 </div>
 
  


	
<%-- 		<div class="row">
	 <c:forEach items="lcdm.ApprovalCostDetailsModel.amountWithdrawlBankDetailsModel" var="lc4">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Amount withdrawn from the bank for the purpose of the project (INR)<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${lc4.amount}</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Date<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>
      <fmt:formatDate type="date"  pattern="dd-MM-yyyy" dateStyle="short" value="${lc4.amtWithDrawnDate.time}"/></p></div>
      </c:forEach>
	</div> --%>
	
	
	
<%-- 	
			<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Approving Authority<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.projectDetailsModel.office.officeName} </p></div>
	</div>
													
																
		<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">No of Garage for Sale<span class="space_LR">:</span></p></div>
		 <fmt:parseNumber var = "i" integerOnly = "true"   type = "number" value = "${project.projectDetailsModel.noOfGarageForSale}" />
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${i} </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Area of Garage for Sale (Sq Mtr)<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.projectDetailsModel.areaOfGarageForSale}  </p></div>
	</div>
															
		<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">No of Open Parking for Sale <span class="space_LR">:</span></p></div>
			<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.projectDetailsModel.noOfParkinfForSale} </p></div> 
				<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Area of Open Parking for Sale (Sq Mtr)<span class="space_LR">:</span></p></div>
					<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.projectDetailsModel.areaOfParkinfForSale}  </p></div>
					 </div>
	
	
		<div class="row">		
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">No of Covered Parking for Sale <span class="space_LR">:</span></p></div>
	    <div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.projectDetailsModel.noOfCoveredParkingForSale} </p></div> 
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Area of Covered Parking for Sale (Sq Mtr)<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.projectDetailsModel.areaOfCoveredParkingForSale}  </p></div>
	</div>

																																																																													
	
	
	
	<div class="inner_wrapper">
			
			<h1>Project Ongoing <span> Status</span></h1>
			<div class="drop_shadow"></div>
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Extent of development carried till date<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.projectDetailsModel.devCompletion} %</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Extent of development pending<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.projectDetailsModel.devPending} % </p></div>
	</div>
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Total amount of money collected form allotee<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.projectDetailsModel.totalAmtClctedFrmAllotee}</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Total amount of money used from development of project<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.projectDetailsModel.totalAmtUsedInPrjct}</p></div>
	
	</div>
	
		<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Total amount of balance maney lying with promoter<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.projectDetailsModel.totalBalAmtOfAlte}</p></div>
				<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Is Any Subsequent Modification in Plan<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.projectDetailsModel.isSubSqChangeInPlan}</p></div>
		
	
	</div>
	
		<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Is Delay in the Project<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.projectDetailsModel.isDelayed}</p></div>
	
	</div>
	
		<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Reason For Delay<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.projectDetailsModel.reasonForDelayed}</p></div>
				<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">No of Month Delay<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.projectDetailsModel.noOfMonthDelayed}</p></div>
		
	
	</div>
	
		<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Expected Completion Date<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.projectDetailsModel.estimatedEndDate.time}</p></div>
				<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Certificate form Architect,Engineer,CA etc.<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p> <a href="download?DOC_ID=${project.projectDetailsModel.delayedCertDoc.documentId}">
		                               ${project.projectDetailsModel.delayedCertDoc.fileName }</a></p></div>
		
	
	</div>
</div>	
			
		
								

<div class="inner_wrapper">
			
			<h1>Development <span> Details</span></h1>
			<div class="drop_shadow"></div>
<c:forEach items="${project.developmentDetailSet}" var="devObj">

	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Type of Inventory<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${devObj.typeOfInventory}</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">No of Inventory<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${devObj.noOfInventory}  </p></div>
	</div>
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Carpet Area (Sq Mtr)<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${devObj.carpetArea} Sq Mtr</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Area of exclusive balcony/verandah (Sq Mtr)<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${devObj.areaOfExclusive} Sq Mtr</p></div>
	
	</div>
	
		<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Area of exclusive open terrace if any (Sq Mtr)<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${devObj.areaOfExclusiveOpenTerrace}  Sq Mtr</p></div>
		
	
	</div>

	</c:forEach>
</div>	
			
		
		
		
<div class="inner_wrapper">
		
<h1>Internal Development  <span>Work</span></h1>
			<div class="drop_shadow"></div>

	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Road & Road system<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.externalDevelopmentWorkModel.roadSysetmDevBy }</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Water supply<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.externalDevelopmentWorkModel.waterSupplyBy }  </p></div>
	</div>
	
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Sewege and Drainage System <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.externalDevelopmentWorkModel.sewegeAndDrainageSystemDevBy } </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Electricity Supply Trasfomer And Sub Stattion<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.externalDevelopmentWorkModel.electricityAndTrasfomerSupply }  </p></div>
	</div>
	
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Solid Waste Managment And Disposal<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.externalDevelopmentWorkModel.solidWasteSupplyBy } </p></div>
		
	</div>
	
	<!-- Added 4 new fields -->
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Fire Fighting facility <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.externalDevelopmentWorkModel.fireFighting } </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Drinking Water Facility<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.externalDevelopmentWorkModel.drinkingWater}  </p></div>
	</div>
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Emergency Evacuation Services <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.externalDevelopmentWorkModel.emergencyEvacuation } </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Use of Renewable Energy<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.externalDevelopmentWorkModel.renewableEnergy}  </p></div>
	</div>
	
	

</div>



<div class="inner_wrapper">
		
<h1>Project  <span>Bank</span></h1>
<div class="drop_shadow"></div>

	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Bank Name<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.projectBankDetailsModel.bankModel.bankName}</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Branch<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.projectBankDetailsModel.bankBranch} </p></div>
		
	</div>
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Account No.<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.projectBankDetailsModel.accountNumber} </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">ifscCode<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.projectBankDetailsModel.ifscCode} </p></div>
		
	</div>
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">State<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.projectBankDetailsModel.districtModel.stateUtModel.stateUtName} </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">District<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.projectBankDetailsModel.districtModel.districtName} </p></div>
		
	</div>
	
	
</div>

		

		
	
	
<div class="inner_wrapper">
		
<h1>Associated Vendor <span>Work</span></h1>

<div class="inner_wrapper">
		
<h1>Project  <span>Agent</span></h1>
			<div class="drop_shadow"></div>

<c:forEach items="${project.projectAgentDetailSet}" var="preAgentObj">
<c:if test="${preAgentObj.status=='CONFIRMED'}">
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Agent Registration No.<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${preAgentObj.agent.agentRegistrationNo}  </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Agent Name<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${preAgentObj.agent.agentDetailsModel.agentName}   </p></div>
	</div>
	
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Agent Address<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p> ${preAgentObj.agent.agentDetailsModel.agentIndividualAddressLine1}  </p></div>
		
	</div>
	</c:if>
</c:forEach>

</div>
		
<div class="inner_wrapper">
		
<h1>Project   <span>Architects</span></h1>
			

  <c:forEach items="${project.projectArchitectDetailSet}" var="arctObj">
  <c:if test="${arctObj.status=='CONFIRMED'}">
  <div class="drop_shadow"></div>
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Name<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${arctObj.architectName}</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">EmailID<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${arctObj.emailId}  </p></div>
    </div>
    
    
     <div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Sate<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${arctObj.districtModel.stateUtModel.stateUtName}</p><p></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">District<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${arctObj.districtModel.districtName} </p></div>
    </div>
    
    <div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Address<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${arctObj.addressLine1},${arctObj.addressLine2}</p><p></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Pine Code<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${arctObj.pinCode}  </p></div>
    </div>
    
    
     <div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Year Of Establishment<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${arctObj.yearOfEstablishment}</p><p></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Number of Project Completed <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p> ${arctObj.keyProject } </p></div>
    </div>
     <div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Reg. Of COA No.<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${arctObj.regOfCoaNo}</p><p></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right"></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>  </p></div>
    </div>
    
    
    </c:if>
    
	</c:forEach>


</div>

<div class="inner_wrapper">
		
<h1>Structural    <span>Engineers</span></h1>
		
  <c:forEach items="${project.structuralEngineerDetailSet}" var="strObj">
    <c:if test="${strObj.status=='CONFIRMED'}">
	<div class="drop_shadow"></div>
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Name<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${strObj.engineerName}</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">EmailID<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${strObj.emailId}  </p></div>
    </div>
    
    
     <div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Sate<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${strObj.districtModel.stateUtModel.stateUtName}</p><p></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">District<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${strObj.districtModel.districtName} </p></div>
    </div>
    
    <div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Address<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${strObj.addressLine1},${strObj.addressLine2}</p><p></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Pine Code<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${strObj.pinCode}  </p></div>
    </div>
    
    
     <div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Year Of Establishment<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${strObj.yearOfEstablishment}</p><p></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Number of Project Completed<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p> ${strObj.keyProject } </p></div>
    </div>
    
      <div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Local Authority Licence Number<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${strObj.localAuthorityLicenceNumber}</p><p></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right"></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p> </p></div>
    </div>
</c:if>
	</c:forEach>
	


</div>

<div class="inner_wrapper">
		
<h1>Project     <span>Contrators</span></h1>


 <c:forEach items="${project.projectContratorDetailSet}" var="strObj">
    <c:if test="${strObj.status=='CONFIRMED'}">
<div class="drop_shadow"></div>

	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right"> Name<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${strObj.contractorName}</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">EmailID<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${strObj.emailId}  </p></div>
    </div>
    
    
     <div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">State<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${strObj.districtModel.stateUtModel.stateUtName}</p><p></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">District<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${strObj.districtModel.districtName} </p></div>
    </div>
    
    <div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Address line<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${strObj.addressLine1},${strObj.addressLine2}</p><p></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Pine Code<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${strObj.pinCode}  </p></div>
    </div>
    
    
    <div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Year Of Establishment<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${strObj.yearOfEstablishment}</p><p></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Number Of Project Completed<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p> ${strObj.keyProject } </p></div>
    </div>
    </c:if>

	</c:forEach> --%>
	



</div>	

</div>																						
																																										
																																																																																		
	
    </div>
    <div id="menu2" class="tab-pane fade">
     
    <br>

   
 

<div class="inner_wrapper">
			
			<h1>Promoter <span> Document </span></h1>
			<div class="drop_shadow"></div>

	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">PAN Card <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.panCardDoc.documentId}'>${project.projectDocModel.panCardDoc.fileName }</a></p></div>
	</div>
	

		</div>	
			
		
<div class="inner_wrapper">
		

		<h1>Project  <span>Approval</span></h1>
			<div class="drop_shadow"></div>

	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">Commencement Certificate<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.commencementCertDoc.documentId}'>${project.projectDocModel.commencementCertDoc.fileName }</a> </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">Approved Building/Plotting Plan<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.approveSacPlanDoc.documentId}'>${project.projectDocModel.approveSacPlanDoc.fileName }</a>  </p></div>
	</div>
	
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">Approved Layout Plan <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.approveLayoutPlanDoc.documentId}'>${project.projectDocModel.approveLayoutPlanDoc.fileName }</a> </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">Proforma For Sale Deed <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.agreementFileDoc.documentId}'>${project.projectDocModel.agreementFileDoc.fileName }</a>  </p></div>
	</div>
	
		<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">Existing Layout Plan <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p> <a href="download?DOC_ID=${project.projectDocModel.extendedLayoutPlanDoc.documentId}">
					         ${project.projectDocModel.extendedLayoutPlanDoc.fileName}
							</a> </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">Existing Section Plan and Specification <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p> <a href="download?DOC_ID=${project.projectDocModel.extendedSacPlanDoc.documentId}">
					         ${project.projectDocModel.extendedSacPlanDoc.fileName}
							</a>  </p></div>
	</div>
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">Sale Deed & RTC<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.landLocationFileDoc.documentId}'>${project.projectDocModel.landLocationFileDoc.fileName }</a> </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">Approved Section Of Building/Infrastructure Plan of Plotting<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.sanctionedLayoutPlanDoc.documentId}'>${project.projectDocModel.sanctionedLayoutPlanDoc.fileName }</a> </p></div>
	</div>
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">Area Development Plan Of Project Area<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.areaDevelopmentDoc.documentId}'>${project.projectDocModel.areaDevelopmentDoc.fileName }</a> </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">Performa of Allotment Letter<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.performaOfAllotmentLetterDoc.documentId}'>${project.projectDocModel.performaOfAllotmentLetterDoc.fileName }</a> </p></div>
	</div>
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">Brochure of Current Project<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.brochureOfCurrentProjectDoc.documentId}'>${project.projectDocModel.brochureOfCurrentProjectDoc.fileName }</a></p></div>
		<%-- <div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">All NOCs from Authority<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.projectRelatedDoc.documentId}'>${project.projectDocModel.projectRelatedDoc.fileName }</a> </p></div> --%>
	</div>
		<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">Project Specification<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.projectSpecificDoc.documentId}'>${project.projectDocModel.projectSpecificDoc.fileName }</a></p></div>
		
		<!--  Added new field -->
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">Encumbrance Certificate<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.encumbranceCertificateDoc.documentId}'>${project.projectDocModel.encumbranceCertificateDoc.fileName }</a></p></div>
	</div>
	
	<!--  Start added new 3 docs -->
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">Conveyance Deed / Title Deed (Khatha)<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.titleDeed.documentId}'>${project.projectDocModel.titleDeed.fileName }</a></p></div>
		
	
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">Collaboration Agreement/Development Agreement/Joint Development Agreement/Other Agreement<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.jointDevelopmentAgreement.documentId}'>${project.projectDocModel.jointDevelopmentAgreement.fileName }</a></p></div>
		
	</div>
	
	
	<!-- Added by Suneetha -->
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">Any other document (Rights/Title/Interest/Name) <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectAddDocModel.anyOtherDoc.documentId}'>${project.projectAddDocModel.anyOtherDoc.fileName }</a></p></div>
		
	<!-- </div>
	
	
	<div class="row"> -->
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">Conversion Certificate under Sec 95 of the KLR Act 1961 <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectAddDocModel.section95.documentId}'>${project.projectAddDocModel.section95.fileName }</a></p></div>
		
	</div>
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">Approval/NOC under Sec 14 of the KTCP Act<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectAddDocModel.section14.documentId}'>${project.projectAddDocModel.section14.fileName }</a></p></div>
		
	<!-- </div>
	<div class="row"> -->
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">Approval/NOC under section 109 of KLR Act 1961<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectAddDocModel.section109.documentId}'>${project.projectAddDocModel.section109.fileName }</a></p></div>
		
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
	
	<h1>No Objection   <span>Certificates</span></h1>
			<div class="drop_shadow"></div>
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">Fire Force Department<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectAddDocModel.fireForceDept.documentId}'>${project.projectAddDocModel.fireForceDept.fileName }</a></p></div>
		
	<!-- </div>
	
	<div class="row"> -->
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">Airport Authority of India<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectAddDocModel.airportAuthorityOfIndia.documentId}'>${project.projectAddDocModel.airportAuthorityOfIndia.fileName }</a></p></div>
		
	</div>
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">BESCOM<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectAddDocModel.bescom.documentId}'>${project.projectAddDocModel.bescom.fileName }</a></p></div>
		
	<!-- </div>
	
	<div class="row"> -->
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">BWSSB<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectAddDocModel.bwssb.documentId}'>${project.projectAddDocModel.bwssb.fileName }</a></p></div>
		
	</div>
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">KSPCB<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectAddDocModel.kspcb.documentId}'>${project.projectAddDocModel.kspcb.fileName }</a></p></div>
		
	<!-- </div>
	
	<div class="row"> -->
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">SEIAA<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectAddDocModel.seiaa.documentId}'>${project.projectAddDocModel.seiaa.fileName }</a></p></div>
		
	</div>
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">BSNL<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectAddDocModel.bsnl.documentId}'>${project.projectAddDocModel.bsnl.fileName }</a></p></div>
		
	<!-- </div>
	
		  <div class="row"> -->
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">NOC in case of building proposals abutting to neighbouring properties<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectAddDocModel.nocBuildingAbuttingToNeighbourProperties.documentId}'>${project.projectAddDocModel.nocBuildingAbuttingToNeighbourProperties.fileName }</a></p></div>
		
	</div>
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">Lift Authorities<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectAddDocModel.liftAuthorities.documentId}'>${project.projectAddDocModel.liftAuthorities.fileName }</a></p></div>
		
	<!-- </div>   
	
	<div class="row"> -->
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Urban Land Ceiling<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectAddDocModel.urbanLandCeiling.documentId}'>${project.projectAddDocModel.urbanLandCeiling.fileName }</a></p></div>
		
	</div>
	
	  <div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">BMRCL<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectAddDocModel.bmrcl.documentId}'>${project.projectAddDocModel.bmrcl.fileName }</a></p></div>
		
	<!-- </div>
	
	 <div class="row"> -->
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">Bangalore Urban Arts Commission<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectAddDocModel.bangaloreUrbanArtsCommission.documentId}'>${project.projectAddDocModel.bangaloreUrbanArtsCommission.fileName }</a></p></div>
		
	</div>
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">Inspector of Factories Controller of explosives Railways<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectAddDocModel.inspectorOfFactoriesCntrlOfExplosivesRailways.documentId}'>${project.projectAddDocModel.inspectorOfFactoriesCntrlOfExplosivesRailways.fileName }</a></p></div>
		
	<!-- </div>
	
	<div class="row"> -->
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">Dist Magistrate<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectAddDocModel.distMagistrate.documentId}'>${project.projectAddDocModel.distMagistrate.fileName }</a></p></div>
		
	</div>
	
		<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">Coastal Regulation Zone Authority<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectAddDocModel.coastalRegulationZoneAuthority.documentId}'>${project.projectAddDocModel.coastalRegulationZoneAuthority.fileName }</a></p></div>
		
	<!-- </div>
	
	<div class="row"> -->
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">Certificate from Registered Engineer indicating the structural safety of the building (for Apartments) (1 MB)<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectAddDocModel.engrIndicateStructural.documentId}'>${project.projectAddDocModel.engrIndicateStructural.fileName }</a></p></div>
		
	</div>
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">Sectional Drawing of the apartments(5 MB)<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectAddDocModel.sectionalDrawingOfTheApartments.documentId}'>${project.projectAddDocModel.sectionalDrawingOfTheApartments.fileName }</a></p></div>
		
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">Change of Land Use<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.changeOfLandUse.documentId}'>${project.projectDocModel.changeOfLandUse.fileName }</a></p></div>
	</div>
	
	 <div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Advocate Search Report<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectAddDocModel.advocatesearchreport.documentId}'>${project.projectAddDocModel.advocatesearchreport.fileName }</a></p></div>
		
	</div> 
	
	    
	<!-- End of Suneetha -->
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">Existing Layout Plan<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.existingLayoutPlan.documentId}'>${project.projectDocModel.existingLayoutPlan.fileName }</a></p></div>
		
	
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">Existing Section Plan and Specification<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.existingSectionPlanandSpec.documentId}'>${project.projectDocModel.existingSectionPlanandSpec.fileName }</a></p></div>
		
	</div>
	
		
	
	<div class="drop_shadow"></div>	
<h1>Benefit of Development <span>Rights</span></h1>
<div class="drop_shadow"></div>	
			
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">Utilisation certificate<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectAddDocModel.utilisationCert.documentId}'>${project.projectAddDocModel.utilisationCert.fileName }</a></p></div>
	
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">Transfer of development rights certificate<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectAddDocModel.transferOfDevRightsCert.documentId}'>${project.projectAddDocModel.transferOfDevRightsCert.fileName }</a></p></div>
		
	 </div>
	
	<div class="row"> 
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">Relinquishment Deed<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectAddDocModel.relinquishmenDeed.documentId}'>${project.projectAddDocModel.relinquishmenDeed.fileName }</a></p></div>
		
	</div>
	
	
		<!--  end added new 3 docs -->
	
	
				
			</div>									
			
<div class="inner_wrapper">
		
		<h1>Financial   <span>Document</span></h1>
			<div class="drop_shadow"></div>

	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Audited Balance Sheet (2014)<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.auditedBalSheetDoc1.documentId}'>${project.projectDocModel.auditedBalSheetDoc1.fileName }</a></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Audited Balance Sheet (2015)<span class="space_LR">:</span></p></div>
     <div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.auditedBalSheetDoc2.documentId}'>${project.projectDocModel.auditedBalSheetDoc2.fileName }</a></p></div>
	</div>
	
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Audited Balance Sheet (2016) <span class="space_LR">:</span></p></div>
	<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.auditedBalSheetDoc3.documentId}'>${project.projectDocModel.auditedBalSheetDoc3.fileName }</a></p></div>
			<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Audited ProfitLoss Statement (2014) <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.auditedProfitLossSheetDoc1.documentId}'>${project.projectDocModel.auditedProfitLossSheetDoc1.fileName }</a> </p></div>
	</div>
	
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Audited ProfitLoss Statement (2015) <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.auditedProfitLossSheetDoc2.documentId}'>${project.projectDocModel.auditedProfitLossSheetDoc2.fileName }</a></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Audited ProfitLoss Statement (2016) <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.auditedProfitLossSheetDoc3.documentId}'>${project.projectDocModel.auditedProfitLossSheetDoc3.fileName }</a> </p></div>
	</div>
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Director's Report (2014) <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.directorReportDoc1.documentId}'>${project.projectDocModel.directorReportDoc1.fileName }</a></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Director's Report (2015) <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.directorReportDoc2.documentId}'>${project.projectDocModel.directorReportDoc2.fileName }</a> </p></div>
	</div>
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Director's Report (2016) <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.directorReportDoc3.documentId}'>${project.projectDocModel.directorReportDoc3.fileName }</a></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Cash Flow Statement (2014) <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.cashFlowStmtFileDoc1.documentId}'>${project.projectDocModel.cashFlowStmtFileDoc1.fileName }</a> </p></div>
	</div>
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Cash Flow Statement (2015) <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.cashFlowStmtFileDoc2.documentId}'>${project.projectDocModel.cashFlowStmtFileDoc2.fileName }</a></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Cash Flow Statement (2016) <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.cashFlowStmtFileDoc3.documentId}'>${project.projectDocModel.cashFlowStmtFileDoc3.fileName }</a> </p></div>
	</div>
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Auditors Report (2014) <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.auditorsDoc1.documentId}'>${project.projectDocModel.auditorsDoc1.fileName }</a></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Auditors Report (2015) <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.auditorsDoc2.documentId}'>${project.projectDocModel.auditorsDoc2.fileName }</a> </p></div>
	</div>
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Auditors Report (2016) <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.auditorsDoc3.documentId}'>${project.projectDocModel.auditorsDoc3.fileName }</a></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Income Tax Return (2014) <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.incomeTaxReturn1.documentId}'>${project.projectDocModel.incomeTaxReturn1.fileName }</a> </p></div>
	</div>
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Income Tax Return (2015) <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.incomeTaxReturn2.documentId}'>${project.projectDocModel.incomeTaxReturn2.fileName }</a></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Income Tax Return (2016) <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.incomeTaxReturn3.documentId}'>${project.projectDocModel.incomeTaxReturn3.fileName }</a> </p></div>
	</div>
	
</div>
	
	<div class="inner_wrapper">
		
		<h1>Declaration   </h1>
			<div class="drop_shadow"></div>

	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Declaration (Form B)<span class="space_LR">:</span></p></div>
			<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.declarationFormbDoc.documentId}'>${project.projectDocModel.declarationFormbDoc.fileName }</a> </p></div>
	
	</div>

</div>

<div class="inner_wrapper">
		
		<h1>Other Documents  </h1>
			<div class="drop_shadow"></div>



	<c:forEach items="${project.projectDocModel.otherDocumentSet }" var="doc" >
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right"><span class="space_LR">${doc.caption }:</span></p></div>
			<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${doc.documentId}'>${doc.fileName }</a> </p></div>
	
	</div>

</c:forEach>

</div>
		
<div class="inner_wrapper">
		
<h1>Project   <span>Photo</span></h1>
<div class="drop_shadow"></div>
    

    <c:forEach items="${project.projectPhotoDetailSet}" var="projectPhoto">
   
    <div class="drop_shadow"></div>
    
      <div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Project Photo Uploaded<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${projectPhoto.documentId}'>${projectPhoto.documentName}</a></p></div>
		
	</div>
   
    </c:forEach>

	
</div>			
			
		

    </div>
    
    
    
    <div id="menu3" class="tab-pane fade">
     
	 <div class="inner_wrapper">
		
     
    		<h1>Payment <span> Details </span></h1>
			<div class="drop_shadow"></div>
	 
 
<c:if test="${project.paymentDetailsModel.paymentMode!='Payment Gateway'}">
		<div class="row">
		 
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Payment Mode<span class="space_LR">:</span></p></div>
	
		<div class="col-md-3 col-sm-6 col-xs-6" ><p> ${project.paymentDetailsModel.paymentMode}</p></div>
		
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Unique Token Number<span class="space_LR">:</span></p></div>
	
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.paymentDetailsModel.paymentToken}  </p></div>
	
	
	<%-- <div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Bank Name<span class="space_LR">:</span></p></div>
     <div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.auditedBalSheetYear2.documentId}'>${project.projectDocModel.auditedBalSheetYear2.fileName }</a></p></div>
	 --%>
	 </div>
	
	
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Amount<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.paymentDetailsModel.amount} </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Khajane2 Challan Number <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.paymentDetailsModel.sbiTransactionRefNo} </p></div>
	</div>
	
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right"><span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p></p></div>
		 <div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Online Payment Receipt<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.paymentDetailsModel.scanCopyDoc.documentId}'>${project.paymentDetailsModel.scanCopyDoc.fileName} </a></p></div>
		 
	</div>
</c:if>	
	
	<c:if test="${project.paymentDetailsModel.paymentMode=='Payment Gateway'}">
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Payment Mode<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>Payment Gateway</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Amount<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.paymentDetailsModel.amount} </p></div>
	</div>
 
	
<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Payment Through<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.paymentDetailsModel.online.mode}</p></div>
	 
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Transaction No.<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.paymentDetailsModel.online.transactionNo} </p></div>
	
	</div>	
	
		
	</c:if>

    </div>
      <div class="inner_wrapper">
		
     
    		<h1>Penalty <span> Details </span></h1>
			<div class="drop_shadow"></div>
			
		<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Penalty Paid<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.paymentDetailsModel.penaltyPaid} </p></div>
		
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Penalty Amount<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.paymentDetailsModel.penaltyAmt} </p></div>
		
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Penalty Paid Receipt<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>
			<a href='<%=request.getContextPath() %>/download?DOC_ID=${project.paymentDetailsModel.penaltyPaidReceipt.documentId}'>${project.paymentDetailsModel.penaltyPaidReceipt.fileName} </a>
	 </p></div>
		<%-- <div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.paymentDetailsModel.penaltyPaidReceipt} </p></div> --%>
		
		</div>
			
			
    </div>
    
  </div>

  <div id="menu4" class="tab-pane fade">
                        <div class="inner_wrapper">
                            <div class="panel-group" id="accordion">
                                <c:if test="${project.enquiryList !=null}">
                                    <c:forEach items="${project.enquiryList}" var="enq">
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a data-toggle="collapse" data-parent="#accordion" href="#${enq.enquiryId}">
                                                        <h1>
                                                            Enquiry sent on
                                                            <fmt:formatDate pattern="dd-MM-yyyy" value="${enq.createdOn.getTime()}" />
                                                            <c:if test="${enq.raisedBy.userName !=null}">
                                                                <span>by ${enq.raisedBy.userName}</span>
                                                            </c:if>
                                                        </h1>
                                                    </a>
                                                </h4>
                                            </div>
                                            <div id="${enq.enquiryId}" class="panel-collapse collapse in">
                                                <div class="panel-body">
                                                    Subject: ${enq.subject}<br>
                                                    <br> ${enq.enquiryText}
                                                    <br>
                                                    <c:if test="${enq.replyText !=null}">
                                                        <br>
                                                        <b>Reply Received:</b><br> ${enq.replyText}
                                                    </c:if>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </c:if>
                            </div>
                        </div>


                    </div>
		
		
		
		
	</div>

	
	
	

	</div>
<!--inner container end here-->





</div>
			
		</div>
	
	


<!-- container end here-->

</div>
 
<!--inner container end here-->

<script>
document.getElementById("textareaId1").value = document.getElementById("tmp1").value;	
</script>

  <script>
                            function templateFun(dataIs) {

                                document.getElementById("textareaId1").value = document.getElementById("tmp" + dataIs).value;
                            }
                        </script>

<script>
	function pasteWithCursor( idIs ) {
		var valueIs = document.getElementById( idIs ).value;
		var cursorPos = $('#textareaId1').prop('selectionStart');
		var v = $('#textareaId1').val();
		var textBefore = v.substring(0, cursorPos);
		var textAfter = v.substring(cursorPos, v.length);
		$('#textareaId1').val(textBefore + valueIs + textAfter);

		return false;
	};
</script>


<script>
document.getElementById("textareaId1").value = document.getElementById("tmp1").value;	
</script>

<script>
function revokeRegistration(){
	
	if(document.trxForm.REASON.value!=''){
		if(confirm('Are you sure to revoke this registration?')){
		document.trxForm.submit();	
		}
	}
	else{
		alert('Please enter reason.');
	}
}

function acceptClarification(){
	
	
	if(confirm('Are you sure you want to accept the clarification ?')){
		document.trxForm.action="acceptClarification";
	document.trxForm.submit();	
	}

}

function sendEnquiry() {
    if (!checkenqVal())
        return;

    var _frm = $("#enquiryForm");
    if (validateForm(_frm)) {
        $(_frm).submit();
    }
}
</script>	