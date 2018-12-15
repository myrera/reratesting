<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<div class="breadcrumb">Home /User List</div>


<!--News Ticker-->
<div class="container">

<!--main container start here-->
<div class="Main_containner">

<!--Inner wrapper stsrt here-->
<div class="inner_wrapper tsklist">



<h1>User <span>List</span></h1>
<div class="drop_shadow">  <span style='float: right;'><a href="newUserForm">Create New User</a></span> </div>
	<div class="clearfix"></div>
<h1>Total Users : ${userCount} </h1>
<div class="table-responsive">
				
				
				<table class="table table-bordered">
        <thead>
            <tr>
                <th>User Name</th>
                <th>Email ID</th>
                <th>Login ID</th>
                 <th>User Type</th>
                <th>Status</th>
                <th>Created On</th>
               </tr>
        </thead>
        <tbody>
        <c:forEach items="${userList}" var="obj">
            <tr>
                  <td> <a href="editUserForm?USER_ID=${obj.userId}"> ${obj.userName }  </a></td>
                <td>${obj.emailId }</td>
                <td>${obj.loginId }</td>
                <td>${obj.userType }</td>
                <td>${obj.status}</td>
                <td>${obj.createdOn.time }</td>
            </tr>
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
	</div>
