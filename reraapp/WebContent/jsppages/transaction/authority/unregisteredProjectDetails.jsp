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



<div class="breadcrumb">Home /Project Details</div>
<a class="pull-right user_name" href="javascript:history.back()">Back
	to List</a>


<div class="col-md-12 col-sm-12 ">

	<div class="Main_containner">

		<form name="approvalForm" id="approvalFormId" autocomplete="off"
			class="form-horizontal" action="approveProjectRegistration"
			method="post">
			<!--Inner wrapper start here-->
			<div class="inner_wrapper">




				<h1>
					Unregistered Project<span> Detail</span>
				</h1>

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
							Promoter Mobile No <span class="space_LR">:</span>
						</p>
					</div>
					<div class="col-md-3 col-sm-6 col-xs-6">
						<p class="text-view">${project.promoterMobileNo}</p>
					</div>
					<div class="col-md-3 col-sm-6 col-xs-6">
						<p class="text-right">
							Promoter Email Address<span class="space_LR">:</span>
						</p>
					</div>
					<div class="col-md-3 col-sm-6 col-xs-6">
						<p>${project.promoterEmailAddress}</p>
					</div>
				</div>

				<br>


				<div class="row">
					<div class="col-md-3 col-sm-6 col-xs-6">
						<p class="text-right ">
							Project address <span class="space_LR">:</span>
						</p>
					</div>
					<div class="col-md-3 col-sm-6 col-xs-6">
						<p class="text-view">${project.address}${project.pincode}</p>
					</div>
					<div class="col-md-3 col-sm-6 col-xs-6">
						<p class="text-right">
							District<span class="space_LR">:</span>
						</p>
					</div>
					<div class="col-md-3 col-sm-6 col-xs-6">
						<p>${project.distName}</p>
					</div>
				</div>

				<br>
				<div class="row">
					<div class="col-md-3 col-sm-6 col-xs-6">
						<p class="text-right ">
							Promoter website <span class="space_LR">:</span>
						</p>
					</div>
					<div class="col-md-3 col-sm-6 col-xs-6">
						<p class="text-view">${project.website}</p>
					</div>
					<div class="col-md-3 col-sm-6 col-xs-6">
						<p class="text-right">
							Reporter Name<span class="space_LR">:</span>
						</p>
					</div>
					<div class="col-md-3 col-sm-6 col-xs-6">
						<p>${project.reporterName}</p>
					</div>
				</div>

				<br>
				<div class="row">
					<div class="col-md-3 col-sm-6 col-xs-6">
						<p class="text-right ">
							Reporter's Phone Number <span class="space_LR">:</span>
						</p>
					</div>
					<div class="col-md-3 col-sm-6 col-xs-6">
						<p class="text-view">${project.mobileNo}</p>
					</div>
					<div class="col-md-3 col-sm-6 col-xs-6">
						<p class="text-right">
							Reporter's Email<span class="space_LR">:</span>
						</p>
					</div>
					<div class="col-md-3 col-sm-6 col-xs-6">
						<p>${project.email}</p>
					</div>
				</div>
				<br>
				<div class="row">
					<div class="col-md-3 col-sm-6 col-xs-6">
						<p class="text-right ">
							Status <span class="space_LR">:</span>
						</p>
					</div>
					<div class="col-md-3 col-sm-6 col-xs-6">
						<p class="text-view">${project.status}</p>
					</div>
					<div class="col-md-3 col-sm-6 col-xs-6">
						<p class="text-right">
							Attachments<span class="space_LR">:</span>
						</p>
					</div>
					<div class="col-md-3 col-sm-6 col-xs-6">
						<c:if test="${project.reportDocOne!=null}">
							<p>
								<a
									href='<%=request.getContextPath() %>/download?DOC_ID=${project.reportDocOne.documentId}'>${project.reportDocOne.fileName}</a>
							</p>
						</c:if>
						<c:if test="${project.reportDocTwo!=null}">
							<p>
								<a
									href='<%=request.getContextPath() %>/download?DOC_ID=${project.reportDocTwo.documentId}'>${project.reportDocOne.fileName}</a>

							</p>
						</c:if>
						<c:if test="${project.reportDocThree!=null}">
							<p>
								<a
									href='<%=request.getContextPath() %>/download?DOC_ID=${project.reportDocThree.documentId}'>${project.reportDocOne.fileName}</a>

							</p>
						</c:if>
					</div>
				</div>





				<br /> <br />



				<%=ReraSecurity.writeToken(request)%>

				<input type='hidden' name='reportId' value="${project.reportId }" />
				<br /> <br /> <br /> <br />

				<div class="button-wrapper">

					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input name="btn1" class="btn-style"
						value="Enquiry" type="button" data-toggle="modal"
						data-target="#myModal" />

				</div>
		</form>






	</div>
	<!--inner container end here-->





</div>






<!-- container end here-->


<script>
	function submitTrxForm(_out) {
		document.approvalForm.STATUS.value = _out;
		if (_out == 'REJECTED') {
			if (confirm('Do you want to reject this application?')) {
				document.rejectForm.submit();

			}
		} else if (_out == 'FORWARD') {
			if (confirm('Are you sure forward this application?')) {
				document.approvalForm.submit();

			}
		} else {
			if (confirm('Are you sure that you want to approve this application?')) {
				if (confirm('Have you reconciled credit of fee in the RERA account against this application?')) {
					document.approvalForm.submit();

				}

			}
		}
	}

	function setVal(chk) {
		var nm = $(chk).val();
		var ch = $(chk).prop('checked');
		if (ch) {
			if (nm == 'account') {
				document.approvalForm.ACCOUNT.value = "OK";
			} else if (nm == 'revenue') {
				document.approvalForm.REVENUE.value = "OK";
			} else if (nm == 'tcp') {
				document.approvalForm.TCP.value = "OK";
			} else {
				document.approvalForm.ENGG.value = "OK";
			}
		} else {
			if (nm == 'account') {
				document.approvalForm.ACCOUNT.value = "";
			} else if (nm == 'revenue') {
				document.approvalForm.REVENUE.value = "";
			} else if (nm == 'tcp') {
				document.approvalForm.TCP.value = "";
			} else {
				document.approvalForm.ENGG.value = "";
			}
		}
	}

	function returnTrxForm() {
		if (document.approvalForm.ACCOUNT.value == ""
				&& document.approvalForm.REVENUE.value == ""
				&& document.approvalForm.TCP.value == ""
				&& document.approvalForm.ENGG.value == "") {
			alert("Please select section.");
			return false;
		}
		document.approvalForm.action = "returnProjectRegistration";
		document.approvalForm.STATUS.value = "RETURN";
		if (confirm('Do you want to return the application to the reviewer?')) {
			document.approvalForm.submit();

		}
	}

	function saveTrxForm() {
		document.approvalForm.action = "saveProjectRemarks";
		document.approvalForm.STATUS.value = "SAVE";
		if (confirm('Are you sure save this application?')) {
			document.approvalForm.submit();

		}
	}

	function sendEnquiry() {

		var _frm = $("#enquiryForm");
		if (validateForm(_frm)) {
			$(_frm).submit();
		}
	}
</script>


<div class="pop_main">

	<div class="modal fade" id="returnModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>

				</div>
				<div class="modal-body">

					<div class="inner_wrapper">

						<h1>
							Return to <span>Section</span>
						</h1>
						<div class="drop_shadow"></div>
						<div class="clearfix"></div>


						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">
								Accounts <sup>*</sup>
							</label>
							<div>

								<input type="checkbox" name="subject" onclick="setVal(this);"
									value="account" />

							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">
								Revenue <sup>*</sup>
							</label>
							<div>

								<input type="checkbox" name="subject" onclick="setVal(this);"
									value="revenue" />

							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">
								TCP <sup>*</sup>
							</label>
							<div>

								<input type="checkbox" name="subject" onclick="setVal(this);"
									value="tcp" />

							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">
								Engineer <sup>*</sup>
							</label>
							<div>

								<input type="checkbox" name="subject" onclick="setVal(this);"
									value="engineer" />

							</div>
						</div>



						<div class="button-wrapper">


							<input name="btn3" class="btn-style" value="Return" type="button"
								onclick="returnTrxForm()" />
							<button type="button" class="close" data-dismiss="modal">Close</button>
						</div>



					</div>
				</div>

			</div>
		</div>
	</div>
</div>



<script>
	/*  	$(function() {
	                                                                                    		$('#textareaId1').froalaEditor();
	                                                                                    	});  */
</script>




<div class="pop_main">

	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">

					<button type="button" class="close" data-dismiss="modal">&times;</button>

				</div>
				<div class="modal-body">

					<form class="form-horizontal" action="sendEnquiry"
						autocomplete="off" id="enquiryForm" method="post"
						name='enquiryForm'>
						<%=ReraSecurity.writeToken(request)%>
						<input type="hidden" name="projectId" value="${project.reportId}">
						<div class="inner_wrapper">



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
									<input type="text" name="subject" value=""
										class="form-control input-sm" maxlength="200" />
								</div>
							</div>

							<div class="form-group">
								<label for="inputEmail3" class="col-sm-3 control-label">
									Enquiry Details <sup>*</sup>
								</label>
								<div class="col-sm-6">

									<textarea id="textareaId1" name="summary" rows="7"
										class="form-control requiredValFld input-sm"> 
					 		    	</textarea>


									<span class='requiredValFldMsg'> Please enter enquiry
										details</span>
								</div>
							</div>

							<div class="form-group">

								<div class="col-md-3 ">


									<!-- </label> -->


									<br>
									<div class="col-sm-6"></div>



								</div>

							</div>
   <% if(roleAccess!=null && roleAccess.equals("READ")){%>
   
  <% if(user.getLoginId()!=null && user.getLoginId().equals("rera.secretary")){%>
<div class="button-wrapper">
								<input name="btn3" class="btn-style disable_btn" value="Send Enquiry"
									type="button"  />
								<button type="button" class="close" data-dismiss="modal">Close</button>
							</div>
   <%}else{ %>
   
   <%} %>
 <%}else{  %>
							<div class="button-wrapper">
								<input name="btn3" class="btn-style" value="Send Enquiry"
									type="button" onclick="sendEnquiry()" />
								<button type="button" class="close" data-dismiss="modal">Close</button>
							</div>                                                   
  <%  }  %>
							
						</div>

					</form>

				</div>

			</div>
		</div>
	</div>



	<div class="pop_main">

		<div class="modal fade" id="rejectModal" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">

						<button type="button" class="close" data-dismiss="modal">&times;</button>

					</div>
					<div class="modal-body">

						<form class="form-horizontal" action="rejectProjectRegistration"
							autocomplete="off" id="rejectForm" method="post"
							name='rejectForm'>
							<%=ReraSecurity.writeToken(request)%>
							<input type="hidden" name="reportId" value="${project.reportId}">
							<div class="inner_wrapper">







								<br> <br>

								<h1>
									Details of the <span>Rejection</span>
								</h1>
								<div class="drop_shadow"></div>
								<div class="clearfix"></div>


								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">
										Subject <sup>*</sup>
									</label>
									<div class="col-sm-6">
										<input type="text" name="rejectSubject" value=""
											class="form-control input-sm" maxlength="200" />
									</div>
								</div>

								<div class="form-group">
									<label for="inputEmail3" class="col-sm-3 control-label">Reason<sup>*</sup>
									</label>
									<div class="col-sm-6">

										<div>
											<textarea id="reasonForRejection" rows="7"
												class="form-control requiredValFld input-sm"
												name="reasonForRejection"> 
					 		    	</textarea>
										</div>

										<%--       <div hidden id="showId2" >
						        	<textarea id="textareaId2"  name="summary" rows="7"
										class="form-control requiredValFld input-sm"> 
										 <c:out value="${template[1].templateContent}" />;
									 </textarea>  
									</div> --%>
										<span class='requiredValFldMsg'> Please enter Rejection
											details</span>
									</div>
									<!--
                                                            <div class="col-md-3">
                                                                <c:forEach items="${template}" var="tempText">
                                                                    <input type="radio" name="re" value="v1" onclick="templateFun(${tempText.templateId})"> ${tempText.templateText} <br>
                                                                </c:forEach>
                                                            </div>
-->
								</div>

							</div>

							<div class="button-wrapper">
								<input name="btn3" class="btn-style" value="Reject"
									type="button" onclick="submitTrxForm('REJECTED')" />
								<button type="button" class="close" data-dismiss="modal">Close</button>
							</div>
					</div>

					</form>

				</div>

			</div>
		</div>
	</div>




</div>






