<%@page import="in.gov.rera.common.util.ReraConstants"%>
<%@page import="in.gov.rera.common.model.UserModel"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	UserModel user = (UserModel) session.getAttribute(ReraConstants.SES_USER_ATTR);

String signatureCount="";
if(session.getAttribute("AGENT_SIGNATURE_COUNT")!=null && !("0".equals(session.getAttribute("AGENT_SIGNATURE_COUNT").toString()))){
	signatureCount=session.getAttribute("AGENT_SIGNATURE_COUNT").toString();
}
%>

<div class="container-fluid">
	<!--Top Bar-->
	<div class="row">
		<div class="col-md-12 colsm-12 col-xs-12">
			<div class="top-s pull-right">

				<%--    <ul class="social_icon">
			    <li ><a href="#"><img src="<%=request.getContextPath() %>/resources/images/call-icon.jpg" width="23" height="22" /></a></li> 
		        <li><a href="#"><img src="<%=request.getContextPath() %>/resources/images/head-phone-icon.jpg" width="23" height="22" /></a></li> 
		        <li><a href="#"><img src="<%=request.getContextPath() %>/resources/images/face-book.jpg" width="22" height="22" alt="facebook" /></a></li> 
		        <li><a href="#"><img src="<%=request.getContextPath() %>/resources/images/linkedin.jpg" width="23" height="22" alt="Linkedin" /></a></li> 
		        <li><a href="#"><img src="<%=request.getContextPath() %>/resources/images/twitter-icon.jpg" alt="twitter" width="22" height="22" /></a></li> 
          </ul>
         --%>
				<ul class="lang">
					<li><a href="#"><img
							src="<%=request.getContextPath()%>/resources/images/hindi-icon.jpg"
							width="22" height="22" /></a></li>
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
		<span class="pull-right user_name">Welcome :<b> <%=user.getUserName()%></b></span>

		<div class="top-logo">

			<a href='<%=request.getContextPath()%>/home'>
				<div class="col-md-6 col-sm-6 col-xs-6">
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
					<ul class="nav navbar-nav navbar-left"><li><a href="pendingAgentSignatures" style="border-right: 0px;"><img width="25" hieght="25" src="<%=request.getContextPath() %>/resources/images/pending.png">
						  Pending Approval<font style="vertical-align:super;font-size:10px;color:yellow"> <%=
								  signatureCount%></font> </a></li></ul>
					
					<ul class="nav navbar-nav navbar-right">
					

						<li><a href="dashboard" style="border-right: 0px;">Dashboard
						</a></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">Project Registration<span class="caret"></span></a>
							<ul class="dropdown-menu">

								<li><a href="projectTasklist">Task List(New Project) </a></li>
								<%--
                                	<li><a href="projectUpdateTasklist">Tasklist(Updated Registration) </a></li> --%>
								<!-- 	<li><a href="projectExtTasklist">Task List(Project Extension) </a></li> -->
								<li><a href="viewApprovedProjects">View All Approved
										Projects List </a></li>
								<li><a href="viewAllProjects">View All Projects List </a></li>
								<li><a href="returnProjects">Task List(Returned and
										Updated)</a></li>
								<!--  li><a href="returnProjectListToL0">Task List(Returned To L0) </a></li -->
								<li><a href="viewPendingEnquery">Task List(Pending
										Enquiry) </a></li>
								<li><a href="returnbyl2">Task List(Returned by Chief
										Authority) </a></li>
								<li><a href="enqApprovedTasklist">Enquiry Task List
										(Approved)</a></li>
								<li><a href="pendingProjectStatus">Pending Project
										Status List </a></li>

							</ul></li>

						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">Agent Registration<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="agentTasklist">Task list (New
										Registration) </a></li>
								<li><a href="agentUpdateTasklist">Task List (Updated
										Registration)</a></li>
								<li><a href="agentRenewalTasklist">Task List
										(Registration Renewal)</a></li>
								<li><a href="viewApprovedAgents">View All Approved
										Agents List</a></li>
								<li><a href="viewAllAgents">View All Agents List </a></li>
								<li><a href="viewAgentPendingEnquery">Task List(Pending
										Enquiry) </a></li>
								<li><a href="viewRejectedAgents">Rejected Task list</a></li>
							</ul></li>

						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">Complaint Registration<span
								class="caret"></span></a>
							<ul class="dropdown-menu">
								<!-- <li><a href="#">Tasklist </a></li> -->
								<li><a href="allcomplaints">View All Complaints </a></li>


							</ul></li>


						<!--  <li><a href="reports" style="border-right: 0px;">MIS Report</a></li>  -->

						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">MIS Report<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="reports">Project Report</a></li>
								<li><a href="agentreports">Agent Report</a></li>
								<li><a href="alertreports">LO Users Report</a></li>


							</ul></li>
							
<li><a href="reportproblemList" style="border-right: 0px;">Unregistered Projects</a></li>




						<li><a href="changePasswordForm" style="border-right: 0px;">Change
								Password </a></li>



						<li><a href="<%=request.getContextPath()%>/logout"
							style="border-right: 0px;">Logout</a></li>









					</ul>
				</div>
				<!--/.nav-collapse -->
			</div>
		</nav>
	</div>
	<button onclick="topFunction()" id="myBtn" title="Go to top">
		<i class="fa fa-chevron-circle-up fa-2x" aria-hidden="true"></i>
	</button>
	<button type="button" id="myBot" value="bottom" onclick="gobottom();">
		<i class="fa fa-chevron-circle-down fa-2x" aria-hidden="true"></i>
	</button>
	<style>
#myBtn {
	display: none;
	position: fixed;
	bottom: 40px;
	right: 60px;
	z-index: 99;
	border: none;
	outline: none;
	background-color: #be6422;
	color: white;
	cursor: pointer;
	padding: 10px;
	border-radius: 10px;
}

#myBot {
	position: fixed;
	bottom: 40px;
	right: 10px;
	z-index: 99;
	border: none;
	outline: none;
	background-color: #be6422;
	color: white;
	cursor: pointer;
	padding: 10px;
	border-radius: 10px;
}
</style>





	<script>
		// When the user scrolls down 20px from the top of the document, show the button
		window.onscroll = function() {
			scrollFunction();
			scrollFunctionBtm()
		};

		function scrollFunction() {
			if (document.body.scrollTop > 20
					|| document.documentElement.scrollTop > 20) {
				document.getElementById("myBtn").style.display = "block";
			} else {
				document.getElementById("myBtn").style.display = "none";
			}
		}

		// When the user clicks on the button, scroll to the top of the document
		function topFunction() {
			document.body.scrollTop = 0;
			document.documentElement.scrollTop = 0;
		}
	</script>

	<script>
		function scrollFunctionBtm() {
			if (document.body.scrollTop > document.body.scrollHeight - 750
					|| document.documentElement.scrollTop > document.body.scrollHeight - 750) {
				document.getElementById("myBot").style.display = "none";
			} else {
				document.getElementById("myBot").style.display = "block";
			}
		}

		function gobottom() {
			console.log("scrollHeight" + document.body.scrollHeight)
			console.log("scrollTop" + document.body.scrollTop)
			window.scrollTo(0, document.body.scrollHeight);
		}
	</script>
</div>