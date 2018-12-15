
<%@page import="in.gov.rera.common.security.ReraSecurity"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@page import="in.gov.rera.common.model.UserModel"%>
<%@page import="in.gov.rera.common.util.ReraConstants"%>
<%
	String roleAccess = (String) session.getAttribute(ReraConstants.ROLE_ACCESS);
	UserModel user = (UserModel) session.getAttribute(ReraConstants.SES_USER_ATTR);
%>
<html>
</body>
<div>
<c:out value="${unregProject.enquiryList}">test</c:out>
						<div class="inner_wrapper">
							<div class="panel-group" id="accordion">
								<c:if test="${unregproject.enquiryList !=null}">
									<c:forEach items="${unregproject.enquiryList}" var="enq">
										<div class="panel panel-default">
											<div class="panel-heading">
												<h4 class="panel-title">
													<a data-toggle="collapse" data-parent="#accordion" href="#${enq.enquiryId}">
														<h1>
														
															Enquiry sent on
															<fmt:formatDate pattern="dd-MM-yyyy" value="${enq.createdOn.getTime()}" />
															<%-- <c:if test="${enq.raisedBy.userName !=null}">
																<span>by ${enq.raisedBy.userName}</span>
															</c:if> --%>
														</h1>
													</a>
												</h4>
											</div>
											 <div id="${enq.enquiryId}" class="panel-collapse collapse in">
												<div class="panel-body">
													Subject: ${enq.subject}<br> <br>
													${enq.enquiryText} <br>
													<%-- <c:if test="${enq.replyText !=null}">
														<br>
														<b>Reply Received:</b>
														<br> ${enq.replyText}
                                                    </c:if> --%>
												</div>
											</div> 
										</div>
									</c:forEach>
								</c:if>
							</div>
						</div>


					</div>
					</body>
					</html>