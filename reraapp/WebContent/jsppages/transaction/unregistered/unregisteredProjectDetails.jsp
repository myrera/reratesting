<%@page import="in.gov.rera.common.security.ReraSecurity"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
   <%@page import="in.gov.rera.common.model.UserModel"%>
<%@page import="in.gov.rera.common.util.ReraConstants"%>
    <%
   String roleAccess=(String)session.getAttribute(ReraConstants.ROLE_ACCESS);
	UserModel user = (UserModel) session.getAttribute(ReraConstants.SES_USER_ATTR);
%>


 <div  class="breadcrumb" style="background-color: white;!important">Home /Project Details</div>
<a class="pull-right user_name"  href="javascript:history.back()">Back
	to List</a> 


<div class="col-md-12 col-sm-12 " style="background-color: white;">
<br><br>
	<div class="Main_containner" style="background-color: white;">

		<form name="approvalForm" id="approvalFormId" autocomplete="off" class="form-horizontal" action="forwardProjectRegistration" method="post">
			<!--Inner wrapper start here-->
			<div class="inner_wrapper">

				<h1>
					Unregistered Project<span> Detail</span>
				</h1>
				<input type="hidden" name="PROJECT_ID" value="${project.unregProjectDetailsId}"/>
				<br>
				<div class="row">
					<div class="col-md-3 col-sm-6 col-xs-6">
						<p class="text-right ">
							Project Name <span class="space_LR">:</span>
						</p>
					</div>
					<div class="col-md-3 col-sm-6 col-xs-6">
						<p class="text-view">${project.projectName}</p>
					</div>
					<div class="col-md-3 col-sm-6 col-xs-6">
						<p class="text-right">
							Promoter Name<span class="space_LR">:</span>
						</p>
					</div>
					<div class="col-md-3 col-sm-6 col-xs-6">
						<p>${project.promoterName}</p>
					</div>
				</div>
				<br>
				<div class="row">
					<div class="col-md-3 col-sm-6 col-xs-6">
						<p class="text-right ">
							MOBILE/TEL No <span class="space_LR">:</span>
						</p>
					</div>
					<div class="col-md-3 col-sm-6 col-xs-6">
						<p class="text-view">${project.phoneNumber}</p>
					</div>
					<div class="col-md-3 col-sm-6 col-xs-6">
						<p class="text-right">
							Promoter Email Address<span class="space_LR">:</span>
						</p>
					</div>
					<div class="col-md-3 col-sm-6 col-xs-6">
						<p>${project.emailID}</p>
					</div>
				</div>

				<br>


				<div class="row">
					<div class="col-md-3 col-sm-6 col-xs-6">
						<p class="text-right ">
							Project Corporate address <span class="space_LR">:</span>
						</p>
					</div>
					<div class="col-md-3 col-sm-6 col-xs-6">
						<p class="text-view">${project.corpAddress},${project.pinCode}</p>
					</div>
					<div class="col-md-3 col-sm-6 col-xs-6">
						<p class="text-right">
							District<span class="space_LR">:</span>
						</p>
					</div>
					<div class="col-md-3 col-sm-6 col-xs-6">
						<p>${project.district}</p>
					</div>
					<div class="col-md-3 col-sm-6 col-xs-6">
						<p class="text-right ">
							Taluk <span class="space_LR">:</span>
						</p>
					</div>
					<div class="col-md-3 col-sm-6 col-xs-6">
						<p class="text-view">${project.taluk}</p>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-3 col-sm-6 col-xs-6">
						<p class="text-right">
							Project location<span class="space_LR">:</span>
						</p>
					</div>
					<div class="col-md-3 col-sm-6 col-xs-6">
						<p>${project.projectLocation}</p>
					</div>
					<div class="col-md-3 col-sm-6 col-xs-6">
						<p class="text-right">
							Source<span class="space_LR">:</span>
						</p>
					</div>
					<div class="col-md-3 col-sm-6 col-xs-6">
						<p>${project.source}</p>
					</div>
				</div>
					<br/>	<br/>
				<div class="form-group">
								<label for="inputEmail3" class="col-sm-2 control-label">
									Remarks: <sup>*</sup>
								</label>
								<div class="col-sm-3">

									<textarea id="textareaId1" name="summary" rows="4"
										class="form-control requiredValFld input-sm"> 
					 		    	</textarea>
					 		    	<span class='requiredValFldMsg'> Please Enter Remarks.</span>


								</div>
								
								<!-- <div class="col-md-3 col-sm-6 col-xs-6">
							<p class="text-right">
								Project Verificaton Status<span class="space_LR">:</span>
							</p>
						</div>
								<div class="col-md-3 col-sm-6 col-xs-6">
							<select name="verificationStatus" id='verificationStatus'
								class="form-control requiredValFld" style="width: 100px;">
								<option value="0">--Select--</option>
								<option value="OK">OK</option>
								<option value="NOT OK">NOT OK</option>
							</select> <span class='requiredValFldMsg'> Please Select
								Verification Status.</span>
						</div> -->

				<br/>
				
				<br /> <br />



			<%-- 	<%=ReraSecurity.writeToken(request)%>

				<input type='hidden' name='reportId' value="${project.reportId }" /> --%>
				<br /> <br /> <br /> <br />
				
				<div class="button-wrapper">
				                 
				                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
								<input name="btn1" class="btn-style" value="Enquiry" type="button" data-toggle="modal" data-target="#myModal1"  />

								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
								<input name="btn1" class="btn-style" value="Forward" type="button" onclick="submitTrxForm('FORWARD')" />
							
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					 <input name="btn1" class="btn-style" value="Edit Details" type="button" data-toggle="modal" data-target="#myModal" />
						

				</div>
				</div>
				</div>
		</form>

	</div>
	<!--inner container end here-->

<!-- container end here-->

<div class="pop_main">

	<div class="modal fade" id="myModal1" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">

					<button type="button" class="close" data-dismiss="modal">&times;</button>

				</div>
				<div class="modal-body">

					<form class="form-horizontal" action="sendAgentRegEnquiry"  id="enquiryForm" 	 method="post" name='enquiryForm'>
       
                                                <%=ReraSecurity.writeToken(request)%>
                                                   <input type='hidden' name='AGENT_ID' value="${project.unregProjectDetailsId}" />
                                                    <div class="inner_wrapper">


                                                        <h1>
                                                            Enquiry related to <span>(Make one or more selections below)</span>
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
														Unreg Operator </label> <input type="checkbox" name="Accounts"
													value="${project.createdBy}" id="Accounts" />
												</span>
                                                                            <textarea name="accountsEnqAuthRemarks" id="accountsEnqAuthRemarks" class="form-control"> </textarea>
                                                                        </div>
                                                                        <div class="col-sm-2">
                                                                           

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
										value="RERA Karnataka:  Enquiry on Unregistered Project : ${project.projectName}"
										class="form-control input-sm" maxlength="200" />
                                                            </div>
                                                        </div>

                                              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;          <div class="form-group">
                                                           <!--  <label for="inputEmail3" class="col-sm-3 control-label">Enquiry<sup>*</sup><br><br> -->
                                                           <div class="col-md-3 ">

           												<h1>
                                                           Insert Operator <span>Comments</span>
                                                        </h1>
                                                        <div class="drop_shadow"></div>
                                                        <div class="clearfix"></div>

									<button onclick="return pasteWithCursor('ac')" class="btn btn-sm">Operator</button> &nbsp&nbsp&nbsp&nbsp
									<br>

								</div>
                                                            
                                                            
                                                             <c:forEach items="${template}" var="tempText">
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="re" value="v1" onclick="templateFun(${tempText.templateId})"> ${tempText.templateText}
                                                                </c:forEach>
								<!-- </label> -->
								
                                                               
                                                            <br>
                                                            <div class="col-sm-6">

                                                                <div>
                                                                    <textarea id="textareaId1" name="summary" rows="7" class="form-control requiredValFld input-sm"> 
					 		    	</textarea>
                                                                </div>

                                                                    <span class='requiredValFldMsg'> Please enter enquiry details</span>
                                                            </div>
                                                            
                                                            

                                                        </div>

                                                    </div>
  
					<div class="button-wrapper">
						<input name="btn3" class="btn-style disable_btn" value="Send Enquiry" type="button"  />
						<button type="button" class="close" data-dismiss="modal">Close</button>
					</div>
  
					
					</div>
                                        </form>

				</div>

			</div>
		</div>
	</div>
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

					<form class="form-horizontal" action="editUnregProjectDetails" autocomplete="off" id="editUnregProjectForm" method="post" name='enquiryForm'>
						<%=ReraSecurity.writeToken(request)%>
						<input type="hidden" name="pkId" value="${project.unregProjectDetailsId}">
						<div class="inner_wrapper">



							<br> <br>

							<h1>
								Unregistered Project<span> Detail</span>
							</h1>
							<div class="drop_shadow"></div>
							<div class="clearfix"></div>

							<input type="hidden" name="PROJECT_ID" value="${project.unregProjectDetailsId}"/>
							<div class="form-group row">
												<label class="col-md-4 form-control-label" for="projectName">Project Name</label>
												<div class="col-md-6">
													<input  required="required"  name="projectName" id="projectName" value="${project.projectName}" class="form-control requiredValFld" placeholder="Enter Project Name" />
												</div>
											</div>
											
										
											<div class="form-group row">
												<label class="col-md-4 form-control-label" for="promoterName"> Promoter Name </label>
													<div class="col-md-6">
													<input type="text"  name="promoterName" id="promoterName" value="${project.promoterName}" class="form-control requiredValFld" placeholder="Enter promoter Name" />
												</div>
											</div>
											<div class="form-group row">
												<label class="col-md-4 form-control-label" for="email">Email ID </label>
												<div class="col-md-6">
													<input type="email"  name="emailID" value="${project.emailID}" id="email" class="form-control requiredValFld" placeholder="Enter your email address" />
												</div>
											</div>
																						
											<div class="form-group row">
												<label class="col-md-4 form-control-label" for="mobileNumber">Mobile/Tel No. </label>
												<div class="col-md-6">
													<input type="number"  name="phoneNumber" value="${project.phoneNumber}" id="mobileNumber" class="form-control requiredValFld" placeholder="only digits are allowed" />
												</div>
											</div>
											<div class="form-group row">
												<label class="col-md-4 form-control-label"
													for="corporateAddress">Corporate Address</label>
												<div class="col-md-6">
													<input type="text"  name="corpAddress" value="${project.corpAddress}" id="corporateAddress" class="form-control requiredValFld" placeholder="Please enter corporate Address" />
												</div>
											</div>
										
											<div class="form-group row">
												<label class="col-md-4 form-control-label" for="pinCode">Pin Code</label>
												<div class="col-md-6">
													<input type="number"  name="pinCode" value="${project.pinCode}" id="pinCode" class="form-control requiredValFld" placeholder="only digits are allowed" />
												</div>
											</div>
											<div class="form-group row">
												<label class="col-md-4 form-control-label" for="district">District</label>
												<div class="col-md-6">
													<input type="text" name="district" value="${project.district}" id="district" class="form-control requiredValFld" placeholder="Please enter district" />
												</div>
											</div>
											<div class="form-group row">
												<label class="col-md-4 form-control-label" for="taluk">Taluk</label>
												<div class="col-md-6">
													<input type="text"  name="taluk" value="${project.taluk}" id="taluk" class="form-control requiredValFld" placeholder="Please enter taluk" />
												</div>
											</div>
											<div class="form-group row">
												<label class="col-md-4 form-control-label" for="projectLocation">Project Location</label>
												<div class="col-md-6">
													<input type="text"  name="projectLocation" value="${project.projectLocation}" id="projectLocation" class="form-control requiredValFld" placeholder="only digits are allowed" />
												</div>
												</div>
											<div class="form-group row">
												<label class="col-md-4 form-control-label"
													for="website">Website Address</label>
												<div class="col-md-6">
													<input type="text"   name="websiteAddress" value="${project.websiteAddress}" id="websiteAddress" class="form-control requiredValFld" placeholder="Please enter website Address" />
												</div>
											</div>
											 <!-- <div class="form-group row">
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
														</div>  -->
														<br/>
														
														<input type="submit" class="btn btn-sm btn-success  pull-right" id="editUnregSubmit" value="Submit" />
														<br/><br/>
														<button type="button" class="close" data-dismiss="modal">Close</button>
														
							<br/><br/>
						</div>

					</form>

				</div>

			</div>
		</div>
	</div>
</div>
 
</div>

           <script>
	function submitTrxForm(_out) {
		var frm = $('#approvalFormId');
		if (validateForm(frm)) {
			//document.approvalForm.STATUS.value = _out;
			if (_out == 'FORWARD') {
				alert("sssssss");
				if (confirm('Are you sure forward this application?')) {
					$(frm).submit();
				}
			} 
		}
	}
	
	$("#editUnregSubmit").click( function(e) {
		alert(">>>>..");
		var frm= $("#editUnregProjectForm");
		$(frm).submit();
	});
</script>