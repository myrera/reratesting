<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="in.gov.rera.common.util.DateUtil"%>
	<%@page import="in.gov.rera.common.security.ReraSecurity"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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


		<form:form cssClass="form-horizontal" id="trxForm" autocomplete="off" action="updateUploadProjectDoc" modelAttribute="projectRegistrationModel"
		 enctype="multipart/form-data" method="post">
		 <%=ReraSecurity.writeToken(request) %>

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
                   <form:hidden path="projectDocModel.docId"/>
				      <form:hidden path="projectDetailsModel.projectDetailsId"/>
					        <form:hidden path="projectBankDetailsModel.projectBankDelsId"/>
					        <form:hidden path="externalDevelopmentWorkModel.extDevId"/>
					         <form:hidden path="projectRegId"/>
					         
                     <input type="hidden" name="projectDocModel.docId" value="0"/>
                     <br/>
					<div class="drop_shadow">
						
						</div>
						
						
						<div>Note:- In case of non availability of financial documents due to the No. of Financial Years of establishment being less than three years, the entity can upload
						 a blank document with <b>"NOT APPLICABLE with appropriate reason"</b> text against relevant/respective year column and upload & submit available documents only. </div>
                  		
						
						
						
                  					<table class="table table-responsive table-bordered"> 
					     <tr>
					        <th>Year</th>
					        <th><%=DateUtil.getYearBack(1) %></th>
					        <th><%=DateUtil.getYearBack(2) %></th>
					        <th><%=DateUtil.getYearBack(3) %></th>
					        
					       
					     </tr>
					  <tr>
					  
					     <td>Balance Sheet</td>
					     <td>
					     <input type="file" Class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" 
					     data-placement="bottom"  id="auditedBalFile" name="otherFileDoc" />
					     <span class='requiredValFldMsg'> Please select Balance Sheet.</span>
					     
					     <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.auditedBalSheetDoc1.documentId}">${projectRegistrationModel.projectDocModel.auditedBalSheetDoc1.fileName}
							</a>
							<input type="hidden" name="fieldName" value="auditedBalSheetDoc1"/>
							
					     </td>
					     <td><input type="file" Class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" 
					     data-toggle="tooltip" data-placement="bottom" id="auditedBalFile" name="otherFileDoc" />
					     <span class='requiredValFldMsg'> Please select Balance Sheet.</span>
					         <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.auditedBalSheetDoc2.documentId}">
					         ${projectRegistrationModel.projectDocModel.auditedBalSheetDoc2.fileName}
							</a>
					
							<input type="hidden" name="fieldName" value="auditedBalSheetDoc2"/>
							</td>
					     <td><input type="file" Class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom" id="auditedBalFile" name="otherFileDoc" />
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.auditedBalSheetDoc3.documentId}">
							 <span class='requiredValFldMsg'> Please select Balance Sheet.</span>
					         ${projectRegistrationModel.projectDocModel.auditedBalSheetDoc3.fileName}
							</a>
							<input type="hidden" name="fieldName" value="auditedBalSheetDoc3"/>
							</td>
					     
					    
					  </tr>
					  
					  <tr>
					    <td>Audited Profit and Loss Statement</td>
					      
					     <td>
					     <input type="file" Class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="auditedBalFile" name="otherFileDoc" />
							<input type="hidden" name="fieldName" value="auditedProfitLossSheetDoc1"/>
							<span class='requiredValFldMsg'> Please select Audited ProfitLoss Statement.</span>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.auditedProfitLossSheetDoc1.documentId}">
					         ${projectRegistrationModel.projectDocModel.auditedProfitLossSheetDoc1.fileName}
							</a>
							
					     </td>
					     <td><input type="file" Class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom" id="auditedBalFile" name="otherFileDoc" />
							<input type="hidden" name="fieldName" value="auditedProfitLossSheetDoc2"/>
							<span class='requiredValFldMsg'> Please select Audited ProfitLoss Statement.</span>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.auditedProfitLossSheetDoc2.documentId}">
					         ${projectRegistrationModel.projectDocModel.auditedProfitLossSheetDoc2.fileName}
							</a>
							</td>
					     <td><input type="file" Class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom" id="auditedBalFile" name="otherFileDoc" />
							<input type="hidden" name="fieldName" value="auditedProfitLossSheetDoc3"/>
							<span class='requiredValFldMsg'> Please select Audited ProfitLoss Statement.</span>
								 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.auditedProfitLossSheetDoc3.documentId}">
					         ${projectRegistrationModel.projectDocModel.auditedProfitLossSheetDoc3.fileName}
							</a>
							</td>
					  
					  </tr>
					  
					  
					   <tr>
					    <td>Director's Report</td>
					      
					     <td>
					     <input type="file" Class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="auditedBalFile" name="otherFileDoc" />
							<input type="hidden" name="fieldName" value="directorReportDoc1"/>
							<span class='requiredValFldMsg'> Please select Director's Report.</span>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.directorReportDoc1.documentId}">
					         ${projectRegistrationModel.projectDocModel.directorReportDoc1.fileName}
							</a>
							
					     </td>
					     <td><input type="file" Class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom" id="auditedBalFile" name="otherFileDoc" />
							<input type="hidden" name="fieldName" value="directorReportDoc2"/>
							<span class='requiredValFldMsg'> Please select Director's Report.</span>
								 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.directorReportDoc2.documentId}">
					         ${projectRegistrationModel.projectDocModel.directorReportDoc2.fileName}
							</a>
							</td>
					     <td><input type="file" Class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom" id="auditedBalFile" name="otherFileDoc" />
							<input type="hidden" name="fieldName" value="directorReportDoc3"/>
							<span class='requiredValFldMsg'> Please select Director's Report.</span>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.directorReportDoc3.documentId}">
					         ${projectRegistrationModel.projectDocModel.directorReportDoc3.fileName}
							</a>
							</td>
					  
					  </tr>
					  
					  
					  
					  
					  
					  <tr>
					    <td>Cash Flow Statement </td>
					      
					     <td>
					     <input type="file" Class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="auditedBalFile" name="otherFileDoc" />
							<input type="hidden" name="fieldName" value="cashFlowStmtFileDoc1"/>
							<span class='requiredValFldMsg'> Please select Cash Flow Statement.</span>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.cashFlowStmtFileDoc1.documentId}">
					         ${projectRegistrationModel.projectDocModel.cashFlowStmtFileDoc1.fileName}
							</a>
							
					     </td>
					     <td><input type="file" Class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom" id="auditedBalFile" name="otherFileDoc" />
							<input type="hidden" name="fieldName" value="cashFlowStmtFileDoc2"/>
							<span class='requiredValFldMsg'> Please select Cash Flow Statement.</span>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.cashFlowStmtFileDoc2.documentId}">
					         ${projectRegistrationModel.projectDocModel.cashFlowStmtFileDoc2.fileName}
							</a>
							</td>
					     <td><input type="file" Class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom" id="auditedBalFile" name="otherFileDoc" />
							<input type="hidden" name="fieldName" value="cashFlowStmtFileDoc3"/>
							<span class='requiredValFldMsg'> Please select Cash Flow Statement.</span>
								 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.cashFlowStmtFileDoc2.documentId}">
					         ${projectRegistrationModel.projectDocModel.cashFlowStmtFileDoc3.fileName}
							</a>
							</td>
					  
					  </tr>
					  
					  
					   <tr>
					    <td>Auditor's Report<sup style="color:red;">*</sup> </td>
					      
					     <td>
					     <input type="file" Class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="auditedBalFile" name="otherFileDoc" />
							<span class='requiredValFldMsg'> Please select Auditor Reports.</span>
							<input type="hidden" name="fieldName" value="auditorsDoc1"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.auditorsDoc1.documentId}">
					         ${projectRegistrationModel.projectDocModel.auditorsDoc1.fileName}
							</a>
					
					     </td>
					     <td><input type="file" Class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom" id="auditedBalFile" name="otherFileDoc" />
							<span class='requiredValFldMsg'> Please select Auditor Reports.</span>
							<input type="hidden" name="fieldName" value="auditorsDoc2"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.auditorsDoc2.documentId}">
					         ${projectRegistrationModel.projectDocModel.auditorsDoc2.fileName}
							</a>
					
							</td>
					     <td><input type="file" Class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom" id="auditedBalFile" name="otherFileDoc" />
							<span class='requiredValFldMsg'> Please select Auditor Reports.</span>
							<input type="hidden" name="fieldName" value="auditorsDoc3"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.auditorsDoc3.documentId}">
					         ${projectRegistrationModel.projectDocModel.auditorsDoc3.fileName}
							</a>
					
							</td>
					  
					  </tr>
					    
					  <tr>
					    <td>Income Tax Return Acknowledgement<sup style="color:red;">*</sup> </td>
					      
					     <td>
					     <input type="file" Class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="auditedBalFile" name="otherFileDoc" />
							<span class='requiredValFldMsg'> Please select Income Tax Return Acknowledgement.</span>
							<input type="hidden" name="fieldName" value="incomeTaxReturn1"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.incomeTaxReturn1.documentId}">
					         ${projectRegistrationModel.projectDocModel.incomeTaxReturn1.fileName}
							</a>
					
							
					     </td>
					     <td><input type="file" Class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom" id="auditedBalFile" name="otherFileDoc" />
							<span class='requiredValFldMsg'> Please select Income tax Return Acknowledgement.</span>
							<input type="hidden" name="fieldName" value="incomeTaxReturn2"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.incomeTaxReturn2.documentId}">
					         ${projectRegistrationModel.projectDocModel.incomeTaxReturn2.fileName}
							</a>
					
							</td>
					     <td><input type="file" Class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom" id="auditedBalFile" name="otherFileDoc" />
							<span class='requiredValFldMsg'> Please select Income tax Return Acknowledgement.</span>
							<input type="hidden" name="fieldName" value="incomeTaxReturn3"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.incomeTaxReturn3.documentId}">
					         ${projectRegistrationModel.projectDocModel.incomeTaxReturn3.fileName}
							</a>
					
							</td>
					  
					  </tr>
					  
					  
					  
					</table>
					
					<br/><br/><br/>
					<div class="drop_shadow">
						
						</div>
						
						<table class="table table-responsive table-bordered"> 
					
					
					 <tr>
					    <td>PAN Card<sup style="color:red;">*</sup> </td>
					      
					     <td>
					     <input type="file" Class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB"
							 data-toggle="tooltip" data-placement="bottom"  id="panCardFile" name="otherFileDoc"/>
							 <span class='requiredValFldMsg'> Please select Pan Card.</span>
							<input type="hidden" name="fieldName" value="panCardDoc"/>
							<input type="hidden" name="flg"value="0"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.panCardDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.panCardDoc.fileName}
							</a>
					     <td>Encumbrance Certificate<sup style="color:red;">*</sup> </td>
					      <td>
					   <input type="file" Class="form-control fiveMBsizefile" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 5 MB" data-toggle="tooltip" data-placement="bottom"  id="panCardFile" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="encumbranceCertificateDoc"/>
							<span class='requiredValFldMsg'> Please select Encumbrance Certificate.</span>
							<input type="hidden" name="flg"value="0"/>
						 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.encumbranceCertificateDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.encumbranceCertificateDoc.fileName}
							</a>
					     </td>
					    
					  </tr>
					  
					  
					   <tr>
					    <td>Commencement Certificate<sup style="color:red;">*</sup> </td>
					      
					     <td>
					     <input type="file" Class="form-control fiveMBsizefile" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="commencementCertFile" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="commencementCertDoc"/>
							<span class='requiredValFldMsg'> Please select Commencement Certificate.</span>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.commencementCertDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.commencementCertDoc.fileName}
							</a>
					     </td>
					     <td>Approved Building/Plotting Plan<sup style="color:red;">*</sup> </td>
					      <td>
					  <input type="file" Class="form-control fiveMBsizefile" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 5 MB" data-toggle="tooltip" data-placement="bottom"  id="approvedSanctionPlanFile" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="approveSacPlanDoc"/>
							<span class='requiredValFldMsg'> Please select Approved Sanctioned Plan.</span>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.approveSacPlanDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.approveSacPlanDoc.fileName}
							</a>
					     </td>
					    
					  </tr>
					
					  <tr>
					    <td>Approved Layout Plan<sup style="color:red;">*</sup> </td>
					      
					     <td>
					   <input type="file" Class="form-control thirtyMBsizefile" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 30 MB" data-toggle="tooltip" data-placement="bottom"  id="approvedLayoutPlanFile" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="approveLayoutPlanDoc"/>
							<span class='requiredValFldMsg'> Please select Approved layout Plan.</span>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.approveLayoutPlanDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.approveLayoutPlanDoc.fileName}
							</a>
					     </td>
					     <td>Proforma of Agreement for Sale<sup style="color:red;">*</sup> </td>
					      <td>
					  <input type="file" Class="form-control requiredValFld fiveMBsizefile" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 5 MB" data-toggle="tooltip" data-placement="bottom"  id="performaForSaleOfAgreement" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="performaForSaleOfAgreement"/>
							<span class='requiredValFldMsg'> Please select Proforma for Sale of Agreement.</span>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.performaForSaleOfAgreement.documentId}">
					         ${projectRegistrationModel.projectDocModel.performaForSaleOfAgreement.fileName}
							</a>
					     </td>
					    
					  </tr>
					<tr>
					    <td>Sale Deed & RTC<sup style="color:red;">*</sup> </td>
					      
					     <td>
					  <input type="file" class="form-control thirtyMBsizefile requiredValFld " rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 30 MB" data-toggle="tooltip" data-placement="bottom"  id="landDocumentsFile" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="landLocationFileDoc"/>
							<span class='requiredValFldMsg'> Please select Land Documents & Location.</span>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.landLocationFileDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.landLocationFileDoc.fileName}
							</a>
					     </td>
					     <td>Approved Section Of Building/Infrastructure Plan of Plotting<sup style="color:red;">*</sup> </td>
					      <td>
					<input type="file" Class="form-control fiveMBsizefile" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 5 MB" data-toggle="tooltip" data-placement="bottom"  id="sanctionedLayoutPlan" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="sanctionedLayoutPlanDoc"/>
							<span class='requiredValFldMsg'> Please select Approved Section Of Building/Infrastructure Plan of Plotting.</span>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.sanctionedLayoutPlanDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.sanctionedLayoutPlanDoc.fileName}
							</a>
					     </td>
					    
					  </tr>
					
					<tr>
					    <td>Area Development Plan Of Project Area<sup style="color:red;">*</sup> </td>
					      
					     <td>
					 <input type="file" Class="form-control fiveMBsizefile" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 5 MB" data-toggle="tooltip" data-placement="bottom"  id="areaDevelopmentPlanFile" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="areaDevelopmentDoc"/>
							<span class='requiredValFldMsg'> Please select Area Development Plan.</span>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.areaDevelopmentDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.areaDevelopmentDoc.fileName}
							</a>
					     </td>
					     <td>Proforma of Allotment Letter<sup style="color:red;">*</sup> </td>
					      <td>
					<input type="file" Class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="performaOfAllotmentLetterFile" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="performaOfAllotmentLetterDoc"/>
								<span class='requiredValFldMsg'> Please select Proforma of Allotment.</span>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.performaOfAllotmentLetterDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.performaOfAllotmentLetterDoc.fileName}
							</a>
					     </td>
					    
					  </tr>
					
					<tr>
					    <td>Brochure of Current Project<sup style="color:red;">*</sup> </td>
					      
					     <td>
					<input type="file" Class="form-control fiveMBsizefile" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 5 MB" data-toggle="tooltip" data-placement="bottom"  id="brochureOfCurrentProjectFile" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="brochureOfCurrentProjectDoc"/>
							<span class='requiredValFldMsg'> Please select Brochure of Current Project.</span>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.brochureOfCurrentProjectDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.brochureOfCurrentProjectDoc.fileName}
							</a>
					     </td>
					     <td>Proforma For Sale Deed<sup style="color:red;">*</sup> </td>
					      <td>
					<input type="file" Class="form-control fiveMBsizefile" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 5 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="agreementFileDoc"/>
							<span class='requiredValFldMsg'> Please select Proforma For Sale Deed .</span>
							                                             
							<a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.agreementFileDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.agreementFileDoc.fileName}
							</a>
					     </td>
					    
					  </tr>
					  
					  <tr>
					    <td>Project Specification<sup style="color:red;">*</sup> </td>
					      
					     <td>
					<input type="file" class="form-control" rel="txtTooltip" title="Type of structure, Flooring, Door Windows, Plumbing & Sanitary Wear, Fire, Lift & Capacity, etc Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="brochureOfCurrentProjectFile" name="otherFileDoc"/>
							<span class='requiredValFldMsg'> Please select Project Specification Document.</span>
							<input type="hidden" name="fieldName" value="projectSpecificDoc"/>
							
							<a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.projectSpecificDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.projectSpecificDoc.fileName}
							</a>
					     </td>
					     <td>Collaboration Agreement/Development Agreement/Joint Development Agreement/Other Agreement<sup style="color:red;">*</sup> </td>
					      <td>
					<input type="file" class="form-control thirtyMBsizefile" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 30 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="jointDevelopmentAgreement"/>
							<a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.jointDevelopmentAgreement.documentId}">
					         ${projectRegistrationModel.projectDocModel.jointDevelopmentAgreement.fileName}
							</a>

					     </td>
					    
					  </tr>
					
					
				<!-- 	</table>  -->
				
				
			<!-- <div class="drop_shadow">
						
						</div> -->
	<tr>
	<c:if test="${projectRegistrationModel.projectDetailsModel.isSubSqChangeInPlan=='Yes' }">
		<td>Existing  Layout Plan<sup>*</sup><td>
						
							<input type="file" class="form-control thirtyMBsizefile" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 30 MB" data-toggle="tooltip" data-placement="bottom"  id="approvedLayoutPlanFile" name="otherFileDoc"/>
							<span class='requiredValFldMsg'> Please select Existing  Layout Plan.</span>
							<input type="hidden" name="fieldName" value="extendedLayoutPlanDoc"/>
								 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.extendedLayoutPlanDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.extendedLayoutPlanDoc.fileName}
							</a>
						
						<td>Existing Section Plan and Specification <sup>*</sup></td>
						<td>
							<input type="file" class="form-control thirtyMBsizefile" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 30 MB" data-toggle="tooltip" data-placement="bottom"  id="performaForSaleOfAgreement" name="otherFileDoc"/>
							<span class='requiredValFldMsg'> Please select Existing Section Plan and Specification.</span>
							<input type="hidden" name="fieldName" value="extendedSacPlanDoc"/>
						
				 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.extendedSacPlanDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.extendedSacPlanDoc.fileName}
							</a></td>

					
					
					
</c:if>		
</tr>
			</table>		
						
<h1>Declaration (Form B)</h1>					
						<div class="drop_shadow">
						
						</div>	

					<div class="form-group">
						<label class="col-sm-3 control-label">Declaration (Form B)<sup>*</sup></label>
						<div class="col-sm-3">
							<input type="file" Class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="declarationFormbDoc"/>
							<span class='requiredValFldMsg'> Please select Declaration (Form B).</span>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.declarationFormbDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.declarationFormbDoc.fileName}
							</a>
						</div>
						</div>		
	<div class="drop_shadow">
						
						</div>
						
	
	
	<h1>
					Conveyance Deed / Title Deed
				</h1>
						<div class="drop_shadow">
						
						</div>	
					
						<div class="form-group">
						<label class="col-sm-3 control-label">Khatha<sup>*</sup></label>
						<div class="col-sm-3">
							<input type="file" class="form-control thirtyMBsizefile " rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 30 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
						
							<input type="hidden" name="fieldName" value="titleDeed"/>
								<a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.titleDeed.documentId}">
					         ${projectRegistrationModel.projectDocModel.titleDeed.fileName}
							</a>
						</div>
					</div>	
		
	
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
							<a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.anyOtherDoc.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.anyOtherDoc.fileName}
							</a>
					     </td>
					     <td>Approval/NOC under section 109 of KLR Act 1961</td>
					      <td>
					   <input type="file" class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="section109"/>
							<a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.section109.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.section109.fileName}
							</a>
					     </td>
					    
					  </tr>
					  
					  
					 <tr>
					    <td>Conversion Certificate under Sec 95 of the KLR Act 1961</td>
					      
					     <td>
					    <input type="file" class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="section95"/>
							<a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.section95.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.section95.fileName}
							</a>
					     </td>
					     <td>Approval/NOC under Sec 14 of the KTCP Act</td>
					      <td>
					 	 <input type="file" class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="section14"/>
							<a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.section14.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.section14.fileName}
							</a>
					     </td>
					    
					  </tr>
					  
					   <tr>
					    <td>Fire Force Department</td>
					      
					     <td>
					    <input type="file" class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="fireForceDept"/>
							<a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.fireForceDept.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.fireForceDept.fileName}
							</a>
					     </td>
					     <td>Airport Authority of India</td>
					      <td>
					 	<input type="file" class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="airportAuthorityOfIndia"/>
							<a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.airportAuthorityOfIndia.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.airportAuthorityOfIndia.fileName}
							</a>
					     </td>
					    
					  </tr>
					  
					  
					  <tr>
					    <td>BESCOM</td>
					      
					     <td>
					    <input type="file" class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="bescom"/>
							<a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.bescom.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.bescom.fileName}
							</a>
					     </td>
					     <td>BWSSB</td>
					      <td>
					 	<input type="file" class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="bwssb"/>
							<a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.bwssb.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.bwssb.fileName}
							</a>
					     </td>
					    
					  </tr>
					  
					   <tr>
					    <td>KSPCB</td>
					      
					     <td>
					   <input type="file" class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="kspcb"/>
							<a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.kspcb.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.kspcb.fileName}
							</a>
					     </td>
					     <td>SEIAA</td>
					      <td>
					 		<input type="file" class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="seiaa"/>
							<a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.seiaa.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.seiaa.fileName}
							</a>
					     </td>
					    
					  </tr>
					  
					   <tr>
					    <td>BSNL</td>
					      
					     <td>
					 	<input type="file" class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="bsnl"/>
							<a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.bsnl.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.bsnl.fileName}
							</a>
					     </td>
					     <td>Lift Authorities
					</td>
						<td>
							<input type="file" class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="liftAuthorities"/>
							<a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.liftAuthorities.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.liftAuthorities.fileName}
							</a>
						</td>
					    
					  </tr>
					  
					   <tr>
					    <td>Existing Layout Plan<sup>*</sup></td>
					      
					     <td>
					 	<input type="file" class="form-control thirtyMBsizefile " rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 30 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
						
							<input type="hidden" name="fieldName" value="existingLayoutPlan"/>
								<a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.existingLayoutPlan.documentId}">
					         ${projectRegistrationModel.projectDocModel.existingLayoutPlan.fileName}
							</a>
					     </td>
					     <td>Existing Section Plan and Specification <sup>*</sup></td>
					      <td>
					 		<input type="file" class="form-control thirtyMBsizefile" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 30 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="existingSectionPlanandSpec"/>
							<a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.existingSectionPlanandSpec.documentId}">
					         ${projectRegistrationModel.projectDocModel.existingSectionPlanandSpec.fileName}
							</a>
					     </td>
					    
					  </tr>
					  
					   <tr>
					    <td>Change of Land Use<sup>*</sup></td>
					      
					     <td>
					 	<input type="file" class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="changeOfLandUse"/>
							<a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.changeOfLandUse.documentId}">
					         ${projectRegistrationModel.projectDocModel.changeOfLandUse.fileName}
							</a>
					     </td>
					     <td>BMRCL</td>
					      <td>
					 		<input type="file" class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="bmrcl"/>
							<a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.bmrcl.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.bmrcl.fileName}
							</a>
					     </td>
					    
					  </tr>
					  
					   <tr>
					    <td>Urban Land Ceiling</td>
					      
					     <td>
					 	<input type="file" class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="urbanLandCeiling"/>
							<a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.urbanLandCeiling.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.urbanLandCeiling.fileName}
							</a>
					     </td>
					     <td>Sectional Drawing of the apartments</td>
					      <td>
					 		<input type="file" class="form-control thirtyMBsizefile" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 30 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="sectionalDrawingOfTheApartments"/>
							<a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.sectionalDrawingOfTheApartments.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.sectionalDrawingOfTheApartments.fileName}
							</a>
					     </td>
					    
					  </tr>
					  
					    <tr>
					    <td>Bangalore Urban Arts Commission</td>
					      
					     <td>
					 	<input type="file" class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="bangaloreUrbanArtsCommission"/>
							<a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.bangaloreUrbanArtsCommission.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.bangaloreUrbanArtsCommission.fileName}
							</a>
					     </td>
					     <td>Inspector Of Factories Controller Of Explosives Railways</td>
					      <td>
					 			<input type="file" class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="inspectorOfFactoriesCntrlOfExplosivesRailways"/>
							<a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.inspectorOfFactoriesCntrlOfExplosivesRailways.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.inspectorOfFactoriesCntrlOfExplosivesRailways.fileName}
							</a>
					     </td>
					    
					  </tr>
					  
					   <tr>
					    <td>Dist Magistrate</td>
					      
					     <td>
					 	<input type="file" class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="distMagistrate"/>
							<a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.distMagistrate.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.distMagistrate.fileName}
							</a>
					     </td>
					     <td>Coastal Regulation Zone Authority</td>
					      <td>
					 			<input type="file" class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="coastalRegulationZoneAuthority"/>
							<a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.coastalRegulationZoneAuthority.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.coastalRegulationZoneAuthority.fileName}
							</a>
					     </td>
					    
					  </tr>
					  
					  
					  <tr>
					  
					   <td>Certificate from Registered Engineer indicating the structural safety of the building (for Apartments) </td>
					   <td>
						<input type="file" class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="engrIndicateStructural"/>
							<a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.engrIndicateStructural.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.engrIndicateStructural.fileName}
							</a>
						</td>
					
					
						  <td>NOC in case of building proposals abutting to neighbouring properties</td>
						  <td>
							<input type="file" class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="nocBuildingAbuttingToNeighbourProperties"/>
							<a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.nocBuildingAbuttingToNeighbourProperties.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.nocBuildingAbuttingToNeighbourProperties.fileName}
							</a>
						</td>
						
					 </tr> 		
					  
					 <tr>
					  
					   <td>Advocate Search Report
					</td>
						<td>
							<input type="file" class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 10 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
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
							<input type="hidden" name="fieldName" value="utilisationCert"/>
							<a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.utilisationCert.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.utilisationCert.fileName}
							</a>
						</div>
						
						<label class="col-sm-2 control-label">Transfer of development rights certificate </label>
						<div class="col-sm-3">
							<input type="file" class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="transferOfDevRightsCert"/>
							<a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.transferOfDevRightsCert.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.transferOfDevRightsCert.fileName}
							</a>
						</div>
						
						</div>
				
				<div class="form-group">
						<label class="col-sm-3 control-label">Relinquishment Deed 
						</label>
						<div class="col-sm-3">
							<input type="file" class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="relinquishmenDeed"/>
							<a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.relinquishmenDeed.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.relinquishmenDeed.fileName}
							</a>
						</div>	</div>
						
					   
					<%-- <div class="form-group">
						<label class="col-sm-3 control-label">PAN Card<sup>*</sup></label>
						<div class="col-sm-3">
							<input type="file" Class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB"
							 data-toggle="tooltip" data-placement="bottom"  id="panCardFile" name="otherFileDoc"/>
							 <span class='requiredValFldMsg'> Please select Pan Card.</span>
							<input type="hidden" name="fieldName" value="panCardDoc"/>
							<input type="hidden" name="flg"value="0"/>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.panCardDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.panCardDoc.fileName}
							</a>
			
						</div>
						
						<label for="inputEmail3" class="col-sm-2 control-label"> Encumbrance Certificate
							</label>
						<div class="col-sm-3">
						<input type="file" Class="form-control fiveMBsizefile" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 5 MB" data-toggle="tooltip" data-placement="bottom"  id="panCardFile" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="encumbranceCertificateDoc"/>
							<span class='requiredValFldMsg'> Please select Encumbrance Certificate.</span>
							<input type="hidden" name="flg"value="0"/>
						 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.encumbranceCertificateDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.encumbranceCertificateDoc.fileName}
							</a>
						
					    </div>


					</div>
					
					
					

					<div class="form-group">
						<label class="col-sm-3 control-label">Commencement
							Certificate<sup>*</sup></label>
						<div class="col-sm-3">
							<input type="file" Class="form-control fiveMBsizefile" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 5 MB" data-toggle="tooltip" data-placement="bottom"  id="commencementCertFile" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="commencementCertDoc"/>
							<span class='requiredValFldMsg'> Please select Commencement Certificate.</span>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.commencementCertDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.commencementCertDoc.fileName}
							</a>
						</div>
						<label for="inputEmail3" class="col-sm-2 control-label">Approved Building/Plotting Plan <sup>*</sup></label>
						<div class="col-sm-3">
							<input type="file" Class="form-control fiveMBsizefile" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 5 MB" data-toggle="tooltip" data-placement="bottom"  id="approvedSanctionPlanFile" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="approveSacPlanDoc"/>
							<span class='requiredValFldMsg'> Please select Approved Sanctioned Plan.</span>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.approveSacPlanDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.approveSacPlanDoc.fileName}
							</a>
						</div>


					</div>


					<div class="form-group">
						<label class="col-sm-3 control-label">Approved Layout Plan<sup>*</sup></label>
						<div class="col-sm-3">
							<input type="file" Class="form-control fiveMBsizefile" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 5 MB" data-toggle="tooltip" data-placement="bottom"  id="approvedLayoutPlanFile" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="approveLayoutPlanDoc"/>
							<span class='requiredValFldMsg'> Please select Approved layout Plan.</span>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.approveLayoutPlanDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.approveLayoutPlanDoc.fileName}
							</a>
							
						</div>
						<label for="inputEmail3" class="col-sm-2 control-label">Proforma for Sale of Agreement <sup>*</sup></label>
						<div class="col-sm-3">
							<input type="file" Class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="performaForSaleOfAgreement" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="performaForSaleOfAgreement"/>
							<span class='requiredValFldMsg'> Please select Proforma for Sale of Agreement.</span>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.performaForSaleOfAgreement.documentId}">
					         ${projectRegistrationModel.projectDocModel.performaForSaleOfAgreement.fileName}
							</a>
						</div>


					</div>

<c:if test="${projectRegistrationModel.projectDetailsModel.isSubSqChangeInPlan=='Yes' }">
		<div class="form-group">
						<label class="col-sm-3 control-label">Existing  Layout Plan<sup>*</sup></label>
						<div class="col-sm-3">
							<input type="file" class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="approvedLayoutPlanFile" name="otherFileDoc"/>
							<span class='requiredValFldMsg'> Please select Existing  Layout Plan.</span>
							<input type="hidden" name="fieldName" value="extendedLayoutPlanDoc"/>
								 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.extendedLayoutPlanDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.extendedLayoutPlanDoc.fileName}
							</a>
						</div>
						<label for="inputEmail3" class="col-sm-2 control-label">Existing Section Plan and Specification <sup>*</sup></label>
						<div class="col-sm-3">
							<input type="file" class="form-control " rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="performaForSaleOfAgreement" name="otherFileDoc"/>
							<span class='requiredValFldMsg'> Please select Existing Section Plan and Specification.</span>
							<input type="hidden" name="fieldName" value="extendedSacPlanDoc"/>
						</div>
	 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.extendedSacPlanDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.extendedSacPlanDoc.fileName}
							</a>

					</div>
</c:if>	

					<div class="form-group">
						<label class="col-sm-3 control-label">Land documents &
							Location<sup>*</sup></label>
						<div class="col-sm-3">
							<input type="file" class="form-control tenMBsizefile requiredValFld " rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 10 MB" data-toggle="tooltip" data-placement="bottom"  id="landDocumentsFile" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="landLocationFileDoc"/>
							<span class='requiredValFldMsg'> Please select Land Documents & Location.</span>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.landLocationFileDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.landLocationFileDoc.fileName}
							</a>
						</div>
						<label for="inputEmail3" class="col-sm-2 control-label">Approved Section Of Building/Infrastructure Plan of Plotting<sup>*</sup></label>
						<div class="col-sm-3">
							<input type="file" Class="form-control fiveMBsizefile" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 5 MB" data-toggle="tooltip" data-placement="bottom"  id="sanctionedLayoutPlan" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="sanctionedLayoutPlanDoc"/>
							<span class='requiredValFldMsg'> Please select Approved Section Of Building/Infrastructure Plan of Plotting.</span>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.sanctionedLayoutPlanDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.sanctionedLayoutPlanDoc.fileName}
							</a>
						</div>


					</div>



					<div class="form-group">
						<label class="col-sm-3 control-label">Area Development Plan Of Project Area<sup>*</sup></label>
						<div class="col-sm-3">
							<input type="file" Class="form-control fiveMBsizefile" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 5 MB" data-toggle="tooltip" data-placement="bottom"  id="areaDevelopmentPlanFile" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="areaDevelopmentDoc"/>
							<span class='requiredValFldMsg'> Please select Area Development Plan.</span>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.areaDevelopmentDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.areaDevelopmentDoc.fileName}
							</a>
						</div>
						<label for="inputEmail3" class="col-sm-2 control-label">Proforma
							of Allotment Letter<sup>*</sup></label>
						<div class="col-sm-3">
							<input type="file" Class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="performaOfAllotmentLetterFile" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="performaOfAllotmentLetterDoc"/>
								<span class='requiredValFldMsg'> Please select Proforma of Allotment.</span>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.performaOfAllotmentLetterDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.performaOfAllotmentLetterDoc.fileName}
							</a>
						</div>


					</div>



					<div class="form-group">
						<label class="col-sm-3 control-label">Brochure of Current
							Project<sup>*</sup></label>
						<div class="col-sm-3">
							<input type="file" Class="form-control fiveMBsizefile" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 5 MB" data-toggle="tooltip" data-placement="bottom"  id="brochureOfCurrentProjectFile" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="brochureOfCurrentProjectDoc"/>
							<span class='requiredValFldMsg'> Please select Brochure og Current Project.</span>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.brochureOfCurrentProjectDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.brochureOfCurrentProjectDoc.fileName}
							</a>
						</div>
						<label for="inputEmail3" class="col-sm-2 control-label">All NOCs from Authority<sup>*</sup></label>
						<div class="col-sm-3">
							<input type="file" Class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="projectRelatedDocumentsFile" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="projectRelatedDoc"/>
							<span class='requiredValFldMsg'> Please select All NOCs from Authority.</span>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.projectRelatedDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.projectRelatedDoc.fileName}
							</a>
						</div>


					</div>
                     <div class="form-group">
						<label class="col-sm-3 control-label">Project Specification<sup>*</sup></label>
						<div class="col-sm-3">
							<input type="file" class="form-control" rel="txtTooltip" title="Type of structure, Flooring, Door Windows, Plumbing & Sanitary Wear, Fire, Lift & Capacity, etc Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="brochureOfCurrentProjectFile" name="otherFileDoc"/>
							<span class='requiredValFldMsg'> Please select Project Specification Document.</span>
							<input type="hidden" name="fieldName" value="projectSpecificDoc"/>
							
							<a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.projectSpecificDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.projectSpecificDoc.fileName}
							</a>
						</div>
					
					</div>



					<div class="form-group">
						<label class="col-sm-3 control-label">Declaration (Form B)<sup>*</sup></label>
						<div class="col-sm-3">
							<input type="file" Class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="declarationFormbDoc"/>
							<span class='requiredValFldMsg'> Please select Declaration (Form B).</span>
							 <a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.declarationFormbDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.declarationFormbDoc.fileName}
							</a>
						</div>


                      
						<label for="inputEmail3" class="col-sm-2 control-label">Proforma For Sale Deed <sup>*</sup></label>
						<div class="col-sm-3">
                           
							<input type="file" Class="form-control fiveMBsizefile" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 5 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="agreementFileDoc"/>
							<span class='requiredValFldMsg'> Please select Proforma For Sale Deed .</span>
							                                             
							<a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.agreementFileDoc.documentId}">
					         ${projectRegistrationModel.projectDocModel.agreementFileDoc.fileName}
							</a>

						</div>


					</div>
					
					
					
					<!--  Start Added new 3 fields -->
						
						<div class="form-group">
						<label class="col-sm-3 control-label">Khatha / RTC<sup>*</sup></label>
						<div class="col-sm-3">
							<input type="file" class="form-control tenMBsizefile " rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 10 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
						
							<input type="hidden" name="fieldName" value="titleDeed"/>
								<a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.titleDeed.documentId}">
					         ${projectRegistrationModel.projectDocModel.titleDeed.fileName}
							</a>
						</div>


                      
						<label for="inputEmail3" class="col-sm-2 control-label">Collaboration Agreement/Development Agreement/Joint Development Agreement/Other Agreement</label>
						<div class="col-sm-3">
                           
							<input type="file" class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 5 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="jointDevelopmentAgreement"/>
							<a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.jointDevelopmentAgreement.documentId}">
					         ${projectRegistrationModel.projectDocModel.jointDevelopmentAgreement.fileName}
							</a>

						</div> --%>
						
						

					</div>
					
					
					<%-- <div class="form-group">
						<label class="col-sm-3 control-label">Any other document (Rights/Title/Interest/Name) 
						</label>
						<div class="col-sm-3">
							<input type="file" class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="anyOtherDoc"/>
							<a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.anyOtherDoc.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.anyOtherDoc.fileName}
							</a>
						</div>
						
						<label class="col-sm-3 control-label">Approval/NOC under section 109 of KLR Act 1961</label>
						<div class="col-sm-3">
							<input type="file" class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="section109"/>
							<a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.section109.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.section109.fileName}
							</a>
						</div>
						
						</div>
						
						<div class="form-group">
						<label class="col-sm-3 control-label">Conversion Certificate under Sec 95 of the KLR Act 1961 
						
						</label>
						<div class="col-sm-3">
							<input type="file" class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="section95"/>
							<a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.section95.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.section95.fileName}
							</a>
						</div>
						
						<label class="col-sm-3 control-label">Approval/NOC under Sec 14 of the KTCP Act 
						</label>
						<div class="col-sm-3">
							<input type="file" class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="section14"/>
							<a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.section14.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.section14.fileName}
							</a>
						</div>
						
						</div>
						
						<!-- Added by Suneetha -->
						
						<div class="form-group">
						<label class="col-sm-3 control-label">Utilisation certificate 
						</label>
						<div class="col-sm-3">
							<input type="file" class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="utilisationCert"/>
							<a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.utilisationCert.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.utilisationCert.fileName}
							</a>
						</div>
						
						<label class="col-sm-2 control-label">Transfer of development rights certificate</label>
						<div class="col-sm-3">
							<input type="file" class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="transferOfDevRightsCert"/>
							<a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.transferOfDevRightsCert.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.transferOfDevRightsCert.fileName}
							</a>
						</div>
						
						</div>
						
						<div class="form-group">
						<label class="col-sm-3 control-label">Relinquishment Deed 
						</label>
						<div class="col-sm-3">
							<input type="file" class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="relinquishmenDeed"/>
							<a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.relinquishmenDeed.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.relinquishmenDeed.fileName}
							</a>
						</div>
						
						<label class="col-sm-2 control-label">Fire Force Department</label>
						<div class="col-sm-3">
							<input type="file" class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="fireForceDept"/>
							<a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.fireForceDept.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.fireForceDept.fileName}
							</a>
						</div>
						
						</div>
						
						<div class="form-group">
						<label class="col-sm-3 control-label">Airport Authority of India 
						</label>
						<div class="col-sm-3">
							<input type="file" class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="airportAuthorityOfIndia"/>
							<a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.airportAuthorityOfIndia.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.airportAuthorityOfIndia.fileName}
							</a>
						</div>
						
						<label class="col-sm-2 control-label">BESCOM</label>
						<div class="col-sm-3">
							<input type="file" class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="bescom"/>
							<a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.bescom.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.bescom.fileName}
							</a>
						</div>
						
						</div>
						
						<div class="form-group">
						<label class="col-sm-3 control-label">BWSSB 
						</label>
						<div class="col-sm-3">
							<input type="file" class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="bwssb"/>
							<a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.bwssb.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.bwssb.fileName}
							</a>
						</div>
						
						<label class="col-sm-2 control-label">KSPCB</label>
						<div class="col-sm-3">
							<input type="file" class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="kspcb"/>
							<a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.kspcb.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.kspcb.fileName}
							</a>
						</div>
						
						</div>
						
						<div class="form-group">
						<label class="col-sm-3 control-label">SEIAA 
						</label>
						<div class="col-sm-3">
							<input type="file" class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="seiaa"/>
							<a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.seiaa.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.seiaa.fileName}
							</a>
						</div>
						
						<label class="col-sm-2 control-label">BSNL</label>
						<div class="col-sm-3">
							<input type="file" class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="bsnl"/>
							<a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.bsnl.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.bsnl.fileName}
							</a>
						</div>
						
						</div>
						
						   <div class="form-group">
						<label class="col-sm-3 control-label">No objection certificate in case of building proposals abutting to neighbouring properties 
						</label>
						<div class="col-sm-3">
							<input type="file" class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="nocBuildingAbuttingToNeighbourProperties"/>
							<a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.nocBuildingAbuttingToNeighbourProperties.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.nocBuildingAbuttingToNeighbourProperties.fileName}
							</a>
						</div>
						
						<label class="col-sm-2 control-label">Lift Authorities</label>
						<div class="col-sm-3">
							<input type="file" class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="liftAuthorities"/>
							<a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.liftAuthorities.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.liftAuthorities.fileName}
							</a>
						</div>
						
						</div>   
						
						
						<div class="form-group">
						<label class="col-sm-3 control-label">Urban Land Ceiling 
						</label>
						<div class="col-sm-3">
							<input type="file" class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="urbanLandCeiling"/>
							<a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.urbanLandCeiling.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.urbanLandCeiling.fileName}
							</a>
						</div>
						
						   <label class="col-sm-2 control-label">Inspector of Factories Controller of explosives Railways</label>
						<div class="col-sm-3">
							<input type="file" class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="inspectorOfFactoriesCntrlOfExplosivesRailways"/>
							<a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.inspectorOfFactoriesCntrlOfExplosivesRailways.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.inspectorOfFactoriesCntrlOfExplosivesRailways.fileName}
							</a>
						</div>    
						
						</div>
						
						 <div class="form-group">
						<label class="col-sm-3 control-label">BMRCL
						</label>
						<div class="col-sm-3">
							<input type="file" class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="bmrcl"/>
							<a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.bmrcl.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.bmrcl.fileName}
							</a>
						</div>
						
						 <label class="col-sm-2 control-label">Bangalore Urban Arts Commission</label>
						<div class="col-sm-3">
							<input type="file" class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="bangaloreUrbanArtsCommission"/>
							<a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.bangaloreUrbanArtsCommission.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.bangaloreUrbanArtsCommission.fileName}
							</a>
						</div>  
						
						</div> 
						
					 	
						
						 <div class="form-group">
						<label class="col-sm-3 control-label">Dist Magistrate 
						</label>
						<div class="col-sm-3">
							<input type="file" class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="distMagistrate"/>
							<a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.distMagistrate.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.distMagistrate.fileName}
							</a>
						</div>
						
						<label class="col-sm-2 control-label">Coastal Regulation Zone Authority</label>
						<div class="col-sm-3">
							<input type="file" class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="coastalRegulationZoneAuthority"/>
							<a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.coastalRegulationZoneAuthority.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.coastalRegulationZoneAuthority.fileName}
							</a>
						</div> 
						
						</div>  
						
					<div class="form-group">
						    <label class="col-sm-3 control-label">Certificate from Registered Engineer indicating the structural safety of the building (for Apartments) (1 MB) 
						</label>
						<div class="col-sm-3">
							<input type="file" class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="engrIndicateStructural"/>
							<a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.engrIndicateStructural.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.engrIndicateStructural.fileName}
							</a>
						</div>     
						
						<label class="col-sm-2 control-label">Sectional Drawing of the apartments (5 MB)</label>
						<div class="col-sm-3">
							<input type="file" class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="sectionalDrawingOfTheApartments"/>
							<a href="download?DOC_ID=${projectRegistrationModel.projectAddDocModel.sectionalDrawingOfTheApartments.documentId}">
					         ${projectRegistrationModel.projectAddDocModel.sectionalDrawingOfTheApartments.fileName}
							</a>
						</div>
						
						</div>   
						
						<!-- End of Suneetha -->
						
						
						<div class="form-group">
						<label class="col-sm-3 control-label">Existing Layout Plan</label>
						<div class="col-sm-3">
							<input type="file" class="form-control " rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
						
							<input type="hidden" name="fieldName" value="existingLayoutPlan"/>
								<a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.existingLayoutPlan.documentId}">
					         ${projectRegistrationModel.projectDocModel.existingLayoutPlan.fileName}
							</a>
						</div>


                      
						<label for="inputEmail3" class="col-sm-2 control-label">Existing Section Plan and Specification </label>
						<div class="col-sm-3">
                           
							<input type="file" class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 5 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="existingSectionPlanandSpec"/>
							<a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.existingSectionPlanandSpec.documentId}">
					         ${projectRegistrationModel.projectDocModel.existingSectionPlanandSpec.fileName}
							</a>

						</div>
						
						

					</div>
						
							<div class="form-group">
						<label class="col-sm-3 control-label">Change Of Land Use</label>
						<div class="col-sm-3">
							<input type="file" class="form-control" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="declarationFormb" name="otherFileDoc"/>
							<input type="hidden" name="fieldName" value="changeOfLandUse"/>
							<a href="download?DOC_ID=${projectRegistrationModel.projectDocModel.changeOfLandUse.documentId}">
					         ${projectRegistrationModel.projectDocModel.changeOfLandUse.fileName}
							</a>
						</div>
						
						</div> --%>
						
					
						<!--  end Added new 3 fields -->
					
				


					<div class="inner_wrapper">
					<c:choose>
					<c:when test="${projectPhotoFlag=='NO' }">
					    <div id='pre_project-dv' class='addmoredv'>
						<div class="drop_shadow">
						<span onclick="deloptdv(this);" style='float: right;'>DELETE</span>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label">Project Photo</label>
							<div class="col-sm-3">
								<input type="file" Class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="projectPhotoFile" name="projectPhotoFile"/>
								<span class='requiredValFldMsg'> Please select Photo.</span>
							</div>



						</div>



					</div>
					</c:when>
					
					<c:otherwise>
					
					<% int pp=0; %>
					<c:forEach items="${projectRegistrationModel.projectPhotoDetailSet }" var="photo">
					<input type="hidden" name="photoId" value="${photo.documentId}" />
					<%if(pp==0){ %>
                         <div id='pre_project-dv' class='addmoredv'>
                         <%}else{ %>
                           <div  class='addmoredv'>
                         <%} pp++; %>
						<div class="drop_shadow">
						<span onclick="deloptdv(this);" style='float: right;'>DELETE</span>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label">Project Photo</label>
							<div class="col-sm-3">
								<input type="file" Class="form-control requiredValFld" rel="txtTooltip" title="Only image or pdf file is allowed. file size upto 1 MB" data-toggle="tooltip" data-placement="bottom"  id="projectPhotoFile" name="projectPhotoFile"/>
							<span class='requiredValFldMsg'> Please select Photo.</span>
							<span class="dynaselectSpn"><a href="download?DOC_ID=${photo.documentId}">
					         ${photo.fileName}
							</a></span>
							
							</div>



						</div>



					</div>
					</c:forEach>
					</c:otherwise>
					</c:choose>
					</div>

					<div class="form-group">
						<div class="col-sm-2 pull-right" style="text-align: right;">
                  	<span class="glyphicon glyphicon-plus-sign theme-clr "
								aria-hidden="true"></span><span class="theme-clr addmore" id="pre_project"> Add More&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>

						</div>



					</div>








			




			</div>
			<!--inner container end here-->


			<div class="button-wrapper">


				<input name="btn1" class="btn-style" value="Previous" type="button"
					onclick="pervForm('editProjectDetailsForm')" /> 
					<input	name="btn1" class="btn-style" value="Next"  type="submit">
			</div>

			<br>



		</div>
		<!-- container end here-->


	</div>
	</form:form>
