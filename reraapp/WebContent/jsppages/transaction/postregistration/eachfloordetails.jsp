<%@page import="in.gov.rera.common.security.ReraSecurity"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page import="in.gov.rera.common.util.ReraConstants"%>
<%@page import="in.gov.rera.common.model.UserModel"%>
<%
	UserModel user = (UserModel) session.getAttribute(ReraConstants.SES_USER_ATTR);
%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="Root - Bootstrap 4 Admin Template">
<meta name="author" content="Łukasz Holeczek">
<meta name="keyword"
	content="Bootstrap,Admin,Template,Open,Source,AngularJS,Angular,Angular2,jQuery,CSS,HTML,RWD,Dashboard">
<link rel="shortcut icon"
	href="<%=request.getContextPath()%>/resources/postprojregistration/img/favicon.png">
<style>
#nextFloor {
  display: none;
}

</style>
<title>Project Details</title>

</head>


<body class="navbar-fixed sidebar-nav fixed-nav">
	<header class="navbar">
		<div class="container-fluid">
			<button
				class="navbar-toggler mobile-toggler hidden-lg-up sidebar_btn"
				type="button"></button>
			<a class="navbar-brand" href="<%=request.getContextPath()%>/home"></a>
			<ul class="nav navbar-nav hidden-md-down">
				<li class="nav-item"><a
					class="nav-link navbar-toggler layout-toggler sidebar_btn" href="#"></a>
				</li>

			</ul>
		</div>
	</header>

	<div class="sidebar">
		<div class="sidebar-header">
			<img
				src="<%=request.getContextPath() %>/reraimage?IMG_ID=${projectReg.promoterDetailsModel.individualPhotoGraphPath.documentId}"
				onerror="this.src='<%=request.getContextPath()%>/resources/postprojregistration/img/avatars/user-top-icon.jpg';return false;"
				class="img-avatar" alt="User profile" />
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
			<div class="col-sm-12">
				<div class="card">
					<div class="row">
						<div class="card-header">
							<div class="row">
								<div class="col-md-6">
									<i class="fa fa-align-justify"></i> Floor Details
								</div>
							</div>
						</div>
						<div class="card-block">
						<% int count = 0; %>
							<form:form class="form-horizontal" autocomplete="off"
						action="updateEachApartmentDetails"
						modelAttribute="projectRegistrationModel"
						enctype="multipart/form-data" id="eachApartForm"
						method="post">
<div class="panel-heading card-header collapsed" >
                                        <b>Provide the Apartment Details</b>
                                            </div>
                                            
                                            
                                            
                                            <div class="panel-body" id="eachFloorDetails">
                                            <!-- The inside div eliminates the 'jumping' animation. -->
                                            <div >
                            
                           <c:choose>
                           <c:when test="${empty apartmentList}">
                             <table class="table table-bordered table-striped table-condensed" id="sche-list">
                                <thead>
                                    <tr>
                                        <th rowspan="2">Apartment type</th>
                                           <th rowspan="2">Total No Of each Apartment type</th>
                                        <th rowspan="2">Carpet Area</th>
                                        <th rowspan="2">Built-up area</th>
                                        <th rowspan="2">Proportionate Common area</th>
                                    </tr>
                                </thead>
                                <tbody >
                                 <tr >  

                                        <td><select name="apartmentType" id="" class="" style="width: 180px !important; min-width: 180px; max-width: 180px; vertical-align: right;">
										    <option value="0">--Select--</option>
											<option value="1BHK">1BHK</option>
											<option value="2BHK">2BHK</option>
											<option value="3BHK">3BHK</option>
											<option value="4BHK">4BHK</option>
											<option value="5BHK">5BHK</option>
											<option value="office">Office</option>
											<option value="shop">Shop</option>
											<option value="other">other</option>
											
											
							            </select>
							            </td>
							            <td><input type="text" id="totNoOfUnits_0" name="totNoOfEachApartmentType" value="" /></td>
							            <td><input type="text" name="carpetArea" value="" /></td>
							            <td><input type="text" name="builtUpArea" /></td>
							            <td><input type="text" name="proportionateCommonArea" /></td>
							            
                                    </tr>
                            </tbody>
                            </table>
                            <button type="button" class="btn btn-primary btn-sm pull-right btn-add-apartment">Add More Apartments </button>
							<br>
							<br>
							<button type="button" class="btn btn-success btn-sm pull-right" id="eachApartFormId">Save</button>
                           <c:forEach items="${projectRegistrationModel.projectDetailsModel.towerDetailsList}" var="tower" 
                                  begin="${projectRegistrationModel.projectDetailsModel.towerDetailsList.size()-1}" end="${projectRegistrationModel.projectDetailsModel.towerDetailsList.size()}">
								<input type="hidden" name="totApartments" id="totApartments" readOnly value="${tower.totApartments}"/>
                                  </c:forEach>
                                  
                           </c:when>
                           <c:otherwise>
                             <table class="table table-bordered table-striped table-condensed" id="sche-list">
                                <thead>
                                    <tr>
                                     
                                        <th rowspan="2">Apartment type</th>
                                           <th rowspan="2">Total No Of each Apartment type</th>
                                        <th rowspan="2">Carpet Area</th>
                                        <th rowspan="2">Built-up area</th>
                                        <th rowspan="2">Proportionate Common area</th>
                                    </tr>
                                </thead>
                                <tbody >
                                <%int apcount=-1; %>
                                <c:forEach items="${apartmentList}" var="obj">
                                <% ++apcount; %>
                                 <tr > 
                                 <c:if test="${obj.apartmentType=='1BHK'}">
                                        <td><select name="apartmentType" class="" style="width: 180px !important; min-width: 180px; max-width: 180px; vertical-align: right;">
										    <option value="0">--Select--</option>
											<option value="1BHK" selected>1BHK</option>
											<option value="2BHK">2BHK</option>
											<option value="3BHK">3BHK</option>
											<option value="4BHK">4BHK</option>
											<option value="5BHK">5BHK</option>
											<option value="office">Office</option>
											<option value="shop">Shop</option>
											<option value="other">other</option>
							            </select></td>
							       </c:if>  
							        <c:if test="${obj.apartmentType=='2BHK'}">
                                        <td><select name="apartmentType" class="" style="width: 180px !important; min-width: 180px; max-width: 180px; vertical-align: right;">
										    <option value="0">--Select--</option>
											<option value="1BHK" >1BHK</option>
											<option value="2BHK" selected>2BHK</option>
											<option value="3BHK">3BHK</option>
											<option value="4BHK">4BHK</option>
											<option value="5BHK">5BHK</option>
											<option value="office">Office</option>
											<option value="shop">Shop</option>
											<option value="other">other</option>
							            </select></td>
							       </c:if>    
							       <c:if test="${obj.apartmentType=='3BHK'}">
                                        <td><select name="apartmentType" class="" style="width: 180px !important; min-width: 180px; max-width: 180px; vertical-align: right;">
										    <option value="0">--Select--</option>
											<option value="1BHK" >1BHK</option>
											<option value="2BHK" >2BHK</option>
											<option value="3BHK" selected>3BHK</option>
											<option value="4BHK">4BHK</option>
											<option value="5BHK">5BHK</option>
											<option value="office">Office</option>
											<option value="shop">Shop</option>
											<option value="other">other</option>
							            </select></td>
							       </c:if>
							         <c:if test="${obj.apartmentType=='4BHK'}">
                                        <td><select name="apartmentType" class="" style="width: 180px !important; min-width: 180px; max-width: 180px; vertical-align: right;">
										    <option value="0">--Select--</option>
											<option value="1BHK" >1BHK</option>
											<option value="2BHK" >2BHK</option>
											<option value="3BHK" >3BHK</option>
											<option value="4BHK" selected>4BHK</option>
											<option value="5BHK">5BHK</option>
											<option value="office">Office</option>
											<option value="shop">Shop</option>
											<option value="other">other</option>
							            </select></td>
							       </c:if>
							       <c:if test="${obj.apartmentType=='5BHK'}">
                                        <td><select name="apartmentType" class="" style="width: 180px !important; min-width: 180px; max-width: 180px; vertical-align: right;">
										    <option value="0">--Select--</option>
											<option value="1BHK" >1BHK</option>
											<option value="2BHK" >2BHK</option>
											<option value="3BHK" >3BHK</option>
											<option value="4BHK" >4BHK</option>
											<option value="5BHK" selected>5BHK</option>
											<option value="office">Office</option>
											<option value="shop">Shop</option>
											<option value="other">other</option>
							            </select></td>
							       </c:if>
							         <c:if test="${obj.apartmentType=='Office'}">
                                        <td><select name="apartmentType" class="" style="width: 180px !important; min-width: 180px; max-width: 180px; vertical-align: right;">
										    <option value="0">--Select--</option>
											<option value="1BHK" >1BHK</option>
											<option value="2BHK" >2BHK</option>
											<option value="3BHK" >3BHK</option>
											<option value="4BHK" >4BHK</option>
											<option value="5BHK" >5BHK</option>
											<option value="office" selected>Office</option>
											<option value="shop">Shop</option>
											<option value="other">other</option>
							            </select></td>
							       </c:if>
							       <c:if test="${obj.apartmentType=='shops'}">
                                        <td><select name="apartmentType" class="" style="width: 180px !important; min-width: 180px; max-width: 180px; vertical-align: right;">
										    <option value="0">--Select--</option>
											<option value="1BHK" >1BHK</option>
											<option value="2BHK" >2BHK</option>
											<option value="3BHK" >3BHK</option>
											<option value="4BHK" >4BHK</option>
											<option value="5BHK" >5BHK</option>
											<option value="office" >Office</option>
											<option value="shop" selected>Shop</option>
											<option value="other">other</option>
							            </select></td>
							       </c:if>
							        <c:if test="${obj.apartmentType=='other'}">
                                        <td><select name="apartmentType" class="" style="width: 180px !important; min-width: 180px; max-width: 180px; vertical-align: right;">
										    <option value="0">--Select--</option>
											<option value="1BHK" >1BHK</option>
											<option value="2BHK" >2BHK</option>
											<option value="3BHK" >3BHK</option>
											<option value="4BHK" >4BHK</option>
											<option value="5BHK" >5BHK</option>
											<option value="office" >Office</option>
											<option value="shop" >Shop</option>
											<option value="other" selected>other</option>
							            </select></td>
							       </c:if>
                                        
							             <%-- <td><input type="text" name="apartmentType" value="${obj.apartmentType}" /></td> --%>
							             <td><input type="text" id="totNoOfUnits_<%=apcount %>" name="totNoOfEachApartmentType" value="${obj.totNoOfEachApartmentType}" /></td>
							            <td><input type="text" name="carpetArea" value="${obj.carpetArea}" /></td>
							            <td><input type="text" name="builtUpArea"  value="${obj.builtUpArea}" /></td>
							            <td><input type="text" name="proportionateCommonArea"  value="${obj.proportionateCommonArea}" /></td>
                                    </tr>
                                </c:forEach>
                                
                                   <c:forEach items="${projectRegistrationModel.projectDetailsModel.towerDetailsList}" var="tower" 
                                  begin="${projectRegistrationModel.projectDetailsModel.towerDetailsList.size()-1}" end="${projectRegistrationModel.projectDetailsModel.towerDetailsList.size()}">
								<input type="hidden" name="totApartments" id="totApartments" readOnly value="${tower.totApartments}"/>
                                  </c:forEach>
                              
                                          
                            </tbody>
                            </table>
                            <button type="button" class="btn btn-primary btn-sm pull-right btn-add-apartment">Add More Apartments </button>
                            <br/>
                            <br/>
                           <button type="button" class="btn btn-primary btn-sm pull-right" id="eachApartFormId">Save</button>
                           <br/>
                           <br/>
<p style="text-align:right"><font color="red">* choose Add More Tower Details for additional Tower details</font></p>
<a href="towerdetails"><button type="button" class="btn btn-success btn-sm pull-right btn-add-tower">Add More Tower Details</button></a>
                           <br/>
                           </c:otherwise>
                           </c:choose>
                            <!-- <button type="button" class="btn btn-primary btn-sm pull-right btn-add-apartment">Add More Apartments </button>
							<br>
							<br> -->
							</form:form>
<!-- <a href="postRegProjectDetails"><button type="button" onclick="" class="btn btn-primary btn-sm pull-right btn-add-tower">Continue</button></a> -->
<!-- <button type="button" class="btn btn-primary btn-sm pull-right" id="eachApartFormId">Save</button> -->
<br/>
<!-- <br/>
<p style="text-align:right"><font color="red">* choose Add More Tower Details for additional Tower details</font></p>
<a href="towerdetails"><button type="button" class="btn btn-success btn-sm pull-right btn-add-tower">Add More Tower Details</button></a> -->

										<br />
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--/col-->
		</div>

	</div>
	<!-- /.conainer-fluid --> </main>
<script>





</script>


</body>

</html>