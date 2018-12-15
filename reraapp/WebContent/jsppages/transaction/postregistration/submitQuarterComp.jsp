<%@page import="in.gov.rera.common.security.ReraSecurity"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@page import="in.gov.rera.common.model.UserModel"%>

<%@page import="in.gov.rera.common.util.ReraConstants"%>

<link href="<%=request.getContextPath() %>/resources/css/bootstrap.min.css" rel="stylesheet"/>
<link href="<%=request.getContextPath()%>/resources/css/style.css" rel="stylesheet"/>
<link href="<%=request.getContextPath()%>/resources/css/font-awesome.min.css" rel="stylesheet"/>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>

<script>
	var data = [];

	function downloadPdf() {
		var doc = new jsPDF();

		doc.autoTable(getColumns().splice(1, 4), data, {
			showHeader : 'never',
			styles : {
				overflow : 'linebreak'
			},
			columnStyles : {
				name : {
					fillColor : [ 190, 100, 34 ],
					textColor : 255,
					fontStyle : 'bold',
					columnWidth : 50
				},
				email : {
					columnWidth : 'auto'
				}
			}

		});
		doc.save("'${projectRegNo}'.pdf");
	}

	//Returns a new array each time to avoid pointer issues

	var getColumns = function() {
		return [

		{
			title : "ID",
			dataKey : "id"
		},

		{
			title : "Name",
			dataKey : "name"
		},

		{
			title : "Email",
			dataKey : "email"
		}, ];

	};
</script>



<%
	String roleAccess = (String) session.getAttribute(ReraConstants.ROLE_ACCESS);

	UserModel user = (UserModel) session.getAttribute(ReraConstants.SES_USER_ATTR);
%>

<div class="breadcrumb" style="background-color: white;">Home
	/Post Registration Details</div>

<br/>
<a  href="<%= request.getContextPath()%>/home" class="pull-right btn btn-info btn-lg">
          <span class="glyphicon glyphicon-log-out"></span> Log out </a>

<br/>
<br/>
<br/>




<div class="col-md-12 col-sm-12 " style="background-color: white;">


	<div class="container">
	

<!-- 
				<h2>

					Post Registration<span> Details</span>

				</h1> -->

                 
				 <span class="pull-right user_name">Registration Number :<b> ${projectRegNo}</b></span> 
				<br> <span class="pull-right user_name">Project Name :<b> ${projectDetails.projectName }</b></span> <br>
				<div class="border">

					<div class="orange"></div>

					<div class="black"></div>

				</div>

				 <script>
					data.push({
						id : 1,
						name : 'Registration Number',
						email : '${projectRegNo }'
					});

					data.push({

						id : 1,

						name : 'Project Name',

						email : '${projectDetails.projectName }'

					});
					
					</script>
					<script>
					data.push({

						id : 1,

						name : '',

						email : ''

					});

					</script>
					
				 <c:forEach items="${towerDetailsList}" var="towerList"> 

				<script>
					data.push({

								id : 1,

								name : 'Tower Name',

								email : '${towerList.towerName}'

							});

					data.push({

								id : 1,

								name : 'Type of Apartment',

								email : '${towerList.apartmentType}'
							});
					data.push({

						id : 1,

						name : 'No. of Floors',

						email : '${towerList.totNoOfFloor}'
					});
					data.push({

						id : 1,

						name : 'Total No of Units',

						email : '${towerList.totApartments}'
					});
					data.push({

						id : 1,

						name : 'No. of Basement',

						email : '${towerList.totNoOfBasement}'
					});
					data.push({

						id : 1,

						name : 'No. of Stilts',

						email : '${towerList.totNoOfStills}'
					});
					data.push({

						id : 1,

						name : 'No. of slab of super structure',

						email : '${towerList.totNoOfSlabsOfSuperStructure}'
					});
					</script>
					
					<c:forEach items="${towerList.towerUnitDetailsList}" var="towerunit">
					<script>
					data.push({

						id : 1,

						name : 'floor No',

						email : '${towerunit.floorNo}'
					});
					
					data.push({

						id : 1,

						name : 'Unit No',

						email : '${towerunit.unitNo}'
					});
					data.push({

						id : 1,

						name : 'Carpet Area',

						email : '${towerunit.unitType}'
					});
					data.push({

						id : 1,

						name : 'Common Area Alloted',

						email : '${towerunit.carpetArea}'
					});
					data.push({

						id : 1,

						name : 'Exclusive Common Area Allotee',

						email : '${towerunit.exclusiveCommonAreaAllote}'
					});
					data.push({

						id : 1,

						name : 'Common Area Alloted To Association',

						email : '${towerunit.commonAreaAllotedTo}'
					});
					data.push({

						id : 1,

						name : 'Undivided Share',

						email : '${towerunit.unDevidedShare}'
					});
					data.push({

						id : 1,

						name : 'No of parking lots',

						email : '${towerunit.noOfParkingLots}'
					});
					
					data.push({

						id : 1,

						name : 'No of parking lots',

						email : '${towerunit.noOfParkingLots}'
					});
					
				</script>
				</c:forEach>
				</c:forEach>
				<script>
					data.push({

						id : 1,

						name : '',

						email : ''

					});

					</script>
				
				
				<script>
					data.push({
						id : 1,
						name : 'Cost Details: ',
						email : ''
					});

					data.push({

						id : 1,

						name : '1. Land Cost Details',

						email : ''

					});

					data.push({

						id : 1,

						name : 'Land Type',

						email : '${lcdm.landAcquisitionCostModel.landType}'

					});

					data
							.push({

								id : 1,

								name : 'Cost of ownership',

								email : '${lcdm.landAcquisitionCostModel.costOfOwnership}'

							});

					data.push({

						id : 1,

						name : 'Is TDR applicable?',

						email : '${lcdm.transferDevRightsDetailsModel.isTdrApplicable}'

					});

					data.push({

						id : 1,

						name : 'TDR Sanction Area(in Sq. M)',

						email : '${lcdm.transferDevRightsDetailsModel.tdrSanctionArea}'

					});

					data.push({

						id : 1,

						name : 'Sanctioning Authority',

						email : '${lcdm.transferDevRightsDetailsModel.tdrSanctioningAuthority}'

					});

					data.push({

						id : 1,

						name : 'TDR Purchase Amount (in INR)',

						email : '${lcdm.transferDevRightsDetailsModel.tdrPurchaseAmt}'

					});
					
					</script>
					
					<script>

					data.push({

						id : 1,

						name : ' Project Approval:',

						email : ''

					});
					</script>
					
					<c:forEach items="${approvalCostModel.approvalCostDetails}" var="approvalList">
					 <script>

					data.push({

						id : 1,

						name : 'Particulars Name ',

						email : '${approvalList.approvalParticular}'

					});

					data
							.push({

								id : 1,

								name : 'Is Applicable',

								email : '${approvalList.isApplicable}'

							});

					data
							.push({

								id : 1,

								name : 'Cost Incurred (INR)',

								email : '${approvalList.approvalAmt}'

							});
					
					</script>
                   </c:forEach>
					 
	
	                 <script>
					data.push({

						id : 1,

						name : '',

						email : ''

					});

					</script>
					
					<script>

					data.push({

						id : 1,

						name : ' 2. Construction Cost Details:',

						email : ''

					});
					</script>
					<c:forEach items="${constructionCostmodel.constructionCostList}" var="consCostList">
					
						<script>

					data.push({

						id : 1,

						name : 'Construction Cost Particular',

						email : '${consCostList.consCostParticular}'

					});

					data
							.push({

								id : 1,

								name : 'Is Applicable',

								email : '${consCostList.isApplicable}'

							});

					data
							.push({

								id : 1,

								name : 'Estimated Cost',

								email : '${consCostList.estConsCost}'

							});
		
				</script> 
				</c:forEach>
				
				<script>
					data.push({

						id : 1,

						name : '',

						email : ''

					});

					</script>
				<script>
				data.push({

		        id : 1,

		        name : 'Project Schedule:',

		        email : ''

	            });
               </script>
               
               
               
               <script>
						data.push({

							id : 1,

							name : 'Sub Structure Work: ',

							email : ''

						});

						</script>
						
				<c:forEach items="${projectScheduleModel.subStructureList}" var="projScheduleSub">
					<script>
						data.push({

							id : 1,

							name : 'Sub Structure Work Name: ',

							email : '${projScheduleSub.typeOfWork}'

						});
						data.push({

							id : 1,

							name : 'Is Applicable',

							email : '${projScheduleSub.isApplicable}'

						});
						data.push({

							id : 1,

							name : 'From Date',

							email : '${projScheduleSub.estimatedFrmDate.time}'

						});
						data.push({

							id : 1,

							name : 'To Date',

							email : '${projScheduleSub.estimatedToDate.time}'

						});
						
					</script>
				</c:forEach>
				
				<script>
					data.push({

						id : 1,

						name : '',

						email : ''

					});

					</script>
				
				<script>
						data.push({

							id : 1,

							name : 'Super Structure Work: ',

							email : ''

						});

						</script>
				<c:forEach items="${projectScheduleModel.subStructureList}" var="projScheduleSuper">

					<script>
						data.push({

							id : 1,

							name : 'Super Structure Work Name : ',

							email : '${projScheduleSuper.typeOfWork}'

						});
						data.push({

							id : 1,

							name : 'Is Applicable',

							email : '${projScheduleSuper.isApplicable}'

						});
						data.push({

							id : 1,

							name : 'From Date',

							email : '${projScheduleSuper.estimatedFrmDate.time}'

						});
						data.push({

							id : 1,

							name : 'To Date',

							email : '${projScheduleSuper.estimatedToDate.time}'

						});
						
					</script>
				</c:forEach>
				
				<script>
					data.push({

						id : 1,

						name : '',

						email : ''

					});

					</script>
				
				
				 <script>
						data.push({

							id : 1,

							name : 'Finishing Or Interior Work : ',

							email : ''

						});

						</script>
				
				<c:forEach items="${projectScheduleModel.finishingOrInteriorWorkList}" var="projScheduleFinishingInterior">
					<script>
						data.push({

							id : 1,

							name : 'Finishing Or Interior Work Name: ',

							email : '${projScheduleFinishingInterior.typeOfWork}'

						});
						data.push({

							id : 1,

							name : 'Is Applicable',

							email : '${projScheduleFinishingInterior.isApplicable}'

						});
						data.push({

							id : 1,

							name : 'From Date',

							email : '${projScheduleFinishingInterior.estimatedFrmDate.time}'

						});
						data.push({

							id : 1,

							name : 'To Date',

							email : '${projScheduleFinishingInterior.estimatedToDate.time}'

						});
						
					</script>
					</c:forEach>
					
					<script>
					data.push({

						id : 1,

						name : '',

						email : ''

					});

					</script>
					
					 <script>
						data.push({

							id : 1,

							name : 'Internal Infrastructure Work : ',

							email : ''

						});

						</script>
					
					<c:forEach items="${projectScheduleModel.internalInfraList}" var="infrastructureDetails">
					<script>
						data.push({

							id : 1,

							name : 'Internal Infrastructure Work Name: ',

							email : '${infrastructureDetails.infrastructureName}'

						});
						data.push({

							id : 1,

							name : 'Is Applicable',

							email : '${infrastructureDetails.isApplicable}'

						});
						
						
					</script>
				</c:forEach>
				
				<script>
					data.push({

						id : 1,

						name : '',

						email : ''

					});

					</script>
				
				 <script>
						data.push({

							id : 1,

							name : 'amenity : ',

							email : ''

						});

						</script>
				
				<c:forEach items="${projectScheduleModel.amenityList}" var="amenityList">
					<script>
						data.push({

							id : 1,

							name : 'Amenity Name : ',

							email : '${amenityList.amenityName}'

						});
						data.push({

							id : 1,

							name : 'Is Applicable',

							email : '${amenityList.isApplicable}'

						});
						
						
					</script>
				</c:forEach>
				
				<script>
					data.push({

						id : 1,

						name : '',

						email : ''

					});

					</script>
				
				 <script>
						data.push({

							id : 1,

							name : 'Common Area Work: ',

							email : ''

						});

						</script>
				
				<c:forEach items="${projectScheduleModel.commonAreaList}" var="commArea">
					<script>
						data.push({

							id : 1,

							name : 'Common Area Name : ',

							email : '${commArea.commonAreaName}'

						});
						data.push({

							id : 1,

							name : 'Is Applicable',

							email : '${commArea.isApplicable}'

						});
						
						
					</script>
				</c:forEach>
				
				<script>
					data.push({

						id : 1,

						name : '',

						email : ''

					});

					</script>
				
				 <script>
						data.push({

							id : 1,

							name : 'External Infrastructure Work : ',

							email : ''

						});

						</script>
				<c:forEach items="${projectScheduleModel.externalInfrastructureList}" var="externalInfrastructureList">
					<script>
						data.push({

							id : 1,

							name : 'External Infrastructure Name : ',

							email : '${externalInfrastructureList.externalInfrastructureName}'

						});
						data.push({

							id : 1,

							name : 'Is Applicable',

							email : '${externalInfrastructureList.isApplicable}'

						});
						
						
					</script>
				</c:forEach>
				
				<script>
					data.push({

						id : 1,

						name : '',

						email : ''

					});

					</script>
				
			
				

				 <script>
					//project Details

					data.push({

						id : 1,

						name : 'Project Cost Summry : ',

						email : ''

					});

					data.push({

						id : 1,

						name : 'Estimated Land Cost',

						email : '${psm.estLandCost}'

					});
					data.push({

						id : 1,

						name : 'Acctual Land Cost',

						email : '${psm.actLandCost}'

					});
					data
							.push({

								id : 1,

								name : 'Construction Cost',

								email : '${psm.estConstructionCost}'

							});
					data.push({

						id : 1,

						name : 'Acctual Construction Cost',

						email : '${psm.actConstructionCost}'

					});

					data.push({

						id : 1,

						name : 'Estimated Cost for Approvals, NOCs, Licenses and others',

						email : '${approvalCostModel.totalCostOfApprovals}'

					});

					data.push({

						id : 1,

						name : 'Acctual Cost for Approvals, NOCs, Licenses and others',

						email : '${psm.actCostOfApprove}'

					});

					data.push({

						id : 1,

						name : 'Estimated Total Cost',

						email : '${psm.estTotalCost}'

					});
					data
							.push({

								id : 1,

								name : 'Acctual Total Cost',

								email : '${psm.actTotalCost}'

							});

					data
							.push({

								id : 1,

								name : 'Total Amount collected Till Date',

								email : '${psm.amtCollectedFromAllotee}'

							});

					data
							.push({

								id : 1,

								name : 'Amount utilized for the project',

								email : '${psm.amtUtilizedforConstruction}'

							});

					data.push({

						id : 1,

						name : 'Balance Amount ',

						email : '${psm.balanceAmt}'

					});
					data.push({

						id : 1,

						name : 'Amount utilized in percentage %',

						email : '${psm.amtUtilPercentage}'

					});
					
					
				</script> 
				
				<script>
					data.push({

						id : 1,

						name : '',

						email : ''

					});

					</script>
				
				<script>
					data.push({

								id : 1,

								name : 'Final Approval :',

								email : ''

							});

					</script>


             <c:forEach items="${finalApprovalList}" var="finalApproveObj">

				<script>
					data.push({

								id : 1,

								name : 'Name Of The Certificate',

								email : '${finalApproveObj.nameOfCerificate}'

							});

					data.push({

								id : 1,

								name : 'Approval Date',

								email : '${finalApproveObj.approvedDate.time}'
							});

					
					
				</script>
				</c:forEach>
				<script>
					data.push({

						id : 1,

						name : '',

						email : ''

					});

					</script>
				
				
                     <script>
						data.push({

							id : 1,

							name : 'Quarterly Update Details  : ',

							email : ''

						});
						</script>
						
						<script>
					data.push({

						id : 1,

						name : '',

						email : ''

					});

					</script>
					<script>
						data.push({

							id : 1,

							name : '1. Quarterly Saved Tower Details',

							email : ''

						});
						</script>
						<c:forEach items="${qudm.buildingDetails}" var="buildingDetailsList">
						<script>
						data.push({

							id : 1,

							name : 'Quarterly Saved Tower Details -',

							email : '${buildingDetailsList.blockName}'

						});

						data.push({

							id : 1,

							name : 'Percentage of completion',
								

							email : '${buildingDetailsList.percentageOfCompletion}'

						});
						</script>
						
						<script>
						data
								.push({

									id : 1,

									name : 'Floor Details',

									email : ''

								});

						
					</script>
					<c:forEach items="${buildingDetailsList.floorDetails}" var="floorDetailsList">
					<script>
						data.push({

							id : 1,

							name : 'Floor No ',

							email : '${floorDetailsList.floorNo}'

						});

						data.push({

							id : 1,

							name : 'Percentage Of Completion',

							email : '${floorDetailsList.percentageOfCompletionFloor}'

						});
						</script>
						</c:forEach>
						<script>
						data
								.push({

									id : 1,

									name : 'Apartment Details',

									email : ''

								});

						
					</script>
					<c:forEach items="${buildingDetailsList.apartmentDetails}" var="apartment">
						<script>
						data.push({

							id : 1,

							name : 'Apartment type',

							email : '${apartment.apartmentType }'

						});

						data.push({

							id : 1,

							name : 'Total No Of Apartment',
								

							email : '${apartment.totNoOfApartment}'

						});

						data
								.push({

									id : 1,

									name : 'Total Apartment Booked',

									email : '${apartment.noOfApartmentsBooked }'

								});
						data
						.push({

							id : 1,

							name : 'Total Apartment Available',

							email : '${apartment.noOfApartmentsRemained}'

						});
						
					</script>
				</c:forEach>
				</c:forEach>
					<script>
						data.push({

							id : 1,

							name : ' ',

							email : ''

						});

						data.push({

							id : 1,

							name : '2. Bank  Details',

							email : ''

						});

						data.push({

							id : 1,

							name : 'Percentage of completion of project',

							email : '${qudm.bankDetails.percentageOfProjectCompletion}'

						});

						data.push({

							id : 1,

							name : 'Total advance amount collected from prospective purchasers (in INR)',
								

							email : '${qudm.bankDetails.totAdvanceAmt}'

						});

						data
								.push({

									id : 1,

									name : 'Amount withdrawn from the bank for the purpose of the project (INR)',

									email : '${qudm.bankDetails.amtWithdrawnFromBank}'

								});

						
					</script>
					
				<script>
					data.push({

						id : 1,

						name : '',

						email : ''

					});

					</script>
				
				<script>
						data.push({

							id : 1,

							name : '3. Status of Sub Structure : ',

							email : ''

						});

						</script>
				
				
					<c:forEach items="${qudm.subStructureList}" var="subStructureList">
					<script>
						data.push({

							id : 1,

							name : 'Sub Structure Work Name: ',

							email : '${subStructureList.typeOfWork}'

						});
						data.push({

							id : 1,

							name : 'Estimated From Date',

							email : '${subStructureList.estimatedFrmDate.time}'

						});
						data.push({

							id : 1,

							name : 'Estimated To Date',

							email : '${subStructureList.estimatedToDate.time}'

						});
						data.push({

							id : 1,

							name : 'Acctual From Date',

							email : '${projScheduleSub.actualFrmDate.time}'

						});
						data.push({

							id : 1,

							name : 'Acctual To Date',

							email : '${subStructureList.actualToDate.time}'

						});
						
						
					</script>
				</c:forEach>
				
				<script>
					data.push({

						id : 1,

						name : '',

						email : ''

					});

					</script>
				
				<script>
						data.push({

							id : 1,

							name : '4. Status of Super Structure: ',

							email : ''

						});

						</script>
				<c:forEach items="${qudm.superStructureList}" var="superStructureList">

					<script>
						data.push({

							id : 1,

							name : 'Super Structure Work Name : ',

							email : '${superStructureList.typeOfWork}'

						});
						
						data.push({

							id : 1,

							name : 'Estimated From Date',

							email : '${superStructureList.estimatedFrmDate.time}'

						});
						data.push({

							id : 1,

							name : 'Estimated To Date',

							email : '${superStructureList.estimatedToDate.time}'

						});
						data.push({

							id : 1,

							name : 'Acctual From Date',

							email : '${superStructureList.actualFrmDate.time}'

						});
						data.push({

							id : 1,

							name : 'Acctual To Date',

							email : '${superStructureList.actualToDate.time}'

						});
						
					</script>
				</c:forEach>
				
				<script>
					data.push({

						id : 1,

						name : '',

						email : ''

					});

					</script>
					
					<script>
					data.push({

						id : 1,

						name : '',

						email : ''

					});

					</script>
				
				
				
				 <script>
						data.push({

							id : 1,

							name : '5. Status of Finishing Or Interior Structure : ',

							email : ''

						});

						</script>
				
				<c:forEach items="${qudm.finishingOrInteriorWorkList}" var="interiorList">
					<script>
						data.push({

							id : 1,

							name : 'Finishing Or Interior Work Name: ',

							email : '${interiorList.typeOfWork}'

						});
						
						data.push({

							id : 1,

							name : ' Estimated From Date',

							email : '${interiorList.estimatedFrmDate.time}'

						});
						data.push({

							id : 1,

							name : 'Estimated To Date',

							email : '${interiorList.estimatedToDate.time}'

						});
						data.push({

							id : 1,

							name : 'Acctual From Date',

							email : '${interiorList.actualFrmDate.time}'

						});
						data.push({

							id : 1,

							name : 'Acctual To Date',

							email : '${interiorList.actualToDate.time}'

						});
						
					</script>
					</c:forEach>
					
					<script>
					data.push({

						id : 1,

						name : '',

						email : ''

					});

					</script>
					
					 <script>
						data.push({

							id : 1,

							name : '6. Status of Construction of Internal Infrastructure : ',

							email : ''

						});

						</script>
					
					<c:forEach items="${qudm.infrastructureDetails}" var="internalList">
					<script>
						data.push({

							id : 1,

							name : 'Internal Infrastructure Work Name: ',

							email : '${internalList.infrastructureName}'

						});
						data.push({

							id : 1,

							name : ' Percentage of Completion',

							email : '${internalList.percentageOfCompletion}'

						});
						
						
					</script>
				</c:forEach>
				
				<script>
					data.push({

						id : 1,

						name : '',

						email : ''

					});

					</script>
				
				 <script>
						data.push({

							id : 1,

							name : '7. Status of Amenities Details : ',

							email : ''

						});

						</script>
				
				<c:forEach items="${qudm.amenityList}" var="amenity">
					<script>
						data.push({

							id : 1,

							name : 'Amenity Name : ',

							email : '${amenity.amenityName}'

						});
						data.push({

							id : 1,

							name : ' Percentage of Completion',

							email : '${amenity.percOfCompletion}'

						});
						
						
					</script>
				</c:forEach>
				
				<script>
					data.push({

						id : 1,

						name : '',

						email : ''

					});

					</script>
				
				 <script>
						data.push({

							id : 1,

							name : '8. Status of Construction of Common Areas: ',

							email : ''

						});

						</script>
				
				<c:forEach items="${qudm.commonAreaDetails}" var="commonArea">
					<script>
						data.push({

							id : 1,

							name : 'Common Area Name : ',

							email : '${commonArea.commonAreaName}'

						});
						data.push({

							id : 1,

							name : ' Percentage of Completion',

							email : '${commonArea.percentageOfCompletion}'

						});
						
						
					</script>
				</c:forEach>
				
				<script>
					data.push({

						id : 1,

						name : '',

						email : ''

					});

					</script>
				
				 <script>
						data.push({

							id : 1,

							name : '9. Status of Construction of External Infrastructure : ',

							email : ''

						});

						</script>
	                      <c:forEach items="${qudm.externalinfrastructureDetails}" var="externalList">
						<script>
						
						data.push({

							id : 1,

							name : 'External Infrastructure Name : ',

							email : '${externalList.externalInfrastructureName}'

						});
						data.push({

							id : 1,

							name : ' Percentage of Completion',

							email : '${externalList.percentageOfCompletion}'

						});
						
						
					</script>
				</c:forEach>
				
				<script>
					data.push({

						id : 1,

						name : '',

						email : ''

					});

					</script>
				
				<script>
				data.push({

						id : 1,

						name : '10. Litigation Details :',

						email : ''

					});

			
				</script>
				
				<c:forEach items="${qudm.litigationDetails}" var="litigations">

				<script>
					data.push({

								id : 1,

								name : 'Any litigations on the project (incl. land)?',

								email : '${litigations.anyLitigationOnProject}'

							});

					data.push({

								id : 1,

								name : 'Type of Case',

								email : '${litigations.caseType}'
							});
					
					data.push({

						id : 1,

						name : 'Name of the Court / Authority',

						email : '${litigations.courtOrAuthorityName}'

					});

			data.push({

						id : 1,

						name : 'Case No.',

						email : '${litigations.caseNo}'
					});
			
			data.push({

				id : 1,

				name : 'Year',

				email : '${litigations.litigationYear.time}'

			});

	data.push({

				id : 1,

				name : 'Whether any Preventive Order issued? (Injunction / Interim Order / Final Order / Stay Order)',

				email : '${litigations.anyPreventiveOrderIssued}'
			});
	
	
	
	data.push({

		id : 1,

		name : 'Present Status',

		email : '${litigations.litigationStatus}'

	});
	
			
				</script>
				</c:forEach>
				
				<script>
					data.push({

						id : 1,

						name : '',

						email : ''

					});

					</script>
				
				<script>
				data.push({

						id : 1,

						name : '11. Modification, Amendment or Revision to License, Permit or Approval :',

						email : ''

					});

			
				</script>
								
				<c:forEach items="${qudm.modificationDetails}" var="modification">

				<script>
					data.push({

								id : 1,

								name : 'Is any there modification to approvals?',

								email : '${modification.isModificationRequiredToApprove}'

							});

					data.push({

								id : 1,

								name : 'Issued by Authority',

								email : '${modification.issuedByAuthority}'
							});
					
					data.push({

						id : 1,

						name : 'Written consent of at least two-third of Allottees',

						email : '${modification.writtenConsentOfAllotee}'

					});

			
				</script>
				</c:forEach>
				
				<script>
					data.push({

						id : 1,

						name : '',

						email : ''

					});

					</script>
				
				<script>
						data.push({

							id : 1,

							name : '12. Construction Workers Welfare Fund Registration: ',

							email : ''

						});
						
						data.push({

							id : 1,

							name : 'Is Applicable? ',

							email : '${qudm.projectWelfareFundDetails.isApplicable}'

						});

						
						data.push({

							id : 1,

							name : 'Registration No Of WelFare Fund',

							email : '${qudm.projectWelfareFundDetails.projecteFundRegNo}'

						});


						</script> 
                         <script>
					data.push({

						id : 1,

						name : '',

						email : ''

					});

					</script>
					
					<script>

					data.push({

						id : 1,

						name : ' 13. Construction Cost Details:',

						email : ''

					});
					</script>
					<c:forEach items="${qudm.quarterConstructionCostList}" var="quarterConsCostList">
					
						<script>

					data.push({

						id : 1,

						name : 'Construction Cost Particular',

						email : '${consCostList.consCostParticular}'

					});

					data
							.push({

								id : 1,

								name : 'Is Applicable',

								email : '${consCostList.isApplicable}'

							});

					data
							.push({

								id : 1,

								name : 'Estimated Cost',

								email : '${consCostList.estConsCost}'

							});
					data
					.push({

						id : 1,

						name : 'Acctual Cost',

						email : '${consCostList.actConsCost}'

					});
		
				</script> 
				</c:forEach>
				
				<script>
					data.push({

						id : 1,

						name : '',

						email : ''

					});

					</script>
				<!-----------------------------Tab start here--------------------------------->


										
	
	<div class="row" >
					<br><br>
					<br>
				<h2 style="color: green;" > Congratulations!! Your Application has been updated successfully.</h2>
				</div>
				<br><br>
					<br>
				<ul class="nav nav-tabs">
					<li style="padding-left:400px;"><a data-toggle="tab" href="#menu5"><input type="button" value="View Application" class="btn btn-sm btn-primary" data-toggle="collapse" data-target="#menu5" /></a></li>
					<br><br>
				</ul>
				
				<div id="menu5" class="tab-pane fade">
						<div class="inner_wrapper">
							<div class="panel-group" id="accordion">

									<div class="col-md-12">
											<h1> Tower<span> Details  </span>&nbsp; &nbsp; &nbsp; &nbsp;
									&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<input
										type="button" value="Download as Pdf" onclick="downloadPdf()">
											</h1>
											<div class="drop_shadow"></div>
										</div>
										<br/>
                                        <br/>
                                        <br/>
                                        <br/>
										
										<c:forEach items="${towerDetailsList}" var="towerList">
										 <div class="row">
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p style="color:red " class="text-right ">
													<b>Tower Name<span class="space_LR">:</span></b>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p style="color:red " class="text-view"><b>${towerList.towerName}</b></p>
											</div>
											</div>
											<div class="row">
											 <div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													Type of Apartment<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${towerList.apartmentType}</p>
											</div> 
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													No. of Floors<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${towerList.totNoOfFloor}</p>
											</div> 
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													Total No of Units<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${towerList.totApartments}</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													No. of Basement<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${towerList.totNoOfBasement}</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													No. of Stilts<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${towerList.totApartments}</p>
											</div> 
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													No. of slab of super structure<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${towerList.totNoOfSlabsOfSuperStructure}</p>
											</div>
											</div>
											
											<%-- <c:forEach items="${towerList.towerUnitDetailsList}" var="towerunit">
											<div class="row">
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p style="color:blue" class="text-right">
													floor No<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p style="color:blue">${towerunit.floorNo}</p>
											</div>
											</div>
											
											<div class="row">
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													Unit No<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${towerunit.unitNo}</p>
											</div>
											
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													Carpet Area<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${towerunit.unitType}</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													Common Area Alloted<span class="space_LR">:</span>
												</p>
											</div>
											
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${towerunit.carpetArea}</p>
											</div>
											
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													Exclusive Common Area Allotee<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${towerunit.exclusiveCommonAreaAllote}</p>
											</div>
											</div>
											<div class="row">
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													Common Area Alloted To Association<span class="space_LR">:</span>
												</p>
											</div>
											
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${towerunit.commonAreaAllotedTo}</p>
											</div>
											
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													Undivided Share<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${towerunit.unDevidedShare}</p>
											</div>
											</div>
											<div class="row">
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													No of parking lots<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${towerunit.noOfParkingLots}</p>
											</div>
											</div>							
										</c:forEach> --%>
											</c:forEach> 
											
											<div class="row">
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													Unit Details Sheet<span class="space_LR">:</span>
												</p>
											</div>
											
											<div class="col-md-3 col-sm-6 col-xs-6">
												<a href='<%=request.getContextPath() %>/download?DOC_ID=${projectDetails.unitdetailsExcelFile.documentId}'>
													 ${projectDetails.unitdetailsExcelFile.fileName}</a>
											</div>
											</div>			
										</div>
										
										
										<br />
										<br />
										
										<div class="col-md-12">
											<h1>Cost <span> Details </span></h1>
											<div class="drop_shadow"></div>
										</div>
<br />
										<br />
										<br />
										<h5>1. Land Cost Details</h5>
										<br />
										<div class="row">
											
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													Land Type<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${lcdm.landAcquisitionCostModel.landType}</p>
											</div>
												</div>
								              <c:if test="${lcdm.landAcquisitionCostModel.landType=='JDA With Land owner'}">
											<div class="row">
											
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													Number of Promoter(s)<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${lcdm.landAcquisitionCostModel.numberOfPromoters}</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													Number of Landowner(s)<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${lcdm.landAcquisitionCostModel.numberOfLandowners}</p>
											</div>
											
										</div>
                                       </c:if>
											<div class="row">
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													Cost of ownership<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${lcdm.landAcquisitionCostModel.costOfOwnership}</p>
											</div>
										</div>
										
										<div class="row">
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													 <b>JDA Details<span class="space_LR">:</span></b>
												</p>
											</div>
										</div>
										
										<c:forEach items="${lcdm.landAcquisitionCostModel.projectJDADetailsModel.promoterList}" var="AptJDA">
										<div class="row">
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													 Promoter Name<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>  ${AptJDA.promoterName} </p>
											</div>
											</div>
											<div class="row">
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													  No Of Units Of Share<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p > ${AptJDA.noOfUnitsOfShare} </p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													 Percentage of share<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p > ${AptJDA.percentageOfShare} </p>
											</div>
										</div>
										</c:forEach>
										          <%
                                  					int count = 1;
                                  					%>
                                  					
										<c:forEach items="${lcdm.landAcquisitionCostModel.projectJDADetailsModel.landOwnerList}" var="aptJDALandOwner" varStatus="s">
										<%   count++; %>
										<div class="row">
										
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													 Whether landowner is going to sell his/her share?<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>  ${aptJDALandOwner.isApplicable} </p>
											</div>
											
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													  Land Owner RERA Registration Number<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p > ${aptJDALandOwner.landOwnerRegNo} </p>
											</div>
											</div>
											<div class="row">
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													 land Owner ${s.count} Details<span class="space_LR">:</span>
												</p>
											</div>
											
										</div>
										
										<div class="row">
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													 Name of the Land Owner<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p > ${aptJDALandOwner.landownerName} </p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													 Mobile Number<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p > ${aptJDALandOwner.landownerMobileNo} </p>
											</div>
										</div>
										<div class="row">
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													 Address<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p > ${aptJDALandOwner.landownerAddress} </p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													 Email ID<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p > ${aptJDALandOwner.landownerEmailId} </p>
											</div>
										</div>
									
										</c:forEach>
										<div class="row">
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													 <b>Transfer of Development Rights (TDR)<span class="space_LR">:</span></b>
												</p>
											</div>
										</div>
										
										<div class="row">
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													Is TDR applicable?<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${lcdm.transferDevRightsDetailsModel.isTdrApplicable}</p>
											</div>
											</div>
											<c:if test="${lcdm.transferDevRightsDetailsModel.isTdrApplicable=='Yes'}">
										<div class="row">
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													TDR Sanction Area(in Sq. M)<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${lcdm.transferDevRightsDetailsModel.tdrSanctionArea}</p>
											</div>
										
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													Sanctioning Authority<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${lcdm.transferDevRightsDetailsModel.tdrSanctioningAuthority}
												</p>
											</div>
											</div>
										<div class="row">
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													TDR Purchase Amount (in INR)<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${lcdm.transferDevRightsDetailsModel.tdrPurchaseAmt}</p>
											</div>
								
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													TDR Purchase Deed / Sale Deed<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">


												<p>
													<a
														href='<%=request.getContextPath() %>/download?DOC_ID=${lcdm.transferDevRightsDetailsModel.tdrPurchaseOrSaleDoc.documentId}'>${lcdm.transferDevRightsDetailsModel.tdrPurchaseOrSaleDoc.fileName}</a>
												</p>
											</div>

										</div>
                                     </c:if>
									
                                 <div class="row">
										<div class="row">
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													Project Approval <span class="space_LR">:</span>
												</p>
											</div>
											</div>
											
											<c:forEach items="${approvalCostModel.approvalCostDetails}" var="approvalList">
											<div class="row">
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
													<b>	Particulars Name  <span class="space_LR">:</b></span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${approvalList.approvalParticular}</p>
												</div>
                                              
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														<b>Is Applicable<span class="space_LR">:</b></span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${approvalList.isApplicable}</p>
												</div>
											

											<c:if test="${approvalList.isApplicable=='Yes'}">
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														Cost Incurred (INR)<span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${approvalList.approvalAmt}</p>
												</div>
                                             </c:if>
										</div>
											
											</c:forEach>
											</div> 
											
										<br />
										<br />
										
										 <h5>2. Construction Cost Details</h5>
										<br />
										
										
										
										<c:forEach items="${constructionCostmodel.constructionCostList}" var="consCostList">
											<div class="row">
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
													<b>	Construction Cost Particular <span class="space_LR">:</b></span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${consCostList.consCostParticular}</p>
												</div>

												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														<b>Is Applicable<span class="space_LR">:</b></span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${consCostList.isApplicable}</p>
												</div>
											</div>
                                           <c:if test="${consCostList.isApplicable=='Yes'}">
											<div class="row">
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														Estimated Cost<span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${consCostList.estConsCost}</p>
												</div>

											</div>
                                            </c:if>

										</c:forEach>

										<br />
										<br />
										<br />

										
										<div class="col-md-12">
											<h1>Project <span> Schedule </span></h1>
											<div class="drop_shadow"></div>
										</div>

                                       <br/>
										<br/>
                                       <br/>
										<br/>

										<h5>1. Sub-structure</h5>
										  <br/>
										<br/>
										<c:forEach items="${projectScheduleModel.subStructureList}" var="projScheduleSub">
											<div class="row">
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
													<b>	Project Work <span class="space_LR">:</b></span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${projScheduleSub.typeOfWork}</p>
												</div>

												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														<b>Is Applicable<span class="space_LR">:</b></span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${projScheduleSub.isApplicable}</p>
												</div>
											</div>
                                           <c:if test="${projScheduleSub.isApplicable=='Yes'}">
											<div class="row">
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														From Date<span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${projScheduleSub.estimatedFrmDate.time}</p>
												</div>

												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														To Date<span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${projScheduleSub.estimatedToDate.time}</p>
												</div>

											</div>
                                          </c:if>

										</c:forEach>

										<br />

										<h5>2. Super-structure</h5>
										  <br/>
										<br/>
										<c:forEach items="${projectScheduleModel.supStructureList}"
											var="projScheduleSuper">
											<div class="row">
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														<b>Project Work <span class="space_LR">:</b></span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${projScheduleSuper.typeOfWork}</p>
												</div>

												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														<b>Is Applicable<span class="space_LR">:</b></span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${projScheduleSuper.isApplicable}</p>
												</div>
											</div>
                                           <c:if test="${projScheduleSuper.isApplicable=='Yes'}">
											<div class="row">
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														From Date<span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${projScheduleSuper.estimatedFrmDate.time}</p>
												</div>

												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														To Date<span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${projScheduleSuper.estimatedToDate.time}</p>
												</div>

											</div>
                                          </c:if>

										</c:forEach>

										<br />

										

										<br />

										<h5>3. Finishing/Interior Works</h5>
										  <br/>
										<br/>
										<c:forEach
											items="${projectScheduleModel.finishingOrInteriorWorkList}"
											var="projScheduleFinishingInterior">
											<div class="row">
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														<b>Project Work <span class="space_LR">:</b></span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${projScheduleFinishingInterior.typeOfWork}</p>
												</div>

												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														<b>Is Applicable<span class="space_LR">:</b></span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${projScheduleFinishingInterior.isApplicable}</p>
												</div>
											</div>
                                              <c:if test="${projScheduleFinishingInterior.isApplicable=='Yes'}">
											<div class="row">
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														From Date<span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${projScheduleFinishingInterior.estimatedFrmDate.time}</p>
												</div>

												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														To Date<span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${projScheduleFinishingInterior.estimatedToDate.time}</p>
												</div>

											</div>
                                           </c:if>

										</c:forEach>

										 <br />
										 
										 <h5>4.  Internal Infrastructure</h5>
										  <br/>
										<br/>
										<c:forEach
											items="${projectScheduleModel.internalInfraList}"
											var="infrastructureDetails">
											<div class="row">
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														<b>Project Work <span class="space_LR">:</b></span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${infrastructureDetails.infrastructureName}</p>
												</div>

												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														<b>Is Applicable<span class="space_LR">:</b></span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${infrastructureDetails.isApplicable}</p>
												</div>
											</div>

											

										</c:forEach>

										 <br />
										 
										 <h5>5. Amenities Details</h5>
										  <br/>
										<br/>
										<c:forEach
											items="${projectScheduleModel.amenityList}"
											var="amenityList">
											<div class="row">
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														<b>Project Work <span class="space_LR">:</b></span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${amenityList.amenityName}</p>
												</div>

												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														<b>Is Applicable<span class="space_LR">:</b></span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${amenityList.isApplicable}</p>
												</div>
											</div>

											


										</c:forEach>

										 <br />

										<h5>6.Common Areas</h5>
										  <br/>
										<br/>
										<c:forEach items="${projectScheduleModel.commonAreaList}"
											var="projScheduleMasonary">
											<div class="row">
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														<b>Common Area Name<span class="space_LR">:</b></span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${projScheduleMasonary.commonAreaName}</p>
												</div>

												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														<b>Is Applicable<span class="space_LR">:</b></span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${projScheduleMasonary.isApplicable}</p>
												</div>
											</div>


										</c:forEach>
										
										<br />

										<h5>7. External Infrastructure</h5>
										  <br/>
										<br/>
										<c:forEach items="${projectScheduleModel.externalInfrastructureList}"
											var="externalInfrastructureList">
											<div class="row">
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														<b>External Infrastructure Name<span class="space_LR">:</b></span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${externalInfrastructureList.externalInfrastructureName}</p>
												</div>

												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														<b>Is Applicable<span class="space_LR">:</b></span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${externalInfrastructureList.isApplicable}</p>
												</div>
											</div>


										</c:forEach>
										
 
										<br />
										<br />
										<br />

										<div class="col-md-12">
											<h1>Project Cost <span> Summry </span></h1>
											<div class="drop_shadow"></div>
										</div>
										
                                            <br/>
										<br/>

										<br />
										<div class="row">
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													Estimated Land Cost<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${psm.estLandCost}</p>
											</div>
											
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													Acctual Land Cost<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${psm.actLandCost}</p>
											</div>
											</div>
                                            <div class="row">
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													Estimated Construction Cost<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${psm.estConstructionCost}</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													Acctual Construction Cost<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${psm.actConstructionCost}</p>
											</div>
										</div>
										<div class="row">
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													Estimated Cost for Approvals, NOCs, Licenses and others<span
														class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${approvalCostModel.totalCostOfApprovals}</p>
											</div>
											 <div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													Acctual Cost for Approvals, NOCs, Licenses and others<span
														class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${psm.actCostOfApprove }</p>
											</div> 

										</div>
										<div class="row">
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													Estimated Total Cost<span
														class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${psm.estTotalCost}</p>
											</div>
											 <div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													Acctual Total Cost<span
														class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${psm.actTotalCost }</p>
											</div> 

										</div>

										<div class="row">
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">

													Total Amount collected Till Date<span
														class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${psm.amtCollectedFromAllotee}</p>
											</div>

											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													Amount utilized for the project<span
														class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${psm.amtUtilizedforConstruction}</p>
											</div>
										</div>
										
										<div class="row">
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">

													Balance Amount <span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${psm.balanceAmt}</p>
											</div>
									
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													Amount utilized in percentage %<span
														class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${psm.amtUtilPercentage}</p>
											</div>

										</div>
										
										<br />
										<br />

										
										<div class="col-md-12">
											<h1>Final <span> Approval  </span></h1>
											<div class="drop_shadow"></div>
										</div>

                                         <br/>
										<br/>
										<br />
										<c:forEach items="${finalApprovalList}" var="finalApproveObj">
											<div class="row">
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														Name Of The Certificate <span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${finalApproveObj.nameOfCerificate}</p>
												</div>

												<%-- <div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														Is Certificate Approved<span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${finalApproveObj.isApproved}</p>
												</div> --%>
											</div>

											<div class="row">
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														Approval Date<span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${finalApproveObj.approvedDate.time}</p>
												</div>

												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														Uploaded Certificate<span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">

													<p>
														<a
															href='<%=request.getContextPath() %>/download?DOC_ID=${finalApproveObj.uploadDoc.documentId}'>${finalApproveObj.uploadDoc.fileName}</a>
													</p>
												</div>

											</div>


										</c:forEach>

										<br />
										<br />

										
										
										<div class="col-md-12">
											<h1>Quarterly Update <span> Details </span></h1>
											<div class="drop_shadow"></div>
										</div>
                                             
										<br />
									  <br/>
										<br/>
										<h4>1. Quarterly Saved Tower Details </h4>
										 <br/> <br/>
										<c:forEach items="${qudm.buildingDetails}" var="buildingDetailsList">
										
										<div class="row">
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right" style="color:blue">
													Quarterly Saved Tower Details -  <span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${buildingDetailsList.blockName}</p>
											</div>
									</div>
									<div class="drop_shadow"></div>
										<div class="row">
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													Percentage of completion <span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${buildingDetailsList.percentageOfCompletion}</p>
											</div>
											
											<div class="col-md-2 col-sm-6 col-xs-6">
												<p class="text-right">
													Photograph <span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-2 col-sm-6 col-xs-6">
												
												<p>
													<a
														href='<%=request.getContextPath() %>/download?DOC_ID=${buildingDetailsList.photograph.documentId}'>${buildingDetailsList.photograph.fileName}</a>
												</p>
												
											</div>
									</div>
									<div>
										 <h4>Floor Details</h4>
									 </div>
											 <table class="table table-bordered table-striped table-condensed" >
											 <thead>
												 <tr>
													 <th rowspan="2">Floor No</th>
														 <th rowspan="2">Percentage Of Completion</th>
												 </tr>
													 </thead>
													 <tbody>
									<c:forEach items="${buildingDetailsList.floorDetails}" var="floorDetailsList">
										<tr>
											 <td><input type="text" name="floorNo" value="${floorDetailsList.floorNo }" /></td>
											 <td><input type="text" name="percentageOfCompletionFloor" maxlength="3" value="${floorDetailsList.percentageOfCompletionFloor}" /></td>
										 </tr> 
										</c:forEach>
										</tbody>
										</table>
										
										<div>
										 <h4>Apartment Details</h4>
									 </div>
											 <table class="table table-bordered table-striped table-condensed" >
											 <thead>
							<tr>

								<th rowspan="2">Apartment type</th>
								<th rowspan="2">Total No Of Apartment</th>
								<th rowspan="2">Total Apartment Booked</th>
								<th rowspan="2">Total Apartment Available</th>

							</tr>
						</thead>
								<tbody>
							<c:forEach items="${buildingDetailsList.apartmentDetails}" var="apartment">
								<tr>
									<td><input type="text" name="apartmentType"
										value="${apartment.apartmentType }" /></td>
									<td><input type="text" name="totNoOfApartment"
										value="${apartment.totNoOfApartment }" /></td>
									<td><input type="text" name="noOfApartmentsBooked"
										value="${apartment.noOfApartmentsBooked }" /></td>
									<td><input type="text" name="noOfApartmentsRemained"
										value="${apartment.noOfApartmentsRemained }" /></td>
								</tr>
							</c:forEach>
						</tbody>
						
										</table>
										<br/><br/>
										</c:forEach>
										<br/><br/>
										<h5>1. Bank  Details </h5>
									
										<br />
										<div class="row">
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													Percentage of completion of project<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${qudm.bankDetails.percentageOfProjectCompletion}</p>
											</div>
									
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													Total advance amount collected from prospective purchasers
													(in INR)<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${qudm.bankDetails.totAdvanceAmt}</p>
											</div>
										</div>
										<div class="row">
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													Amount withdrawn from the bank for the purpose of the
													project (INR)<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${qudm.bankDetails.amtWithdrawnFromBank}</p>
											</div>
										
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													Certificate issued by Chartered Account<span
														class="space_LR">:</span>
												</p>

											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>
													<a
														href='<%=request.getContextPath() %>/download?DOC_ID=${qudm.bankDetails.certFromChartedAcc.documentId}'>${qudm.bankDetails.certFromChartedAcc.fileName}</a>
												</p>

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

												<p>
													<a
														href='<%=request.getContextPath() %>/download?DOC_ID=${qudm.bankDetails.certificateIssuedByStructuralEng.documentId}'>${qudm.bankDetails.certificateIssuedByStructuralEng.fileName}</a>
												</p>

											</div>
										
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													Certificate issued by Architect<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">

												<p>
													<a
														href='<%=request.getContextPath() %>/download?DOC_ID=${qudm.bankDetails.certificateIssuedByArchitect.documentId}'>${qudm.bankDetails.certificateIssuedByArchitect.fileName}</a>
												</p>
											</div>
										</div>
										<br />
                                      <c:if test="${qudm.bankDetails.percentageOfProjectCompletion=='100'}">
								 	 <div class="row">
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													Annual Financial Report<span
														class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">

												<p>
													<a
														href='<%=request.getContextPath() %>/download?DOC_ID=${qudm.bankDetails.annualfinancialReport.documentId}'>${qudm.bankDetails.annualfinancialReport.fileName}</a>
												</p>
											</div>
										</div> 
										</c:if>
										<c:if test="${qudm.bankDetails.percentageOfProjectCompletion<'100'}">
								 	 <div class="row">
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													Quarterly Financial Report<span
														class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">

												<p>
													<a
														href='<%=request.getContextPath() %>/download?DOC_ID=${qudm.bankDetails.financialReport.documentId}'>${qudm.bankDetails.financialReport.fileName}</a>
												</p>
											</div>
										</div> 
										</c:if>
										<br/><br/><br/>
										<br />
										<h5>4. Litigation Details</h5>
										<br />
										<c:forEach items="${qudm.litigationDetails}" var="litigations">
											<div class="row">
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														<b>Any litigations on the project (incl. land)?<span
															class="space_LR">:</span></b>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${litigations.anyLitigationOnProject}</p>
												</div>

												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														Type of Case<span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${litigations.caseType}</p>
												</div>

											</div>

											<div class="row">
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">

														Name of the Court / Authority<span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${litigations.courtOrAuthorityName}</p>
												</div>

												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														Case No.<span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${litigations.caseNo}</p>
												</div>

											</div>

											<div class="row">
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														Year<span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${litigations.litigationYear.time}</p>
												</div>

												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														Whether any Preventive Order issued? (Injunction / Interim
														Order / Final Order / Stay Order)<span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${litigations.anyPreventiveOrderIssued}</p>
												</div>

											</div>


                                             <c:if test="${litigations.anyPreventiveOrderIssued=='Yes'}">
											<div class="row">
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														Preventive Order (Injunction / Interim Order / Final Order
														/ Stay Order<span class="space_LR">:</span>
													</p>
												</div>

												<div class="col-md-3 col-sm-6 col-xs-6">

															<p>
																<a
																	href='<%=request.getContextPath() %>/download?DOC_ID=${litigations.preventiveOrderDoc.documentId}'>${litigations.preventiveOrderDoc.fileName}</a>
															</p>
														</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														Any further orders in this regard<span class="space_LR">:</span>
													</p>
												</div>

												<div class="col-md-3 col-sm-6 col-xs-6">

															<p>
																<a
																	href='<%=request.getContextPath() %>/download?DOC_ID=${litigations.furtherOrderDoc.documentId}'>${litigations.furtherOrderDoc.fileName}</a>
															</p>
														</div>
											      </div>
                                                 <div class="row">
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														Present Status<span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${litigations.litigationStatus}</p>
												</div>

											</div>
                                             </c:if>  
										</c:forEach>

										<br />
										<br />
										<h5>5. Modification, Amendment or Revision to License,
											Permit or Approval (if any)</h5>
										<br />
										<c:forEach items="${qudm.modificationDetails}"
											var="modification">
											<div class="row">
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														Is any there modification to approvals?<span
															class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${modification.isModificationRequiredToApprove}</p>
												</div>

												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														Issued by Authority<span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${modification.issuedByAuthority}</p>
												</div>

											</div>

											<div class="row">
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">

														Written consent of at least two-third of Allottees<span
															class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${modification.writtenConsentOfAllotee}</p>
												</div>

												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														Uploaded document<span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">


													<p>
														<a
															href='<%=request.getContextPath() %>/download?DOC_ID=${modification.uploadApprovalDoc.documentId}'>${modification.uploadApprovalDoc.fileName}</a>
													</p>

												</div>

											</div>

											<div class="row">
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														Modified Plan<span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">


													<p>
														<a
															href='<%=request.getContextPath() %>/download?DOC_ID=${modification.modifiedDoc.documentId}'>${modification.modifiedDoc.fileName}</a>
													</p>


												</div>

											</div>
										</c:forEach>

										<br />
										<h5>6. Association of Allottees</h5>
										<br />

										<div class="row">
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													Is any Association formed?<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${qudm.associationDetails.isAssocitionFormed}</p>
											</div>

										</div>

                                           <c:if test="${qudm.associationDetails.isAssocitionFormed=='Yes'}">
										<div class="row">
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													Name of the Association<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${qudm.associationDetails.associationName}</p>
											</div>

										</div>

										<div class="row">
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">

													Registration document:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">


												<p>
													<a
														href='<%=request.getContextPath() %>/download?DOC_ID=${qudm.associationDetails.registeredDoc.documentId}'>${qudm.associationDetails.registeredDoc.fileName}</a>
												</p>


											</div>

										</div>

                                          </c:if>

										<br />
										<br />


									 <br />
						<h5>7. Construction Workers Welfare Fund Registration</h5>
						<br />

						<div class="row">
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p class="text-right">
									Is Applicable?<span class="space_LR">:</span>
								</p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p>${qudm.projectWelfareFundDetails.isApplicable}</p>
							</div>

						</div>

                         <c:if test="${qudm.projectWelfareFundDetails.isApplicable=='Yes'}">
						<div class="row">
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p class="text-right">
									Registration No Of WelFare Fund<span class="space_LR">:</span>
								</p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p>${qudm.projectWelfareFundDetails.projecteFundRegNo}</p>
							</div>

						</div>

						<div class="row">
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p class="text-right">

									Registration document:</span>
								</p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								
								<p>
								<a
								href='<%=request.getContextPath() %>/download?DOC_ID=${qudm.projectWelfareFundDetails.welfareFundregisteredDoc.documentId}'>${qudm.projectWelfareFundDetails.welfareFundregisteredDoc.fileName}</a>
							</p>
							</div>

						</div>
                            </c:if>
						<br /> <br />
						
					 <br /> 
						
							 <h5>8.Status of Approvals / NOCs required for the project</h5>
						<br />
						
						<c:forEach items="${qudm.approvalsAndNOCDetails}" var="approvalList">
											<div class="row">
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														<b>Details of Approvals / NOCs </b><span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<b><p>${approvalList.detailsOfApprovalsOrNoc}</p></b>
												</div>
                                        
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														Applicable?<span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${approvalList.isApplicable}</p>
												</div>
												 </div>
												 <c:if test="${approvalList.isApplicable=='Yes'}">
										<div class="row">
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														Status Of Approval<span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${approvalList.status}</p>
												</div>
												
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														Date of Application<span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${approvalList.dateOfApplication.time}</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														Uploaded Document<span class="space_LR">:</span>
													</p>
												</div>
												
												<div class="col-md-3 col-sm-6 col-xs-6">
								
								                 <p>
								              <a
								                   href='<%=request.getContextPath() %>/download?DOC_ID=${approvalList.uploadDoc.documentId}'>${approvalList.uploadDoc.fileName}</a>
							                     </p>
							                 </div>
						                  </div>
							         </c:if> 	
					</c:forEach>
										

						<br /> <br />
						
						<br /> 
							<h5>9. Construction Cost Details </h5>
										<br />
										<c:forEach items="${qudm.quarterConstructionCostList}"
											var="quarterConsCostList">
											<div class="row">
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														<b>Consturction cost particular </b><span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<b><p>${quarterConsCostList.consCostParticular}</p></b>
												</div>
                                         </div>
										<div class="row">
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														Estimated cost<span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${quarterConsCostList.estConsCost}</p>
												</div>

												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														Acctual cost<span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${quarterConsCostList.actConsCost}</p>
												</div>

											</div>
											
											
										</c:forEach>
										
										
										<br />
										<br />
										
										
										<br />
										<h5>10. Sub Structure</h5>
										<br />
										<c:forEach items="${qudm.subStructureList}"
											var="subStructureList">
											<div class="row">
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														<b>Project Work </b><span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<b><p>${subStructureList.typeOfWork}</p></b>
												</div>
                                         </div>
										<div class="row">
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														Estimated From Date<span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${subStructureList.estimatedFrmDate.time}</p>
												</div>

												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														Estimated To Date<span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${subStructureList.estimatedToDate.time}</p>
												</div>

											</div>
											
											<div class="row">
												
										
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														Acctual From Date<span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${subStructureList.estimatedFrmDate.time}</p>
												</div>

												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														Acctual To Date<span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${subStructureList.estimatedToDate.time}</p>
												</div>

											</div>
											
										</c:forEach>

										<br />
										<br />
										<h5>11. Super Structure</h5>
										<br />
										<c:forEach items="${qudm.superStructureList}"
											var="superStructureList">
											<div class="row">
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
													<b>	Project Work </b><span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<b><p>${superStructureList.typeOfWork}</p></b>
												</div>
                                         </div>
										<div class="row">
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														Estimated From Date<span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${superStructureList.estimatedFrmDate.time}</p>
												</div>

												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														Estimated To Date<span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${superStructureList.estimatedToDate.time}</p>
												</div>

											</div>
											
											<div class="row">
												
										
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														Acctual From Date<span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${superStructureList.estimatedFrmDate.time}</p>
												</div>

												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														Acctual To Date<span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${superStructureList.estimatedToDate.time}</p>
												</div>

											</div>
											
										</c:forEach>

										<br />
										
										<br />
										

										<br />
										<br />
										<h5>12. Status of Finishing Or Interior Structure</h5>
										<br />
										<c:forEach items="${qudm.finishingOrInteriorWorkList}"
											var="interiorList">
											<div class="row">
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														<B>Project Work </B><span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<B><p>${interiorList.typeOfWork}</p></B>
												</div>
                                         </div>
										<div class="row">
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														Estimated From Date<span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${interiorList.estimatedFrmDate.time}</p>
												</div>

												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														Estimated To Date<span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${interiorList.estimatedToDate.time}</p>
												</div>

											</div>
											
											<div class="row">
												
										
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														Acctual From Date<span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${interiorList.estimatedFrmDate.time}</p>
												</div>

												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														Acctual To Date<span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${interiorList.estimatedToDate.time}</p>
												</div>

											</div>
											
										</c:forEach>

										
										
										<br />
										<br />
										<h5>13. Status of Construction of Internal Infrastructure</h5>
										<br />
										<c:forEach items="${qudm.infrastructureDetails}"
											var="internalList">
											<div class="row">
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														<b>Internal Infrastructure Name </b><span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${internalList.infrastructureName}</p>
												</div>
                                        
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														<b>Percentage of Completion</b><span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${internalList.percentageOfCompletion}</p>
												</div>

												</div>
										</c:forEach>

									<br />
										<br />
										<h5>14. Status of Construction of External  Infrastructure</h5>
										<br />
										<c:forEach items="${qudm.externalinfrastructureDetails}"
											var="externalList">
											<div class="row">
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														<b>Internal Infrastructure Name </b><span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${externalList.externalInfrastructureName}</p>
												</div>
                                       
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														<b>Percentage of Completion</b><span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${externalList.percentageOfCompletion}</p>
												</div>

												</div>
										</c:forEach>

										
										<br />
										<br />
										<h5>15. Status of Amenities Details</h5>
										<br />
										<c:forEach items="${qudm.amenityList}"
											var="amenity">
											<div class="row">
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														<b>Internal Infrastructure Name </b><span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${amenity.amenityName}</p>
												</div>
                                        
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														<b>Percentage of Completion</b><span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${amenity.percOfCompletion}</p>
												</div>
                                             </div>
												
										</c:forEach>

										<br />
										<br />
										
										<br />
										<br />
										<h5>16. Status of Construction of Common Areas</h5>
										<br />
										<c:forEach items="${qudm.commonAreaDetails}"
											var="commonArea">
											<div class="row">
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														<b>Internal Infrastructure Name</b> <span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${commonArea.commonAreaName}</p>
												</div>
                                        
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														<b>Percentage of Completion </b><span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${commonArea.percentageOfCompletion}</p>
												</div>
                                             </div>
												
										</c:forEach>

										<br />
										<br />
						

							</div>
						</div>

					<%-- <div id="menu2" class="tab-pane fade" style="padding-left: 80px;">

						<br>



						<h2>Please select documents to download</h1>
						<br>

						<center>

							<table id="" border="0">



								<tbody>


									<tr>

										<td><input type="checkbox" class="checkdoc"
											value="${project.projectDocModel.approveSacPlanDoc.docId}"></td>

										<td width="50%">Approved Building/Plotting Plan</td>

										<td><input type="checkbox" class="checkdoc"
											value="${project.projectDocModel.approveLayoutPlanDoc.docId}"></td>

										<td>Approved Layout Plan</td>

									</tr>


									<tr>

										<td><input type="checkbox" class="checkdoc"
											value="${project.projectDocModel.agreementFileDoc.docId}"></td>

										<td>Proforma For Sale Deed</td>

										<td><input type="checkbox" class="checkdoc"
											value="${project.projectDocModel.extendedLayoutPlanDoc.docId}"></td>

										<td>Existing Layout Plan</td>

									</tr>


									<tr>

										<td><input type="checkbox" class="checkdoc"
											value="${project.projectDocModel.extendedSacPlanDoc.docId}"></td>

										<td>Existing Section Plan and Specification</td>

										<td><input type="checkbox" class="checkdoc"
											value="${project.projectDocModel.landLocationFileDoc.docId}"></td>

										<td>Sale Deed & RTC</td>

									</tr>


									<tr>

										<td><input type="checkbox" class="checkdoc"
											value="${project.projectDocModel.sanctionedLayoutPlanDoc.docId}"></td>

										<td>Approved Section Of Building/Infrastructure Plan of
											Plotting</td>

										<td><input type="checkbox" class="checkdoc"
											value="${project.projectDocModel.areaDevelopmentDoc.docId}"></td>

										<td>Area Development Plan Of Project Area</td>

									</tr>


									<tr>

										<td><input type="checkbox" class="checkdoc"
											value="${project.projectDocModel.performaOfAllotmentLetterDoc.docId}"></td>

										<td>Performa of Allotment Letter</td>

										<td><input type="checkbox" class="checkdoc"
											value="${project.projectDocModel.brochureOfCurrentProjectDoc.docId}"></td>

										<td>Brochure of Current Project</td>

									</tr>


									<tr>

										<td><input type="checkbox" class="checkdoc"
											value="${project.projectDocModel.projectSpecificDoc.docId}"></td>

										<td>Project Specification</td>

										<td><input type="checkbox" class="checkdoc"
											value="${project.projectDocModel.encumbranceCertificateDoc.docId}"></td>

										<td>Encumbrance Certificate</td>

									</tr>


									<tr>

										<td><input type="checkbox" class="checkdoc"
											value="${project.projectDocModel.titleDeed.docId}"></td>

										<td>Conveyance Deed / Title Deed (Khatha)</td>

										<td><input type="checkbox" class="checkdoc"
											value="${project.projectDocModel.jointDevelopmentAgreement.docId}"></td>

										<td>Collaboration Agreement/Development Agreement/Joint
											Development Agreement/Other Agreement</td>

									</tr>


									<tr>

										<td><input type="checkbox" class="checkdoc"
											value="${project.projectAddDocModel.anyOtherDoc.docId}"></td>

										<td>Any other document (Rights/Title/Interest/Name)</td>

										<td><input type="checkbox" class="checkdoc"
											value="${project.projectAddDocModel.section95.docId}"></td>

										<td>Conversion Certificate under Sec 95 of the KLR Act
											1961</td>

									</tr>


									<tr>

										<td><input type="checkbox" class="checkdoc"
											value="${project.projectAddDocModel.section14.docId}"></td>

										<td>Approval/NOC under Sec 14 of the KTCP Act</td>

										<td><input type="checkbox" class="checkdoc"
											value="${project.projectAddDocModel.section109.docId}"></td>

										<td>Approval/NOC under section 109 of KLR Act 1961</td>

									</tr>


									<tr>

										<td><input type="checkbox" class="checkdoc"
											value="${project.projectAddDocModel.fireForceDept.docId}"></td>

										<td>Fire Force Department</td>

										<td><input type="checkbox" class="checkdoc"
											value="${project.projectAddDocModel.airportAuthorityOfIndia.docId}"></td>

										<td>Airport Authority of India</td>

									</tr>


									<tr>

										<td><input type="checkbox" class="checkdoc"
											value="${project.projectAddDocModel.bescom.docId}"></td>

										<td>BESCOM</td>

										<td><input type="checkbox" class="checkdoc"
											value="${project.projectAddDocModel.bescom.docId}"></td>

										<td>BWSSB</td>

									</tr>


									<tr>

										<td><input type="checkbox" class="checkdoc"
											value="${project.projectAddDocModel.kspcb.docId}"></td>

										<td>KSPCB</td>

										<td><input type="checkbox" class="checkdoc"
											value="${project.projectAddDocModel.seiaa.docId}"></td>

										<td>SEIAA</td>

									</tr>


									<tr>

										<td><input type="checkbox" class="checkdoc"
											value="${project.projectAddDocModel.bsnl.docId}"></td>

										<td>BSNL</td>

										<td><input type="checkbox" class="checkdoc"
											value="${project.projectAddDocModel.nocBuildingAbuttingToNeighbourProperties.docId}"></td>

										<td>NOC in case of building proposals abutting to
											neighbouring properties</td>

									</tr>


									<tr>

										<td><input type="checkbox" class="checkdoc"
											value="${project.projectAddDocModel.liftAuthorities.docId}"></td>

										<td>Lift Authorities</td>

										<td><input type="checkbox" class="checkdoc"
											value="${project.projectAddDocModel.urbanLandCeiling.docId}"></td>

										<td>Urban Land Ceiling</td>

									</tr>


									<tr>

										<td><input type="checkbox" class="checkdoc"
											value="${project.projectAddDocModel.bmrcl.docId}"></td>

										<td>BMRCL</td>

										<td><input type="checkbox" class="checkdoc"
											value="${project.projectAddDocModel.bangaloreUrbanArtsCommission.docId}"></td>

										<td>Bangalore Urban Arts Commission</td>

									</tr>


									<tr>

										<td><input type="checkbox" class="checkdoc"
											value="${project.projectAddDocModel.inspectorOfFactoriesCntrlOfExplosivesRailways.docId}"></td>

										<td>Inspector of Factories Controller of explosives
											Railways</td>

										<td><input type="checkbox" class="checkdoc"
											value="${project.projectAddDocModel.distMagistrate.docId}"></td>

										<td>Dist Magistrate</td>

									</tr>


									<tr>

										<td><input type="checkbox" class="checkdoc"
											value="${project.projectAddDocModel.coastalRegulationZoneAuthority.docId}"></td>

										<td>Coastal Regulation Zone Authority</td>

										<td><input type="checkbox" class="checkdoc"
											value="${project.projectAddDocModel.engrIndicateStructural.docId}"></td>

										<td>Certificate from Registered Engineer indicating the
											structural safety of the building (for Apartments)</td>

									</tr>


									<tr>

										<td><input type="checkbox" class="checkdoc"
											value="${project.projectAddDocModel.sectionalDrawingOfTheApartments.docId}"></td>

										<td>Sectional Drawing of the apartments</td>

										<td><input type="checkbox" class="checkdoc"
											value="${project.projectDocModel.changeOfLandUse.docId}"></td>

										<td>Change of Land Use</td>

									</tr>


									<tr>

										<td><input type="checkbox" class="checkdoc"
											value="${project.projectDocModel.existingLayoutPlan.docId}"></td>

										<td>Existing Layout Plan</td>

										<td><input type="checkbox" class="checkdoc"
											value="${project.projectDocModel.existingSectionPlanandSpec.docId}"></td>

										<td>Existing Section Plan and Specification</td>

									</tr>


									<tr>

										<td><input type="checkbox" class="checkdoc"
											value="${project.projectAddDocModel.utilisationCert.docId}"></td>

										<td>Utilisation certificate</td>

										<td><input type="checkbox" class="checkdoc"
											value="${project.projectAddDocModel.transferOfDevRightsCert.docId}"></td>

										<td>Transfer of development rights certificate</td>

									</tr>


									<tr>

										<td><input type="checkbox" class="checkdoc"
											value="${project.projectAddDocModel.relinquishmenDeed.docId}"></td>

										<td>Relinquishment Deed</td>

										<td><input type="checkbox" class="checkdoc"
											value="${project.projectDocModel.commencementCertDoc.docId}"></td>

										<td>Commencement Certificate</td>

									</tr>



									<tr>

										<td><input type="checkbox" class="checkdoc"
											value="${project.projectAddDocModel.advocatesearchreport.docId}"></td>

										<td>Advocate Search Report</td>


									</tr>


									<tr>

										<td><input type="checkbox" class="checkdoc"
											value="${project.projectDocModel.declarationFormbDoc.docId}"
											title="no
document attched"></td>

										<td>Project Photo</td>

										<td><input type="checkbox" class="checkdoc"
											value="${project.projectAddDocModel.relinquishmenDeed.docId}"></td>

										<td>Declaration (Form B)</td>



									</tr>

								</tbody>

							</table>



							<br>



							<div class="button-wrapper">

								<input name="btn1" class="btn-style" id="DownloadDocButton"
									value="Download" type="button" onclick="getValue()" />

							</div>
					</div> --%>






				</div>

			</div>
</div>
	<!--inner container end here-->

</div>



<form:form method="post" action="publicDomain/getFiles"
	id="downloadForm" name="downloadForm" autocomplete="off">

	<input type="hidden" name="docIds">


</form:form>


<script>
	function getValue() {

		/* declare an checkbox array */

		var chkArray = [];

		/* look for all checkboes that have a class 'chk' attached to it and
		 check if it was checked */

		$(".checkdoc:checked").each(function() {

			chkArray.push($(this).val());

		});

		var selected;

		selected = chkArray.join(',');

		/* check if there is selected checkboxes, by default the length is 1
		 as it contains one single comma */

		if (selected.length > 0) {

			document.getElementById('downloadForm').docIds.value = selected;

			document.getElementById('downloadForm').submit();

		} else {

			alert("Please select documents to download");

		}

	}
</script>