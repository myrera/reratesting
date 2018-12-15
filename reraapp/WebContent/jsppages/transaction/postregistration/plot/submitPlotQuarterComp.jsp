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
		doc.save("'${project.projectRegistrationNo}'.pdf");
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

<div class="breadcrumb" style="background-color: white;">Home/Post Registration Details</div>

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


				<span class="pull-right user_name">Registration Number :<b> ${project.projectRegistrationNo }</b></span>
				 <br> <span class="pull-right user_name">Project Name :<b> ${project.projectDetailsModel.projectName }</b></span> <br>
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

		        name : '3. Cost  Details:',

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

							name : '3.1 Land Cost Details:',

							email : ''

						});

						</script>
						
				
					<script>
						data.push({

							id : 1,

							name : 'Land Type ',

							email : '${PlotsLandAcquisitionCost.plotLandAcquisitionCostModel.landType}'

						});
						
						data.push({

							id : 1,

							name : 'Cost of Land ownership ',

							email : '${PlotsLandAcquisitionCost.plotLandAcquisitionCostModel.costOfOwnership}'

						});
						
						</script>
						
						<c:if test="${PlotsLandAcquisitionCost.plotLandAcquisitionCostModel.landType=='JDA With Land owner'}">
						<script>
						data.push({

							id : 1,

							name : 'Number of Promoter(s)',

							email : '${PlotsLandAcquisitionCost.plotLandAcquisitionCostModel.numberOfPromoters}'

						});
						data.push({

							id : 1,

							name : 'Number of Landowner(s)',

							email : '${PlotsLandAcquisitionCost.plotLandAcquisitionCostModel.numberOfLandowners}'

						});
						</script>
						</c:if>
						<script>
						data.push({

							id : 1,

							name : 'JDA Details:',

							email : ''

						});
						
					</script>
			        <c:forEach items="${PlotsLandAcquisitionCost.plotLandAcquisitionCostModel.projectJDADetailsModel.promoterList}" var="plotJDA">
				
				<script>
					data.push({

						id : 1,

						name : ' Promoter Name',

						email : '${plotJDA.promoterName}'

					});

				
						data.push({

							id : 1,

							name : 'No Of Units Of Share ',

							email : '${plotJDA.noOfUnitsOfShare}'

						});

					data.push({

							id : 1,

							name : 'Percentage of share ',

							email : '${plotJDA.percentageOfShare}'

						});
					</script>
					</c:forEach>
					 
                       
                        <c:forEach items="${PlotsLandAcquisitionCost.plotLandAcquisitionCostModel.projectJDADetailsModel.landOwnerList}" var="plotJDALandOwner" varStatus="s">
                     
                       <script> 
						data.push({

							id : 1,

							name : ' Whether landowner is going to sell his/her share?',

							email : ' ${plotJDALandOwner.isApplicable}'

						});
						data.push({

							id : 1,

							name : 'Land Owner RERA Registration Number',

							email : '${plotJDALandOwner.landOwnerRegNo}'

						});
						data.push({

							id : 1,

							name : 'land Owner Details',

							email : ''

						});
						
						data.push({

							id : 1,

							name : ' Name of the Land Owner',

							email : '${plotJDALandOwner.landownerName}'

						});
						data.push({

							id : 1,

							name : ' Mobile Number',

							email : '${plotJDALandOwner.landownerMobileNo}'

						});
						data.push({

							id : 1,

							name : ' Address',

							email : '${plotJDALandOwner.landownerAddress} '

						});
				
					data.push({

						id : 1,

						name : ' Email ID',

						email : ' ${plotJDALandOwner.landownerEmailId}'

					});

						data.push({

							id : 1,

							name : 'Percentage Of Share ',

							email : '${plotJDALandOwner.landownerPercShare}'

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

							name : 'Approval Cost: ',

							email : ''

						});
						</script>
				<!-------Approval Cost and cons cost----  will add after venkatesh chenges...... ---------->
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

							name : '4.7. Construction Cost Details : ',

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
					//project Details

					data.push({

						id : 1,

						name : 'Project Cost Summry : ',

						email : ''

					});

					data.push({

						id : 1,

						name : 'Estimated Land Cost',

						email : '${plotsCostSummary.estLandCost}'

					});
					data.push({

						id : 1,

						name : 'Acctual Land Cost',

						email : '${plotsCostSummary.actLandCost}'

					});
					data
							.push({

								id : 1,

								name : 'Estimated Construction Cost',

								email : '${plotsCostSummary.estConstructionCost}'

							});
					data.push({

						id : 1,

						name : 'Acctual Construction Cost',

						email : '${plotsCostSummary.actConstructionCost}'

					});

					data.push({

						id : 1,

						name : 'Estimated Cost for Approvals, NOCs, Licenses and others',

						email : ''

					});

					data.push({

						id : 1,

						name : 'Acctual Cost for Approvals, NOCs, Licenses and others',

						email : '${plotsCostSummary.actCostOfApprove }'

					});

					data.push({

						id : 1,

						name : 'Estimated Total Cost',

						email : '${plotsCostSummary.estTotalCost}'

					});
					data
							.push({

								id : 1,

								name : 'Acctual Total Cost',

								email : '${plotsCostSummary.actTotalCost }'

							});

					data
							.push({

								id : 1,

								name : 'Total Amount collected Till Date',

								email : '${plotsCostSummary.amtCollectedFromAllotee}'

							});

					data
							.push({

								id : 1,

								name : 'Amount utilized for the project',

								email : '${plotsCostSummary.amtUtilizedforConstruction}'

							});

					data.push({

						id : 1,

						name : 'Balance Amount ',

						email : '${plotsCostSummary.balanceAmt}'

					});
					data.push({

						id : 1,

						name : 'Amount utilized in percentage %',

						email : '${plotsCostSummary.amtUtilPercentage}'

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


            	<c:forEach items="${plotfinalApproval}" var="finalApproveObj">

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
				
					

				<!-----------------------------Tab start here--------------------------------->
						
	
	<div class="row" >
					<br><br>
					<br>
				<h2 style="color: green;" > Congratulations!! Your Application has been updated successfully.</h2>
				</div>
				<br><br>
					<br>
				<ul class="nav nav-tabs">
					<li style="padding-left:400px;"><a data-toggle="tab" href="#menu5"><input type="button" value="View Application" class="btn btn-sm btn-primary" /></a></li>
					<br><br>
				</ul>
				
				
	

			<div id="menu5" class="tab-pane fade">
						<div class="inner_wrapper">
							<div class="panel-group" id="accordion">

								
<div class="tab-content">
					<div id="home" class="tab-pane fade in active">

										<div class="col-md-12">
											<h1> Post Registration and <span>Quarterly Update Details.</span>&nbsp; &nbsp; &nbsp; &nbsp;
									&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<input
										type="button" value="Download as Pdf" onclick="downloadPdf()">
											
											</h1>
											<div class="drop_shadow"></div>
										</div>
<!-- 
										<div class="col-md-12">
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													Prospectus/Brochure <span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p></p>
											</div>


											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													WebSite Link<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p></p>
											</div>
											<div class="drop_shadow"></div>

											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													Agent Reg No<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p></p>
											</div>
											<div class="drop_shadow"></div>
										</div> -->
<br /><br /><br />

										<br />
										<h1>1.Plot<span> Details</span></h1>
										<div class="drop_shadow"></div>
										<br />

										<div class="row">
											<div class="col-md-3 col-sm-6 col-xs-6">


												<p class="text-right">
													Total number of Plots<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${pdm.totalNumberOfPlots}</p>
											</div>
									
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													Number of EWS(6x9) Plots<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${pdm.totalnoOfEWSPlots}</p>
											</div>
										</div>
										
										<div class="row">
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													Number of LIG(9x12) Plots<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${pdm.totalnoOfLIGPlots}</p>
											</div>
										
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													Number of MIG(9x15) Plots<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${pdm.totalnoOfMIGPlots}</p>
											</div>
										</div>

										<div class="row">
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													Number of HIG(15x24) Plots<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${pdm.totalnoOfHIGPlots}</p>
											</div>
									
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													Number of Other Plots<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${pdm.totalnoOfOtherPlots}</p>
											</div>
										</div>

										<br />
										<br />
										
										<br />
										<h1>2.Project<span> Schedule</span></h1>
										<div class="drop_shadow"></div>
										<br />

										
											
									 <br />
										<h5>2.1 Civil Work</h5>
										<br />
                                                <c:forEach items="${plotScheduleModel.civilWorkList}" var="civilWork">
											<div class="row">
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														<b>Project Work </b><span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<b><p>${civilWork.typeOfWork}</p></b>
												</div>
												</div>
                                       <div class="row">
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														Estimated From Date<span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${civilWork.estimatedFrmDate.time}</p>
												</div>

												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														Estimated To Date<span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${civilWork.estimatedToDate.time}</p>
												</div>

											</div>
											
										</c:forEach>

										<br />
										<br />
										
										
										
										
										 <br />

										<h5>2.2.Common Areas To be used by the Purchaser</h5>
										  <br/>
										<br/>
										<c:forEach items="${plotScheduleModel.commonAreasPurchaserList}" var="commonPurchaser">
											<div class="row">
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														<b>Common Area Name<span class="space_LR">:</b></span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${commonPurchaser.commonArea}</p>
												</div>

												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														<b>Is Applicable<span class="space_LR">:</b></span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${commonPurchaser.isApplicable}</p>
												</div>
											</div>


										</c:forEach>
										
										<br />
                                        <br />
										<br />
										
										
										
				 <h5>2.3 Status of Common Areas To be Relinquished to local Authority /Planning Authority</h5>
						<br />
						
							<div class="row">
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										<b>Public and Semi Public Sites<span class="space_LR">:</b></span>
									</p>
								</div>
							</div>
							<div class="row">
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										No. of Public and Semi Pubic Sites<span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>${plotScheduleModel.plotsCommonAreaRelinquisedAuthorityModel.noOfPublicOrSemiPubSites}</p>
								</div>
						
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										Area of Public and Semi Pubic Sites(in Sq.m)<span
											class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>${plotScheduleModel.plotsCommonAreaRelinquisedAuthorityModel.totAreaOfPublicOrSemiPubSites}</p>
								</div>
                               </div>
						<div class="row">
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										<b>Parks and Open Spaces<span class="space_LR">:</b></span>
									</p>
								</div>
							</div>
               
							<div class="row">
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										No. of Parks and Open Spaces<span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>${plotScheduleModel.plotsCommonAreaRelinquisedAuthorityModel.totNoOfParkAndOpenSpace}</p>
								</div>
						
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										Area of Parks and Open Spaces(in Sq.m)<span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>${plotScheduleModel.plotsCommonAreaRelinquisedAuthorityModel.totAreaOfParkAndOpenSpace}</p>
								</div>
							</div>

							

							<div class="row">
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										<b>Road and Transportation<span class="space_LR">:</b></span>
									</p>
								</div>
							</div>
							<div class="row">
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										Area of Road/Transportation(in Sq.m)<span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>${plotScheduleModel.plotsCommonAreaRelinquisedAuthorityModel.totAreaOfRoad}</p>
								</div>
							</div>


						<br />
						 <br /> 
						 
						 <c:out value="${plotQuarter.quarterlyPlotsCommonAuthorityModel}">aaaaaaaaaaaa</c:out>
						 
				                    	<h1>3. Cost <span> Details</span></h1>
										<div class="drop_shadow"></div>
										<br />
										
										<h3>3.1 Land Cost Details</h3>
										<br />
										<div class="row">
											
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													Land Type<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${PlotsLandAcquisitionCost.plotLandAcquisitionCostModel.landType}</p>
											</div>
											
										</div>
										<c:if test="${PlotsLandAcquisitionCost.plotLandAcquisitionCostModel.landType=='JDA With Land owner'}">
										<div class="row">
											
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													Number of Promoter(s)<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${PlotsLandAcquisitionCost.plotLandAcquisitionCostModel.numberOfPromoters}</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													Number of Landowner(s)<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${PlotsLandAcquisitionCost.plotLandAcquisitionCostModel.numberOfLandowners}</p>
											</div>
											
										</div>
                                       </c:if>

										<div class="row">
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													Cost of Land ownership<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${PlotsLandAcquisitionCost.plotLandAcquisitionCostModel.costOfOwnership}</p>
											</div>
										</div>
										<br />
										<div class="row">
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													 <b>JDA Details<span class="space_LR">:</span></b>
												</p>
											</div>
										</div>
										<c:forEach items="${PlotsLandAcquisitionCost.plotLandAcquisitionCostModel.projectJDADetailsModel.promoterList}" var="plotJDA">
										<div class="row">
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													 Promoter Name<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>  ${plotJDA.promoterName} </p>
											</div>
											</div>
											<div class="row">
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													  No Of Units Of Share<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p > ${plotJDA.noOfUnitsOfShare} </p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													 Percentage of share<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p > ${plotJDA.percentageOfShare} </p>
											</div>
										</div>
										</c:forEach>
										          <%
                                  					int count = 1;
                                  					%>
                                  					
										<c:forEach items="${PlotsLandAcquisitionCost.plotLandAcquisitionCostModel.projectJDADetailsModel.landOwnerList}" var="plotJDALandOwner" varStatus="s">
										<%   count++; %>
										<div class="row">
										
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													 Whether landowner is going to sell his/her share?<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>  ${plotJDALandOwner.isApplicable} </p>
											</div>
											
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													  Land Owner RERA Registration Number<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p > ${plotJDALandOwner.landOwnerRegNo} </p>
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
												<p > ${plotJDALandOwner.landownerName} </p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													 Mobile Number<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p > ${plotJDALandOwner.landownerMobileNo} </p>
											</div>
										</div>
										<div class="row">
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													 Address<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p > ${plotJDALandOwner.landownerAddress} </p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													 Email ID<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p > ${plotJDALandOwner.landownerEmailId} </p>
											</div>
										</div>
										<div class="row">
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													Percentage Of Share<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p > ${plotJDALandOwner.landownerPercShare} </p>
											</div>
											
										</div>
										</c:forEach>
										
										<br />
										 <div class="row">
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													 <b>Approval Cost<span class="space_LR">-</span></b>
												</p>
											</div>
										</div> 
                                        <c:forEach items="${PlotsLandAcquisitionCost.approvalCostModel.approvalCostDetails}" var="approvalList">
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
											<div class="row">
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													Total Cost Of Approval<span
														class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${PlotsLandAcquisitionCost.approvalCostModel.totalCostOfApprovals}</p>
											</div>
										</div>
										
										<br />
										<br />
										
										
										<h3>3.2 Construction Cost Details</h3>
										<br />
										<c:forEach items="${plotsConstructionCostmodel.plotsConstructionCostList}" var="consCostList">
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
										<div class="row">
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													Total Cost Of Construction<span
														class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${plotsConstructionCostmodel.estTotConstructionCost}</p>
											</div>
										</div> 
									
                                            <br /><br /><br />
										<h1>4. Plot Quarterly<span> Update Details</span></h1>
										<div class="drop_shadow"></div>
										<br />
										<h5>4.1. Bank Details</h5>
										
										
										<br />
										
										
										<div class="row">
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													Percentage of completion of project <span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${plotQuarter.bankDetails.percentageOfProjectCompletion}</p>
											</div>
										
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													Total advance amount collected from prospective purchasers
													(in INR)<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${plotQuarter.bankDetails.totAdvanceAmt}</p>
											</div>
										</div>
										<div class="row">
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													Amount withdrawn from the bank for the purpose of the
													project (INR) In This Quarter<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${plotQuarter.bankDetails.amtWithdrawnFromBank}</p>
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
															href='<%=request.getContextPath() %>/download?DOC_ID=${plotQuarter.bankDetails.certFromChartedAcc.documentId}'>${plotQuarter.bankDetails.certFromChartedAcc.fileName}</a>
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
															href='<%=request.getContextPath() %>/download?DOC_ID=${plotQuarter.bankDetails.certificateIssuedByStructuralEng.documentId}'>${plotQuarter.bankDetails.certificateIssuedByStructuralEng.fileName}</a>
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
															href='<%=request.getContextPath() %>/download?DOC_ID=${plotQuarter.bankDetails.certificateIssuedByArchitect.documentId}'>${plotQuarter.bankDetails.certificateIssuedByArchitect.fileName}</a>
													</p>
											</div>
										</div>
                                         <c:if test="${plotQuarter.bankDetails.percentageOfProjectCompletion=='100' }">
										<div class="row">
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													Annual Financial Report<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												
												
												<p>
														<a
															href='<%=request.getContextPath() %>/download?DOC_ID=${plotQuarter.bankDetails.annualfinancialReport.documentId}'>${plotQuarter.bankDetails.annualfinancialReport.fileName}</a>
													</p>
											</div>
										</div>
										</c:if>
										<c:if test="${plotQuarter.bankDetails.percentageOfProjectCompletion !='100' }">
										<div class="row">
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													Quarterly Financial Report<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												
												
												<p>
														<a
															href='<%=request.getContextPath() %>/download?DOC_ID=${plotQuarter.bankDetails.financialReport.documentId}'>${plotQuarter.bankDetails.financialReport.fileName}</a>
													</p>
											</div>
										</div>
										</c:if>
										
										

										<br />
										<br />

										 <h5>4.2. Plot Details</h5>
										<br />
										
											
										<div class="row">
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													<b>Total Plots<span class="space_LR">:</span></b>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<b><p>${pdm.totalNumberOfPlots}</p></b>
											</div>

							            </div>
                                            <div class="row">
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													<b>Total Plots booked<span class="space_LR">:</span></b>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<b><p>${plotQuarter.plotDetails.totalNumberOfPlotsBooked}</p></b>
											</div>

											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													<b>Total Plots Available<span class="space_LR">:</span></b>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<b><p>${plotQuarter.plotDetails.totalNumberOfPlotsAvailable}</p></b>
											</div>

										</div>

										<br />

										<div class="row">
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													<b>Plots Category<span class="space_LR">:</span></b>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<b><p>EWS(6x9)</p></b>
											</div>

						                  <div class="col-md-3 col-sm-6 col-xs-6">
							                       <p class="text-right">
									       <b> Total No. of Plots<span class="space_LR">:</span></b>
								         </p>
							               </div>
							                
							            <div class="col-md-3 col-sm-6 col-xs-6">
								          <b><p>${pdm.totalnoOfEWSPlots}</p></b>
							                 </div>
							            </div>
                                            <div class="row">
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													No. of Plots booked<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${plotQuarter.plotDetails.totalnoOfEWSPlotsBooked}</p>
											</div>

											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													No. of Plots Available<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${plotQuarter.plotDetails.totalnoOfEWSPlotsAvailable}</p>
											</div>

										</div>
										
										<div class="row">
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													<b>Plots Category<span class="space_LR">:</span></b>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<b><p>LIG(9x12)</p></b>
											</div>

						                  <div class="col-md-3 col-sm-6 col-xs-6">
							                       <p class="text-right">
									       <b> Total No. of Plots<span class="space_LR">:</span></b>
								         </p>
							               </div>
							                
							            <div class="col-md-3 col-sm-6 col-xs-6">
								         <b> <p>${pdm.totalnoOfLIGPlots}</p></b>
							                 </div>
							            </div>
                                            <div class="row">
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													No. of Plots booked<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${plotQuarter.plotDetails.totalnoOfLIGPlotsBooked}</p>
											</div>

											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													No. of Plots Available<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${plotQuarter.plotDetails.totalnoOfLIGPlotsAvailable}</p>
											</div>

										</div>

										<br />
										
										<div class="row">
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													<b>Plots Category<span class="space_LR">:</span></b>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<b><p>MIG(9x15)</p></b>
											</div>

						                  <div class="col-md-3 col-sm-6 col-xs-6">
							                       <p class="text-right">
									       <b> Total No. of Plots<span class="space_LR">:</span></b>
								         </p>
							               </div>
							                
							            <div class="col-md-3 col-sm-6 col-xs-6">
								           <p>
								           <b><p>${pdm.totalnoOfMIGPlots}</p></b>
								           
								           </p>
							                 </div>
							            </div>
                                            <div class="row">
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													No. of Plots booked<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${plotQuarter.plotDetails.totalnoOfMIGPlotsBooked}</p>
											</div>

											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													No. of Plots Available<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${plotQuarter.plotDetails.totalnoOfMIGPlotsAvailable}</p>
											</div>

										</div>

										<br />
										
										<div class="row">
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													<b>Plots Category<span class="space_LR">:</span></b>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<b><p>HIG(15x24)</p></b>
											</div>

						                  <div class="col-md-3 col-sm-6 col-xs-6">
							                       <p class="text-right">
									      <b>  Total No. of Plots<span class="space_LR">:</span></b>
								         </p>
							               </div>
							                
							            <div class="col-md-3 col-sm-6 col-xs-6">
								         
								           	<b><p>${pdm.totalnoOfHIGPlots}</p></b>
								           
							                 </div>
							            </div>
                                            <div class="row">
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													No. of Plots booked<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${plotQuarter.plotDetails.totalnoOfHIGPlotsBooked}</p>
											</div>

											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													No. of Plots Available<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${plotQuarter.plotDetails.totalnoOfHIGPlotsAvailable}</p>
											</div>

										</div>

										<br />
										
										<div class="row">
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													<b>Plots Category<span class="space_LR">:</span></b>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<b><p>Others</p></b>
											</div>

						                  <div class="col-md-3 col-sm-6 col-xs-6">
							                       <p class="text-right">
									       <b> Total No. of Plots<span class="space_LR">:</span></b>
								         </p>
							               </div>
							                
							            <div class="col-md-3 col-sm-6 col-xs-6">
								          
								           	<b><p>${pdm.totalnoOfOtherPlots}</p></b>
								         
							                 </div>
							            </div>
                                            <div class="row">
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													No. of Plots booked<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${plotQuarter.plotDetails.totalnoOfOtherPlotsBooked}</p>
											</div>

											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													No. of Plots Available<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${plotQuarter.plotDetails.totalnoOfOtherPlotsAvailable}</p>
											</div>

										</div>
                                     
										<br />
								

										<br />
										<br />

	                          <h5>4.3. Status of Common Areas To be Relinquished to local Authority /Planning Authority</h5>
						<br />
						        
							<div class="row">
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										<b>Public and Semi Public Sites<span class="space_LR">:</b></span>
									</p>
								</div>
								</div>
							<div class="row">
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										No. of Public and Semi Pubic Sites<span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>${plotQuarter.quarterlyPlotsCommonAuthorityModel.noOfPublicOrSemiPubSites}</p>
								</div>

							
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										Area of Public and Semi Pubic Sites(in Sq.m)<span
											class="space_LR">:</span>
									</p>
								</div>
								
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>${plotQuarter.quarterlyPlotsCommonAuthorityModel.totAreaOfPublicOrSemiPubSites}</p>
								</div>

							</div>
								
								<div class="row">
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										Percentage of Completion (%)<span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>${plotQuarter.quarterlyPlotsCommonAuthorityModel.percentageOfCompletionOfSites}</p>
								</div>

								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										Upload Photograph<span class="space_LR">:</span>
									</p>
								</div>
								
								<div class="col-md-3 col-sm-6 col-xs-6">
								<p>
								<a
							href='<%=request.getContextPath() %>/download?DOC_ID=${plotQuarter.quarterlyPlotsCommonAuthorityModel.sitesPhotograph.documentId}'>${plotQuarter.quarterlyPlotsCommonAuthorityModel.sitesPhotograph.fileName}</a>
								</p>
								</div>
								</div>
								
								<div class="row">
						
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										<b>Parks and Open Spaces<span class="space_LR">:</b></span>
									</p>
								</div>
							</div>

							<div class="row">
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										No. of Parks and Open Spaces<span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>${plotQuarter.quarterlyPlotsCommonAuthorityModel.totNoOfParkAndOpenSpace}</p>
								</div>
						
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										Area of Parks and Open Spaces(in Sq.m)<span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>${plotQuarter.quarterlyPlotsCommonAuthorityModel.totAreaOfParkAndOpenSpace}</p>
								</div>
							</div>

							 <div class="row">
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										Percentage of Completion (%)<span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
								<p>${plotQuarter.quarterlyPlotsCommonAuthorityModel.percentageOfCompletionOfOpenSpace}</p>
									
									
								</div>
							
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										Upload Photograph<span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									
									<p>
								<a
							href='<%=request.getContextPath() %>/download?DOC_ID=${plotQuarter.quarterlyPlotsCommonAuthorityModel.openSpacePhotograph.documentId}'>${plotQuarter.quarterlyPlotsCommonAuthorityModel.openSpacePhotograph.fileName}</a>
								</p>
								</div>
							</div> 


							<div class="row">
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										<b>Road and Transportation<span class="space_LR">:</b></span>
									</p>
								</div>
						</div>
						<div class="row">
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										Area of Road/Transportation(in Sq.m)<span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>${plotQuarter.quarterlyPlotsCommonAuthorityModel.totAreaOfRoad}</p>
								</div>
						
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										Percentage of Completion (%)<span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>${plotQuarter.quarterlyPlotsCommonAuthorityModel.percentageOfCompletionOfRoad}</p>
								</div>
								</div>
						<div class="row">
							
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										Upload Photograph<span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>
								<a
							href='<%=request.getContextPath() %>/download?DOC_ID=${plotQuarter.quarterlyPlotsCommonAuthorityModel.roadPhotograph.documentId}'>${plotQuarter.quarterlyPlotsCommonAuthorityModel.roadPhotograph.fileName}</a>
								</p>
								</div>
							</div>
							
						<br /> <br />  

										<br />
										
										<br />
										 <h5>4.4. Civil Work</h5>
										<br />
                                                
                                                 <c:forEach items="${plotQuarter.quarterCivilWorkList}" var="civilWorkList">
											<div class="row">
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														<b><b>Project Work </b><span class="space_LR">:</span></b>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${civilWorkList.typeOfWork}</p>
												</div>
                                       </div>
                                       <div class="row">
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														Estimated From Date<span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${civilWorkList.estimatedFrmDate.time}</p>
												</div>

												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														Estimated To Date<span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${civilWorkList.estimatedToDate.time}</p>
												</div>

											</div>
											</c:forEach>
											

										<br />
										<br />
									

										<h5>4.5. Common Areas To be used by the Purchaser</h5>
										  <br/>
										<br/>
										
										
                                        <c:forEach items="${plotQuarter.quarterCommonAreasPurchaserList}" var="commonAreaPurchaserList">
											<div class="row">
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														<b>Common Area Name<span class="space_LR">:</b></span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${commonAreaPurchaserList.commonArea}</p>
												</div>

												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														<b>Percentage of Completion<span class="space_LR">:</b></span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${commonAreaPurchaserList.percentageOfCompletion}</p>
												</div>
											</div>


										</c:forEach>
									
										<br />
										
											
					 <br /> 
						
							 <h5>4.6.Status of Approvals / NOCs required for the project</h5>
						<br />
						
						
						<c:forEach items="${plotQuarter.approvalsAndNOCDetails}" var="approvalAndNoc">
						<div class="row">
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p class="text-right">
									<b>Details of Approvals / NOCs<span class="space_LR">:</span></b>
								</p>
							</div>
							
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p>${approvalAndNoc.detailsOfApprovalsOrNoc}</p>
							</div>

							<div class="col-md-3 col-sm-6 col-xs-6">
								<p class="text-right">
									Is Applicable?<span class="space_LR">:</span>
								</p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p>${approvalAndNoc.isApplicable}</p>
							</div>
						</div>
                         <c:if test="${approvalAndNoc.isApplicable=='Yes' }">
						<div class="row">
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p class="text-right">
									Status Of Approval<span class="space_LR">:</span>
								</p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p>${approvalAndNoc.status}</p>
							</div>

							<div class="col-md-3 col-sm-6 col-xs-6">
								<p class="text-right">
									Date of Application<span class="space_LR">:</span>
								</p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p>${approvalAndNoc.dateOfApplication.time}</p>
							</div>
                           
						</div>

						<div class="row">
							<div class="col-md-3 col-sm-6 col-xs-6">
								<p class="text-right">

								<span>	Uploaded Document :</span>
								</p>
							</div>
							<div class="col-md-3 col-sm-6 col-xs-6">
								
								<p>
								<a
								href='<%=request.getContextPath() %>/download?DOC_ID=${approvalAndNoc.uploadDoc.documentId}'>${approvalAndNoc.uploadDoc.fileName}</a>
							</p>
							</div>

						</div>
						</c:if>
						<br/>
						</c:forEach>
					
						<br /> <br />
						
						<br /> 
						
						
						 
						
										<h5>4.7. Construction Cost Details </h5>
										<br />
										<c:forEach items="${plotQuarter.quarterPlotsConstructionCostList}" var="consCostList">
										<div class="row">
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
													<b>	Construction Cost Particular <span class="space_LR">:</b></span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${consCostList.consCostParticular}</p>
												</div>
											</div>
                                           
											<div class="row">
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														Estimated Cost<span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${consCostList.estConsCost}</p>
												</div>

											
											<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														Acctual cost<span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${consCostList.actConsCost}</p>
												</div>
                                          </div>

										</c:forEach> 
										
										
											
										<br />
										
										
										 	<h5>4.8. Litigation Details</h5>
										<br />
										
										<c:forEach items="${plotQuarter.litigationDetails}" var="litigations">
											<div class="row">
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														Any litigations on the project (incl. land)?<span
															class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${litigations.anyLitigationOnProject}</p>
												</div>

											</div>


											<div class="row">
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

											</div>

											<div class="row">
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

											</div>

											<div class="row">
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
											 <c:if test="${litigations.anyPreventiveOrderIssued=='Yes' }">

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
										<h5>4.9. Modification, Amendment or Revision to License,
											Permit or Approval (if any)</h5>
										<br />
										
										<c:forEach items="${plotQuarter.modificationDetails}" var="modification">
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

											</div>

                                          <c:if test="${modification.isModificationRequiredToApprove=='Yes'}">
											<div class="row">
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														Issued by Authority<span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${modification.issuedByAuthority}</p>
												</div>
												
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														Upload approval document<span class="space_LR">:</span>
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

														Written consent of at least two-third of Allottees<span
															class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${modification.writtenConsentOfAllotee}</p>
												</div>

											</div>
											<c:if test="${modification.writtenConsentOfAllotee=='Yes'}">
											<div class="row">
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														Upload document<span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>
								<a
							href='<%=request.getContextPath() %>/download?DOC_ID=${modification.uploadDoc.documentId}'>${modification.uploadDoc.fileName}</a>
								</p>
												</div>

										
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

											<div class="row">
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														Plan Number<span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${modification.modificationPlanNo}</p>
												</div>

												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														Date Of Approval<span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${modification.dateOfApproval.time}</p>
												</div>

											</div>

											<div class="row">
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														Details Of Plot Released<span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">

								<p>
									<a
										href='<%=request.getContextPath() %>/download?DOC_ID=${modification.detailsOfPlotReleased.documentId}'>${modification.detailsOfPlotReleased.fileName}</a>
								</p>
							</div>

											</div>

											<div class="row">
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														No Objection Certificate Issued<span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>
								<a
							href='<%=request.getContextPath() %>/download?DOC_ID=${modification.plotNocCertificate.documentId}'>${modification.plotNocCertificate.fileName}</a>
								</p>
												</div>

											</div>
											</c:if>
											</c:if>
										</c:forEach>
									
										<br />
										<h5>4.10. Association of Allottees</h5>
										<br />
                                      
										<div class="row">
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													Is any Association formed?<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${plotQuarter.associationDetails.isAssocitionFormed}</p>
											</div>

										</div>

                                          <c:if test="${plotQuarter.associationDetails.isAssocitionFormed=='Yes'}">
										<div class="row">
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													Name of the Association<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${plotQuarter.associationDetails.associationName}</p>
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
							                       href='<%=request.getContextPath() %>/download?DOC_ID=${plotQuarter.associationDetails.registeredDoc.documentId}'>${plotQuarter.associationDetails.registeredDoc.fileName}</a>
								                 </p>
											</div>

										</div>
                                       </c:if>
                                      
										 <br /> <br />
										 <h5>4.11. Construction Workers Welfare Fund Registration</h5>
										<br />
                                      
										<div class="row">
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													Is Applicable?<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${plotQuarter.welfareFundDetails.isWelfareFundApplicable}</p>
											</div>

										</div>

                                        <c:if test="${plotQuarter.welfareFundDetails.isWelfareFundApplicable=='Yes'}">
										<div class="row">
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													Registration No Of Welfare Fund<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${plotQuarter.welfareFundDetails.plotWelfareFundRegNo}</p>
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
							                       href='<%=request.getContextPath() %>/download?DOC_ID=${plotQuarter.welfareFundDetails.welfareFundregisteredDoc.documentId}'>${plotQuarter.welfareFundDetails.welfareFundregisteredDoc.fileName}</a>
								                 </p>
											</div>

										</div> 
								        </c:if>
								     
                                        <br/>
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
												<p>${plotsCostSummary.estLandCost}</p>
											</div>
											
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													Acctual Land Cost<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${plotsCostSummary.actLandCost}</p>
											</div>
											</div>
                                            <div class="row">
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													Estimated Construction Cost<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${plotsCostSummary.estConstructionCost}</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													Acctual Construction Cost<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${plotsCostSummary.actConstructionCost}</p>
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
												<p>${PlotsLandAcquisitionCost.approvalCostModel.totalCostOfApprovals}</p>
											</div>
											 <div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													Acctual Cost for Approvals, NOCs, Licenses and others<span
														class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${plotsCostSummary.actCostOfApprove }</p>
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
												<p>${plotsCostSummary.estTotalCost}</p>
											</div>
											 <div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													Acctual Total Cost<span
														class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${plotsCostSummary.actTotalCost }</p>
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
												<p>${plotsCostSummary.amtCollectedFromAllotee}</p>
											</div>

											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													Amount utilized for the project<span
														class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${plotsCostSummary.amtUtilizedforConstruction}</p>
											</div>
										</div>
										
										<div class="row">
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">

													Balance Amount <span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${plotsCostSummary.balanceAmt}</p>
											</div>
									
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													Amount utilized in percentage %<span
														class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${plotsCostSummary.amtUtilPercentage}</p>
											</div>

										</div>
										
										<br />
										<br />

										<h1>6. Final<span> Approval</span></h1>
										<div class="drop_shadow"></div>
										<br />
										<br/>
										<br />
										<c:forEach items="${plotfinalApproval}" var="finalApproveObj">
											<div class="row">
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														Name Of The Certificate <span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${finalApproveObj.nameOfCerificate}</p>
												</div>

												<div class="col-md-3 col-sm-6 col-xs-6">
													<p class="text-right">
														Is Certificate Approved<span class="space_LR">:</span>
													</p>
												</div>
												<div class="col-md-3 col-sm-6 col-xs-6">
													<p>${finalApproveObj.isApproved}</p>
												</div>
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
										
										</div>
						             </div>	
								</div>
						   </div> 

					</div>





					