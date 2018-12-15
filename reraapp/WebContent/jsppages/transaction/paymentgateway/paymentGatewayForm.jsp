
<html>

<script>
var hash='${pay.hash}';
function submitPayuForm() {
	
	if (hash == '')
		return;

      var payuForm = document.forms.payuForm;
      payuForm.submit();
    }
</script>

<body onload="submitPayuForm();">


<form action="${pay.action}" method="post" name="payuForm">
<input type="hidden" name="key" value="${pay.key}" />
      <input type="hidden" name="hash" value="${pay.hash}"/>
      <input type="hidden" name="txnid" value="${pay.txnid}" />
      
       <input type="hidden" name="amount" value="${pay.amount}"/>
      <input type="hidden" name="firstname" value="${pay.firstname}" />
      
        <input type="hidden" name="email" value="${pay.email}"/>
      <input type="hidden" name="phone" value="${pay.phone}" />
      
      <input type="hidden" name="productinfo" value="${pay.productinfo}"/>
      <input type="hidden" name="surl" value="${pay.surl}" />
      
       <input type="hidden" name="furl" value="${pay.furl}"/>
      <input type="hidden" name="curl" value="${pay.curl}" />
      
       <input type="hidden" name="udf1" value="${pay.udf1}" />
      
       </form>
<div align="center" style="height: 300px; width:100%;">
<h1> Please wait! ...</h1>
</div>
</body>
</html>