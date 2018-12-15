<%@page import="in.gov.rera.common.security.ReraSecurity"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@page import="in.gov.rera.common.util.ReraConstants"%>
<%@page import="in.gov.rera.common.model.UserModel"%>
<%
UserModel user=(UserModel)session.getAttribute(ReraConstants.SES_USER_ATTR);

%>

    
    <div class="breadcrumb">Home /Project Dash Board<span class="pull-right user_name">Welcome :<b><%=user.getUserName() %> </b></span></div>


<!--News Ticker-->
<div class="container">



    
		<div class="col-md-12 col-sm-12">
			
			<div class="Main_containner">


			
	
		<div class="inner_wrapper">
				
				<h1>Project  <span>Photo</span></h1>
				<div class="border"><div class="orange"></div><div class="black"></div></div>

		<div class="row phto">
    <ul class="thumbnails ">
    
    <c:forEach items="${projectReg.projectPhotoDetailSet}" var="projectPhoto">
    
      <li class="col-md-4">
            <div class="thumbnail"> <a class="close" href="#" onclick="deletePhoto(${projectPhoto.documentId})">×</a>

                <img src="<%=request.getContextPath() %>/reraimage?IMG_ID=${projectPhoto.documentId}" class="img-responsive">
               
            </div>
        </li>
    
    
    
	  
    </c:forEach>
</ul>
</div>



<div class="inner_wrapper">
 
   

          <!-- Standar Form -->
          <h1>Select photo from your <span> computer</span></h1>
        <div class="drop_shadow"></div>
          <form action="updateProjectPhotos" autocomplete="off" method="post" class="form-horizontal" enctype="multipart/form-data" id="js-upload-form">
           <%=ReraSecurity.writeToken(request) %>
            <div class="form-inline">
              <div class="form-group">
                <input type="file" name="projectPhoto" id="js-upload-files" class="form-control">
              </div>
             <input name="btn1" class="btn-style"  value="Upload" type="button" onclick="updateProjectPhoto()" />
            </div>
          </form>

		</div>	
			
		
		
		</div>
		

	</div>
<!--inner container end here-->





</div>
			
		</div>
	
	
<script>
function updateProjectPhoto(){
	var _frm=$('#js-upload-form');
	if(validateForm(_frm)){
		$(_frm).submit();
	}
}
</script>

