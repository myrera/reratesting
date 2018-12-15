<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="in.gov.rera.common.util.ReraConstants"%>
<%@page import="in.gov.rera.common.model.UserModel"%>
<%
UserModel user=(UserModel)session.getAttribute(ReraConstants.SES_USER_ATTR);

%>
<div class="breadcrumb">Dash Board <span class="pull-right user_name">Welcome :<b> <%=user.getUserName() %></b></span> </div>


<!--News Ticker-->
<div class="container">


<!--main container start here-->
<div class="col-md-12 col-sm-12">
<div class="Main_containner dashboard">
	<div class="inner_wrapper">
	
	<h1>Dashboard</h1>
	<div class="drop_shadow"></div>
		<div class="col-md-12 col-sm-12">
			
			
			  <div class="row">
    <div class="col-md-6">
        <div id="area-example" style="height: 300px;"></div>
    </div>
    
    
      <div class="col-md-6">
        <div id="donut-example" style="height: 250px;"></div>
    </div>
			</div>
    
    
  
			<div class="drop_shadow"></div>
    
    
			<div class="clearfix"></div>
    
    <div class="row mar_top8">
    <div class="col-md-6 col-sm-6">
			<div class="table-responsive martop">
				<table class="table table-bordered table-striped">
        <thead>
            <tr>
                <th>Application</th>
                <th>Application Type</th>
                <th>Pending Request</th>
               
                
               
                
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Project Registration</td>
                <td>Individual </td>
                <td >${PROJECT_IND_REQUEST }</td>    
            </tr>
               <tr>
                <td>Project Registration</td>
                <td>Company/Firm </td>
                <td>${PROJECT_FIRM_REQUEST }</td>    
            </tr>
               <tr>
                <td>Agent Registration</td>
                <td>Individual </td>
                <td>${AGENT_IND_REQUEST }</td>    
            </tr>
               <tr>
                <td>Agent Registration</td>
                <td>Company/Firm </td>
                <td>${AGENT_FIRM_REQUEST }</td>    
            </tr>
               <tr>
                <td>Complaint </td>
                <td> --  </td>
                <td>0</td>    
            </tr>
      
           
        </tbody>
    </table>
</div>
		</div>
  
    <div class="col-md-6">
        <div id="bar-example" style="height: 250px;"></div>
    </div>
    
			</div>
    
  </div>
  
		<div class="clearfix"></div>	
		</div>
		
	</div> 
	
</div>
		
		</div>
		


<script type="text/javascript">
	
	//Morris charts snippet - js

  Morris.Line({
    element: 'area-example',
    data: [ <% List ls=(List)request.getAttribute("lineData");
           if(ls!=null){
        	   for(int x=0;ls.size()>x;x++){
        		   Map m=(Map)ls.get(x);
           %> {y:'<%=m.get("mYear")%>', a:<%=m.get("project")%>, b:<%=m.get("agent")%>, c:<%=m.get("complaint")%>}<%if((x+1)<ls.size()){%>,<%}%>
            <%}}%> ],
         xkey: 'y',
         ykeys: ['a','b','c'],
         labels: ['Total No. of Project Registration', 'Total No. of Agent Registration','Total No. of Complaint Registration']
		 
  });
  
 
      
  <%--     Morris.Donut({
        element: 'donut-example',
        data: [
               <% Map data=(Map)request.getAttribute("pieData");
               if(data!=null){
               %>
               
         {label: "Banker's Chaque", value: <%=data.get("cheque")%>},
         {label: "Demand Draft", value: <%=data.get("dd")%>},
         {label: "Online payment", value: <%=data.get("online")%>}
         
         <%}%>
        ]
      }); --%>
      
      Morris.Bar({
         element: 'bar-example',
         data: [ <%  ls=(List)request.getAttribute("barData");
                if(ls!=null){
             	   for(int x=0;ls.size()>x;x++){
             		   Map m=(Map)ls.get(x);
                %>
                 {y:'<%=m.get("mYear")%>', a:<%=m.get("project")%>, b:<%=m.get("agent")%>, c:<%=m.get("complaint")%>}<%if((x+1)<ls.size()){%>,<%}%>
                 <%}}%>
              ],
     
		// stacked:true,
		
         xkey: 'y',
         ykeys: ['a','b','c'],
         labels: ['Total Project Registration Fee', 'Total Agent Registration Fee','Total Complaint Registration Fee']
      });
  

</script>










       