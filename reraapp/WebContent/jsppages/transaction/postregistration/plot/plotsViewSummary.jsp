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
				         <c:forEach items="${PlotsLandAcquisitionCost.approvalCostModel.approvalCostDetails}" var="approvalList">
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
                   data
							.push({

								id : 1,

								name : 'Total Cost Of Approval',

								email : '${PlotsLandAcquisitionCost.approvalCostModel.totalCostOfApprovals}'

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

						name : ' 2. Construction Cost Details:',

						email : ''

					});
					</script>
					<c:forEach items="${plotsConstructionCostmodel.plotsConstructionCostList}" var="consCostList">
					
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
                   data
							.push({

								id : 1,

								name : 'Total Cost Of Construction',

								email : '${plotsConstructionCostmodel.estTotConstructionCost}'

							});
					
					</script>
					
				
				
					

				<!-----------------------------Tab start here--------------------------------->
						
	
	<div class="row" >
					<!-- <br><br>
					<br>
				<h2 style="color: green;" > Congratulations!! Your Application has been updated successfully.</h2>
				</div>
				<br><br>
					<br> -->
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
											<h1> Post Registration and Details.&nbsp; &nbsp; &nbsp; &nbsp;
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
										
										
                                       

										<br />
										<br />
										
										</div>
						             </div>	
								</div>
						   </div>

					</div>





					