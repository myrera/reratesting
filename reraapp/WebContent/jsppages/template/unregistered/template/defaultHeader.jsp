<%@page import="in.gov.rera.common.util.ReraConstants"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	Cookie ck[] = request.getCookies();
	String ulang = "kn";
	if (ck != null) {
		for (Cookie ct : ck) {
			if (ct != null && ct.getName() != null && ct.getName().equals("rera_user_lang2")) {
				ulang = ct.getValue();
				break;
			}
		}
	}
%>



<%
	if (ulang == null || ulang.equals("kn")) {
%>
<div class="container-fluid">
	<!--Top Bar-->
	<div class="row">
		<div class="col-md-12 colsm-12 col-xs-12">
			<div class="top-s pull-right">

				<%--    <ul class="social_icon">
			    <li ><a href="#"><img src="<%=request.getContextPath() %>/resources/images/call-icon.jpg" width="23" height="22" /></a>
                                    </li>
                                    <li><a href="#"><img src="<%=request.getContextPath() %>/resources/images/head-phone-icon.jpg" width="23" height="22" /></a></li>
                                    <li><a href="#"><img src="<%=request.getContextPath() %>/resources/images/face-book.jpg" width="22" height="22" alt="facebook" /></a></li>
                                    <li><a href="#"><img src="<%=request.getContextPath() %>/resources/images/linkedin.jpg" width="23" height="22" alt="Linkedin" /></a></li>
                                    <li><a href="#"><img src="<%=request.getContextPath() %>/resources/images/twitter-icon.jpg" alt="twitter" width="22" height="22" /></a></li>
                                    </ul> --%>

				<ul class="lang">
					<li><a
						href="<%=request.getContextPath()%>/changeLang?lang_id=en">&nbsp;
							English &nbsp;</a></li>
				</ul>

				<ul class="font-zoom">
					<li class="suare-icons a-plus icon-plus clsButton "
						id="btnFontIncrease"><a href="#"><span
							class="accebilility_icon">A+</span> </a></li>
					<li class="round-icons a-normal icon-normal clsButton "
						id="bntFontNormal"><a href="#"><span
							class="accebilility_icon">A&nbsp;</span> </a></li>
					<li class="round-icons a-minus icon-minus clsButton "
						id="bntFontDecrease"><a href="#"><span
							class="accebilility_icon">A- </span> </a></li>
					<li class="acceblity"><a href="#"><span
							class="accebilility_icon disabbil">A </span> </a></li>
				</ul>


			</div>
		</div>
	</div>
	<!--Logo Header-->
	<div class="row">
		<div class="top-logo">
			<a href='<%=request.getContextPath()%>/home'>
				<div class="col-md-6 col-sm-6 col-xs-6 ">
					<div class="logo-sec-kn">&nbsp;</div>

				</div>
			</a>
			<div class="col-md-6 col-sm-6 col-xs-6 ut_name-kn"></div>
			<div class="clearfix"></div>
		</div>
	</div>
	<!--Nav-->
	<div class="row">
		<nav class="navbar navbar-default navbar-static-top">
			<div class=" container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#navbar" aria-expanded="false"
						aria-controls="navbar">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
				</div>
				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav navbar-right">


						<li><a href="<%=request.getContextPath()%>/home"> ಮುಖ
								ಪುಟ </a></li>

						<li><a href="<%=request.getContextPath()%>/aboutUs"> ರೇರ
								ವಿವರಗಳು </a></li>


						<!--     <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> ಪುನಾರವೃತ ಪ್ರಶ್ನೆಗಳು <span class="caret"></span></a>
                                            <ul class="dropdown-menu">
                                                <li><a href="<%=request.getContextPath()%>/resources/staticpage/FAQ.pdf" target="_blank">  ರೇರ ಕಾಯಿದೆಯ ಪುನಾರವೃತ ಪ್ರಶ್ನೆಗಳು</a></li>
                                                <li><a href="<%=request.getContextPath()%>/resources/staticpage/KARNATKA_FAQs.pdf" target="_blank"> ರೇರ ನಿಯಮಗಳ ಪುನಾರವೃತ ಪ್ರಶ್ನೆಗಳು  </a></li>
                                            </ul>
                                        </li> -->

						<li><a
							href="<%=request.getContextPath()%>/viewApprovedProjectsInHomePage">
								ಅನುಮೋದಿತ ಯೋಜನೆಗಳು </a></li>

						<li><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false"> ಪ್ರಮುಖ ಲಿಂಕ್ ಗಳು <span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="http://housing.kar.nic.in/" target="_blank">
										ವಸತಿ ಇಲಾಖೆ </a></li>
								<li><a href="http://dpal.kar.nic.in/" target="_blank">
										ಸಂಸತ್ತಿನ ವ್ಯವಹಾರಗಳು ಮತ್ತು ಶಾಸನ ಇಲಾಖೆ </a></li>
								<li><a href="http://mhupa.gov.in/" target="_blank">
										ವಸತಿ ಮತ್ತು ನಗರ ಬಡತನದ ಸಚಿವಾಲಯ </a></li>
							</ul></li>

						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">ಪ್ರಕಟಣೆ<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a
									href="<%=request.getContextPath()%>/resources/staticpage/press_release.pdf"
									target="_blank"> ಪತ್ರಿಕಾ ಪ್ರಕಟಣೆ</a></li>
								<li><a
									href="<%=request.getContextPath()%>/resources/staticpage/penalty_ongoing_projects.pdf"
									target="_blank"> ನಡೆಯುತ್ತಿರುವ ಯೋಜನೆಗಳಿಗೆ ಅನ್ವಯವಾಗುವ ದಂಡದ
										ಬಗ್ಗೆ ಸೂಚನೆ</a></li>
							</ul></li>

						<li><a href="<%=request.getContextPath()%>/contactUsPage">
								ನಮ್ಮನ್ನು ಸಂಪರ್ಕಿಸಿ </a></li>


						<li><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false"> ಸಹಾಯ <span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="<%=request.getContextPath()%>/downloadPage">
										ಡೌನ್ಲೋಡ್ಗಳು </a></li>
								<li><a href="<%=request.getContextPath()%>/helpPage">
										ವೀಡಿಯೊ ಟ್ಯುಟೋರಿಯಲ್ </a></li>


								<li><a
									href="<%=request.getContextPath()%>/resources/staticpage/FAQ.pdf"
									target="_blank"> ರೇರ ಕಾಯಿದೆಯ ಪುನಾರವೃತ ಪ್ರಶ್ನೆಗಳು</a></li>
								<li><a
									href="<%=request.getContextPath()%>/resources/staticpage/KARNATKA_FAQs.pdf"
									target="_blank"> ರೇರ ನಿಯಮಗಳ ಪುನಾರವೃತ ಪ್ರಶ್ನೆಗಳು </a></li>

							</ul></li>





						<%
							String role = (String) session.getAttribute(ReraConstants.SES_USER_ROLE);
								if (role != null) {
									if (role.equals(ReraConstants.AGENT_USER)) {
						%>

						<li class="dropdown"><a href="#" style="border-right: 0px;"
							class="dropdown-toggle" data-toggle="dropdown" role="button"
							aria-haspopup="true" aria-expanded="false"> ಸ್ವ ಭೂಮಿಕೆ <span
								class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a
									href="<%=request.getContextPath()%>/agent/dashboard">
										ಮೂಲಭೂತ ವಿವರಗಳು </a></li>
								<li><a
									href="<%=request.getContextPath()%>/agent/agentDocumentPage">
										ಅಪ್ಲೋಡ್ ಮಾಡಿದ ಡಾಕ್ಯುಮೆಂಟ್ಸ್ </a></li>
								<li><a
									href="<%=request.getContextPath()%>/agent/paymentDetailsPage">
										ಪಾವತಿ ವಿವರಗಳು </a></li>
								<li><a
									href="<%=request.getContextPath()%>/agent/projectListPage">
										ಪ್ರಾಜೆಕ್ಟ್ ಪಟ್ಟಿ </a></li>
								<li><a
									href="<%=request.getContextPath()%>/agent/openRenewalForm">
										ನೋಂದಣಿ ನವೀಕರಣ </a></li>
								<li><a
									href="<%=request.getContextPath()%>/agent/changePasswordForm">
										ಪಾಸ್ವರ್ಡ್ ಬದಲಿಸಿ </a></li>


							</ul></li>

						<li><a href="<%=request.getContextPath()%>/logout"> ಲಾಗ್
								ಔಟ್ </a></li>

						<%
							} else if (role.equals(ReraConstants.PROJECT_USER)) {
						%>


						<li class="dropdown"><a href="#" style="border-right: 0px;"
							class="dropdown-toggle" data-toggle="dropdown" role="button"
							aria-haspopup="true" aria-expanded="false"> ಸ್ವ ಭೂಮಿಕೆ <span
								class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a
									href="<%=request.getContextPath()%>/project/dashboard">
										ಪ್ರವರ್ತಕ ವಿವರಗಳು </a></li>
								<li><a
									href="<%=request.getContextPath()%>/project/projectDocumentsPage">
										ಪ್ರಾಜೆಕ್ಟ್ ಡಾಕ್ಯುಮೆಂಟ್ಸ್ </a></li>
								<li><a
									href="<%=request.getContextPath()%>/project/projectPhotosPage">
										ಪ್ರಾಜೆಕ್ಟ್ ಫೋಟೋಗಳು </a></li>

								<li><a
									href="<%=request.getContextPath()%>/project/projectDetailsPage">
										ಪ್ರಾಜೆಕ್ಟ್ ವಿವರಗಳು</a></li>
								<li><a
									href="<%=request.getContextPath()%>/project/paymentDetailsPage">
										ಪಾವತಿ ವಿವರಗಳು</a></li>

								<li><a
									href="<%=request.getContextPath()%>/project/developmentDetailsPage">
										ಅಭಿವೃದ್ಧಿ ವಿವರಗಳು </a></li>
								<li><a
									href="<%=request.getContextPath()%>/project/projectVendors">
										ಸಂಬಂಧಿತ ಮಾರಾಟಗಾರರು ವಿವರಗಳು </a></li>
								<li><a
									href="<%=request.getContextPath()%>/project/openRegistrationExtForm">
										ಪ್ರಾಜೆಕ್ಟ್ ನೋಂದಣಿ ವಿಸ್ತರಿಸಿ </a></li>
								<li><a
									href="<%=request.getContextPath()%>/project/changePasswordForm">
										ಪಾಸ್ವರ್ಡ್ ಬದಲಿಸಿ </a></li>



							</ul></li>
						<li><a href="<%=request.getContextPath()%>/logout"> ಲಾಗ್
								ಔಟ್ </a></li>

						<%
							} else {
						%>


						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false"> ಲಾಗ್ ಇನ್ <span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a
									href="<%=request.getContextPath()%>/authorityLoginPage">
										ಅಧಿಕಾರಿಗಳ ಲಾಗಿನ್ </a></li>
								<li><a href="<%=request.getContextPath()%>/loginPage">
										ಏಜೆಂಟ್ / ಪ್ರವರ್ತಕರ ಲಾಗಿನ್ </a></li>
								<li><a href="/rerauser/loginPage"> Temp Login</a></li>
							</ul></li>



						<%
							}
						%>

						<%
							} else {
						%>


						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false"> ಲಾಗ್ ಇನ್ <span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a
									href="<%=request.getContextPath()%>/authorityLoginPage">
										ಅಧಿಕಾರಿಗಳ ಲಾಗಿನ್ </a></li>
								<li><a href="<%=request.getContextPath()%>/loginPage">
										ಏಜೆಂಟ್ / ಪ್ರವರ್ತಕರ ಲಾಗಿನ್ </a></li>
								<li><a href="/rerauser/loginPage"> Temp Login</a></li>
							</ul></li>
						<%
							}
						%>
					</ul>
				</div>
				<!--/.nav-collapse -->
			</div>
		</nav>
	</div>
</div>







<%
	} else {
%>





<div class="container-fluid">
	<!--Top Bar-->
	<div class="row">
		<div class="col-md-12 colsm-12 col-xs-12">
			<div class="top-s pull-right">

				<%--    <ul class="social_icon">
			    <li ><a href="#"><img src="<%=request.getContextPath() %>/resources/images/call-icon.jpg" width="23" height="22" /></a>
                                        </li>
                                        <li><a href="#"><img src="<%=request.getContextPath() %>/resources/images/head-phone-icon.jpg" width="23" height="22" /></a></li>
                                        <li><a href="#"><img src="<%=request.getContextPath() %>/resources/images/face-book.jpg" width="22" height="22" alt="facebook" /></a></li>
                                        <li><a href="#"><img src="<%=request.getContextPath() %>/resources/images/linkedin.jpg" width="23" height="22" alt="Linkedin" /></a></li>
                                        <li><a href="#"><img src="<%=request.getContextPath() %>/resources/images/twitter-icon.jpg" alt="twitter" width="22" height="22" /></a></li>
                                        </ul> --%>

				<ul class="lang">
					<li><a
						href="<%=request.getContextPath()%>/changeLang?lang_id=kn">&nbsp;
							Kannada &nbsp;</a></li>
				</ul>

				<ul class="font-zoom">
					<li class="suare-icons a-plus icon-plus clsButton "
						id="btnFontIncrease"><a href="#"><span
							class="accebilility_icon">A+</span> </a></li>
					<li class="round-icons a-normal icon-normal clsButton "
						id="bntFontNormal"><a href="#"><span
							class="accebilility_icon">A&nbsp;</span> </a></li>
					<li class="round-icons a-minus icon-minus clsButton "
						id="bntFontDecrease"><a href="#"><span
							class="accebilility_icon">A- </span> </a></li>
					<li class="acceblity"><a href="#"><span
							class="accebilility_icon disabbil">A </span> </a></li>
				</ul>


			</div>
		</div>
	</div>
	<!--Logo Header-->
	<div class="row">
		<div class="top-logo">
			<a href='<%=request.getContextPath()%>/home'>
				<div class="col-md-6 col-sm-6 col-xs-6 ">
					<div class="logo-sec">&nbsp;</div>

				</div>
			</a>
			<div class="col-md-6 col-sm-6 col-xs-6 ut_name"></div>
			<div class="clearfix"></div>
		</div>
	</div>
	<!--Nav-->
	<div class="row">
		<nav class="navbar navbar-default navbar-static-top">
			<div class=" container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#navbar" aria-expanded="false"
						aria-controls="navbar">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
				</div>
				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav navbar-left">

						<li><a href="<%=request.getContextPath()%>/home">Home</a></li>
						 <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Unregistered Project<span class="caret"></span></a>
						
                                          <ul class="dropdown-menu" >
                                                  <li><a href="<%=request.getContextPath()%>/unRegProject/unRegProjectDetailsForm">New Unregistered Project</a></li>
                                                   <li><a href="#">Return by L1</a></li>
                                                  <li><a href="#">Verification Pending</a></li>
                                                  <li><a href="<%=request.getContextPath()%>/unRegProject/viewAllProjects">View All Project</a></li>
                                                  <li><a href="#">Exempted List</a></li>
                                                 </ul>
                    
							</li>
							
							<li><a href="<%=request.getContextPath()%>/jsppages/transaction/unregistered/enquiryDetails.jsp">Enquiry Details</a></li>
						 <li><a
							href="<%=request.getContextPath()%>/projectUnregLogin"> MIS Reports</a></li>
							</ul> 
                        <ul class="nav navbar-nav navbar-right">
						<li><a href="<%=request.getContextPath()%>/helpdesk/changePasswordForm">Change Password</a></li>


						<li><a href="<%=request.getContextPath()%>/logout">Logout</a></li>


					</ul>
				</div>
				<!--/.nav-collapse -->
			</div>
		</nav>
	</div>
</div>

<%
	}
%>