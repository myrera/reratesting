<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

        <nav class="sidebar-nav">
            <ul class="nav">

                <li class="divider"></li>
                <li class="nav-item nav-dropdown">
                    <a class="nav-link " href="<%=request.getContextPath() %>/plot/postRegProjectDetails"><i class="fa fa-tasks"></i> Project Detail</a>
                </li>
                
                  <li class="nav-item nav-dropdown">
                    <a class="nav-link " href="<%=request.getContextPath() %>/plot/plotDetails"><i class="fa fa-area-chart"></i>Plot Detail</a>
                </li>
                
                <li class="nav-item nav-dropdown">
                    <a class="nav-link " href="<%=request.getContextPath() %>/plot/plotScheduleDetails"><i class="fa fa-tasks"></i> Project Schedule</a>
                </li>

                <li class="nav-item nav-dropdown">
                    <a class="nav-link nav-dropdown-toggle" href="#"><i class="fa fa-rupee"></i> Cost Details</a>
                    <ul class="nav-dropdown-items">
                        <li class="nav-item">
                            <a class="nav-link" href="<%=request.getContextPath() %>/plot/plotCostDetails"><i class="fa fa-map-marker"></i> Land </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="<%=request.getContextPath() %>/plot/plotConstructionCostDetails"><i class="fa fa-building-o"></i>Construction </a>
                        </li>

                    </ul>
                </li>
                
                 <li class="nav-item nav-dropdown">
                    <a class="nav-link " href="<%=request.getContextPath() %>/plotquarter/home"><i class="fa fa-area-chart"></i> Quaterly Update</a>
                </li>
                
               <%--  <c:forEach items="${projectRegistrationModel.projectDetailsModel.plotsQuarterlyUpdate}" var="quarterList">
                
               <c:if test="${quarterList.bankDetails.percentageOfProjectCompletion=='100'}"> --%>
                
                <li class="nav-item nav-dropdown">
                    <a class="nav-link " href="<%=request.getContextPath() %>/plot/plotSummaryDetails"><i class="fa fa-list-alt"></i> Project Summary</a>
                </li>
                <li class="nav-item nav-dropdown">
                    <a class="nav-link " href="<%=request.getContextPath() %>/plot/plotFinalApprovalDetails"><i class="fa fa-check"></i> Final Approvals</a>
                </li>
                <%-- </c:if>
                </c:forEach> --%>
                
                 <li class="nav-item nav-dropdown">
                    <a class="nav-link " href="<%=request.getContextPath() %>/logout"><i class="fa fa-sign-out"></i>LogOut</a>
                </li>
            </ul>
        </nav>