<%@page import="in.gov.rera.common.security.ReraSecurity"%>
    <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
        <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
            <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>




                <div class="breadcrumb">Home /Project Details</div>
                <a class="pull-right user_name" href="javascript:history.back()">Back
	to List</a>



                <div class="col-md-12 col-sm-12 ">

                    <div class="Main_containner">

                        <!--Inner wrapper stsrt here-->
                        <div class="inner_wrapper">




                            <h1>
                                Project Registration<span> Detail</span>
                            </h1>
                            <span class="pull-right user_name">Ack Number :<b>
						${project.applicationNo }</b></span>
                            <br>
                            <span class="pull-right user_name">Project Name :<b> ${project.projectDetailsModel.projectName }</b></span>

                            <br>
                            <div class="border">
                                <div class="orange"></div>
                                <div class="black"></div>
                            </div>



                            <!-----------------------------Tab start here--------------------------------->

                            <div class="tab_main">

                                <ul class="nav nav-tabs">
                                    <li class="active"><a data-toggle="tab" href="#home">Promoter
							Detail</a></li>
                                    <li><a data-toggle="tab" href="#menu1">Project Detail</a></li>
                                    <li><a data-toggle="tab" href="#menu2">Uploaded Documents</a></li>
                                    <li><a data-toggle="tab" href="#menu3"> Payment</a></li>
                                </ul>



                                <div class="tab-content">
                                    <div id="home" class="tab-pane fade in active">



                                        <br>

                                        <div class="col-md-12">
                                            <h1>
                                                Promoter <span> Detail</span>
                                            </h1>
                                            <div class="drop_shadow"></div>
                                        </div>



                                        <div class="row">
                                            <div class="col-md-3 col-sm-6 col-xs-6">
                                                <p class="text-right ">
                                                    Promoter Type <span class="space_LR">:</span>
                                                </p>
                                            </div>
                                            <div class="col-md-3 col-sm-6 col-xs-6">
                                                <p class="text-view">
                                                    ${project.promoterDetailsModel.typeOfPromoter }</p>
                                            </div>
                                            <div class="col-md-3 col-sm-6 col-xs-6">
                                                <p class="text-right">
                                                    Name<span class="space_LR">:</span>
                                                </p>
                                            </div>
                                            <div class="col-md-3 col-sm-6 col-xs-6">
                                                <p>${project.promoterDetailsModel.promoterName }</p>
                                            </div>
                                        </div>


                                        <div class="row">
                                            <div class="col-md-3 col-sm-6 col-xs-6">
                                                <p class="text-right">
                                                    PAN Number<span class="space_LR">:</span>
                                                </p>
                                            </div>
                                            <div class="col-md-3 col-sm-6 col-xs-6">
                                                <p>${project.promoterDetailsModel.panNo}</p>
                                            </div>
                                            <div class="col-md-3 col-sm-6 col-xs-6">
                                                <p class="text-right">
                                                    Phone Number<span class="space_LR">:</span>
                                                </p>
                                            </div>
                                            <div class="col-md-3 col-sm-6 col-xs-6">
                                                <p>${project.promoterDetailsModel.mobileNo}</p>
                                            </div>
                                        </div>


                                        <div class="row"></div>


                                        <div class="row">
                                            <div class="col-md-3 col-sm-6 col-xs-6">
                                                <p class="text-right">
                                                    E-mail<span class="space_LR">:</span>
                                                </p>
                                            </div>
                                            <div class="col-md-3 col-sm-6 col-xs-6">
                                                <p>${project.promoterDetailsModel.emailId}</p>
                                            </div>
                                            <div class="col-md-3 col-sm-6 col-xs-6">
                                                <p class="text-right">
                                                    Address <span class="space_LR">:</span>
                                                </p>
                                            </div>
                                            <div class="col-md-3 col-sm-6 col-xs-6">
                                                <p>${project.promoterDetailsModel.addressLine1},${project.promoterDetailsModel.addressLine2}
                                                </p>
                                            </div>
                                        </div>


                                        <div class="row">
                                            <div class="col-md-3 col-sm-6 col-xs-6">
                                                <p class="text-right">
                                                    District <span class="space_LR">:</span>
                                                </p>
                                            </div>
                                            <div class="col-md-3 col-sm-6 col-xs-6">
                                                <p>${project.promoterDetailsModel.districtModel.districtName}
                                                </p>
                                            </div>
                                            <div class="col-md-3 col-sm-6 col-xs-6">
                                                <p class="text-right">
                                                    State/UT<span class="space_LR">:</span>
                                                </p>
                                            </div>
                                            <div class="col-md-3 col-sm-6 col-xs-6">
                                                <p>${project.promoterDetailsModel.districtModel.stateUtModel.stateUtName}
                                                </p>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-3 col-sm-6 col-xs-6">
                                                <p class="text-right">
                                                    PIN Code <span class="space_LR">:</span>
                                                </p>
                                            </div>
                                            <div class="col-md-3 col-sm-6 col-xs-6">
                                                <p>${project.promoterDetailsModel.pinCode}</p>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-3 col-sm-6 col-xs-6">
                                                <p class="text-right">
                                                    Company Registration No. <span class="space_LR">:</span>
                                                </p>
                                            </div>
                                            <div class="col-md-3 col-sm-6 col-xs-6">
                                                <p>${project.promoterDetailsModel.comRegistrationNo}</p>
                                            </div>
                                            <div class="col-md-3 col-sm-6 col-xs-6">
                                                <p class="text-right">
                                                    Certificate<span class="space_LR">:</span>
                                                </p>
                                            </div>
                                            <div class="col-md-3 col-sm-6 col-xs-6">
                                                <p>
                                                    <a href='<%=request.getContextPath() %>/download?DOC_ID=${project.promoterDetailsModel.document.documentId}'>${project.promoterDetailsModel.document.fileName}</a>
                                                </p>
                                            </div>

                                        </div>



                                        <div class="inner_wrapper">

                                            <div class="col-md-12">
                                                <h1>
                                                    Authorized Signatory<span> Detail</span>
                                                </h1>
                                                <div class="drop_shadow"></div>
                                            </div>



                                            <div class="row">
                                                <div class="col-md-3 col-sm-6 col-xs-6">
                                                    <p class="text-right ">
                                                        Chairman Name <span class="space_LR">:</span>
                                                    </p>
                                                </div>
                                                <div class="col-md-3 col-sm-6 col-xs-6">
                                                    <p class="text-view">${project.promoterDetailsModel.projectChairmanModel.chairmanName}
                                                    </p>
                                                </div>
                                                <div class="col-md-3 col-sm-6 col-xs-6">
                                                    <p class="text-right">
                                                        Mobile Number<span class="space_LR">:</span>
                                                    </p>
                                                </div>
                                                <div class="col-md-3 col-sm-6 col-xs-6">
                                                    <p>${project.promoterDetailsModel.projectChairmanModel.mobileNo }</p>
                                                </div>
                                            </div>


                                            <div class="row">
                                                <div class="col-md-3 col-sm-6 col-xs-6">
                                                    <p class="text-right">
                                                        Email Address <span class="space_LR">:</span>
                                                    </p>
                                                </div>
                                                <div class="col-md-3 col-sm-6 col-xs-6">
                                                    <p>${project.promoterDetailsModel.projectChairmanModel.emailId}</p>
                                                </div>
                                                <div class="col-md-3 col-sm-6 col-xs-6">
                                                    <p class="text-right">
                                                        Address<span class="space_LR">:</span>
                                                    </p>
                                                </div>
                                                <div class="col-md-3 col-sm-6 col-xs-6">
                                                    <p>${project.promoterDetailsModel.projectChairmanModel.addressLine1} , ${project.promoterDetailsModel.projectChairmanModel.addressLine2}
                                                    </p>
                                                </div>
                                            </div>



                                            <div class="row">
                                                <div class="col-md-3 col-sm-6 col-xs-6">
                                                    <p class="text-right">
                                                        Photograph<span class="space_LR">:</span>
                                                    </p>
                                                </div>
                                                <div class="col-md-3 col-sm-6 col-xs-6">
                                                    <p>
                                                        <a href='<%=request.getContextPath() %>/download?DOC_ID=${project.promoterDetailsModel.projectChairmanModel.document.documentId}'>
											${project.promoterDetailsModel.projectChairmanModel.document.fileName}
										</a>
                                                    </p>
                                                </div>
                                            </div>


                                        </div>



                                        <div class="inner_wrapper">

                                            <div class="col-md-12">
                                                <h1>
                                                    Project Head <span> Detail</span>
                                                </h1>
                                                <div class="drop_shadow"></div>
                                            </div>

                                            <c:forEach items="${project.promoterDetailsModel.projectChairmanModel.memberSet}" var="ProMemObj">

                                                <div class="row">
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right ">
                                                            Name <span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-view">${ProMemObj.memberName }</p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            Type<span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>${ProMemObj.memberType }</p>
                                                    </div>
                                                </div>


                                                <div class="row">
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            Mobile Number <span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>${ProMemObj.mobileNo}</p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            Email Address<span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>${ProMemObj.emailId}</p>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            Address<span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>${ProMemObj.addressLine1 }.${ProMemObj.addressLine2 }</p>
                                                    </div>

                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            Pin Code<span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>${ProMemObj.pinCode}</p>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            Photograph<span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>
                                                            <a href='<%=request.getContextPath() %>/download?DOC_ID=${ProMemObj.momberPhotoDoc.documentId}'>
												${ProMemObj.momberPhotoDoc.fileName}</a>
                                                        </p>
                                                    </div>
                                                </div>

                                            </c:forEach>
                                        </div>



                                        <div class="inner_wrapper">

                                            <h1>
                                                RERA Registration Details with any <span>other State/UTs</span>
                                            </h1>
                                            <div class="drop_shadow"></div>
                                            <c:forEach items="${project.promoterDetailsModel.promoterBlackSet}" var="blckListObj">

                                                <div class="row">
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            Have your said registration been revoked? <span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <c:if test="${blckListObj.isBalckList==true}">
                                                        <div class="col-md-3 col-sm-6 col-xs-6">
                                                            <p>Yes</p>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${blckListObj.isBalckList==false}">
                                                        <div class="col-md-3 col-sm-6 col-xs-6">
                                                            <p>No</p>
                                                        </div>
                                                    </c:if>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            Certificate Number<span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>${blckListObj.certificateNo}</p>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            Reason for Revoked<span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>${blckListObj.blacklistReason}</p>
                                                    </div>

                                                </div>
                                            </c:forEach>
                                        </div>


                                        <div class="inner_wrapper">

                                            <h1>
                                                Previous Project <span>Details</span><span style="font-size: 12px; padding-left: 8px; font-weight: normal; color: #000;">
									(Last 5 years only)</span>
                                            </h1>
                                            <div class="drop_shadow"></div>
                                            <c:forEach items="${project.previousProjectDetailsSet}" var="preobj">
                                                <div class="row">
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            Project Name<span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>${preobj.projectName}</p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            Project Description<span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>${preobj.projectDescription}</p>
                                                    </div>
                                                </div>


                                                <div class="row">
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            Current Status <span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>${preobj.projectCurrentStatus}</p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            Type of Land<span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>${preobj.typeOfLand}</p>
                                                    </div>
                                                </div>


                                                <div class="row">
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            If Delayed<span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>${preobj.ifDelayed}</p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            No of Months<span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>${preobj.noOfMonthDelayed}</p>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            If Ongoing <span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>${preobj.ifOngoing}</p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            Expected Completion Date<span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>Company</p>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            Address<span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>${preobj.projectAddress}</p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            State/UT<span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>${preobj.districtModel.stateUtModel.stateUtName}</p>
                                                    </div>
                                                </div>


                                                <div class="row">
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            District<span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>${preobj.districtModel.districtName}</p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            Pin Code<span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>${preobj.projectAddrPinCode}</p>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>



                                    </div>



                                    <div id="menu1" class="tab-pane fade">
                                        <form class="form-horizontal">

                                            <br>

                                            <div class="col-md-12">
                                                <h1>
                                                    Project <span> Detail</span>
                                                </h1>
                                                <div class="drop_shadow"></div>
                                            </div>



                                            <div class="row">
                                                <div class="col-md-3 col-sm-6 col-xs-6">
                                                    <p class="text-right ">
                                                        Project Name <span class="space_LR">:</span>
                                                    </p>
                                                </div>
                                                <div class="col-md-3 col-sm-6 col-xs-6">
                                                    <p class="text-view">${project.projectDetailsModel.projectName}</p>
                                                </div>
                                                <div class="col-md-3 col-sm-6 col-xs-6">
                                                    <p class="text-right">
                                                        Project <span class="space_LR">:</span>
                                                    </p>
                                                </div>
                                                <div class="col-md-3 col-sm-6 col-xs-6">
                                                    <p>${project.projectDetailsModel.projectDescription}</p>
                                                </div>
                                            </div>


                                            <div class="row">
                                                <div class="col-md-3 col-sm-6 col-xs-6">
                                                    <p class="text-right">
                                                        Project Type<span class="space_LR">:</span>
                                                    </p>
                                                </div>
                                                <div class="col-md-3 col-sm-6 col-xs-6">
                                                    <p>${project.projectDetailsModel.projectType}</p>
                                                </div>
                                                <div class="col-md-3 col-sm-6 col-xs-6">
                                                    <p class="text-right">
                                                        Project Status<span class="space_LR">:</span>
                                                    </p>
                                                </div>
                                                <div class="col-md-3 col-sm-6 col-xs-6">
                                                    <p>${project.projectDetailsModel.projectStatus}</p>
                                                </div>
                                            </div>


                                            <div class="row">
                                                <div class="col-md-3 col-sm-6 col-xs-6">
                                                    <p class="text-right">
                                                        Project Start Date<span class="space_LR">:</span>
                                                    </p>
                                                </div>
                                                <div class="col-md-3 col-sm-6 col-xs-6">
                                                    <p>${project.projectDetailsModel.startDate.time}</p>
                                                </div>
                                                <div class="col-md-3 col-sm-6 col-xs-6">
                                                    <p class="text-right">
                                                        Project End Date<span class="space_LR">:</span>
                                                    </p>
                                                </div>
                                                <div class="col-md-3 col-sm-6 col-xs-6">
                                                    <p>${project.projectDetailsModel.completionDate.time}</p>
                                                </div>
                                            </div>


                                            <div class="row">
                                                <div class="col-md-3 col-sm-6 col-xs-6">
                                                    <p class="text-right">
                                                        Total Area Of Land (Sq Mtr)<span class="space_LR">:</span>
                                                    </p>
                                                </div>
                                                <div class="col-md-3 col-sm-6 col-xs-6">
                                                    <p>${project.projectDetailsModel.totalAreaOfLand}</p>
                                                </div>
                                                <div class="col-md-3 col-sm-6 col-xs-6">
                                                    <p class="text-right">
                                                        Total Coverd Area (Sq Mtr) <span class="space_LR">:</span>
                                                    </p>
                                                </div>
                                                <div class="col-md-3 col-sm-6 col-xs-6">
                                                    <p>${project.projectDetailsModel.totalCoverdArea}</p>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-3 col-sm-6 col-xs-6">
                                                    <p class="text-right">
                                                        Total Open Area (Sq Mtr)<span class="space_LR">:</span>
                                                    </p>
                                                </div>
                                                <div class="col-md-3 col-sm-6 col-xs-6">
                                                    <p>${project.projectDetailsModel.totalOpenArea}</p>
                                                </div>
                                                <div class="col-md-3 col-sm-6 col-xs-6">
                                                    <p class="text-right">
                                                        Estimated Cost of Construction (INR) <span class="space_LR">:</span>
                                                    </p>
                                                </div>
                                                <div class="col-md-3 col-sm-6 col-xs-6">
                                                    <p>${project.projectDetailsModel.estimatedCost}</p>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-md-3 col-sm-6 col-xs-6">
                                                    <p class="text-right">
                                                        Cost of Land (INR)<span class="space_LR">:</span>
                                                    </p>
                                                </div>
                                                <div class="col-md-3 col-sm-6 col-xs-6">
                                                    <p>${project.projectDetailsModel.costOfLand}</p>
                                                </div>
                                                <div class="col-md-3 col-sm-6 col-xs-6">
                                                    <p class="text-right">
                                                        Total Project Cost (INR) <span class="space_LR">:</span>
                                                    </p>
                                                </div>
                                                <div class="col-md-3 col-sm-6 col-xs-6">
                                                    <p>${project.projectDetailsModel.totalProjectCost}</p>
                                                </div>
                                            </div>



                                            <div class="row">
                                                <div class="col-md-3 col-sm-6 col-xs-6">
                                                    <p class="text-right">
                                                        Project Address Line 1 <span class="space_LR">:</span>
                                                    </p>
                                                </div>
                                                <div class="col-md-3 col-sm-6 col-xs-6">
                                                    <p>${project.projectDetailsModel.addressLine1}, ${project.projectDetailsModel.addressLine2}
                                                    </p>
                                                </div>

                                            </div>

                                            <div class="row">
                                                <div class="col-md-3 col-sm-6 col-xs-6">
                                                    <p class="text-right">
                                                        District<span class="space_LR">:</span>
                                                    </p>
                                                </div>
                                                <div class="col-md-3 col-sm-6 col-xs-6">
                                                    <p>${project.projectDetailsModel.subDistrictModel.districtModel.districtName}
                                                    </p>
                                                </div>
                                                <div class="col-md-3 col-sm-6 col-xs-6">
                                                    <p class="text-right">
                                                        Tehsil/Sub District<span class="space_LR">:</span>
                                                    </p>
                                                </div>
                                                <div class="col-md-3 col-sm-6 col-xs-6">
                                                    <p>
                                                        ${project.projectDetailsModel.subDistrictModel.subDistrictName}
                                                    </p>
                                                </div>
                                            </div>
                                            <%-- <div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Latitude<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p>${project.projectDetailsModel.latitude} </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Longitude<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p> ${project.projectDetailsModel.longitude} </p></div>
	</div> --%>


                                                <div class="row">
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            Nort Latitude<span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>${project.projectDetailsModel.northlatitude}</p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            Nort Longitude<span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>${project.projectDetailsModel.northlongitude}</p>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            East Latitude<span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>${project.projectDetailsModel.eastlatitude}</p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            East Longitude<span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>${project.projectDetailsModel.eastlongitude}</p>
                                                    </div>
                                                </div>


                                                <div class="row">
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            West Latitude<span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>${project.projectDetailsModel.westlatitude}</p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            West Longitude<span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>${project.projectDetailsModel.westlongitude}</p>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            South Latitude<span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>${project.projectDetailsModel.southlatitude}</p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            South Longitude<span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>${project.projectDetailsModel.southlongitude}</p>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            Approving Authority<span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>${project.projectDetailsModel.office.officeName}</p>
                                                    </div>
                                                </div>


                                                <div class="row">
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            No of Garage for Sale<span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>${project.projectDetailsModel.noOfGarageForSale}</p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            Area of Garage for Sale (Sq Mtr)<span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>${project.projectDetailsModel.areaOfGarageForSale}</p>
                                                    </div>
                                                </div>


                                                <div class="row">
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            No of Parking for Sale (Sq Mtr)<span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>${project.projectDetailsModel.noOfParkinfForSale}</p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            Area of Parking for Sale (Sq Mtr)<span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>${project.projectDetailsModel.areaOfParkinfForSale}</p>
                                                    </div>
                                                </div>




                                                <div class="inner_wrapper">

                                                    <h1>
                                                        Project Ongoing <span> Status</span>
                                                    </h1>
                                                    <div class="drop_shadow"></div>

                                                    <div class="row">
                                                        <div class="col-md-3 col-sm-6 col-xs-6">
                                                            <p class="text-right">
                                                                Extent of development carried till date<span class="space_LR">:</span>
                                                            </p>
                                                        </div>
                                                        <div class="col-md-3 col-sm-6 col-xs-6">
                                                            <p>${project.projectDetailsModel.devCompletion}%</p>
                                                        </div>
                                                        <div class="col-md-3 col-sm-6 col-xs-6">
                                                            <p class="text-right">
                                                                Extent of development pending<span class="space_LR">:</span>
                                                            </p>
                                                        </div>
                                                        <div class="col-md-3 col-sm-6 col-xs-6">
                                                            <p>${project.projectDetailsModel.devPending}%</p>
                                                        </div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-md-3 col-sm-6 col-xs-6">
                                                            <p class="text-right">
                                                                Total amount of money collected form allotee<span class="space_LR">:</span>
                                                            </p>
                                                        </div>
                                                        <div class="col-md-3 col-sm-6 col-xs-6">
                                                            <p>${project.projectDetailsModel.totalAmtClctedFrmAllotee}</p>
                                                        </div>
                                                        <div class="col-md-3 col-sm-6 col-xs-6">
                                                            <p class="text-right">
                                                                Total amount of money used from development of project<span class="space_LR">:</span>
                                                            </p>
                                                        </div>
                                                        <div class="col-md-3 col-sm-6 col-xs-6">
                                                            <p>${project.projectDetailsModel.totalAmtUsedInPrjct}</p>
                                                        </div>

                                                    </div>

                                                    <div class="row">
                                                        <div class="col-md-3 col-sm-6 col-xs-6">
                                                            <p class="text-right">
                                                                Total amount of balance maney lying with promoter<span class="space_LR">:</span>
                                                            </p>
                                                        </div>
                                                        <div class="col-md-3 col-sm-6 col-xs-6">
                                                            <p>${project.projectDetailsModel.totalBalAmtOfAlte}</p>
                                                        </div>
                                                        <div class="col-md-3 col-sm-6 col-xs-6">
                                                            <p class="text-right">
                                                                Is Any Subsequent Modification in Plan<span class="space_LR">:</span>
                                                            </p>
                                                        </div>
                                                        <div class="col-md-3 col-sm-6 col-xs-6">
                                                            <p>${project.projectDetailsModel.isSubSqChangeInPlan}</p>
                                                        </div>


                                                    </div>

                                                    <div class="row">
                                                        <div class="col-md-3 col-sm-6 col-xs-6">
                                                            <p class="text-right">
                                                                Is Delay in the Project<span class="space_LR">:</span>
                                                            </p>
                                                        </div>
                                                        <div class="col-md-3 col-sm-6 col-xs-6">
                                                            <p>${project.projectDetailsModel.isDelayed}</p>
                                                        </div>

                                                    </div>

                                                    <div class="row">
                                                        <div class="col-md-3 col-sm-6 col-xs-6">
                                                            <p class="text-right">
                                                                Reason For Delay<span class="space_LR">:</span>
                                                            </p>
                                                        </div>
                                                        <div class="col-md-3 col-sm-6 col-xs-6">
                                                            <p>${project.projectDetailsModel.reasonForDelayed}</p>
                                                        </div>
                                                        <div class="col-md-3 col-sm-6 col-xs-6">
                                                            <p class="text-right">
                                                                No of Month Delay<span class="space_LR">:</span>
                                                            </p>
                                                        </div>
                                                        <div class="col-md-3 col-sm-6 col-xs-6">
                                                            <p>${project.projectDetailsModel.noOfMonthDelayed}</p>
                                                        </div>


                                                    </div>

                                                    <div class="row">
                                                        <div class="col-md-3 col-sm-6 col-xs-6">
                                                            <p class="text-right">
                                                                Expected Completion Date<span class="space_LR">:</span>
                                                            </p>
                                                        </div>
                                                        <div class="col-md-3 col-sm-6 col-xs-6">
                                                            <p>${project.projectDetailsModel.estimatedEndDate.time}</p>
                                                        </div>
                                                        <div class="col-md-3 col-sm-6 col-xs-6">
                                                            <p class="text-right">
                                                                Certificate form Architect,Engineer,CA etc.<span class="space_LR">:</span>
                                                            </p>
                                                        </div>
                                                        <div class="col-md-3 col-sm-6 col-xs-6">
                                                            <p>
                                                                <a href="download?DOC_ID=${project.projectDetailsModel.delayedCertDoc.documentId}">
												${project.projectDetailsModel.delayedCertDoc.fileName }</a>
                                                            </p>
                                                        </div>


                                                    </div>
                                                </div>




                                                <div class="inner_wrapper">

                                                    <h1>
                                                        Development <span> Details</span>
                                                    </h1>
                                                    <div class="drop_shadow"></div>
                                                    <c:forEach items="${project.developmentDetailSet}" var="devObj">

                                                        <div class="row">
                                                            <div class="col-md-3 col-sm-6 col-xs-6">
                                                                <p class="text-right">
                                                                    Type of Inventory<span class="space_LR">:</span>
                                                                </p>
                                                            </div>
                                                            <div class="col-md-3 col-sm-6 col-xs-6">
                                                                <p>${devObj.typeOfInventory}</p>
                                                            </div>
                                                            <div class="col-md-3 col-sm-6 col-xs-6">
                                                                <p class="text-right">
                                                                    No of Inventory<span class="space_LR">:</span>
                                                                </p>
                                                            </div>
                                                            <div class="col-md-3 col-sm-6 col-xs-6">
                                                                <p>${devObj.noOfInventory}</p>
                                                            </div>
                                                        </div>

                                                        <div class="row">
                                                            <div class="col-md-3 col-sm-6 col-xs-6">
                                                                <p class="text-right">
                                                                    Carpet Area (Sq Mtr)<span class="space_LR">:</span>
                                                                </p>
                                                            </div>
                                                            <div class="col-md-3 col-sm-6 col-xs-6">
                                                                <p>${devObj.carpetArea}SqMtr</p>
                                                            </div>
                                                            <div class="col-md-3 col-sm-6 col-xs-6">
                                                                <p class="text-right">
                                                                    Area of exclusive balcony/verandah (Sq Mtr)<span class="space_LR">:</span>
                                                                </p>
                                                            </div>
                                                            <div class="col-md-3 col-sm-6 col-xs-6">
                                                                <p>${devObj.areaOfExclusive}SqMtr</p>
                                                            </div>

                                                        </div>

                                                        <div class="row">
                                                            <div class="col-md-3 col-sm-6 col-xs-6">
                                                                <p class="text-right">
                                                                    Area of exclusive open terrace if any (Sq Mtr)<span class="space_LR">:</span>
                                                                </p>
                                                            </div>
                                                            <div class="col-md-3 col-sm-6 col-xs-6">
                                                                <p>${devObj.areaOfExclusiveOpenTerrace}SqMtr</p>
                                                            </div>


                                                        </div>
                                                    </c:forEach>
                                                </div>




                                                <div class="inner_wrapper">

                                                    <h1>
                                                        Internal Development <span>Work</span>
                                                    </h1>
                                                    <div class="drop_shadow"></div>

                                                    <div class="row">
                                                        <div class="col-md-3 col-sm-6 col-xs-6">
                                                            <p class="text-right">
                                                                Road & Road system<span class="space_LR">:</span>
                                                            </p>
                                                        </div>
                                                        <div class="col-md-3 col-sm-6 col-xs-6">
                                                            <p>${project.externalDevelopmentWorkModel.roadSysetmDevBy }</p>
                                                        </div>
                                                        <div class="col-md-3 col-sm-6 col-xs-6">
                                                            <p class="text-right">
                                                                Water supply<span class="space_LR">:</span>
                                                            </p>
                                                        </div>
                                                        <div class="col-md-3 col-sm-6 col-xs-6">
                                                            <p>${project.externalDevelopmentWorkModel.waterSupplyBy }
                                                            </p>
                                                        </div>
                                                    </div>


                                                    <div class="row">
                                                        <div class="col-md-3 col-sm-6 col-xs-6">
                                                            <p class="text-right">
                                                                Sewege and Drainage System <span class="space_LR">:</span>
                                                            </p>
                                                        </div>
                                                        <div class="col-md-3 col-sm-6 col-xs-6">
                                                            <p>${project.externalDevelopmentWorkModel.sewegeAndDrainageSystemDevBy }
                                                            </p>
                                                        </div>
                                                        <div class="col-md-3 col-sm-6 col-xs-6">
                                                            <p class="text-right">
                                                                Electricity Supply Trasfomer And Sub Stattion<span class="space_LR">:</span>
                                                            </p>
                                                        </div>
                                                        <div class="col-md-3 col-sm-6 col-xs-6">
                                                            <p>${project.externalDevelopmentWorkModel.electricityAndTrasfomerSupply }
                                                            </p>
                                                        </div>
                                                    </div>


                                                    <div class="row">
                                                        <div class="col-md-3 col-sm-6 col-xs-6">
                                                            <p class="text-right">
                                                                Solid Waste Managment And Disposal<span class="space_LR">:</span>
                                                            </p>
                                                        </div>
                                                        <div class="col-md-3 col-sm-6 col-xs-6">
                                                            <p>${project.externalDevelopmentWorkModel.solidWasteSupplyBy }
                                                            </p>
                                                        </div>

                                                    </div>


                                                </div>



                                                <div class="inner_wrapper">

                                                    <h1>
                                                        Project <span>Bank</span>
                                                    </h1>
                                                    <div class="drop_shadow"></div>

                                                    <div class="row">
                                                        <div class="col-md-3 col-sm-6 col-xs-6">
                                                            <p class="text-right">
                                                                Bank Name<span class="space_LR">:</span>
                                                            </p>
                                                        </div>
                                                        <div class="col-md-3 col-sm-6 col-xs-6">
                                                            <p>${project.projectBankDetailsModel.bankModel.bankName}</p>
                                                        </div>
                                                        <div class="col-md-3 col-sm-6 col-xs-6">
                                                            <p class="text-right">
                                                                Branch<span class="space_LR">:</span>
                                                            </p>
                                                        </div>
                                                        <div class="col-md-3 col-sm-6 col-xs-6">
                                                            <p>${project.projectBankDetailsModel.bankBranch}</p>
                                                        </div>

                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-3 col-sm-6 col-xs-6">
                                                            <p class="text-right">
                                                                Account No.<span class="space_LR">:</span>
                                                            </p>
                                                        </div>
                                                        <div class="col-md-3 col-sm-6 col-xs-6">
                                                            <p>${project.projectBankDetailsModel.accountNumber}</p>
                                                        </div>
                                                        <div class="col-md-3 col-sm-6 col-xs-6">
                                                            <p class="text-right">
                                                                ifscCode<span class="space_LR">:</span>
                                                            </p>
                                                        </div>
                                                        <div class="col-md-3 col-sm-6 col-xs-6">
                                                            <p>${project.projectBankDetailsModel.ifscCode}</p>
                                                        </div>

                                                    </div>

                                                    <div class="row">
                                                        <div class="col-md-3 col-sm-6 col-xs-6">
                                                            <p class="text-right">
                                                                State<span class="space_LR">:</span>
                                                            </p>
                                                        </div>
                                                        <div class="col-md-3 col-sm-6 col-xs-6">
                                                            <p>${project.projectBankDetailsModel.districtModel.stateUtModel.stateUtName}
                                                            </p>
                                                        </div>
                                                        <div class="col-md-3 col-sm-6 col-xs-6">
                                                            <p class="text-right">
                                                                District<span class="space_LR">:</span>
                                                            </p>
                                                        </div>
                                                        <div class="col-md-3 col-sm-6 col-xs-6">
                                                            <p>${project.projectBankDetailsModel.districtModel.districtName}
                                                            </p>
                                                        </div>

                                                    </div>


                                                </div>






                                                <div class="inner_wrapper">

                                                    <h1>
                                                        Associated Vendor <span>Work</span>
                                                    </h1>

                                                    <div class="inner_wrapper">

                                                        <h1>
                                                            Project <span>Agent</span>
                                                        </h1>
                                                        <div class="drop_shadow"></div>
                                                        <c:forEach items="${project.projectAgentDetailSet}" var="preAgentObj">
                                                            <c:if test="${preAgentObj.status=='CONFIRMED'}">
                                                                <div class="row">
                                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                                        <p class="text-right">
                                                                            Agent Registration No.<span class="space_LR">:</span>
                                                                        </p>
                                                                    </div>
                                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                                        <p>${preAgentObj.agent.agentRegistrationNo}</p>
                                                                    </div>
                                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                                        <p class="text-right">
                                                                            Agent Name<span class="space_LR">:</span>
                                                                        </p>
                                                                    </div>
                                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                                        <p>${preAgentObj.agent.agentDetailsModel.agentName}</p>
                                                                    </div>
                                                                </div>


                                                                <div class="row">
                                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                                        <p class="text-right">
                                                                            Agent Address<span class="space_LR">:</span>
                                                                        </p>
                                                                    </div>
                                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                                        <p>
                                                                            ${preAgentObj.agent.agentDetailsModel.agentIndividualAddressLine1}
                                                                        </p>
                                                                    </div>

                                                                </div>
                                                            </c:if>
                                                        </c:forEach>



                                                    </div>

                                                    <div class="inner_wrapper">

                                                        <h1>
                                                            Project <span>Architects</span>
                                                        </h1>


                                                        <c:forEach items="${project.projectArchitectDetailSet}" var="arctObj">
                                                            <c:if test="${arctObj.status=='CONFIRMED'}">
                                                                <div class="drop_shadow"></div>
                                                                <div class="row">
                                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                                        <p class="text-right">
                                                                            Name<span class="space_LR">:</span>
                                                                        </p>
                                                                    </div>
                                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                                        <p>${arctObj.architectName}</p>
                                                                    </div>
                                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                                        <p class="text-right">
                                                                            EmailID<span class="space_LR">:</span>
                                                                        </p>
                                                                    </div>
                                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                                        <p>${arctObj.emailId}</p>
                                                                    </div>
                                                                </div>


                                                                <div class="row">
                                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                                        <p class="text-right">
                                                                            Sate<span class="space_LR">:</span>
                                                                        </p>
                                                                    </div>
                                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                                        <p>${arctObj.districtModel.stateUtModel.stateUtName}</p>
                                                                        <p></p>
                                                                    </div>
                                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                                        <p class="text-right">
                                                                            District<span class="space_LR">:</span>
                                                                        </p>
                                                                    </div>
                                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                                        <p>${arctObj.districtModel.districtName}</p>
                                                                    </div>
                                                                </div>

                                                                <div class="row">
                                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                                        <p class="text-right">
                                                                            Address line<span class="space_LR">:</span>
                                                                        </p>
                                                                    </div>
                                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                                        <p>${arctObj.addressLine1},${arctObj.addressLine2}</p>
                                                                        <p></p>
                                                                    </div>
                                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                                        <p class="text-right">
                                                                            Pine Code<span class="space_LR">:</span>
                                                                        </p>
                                                                    </div>
                                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                                        <p>${arctObj.pinCode}</p>
                                                                    </div>
                                                                </div>



                                                                <div class="row">
                                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                                        <p class="text-right">
                                                                            Year Of Establishment<span class="space_LR">:</span>
                                                                        </p>
                                                                    </div>
                                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                                        <p>${arctObj.yearOfEstablishment}</p>
                                                                        <p></p>
                                                                    </div>
                                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                                        <p class="text-right">
                                                                            Number of Project Completed <span class="space_LR">:</span>
                                                                        </p>
                                                                    </div>
                                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                                        <p>${arctObj.keyProject }</p>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                                        <p class="text-right">
                                                                            Reg. Number With COA<span class="space_LR">:</span>
                                                                        </p>
                                                                    </div>
                                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                                        <p>${arctObj.regOfCoaNo}</p>
                                                                        <p></p>
                                                                    </div>
                                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                                        <p class="text-right"></p>
                                                                    </div>
                                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                                        <p></p>
                                                                    </div>
                                                                </div>


                                                            </c:if>
                                                        </c:forEach>


                                                    </div>

                                                    <div class="inner_wrapper">

                                                        <h1>
                                                            Structural <span>Engineers</span>
                                                        </h1>

                                                        <c:forEach items="${project.structuralEngineerDetailSet}" var="strObj">
                                                            <c:if test="${strObj.status=='CONFIRMED'}">
                                                                <div class="drop_shadow"></div>
                                                                <div class="row">
                                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                                        <p class="text-right">
                                                                            Name<span class="space_LR">:</span>
                                                                        </p>
                                                                    </div>
                                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                                        <p>${strObj.engineerName}</p>
                                                                    </div>
                                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                                        <p class="text-right">
                                                                            EmailID<span class="space_LR">:</span>
                                                                        </p>
                                                                    </div>
                                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                                        <p>${strObj.emailId}</p>
                                                                    </div>
                                                                </div>


                                                                <div class="row">
                                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                                        <p class="text-right">
                                                                            Sate<span class="space_LR">:</span>
                                                                        </p>
                                                                    </div>
                                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                                        <p>${strObj.districtModel.stateUtModel.stateUtName}</p>
                                                                        <p></p>
                                                                    </div>
                                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                                        <p class="text-right">
                                                                            District<span class="space_LR">:</span>
                                                                        </p>
                                                                    </div>
                                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                                        <p>${strObj.districtModel.districtName}</p>
                                                                    </div>
                                                                </div>

                                                                <div class="row">
                                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                                        <p class="text-right">
                                                                            Address line<span class="space_LR">:</span>
                                                                        </p>
                                                                    </div>
                                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                                        <p>${strObj.addressLine1},${strObj.addressLine2}</p>
                                                                        <p></p>
                                                                    </div>
                                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                                        <p class="text-right">
                                                                            Pine Code<span class="space_LR">:</span>
                                                                        </p>
                                                                    </div>
                                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                                        <p>${strObj.pinCode}</p>
                                                                    </div>
                                                                </div>


                                                                <div class="row">
                                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                                        <p class="text-right">
                                                                            Year Of Establishment<span class="space_LR">:</span>
                                                                        </p>
                                                                    </div>
                                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                                        <p>${strObj.yearOfEstablishment}</p>
                                                                        <p></p>
                                                                    </div>
                                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                                        <p class="text-right">
                                                                            Number of Project Completed<span class="space_LR">:</span>
                                                                        </p>
                                                                    </div>
                                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                                        <p>${strObj.keyProject }</p>
                                                                    </div>
                                                                </div>

                                                                <div class="row">
                                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                                        <p class="text-right">
                                                                            Local Authority Licence Number<span class="space_LR">:</span>
                                                                        </p>
                                                                    </div>
                                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                                        <p>${strObj.localAuthorityLicenceNumber}</p>
                                                                        <p></p>
                                                                    </div>
                                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                                        <p class="text-right"></p>
                                                                    </div>
                                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                                        <p></p>
                                                                    </div>
                                                                </div>

                                                            </c:if>
                                                        </c:forEach>



                                                    </div>

                                                    <div class="inner_wrapper">

                                                        <h1>
                                                            Project <span>Contractors</span>
                                                        </h1>


                                                        <c:forEach items="${project.projectContratorDetailSet}" var="strObj">
                                                            <c:if test="${strObj.status=='CONFIRMED'}">
                                                                <div class="drop_shadow"></div>

                                                                <div class="row">
                                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                                        <p class="text-right">
                                                                            Name<span class="space_LR">:</span>
                                                                        </p>
                                                                    </div>
                                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                                        <p>${strObj.contractorName}</p>
                                                                    </div>
                                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                                        <p class="text-right">
                                                                            EmailID<span class="space_LR">:</span>
                                                                        </p>
                                                                    </div>
                                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                                        <p>${strObj.emailId}</p>
                                                                    </div>
                                                                </div>


                                                                <div class="row">
                                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                                        <p class="text-right">
                                                                            Sate<span class="space_LR">:</span>
                                                                        </p>
                                                                    </div>
                                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                                        <p>${strObj.districtModel.stateUtModel.stateUtName}</p>
                                                                        <p></p>
                                                                    </div>
                                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                                        <p class="text-right">
                                                                            District<span class="space_LR">:</span>
                                                                        </p>
                                                                    </div>
                                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                                        <p>${strObj.districtModel.districtName}</p>
                                                                    </div>
                                                                </div>

                                                                <div class="row">
                                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                                        <p class="text-right">
                                                                            Address line<span class="space_LR">:</span>
                                                                        </p>
                                                                    </div>
                                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                                        <p>${strObj.addressLine1},${strObj.addressLine2}</p>
                                                                        <p></p>
                                                                    </div>
                                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                                        <p class="text-right">
                                                                            Pine Code<span class="space_LR">:</span>
                                                                        </p>
                                                                    </div>
                                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                                        <p>${strObj.pinCode}</p>
                                                                    </div>
                                                                </div>


                                                                <div class="row">
                                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                                        <p class="text-right">
                                                                            Year Of Establishment<span class="space_LR">:</span>
                                                                        </p>
                                                                    </div>
                                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                                        <p>${strObj.yearOfEstablishment}</p>
                                                                        <p></p>
                                                                    </div>
                                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                                        <p class="text-right">
                                                                            Number Of Project Completed<span class="space_LR">:</span>
                                                                        </p>
                                                                    </div>
                                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                                        <p>${strObj.keyProject }</p>
                                                                    </div>
                                                                </div>


                                                            </c:if>
                                                        </c:forEach>




                                                    </div>

                                                </div>




                                        </form>
                                    </div>
                                    <div id="menu2" class="tab-pane fade">
                                        <form class="form-horizontal">

                                            <br>




                                            <div class="inner_wrapper">

                                                <h1>
                                                    Promoter <span> Document </span>
                                                </h1>
                                                <div class="drop_shadow"></div>


                                                <div class="row">
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            PAN Card <span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>
                                                            <a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.panCardDoc.documentId}'>${project.projectDocModel.panCardDoc.fileName }</a>
                                                        </p>
                                                    </div>
                                                </div>


                                            </div>


                                            <div class="inner_wrapper">

                                                <h1>
                                                    Project <span>Approval</span>
                                                </h1>
                                                <div class="drop_shadow"></div>

                                                <div class="row">
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            Commencement Certificate<span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>
                                                            <a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.commencementCertDoc.documentId}'>${project.projectDocModel.commencementCertDoc.fileName }</a>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            Approved Building/Plotting Plan<span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>
                                                            <a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.approveSacPlanDoc.documentId}'>${project.projectDocModel.approveSacPlanDoc.fileName }</a>
                                                        </p>
                                                    </div>
                                                </div>


                                                <div class="row">
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            Approved Layout Plan <span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>
                                                            <a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.approveLayoutPlanDoc.documentId}'>${project.projectDocModel.approveLayoutPlanDoc.fileName }</a>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            Proforma For Sale Deed <span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>
                                                            <a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.agreementFileDoc.documentId}'>${project.projectDocModel.agreementFileDoc.fileName }</a>
                                                        </p>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            Existing Layout Plan <span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>
                                                            <a href="download?DOC_ID=${project.projectDocModel.extendedLayoutPlanDoc.documentId}">
												${project.projectDocModel.extendedLayoutPlanDoc.fileName} </a>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            Existing Section Plan and Specification <span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>
                                                            <a href="download?DOC_ID=${project.projectDocModel.extendedSacPlanDoc.documentId}">
												${project.projectDocModel.extendedSacPlanDoc.fileName} </a>
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            Land documents & Location<span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>
                                                            <a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.landLocationFileDoc.documentId}'>${project.projectDocModel.landLocationFileDoc.fileName }</a>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            Approved Section Of Building/Infrastructure Plan of Plotting<span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>
                                                            <a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.sanctionedLayoutPlanDoc.documentId}'>${project.projectDocModel.sanctionedLayoutPlanDoc.fileName }</a>
                                                        </p>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            Area Development Plan Of Project Area<span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>
                                                            <a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.areaDevelopmentDoc.documentId}'>${project.projectDocModel.areaDevelopmentDoc.fileName }</a>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            Performa of Allotment Letter<span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>
                                                            <a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.performaOfAllotmentLetterDoc.documentId}'>${project.projectDocModel.performaOfAllotmentLetterDoc.fileName }</a>
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            Brochure of Current Project<span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>
                                                            <a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.brochureOfCurrentProjectDoc.documentId}'>${project.projectDocModel.brochureOfCurrentProjectDoc.fileName }</a>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            All NOCs from Authority<span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>
                                                            <a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.projectRelatedDoc.documentId}'>${project.projectDocModel.projectRelatedDoc.fileName }</a>
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            Project Specification<span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>
                                                            <a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.projectSpecificDoc.documentId}'>${project.projectDocModel.projectSpecificDoc.fileName }</a>
                                                        </p>
                                                    </div>

                                                    <!--  Added new field -->
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            Encumbrance Certificate<span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>
                                                            <a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.encumbranceCertificateDoc.documentId}'>${project.projectDocModel.encumbranceCertificateDoc.fileName }</a>
                                                        </p>
                                                    </div>
                                                </div>

                                                <!--  Start added new 3 docs -->
                                                <div class="row">
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            Title Deed<span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>
                                                            <a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.titleDeed.documentId}'>${project.projectDocModel.titleDeed.fileName }</a>
                                                        </p>
                                                    </div>


                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            Joint Development Agreement<span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>
                                                            <a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.jointDevelopmentAgreement.documentId}'>${project.projectDocModel.jointDevelopmentAgreement.fileName }</a>
                                                        </p>
                                                    </div>

                                                </div>

                                                <!-- Added by Suneetha -->
                                                <div class="row">
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            Any other document (Rights/Title/Interest/Name) <span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>
                                                            <a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectAddDocModel.anyOtherDoc.documentId}'>${project.projectAddDocModel.anyOtherDoc.fileName }</a>
                                                        </p>
                                                    </div>

                                                </div>


                                                <div class="row">
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            Conversion Certificate under Sec 95 of the KLR Act 1961 <span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>
                                                            <a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectAddDocModel.section95.documentId}'>${project.projectAddDocModel.section95.fileName }</a>
                                                        </p>
                                                    </div>

                                                </div>
                                                <div class="row">
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            Approval/NOC under Sec 14 of the KTCP Act<span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>
                                                            <a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectAddDocModel.section14.documentId}'>${project.projectAddDocModel.section14.fileName }</a>
                                                        </p>
                                                    </div>

                                                </div>

                                                <!-- Added by Suneetha -->
                                                <div class="row">
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            Utilisation certificate<span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>
                                                            <a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectAddDocModel.utilisationCert.documentId}'>${project.projectAddDocModel.utilisationCert.fileName }</a>
                                                        </p>
                                                    </div>

                                                </div>

                                                <div class="row">
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            Transfer of development rights certificate<span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>
                                                            <a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectAddDocModel.transferOfDevRightsCert.documentId}'>${project.projectAddDocModel.transferOfDevRightsCert.fileName }</a>
                                                        </p>
                                                    </div>

                                                </div>

                                                <div class="row">
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            Relinquishment Deed<span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>
                                                            <a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectAddDocModel.relinquishmenDeed.documentId}'>${project.projectAddDocModel.relinquishmenDeed.fileName }</a>
                                                        </p>
                                                    </div>

                                                </div>

                                                <div class="row">
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            Fire Force Department<span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>
                                                            <a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectAddDocModel.fireForceDept.documentId}'>${project.projectAddDocModel.fireForceDept.fileName }</a>
                                                        </p>
                                                    </div>

                                                </div>

                                                <div class="row">
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            Airport Authority of India<span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>
                                                            <a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectAddDocModel.airportAuthorityOfIndia.documentId}'>${project.projectAddDocModel.airportAuthorityOfIndia.fileName }</a>
                                                        </p>
                                                    </div>

                                                </div>

                                                <div class="row">
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            BESCOM<span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>
                                                            <a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectAddDocModel.bescom.documentId}'>${project.projectAddDocModel.bescom.fileName }</a>
                                                        </p>
                                                    </div>

                                                </div>

                                                <div class="row">
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            BWSSB<span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>
                                                            <a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectAddDocModel.bwssb.documentId}'>${project.projectAddDocModel.bwssb.fileName }</a>
                                                        </p>
                                                    </div>

                                                </div>

                                                <div class="row">
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            KSPCB<span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>
                                                            <a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectAddDocModel.kspcb.documentId}'>${project.projectAddDocModel.kspcb.fileName }</a>
                                                        </p>
                                                    </div>

                                                </div>

                                                <div class="row">
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            SEIAA<span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>
                                                            <a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectAddDocModel.seiaa.documentId}'>${project.projectAddDocModel.seiaa.fileName }</a>
                                                        </p>
                                                    </div>

                                                </div>

                                                <div class="row">
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            BSNL<span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>
                                                            <a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectAddDocModel.bsnl.documentId}'>${project.projectAddDocModel.bsnl.fileName }</a>
                                                        </p>
                                                    </div>

                                                </div>

                                                <div class="row">
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            NOC in case of building proposals abutting to neighbouring properties
                                                            <span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>
                                                            <a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectAddDocModel.nocBuildingAbuttingToNeighbourProperties.documentId}'>${projectReg.projectAddDocModel.nocBuildingAbuttingToNeighbourProperties.fileName }</a>
                                                        </p>
                                                    </div>

                                                </div>

                                                <div class="row">
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            Lift Authorities<span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>
                                                            <a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectAddDocModel.liftAuthorities.documentId}'>${projectReg.projectAddDocModel.liftAuthorities.fileName }</a>
                                                        </p>
                                                    </div>

                                                </div>

                                                <div class="row">
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            Urban Land Ceiling<span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>
                                                            <a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectAddDocModel.urbanLandCeiling.documentId}'>${projectReg.projectAddDocModel.urbanLandCeiling.fileName }</a>
                                                        </p>
                                                    </div>

                                                </div>

                                                <div class="row">
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            BMRCL<span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>
                                                            <a href='<%=request.getContextPath() %>/download?DOC_ID=${projprojectectReg.projectAddDocModel.bmrcl.documentId}'>${project.projectAddDocModel.bmrcl.fileName }</a>
                                                        </p>
                                                    </div>

                                                </div>

                                                <div class="row">
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            Bangalore Urban Arts Commission<span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>
                                                            <a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectAddDocModel.bangaloreUrbanArtsCommission.documentId}'>${project.projectAddDocModel.bangaloreUrbanArtsCommission.fileName }</a>
                                                        </p>
                                                    </div>

                                                </div>

                                                <div class="row">
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            Inspector of Factories Controller of explosives Railways<span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>
                                                            <a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectAddDocModel.inspectorOfFactoriesCntrlOfExplosivesRailways.documentId}'>${project.projectAddDocModel.inspectorOfFactoriesCntrlOfExplosivesRailways.fileName }</a>
                                                        </p>
                                                    </div>

                                                </div>

                                                <div class="row">
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            Dist Magistrate<span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>
                                                            <a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectAddDocModel.distMagistrate.documentId}'>${project.projectAddDocModel.distMagistrate.fileName }</a>
                                                        </p>
                                                    </div>

                                                </div>

                                                <div class="row">
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            Coastal Regulation Zone Authority<span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>
                                                            <a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectAddDocModel.coastalRegulationZoneAuthority.documentId}'>${project.projectAddDocModel.coastalRegulationZoneAuthority.fileName }</a>
                                                        </p>
                                                    </div>

                                                </div>

                                                <div class="row">
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            Certificate from Registered Engineer indicating the structural safety of the building (for Apartments) (1 MB)<span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>
                                                            <a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectAddDocModel.engrIndicateStructural.documentId}'>${project.projectAddDocModel.engrIndicateStructural.fileName }</a>
                                                        </p>
                                                    </div>

                                                </div>

                                                <div class="row">
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            Sectional Drawing of the apartments(5 MB)<span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>
                                                            <a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectAddDocModel.sectionalDrawingOfTheApartments.documentId}'>${project.projectAddDocModel.sectionalDrawingOfTheApartments.fileName }</a>
                                                        </p>
                                                    </div>

                                                </div>
                                                <!-- End of Suneetha -->

                                                <div class="row">
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            Existing Layout Plan<span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>
                                                            <a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.existingLayoutPlan.documentId}'>${project.projectDocModel.existingLayoutPlan.fileName }</a>
                                                        </p>
                                                    </div>


                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            Existing Section Plan and Specification<span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>
                                                            <a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.existingSectionPlanandSpec.documentId}'>${project.projectDocModel.existingSectionPlanandSpec.fileName }</a>
                                                        </p>
                                                    </div>

                                                </div>

                                                <div class="row">
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            Change of Land Use<span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>
                                                            <a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.changeOfLandUse.documentId}'>${project.projectDocModel.changeOfLandUse.fileName }</a>
                                                        </p>
                                                    </div>


                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            Advocate Search Report<span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>
                                                            <a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectAddDocModel.advocatesearchreport.documentId}'>${project.projectAddDocModel.advocatesearchreport.fileName }</a>
                                                        </p>
                                                    </div>

                                                </div>

                                                <!--  end added new 3 docs -->



                                            </div>

                                            <div class="inner_wrapper">

                                                <h1>
                                                    Financial <span>Document</span>
                                                </h1>
                                                <div class="drop_shadow"></div>

                                                <div class="row">
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            Audited Balance Sheet (2014)<span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>
                                                            <a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.auditedBalSheetDoc1.documentId}'>${project.projectDocModel.auditedBalSheetDoc1.fileName }</a>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            Audited Balance Sheet (2015)<span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>
                                                            <a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.auditedBalSheetDoc2.documentId}'>${project.projectDocModel.auditedBalSheetDoc2.fileName }</a>
                                                        </p>
                                                    </div>
                                                </div>


                                                <div class="row">
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            Audited Balance Sheet (2016) <span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>
                                                            <a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.auditedBalSheetDoc3.documentId}'>${project.projectDocModel.auditedBalSheetDoc3.fileName }</a>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            Audited ProfitLoss Statement (2014) <span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>
                                                            <a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.auditedProfitLossSheetDoc1.documentId}'>${project.projectDocModel.auditedProfitLossSheetDoc1.fileName }</a>
                                                        </p>
                                                    </div>
                                                </div>


                                                <div class="row">
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            Audited ProfitLoss Statement (2015) <span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>
                                                            <a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.auditedProfitLossSheetDoc2.documentId}'>${project.projectDocModel.auditedProfitLossSheetDoc2.fileName }</a>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            Audited ProfitLoss Statement (2016) <span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>
                                                            <a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.auditedProfitLossSheetDoc3.documentId}'>${project.projectDocModel.auditedProfitLossSheetDoc3.fileName }</a>
                                                        </p>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            Director's Report (2014) <span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>
                                                            <a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.directorReportDoc1.documentId}'>${project.projectDocModel.directorReportDoc1.fileName }</a>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            Director's Report (2015) <span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>
                                                            <a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.directorReportDoc2.documentId}'>${project.projectDocModel.directorReportDoc2.fileName }</a>
                                                        </p>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            Director's Report (2016) <span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>
                                                            <a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.directorReportDoc3.documentId}'>${project.projectDocModel.directorReportDoc3.fileName }</a>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            Cash Flow Statement (2014) <span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>
                                                            <a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.cashFlowStmtFileDoc1.documentId}'>${project.projectDocModel.cashFlowStmtFileDoc1.fileName }</a>
                                                        </p>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            Cash Flow Statement (2015) <span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>
                                                            <a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.cashFlowStmtFileDoc2.documentId}'>${project.projectDocModel.cashFlowStmtFileDoc2.fileName }</a>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            Cash Flow Statement (2016) <span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>
                                                            <a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.cashFlowStmtFileDoc3.documentId}'>${project.projectDocModel.cashFlowStmtFileDoc3.fileName }</a>
                                                        </p>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            Auditors Report (2014) <span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>
                                                            <a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.auditorsDoc1.documentId}'>${project.projectDocModel.auditorsDoc1.fileName }</a>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            Auditors Report (2015) <span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>
                                                            <a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.auditorsDoc2.documentId}'>${project.projectDocModel.auditorsDoc2.fileName }</a>
                                                        </p>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            Auditors Report (2016) <span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>
                                                            <a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.auditorsDoc3.documentId}'>${project.projectDocModel.auditorsDoc3.fileName }</a>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            Income Tax Return (2014) <span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>
                                                            <a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.incomeTaxReturn1.documentId}'>${project.projectDocModel.incomeTaxReturn1.fileName }</a>
                                                        </p>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            Income Tax Return (2015) <span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>
                                                            <a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.incomeTaxReturn2.documentId}'>${project.projectDocModel.incomeTaxReturn2.fileName }</a>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            Income Tax Return (2016) <span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>
                                                            <a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.incomeTaxReturn3.documentId}'>${project.projectDocModel.incomeTaxReturn3.fileName }</a>
                                                        </p>
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="inner_wrapper">

                                                <h1>Declaration</h1>
                                                <div class="drop_shadow"></div>

                                                <div class="row">
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            Declaration (Form B)<span class="space_LR">:</span>
                                                        </p>
                                                    </div>
                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>
                                                            <a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.declarationFormbDoc.documentId}'>${project.projectDocModel.declarationFormbDoc.fileName }</a>
                                                        </p>
                                                    </div>

                                                </div>

                                            </div>


                                            <div class="inner_wrapper">

                                                <h1>Other Documents</h1>
                                                <div class="drop_shadow"></div>

                                                <c:forEach items="${project.projectDocModel.otherDocumentSet }" var="doc">
                                                    <div class="row">
                                                        <div class="col-md-3 col-sm-6 col-xs-6">
                                                            <p class="text-right">
                                                                <span class="space_LR">${doc.caption }:</span>
                                                            </p>
                                                        </div>
                                                        <div class="col-md-3 col-sm-6 col-xs-6">
                                                            <p>
                                                                <a href='<%=request.getContextPath() %>/download?DOC_ID=${doc.documentId}'>${doc.fileName }</a>
                                                            </p>
                                                        </div>

                                                    </div>
                                                </c:forEach>
                                            </div>





                                            <div class="inner_wrapper">

                                                <h1>
                                                    Project <span>Photo</span>
                                                </h1>


                                                <c:forEach items="${project.projectPhotoDetailSet}" var="projectPhoto">
                                                    <div class="drop_shadow"></div>

                                                    <div class="row">
                                                        <div class="col-md-3 col-sm-6 col-xs-6">
                                                            <p class="text-right">
                                                                Project Photo<span class="space_LR">:</span>
                                                            </p>
                                                        </div>
                                                        <div class="col-md-3 col-sm-6 col-xs-6">
                                                            <p>
                                                                <a href='<%=request.getContextPath() %>/download?DOC_ID=${projectPhoto.documentId}'>${projectPhoto.fileName }</a>
                                                            </p>
                                                        </div>

                                                    </div>

                                                </c:forEach>


                                            </div>


                                        </form>


                                    </div>



                                    <div id="menu3" class="tab-pane fade">



                                        <div class="col-md-12">
                                            <h1>Payment</h1>



                                            <c:if test="${project.paymentDetailsModel.paymentMode!='Payment Gateway'}">
                                                <div class="row">

                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            Payment Mode<span class="space_LR">:</span>
                                                        </p>
                                                    </div>

                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>${project.paymentDetailsModel.paymentMode}</p>
                                                    </div>

                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p class="text-right">
                                                            Unique Token Number<span class="space_LR">:</span>
                                                        </p>
                                                    </div>

                                                    <div class="col-md-3 col-sm-6 col-xs-6">
                                                        <p>${project.paymentDetailsModel.paymentToken}</p>
                                                    </div>


                                                    <%-- <div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Bank Name<span class="space_LR">:</span></p></div>
     <div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.auditedBalSheetYear2.documentId}'>${project.projectDocModel.auditedBalSheetYear2.fileName }</a>
                                                        </p>
                                                </div>
                                                --%>
                                        </div>



                                        <div class="row">
                                            <div class="col-md-3 col-sm-6 col-xs-6">
                                                <p class="text-right">
                                                    Amount<span class="space_LR">:</span>
                                                </p>
                                            </div>
                                            <div class="col-md-3 col-sm-6 col-xs-6">
                                                <p>${project.paymentDetailsModel.amount}</p>
                                            </div>
                                            <div class="col-md-3 col-sm-6 col-xs-6">
                                                <p class="text-right">
                                                    Khajane2 Challan Number<span class="space_LR">:</span>
                                                </p>
                                            </div>
                                            <div class="col-md-3 col-sm-6 col-xs-6">
                                                <p>${project.paymentDetailsModel.sbiTransactionRefNo}</p>
                                            </div>
                                        </div>


                                        <div class="row">
                                            <div class="col-md-3 col-sm-6 col-xs-6">
                                                <p class="text-right">
                                                    <span class="space_LR">:</span>
                                                </p>
                                            </div>
                                            <div class="col-md-3 col-sm-6 col-xs-6">
                                                <p></p>
                                            </div>
                                            <div class="col-md-3 col-sm-6 col-xs-6">
                                                <p class="text-right">
                                                    Online Payment Receipt<span class="space_LR">:</span>
                                                </p>
                                            </div>
                                            <div class="col-md-3 col-sm-6 col-xs-6">
                                                <p>
                                                    <a href='<%=request.getContextPath() %>/download?DOC_ID=${project.paymentDetailsModel.scanCopyDoc.documentId}'>${project.paymentDetailsModel.scanCopyDoc.fileName}
											</a>
                                                </p>
                                            </div>

                                        </div>
                                        </c:if>


                                        <c:if test="${project.paymentDetailsModel.paymentMode=='Payment Gateway'}">

                                            <div class="row">
                                                <div class="col-md-3 col-sm-6 col-xs-6">
                                                    <p class="text-right">
                                                        Payment Mode<span class="space_LR">:</span>
                                                    </p>
                                                </div>
                                                <div class="col-md-3 col-sm-6 col-xs-6">
                                                    <p>Payment Gateway</p>
                                                </div>
                                                <div class="col-md-3 col-sm-6 col-xs-6">
                                                    <p class="text-right">
                                                        Amount<span class="space_LR">:</span>
                                                    </p>
                                                </div>
                                                <div class="col-md-3 col-sm-6 col-xs-6">
                                                    <p>${project.paymentDetailsModel.amount}</p>
                                                </div>
                                            </div>


                                            <div class="row">
                                                <div class="col-md-3 col-sm-6 col-xs-6">
                                                    <p class="text-right">
                                                        Payment Through<span class="space_LR">:</span>
                                                    </p>
                                                </div>
                                                <div class="col-md-3 col-sm-6 col-xs-6">
                                                    <p>${project.paymentDetailsModel.online.mode}</p>
                                                </div>

                                                <div class="col-md-3 col-sm-6 col-xs-6">
                                                    <p class="text-right">
                                                        Transaction No.<span class="space_LR">:</span>
                                                    </p>
                                                </div>
                                                <div class="col-md-3 col-sm-6 col-xs-6">
                                                    <p>${project.paymentDetailsModel.online.transactionNo}</p>
                                                </div>

                                            </div>


                                        </c:if>

                                    </div>
                                </div>

                                <div class="inner_wrapper">


                                    <h1>
                                        Penalty <span> Details </span>
                                    </h1>
                                    <div class="drop_shadow"></div>

                                    <div class="row">
                                        <div class="col-md-3 col-sm-6 col-xs-6">
                                            <p class="text-right">
                                                Penalty Paid<span class="space_LR">:</span>
                                            </p>
                                        </div>
                                        <div class="col-md-3 col-sm-6 col-xs-6">
                                            <p>${project.paymentDetailsModel.penaltyPaid}</p>
                                        </div>

                                        <div class="col-md-3 col-sm-6 col-xs-6">
                                            <p class="text-right">
                                                Penalty Amount<span class="space_LR">:</span>
                                            </p>
                                        </div>
                                        <div class="col-md-3 col-sm-6 col-xs-6">
                                            <p>${project.paymentDetailsModel.penaltyAmt}</p>
                                        </div>

                                        <div class="col-md-3 col-sm-6 col-xs-6">
                                            <p class="text-right">
                                                Penalty Paid Receipt<span class="space_LR">:</span>
                                            </p>
                                        </div>
                                        <div class="col-md-3 col-sm-6 col-xs-6">
                                            <p>${project.paymentDetailsModel.penaltyPaidReceipt}</p>
                                        </div>

                                    </div>


                                </div>




                            </div>



                            <br>
                            <table id="remarksTable" border="2">
                                <tr>
                                    <th style="width:33%" colspan="3">Reviewer Remarks</th>
                                    <th style="width:33%" colspan="2">Secretary Remaks</th>
                                    <th style="width:33%" colspan="2">Chairman Remaks</th>
                                </tr>
                                <tr>
                                    <th>Section</th>
                                    <th>Date</th>
                                    <th>Remarks</th>
                                    <th>Date</th>
                                    <th>Remarks</th>
                                    <th>Date</th>
                                    <th>Remarks</th>
                                </tr>
                                <c:forEach items="${project.projectRemarks.remarksList}" var="remarks">
                                    <tr>
                                        <td>Account</td>
                                        <td>${remarks.oprAccRemarkDateStr }</td>
                                        <td>${remarks.accountsOprRemarks}</td>
                                        <td>${remarks.authRemarkDateStr }</td>
                                        <td>
                                            ${remarks.accountsAuthRemarks }
                                        </td>
                                        <td>${remarks.supRemarkDateStr }</td>
                                        <td>
                                            <c:if test="${remarks.status!='NEW'}">
                                                ${remarks.accountsSupRemarks }
                                            </c:if>
                                            <c:if test="${remarks.status=='NEW'}">
                                                <textarea name="accountsSupRemarks" class="authremarks">${remarks.accountsSupRemarks}</textarea>
                                            </c:if>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Revenue</td>
                                        <td>${remarks.oprRevRemarkDateStr }</td>
                                        <td>${remarks.revenueOprRemarks }</td>
                                        <td>${remarks.authRemarkDateStr }</td>
                                        <td>
                                            ${remarks.revenueAuthRemarks }
                                        </td>
                                        <td>${remarks.supRemarkDateStr }</td>
                                        <td>
                                            <c:if test="${remarks.status!='NEW'}">
                                                ${remarks.revenueSupRemarks }
                                            </c:if>
                                            <c:if test="${remarks.status=='NEW'}">
                                                <textarea name="revenueSupRemarks" class="authremarks">${remarks.revenueSupRemarks}</textarea>
                                            </c:if>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>TCP</td>
                                        <td>${remarks.oprTcpRemarkDateStr }</td>
                                        <td>${remarks.tcpOprRemarks }</td>

                                        <td>${remarks.authRemarkDateStr }</td>
                                        <td>
                                            ${remarks.tcpAuthRemarks }
                                        </td>
                                        <td>${remarks.supRemarkDateStr }</td>
                                        <td>
                                            <c:if test="${remarks.status!='NEW'}">
                                                ${remarks.tcpSupRemarks }
                                            </c:if>
                                            <c:if test="${remarks.status=='NEW'}">
                                                <textarea name="tcpSupRemarks" class="authremarks">${remarks.tcpSupRemarks}</textarea>
                                            </c:if>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Engineer</td>
                                        <td>${remarks.oprEnggRemarkDateStr }</td>
                                        <td>${remarks.enggOprRemarks }</td>
                                        <td>${remarks.authRemarkDateStr }</td>
                                        <td>
                                            ${remarks.enggAuthRemarks }
                                        </td>
                                        <td>${remarks.supRemarkDateStr }</td>
                                        <td>
                                            <c:if test="${remarks.status!='NEW'}">
                                                ${remarks.enggSupRemarks }
                                            </c:if>
                                            <c:if test="${remarks.status=='NEW'}">
                                                <textarea name="enggSupRemarks" class="authremarks">${remarks.enggSupRemarks}</textarea>
                                            </c:if>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </table>

                            <c:if test="${project.status!='APPROVED'}">




                                <%-- <form name="trxForm" autocomplete="off" action="revokeProjectRegistration" method="post"> --%>
                                    <form name="approvalForm" autocomplete="off" action="approveProject" method="post">
                                        <input type='hidden' name='PROJECT_ID' value="${project.projectRegId }" /> <input type='hidden' name='STATUS' /> <br /> <br /> <br /> <br />
                                        <div class="button-wrapper">


                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input name="btn1" class="btn-style" value="Move to Approval Queue" type="button"
                                    onclick="submitTrxForm('PREPARE_APPROVAL')" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <input name="btn1" class="btn-style" id="editDocButton" value="Reject" type="button" data-toggle="modal" data-target="#rejectModal" />


                                            <c:if test="${project.status!='PENDING_OPERATOR'}">
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input name="btn1" class="btn-style" value="Return" type="button" onclick="submitTrxForm('RETURN')" />
                                            </c:if>

                                        </div>



                                    </form>
                            </c:if>
                            <c:if test="${project.status=='APPROVED'}">


                                <form name="trxForm" autocomplete="off" action="revokeProjectRegistration" method="post">
                                    <%=ReraSecurity.writeToken(request)%>
                                        <input type='hidden' name='PROJECT_ID' value="${project.projectRegId }" />
                                        <div class="form-group">
                                            <label for="inputEmail3" class="col-sm-3 control-label">
								Reason: </label>
                                            <div class="col-sm-3">
                                                <textarea name="REASON" class="form-control input-sm requiredValFld"></textarea>
                                                <span class='requiredValFldMsg'> Please enter your
									reason.</span>
                                            </div>



                                        </div>
                                        <br /> <br /> <br /> <br />
                                        <div class="button-wrapper">


                                            <!-- editAgentUploadDoc -->
                                            <input name="btn1" class="btn-style" id="editDocButton" value="Revoke Registration" type="button" onclick="revokeRegistration()" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <!--  input name="btn1"
								class="btn-style" value="Enquiry" type="button" / -->
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <a target="_blank" href="<%= request.getContextPath()%>/projectCert?PID=${project.projectRegId}">
                                                <input name="btn1" class="btn-style" value="View Certificate" type="button" />
                                            </a>
                                        </div>





                                </form>
                            </c:if>





                        </div>
                        <!--inner container end here-->





                    </div>

                </div>




                <!-- container end here-->

                </div>
                <!--inner container end here-->
                <script>
                    function revokeRegistration() {

                        if (document.trxForm.REASON.value != '') {
                            if (confirm('Are you sure to revoke this registration?')) {
                                document.trxForm.submit();
                            }
                        } else {
                            alert('Please enter reason.');
                        }
                    }

                    function submitTrxForm(_out) {
                        document.approvalForm.STATUS.value = _out;

                        if (_out == 'APPROVED') {
                            if (confirm('Are you sure that you want to approve this application?')) {
                             
                            	if(_out =="PREPARE_APPROVAL"){
                            		document.approvalForm.action="prepareProjectRegistrationApproval";
                            	}  
                            	document.approvalForm.submit();

                            }
                        } else if (_out == 'RETURN') {
                            if (confirm('Are you sure that you want to Return this application?')) {
                                document.approvalForm.action = "approveProjectRegistration";
                                document.approvalForm.submit();

                            }
                        }

                        if (_out == 'REJECTED') {
                            if (confirm('Do you want to reject this application?')) {
                                document.rejectForm.submit();

                            }
                        }
                    }
                </script>

                <div class="pop_main">

                    <div class="modal fade" id="rejectModal" role="dialog">
                        <div class="modal-dialog">

                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header">

                                    <button type="button" class="close" data-dismiss="modal">&times;</button>

                                </div>
                                <div class="modal-body">

                                    <form class="form-horizontal" action="rejectProjectRegistration" autocomplete="off" id="rejectForm" method="post" name='rejectForm'>
                                        <%=ReraSecurity.writeToken(request)%>
                                            <input type="hidden" name="projectId" value="${project.projectRegId}">
                                            <div class="inner_wrapper">







                                                <br> <br>

                                                <h1>
                                                    Details of the <span>Rejection</span>
                                                </h1>
                                                <div class="drop_shadow"></div>
                                                <div class="clearfix"></div>


                                                <div class="form-group">
                                                    <label for="inputEmail3" class="col-sm-3 control-label">
									Subject <sup>*</sup>
								</label>
                                                    <div class="col-sm-6">
                                                        <input type="text" name="rejectSubject" value="RERA Karnataka: Rejected -  ${project.projectDetailsModel.projectName} Ack Number : ${project.applicationNo }" class="form-control input-sm" maxlength="200" />
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label for="inputEmail3" class="col-sm-3 control-label">Reason<sup>*</sup>
								</label>
                                                    <div class="col-sm-6">

                                                        <div>
                                                            <textarea id="reasonForRejection" rows="7" class="form-control requiredValFld input-sm" name="reasonForRejection"> 
					 		    	</textarea>
                                                        </div>

                                                        <%--       <div hidden id="showId2" >
						        	<textarea id="textareaId2"  name="summary" rows="7"
										class="form-control requiredValFld input-sm"> 
										 <c:out value="${template[1].templateContent}" />;
									 </textarea>  
									</div> --%>
                                                            <span class='requiredValFldMsg'> Please enter Rejection
										details</span>
                                                    </div>
                                                    <!--
                                                            <div class="col-md-3">
                                                                <c:forEach items="${template}" var="tempText">
                                                                    <input type="radio" name="re" value="v1" onclick="templateFun(${tempText.templateId})"> ${tempText.templateText} <br>
                                                                </c:forEach>
                                                            </div>
-->
                                                </div>

                                            </div>

                                            <div class="button-wrapper">
                                                <input name="btn3" class="btn-style" value="Reject" type="button" onclick="submitTrxForm('REJECTED')" />
                                                <button type="button" class="close" data-dismiss="modal">Close</button>
                                            </div>
                                </div>

                                </form>

                            </div>

                        </div>
                    </div>
                </div>