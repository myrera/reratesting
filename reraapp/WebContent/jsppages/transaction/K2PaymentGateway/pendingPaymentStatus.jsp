	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.5/jspdf.debug.js" integrity="sha384-CchuzHs077vGtfhGYl9Qtc7Vx64rXBXdIAZIPbItbNyWIRTdG0oYAqki3Ry13Yzu" crossorigin="anonymous"></script>
<script src="<%=request.getContextPath()%>/resources/pdf/jspdf.debug.js" ></script>
<script src="<%=request.getContextPath()%>/resources/pdf/jspdf.plugin.autotable.js"></script>

</head>
<body>
<script>

function submitK2Payment(){
	//alert("hi");
var frm= $("#K2PaymentSuccessForm");
$(frm).submit();
}

function printReceipt() {
    window.print();
}
var data = [];

function downloadPdf() {
	var doc = new jsPDF();
	
	doc.autoTable(getColumns().splice(1, 4), data, {
		showHeader : 'never',
		styles : {
			overflow : 'linebreak'
		},
		columnStyles : {
			name : {
				fillColor : [ 190, 100, 34 ],
				textColor : 255,
				fontStyle : 'bold',
				columnWidth : 50
			},
			email : {
				columnWidth : 'auto'
			}
		}

	});
	doc.save("${deptRefNum}.pdf");
}

//Returns a new array each time to avoid pointer issues

var getColumns = function() {
	return [
	{
		title : "ID",
		dataKey : "id"
	},

	{
		title : "Name",
		dataKey : "name"
	},

	{
		title : "Email",
		dataKey : "email"
	}, ];

};
</script>

<script>
					data.push({
						id : 1,
						name : 'Pending Payment Acknowledgement',
						email : ''
					});

					data.push({
						id : 1,
						name : '',
						email : ''
					});
					
					data.push({
						id : 1,
						email : '${StatusDescryption}'
					});
					
					data.push({
						id : 1,
					});
					
					data.push({
						id : 1,
						name : 'challan_amount',
						email : '${paidAmount}'
					});
					
					data.push({
						id : 1,
						name : 'challan_ref_no',
						email : '${deptRefNum}'
					});
					
					data.push({
						id : 1,
						name : 'Bank_name',
						email : '${bankName}'
					});
					
					data.push({
						id : 1,
						name : 'Payment_mode',
						email : '${pymntMode}'
					});
					
					data.push({
						id : 1,
						name : 'trsn_timestamp',
						email : '${currentTimeStamp}'
					});
					
					data.push({
						id : 1,
						name : '',
						email : ''
					});
					
					data.push({
						id : 1,
						email : 'This is a computer generate e-Acknowledgement and does not require any signature'
					});
					
					</script>

	<div class="breadcrumb">Payment Pending status</div>
	
	<!--News Ticker-->
	<div class="container">

		<!--main container start here-->
		<div class="Main_containner">

			<!--Inner wrapper start here-->
			<div class="inner_wrapper">

				<h1>
					Payment Status<span></span>
				</h1>
				<div class="border">
					<div class="orange"></div>
					<div class="black"></div>
				</div>
				
				
				<div class="form-group" id="">
						
						 <label class="col-sm-3 control-label">Challan reference number
						</label>
						<div class="col-sm-3">
							<input type="text" class="form-control requiredValFld" name="challanrefNum" id="penaltyAmtId" value=""/>
						</div>
						<!-- <label class="col-sm-3 control-label"> </label> -->
						<div class="col-sm-3">
					<a href=''  onclick="this.href='verifyChallan?challanrefNum='+document.getElementById('penaltyAmtId').value">
					<input name="online PAyment" class="btn-style" value="submit" type="button"/></a>
						</div>
				</div>
				
				
				
				<br/><br/>
				<h1 style="text-align: center;">${StatusDescryption}</h1>
				<h1 style="text-align: center;">${challanStatus}</h1>
				
	<br/>
	
	<c:if test="${StatusDescryption!=null}">
	<div style="padding-left:200px;padding-right:200px;" id="verifyChallan">
	<table class="table table-bordered" id="allProjectList">
	
        <thead>
            <tr>
            <th colspan="2"><center>Payment Status</center></th>
            </tr>
        </thead>
        <tbody>
        <tr>
    <th>challan_ref_no</th>
    <td>${deptRefNum}</td>
 		 </tr>
 		 <tr>
        <th>challan_amount</th>
    <td>${paidAmount}</td>
 		 </tr>
 		  
 		 <tr>
        <th>Bank_name</th>
    <td>${bankName}</td>
 		 </tr>
 		  <tr>
        <th>Payment_mode</th>
    <td>${pymntMode}</td>
 		 </tr>
 		 <tr>
        <th>trsn_timestamp</th>
    <td>${currentTimeStamp}</td>
 		 </tr>
 		 <tr>
 		 <td colspan="2">
 		 <div class="row" style="text-align:center">
 		 <c:if test="${statusCode=='10700066'}">
<input name="online PAyment" class="btn-style" id="redirect"  value="Redirect to complete Registration" onclick="submitK2Payment()" type="button"/>
</c:if>
<input class="btn-style" onclick="printReceipt()" value="Print Receipt" type="button"/>
<input type="button" class="btn-style" value="Download as Pdf" onclick="downloadPdf()"/>
</div>
 		 </td>
 		 
 		 </tr>
 		 
 		  </tbody>
 		  </table>
 		  
 		   <%String action=null; %>
 		 
 		 <c:if test="${redirection=='rerauser' }">
 		 <%action="rerauser/project/K2PendingPaymentSuccess"; %>
 		 </c:if>
 		 <c:if test="${redirection=='reraapp' }">
 		 <%action="K2PendingPaymentSuccess"; %>
 		 </c:if>
 		 
 		  <form action="<%=action%>" name="K2PaymentSuccess" id="K2PaymentSuccessForm">
				<input type="hidden" name="paymentStatusCode" value="${statusCode}"/>
				<input type="hidden" name="k2ReferenceNumber" value="${deptRefNum}"/>
				</form>
				<br/><br/>
	
              	</div>
              	</c:if>
              	<!-- <div class="form-group" id="">
              	<label class="col-sm-3 control-label"> </label>
						<div class="col-sm-3">
<input name="online PAyment" class="btn-style" value="Click Here For Online Payment" type="button"/>
						</div>
						</div> -->
						
				<br> <br> <br>





			</div>
			<!--inner container end here-->


			<br>



		</div>
		<!-- container end here-->


	</div>


</body>
</html>