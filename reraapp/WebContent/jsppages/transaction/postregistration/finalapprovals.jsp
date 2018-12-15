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
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<%@page import="in.gov.rera.common.util.ReraConstants"%>
<%@page import="in.gov.rera.common.model.UserModel"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%
UserModel user=(UserModel)session.getAttribute(ReraConstants.SES_USER_ATTR);

%>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Root - Bootstrap 4 Admin Template">
    <meta name="author" content="Łukasz Holeczek">
    <meta name="keyword" content="Bootstrap,Admin,Template,Open,Source,AngularJS,Angular,Angular2,jQuery,CSS,HTML,RWD,Dashboard">
    <link rel="shortcut icon" href="../resources/postprojregistration/img/favicon.png">

    <title>Final Approval</title>

<style>
#approvalDate {
	  display: none;
	}
	#approvalDoc {
	  display: none;
	}
</style>

</head>

<!-- BODY options, add following classes to body to change options
         1. 'compact-nav'     	  - Switch sidebar to minified version (width 50px)
         2. 'sidebar-nav'		  - Navigation on the left
             2.1. 'sidebar-off-canvas'	- Off-Canvas
                 2.1.1 'sidebar-off-canvas-push'	- Off-Canvas which move content
                 2.1.2 'sidebar-off-canvas-with-shadow'	- Add shadow to body elements
         3. 'fixed-nav'			  - Fixed navigation
         4. 'navbar-fixed'		  - Fixed navbar
         5. 'footer-fixed'		  - Fixed navbar
     -->

<body class="navbar-fixed sidebar-nav fixed-nav">
    <header class="navbar">
        <div class="container-fluid">
            <button class="navbar-toggler mobile-toggler hidden-lg-up sidebar_btn" type="button"></button>
            <a class="navbar-brand" href="<%=request.getContextPath()%>/home"></a>
            <ul class="nav navbar-nav hidden-md-down">
                <li class="nav-item">
                    <a class="nav-link navbar-toggler layout-toggler sidebar_btn" href="#"></a>
                </li>

            </ul>
        </div>
    </header>
    <div class="sidebar">
		 <div class="sidebar-header">
			<img
				src="<%=request.getContextPath()%>/resources/postprojregistration/img/avatars/user-top-icon.jpg"
				class="img-avatar" alt="Avatar">
			<div>
				<strong><%=user.getUserName()%></strong>
			</div>
			<!-- <div class="text-muted">
				<small>User &amp; user</small>
			</div> -->
		</div> 
		 <%@include file="/jsppages/transaction/postregistration/leftnav.jsp"%>
	</div>

    <!-- Main content -->
    <main class="main">
    


        <div class="container-fluid">
         <div class="row">
                <div class="col-lg-12">
                    <div class="card">
       				 <div class="card-header">
                         <div class="col-md-12">
                            <i class="fa fa-align-justify"></i> Final Approval : Registration Number  -  ${projectRegistrationModel.projectRegistrationNo} 
                            </div>
                            <%--  <div class="col-md-6">
                             <select name="projectRegId" id="finalApprovalProjId"  class=" form-control  requiredValFld" style="width: 180px !important; min-width: 180px; max-width: 180px;vertical-align:right;" >
							<option value="0"> --Select-- </option>
							<c:forEach items="${projectList}" var="listmodal">
							<c:choose>
							<c:when test="${listmodal.projectRegId==projectRegistrationModel.projectRegId }">
								<option value="${listmodal.projectRegId}" selected="selected"> ${listmodal.projectRegistrationNo} </option>
							</c:when>
							<c:otherwise>
								<option value="${listmodal.projectRegId}"> ${listmodal.applicationNo} </option>
							</c:otherwise>
							</c:choose>
							</c:forEach>
							</select> 
                        </div> --%>
                        </div>
      

	<form:form class="form-horizontal" autocomplete="off" action="updateFinalApprovalDetails" modelAttribute="projectRegistrationModel" enctype="multipart/form-data" id="finalApproveForm" method="post">
            <table class="table table-bordered table-striped table-condensed" id="approvalTable">
                <tbody>
                 <c:choose>
                    <c:when test="${finalApprovalStatus == 'YES'}">
                    <%  int i = 0;%>
                    <c:forEach items="${projectRegistrationModel.projectDetailsModel.finalApproval}" var="finalApproveObj">
                    <tr>
                      <%i++;%>
                      <td><%=i%></td>
                      <td>
                      <input type="hidden" name="finalApprovalsDetailsId" value="${finalApproveObj.finalApprovalsDetailsId}"/>
                      <input type="text" readOnly name="nameOfCerificate" value="${finalApproveObj.nameOfCerificate}"></td>
                       <%-- <td>
                     <c:choose>
                     <c:when test="${finalApproveObj.nameOfCerificate == 'Insurance'  && finalApproveObj.isApplicable == 'Yes'}">
                       <div class="col-md-9">
                          <label class="radio-inline" for="isApplicable">
                                  <input type="radio" id="isApplicable" name='isApplicable' value="Yes" class='dynaselectfld requiredValFld' checked="checked">Yes
                              </label>
                          <label class="radio-inline" for="isApplicable">
                                  <input type="radio" id="isApplicable" name='isApplicable' value="No">No
                              </label>
                      </div> </c:when>
                     <c:otherwise>
                       <div class="col-md-9">
                          <label class="radio-inline" for="isApplicable">
                                  <input type="radio" id="inline-radio1" name='isApplicable' value="Yes">Yes
                              </label>
                          <label class="radio-inline" for="isApplicable">
                                  <input type="radio" id="inline-radio2" name='isApplicable' value="No" checked="checked">No
                              </label>
                      </div>
                     </c:otherwise>
                     </c:choose> 
                     </td>  --%>
                      
                      <td>
				<fmt:formatDate type="date"  pattern="yyyy-MM-dd" dateStyle="short" var="formateddate1" value="${finalApproveObj.approvedDate.time}"/>
				<input type="date" name="approvedDate" value="${formateddate1}" class="form-control requiredValFld"/>
				 <span class='requiredValFldMsg'>Please Enter Approved Date </span>
				</td>  
				<td> <input  type="hidden" name="uploadDocId" value="${finalApproveObj.uploadDoc.documentId}"/>
				<input type="file"  name="uploadDoc" title="Only image or pdf file is allowed. file size upto 1 MB" >
				 	<a  href='<%=request.getContextPath() %>/download?DOC_ID=${finalApproveObj.uploadDoc.documentId}'>
				${finalApproveObj.uploadDoc.fileName}</a></td>
                  </tr>
                    </c:forEach>
                    </c:when>
                    <c:otherwise>
                    
                    <tr>
                        <td>1</td>
                         <td>  <input type="text" readOnly id="text-input" name="nameOfCerificate" value="Occupancy Certificate" class="form-control" placeholder="" class="requiredValFld"></td>
   						<!-- <td> <label class="radio-inline" for="inline-radio1"><input type="radio" id="inline-radio1" name="isApproved_1" value="Yes">Yes
   						<span class='requiredValFldMsg'>Please Upload Certificate </span>
   						</label>
                            <label class="radio-inline" for="inline-radio2"> <input type="radio" id="inline-radio2" name="isApproved_1" value="No">No</label>
                        </td> -->
                        
                        <td>Date <input type="date" name="approvedDate" class="requiredValFld">
                            <span class='requiredValFldMsg'>Please Enter Approved Date </span>
                        </td>
                        <td><input type="file" name="uploadDoc" class="requiredValFld">
                         <span class='requiredValFldMsg'>Please Upload Document </span>
                        </td>
                    </tr>
                      <tr>
                        <td>2</td>
                        <td >  <input type="text" readOnly id="text-input" name="nameOfCerificate" value="Completion certificate issued by the competent authority" class="form-control requiredValFld" placeholder="" ></td>
                       <!--  <td> <label class="radio-inline" for="inline-radio1"><input type="radio" id="inline-radio1" name="isApproved_0" value="Yes">Yes
                         <span class='requiredValFldMsg'>Please Upload Certificate </span>
                        </label>
                            <label class="radio-inline" for="inline-radio2"> <input type="radio" id="inline-radio2" name="isApproved_0" value="No">No</label>
                        </td> -->
                       
                        <td>Date <input type="date" name="approvedDate" class="requiredValFld">
                         <span class='requiredValFldMsg'>Please Enter Approved Date </span>
                        </td>
                        <td><input type="file" name="uploadDoc" class="requiredValFld">
                         <span class='requiredValFldMsg'>Please Upload Document </span>
                        </td>
                    </tr>
                    
                    <tr>
                        <td>3</td>
                          <td >  <input type="text" readOnly id="text-input" name="nameOfCerificate" value="Registered Agreement of Sale" class="form-control" placeholder=""></td>
                          <!-- <td> <label class="radio-inline" for="inline-radio1"><input type="radio" id="inline-radio1" name="isApproved_3" value="Yes" class="requiredValFld">Yes
                           <span class='requiredValFldMsg'>Please Select Yes/No</span>
                          </label>
                            <label class="radio-inline" for="inline-radio2"> <input type="radio" id="inline-radio2" name="isApproved_3" value="No">No</label>
                        </td> -->
                        
                        <td>Date <input type="date" name="approvedDate" class="requiredValFld">
                        <span class='requiredValFldMsg'>Please Enter Approved Date </span>
                        </td>
                        <td><input type="file" name="uploadDoc" class="requiredValFld">
                           <span class='requiredValFldMsg'>Please Upload Document </span>
                        </td>

                    </tr>
                    
                    <tr>
                        <td>4</td>
                         <td >  <input type="text"  readOnly id="text-input" name="nameOfCerificate" value="Registered conveyance deed for an individual unit" class="form-control" placeholder=""></td>
  							<!--  <td> <label class="radio-inline" for="inline-radio1"><input type="radio" id="inline-radio1" name="isApproved_2" value="Yes" class="requiredValFld">Yes
  							 <span class='requiredValFldMsg'>Please Select Yes/No</span>
  							 </label>
                            <label class="radio-inline" for="inline-radio2"> <input type="radio" id="inline-radio2" name="isApproved_2" value="No">No</label>
                        </td> -->
                         
                        <td>Date <input type="date" name="approvedDate" class="requiredValFld">
                            <span class='requiredValFldMsg'>Please Enter Approved Date </span>
                        </td>
                        <td><input type="file" name="uploadDoc" class="requiredValFld">
                         <span class='requiredValFldMsg'>Please Upload Document </span>
                        </td>
                    </tr>
                    
                     <tr>
                        <td>5</td>
                         <td >  <input type="text"  readOnly id="text-input" name="nameOfCerificate" value="Insurance" class="form-control" placeholder="">
                         <input type="radio" name="isApplicable" onclick= "showApprovalDate()" value="Yes" class="">Yes 
												<input type="radio" name="isApplicable" onclick= "hideApprovalDate()" value="No" class="">No </td>
  							

											
											<td><input type="date" id="approvalDate" name="approvedDate" class="requiredValFld">
                            <span class='requiredValFldMsg'>Please Enter Approved Date </span>
                        </td>
                        <td><input type="file" name="uploadDoc" id="approvalDoc" class="requiredValFld">
                         <span class='requiredValFldMsg'>Please Upload Document </span>
                        </td>
                    </tr>
                    
                    </c:otherwise>
                   </c:choose>
                  

                </tbody>
            </table>
             <input type="button" class="btn btn-sm btn-success  pull-right" id="finalApproveId" value="Save"/>
              <!-- <input type="button" class="btn btn-sm btn-Primary  pull-right" id="btn-add-finalApproval" value="Add More" /> -->
            </form:form>
            </div>
            <br/>
              <c:forEach items="${projectRegistrationModel.projectDetailsModel.quarterlyUpdate}" var="quarterList">
               <c:if test="${quarterList.bankDetails.percentageOfProjectCompletion=='100'}"> 
							 <a href="<%=request.getContextPath()%>/quarter/projectQuarterDetails?quarterId=${quarterList.quaterlyId}"
								style="padding-left: 400px;"> <input type="button"
								class="btn btn-sm btn-primary" width="50px;" id="QuarterSubmit"
								value="Quarter Submit" />
							</a>
							 </c:if>
							 </c:forEach>
            
            </div>
            </div>

        </div>
        <!-- /.conainer-fluid -->
    </main>


   <!--  <footer class="footer">
        <span class="text-left">
             <a href="http://www.keyfalconsolutions.com/">Branding</a> © 2016 Developers.
         </span>
        <span class="pull-right">
             Powered by <a href="http://www.keyfalconsolutions.com/">Keyfalcon Solutions</a>
         </span>
    </footer> -->
    <%-- <%@ include file="/jsppages/transaction/postregistration/common_footer.jsp"%>
 --%>
</body>

</html>