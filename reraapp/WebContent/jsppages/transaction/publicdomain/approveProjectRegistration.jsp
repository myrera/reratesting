<%@page import="in.gov.rera.common.security.ReraSecurity"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@page import="in.gov.rera.common.model.UserModel"%>

<%@page import="in.gov.rera.common.util.ReraConstants"%>



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
		doc.save("'${project.applicationNo }'.pdf");
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
	/Project Details</div>

<a class="pull-right user_name"
	href='<%=request.getContextPath()%>/publicDomain/projectList'>Back to List</a>




<div class="col-md-12 col-sm-12 " style="background-color: white;">


	<div class="Main_containner">


		<form name="approvalForm" autocomplete="off"
			action="approveProjectRegistration" method="post">


			<!--Inner wrapper stsrt here-->

			<div class="inner_wrapper">





				<h1>

					Project Registration<span> Detail</span>

				</h1>


				<span class="pull-right user_name">Ack Number :<b>

						${project.applicationNo }</b></span> <br> <span user_name">Project Name :<b>

						${project.projectDetailsModel.projectName }</b></span> <br>

				<div class="border">

					<div class="orange"></div>

					<div class="black"></div>

				</div>

				<script>
					data.push({
						id : 1,
						name : 'Ack Number',
						email : '${project.applicationNo }'
					});

					data.push({

						id : 1,

						name : 'Project Name',

						email : '${project.projectDetailsModel.projectName }'

					});

					data.push({

						id : 1,

						name : 'Promoter Name',

						email : '${project.promoterDetailsModel.promoterName}'

					});

					data
							.push({

								id : 1,

								name : 'Promoter Type',

								email : '${project.promoterDetailsModel.typeOfPromoter}'

							});

					data.push({

						id : 1,

						name : 'PAN Number',

						email : '${project.promoterDetailsModel.panNo}'

					});

					

					data.push({

						id : 1,

						name : 'Email',

						email : '${project.promoterDetailsModel.emailId}'

					});

					data.push({

						id : 1,

						name : 'Address',

						email : '${project.promoterDetailsModel.addressLine1}'

					});

					data.push({

						id : 1,

						name : ' ',

						email : '${project.promoterDetailsModel.addressLine2}'

					});

					data
							.push({

								id : 1,

								name : 'District',

								email : '${project.promoterDetailsModel.districtModel.districtName}'

							});

					data
							.push({

								id : 1,

								name : 'State',

								email : '${project.promoterDetailsModel.districtModel.stateUtModel.stateUtName}'

							});

					data.push({

						id : 1,

						name : 'Pincode',

						email : '${project.promoterDetailsModel.pinCode}'

					});

					data
							.push({

								id : 1,

								name : 'Company Registration No.',

								email : '${project.promoterDetailsModel.comRegistrationNo}'

							});

					data
							.push({

								id : 1,

								name : 'Authorized Signatory Name ',

								email : '${project.promoterDetailsModel.projectChairmanModel.chairmanName}'

							});

					data.push({

						id : 1,

						name : 'Address',

						email : '${project.promoterDetailsModel.addressLine1}'

					});

					data.push({

						id : 1,

						name : '',

						email : '${project.promoterDetailsModel.addressLine2}'

					});
				</script>

				<c:forEach
					items="${project.promoterDetailsModel.projectChairmanModel.memberSet}"
					var="ProMemObj">
					<script>
						data.push({

							id : 1,

							name : 'Project Member Details : ',

							email : ''

						});
						data.push({

							id : 1,

							name : 'Project Member Name',

							email : '${ProMemObj.memberName}'

						});
						data.push({

							id : 1,

							name : 'Project Member Type',

							email : '${ProMemObj.memberType}'

						});
						data.push({

							id : 1,

							name : 'Project Member address',

							email : '${ProMemObj.addressLine1}'

						});
						data.push({

							id : 1,

							name : '',

							email : '${ProMemObj.addressLine2}'

						});

						data.push({

							id : 1,

							name : 'Pin Code',

							email : '${ProMemObj.pinCode}'

						});
					</script>
				</c:forEach>


				<c:forEach items="${project.promoterDetailsModel.promoterBlackSet}"
					var="blckListObj">

					<script>
						data
								.push({

									id : 1,

									name : 'RERA Registration Details with any other State/UTs :',

									email : ''

								});

						data.push({

							id : 1,

							name : 'Have your said registration been revoked?',

							email : '${blckListObj.isBalckList}'

						});

						data.push({

							id : 1,

							name : 'Certificate Number',

							email : '${blckListObj.certificateNo}'

						});

						data.push({

							id : 1,

							name : 'Reason for Revoked',

							email : '${blckListObj.blacklistReason}'

						});
					</script>
				</c:forEach>

				<c:forEach items="${project.previousProjectDetailsSet}" var="preobj">
					<script>
						data.push({
							id : 1,
							name : 'Previous Project Details :',
							email : ''

						});

						data.push({

							id : 1,

							name : 'Project Name',

							email : '${preobj.projectName}'

						});

						data.push({

							id : 1,

							name : 'Project Description',

							email : '${preobj.projectDescription}'

						});

						data.push({

							id : 1,

							name : 'Current Status',

							email : '${preobj.projectCurrentStatus}'

						});

						data.push({

							id : 1,

							name : 'Type of Land',

							email : '${preobj.typeOfLand}'

						});

						data.push({

							id : 1,

							name : 'If Delayed',

							email : '${preobj.ifDelayed}'

						});

						data.push({

							id : 1,

							name : 'No of Months',

							email : '${preobj.noOfMonthDelayed}'

						});

						data.push({

							id : 1,

							name : 'If Ongoing ',

							email : '${preobj.ifOngoing}'

						});

						data.push({

							id : 1,

							name : 'Expected Completion Date',

							email : '${preobj.expectedCompletionDate.time}'

						});

						data.push({

							id : 1,

							name : 'If Completed',

							email : '${preobj.projectCurrentStatus}'

						});

						data.push({

							id : 1,

							name : 'Address',

							email : '${preobj.projectAddress}'

						});

						data
								.push({

									id : 1,

									name : 'State/UT',

									email : '${preobj.districtModel.stateUtModel.stateUtName}'

								});

						data.push({

							id : 1,

							name : 'District',

							email : '${preobj.districtModel.districtName}'

						});

						data.push({

							id : 1,

							name : 'Pin Code',

							email : '${preobj.projectAddrPinCode}'

						});
					</script>
				</c:forEach>

				<script>
					//project Details

					data.push({

						id : 1,

						name : 'Project Details : ',

						email : ''

					});

					data.push({

						id : 1,

						name : 'Project Name',

						email : '${project.projectDetailsModel.projectName}'

					});

					data
							.push({

								id : 1,

								name : 'Project Description',

								email : '${project.projectDetailsModel.projectDescription}'

							});

					data.push({

						id : 1,

						name : 'Project Type',

						email : '${project.projectDetailsModel.projectType}'

					});

					data.push({

						id : 1,

						name : 'Project Status',

						email : '${project.projectDetailsModel.projectStatus}'

					});

					data.push({

						id : 1,

						name : 'Project Start Date',

						email : '${project.projectDetailsModel.startDate.time}'

					});
					data
							.push({

								id : 1,

								name : 'Project End Date',

								email : '${project.projectDetailsModel.completionDate.time}'

							});

					data
							.push({

								id : 1,

								name : 'Total Area Of Land (Sq Mtr)',

								email : '${project.projectDetailsModel.totalAreaOfLand}'

							});

					data
							.push({

								id : 1,

								name : 'Total Coverd Area (Sq Mtr)',

								email : '${project.projectDetailsModel.totalCoverdArea}'

							});

					data.push({

						id : 1,

						name : 'Total Open Area (Sq Mtr)',

						email : '${project.projectDetailsModel.totalOpenArea}'

					});

					data.push({

						id : 1,

						name : 'Estimated Cost of Construction (INR) ',

						email : '${project.projectDetailsModel.estimatedCost}'

					});

					data.push({

						id : 1,

						name : 'Estimated Cost of Construction (INR) ',

						email : '${project.projectDetailsModel.estimatedCost}'

					});

					data.push({

						id : 1,

						name : 'Cost of Land (INR) ',

						email : '${project.projectDetailsModel.costOfLand}'

					});

					data
							.push({

								id : 1,

								name : 'Total Project Cost (INR)',

								email : '${project.projectDetailsModel.totalProjectCost}'

							});

					data
							.push({

								id : 1,

								name : 'Project Address',

								email : '${project.projectDetailsModel.addressLine1},${project.projectDetailsModel.addressLine2}'

							});

					data
							.push({

								id : 1,

								name : 'District',

								email : '${project.projectDetailsModel.subDistrictModel.districtModel.districtName}'

							});

					data
							.push({

								id : 1,

								name : 'Tehsil/Sub District',

								email : '${project.projectDetailsModel.subDistrictModel.subDistrictName}'

							});

					data.push({

						id : 1,

						name : 'Nort Latitude',

						email : '${project.projectDetailsModel.northlatitude}'

					});

					data.push({

						id : 1,

						name : 'Nort Longitude',

						email : '${project.projectDetailsModel.northlongitude}'

					});

					data.push({

						id : 1,

						name : 'East Latitude',

						email : '${project.projectDetailsModel.eastlatitude}'

					});

					data.push({

						id : 1,

						name : 'East Longitude',

						email : '${project.projectDetailsModel.eastlongitude}'

					});

					data.push({

						id : 1,

						name : 'West Latitude',

						email : '${project.projectDetailsModel.westlatitude}'

					});

					data.push({

						id : 1,

						name : 'West Longitude',

						email : '${project.projectDetailsModel.westlongitude}'

					});

					data.push({

						id : 1,

						name : 'South Latitude',

						email : '${project.projectDetailsModel.southlatitude}'

					});

					data
							.push({

								id : 1,

								name : 'South Longitude',

								email : ' ${project.projectDetailsModel.southlongitude}'

							});

					data
							.push({

								id : 1,

								name : 'Approving Authority',

								email : '${project.projectDetailsModel.office.officeName}'

							});
				</script>


				<script>
					data
							.push({

								id : 1,

								name : 'No of Garage for Sale',

								email : '${project.projectDetailsModel.noOfGarageForSale}'

							});

					data
							.push({

								id : 1,

								name : 'Area of Garage for Sale (Sq Mtr)',

								email : '${project.projectDetailsModel.areaOfGarageForSale}'
							});

					data
							.push({

								id : 1,

								name : 'No of Open Parking for Sale',

								email : '${project.projectDetailsModel.noOfParkinfForSale}'

							});

					data
							.push({

								id : 1,

								name : 'Area of Open Parking for Sale (Sq Mtr)',

								email : ' ${project.projectDetailsModel.areaOfParkinfForSale}'
							});

					data
							.push({

								id : 1,

								name : 'No of Covered Parking for Sale',

								email : '${project.projectDetailsModel.noOfCoveredParkingForSale}'

							});

					data
							.push({

								id : 1,

								name : 'Area of Covered Parking for Sale (Sq Mtr)',

								email : '${project.projectDetailsModel.areaOfCoveredParkingForSale}'

							});

					data
							.push({

								id : 1,

								name : 'Area of Covered Parking for Sale (Sq Mtr)',

								email : '${project.projectDetailsModel.areaOfCoveredParkingForSale}'

							});

					data.push({

						id : 1,

						name : 'Extent of development carried till date',

						email : '${project.projectDetailsModel.devCompletion}%'

					});

					data.push({

						id : 1,

						name : 'Extent of development pending',

						email : '${project.projectDetailsModel.devPending}%'

					});

					data
							.push({

								id : 1,

								name : 'Total amount of money collected form allotee',

								email : '${project.projectDetailsModel.totalAmtClctedFrmAllotee}'

							});

					data
							.push({

								id : 1,

								name : 'Total amount of money used from development of project',

								email : '${project.projectDetailsModel.totalAmtUsedInPrjct}'

							});

					data
							.push({

								id : 1,

								name : 'Total amount of balance maney lying with promoter',

								email : '${project.projectDetailsModel.totalBalAmtOfAlte}'

							});

					data
							.push({

								id : 1,

								name : 'Is Any Subsequent Modification in Plan',

								email : '${project.projectDetailsModel.isSubSqChangeInPlan}'

							});

					data.push({

						id : 1,

						name : 'Is Delay in the Project',

						email : '${project.projectDetailsModel.isDelayed}'

					});

					data
							.push({

								id : 1,

								name : 'Reason For Delay',

								email : '${project.projectDetailsModel.reasonForDelayed}'

							});

					data
							.push({

								id : 1,

								name : 'No of Month Delay',

								email : '${project.projectDetailsModel.noOfMonthDelayed}'

							});

					data
							.push({

								id : 1,

								name : 'Expected Completion Date',

								email : '${project.projectDetailsModel.estimatedEndDate.time}'

							});
				</script>

				<c:forEach items="${project.developmentDetailSet}" var="devObj">
					<script>
						data.push({

							id : 1,

							name : 'Development Details : ',

							email : ''

						});

						data.push({

							id : 1,

							name : 'Type of Inventory',

							email : '${devObj.typeOfInventory}'

						});

						data.push({

							id : 1,

							name : 'No of Inventory',

							email : '${devObj.noOfInventory}'

						});

						data.push({

							id : 1,

							name : 'Carpet Area (Sq Mtr)',

							email : '${devObj.carpetArea}SqMtr'

						});

						data
								.push({

									id : 1,

									name : 'Area of exclusive balcony/verandah (Sq Mtr)',

									email : '${devObj.areaOfExclusive}SqMtr'

								});

						data
								.push({

									id : 1,

									name : 'Area of exclusive open terrace if any (Sq Mtr)',

									email : '${devObj.areaOfExclusiveOpenTerrace}SqMtr'

								});
					</script>
				</c:forEach>

				<script>
					data.push({

						id : 1,

						name : 'Internal Development Work  : ',

						email : ''

					});

					data
							.push({

								id : 1,

								name : 'Road & Road system',

								email : '${project.externalDevelopmentWorkModel.roadSysetmDevBy }'

							});
					data
							.push({

								id : 1,

								name : 'Water supply',

								email : '${project.externalDevelopmentWorkModel.waterSupplyBy }'
							});

					data
							.push({

								id : 1,

								name : 'Sewege and Drainage System',

								email : '${project.externalDevelopmentWorkModel.sewegeAndDrainageSystemDevBy}'
							});

					data
							.push({

								id : 1,

								name : 'Electricity Supply Trasfomer And Sub Stattion',

								email : '${project.externalDevelopmentWorkModel.electricityAndTrasfomerSupply }'
							});

					data
							.push({

								id : 1,

								name : 'Solid Waste Managment And Disposal',

								email : '${project.externalDevelopmentWorkModel.solidWasteSupplyBy}'
							});

					data
							.push({

								id : 1,

								name : 'Fire Fighting facility',

								email : '${project.externalDevelopmentWorkModel.fireFighting}'
							});

					data
							.push({

								id : 1,

								name : 'Drinking Water Facility',

								email : '${project.externalDevelopmentWorkModel.drinkingWater}'
							});
					data
							.push({

								id : 1,

								name : 'Emergency Evacuation Services',

								email : '${project.externalDevelopmentWorkModel.emergencyEvacuation }'
							});
					data
							.push({

								id : 1,

								name : 'Use of Renewable Energy',

								email : '${project.externalDevelopmentWorkModel.renewableEnergy}'
							});
					data
							.push({

								id : 1,

								name : 'Bank Name',

								email : '${project.projectBankDetailsModel.bankModel.bankName}'
							});
					data.push({

						id : 1,

						name : 'Bank Branch',

						email : '${project.projectBankDetailsModel.bankBranch}'
					});

					data
							.push({

								id : 1,

								name : 'Bank Account No',

								email : '${project.projectBankDetailsModel.accountNumber}'
							});

					data.push({

						id : 1,

						name : 'Bank ifscCode',

						email : '${project.projectBankDetailsModel.ifscCode}'
					});

					data
							.push({

								id : 1,

								name : 'State',

								email : '${project.projectBankDetailsModel.districtModel.stateUtModel.stateUtName}'
							});

					data
							.push({

								id : 1,

								name : 'District',

								email : '${project.projectBankDetailsModel.districtModel.districtName}'
							});
				</script>

				<c:forEach items="${project.projectAgentDetailSet}"
					var="preAgentObj">
					<script>
						data.push({

							id : 1,

							name : 'Associated Vendor Work :',

							email : ''
						});

						data.push({

							id : 1,

							name : 'Agent Registration No.',

							email : '${preAgentObj.agent.agentRegistrationNo}'
						});

						data
								.push({

									id : 1,

									name : 'Agent Name',

									email : '${preAgentObj.agent.agentDetailsModel.agentName}'
								});

						data
								.push({

									id : 1,

									name : 'Agent Address',

									email : '${preAgentObj.agent.agentDetailsModel.agentIndividualAddressLine1}'
								});
					</script>
				</c:forEach>

				<c:forEach items="${project.projectArchitectDetailSet}"
					var="arctObj">
					<c:if test="${arctObj.status=='CONFIRMED'}">
						<script>
							data.push({

								id : 1,

								name : 'Associated Vendor Work :',

								email : ''
							});

							data.push({

								id : 1,

								name : 'Name',

								email : '${arctObj.architectName}'
							});

							data.push({

								id : 1,

								name : 'EmailID',

								email : '${arctObj.emailId}'
							});

							data
									.push({

										id : 1,

										name : 'State',

										email : '${arctObj.districtModel.stateUtModel.stateUtName}'
									});

							data.push({

								id : 1,

								name : 'District',

								email : '${arctObj.districtModel.districtName}'
							});

							data
									.push({

										id : 1,

										name : 'Address',

										email : '${arctObj.addressLine1},${arctObj.addressLine2}'
									});

							data.push({

								id : 1,

								name : 'Pine Code',

								email : '${arctObj.pinCode}'
							});

							data.push({

								id : 1,

								name : 'Year Of Establishment',

								email : '${arctObj.yearOfEstablishment}'
							});

							data.push({

								id : 1,

								name : 'Number of Project Completed',

								email : '${arctObj.keyProject}'
							});

							data.push({

								id : 1,

								name : 'Reg. Number With COA.',

								email : '${arctObj.regOfCoaNo}'
							});
						</script>
					</c:if>
				</c:forEach>

				<c:forEach items="${project.structuralEngineerDetailSet}"
					var="strObj">
					<c:if test="${strObj.status=='CONFIRMED'}">
						<script>
							data.push({

								id : 1,

								name : 'Structural Engineers :',

								email : ''
							});

							data.push({

								id : 1,

								name : 'Name',

								email : '${strObj.engineerName}'
							});

							data.push({

								id : 1,

								name : 'EmailID',

								email : '${strObj.emailId}'
							});

							data
									.push({

										id : 1,

										name : 'State',

										email : '${strObj.districtModel.stateUtModel.stateUtName}'
									});

							data.push({

								id : 1,

								name : 'District',

								email : '${strObj.districtModel.districtName}'
							});

							data.push({

								id : 1,

								name : 'Address',

								email : '${arctObj.addressLine1},'
							});

							data.push({

								id : 1,

								name : '',

								email : '${arctObj.addressLine2}'
							});

							data.push({

								id : 1,

								name : 'Pine Code',

								email : '${strObj.pinCode}'
							});

							data.push({

								id : 1,

								name : 'Year Of Establishment',

								email : '${strObj.yearOfEstablishment}'
							});

							data.push({

								id : 1,

								name : 'Number of Project Completed',

								email : '${strObj.keyProject}'
							});

							data.push({

								id : 1,

								name : 'Local Authority Licence Number',

								email : '${strObj.localAuthorityLicenceNumber}'
							});
						</script>
					</c:if>
				</c:forEach>


				<c:forEach items="${project.projectContratorDetailSet}" var="strObj">
					<c:if test="${strObj.status=='CONFIRMED'}">

						<script>
							data.push({

								id : 1,

								name : 'Project Contractors :',

								email : ''
							});

							data.push({

								id : 1,

								name : 'Name',

								email : '${strObj.contractorName}'
							});

							data.push({

								id : 1,

								name : 'EmailID',

								email : '${strObj.emailId}'
							});

							data
									.push({

										id : 1,

										name : 'State',

										email : '${strObj.districtModel.stateUtModel.stateUtName}'
									});

							data.push({

								id : 1,

								name : 'District',

								email : '${strObj.districtModel.districtName}'
							});

							data.push({

								id : 1,

								name : 'Address',

								email : '${strObj.addressLine1},'
							});

							data.push({

								id : 1,

								name : '',

								email : '${strObj.addressLine2}'
							});

							data.push({

								id : 1,

								name : 'Pine Code',

								email : '${strObj.pinCode}'
							});

							data.push({

								id : 1,

								name : 'Year Of Establishment',

								email : '${strObj.yearOfEstablishment}'
							});

							data.push({

								id : 1,

								name : 'Number of Project Completed',

								email : '${strObj.keyProject}'
							});
						</script>
					</c:if>
				</c:forEach>
				
				<c:choose>
					<c:when
						test="${project.projectDetailsModel.projectType == 'Plotted Development' }">
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
					<script>
					data.push({

						id : 1,

						name : '1.Plot Details',

						email : ''

					});

					</script>

				<script>
					data.push({

								id : 1,

								name : 'Total number of Plots',

								email : '${pdm.totalNumberOfPlots}'

							});

					data.push({

								id : 1,

								name : 'Number of EWS(6x9) Plots',

								email : '${pdm.totalnoOfEWSPlots}'
							});
					data.push({

						id : 1,

						name : 'Number of LIG(9x12) Plots',

						email : '${pdm.totalnoOfLIGPlots}'
					});
					data.push({

						id : 1,

						name : 'Number of MIG(9x15) Plots',

						email : '${pdm.totalnoOfMIGPlots}'
					});
					data.push({

						id : 1,

						name : 'Number of HIG(15x24) Plots',

						email : '${pdm.totalnoOfHIGPlots}'
					});
					data.push({

						id : 1,

						name : 'Number of Other Plots',

						email : '${pdm.totalnoOfOtherPlots}'
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
						name : '2.Project Schedule ',
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

						name : '2.1 Civil Work',

						email : ''

					});
					</script>
	                  
					<c:forEach items="${plotScheduleModel.civilWorkList}" var="civilWork">
					 <script>
					data.push({

						id : 1,

						name : 'Project Work ',

						email : '${civilWork.typeOfWork}'

					});

					data
							.push({

								id : 1,

								name : 'Estimated From Date',

								email : '${civilWork.estimatedFrmDate.time}'

							});

					data.push({

						id : 1,

						name : 'Estimated To Date',

						email : '${civilWork.estimatedToDate.time}'

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

						name : ' 2.2.Common Areas To be used by the Purchaser',

						email : ''

					});
					</script>
					
					<c:forEach items="${plotScheduleModel.commonAreasPurchaserList}" var="commonPurchaser">
					 <script>

					data.push({

						id : 1,

						name : 'Common Area Name',

						email : '${commonPurchaser.commonArea}'

					});

					data
							.push({

								id : 1,

								name : 'Is Applicable',

								email : '${commonPurchaser.isApplicable}'

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

						name : '2.3 Status of Common Areas To be Relinquished to local Authority /Planning Authority',

						email : ''

					});
					</script>
					
					
						<script>

					data.push({

						id : 1,

						name : 'Public and Semi Public Sites:',

						email : ''

					});

					data.push({

								id : 1,

								name : 'No. of Public and Semi Pubic Sites',

								email : '${plotScheduleModel.plotsCommonAreaRelinquisedAuthorityModel.noOfPublicOrSemiPubSites}'

							});

					data.push({

								id : 1,

								name : 'Area of Public and Semi Pubic Sites(in Sq.m)',

								email : '${plotScheduleModel.plotsCommonAreaRelinquisedAuthorityModel.totAreaOfPublicOrSemiPubSites}'

							});
					data.push({

						id : 1,

						name : 'Parks and Open Spaces',

						email : ''

					});
					data.push({

						id : 1,

						name : 'No. of Parks and Open Spaces',

						email : '${plotScheduleModel.plotsCommonAreaRelinquisedAuthorityModel.totNoOfParkAndOpenSpace}'

					});
					data.push({

						id : 1,

						name : 'Area of Parks and Open Spaces(in Sq.m)',

						email : '${plotScheduleModel.plotsCommonAreaRelinquisedAuthorityModel.totAreaOfParkAndOpenSpace}'

					});
					data.push({

						id : 1,

						name : 'Road and Transportation',

						email : ''

					});
					data.push({

						id : 1,

						name : 'Area of Road/Transportation(in Sq.m)',

						email : '${plotScheduleModel.plotsCommonAreaRelinquisedAuthorityModel.totAreaOfRoad}'

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

							name : '4. Plot Quarterly Update Details',

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

							name : '4.1. Bank  Details',

							email : ''

						});
</script>
                  <script>
						data.push({

							id : 1,

							name : 'Percentage of completion of project',

							email : '${plotQuarter.bankDetails.percentageOfProjectCompletion}'

						});

						data.push({

							id : 1,

							name : 'Total advance amount collected from prospective purchasers (in INR)',
								

							email : '${plotQuarter.bankDetails.totAdvanceAmt}'

						});

						data
								.push({

									id : 1,

									name : 'Amount withdrawn from the bank for the purpose of the project (INR)',

									email : '${plotQuarter.bankDetails.amtWithdrawnFromBank}'

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

							name : '4.2. Plot Details: ',

							email : ''

						});

						</script>
				
					<script>
						data.push({

							id : 1,

							name : 'Total Plots ',

							email : '${pdm.totalNumberOfPlots}'

						});
						data.push({

							id : 1,

							name : 'Total Plots booked',

							email : '${plotQuarter.plotDetails.totalNumberOfPlotsBooked}'

						});
						data.push({

							id : 1,

							name : 'Total Plots Available',

							email : '${plotQuarter.plotDetails.totalNumberOfPlotsAvailable}'

						});
						data.push({

							id : 1,

							name : 'Plots Category',

							email : 'EWS(6x9)'

						});
						data.push({

							id : 1,

							name : 'Total No. of Plots',

							email : '${pdm.totalnoOfEWSPlots}'

						});
						data.push({

							id : 1,

							name : 'No. of EWS Plots booked',

							email : '${plotQuarter.plotDetails.totalnoOfEWSPlotsBooked}'

						});
						data.push({

							id : 1,

							name : 'No. of EWS Plots Available',

							email : '${plotQuarter.plotDetails.totalnoOfEWSPlotsAvailable}'

						});
						
						data.push({

							id : 1,

							name : 'Plots Category',

							email : 'EWS(6x9)'

						});
						data.push({

							id : 1,

							name : 'Total No. of EWS(6x9) Plots',

							email : '${pdm.totalnoOfEWSPlots}'

						});
						data.push({

							id : 1,

							name : 'No. of EWS(6x9) Plots booked',

							email : '${plotQuarter.plotDetails.totalnoOfEWSPlotsBooked}'

						});
						data.push({

							id : 1,

							name : 'No. of EWS(6x9) Plots Available',

							email : '${plotQuarter.plotDetails.totalnoOfEWSPlotsAvailable}'

						});
						
						data.push({

							id : 1,

							name : 'Plots Category',

							email : 'LIG(9x12)'

						});
						data.push({

							id : 1,

							name : 'Total No. of LIG(9x12) Plots',

							email : '${pdm.totalnoOfLIGPlots}'

						});
						data.push({

							id : 1,

							name : 'No. of LIG(9x12) Plots booked',

							email : '${plotQuarter.plotDetails.totalnoOfLIGPlotsBooked}'

						});
						data.push({

							id : 1,

							name : 'No. of LIG(9x12) Plots Available',

							email : '${plotQuarter.plotDetails.totalnoOfLIGPlotsAvailable}'

						});
						
						data.push({

							id : 1,

							name : 'Plots Category',

							email : 'MIG(9x15)'

						});
						data.push({

							id : 1,

							name : 'Total No. of MIG(9x15) Plots',

							email : '${pdm.totalnoOfMIGPlots}'

						});
						data.push({

							id : 1,

							name : 'No. of MIG(9x15) Plots booked',

							email : '${plotQuarter.plotDetails.totalnoOfMIGPlotsBooked}'

						});
						data.push({

							id : 1,

							name : 'No. of MIG(9x15) Plots Available',

							email : '${plotQuarter.plotDetails.totalnoOfMIGPlotsAvailable}'

						});
						
						data.push({

							id : 1,

							name : 'Plots Category',

							email : 'HIG(15x24)'

						});
						data.push({

							id : 1,

							name : 'Total No. of HIG(15x24) Plots',

							email : '${pdm.totalnoOfHIGPlots}'

						});
						data.push({

							id : 1,

							name : 'No. of HIG(15x24) Plots booked',

							email : '${plotQuarter.plotDetails.totalnoOfHIGPlotsBooked}'

						});
						data.push({

							id : 1,

							name : 'No. of HIG(15x24) Plots Available',

							email : '${plotQuarter.plotDetails.totalnoOfHIGPlotsAvailable}'

						});
						
						data.push({

							id : 1,

							name : 'Plots Category',

							email : 'Others'

						});
						data.push({

							id : 1,

							name : 'Total No. of Others Plots',

							email : '${pdm.totalnoOfOtherPlots}'

						});
						data.push({

							id : 1,

							name : 'No. of  Others booked',

							email : '${plotQuarter.plotDetails.totalnoOfOtherPlotsBooked}'

						});
						data.push({

							id : 1,

							name : 'No. of  Others Available',

							email : '${plotQuarter.plotDetails.totalnoOfOtherPlotsAvailable}'

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

						name : '4.3 Civil Work',

						email : ''

					});
					</script>
	                  
					 <c:forEach items="${plotQuarter.quarterCivilWorkList}" var="civilWorkList">
					 <script>
					data.push({

						id : 1,

						name : 'Project Work ',

						email : '${civilWorkList.typeOfWork}'

					});

					data
							.push({

								id : 1,

								name : 'Estimated From Date',

								email : '${civilWorkList.estimatedFrmDate.time}'

							});

					data.push({

						id : 1,

						name : 'Estimated To Date',

						email : '${civilWorkList.estimatedToDate.time}'

					});
					
					data
					.push({

						id : 1,

						name : 'Acctual From Date',

						email : '${civilWorkList.actualFrmDate.time}'

					});

			data.push({

				id : 1,

				name : 'Acctual To Date',

				email : '${civilWorkList.actualToDate.time}'

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

						name : ' 4.4.Common Areas To be used by the Purchaser',

						email : ''

					});
					</script>
					
					<c:forEach items="${plotQuarter.quarterCommonAreasPurchaserList}" var="commonAreaPurchaserList">
					 <script>

					data.push({

						id : 1,

						name : 'Common Area Name',

						email : '${commonAreaPurchaserList.commonArea}'

					});

					data
							.push({

								id : 1,

								name : 'Percentage of Completion',

								email : '${commonAreaPurchaserList.percentageOfCompletion}'

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

						name : '4.5. Status of Common Areas To be Relinquished to local Authority /Planning Authority',

						email : ''

					});
					</script>
					
					
						<script>

					data.push({

						id : 1,

						name : 'Public and Semi Public Sites:',

						email : ''

					});

					data.push({

								id : 1,

								name : 'No. of Public and Semi Pubic Sites',

								email : '${plotQuarter.quarterlyPlotsCommonAuthorityModel.noOfPublicOrSemiPubSites}'

							});
					
					data.push({

								id : 1,

								name : 'Area of Public and Semi Pubic Sites(in Sq.m)',

								email : '${plotQuarter.quarterlyPlotsCommonAuthorityModel.totAreaOfPublicOrSemiPubSites}'

							});
					data.push({

						id : 1,

						name : 'Percentage of Completion (%)',

						email : '${plotQuarter.quarterlyPlotsCommonAuthorityModel.percentageOfCompletionOfSites}'

					});
					
					data.push({

						id : 1,

						name : 'Parks and Open Spaces',

						email : ''

					});
					data.push({

						id : 1,

						name : 'No. of Parks and Open Spaces',

						email : '${plotQuarter.quarterlyPlotsCommonAuthorityModel.totNoOfParkAndOpenSpace}'

					});
					data.push({

						id : 1,

						name : 'Area of Parks and Open Spaces(in Sq.m)',

						email : '${plotQuarter.quarterlyPlotsCommonAuthorityModel.totAreaOfParkAndOpenSpace}'

					});
					data.push({

						id : 1,

						name : 'Percentage of Completion (%)',

						email : '${plotQuarter.quarterlyPlotsCommonAuthorityModel.percentageOfCompletionOfOpenSpace}'

					});
					
					data.push({

						id : 1,

						name : 'Road and Transportation',

						email : ''

					});
					data.push({

						id : 1,

						name : 'Area of Road/Transportation(in Sq.m)',

						email : '${plotQuarter.quarterlyPlotsCommonAuthorityModel.totAreaOfRoad}'

					});
					data.push({

						id : 1,

						name : 'Percentage of Completion (%)',

						email : '${plotQuarter.quarterlyPlotsCommonAuthorityModel.percentageOfCompletionOfRoad}'

					});
					
				</script>
				<script>
						data.push({

							id : 1,

							name : ' ',

							email : ''

						});
						</script>
				
				<script>
						data.push({

							id : 1,

							name : '4.6.Status of Approvals / NOCs required for the project: ',

							email : ''

						});
						</script>
						
					
						
				<c:forEach items="${plotQuarter.approvalsAndNOCDetails}" var="approvalAndNoc">

					<script>
						data.push({

							id : 1,

							name : 'Details of Approvals / NOCs ',

							email : '${approvalAndNoc.detailsOfApprovalsOrNoc}'

						});
						
						data.push({

							id : 1,

							name : 'Is Applicable?',

							email : '${approvalAndNoc.isApplicable}'

						});
						</script>
						
						 <c:if test="${approvalAndNoc.isApplicable=='Yes' }">
						 <script>
						data.push({

							id : 1,

							name : 'Status Of Approval',

							email : '${approvalAndNoc.status}'

						});
						data.push({

							id : 1,

							name : 'Date of Application',

							email : '${approvalAndNoc.dateOfApplication.time}'

						});
						
						
					</script>
					</c:if>
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

							name : '4.8. Litigation Details: ',

							email : ''

						});

						</script>
				
				<c:forEach items="${plotQuarter.litigationDetails}" var="litigations">

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

						name : '4.9. Modification, Amendment or Revision to License, Permit or Approval :',

						email : ''

					});

			
				</script>
								
				<c:forEach items="${plotQuarter.modificationDetails}" var="modification">

				<script>
					data.push({

								id : 1,

								name : 'Is any there modification to approvals?',

								email : '${modification.isModificationRequiredToApprove}'

							});
					</script>
					 <c:if test="${modification.isModificationRequiredToApprove=='Yes'}">
                      <script>
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
					<c:if test="${modification.writtenConsentOfAllotee=='Yes'}">
					<script>
					data.push({

								id : 1,

								name : 'Plan Number',

								email : '${modification.modificationPlanNo}'
							});
					
					data.push({

						id : 1,

						name : 'Date Of Approval',

						email : '${modification.dateOfApproval.time}'

					});
			       
				</script>
				</c:if>
				</c:if>
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

							name : '4.10. Association of Allottees: ',

							email : ''

						});

						data.push({

							id : 1,

							name : 'Is any Association formed? ',

							email : '${plotQuarter.associationDetails.isAssocitionFormed}'

						});
						</script>
						 <c:if test="${plotQuarter.associationDetails.isAssocitionFormed=='Yes'}">
						  <script>
						data.push({

							id : 1,

							name : 'Name of the Association',

							email : '${plotQuarter.associationDetails.associationName}'

						});
					</script>
					</c:if>
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

							name : '4.11. Construction Workers Welfare Fund Registration: ',

							email : ''

						});
						
						data.push({

							id : 1,

							name : 'Is Applicable? ',

							email : '${plotQuarter.welfareFundDetails.isWelfareFundApplicable}'

						});
						</script>
						 <c:if test="${plotQuarter.welfareFundDetails.isWelfareFundApplicable=='Yes'}">
						 <script>
						data.push({

							id : 1,

							name : 'Registration No Of WelFare Fund',

							email : '${plotQuarter.welfareFundDetails.plotWelfareFundRegNo}'

						});


						</script> 
				</c:if>
				 
				
				<script>
					data.push({

						id : 1,

						name : '',

						email : ''

					});

					</script>
				
				
                                          
					</c:when>
					<c:otherwise>
				
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

						name : 'Tower Details',

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

							name : 'Quarterly Update Details  : ',

							email : ''

						});
						</script>
						<script>
						data.push({

							id : 1,

							name : '1. Bank  Details',

							email : ''

						});
						</script>
						
						<c:forEach items="${quarterList}" var="quarterList">
						<c:if test="${not empty quarterList.bankDetails }">
						<script>
						data.push({

							id : 1,

							name : 'Percentage of completion of project',

							email : '${quarterList.bankDetails.percentageOfProjectCompletion}'

						});

						data.push({

							id : 1,

							name : 'Total advance amount collected from prospective purchasers (in INR)',
								

							email : '${quarterList.bankDetails.totAdvanceAmt}'

						});

						data
								.push({

									id : 1,

									name : 'Amount withdrawn from the bank for the purpose of the project (INR)',

									email : '${quarterList.bankDetails.amtWithdrawnFromBank}'

								});

						
					</script>
					</c:if>
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

							name : '4. Status of Sub Structure : ',

							email : ''

						});

						</script>
				
				
					<c:forEach items="${quarterList}" var="quarterList">
										<c:if test="${not empty quarterList.subStructureList }">
					<c:forEach items="${quarterList.subStructureList}" var="subStructureList">
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

							email : '${subStructureList.actualFrmDate.time}'

						});
						data.push({

							id : 1,

							name : 'Acctual To Date',

							email : '${subStructureList.actualToDate.time}'

						});
						
						
					</script>
				</c:forEach>
				</c:if>
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

							name : '5. Status of Super Structure: ',

							email : ''

						});

						</script>
				<c:forEach items="${quarterList}" var="quarterList">
									<c:if test="${not empty quarterList.superStructureList }">
				<c:forEach items="${quarterList.superStructureList}" var="superStructureList">

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
				</c:if>
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

							name : '7. Status of Finishing Or Interior Structure : ',

							email : ''

						});

						</script>
				
				<c:forEach items="${quarterList}" var="quarterList">
					<c:if test="${not empty quarterList.finishingOrInteriorWorkList }">
				<c:forEach items="${quarterList.finishingOrInteriorWorkList}" var="interiorList">
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
					</c:if>
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

							name : '8. Status of Construction of Internal Infrastructure : ',

							email : ''

						});

						</script>
					
					<c:forEach items="${quarterList}" var="quarterList">
									 <c:if test="${not empty quarterList.infrastructureDetails }">
						<c:forEach items="${quarterList.infrastructureDetails}" var="internalList">
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
				</c:if>
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

							name : '9. Status of Amenities Details : ',

							email : ''

						});

						</script>
				
				<c:forEach items="${quarterList}" var="quarterList">
				 <c:if test="${not empty quarterList.amenityList }">
					<c:forEach items="${quarterList.amenityList}" var="amenity">
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
				</c:if>
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

							name : '10. Status of Construction of Common Areas: ',

							email : ''

						});

						</script>
				<c:forEach items="${quarterList}" var="quarterList">
				 <c:if test="${not empty quarterList.commonAreaDetails }">
				<c:forEach items="${quarterList.commonAreaDetails}" var="commonArea">
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
				</c:if>
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

							name : '11. Status of Construction of External Infrastructure : ',

							email : ''

						});

						</script>
	                      <c:forEach items="${quarterList}" var="quarterList">
	                      <c:if test="${not empty quarterList.externalinfrastructureDetails }">
							<c:forEach items="${quarterList.externalinfrastructureDetails}" var="externalList">
							
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
				</c:if>
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

						name : '12. Litigation Details :',

						email : ''

					});

			
				</script>
				<c:forEach items="${quarterList}" var="quarterList">
				<c:if test="${not empty quarterList.litigationDetails }">
				<c:forEach items="${quarterList.litigationDetails}" var="litigations">

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
				</c:if>
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

						name : '13. Modification, Amendment or Revision to License, Permit or Approval :',

						email : ''

					});

			
				</script>
								
				<c:forEach items="${quarterList}" var="quarterList">
										<c:if test="${not empty quarterList.modificationDetails }">
										<c:forEach items="${quarterList.modificationDetails}" var="modification">

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
				</c:if>
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

							name : '14. Construction Workers Welfare Fund Registration: ',

							email : ''

						});
						</script>
						
						
						 <c:forEach items="${quarterList}" var="quarterList">
							<c:if test="${not empty quarterList.projectWelfareFundDetails }">
							<script>
						data.push({

							id : 1,

							name : 'Is Applicable? ',

							email : '${quarterList.projectWelfareFundDetails.isApplicable}'

						});

						
						data.push({

							id : 1,

							name : 'Registration No Of WelFare Fund',

							email : '${quarterList.projectWelfareFundDetails.projecteFundRegNo}'

						});


						</script>
                      </c:if>
             </c:forEach>

                 </c:otherwise>
                 </c:choose>
            


			<!-----------------------------Tab start here--------------------------------->

			<div class="tab_main">

				<ul class="nav nav-tabs">
					<li class="active"><a data-toggle="tab" href="#home">Promoter
							Detail</a></li>
					<li><a data-toggle="tab" href="#menu1">Project Detail</a></li>
					<li><a data-toggle="tab" href="#menu2">Uploaded Documents</a></li>
					<li><a data-toggle="tab" href="#menu3"> Payment</a></li>
					<li><a data-toggle="tab" href="#menu4">Enquiry Details</a></li>
					<li><a data-toggle="tab" href="#menu5">Post Registration</a></li>

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
									Promoter Type <span class="space_LR">:</span>
								</p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p class="text-view">
									${project.promoterDetailsModel.typeOfPromoter }</p>
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
									PAN Number<span class="space_LR">:</span>
								</p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p>${project.promoterDetailsModel.panNo}</p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p class="text-right">
									Phone Number<span class="space_LR">:</span>
								</p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p>${project.promoterDetailsModel.mobileNo}</p>
							</div>
						</div>


						<div class="row"></div>


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
									Address <span class="space_LR">:</span>
								</p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p>${project.promoterDetailsModel.addressLine1},${project.promoterDetailsModel.addressLine2}
								</p>
							</div>
						</div>


						<div class="row">
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p class="text-right">
									District <span class="space_LR">:</span>
								</p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p>${project.promoterDetailsModel.districtModel.districtName}
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
						</div>

						<div class="row">
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p class="text-right">
									Company Registration No. <span class="space_LR">:</span>
								</p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p>${project.promoterDetailsModel.comRegistrationNo}</p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p class="text-right">
									Certificate<span class="space_LR">:</span>
								</p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p>
									<a
										href='<%=request.getContextPath() %>/download?DOC_ID=${project.promoterDetailsModel.document.documentId}'>${project.promoterDetailsModel.document.fileName}</a>
								</p>
							</div>
						</div>



						<div class="inner_wrapper">

							<div class="col-md-12">
								<h1>
									Authorized Signatory <span> Detail</span>
								</h1>
								<div class="drop_shadow"></div>
							</div>



							<div class="row">
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right ">
										Name <span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-view">${project.promoterDetailsModel.projectChairmanModel.chairmanName}
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										Mobile Number<span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>${project.promoterDetailsModel.projectChairmanModel.mobileNo }</p>
								</div>
							</div>


							<div class="row">
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										Email Address <span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>${project.promoterDetailsModel.projectChairmanModel.emailId}</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										Address<span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>${project.promoterDetailsModel.projectChairmanModel.addressLine1}
										,
										${project.promoterDetailsModel.projectChairmanModel.addressLine2}</p>
								</div>
							</div>



							<div class="row">
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										Photograph<span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>
										<a
											href='<%=request.getContextPath() %>/download?DOC_ID=${project.promoterDetailsModel.projectChairmanModel.document.documentId}'>
											${project.promoterDetailsModel.projectChairmanModel.document.fileName}
										</a>
									</p>
								</div>
							</div>


						</div>



						<div class="inner_wrapper">

							<div class="col-md-12">
								<h1>
									Project Member <span> Detail</span>
								</h1>
								<div class="drop_shadow"></div>
							</div>

							<c:forEach
								items="${project.promoterDetailsModel.projectChairmanModel.memberSet}"
								var="ProMemObj">

								<div class="row">
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right ">
											Name <span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-view">${ProMemObj.memberName }</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Type<span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>${ProMemObj.memberType }</p>
									</div>
								</div>


								<div class="row">
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Mobile Number <span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>${ProMemObj.mobileNo}</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Email Address<span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>${ProMemObj.emailId}</p>
									</div>
								</div>

								<div class="row">
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Address<span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>${ProMemObj.addressLine1 }.${ProMemObj.addressLine2 }</p>
									</div>

									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Pin Code<span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>${ProMemObj.pinCode}</p>
									</div>
								</div>
								<div class="row">
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Photograph<span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>
											<a
												href='<%=request.getContextPath() %>/download?DOC_ID=${ProMemObj.momberPhotoDoc.documentId}'>
												${ProMemObj.momberPhotoDoc.fileName}</a>
										</p>
									</div>
								</div>

							</c:forEach>
						</div>



						<div class="inner_wrapper">

							<h1>
								RERA Registration Details with any <span>other State/UTs</span>
							</h1>
							<div class="drop_shadow"></div>
							<c:forEach
								items="${project.promoterDetailsModel.promoterBlackSet}"
								var="blckListObj">

								<div class="row">
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Have your said registration been revoked? <span
												class="space_LR">:</span>
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
											Reason for Revoked<span class="space_LR">:</span>
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
											If Completed <span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>${preobj.projectCurrentStatus}</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Project Completion Cretificate<span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>
											<a
												href='<%=request.getContextPath() %>/download?DOC_ID=${preobj.completionDocId.documentId}'>${preobj.completionDocId.fileName }</a>
										</p>
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
								<p>${project.projectDetailsModel.startDate.time}</p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p class="text-right">
									Project End Date<span class="space_LR">:</span>
								</p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p>${project.projectDetailsModel.completionDate.time}</p>
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
									Project Address <span class="space_LR">:</span>
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
							<fmt:parseNumber var="i" integerOnly="true" type="number"
								value="${project.projectDetailsModel.noOfGarageForSale}" />
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p>${i}</p>
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
											href="download?DOC_ID=${project.projectDetailsModel.delayedCertDoc.documentId}">
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
										<p>${devObj.carpetArea}SqMtr</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Area of exclusive balcony/verandah (Sq Mtr)<span
												class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>${devObj.areaOfExclusive}SqMtr</p>
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
										<p>${devObj.areaOfExclusiveOpenTerrace}SqMtr</p>
									</div>


								</div>
							</c:forEach>
						</div>




						<div class="inner_wrapper">

							<h1>
								Internal Development <span>Work</span>
							</h1>
							<div class="drop_shadow"></div>

							<div class="row">
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										Road & Road system<span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>${project.externalDevelopmentWorkModel.roadSysetmDevBy }</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										Water supply<span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>${project.externalDevelopmentWorkModel.waterSupplyBy }</p>
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
													State<span class="space_LR">:</span>
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
													Address<span class="space_LR">:</span>
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
													Reg. Number With COA.<span class="space_LR">:</span>
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
													State<span class="space_LR">:</span>
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
													Address<span class="space_LR">:</span>
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
									Project <span>Contractors</span>
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
													State<span class="space_LR">:</span>
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
													Address<span class="space_LR">:</span>
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

							<h1>Other Documents</h1>
							<div class="drop_shadow"></div>



							<c:forEach items="${project.projectDocModel.otherDocumentSet }"
								var="doc">
								<div class="row">
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											<span class="space_LR">${doc.caption }:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>
											<a
												href='<%=request.getContextPath() %>/download?DOC_ID=${doc.documentId}'>${doc.fileName }</a>
										</p>
									</div>

								</div>
							</c:forEach>

						</div>


						<div class="inner_wrapper">


							<h1>
								Project <span>Approval</span>
							</h1>
							<div class="drop_shadow"></div>

							<div class="row">
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-left">
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
									<p class="text-left">
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
									<p class="text-left">
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
									<p class="text-left">
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
									<p class="text-left">
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
									<p class="text-left">
										Existing Section Plan and Specification <span class="space_LR">:</span>
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
									<p class="text-left">
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
									<p class="text-left">
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
									<p class="text-left">
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
									<p class="text-left">
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
									<p class="text-left">
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
									<p class="text-left">
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
									<p class="text-left">
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
									<p class="text-left">
										Conveyance Deed / Title Deed(Khatha)<span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>
										<a
											href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.titleDeed.documentId}'>${project.projectDocModel.titleDeed.fileName }</a>
									</p>
								</div>


								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-left">
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
									<p class="text-left">
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
									<p class="text-left">
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
									<p class="text-left">
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
									<p class="text-left">
										Approval/NOC under section 109 of KLR Act 1961<span
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
									<p class="text-left">
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
									<p class="text-left">
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
									<p class="text-left">
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
									<p class="text-left">
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
									<p class="text-left">
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
									<p class="text-left">
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
									<p class="text-left">
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
									<p class="text-left">
										NOC in case of building proposals abutting to neighbouring
										properties<span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>
										<a
											href='<%=request.getContextPath() %>/download?DOC_ID=${projectReg.projectAddDocModel.nocBuildingAbuttingToNeighbourProperties.documentId}'>${project.projectAddDocModel.nocBuildingAbuttingToNeighbourProperties.fileName }</a>
									</p>
								</div>

							</div>

							<div class="row">
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-left">
										Lift Authorities<span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>
										<a
											href='<%=request.getContextPath() %>/download?DOC_ID=${projectReg.projectAddDocModel.liftAuthorities.documentId}'>${project.projectAddDocModel.liftAuthorities.fileName }</a>
									</p>
								</div>

								<!-- </div>   
	
	<div class="row"> -->
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-left">
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
									<p class="text-left">
										BMRCL<span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>
										<a
											href='<%=request.getContextPath() %>/download?DOC_ID=${projectReg.projectAddDocModel.bmrcl.documentId}'>${project.projectAddDocModel.bmrcl.fileName }</a>
									</p>
								</div>

								<!-- </div>
	
	 <div class="row"> -->
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-left">
										Bangalore Urban Arts Commission<span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>
										<a
											href='<%=request.getContextPath() %>/download?DOC_ID=${projectReg.projectAddDocModel.bangaloreUrbanArtsCommission.documentId}'>${project.projectAddDocModel.bangaloreUrbanArtsCommission.fileName }</a>
									</p>
								</div>

							</div>

							<div class="row">
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-left">
										Inspector of Factories Controller of explosives Railways<span
											class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>
										<a
											href='<%=request.getContextPath() %>/download?DOC_ID=${projectReg.projectAddDocModel.inspectorOfFactoriesCntrlOfExplosivesRailways.documentId}'>${project.projectAddDocModel.inspectorOfFactoriesCntrlOfExplosivesRailways.fileName }</a>
									</p>
								</div>

								<!-- </div>
	
	<div class="row"> -->
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-left">
										Dist Magistrate<span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>
										<a
											href='<%=request.getContextPath() %>/download?DOC_ID=${projectReg.projectAddDocModel.distMagistrate.documentId}'>${project.projectAddDocModel.distMagistrate.fileName }</a>
									</p>
								</div>

							</div>

							<div class="row">
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-left">
										Coastal Regulation Zone Authority<span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>
										<a
											href='<%=request.getContextPath() %>/download?DOC_ID=${projectReg.projectAddDocModel.coastalRegulationZoneAuthority.documentId}'>${project.projectAddDocModel.coastalRegulationZoneAuthority.fileName }</a>
									</p>
								</div>

								<!-- </div>
	
	<div class="row"> -->
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-left">
										Certificate from Registered Engineer indicating the structural
										safety of the building (for Apartments)<span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>
										<a
											href='<%=request.getContextPath() %>/download?DOC_ID=${projectReg.projectAddDocModel.engrIndicateStructural.documentId}'>${project.projectAddDocModel.engrIndicateStructural.fileName }</a>
									</p>
								</div>

							</div>

							<div class="row">
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-left">
										Sectional Drawing of the apartments<span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>
										<a
											href='<%=request.getContextPath() %>/download?DOC_ID=${projectReg.projectAddDocModel.sectionalDrawingOfTheApartments.documentId}'>${project.projectAddDocModel.sectionalDrawingOfTheApartments.fileName }</a>
									</p>
								</div>

								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-left">
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
									<p class="text-left">
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
									<p class="text-left">
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
										Advocate Search Report<span class="space_LR">:</span>
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


							<c:forEach items="${project.projectPhotoDetailSet}"
								var="projectPhoto">
								<div class="drop_shadow"></div>

								<div class="row">
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p class="text-right">
											Project Photo<span class="space_LR">:</span>
										</p>
									</div>
									<div class="col-md-3 col-sm-6 col-xs-6">
										<p>
											<a
												href='<%=request.getContextPath() %>/download?DOC_ID=${projectPhoto.documentId}'>${projectPhoto.fileName }</a>
										</p>
									</div>

								</div>

							</c:forEach>


						</div>




					</div>


					<div id="menu3" class="tab-pane fade">

						<div class="inner_wrapper">


							<h1>
								Payment <span> Details </span>
							</h1>
							<div class="drop_shadow"></div>

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
											Khajane2 Challan Number<span class="space_LR">:</span>
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
								test="${project.paymentDetailsModel.paymentMode=='PaymentGateway'}">

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



							</c:if>


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
								<%-- <div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.paymentDetailsModel.penaltyPaidReceipt} </p></div> --%>

							</div>


						</div>

					</div>
                    <div id="menu5" class="tab-pane fade">
						<div class="inner_wrapper">
							<div class="panel-group" id="accordion">

								<c:choose>
									<c:when
										test="${project.projectDetailsModel.projectType == 'Plotted Development' }">
                                              <jsp:include page="/jsppages/transaction/publicdomain/plotAllDetails.jsp" /> 
                                          
									</c:when>
									<c:otherwise>
									
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
										<c:forEach items="${projectScheduleModel.subStructureList}" var="projScheduleSub">
											<div class="row">
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														Project Work <span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${projScheduleSub.typeOfWork}</p>
												</div>

												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														Is Applicable<span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${projScheduleSub.isApplicable}</p>
												</div>
											</div>

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


										</c:forEach>

										<br />

										<h5>2. Super-structure</h5>
										  <br/>
										<br/>
										<c:forEach items="${project.projectDetailsModel.projectScheduleModel.supStructureList}"
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
											items="${project.projectDetailsModel.projectScheduleModel.finishingOrInteriorWorkList}"
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
											items="${project.projectDetailsModel.projectScheduleModel.internalInfraList}"
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
											items="${project.projectDetailsModel.projectScheduleModel.amenityList}"
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
										<c:forEach items="${project.projectDetailsModel.projectScheduleModel.commonAreaList}"
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
										<c:forEach items="${project.projectDetailsModel.projectScheduleModel.externalInfrastructureList}"
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
											<h1>Quarterly Update <span> Details </span></h1>
											<div class="drop_shadow"></div>
										</div>

										<br />
									  <br/>
										<br/>
										<h5>1. Bank  Details </h5>
										
									<c:forEach items="${quarterList}" var="quarterList">
										<c:if test="${not empty quarterList.bankDetails }">
										<br />
										<div class="row">
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													Percentage of completion of project<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${quarterList.bankDetails.percentageOfProjectCompletion}</p>
											</div>
									
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													Total advance amount collected from prospective purchasers
													(in INR)<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${quarterList.bankDetails.totAdvanceAmt}</p>
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
												<p>${quarterList.bankDetails.amtWithdrawnFromBank}</p>
											</div>
										</c:if>
										</c:forEach>
										<br/><br/><br/>
										


										<br />
										<h5>4. Litigation Details</h5>
										<br />
										<c:forEach items="${quarterList}" var="quarterList">
										<c:if test="${not empty quarterList.litigationDetails }">
										<c:forEach items="${quarterList.litigationDetails}" var="litigations">
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
										</c:if>
                                        </c:forEach>
										<br />
										<br />
										<h5>5. Modification, Amendment or Revision to License,
											Permit or Approval (if any)</h5>
										<br />
										<c:forEach items="${quarterList}" var="quarterList">
										<c:if test="${not empty quarterList.modificationDetails }">
										<c:forEach items="${quarterList.modificationDetails}"
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
										</c:if>
                                        </c:forEach>
										<br />
										<h5>6. Association of Allottees</h5>
										<br />
                                         <c:forEach items="${quarterList}" var="quarterList">
										<c:if test="${not empty quarterList.associationDetails }">
										<div class="row">
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													Is any Association formed?<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${quarterList.associationDetails.isAssocitionFormed}</p>
											</div>

										</div>

                                           <c:if test="${quarterList.associationDetails.isAssocitionFormed=='Yes'}">
										<div class="row">
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													Name of the Association<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${quarterList.associationDetails.associationName}</p>
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
														href='<%=request.getContextPath() %>/download?DOC_ID=${quarterList.associationDetails.registeredDoc.documentId}'>${quarterList.associationDetails.registeredDoc.fileName}</a>
												</p>


											</div>

										</div>

                                          </c:if>
                                          </c:if>
                                          </c:forEach>

										<br />
										<br />


									 <br />
						<h5>7. Construction Workers Welfare Fund Registration</h5>
						<br />
                      <c:forEach items="${quarterList}" var="quarterList">
										<c:if test="${not empty quarterList.projectWelfareFundDetails }">
						<div class="row">
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p class="text-right">
									Is Applicable?<span class="space_LR">:</span>
								</p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p>${quarterList.projectWelfareFundDetails.isApplicable}</p>
							</div>

						</div>

                         <c:if test="${quarterList.projectWelfareFundDetails.isApplicable=='Yes'}">
						<div class="row">
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p class="text-right">
									Registration No Of WelFare Fund<span class="space_LR">:</span>
								</p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p>${quarterList.projectWelfareFundDetails.projecteFundRegNo}</p>
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
								href='<%=request.getContextPath() %>/download?DOC_ID=${quarterList.projectWelfareFundDetails.welfareFundregisteredDoc.documentId}'>${quarterList.projectWelfareFundDetails.welfareFundregisteredDoc.fileName}</a>
							</p>
							</div>

						</div>
                            </c:if>
                            </c:if>
                            </c:forEach>
						<br /> <br />
						
					 <br /> 
						
							 <h5>8.Status of Approvals / NOCs required for the project</h5>
						<br />
						<c:forEach items="${quarterList}" var="quarterList">
										<c:if test="${not empty quarterList.approvalsAndNOCDetails }">
						<c:forEach items="${quarterList.approvalsAndNOCDetails}" var="approvalList">
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
					</c:if>
					</c:forEach>
										

						<br /> <br />
										
										
										<br />
										<h5>10. Sub Structure</h5>
										<br />
										<c:forEach items="${quarterList}" var="quarterList">
										<c:if test="${not empty quarterList.subStructureList }">
										<c:forEach items="${quarterList.subStructureList}"
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
										</c:if>
										</c:forEach>

										<br />
										<br />
										<h5>11. Super Structure</h5>
										<br />
										<c:forEach items="${quarterList}" var="quarterList">
										<c:if test="${not empty quarterList.superStructureList }">
										<c:forEach items="${quarterList.superStructureList}" var="superStructureList">
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
										</c:if>
										</c:forEach>

										<br />
										
										<br />
										

										<br />
										<br />
										<h5>12. Status of Finishing Or Interior Structure</h5>
										<br />
										<c:forEach items="${quarterList}" var="quarterList">
										<c:if test="${not empty quarterList.finishingOrInteriorWorkList }">
										<c:forEach items="${quarterList.finishingOrInteriorWorkList}" var="interiorList">
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
										</c:if>
										</c:forEach>

										
										
										<br />
										<br />
										<h5>13. Status of Construction of Internal Infrastructure</h5>
										<br />
										<c:forEach items="${quarterList}" var="quarterList">
										<c:if test="${not empty quarterList.infrastructureDetails }">
										<c:forEach items="${quarterList.infrastructureDetails}" var="internalList">
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
										</c:if>
										</c:forEach>

									<br />
										<br />
										<h5>14. Status of Construction of External  Infrastructure</h5>
										<br />
										<c:forEach items="${quarterList}" var="quarterList">
										<c:if test="${not empty quarterList.externalinfrastructureDetails }">
										<c:forEach items="${quarterList.externalinfrastructureDetails}" var="externalList">
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
                                          </c:if>
                                          </c:forEach>
										
										<br />
										<br />
										<h5>15. Status of Amenities Details</h5>
										<br />
										<c:forEach items="${quarterList}" var="quarterList">
										<c:if test="${not empty quarterList.amenityList }">
										<c:forEach items="${quarterList.amenityList}" var="amenity">
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
                                          </c:if>
                                          </c:forEach>
										<br />
										<br />
										
										<br />
										<br />
										<h5>16. Status of Construction of Common Areas</h5>
										<br />
										<c:forEach items="${quarterList}" var="quarterList">
										<c:if test="${not empty quarterList.commonAreaDetails }">
										<c:forEach items="${quarterList.commonAreaDetails}"
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
										</c:if>
                                         </c:forEach>
										<br />
										<br />
									
									






									</c:otherwise>


								</c:choose>

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
											<div id="${enq.enquiryId}" class="panel-collapse collapse in">
												<div class="panel-body">
													Subject: ${enq.subject}<br> <br>
													${enq.enquiryText} <br>
													<c:if test="${enq.replyText !=null}">
														<br>
														<b>Reply Received:</b>
														<br> ${enq.replyText}
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

			<table id="remarksTable" border="2">
				<tr>
					<th style="width: 33%" colspan="3">Reviewer Remarks</th>
					<th style="width: 33%" colspan="2">Secretary Remarks</th>
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
				<c:choose>
					<c:when test="${not empty project.projectRemarks.remarksList}">
						<c:forEach items="${project.projectRemarks.remarksList}"
							var="remarks">
							<tr>
								<td>Account</td>
								<td>${remarks.oprAccRemarkDateStr }</td>
								<td>${remarks.accountsOprRemarks}</td>
								<td>${remarks.authRemarkDateStr }</td>
								<td><c:if test="${remarks.status!='NEW'}">
                                                ${remarks.accountsAuthRemarks }
                                            </c:if> <c:if
										test="${remarks.status=='NEW'}">
										<textarea name="accountsAuthRemarks" class="authremarks">${remarks.accountsAuthRemarks}</textarea>
									</c:if></td>
								<td>${remarks.supRemarkDateStr }</td>
								<td>${remarks.accountsSupRemarks }</td>
							</tr>


							<tr>
								<td>Revenue</td>
								<td>${remarks.oprRevRemarkDateStr }</td>
								<td>${remarks.revenueOprRemarks }</td>
								<td>${remarks.authRemarkDateStr }</td>
								<td><c:if test="${remarks.status!='NEW'}">
                                                ${remarks.revenueAuthRemarks }
                                            </c:if> <c:if
										test="${remarks.status=='NEW'}">
										<textarea name="revenueAuthRemarks" class="authremarks">${remarks.revenueAuthRemarks}</textarea>
									</c:if></td>
								<td>${remarks.supRemarkDateStr }</td>
								<td>${remarks.revenueSupRemarks }</td>
							</tr>


							<tr>
								<td>TCP</td>
								<td>${remarks.oprTcpRemarkDateStr }</td>
								<td>${remarks.tcpOprRemarks }</td>

								<td>${remarks.authRemarkDateStr }</td>
								<td><c:if test="${remarks.status!='NEW'}">
                                                ${remarks.tcpAuthRemarks }
                                            </c:if> <c:if
										test="${remarks.status=='NEW'}">
										<textarea name="tcpAuthRemarks" class="authremarks">${remarks.tcpAuthRemarks}</textarea>
									</c:if></td>
								<td>${remarks.supRemarkDateStr }</td>
								<td>${remarks.tcpSupRemarks }</td>
							</tr>



							<tr>
								<td>Engineer</td>
								<td>${remarks.oprEnggRemarkDateStr }</td>
								<td>${remarks.enggOprRemarks }</td>
								<td>${remarks.authRemarkDateStr }</td>
								<td><c:if test="${remarks.status!='NEW'}">
                                                ${remarks.enggAuthRemarks }
                                            </c:if> <c:if
										test="${remarks.status=='NEW'}">
										<textarea name="enggAuthRemarks" class="authremarks">${remarks.enggAuthRemarks}</textarea>
									</c:if></td>
								<td>${remarks.supRemarkDateStr }</td>
								<td>${remarks.enggSupRemarks }</td>
							</tr>
							<tr>
								<td colspan="7"></td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>

						<tr>
							<td>Account</td>
							<td></td>
							<td></td>
							<td></td>
							<td><textarea name="accountsAuthRemarks" class="authremarks"></textarea></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>Revenue</td>
							<td></td>
							<td></td>
							<td></td>
							<td><textarea name="revenueAuthRemarks" class="authremarks"></textarea></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>TCP</td>
							<td></td>
							<td></td>
							<td></td>
							<td><textarea name="tcpAuthRemarks" class="authremarks"></textarea></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>Engineer</td>
							<td></td>
							<td></td>
							<td></td>
							<td><textarea name="enggAuthRemarks" class="authremarks"></textarea></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td colspan="7"></td>
						</tr>

					</c:otherwise>
				</c:choose>
			</table>


			<c:if test="${project.status=='APPROVED'}">


				<form name="trxForm" autocomplete="off"
					action="revokeProjectRegistration" method="post">
					<%=ReraSecurity.writeToken(request)%>
					<input type='hidden' name='PROJECT_ID'
						value="${project.projectRegId }" /> <br> <br>
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-3 control-label">
							Reason: </label>
						<div class="col-sm-3">
							<textarea name="REASON"
								class="form-control input-sm requiredValFld"></textarea>
							<span class='requiredValFldMsg'> Please enter your reason.</span>
						</div>
						<br>



					</div>
					<br /> <br /> <br /> <br /> <br>



					<%
						if (roleAccess != null && roleAccess.equals("READ")) {
					%>


					<%
						if (user.getLoginId() != null && user.getLoginId().equals("rera.secretary")) {
					%>
					<div class="button-wrapper">
						<%-- <c:if test="${project.status=='PENDING_AUTHORITY'}"> --%>
						<!-- editAgentUploadDoc -->
						<%--   </c:if> --%>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<!-- <input name="btn1" class="btn-style" value="Enquiry" type="button"  /> -->
						<input name="btn1" class="btn-style" value="Enquiry" type="button"
							data-toggle="modal" data-target="#myModal" />

						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a target="_blank"
							href="<%= request.getContextPath()%>/projectCert?PID=${project.projectRegId}">
							<input name="btn1" class="btn-style" value="View Certificate"
							type="button" />
						</a> <input name="btn1" class="btn-style" value="Accept Clarification"
							type="button" onclick="acceptClarification()" />
					</div>
					<%
						} else {
					%>

					<%
						}
					%>


					<%
						} else {
					%>
					<div class="button-wrapper">
						<%-- <c:if test="${project.status=='PENDING_AUTHORITY'}"> --%>
						<!-- editAgentUploadDoc -->
						<input name="btn1" class="btn-style" id="editDocButton"
							value="Revoke Registration" type="button"
							onclick="revokeRegistration()" />
						<%--   </c:if> --%>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<!-- <input name="btn1" class="btn-style" value="Enquiry" type="button"  /> -->
						<input name="btn1" class="btn-style" value="Enquiry" type="button"
							data-toggle="modal" data-target="#myModal" />

						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a target="_blank"
							href="<%= request.getContextPath()%>/projectCert?PID=${project.projectRegId}">
							<input name="btn1" class="btn-style" value="View Certificate"
							type="button" />
						</a>

					</div>
					<%
						}
					%>


				</form>
			</c:if>





		</div>
		<!--inner container end here-->


	</div>


</div>

<div hidden>
	<c:choose>
		<c:when test="${not empty project.projectRemarks.remarksList}">
			<c:forEach items="${project.projectRemarks.remarksList}"
				var="remarks" varStatus="loop">
				<c:if test="${loop.last}">

					<textarea id="ac" rows="1" cols="1"> ${remarks.accountsOprRemarks} </textarea>
					<textarea id="re" rows="1" cols="1"> ${remarks.revenueOprRemarks} </textarea>
					<textarea id="en" rows="1" cols="1"> ${remarks.enggOprRemarks} </textarea>
					<textarea id="tc" rows="1" cols="1"> ${remarks.tcpOprRemarks} </textarea>
				</c:if>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<textarea id="ac" rows="1" cols="1"></textarea>
			<textarea id="re" rows="1" cols="1"></textarea>
			<textarea id="en" rows="1" cols="1"></textarea>
			<textarea id="tc" rows="1" cols="1"></textarea>
		</c:otherwise>
	</c:choose>

	<%-- <% If(project.projectRemarks.remarksList  != null) {%>

<% for(int orderNum =0;i< orderList.size();++orderNum  ) { %>
   <li> <%= orderList.get(orderNum )%> </li>
<% } %>
<% }else{ %>
  No Order Found
<% } %> --%>


</div>

<div class="pop_main">

	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">

					<button type="button" class="close" data-dismiss="modal">&times;</button>

				</div>
				<div class="modal-body">

					<form class="form-horizontal" action="sendProjectRegEnquiry"
						autocomplete="off" id="enquiryForm" method="post"
						name='enquiryForm'>
						<%=ReraSecurity.writeToken(request)%>
						<input type="hidden" name="projectId"
							value="${project.projectRegId}">
						<div class="inner_wrapper">


							<h1>
								Enquiry related to <span>(Make one or more selections
									below)</span>
							</h1>
							<div class="drop_shadow"></div>
							<div class="clearfix"></div>

							<div class="enqsendto">

								<div class="form-group">
									<div class="row">
										<div class="col-sm-12">
											<div class="col-sm-2 col-sm-offset-2">
												<span class="pull-right"> <label for="inputEmail3"
													class="control-label" style="margin-right: 15px;">
														Accounts </label> <input type="checkbox" name="Accounts"
													value="Accounts" id="Accounts" />
												</span>
												<textarea name="accountsEnqAuthRemarks"
													id="accountsEnqAuthRemarks" class="form-control"> </textarea>
											</div>
											<div class="col-sm-2">
												<span class="pull-right"> <label for="inputEmail3"
													class="control-label" style="margin-right: 15px;">
														TCP </label> <input type="checkbox" name="TCP" value="TCP"
													id="TCP" />
												</span>
												<textarea name="tcpEnqAuthRemarks" id="tcpEnqAuthRemarks"
													class="form-control"> </textarea>
											</div>
											<div class="col-sm-2">
												<span class="pull-right"> <label for="inputEmail3"
													class="control-label" style="margin-right: 15px;">
														Revenue </label> <input type="checkbox" name="Revenue"
													value="Revenue" id="Revenue" /></span>
												<textarea name="revenueEnqAuthRemarks"
													id="revenueEnqAuthRemarks" class="form-control"> </textarea>
											</div>
											<div class="col-sm-2">
												<span class="pull-right"> <label for="inputEmail3"
													class="control-label" style="margin-right: 15px;">
														Engineer </label> <input type="checkbox" name="Engineer"
													value="Engineer" id="Engineer" /></span>
												<textarea name="enggEnqAuthRemarks" id="enggEnqAuthRemarks"
													class="form-control"> </textarea>

											</div>

										</div>
									</div>
								</div>
							</div>


							<br> <br>

							<h1>
								Details of the <span>Enquiry</span>
							</h1>
							<div class="drop_shadow"></div>
							<div class="clearfix"></div>


							<div class="form-group">
								<label for="inputEmail3" class="col-sm-3 control-label">
									Subject <sup>*</sup>
								</label>
								<div class="col-sm-6">
									<input type="text" name="subject"
										value="RERA Karnataka: Final Notice for ${project.projectDetailsModel.projectName} Ack Number : ${project.applicationNo }"
										class="form-control input-sm" maxlength="200" />
								</div>
							</div>

							<div class="form-group">
								<label for="inputEmail3" class="col-sm-3 control-label">Enquiry<sup>*</sup><br>
									<br>
								</label>
								<div class="col-sm-6">


									<div>
										<textarea id="textareaId1" name="summary" rows="7"
											class="form-control requiredValFld input-sm"> 
					 		    	</textarea>
									</div>

									<%--       <div hidden id="showId2" >
						        	<textarea id="textareaId2"  name="summary" rows="7"
										class="form-control requiredValFld input-sm"> 
										 <c:out value="${template[1].templateContent}" />;
									 </textarea>  
									</div> --%>
									<span class='requiredValFldMsg'> Please enter enquiry
										details</span>
								</div>

								<div class="col-md-3 ">

									<h1>
										Insert Operator <span>Comments</span>
									</h1>
									<div class="drop_shadow"></div>
									<div class="clearfix"></div>

									<button onclick="return pasteWithCursor('ac')"
										class="btn btn-sm">Account</button>
									&nbsp&nbsp&nbsp&nbsp
									<button onclick="return pasteWithCursor('re')"
										class="btn btn-sm ">Revenue</button>
									<br> <br>
									<button onclick="return pasteWithCursor('en')"
										class="btn btn-sm">Engineer</button>
									&nbsp&nbsp&nbsp&nbsp
									<button onclick="return pasteWithCursor('tc')"
										class="btn btn-sm ">TCP</button>

								</div>
								<!--
                                                            <div class="col-md-3">
                                                                <c:forEach items="${template}" var="tempText">
                                                                    <input type="radio" name="re" value="v1" onclick="templateFun(${tempText.templateId})"> ${tempText.templateText} <br>
                                                                </c:forEach>
                                                            </div>
-->
							</div>

						</div>

						<div class="button-wrapper">
							<input name="btn3" class="btn-style" value="Send Enquiry"
								type="button" onclick="sendEnquiry()" />
							<button type="button" class="close" data-dismiss="modal">Close</button>
						</div>
				</div>

				</form>

			</div>

		</div>
	</div>
</div>


<div hidden>
	<c:forEach items="${template}" var="templateText">
		<textarea id="tmp${templateText.templateId}" rows="1" cols="1"> <c:out
				value="${templateText.templateContent}" /> </textarea>
	</c:forEach>

</div>



<div class="pop_main">

	<div class="modal fade" id="rejectModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">

					<button type="button" class="close" data-dismiss="modal">&times;</button>

				</div>
				<div class="modal-body">

					<form class="form-horizontal" action="rejectProjectRegistration"
						autocomplete="off" id="rejectForm" method="post" name='rejectForm'>
						<%=ReraSecurity.writeToken(request)%>
						<input type="hidden" name="projectId"
							value="${project.projectRegId}">
						<div class="inner_wrapper">







							<br> <br>

							<h1>
								Details of the <span>Rejection</span>
							</h1>
							<div class="drop_shadow"></div>
							<div class="clearfix"></div>


							<div class="form-group">
								<label for="inputEmail3" class="col-sm-3 control-label">
									Subject <sup>*</sup>
								</label>
								<div class="col-sm-6">
									<input type="text" name="rejectSubject"
										value="RERA Karnataka: Rejected -  ${project.projectDetailsModel.projectName} Ack Number : ${project.applicationNo }"
										class="form-control input-sm" maxlength="200" />
								</div>
							</div>

							<div class="form-group">
								<label for="inputEmail3" class="col-sm-3 control-label">Reason<sup>*</sup>
								</label>
								<div class="col-sm-6">

									<div>
										<textarea id="reasonForRejection" rows="7"
											class="form-control requiredValFld input-sm"
											name="reasonForRejection"> 
					 		    	</textarea>
									</div>

									<%--       <div hidden id="showId2" >
						        	<textarea id="textareaId2"  name="summary" rows="7"
										class="form-control requiredValFld input-sm"> 
										 <c:out value="${template[1].templateContent}" />;
									 </textarea>  
									</div> --%>
									<span class='requiredValFldMsg'> Please enter Rejection
										details</span>
								</div>
								<!--
                                                            <div class="col-md-3">
                                                                <c:forEach items="${template}" var="tempText">
                                                                    <input type="radio" name="re" value="v1" onclick="templateFun(${tempText.templateId})"> ${tempText.templateText} <br>
                                                                </c:forEach>
                                                            </div>
-->
							</div>

						</div>

						<div class="button-wrapper">
							<input name="btn3" class="btn-style" value="Reject" type="button"
								onclick="submitTrxForm('REJECTED')" />
							<button type="button" class="close" data-dismiss="modal">Close</button>
						</div>
				</div>

				</form>

			</div>

		</div>
	</div>
</div>
<script>
	document.getElementById("textareaId1").value = document
			.getElementById("tmp1").value;
</script>

<script>
	function templateFun(dataIs) {

		document.getElementById("textareaId1").value = document
				.getElementById("tmp" + dataIs).value;
	}
</script>

<script>
	function pasteWithCursor(idIs) {
		var valueIs = document.getElementById(idIs).value;
		var cursorPos = $('#textareaId1').prop('selectionStart');
		var v = $('#textareaId1').val();
		var textBefore = v.substring(0, cursorPos);
		var textAfter = v.substring(cursorPos, v.length);
		$('#textareaId1').val(textBefore + valueIs + textAfter);

		return false;
	};
</script>


<script>
	function revokeRegistration() {

		if (document.trxForm.REASON.value != '') {
			if (confirm('Are you sure to revoke this registration?')) {
				document.trxForm.submit();
			}
		} else {
			alert('Please enter reason.');
		}
	}

	function acceptClarification() {

		if (confirm('Are you sure you want to accept the clarification ?')) {
			document.trxForm.action = "acceptClarification";
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