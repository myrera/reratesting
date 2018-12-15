<%@page import="in.gov.rera.common.util.ReraConstants"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE tiles-definitions PUBLIC "-//Apache Software Foundation//DTD Tiles Configuration 2.1//EN" "http://tiles.apache.org/dtds/tiles-config_2_1.dtd">

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	 <meta http-equiv="X-Frame-Options" content="deny">
	<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
	<title><tiles:getAsString name="title" /></title>
	
<!-- Bootstrap -->
<link href="<%=request.getContextPath() %>/resources/css/bootstrap.min.css" rel="stylesheet"/>
<link href="<%=request.getContextPath()%>/resources/css/style.css" rel="stylesheet"/>
<link href="<%=request.getContextPath()%>/resources/css/font-awesome.min.css" rel="stylesheet"/>
<script src="<%=request.getContextPath() %>/resources/js/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/jquery.ticker.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/site.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/common.js"></script> 
<script src="<%=request.getContextPath() %>/resources/js/commdropdown.js"></script> 
 <script src="<%=request.getContextPath() %>/resources/js/tripleencoding.js"></script>  
       <script src="<%=request.getContextPath() %>/resources/js/validation.js"></script>  
      <script src="<%=request.getContextPath() %>/resources/js/raphael-min.js"></script> 
     <script src="<%=request.getContextPath() %>/resources/js/morris.min.js"></script>  
	
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

<script>
if(top!=self){
    top.location.replace(document.location);
    document.location='';
}
<%if(!request.getContextPath().equals("/")){%>
_ctxpath='<%=request.getContextPath()%>/';
<%}%>

	 if (!navigator.onLine) 
{ 
	document.body.innerHTML = 'Loading...'; 
	window.location = 'ErrorPage.html'; 
} 

</script>
</head>
 
<body>
		<header id="header">
			<div class="container-fluid">
			<!--Top Bar-->
			<div class="row">
				<div class="col-md-12 colsm-12 col-xs-12">
				
				
				       <div class="top-s pull-right">
        <ul class="social_icon">
			    <li ><a href="#"><img src="<%=request.getContextPath() %>/resources/images/call-icon.jpg" width="23" height="22" /></a></li> 
		        <li><a href="#"><img src="<%=request.getContextPath() %>/resources/images/head-phone-icon.jpg" width="23" height="22" /></a></li> 
		        <li><a href="#"><img src="<%=request.getContextPath() %>/resources/images/face-book.jpg" width="22" height="22" alt="facebook" /></a></li> 
		        <li><a href="#"><img src="<%=request.getContextPath() %>/resources/images/linkedin.jpg" width="23" height="22" alt="Linkedin" /></a></li> 
		        <li><a href="#"><img src="<%=request.getContextPath() %>/resources/images/twitter-icon.jpg" alt="twitter" width="22" height="22" /></a></li> 
          </ul>
        
			<ul class="lang">
				<li><a href="#"><img src="<%=request.getContextPath() %>/resources/images/hindi-icon.jpg" width="22" height="22" /></a></li> 
        	</ul>
        
        <ul class="font-zoom">
				<li class="suare-icons a-plus icon-plus clsButton " id="btnFontIncrease"><a href="#"><span class="accebilility_icon">A+</span> </a></li> 
				<li class="round-icons a-normal icon-normal clsButton " id="bntFontNormal"><a href="#"><span class="accebilility_icon">A&nbsp;</span> </a></li> 
				<li  class="round-icons a-minus icon-minus clsButton " id="bntFontDecrease"><a href="#"><span class="accebilility_icon">A- </span> </a></li> 
				<li  class="acceblity"><a href="#"><span class="accebilility_icon disabbil">A </span> </a></li> 
        </ul>
        </div>
				
				
				
				
				</div>
			</div>
			<!--Logo Header-->
			<div class="row">
				<div class="top-logo">
					<a href='<%=request.getContextPath() %>/home'>	
						
				<div class="col-md-6 col-sm-6 col-xs-6">
			
				<div class="logo-sec">&nbsp;</div>
					</div>
					</a>
					<div class="col-md-6 col-sm-6 col-xs-6 ut_name">
				
				
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
			<!--Nav-->
			<div class="row">
				<nav class="navbar navbar-default navbar-static-top">
					<div class="container-fluid">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle collapsed"
								data-toggle="collapse" data-target="#navbar"
								aria-expanded="false" aria-controls="navbar">
								<span class="sr-only">Toggle navigation</span> <span
									class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
						</div>
						<div id="navbar" class="navbar-collapse collapse">
							<ul class="nav navbar-nav navbar-right">
							
						
							
								<li class="dropdown"><a href="#" class="dropdown-toggle"
									data-toggle="dropdown" role="button" aria-haspopup="true"
									aria-expanded="false">About Us <span class="caret"></span></a>
									<ul class="dropdown-menu">
										<li><a href="<%=request.getContextPath() %>/aboutUs">What is RERA? </a></li>
										<li><a href="<%=request.getContextPath() %>/orgStructurePage">Organizational Structure </a></li>
											<li><a href="<%=request.getContextPath() %>/contactUsPage">Contact Us </a></li>
											
											
											<li><a href="<%=request.getContextPath() %>/resources/staticpage/office_list.pdf" target="_blank">List of Offices for Physical Submission of Application</a></li>
											<li><a href="<%=request.getContextPath()%>/resources/staticpage/zonal_stp_registration_approval.pdf" target="_blank">List of Approving Authorities</a></li>
											<li><a href="<%=request.getContextPath() %>/resources/staticpage/list_sir_sez.pdf" target="_blank">List of SIR & SEZ</a></li>
											

											
											
											
											

									</ul></li>
								<li class="dropdown"><a href="#" class="dropdown-toggle"
									data-toggle="dropdown" role="button" aria-haspopup="true"
									aria-expanded="false">Acts-Rules-Fee <span class="caret"></span></a>
									<ul class="dropdown-menu">
								<li><a href="<%=request.getContextPath() %>/resources/staticpage/Real_Estate_Act.pdf" target="_blank">Real Estate Act, 2016 </a></li>
										<li><a href="<%=request.getContextPath() %>/resources/staticpage/ReraRegulatoryAuthorityRules.pdf" target="_blank">Rera Regulatory Authority Rules</a></li>
										<li><a href="<%=request.getContextPath() %>/resources/staticpage/RERA Appellate tribunal Rules.pdf" target="_blank">RERA Appellate tribunal Rules </a></li>
										<li><a href="<%=request.getContextPath() %>/resources/staticpage/RERA-General Rules.pdf" target="_blank">RERA-General Rules </a></li>
										
										<li><a href="<%=request.getContextPath() %>/resources/staticpage/AgreementOfSale.pdf" target="_blank">Agreement Of Sale </a></li>
											<li><a href="<%=request.getContextPath() %>/resources/staticpage/rera_fees.pdf" target="_blank">Fees Calculation Document </a></li>		

									</ul>
									
									
									</li>

                            
<li class="dropdown"><a href="#" class="dropdown-toggle"
									data-toggle="dropdown" role="button" aria-haspopup="true"
									aria-expanded="false"> faq <span class="caret"></span></a>
									<ul class="dropdown-menu">
                        <li><a href="<%=request.getContextPath() %>/resources/staticpage/FAQ.pdf" target="_blank" >Gov. RERA FAQ</a></li>
                          <li><a href="<%=request.getContextPath() %>/resources/staticpage/RERA_FAQs.pdf" target="_blank" >Gujarat RERA FAQ</a></li>
                        </ul></li>
     <li><a href="<%=request.getContextPath() %>/resources/staticpage/GRERA_User_Manual.pdf" target="_blank" >User Manual Guide</a></li>

								<li><a href="#contact" >Order/Notice</a></li>
								
									
							<li class="dropdown"><a href="#" class="dropdown-toggle"
									data-toggle="dropdown" role="button" aria-haspopup="true"
									aria-expanded="false"> Defaulters <span class="caret"></span></a>
									<ul class="dropdown-menu">
										<li><a href="<%=request.getContextPath() %>/viewDefaulterAgents">List Of Agents </a></li>
										<li><a href="<%=request.getContextPath() %>/viewDefaulterProjects">List Of Projects </a></li>
																	

									</ul></li>
								
								
								
								<%
								String role=(String)session.getAttribute(ReraConstants.SES_USER_ROLE);
								if(role!=null){
									if(role.equals(ReraConstants.AGENT_USER)){
										%>
										
                     <li  class="dropdown"> <a href="#"  style="border-right: 0px;" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">My Profile  <span class="caret"></span></a>
                <ul class="dropdown-menu">
                  <li><a href="<%=request.getContextPath() %>/agent/dashboard">Basic Detail </a></li>
                  <li><a href="<%=request.getContextPath() %>/agent/agentDocumentPage">Uploaded Documents</a></li>
                  <li><a href="<%=request.getContextPath() %>/agent/paymentDetailsPage">Payment Details</a></li>
                  <li><a href="<%=request.getContextPath() %>/agent/projectListPage">Project List</a></li>
                  <li><a href="<%=request.getContextPath() %>/agent/openRenewalForm">Registration Renewal </a></li>
                  <li><a href="<%=request.getContextPath() %>/agent/changePasswordForm">Change Password</a></li>
                  
               
                </ul>
              </li>
										
										<li><a href="<%=request.getContextPath() %>/logout" >Logout</a></li>
										
										<%
																
									}else if(role.equals(ReraConstants.PROJECT_USER)){
										%>
										
										
                     <li  class="dropdown"> <a href="#"  style="border-right: 0px;" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">My Profile  <span class="caret"></span></a>
                <ul class="dropdown-menu">
                  <li><a href="<%=request.getContextPath() %>/project/dashboard">Promoter Details </a></li>
                  <li><a href="<%=request.getContextPath() %>/project/projectDocumentsPage">Project Documents</a></li>
                    <li><a href="<%=request.getContextPath() %>/project/projectPhotosPage">Project Photos</a></li>
                  
                  <li><a href="<%=request.getContextPath() %>/project/projectDetailsPage">Project Details </a></li>
                     <li><a href="<%=request.getContextPath() %>/project/paymentDetailsPage">Payment Details </a></li>
                  
                  <li><a href="<%=request.getContextPath() %>/project/developmentDetailsPage">Development Details</a></li>
                   <li><a href="<%=request.getContextPath() %>/project/projectVendors">Associated Vendors Details</a></li>
                  <li><a href="<%=request.getContextPath() %>/project/openRegistrationExtForm">Extend Project Registration</a></li>
                  <li><a href="<%=request.getContextPath() %>/project/changePasswordForm">Change Password</a></li>
                  
               
                </ul>
              </li>
										<li><a href="<%=request.getContextPath() %>/logout" >Logout</a></li>
										
										<%
																
									}else{
										%>
										
										
									<li class="dropdown">
									<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
									aria-expanded="false">Login <span class="caret"></span></a>
									<ul class="dropdown-menu">
									<li><a href="<%=request.getContextPath() %>/authorityLoginPage">Login as Authority</a></li>
						     		<li><a href="<%=request.getContextPath() %>/loginPage">Login as Agent/Promoter</a></li>
							
									</ul>
									
									
									
									</li>
										
										
										
										<% 
										
									}
								%>
								
								<%}else{ %>
								
						
									<li class="dropdown">
									<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
									aria-expanded="false">Login <span class="caret"></span></a>
									<ul class="dropdown-menu">
									<li><a href="<%=request.getContextPath() %>/authorityLoginPage">Login as Authority</a></li>
						     		<li><a href="<%=request.getContextPath() %>/loginPage">Login as Agent/Promoter</a></li>
							
									</ul>
									
									
									
									</li>
									<%} %>

							</ul>
						</div>
						<!--/.nav-collapse -->
					</div>
				</nav>
			</div>
		</div>
	

	
	
	
	
	
	
	

		</header>
	
			
		<section id="site-content">
		<section class="banner">


<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">

      <div class="item active">
          <img src="resources/images/slider_5.jpg" width="auto" height="180" alt=""/>
        <!--<div class="carousel-caption">
          <h3>Los Angeles</h3>
          <p>LA is always so much fun!</p>
        </div>-->
      </div>	

 
      <div class="item">
        <img src="resources/images/slider_6.jpg" width="auto" height="180" alt=""/>
        <!--<div class="carousel-caption">
          <h3>New York</h3>
          <p>We love the Big Apple!</p>
        </div>-->
      </div>
      
      
        <div class="item">
        <img src="resources/images/slider_7.jpg" width="auto" height="180" alt=""/>
        <!--<div class="carousel-caption">
          <h3>New York</h3>
          <p>We love the Big Apple!</p>
        </div>-->
      </div>
  
  
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>





	<!--<h2>BASERA</h2>
    <p>“To Cthe real estate market, boost <br>

transparency & safeguard homebuyers in India”
</p>-->
   
</section>




	<!--News Ticker-->
	<div class=" container-fluid">
		<div class="row">
			<div class="news_tricker">
				<div class="col-md-2 col-sm-2 col-xs-12 no-padding">
					<div class="news_cover" ><h2>WHAT'S NEW</h2></div>
				</div>
				<div class="col-md-10 col-sm-10 col-xs-12"
					style="background: #3878AD;">
				
					<div class="content">
					
						
			<ul id="js-news" class="js-hidden">
		
		
			<li class="news-item">A notification has been issued by MoHUPA on 20th April 2017 notifying  on 32 sections of  Real Estate Act, 2016 & they will come into force from 1st May. </li>
						
						<li class="news-item"> Technology SubMission under PMAY has been incorporated to implement new construction technologies & techniques.</li>
						
						<li class="news-item"> Real Estate Act, 2016 aims to infuse accountability & transparency in the real estate sector. </li>
						
						<li class="news-item"> More than 28,000 beneficiaries have availed the benefits of CLSS under PMAY.  </li>
						
						<li class="news-item">Regional consultation with eastern and norther eastern states on implementation of real estate (Regulation & Development) Act, 2016 was held on 27th March, 2017 in Guwahati.  </li>
						
						<li class="news-item">Round table discussion with stakeholders on Real Estate Sector on 23rd March, 2017, New Delhi.  </li>
						<li class="news-item">Meeting with States/ UTs on the implementation of Real Estate (Regulation & Development) Act 2016 was held on 17th January, 2017.   </li>
			
					
	</ul>
	
			
					
				
		</div>
				
				
				
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!--Advance Search Bar-->
	<div class="container">
		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="advanced-seach">
					<div
						class="flipkart-navbar-search smallsearch col-sm-12 col-xs-12 dropdown">
						<div class="row">
						<form action='search' method='post' name='searchForm' onsubmit="if(this.searchTxt=='') return false;">
							<div class="input-group">
							<input type="hidden" name="startFrom" value="0" />
								<input id="password" type="text" class="form-control"
									name="searchTxt"
									placeholder="Search project name, Builder or Agent"> <span
									class="input-group-addon">
									<button class="flipkart-navbar-button btn simp-search">Search
									</button>
									
								</span>
							
							</div>

	</form>

						</div>
					</div>

					<div class="clearfix"></div>



				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-sm-4 col-xs-12">
				<div class="ch-person">
					<div class="col-md-6 col-sm-12 col-xs-4 no-padding img-sec">
						<img src="resources/images/pic1.jpg" width="151" height="243"
							class="img-responsive" />
					</div>
					<div class="col-md-6 col-sm-12 col-xs-8 no-padding info-sec">
						<h4>
							PROJECT <br> REGISTRATION
						</h4>

						<p></p>
						<a href="initProjectRegistration">Promoters/Developers<br> may click here to<br>

							register their project
						</a>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
			<div class="col-md-4 col-sm-4 col-xs-12">
				<div class="ch-person">
					<div class="col-md-6 col-sm-12 col-xs-4 no-padding img-sec">
						<img src="resources/images/pic2.jpg" width="151" height="243"
							class="img-responsive" />
					</div>
					<div class="col-md-6 col-sm-12 col-xs-8 no-padding info-sec">
						<h4 class="text-success">
							AGENT<br> REGISTRATION
						</h4>

							<a href="initAgentRegistration">Agents<br> may click here to<br>

							register for project
						</a>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
			<div class="col-md-4 col-sm-4 col-xs-12">
				<div class="ch-person">
					<div class="col-md-6 col-sm-12 col-xs-4 no-padding img-sec img-sec">
						<img src="resources/images/pic3.jpg" width="151" height="243"
							class="img-responsive" />
					</div>
					<div class="col-md-6 col-sm-12 col-xs-8 no-padding info-sec">
						<h4 class="text-primary">
							COMPLAINT<br> REGISTRATION
						</h4>

						<a href="complaintForm">Users<br> may click here to <br>

							register their complaints
						</a>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
	</div>




<script>
    $(window).load(function(){
                $('#onload_popup').modal('show');
            });

</script>


     
      </div>

    </div>
</div>
</div>
		</section>

		
		
</body>
</html>