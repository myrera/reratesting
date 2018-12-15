<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="in.gov.rera.common.util.DateUtil"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


	<form:form cssClass="form-horizontal"
					action="#"
					modelAttribute="projectRegistrationModel" method="post" id="previewtrxForm" >

			<!--Inner wrapper stsrt here-->
			<div class="inner_wrapper">
				<h1>
					Promoter <span> Detail</span>
				</h1>
				<div class="border">
					<div class="orange"></div>
					<div class="black"></div>
				</div>



					<div class="form-group">
						<label class="col-sm-3 col-xs-3 control-label">Type of Promoter</label>
						<div class="col-sm-3 col-xs-3">
						
						   <form:hidden path="projectDetailsModel.projectDetailsId"/>
					        <form:hidden path="projectBankDetailsModel.projectBankDelsId"/>
					        <form:hidden path="externalDevelopmentWorkModel.extDevId"/>
					        <form:hidden path="projectRegId"/>
					        <form:hidden path="projectDocModel.docId"/>

						<form:select path="promoterDetailsModel.typeOfPromoter" disabled="true"
								cssClass="form-control" onchange="choosePromoterType(this)">
								<form:option value="0">Select</form:option>
								<form:option value="Company">Company</form:option>
								<form:option value="Partnership Firm">Partnership Firm </form:option>
								<form:option value="Competent Authority">Competent Authority</form:option>
								<form:option value="Limited Liability Partnership"> Limited Liability Partnership</form:option>
								<form:option value="Trust">Trust</form:option>
								<form:option value="Firm">Firm</form:option>
								<form:option value="Other">Other</form:option>

							</form:select>


						</div>
						<label for="inputEmail3" class="col-sm-2 col-xs-2 control-label">Name<sup>*</sup>
						</label>
						<div class="col-sm-3 col-xs-3">

							<form:input path="promoterDetailsModel.promoterName" disabled="true" 
								cssClass="form-control input-sm" />

						</div>


					</div>



					<div class="form-group">
					<c:choose>
					<c:when test="${projectRegistrationModel.promoterDetailsModel.typeOfPromoter=='Other' }">
						<label for="inputEmail3" class="col-sm-3 col-xs-3 control-label optionfld2" > </label>
						<div class="col-sm-3 col-xs-3 optionfld2">
							<form:input path="promoterDetailsModel.ifOther" disabled="true"
								cssClass="form-control input-sm" readonly="true" />

						</div>
						</c:when>
						<c:otherwise>
						<label for="inputEmail3" class="col-sm-3 col-xs-3 control-label optionfld2" style="display:none;"> </label>
						<div class="col-sm-3 col-xs-3 optionfld2" style="display:none;" >
							<form:input path="promoterDetailsModel.ifOther"
								cssClass="form-control input-sm" readonly="true" />

						</div>
						</c:otherwise>
						</c:choose>
						<label for="inputEmail3" class="col-sm-3 col-xs-3 control-label">
							PAN Number <sup>*</sup>
						</label>
						<div class="col-sm-3 col-xs-3">

							<form:input path="promoterDetailsModel.panNo" disabled="true"
								cssClass="form-control input-sm" />

						</div>

					</div>




					<div class="form-group">
						<label for="inputEmail3" class="col-sm-3 col-xs-3 control-label">E-mail<sup>*</sup></label>
						<div class="col-sm-3 col-xs-3">
							<form:input path="promoterDetailsModel.emailId" disabled="true"
								cssClass="form-control input-sm" />
						</div>
						<label for="inputEmail3" class="col-sm-2 col-xs-2 control-label">Mobile
							No. <sup>*</sup>
						</label>
						<div class="col-sm-3 col-xs-3">

							<form:input path="promoterDetailsModel.mobileNo" disabled="true"
								cssClass="form-control input-sm" />


						</div>

					</div>


					<div class="form-group">

						<label for="inputEmail3" class="col-sm-3 col-xs-3 control-label">Address
							Line 1<sup>*</sup>
						</label>
						<div class="col-sm-3 col-xs-3">

							<form:input path="promoterDetailsModel.addressLine1" disabled="true"
								cssClass="form-control input-sm" />
						</div>

						<label for="inputEmail3" class="col-sm-2 col-xs-2 control-label">Address
							Line 2 <sup>*</sup>
						</label>
						<div class="col-sm-3 col-xs-3">

							<form:input path="promoterDetailsModel.addressLine2" disabled="true"
								cssClass="form-control input-sm" />
						</div>




					</div>



					<div class="form-group">

						<label for="inputEmail3" class="col-sm-3 col-xs-3 control-label">State/UT<sup>*</sup>
						</label>
						<div class="col-sm-3 col-xs-3">

							<select name="stateUtId" id="invSate" disabled="disabled"  onchange="reloadChildDropdown(this)" class="form-control">
						                 <option value='${projectRegistrationModel.promoterDetailsModel.districtModel.stateUtModel.stateUtId}' selected="selected"> ${projectRegistrationModel.promoterDetailsModel.districtModel.stateUtModel.stateUtName} </option>
						       </select>
						


						</div>

						<label for="inputEmail3" class="col-sm-2 col-xs-2 control-label">District<sup>*</sup>
						</label>
						<div class="col-sm-3 col-xs-3">

							<select class="form-control" name="permDistrictId" disabled="disabled"  id="District-invSate" >
							
						<option value='${projectRegistrationModel.promoterDetailsModel.districtModel.districtId}' selected="selected"> ${projectRegistrationModel.promoterDetailsModel.districtModel.districtName } </option>
							</select>
                            

						</div>




					</div>

					<div class="form-group">


						<label for="inputEmail3" class="col-sm-3 col-xs-3 control-label">Company
							Registration Number<sup>*</sup>
						</label>
						<div class="col-sm-3 col-xs-3">
							<form:input  cssClass="form-control input-sm" disabled="true" path="promoterDetailsModel.comRegistrationNo"
								id="inputEmail3" placeholder="" />
						</div>


						<label for="inputEmail3" class="col-sm-2 col-xs-2 control-label">PIN
							Code<sup>*</sup>
						</label>
						<div class="col-sm-3 col-xs-3">
							<form:input  cssClass="form-control input-sm" disabled="true" maxlength="6" path="promoterDetailsModel.pinCode"
								id="inputEmail3" placeholder="" />
						</div>
					</div>







					<div class="form-group">
						<label for="inputEmail3" class="col-sm-3 col-xs-3 control-label">Registration
							Certificate<sup>*</sup>
						</label>
						<div class="col-sm-3 col-xs-3">
							<input type="file" id="regCertificateFile" name="regCertificateFile" disabled="disabled"/>
							<a href="download?DOC_ID=${projectRegistrationModel.promoterDetailsModel.document.documentId}"> ${projectRegistrationModel.promoterDetailsModel.document.fileName}</a>
							
						</div>

					</div>


					<br>




					<div class="inner_wrapper">



						<h1>
							Authorized Signatory <span>Details</span>
						</h1>

						<div class="drop_shadow"></div>

						<div class="form-group">
						
							<label for="inputEmail3" class="col-sm-3 col-xs-3 control-label">
								Name <sup>*</sup>
							</label>
							<div class="col-sm-3 col-xs-3">
								  <form:input path="promoterDetailsModel.projectChairmanModel.chairmanName" disabled="true" cssClass="form-control input-sm"/>
					
								
							</div>

							<label for="inputEmail3" class="col-sm-2 col-xs-2 control-label">
								Mobile No <sup>*</sup>
							</label>
							<div class="col-sm-3 col-xs-3">
								
								<form:input path="promoterDetailsModel.projectChairmanModel.mobileNo" disabled="true" cssClass="form-control input-sm"/>
					
									
							</div>




						</div>


						<div class="form-group">

							<label for="inputEmail3" class="col-sm-3 col-xs-3 control-label">Email
								Address<sup>*</sup>
							</label>
							<div class="col-sm-3 col-xs-3">

								<form:input path="promoterDetailsModel.projectChairmanModel.emailId" disabled="true" cssClass="form-control input-sm"/>
					
							</div>


							<label for="inputEmail3" class="col-sm-2 col-xs-2 control-label">Address Line1<sup>*</sup>
							</label>
							<div class="col-sm-3 col-xs-3">
								
							<form:input path="promoterDetailsModel.projectChairmanModel.addressLine1" disabled="true" cssClass="form-control input-sm"/>
					
							</div>



						</div>


	<div class="form-group">

							<label for="inputEmail3" class="col-sm-3 col-xs-3 control-label">Address Line2<sup>*</sup>
							</label>
							<div class="col-sm-3 col-xs-3">

								<form:input path="promoterDetailsModel.projectChairmanModel.addressLine2" disabled="true" cssClass="form-control input-sm"/>
					
							</div>


							<label for="inputEmail3" class="col-sm-2 col-xs-2 control-label">State<sup>*</sup>
							</label>
							<div class="col-sm-3 col-xs-3">
							<select name="chStateUtId" id="chState"  onchange="reloadChildDropdown(this)" disabled="disabled" class="form-control">
						                 <option value='${projectRegistrationModel.promoterDetailsModel.projectChairmanModel.districtModel.stateUtModel.stateUtId}' selected="selected"> ${projectRegistrationModel.promoterDetailsModel.projectChairmanModel.districtModel.stateUtModel.stateUtName} </option>
						          </select>
						
							</div>



						</div>
						
						
						
							<div class="form-group">

							<label for="inputEmail3" class="col-sm-3 col-xs-3 control-label">District<sup>*</sup>
							</label>
							<div class="col-sm-3 col-xs-3">
<select class="form-control" name="chairManDistrictId"  id="District-chState"  disabled="disabled">
							
						<option value='${projectRegistrationModel.promoterDetailsModel.projectChairmanModel.districtModel.districtId}' selected="selected"> ${projectRegistrationModel.promoterDetailsModel.projectChairmanModel.districtModel.districtName} </option>
							</select>
					
							</div>

							<label for="inputEmail3" class="col-sm-2 col-xs-2 control-label">Photograph<sup>*</sup></label>
							<div class="col-sm-3 col-xs-3 ">
								<input type="file" id="chairManPhoto" name="chairManPhoto" disabled="disabled"/>
							<a href="download?DOC_ID=${projectRegistrationModel.promoterDetailsModel.projectChairmanModel.document.documentId}"> ${projectRegistrationModel.promoterDetailsModel.projectChairmanModel.document.fileName}</a>
							 
							</div>
                             


						</div>




					</div>






					<div class="inner_wrapper">


						<h1>
							Project Head <span>Details</span>
						</h1>
						
						
                       <% int yy=0; %>
						<c:forEach items="${projectMemberSet}" var="obj">
						<%if(yy>0){ %>
							<DIV  class="addmoredv">
							<%}else{ %>
								<DIV ID="member-dls-dv" class="addmoredv">
							<%}
						yy++;%>
							<div class="drop_shadow">
								
						</div>
					
						

						
						<div class="form-group">
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-3 col-xs-3 control-label">
									Name<sup>*</sup>
								</label>
								<div class="col-sm-3 col-xs-3 ">
									<input class="form-control input-sm" name="memberName" disabled="disabled" value="${obj.memberName}"/>
									<input type="hidden" name="prjMemberChId" value="${obj.prjMemberChId}"/>
					
								</div>

								<label for="inputEmail3" class="col-sm-2 col-xs-2 control-label" >
									 Type<sup>*</sup>
								</label>
								<div class="col-sm-3 col-xs-3">
									
									
									<select class="form-control" name="memberType" disabled="disabled">
									<option value="0"> --Select-- </option>
									<c:choose>
									<c:when test="${obj.memberType=='Director' }">
									<option value="Director" selected="selected">Director</option>
									<option value="Board Member">Board Member</option>
									</c:when>
									<c:when test="${obj.memberType=='Board Member' }">
									<option value="Director" >Director</option>
									<option value="Board Member" selected="selected">Board Member</option>
									</c:when>
									<c:otherwise>
									<option value="Director" >Director</option>
									<option value="Board Member" >Board Member</option>
									</c:otherwise>
									</c:choose>
									</select>
									
									
								</div>
							</div>




							<div class="form-group">

								<label for="inputEmail3" class="col-sm-3 col-xs-3 control-label">Mobile
									No<sup>*</sup>
								</label>
								<div class="col-sm-3 col-xs-3 ">
									<input class="form-control input-sm" name="memberMobileNo" disabled="disabled" value="${obj.mobileNo}"/>
								</div>
								<label for="inputEmail3" class="col-sm-2 col-xs-2 control-label">Email
									Address<sup>*</sup>
								</label>
								<div class="col-sm-3 col-xs-3">
									<input class="form-control input-sm" name="memberEmailId" disabled="disabled" value="${obj.emailId}"/>
								</div>
							</div>



                            <div class="form-group">

							<label for="inputEmail3" class="col-sm-3 col-xs-3 control-label">Address Line1<sup>*</sup></label>
							<div class="col-sm-3 col-xs-3 ">
								<input type="text" class="form-control input-sm"  name="memberAddressLine1" disabled="disabled" value="${obj.addressLine1}"/>
							</div>
							<label for="inputEmail3" class="col-sm-2 col-xs-2 control-label">Address Line2<sup>*</sup></label>
							<div class="col-sm-3 col-xs-3">
								<input type="text" name="memberAddressLine2" id="memberAddressLine2" disabled="disabled" value="${obj.addressLine2}"/>
							</div>
							
							</div>
							
							
							     <div class="form-group">

							<label for="inputEmail3" class="col-sm-3 col-xs-3 control-label">State<sup>*</sup></label>
							<div class="col-sm-3 col-xs-3 ">
									<select name="chStateUtId" id="prMemberState<%=yy %>" disabled="disabled"  onchange="reloadChildDropdown(this)" class="form-control dynaselectfld">
						                 <option value='${obj.districtModel.stateUtModel.stateUtId}' selected="selected"> ${obj.districtModel.stateUtModel.stateUtName} </option>
						
						       </select>
							</div>
							<label for="inputEmail3" class="col-sm-2 col-xs-2 control-label">District<sup>*</sup></label>
							<div class="col-sm-3 col-xs-3">
								
								    <select class="form-control dynaselectfld" name="memberDistrictId" disabled="disabled" id="District-prMemberState<%=yy %>" >
									<option value="0"> --Select-- </option>
						<option value='${dst.districtId }'> ${dst.districtName } </option>
							</select>
							</div>
							
							</div>
							
							
							
							
							<div class="form-group">

							<label for="inputEmail3" class="col-sm-3 col-xs-3 control-label">Pin Code<sup>*</sup></label>
							<div class="col-sm-3 col-xs-3 ">
								<input type="text" class="form-control input-sm" maxlength="6"  name="memberPinCode" disabled="disabled" value="${obj.pinCode}"/>
							</div>
							<label for="inputEmail3" class="col-sm-2 col-xs-2 control-label">Photograph<sup>*</sup></label>
							<div class="col-sm-3 col-xs-3">
								<input type="file" name="memberPhotoFile" id="memberPhotoFile" disabled="disabled"/>
						       <a href="download?DOC_ID=${obj.momberPhotoDoc.documentId}"> ${obj.momberPhotoDoc.fileName}</a>
							 
							</div>
							
							</div>
							
							
							
						</div>
						</DIV>
						</c:forEach>
						    <!-- add more -->
						    
						   
						
						</div>




					</div>
					<br>
					<div class="inner_wrapper">
						<h1>
							 RERA Registration Details with any <span>other State/UTs</span>
						</h1>
						 <% int zz=0; %>
						<c:forEach items="${promoterBlackListSet}" var="obj">
						
					
						<%if(zz>0){ %>
							<DIV  class="addmoredv">
							<%}else{ %>
								<DIV ID="blacklist-dls-dv" class="addmoredv">
							<%}
						  zz++;%>
							<div class="drop_shadow">
								
						</div>
						
						
						
						<div class="form-group">

							<label for="inputEmail3" class="col-sm-3 col-xs-3 control-label">RERA Registration Number<sup>*</sup>
								</label>
								<div class="col-sm-3 col-xs-3 ">
								<input type="hidden" name="prmBacklistId" value="${obj.prmBacklistId}"/>
									<input class="form-control input-sm" name="certificateNo" disabled="disabled"
										id="certificateNo" value="${obj.certificateNo}"/>
								</div>
								
								
								
									<label for="inputEmail3" class="col-sm-2 col-xs-2 control-label">
								State/UTs<sup>*</sup>
								</label>
								<div class="col-sm-3 col-xs-3">
									<select class="form-control" name="otherStateId" disabled="disabled">
								 <option value='${obj.stateUtModel.stateUtId}' selected="selected"> ${obj.stateUtModel.stateUtName} </option>
						        	</select>
								</div>

							</div>
					
						<div class="form-group">


                          <c:choose>
                          <c:when test="${obj.isBalckList=='YES' }">

								<label for="inputEmail3" class="col-sm-3 col-xs-3 control-label">Have your said registration been revoked?</label>
								<div class="col-sm-3 col-xs-3 ">
								<label>
									<input type='hidden' name='isBalckListFld' id='HdisBalckList<%=zz %>' value='NO' class='dynaselectfld'>
									 <input type="radio" disabled="disabled" name="isBalckList<%=zz %>"	id="isBalckList<%=zz %>" checked="checked" value="YES" class='dynaselectfld' onclick='showrelatedfld(this)'> Yes
									</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label> 
									<input type="radio" disabled="disabled" name="isBalckList<%=zz %>" id="isBalckList<%=zz %>" value="NO" class='dynaselectfld' onclick='hiderelatedfld(this)'> No
									</label>
								</div>
								</c:when>
								<c:otherwise>
								<label for="inputEmail3" class="col-sm-3 col-xs-3 control-label">Have your said registration been revoked?</label>
								<div class="col-sm-3 col-xs-3 ">
								<label>
									<input type='hidden' name='isBalckListFld' id='HdisBalckList<%=zz %>' value='NO' class='dynaselectfld'>
									 <input type="radio" disabled="disabled" name="isBalckList<%=zz %>"	id="isBalckList<%=zz %>"  value="YES" class='dynaselectfld' onclick='showrelatedfld(this)'> Yes
									</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label> 
									<input type="radio" disabled="disabled" name="isBalckList<%=zz %>" id="isBalckList<%=zz %>" value="NO" checked="checked" class='dynaselectfld' onclick='hiderelatedfld(this)'> No
									</label>
								</div>
								</c:otherwise>
</c:choose>

							
							

                            <c:choose>
                          <c:when test="${obj.isBalckList=='YES' }">

								<label for="inputEmail3" class="col-sm-2 col-xs-2 control-label">
									Reason for Revoked<sup>*</sup>
								</label>
								<div class="col-sm-3 col-xs-3">
									<select class="form-control" name="blacklist" disabled="disabled" id="FldisBalckList<%=zz %>">
									<option value="0">Select</option>
									<c:choose>
						                <c:when test="${obj.blacklistReason=='Forgery/ Providing False information'}">
						             	 <option value="Forgery/ Providing False information" selected="selected">Forgery/ Providing False information</option>
								          <option value="Further Investigation">Further Investigation</option>
									     <option value="Misleading information">Misleading information</option>
									     <option value="Misleading information">Misleading information</option>
									     <option value="Suspension for 6 months from Public Procurement">Suspension for 6 months from Public Procurement.</option>
									
								        </c:when>
								         <c:when test="${obj.blacklistReason=='Further Investigation'}">
						             	 <option value="Forgery/ Providing False information" >Forgery/ Providing False information</option>
								          <option value="Further Investigation" selected="selected">Further Investigation</option>
									     <option value="Misleading information">Misleading information</option>
									     <option value="Misleading information">Misleading information</option>
									     <option value="Suspension for 6 months from Public Procurement">Suspension for 6 months from Public Procurement.</option>
									
								        </c:when>
								         <c:when test="${obj.blacklistReason=='Misleading information'}">
						             	 <option value="Forgery/ Providing False information" >Forgery/ Providing False information</option>
								          <option value="Further Investigation" >Further Investigation</option>
									     <option value="Misleading information" selected="selected">Misleading information</option>
									     <option value="Misleading information">Misleading information</option>
									     <option value="Suspension for 6 months from Public Procurement">Suspension for 6 months from Public Procurement.</option>
									
								        </c:when>
								    
								      <c:when test="${obj.blacklistReason=='Misleading information'}">
						             	 <option value="Forgery/ Providing False information" >Forgery/ Providing False information</option>
								          <option value="Further Investigation" >Further Investigation</option>
									     <option value="Misleading information" >Misleading information</option>
									     <option value="Misleading information" selected="selected">Misleading information</option>
									     <option value="Suspension for 6 months from Public Procurement">Suspension for 6 months from Public Procurement.</option>
									
								        </c:when>
								        
								         <c:when test="${obj.blacklistReason=='Suspension for 6 months from Public Procurement'}">
						             	 <option value="Forgery/ Providing False information" >Forgery/ Providing False information</option>
								          <option value="Further Investigation" >Further Investigation</option>
									     <option value="Misleading information" >Misleading information</option>
									     <option value="Misleading information" >Misleading information</option>
									     <option value="Suspension for 6 months from Public Procurement" selected="selected">Suspension for 6 months from Public Procurement.</option>
									
								        </c:when>
								    
						              
						         </c:choose>
									
									
									</select>
								</div>
								
								</c:when>
								<c:otherwise>
								
									<label for="inputEmail3" class="col-sm-2 col-xs-2 control-label">
									Reason for Revoked<sup>*</sup>
								</label>
								<div class="col-sm-3 col-xs-3">
									<select class="form-control dynaselectfld" style="display: none;" disabled="disabled" name="blacklist" id="FldisBalckList<%=zz %>">
									<option value='0'> --Select-- </option>
									      <option value="Forgery/ Providing False information" >Forgery/ Providing False information</option>
								          <option value="Further Investigation" >Further Investigation</option>
									     <option value="Misleading information" >Misleading information</option>
									     <option value="Misleading information">Misleading information</option>
									     <option value="Suspension for 6 months from Public Procurement">Suspension for 6 months from Public Procurement</option>
									
									
									</select>
								</div>
								
								
								
								
								
								</c:otherwise>
								
								
								
								</c:choose>
								
								
								
							</div>

                          
						</div>
						</c:forEach>
					
				
					
					
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
								
						</div>
							
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 col-xs-3 control-label">
								Project Name 
								
								
								</label>
								
							<div class="col-sm-3 col-xs-3">
							<input type="hidden" name='pervProjectRegId' value="${obj.pervProjectRegId}"/>
								<input type="text" class="form-control input-sm" disabled="disabled"
									id="pervProjectName" name="pervProjectName" value="${obj.projectName}">
									
							</div>
							
							

							<label for="inputEmail3" class="col-sm-2 col-xs-2 control-label">
								Project Description</label>
							<div class="col-sm-3 col-xs-3">
								<textarea class="form-control input-sm" name="pervProjectDescription" disabled="disabled" id="pervProjectDescription" rows="3" >
							    <c:out value='${obj.projectDescription}'/>	
							    </textarea>
							</div>




						</div>


						<div class="form-group dynaselectfld" id='DVprojectCurrentStatus<%=xx %>'>

								<label for="inputEmail3" class="col-sm-3 col-xs-3 control-label">Current
									Status </label>
									
								<div class="col-sm-3 col-xs-3">
										<select class="form-control dynaselectfld" name="projectCurrentStatus" disabled="disabled"
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
	                           		<label for="inputEmail3" class="col-sm-2 col-xs-2 control-label">
								Project Completion Cretificate</label>
								   <div class="col-sm-3 col-xs-3 ">
							        <input type="file" name="completionDocId" disabled="disabled"/>
							        <a href='<%=request.getContextPath() %>/download?DOC_ID=${obj.completionDocId.documentId}'>${obj.completionDocId.fileName }</a>
	                              </div>
                                 </div>                            
								
								<div class='noOfMonthDelayed'  style='display:none;'>
							
								<label for="inputEmail3" class="col-sm-2 col-xs-2 control-label">
									 No of Months Delayed  </label>
								<div class="col-sm-3 col-xs-3">
									<input class="form-control" name="noOfMonthDelayed" disabled="disabled"/>
								</div>
                              </div>
                              
                              
                               <div class='expectedCompletionDate'  style='display:none;'>
								<label for="inputEmail3" class="col-sm-2 col-xs-2 control-label">
									Expected Completion Date </label>
								<div class="col-sm-3 col-xs-3">
									
										<input type="text" name="expectedCompletionDate" disabled="disabled" class="form-control input-sm augCalCssClass">
										 <span	class="glyphicon glyphicon-calendar augCalImgCssClass"></span>
									
								</div>
                             </div>		
							 </c:when>
							  
							 
							 <c:when test="${obj.projectCurrentStatus == 'Delay'}">
							      <div class='completionDocId' style='display:none;'>
	                           		<label for="inputEmail3" class="col-sm-2 col-xs-2 control-label">
									Project Completion Cretificate</label>
								<div class="col-sm-3 col-xs-3 ">
							      <input type="file" name="completionDocId" disabled="disabled"/>
							      
	                            </div>
                                   	</div>                            
								
								<div class='noOfMonthDelayed' >
								<label for="inputEmail3" class="col-sm-2 col-xs-2 control-label">
									No of Months Delayed </label>
								<div class="col-sm-3 col-xs-3">
									<input class="form-control" name="noOfMonthDelayed" disabled="disabled"/>
								</div>
                              </div>
                              
                           
                              <div class='expectedCompletionDate'  style='display:none;'>



								<label for="inputEmail3" class="col-sm-2 col-xs-2 control-label">
									Expected Completion Date </label>
								<div class="col-sm-3 col-xs-3">
									
										<input type="text" name="expectedCompletionDate" disabled="disabled" class="form-control input-sm augCalCssClass">
										<span	class="glyphicon glyphicon-calendar augCalImgCssClass"></span>
									
								</div>
                             </div>		
							 </c:when>
							 
							 
							 
							 <c:otherwise>
					
							 
							     <div class='completionDocId' style='display:none;'>
	                           		<label for="inputEmail3" class="col-sm-3 col-xs-3 control-label">
									Project Completion Cretificate</label>
								<div class="col-sm-3 col-xs-3 ">
							      <input type="file" name="completionDocId" disabled="disabled"/>
	                            </div>
                                   	</div>                            
								
								<div class='noOfMonthDelayed'  style='display:none;'>
								<label for="inputEmail3" class="col-sm-2 col-xs-2 control-label">
									No of Months Delayed </label>
								<div class="col-sm-3 col-xs-3">
									<input class="form-control" name="noOfMonthDelayed" disabled="disabled"/>
								</div>
                              </div>
                              
                              
                               <div class='expectedCompletionDate' >



								<label for="inputEmail3" class="col-sm-2 col-xs-2 control-label">
									Expected Completion Date </label>
								<div class="col-sm-3 col-xs-3">
									
										<input type="text" name="expectedCompletionDate" disabled="disabled" class="form-control input-sm augCalCssClass">
										<span	class="glyphicon glyphicon-calendar augCalImgCssClass"></span>
									
								</div>
                                </div>		
							
							   </c:otherwise>
							   </c:choose>

							


							</div>


							<div class="form-group">
							
							
								<label for="inputEmail3" class="col-sm-3 col-xs-3 control-label">Type
									of Land </label>
								<div class="col-sm-3 col-xs-3">
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


								<label for="inputEmail3" class="col-sm-3 col-xs-3 control-label">Is
									there any case pending</label>
								<div class="col-sm-3 col-xs-3 ">
								<c:choose>
								<c:when test="${obj.isCasesPending=='YES' }">
								<input type='hidden' name="isCasesPendingFld" id='HdisCasesPending<%=xx %>' value='YES' class='dynaselectfld'>
									&nbsp&nbspYes&nbsp&nbsp
									<input type="radio" disabled="disabled"	name="isCasesPending<%=xx %>" id="isCasesPending<%=xx %>" value="YES" checked="checked" class='dynaselectfld' onclick='showrelatedfld(this)'>
									&nbsp&nbspNo&nbsp&nbsp
									<input type="radio" disabled="disabled" name="isCasesPending<%=xx %>"id="isCasesPending<%=xx %>"  value="NO"   onclick='hiderelatedfld(this)' class='dynaselectfld'>
									<input type="text" disabled="disabled" value="${obj.caseDetails}" id="FldisCasesPending<%=xx %>"  name="caseDetails" class="form-control dynaselectfld" />
                                </c:when>
                                
                                <c:otherwise>
                                <input type='hidden' name="isCasesPendingFld" id='HdisCasesPending<%=xx %>' value='NO' class='dynaselectfld'>
                                	&nbsp&nbspYes&nbsp&nbsp
									<input type="radio" disabled="disabled"	name="isCasesPending<%=xx %>" id="isCasesPending<%=xx %>" value="YES" onclick='showrelatedfld(this)' class='dynaselectfld'>
									&nbsp&nbspNo&nbsp&nbsp
									<input type="radio" disabled="disabled" name="isCasesPending<%=xx %>"id="isCasesPending<%=xx %>"  value="NO"   checked="checked"  onclick='hiderelatedfld(this)' class='dynaselectfld'>
									<input type="text" disabled="disabled" value="${obj.caseDetails}" id="FldisCasesPending<%=xx %>" style='display:none;'name="caseDetails" class="form-control dynaselectfld"  />
                                </c:otherwise>
                                   </c:choose>

								</div>
								<label for="inputEmail3" class="col-sm-2 col-xs-2 control-label">
									Is Payment Pertaining to Project Land Pending </label>
								<div class="col-sm-3 col-xs-3">
									<div class="col-md-6 input-group">
									<c:choose>
									<c:when test="${obj.isPaymentPending=='YES' }">
									<input type='hidden' name="isPaymentPendingFld" id='HdisPaymentPending<%=xx %>' value='YES' class='dynaselectfld'>
										&nbsp&nbspYes&nbsp&nbsp<input type="radio" disabled="disabled"	name="isPaymentPending<%=xx %>" checked="checked" value="YES" id="isPaymentPending<%=xx %>" onclick='showrelatedfld(this)' class='dynaselectfld'>
										&nbsp&nbspNo&nbsp&nbsp<input type="radio" disabled="disabled" id="isPaymentPending<%=xx %>"   name="isPaymentPending<%=xx %>" value="NO" onclick='hiderelatedfld(this)'  class='dynaselectfld'>
										 <input	type="text" disabled="disabled" name="pendingAmount"  id="FldisPaymentPending<%=xx %>"  value="${obj.pendingAmount}"class="form-control dynaselectfld" />
										</c:when>	
										<c:otherwise>
										<input type='hidden' name="isPaymentPendingFld" id='HdisPaymentPending<%=xx %>' value='NO' class='dynaselectfld'>
										&nbsp&nbspYes&nbsp&nbsp<input type="radio" disabled="disabled"	name="isPaymentPending<%=xx %>" value="YES" id="isPaymentPending<%=xx %>" onclick='showrelatedfld(this)' class='dynaselectfld'>
										&nbsp&nbspNo&nbsp&nbsp<input type="radio" disabled="disabled" id="isPaymentPending<%=xx %>"  checked="checked"  name="isPaymentPending<%=xx %>" value="NO" onclick='hiderelatedfld(this)'  class='dynaselectfld'>
										 <input	type="text" name="pendingAmount" disabled="disabled"  id="FldisPaymentPending<%=xx %>" style='display:none;' value="${obj.pendingAmount}"class="form-control dynaselectfld" />
		
										
										</c:otherwise>
											
										</c:choose>	
											
									</div>
								</div>


							</div>

							

						<div class="form-group">

							<label for="inputEmail3" class="col-sm-3 col-xs-3 control-label">Address</label>
							<div class="col-sm-3 col-xs-3 ">
								<textarea class="form-control input-sm" name="projectAddress" disabled="disabled" id="" rows="3">${obj.projectAddress}</textarea>
							</div>
							<label for="inputEmail3" class="col-sm-2 col-xs-2 control-label">
								State/UT </label>
							<div class="col-sm-3 col-xs-3">
							<select name="stateUtId" id="pervSate<%=xx %>"  onchange="reloadChildDropdown(this)" disabled="disabled" class="form-control dynaselectfld">
						      
						                 <option value='${obj.districtModel.stateUtModel.stateUtId }' selected="selected"> ${obj.districtModel.stateUtModel.stateUtName} </option>
						             </select>
				
							</div>
							
							
						</div>


						<div class="form-group">

							<label for="inputEmail3" class="col-sm-3 col-xs-3 control-label">District</label>
							<div class="col-sm-3 col-xs-3 ">
                        		<select class="form-control dynaselectfld" name="pervProjDistrictId" disabled="disabled" id="District-pervSate<%=xx %>" >
								
						<option value='${obj.districtModel.districtId }' selected="selected"> ${obj.districtModel.districtName } </option>
								</select>
							</div>
							<label for="inputEmail3" class="col-sm-2 col-xs-2 control-label">
								Pin Code </label>
							<div class="col-sm-3 col-xs-3">
								<input class="form-control input-sm" name="projectAddrPinCode" disabled="disabled" id="projectAddrPinCode" value="${obj.projectAddrPinCode}" maxlength="6"/>
							</div>
						</div>
						</div>
						 </c:forEach>
					</div>	
					
						
						  
					
					
		
				
				
				<!-- project Details -->




				
				
				
				
				
				
				
				
				
				
							<!--Inner wrapper stsrt here-->
			<div class="inner_wrapper">



				<h1>
					Project <span> Details</span>
				</h1>
				<div class="border">
					<div class="orange"></div>
					<div class="black"></div>
				</div>



                    <!-- PROJECT DETAILS START -->


					<div class="form-group">
						<form:hidden path="projectRegId" />
						<label class="col-sm-3 col-xs-3 control-label">Project Name<sup>*</sup></label> <input
							type="hidden" id="nextForm" name="nextForm" value="docUploadFrom" />

						<div class="col-sm-3 col-xs-3">
							<form:input path="projectDetailsModel.projectName" disabled="true"
								id="currentProjectName" cssClass="form-control input-sm" />
						</div>
						<label for="inputEmail3" class="col-sm-2 col-xs-2 control-label">Project
							Description<sup>*</sup></label>
						<div class="col-sm-3 col-xs-3">

							<form:textarea path="projectDetailsModel.projectDescription" disabled="true"
								row="3" id="currentProjectDesc" cssClass="form-control input-sm" />
						</div>


					</div>





					<div class="form-group">
						<label for="inputEmail3" class="col-sm-3 col-xs-3 control-label">Project
							Type<sup>*</sup></label>
						<div class="col-sm-3 col-xs-3">

							<form:select path="projectDetailsModel.projectType" disabled="true"
								class="form-control">
								<form:option value="Residential/Group Housing" label="Residential/Group Housing" />
								<form:option value="Commercial" label="Commercial" />
								<form:option value="Mixed Development" label="Mixed Development" />
								<form:option value="Plotted Development" label="Plotted Development" />

							</form:select>


						</div>
						<label for="inputEmail3" class="col-sm-2 col-xs-2 control-label">Project
							Status<sup>*</sup></label>
						<div class="col-sm-3 col-xs-3">

												
							<form:select path="projectDetailsModel.projectStatus" disabled="true"
								cssClass="form-control">
								<form:option value="New Project Launch" label="New Project Launch" />
								<form:option value="Delayed" label="Delayed" />
								<form:option value="Ongoing" label="Ongoing" />
								<form:option value="Completed" label="Completed" />

							</form:select>

						</div>

					</div>




					<div class="form-group">
						<label for="inputEmail3" class="col-sm-3 col-xs-3 control-label">Project
							Start Date<sup>*</sup></label>
						<div class="col-sm-3 col-xs-3">
							<div class="col-md-12 input-group">

								<form:input path="projectDetailsModel.startDate" readonly="true" disabled="true"
									cssClass="form-control input-sm augCalCssClass" />
								<span class="glyphicon glyphicon-calendar augCalImgCssClass"></span>

							</div>


						</div>
						<label for="inputEmail3" class="col-sm-2 col-xs-2 control-label">Project
							End Date<sup>*</sup></label>
						<div class="col-sm-3 col-xs-3">
							<div class="col-md-12 input-group">
								<form:input path="projectDetailsModel.completionDate" disabled="true"
									readonly="true" cssClass="form-control input-sm augCalCssClass" />
								<span class="glyphicon glyphicon-calendar augCalImgCssClass"></span>

							</div>

						</div>

					</div>




					<div class="form-group">

						<label for="inputEmail3" class="col-sm-3 col-xs-3 control-label">Total
							Area Of Land (Sq Mtr)<sup>*</sup></label>
						<div class="col-sm-3 col-xs-3">

							<form:input path="projectDetailsModel.totalAreaOfLand" rel="txtTooltip" title="Only digits are allowed." data-toggle="tooltip" data-placement="bottom" 
								cssClass="form-control input-sm numericValFld  requiredValFld" />
								<span class='requiredValFldMsg'> Please enter Total	Area Of Land.</span>
						</div>
						
						
						<label for="inputEmail3" class="col-sm-2 col-xs-2 control-label">Total
							Covered Area (Sq Mtr)<sup>*</sup></label>
						<div class="col-sm-3 col-xs-3">
							<form:input path="projectDetailsModel.totalCoverdArea" rel="txtTooltip" title="Only digits are allowed." data-toggle="tooltip" data-placement="bottom" 
								cssClass="form-control input-sm  numericValFld requiredValFld" />
								<span class='requiredValFldMsg'> Please enter Total	Covered Area.</span>
						</div>
						
					</div>



					<div class="form-group">


						<label for="inputEmail3" class="col-sm-3 col-xs-3 control-label">Total
							Open Area (Sq Mtr)<sup>*</sup></label>
						<div class="col-sm-3 col-xs-3">
							<form:input path="projectDetailsModel.totalOpenArea" rel="txtTooltip" title="Only digits are allowed." data-toggle="tooltip" data-placement="bottom" 
								cssClass="form-control input-sm numericValFld  requiredValFld" />
								<span class='requiredValFldMsg'> Please enter Total Open Area.</span>
						</div>


						<label for="inputEmail3" class="col-sm-2 col-xs-2 control-label">Estimated Cost of Construction (INR)<sup>*</sup></label>
						<div class="col-sm-3 col-xs-3">
							<form:input path="projectDetailsModel.estimatedCost" rel="txtTooltip" title="Only digits are allowed." data-toggle="tooltip" data-placement="bottom" 
								cssClass="form-control input-sm numericValFld  requiredValFld" />
								<span class='requiredValFldMsg'> Please enter Estimated Cost of Construction.</span>
						</div>




					</div>
					
					
						<div class="form-group">


						<label for="inputEmail3" class="col-sm-3 col-xs-3 control-label">Cost of Land (INR)<sup>*</sup></label>
						<div class="col-sm-3 col-xs-3">
							<form:input path="projectDetailsModel.costOfLand" rel="txtTooltip" title="Only digits are allowed." data-toggle="tooltip" data-placement="bottom" 
								cssClass="form-control input-sm numericValFld  requiredValFld" />
								<span class='requiredValFldMsg'> Please enter Cost of Land.</span>
						</div>


						<label for="inputEmail3" class="col-sm-2 col-xs-2 control-label">Total Project Cost (INR)<sup>*</sup></label>
						<div class="col-sm-3 col-xs-3">
							<form:input path="projectDetailsModel.totalProjectCost" rel="txtTooltip" title="Only digits are allowed." data-toggle="tooltip" data-placement="bottom" 
								cssClass="form-control input-sm numericValFld  requiredValFld" />
								<span class='requiredValFldMsg'> Please enter Total Project Cost.</span>
						</div>




					</div>
					

					<div class="form-group">
						<label for="inputEmail3" class="col-sm-3 col-xs-3 control-label">Project
							Address Line 1<sup>*</sup></label>
						<div class="col-sm-3 col-xs-3">
							<form:input path="projectDetailsModel.addressLine1" disabled="true"
								cssClass="form-control input-sm" />
						</div>
						<label for="inputEmail3" class="col-sm-2 col-xs-2 control-label">Project
							Address Line 2<sup>*</sup></label>
						<div class="col-sm-3 col-xs-3">
							<form:input path="projectDetailsModel.addressLine2" disabled="true"
								cssClass="form-control input-sm" />
						</div>
					</div>

                          <div class="form-group">
						<label for="inputEmail3" class="col-sm-3 col-xs-3 control-label">District<sup>*</sup></label>
						<div class="col-sm-3 col-xs-3">
							<select class="form-control" name='projectDistrictId' disabled="disabled" id="projectDist" onchange="reloadSubDistrict(this)">
						<option value='${projectRegistrationModel.projectDetailsModel.districtModel.districtId }' selected="selected" > ${projectRegistrationModel.projectDetailsModel.districtModel.districtName } </option>
						</select>
						
						</div>
						<label for="inputEmail3" class="col-sm-2 col-xs-2 control-label">Tehsil/Sub District<sup>*</sup></label>
						<div class="col-sm-3 col-xs-3">
							<select  name="subDistrictId" id="SubDistrict-projectDist"	class="form-control" disabled="disabled">
						
						<option value='${projectRegistrationModel.projectDetailsModel.subDistrictModel.subDistrictId }' selected="selected" > ${projectRegistrationModel.projectDetailsModel.subDistrictModel.subDistrictName } </option>
													</select>
						</div>

					</div>



                          <div class="form-group">
						<label for="inputEmail3" class="col-sm-3 col-xs-3 control-label">Approving Authority<sup>*</sup></label>
						<div class="col-sm-3 col-xs-3">
							<select class="form-control" name='projectDistrictId' disabled="disabled" id="projectDist" onchange="reloadSubDistrict(this)">
						<option value='${projectRegistrationModel.projectDetailsModel.approvingAuthority}' selected="selected" > ${projectRegistrationModel.projectDetailsModel.approvingAuthority} </option>
						</select>
						
						</div>
					
					</div>

					<div class="form-group">
						<label for="inputEmail3" class="col-sm-3 col-xs-3 control-label">No of Garage<sup>*</sup></label>
						<div class="col-sm-3 col-xs-3">
							<form:input path="projectDetailsModel.noOfGarageForSale" disabled="true"
								cssClass="form-control input-sm" />
						</div>

						<label for="inputEmail3" class="col-sm-2 col-xs-2 control-label">
							Area of Garage (Sq Mtr)<sup>*</sup></label>
						<div class="col-sm-3 col-xs-3">
							<form:input path="projectDetailsModel.areaOfGarageForSale" disabled="true"
								cssClass="form-control input-sm" />
						</div>


					</div>


					<div class="form-group">
						<label for="inputEmail3" class="col-sm-3 col-xs-3 control-label">No
							of Open Parking <sup>*</sup></label>
						<div class="col-sm-3 col-xs-3">
							<form:input path="projectDetailsModel.noOfParkinfForSale" disabled="true"
								cssClass="form-control input-sm" />
						</div>

						<label for="inputEmail3" class="col-sm-2 col-xs-2 control-label">
							Area Of Open Parking (Sq Mtr)<sup>*</sup></label>
						<div class="col-sm-3 col-xs-3">
							<form:input path="projectDetailsModel.areaOfParkinfForSale" disabled="true"
								cssClass="form-control input-sm" />
						</div>


					</div>



					<div class="form-group">
						<label for="inputEmail3" class="col-sm-3 col-xs-3 control-label">No
							of Covered Parking  <sup>*</sup></label>
						<div class="col-sm-3 col-xs-3">
							<form:input path="projectDetailsModel.noOfParkinfForSale" disabled="true"
								cssClass="form-control input-sm" />
						</div>

						<label for="inputEmail3" class="col-sm-2 col-xs-2 control-label">
							Area Of Covered Parking (Sq Mtr)<sup>*</sup></label>
						<div class="col-sm-3 col-xs-3">
							<form:input path="projectDetailsModel.areaOfParkinfForSale" disabled="true"
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
							<label for="inputEmail3" class="col-sm-3 control-label">Extent of development carried till date (0% to 99%)<sup>*</sup></label>
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
							<label for="inputEmail3" class="col-sm-3 control-label">Total amount of money collected form allotee<sup>*</sup></label>
							<div class="col-sm-3">

								<form:input type="text" path="projectDetailsModel.totalAmtClctedFrmAllotee"
									cssClass="form-control input-sm requiredValFld numericValFld" id="totalAmtClctedFrmAllotee"  title="e.g. Type of Flats/Plots/Villa etc." data-toggle="tooltip" data-placement="bottom"  />
									<span class='requiredValFldMsg'> Please enter Total amount of money collected form allotee.</span>
							</div>

							<label for="inputEmail3" class="col-sm-2 control-label">Total amount of money used from development of project<sup>*</sup></label>
							<div class="col-sm-3">
								<form:input type="text" path="projectDetailsModel.totalAmtUsedInPrjct" rel="txtTooltip" title="Only digits are allowed." data-toggle="tooltip" data-placement="bottom" 
									cssClass="form-control input-sm numericValFld numericValFld requiredValFld" id="noOfInventory" />
									<span class='requiredValFldMsg'> Please enter Total amount of money used from development of project.</span>
							</div>

						</div>


						<div class="form-group">

							<label for="inputEmail3" class="col-sm-3 control-label">Total amount of balance maney lying with promoter<sup>*</sup></label>
							<div class="col-sm-3">
								<form:input type="text" path="projectDetailsModel.totalBalAmtOfAlte" cssClass="form-control input-sm   requiredValFld" rel="txtTooltip" title="Only digits are allowed." data-toggle="tooltip" data-placement="bottom" 
									id="carpetArea" />
									<span class='requiredValFldMsg'> Please enter Total amount of balance maney lying with promoter.</span>
							</div>


							<label for="inputEmail3" class="col-sm-2 control-label">Is Any Subsequent Modification in Plan<sup>*</sup></label>
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

							<label for="inputEmail3" class="col-sm-3 control-label">Is Delay in the Project</label>
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

		
<c:if test="${projectRegistrationModel.projectDetailsModel.isDelayed=='Yes' }">
<div id="delaysection" >
</c:if>	
<c:if test="${projectRegistrationModel.projectDetailsModel.isDelayed!='No' }">
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

							<label for="inputEmail3" class="col-sm-3 control-label">Extected Completion Date<sup>*</sup></label>
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
									<label for="inputEmail3" class="col-sm-3 col-xs-3 control-label">Type
										of Inventory<sup>*</sup></label>
									<div class="col-sm-3 col-xs-3">
										<input type="hidden" name="devId" id="devId"
											value="${obj.devId}" />
											 <input type="text"
											name="typeOfInventory" class="form-control input-sm" disabled="disabled"
											id="typeOfInventory" value="${obj.typeOfInventory}" />
									</div>

									<label for="inputEmail3" class="col-sm-2 col-xs-2 control-label">No
										of Inventory<sup>*</sup></label>
									<div class="col-sm-3 col-xs-3">
										<input type="text" name=noOfInventory disabled="disabled"
											class="form-control input-sm" id="noOfInventory"
											value="${obj.noOfInventory}" />
									</div>
								</div>


								<div class="form-group">

									<label for="inputEmail3" class="col-sm-3 col-xs-3 control-label">Carpet
										Area (Sq Mtr)<sup>*</sup></label>
									<div class="col-sm-3 col-xs-3">
										<input type="text" name=carpetArea disabled="disabled"
											class="form-control input-sm" id="carpetArea"
											value="${obj.carpetArea}" />
									</div>


									<label for="inputEmail3" class="col-sm-2 col-xs-2 control-label">Area
										of exclusive balcony/verandah (Sq Mtr)<sup>*</sup></label>
									<div class="col-sm-3 col-xs-3">
										<input type="text" name=areaOfExclusive disabled="disabled"
											class="form-control input-sm" id="areaOfExclusive"
											value="${obj.areaOfExclusive}" />
									</div>



								</div>

								<div class="form-group">

									<label for="inputEmail3" class="col-sm-3 col-xs-3 control-label">Area
										of exclusive open terrace if any (Sq Mtr)</label>
									<div class="col-sm-3 col-xs-3 ">
										<input type="text" name=areaOfExclusiveOpenTerrace disabled="disabled"
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
							<label for="inputEmail3" class="col-sm-3 col-xs-3 control-label">Road System<sup>*</sup></label>
							<div class="col-sm-3 col-xs-3">
								<form:select path="externalDevelopmentWorkModel.roadSysetmDevBy" disabled="true"
									class="form-control">
									<form:option value="0" label="Select" />
									<form:option value="Local Authority" label="Local Authority" />
									<form:option value="Self Development" label="Self Development" />

								</form:select>


							</div>

							<label for="inputEmail3" class="col-sm-2 col-xs-2 control-label">Water
								Supply<sup>*</sup></label>
							<div class="col-sm-3 col-xs-3">
								<form:select path="externalDevelopmentWorkModel.waterSupplyBy" disabled="true"
									class="form-control">
									<form:option value="0" label="Select" />
									<form:option value="Local Authority" label="Local Authority" />
									<form:option value="Self Development" label="Self Development" />

								</form:select>
							</div>
						</div>


						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 col-xs-3 control-label">Sewege
								and Drainage System<sup>*</sup></label>
							<div class="col-sm-3 col-xs-3">
								<form:select
									path="externalDevelopmentWorkModel.sewegeAndDrainageSystemDevBy" disabled="true"
									class="form-control">
									<form:option value="0" label="Select" />
									<form:option value="Local Authority" label="Local Authority" />
									<form:option value="Self Development" label="Self Development" />

								</form:select>
							</div>

							<label for="inputEmail3" class="col-sm-2 col-xs-2 control-label">Electricity
								Supply Transfomer And Sub Station<sup>*</sup></label>
							<div class="col-sm-3 col-xs-3">
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
							<label for="inputEmail3" class="col-sm-3 col-xs-3 control-label">Solid
								Waste Management And Disposal</label>
							<div class="col-sm-3 col-xs-3">
								<form:select
									path="externalDevelopmentWorkModel.solidWasteSupplyBy" disabled="true"
									class="form-control">
									<form:option value="0" label="Select" />
									<form:option value="Local Authority" label="Local Authority" />
									<form:option value="Self Development" label="Self Development" />

								</form:select>
							</div>


						</div>
                       




						<label for="inputEmail3" class="col-sm-3 col-xs-3 control-label">
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
								<label for="inputEmail3" class="col-sm-3 col-xs-3 control-label">Work
									Description</label>
								<div class="col-sm-3 col-xs-3">
									<input type="text" name="extDevWorkDesc" class="form-control" disabled="disabled" value="${obj.workDesc}"/>
	        
								</div>
								  
							



								<div class="col-sm-3 col-xs-3">
									<select name="developeBy" class="form-control">
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
							<label for="inputEmail3" class="col-sm-3 col-xs-3 control-label">Bank
								Name<sup>*</sup></label>
							<div class="col-sm-3 col-xs-3">
							
								<select  name="projectBankId" class="form-control" disabled="disabled">
								         <option value='${projectRegistrationModel.projectBankDetailsModel.bankModel.bankId }' selected="selected"> ${projectRegistrationModel.projectBankDetailsModel.bankModel.bankName} </option>
						        		</select>	
								
							</div>

							<label for="inputEmail3" class="col-sm-2 col-xs-2 control-label">Branch
								Name<sup>*</sup></label>
							<div class="col-sm-3 col-xs-3">
								<form:input path="projectBankDetailsModel.bankBranch" disabled="true"
									cssClass="form-control input-sm" />
							</div>
						</div>



						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 col-xs-3 control-label">Account
								No.<sup>*</sup></label>
							<div class="col-sm-3 col-xs-3">
								<form:input path="projectBankDetailsModel.accountNumber" disabled="true"
									cssClass="form-control input-sm" maxlength="17"/>
							</div>

							<label for="inputEmail3" class="col-sm-2 col-xs-2 control-label">IFSC
								Code<sup>*</sup></label>
							<div class="col-sm-3 col-xs-3">
								<form:input path="projectBankDetailsModel.ifscCode" disabled="true"
									cssClass="form-control input-sm" />
							</div>
						</div>


						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 col-xs-3 control-label">State/UT<sup>*</sup></label>
							<div class="col-sm-3 col-xs-3">
								<select
									name="bankStateUtId" disabled="disabled"
									class="form-control">
						                 <option value='${projectRegistrationModel.projectBankDetailsModel.districtModel.stateUtModel.stateUtId }' selected="selected"> ${projectRegistrationModel.projectBankDetailsModel.districtModel.stateUtModel.stateUtName} </option>
								</select>
								
								
								
								
								

							</div>

							<label for="inputEmail3" class="col-sm-2 col-xs-2 control-label">District<sup>*</sup></label>
							<div class="col-sm-3 col-xs-3">
								<select
									name="bankDistrictId" disabled="disabled"
									class="form-control">

						<option value='${projectRegistrationModel.projectBankDetailsModel.districtModel.districtId }' selected="selected"> ${projectRegistrationModel.projectBankDetailsModel.districtModel.districtName } </option>
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
									<label for="inputEmail3" class="col-sm-3 col-xs-3 control-label">Agent Registration No.</label>
									<div class="col-sm-3 col-xs-3">
										<div class="col-md-12 input-group">
											<input type="text" id="fldnogetagent" disabled="disabled" name="agentRegNo" class="form-control  dynaselectfld" >
												 <label class="input-group-addon btn"
												    for="testdate" >
												
												 <span id='getagent' class="glyphicon glyphicon-search dynaselectfld" onclick="getAgentDetails(this)"> </span>
											</label>
										</div>
									</div>

                                    <label for="inputEmail3" id='resultgetagent' class="col-sm-2 col-xs-2 control-label dynaselectfld"> </label>
									<div class="col-sm-3 col-xs-3">
									</div>
								</div>



								<div class="form-group">


									<label for="inputEmail3" class="col-sm-3 col-xs-3 control-label">Agent
										Name</label>
									<div class="col-sm-3 col-xs-3">
										<input class="form-control input-sm dynaselectfld"  id='fldnamenogetagent' disabled name="agentName" />
									</div>

									<label for="inputEmail3" class="col-sm-2 col-xs-2 control-label dynaselectfld">
										Agent Address</label>
									<div class="col-sm-3 col-xs-3">
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
									<label for="inputEmail3" class="col-sm-3 col-xs-3 control-label">Agent
										Registration No.</label>
									<div class="col-sm-3 col-xs-3">
										<div class="col-md-12 input-group">
											<input type="text" id="" name="agentRegNo" disabled="disabled" class="form-control"	value="${agent.agent.agentRegistrationNo }"> 
												<label class="input-group-addon btn"
												for="testdate" onclick="getAgentDetails();">
												 <span	class="glyphicon glyphicon-search dynaselectfld" id='getagent<%=agnt %>'  onclick="getAgentDetails(this)"></span>
											</label>
										</div>
									</div>
									
									  <label for="inputEmail3" id='resultgetagent<%=agnt %>' class="col-sm-2 col-xs-2 control-label dynaselectfld"> </label>


								</div>



								
								<div class="form-group">


									<label for="inputEmail3" class="col-sm-3 col-xs-3 control-label">Agent
										Name</label>
									<div class="col-sm-3 col-xs-3">
										<input class="form-control input-sm dynaselectfld"  id='fldnamenogetagent<%=agnt %>' disabled name="agentName" />
									</div>

									<label for="inputEmail3" class="col-sm-2 col-xs-2 control-label dynaselectfld">
										Agent Address</label>
									<div class="col-sm-3 col-xs-3">
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
									<label for="inputEmail3" class="col-sm-3 col-xs-3 control-label">
										Architect Name<sup>*</sup></label>
									<div class="col-sm-3 col-xs-3">
										<input class="form-control input-sm" type="text" disabled="disabled"
											name="architectName"  value="${obj.architectName}"/>
											  <input  type="hidden" name="projectArchId"  value="${obj.projectArchId}"/>
                                           
									</div>

									<label for="inputEmail3" class="col-sm-2 col-xs-2 control-label">
										 Email ID<sup>*</sup></label>
									<div class="col-sm-3 col-xs-3">
										<input class="form-control input-sm" name="arctEmailId" disabled="disabled"
											 value='${obj.emailId}' />
									</div>



								</div>


							 <div class="form-group">
									<label for="inputEmail3" class="col-sm-3 col-xs-3 control-label">Addrees Line 1<sup>*</sup>
									 </label>
									<div class="col-sm-3 col-xs-3">
										<input class="form-control input-sm" name="arctAddressLine1" disabled="disabled"
											id="arctAddressLine1" value="${obj.addressLine1}" />
									</div>

									<label for="inputEmail3" class="col-sm-2 col-xs-2 control-label">
										Address Line 2<sup>*</sup></label>
									<div class="col-sm-3 col-xs-3">
										<input class="form-control input-sm" name="arctAddressLine2" disabled="disabled"
											id="arctAddressLine2" value="${obj.addressLine2}"/>
									</div>

								</div>
								
								
								
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 col-xs-3 control-label">State<sup>*</sup>
									 </label>
									<div class="col-sm-3 col-xs-3">
										
					          <select name="arctStateUtId" id="arctSate<%=xx10 %>" disabled="disabled" onchange="reloadChildDropdown(this)" class="form-control dynaselectfld">
						 
						                 <option value='${obj.districtModel.stateUtModel.stateUtId }' selected="selected"> ${obj.districtModel.stateUtModel.stateUtName} </option>
						        </select>
											
									</div>

									<label for="inputEmail3" class="col-sm-2 col-xs-2 control-label">
										District<sup>*</sup></label>
									<div class="col-sm-3 col-xs-3">
								
								  <select class="form-control dynaselectfld" name="arctProjDistrictId" disabled="disabled"  id="District-arctSate<%=xx10 %>" >
									<option selected="selected" value="${obj.districtModel.districtId}"> ${obj.districtModel.districtName} </option>
									
																		
								</select>
											
									</div>

								</div>
								
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 col-xs-3 control-label">Pin Code<sup>*</sup>
									 </label>
									<div class="col-sm-3 col-xs-3">
										<input class="form-control input-sm" name="arctPineCode" disabled="disabled"
											id="arctPineCode" value='${obj.pinCode}'/>
									</div>

									<label for="inputEmail3" class="col-sm-2 col-xs-2 control-label">
										Year
										of establishment<sup>*</sup></label>
									<div class="col-sm-3 col-xs-3">
										<input class="form-control input-sm" name="arctYearOfEst" disabled="disabled"
											id="arctYearOfEst" value='${obj.yearOfEstablishment}'/>
									</div>

								</div>
								


								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 col-xs-3 control-label">Key Projects completed<sup>*</sup></label>
									<div class="col-sm-3 col-xs-3">
										<input class="form-control input-sm"
											name="arctKeyProjectCompleted" id="arctKeyProjectCompleted" disabled="disabled" value='${obj.keyProject}' />
									</div>

									<label for="inputEmail3" class="col-sm-2 col-xs-2 control-label">
										</label>
									<div class="col-sm-3 col-xs-3">
										
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
									<label for="inputEmail3" class="col-sm-3 col-xs-3 control-label">
										Engineer Name<sup>*</sup></label>
									<div class="col-sm-3 col-xs-3">
										<input class="form-control input-sm" name="engineerName" disabled="disabled"  value="${obj.engineerName}"
											id="engineerName" />
											<input type="hidden" name="strcStcEngId" disabled="disabled" value="${obj.projStcEngId}"/>
									</div>

									<label for="inputEmail3" class="col-sm-2 col-xs-2 control-label">
								 Email ID<sup>*</sup></label>
								<div class="col-sm-3 col-xs-3">
									<input class="form-control input-sm" id="strcEmailId" disabled="disabled" name="strcEmailId"
										value='${obj.emailId}' />
								</div>



							</div>

                             <div class="form-group">
									<label for="inputEmail3" class="col-sm-3 col-xs-3 control-label">Addrees Line 1<sup>*</sup>
									 </label>
									<div class="col-sm-3 col-xs-3">
										<input class="form-control input-sm" name="strcAddressLine1" disabled="disabled"
											id="strcAddressLine1" value='${obj.addressLine1}'/>
									</div>

									<label for="inputEmail3" class="col-sm-2 col-xs-2 control-label">
										Address Line 2<sup>*</sup></label>
									<div class="col-sm-3 col-xs-3">
										<input class="form-control input-sm" name="strcAddressLine2" disabled="disabled"
											id="strcAddressLine2" value='${obj.addressLine2}' />
									</div>

								</div>
								
								
								
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 col-xs-3 control-label">State<sup>*</sup>
									 </label>
									<div class="col-sm-3 col-xs-3">
										
					          <select name="strcStateUtId" id="strcSate<%=xx2 %>"  onchange="reloadChildDropdown(this)" disabled="disabled" class="form-control dynaselectfld">
						  
						                 <option value='${obj.districtModel.stateUtModel.stateUtId }' selected="selected"> ${obj.districtModel.stateUtModel.stateUtName} </option>
						         </select>
											
									</div>

									<label for="inputEmail3" class="col-sm-2 col-xs-2 control-label">
										District<sup>*</sup></label>
									<div class="col-sm-3 col-xs-3">
								
								  <select class="form-control dynaselectfld" name="strcProjDistrictId" disabled="disabled" id="District-strcSate<%=xx2 %>" >
			
									<option selected="selected" value="${obj.districtModel.districtId}"> ${obj.districtModel.districtName} </option>
																		
								</select>
											
									</div>

								</div>
								
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 col-xs-3 control-label">Pin Code<sup>*</sup>
									 </label>
									<div class="col-sm-3 col-xs-3">
										<input class="form-control input-sm" name="strcPineCode" disabled="disabled"
										
											id="strcPineCode" value="${obj.pinCode}" />
									</div>

									<label for="inputEmail3" class="col-sm-2 col-xs-2 control-label">
										Year
										of establishment<sup>*</sup></label>
									<div class="col-sm-3 col-xs-3">
										<input class="form-control input-sm" name="strcYearOfEst" disabled="disabled"
											id="strcYearOfEst" value="${obj.yearOfEstablishment}" />
									</div>

								</div>
								


								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 col-xs-3 control-label">Key projects completed<sup>*</sup></label>
									<div class="col-sm-3 col-xs-3">
										<input class="form-control input-sm"
											name="strcKeyProjectCompleted" id="strcKeyProjectCompleted" disabled="disabled" value="${obj.keyProject}" />
									</div>

									<label for="inputEmail3" class="col-sm-2 col-xs-2 control-label">
										</label>
									<div class="col-sm-3 col-xs-3">
										
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


									<label for="inputEmail3" class="col-sm-3 col-xs-3 control-label">Contractor Name<sup>*</sup></label>
									<div class="col-sm-3 col-xs-3">
									   <input type="hidden" name="projectCntrId" value="${obj.projectCntrId}"/> 
										<input class="form-control input-sm" name="contractorName" disabled="disabled"
											 value="${obj.contractorName}" />
									</div>

	                            <label for="inputEmail3" class="col-sm-2 col-xs-2 control-label">
								 Email ID<sup>*</sup></label>
								<div class="col-sm-3 col-xs-3">
									<input class="form-control input-sm"  id="cntrEmailId" name="cntrEmailId" disabled="disabled" value="${obj.emailId}"
										 />
								</div>



							</div>

                             <div class="form-group">
									<label for="inputEmail3" class="col-sm-3 col-xs-3 control-label">Addrees Line 1<sup>*</sup>
									 </label>
									<div class="col-sm-3 col-xs-3">
										<input class="form-control input-sm" name="cntrAddressLine1" disabled="disabled"
											id="cntrAddressLine1" value="${obj.addressLine1}"/>
									</div>

									<label for="inputEmail3" class="col-sm-2 col-xs-2 control-label">
										Address Line 2<sup>*</sup></label>
									<div class="col-sm-3 col-xs-3">
										<input class="form-control input-sm" name="cntrAddressLine2" disabled="disabled"
											id="cntrAddressLine2" value="${obj.addressLine2}"/>
									</div>

								</div>
								
								
								
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 col-xs-3 control-label">State<sup>*</sup>
									 </label>
									<div class="col-sm-3 col-xs-3">
										
					          <select name="cntrStateUtId" id="cntrSate<%=xx3 %>"  onchange="reloadChildDropdown(this)" disabled="disabled" class="form-control dynaselectfld">
						                 <option value='${obj.districtModel.stateUtModel.stateUtId }' selected="selected"> ${obj.districtModel.stateUtModel.stateUtName} </option>
						       </select>
											
									</div>

									<label for="inputEmail3" class="col-sm-2 col-xs-2 control-label">
										District<sup>*</sup></label>
									<div class="col-sm-3 col-xs-3">
								
								  <select class="form-control dynaselectfld" name="cntrProjDistrictId" disabled="disabled" id="District-cntrSate<%=xx3 %>" >
									<option selected="selected" value="${obj.districtModel.districtId}"> ${obj.districtModel.districtName} </option>
																		
								</select>
											
									</div>

								</div>
								
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 col-xs-3 control-label">Pin Code<sup>*</sup>
									 </label>
									<div class="col-sm-3 col-xs-3">
										<input class="form-control input-sm" name="cntrPineCode" disabled="disabled"
											id="cntrPineCode" value="${obj.pinCode}"/>
									</div>

									<label for="inputEmail3" class="col-sm-2 col-xs-2 control-label">
										Year
										of establishment<sup>*</sup></label>
									<div class="col-sm-3 col-xs-3">
										<input class="form-control input-sm" name="cntrYearOfEst" disabled="disabled"
											id="cntrYearOfEst" value="${obj.yearOfEstablishment}"/>
									</div>

								</div>
								


								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 col-xs-3 control-label">Key Projects completed<sup>*</sup></label>
									<div class="col-sm-3 col-xs-3">
										<input class="form-control input-sm" name="cntrKeyProjectCompleted" disabled="disabled" id="cntrKeyProjectCompleted"  value="${obj.keyProject}" />
									</div>

									<label for="inputEmail3" class="col-sm-2 col-xs-2 control-label">
										</label>
									<div class="col-sm-3 col-xs-3">
										
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
					     <input type="file"   id="auditedBalFile" name="otherFileDoc" disabled="disabled" />
					     
					     <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.auditedBalSheetDoc1.documentId}">${projectRegistrationModel.projectDocModel.auditedBalSheetDoc1.fileName}
							</a>
							<input type="hidden" name="fieldName" value="auditedBalSheetDoc1"/>
							
					     </td>
					     <td><input type="file"  id="auditedBalFile" name="otherFileDoc" disabled="disabled"/>
					         <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.auditedBalSheetDoc2.documentId}">
					         ${projectRegistrationModel.projectDocModel.auditedBalSheetDoc2.fileName}
							</a>
					
							<input type="hidden" name="fieldName" value="auditedBalSheetDoc2"/>
							</td>
					     <td><input type="file"  id="auditedBalFile" name="otherFileDoc" disabled="disabled"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.auditedBalSheetDoc3.documentId}">
					         ${projectRegistrationModel.projectDocModel.auditedBalSheetDoc3.fileName}
							</a>
							<input type="hidden" name="fieldName" value="auditedBalSheetDoc3"/>
							</td>
					     
					    
					  </tr>
					  
					  <tr>
					    <td>Audited ProfitLoss Statement</td>
					      
					     <td>
					     <input type="file"  id="auditedBalFile" name="otherFileDoc" disabled="disabled"/>
							<input type="hidden" name="fieldName" value="auditedProfitLossSheetDoc1"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.auditedProfitLossSheetDoc1.documentId}">
					         ${projectRegistrationModel.projectDocModel.auditedProfitLossSheetDoc1.fileName}
							</a>
							
					     </td>
					     <td><input type="file"  id="auditedBalFile" name="otherFileDoc" disabled="disabled"/>
							<input type="hidden" name="fieldName" value="auditedProfitLossSheetDoc2"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.auditedProfitLossSheetDoc2.documentId}">
					         ${projectRegistrationModel.projectDocModel.auditedProfitLossSheetDoc2.fileName}
							</a>
							</td>
					     <td><input type="file"  id="auditedBalFile" name="otherFileDoc" disabled="disabled"/>
							<input type="hidden" name="fieldName" value="auditedProfitLossSheetDoc3"/>
								 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.auditedProfitLossSheetDoc3.documentId}">
					         ${projectRegistrationModel.projectDocModel.auditedProfitLossSheetDoc3.fileName}
							</a>
							</td>
					  
					  </tr>
					  
					  
					   <tr>
					    <td>Director's Report</td>
					      
					     <td>
					     <input type="file"   id="auditedBalFile" name="otherFileDoc" disabled="disabled"/>
							<input type="hidden" name="fieldName" value="directorReportDoc1"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.directorReportDoc1.documentId}">
					         ${projectRegistrationModel.projectDocModel.directorReportDoc1.fileName}
							</a>
							
					     </td>
					     <td><input type="file"  id="auditedBalFile" name="otherFileDoc" disabled="disabled"/>
							<input type="hidden" name="fieldName" value="directorReportDoc2"/>
								 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.directorReportDoc2.documentId}">
					         ${projectRegistrationModel.projectDocModel.directorReportDoc2.fileName}
							</a>
							</td>
					     <td><input type="file"  id="auditedBalFile" name="otherFileDoc" disabled="disabled"/>
							<input type="hidden" name="fieldName" value="directorReportDoc3"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.directorReportDoc3.documentId}">
					         ${projectRegistrationModel.projectDocModel.directorReportDoc3.fileName}
							</a>
							</td>
					  
					  </tr>
					  
					  
					  
					  
					  
					  <tr>
					    <td>Cash Flow Statement </td>
					      
					     <td>
					     <input type="file"   id="auditedBalFile" name="otherFileDoc" disabled="disabled"/>
							<input type="hidden" name="fieldName" value="cashFlowStmtFileDoc1"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.cashFlowStmtFileDoc1.documentId}">
					         ${projectRegistrationModel.projectDocModel.cashFlowStmtFileDoc1.fileName}
							</a>
							
					     </td>
					     <td><input type="file"  id="auditedBalFile" name="otherFileDoc" disabled="disabled"/>
							<input type="hidden" name="fieldName" value="cashFlowStmtFileDoc2"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.cashFlowStmtFileDoc2.documentId}">
					         ${projectRegistrationModel.projectDocModel.cashFlowStmtFileDoc2.fileName}
							</a>
							</td>
					     <td><input type="file"  id="auditedBalFile" name="otherFileDoc" disabled="disabled"/>
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
						
						
				<table class="table table-responsive table-bordered"> 
					
					
					 <tr>
					    <td>PAN Card<sup style="color:red;">*</sup> </td>
					      
					     <td>
					   <input type="file"   id="panCardFile" name="otherFileDoc" disabled="disabled"/>
							<input type="hidden" name="fieldName" value="panCardDoc"/>
							<input type="hidden" name="flg"value="0"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.panCardDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.panCardDoc.fileName}
							</a>
							</td>
							
						
							
					     <td>Encumbrance Certificate<sup style="color:red;">*</sup> </td>
					      <td>
					  <input type="file"   id="panCardFile" name="otherFileDoc" disabled="disabled"/>
							<input type="hidden" name="fieldName" value="encumbranceCertificateDoc"/>
							<input type="hidden" name="flg"value="0"/>
						 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.encumbranceCertificateDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.encumbranceCertificateDoc.fileName}
							</a>
					     </td>
					    
					  </tr>
					  
					  
					   <tr>
					    <td>Commencement Certificate<sup style="color:red;">*</sup> </td>
					      
					     <td>
					    <input type="file"   id="commencementCertFile" name="otherFileDoc" disabled="disabled"/>
							<input type="hidden" name="fieldName" value="commencementCertDoc"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.commencementCertDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.commencementCertDoc.fileName}
							</a>
					     </td>
					     <td>Approved Building/Plotting Plan<sup style="color:red;">*</sup> </td>
					      <td>
					 <input type="file"   id="approvedSanctionPlanFile" name="otherFileDoc" disabled="disabled"/>
							<input type="hidden" name="fieldName" value="approveSacPlanDoc"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.approveSacPlanDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.approveSacPlanDoc.fileName}
							</a>
					     </td>
					    
					  </tr>
					
					  <tr>
					    <td>Approved Layout Pla<sup style="color:red;">*</sup> </td>
					      
					     <td>
					  <input type="file"   id="approvedLayoutPlanFile" name="otherFileDoc" disabled="disabled"/>
							<input type="hidden" name="fieldName" value="approveLayoutPlanDoc"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.approveLayoutPlanDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.approveLayoutPlanDoc.fileName}
							</a>
					     </td>
					     <td>Proforma of Agreement for Sale<sup style="color:red;">*</sup> </td>
					      <td>
					  <input type="file" Class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="performaForSaleOfAgreement" name="otherFileDoc"/>
							<input type="file"   id="performaForSaleOfAgreement" name="otherFileDoc" disabled="disabled"/>
							<input type="hidden" name="fieldName" value="performaForSaleOfAgreement"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.performaForSaleOfAgreement.documentId}">
					         ${projectRegistrationModel.projectDocModel.performaForSaleOfAgreement.fileName}
							</a>
					     </td>
					    
					  </tr>
					<tr>
					    <td>Land documents & Location<sup style="color:red;">*</sup> </td>
					      
					     <td>
					 <input type="file"   id="landDocumentsFile" name="otherFileDoc" disabled="disabled"/>
							<input type="hidden" name="fieldName" value="landLocationFileDoc"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.landLocationFileDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.landLocationFileDoc.fileName}
							</a>
					     </td>
					     <td>Approved Section Of Building/Infrastructure Plan of Plotting<sup style="color:red;">*</sup> </td>
					      <td>
					<input type="file"   id="sanctionedLayoutPlan" name="otherFileDoc" disabled="disabled"/>
							<input type="hidden" name="fieldName" value="sanctionedLayoutPlanDoc"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.sanctionedLayoutPlanDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.sanctionedLayoutPlanDoc.fileName}
							</a>
					     </td>
					    
					  </tr>
					
					<tr>
					    <td>Area Development Plan Of Project Area<sup style="color:red;">*</sup> </td>
					      
					     <td>
					<input type="file"  id="areaDevelopmentPlanFile" name="otherFileDoc" disabled="disabled"/>
							<input type="hidden" name="fieldName" value="areaDevelopmentDoc"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.areaDevelopmentDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.areaDevelopmentDoc.fileName}
							</a>
					     </td>
					     <td>Proforma of Allotment Letter<sup style="color:red;">*</sup> </td>
					      <td>
					<input type="file"   id="performaOfAllotmentLetterFile" name="otherFileDoc" disabled="disabled"/>
							<input type="hidden" name="fieldName" value="performaOfAllotmentLetterDoc"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.performaOfAllotmentLetterDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.performaOfAllotmentLetterDoc.fileName}
							</a>
					     </td>
					    
					  </tr>
					
					<tr>
					    <td>Brochure of Current<sup style="color:red;">*</sup> </td>
					      
					     <td>
					<input type="file"  id="brochureOfCurrentProjectFile" name="otherFileDoc" disabled="disabled"/>
							<input type="hidden" name="fieldName" value="brochureOfCurrentProjectDoc"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.brochureOfCurrentProjectDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.brochureOfCurrentProjectDoc.fileName}
							</a>
					     </td>
					     <td>Proforma For Sale Deed<sup style="color:red;">*</sup> </td>
					      <td>
					<input type="file"  id="declarationFormb" name="otherFileDoc" disabled="disabled"/>
							<input type="hidden" name="fieldName" value="agreementFileDoc"/>
							                                             
							<a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.agreementFileDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.agreementFileDoc.fileName}
							</a>
					     </td>
					    
					  </tr>
					  
					  <tr>
					    <td>Project Specification<sup style="color:red;">*</sup> </td>
					      
					     <td>
						<input type="file" class="form-control" rel="txtTooltip" title="Type of structure, Flooring, Door Windows, Plumbing & Sanitary Wear, Fire, Lift & Capacity, etc Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="brochureOfCurrentProjectFile" name="otherFileDoc"/>
							<span class='requiredValFldMsg'> Please select Project Specification Document.</span>
							<input type="hidden" name="fieldName" value="projectSpecificDoc"/>
							
							<a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.projectSpecificDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.projectSpecificDoc.fileName}
							</a>
					     </td>
					     <td>Collaboration Agreement/Development Agreement/Joint Development Agreement/Other Agreement<sup style="color:red;">*</sup> </td>
					      <td>
					<input type="file" id="jointDevelopmentAgreementId" name="otherFileDoc" disabled="disabled"/>
							<input type="hidden" name="fieldName" value="jointDevelopmentAgreement"/>
							<a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.jointDevelopmentAgreement.documentId}">
					         ${projectRegistrationModel.projectDocModel.jointDevelopmentAgreement.fileName}
							</a>

					     </td>
					    
					  </tr>
					
					
				<!-- 	</table>  -->
				
				
			<!-- <div class="drop_shadow">
						
						</div> -->
	<tr>
	<c:if test="${projectRegistrationModel.projectDetailsModel.isSubSqChangeInPlan=='Yes' }">
		<td>Existing  Layout Plan<sup>*</sup><td>
						
							<input type="file" class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="approvedLayoutPlanFile" name="otherFileDoc"/>
							<span class='requiredValFldMsg'> Please select Existing  Layout Plan.</span>
							<input type="hidden" name="fieldName" value="extendedLayoutPlanDoc"/>
								 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.extendedLayoutPlanDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.extendedLayoutPlanDoc.fileName}
							</a>
						
						<td>Existing Section Plan and Specification <sup>*</sup></td>
						<td>
							<input type="file" class="form-control " rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="performaForSaleOfAgreement" name="otherFileDoc"/>
							<span class='requiredValFldMsg'> Please select Existing Section Plan and Specification.</span>
							<input type="hidden" name="fieldName" value="extendedSacPlanDoc"/>
						 
	 				<a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.extendedSacPlanDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.extendedSacPlanDoc.fileName}
							</a>
							</td>

					
					
					
</c:if>		
</tr>

 <tr>
					    <td>Any other document (Rights/Title/Interest/Name)</td>
					      
					     <td>
					     <input type="file" id="anyOtherDocId" name="otherFileDoc" disabled="disabled"/>
							<input type="hidden" name="fieldName" value="anyOtherDoc"/>
							<a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.anyOtherDoc.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.anyOtherDoc.fileName}
							</a>
					     </td>
					     <td>Approval/NOC under section 109 of KLR Act 1961</td>
					      <td>
					  <input type="file" id="section109Id" name="otherFileDoc" disabled="disabled"/>
							<input type="hidden" name="fieldName" value="section109"/>
							<a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.section109.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.section109.fileName}
							</a>
					     </td>
					    
					  </tr>
					  
					  
					 <tr>
					    <td>Conversion Certificate under Sec 95 of the KLR Act 1961</td>
					      
					     <td>
					   <input type="file" id="section95Id" name="otherFileDoc" disabled="disabled"/>
							<input type="hidden" name="fieldName" value="section95"/>
							<a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.section95.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.section95.fileName}
							</a>
					     </td>
					     <td>Approval/NOC under Sec 14 of the KTCP Act</td>
					      <td>
					 	<input type="file" id="section14Id" name="otherFileDoc" disabled="disabled"/>
							<input type="hidden" name="fieldName" value="section14"/>
							<a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.section14.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.section14.fileName}
							</a>
					     </td>
					    
					  </tr>

			</table>	
			
			
			<h1>Declaration (Form B)</h1>					
						<div class="drop_shadow">
						
						</div>	

					<div class="form-group">
						<label class="col-sm-3 control-label">Declaration (Form B)<sup>*</sup></label>
						<div class="col-sm-3">
							<input type="file"   id="declarationFormb" name="otherFileDoc" disabled="disabled"/>
							<input type="hidden" name="fieldName" value="declarationFormbDoc"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.declarationFormbDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.declarationFormbDoc.fileName}
							</a>
						</div>
						</div>		
	<div class="drop_shadow">
						
						</div>
						
						
		<h1>
					Conveyance Deed / Title Deed
				</h1>
						<div class="drop_shadow">
						
						</div>	
					
						<div class="form-group">
						<label class="col-sm-3 control-label">Khatha<sup>*</sup></label>
						<div class="col-sm-3">
							<input type="file" id="titleDeedId" name="otherFileDoc" disabled="disabled"/>
						
							<input type="hidden" name="fieldName" value="titleDeed"/>
								<a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.titleDeed.documentId}">
					         ${projectRegistrationModel.projectDocModel.titleDeed.fileName}
							</a>
						</div>
					</div>	
		
	
	<div class="drop_shadow">
						
						</div>					
						
	
	
	<h1>
					Nocs (Upload which are Applicable)
				</h1>									
	<div class="drop_shadow">
						
</div>
					
					<table class="table table-responsive table-bordered"> 
					
					   <tr>
					    <td>Fire Force Department</td>
					      
					     <td>
					   <input type="file" id="fireForceDeptId" name="otherFileDoc" disabled="disabled"/>
							<input type="hidden" name="fieldName" value="fireForceDept"/>
							<a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.fireForceDept.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.fireForceDept.fileName}
							</a>
					     </td>
					     <td>Airport Authority of India</td>
					      <td>
					 	<input type="file" id="airportAuthorityOfIndiaId" name="otherFileDoc" disabled="disabled"/>
							<input type="hidden" name="fieldName" value="airportAuthorityOfIndia"/>
							<a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.airportAuthorityOfIndia.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.airportAuthorityOfIndia.fileName}
							</a>
					     </td>
					    
					  </tr>
					  
					  
					  <tr>
					    <td>BESCOM</td>
					      
					     <td>
					    <input type="file" id="bescomId" name="otherFileDoc" disabled="disabled"/>
							<input type="hidden" name="fieldName" value="bescom"/>
							<a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.bescom.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.bescom.fileName}
							</a>
					     </td>
					     <td>BWSSB</td>
					      <td>
					 	<input type="file" id="bwssbId" name="otherFileDoc" disabled="disabled"/>
							<input type="hidden" name="fieldName" value="bwssb"/>
							<a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.bwssb.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.bwssb.fileName}
							</a>
					     </td>
					    
					  </tr>
					  
					   <tr>
					    <td>KSPCB</td>
					      
					     <td>
					  <input type="file" id="kspcbId" name="otherFileDoc" disabled="disabled"/>
							<input type="hidden" name="fieldName" value="kspcb"/>
							<a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.kspcb.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.kspcb.fileName}
							</a>
					     </td>
					     <td>SEIAA</td>
					      <td>
					 		<input type="file" id="seiaaId" name="otherFileDoc" disabled="disabled"/>
							<input type="hidden" name="fieldName" value="seiaa"/>
							<a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.seiaa.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.seiaa.fileName}
							</a>
					     </td>
					    
					  </tr>
					  
					   <tr>
					    <td>BSNL</td>
					      
					     <td>
					 	<input type="file" id="bsnlId" name="otherFileDoc" disabled="disabled"/>
							<input type="hidden" name="fieldName" value="bsnl"/>
							<a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.bsnl.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.bsnl.fileName}
							</a>
					     </td>
					     <td>Lift Authorities
					</td>
						<td>
							<input type="file" id="liftAuthoritiesId" name="otherFileDoc" disabled="disabled"/>
							<input type="hidden" name="fieldName" value="liftAuthorities"/>
							<a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.liftAuthorities.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.liftAuthorities.fileName}
							</a>
						</td>
					    
					  </tr>
					  
					   <tr>
					    <td>Existing Layout Plan<sup>*</sup></td>
					      
					     <td>
						<input type="file" id="existingLayoutPlanId" name="otherFileDoc" disabled="disabled"/>
							<input type="hidden" name="fieldName" value="existingLayoutPlan"/>
								<a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.existingLayoutPlan.documentId}">
					         ${projectRegistrationModel.projectDocModel.existingLayoutPlan.fileName}
							</a>
					     </td>
					     <td>Existing Section Plan and Specification <sup>*</sup></td>
					      <td>
							<input type="file" id="existingSectionPlanandSpecId" name="otherFileDoc" disabled="disabled"/>
							<input type="hidden" name="fieldName" value="existingSectionPlanandSpec"/>
							<a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.existingSectionPlanandSpec.documentId}">
					         ${projectRegistrationModel.projectDocModel.existingSectionPlanandSpec.fileName}
							</a>
					     </td>
					    
					  </tr>
					  
					   <tr>
					    <td>Change of Land Use<sup>*</sup></td>
					      
					     <td>
							<input type="file" id="changeOfLandUseId" name="otherFileDoc" disabled="disabled"/>
							<input type="hidden" name="fieldName" value="changeOfLandUse"/>
							<a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.changeOfLandUse.documentId}">
					         ${projectRegistrationModel.projectDocModel.changeOfLandUse.fileName}
							</a>
					     </td>
					     <td>BMRCL</td>
					      <td>
					 		<input type="file" id="bmrclId" name="otherFileDoc" disabled="disabled"/>
							<input type="hidden" name="fieldName" value="bmrcl"/>
							<a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.bmrcl.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.bmrcl.fileName}
							</a>
					     </td>
					    
					  </tr>
					  
					   <tr>
					    <td>Urban Land Ceiling</td>
					      
					     <td>
					 	<input type="file" class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<input type="file" id="urbanLandCeilingId" name="otherFileDoc" disabled="disabled"/>
							<input type="hidden" name="fieldName" value="urbanLandCeiling"/>
							<a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.urbanLandCeiling.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.urbanLandCeiling.fileName}
							</a>
					     </td>
					     <td>Sectional Drawing of the apartments</td>
					      <td>
					 		<input type="file" id="sectionalDrawingOfTheApartmentsId" name="otherFileDoc" disabled="disabled"/>
							<input type="hidden" name="fieldName" value="sectionalDrawingOfTheApartments"/>
							<a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.sectionalDrawingOfTheApartments.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.sectionalDrawingOfTheApartments.fileName}
							</a>
					     </td>
					    
					  </tr>
					  
					    <tr>
					    <td>Bangalore Urban Arts Commission</td>
					      
					     <td>
					 	<input type="file" id="bangaloreUrbanArtsCommissionId" name="otherFileDoc" disabled="disabled"/>
							<input type="hidden" name="fieldName" value="bangaloreUrbanArtsCommission"/>
							<a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.bangaloreUrbanArtsCommission.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.bangaloreUrbanArtsCommission.fileName}
							</a>
					     </td>
					     <td>Inspector Of Factories Controller Of Explosives Railways</td>
					      <td>
					 			<input type="file" id="urbanLandCeilingId" name="otherFileDoc" disabled="disabled"/>
							<input type="hidden" name="fieldName" value="inspectorOfFactoriesCntrlOfExplosivesRailways"/>
							<a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.inspectorOfFactoriesCntrlOfExplosivesRailways.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.inspectorOfFactoriesCntrlOfExplosivesRailways.fileName}
							</a>
					     </td>
					    
					  </tr>
					  
					   <tr>
					    <td>Dist Magistrate</td>
					      
					     <td>
					 	<input type="file" id="distMagistrateId" name="otherFileDoc" disabled="disabled"/>
							<input type="hidden" name="fieldName" value="distMagistrate"/>
							<a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.distMagistrate.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.distMagistrate.fileName}
							</a>
					     </td>
					     <td>Coastal Regulation Zone Authority</td>
					      <td>
					 			<input type="file" id="coastalRegulationZoneAuthorityId" name="otherFileDoc" disabled="disabled"/>
							<input type="hidden" name="fieldName" value="coastalRegulationZoneAuthority"/>
							<a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.coastalRegulationZoneAuthority.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.coastalRegulationZoneAuthority.fileName}
							</a>
					     </td>
					    
					  </tr>
					  
					  
					  <tr>
					  
					   <td>Certificate from Registered Engineer indicating the structural safety of the building (for Apartments) </td>
					   <td>
						<input type="file" id="engrIndicateStructuralId" name="otherFileDoc" disabled="disabled"/>
							<input type="hidden" name="fieldName" value="engrIndicateStructural"/>
							<a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.engrIndicateStructural.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.engrIndicateStructural.fileName}
							</a>
						</td>
					
					
						  <td>NOC in case of building proposals abutting to neighbouring properties</td>
						  <td>
							<input type="file" id="nocBuildingAbuttingToNeighbourPropertiesId" name="otherFileDoc" disabled="disabled"/>
							<input type="hidden" name="fieldName" value="nocBuildingAbuttingToNeighbourProperties"/>
							<a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.nocBuildingAbuttingToNeighbourProperties.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.nocBuildingAbuttingToNeighbourProperties.fileName}
							</a>
						</td>
						
					 </tr> 		
					  
					   <tr>
					  
						  <td>Advocate Search Report</td>
						  <td>
							<input type="file" id="advocatesearchreport" name="otherFileDoc" disabled="disabled"/>
							<input type="hidden" name="fieldName" value="advocatesearchreport"/>
							<a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.advocatesearchreport.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.advocatesearchreport.fileName}
							</a>
						</td>
						
					 </tr> 		
					  
					  </table>	
	
	
					
						<!-- End of Suneetha -->
						
					
					




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
							<label class="col-sm-3 col-xs-3 control-label">Project Photo</label>
							<div class="col-sm-3 col-xs-3">
								<input type="file"   id="projectPhotoFile" name="projectPhotoFile" disabled="disabled"/>
							
							<a href="download?DOC_ID=${photo.documentId}">
					         ${photo.fileName}
							</a>
							
							</div>



						</div>



					</div>
					</c:forEach>
					</div>

					







			




			</div>



	<!--Inner wrapper start here-->
		<div class="inner_wrapper">



			<h1>
				Payment<span></span>
			</h1>
			<div class="border">
				<div class="orange"></div>
				<div class="black"></div>
			</div>


   
   

				<div class="form-group">
				  
					<label for="inputEmail3" class="col-sm-3 col-xs-3 control-label">
						Payment Mode<sup>*</sup></label>
					<div class="col-sm-3 col-xs-3">
					        <input type="hidden" name="nextForm" value="projectConfirmation"/>
					        <form:hidden path="projectDetailsModel.projectDetailsId"/>
					        <form:hidden path="projectBankDetailsModel.projectBankDelsId"/>
					        <form:hidden path="externalDevelopmentWorkModel.extDevId"/>
					         <form:hidden path="projectRegId"/>
					         <form:hidden path="projectDocModel.docId"/>
					       
					        
							<form:select path="paymentDetailsModel.paymentMode"
								cssClass="form-control requiredValFld" disabled="true" onchange="choosepaymentmethod(this)">
								<form:option value="0" label="Select" />
								<form:option value="SB Collect" label="Net Banking/Card Payment/Cheque-Cash at SBI Branch" />
					        	<form:option value="NEFT" label="NEFT" />
                                 <form:option value="RTGS" label="RTGS" />
							</form:select>
							
					</div>

					<label for="inputEmail3" class="col-sm-2 col-xs-2 control-label optionfld2">
					 </label>
					<div class="col-sm-3 col-xs-3">
				1. For Net Banking/Card Payment/Cheque-Cash at SBI Branch <a href="https://www.onlinesbi.com/prelogin/icollecthome.htm" target="_blank">Click Here</a>
					 <br/><br/>
					2. For NEFT/RTGS:<br/>
					Account Name: Gujarat Real Estate Regulatory Authority <br/>
Account No: 36991131314<br/>
IFSC Code: SBIN0001355<br/>
Bank: State Bank of India<br/>
Branch: Gandhinagar<br/>
					 					</div>

				<div class="form-group">
					<label for="inputEmail3" class="col-sm-3 col-xs-3 control-label">
						Amount<sup>*</sup></label>
					<div class="col-sm-3 col-xs-3">
						
						<form:input path="paymentDetailsModel.amount" cssClass="form-control input-sm requiredValFld"  readonly="readonly"/>
						
					</div>

					<label for="inputEmail3" class="col-sm-2 col-xs-2 control-label optionfld2">
						Unique Token Number <sup>*</sup></label>
					<div class="col-sm-3 col-xs-3">
						<form:input path="paymentDetailsModel.paymentToken" cssClass="form-control input-sm" readonly="readonly"/>	
						
						
					</div>




				</div>




				<div class="form-group">
					<label for="inputEmail3" class="col-sm-3 col-xs-3 control-label  optionfld2">
						Khajane2 Challan Number<sup>*</sup></label>
					<div class="col-sm-3 col-xs-3">
						<form:input path="paymentDetailsModel.sbiTransactionRefNo" disabled="true" cssClass="form-control input-sm optionfld2 requiredValFld"/>
					</div>





					<label class="col-sm-2 col-xs-2 control-label optionfld2"> Attach Online Payment Receipt <sup>*</sup></label>
					<div class="col-sm-3 col-xs-3 optionfld2">
						<input type="file" class="form-control requiredValFld" rel="txtTooltip" 
						title="Only image or pdf file is allowed. file size upto 1 MB"  disabled="disabled"  data-toggle="tooltip" data-placement="bottom" 
						 name="scanCopyDoc" id="scanCopyDoc">
						 <a href="#">${projectRegistrationModel.paymentDetailsModel.scanCopyDoc.fileName} </a>
					</div>
				</div>





				<br>

                  <div class="form-group">

					<input type="checkbox" name="showonpublicdomain" checked="checked" class="requiredValFld"> Except Aadhaar Card Number, all other information will be added to the public domain
					<span class='requiredValFldMsg'> Please affirm the declarations .</span>

				</div>
            
				<div class="form-group">

				<input type="checkbox" name="checkAffidavit" checked="checked" class="requiredValFld"> I/We solemnly affirm and declare that
							the particulars given in herein are correct to [my /our]
							knowledge and belief and nothing material has been concealed by
							[me/us] therefrom 
							<span class='requiredValFldMsg'> Please affirm the declarations .</span>

				</div>






		</div>












	
	</form:form>
	
