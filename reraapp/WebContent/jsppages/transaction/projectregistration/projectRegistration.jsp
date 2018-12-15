<%@page import="in.gov.rera.common.security.ReraSecurity"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<script src="<%=request.getContextPath() %>/resources/projectjs/projectJs.js"></script>

	<form:form method="POST" autocomplete="off" modelAttribute="projectRegistrationModel" action="invOrComProjectRegForm" id="trxForm">
		<%=ReraSecurity.writeToken(request) %>

		<div class="breadcrumb">Home / Real Estate Project Registration</div>


		<!--News Ticker-->
		<div class="container">

			<!--main container start here-->
			<div class="Main_containner">

				<!--Inner wrapper stsrt here-->
				<div class="inner_wrapper">

                 

					<h1>
						Registration <span> Form</span>
					</h1>
					<div class="border">
						<div class="orange"></div>
						<div class="black"></div>
					</div>

<div>
<b>NOTE:</b>
<br/>
Please use dedicated email id and remember it for all future official communication.

</div>

					<form class="form-horizontal">
						<br> <label class="col-sm-2 control-label">Promoter
							Type</label>
						<div class="radio ">
							<label> <input type="radio" name="optionsRadios"
								id="optionsRadios1" value="option1" checked  onclick="changeLabelText('#emailIdLabel','Email ID','projectRegInvForm')"/> 
								Individual
								
								
							</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label> <input
								type="radio" name="optionsRadios" onclick="changeLabelText('#emailIdLabel','Business Email ID','projectRegComForm')" id="optionsRadios1"
								value="option1" /> Societies / Company/Partnership firm/Proprietorship firm /Development Authority / Trust Agents 
								<input type="hidden" name="nextForm" id="nextForm" value='projectRegInvForm'>
							</label>
                            
						</div>
						<br>


						<div class="form-group">
							<label class="col-sm-2 control-label" id="emailIdLabel">Email ID<sup>*</sup></label>
							<div class="col-sm-3">
								<input type="email" class="form-control input-sm emailValFld requiredValFld"
									id="emailId" placeholder="" name="emailId" maxlength="100">
									<span class='requiredValFldMsg'> Please enter Email Id.</span>
							</div>


						</div>




					</form>


					<br> <br>



				</div>
				<!--inner container end here-->


				<div class="button-wrapper">
					<input name="btn1" class="btn-style" value="Next" type="button" onclick="projectForm()"/>
				</div>

				<br>



			</div>
			<!-- container end here-->


		</div>


	</form:form>

	
	<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true"  id="onload_popup">

    <div class="modal-dialog">

      <!-- Modal content-->
      <div class="modal-content "> 
	  

        <div class="modal-body " style="text-align:center; height:300px;font-size:14px; color:#be6422; font-weight:bold;">
        <br/><br/><br/><br/><br/><br/>
        To ensure quick application submission, please go through below checklist and keep them ready before filling application online <br/>
<br/>
             A.  Checklist of Key Information Required <a href="<%=request.getContextPath() %>/resources/staticpage/Checklist_for_Key_Information.pdf" target="_blank"> download  </a><br/>

             B.   Checklist of Key Documents Required <a href="<%=request.getContextPath() %>/resources/staticpage/Checklist_for_Documents.pdf" target="_blank"> download  </a> <br/>
             
             
		 <button type="button" class="close" data-dismiss="modal">X</button>
     
      </div>

    </div>
</div>
</div>
<script>
    $(window).load(function(){
                $('#onload_popup').modal('show');
            });

</script> 