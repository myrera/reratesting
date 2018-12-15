<%@page import="in.gov.rera.common.security.ReraSecurity"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

     <%@ page isELIgnored="false"%>
     <%@page import="in.gov.rera.common.util.ReraConstants"%>
<%@page import="in.gov.rera.common.model.UserModel"%>
<%
UserModel user=(UserModel)session.getAttribute(ReraConstants.SES_USER_ATTR);

%>
<script>
function updateDevstatus(_btn){
	var _id= $(_btn).attr("id");
	var _frm= $("#"+_id+"-form");
	if(validateForm(_frm)){
		$(_frm).submit();
	}
}

function updateExtDevstatus(){
	var _frm=$("#extdevstatus-form");
	if(validateForm(_frm)){
		$(_frm).submit();
	}
}
</script>
    
    <div class="breadcrumb">Home /Project Dash Board<span class="pull-right user_name">Welcome :<b><%=user.getUserName() %> </b></span></div>


<!--News Ticker-->
<div class="container">

    
		<div class="col-md-12 col-sm-12">
			
			<div class="Main_containner">

	</div>


<div class="drop_shadow"></div>
<br clear="all"/>
    
						

<div class="inner_wrapper">
			
			<h1>Development <span> Details</span> </h1><h1 align="right"></h1>
			
			<% int xx=0; %>

	<c:forEach items="${projectReg.developmentDetailSet}" var="devObj">
	
	<div class="drop_shadow"></div>

	<td>

	<div class="row">
	<h1><div class="pull-right">Last Updated <span>On &nbsp;&nbsp;&nbsp;</span>${devObj.currentStatus.updatedOn.time}</div></h1>
	</div>
	<br>
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Type of Inventory<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${devObj.typeOfInventory}</p> </div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">No of Inventory<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${devObj.noOfInventory}  </p></div>
	</div>
	</td>
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Carpet Area (Sq Mtr)<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${devObj.carpetArea} Sq Mtr</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Area of exclusive balcony/verandah (Sq Mtr)<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${devObj.areaOfExclusive} Sq Mtr</p></div>
	
	</div>
	
		<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Area of exclusive open terrace if any (Sq Mtr)<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${devObj.areaOfExclusiveOpenTerrace}  Sq Mtr</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">No Of Inventory Completed<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${devObj.currentStatus.totalCompleted} </p></div>

		</div>
		<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">No Of Inventory Sold<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${devObj.currentStatus.totalSold}</p></div>
		
		</div>
		</div>
	
		
		
	<div class="col-sm-2 pull-right" style="text-align: right;">
			
			<div id="button"  class=" theme-clr" data-toggle="collapse" data-target="#devstform<%=xx %>" style="cursor:pointer">
      <span class="glyphicon glyphicon-plus-sign"></span> Update Status
    </div>
	</div>
	<div class='clearfix'></div>
	
	
		<div class="inner_wrapper collapse" id="devstform<%=xx %>">
	
    <form name="updateDevStatus<%=xx %>" id="devstatus<%=xx %>-form" autocomplete="off"  class="form-horizontal" action="updateDevStatus"  method="post">
		<%=ReraSecurity.writeToken(request) %>
		<input type='hidden' name='dev_id' value='${devObj.devId}'  />
		<h1> Development  <span>Status</span></h1>
		
			<div class="drop_shadow"></div>

	<div class="form-group">
		<label for="inputEmail3" class="col-sm-3 control-label">Completed:</label>
				<div class="col-sm-3">
				<input type="text" name="inv_completed" rel="txtTooltip" title="Only digits are allowed." data-toggle="tooltip"
				 data-placement="bottom" class="form-control numericValFld requiredValFld"/>
				<span class='requiredValFldMsg'> Please enter No.of Inventory Completed.</span>
				</div>
				
				<label for="inputEmail3" class="col-sm-2 control-label">Sold:</label>
				<div class="col-sm-3">
					<input type="text" name="inv_sold" rel="txtTooltip" title="Only digits are allowed." data-toggle="tooltip"
					 data-placement="bottom" class="form-control numericValFld requiredValFld"/>
				<span class='requiredValFldMsg'> Please enter No.of Inventory Sold.</span>
				</div>
</div>
 <div class="form-group">		
				
				<div class="col-sm-3 col-md-offset-3">
				<input name="btn1" class="btn-style" id="devstatus<%=xx %>"  value="Update" type="button" onclick="updateDevstatus(this)" />
				</div>						
	</div>	

</form>
	<div class='clearfix'></div>
	</div>
	
	<% xx++; %>
	
	
	
	</c:forEach>
	
	
</div>	
			
		
<div class="inner_wrapper">
		
<h1>Internal Development  <span>Work</span></h1>
			<div class="drop_shadow"></div>
			
			<div class="row">
	<h1><div class="pull-right">Last Updated <span>On &nbsp;&nbsp;</span>${projectReg.externalDevelopmentWorkModel.currentStatus.updatedOn.time}</div></h1>
	</div>
<br>
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Road & Road System<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${projectReg.externalDevelopmentWorkModel.roadSysetmDevBy }&nbsp;&nbsp;&nbsp;&nbsp; ${projectReg.externalDevelopmentWorkModel.currentStatus.roadSysetmDevStatus}% Completed</p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Water supply<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${projectReg.externalDevelopmentWorkModel.waterSupplyBy } &nbsp;&nbsp;&nbsp;&nbsp; ${projectReg.externalDevelopmentWorkModel.currentStatus.waterSupplyStatus}% Completed </p></div>
	</div>
	
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Sewege and Drainage System <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${projectReg.externalDevelopmentWorkModel.sewegeAndDrainageSystemDevBy } &nbsp;&nbsp;&nbsp;&nbsp; ${projectReg.externalDevelopmentWorkModel.currentStatus.sewegeAndDrainageStatus}% Completed </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Electricity Supply Trasfomer And Sub Station<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${projectReg.externalDevelopmentWorkModel.electricityAndTrasfomerSupply } &nbsp;&nbsp;&nbsp;&nbsp; ${projectReg.externalDevelopmentWorkModel.currentStatus.electricityStatus}% Completed  </p></div>
	</div>
	
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Solid Waste Managment And Disposal<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${projectReg.externalDevelopmentWorkModel.solidWasteSupplyBy } &nbsp;&nbsp;&nbsp;&nbsp; ${projectReg.externalDevelopmentWorkModel.currentStatus.solidWasteStatus}% Completed</p></div>
		
	</div>
	
	
	<!-- Added 4 new fields -->
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Fire Fighting facility <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.externalDevelopmentWorkModel.fireFighting } </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Drinking Water Facility<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.externalDevelopmentWorkModel.drinkingWater}  </p></div>
	</div>
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Emergency Evacuation Services <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.externalDevelopmentWorkModel.emergencyEvacuation } </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Use of Renewable Energy<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.externalDevelopmentWorkModel.renewableEnergy}  </p></div>
	</div>
	
	
		<div class="col-sm-2 pull-right" style="text-align: right;">
			
			<div id="button"  class=" theme-clr" data-toggle="collapse" data-target="#extdevstform" style="cursor:pointer">
      <span class="glyphicon glyphicon-plus-sign"></span> Update Status
    </div>
	</div>
	<div class='clearfix'></div>
		<div class="inner_wrapper collapse" id="extdevstform">
	
    <form name="updateExtDevStatus" id="extdevstatus-form" autocomplete="off" class="form-horizontal" action="updateExtDevStatus"  method="post">
		<%=ReraSecurity.writeToken(request) %>
		<input type='hidden' name='dev_id'  value='${projectReg.externalDevelopmentWorkModel.extDevId}'>
		<h1> External Development  <span>Status</span></h1>
		
			<div class="drop_shadow"></div>

	<div class="form-group">
		<label for="inputEmail3" class="col-sm-3 control-label">Road & Road System:</label>
		
				<div class="col-sm-3">
				<input type="text" name="roadstatus" rel="txtTooltip" title="Only digits are allowed." data-toggle="tooltip" data-placement="bottom" class="form-control numericValFld requiredValFld" />
				
				<span class='requiredValFldMsg'> Please enter Road And Road System .</span>
				</div>
				
				<label for="inputEmail3" class="col-sm-2 control-label">Water supply:</label>
				<div class="col-sm-3">
					<input type="text" name="waterstatus" rel="txtTooltip" title="Only digits are allowed." data-toggle="tooltip" data-placement="bottom" class="form-control numericValFld requiredValFld" />
				
				<span class='requiredValFldMsg'> Please enter Water supply .</span>
				</div>
</div>
<div class="form-group">
		<label for="inputEmail3" class="col-sm-3 control-label">Sewege and Drainage System:</label>
				<div class="col-sm-3">
				<input type="text" name="sewagestatus" rel="txtTooltip" title="Only digits are allowed." data-toggle="tooltip" data-placement="bottom" class="form-control numericValFld requiredValFld" />
				
				<span class='requiredValFldMsg'> Please enter Sewege and Drainage System .</span>
				</div>
				
				<label for="inputEmail3" class="col-sm-2 control-label">Electricity Supply Trasfomer And Sub Station:</label>
				<div class="col-sm-3">
					<input type="text" name="electricitystatus" rel="txtTooltip" title="Only digits are allowed." data-toggle="tooltip" data-placement="bottom" class="form-control numericValFld requiredValFld" />
				
				<span class='requiredValFldMsg'> Please enter Electricity Supply Trasfomer And Sub Station.</span>
				</div>
</div>
<div class="form-group">
		<label for="inputEmail3" class="col-sm-3 control-label">Solid Waste Managment And Disposal:</label>
				<div class="col-sm-3">
				<input type="text" name="solidwastestatus" rel="txtTooltip" title="Only digits are allowed." data-toggle="tooltip" data-placement="bottom" class="form-control numericValFld requiredValFld" />
				
				<span class='requiredValFldMsg'> Please enter Solid Waste Managment And Disposal.</span>
				</div>
				
			
</div>
 <div class="form-group">		
				
				<div class="col-sm-3 col-md-offset-3">
				<input name="btn1" class="btn-style"  value="Update" type="button" onclick="updateExtDevstatus()" />
				</div>						
	</div>	

</form>
	<div class='clearfix'></div>
	</div>
	
	
	
	
	
	
	
	
	
	<div class="inner_wrapper">
		
<h1> Other External Development  <span>Work</span></h1>
			<div class="drop_shadow"></div>
			<%xx=0; %>
<c:forEach items="${projectReg.externalDevelopmentWorkModel.extOtherDevSet}" var="obj">
<%-- <c:if test="${obj.status=='CONFIRMED'}"> --%>

<div class="row">
		<h1><div class="pull-right">Last Updated <span>On&nbsp;&nbsp;</span> ${obj.currentStatus.updatedOn.time}</div></h1>
	</div>
	<br>
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Work Discription<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${obj.workDesc }</p> &nbsp;&nbsp;&nbsp;&nbsp;${obj.currentStatus.status} % Completed</div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Developed By<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${obj.developeBy }  </p></div>
	</div>
			<div class="col-sm-2 pull-right" style="text-align: right;">
			
			<div id="button"  class=" theme-clr" data-toggle="collapse" data-target="#otherdevstform<%=xx %>" style="cursor:pointer">
      <span class="glyphicon glyphicon-plus-sign"></span> Update Status
    </div>
	</div>
	<div class='clearfix'></div>
		<div class="inner_wrapper collapse" id="otherdevstform<%=xx %>">
	
    <form name="updateExtOtherDevStatus" autocomplete="off" id="otherdevstatus<%=xx %>-form" class="form-horizontal" action="updateExtOtherDevStatus"  method="post">
		<%=ReraSecurity.writeToken(request) %>
		<input type='hidden'  name='dev_id'  value='${obj.extOtherDevId}'>
		<h1>${obj.workDesc }  <span>Status</span></h1>
		
			<div class="drop_shadow"></div>

	<div class="form-group">
		<label for="inputEmail3" class="col-sm-3 control-label">${obj.workDesc }:</label>
				<div class="col-sm-3">
				<input type="text" name="status"  rel="txtTooltip" title="Only digits are allowed." data-toggle="tooltip" data-placement="bottom" class="form-control numericValFld requiredValFld" />
				
				<span class='requiredValFldMsg'> Please enter Dealer.</span>
				</div>
				
				
</div>
 <div class="form-group">		
				
				<div class="col-sm-3 col-md-offset-3">
				<input name="btn1" class="btn-style" id="otherdevstatus<%=xx %>" value="Update" type="button" onclick="updateDevstatus(this)" />
				</div>						
	</div>	

</form>
	<div class='clearfix'></div>
	</div>
	
	
	<%-- </c:if> --%>
	
	</c:forEach>
	

</div>
	
	
 
</div>
		
 </div>
<!--inner container end here-->

 
			

    