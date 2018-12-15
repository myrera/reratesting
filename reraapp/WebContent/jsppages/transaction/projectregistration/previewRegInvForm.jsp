<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="in.gov.rera.common.util.DateUtil"%>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<form:form class="form-horizontal" action="updateInvdPromoterDetails" modelAttribute="projectRegistrationModel" id="trxForm" autocomplete="off" enctype= "multipart/form-data">
    
    <!-- PROJECT INDIVIDUAL START -->
    <div class="inner_wrapper">
				<h1>
					Promoter <span> Detail</span>
				</h1>
				<div class="border">
					<div class="orange"></div>
					<div class="black"></div>
				</div>

                            <form:hidden path="projectDetailsModel.projectDetailsId"/>
					        <form:hidden path="projectBankDetailsModel.projectBankDelsId"/>
					        <form:hidden path="externalDevelopmentWorkModel.extDevId"/>
					        <form:hidden path="projectRegId"/>
					         <form:hidden path="projectDocModel.docId"/>
					       

					<div class="form-group">
						<label class="col-sm-3 control-label">Name<sup>*</sup></label>
						<div class="col-sm-3">
							  <form:input path="promoterDetailsModel.promoterName" id='promoterName' disabled="true" cssClass="form-control input-sm"/>	
							  <input name="nextForm" type="hidden" value="${nextView}"/>	
								
						</div>
						<label for="inputEmail3" class="col-sm-2 control-label">Father's
							Name<sup>*</sup></label>
						<div class="col-sm-3">
								
							 <form:input path="promoterDetailsModel.promoterIndividualFatherName" disabled="true" id="promoterIndividualFatherName" cssClass="form-control input-sm"/>	
						</div>


					</div>



					<div class="form-group">
						<label for="inputEmail3" class="col-sm-3 control-label">PAN
							Number<sup>*</sup></label>
						<div class="col-sm-3">
								 <form:input path="promoterDetailsModel.panNo" disabled="true" id="panNo" cssClass="form-control input-sm"/>	
					
						</div>
						<label for="inputEmail3" class="col-sm-2 control-label">Aadhaar 
							Number<sup>*</sup></label>
						<div class="col-sm-3">
							
						     <form:input path="promoterDetailsModel.adhaarNo" disabled="true" id="adhaarNo" cssClass="form-control input-sm"/>		
								
						</div>

					</div>
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-3 control-label">Mobile
							No.<sup>*</sup></label>
						<div class="col-sm-3">
							
							<form:input path="promoterDetailsModel.mobileNo" disabled="true"  id="mobileNo" cssClass="form-control input-sm"/>	
						</div>
						
						<label for="inputEmail3" class="col-sm-2 control-label">
							Telephone No<sup>*</sup></label>
						<div class="col-sm-3">
							 <form:input path="promoterDetailsModel.telephoneNo" disabled="true"  id="landLineNo1" cssClass="form-control input-sm"/>			
						</div>
					</div>
					
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-3 control-label">
							E-mail<sup>*</sup></label>
						<div class="col-sm-3">
							 <form:input path="promoterDetailsModel.emailId" disabled="true"  id="emailId" cssClass="form-control input-sm"/>			
								
						</div>
						
						<label for="inputEmail3" class="col-sm-2 control-label">Fax
							Number </label>
						<div class="col-sm-3">
							
							<form:input path="promoterDetailsModel.faxNumber" disabled="true" id="faxNumber" cssClass="form-control input-sm"/>
						</div>
						

					</div>
					


					<div class="form-group">

						
						<label for="inputEmail3" class="col-sm-3 control-label">Address Line 1
						<sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="promoterDetailsModel.addressLine1" disabled="true" id="addressLine1" cssClass="form-control input-sm"/>
							
						</div>
	                     <label for="inputEmail3" class="col-sm-2 control-label">Address Line 2
						<sup>*</sup></label>
						
						<div class="col-sm-3">
							<form:input path="promoterDetailsModel.addressLine2" disabled="true" id="addressLine2" cssClass="form-control input-sm"/>
							
						</div>



                      </div>
                      
                      <div class="form-group">

						<label for="inputEmail3" class="col-sm-3 control-label">
							 Occupation</label>
						<div class="col-sm-3">
							<form:input path="promoterDetailsModel.accupation" disabled="true" cssClass="form-control input-sm"/>
						</div>
						
						
						

						
					
                      </div>
                      
                      
                      
                      
                      



					<div class="form-group">

						<label for="inputEmail3" class="col-sm-3 control-label">State/UT
						<sup>*</sup></label>
						<div class="col-sm-3">


							
						 <select name="stateUtId" id="invSate" disabled="disabled" onchange="reloadChildDropdown(this)" class="form-control">
						      <option value='0'> --Select-- </option>
						        
						       
						       
						        <c:forEach  items="${stateUtList}" var="st">
						              <c:choose>
						                <c:when test="${st.stateUtId==projectRegistrationModel.promoterDetailsModel.districtModel.stateUtModel.stateUtId}">
						                 <option value='${st.stateUtId }' selected="selected"> ${st.stateUtName} </option>
						                </c:when>
						                  <c:otherwise>
						               <option value='${st.stateUtId}'> ${st.stateUtName} </option>
						                </c:otherwise>
						
						
						
						                  </c:choose>
						           </c:forEach>
						
						        
						        
						        
						        
						       </select>
							   
							   
                               


						</div>

						<label for="inputEmail3" class="col-sm-2 control-label">District<sup>*</sup>
						</label>
						<div class="col-sm-3">
		                    <select class="form-control" name="permDistrictId" disabled="disabled" id="District-invSate" >
									<option value="0"> --Select-- </option>
									
									
									<c:forEach  items="${projectRegistrationModel.promoterDetailsModel.districtModel.stateUtModel.districtModelSet}" var="dst">	
								
								<c:choose>
						<c:when test="${dst.districtId==projectRegistrationModel.promoterDetailsModel.districtModel.districtId}">
						<option value='${dst.districtId }' selected="selected"> ${dst.districtName } </option>
						</c:when>
						<c:otherwise>
						<option value='${dst.districtId }'> ${dst.districtName } </option>
						</c:otherwise>
						
						
						
						</c:choose>
								
							
							</c:forEach>	
									
									
																		
							</select>
                               

						</div>

	


					</div>
					
					<div class="form-group">

						<label for="inputEmail3" class="col-sm-3 control-label">Pin Code<sup>*</sup></label>
						<div class="col-sm-3">

                              <form:input path="promoterDetailsModel.pinCode" disabled="true"  id="pinCode" cssClass="form-control" maxlength="6"/>

						</div>
						
						

					 
						<label for="inputEmail3" class="col-sm-2 control-label">Photograph<sup>*</sup></label>
						<div class="col-sm-3">
								   <div class="col-sm-3 ">
							        <input type="file" name="individualPhotoGraphPath" disabled="disabled"/>
							       
							        <a href='<%=request.getContextPath() %>/download?DOC_ID=${projectRegistrationModel.promoterDetailsModel.individualPhotoGraphPath.documentId}'>${projectRegistrationModel.promoterDetailsModel.individualPhotoGraphPath.fileName }</a>
	                              </div>
						
							

						</div>

					</div>

					<br>
                          

					<div class="inner_wrapper">

						<h1>
							Previous Project <span>Details</span><span
								style="font-size: 12px; padding-left: 8px; font-weight: normal; color: #000;">
								(Last 5 years only)</span>
						</h1>
                    <!-- loop -->
                    <% int xx=0; %>
						<c:forEach items="${projectRegistrationModel.previousProjectDetailsSet}" var="obj">
					
						
						<%if(xx>0){ %>
							<DIV  class="addmoredv">
							<%}else{ %>
								<DIV ID="perv-dels-dv" class="addmoredv">
							<%}
						xx++;%>
							<div class="drop_shadow">
								<input type="hidden" name='pervProjectRegId' value="${obj.pervProjectRegId}"/>
								
						</div>
							
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">
								Project Name 
								
								
								</label>
								
							<div class="col-sm-3">
								<input type="text" class="form-control input-sm" disabled="disabled"
									id="pervProjectName" name="pervProjectName" value="${obj.projectName}">
									
							</div>
							
							

							<label for="inputEmail3" class="col-sm-2 control-label">
								Project Description</label>
							<div class="col-sm-3">
								<textarea class="form-control input-sm" name="pervProjectDescription" disabled="disabled"  id="pervProjectDescription" rows="3" >
							    <c:out value='${obj.projectDescription}'/>	
							    </textarea>
							</div>




						</div>


						<div class="form-group dynaselectfld" id='DVprojectCurrentStatus<%=xx %>'>

								<label for="inputEmail3" class="col-sm-3 control-label">Current
									Status </label>
									
								<div class="col-sm-3">
										<select class="form-control dynaselectfld" disabled="disabled" name="projectCurrentStatus" 
										id='projectCurrentStatus<%=xx %>' onchange="ocCurrentStatus(this)" >
								
										<option value="1">Select </option>
									    
									    
									    <c:choose>
											<c:when test="${obj.projectCurrentStatus == 'Completed'}">
												 <option value="Completed" selected="selected">Completed </option>
												  <option value="Ongoing">Ongoing</option>
									            <option value="Delay">Delay</option>
									            
											</c:when>
											<c:when test="${obj.projectCurrentStatus == 'Ongoing'}">
											    <option value="Completed">Completed </option>
									            <option value="Ongoing"  selected="selected">Ongoing</option>
									            <option value="Delay">Delay</option>
									            
											</c:when>
											<c:when test="${obj.projectCurrentStatus == 'Delay'}">
											    <option value="Completed">Completed </option>
									            <option value="Ongoing">Ongoing</option>
									            <option value="Delay" selected="selected">Delay</option>
									            
											</c:when>
											
											
											
											
										</c:choose>
									 </select>
								</div>


							
						    <c:choose>
							<c:when test="${obj.projectCurrentStatus == 'Completed'}">
							    
							     <div class='completionDocId'>
	                           		<label for="inputEmail3" class="col-sm-2 control-label">
									Project Completion Cretificate</label>
								   <div class="col-sm-3 ">
							        <input type="file" name="completionDocId" disabled="disabled"/>
							        <a href='<%=request.getContextPath() %>/download?DOC_ID=${obj.completionDocId.documentId}'>${obj.completionDocId.fileName }</a>
	                              </div>
                                 </div>                            
								
								<div class='noOfMonthDelayed'  style='display:none;'>
							
								<label for="inputEmail3" class="col-sm-2 control-label">
									 No of Months Delayed  </label>
								<div class="col-sm-3">
									<input class="form-control" disabled="disabled" name="noOfMonthDelayed" />
								</div>
                              </div>
                              
                              
                               <div class='expectedCompletionDate'  style='display:none;'>
								<label for="inputEmail3" class="col-sm-2 control-label">
									Expected Completion Date </label>
								<div class="col-sm-3">
									
										<input type="text" name="expectedCompletionDate" disabled="disabled" class="form-control input-sm augCalCssClass">
									<span	class="glyphicon glyphicon-calendar augCalImgCssClass"></span>
									
								</div>
                             </div>		
							 </c:when>
							  
							 
							 <c:when test="${obj.projectCurrentStatus == 'Delay'}">
							    <div class='completionDocId' style='display:none;'>
	                           		<label for="inputEmail3" class="col-sm-2 control-label">
									Project Completion Cretificate</label>
								<div class="col-sm-3 ">
							      <input type="file" name="completionDocId" disabled="disabled"/>
							      
	                            </div>
                                   	</div>                            
								
								<div class='noOfMonthDelayed' >
								<label for="inputEmail3" class="col-sm-2 control-label">
									No of Months Delayed </label>
								<div class="col-sm-3">
									<input class="form-control"  name="noOfMonthDelayed" disabled="disabled" value="${obj.noOfMonthDelayed}"/>
								</div>
                              </div>
                              
                           
                              <div class='expectedCompletionDate'  style='display:none;'>



								<label for="inputEmail3" class="col-sm-2 control-label">
									Expected Completion Date </label>
								<div class="col-sm-3">
									
										<input type="text" name="expectedCompletionDate" disabled="disabled" class="form-control input-sm augCalCssClass" />
									<span	class="glyphicon glyphicon-calendar augCalImgCssClass"></span>
									
								</div>
                             </div>		
							 </c:when>
							 
							 
							 
							 <c:otherwise>
					
							 
							     <div class='completionDocId' style='display:none;'>
	                           		<label for="inputEmail3" class="col-sm-2 control-label">
									Project Completion Cretificate</label>
								<div class="col-sm-3 ">
							      <input type="file"  name="completionDocId" disabled="disabled"/>
	                            </div>
                                   	</div>                            
								
								<div class='noOfMonthDelayed'  style='display:none;'>
								<label for="inputEmail3" class="col-sm-2 control-label">
									No of Months Delayed </label>
								<div class="col-sm-3">
									<input class="form-control"  name="noOfMonthDelayed" disabled="disabled" />
								</div>
                              </div>
                              
                              
                               <div class='expectedCompletionDate' >



								<label for="inputEmail3" class="col-sm-2 control-label">
									Expected Completion Date </label>
								<div class="col-sm-3">
									
										<input type="text" name="expectedCompletionDate" disabled="disabled" class="form-control input-sm augCalCssClass" value="${obj.expectedCompletionDate}">
									<span	class="glyphicon glyphicon-calendar augCalImgCssClass"></span>
									
								</div>
                                </div>		
							
							   </c:otherwise>
							   </c:choose>

							


							</div>


							<div class="form-group">
							
							
								<label for="inputEmail3" class="col-sm-3 control-label">Type
									of Land </label>
								<div class="col-sm-3">
									<select class="form-control" name="typeOfLand" disabled="disabled">
										<option value="0">Select</option>
										
										  <c:choose>
											<c:when test="${obj.typeOfLand == 'Residential'}">
												<option value="Residential" selected="selected">Residential</option>
										        <option value="Commercial">Commercial</option>
										        <option value="Mixed Development">Mixed Development</option>
										
											</c:when>
											<c:when test="${obj.typeOfLand == 'Commercial'}">
											   <option value="Residential">Residential</option>
										       <option value="Commercial" selected="selected">Commercial</option>
										       <option value="Mixed Development">Mixed Development</option>
										
											</c:when>
											<c:otherwise>
											 <option value="Residential">Residential</option>
										       <option value="Commercial" >Commercial</option>
										       <option value="Mixed Development" selected="selected">Mixed Development</option>
											</c:otherwise>
										</c:choose>
										
										
									</select>
								</div>
							
													   
							

							</div>
	                            
	                            
								
							



							<div class="form-group">
								<label for="inputEmail3" class="col-sm-3 control-label">Is
									there any case pending</label>
								<div class="col-sm-3 ">
								<c:choose>
								<c:when test="${obj.isCasesPending=='YES' }">
								<input type='hidden' name="isCasesPendingFld" id='HdisCasesPending<%=xx %>' value='YES' class='dynaselectfld'>
									&nbsp&nbspYes&nbsp&nbsp
									<input type="radio"	name="isCasesPending<%=xx %>" disabled="disabled" id="isCasesPending<%=xx %>" value="YES" checked="checked" class='dynaselectfld' onclick='showrelatedfld(this)'>
									&nbsp&nbspNo&nbsp&nbsp
									<input type="radio" name="isCasesPending<%=xx %>  "id="isCasesPending<%=xx %>"  value="NO"   onclick='hiderelatedfld(this)' class='dynaselectfld'>
									<input type="text" value="${obj.caseDetails}" disabled="disabled" id="FldisCasesPending<%=xx %>"  name="caseDetails" class="form-control dynaselectfld" />
                                </c:when>
                                
                                <c:otherwise>
                                <input type='hidden' name="isCasesPendingFld" id='HdisCasesPending<%=xx %>' value='NO' class='dynaselectfld'>
                                	&nbsp&nbspYes&nbsp&nbsp
									<input type="radio" d	name="isCasesPending<%=xx %>" id="isCasesPending<%=xx %>" value="YES" onclick='showrelatedfld(this)' class='dynaselectfld'>
									
									&nbsp&nbspNo&nbsp&nbsp
									<input type="radio" disabled="disabled" name="isCasesPending"id="isCasesPending<%=xx %>"  value="NO"   checked="checked"  onclick='hiderelatedfld(this)' class='dynaselectfld'>
									<input type="text" disabled="disabled" value="${obj.caseDetails}" id="FldisCasesPending<%=xx %>" style='display:none;'name="caseDetails" class="form-control dynaselectfld"  />
                                </c:otherwise>
                                   </c:choose>

								</div>
								<label for="inputEmail3" class="col-sm-2 control-label">
									Is Payment Pertaining to Project Land Pending </label>
								<div class="col-sm-3">
									<div class="col-md-6 input-group">
									<c:choose>
									<c:when test="${obj.isPaymentPending=='YES' }">
									<input type='hidden' name="isPaymentPendingFld" id='HdisPaymentPending<%=xx %>' value='YES' class='dynaselectfld'>
										&nbsp&nbspYes&nbsp&nbsp<input type="radio"	name="isPaymentPending<%=xx %>" checked="checked" value="YES" id="isPaymentPending<%=xx %>"  class='dynaselectfld'>
										&nbsp&nbspNo&nbsp&nbsp<input type="radio" id="isPaymentPending<%=xx %>"   name="isPaymentPending<%=xx %>" value="NO" onclick='hiderelatedfld(this)'  class='dynaselectfld'>
										 <input	type="text" name="pendingAmount" disabled="disabled" id="FldisPaymentPending<%=xx %>"  value="${obj.pendingAmount}"class="form-control dynaselectfld" />
										</c:when>	
										<c:otherwise>
										<input type='hidden' name="isPaymentPendingFld" id='HdisPaymentPending<%=xx %>' value='NO' class='dynaselectfld'>
										&nbsp&nbspYes&nbsp&nbsp<input type="radio" disabled="disabled"	name="isPaymentPending<%=xx %>" value="YES" id="isPaymentPending<%=xx %>" onclick='showrelatedfld(this)' class='dynaselectfld'>
										&nbsp&nbspNo&nbsp&nbsp<input type="radio" disabled="disabled" id="isPaymentPending<%=xx %>"  checked="checked"  name="isPaymentPending<%=xx %>" value="NO" onclick='hiderelatedfld(this)'  class='dynaselectfld'>
										 <input	type="text" name="pendingAmount" disabled="disabled" id="FldisPaymentPending<%=xx %>" style='display:none;' value="${obj.pendingAmount}"class="form-control dynaselectfld" />
		
										
										</c:otherwise>
											
										</c:choose>	
											
									</div>
								</div>
							</div>

							

						<div class="form-group">

							<label for="inputEmail3" class="col-sm-3 control-label">Address</label>
							<div class="col-sm-3 ">
								<textarea class="form-control input-sm" disabled="disabled" name="projectAddress" id="" rows="3">${obj.projectAddress}</textarea>
							</div>
							<label for="inputEmail3" class="col-sm-2 control-label">
								State/UT </label>
							<div class="col-sm-3">
							<select name="stateUtId" id="pervSate<%=xx %>" disabled="disabled" onchange="reloadChildDropdown(this)" class="form-control dynaselectfld">
						      <option value='0'> --Select-- </option>
						        
						        <c:forEach  items="${stateUtList}" var="st">
						              <c:choose>
						                <c:when test="${st.stateUtId==obj.districtModel.stateUtModel.stateUtId}">
						                 <option value='${st.stateUtId }' selected="selected"> ${st.stateUtName} </option>
						                </c:when>
						                  <c:otherwise>
						               <option value='${st.stateUtId}'> ${st.stateUtName} </option>
						                </c:otherwise>
						
						
						
						                  </c:choose>
						           </c:forEach>
						
						        
						        
						       </select>
				
							</div>
							
							
						</div>


						<div class="form-group">

							<label for="inputEmail3" class="col-sm-3 control-label">District</label>
							<div class="col-sm-3 ">
                        		<select class="form-control dynaselectfld" disabled="disabled" name="pervProjDistrictId"  id="District-pervSate<%=xx %>" >
									<option value="0"> --Select-- </option>
						<c:forEach  items="${obj.districtModel.stateUtModel.districtModelSet}" var="dst">	
								
						<c:choose>
						<c:when test="${dst.districtId==obj.districtModel.districtId}">
						<option value='${dst.districtId }' selected="selected"> ${dst.districtName } </option>
						</c:when>
						<c:otherwise>
						<option value='${dst.districtId }'> ${dst.districtName } </option>
						</c:otherwise>
						
						
						
						</c:choose>
								
							
							</c:forEach>			
							
							
							
									
							
																		
								</select>
							</div>
							<label for="inputEmail3" class="col-sm-2 control-label">
								Pin Code </label>
							<div class="col-sm-3">
								<input class="form-control input-sm" disabled="disabled" name="projectAddrPinCode"  id="projectAddrPinCode" value="${obj.projectAddrPinCode}" maxlength="6"/>
							</div>
						</div>
						</div>
						
						
						   </c:forEach>
					
					</div>
					
						
				       </DIV>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
     <!-- PROJECT INDIVIDUAL END -->
     
     
     
     <!-- PROJECT DETAILS START -->
     
     
     
     
     
     
     
     <div class="inner_wrapper">



				<h1>
					Project <span> Detail</span>
				</h1>
				<div class="border">
					<div class="orange"></div>
					<div class="black"></div>
				</div>



                    <!-- PROJECT DETAILS START -->


					<div class="form-group">
						<form:hidden path="projectRegId" />
						<label class="col-sm-3 control-label">Project Name<sup>*</sup></label> <input
							type="hidden" id="nextForm" name="nextForm" value="docUploadFrom" />

						<div class="col-sm-3">
							<form:input path="projectDetailsModel.projectName" disabled="true"
								id="currentProjectName" cssClass="form-control input-sm" />
						</div>
						<label for="inputEmail3" class="col-sm-2 control-label">Project
							Description<sup>*</sup></label>
						<div class="col-sm-3">

							<form:textarea path="projectDetailsModel.projectDescription" disabled="true"
								row="3" id="currentProjectDesc" cssClass="form-control input-sm" />
						</div>


					</div>





					<div class="form-group">
						<label for="inputEmail3" class="col-sm-3 control-label">Project
							Type<sup>*</sup></label>
						<div class="col-sm-3">

							<form:select path="projectDetailsModel.projectType" disabled="true"
								class="form-control">
								<form:option value="Residential/Group Housing" label="Residential/Group Housing" />
								<form:option value="Commercial" label="Commercial" />
								<form:option value="Mixed Development" label="Mixed Development" />
								<form:option value="Plotted Development" label="Plotted Development" />

							</form:select>


						</div>
						<label for="inputEmail3" class="col-sm-2 control-label">Project
							Status<sup>*</sup></label>
						<div class="col-sm-3">

												
							<form:select path="projectDetailsModel.projectStatus" disabled="true"
								class="form-control">
								<form:option value="0" label="Select" />
								<form:option value="Ongoing" label="Ongoing" />
								<form:option value="Complete" label="Complete" />

							</form:select>

						</div>

					</div>




					<div class="form-group">
						<label for="inputEmail3" class="col-sm-3 control-label">Project
							Start Date<sup>*</sup></label>
						<div class="col-sm-3">
							<div class="col-md-12 input-group">

								<form:input path="projectDetailsModel.startDate" readonly="true" disabled="true"
									cssClass="form-control input-sm augCalCssClass" />
								<span class="glyphicon glyphicon-calendar augCalImgCssClass"></span>

							</div>


						</div>
						<label for="inputEmail3" class="col-sm-2 control-label">Project
							End Date<sup>*</sup></label>
						<div class="col-sm-3">
							<div class="col-md-12 input-group">
								<form:input path="projectDetailsModel.completionDate" disabled="true"
									readonly="true" cssClass="form-control input-sm augCalCssClass" />
								<span class="glyphicon glyphicon-calendar augCalImgCssClass"></span>

							</div>

						</div>

					</div>




					<div class="form-group">

						<label for="inputEmail3" class="col-sm-3 control-label">Total
							Area Of Land (Sq Mtr)<sup>*</sup></label>
						<div class="col-sm-3">

							<form:input path="projectDetailsModel.totalAreaOfLand" rel="txtTooltip" title="Only digits are allowed." data-toggle="tooltip" data-placement="bottom" 
								cssClass="form-control input-sm numericValFld  requiredValFld" />
								<span class='requiredValFldMsg'> Please enter Total	Area Of Land.</span>
						</div>
						
						
						<label for="inputEmail3" class="col-sm-2 control-label">Total
							Covered Area (Sq Mtr)<sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="projectDetailsModel.totalCoverdArea" rel="txtTooltip" title="Only digits are allowed." data-toggle="tooltip" data-placement="bottom" 
								cssClass="form-control input-sm  numericValFld requiredValFld" />
								<span class='requiredValFldMsg'> Please enter Total	Covered Area.</span>
						</div>
						
					</div>



					<div class="form-group">


						<label for="inputEmail3" class="col-sm-3 control-label">Total
							Open Area (Sq Mtr)<sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="projectDetailsModel.totalOpenArea" rel="txtTooltip" title="Only digits are allowed." data-toggle="tooltip" data-placement="bottom" 
								cssClass="form-control input-sm numericValFld  requiredValFld" />
								<span class='requiredValFldMsg'> Please enter Total Open Area.</span>
						</div>


						<label for="inputEmail3" class="col-sm-2 control-label">Estimated Cost of Construction (INR)<sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="projectDetailsModel.estimatedCost" rel="txtTooltip" title="Only digits are allowed." data-toggle="tooltip" data-placement="bottom" 
								cssClass="form-control input-sm numericValFld  requiredValFld" />
								<span class='requiredValFldMsg'> Please enter Estimated Cost of Construction.</span>
						</div>




					</div>
					
					
						<div class="form-group">


						<label for="inputEmail3" class="col-sm-3 control-label">Cost of Land (INR)<sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="projectDetailsModel.costOfLand" rel="txtTooltip" title="Only digits are allowed." data-toggle="tooltip" data-placement="bottom" 
								cssClass="form-control input-sm numericValFld  requiredValFld" />
								<span class='requiredValFldMsg'> Please enter Cost of Land.</span>
						</div>


						<label for="inputEmail3" class="col-sm-2 control-label">Total Project Cost (INR)<sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="projectDetailsModel.totalProjectCost" rel="txtTooltip" title="Only digits are allowed." data-toggle="tooltip" data-placement="bottom" 
								cssClass="form-control input-sm numericValFld  requiredValFld" />
								<span class='requiredValFldMsg'> Please enter Total Project Cost.</span>
						</div>




					</div>
					

					<div class="form-group">
						<label for="inputEmail3" class="col-sm-3 control-label">Project
							Address Line 1<sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="projectDetailsModel.addressLine1" disabled="true"
								cssClass="form-control input-sm" />
						</div>
						<label for="inputEmail3" class="col-sm-2 control-label">Project
							Address Line 2<sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="projectDetailsModel.addressLine2" disabled="true"
								cssClass="form-control input-sm" />
						</div>
					</div>

                          <div class="form-group">
						<label for="inputEmail3" class="col-sm-3 control-label">District<sup>*</sup></label>
						<div class="col-sm-3">
							<select class="form-control" name='projectDistrictId' disabled="disabled" id="projectDist" onchange="reloadSubDistrict(this)">
							<option value='0'> --Select-- </option>
						<c:forEach items="${RERA_STATEUT.districtModelSet}" var="dst">
						<c:choose>
						<c:when test="${dst.districtId==projectRegistrationModel.projectDetailsModel.districtModel.districtId}">
						<option value='${dst.districtId }' selected="selected" > ${dst.districtName } </option>
						</c:when>
						<c:otherwise>
						<option value='${dst.districtId }'> ${dst.districtName } </option>
						</c:otherwise>
						</c:choose>
						</c:forEach>
						
						</select>
						
						</div>
						<label for="inputEmail3" class="col-sm-2 control-label">Tehsil/Sub District<sup>*</sup></label>
						<div class="col-sm-3">
							<select  name="subDistrictId" id="SubDistrict-projectDist" disabled="disabled"	class="form-control">
						
						<option value='0'> --Select-- </option>
						
						<c:forEach items="${projectRegistrationModel.projectDetailsModel.districtModel.subDistrictModelSet}" var="sub">
						<c:choose>
						<c:when test="${sub.subDistrictId==projectRegistrationModel.projectDetailsModel.subDistrictModel.subDistrictId}">
						<option value='${sub.subDistrictId }' selected="selected" > ${sub.subDistrictName } </option>
						</c:when>
						<c:otherwise>
						<option value='${sub.subDistrictId }'> ${sub.subDistrictName } </option>
						</c:otherwise>
						</c:choose>
						</c:forEach>

							</select>
						</div>

					</div>




					<div class="form-group">
						<label for="inputEmail3" class="col-sm-3 control-label">No of Garage<sup>*</sup></label>
						<div class="col-sm-3">
						 <fmt:parseNumber var = "y" integerOnly = "true"   type = "number" value = "${projectRegistrationModel.projectDetailsModel.noOfGarageForSale}" />
					
							<form:input path="projectDetailsModel.noOfGarageForSale" disabled="true"
								cssClass="form-control input-sm" />
						</div>

						<label for="inputEmail3" class="col-sm-2 control-label">
							Area of Garage (Sq Mtr)<sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="projectDetailsModel.areaOfGarageForSale" disabled="true"
								cssClass="form-control input-sm" />
						</div>


					</div>


					<div class="form-group">
						<label for="inputEmail3" class="col-sm-3 control-label">No
							of Open Parking (Sq Mtr)<sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="projectDetailsModel.noOfParkinfForSale" disabled="true"
								cssClass="form-control input-sm" />
						</div>

						<label for="inputEmail3" class="col-sm-2 control-label">
							Area Of Open Parking (Sq Mtr)<sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="projectDetailsModel.areaOfParkinfForSale" disabled="true"								cssClass="form-control input-sm" />
						</div>


					</div>



					<div class="form-group">
						<label for="inputEmail3" class="col-sm-3 control-label">No
							of Covered Parking (Sq Mtr)<sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="projectDetailsModel.noOfCoveredParkingForSale" disabled="true"
								cssClass="form-control input-sm" />
						</div>

						<label for="inputEmail3" class="col-sm-2 control-label">
							Area Of Covered Parking (Sq Mtr)<sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="projectDetailsModel.areaOfCoveredParkingForSale" disabled="true"
								cssClass="form-control input-sm" />
						</div>


					</div>
					
					
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-3 control-label">North Latitude<sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="projectDetailsModel.northlatitude" disabled="true"
								cssClass="form-control input-sm" />
						</div>

						<label for="inputEmail3" class="col-sm-2 control-label">
							North Longitude<sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="projectDetailsModel.northlongitude" disabled="true"
								cssClass="form-control input-sm" />
						</div>


					</div>

	
		<div class="form-group">
						<label for="inputEmail3" class="col-sm-3 control-label">East Latitude<sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="projectDetailsModel.eastlatitude" disabled="true"
								cssClass="form-control input-sm" />
						</div>

						<label for="inputEmail3" class="col-sm-2 control-label">
							East Longitude<sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="projectDetailsModel.eastlongitude" disabled="true"
								cssClass="form-control input-sm" />
						</div>


					</div>
	
	<div class="form-group">
						<label for="inputEmail3" class="col-sm-3 control-label">West Latitude<sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="projectDetailsModel.westlatitude" disabled="true"
								cssClass="form-control input-sm" />
						</div>

						<label for="inputEmail3" class="col-sm-2 control-label">
							West Longitude<sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="projectDetailsModel.westlongitude" disabled="true"
								cssClass="form-control input-sm" />
						</div>


					</div>
					
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-3 control-label">South Latitude<sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="projectDetailsModel.southlatitude" disabled="true"
								cssClass="form-control input-sm" />
						</div>

						<label for="inputEmail3" class="col-sm-2 control-label">
							South Longitude<sup>*</sup></label>
						<div class="col-sm-3">
							<form:input path="projectDetailsModel.southlongitude" disabled="true"
								cssClass="form-control input-sm" />
						</div>


					</div>


<c:if test="${projectRegistrationModel.projectDetailsModel.projectStatus=='Ongoing' }">
<div class="inner_wrapper" id="prongonigsts" >
</c:if>	
<c:if test="${projectRegistrationModel.projectDetailsModel.projectStatus!='Ongoing' }">
<div class="inner_wrapper" id="prongonigsts" style="display: none;">
</c:if>	

					<h1>
							Project Ongoing Status <span>Details</span>
						</h1>
                                                                  
						<div class="drop_shadow">  </div>
						
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">Extent of development carried out till date (0% to 99%)<sup>*</sup></label>
							<div class="col-sm-3">

								<form:input type="text" path="projectDetailsModel.devCompletion"
									cssClass="form-control input-sm requiredValFld numericValFld" id="totalAmtClctedFrmAllotee" maxlength="2" title="e.g. Type of Flats/Plots/Villa etc." data-toggle="tooltip" data-placement="bottom"  />
									<span class='requiredValFldMsg'> Please enter Extent of development carried till date.</span>
							</div>

							<label for="inputEmail3" class="col-sm-2 control-label">Extent of development pending (0% to 99%)<sup>*</sup></label>
							<div class="col-sm-3">
								<form:input type="text" path="projectDetailsModel.devPending" rel="txtTooltip" maxlength="2" title="Only digits are allowed." data-toggle="tooltip" data-placement="bottom" 
									cssClass="form-control input-sm numericValFld numericValFld requiredValFld" id="noOfInventory" />
									<span class='requiredValFldMsg'> Please enter Extent of development pending.</span>
							</div>

						</div>
						
						

						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">Total amount of money collected form allottee<sup>*</sup></label>
							<div class="col-sm-3">

								<form:input type="text" path="projectDetailsModel.totalAmtClctedFrmAllotee"
									cssClass="form-control input-sm requiredValFld numericValFld" id="totalAmtClctedFrmAllotee"  title="e.g. Type of Flats/Plots/Villa etc." data-toggle="tooltip" data-placement="bottom"  />
									<span class='requiredValFldMsg'> Please enter Total amount of money collected form allottee.</span>
							</div>

							<label for="inputEmail3" class="col-sm-2 control-label">Total amount of money used for development of project<sup>*</sup></label>
							<div class="col-sm-3">
								<form:input type="text" path="projectDetailsModel.totalAmtUsedInPrjct" rel="txtTooltip" title="Only digits are allowed." data-toggle="tooltip" data-placement="bottom" 
									cssClass="form-control input-sm numericValFld numericValFld requiredValFld" id="noOfInventory" />
									<span class='requiredValFldMsg'> Please enter Total amount of money used for development of project.</span>
							</div>

						</div>


						<div class="form-group">

							<label for="inputEmail3" class="col-sm-3 control-label">Total amount of balance money lying with promoter<sup>*</sup></label>
							<div class="col-sm-3">
								<form:input type="text" path="projectDetailsModel.totalBalAmtOfAlte" cssClass="form-control input-sm   requiredValFld" rel="txtTooltip" title="Only digits are allowed." data-toggle="tooltip" data-placement="bottom" 
									id="carpetArea" />
									<span class='requiredValFldMsg'> Please enter Total amount of balance money lying with promoter.</span>
							</div>

		<label for="inputEmail3" class="col-sm-2 control-label">Is there any subsequent modification in plan<sup>*</sup></label>
					
													<div class="col-sm-3">
							<c:if test="${projectRegistrationModel.projectDetailsModel.isSubSqChangeInPlan=='Yes' }">
								<input type="radio" checked="checked" name="projectDetailsModel.isSubSqChangeInPlan" class="requiredValFld" value="Yes" />Yes &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="radio" name="projectDetailsModel.isSubSqChangeInPlan" class="requiredValFld" value="No" />No
									</c:if>
									<c:if test="${projectRegistrationModel.projectDetailsModel.isSubSqChangeInPlan=='No' }">
								<input type="radio" name="projectDetailsModel.isSubSqChangeInPlan" class="requiredValFld" value="Yes" />Yes &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="radio"  checked="checked"  name="projectDetailsModel.isSubSqChangeInPlan" class="requiredValFld" value="No" />No
									</c:if>
									<span class='requiredValFldMsg'> Please select Any Subsequent Modification in Plan.</span>
							</div>



						</div>

						<div class="form-group">

							<label for="inputEmail3" class="col-sm-3 control-label">Is there project delayed</label>
							<div class="col-sm-3 ">
							<c:if test="${projectRegistrationModel.projectDetailsModel.isDelayed=='Yes' }">
							<input type="radio" name="projectDetailsModel.isDelayed" checked="checked" class=" requiredValFld" value="Yes"  onclick="delayedYesFldChk(this)"/>Yes &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="radio" name="projectDetailsModel.isDelayed" class="requiredValFld" value="No"  onclick="delayedNoFldChk(this)" />No
								
								</c:if><c:if test="${projectRegistrationModel.projectDetailsModel.isDelayed=='No' }">
									<input type="radio" name="projectDetailsModel.isDelayed" class=" requiredValFld" value="Yes"  onclick="delayedYesFldChk(this)"/>Yes &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="radio" name="projectDetailsModel.isDelayed" checked="checked" class="requiredValFld" value="No"  onclick="delayedNoFldChk(this)" />No
						
								
								</c:if>
									<span class='requiredValFldMsg'> Please select Any Subsequent Modification in Plan.</span>
									
							</div>
</div>
		
<c:if test="${projectRegistrationModel.projectDetailsModel.isDelayed=='Yes' }">
<div id="delaysection" >
</c:if>	
<c:if test="${projectRegistrationModel.projectDetailsModel.isDelayed!='Yes' }">
<div id="delaysection" style="display: none;">
</c:if>	


                      <div class="form-group">
						<label for="inputEmail3" class="col-sm-3 control-label">Reason For Delayed<sup>*</sup></label>
						<div class="col-sm-3">
							
                              <form:input path="projectDetailsModel.reasonForDelayed"
									 cssClass="form-control input-sm  requiredValFld" />
									 <span class='requiredValFldMsg'> Please enter reason for delayed.</span>

						</div>
						
						<label for="inputEmail3" class="col-sm-2 control-label">No of Month (Delayed)<sup>*</sup></label>
						<div class="col-sm-3">
							<div class="col-md-12 input-group ">
								<form:input path="projectDetailsModel.noOfMonthDelayed"
									 cssClass="form-control input-sm  requiredValFld" />
									<span class='requiredValFldMsg'> Please enter no. of month delayed.</span>
								

							</div>

						</div>
                         </div>

						<div class="form-group">

							<label for="inputEmail3" class="col-sm-3 control-label">Expected Completion Date<sup>*</sup></label>
							<div class="col-sm-3">
								<form:input type="text" path="projectDetailsModel.estimatedEndDate" readonly="readonly" cssClass="form-control input-sm  augCalCssClass requiredValFld" />
								<span class="glyphicon glyphicon-calendar augCalImgCssClass"></span>
									<span class='requiredValFldMsg'> Please enter Total amount of balance maney lying with promoter.</span>
							</div>
							<label for="inputEmail3" class="col-sm-2 control-label">Certificate form Architect,Engineer,CA etc.<sup>*</sup></label>
							<div class="col-sm-3">
								    <input type="file" name="delayedCert" class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom" />
									 <a href="download?DOC_ID=${projectRegistrationModel.projectDetailsModel.delayedCertDoc.documentId}">${projectRegistrationModel.projectDetailsModel.delayedCertDoc.fileName }</a>
									<span class='requiredValFldMsg'> Please select Certificate.</span>
							</div>

						</div>		
						
						
					
						
						
									
						
	</div>					
						
						

					</div>

	
	





										
					
		          <!-- PROJECT DETAILS END -->
		          					<br>


					<div class="inner_wrapper">



						<h1>
							Development <span>Details</span>
						</h1>
						<% int dd=0;%>
						<c:forEach items="${developmentSet}" var="obj">
<% if(dd==0){%>
	<div id="dev_work-dv" class='addmoredv'>
	<%}else{ %>
	<div  class='addmoredv'>
	<%} dd++; %>
						<div class="drop_shadow">  </div>
						
						

								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">Type
										of Inventory<sup>*</sup></label>
									<div class="col-sm-3">
										<input type="hidden" name="devId" id="devId"
											value="${obj.devId}" />
											 <input type="text"
											name="typeOfInventory" disabled="disabled" class="form-control input-sm"
											id="typeOfInventory" value="${obj.typeOfInventory}" />
									</div>

									<label for="inputEmail3" class="col-sm-2 control-label">No
										of Inventory<sup>*</sup></label>
									<div class="col-sm-3">
										<input type="text" name=noOfInventory disabled="disabled"
											class="form-control input-sm" id="noOfInventory"
											value="${obj.noOfInventory}" />
									</div>
								</div>


								<div class="form-group">

									<label for="inputEmail3" class="col-sm-3 control-label">Carpet
										Area (Sq Mtr)<sup>*</sup></label>
									<div class="col-sm-3">
										<input type="text" name=carpetArea disabled="disabled"
										
											class="form-control input-sm" id="carpetArea"
											value="${obj.carpetArea}" />
									</div>


									<label for="inputEmail3" class="col-sm-2 control-label">Area
										of exclusive balcony/verandah (Sq Mtr)<sup>*</sup></label>
									<div class="col-sm-3">
										<input type="text" disabled="disabled" name=areaOfExclusive 
											class="form-control input-sm" id="areaOfExclusive"
											value="${obj.areaOfExclusive}" />
									</div>



								</div>

								<div class="form-group">

									<label for="inputEmail3" class="col-sm-3 control-label">Area
										of exclusive open terrace if any (Sq Mtr)</label>
									<div class="col-sm-3 ">
										<input type="text" disabled="disabled" name=areaOfExclusiveOpenTerrace 
											class="form-control input-sm" id="areaOfExclusiveOpenTerrace"
											value="${obj.areaOfExclusiveOpenTerrace}" />
									</div>

								</div>

								</div>
						

						</c:forEach>

	





					</div>


						

					<div class="inner_wrapper">



						<h1>
							External Development <span>Work</span>
						</h1>

						<div class="drop_shadow"></div>

						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">Road System<sup>*</sup></label>
							<div class="col-sm-3">
								<form:select path="externalDevelopmentWorkModel.roadSysetmDevBy" disabled="true"
									class="form-control">
									<form:option value="0" label="Select" />
									<form:option value="Local Authority" label="Local Authority" />
									<form:option value="Self Development" label="Self Development" />

								</form:select>


							</div>

							<label for="inputEmail3" class="col-sm-2 control-label">Water
								Supply<sup>*</sup></label>
							<div class="col-sm-3">
								<form:select path="externalDevelopmentWorkModel.waterSupplyBy" disabled="true"
									class="form-control">
									<form:option value="0" label="Select" />
									<form:option value="Local Authority" label="Local Authority" />
									<form:option value="Self Development" label="Self Development" />

								</form:select>
							</div>
						</div>


						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">Sewege
								and Drainage System<sup>*</sup></label>
							<div class="col-sm-3">
								<form:select
									path="externalDevelopmentWorkModel.sewegeAndDrainageSystemDevBy" disabled="true"
									class="form-control">
									<form:option value="0" label="Select" />
									<form:option value="Local Authority" label="Local Authority" />
									<form:option value="Self Development" label="Self Development" />

								</form:select>
							</div>

							<label for="inputEmail3" class="col-sm-2 control-label">Electricity
								Supply Transfomer And Sub Station<sup>*</sup></label>
							<div class="col-sm-3">
								<form:select
									path="externalDevelopmentWorkModel.electricityAndTrasfomerSupply" disabled="true"
									class="form-control">
									<form:option value="0" label="Select" />
									<form:option value="Local Authority" label="Local Authority" />
									<form:option value="Self Development" label="Self Development" />

								</form:select>
							</div>
						</div>

						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">Solid
								Waste Management And Disposal</label>
							<div class="col-sm-3">
								<form:select
									path="externalDevelopmentWorkModel.solidWasteSupplyBy" disabled="true"
									class="form-control">
									<form:option value="0" label="Select" />
									<form:option value="Local Authority" label="Local Authority" />
									<form:option value="Self Development" label="Self Development" />

								</form:select>
							</div>


						</div>
                       


<!--  Added 4 new fields  -->
						
										
				<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">Fire Fighting facility
								<sup>*</sup></label>
							<div class="col-sm-3">
								<form:select
									path="externalDevelopmentWorkModel.fireFighting"
									class="form-control requiredValFld">
									<form:option value="0" label="Select" />
									<form:option value="Local Authority" label="Local Authority" />
									<form:option value="Self Development" label="Self Development" />
								</form:select>
								<span class='requiredValFldMsg'> Please select Fire Fighting facility.</span>
							</div>

							<label for="inputEmail3" class="col-sm-2 control-label">Drinking Water Facility<sup>*</sup></label>
							<div class="col-sm-3">
								<form:select
									path="externalDevelopmentWorkModel.drinkingWater"
									class="form-control requiredValFld">
									<form:option value="0" label="Select" />
									<form:option value="Local Authority" label="Local Authority" />
									<form:option value="Self Development" label="Self Development" />

								</form:select>
								<span class='requiredValFldMsg'> Please select Drinking Water Facility.</span>
							</div>
						</div>
												<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">Emergency Evacuation Services<sup>*</sup></label>
							<div class="col-sm-3">
								<form:select
									path="externalDevelopmentWorkModel.emergencyEvacuation"
									class="form-control requiredValFld">
									<form:option value="0" label="Select" />
									<form:option value="Local Authority" label="Local Authority" />
									<form:option value="Self Development" label="Self Development" />
								</form:select>
								<span class='requiredValFldMsg'> Please select Emergency evacuation services.</span>
							</div>

							<label for="inputEmail3" class="col-sm-2 control-label">Use of Renewable Energy<sup>*</sup></label>
							<div class="col-sm-3">
								<form:select
									path="externalDevelopmentWorkModel.renewableEnergy"
									class="form-control requiredValFld">
									<form:option value="0" label="Select" />
									<form:option value="Local Authority" label="Local Authority" />
									<form:option value="Self Development" label="Self Development" />

								</form:select>
								<span class='requiredValFldMsg'> Please select Use of renewable energy.</span>
							</div>
						</div>



						<label for="inputEmail3" class="col-sm-3 control-label">
							Other External Development Works</label>
					
							
						

                    <!-- loop -->
                    <%  xx=0; %>
						<c:forEach items="${extOtherDevSet}" var="obj">
						<%if(xx>0){ %>
							<DIV  class="addmoredv">
							<%}else{ %>
								<DIV ID="other_dev_work-dv" class="addmoredv">
							<%}
						   xx++;%>
							<div class="drop_shadow">
								
						   </div>
						
						<input type="hidden" name="extOtherDevId" value="${obj.extOtherDevId}"/>
						
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-3 control-label">Work
									Description</label>
								<div class="col-sm-3">
									<input type="text" name="extDevWorkDesc" disabled="disabled" class="form-control" value="${obj.workDesc}"/>
	        
								</div>
								  
							



								<div class="col-sm-3">
									<select name="developeBy" disabled="disabled" class="form-control">
										<option value="0">Select</option>
										<c:choose>
											<c:when test="${obj.developeBy == 'Local Authority'}">
												<option value="Local Authority" selected="selected">Local Authority</option>
												<option value="Self Development">Self Development</option>
											</c:when>
											<c:otherwise>
												<option value="Local Authority">Local Authority</option>
												<option value="Self Development" selected="selected">Self Development</option>

											</c:otherwise>
										</c:choose>

									</select>

								</div>
                            

							</div>
							</div>
							</c:forEach>
					





					</div>


					<br>


					<div class="inner_wrapper">



						<h1>
							Project Bank <span>Details</span>
						</h1>

						<div class="drop_shadow"></div>

						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">Bank
								Name<sup>*</sup></label>
							<div class="col-sm-3">
							
								<select  name="projectBankId" class="form-control" disabled="disabled">
								   
						         <option value='0'> --Select-- </option>
						          <c:forEach  items="${bankList}" var="b">
						              <c:choose>
						                <c:when test="${b.bankId==projectRegistrationModel.projectBankDetailsModel.bankModel.bankId}">
						                 <option value='${b.bankId }' selected="selected"> ${b.bankName} </option>
						                </c:when>
						                  <c:otherwise>
						                    <option value='${b.bankId}'> ${b.bankName } </option>
						                </c:otherwise>
						
						
						
						                  </c:choose>
						           </c:forEach>
						         
						         
						       
								</select>	
								
							</div>

							<label for="inputEmail3" class="col-sm-2 control-label">Branch
								Name<sup>*</sup></label>
							<div class="col-sm-3">
								<form:input path="projectBankDetailsModel.bankBranch" disabled="true"
									cssClass="form-control input-sm" />
							</div>
						</div>



						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">Account
								No.<sup>*</sup></label>
							<div class="col-sm-3">
								<form:input path="projectBankDetailsModel.accountNumber" disabled="true"
									cssClass="form-control input-sm" maxlength="17"/>
							</div>

							<label for="inputEmail3" class="col-sm-2 control-label">IFSC
								Code<sup>*</sup></label>
							<div class="col-sm-3">
								<form:input path="projectBankDetailsModel.ifscCode" disabled="true"
									cssClass="form-control input-sm" />
							</div>
						</div>


						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">State/UT<sup>*</sup></label>
							<div class="col-sm-3">
								<select
									name="bankStateUtId" disabled="disabled"
									class="form-control">
									

                                      <c:forEach  items="${stateUtList}" var="st">
						              <c:choose>
						                <c:when test="${st.stateUtId==projectRegistrationModel.projectBankDetailsModel.districtModel.stateUtModel.stateUtId}">
						                 <option value='${st.stateUtId }' selected="selected"> ${st.stateUtName} </option>
						                </c:when>
						                  <c:otherwise>
						               <option value='${st.stateUtId}'> ${st.stateUtName}  </option>
						                </c:otherwise>
						
						
						
						                  </c:choose>
						           </c:forEach>
						
						        
								</select>
								
								
								
								
								

							</div>

							<label for="inputEmail3" class="col-sm-2 control-label">District<sup>*</sup></label>
							<div class="col-sm-3">
								<select
									name="bankDistrictId" disabled="disabled"
									class="form-control">
									<option value="0" > --Select-- </option>
									

                          <c:forEach  items="${projectRegistrationModel.projectBankDetailsModel.districtModel.stateUtModel.districtModelSet}" var="dst">	
								
								<c:choose>
						<c:when test="${dst.districtId==projectRegistrationModel.projectBankDetailsModel.districtModel.districtId}">
						<option value='${dst.districtId }' selected="selected"> ${dst.districtName } </option>
						</c:when>
						<c:otherwise>
						<option value='${dst.districtId }'> ${dst.districtName } </option>
						</c:otherwise>
						
						
						
						</c:choose>
								
							
							</c:forEach>			
							


								</select>

							</div>
						</div>
					</div>



					<!-- Agent start -->

					<div class="inner_wrapper">
						<h1>
							Associated Vendor <span>Details</span>
						</h1>

						<div class="inner_wrapper">
							<h1>
								Project <span>Agent</span>
							</h1>

<c:choose>
<c:when test="${agentStatus=='NO'}">


							<div id='project-agent-dv' class='addmoredv'>

								<div class="drop_shadow">
									
								</div>

								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">Agent Registration No.</label>
									<div class="col-sm-3">
										<div class="col-md-12 input-group">
											<input type="text" id="fldnogetagent" disabled="disabled" name="agentRegNo" class="form-control  dynaselectfld" >
												 <label class="input-group-addon btn"
												    for="testdate" >
												
												 <span id='getagent' class="glyphicon glyphicon-search dynaselectfld" onclick="getAgentDetails(this)"> </span>
											</label>
										</div>
									</div>

                                    <label for="inputEmail3" id='resultgetagent' class="col-sm-2 control-label dynaselectfld"> </label>
									<div class="col-sm-3">
									</div>
								</div>



								<div class="form-group">


									<label for="inputEmail3" class="col-sm-3 control-label">Agent
										Name</label>
									<div class="col-sm-3">
										<input class="form-control input-sm dynaselectfld"  id='fldnamenogetagent' disabled name="agentName" />
									</div>

									<label for="inputEmail3" class="col-sm-2 control-label dynaselectfld">
										Agent Address</label>
									<div class="col-sm-3">
										<input class="form-control input-sm dynaselectfld" id='fldaddressnogetagent' disabled name="agentAddress" />
									</div>


								</div>

							</div>



</c:when>
<c:otherwise>

                  <% int agnt=0; %>
                  <c:forEach items="${ agentSet}" var="agent">
                  <%if(agnt==0){ %>

							<div id='project-agent-dv' class='addmoredv'>
<%}else{ %>
<div class='addmoredv'>

<%} agnt++; %>

								<div class="drop_shadow">
									
								</div>

								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">Agent
										Registration No.</label>
									<div class="col-sm-3">
										<div class="col-md-12 input-group">
											<input type="text" id="" name="agentRegNo" disabled="disabled" class="form-control"	value="${agent.agent.agentRegistrationNo }"> 
												<label class="input-group-addon btn"
												for="testdate" onclick="getAgentDetails();">
												 <span	class="glyphicon glyphicon-search dynaselectfld" id='getagent<%=agnt %>'  onclick="getAgentDetails(this)"></span>
											</label>
										</div>
									</div>
									
									  <label for="inputEmail3" id='resultgetagent<%=agnt %>' class="col-sm-2 control-label dynaselectfld"> </label>


								</div>



								
								<div class="form-group">


									<label for="inputEmail3" class="col-sm-3 control-label">Agent
										Name</label>
									<div class="col-sm-3">
										<input class="form-control input-sm dynaselectfld"  id='fldnamenogetagent<%=agnt %>' disabled name="agentName" />
									</div>

									<label for="inputEmail3" class="col-sm-2 control-label dynaselectfld">
										Agent Address</label>
									<div class="col-sm-3">
										<input class="form-control input-sm dynaselectfld" id='fldaddressnogetagent<%=agnt %>' disabled name="agentAddress" />
									</div>


								</div>

							</div>
					</c:forEach>
					</c:otherwise>
					</c:choose>
										
						</div>
						<!-- agent end -->

						<br>




						<!--Project  Architects start-->

						<div class="inner_wrapper">
							<h1>
								Project <span>Architects${arcSet}</span>
							</h1>


							 <% int xx10=0; %>
						         <c:forEach items="${architectSet}" var="obj">
						       
							
						        <%if(xx10>0){ %>
							    <DIV  class="addmoredv">
							       <%}else{ %>
								      <DIV ID="projectArc-dv" class="addmoredv">
							      <%}
						           xx10++;%>
						           
							    <div class="drop_shadow">
								   
						       </div>

								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">
										Architect Name<sup>*</sup></label>
									<div class="col-sm-3">
										<input class="form-control input-sm" type="text"
											name="architectName" disabled="disabled" value="${obj.architectName}"/>
											  <input  type="hidden" name="projectArchId"  value="${obj.projectArchId}"/>
                                           
									</div>

									<label for="inputEmail3" class="col-sm-2 control-label">
										 Email ID<sup>*</sup></label>
									<div class="col-sm-3">
										<input class="form-control input-sm" disabled="disabled" name="arctEmailId" 
											 value='${obj.emailId}' />
									</div>



								</div>


							 <div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">Addrees Line 1<sup>*</sup>
									 </label>
									<div class="col-sm-3">
										<input class="form-control input-sm" name="arctAddressLine1" disabled="disabled"
											id="arctAddressLine1" value="${obj.addressLine1}" />
									</div>

									<label for="inputEmail3" class="col-sm-2 control-label">
										Address Line 2<sup>*</sup></label>
									<div class="col-sm-3">
										<input class="form-control input-sm" name="arctAddressLine2" disabled="disabled"
											id="arctAddressLine2" value="${obj.addressLine2}"/>
									</div>

								</div>
								
								
								
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">State<sup>*</sup>
									 </label>
									<div class="col-sm-3">
										
					          <select name="arctStateUtId" id="arctSate <%=xx10 %>"  onchange="reloadChildDropdown(this)" disabled="disabled" class="form-control dynaselectfld">
						      <option value='0'> --Select-- </option>
						         <c:forEach  items="${stateUtList}" var="st">
						              <c:choose>
						                <c:when test="${st.stateUtId==obj.districtModel.stateUtModel.stateUtId}">
						                 <option value='${st.stateUtId }' selected="selected"> ${st.stateUtName} </option>
						                </c:when>
						                  <c:otherwise>
						                  <option value='${st.stateUtId}'> ${st.stateUtName} </option>
						                </c:otherwise>
						
						
						
						                  </c:choose>
						           </c:forEach>
						       </select>
											
									</div>

									<label for="inputEmail3" class="col-sm-2 control-label">
										District<sup>*</sup></label>
									<div class="col-sm-3">
								
								  <select class="form-control dynaselectfld" name="arctProjDistrictId"  id="District-arctSate<%=xx10 %>" disabled="disabled" >
										<option value="0"> --Select-- </option>
									<option selected="selected" value="${obj.districtModel.districtId}"> ${obj.districtModel.districtName} </option>
									
																		
								</select>
											
									</div>

								</div>
								
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">Pin Code<sup>*</sup>
									 </label>
									<div class="col-sm-3">
										<input class="form-control input-sm" name="arctPineCode" disabled="disabled"
											id="arctPineCode" value='${obj.pinCode}'/>
									</div>

									<label for="inputEmail3" class="col-sm-2 control-label">
										Year
										of establishment<sup>*</sup></label>
									<div class="col-sm-3">
										<input class="form-control input-sm" name="arctYearOfEst" disabled="disabled"
											id="arctYearOfEst" value='${obj.yearOfEstablishment}'/>
									</div>

								</div>
								


								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">Key Projects completed<sup>*</sup></label>
									<div class="col-sm-3">
										<input class="form-control input-sm"
											name="arctKeyProjectCompleted" id="arctKeyProjectCompleted" disabled="disabled" value='${obj.keyProject}' />
									</div>

									<label for="inputEmail3" class="col-sm-2 control-label">
										</label>
									<div class="col-sm-3">
										
									</div>

								</div>
								
								
								

                              </DIV>

						    
							  </c:forEach>
						
						
	                

						
						                    
					</div>
						

						<!--Project  Architects end-->

						<br>



						<!--Structural Engineers start -->

						<div class="inner_wrapper">
							<h1>
								Structural <span>Engineers</span>
							</h1>
							 
							<% int xx2=0; %>
						         <c:forEach items="${stcEngSet}" var="obj">
							
						        <%if(xx2>0){ %>
							    <DIV  class="addmoredv">
							       <%}else{ %>
								      <DIV ID="structuralEng-dv" class="addmoredv">
							      <%}
						           xx2++;%>
							
								<div class="drop_shadow">
									
								</div>

								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">
										Engineer Name<sup>*</sup></label>
									<div class="col-sm-3">
										<input class="form-control input-sm" name="engineerName" disabled="disabled"  value="${obj.engineerName}"
											id="engineerName" />
											<input type="hidden" name="strcStcEngId" value="${obj.projStcEngId}"/>
									</div>

									<label for="inputEmail3" class="col-sm-2 control-label">
								 Email ID<sup>*</sup></label>
								<div class="col-sm-3">
									<input class="form-control input-sm" id="strcEmailId"  name="strcEmailId" disabled="disabled"
										value='${obj.emailId}' />
								</div>



							</div>

                             <div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">Addrees Line 1<sup>*</sup>
									 </label>
									<div class="col-sm-3">
										<input class="form-control input-sm" name="strcAddressLine1" disabled="disabled"
											id="strcAddressLine1" value='${obj.addressLine1}'/>
									</div>

									<label for="inputEmail3" class="col-sm-2 control-label">
										Address Line 2<sup>*</sup></label>
									<div class="col-sm-3">
										<input class="form-control input-sm" name="strcAddressLine2" disabled="disabled"
											id="strcAddressLine2" value='${obj.addressLine2}' />
									</div>

								</div>
								
								
								
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">State<sup>*</sup>
									 </label>
									<div class="col-sm-3">
										
					          <select name="strcStateUtId" id="strcSate<%=xx2 %>"  onchange="reloadChildDropdown(this)" disabled="disabled" class="form-control dynaselectfld">
						      <option value='0'> --Select-- </option>
						          <c:forEach  items="${stateUtList}" var="st">
						              <c:choose>
						                <c:when test="${st.stateUtId==obj.districtModel.stateUtModel.stateUtId}">
						                 <option value='${st.stateUtId }' selected="selected"> ${st.stateUtName} </option>
						                </c:when>
						                  <c:otherwise>
						                  <option value='${st.stateUtId}'> ${st.stateUtName} </option>
						                </c:otherwise>
						
						
						
						                  </c:choose>
						           </c:forEach>
						       </select>
											
									</div>

									<label for="inputEmail3" class="col-sm-2 control-label">
										District<sup>*</sup></label>
									<div class="col-sm-3">
								
								  <select class="form-control dynaselectfld" name="strcProjDistrictId"  id="District-strcSate<%=xx2 %>" >
										<option value="0"> --Select-- </option>
									<option selected="selected" disabled="disabled" value="${obj.districtModel.districtId}"> ${obj.districtModel.districtName} </option>
																		
								</select>
											
									</div>

								</div>
								
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">Pin Code<sup>*</sup>
									 </label>
									<div class="col-sm-3">
										<input class="form-control input-sm" disabled="disabled" name="strcPineCode"
										
											id="strcPineCode" value="${obj.pinCode}" />
									</div>

									<label for="inputEmail3" class="col-sm-2 control-label">
										Year
										of establishment<sup>*</sup></label>
									<div class="col-sm-3">
										<input class="form-control input-sm" name="strcYearOfEst" disabled="disabled"
											id="strcYearOfEst" value="${obj.yearOfEstablishment}" />
									</div>

								</div>
								


								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">Key projects completed<sup>*</sup></label>
									<div class="col-sm-3">
										<input class="form-control input-sm" disabled="disabled"
											name="strcKeyProjectCompleted" id="strcKeyProjectCompleted" value="${obj.keyProject}" />
									</div>

									<label for="inputEmail3" class="col-sm-2 control-label">
										</label>
									<div class="col-sm-3">
										
									</div>

								</div>
								

							</DIV>
							</c:forEach>
							
							
					  </div>
                        
						

                       </div>
						<!--Structural Engineers end -->
						<br>


						<!--Project  Contractors -->

						<div class="inner_wrapper">
							<h1>
								Project <span>Contractors</span>
							</h1>

                              <% int xx3=0; %>
						         <c:forEach items="${projContratorSet}" var="obj">
							     
											
						        <%if(xx3>0){ %>
							    <DIV  class="addmoredv">
							       <%}else{ %>
								      <DIV ID="projectContractors-dv" class="addmoredv">
							      <%}
						           xx3++;%>


						
                                 <div class="drop_shadow">
 									
								</div>




								<div class="form-group">


									<label for="inputEmail3" class="col-sm-3 control-label">Contractor Name<sup>*</sup></label>
									<div class="col-sm-3">
									   <input type="hidden" name="projectCntrId" value="${obj.projectCntrId}"/> 
										<input class="form-control input-sm" name="contractorName" disabled="disabled"
											 value="${obj.contractorName}" />
											 
									</div>

	                            <label for="inputEmail3" class="col-sm-2 control-label">
								 Email ID<sup>*</sup></label>
								<div class="col-sm-3">
									<input class="form-control input-sm"  id="cntrEmailId" disabled="disabled" name="cntrEmailId" value="${obj.emailId}"
										 />
								</div>



							</div>

                             <div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">Addrees Line 1<sup>*</sup>
									 </label>
									<div class="col-sm-3">
										<input class="form-control input-sm" name="cntrAddressLine1" disabled="disabled"
											id="cntrAddressLine1" value="${obj.addressLine1}"/>
									</div>

									<label for="inputEmail3" class="col-sm-2 control-label">
										Address Line 2<sup>*</sup></label>
									<div class="col-sm-3">
										<input class="form-control input-sm" name="cntrAddressLine2" disabled="disabled"
											id="cntrAddressLine2" value="${obj.addressLine2}"/>
									</div>

								</div>
								
								
								
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">State<sup>*</sup>
									 </label>
									<div class="col-sm-3">
										
					          <select name="cntrStateUtId" id="cntrSate<%=xx3 %>" disabled="disabled" onchange="reloadChildDropdown(this)" class="form-control dynaselectfld">
						      <option value='0'> --Select-- </option>
						        <c:forEach  items="${stateUtList}" var="st">
						              <c:choose>
						                <c:when test="${st.stateUtId==obj.districtModel.stateUtModel.stateUtId}">
						                 <option value='${st.stateUtId }' selected="selected"> ${st.stateUtName} </option>
						                </c:when>
						                  <c:otherwise>
						                  <option value='${st.stateUtId}'> ${st.stateUtName} </option>
						                </c:otherwise>
						
						
						
						                  </c:choose>
						           </c:forEach>
						       </select>
											
									</div>

									<label for="inputEmail3" class="col-sm-2 control-label">
										District<sup>*</sup></label>
									<div class="col-sm-3">
								
								  <select class="form-control dynaselectfld" name="cntrProjDistrictId" disabled="disabled" id="District-cntrSate<%=xx3 %>" >
								  <option value="0"> --Select-- </option>
									<option selected="selected" value="${obj.districtModel.districtId}"> ${obj.districtModel.districtName} </option>
																		
								</select>
											
									</div>

								</div>
								
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">Pin Code<sup>*</sup>
									 </label>
									<div class="col-sm-3">
										<input class="form-control input-sm" name="cntrPineCode" disabled="disabled"
											id="cntrPineCode" value="${obj.pinCode}"/>
									</div>

									<label for="inputEmail3" class="col-sm-2 control-label">
										Year
										of establishment<sup>*</sup></label>
									<div class="col-sm-3">
										<input class="form-control input-sm" name="cntrYearOfEst" disabled="disabled"
											id="cntrYearOfEst" value="${obj.yearOfEstablishment}"/>
									</div>

								</div>
								


								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">Key Projects completed<sup>*</sup></label>
									<div class="col-sm-3">
										<input class="form-control input-sm" name="cntrKeyProjectCompleted" disabled="disabled" id="cntrKeyProjectCompleted"  value="${obj.keyProject}" />
									</div>

									<label for="inputEmail3" class="col-sm-2 control-label">
										</label>
									<div class="col-sm-3">
										
									</div>

								</div>


							  </DIV>
							 </c:forEach>
						
					
						</div>
						
						<!--Project  Contractors end-->


					
                 			</div>




		<!-- PROJECT DOCUMENT DETAILS START  -->
		
     
     	
		
		<div class="inner_wrapper upload">



				<h1>
					Upload <span> Documents</span>
				</h1>
				<div class="border">
					<div class="orange"></div>
					<div class="black"></div>
				</div>
                   <form:hidden path="projectDocModel.docId"/>
				      <form:hidden path="projectDetailsModel.projectDetailsId"/>
					        <form:hidden path="projectBankDetailsModel.projectBankDelsId"/>
					        <form:hidden path="externalDevelopmentWorkModel.extDevId"/>
					         <form:hidden path="projectRegId"/>
					         
                     <input type="hidden" name="projectDocModel.docId" value="0"/>
                     <br/>
					<div class="drop_shadow">
						
						</div>
                  					<table class="table table-responsive table-bordered"> 
					     <tr>
					        <th>Year</th>
					        <th><%=DateUtil.getYearBack(1) %></th>
					        <th><%=DateUtil.getYearBack(2) %></th>
					        <th><%=DateUtil.getYearBack(3) %></th>
					        
					       
					     </tr>
					  <tr>
					  
					     <td>Balance Sheet</td>
					     <td>
					     <input type="file"   id="auditedBalFile" name="otherFileDoc"  disabled="disabled" class="form-control" />
					     
					     <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.auditedBalSheetDoc1.documentId}">${projectRegistrationModel.projectDocModel.auditedBalSheetDoc1.fileName}
							</a>
							<input type="hidden" name="fieldName" value="auditedBalSheetDoc1"/>
							
					     </td>
					     <td><input type="file"  id="auditedBalFile" name="otherFileDoc"  disabled="disabled" class="form-control" />
					         <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.auditedBalSheetDoc2.documentId}">
					         ${projectRegistrationModel.projectDocModel.auditedBalSheetDoc2.fileName}
							</a>
					
							<input type="hidden" name="fieldName" value="auditedBalSheetDoc2"/>
							</td>
					     <td><input type="file"  id="auditedBalFile" name="otherFileDoc" disabled="disabled" class="form-control" />
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.auditedBalSheetDoc3.documentId}">
					         ${projectRegistrationModel.projectDocModel.auditedBalSheetDoc3.fileName}
							</a>
							<input type="hidden" name="fieldName" value="auditedBalSheetDoc3"/>
							</td>
					     
					    
					  </tr>
					  
					  <tr>
					    <td>Audited ProfitLoss Statement</td>
					      
					     <td>
					     <input type="file"  id="auditedBalFile" name="otherFileDoc" disabled="disabled" class="form-control" />
							<input type="hidden" name="fieldName" value="auditedProfitLossSheetDoc1"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.auditedProfitLossSheetDoc1.documentId}">
					         ${projectRegistrationModel.projectDocModel.auditedProfitLossSheetDoc1.fileName}
							</a>
							
					     </td>
					     <td><input type="file"  id="auditedBalFile" name="otherFileDoc" disabled="disabled" class="form-control" />
							<input type="hidden" name="fieldName" value="auditedProfitLossSheetDoc2"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.auditedProfitLossSheetDoc2.documentId}">
					         ${projectRegistrationModel.projectDocModel.auditedProfitLossSheetDoc2.fileName}
							</a>
							</td>
					     <td><input type="file"  id="auditedBalFile" name="otherFileDoc" disabled="disabled" class="form-control" />
							<input type="hidden" name="fieldName" value="auditedProfitLossSheetDoc3"/>
								 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.auditedProfitLossSheetDoc3.documentId}">
					         ${projectRegistrationModel.projectDocModel.auditedProfitLossSheetDoc3.fileName}
							</a>
							</td>
					  
					  </tr>
					  
					  
					   <tr>
					    <td>Director's Report</td>
					      
					     <td>
					     <input type="file"   id="auditedBalFile" name="otherFileDoc" disabled="disabled" class="form-control" />
							<input type="hidden" name="fieldName" value="directorReportDoc1"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.directorReportDoc1.documentId}">
					         ${projectRegistrationModel.projectDocModel.directorReportDoc1.fileName}
							</a>
							
					     </td>
					     <td><input type="file"  id="auditedBalFile" name="otherFileDoc" disabled="disabled" class="form-control" />
							<input type="hidden" name="fieldName" value="directorReportDoc2"/>
								 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.directorReportDoc2.documentId}">
					         ${projectRegistrationModel.projectDocModel.directorReportDoc2.fileName}
							</a>
							</td>
					     <td><input type="file"  id="auditedBalFile" name="otherFileDoc" disabled="disabled" class="form-control" />
							<input type="hidden" name="fieldName" value="directorReportDoc3"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.directorReportDoc3.documentId}">
					         ${projectRegistrationModel.projectDocModel.directorReportDoc3.fileName}
							</a>
							</td>
					  
					  </tr>
					  
					  
					  
					  
					  
					  <tr>
					    <td>Cash Flow Statement </td>
					      
					     <td>
					     <input type="file"   id="auditedBalFile" name="otherFileDoc" disabled="disabled" class="form-control" />
							<input type="hidden" name="fieldName" value="cashFlowStmtFileDoc1"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.cashFlowStmtFileDoc1.documentId}">
					         ${projectRegistrationModel.projectDocModel.cashFlowStmtFileDoc1.fileName}
							</a>
							
					     </td>
					     <td><input type="file"  id="auditedBalFile" name="otherFileDoc" disabled="disabled" class="form-control" />
							<input type="hidden" name="fieldName" value="cashFlowStmtFileDoc2"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.cashFlowStmtFileDoc2.documentId}">
					         ${projectRegistrationModel.projectDocModel.cashFlowStmtFileDoc2.fileName}
							</a>
							</td>
					     <td><input type="file"  id="auditedBalFile" name="otherFileDoc" disabled="disabled" class="form-control" />
							<input type="hidden" name="fieldName" value="cashFlowStmtFileDoc3"/>
								 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.cashFlowStmtFileDoc2.documentId}">
					         ${projectRegistrationModel.projectDocModel.cashFlowStmtFileDoc3.fileName}
							</a>
							</td>
					  
					  </tr>
					  					  
					   <tr>
					    <td>Auditor's Report<sup style="color:red;">*</sup> </td>
					      
					     <td>
					     <input type="file" disabled="disabled" class="form-control requiredValFld"   id="auditedBalFile" name="otherFileDoc" />
							<span class='requiredValFldMsg'> Please select Auditor Reports.</span>
							<input type="hidden" name="fieldName" value="auditorsDoc1"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.auditorsDoc1.documentId}">
					         ${projectRegistrationModel.projectDocModel.auditorsDoc1.fileName}
							</a>
					
					     </td>
					     <td><input type="file" disabled="disabled" class="form-control requiredValFld"  id="auditedBalFile" name="otherFileDoc" />
							<span class='requiredValFldMsg'> Please select Auditor Reports.</span>
							<input type="hidden" name="fieldName" value="auditorsDoc2"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.auditorsDoc2.documentId}">
					         ${projectRegistrationModel.projectDocModel.auditorsDoc2.fileName}
							</a>
					
							</td>
					     <td><input type="file" disabled="disabled" class="form-control requiredValFld"  id="auditedBalFile" name="otherFileDoc" />
							<span class='requiredValFldMsg'> Please select Auditor Reports.</span>
							<input type="hidden" name="fieldName" value="auditorsDoc3"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.auditorsDoc3.documentId}">
					         ${projectRegistrationModel.projectDocModel.auditorsDoc3.fileName}
							</a>
					
							</td>
					  
					  </tr>
					    
					  <tr>
					    <td>Income Tax Return Acknowledgement<sup style="color:red;">*</sup> </td>
					      
					     <td>
					     <input type="file" disabled="disabled" class="form-control requiredValFld"  id="auditedBalFile" name="otherFileDoc" />
							<span class='requiredValFldMsg'> Please select Income Tax Return Acknowledgement.</span>
							<input type="hidden" name="fieldName" value="incomeTaxReturn1"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.incomeTaxReturn1.documentId}">
					         ${projectRegistrationModel.projectDocModel.incomeTaxReturn1.fileName}
							</a>
					
							
					     </td>
					     <td><input type="file" disabled="disabled" class="form-control requiredValFld" id="auditedBalFile" name="otherFileDoc" />
							<span class='requiredValFldMsg'> Please select Income tax Return Acknowledgement.</span>
							<input type="hidden" name="fieldName" value="incomeTaxReturn2"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.incomeTaxReturn2.documentId}">
					         ${projectRegistrationModel.projectDocModel.incomeTaxReturn2.fileName}
							</a>
					
							</td>
					     <td><input type="file" disabled="disabled" class="form-control requiredValFld"  id="auditedBalFile" name="otherFileDoc" />
							<span class='requiredValFldMsg'> Please select Income tax Return Acknowledgement.</span>
							<input type="hidden" name="fieldName" value="incomeTaxReturn3"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.incomeTaxReturn3.documentId}">
					         ${projectRegistrationModel.projectDocModel.incomeTaxReturn3.fileName}
							</a>
					
							</td>
					  
					  </tr>
					  
					  
					</table>
					
					<br/><br/><br/>
					<div class="drop_shadow">
						
						</div>
					   
					<div class="form-group">
						<label class="col-sm-3 control-label">PAN Card<sup>*</sup></label>
						<div class="col-sm-3">
							<input type="file"   id="panCardFile" name="otherFileDoc" disabled="disabled" class="form-control" />
							<input type="hidden" name="fieldName" value="panCardDoc"/>
							<input type="hidden" name="flg"value="0"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.panCardDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.panCardDoc.fileName}
							</a>
			
						</div>
						
						<label for="inputEmail3" class="col-sm-2 control-label"> Encumbrance Certificate
							</label>
						<div class="col-sm-3">
						<input type="file"   id="panCardFile" name="otherFileDoc" disabled="disabled" class="form-control" />
							<input type="hidden" name="fieldName" value="encumbranceCertificateDoc"/>
							<input type="hidden" name="flg"value="0"/>
						 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.encumbranceCertificateDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.encumbranceCertificateDoc.fileName}
							</a>
						
					    </div>


					</div>
					
					
					

					<div class="form-group">
						<label class="col-sm-3 control-label">Commencement
							Certificate<sup>*</sup></label>
						<div class="col-sm-3">
							<input type="file"   id="commencementCertFile" name="otherFileDoc" disabled="disabled" class="form-control" />
							<input type="hidden" name="fieldName" value="commencementCertDoc"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.commencementCertDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.commencementCertDoc.fileName}
							</a>
						</div>
						<label for="inputEmail3" class="col-sm-2 control-label">Approved Building/Plotting Plan <sup>*</sup></label>
						<div class="col-sm-3">
							<input type="file"   id="approvedSanctionPlanFile" name="otherFileDoc" disabled="disabled" class="form-control" />
							<input type="hidden" name="fieldName" value="approveSacPlanDoc"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.approveSacPlanDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.approveSacPlanDoc.fileName}
							</a>
						</div>


					</div>


					<div class="form-group">
						<label class="col-sm-3 control-label">Approved Layout Plan<sup>*</sup></label>
						<div class="col-sm-3">
							<input type="file"   id="approvedLayoutPlanFile" name="otherFileDoc" disabled="disabled" class="form-control" />
							<input type="hidden" name="fieldName" value="approveLayoutPlanDoc"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.approveLayoutPlanDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.approveLayoutPlanDoc.fileName}
							</a>
							
						</div>
						<label for="inputEmail3" class="col-sm-2 control-label">Proforma for Sale of Agreement <sup>*</sup></label>
						<div class="col-sm-3">
							<input type="file"   id="performaForSaleOfAgreement" name="otherFileDoc" disabled="disabled" class="form-control" />
							<input type="hidden" name="fieldName" value="performaForSaleOfAgreement"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.performaForSaleOfAgreement.documentId}">
					         ${projectRegistrationModel.projectDocModel.performaForSaleOfAgreement.fileName}
							</a>
						</div>


					</div>

<c:if test="${projectRegistrationModel.projectDetailsModel.isSubSqChangeInPlan=='Yes' }">
		<div class="form-group">
						<label class="col-sm-3 control-label">Existing  Layout Plan<sup>*</sup></label>
						<div class="col-sm-3">
							<input type="file" class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="approvedLayoutPlanFile" name="otherFileDoc" disabled="disabled"/>
							<span class='requiredValFldMsg'> Please select Existing  Layout Plan.</span>
							<input type="hidden" name="fieldName" value="extendedLayoutPlanDoc"/>
								 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.extendedLayoutPlanDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.extendedLayoutPlanDoc.fileName}
							</a>
						</div>
						<label for="inputEmail3" class="col-sm-2 control-label">Existing Section Plan and Specification <sup>*</sup></label>
						<div class="col-sm-3">
							<input type="file" class="form-control " rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="performaForSaleOfAgreement" name="otherFileDoc" disabled="disabled"/>
							<span class='requiredValFldMsg'> Please select Existing Section Plan and Specification.</span>
							<input type="hidden" name="fieldName" value="extendedSacPlanDoc"/>
						</div>
	 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.extendedSacPlanDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.extendedSacPlanDoc.fileName}
							</a>

					</div>
</c:if>	

					<div class="form-group">
						<label class="col-sm-3 control-label">Land documents &
							Location<sup>*</sup></label>
						<div class="col-sm-3">
							<input type="file"   id="landDocumentsFile" name="otherFileDoc" disabled="disabled" class="form-control" />
							<input type="hidden" name="fieldName" value="landLocationFileDoc"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.landLocationFileDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.landLocationFileDoc.fileName}
							</a>
						</div>
						<label for="inputEmail3" class="col-sm-2 control-label">Approved Section Of Building/Infrastructure Plan of Plotting<sup>*</sup></label>
						<div class="col-sm-3">
							<input type="file"   id="sanctionedLayoutPlan" name="otherFileDoc" disabled="disabled" class="form-control"  />
							<input type="hidden" name="fieldName" value="sanctionedLayoutPlanDoc"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.sanctionedLayoutPlanDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.sanctionedLayoutPlanDoc.fileName}
							</a>
						</div>


					</div>



					<div class="form-group">
						<label class="col-sm-3 control-label">Area Development Plan Of Project Area<sup>*</sup></label>
						<div class="col-sm-3">
							<input type="file"  id="areaDevelopmentPlanFile" name="otherFileDoc" disabled="disabled" class="form-control" />
							<input type="hidden" name="fieldName" value="areaDevelopmentDoc"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.areaDevelopmentDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.areaDevelopmentDoc.fileName}
							</a>
						</div>
						<label for="inputEmail3" class="col-sm-2 control-label">Proforma
							of Allotment Letter<sup>*</sup></label>
						<div class="col-sm-3">
							<input type="file"   id="performaOfAllotmentLetterFile" name="otherFileDoc" disabled="disabled" class="form-control" />
							<input type="hidden" name="fieldName" value="performaOfAllotmentLetterDoc"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.performaOfAllotmentLetterDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.performaOfAllotmentLetterDoc.fileName}
							</a>
						</div>


					</div>



					<div class="form-group">
						<label class="col-sm-3 control-label">Brochure of Current
							Project<sup>*</sup></label>
						<div class="col-sm-3">
							<input type="file"  id="brochureOfCurrentProjectFile" name="otherFileDoc" disabled="disabled" class="form-control" />
							<input type="hidden" name="fieldName" value="brochureOfCurrentProjectDoc"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.brochureOfCurrentProjectDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.brochureOfCurrentProjectDoc.fileName}
							</a>
						</div>
					<%-- 	<label for="inputEmail3" class="col-sm-2 control-label">All NOCs from Authority<sup>*</sup></label>
						<div class="col-sm-3">
							<input type="file"   id="projectRelatedDocumentsFile" name="otherFileDoc" disabled="disabled" class="form-control" />
							<input type="hidden" name="fieldName" value="projectRelatedDoc"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.projectRelatedDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.projectRelatedDoc.fileName}
							</a>
						</div> --%>


					</div>



					
					<div class="form-group">
						<label class="col-sm-3 control-label">Proforma For Sale Deed <sup>*</sup></label>
						<div class="col-sm-3">
							<input type="file"  id="declarationFormb" name="otherFileDoc" disabled="disabled" class="form-control" />
							<input type="hidden" name="fieldName" value="agreementFileDoc"/>
							                                             
							<a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.agreementFileDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.agreementFileDoc.fileName}
							</a>
						</div>


                      
						

					</div>
					
					 <div class="form-group">
						<label class="col-sm-3 control-label">Project Specification<sup>*</sup></label>
						<div class="col-sm-3">
							<input type="file" class="form-control" rel="txtTooltip" title="Type of structure, Flooring, Door Windows, Plumbing & Sanitary Wear, Fire, Lift & Capacity, etc Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="brochureOfCurrentProjectFile" name="otherFileDoc" disabled="disabled"/>
							<span class='requiredValFldMsg'> Please select Project Specification Document.</span>
							<input type="hidden" name="fieldName" value="projectSpecificDoc"/>
							
							<a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.projectSpecificDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.projectSpecificDoc.fileName}
							</a>
						</div>
					
					</div>

					
					<div class="form-group">
						<label class="col-sm-3 control-label">Declaration (Form B)<sup>*</sup></label>
						<div class="col-sm-3">
							<input type="file"   id="declarationFormb" name="otherFileDoc" disabled="disabled" class="form-control" />
							<input type="hidden" name="fieldName" value="declarationFormbDoc"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.declarationFormbDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.declarationFormbDoc.fileName}
							</a>
						</div>
					</div>
					
					<!--  start added 3 new fields -->
					<div class="form-group">
						<label class="col-sm-3 control-label">Title Deed
							</label>
						<div class="col-sm-3">
							<input type="file"  id="brochureOfCurrentProjectFile" name="otherFileDoc" disabled="disabled" class="form-control" />
							<input type="hidden" name="fieldName" value="titleDeed"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.titleDeed.documentId}">
					         ${projectRegistrationModel.projectDocModel.titleDeed.fileName}
							</a>
						</div>
						<label for="inputEmail3" class="col-sm-2 control-label">Joint Development Agreement</label>
						<div class="col-sm-3">
							<input type="file"   id="projectRelatedDocumentsFile" name="otherFileDoc" disabled="disabled" class="form-control" />
							<input type="hidden" name="fieldName" value="jointDevelopmentAgreement"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.jointDevelopmentAgreement.documentId}">
					         ${projectRegistrationModel.projectDocModel.jointDevelopmentAgreement.fileName}
							</a>
						</div>


					</div>
					
					
					<div class="form-group">
						<label class="col-sm-3 control-label">Any other document (Rights/Title/Interest/Name) 
						
							</label>
						<div class="col-sm-3">
							<input type="file"  id="brochureOfCurrentProjectFile" name="otherFileDoc" disabled="disabled" class="form-control" />
							<input type="hidden" name="fieldName" value="anyOtherDoc"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.anyOtherDoc.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.anyOtherDoc.fileName}
							</a>
						</div>

							<label class="col-sm-3 control-label">Approval/NOC under section 109 of KLR Act 1961 
							</label>
						<div class="col-sm-3">
							<input type="file"  id="brochureOfCurrentProjectFile" name="otherFileDoc" disabled="disabled" class="form-control" />
							<input type="hidden" name="fieldName" value="section109"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.section109.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.section109.fileName}
							</a>
						</div>

					</div>
					
					
					
					<div class="form-group">
						<label class="col-sm-3 control-label">Conversion Certificate under Sec 95 of the KLR Act 1961 

							</label>
						<div class="col-sm-3">
							<input type="file"  id="brochureOfCurrentProjectFile" name="otherFileDoc" disabled="disabled" class="form-control" />
							<input type="hidden" name="fieldName" value="section95"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.section95.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.section95.fileName}
							</a>
						</div>

				<label class="col-sm-3 control-label">Approval/NOC under Sec 14 of the KTCP Act 
 

							</label>
						<div class="col-sm-3">
							<input type="file"  id="brochureOfCurrentProjectFile" name="otherFileDoc" disabled="disabled" class="form-control" />
							<input type="hidden" name="fieldName" value="section14"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.section14.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.section14.fileName}
							</a>
						</div>

					</div>
					
					<!-- Added by Suneetha -->
					
					<div class="form-group">
						<label class="col-sm-3 control-label">Utilisation certificate 
						
							</label>
						<div class="col-sm-3">
							<input type="file"  id="brochureOfCurrentProjectFile" name="otherFileDoc" disabled="disabled" class="form-control" />
							<input type="hidden" name="fieldName" value="utilisationCert"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.utilisationCert.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.utilisationCert.fileName}
							</a>
						</div>

							<label class="col-sm-3 control-label">Transfer of development rights certificate 
							</label>
						<div class="col-sm-3">
							<input type="file"  id="brochureOfCurrentProjectFile" name="otherFileDoc" disabled="disabled" class="form-control" />
							<input type="hidden" name="fieldName" value="transferOfDevRightsCert"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.transferOfDevRightsCert.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.transferOfDevRightsCert.fileName}
							</a>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-3 control-label">Relinquishment Deed 
						
							</label>
						<div class="col-sm-3">
							<input type="file"  id="brochureOfCurrentProjectFile" name="otherFileDoc" disabled="disabled" class="form-control" />
							<input type="hidden" name="fieldName" value="relinquishmenDeed"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.relinquishmenDeed.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.relinquishmenDeed.fileName}
							</a>
						</div>

							<label class="col-sm-3 control-label">Fire Force Department 
							</label>
						<div class="col-sm-3">
							<input type="file"  id="brochureOfCurrentProjectFile" name="otherFileDoc" disabled="disabled" class="form-control" />
							<input type="hidden" name="fieldName" value="fireForceDept"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.fireForceDept.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.fireForceDept.fileName}
							</a>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-3 control-label">Airport Authority of India 
						
							</label>
						<div class="col-sm-3">
							<input type="file"  id="brochureOfCurrentProjectFile" name="otherFileDoc" disabled="disabled" class="form-control" />
							<input type="hidden" name="fieldName" value="airportAuthorityOfIndia"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.airportAuthorityOfIndia.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.airportAuthorityOfIndia.fileName}
							</a>
						</div>

							<label class="col-sm-3 control-label">BESCOM 
							</label>
						<div class="col-sm-3">
							<input type="file"  id="brochureOfCurrentProjectFile" name="otherFileDoc" disabled="disabled" class="form-control" />
							<input type="hidden" name="fieldName" value="bescom"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.bescom.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.bescom.fileName}
							</a>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-3 control-label">BWSSB 
						
							</label>
						<div class="col-sm-3">
							<input type="file"  id="brochureOfCurrentProjectFile" name="otherFileDoc" disabled="disabled" class="form-control" />
							<input type="hidden" name="fieldName" value="bwssb"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.bwssb.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.bwssb.fileName}
							</a>
						</div>

							<label class="col-sm-3 control-label">KSPCB 
							</label>
						<div class="col-sm-3">
							<input type="file"  id="brochureOfCurrentProjectFile" name="otherFileDoc" disabled="disabled" class="form-control" />
							<input type="hidden" name="fieldName" value="kspcb"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.kspcb.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.kspcb.fileName}
							</a>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-3 control-label">SEIAA 
						
							</label>
						<div class="col-sm-3">
							<input type="file"  id="brochureOfCurrentProjectFile" name="otherFileDoc" disabled="disabled" class="form-control" />
							<input type="hidden" name="fieldName" value="seiaa"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.seiaa.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.seiaa.fileName}
							</a>
						</div>

							<label class="col-sm-3 control-label">BSNL 
							</label>
						<div class="col-sm-3">
							<input type="file"  id="brochureOfCurrentProjectFile" name="otherFileDoc" disabled="disabled" class="form-control" />
							<input type="hidden" name="fieldName" value="bsnl"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.bsnl.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.bsnl.fileName}
							</a>
						</div>
					</div>
					
				 	 <div class="form-group">
						<label class="col-sm-3 control-label">NOC in case of building proposals abutting to neighbouring properties 
						
							</label>
						<div class="col-sm-3">
							<input type="file"  id="brochureOfCurrentProjectFile" name="otherFileDoc" disabled="disabled" class="form-control" />
							<input type="hidden" name="fieldName" value="nocBuildingAbuttingToNeighbourProperties"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.nocBuildingAbuttingToNeighbourProperties.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.nocBuildingAbuttingToNeighbourProperties.fileName}
							</a>
						</div>

							<label class="col-sm-3 control-label">Lift Authorities 
							</label>
						<div class="col-sm-3">
							<input type="file"  id="brochureOfCurrentProjectFile" name="otherFileDoc" disabled="disabled" class="form-control" />
							<input type="hidden" name="fieldName" value="liftAuthorities"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.liftAuthorities.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.liftAuthorities.fileName}
							</a>
						</div>
					</div>   
					 
					
					 <div class="form-group">
						<label class="col-sm-3 control-label">Urban Land Ceiling 
						
							</label>
						<div class="col-sm-3">
							<input type="file"  id="brochureOfCurrentProjectFile" name="otherFileDoc" disabled="disabled" class="form-control" />
							<input type="hidden" name="fieldName" value="urbanLandCeiling"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.urbanLandCeiling.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.urbanLandCeiling.fileName}
							</a>
						</div>

						 	  <label class="col-sm-3 control-label">Inspector of Factories Controller of explosives Railways 
							</label>
						<div class="col-sm-3">
							<input type="file"  id="brochureOfCurrentProjectFile" name="otherFileDoc" disabled="disabled" class="form-control" />
							<input type="hidden" name="fieldName" value="inspectorOfFactoriesCntrlOfExplosivesRailways"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.inspectorOfFactoriesCntrlOfExplosivesRailways.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.inspectorOfFactoriesCntrlOfExplosivesRailways.fileName}
							</a>
						</div>     
					</div>
					
						<div class="form-group">
						<label class="col-sm-3 control-label">BMRCL 
						
							</label>
						<div class="col-sm-3">
							<input type="file"  id="brochureOfCurrentProjectFile" name="otherFileDoc" disabled="disabled" class="form-control" />
							<input type="hidden" name="fieldName" value="bmrcl"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.bmrcl.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.bmrcl.fileName}
							</a>
						</div></div>

					  <label class="col-sm-3 control-label">Bangalore Urban Arts Commission 
							</label>
						<div class="col-sm-3">
							<input type="file"  id="brochureOfCurrentProjectFile" name="otherFileDoc" disabled="disabled" class="form-control" />
							<input type="hidden" name="fieldName" value="bangaloreUrbanArtsCommission"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.bangaloreUrbanArtsCommission.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.bangaloreUrbanArtsCommission.fileName}
							</a>
						</div>  
					</div>
					 
					
					
					    <div class="form-group">
						<label class="col-sm-3 control-label">Dist Magistrate 
						
							</label>
						<div class="col-sm-3">
							<input type="file"  id="brochureOfCurrentProjectFile" name="otherFileDoc" disabled="disabled" class="form-control" />
							<input type="hidden" name="fieldName" value="distMagistrate"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.distMagistrate.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.distMagistrate.fileName}
							</a>
						</div>

							<label class="col-sm-3 control-label">Coastal Regulation Zone Authority 
							</label>
						<div class="col-sm-3">
							<input type="file"  id="brochureOfCurrentProjectFile" name="otherFileDoc" disabled="disabled" class="form-control" />
							<input type="hidden" name="fieldName" value="coastalRegulationZoneAuthority"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.coastalRegulationZoneAuthority.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.coastalRegulationZoneAuthority.fileName}
							</a>
						</div>
					</div>    
					 
					 <div class="form-group">
						  <label class="col-sm-3 control-label">Certificate from Registered Engineer indicating the structural safety of the building (for Apartments)
						
							</label>
						<div class="col-sm-3">
							<input type="file"  id="brochureOfCurrentProjectFile" name="otherFileDoc" disabled="disabled" class="form-control" />
							<input type="hidden" name="fieldName" value="engrIndicateStructural"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.engrIndicateStructural.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.engrIndicateStructural.fileName}
							</a>
						</div>    

							<label class="col-sm-3 control-label">Sectional Drawing of the apartments</label>
						<div class="col-sm-3">
							<input type="file" class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="sectionalDrawingOfTheApartments"/>
							<a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.sectionalDrawingOfTheApartments.documentId}">
					         ${projectRegistrationModel.projectDocModel.projectAddDocModel.fileName}
							</a>
						</div>
					</div>   
					
					<!-- End of Suneetha -->
					
					
						<div class="form-group">
						<label class="col-sm-3 control-label">Existing Layout Plan
							</label>
						<div class="col-sm-3">
							<input type="file"  id="brochureOfCurrentProjectFile" name="otherFileDoc" disabled="disabled" class="form-control" />
							<input type="hidden" name="fieldName" value="existingLayoutPlan"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.existingLayoutPlan.documentId}">
					         ${projectRegistrationModel.projectDocModel.existingLayoutPlan.fileName}
							</a>
						</div>
						<label for="inputEmail3" class="col-sm-2 control-label">Existing Section Plan andSpecification</label>
						<div class="col-sm-3">
							<input type="file"   id="projectRelatedDocumentsFile" name="otherFileDoc" disabled="disabled" class="form-control" />
							<input type="hidden" name="fieldName" value="existingSectionPlanandSpec"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.existingSectionPlanandSpec.documentId}">
					         ${projectRegistrationModel.projectDocModel.existingSectionPlanandSpec.fileName}
							</a>
						</div>


					</div>
					
						<div class="form-group">
						<label class="col-sm-3 control-label">Change of Land Use
							</label>
						<div class="col-sm-3">
							<input type="file"  id="brochureOfCurrentProjectFile" name="otherFileDoc" disabled="disabled" class="form-control" />
							<input type="hidden" name="fieldName" value="changeOfLandUse"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.changeOfLandUse.documentId}">
					         ${projectRegistrationModel.projectDocModel.changeOfLandUse.fileName}
							</a>
						</div>

			<label class="col-sm-3 control-label">Advocate Search Report
							</label>
						<div class="col-sm-3">
							<input type="file"  id="brochureOfCurrentProjectFile" name="otherFileDoc" disabled="disabled" class="form-control" />
							<input type="hidden" name="fieldName" value="advocatesearchreport"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.advocatesearchreport.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.advocatesearchreport.fileName}
							</a>
						</div>

					</div>
					
					
					
						<!--  end added 3 new fields -->
					
					

					<div class="inner_wrapper">
					<% int pp=0; %>
					<c:forEach items="${projectRegistrationModel.projectPhotoDetailSet }" var="photo">
					<input type="hidden" name="photoId" value="${photo.documentId}" />
					<%if(pp==0){ %>
                         <div id='pre_project-dv' class='addmoredv'>
                         <%}else{ %>
                           <div  class='addmoredv'>
                         <%} pp++; %>
						<div class="drop_shadow">
						
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label">Project Photo</label>
							<div class="col-sm-3">
								<input type="file"   id="projectPhotoFile" name="projectPhotoFile" disabled="disabled" class="form-control" />
							
							<a href="download?DOC_ID=${photo.documentId}">
					         ${photo.fileName}
							</a>
							
							</div>
						</div>
					</div>
					</c:forEach>
					</div>
			</div>

<!-- PROJECT DOCUMENT DETAILS END -->
    </form:form>