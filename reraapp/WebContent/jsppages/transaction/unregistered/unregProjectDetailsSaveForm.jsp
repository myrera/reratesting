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

<%--<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="Root - Bootstrap 4 Admin Template">
<meta name="author" content="Łukasz Holeczek">
<meta name="keyword"
	content="Bootstrap,Admin,Template,Open,Source,AngularJS,Angular,Angular2,jQuery,CSS,HTML,RWD,Dashboard">
 <link rel="shortcut icon"
	href="../resources/postprojregistration/img/favicon.png">
	<link rel="shortcut icon" href="../resources/postprojregistration/img/favicon.png">
    <link href="<%=request.getContextPath()%>/resources/css/style.css?rr=78889" rel="stylesheet"/>
    <link href="<%=request.getContextPath() %>/resources/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="<%=request.getContextPath()%>/resources/css/font-awesome.min.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/datatable/jquery.dataTables.css"> --%>
    
    
<!--News Ticker-->


 

  
   <div class="container mar_top_20">

<div >
   
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
			
			<a href="<%=request.getContextPath()%>/unRegProject/viewAllProjects" class="btn btn-info pull-right" role="button" >View Project List</a>
			<br/>
			<br/>
			<br/>
			<c:if test="${param.act eq 'save'}">
                        <div class="alert alert-success">
                            <strong></strong> Details Saved Successfully.
                             </div>
                    </c:if>
			
      <form:form class="form-horizontal" autocomplete="off" action="saveOrUpdateUnregProjectDetails" enctype="multipart/form-data"   method="post">
                                 <div>
                                 
                                 <br/><br/><br/>
                                 <h1>Unregistered Project <span>Details</span></h1>
                                 <div class="drop_shadow"></div>
								    <div class="add-more-litigation" style="border-style: ridge; padding: 10px; background-color: #F8F8F8;">
                                          
                                           <div class="form-group row">
												<label class="col-md-4 form-control-label" for="projectName">Project Name</label>
												<div class="col-md-6">
													<input  required="required"  name="projectName" id="projectName" class="form-control requiredValFld" placeholder="Enter Project Name" />
												</div>
											</div>
											
										
											<div class="form-group row">
												<label class="col-md-4 form-control-label" for="promoterName"> Promoter Name </label>
													<div class="col-md-6">
													<input type="text"  name="promoterName" id="promoterName" class="form-control requiredValFld" placeholder="Enter promoter Name" />
												</div>
											</div>
											<div class="form-group row">
												<label class="col-md-4 form-control-label" for="email">Email ID </label>
												<div class="col-md-6">
													<input type="email"  name="emailID" id="email" class="form-control requiredValFld" placeholder="Enter your email address" />
												</div>
											</div>
																						
											<div class="form-group row">
												<label class="col-md-4 form-control-label" for="mobileNumber">Mobile/Tel No. </label>
												<div class="col-md-6">
													<input type="number"  name="phoneNumber" id="mobileNumber" class="form-control requiredValFld" placeholder="only digits are allowed" />
												</div>
											</div>
											<div class="form-group row">
												<label class="col-md-4 form-control-label"
													for="corporateAddress">Corporate Address</label>
												<div class="col-md-6">
													<input type="text"  name="corpAddress" id="corporateAddress" class="form-control requiredValFld" placeholder="Please enter corporate Address" />
												</div>
											</div>
										
											<div class="form-group row">
												<label class="col-md-4 form-control-label" for="pinCode">Pin Code</label>
												<div class="col-md-6">
													<input type="number"  name="pinCode" id="pinCode" class="form-control requiredValFld" placeholder="only digits are allowed" />
												</div>
											</div>
											<div class="form-group row">
												<label class="col-md-4 form-control-label" for="district">District</label>
												<div class="col-md-6">
													<input type="text" name="district" id="district" class="form-control requiredValFld" placeholder="Please enter district" />
												</div>
											</div>
											<div class="form-group row">
												<label class="col-md-4 form-control-label" for="taluk">Taluk</label>
												<div class="col-md-6">
													<input type="text"  name="taluk" id="taluk" class="form-control requiredValFld" placeholder="Please enter taluk" />
												</div>
											</div>
											<div class="form-group row">
												<label class="col-md-4 form-control-label" for="projectLocation">Project Location</label>
												<div class="col-md-6">
													<input type="text"  name="projectLocation" id="projectLocation" class="form-control requiredValFld" placeholder="only digits are allowed" />
												</div>
												</div>
											<div class="form-group row">
												<label class="col-md-4 form-control-label"
													for="website">Website Address</label>
												<div class="col-md-6">
													<input type="text"   name="websiteAddress" id="websiteAddress" class="form-control requiredValFld" placeholder="Please enter website Address" />
												</div>
											</div>
											 <div class="form-group row">
															<label class="col-md-4 form-control-label">Source </label>
															<div class="col-md-6">
																<select id="select" name="source"
																	class="form-control input-sm" size="1"
																	style="width: 200px;">
																	<option value="0"> --select--</option>
																	<option value="newsPaper">New Paper </option>
																	<option value="online">Online</option>
																	<option value="heloDesk">HelpDesk</option>
																	<option value="reportUs">ReportUs</option>
																	<option value="complaints">Complaints</option>
																	<option value="citizenWalking">Citizen Walking</option>
																	<option value="others">Others</option>
																</select>
															</div>
														</div> 
														<br/>
											<input type="submit" class="btn btn-sm btn-success  pull-right"  value="create project" />
											<br/><br/>
												</div>
											
											
											
											
											
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
		
			</html>								
									