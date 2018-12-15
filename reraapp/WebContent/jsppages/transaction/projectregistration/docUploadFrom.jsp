<%@page import="in.gov.rera.common.security.ReraSecurity"%>
<%@page import="in.gov.rera.common.util.DateUtil"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script
	src="<%=request.getContextPath()%>/resources/projectjs/projectJs.js"></script>
<style>

.dash_detail_grid .table-responsive {margin-top:25px;width:750px; left:50px; text-align:center; font-size:16px !important;
 position: relative;  }
.dash_detail_grid table th{ background-color:#b3b3b3;border-color:#992400; border: 2px !important; text-align: center;
font-size: 16px; padding: 8px; 
font-weight:600; text-transform: uppercase; color: #676767;}
.dash_detail_grid table td{ border-color:#992400; border-width:2px; color:#676767; font-size: 14px; 
background-color:#fff; padding: 8px; }
</style>
</head>
<body>

	<div class="breadcrumb">Home / Real Estate Project Registration</div>

	<div class="container">

		<div class="stepwizard col-md-offset-1 ">
			<div class="stepwizard-row setup-panel">


				<div class="stepwizard-step fill">
					<a href="#step-1" type="button" class="btn btn-success btn-circle">1</a>
					<p>Promoter Detail</p>
				</div>




				<div class="stepwizard-step fill">
					<a href="#step-2" type="button" class="btn btn-success btn-circle">2</a>
					<p>Project Detail</p>
				</div>



				<div class="stepwizard-step blank">
					<a href="#step-3" type="button" class="btn btn-success btn-circle">3</a>
					<p>Upload Documents</p>
				</div>



				<div class="stepwizard-step blank">
					<a href="#step-3" type="button" class="btn btn-default btn-circle"
						disabled="disabled">4</a>
					<p>Payment</p>
				</div>


				<div class="stepwizard-step">
					<a href="#step-3" type="button" class="btn btn-default btn-circle"
						disabled="disabled">5</a>
					<p>Confirmation</p>
				</div>


			</div>
		</div>


	</div>
	<!--News Ticker-->
	<div class="container">

		<!--main container start here-->
		<div class="Main_containner">

			<!--Inner wrapper stsrt here-->
			<div class="inner_wrapper upload">



				<h1>
					Upload <span> Documents</span>
				</h1>
				<div class="border">
					<div class="orange"></div>
					<div class="black"></div>
				</div>


				<form class="form-horizontal" id="trxForm" action="saveUploadProjectDoc" enctype="multipart/form-data" autocomplete="off" method="post">
<%=ReraSecurity.writeToken(request) %>
                     <input type="hidden" name="projectDocModel.docId" value="0"/>
                     <br/>
					<div class="drop_shadow">
						
						</div>
						
						<div>Note:- In case of non availability of financial documents due to total number of financial years of establishment being less than three years, the entity can upload
						 a blank document with <b>"NOT APPLICABLE with appropriate reason"</b> text against relevant/respective year column and upload & submit available documents only. </div>
                  					<table class="table table-responsive table-bordered"> 
					     <tr>
					        <th>Year</th>
					        <th><%=DateUtil.getYearBack(1) %></th>
					        <th><%=DateUtil.getYearBack(2) %></th>
					        <th><%=DateUtil.getYearBack(3) %></th>
					        
					       
					     </tr>
					  <tr>
					  
					     <td>Balance Sheet <sup style="color:red;">*</sup></td>
					     <td>
					     <input type="file" class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="auditedBalFile" name="otherFileDoc" />
							<span class='requiredValFldMsg'> Please select Balance Sheet.</span>
							<input type="hidden" name="fieldName" value="auditedBalSheetDoc1"/>
							
					     </td>
					     <td><input type="file" class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom" id="auditedBalFile" name="otherFileDoc" />
							<span class='requiredValFldMsg'> Please select Balance Sheet.</span>
							<input type="hidden" name="fieldName" value="auditedBalSheetDoc2"/>
							</td>
					     <td><input type="file" class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom" id="auditedBalFile" name="otherFileDoc" />
							<span class='requiredValFldMsg'> Please select Balance Sheet.</span>
							<input type="hidden" name="fieldName" value="auditedBalSheetDoc3"/>
							
							</td>
					     
					    
					  </tr>
					  
					  <tr>
					    <td>Audited Profit and Loss Statement<sup style="color:red;">*</sup></td>
					      
					     <td>
					     <input type="file" class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="auditedBalFile" name="otherFileDoc" />
							<span class='requiredValFldMsg'> Please select Audited ProfitLoss Statement.</span>
							<input type="hidden" name="fieldName" value="auditedProfitLossSheetDoc1"/>
							
					     </td>
					     <td><input type="file" class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom" id="auditedBalFile" name="otherFileDoc" />
							<span class='requiredValFldMsg'> Please select Audited ProfitLoss Statement.</span>
							<input type="hidden" name="fieldName" value="auditedProfitLossSheetDoc2"/>
							</td>
					     <td><input type="file" class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom" id="auditedBalFile" name="otherFileDoc" />
							<span class='requiredValFldMsg'> Please select Audited ProfitLoss Statement.</span>
							<input type="hidden" name="fieldName" value="auditedProfitLossSheetDoc3"/>
							</td>
					  
					  </tr>
					  
					  
					   <tr>
					    <td>Director's Report<sup style="color:red;">*</sup></td>
					      
					     <td>
					     <input type="file" class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="auditedBalFile" name="otherFileDoc" />
							<span class='requiredValFldMsg'> Please select Director's Report.</span>
							<input type="hidden" name="fieldName" value="directorReportDoc1"/>
							
					     </td>
					     <td><input type="file" class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom" id="auditedBalFile" name="otherFileDoc" />
							<span class='requiredValFldMsg'> Please select Director's Report.</span>
							<input type="hidden" name="fieldName" value="directorReportDoc2"/>
							</td>
					     <td><input type="file" class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom" id="auditedBalFile" name="otherFileDoc" />
							<span class='requiredValFldMsg'> Please select Director's Report.</span>
							<input type="hidden" name="fieldName" value="directorReportDoc3"/>
							</td>
					  
					  </tr>
					  
					  
					  
					  
					  
					  <tr>
					    <td>Cash Flow Statement<sup style="color:red;">*</sup> </td>
					      
					     <td>
					     <input type="file" class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="auditedBalFile" name="otherFileDoc" />
							<span class='requiredValFldMsg'> Please select Cash Flow Statement.</span>
							<input type="hidden" name="fieldName" value="cashFlowStmtFileDoc1"/>
							
					     </td>
					     <td><input type="file" class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom" id="auditedBalFile" name="otherFileDoc" />
							<span class='requiredValFldMsg'> Please select Cash Flow Statement.</span>
							<input type="hidden" name="fieldName" value="cashFlowStmtFileDoc2"/>
							</td>
					     <td><input type="file" class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom" id="auditedBalFile" name="otherFileDoc" />
							<span class='requiredValFldMsg'> Please select Cash Flow Statement.</span>
							<input type="hidden" name="fieldName" value="cashFlowStmtFileDoc3"/>
							</td>
					  
					  </tr>
					  
					    
					  <tr>
					    <td>Auditor's Report<sup style="color:red;">*</sup> </td>
					      
					     <td>
					     <input type="file" class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="auditedBalFile" name="otherFileDoc" />
							<span class='requiredValFldMsg'> Please select Auditor Reports.</span>
							<input type="hidden" name="fieldName" value="auditorsDoc1"/>
							
					     </td>
					     <td><input type="file" class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom" id="auditedBalFile" name="otherFileDoc" />
							<span class='requiredValFldMsg'> Please select Auditor Reports.</span>
							<input type="hidden" name="fieldName" value="auditorsDoc2"/>
							</td>
					     <td><input type="file" class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom" id="auditedBalFile" name="otherFileDoc" />
							<span class='requiredValFldMsg'> Please select Auditor Reports.</span>
							<input type="hidden" name="fieldName" value="auditorsDoc3"/>
							</td>
					  
					  </tr>
					    
					  <tr>
					    <td>Income Tax Return Acknowledgement<sup style="color:red;">*</sup> </td>
					      
					     <td>
					     <input type="file" class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="auditedBalFile" name="otherFileDoc" />
							<span class='requiredValFldMsg'> Please select Income Tax Return Acknowledgement.</span>
							<input type="hidden" name="fieldName" value="incomeTaxReturn1"/>
							
					     </td>
					     <td><input type="file" class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom" id="auditedBalFile" name="otherFileDoc" />
							<span class='requiredValFldMsg'> Please select Income tax Return Acknowledgement.</span>
							<input type="hidden" name="fieldName" value="incomeTaxReturn2"/>
							</td>
					     <td><input type="file" class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom" id="auditedBalFile" name="otherFileDoc" />
							<span class='requiredValFldMsg'> Please select Income tax Return Acknowledgement.</span>
							<input type="hidden" name="fieldName" value="incomeTaxReturn3"/>
							</td>
					  
					  </tr>
					</table>
					<div class="drop_shadow">
						
						</div>
						
						
						
					<table class="table table-responsive table-bordered"> 
					
					
					 <tr>
					    <td>PAN Card<sup style="color:red;">*</sup> </td>
					      
					     <td>
					     <input type="file" class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="panCardFile" name="otherFileDoc"/>
							<span class='requiredValFldMsg'> Please select Pan Card.</span>
							<input type="hidden" name="fieldName" value="panCardDoc"/>
								<input type="hidden" name="flg"value="0"/>
					     </td>
					     <td>Encumbrance Certificate<sup style="color:red;">*</sup> </td>
					      <td>
					    <input type="file" class="form-control requiredValFld fiveMBsizefile" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 5 MB" data-toggle="tooltip" data-placement="bottom"  id="panCardFile" name="otherFileDoc"/>
							<span class='requiredValFldMsg'> Please select Encumbrance Certificate.</span>
							<input type="hidden" name="fieldName" value="encumbranceCertificateDoc"/>
							<input type="hidden" name="flg"value="0"/>
					     </td>
					    
					  </tr>
					  
					  
					   <tr>
					    <td>Commencement Certificate<sup style="color:red;">*</sup> </td>
					      
					     <td>
					     <input type="file" class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="commencementCertFile" name="otherFileDoc"/>
							<span class='requiredValFldMsg'> Please select Commencement Certificate.</span>
							<input type="hidden" name="fieldName" value="commencementCertDoc"/>
					     </td>
					     <td>Approved Building/Plotting Plan<sup style="color:red;">*</sup> </td>
					      <td>
					   <input type="file" class="form-control requiredValFld fiveMBsizefile" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 5 MB" data-toggle="tooltip" data-placement="bottom"  id="approvedSanctionPlanFile" name="otherFileDoc"/>
							<span class='requiredValFldMsg'> Please select Approved Building/Plotting Plan.</span>
							<input type="hidden" name="fieldName" value="approveSacPlanDoc"/>
					     </td>
					    
					  </tr>
					
					  <tr>
					     <td>Approved Layout Plan<sup style="color:red;">*</sup> </td>
					      <td>
					   <input type="file" class="form-control requiredValFld fiftyMBsizefile" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 50 MB" data-toggle="tooltip" data-placement="bottom"  id="approvedSanctionPlanFile" name="otherFileDoc"/>
							<span class='requiredValFldMsg'> Please select Approved layout Plan.</span>
							<input type="hidden" name="fieldName" value="approveLayoutPlanDoc"/>
					     </td>
					     
					     
					     <td>Proforma of Agreement for Sale<sup style="color:red;">*</sup> </td>
					      <td>
					   <input type="file" class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="performaForSaleOfAgreement" name="otherFileDoc"/>
							<span class='requiredValFldMsg'> Please select Proforma of Agreement for Sale.</span>
							<input type="hidden" name="fieldName" value="performaForSaleOfAgreement"/>
					     </td>
					    
					  </tr>
			<c:if test="${projectRegistrationModel.projectDetailsModel.isSubSqChangeInPlan=='Yes' }">		  
					    <tr>
					    <td>Existing  Layout Plan<sup style="color:red;">*</sup> </td>
					      
					     <td>
					    <input type="file" class="form-control requiredValFld thirtyMBsizefile" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 30 MB" data-toggle="tooltip" data-placement="bottom"  id="approvedLayoutPlanFile" name="otherFileDoc"/>
							<span class='requiredValFldMsg'> Please select Existing  Layout Plan.</span>
							<input type="hidden" name="fieldName" value="extendedLayoutPlanDoc"/>
					     </td>
					     <td>Existing Section Plan and Specification<sup style="color:red;">*</sup> </td>
					      <td>
					  <input type="file" class="form-control requiredValFld thirtyMBsizefile" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 30 MB" data-toggle="tooltip" data-placement="bottom"  id="performaForSaleOfAgreement" name="otherFileDoc"/>
							<span class='requiredValFldMsg'> Please select Existing Section Plan and Specification.</span>
							<input type="hidden" name="fieldName" value="extendedSacPlanDoc"/>
					     </td>
					    
					  </tr>
					</c:if>
					
					<tr>
					    <td>Sale Deed & RTC<sup style="color:red;">*</sup> </td>
					      
					     <td>
					   <input type="file" class="form-control requiredValFld thirtyMBsizefile" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 30 MB" data-toggle="tooltip" data-placement="bottom"  id="landDocumentsFile" name="otherFileDoc"/>
							<span class='requiredValFldMsg tenMBsizefile'> Please select Land Documents & Location.</span>
							<input type="hidden" name="fieldName" value="landLocationFileDoc"/>
					     </td>
					     <td>Approved Section Of Building/Infrastructure Plan of Plotting<sup style="color:red;">*</sup> </td>
					      <td>
					<input type="file" class="form-control requiredValFld fiveMBsizefile" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 5 MB" data-toggle="tooltip" data-placement="bottom"  id="sanctionedLayoutPlan" name="otherFileDoc"/>
							<span class='requiredValFldMsg'> Please select Approved Section Of Building/Infrastructure Plan of Plotting.</span>
							<input type="hidden" name="fieldName" value="sanctionedLayoutPlanDoc"/>
					     </td>
					    
					  </tr>
					
					<tr>
					    <td>Area Development Plan Of Project Area<sup style="color:red;">*</sup> </td>
					      
					     <td>
					  <input type="file" class="form-control requiredValFld fiveMBsizefile" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 5 MB" data-toggle="tooltip" data-placement="bottom"  id="areaDevelopmentPlanFile" name="otherFileDoc"/>
							<span class='requiredValFldMsg'> Please select Area Development Plan Of Project Area.</span>
							<input type="hidden" name="fieldName" value="areaDevelopmentDoc"/>
					     </td>
					     <td>Proforma of Allotment Letter<sup style="color:red;">*</sup> </td>
					      <td>
					<input type="file" class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="performaOfAllotmentLetterFile" name="otherFileDoc"/>
							<span class='requiredValFldMsg'> Please select Proforma of Allotment.</span>
							<input type="hidden" name="fieldName" value="performaOfAllotmentLetterDoc"/>
					     </td>
					    
					  </tr>
					
					<tr>
					    <td>Brochure of Current<sup style="color:red;">*</sup> </td>
					      
					     <td>
					 <input type="file" class="form-control requiredValFld fiveMBsizefile" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 5 MB" data-toggle="tooltip" data-placement="bottom"  id="brochureOfCurrentProjectFile" name="otherFileDoc"/>
							<span class='requiredValFldMsg'> Please select Brochure og Current Project.</span>
							<input type="hidden" name="fieldName" value="brochureOfCurrentProjectDoc"/>
					     </td>
					     <td>Proforma For Sale Deed<sup style="color:red;">*</sup> </td>
					      <td>
					<input type="file" class="form-control requiredValFld fiveMBsizefile" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 5 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<span class='requiredValFldMsg'> Please select Proforma For Sale Deed .</span>
							<input type="hidden" name="fieldName" value="agreementFileDoc"/>
					     </td>
					    
					  </tr>
					  
					  <tr>
					    <td>Project Specification<sup style="color:red;">*</sup> </td>
					      
					     <td>
					 <input type="file" class="form-control requiredValFld" rel="txtTooltip" title="Type of structure, Flooring, Door Windows, Plumbing & Sanitary Wear, Fire, Lift & Capacity, etc Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="brochureOfCurrentProjectFile" name="otherFileDoc"/>
							<span class='requiredValFldMsg'> Please select Project Specification Document.</span>
							<input type="hidden" name="fieldName" value="projectSpecificDoc"/>
					     </td>
					     <td>Collaboration Agreement/Development Agreement/Joint Development Agreement/Other Agreement<sup style="color:red;">*</sup> </td>
					      <td>
					<input type="file" class="form-control requiredValFld thirtyMBsizefile" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 30 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<span class='requiredValFldMsg'> Please select Joint Development Agreement.</span>
							<input type="hidden" name="fieldName" value="jointDevelopmentAgreement"/>
					     </td>
					    
					  </tr>
					
					
					</table> 
						
					   
					<!-- <div class="form-group">
						<label class="col-sm-3 control-label">PAN Card<sup>*</sup></label>
						<div class="col-sm-3">
							<input type="file" class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="panCardFile" name="otherFileDoc"/>
							<span class='requiredValFldMsg'> Please select Pan Card.</span>
							<input type="hidden" name="fieldName" value="panCardDoc"/>
							<input type="hidden" name="flg"value="0"/>
			
						</div>
						
						<label for="inputEmail3" class="col-sm-2 control-label"> Encumbrance Certificate<sup>*</sup>
							</label>
						<div class="col-sm-3">
						<input type="file" class="form-control requiredValFld bigsizefile" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 5 MB" data-toggle="tooltip" data-placement="bottom"  id="panCardFile" name="otherFileDoc"/>
							<span class='requiredValFldMsg'> Please select Encumbrance Certificate.</span>
							<input type="hidden" name="fieldName" value="encumbranceCertificateDoc"/>
							<input type="hidden" name="flg"value="0"/>
			
						
					    </div>


					</div> -->
					
					
					

					<!-- <div class="form-group">
						<label class="col-sm-3 control-label">Commencement
							Certificate<sup>*</sup></label>
						<div class="col-sm-3">
							<input type="file" class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="commencementCertFile" name="otherFileDoc"/>
							<span class='requiredValFldMsg'> Please select Commencement Certificate.</span>
							<input type="hidden" name="fieldName" value="commencementCertDoc"/>
						</div>
						<label for="inputEmail3" class="col-sm-2 control-label">Approved Building/Plotting Plan<sup>*</sup></label>
						<div class="col-sm-3">
							<input type="file" class="form-control requiredValFld bigsizefile" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 5 MB" data-toggle="tooltip" data-placement="bottom"  id="approvedSanctionPlanFile" name="otherFileDoc"/>
							<span class='requiredValFldMsg'> Please select Approved Building/Plotting Plan.</span>
							<input type="hidden" name="fieldName" value="approveSacPlanDoc"/>
						</div>


					</div> -->


					<!-- <div class="form-group">
						<label class="col-sm-3 control-label">Approved Layout Plan<sup>*</sup></label>
						<div class="col-sm-3">
							<input type="file" class="form-control requiredValFld bigsizefile" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 5 MB" data-toggle="tooltip" data-placement="bottom"  id="approvedLayoutPlanFile" name="otherFileDoc"/>
							<span class='requiredValFldMsg'> Please select Approved layout Plan.</span>
							<input type="hidden" name="fieldName" value="approveLayoutPlanDoc"/>
							
						</div>
						<label for="inputEmail3" class="col-sm-2 control-label">Proforma of Agreement for Sale<sup>*</sup></label>
						<div class="col-sm-3">
							<input type="file" class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="performaForSaleOfAgreement" name="otherFileDoc"/>
							<span class='requiredValFldMsg'> Please select Proforma of Agreement for Sale.</span>
							<input type="hidden" name="fieldName" value="performaForSaleOfAgreement"/>
						</div>


					</div>
 -->

<%-- <c:if test="${projectRegistrationModel.projectDetailsModel.isSubSqChangeInPlan=='Yes' }">
		<div class="form-group">
						<label class="col-sm-3 control-label">Existing  Layout Plan<sup>*</sup></label>
						<div class="col-sm-3">
							<input type="file" class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="approvedLayoutPlanFile" name="otherFileDoc"/>
							<span class='requiredValFldMsg'> Please select Existing  Layout Plan.</span>
							<input type="hidden" name="fieldName" value="extendedLayoutPlanDoc"/>
							
						</div>
						<label for="inputEmail3" class="col-sm-2 control-label">Existing Section Plan and Specification <sup>*</sup></label>
						<div class="col-sm-3">
							<input type="file" class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 10 MB" data-toggle="tooltip" data-placement="bottom"  id="performaForSaleOfAgreement" name="otherFileDoc"/>
							<span class='requiredValFldMsg'> Please select Existing Section Plan and Specification.</span>
							<input type="hidden" name="fieldName" value="extendedSacPlanDoc"/>
						</div>


					</div>
</c:if>	 --%>

					<!-- <div class="form-group">
						<label class="col-sm-3 control-label">Land documents &
							Location<sup>*</sup></label>
						<div class="col-sm-3">
							<input type="file" class="form-control requiredValFld tenMBsizefile" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 10 MB" data-toggle="tooltip" data-placement="bottom"  id="landDocumentsFile" name="otherFileDoc"/>
							<span class='requiredValFldMsg tenMBsizefile'> Please select Land Documents & Location.</span>
							<input type="hidden" name="fieldName" value="landLocationFileDoc"/>
						</div>
						<label for="inputEmail3" class="col-sm-2 control-label">Approved Section Of Building/Infrastructure Plan of Plotting<sup>*</sup></label>
						<div class="col-sm-3">
							<input type="file" class="form-control requiredValFld bigsizefile" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 5 MB" data-toggle="tooltip" data-placement="bottom"  id="sanctionedLayoutPlan" name="otherFileDoc"/>
							<span class='requiredValFldMsg'> Please select Approved Section Of Building/Infrastructure Plan of Plotting.</span>
							<input type="hidden" name="fieldName" value="sanctionedLayoutPlanDoc"/>
						</div>


					</div> -->


<!-- 
					<div class="form-group">
						<label class="col-sm-3 control-label">Area Development Plan Of Project Area<sup>*</sup></label>
						<div class="col-sm-3">
							<input type="file" class="form-control requiredValFld bigsizefile" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 5 MB" data-toggle="tooltip" data-placement="bottom"  id="areaDevelopmentPlanFile" name="otherFileDoc"/>
							<span class='requiredValFldMsg'> Please select Area Development Plan Of Project Area.</span>
							<input type="hidden" name="fieldName" value="areaDevelopmentDoc"/>
						</div>
						<label for="inputEmail3" class="col-sm-2 control-label">Proforma of Allotment Letter<sup>*</sup></label>
						<div class="col-sm-3">
							<input type="file" class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="performaOfAllotmentLetterFile" name="otherFileDoc"/>
							<span class='requiredValFldMsg'> Please select Proforma of Allotment.</span>
							<input type="hidden" name="fieldName" value="performaOfAllotmentLetterDoc"/>
						</div>


					</div>
 -->


					<!-- <div class="form-group">
						<label class="col-sm-3 control-label">Brochure of Current
							Project<sup>*</sup></label>
						<div class="col-sm-3">
							<input type="file" class="form-control requiredValFld bigsizefile" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 5 MB" data-toggle="tooltip" data-placement="bottom"  id="brochureOfCurrentProjectFile" name="otherFileDoc"/>
							<span class='requiredValFldMsg'> Please select Brochure og Current Project.</span>
							<input type="hidden" name="fieldName" value="brochureOfCurrentProjectDoc"/>
						</div>
						<label for="inputEmail3" class="col-sm-2 control-label">All NOCs from Authority<sup>*</sup></label>
						<div class="col-sm-3">
							<input type="file" class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="projectRelatedDocumentsFile" name="otherFileDoc"/>
							<span class='requiredValFldMsg'> Please select All NOCs from Authority.</span>
							<input type="hidden" name="fieldName" value="projectRelatedDoc"/>
						</div>
						
						<label for="inputEmail3" class="col-sm-2 control-label">Proforma For Sale Deed <sup>*</sup></label>
						<div class="col-sm-3">
                           
							<input type="file" class="form-control requiredValFld bigsizefile" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 5 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<span class='requiredValFldMsg'> Please select Proforma For Sale Deed .</span>
							<input type="hidden" name="fieldName" value="agreementFileDoc"/>

						</div>
						


					</div> -->

					<!-- <div class="form-group">
						<label class="col-sm-3 control-label">Project Specification<sup>*</sup></label>
						<div class="col-sm-3">
							<input type="file" class="form-control requiredValFld" rel="txtTooltip" title="Type of structure, Flooring, Door Windows, Plumbing & Sanitary Wear, Fire, Lift & Capacity, etc Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="brochureOfCurrentProjectFile" name="otherFileDoc"/>
							<span class='requiredValFldMsg'> Please select Project Specification Document.</span>
							<input type="hidden" name="fieldName" value="projectSpecificDoc"/>
						</div>
						
							<label for="inputEmail3" class="col-sm-2 control-label">Collaboration Agreement/Development Agreement/Joint Development Agreement/Other Agreement <sup>*</sup></label>
						<div class="col-sm-3">
                           
							<input type="file" class="form-control requiredValFld bigsizefile" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 5 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<span class='requiredValFldMsg'> Please select Joint Development Agreement.</span>
							<input type="hidden" name="fieldName" value="jointDevelopmentAgreement"/>

						</div>
					
					</div>
 -->

<div class="drop_shadow">
						
						</div>
						
<h1>Declaration (Form B)</h1>					
						<div class="drop_shadow">
						
						</div>	

					<div class="form-group">
						<label class="col-sm-3 control-label">Declaration (Form B)<sup>*</sup></label>
						<div class="col-sm-3">
							<input type="file" class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<span class='requiredValFldMsg'> Please select Declaration (Form B).</span>
							<input type="hidden" name="fieldName" value="declarationFormbDoc"/>
						</div>


                      
						
						
						</div>
						<!--  Start Added new 3 fields -->

<div class="drop_shadow">
						
						</div>
						
	
	
	<h1>
					Conveyance Deed / Title Deed
				</h1>
				
				<!-- <div class="inner_wrapper upload"> -->



				<!-- <h1>
					Conveyance<span>Deed</span><span>Deed</span><span> / </span> <span>Title</span><span> Deed</span>
				</h1> -->
				<!-- <div class="border">
					<div class="orange"></div>
					<div class="black"></div>
				</div>				 -->
						<div class="drop_shadow">
						
						</div>	
					
						<div class="form-group">
						<label class="col-sm-3 control-label">Khatha<sup>*</sup></label>
						<div class="col-sm-3">
							<input type="file" class="form-control tenMBsizefile requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 10 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<span class='requiredValFldMsg tenMBsizefile'> Please select Title Deed.</span>
							<input type="hidden" name="fieldName" value="titleDeed"/>
						</div>


                      
					
						
						

					</div><!-- </div> -->
					
		<div class="drop_shadow">
						
						</div>	
						
<h1>
					Nocs (Upload which are Applicable)
				</h1>									
	<div class="drop_shadow">
						
</div>
					
					<table class="table table-responsive table-bordered"> 
					
					
					 <tr>
					    <td>Any other document (Rights/Title/Interest/Name)</td>
					      
					     <td>
					     <input type="file" class="form-control thirtyMBsizefile" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 30 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="anyOtherDoc"/>
					     </td>
					     <td>Approval/NOC under section 109 of KLR Act 1961</td>
					      <td>
					   <input type="file" class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="section109"/>
					     </td>
					    
					  </tr>
					  
					  
					 <tr>
					    <td>Conversion Certificate under Sec 95 of the KLR Act 1961</td>
					      
					     <td>
					     <input type="file" class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="section95"/>
					     </td>
					     <td>Approval/NOC under Sec 14 of the KTCP Act</td>
					      <td>
					 	 <input type="file" class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="section14"/>
					     </td>
					    
					  </tr>
					  
					   <tr>
					    <td>Fire Force Department</td>
					      
					     <td>
					    <input type="file" class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="fireForceDept"/>
					     </td>
					     <td>Airport Authority of India</td>
					      <td>
					 	<input type="file" class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="airportAuthorityOfIndia"/>
					     </td>
					    
					  </tr>
					  
					  
					  <tr>
					    <td>BESCOM</td>
					      
					     <td>
					    <input type="file" class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="bescom"/>
					     </td>
					     <td>BWSSB</td>
					      <td>
					 	<input type="file" class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="bwssb"/>
					     </td>
					    
					  </tr>
					  
					   <tr>
					    <td>KSPCB</td>
					      
					     <td>
					    <input type="file" class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="kspcb"/>
					     </td>
					     <td>SEIAA</td>
					      <td>
					 		<input type="file" class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="seiaa"/>
					     </td>
					    
					  </tr>
					  
					   <tr>
					    <td>BSNL</td>
					      
					     <td>
					 	 <input type="file" class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="bsnl"/>
					     </td>
					     <td>Lift Authorities
						</td>
						<td>
							<input type="file" class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="liftAuthorities"/>
						</td>
					     
					  </tr>
					  
					   <tr>
					    <td>Existing Layout Plan<sup>*</sup></td>
					      
					     <td>
					 	 <input type="file" class="form-control requiredValFld thirtyMBsizefile" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 30 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<span class='requiredValFldMsg'> Please select Existing Layout Plan.</span>
							<input type="hidden" name="fieldName" value="existingLayoutPlan"/>
					     </td>
					     <td>Existing Section Plan and Specification <sup>*</sup></td>
					      <td>
					 		<input type="file" class="form-control requiredValFld thirtyMBsizefile" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 30 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<span class='requiredValFldMsg'> Please select Existing Section Plan and Specification.</span>
							<input type="hidden" name="fieldName" value="existingSectionPlanandSpec"/>
					     </td>
					    
					  </tr>
					  
					   <tr>
					    <td>Change of Land Use<sup>*</sup></td>
					      
					     <td>
					 	<input type="file" class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<span class='requiredValFldMsg'> Please select Change of Land Use.</span>
							<input type="hidden" name="fieldName" value="changeOfLandUse"/>
					     </td>
					     <td>BMRCL</td>
					      <td>
					 		<input type="file" class="form-control  " rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="bmrcl"/>
					     </td>
					    
					  </tr>
					  
					   <tr>
					    <td>Urban Land Ceiling</td>
					      
					     <td>
					 	<input type="file" class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="urbanLandCeiling"/>
					     </td>
					     <td>Sectional Drawing of the apartments</td>
					      <td>
					 		<input type="file" class="form-control thirtyMBsizefile" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 30 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="sectionalDrawingOfTheApartments"/>
					     </td>
					    
					  </tr>
					  
					    <tr>
					    <td>Bangalore Urban Arts Commission</td>
					      
					     <td>
					 	<input type="file" class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="bangaloreUrbanArtsCommission"/>
					     </td>
					     <td>Inspector Of Factories Controller Of Explosives Railways</td>
					      <td>
					 			<input type="file" class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<!-- <span class='requiredValFldMsg'> Please select Sectional Drawing of the apartments.</span> -->
							<input type="hidden" name="fieldName" value="inspectorOfFactoriesCntrlOfExplosivesRailways"/>
					     </td>
					    
					  </tr>
					  
					   <tr>
					    <td>Dist Magistrate</td>
					      
					     <td>
					 	<input type="file" class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="distMagistrate"/>
					     </td>
					     <td>Coastal Regulation Zone Authority</td>
					      <td>
					 			<input type="file" class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="coastalRegulationZoneAuthority"/>
					     </td>
					    
					  </tr>
					  
					  
					  <tr>
					  
					   <td>Certificate from Registered Engineer indicating the structural safety of the building (for Apartments) </td>
					   <td>
						<input type="file" class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="engrIndicateStructural"/>
						</td>
					
					
						  <td>NOC in case of building proposals abutting to neighbouring properties</td>
						  <td>
							<input type="file" class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<!-- <span class='requiredValFldMsg'> Please select Sectional Drawing of the apartments.</span> -->
							<input type="hidden" name="fieldName" value="nocBuildingAbuttingToNeighbourProperties"/>
						</td>
						
					 </tr> 
				<tr>
					    <td>Advocate Search Report </td>
					   <td>
						<input type="file" class="form-control tenMBsizefile" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 10 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="advocatesearchreport"/>
						</td>
						
					 </tr> 	  
					  
					  </table>
				
						<div class="drop_shadow">
						
						</div>	
						
<h1>
		Benefit of Development Rights
				</h1>
					  
					<div class="form-group">
						<label class="col-sm-3 control-label">Utilisation certificate 
						</label>
						<div class="col-sm-3">
							<input type="file" class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<span class='requiredValFldMsg'> Please select Utilisation certificate.</span>
							<input type="hidden" name="fieldName" value="utilisationCert"/>
						</div>
						
						<label class="col-sm-2 control-label">Transfer of development rights certificate </label>
						<div class="col-sm-3">
							<input type="file" class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<span class='requiredValFldMsg'> Please select Transfer of development rights certificate.</span>
							<input type="hidden" name="fieldName" value="transferOfDevRightsCert"/>
						</div>
						
						</div>
				
				<div class="form-group">
						<label class="col-sm-3 control-label">Relinquishment Deed 
						</label>
						<div class="col-sm-3">
							<input type="file" class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<span class='requiredValFldMsg'> Please select Relinquishment Deed.</span>
							<input type="hidden" name="fieldName" value="relinquishmenDeed"/>
						</div>	</div>


					
						
						
						</div>
						
					
						
						
						<!-- End of Suneetha -->
		
						
<div class="drop_shadow">
						
</div>


					<div class="inner_wrapper">
                         <div id='pre_project-dv' class='addmoredv'>
						<div class="drop_shadow">
						<span onclick="deloptdv(this);" style='float: right;'>DELETE</span>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label">Project Photo<sup>*</sup></label>
							<div class="col-sm-3">
								<input type="file" class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="projectPhotoFile" name="projectPhotoFile"/>
								<span class='requiredValFldMsg'> Please select Photo.</span>
							</div>



						</div>



					</div>
					</div><br><br><br>

					<div class="form-group">
						<div class="col-sm-2 pull-right" style="text-align: right;">
                  	<span class="glyphicon glyphicon-plus-sign theme-clr "
								aria-hidden="true"></span><span class="theme-clr addmore" id="pre_project"> Add
								more&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>

						</div>



					</div>








				</form>





			</div>
			<!--inner container end here-->

<br><br>
			<div class="button-wrapper">


				<input name="btn1" class="btn-style" value="Previous" type="button"
					onclick="pervForm('editProjectDetailsForm')" /> <input
					name="btn1" class="btn-style" value="Next" onclick="nextProjectPaymentForm()" type="button">
			</div>

			<br>



		</div>
		<!-- container end here-->


	</div>

</body>
</html>