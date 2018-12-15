<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
   <%@page import="in.gov.rera.common.util.ReraConstants"%>
<%@page import="in.gov.rera.common.model.UserModel"%>
<%
UserModel user=(UserModel)session.getAttribute(ReraConstants.SES_USER_ATTR);

%>
    
    <div class="breadcrumb">Home /Associated Project List<span class="pull-right user_name">Welcome :<b><%=user.getUserName() %></b></span></div>


<!--News Ticker-->
<div class="container">


   

    
		<div class="col-md-12 col-sm-12">
			
			<div class="Main_containner">

<!--Inner wrapper start here-->
<div class="inner_wrapper">

	



     <div class="col-md-12">
     <h1>Associated Project <span> List</span></h1>
   
     </div>
 
  
  
  
  <c:forEach items="${agentReg.projectRegistrationModelSet }" var="agentProject">
   <c:if test="${agentProject.status=='CONFIRMED'}">
    <div class="drop_shadow">  <p data-placement="top" data-toggle="tooltip" title="Delete">
    <a href="#" onclick="removeProjects('${agentProject.projectRegId}')">
    <span class="glyphicon glyphicon-trash"></span></a></p></div>
    
   
<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right ">Project Name <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p class="text-view">${agentProject.projectDetailsModel.projectName}</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Registration No.  <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agentProject.projectRegistrationNo} </p></div>
		
</div>
<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right ">Promoter Name <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p class="text-view">${agentProject.promoterDetailsModel.promoterName}</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right ">Promoter Type <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p class="text-view"> ${agentProject.promoterDetailsModel.typeOfPromoter } </p></div>
		
</div>
		
		
		
<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Project Type<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agentProject.projectDetailsModel.projectType}</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Project Status<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${agentProject.projectDetailsModel.projectStatus}  </p></div>
</div>
		
</c:if>
			</c:forEach>								
				

			
			
	
	
	

	</div>
<!--inner container end here-->





</div>
			
		</div>
	
	


<!-- container end here-->

</div>
    