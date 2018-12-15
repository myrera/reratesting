<%@page import="in.gov.rera.common.security.ReraSecurity"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet"	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!--News Ticker-->

<div class="container mar_top_20">

	<c:if test="${enquiries.size()!=0}">
		<h1>My Tickets</h1>

		<div class="table-responsive">


			<table class="table table-bordered" id="taskList">
				<thead>
					<tr>

						<th>TICKET NUMBER</th>
						<th>ENQUIRY DATE</th>
						<th>CATEGORY</th>
						<th>DESCRIPTION</th>
						<th>STATUS</th>
						<th>ATTACHMENTS</th>


					</tr>
				</thead>
				<tbody>
					<%
						int count = 0;
					%>
					<c:forEach items="${enquiries}" var="obj">
						<tr>

							<td>${obj.ticketNumber }</td>
							<td><c:set var="crdt" value="${obj.createdOn}" /> <fmt:formatDate
									type="date" pattern="dd-MM-yyyy HH:mm" dateStyle="short"
									value="${crdt}" /></td>
							<td>${obj.category.name }</td>
							<td>${obj.description }</td>

							<td><input type="button" name="return" value="${obj.status}"
								data-toggle="modal" data-target="#returnModal${obj.id}">

								<div class="modal fade" id="returnModal${obj.id}" role="dialog">
									<div class="modal-dialog">

										<!-- Modal content-->
										<div class="modal-content">
											<div class="modal-header">
												<span>Status Details</span>
												<button type="button" class="close" data-dismiss="modal">&times;</button>
											</div>
											<div class="modal-body">

												<div class="table-responsive">
													<table class="table table-bordered">
														<thead>
															<tr>
																<th>DATE</th>
																<th>Assignor</th>
																<th>Assignee</th>
																<th>Status</th>
																<th>Comments</th>
																<th>Attachment</th>

															</tr>
														</thead>
														<tbody>
															<c:forEach items="${obj.logs}" var="log">

																<tr>

																	<td><c:set var="crdt" value="${log.createdOn}" />
																		<fmt:formatDate type="date" pattern="dd-MM-yyyy HH:mm"
																			dateStyle="short" value="${crdt}" /></td>
																	<td>${log.assignor.userName}</td>
																	<td>${log.assignee.userName}</td>
																	<td>${log.status}</td>
																	<td><c:if test="${log.publicComment==true}">${log.description} </c:if>
																		<c:if test="${log.publicComment==false}">Seeking  Clarification </c:if>
																	</td>
																	<td>
																	<c:if test="${log.publicComment==true}">
																	<c:forEach items="${log.attachments}"
																				var="doc">
																				<a
																					href='<%=request.getContextPath() %>/download?DOC_ID=${doc.documentId}'>${doc.fileName}</a>
																				<br>
																			</c:forEach>
																			</c:if>
																	</td>
																</tr>
															</c:forEach>
														</tbody>


													</table>
													<c:if test="${obj.status=='CLOSE'}">
														<form class="form-horizontal" action="acceptReject" method="post">
<input type="hidden" value="${obj.id}" name="ticketId">
															<div class="form-group">

																<div class="form-group  has-feedback ">
																	<label for="inputEmail3" class="col-sm-3 control-label">Action
																		Type</label>
																	<div class="col-sm-9">
																		<input type="radio" name="type" value="ACCEPT">
																		&nbsp; Accept Clarification &nbsp;&nbsp;&nbsp;&nbsp; <input
																			type="radio" name="type" value="REOPEN">
																		&nbsp; Seek More Clarification
																	</div>
																</div>
															</div>

															<div class="form-group">

																<div class="form-group  has-feedback ">
																	<label for="inputEmail3" class="col-sm-3 control-label">Remarks</label>
																	<div class="col-sm-6">
																		<textarea name="remarks"
																			class="form-control requiredValFld" id="remarks"
																			cols="20"></textarea>
																		<span class='requiredValFldMsg'> Please enter
																			remarks.</span>
																	</div>
																</div>
															</div>

															<div class="form-group">
																<div class="col-sm-offset-3 col-sm-9">
																	<input name="btn1" class="btn-style" value="Submit"
																		type="submit" id ="submitbtn"/>

																</div>
															</div>

														</form>
													</c:if>
												</div>










											</div>

										</div>
									</div>
								</div></td>
							<td><c:forEach items="${obj.attachments}" var="doc">
									<a
										href='<%=request.getContextPath() %>/download?DOC_ID=${doc.documentId}'>${doc.fileName}</a>
									<br>
								</c:forEach></td>
						</tr>

					</c:forEach>
				</tbody>
			</table>
		</div>

	</c:if>
	<div class="col-md-6 col-md-offset-3">

		<br> <br>
		<!--main container start here-->
		<div class="Main_containner">

			<!--Inner wrapper stsrt here-->
			<div class="inner_wrapper">



				<h1>
					Enquiry <span>Details</span>
				</h1>

				<div class="drop_shadow"></div>

				${ERROR_MSG}

				<form:form class="form-horizontal" method="post"
					action="createEnquiry" id="loginFormID" name="loginForm"
					autocomplete="off" enctype="multipart/form-data">
					<input type="hidden" name="loginId" id="uloginId" />
					<input type="hidden" name="password" id="upassword" />

					<%=ReraSecurity.writeToken(request)%>
					<div class="form-group has-feedback">
						<label for="inputPassword3" class="col-sm-3 control-label">
							<c:choose>
								<c:when test="${RERA_USER_ATTR.userType=='PROJECT'}">
						PROMOTER
						</c:when>
								<c:otherwise>
						${RERA_USER_ATTR.userType.toUpperCase()}
						</c:otherwise>
							</c:choose> NAME
						</label>
						<div class="col-sm-9">

							<input type="text" class="form-control" name="name" id="name"
								value=${RERA_USER_ATTR.userName } readonly>
						</div>
					</div>
					<div class="form-group has-feedback">
						<label for="inputPassword3" class="col-sm-3 control-label">Application
							Number </label>
						<div class="col-sm-9">

							<input type="text" class="form-control" name="applicationNumber"
								id="applicationId"  onchange="showInfo()">
						</div>
					</div>
					<div class="form-group  has-feedback ">
						<label for="inputEmail3" class="col-sm-3 control-label ">Category</label>
						<div class="col-sm-9">

							<select name="category" id='category'
								class="form-control requiredValFld">
								<option value="0">--Select--</option>
								<c:forEach items="${categories}" var="cat">
									<option value="${cat.id}">${cat.name}</option>
								</c:forEach>
							</select>
						<span class='requiredValFldMsg'> Please select category</span>
						</div>
					</div>
					<div class="form-group has-feedback">
						<label for="inputPassword3" class="col-sm-3 control-label requiredValFld">Description
						</label>
						<div class="col-sm-9">

							<textarea class="form-control requiredValFld" name="description"
								id="description"></textarea>
								<span class='requiredValFldMsg'> Please Enter Description </span>
						</div>
					</div>
					<div class="form-group has-feedback">
						<label for="inputPassword3" class="col-sm-3 control-label" 	>Phone
						</label>
						<div class="col-sm-9">
							<input type="text" class="form-control requiredValFld" name="contactNumber"
								id="contactNumber" maxlength="10" rel="txtTooltip"
									title="Only 10 digits of mobile number is allowed." data-toggle="tooltip" data-placement="bottom">
								<span class='requiredValFldMsg'> Please enter phone number</span>
						</div>
					</div>

					<div class="form-group has-feedback">
						<label for="inputPassword3" class="col-sm-3 control-label">Attachment
							1 </label>
						<div class="col-sm-9">
							<input type="file" Class="form-control "
								rel="txtTooltip"
								title="Only image or pdf file is allowed. file size upto 1 MB"
								data-toggle="tooltip" data-placement="bottom" name="attachment1"
								id="attachment1"> <span class='requiredValFldMsg'>
								Please Attach Receipt.</span>
						</div>
					</div>
					<br>
					<div class="form-group has-feedback">
						<label for="inputPassword3" class="col-sm-3 control-label">Attachment
							2 </label>
						<div class="col-sm-9">
							<input type="file" Class="form-control "
								rel="txtTooltip"
								title="Only image or pdf file is allowed. file size upto 1 MB"
								data-toggle="tooltip" data-placement="bottom" name="attachment2"
								id="attachment2"> <span class='requiredValFldMsg'>
								Please Attach Receipt.</span>
						</div>
					</div>
					<br>
					<div class="form-group has-feedback">
						<label for="inputPassword3" class="col-sm-3 control-label">Attachment
							3 </label>
						<div class="col-sm-9">
							<input type="file" Class="form-control "
								rel="txtTooltip"
								title="Only image or pdf file is allowed. file size upto 1 MB"
								data-toggle="tooltip" data-placement="bottom" name="attachment3"
								id="attachment3"> <span class='requiredValFldMsg'>
								Please Attach Receipt.</span>
						</div>
					</div>
					<br>
					<div class="form-group">
						<div class="col-sm-offset-3 col-sm-9">
							 <input name="btn1" class="btn-style" value="Send" type="button" onclick="registerForm()"/>

						</div>
					</div>
				</form:form>
				<br> <br>



				<div class="clearfix"></div>
				<!--search list main end here-->
			</div>

		</div>


		<!--inner container end here-->
	</div>


</div>

<!-- container end here-->

<script>
	document.getElementById('description').height = 150;
	var  _chkclk=true;
	function registerForm() {
		 var frm= $("#loginFormID");
		   if(validateForm(frm)){
			   if(_chkclk){   
				   _chkclk=false;
				$(frm).submit();
			   }   }
		
	}
</script>

<script>
	var applicationArray = new Array();
	var applicationNameList = new Array();
	<c:forEach items="${allApplicantsList}" var="application">
	
	var localObj = {
		appNo : '<c:out value="${application.applicationNo}"/>'
	};
	var count = 0;
	count = count + 1;
	if (count < 10)
		applicationNameList
				.push('<c:out value="${application.applicationNo}"/>');
	applicationArray.push(localObj);
	</c:forEach>

	$(function() {
		
		$("#applicationId").autocomplete(
				{
					source : function(request, response) {
						var results = $.ui.autocomplete.filter(
								applicationNameList, request.term);

						response(results.slice(0, 5));
					}
				});
	});

	function showInfo() {
		var selectedApp = document.getElementById('applicationId').value;
		console.log(selectedApp)
		for (var i = 0; i < applicationArray.length; i++) {
			if (selectedApp == applicationArray[i].applicationNo) {
				document.getElementById('applicationId').value = applicationArray[i].appNo;
			}
		}
	}

	function isReraProFun(val) {

		if (val == 'Yes') {

			document.getElementById('isReraId').style.display = 'block';
			document.getElementById('isNotReraId').style.display = 'none';
		} else if (val == 'No') {
			document.getElementById('isReraId').style.display = 'none';
			document.getElementById('isNotReraId').style.display = 'block';
		}

	}
</script>




