<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
				<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>					
									
									
										<div class="col-md-12">
											<br />
										<h1>1.Plot<span> Details</span></h1>&nbsp; &nbsp; &nbsp; &nbsp;
									&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <input type="button" value="Download as Pdf" onclick="downloadPdf()">
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
						  
									
                                            <br /><br /><br />
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
											</div>
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
				
										 	<h5>4.7. Litigation Details</h5>
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
										<h5>4.8. Modification, Amendment or Revision to License,
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
										<h5>4.9. Association of Allottees</h5>
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
										 <h5>4.10. Construction Workers Welfare Fund Registration</h5>
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
										
										</div>