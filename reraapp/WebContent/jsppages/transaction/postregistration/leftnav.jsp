<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <nav class="sidebar-nav">
            <ul class="nav">
                <li class="divider"></li>
                <li class="nav-item nav-dropdown">
                    <a class="nav-link " href="<%=request.getContextPath() %>/project/postRegProjectDetails"><i class="fa fa-tasks"></i> Project Detail</a>
                </li>
                
                  <li class="nav-item nav-dropdown">
                    <a class="nav-link " href="<%=request.getContextPath() %>/project/towerdetails"><i class="fa fa-area-chart"></i>Building Detail</a>
                </li>
                
                <li class="nav-item nav-dropdown">
                    <a class="nav-link " href="<%=request.getContextPath() %>/project/projectSchedule"><i class="fa fa-tasks"></i> Project Schedule</a>
                </li>

                <li class="nav-item nav-dropdown">
                    <a class="nav-link nav-dropdown-toggle" href="#"><i class="fa fa-rupee"></i> Cost Details</a>
                    <ul class="nav-dropdown-items">
                        <li class="nav-item">
                            <a class="nav-link" href="<%=request.getContextPath() %>/project/landCostDetails"><i class="fa fa-map-marker"></i> Land </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="<%=request.getContextPath() %>/project/constructionCostDetails"><i class="fa fa-building-o"></i>Construction </a>
                        </li>

                    </ul>
                </li>
                
                 <li class="nav-item nav-dropdown">
                    <a class="nav-link " href="<%=request.getContextPath() %>/quarter/home"><i class="fa fa-area-chart"></i> Quaterly Update</a>
                </li>
               
             <c:forEach items="${projectRegistrationModel.projectDetailsModel.quarterlyUpdate}" var="quarterList">
             
               <c:if test="${quarterList.bankDetails.percentageOfProjectCompletion=='100'}">
                <li class="nav-item nav-dropdown">
                    <a class="nav-link " href="<%=request.getContextPath() %>/project/projectSummaryDetails"><i class="fa fa-list-alt"></i> Project Summary</a>
                </li>
                <li class="nav-item nav-dropdown">
                    <a class="nav-link " href="<%=request.getContextPath() %>/project/finalApprovalDetails"><i class="fa fa-check"></i> Final Approvals</a>
                </li>
                </c:if>
                </c:forEach>
                 <li class="nav-item nav-dropdown">
                    <a class="nav-link " href="<%=request.getContextPath() %>/logout"><i class="fa fa-check"></i> Log Out</a>
                </li>
            </ul>
        </nav>
