<%@page import="in.gov.rera.common.security.ReraSecurity"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<div class="breadcrumb">Home /State/UT List</div>


<!--News Ticker-->
<div class="container">

<!--main container start here-->
<div class="Main_containner">

<!--Inner wrapper stsrt here-->
<div class="inner_wrapper tsklist">



<h1>State/UT <span>List</span></h1>
<div class="drop_shadow"></div>
<div class="col-sm-2 pull-right" style="text-align: right;">
			
	<div id="button"  class=" theme-clr" data-toggle="collapse" data-target="#stateUTform" style="cursor:pointer">
      <span class="glyphicon glyphicon-plus-sign"></span> Create New State/UT
    </div>
    </div>

<div class="inner_wrapper collapse" id="stateUTform" >
 <form name="newstateUtFormID" autocomplete="off" id="newstateUtForm" action="createStateUT" class="form-horizontal" >
                <%=ReraSecurity.writeToken(request) %>
                  <div class="form-group">
						<label class="col-sm-3 control-label">State/UT Name<sup>*</sup></label>
						<div class="col-sm-3">
							<input name="stateUtName"  class="form-control input-sm requiredValFld" />
								<span class='requiredValFldMsg'> Please enter state/ut Name.</span>
						</div>
						<label for="inputEmail3" class="col-sm-2 control-label">State/UT Code<sup>*</sup></label>
						<div class="col-sm-3">
                      	<input name="stateUtCode" class="form-control input-sm requiredValFld" />
							
								<span class='requiredValFldMsg'> Please enter state/ut code.</span>
						</div>


					</div>	
					
				<div class="form-group">		
				
				<div class="col-sm-3 col-md-offset-3">
				<input name="btn1" class="btn-style" value="Create" type="button" onclick="updateLocations('newstateUtForm')">
				</div>						
	</div>														
            
            </form>
<div class='clearfix'></div>
</div>



	<div class="clearfix"></div>
<h1>Total StateUT : ${stateCount} </h1>
<div class="table-responsive">
				
				
				<table class="table table-bordered">
        <thead>
            <tr>
                <th>State/UT Name</th>
                <th>State/UT Code</th>
                <th>District List</th>
               <th>Action</th>
               </tr>
        </thead>
        <tbody>
        <% int num=0; %>
        <c:forEach items="${stateList}" var="obj">
            <tr>
                <td>${obj.stateUtName }</td>
                <td>${obj.stateUtCode }</td>
                <td> <a href="viewAllDistrict?STATEUT_ID=${obj.stateUtId}">View District List</a> </td>
                <td><div id="button"  class=" theme-clr" data-toggle="collapse" data-target="#stateUtDivID<%=num %>" style="cursor:pointer">
      <span class="glyphicon glyphicon-plus-sign"></span> EDIT
    </div></td>
            </tr>
            
            <tr>
            <td colspan="4">
            <div  class="inner_wrapper collapse"  id="stateUtDivID<%=num %>" >
            <form name="stateUtFormID" id="stateUtFormID<%=num %>" action="updateStateUT" class="form-horizontal">
            <input type="hidden"  name="stateUtId" value="${obj.stateUtId}">
            <div class="form-group">
					
						<label class="col-sm-3 control-label">State/UT Name<sup>*</sup></label>

						<div class="col-sm-3">
							<input name="stateUtName" value="${obj.stateUtName}" class="form-control input-sm requiredValFld" />
								<span class='requiredValFldMsg'> Please enter state/ut Name.</span>
						</div>
						<label for="inputEmail3" class="col-sm-2 control-label">State/UT Code<sup>*</sup></label>
						<div class="col-sm-3">
                      	<input name="stateUtCode" value="${obj.stateUtCode }" class="form-control input-sm requiredValFld" />
							
								<span class='requiredValFldMsg'> Please enter state/ut code.</span>
						</div>


					</div>	
					
				<div class="form-group">		
				
				<div class="col-sm-3 col-md-offset-3">
				<input name="btn1" class="btn-style" value="Update" type="button" onclick="updateLocations('stateUtFormID<%=num %>')">
				</div>						
	</div>														
            
            </form>
            <div class='clearfix'></div>
            </div>
            <div class='clearfix'></div>
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