<!--Banner-->
<%
Cookie ck[]=request.getCookies();
String ulang="kn";
if(ck!=null){
for(Cookie ct:ck){
	if(ct!=null && ct.getName()!=null && ct.getName().equals("rera_user_lang2")){
		ulang=ct.getValue();
		break;
	}
}
}

%>



<%if(ulang == null || ulang.equals("kn")) {%>

<!--Banner-->

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

<!--  <div class="kapil item active">
          <img src="resources/images/kapilmohan-ias.jpg" width="auto" height="180" alt=""/>
      </div>	
 -->
   <!-- <div class="item active">
         <a href="http://www.livewebcasting.in/RERA" target="_blank">
         <img src="resources/images/rera-webstite.jpg" width="auto" height="180" alt=""/>
      </a> </div>
      -->
      
     <div class="item active">
          <img src="resources/images/slider_5.jpg" width="auto" height="180" alt=""/>
      </div>	

 
      <div class="item">
        <img src="resources/images/slider_6.jpg" width="auto" height="180" alt=""/>
      </div>
      
      
        <div class="item">
        <img src="resources/images/slider_7.jpg" width="auto" height="180" alt=""/>
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
					<!-- <div class="news_cover" ><h2>NEWS</h2></div> -->
				</div>
				<div class="col-md-10 col-sm-10 col-xs-12"
					style="background: #3878AD;">
				
					<div class="content">

 <%--  <a href="<%=request.getContextPath() %>/resources/staticpage/penalty_ongoing_projects.pdf" target="_blank"><marquee style="font-size: 20px; font-weight: bolder; color:#fff;" onmouseover="this.stop();" onmouseout="this.start();"> 
  RERA Office Visiting Hours :  3.00 PM to 5.00 PM Only   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   Notification on applicable penalty for all ongoing projects registered under RERA Karnataka    </marquee>	</a>				
		 --%>		
		
		
<a href='<%=request.getContextPath() %>/resources/staticpage/press_release_march.pdf' target='_blank'>
<marquee style="font-size: 20px; font-weight: bolder; color:#fff;" onmouseover="this.stop();" onmouseout="this.start();">
"RERA Provisional Registration Number Invalid: Need Permanent (Approved) Number from 1/4/2018 for Marketing/Sale"
</marquee>
</a>

  <!--  a href="<%=request.getContextPath() %>/publicDomainLoginPage" target="_blank"> 
 <marquee style="font-size: 20px; font-weight: bolder; color:#fff;" onmouseover="this.stop();" onmouseout="this.start();">

 Click here to view all the Documents of Approved Projects &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
  RERA Office Visiting Hours :  3.00 PM to 5.00 PM Only    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
  </marquee></a -->
  
  <%--   <a> 
 <marquee style="font-size: 20px; font-weight: bolder; color:#fff;" onmouseover="this.stop();" onmouseout="this.start();">
  RERA Office Visiting Hours :  3.00 PM to 5.00 PM Only    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
  </marquee></a> --%>
			<!--<ul id="js-news" class="js-hidden">-->
	
		 
			 
						
				
					
	</ul>
	
			<%-- <li class="news-item">Total Registration Requests Till Date -700+. For Details <a href="<%=request.getContextPath() %>/resources/staticpage/ApplicantData_31_07_2017.pdf" target="_blank" > Click Here </a>. For Press Note-<a href="<%=request.getContextPath() %>/resources/staticpage/PressNote_01_aug.pdf" target="_blank" > Click Here </a>
			</li> --%>
			<!--	 <li class="news-item">Sri Kapil Mohan IAS in convesation with FKCCI on RERA Karnataka. Ask your questions here :<a href="http://livewebcasting.in/kapilmohan/"><font color="white">Click here</font></a></li>
			
		 The RERA Karnataka portal will be unavailable due to Data Centre maintenance between 11/08/17 8:00pm to 11/08/17 10pm. We regret the inconvenience caused. -->
						
					
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
									placeholder="ಯೋಜನೆಯ ಹೆಸರು, ಬಿಲ್ಡರ್ ಅಥವಾ ಏಜೆಂಟ್ಗಾಗಿ ಹುಡುಕಿ"> <span
									class="input-group-addon">
									<button class="flipkart-navbar-button btn simp-search">ಹುಡುಕಿ
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
							ಪ್ರಾಜೆಕ್ಟ್    ನೋಂದಣಿ						</h4>

						<p></p>
						<a href="initProjectRegistration"> ಪ್ರವರ್ತಕರು / ಡೆವಲಪರ್ಗಳು ತಮ್ಮ ಯೋಜನೆಯನ್ನು ನೋಂದಾಯಿಸಲು
<br/>  ಇಲ್ಲಿ ಕ್ಲಿಕ್ ಮಾಡಬಹುದು
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
							ಏಜೆಂಟ್ ನೋಂದಣಿ
						</h4>

							<a href="initAgentRegistration">ಏಜೆಂಟ್ ಗಳು ನೋಂದಾಯಿಸಲು  <br/> ಇಲ್ಲಿ ಕ್ಲಿಕ್ ಮಾಡಬಹುದು
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
							ದೂರು ನೋಂದಣಿ
						</h4>

						<a href="complaintForm">ನಾಗರಿಕರು ತಮ್ಮ ದೂರುಗಳನ್ನು ನೋಂದಾಯಿಸಲು  <br/> ಇಲ್ಲಿ ಕ್ಲಿಕ್ ಮಾಡಬಹುದು						</a>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
	</div>
	
	
	
	
	
	
	
	
	
	
	
	

<%}else{ %>






















<!--Banner-->
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

<!--  <div class="kapil item active">
          <img src="resources/images/kapilmohan-ias.jpg" width="auto" height="180" alt=""/>
      </div>	
 -->
   <!-- <div class="item active">
         <a href="http://www.livewebcasting.in/RERA" target="_blank">
         <img src="resources/images/rera-webstite.jpg" width="auto" height="180" alt=""/>
      </a> </div>
      -->
      
     <div class="item active">
          <img src="resources/images/slider_5.jpg" width="auto" height="180" alt=""/>
      </div>	

 
      <div class="item">
        <img src="resources/images/slider_6.jpg" width="auto" height="180" alt=""/>
      </div>
      
      
        <div class="item">
        <img src="resources/images/slider_7.jpg" width="auto" height="180" alt=""/>
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
				<!-- 	<div class="news_cover" ><h2>NEWS</h2></div> -->
				</div>
				<div class="col-md-10 col-sm-10 col-xs-12"
					style="background: #3878AD;">
				
					<div class="content">

<a href='<%=request.getContextPath() %>/resources/staticpage/press_release_march.pdf' target='_blank'>
<marquee style="font-size: 20px; font-weight: bolder; color:#fff;" onmouseover="this.stop();" onmouseout="this.start();">
"RERA Provisional Registration Number Invalid: Need Permanent (Approved) Number from 1/4/2018 for Marketing/Sale"
</marquee>
</a>

  <!--  a href="<%=request.getContextPath() %>/publicDomainLoginPage" target="_blank"> 
 <marquee style="font-size: 20px; font-weight: bolder; color:#fff;" onmouseover="this.stop();" onmouseout="this.start();">

 Click here to view all the Documents of Approved Projects &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
  RERA Office Visiting Hours :  3.00 PM to 5.00 PM Only    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
  </marquee></a -->
  
  <%--   <a> 
 <marquee style="font-size: 20px; font-weight: bolder; color:#fff;" onmouseover="this.stop();" onmouseout="this.start();">
  RERA Office Visiting Hours :  3.00 PM to 5.00 PM Only    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
  </marquee></a> --%>
			<!--<ul id="js-news" class="js-hidden">-->
	
		 
			 
						
				
					
	<!--</ul>-->
		 <%-- <li class="news-item"> "Agreement for Sale" . Suggestions are invited. <a target="_blank" href="<%=request.getContextPath() %>/resources/staticpage/Agreement_for_Sale_of_RERA.pdf">Click here </a> to download</li> --%>
			 <%--<li class="news-item">Now builders can register with RERA by 31 Aug 2017<a target="_blank" href="<%=request.getContextPath() %>/resources/staticpage/RERA_Public_Notice_Registration_Upto_31_Aug_2017.pdf">Click here </a> to download</li>-->
	
		<%--
		    <li class="news-item">Sri Kapil Mohan IAS in convesation with FKCCI on RERA Karnataka. Ask your questions here :<a href="http://livewebcasting.in/kapilmohan/"><font color="white">Click here</font></a></li>
			 <li class="news-item">Total Registration Requests Till Date -700+. For Details  <a href="<%=request.getContextPath() %>/resources/staticpage/ApplicantData_31_07_2017.pdf" target="_blank" > Click Here </a>.  For Press Note-<a href="<%=request.getContextPath() %>/resources/staticpage/PressNote_01_aug.pdf" target="_blank" > Click Here </a>
			</li> --%>
						
				
					
<!-- 	</ul> -->
	
			
					
				
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
						<a href="pendingPaymentPage">check payment status</a>
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
							<a href="pendingPaymentPage">check payment status</a>
							<p></p>
							<a href="initAgentRegistration">Agents<br> may click here to<br>

							register
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
						<a href="pendingPaymentPage">check payment status</a>
						<p></p>
						<a href="complaintForm">Users<br> may click here to <br>

							register their complaints
						</a>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
	</div>

  <%}%>
  
  
  
  
  	
	<%-- <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true"  id="onload_popup">

    <div class="modal-dialog">

      <!-- Modal content-->
      <div class="modal-content "> 
	  

        <div class="modal-body " style="text-align:center; height:250px;font-size:14px !important; color:#be6422 !important; font-weight:bold;">
        <br/><br/><br/>
     
<br/>
            Public Notice <a href="<%=request.getContextPath() %>/resources/staticpage/Public_Notice_19_Aug_2017.pdf" target="_blank"> download  </a><br/>
		    List of Notice Issued Projects by RERA Karnataka<a href="<%=request.getContextPath() %>/resources/staticpage/List_of_notices_issued_070917.pdf" target="_blank"> download</a><br/>
  	       List of RERA Karnataka Agent Applications<a href="<%=request.getContextPath() %>/resources/staticpage/Agent_Applications_070917.pdf" target="_blank"> download</a><br/>
           	List of RERA Karnataka Approved Agents<a href="<%=request.getContextPath() %>/resources/staticpage/Approved_Agents_List_070917.pdf" target="_blank"> download</a><br/>
           List of RERA Karnataka Project Applicatiants<a href="<%=request.getContextPath() %>/resources/staticpage/Project_Applicants_070917.pdf" target="_blank"> download</a><br/>
           
           	
         
             
		 <button type="button" class="close" data-dismiss="modal">X</button>
     
      </div>

    </div>
</div>
</div> --%>
<script>
    $(window).load(function(){
                $('#onload_popup').modal('show');
            });

</script> 