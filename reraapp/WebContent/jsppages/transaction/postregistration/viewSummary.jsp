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

										