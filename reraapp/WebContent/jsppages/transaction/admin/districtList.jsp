<%@page import="in.gov.rera.common.security.ReraSecurity"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<div class="breadcrumb">Home /District List</div>


<!--News Ticker-->
<div class="container">

<!--main container start here-->
<div class="Main_containner">

<!--Inner wrapper stsrt here-->
<div class="inner_wrapper tsklist">



<h1>District List of <span>${stateUt.stateUtName}</span></h1>
<div class="drop_shadow"></div>
<div class="col-sm-2 pull-right" style="text-align: right;">
			
	<div id="button"  class=" theme-clr" data-toggle="collapse" data-target="#stateUTform" style="cursor:pointer">
      <span class="glyphicon glyphicon-plus-sign"></span> Create New District
    </div>
</div>
<div class="inner_wrapper collapse" id="stateUTform" >
 <form name="newstateUtFormID" autocomplete="off" id="newstateUtForm" action="saveDistrict" class="form-horizontal">
	<%=ReraSecurity.writeToken(request) %>
 <input type="hidden" name="stateUtId" value="${stateUt.stateUtId }" />
                  <div class="form-group">
						<label class="col-sm-3 control-label">District Name<sup>*</sup></label>
						<div class="col-sm-3">
							<input name="districtName"  class="form-control input-sm requiredValFld" />
								<span class='requiredValFldMsg'> Please enter district Name.</span>
						</div>
						<label for="inputEmail3" class="col-sm-2 control-label">District Code<sup>*</sup></label>
						<div class="col-sm-3">
                      	<input name="districtCode"  class="form-control input-sm requiredValFld" />
							
								<span class='requiredValFldMsg'> Please enter district code.</span>
						</div>


					</div>	
					
					
					
				<div class="form-group">		
				
				<div class="col-sm-3 col-md-offset-3">
				<input name="btn1" class="btn-style" value="Create" type="button" onclick="updateLocations('newstateUtForm')">
				</div>						
	</div>														
            
            </form>
<div class="clearfix"></div>
</div>



	
<h1>Total Districts : ${distCount} </h1>
<div class="table-responsive">
				
				
				<table class="table table-bordered">
        <thead>
            <tr>
                <th>District Name</th>
                <th>District Code</th>
                
                 <th>State Name</th>
                <th>SubDistrict List</th>
               <th>Action</th>
               </tr>
        </thead>
        <tbody>
        <% int num=0; %>
        <c:forEach items="${districtList}" var="obj">
            <tr>
                <td>${obj.districtName }</td>
                <td>${obj.districtCode }</td>
               
                <td>${stateUt.stateUtName }</td>
                <td> <a href="viewAllSubDistrict?DIST_ID=${obj.districtId}">View Sub District List</a> </td>
                <td><div id="button"  class=" theme-clr" data-toggle="collapse" data-target="#stateUtDivID<%=num %>" style="cursor:pointer">
      <span class="glyphicon glyphicon-plus-sign"></span> EDIT
    </div></td>
            </tr>
            
            <tr>
            <td colspan="4">
            <div  class="inner_wrapper collapse"  id="stateUtDivID<%=num %>" >
            <form name="stateUtFormID" id="stateUtFormID<%=num %>" action="updateDistrict" class="form-horizontal">
            <input type="hidden"  name="stateutId" value="${stateUt.stateUtId}">
             <input type="hidden"  name="districtId" value="${obj.districtId}">
            <div class="form-group">
					
						<label class="col-sm-3 control-label">District Name<sup>*</sup></label>

						<div class="col-sm-3">
							<input name="districtName" value="${obj.districtName}" class="form-control input-sm requiredValFld" />
								<span class='requiredValFldMsg'> Please enter district Name.</span>
						</div>
						<label for="inputEmail3" class="col-sm-2 control-label">District Code<sup>*</sup></label>
						<div class="col-sm-3">
                      	<input name="districtCode" value="${obj.districtCode }" class="form-control input-sm requiredValFld" />
							
								<span class='requiredValFldMsg'> Please enter district code.</span>
						</div>


					</div>	
					
					
				<div class="form-group">		
				
				<div class="col-sm-3 col-md-offset-3">
				<input name="btn1" class="btn-style" value="Update" type="button" onclick="updateLocations('stateUtFormID<%=num %>')">
				</div>						
	</div>														
            
            </form>
            <div class="clearfix"></div>
            </div>
            </td>
            </tr>
            <%num=num+1; %>
           </c:forEach>
        </tbody>
    </table>
			</div>

	
		
	
	

<!--search list main end here-->	
</div>

    


<!--inner container end here-->
	</div>




<!-- container end here-->

</div>
<script>
function updateLocations(_fid){
	var _frm=$('#'+_fid);
	if(validateForm(_frm)){
		$(_frm).submit();
	}
}
</script>