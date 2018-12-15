<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>




                <div class="breadcrumb">Registration</div>


                <!--News Ticker-->
                <div class="container">

                    <!--main container start here-->
                    <div class="Main_containner">

                        <!--Inner wrapper start here-->
                        <div class="inner_wrapper tsklist">






                            <h1>Registration</h1>
                            <div class="drop_shadow"></div>
                            <div class="clearfix"></div>
                            <c:choose>
                                <c:when test="${ERROR_MSG!=null}">
                                    ${ERROR_MSG}<br>
                                </c:when>
                                <c:otherwise>
                                    <h1>Your Registration is successful. Please check your email ( ${email} ) for login credentials.<br>
                                </c:otherwise>


                            </c:choose>
                            <br>Please <a href="<%=request.getContextPath()%>/postRegLoginPage" >click here</a> to login.</h1>








                            <!--search list main end here-->
                        </div>




                        <!--inner container end here-->
                    </div>




                    <!-- container end here-->

                </div>
                </div>