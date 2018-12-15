<%@page import="in.gov.rera.common.security.ReraSecurity"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<div class="breadcrumb">Home /Subdistrict/Tehsil List</div>


<!--News Ticker-->
<div class="container">

<!--main container start here-->
<div class="Main_containner">

<!--Inner wrapper stsrt here-->
<div class="inner_wrapper tsklist">



<h1>Subdistrict List of <span>${district.districtName}</span></h1>
<div class="drop_shadow"></div>
<div class="col-sm-2 pull-right" style="text-align: right;">
			
	<div id="button"  class=" theme-clr" data-toggle="collapse" data-target="#stateUTform" style="cursor:pointer">
      <span class="glyphicon glyphicon-plus-sign"></span> Create Subdistrict
    </div>
</div>
<div class="inner_wrapper collapse" id="stateUTform" >
 <form name="newstateUtFormID" autocomplete="off" id="newstateUtForm" action="saveSubDistrict" class="form-horizontal">
 		<%=ReraSecurity.writeToken(request) %>
  <input type="hidden"  name="districtId" value="${district.districtId}">
                  <div class="form-group">
						<label class="col-sm-3 control-label">Subdistrict Name<sup>*</sup></label>
						<div class="col-sm-3">
							<input name="subDistrictName" class="form-control input-sm requiredValFld" />
								<span class='requiredValFldMsg'> Please enter Subdistrict Name.</span>
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



<h1>Total Subdistrict : ${subDistCount} </h1>
<div class="table-responsive">
				
				
				<table class="table table-bordered">
        <thead>
            <tr>
                <th>Subdistrict Name</th>
                <th>District Name</th>
                <th>State Name</th>
               <th>Action</th>
               </tr>
        </thead>
        <tbody>
        <% int num=0; %>
        <c:forEach items="${subDistrictList}" var="obj">
            <tr>
                <td>${obj.subDistrictName }</td>
                <td>${district.districtName }</td>
                <td>${district.stateUtModel.stateUtName }</td>
                <td><div id="button"  class=" theme-clr" data-toggle="collapse" data-target="#stateUtDivID<%=num %>" style="cursor:pointer">
      <span class="glyphicon glyphicon-plus-sign"></span> EDIT
    </div></td>
            </tr>
            
            <tr>
            <td colspan="4">
            <div  class="inner_wrapper collapse"  id="stateUtDivID<%=num %>" >
            <form name="stateUtFormID" id="stateUtFormID<%=num %>" action="updateSubDistrict" class="form-horizontal">
            <input type="hidden"  name="districtId" value="${district.districtId}">
             <input type="hidden"  name="subDistrictId" value="${obj.subDistrictId}">
            <div class="form-group">
					
						<label class="col-sm-3 control-label">Subdistrict Name<sup>*</sup></label>

						<div class="col-sm-3">
							<input name="subDistrictName" value="${obj.subDistrictName}" class="form-control input-sm requiredValFld" />
								<span class='requiredValFldMsg'> Please enter subdistrict Name.</span>
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