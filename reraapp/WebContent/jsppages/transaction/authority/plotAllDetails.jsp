<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
				<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>					
									
									
										<div class="col-md-12">
											<br />
										<h1>1.Plot<span> Details</span></h1>&nbsp; &nbsp; &nbsp; &nbsp;
									&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<input
										type="button" value="Download as Pdf" onclick="downloadPdf()">
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
										
										<br />
										<br />
										<h3>3.2 Construction Cost Details</h3>
										<br />
										<c:forEach items="${plotsConstructionCostmodel.plotsConstructionCostList}" var="consCostList">
										<c:if test="${not empty plotsConstructionCostmodel.plotsConstructionCostList }">
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
									
                                            <br />
                                            <br />
                                            <br />
										<h1>4. Plot Quarterly<span> Update Details</span></h1>
										<div class="drop_shadow"></div>
										<br />
										<h5>4.1. Bank Details</h5>
										
										
										<br />
										<c:forEach items="${plotQuarterList}" var="pqudm">
										<c:if test="${not empty pqudm.bankDetails }">
										<div class="row">
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													Percentage of completion of project <span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${pqudm.bankDetails.percentageOfProjectCompletion}</p>
											</div>
										
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													Total advance amount collected from prospective purchasers
													(in INR)<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${pqudm.bankDetails.totAdvanceAmt}</p>
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
												<p>${pqudm.bankDetails.amtWithdrawnFromBank}</p>
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
															href='<%=request.getContextPath() %>/download?DOC_ID=${pqudm.bankDetails.certFromChartedAcc.documentId}'>${pqudm.bankDetails.certFromChartedAcc.fileName}</a>
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
															href='<%=request.getContextPath() %>/download?DOC_ID=${pqudm.bankDetails.certificateIssuedByStructuralEng.documentId}'>${pqudm.bankDetails.certificateIssuedByStructuralEng.fileName}</a>
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
															href='<%=request.getContextPath() %>/download?DOC_ID=${pqudm.bankDetails.certificateIssuedByArchitect.documentId}'>${pqudm.bankDetails.certificateIssuedByArchitect.fileName}</a>
													</p>
											</div>
										</div>
                                         <c:if test="${pqudm.bankDetails.percentageOfProjectCompletion=='100' }">
										<div class="row">
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													Annual Financial Report<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												
												
												<p>
														<a
															href='<%=request.getContextPath() %>/download?DOC_ID=${pqudm.bankDetails.annualfinancialReport.documentId}'>${pqudm.bankDetails.annualfinancialReport.fileName}</a>
													</p>
											</div>
										</div>
										</c:if>
										<c:if test="${pqudm.bankDetails.percentageOfProjectCompletion !='100' }">
										<div class="row">
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													Quarterly Financial Report<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												
												
												<p>
														<a
															href='<%=request.getContextPath() %>/download?DOC_ID=${pqudm.bankDetails.financialReport.documentId}'>${pqudm.bankDetails.financialReport.fileName}</a>
													</p>
											</div>
										</div>
										</c:if>
										</c:if>
										</c:forEach>

										<br />
										<br />

										<h5>4.2. Plot Details</h5>
										<br />
										
										<c:forEach items="${plotQuarterList}" var="plotsDetails">
										<c:if test="${not empty plotsDetails.plotDetails }">		
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
												<b><p>${plotsDetails.plotDetails.totalNumberOfPlotsBooked}</p></b>
											</div>

											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													<b>Total Plots Available<span class="space_LR">:</span></b>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<b><p>${plotsDetails.plotDetails.totalNumberOfPlotsAvailable}</p></b>
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
												<p>${plotsDetails.plotDetails.totalnoOfEWSPlotsBooked}</p>
											</div>

											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													No. of Plots Available<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${plotsDetails.plotDetails.totalnoOfEWSPlotsAvailable}</p>
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
												<p>${plotsDetails.plotDetails.totalnoOfLIGPlotsBooked}</p>
											</div>

											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													No. of Plots Available<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${plotsDetails.plotDetails.totalnoOfLIGPlotsAvailable}</p>
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
												<p>${plotsDetails.plotDetails.totalnoOfMIGPlotsBooked}</p>
											</div>

											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													No. of Plots Available<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${plotsDetails.plotDetails.totalnoOfMIGPlotsAvailable}</p>
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
												<p>${plotsDetails.plotDetails.totalnoOfHIGPlotsBooked}</p>
											</div>

											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													No. of Plots Available<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${plotsDetails.plotDetails.totalnoOfHIGPlotsAvailable}</p>
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
												<p>${plotsDetails.plotDetails.totalnoOfOtherPlotsBooked}</p>
											</div>

											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													No. of Plots Available<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${plotsDetails.plotDetails.totalnoOfOtherPlotsAvailable}</p>
											</div>

										</div>
                                       </c:if>
                                        </c:forEach>
										<br />
								

										<br />
										<br />

	                          <h5>4.3. Status of Common Areas To be Relinquished to local Authority /Planning Authority</h5>
						<br />
						        <c:forEach items="${plotQuarterList}" var="commonAreaRelinquished">
										<c:if test="${not empty commonAreaRelinquished.quarterlyPlotsCommonAuthorityModel }">
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
									<p>${commonAreaRelinquished.quarterlyPlotsCommonAuthorityModel.noOfPublicOrSemiPubSites}</p>
								</div>

							
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										Area of Public and Semi Pubic Sites(in Sq.m)<span
											class="space_LR">:</span>
									</p>
								</div>
								
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>${commonAreaRelinquished.quarterlyPlotsCommonAuthorityModel.totAreaOfPublicOrSemiPubSites}</p>
								</div>

							</div>
								
								<div class="row">
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										Percentage of Completion (%)<span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>${commonAreaRelinquished.quarterlyPlotsCommonAuthorityModel.percentageOfCompletionOfSites}</p>
								</div>

								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										Upload Photograph<span class="space_LR">:</span>
									</p>
								</div>
								
								<div class="col-md-3 col-sm-6 col-xs-6">
								<p>
								<a
							href='<%=request.getContextPath() %>/download?DOC_ID=${commonAreaRelinquished.quarterlyPlotsCommonAuthorityModel.sitesPhotograph.documentId}'>${commonAreaRelinquished.quarterlyPlotsCommonAuthorityModel.sitesPhotograph.fileName}</a>
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
									<p>${commonAreaRelinquished.quarterlyPlotsCommonAuthorityModel.totNoOfParkAndOpenSpace}</p>
								</div>
						
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										Area of Parks and Open Spaces(in Sq.m)<span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>${commonAreaRelinquished.quarterlyPlotsCommonAuthorityModel.totAreaOfParkAndOpenSpace}</p>
								</div>
							</div>

							 <div class="row">
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										Percentage of Completion (%)<span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
								<p>${commonAreaRelinquished.quarterlyPlotsCommonAuthorityModel.percentageOfCompletionOfOpenSpace}</p>
									
									
								</div>
							
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										Upload Photograph<span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									
									<p>
								<a
							href='<%=request.getContextPath() %>/download?DOC_ID=${commonAreaRelinquished.quarterlyPlotsCommonAuthorityModel.openSpacePhotograph.documentId}'>${commonAreaRelinquished.quarterlyPlotsCommonAuthorityModel.openSpacePhotograph.fileName}</a>
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
									<p>${commonAreaRelinquished.quarterlyPlotsCommonAuthorityModel.totAreaOfRoad}</p>
								</div>
						
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p class="text-right">
										Percentage of Completion (%)<span class="space_LR">:</span>
									</p>
								</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
									<p>${commonAreaRelinquished.quarterlyPlotsCommonAuthorityModel.percentageOfCompletionOfRoad}</p>
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
							href='<%=request.getContextPath() %>/download?DOC_ID=${commonAreaRelinquished.quarterlyPlotsCommonAuthorityModel.roadPhotograph.documentId}'>${commonAreaRelinquished.quarterlyPlotsCommonAuthorityModel.roadPhotograph.fileName}</a>
								</p>
								</div>
							</div>
							 </c:if>
							 </c:forEach>
						<br /> <br />  

										<br />
										
										<br />
										 <h5>4.4. Civil Work</h5>
										<br />
                                                <c:forEach items="${plotQuarterList}" var="quarterList">
                                                 <c:if test="${not empty quarterList.quarterCivilWorkList }">
                                                 <c:forEach items="${quarterList.quarterCivilWorkList}" var="civilWorkList">
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
											 </c:if> 
										</c:forEach>

										<br />
										<br />
									

										<h5>4.5. Common Areas To be used by the Purchaser</h5>
										  <br/>
										<br/>
										
										<c:forEach items="${plotQuarterList}" var="quarterList">
                                                 <c:if test="${not empty quarterList.quarterCommonAreasPurchaserList }">
                                                 <c:forEach items="${quarterList.quarterCommonAreasPurchaserList}" var="commonAreaPurchaserList">
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
										</c:if>
										</c:forEach>
										<br />
										
											
					 <br /> 
						
							 <h5>4.6.Status of Approvals / NOCs required for the project</h5>
						<br />
						
						
						<c:forEach items="${plotQuarterList}" var="quarterList">
                                                 <c:if test="${not empty quarterList.approvalsAndNOCDetails }">
                                                 <c:forEach items="${quarterList.approvalsAndNOCDetails}" var="approvalAndNoc">
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
						</c:if>
                      </c:forEach>
						<br /> <br />
						
						<br /> 
						
						
						 
						
										<h5>4.7. Construction Cost Details </h5>
										<br />
										<c:forEach items="${plotQuarterList}" var="quarterList">
                                                 <c:if test="${not empty quarterList.quarterPlotsConstructionCostList }">
										<c:forEach items="${quarterList.quarterPlotsConstructionCostList}" var="consCostList">
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
												</c:if>
										 </c:forEach>
											
										<br />
										
										
										 	<h5>4.8. Litigation Details</h5>
										<br />
										<c:forEach items="${plotQuarterList}" var="quarterList">
                                                 <c:if test="${not empty quarterList.litigationDetails }">
										<c:forEach items="${quarterList.litigationDetails}" var="litigations">
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
										</c:if>
                                        </c:forEach>

										<br />
										<br />
										<h5>4.9. Modification, Amendment or Revision to License,
											Permit or Approval (if any)</h5>
										<br />
										<c:forEach items="${plotQuarterList}" var="quarterList">
                                                 <c:if test="${not empty quarterList.modificationDetails }">
										<c:forEach items="${quarterList.modificationDetails}" var="modification">
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
										</c:if>
                                        </c:forEach>
										<br />
										<h5>4.10. Association of Allottees</h5>
										<br />
                                         <c:forEach items="${plotQuarterList}" var="quarterList">
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
										 <br /> <br />
										 <h5>4.11. Construction Workers Welfare Fund Registration</h5>
										<br />
                                       <c:forEach items="${plotQuarterList}" var="quarterList">
                                                 <c:if test="${not empty quarterList.welfareFundDetails }">
										<div class="row">
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													Is Applicable?<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${quarterList.welfareFundDetails.isWelfareFundApplicable}</p>
											</div>

										</div>

                                        <c:if test="${quarterList.welfareFundDetails.isWelfareFundApplicable=='Yes'}">
										<div class="row">
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p class="text-right">
													Registration No Of Welfare Fund<span class="space_LR">:</span>
												</p>
											</div>
											<div class="col-md-3 col-sm-6 col-xs-6">
												<p>${quarterList.welfareFundDetails.plotWelfareFundRegNo}</p>
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
							                       href='<%=request.getContextPath() %>/download?DOC_ID=${quarterList.welfareFundDetails.welfareFundregisteredDoc.documentId}'>${quarterList.welfareFundDetails.welfareFundregisteredDoc.fileName}</a>
								                 </p>
											</div>

										</div> 
								        </c:if>
								        </c:if>
                                        </c:forEach>
                                        <br/>
										<br />
										<br />
                                          <div class="col-md-12">
											<h1>5. Project Cost <span> Summry </span></h1>
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
										</div>