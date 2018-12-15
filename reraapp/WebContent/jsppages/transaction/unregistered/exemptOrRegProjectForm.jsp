<!--
 * GenesisUI - Bootstrap 4 Admin Template
 * @version v1.5.8
 * @link https://genesisui.com
 * Copyright (c) 2016 creativeLabs Łukasz Holeczek
 * @license Commercial
 -->
<!DOCTYPE html>
<%@page import="in.gov.rera.common.security.ReraSecurity"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@page import="in.gov.rera.common.util.ReraConstants"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@page import="in.gov.rera.common.model.UserModel"%>
<%
	UserModel user = (UserModel) session.getAttribute(ReraConstants.SES_USER_ATTR);
%>
<html lang="en">
<head>

<script>
function enableNameField() {
    document.getElementById("promoterName").disabled = false;
}
    function enableEmailField() {
        document.getElementById("changeEmail").disabled = false;
    }
        function enableMobileField() {
            document.getElementById("updateMobileNumber").disabled = false;
}
        
        function showExemptForm(){
        	document.getElementById('showExempt').style.display = 'block';
        	document.getElementById('registerLink').style.display ='none';
        }

        function showRegLink(){
        	document.getElementById('registerLink').style.display = 'block';
        	document.getElementById('showExempt').style.display ='none';
        }
</script>
</head>
<body>

   <div class="container mar_top_20">

<div>
   
	    <!--main container start here-->
<div class="Main_containner">

<!--Inner wrapper stsrt here-->
<div class="inner_wrapper">
	
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Modal Header</h4>
				</div>
				<div class="modal-footer"></div>
			</div>

		</div>
	</div>
	<div class="container-fluid">
      <div class="panel-group" id="accordion">
          <div class="panel-group" id="accordion">
			<div>
			<c:if test="${param.act eq 'save'}">
                        <div class="alert alert-success">
                            <strong></strong> Details Saved Successfully.
                             </div>
                    </c:if>
			
      <form:form class="form-horizontal" autocomplete="off" action="unRegProject/exemptOrRegProject" enctype="multipart/form-data"   method="post">
                                 <div>
                                 
                                 <br/><br/><br/>
                                 <h1>Exempt/Register  <span>Project</span></h1>
                                 <div class="drop_shadow"></div>
								    <div class="add-more-litigation" style="border-style: ridge; padding: 10px; background-color: #F8F8F8;">
                                          
                                            <div class="form-group row">
												<label class="col-md-4 form-control-label" for="exmptProject">Do you want to Exempt/Register the Project </label>
												<input type="radio" name="ExemptOrRegProject"  value="regProject"  class="requiredValFld" id="ExemptOrRegProject" onclick="showRegLink();" >Register 
														<span class='requiredValFldMsg'> Please select yes/No</span>  
														<input type="radio" name="ExemptOrRegProject"  value="exemptProject"  class="requiredValFld" id="ExemptOrRegProject" onclick="showExemptForm();" >Exempt
													<span class='requiredValFldMsg'> Please select Exempt/Register </span>
											</div>
											<br/>
											
											<div class="add-more-litigation" id="showExempt"  style="display:none;border-style: none; padding: 10px; background-color: #F8F8F8;">     
											<div class="form-group row">
												<label class="col-md-4 form-control-label" for="promoterName"> Promoter Name </label>
													<div class="col-md-6">
													<input type="text"  disabled="disabled" name="promoterName" id="promoterName" class="form-control requiredValFld" placeholder="Enter promoter Name" />
												</div>
												
												<input type="button" class="btn btn-sm btn-primary " id="updateNameBtn"  value="Change Name" onclick="enableNameField()" />
											</div>
											  <div class="form-group row">
												<label class="col-md-4 form-control-label" for="changeEmail">Email</label>
												<div class="col-md-6">
													<input  required="required"  disabled="disabled" type="email" name="changeEmail" id="changeEmail" class="form-control requiredValFld" placeholder="Update or change email" />
												</div>
												
												<input type="button" class="btn btn-sm btn-primary " id="updateEmailBtn"   value="Change Email" onclick="enableEmailField()" />
											</div>
																					
											<div class="form-group row">
												<label class="col-md-4 form-control-label" for="updateMobileNumber"> Mobile number </label>
												<div class="col-md-6">
													<input type="number"  disabled="disabled" name="updateMobileNumber" id="updateMobileNumber" class="form-control requiredValFld" placeholder="only digits are allowed" />
												</div>
												<input type="button" class="btn btn-sm btn-primary " id="updateNumberBtn" onclick="enableMobileField()" value="Change Mobile Number" />
											</div>
											
											<br/>   
											<%-- <c:choose>
											<c:when test="yes to Exemption"> --%>
										    
											<div class="form-group row">
												<label class="col-md-4 form-control-label" for="projectName">Project Name</label>
												<div class="col-md-6">
													<input type="text"  name="projectName" id="projectName" class="form-control requiredValFld" placeholder="Please enter project name" />
												</div>
											</div>
											<div class="form-group row">
												<label class="col-md-4 form-control-label" for="projAddress">project Address</label>
												<div class="col-md-6">
													<input type="text" name="projAddress" id="projAddress" class="form-control requiredValFld" placeholder="Please enter project address" />
												</div>
											</div>
											 <div class="form-group row">
															<label class="col-md-4 form-control-label">Project Status </label>
															<div class="col-md-6">
																<select id="select" name="source"
																	class="form-control input-sm" size="1"
																	style="width: 200px;">
																	<option value="0"> --select--</option>
																	<option value="newsPaper">Ongoing </option>
																	<option value="online">Completed</option>
																	<option value="heloDesk">New Project</option>
																</select>
															</div>
											</div>
											<div class="form-group row">
												<label class="col-md-4 form-control-label" for="startDate">Project Start Date </label>
												<div class="col-md-6">
													<input type="date"  name="startDate" id="startDate" class="form-control requiredValFld" placeholder="Please enter start date" />
												</div>
											
												<label class="col-md-4 form-control-label" for="endDate">Project End Date </label>
												<div class="col-md-6">
													<input type="date"   name="endDate" id=endDate class="form-control requiredValFld" placeholder="Please enter end date" />
												</div>
											</div>
											<div class="form-group row">
												<label class="col-md-4 form-control-label" for="exmptOrRegProject">Type Of Project </label>
												<input type="radio" name="projectType" value="Apartment" class=""  class="projectType" id="projectType" >Apartment 
														<span class='requiredValFldMsg'> Please select project type</span>  
														<input type="radio" name="projectType" value="Plotted" class=""  class="projectType" id="projectType" >Plotted
													<span class='requiredValFldMsg'>Please select project type </span>
											</div>
											<div class="form-group row">
									            <label class="col-md-3 form-control-label" for="drawingPlan">Sanction Drawing Plan from Competent Authority</label>
									             <div class="col-md-9">
										            <input type="file" id="drawingPlan" name="drawingPlan" class="form-control requiredValFld">
									         </div>
								          </div>
								          <div class="form-group row">
									            <label class="col-md-3 form-control-label" for="completionCertificate">Completion certificate from Competent Authority</label>
									             <div class="col-md-9">
										            <input type="file" id="completionCertificate" name="completionCertificate" class="form-control requiredValFld">
									         </div>
								          </div>
								          <div class="form-group row">
									            <label class="col-md-3 form-control-label" for="structuralEngCertificate"> Structural Engineer Certificate</label>
									             <div class="col-md-9">
										            <input type="file" id="structuralEngCertificate" name="structuralEngCertificate" class="form-control requiredValFld">
									         </div>
								          </div>
								          <div class="form-group row">
									            <label class="col-md-3 form-control-label" for="CACertificate"> Chartered Account Certificate</label>
									             <div class="col-md-9">
										            <input type="file" id="CACertificate" name="CACertificate" class="form-control requiredValFld">
									         </div>
								          </div>
								          <div class="form-group row">
									            <label class="col-md-3 form-control-label" for="architectCertificate"> Architect Certificate</label>
									             <div class="col-md-9">
										            <input type="file" id="architectCertificate" name="architectCertificate" class="form-control requiredValFld">
									         </div>
								          </div>
								          <div class="form-group row">
									            <label class="col-md-3 form-control-label" for="occupancyCertificate">Occupancy Certificate before 10/07/2017(for apartments)</label>
									             <div class="col-md-9">
										            <input type="file" id="occupancyCertificate" name="occupancyCertificate" class="form-control requiredValFld">
									         </div>
								          </div>
								          <div class="form-group row">
									            <label class="col-md-3 form-control-label" for="releaseOrder">100% release order before 10/07/2017(for plots)</label>
									             <div class="col-md-9">
										            <input type="file" id="releaseOrder" name="releaseOrder" class="form-control requiredValFld">
									         </div>
								          </div>
								          <div class="form-group row">
									            <label class="col-md-3 form-control-label" for="relinqDeedDoc">Exemption under Rule 4,(a) Relinquishment Deed before 10/07/2017 </label>
									             <div class="col-md-9">
										            <input type="file" id="relinqDeedDoc" name="relinqDeedDoc" class="form-control requiredValFld">
									         </div>
								          </div>
								          <div class="form-group row">
									            <label class="col-md-3 form-control-label" for="saleDeedDoc">Exemption under Rule 4,(b) More than 60% sale Deed abstract before 10/07/2017</label>
									             <div class="col-md-9">
										            <input type="file" id="saleDeedDoc" name="saleDeedDoc" class="form-control requiredValFld">
									         </div>
								          </div>
								          <div class="form-group row">
									            <label class="col-md-3 form-control-label" for="partialOccupancyCertificate">Exemption under Rule 4,(c) Partial Occupancy Certificate before 10/07/2017</label>
									             <div class="col-md-9">
										            <input type="file" id="partialOccupancyCertificate" name="partialOccupancyCertificate" class="form-control requiredValFld">
									         </div>
								          </div>
								          <br/>
											<input type="submit" class="btn btn-sm btn-success  pull-right"  value="Submit" />
											<br/><br/>
								          </div>
								       <%--    </c:when>
											<c:otherwise> --%>
											<!--when  yes to register -->
											 <p id="registerLink" style="display:none"><a  href="#" >Register Project</a></p>
											<%-- </c:otherwise>
											</c:choose> --%>
											
											
											
										
											
											
											
											
											
											<!-- /.conainer-fluid --> </main>


	<!--  <footer class="footer">
        <span class="text-left">
                <a href="http://www.keyfalconsolutions.com/">Branding</a> © 2017 Developers.
            </span>
        <span class="pull-right">
                Powered by <a href="http://www.keyfalconsolutions.com/">Keyfalcon Solutions</a>
            </span>
    </footer>
 -->
 
 </div>
</form:form>
</div>
</div>
</div>
</div>
</div>
</div>										
	</div>
	</div>
	</body>	
			</html>								
									