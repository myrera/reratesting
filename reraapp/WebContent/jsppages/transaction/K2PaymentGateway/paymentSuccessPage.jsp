<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
  
<script>
function submitK2Payment(){
	//alert("hi");
var frm= $("#K2PaymentSuccessForm");
$(frm).submit();
}

time = 45;
interval = setInterval(function() {
    time--;
    document.getElementById('time').innerHTML = "" + time + " seconds"
    if (time == 0) {
        // stop timer
        clearInterval(interval);
        // click
        document.getElementById('redirect').click();            
    }
}, 1000)

function printReceipt() {
    window.print();
}
</script>

<script>
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
		doc.save("${challan_ref_no}.pdf");
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
						name : 'Payment Acknowledgement',
						email : 'Real Estate Regulatory Authority Government of Karnataka'
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
						name : 'Bank_transaction_no',
						email : '${Bank_transaction_no}'
					});
					
					data.push({
						id : 1,
						name : 'challan_amount',
						email : '${challan_amount}'
					});
					
					data.push({
						id : 1,
						name : 'challan_ref_no',
						email : '${challan_ref_no}'
					});
					
					data.push({
						id : 1,
						name : 'Bank_name',
						email : '${Bank_name}'
					});
					
					data.push({
						id : 1,
						name : 'Payment_mode',
						email : '${Payment_mode}'
					});
					
					data.push({
						id : 1,
						name : 'trsn_timestamp',
						email : '${trsn_timestamp}'
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

</head>
<body>

	<div class="breadcrumb">Payment Receipt</div>

	<div class="container">

		<div class="stepwizard col-md-offset-1">
			<div class="stepwizard-row setup-panel ">

			</div>
		</div>

	</div>

	<!--News Ticker-->
	<div class="container">

		<!--main container start here-->
		<div class="containner">

			<!--Inner wrapper start here-->
			<div class="">

				<h1 style="padding-left=300px">
					Payment Confirmation<span></span>
				</h1>
				<div class="border">
					<div class="orange"></div>
					<div class="black"></div>
				</div>

				<h1 style="text-align: center;">${StatusDescryption}</h1>
				
	<br/>
	<div style="padding-left:200px;padding-right:200px;">
	<table class="table table-bordered" id="allProjectList">
	
        <thead>
            <tr>
            <th colspan="2"><center>Payment Acknowledgement</center></th>
            </tr>
        </thead>
        <tbody>
        <tr>
        <tr>
    <th>Bank_transaction_no</th>
    <td>${Bank_transaction_no}</td>
 		 </tr>
 		 <tr>
        <th>challan_amount</th>
    <td>${challan_amount}</td>
 		 </tr>
 		  <tr>
        <th>challan_ref_no</th>
    <td>${challan_ref_no}</td>
 		 </tr>
 		 <tr>
        <th>Bank_name</th>
    <td>${Bank_name}</td>
 		 </tr>
 		  <tr>
        <th>Payment_mode</th>
    <td>${Payment_mode}</td>
 		 </tr>
 		  <tr>
        <th>trsn_timestamp</th>
    <td>${trsn_timestamp}</td>
 		 <tr> 
 		 <td colspan="2">
 		 
 		 <%String action=null; %>
 		 
 		 <c:if test="${redirection=='rerauser' }">
 		 <%action="rerauser/K2TempPaymentSuccess"; %>
 		 </c:if>
 		 <c:if test="${redirection=='reraapp' }">
 		 <%action="K2PaymentSuccess"; %>
 		 </c:if>
 		 
 		 <form action="<%=action%>" name="K2PaymentSuccess" id="K2PaymentSuccessForm">
 		 <input type="hidden" name="bankTransactionNumber" value="${Bank_transaction_no}"/>
				<input type="hidden" name="paymentStatusCode" value="${Status}"/>
				<input type="hidden" name="k2ReferenceNumber" value="${challan_ref_no}"/>
				<input type="hidden" name="transactionTime" value="${trsn_timestamp}"/>
				<input type="hidden" name="amount" value="${challan_amount}"/>
				<input type="hidden" name="paymentMode" value="${Payment_mode}"/>
				<input type="hidden" name="bankName" value="${Bank_name}"/>
 		 
 		 <div class="row" style="text-align:center">
<input name="online PAyment" class="btn-style" id="redirect"  value="Redirect to complete Registration" onclick="submitK2Payment()" type="button"/>
<p id='time' style="text-align:center"></p>
<input class="btn-style" onclick="printReceipt()" value="Print Receipt" type="button"/>
<input type="button" class="btn-style" value="Download as Pdf" onclick="downloadPdf()"/>
</div>

</form>
</td>
 		 </tr> 		 
        </tbody>
        </table>
        </div>
	
              	</div>
				<br> <br> <br>

			</div>
			<!--inner container end here-->

			<br>

		</div>
		<!-- container end here-->

</body>
</html>