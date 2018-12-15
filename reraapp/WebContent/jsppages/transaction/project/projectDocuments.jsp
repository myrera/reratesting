<%@page import="in.gov.rera.common.security.ReraSecurity"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@page import="in.gov.rera.common.util.ReraConstants"%>
<%@page import="in.gov.rera.common.model.UserModel"%>
<%
UserModel user=(UserModel)session.getAttribute(ReraConstants.SES_USER_ATTR);

%>

    
    <div class="breadcrumb">Home /Project Dash Board<span class="pull-right user_name">Welcome :<b><%=user.getUserName() %> </b></span></div>


<!--News Ticker-->
<div class="container">



	<body>
   
   

    
		<div class="col-md-12 col-sm-12">
			
			<div class="Main_containner">

<!--Inner wrapper stsrt here-->
<div class="inner_wrapper">



<div class="drop_shadow"></div>

    <br>

     <div class="col-md-12">
     <h1>Project <span> Documents</span></h1>
     <div class="drop_shadow"></div>
     </div>
 
  
  
  
  
  
<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">PAN Card <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${projectReg.projectDocModel.panCardDoc.documentId}'>${projectReg.projectDocModel.panCardDoc.fileName }</a></p></div>
	</div>
	

		</div>	
			
		
<div class="inner_wrapper">
		
		<h1>Project  <span>Approval</span></h1>
			<div class="drop_shadow"></div>

	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">Commencement Certificate<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${projectReg.projectDocModel.encumbranceCertificateDoc.documentId}'>${projectReg.projectDocModel.encumbranceCertificateDoc.fileName }</a> </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Approved Sanctioned Plan<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${projectReg.projectDocModel.approveSacPlanDoc.documentId}'>${projectReg.projectDocModel.approveSacPlanDoc.fileName }</a>  </p></div>
	</div>
	
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">Approved Layout Plan <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${projectReg.projectDocModel.approveLayoutPlanDoc.documentId}'>${projectReg.projectDocModel.approveLayoutPlanDoc.fileName }</a> </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">Legal Title Deed (Agreement)<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${projectReg.projectDocModel.agreementFileDoc.documentId}'>${projectReg.projectDocModel.agreementFileDoc.fileName }</a>  </p></div>
	</div>
	
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">Sale Deed & RTC<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${projectReg.projectDocModel.landLocationFileDoc.documentId}'>${projectReg.projectDocModel.landLocationFileDoc.fileName }</a> </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">Sanctioned Layout Plan<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${projectReg.projectDocModel.sanctionedLayoutPlanDoc.documentId}'>${projectReg.projectDocModel.sanctionedLayoutPlanDoc.fileName }</a> </p></div>
	</div>
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">Area Development Plan<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${projectReg.projectDocModel.areaDevelopmentDoc.documentId}'>${projectReg.projectDocModel.areaDevelopmentDoc.fileName }</a> </p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">Performa of Allotment Letter<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${projectReg.projectDocModel.performaOfAllotmentLetterDoc.documentId}'>${projectReg.projectDocModel.performaOfAllotmentLetterDoc.fileName }</a> </p></div>
	</div>
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">Brochure of Current Project<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${projectReg.projectDocModel.brochureOfCurrentProjectDoc.documentId}'>${projectReg.projectDocModel.brochureOfCurrentProjectDoc.fileName }</a></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">Project Related Documents<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${projectReg.projectDocModel.projectRelatedDoc.documentId}'>${projectReg.projectDocModel.projectRelatedDoc.fileName }</a> </p></div>
	</div>
		<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">Project Specification<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${projectReg.projectDocModel.projectSpecificDoc.documentId}'>${projectReg.projectDocModel.projectSpecificDoc.fileName }</a></p></div>
		
	</div>
	
	<!--  Start added new 3 docs -->
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">Conveyance Deed / Title Deed(Khatha)<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${projectReg.projectDocModel.titleDeed.documentId}'>${projectReg.projectDocModel.titleDeed.fileName }</a></p></div>
	
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">Collaboration Agreement/Development Agreement/Joint Development Agreement/Other Agreement<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${projectReg.projectDocModel.jointDevelopmentAgreement.documentId}'>${projectReg.projectDocModel.jointDevelopmentAgreement.fileName }</a></p></div>
		
	</div>
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">Any other document (Rights/Title/Interest/Name) <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${projectReg.projectAddDocModel.anyOtherDoc.documentId}'>${projectReg.projectAddDocModel.anyOtherDoc.fileName }</a></p></div>
		
	</div>
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">Approval/NOC under section 109 of KLR Act 1961 <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${projectReg.projectAddDocModel.section109.documentId}'>${projectReg.projectAddDocModel.section109.fileName }</a></p></div>
		
	</div> 
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">Conversion Certificate under Sec 95 of the KLR Act 1961 <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${projectReg.projectAddDocModel.section95.documentId}'>${projectReg.projectAddDocModel.section95.fileName }</a></p></div>
		
	</div>
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">Approval/NOC under Sec 14 of the KTCP Act<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${projectReg.projectAddDocModel.section14.documentId}'>${projectReg.projectAddDocModel.section14.fileName }</a></p></div>
		
	</div>
	
	<!-- Added by Suneetha -->
	<%-- <div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Utilisation certificate<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${projectReg.projectAddDocModel.utilisationCert.documentId}'>${projectReg.projectAddDocModel.utilisationCert.fileName }</a></p></div>
		
	</div>
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Transfer of development rights certificate<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${projectReg.projectAddDocModel.transferOfDevRightsCert.documentId}'>${projectReg.projectAddDocModel.transferOfDevRightsCert.fileName }</a></p></div>
		
	</div>
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Relinquishment Deed<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${projectReg.projectAddDocModel.relinquishmenDeed.documentId}'>${projectReg.projectAddDocModel.relinquishmenDeed.fileName }</a></p></div>
		
	</div> --%>
	
	<div class="drop_shadow"></div>
	
	<h1>No Objection   <span>Certificates</span></h1>
			<div class="drop_shadow"></div>
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">Fire Force Department<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${projectReg.projectAddDocModel.fireForceDept.documentId}'>${projectReg.projectAddDocModel.fireForceDept.fileName }</a></p></div>
		
	<!-- </div>
	
	<div class="row"> -->
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">Airport Authority of India<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${projectReg.projectAddDocModel.airportAuthorityOfIndia.documentId}'>${projectReg.projectAddDocModel.airportAuthorityOfIndia.fileName }</a></p></div>
		
	</div>
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">BESCOM<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${projectReg.projectAddDocModel.bescom.documentId}'>${projectReg.projectAddDocModel.bescom.fileName }</a></p></div>
		
	<!-- </div>
	
	<div class="row"> -->
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">BWSSB<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${projectReg.projectAddDocModel.bwssb.documentId}'>${projectReg.projectAddDocModel.bwssb.fileName }</a></p></div>
		
	</div>
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">KSPCB<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${projectReg.projectAddDocModel.kspcb.documentId}'>${projectReg.projectAddDocModel.kspcb.fileName }</a></p></div>
		
	<!-- </div>
	
	<div class="row"> -->
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">SEIAA<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${projectReg.projectAddDocModel.seiaa.documentId}'>${projectReg.projectAddDocModel.seiaa.fileName }</a></p></div>
		
	</div>
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">BSNL<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${projectReg.projectAddDocModel.bsnl.documentId}'>${projectReg.projectAddDocModel.bsnl.fileName }</a></p></div>
		
	<!-- </div>
	
	 <div class="row"> -->
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">NOC in case of building proposals abutting to neighbouring properties<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${projectReg.projectNewFileDocModel.nocBuildingAbuttingToNeighbourProperties.documentId}'>${projectReg.projectNewFileDocModel.nocBuildingAbuttingToNeighbourProperties.fileName }</a></p></div>
		
	</div>
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">Lift Authorities<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${projectReg.projectAddDocModel.liftAuthorities.documentId}'>${projectReg.projectAddDocModel.liftAuthorities.fileName }</a></p></div>
		
	<!-- </div>   
	
	<div class="row"> -->
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">Urban Land Ceiling<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${projectReg.projectAddDocModel.conveyanceDeed.documentId}'>${projectReg.projectAddDocModel.conveyanceDeed.fileName }</a></p></div>
		
	</div>
	
	 <div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">BMRCL<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${projectReg.projectAddDocModel.bmrcl.documentId}'>${projectReg.projectAddDocModel.bmrcl.fileName }</a></p></div>
		
	<!-- </div>
	
    <div class="row"> -->
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">Bangalore Urban Arts Commission<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${projectReg.projectNewFileDocModel.bangaloreUrbanArtsCommission.documentId}'>${projectReg.projectNewFileDocModel.bangaloreUrbanArtsCommission.fileName }</a></p></div>
		
	</div> 
	
	  <div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">Inspector of Factories Controller of explosives Railways<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${projectReg.projectAddDocModel.inspectorOfFactoriesCntrlOfExplosivesRailways.documentId}'>${projectReg.projectAddDocModel.inspectorOfFactoriesCntrlOfExplosivesRailways.fileName }</a></p></div>
		
	<!-- </div>
	
	<div class="row"> -->
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">Dist Magistrate<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${projectReg.projectAddDocModel.distMagistrate.documentId}'>${projectReg.projectAddDocModel.distMagistrate.fileName }</a></p></div>
		
	</div> 
	
		<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">Coastal Regulation Zone Authority<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${projectReg.projectAddDocModel.coastalRegulationZoneAuthority.documentId}'>${projectReg.projectAddDocModel.coastalRegulationZoneAuthority.fileName }</a></p></div>
		
	<!-- </div>  
	
	  <div class="row"> -->
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">Certificate from Registered Engineer indicating the structural safety of the building (for Apartments) (1 MB)<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${projectReg.projectAddDocModel.engrIndicateStructural.documentId}'>${projectReg.projectAddDocModel.engrIndicateStructural.fileName }</a></p></div>
		
	</div>  
	
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">Sectional Drawing of the apartments(5 MB)<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectAddDocModel.sectionalDrawingOfTheApartments.documentId}'>${project.projectAddDocModel.sectionalDrawingOfTheApartments.fileName }</a></p></div>
		
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">Change of Land Use<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.changeOfLandUse.documentId}'>${project.projectDocModel.changeOfLandUse.fileName }</a></p></div>
	</div>   
	<!-- End of Suneetha -->
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">Existing Layout Plan<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.existingLayoutPlan.documentId}'>${project.projectDocModel.existingLayoutPlan.fileName }</a></p></div>
		
	
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">Existing Section Plan and Specification<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.existingSectionPlanandSpec.documentId}'>${project.projectDocModel.existingSectionPlanandSpec.fileName }</a></p></div>
		
	</div>
	
		<%-- <div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right">Change of Land Use<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectDocModel.changeOfLandUse.documentId}'>${project.projectDocModel.changeOfLandUse.fileName }</a></p></div>
		
	</div>
	 --%>
	<div class="drop_shadow"></div>	
<h1>Benefit of Development <span>Rights</span></h1>
<div class="drop_shadow"></div>	
			
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">Utilisation certificate<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectAddDocModel.utilisationCert.documentId}'>${project.projectAddDocModel.utilisationCert.fileName }</a></p></div>
	
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">Transfer of development rights certificate<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectAddDocModel.transferOfDevRightsCert.documentId}'>${project.projectAddDocModel.transferOfDevRightsCert.fileName }</a></p></div>
		
	 </div>
	
	<div class="row"> 
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">Relinquishment Deed<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${project.projectAddDocModel.relinquishmenDeed.documentId}'>${project.projectAddDocModel.relinquishmenDeed.fileName }</a></p></div>
		
	</div>
	
	
		<!--  end added new 3 docs -->
				
			</div>									
			
<div class="inner_wrapper">
		
		<h1>Financial   <span>Document</span></h1>
			<div class="drop_shadow"></div>

	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">Audited Balance Sheet (2014)<span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${projectReg.projectDocModel.auditedBalSheetDoc1.documentId}'>${projectReg.projectDocModel.auditedBalSheetDoc1.fileName }</a></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">Audited Balance Sheet (2015)<span class="space_LR">:</span></p></div>
     <div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${projectReg.projectDocModel.auditedBalSheetDoc2.documentId}'>${projectReg.projectDocModel.auditedBalSheetDoc2.fileName }</a></p></div>
	</div>
	
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">Audited Balance Sheet (2016) <span class="space_LR">:</span></p></div>
	<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${projectReg.projectDocModel.auditedBalSheetDoc3.documentId}'>${projectReg.projectDocModel.auditedBalSheetDoc3.fileName }</a></p></div>
			<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">Audited ProfitLoss Statement (2014) <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${projectReg.projectDocModel.auditedProfitLossSheetDoc1.documentId}'>${projectReg.projectDocModel.auditedProfitLossSheetDoc1.fileName }</a> </p></div>
	</div>
	
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">Audited ProfitLoss Statement (2015) <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${projectReg.projectDocModel.auditedProfitLossSheetDoc2.documentId}'>${projectReg.projectDocModel.auditedProfitLossSheetDoc2.fileName }</a></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">Audited ProfitLoss Statement (2016) <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${projectReg.projectDocModel.auditedProfitLossSheetDoc3.documentId}'>${projectReg.projectDocModel.auditedProfitLossSheetDoc3.fileName }</a> </p></div>
	</div>
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">Director's Report (2014) <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${projectReg.projectDocModel.directorReportDoc1.documentId}'>${projectReg.projectDocModel.directorReportDoc1.fileName }</a></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">Director's Report (2015) <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${projectReg.projectDocModel.directorReportDoc2.documentId}'>${projectReg.projectDocModel.directorReportDoc2.fileName }</a> </p></div>
	</div>
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">Director's Report (2016) <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${projectReg.projectDocModel.directorReportDoc3.documentId}'>${projectReg.projectDocModel.directorReportDoc3.fileName }</a></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">Cash Flow Statement (2014) <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${projectReg.projectDocModel.cashFlowStmtFileDoc1.documentId}'>${projectReg.projectDocModel.cashFlowStmtFileDoc1.fileName }</a> </p></div>
	</div>
	
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">Cash Flow Statement (2015) <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${projectReg.projectDocModel.cashFlowStmtFileDoc2.documentId}'>${projectReg.projectDocModel.cashFlowStmtFileDoc2.fileName }</a></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">Cash Flow Statement (2016) <span class="space_LR">:</span></p></div>
		<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${projectReg.projectDocModel.cashFlowStmtFileDoc2.documentId}'>${projectReg.projectDocModel.cashFlowStmtFileDoc3.fileName }</a> </p></div>
	</div>
	
	
</div>
	
	<div class="inner_wrapper">
		
		<h1>Declaration   </h1>
			<div class="drop_shadow"></div>

	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-left">Declaration (Form B)<span class="space_LR">:</span></p></div>
			<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${projectReg.projectDocModel.declarationFormbDoc.documentId}'>${projectReg.projectDocModel.declarationFormbDoc.fileName }</a> </p></div>
	
	</div>

</div>

<div class="inner_wrapper">
		
		<h1>Other Documents  </h1>
			<div class="drop_shadow"></div>

<c:forEach items="${projectReg.projectDocModel.otherDocumentSet }" var="doc" >
	<div class="row">
		<div class="col-md-3 col-sm-6 col-xs-6"><p class="text-right"><span class="space_LR">${doc.caption }:</span></p></div>
			<div class="col-md-3 col-sm-6 col-xs-6" ><p><a href='<%=request.getContextPath() %>/download?DOC_ID=${doc.documentId}'>${doc.fileName }</a> </p></div>
	
	</div>
</c:forEach>
</div>





<div class="inner_wrapper">
 
   

          <!-- Standar Form -->
          <h1>Select file from your <span> computer</span></h1>
        <div class="drop_shadow"></div>
          <form action="updateProjectDocuments" autocomplete="off" method="post" class="form-horizontal" enctype="multipart/form-data" id="js-upload-form">
           <%=ReraSecurity.writeToken(request) %>
           <div class="form-group">
		<label for="inputEmail3" class="col-sm-3 control-label">Caption:</label>
				<div class="col-sm-3">
				<input type="text" name="caption" class="form-control" />
				</div>
				
				<label for="inputEmail3" class="col-sm-2 control-label">File:</label>
				<div class="col-sm-3">
					<input type="file" name="attachments" class="form-control" />
				</div>
</div>
            <div class="form-group">		
				
				<div class="col-sm-3 col-md-offset-3">
				<input name="btn1" class="btn-style"  value="Upload" type="button" onclick="updateProjectDocs()" />
				</div>						
	</div>	
           
          </form>

		</div>	
		<script>
		function updateProjectDocs(){
			var _frm=$('#js-upload-form');
			if(validateForm(_frm)){
				$(_frm).submit();
			}
		}
		</script>
		

	</div>
<!--inner container end here-->





</div>
			
		</div>
	
	


