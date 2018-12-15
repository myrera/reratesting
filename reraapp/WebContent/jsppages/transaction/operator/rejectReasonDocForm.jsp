<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
    <%@page import="in.gov.rera.common.util.DateUtil"%>
        <%@page import="in.gov.rera.common.security.ReraSecurity"%>
            <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
                <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
                    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

                        <head>
                            <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
                            <script src="<%=request.getContextPath()%>/resources/projectjs/projectJs.js"></script>
                            <style>
                                .dash_detail_grid .table-responsive {
                                    margin-top: 25px;
                                    width: 750px;
                                    left: 50px;
                                    text-align: center;
                                    font-size: 16px !important;
                                    position: relative;
                                }
                                
                                .dash_detail_grid table th {
                                    background-color: #b3b3b3;
                                    border-color: #992400;
                                    border: 2px !important;
                                    text-align: center;
                                    font-size: 16px;
                                    padding: 8px;
                                    font-weight: 600;
                                    text-transform: uppercase;
                                    color: #676767;
                                }
                                
                                .dash_detail_grid table td {
                                    border-color: #992400;
                                    border-width: 2px;
                                    color: #676767;
                                    font-size: 14px;
                                    background-color: #fff;
                                    padding: 8px;
                                }
                            </style>
                        </head>


                        <style>
                            table td {
                                border-top: none !important;
                            }
                        </style>

                        <script>
                            //penaltyAmtDIV

                            function showhideflds(sel) {

                                if (sel.value == 'Yes') {
                                    $('#penaltyAmtDIV').show();
                                } else {
                                    $('#penaltyAmtDIV').hide();
                                }

                            }

                            function submitfrm() {

                                var ckeckboxIs = document.getElementById("checkboxId").checked;

                                if (ckeckboxIs) {
                                    var _frm = $('#trxForm');
                                    if (validateForm(_frm)) {
                                        alert("Project Details Updated Successfully.");
                                        $(_frm).submit();
                                    }
                                } else {
                                    alert("Please Accept The Declaration.");
                                }

                            }
                        </script>


                        <form:form class="form-horizontal" id="trxForm" action="saveUploadProjectDoc" enctype="multipart/form-data" autocomplete="off" method="post">
                            <%=ReraSecurity.writeToken(request) %>
                                <input type="hidden" name="projectDocModel.docId" value="0" />

                                <input type="hidden" name="projectId" value="0" />



                                <div class="breadcrumb">Home / Real Estate Project Registration</div>



                                <div class="container"></div>

                                <!--News Ticker-->
                                <div class="container">

                                    <!--main container start here-->
                                    <div class="Main_containner">
                                        <div class="inner_wrapper">

                                            <h1>
                                                Reject Reason <span> Document </span>
                                            </h1>
                                            <div class="drop_shadow"></div>


                                            <div class="row">



                                                <p>
                                                    <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Please attach the Reject Reason Doc for - <span>${projectName}</span> - <span> ${projectId}</span><sup>*</sup> :</label>
                                                </p>

                                                <div class="col-md-3 col-sm-6 col-xs-6">
                                                    <input type="file" class="form-control thirtyMBsizefile" rel="txtTooltip" title="Only image or pdf file is allowed." data-toggle="tooltip" data-placement="bottom" id="declarationFormb" name="otherFileDoc" />
                                                    <span class='requiredValFldMsg'> Please select Reject Reason Document.</span>
                                                    <input type="hidden" name="fieldName" value="rejectReasonDoc" />
                                                    <input type="hidden" name="flg" value="0" />
                                                </div>


                                            </div>

                                        </div>

                                    </div>
                                </div>
                                <!-- container end here-->


                        </form:form>

                        <div class="button-wrapper">
                            <input name="btn1" class="btn-style" value="Submit" onclick="nextProjectPaymentForm()" type="button">
                        </div>


                        <script>
                        </script>