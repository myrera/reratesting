function changeLabelText(id, text, val) {
	$(id).text(text);
	$('#nextForm').val(val);

}

function moveSelectedTrends() {
	var trends = document.getElementById('trends'), trend, i;

	for (i = 0; i < trends.length; i++) {
		trend = trends[i];
		if (trend.selected) {
			alert(trend.value);
		}
	}
}


function validateDate(stDate, endDate, msg) {
	var dt = stDate.value;
	var dt2 = endDate.value;

	var splitDt = dt.split('/');
	var splitDt2 = dt2.split('/');
	var DtDate = parseInt(splitDt[0]);
	var DtMo = parseInt(splitDt[1]);
	var DtYr = parseInt(splitDt[2]);
	var Dt2Date = parseInt(splitDt2[0]);
	var Dt2Mo = parseInt(splitDt2[1]);
	var Dt2Yr = parseInt(splitDt2[2]);
	if (DtYr < Dt2Yr) {
		return true;
	}
	if (Dt2Yr == DtYr && DtMo < Dt2Mo) {
		return true;
	}
	if (Dt2Yr == DtYr && Dt2Mo == DtMo && DtDate < Dt2Date) {
		return true;
	}
	alert(msg);
	endDate.focus();
	return false;
}

var _chkclk=true;
function projectForm() {
	
	  var frm= $("#trxForm");
	   if(validateForm(frm)){

		if(_chkclk){   
			_chkclk=false;
		$(frm).submit();
	   }
		}
	

	
}

function nextProjectDetailsForm() {

   var frm= $("#trxForm");
   if(validateForm(frm)){
	   if(_chkclk){   
			_chkclk=false;
		$(frm).submit();
	   }   }

}

function saveOrUpdateCompanyPromoter() {

	   var frm= $("#trxForm");
	   if(validateForm(frm)){

	if(_chkclk){   
		_chkclk=false;
	$(frm).submit();
   }
	
	   }

}

function editSaveOrUpdateCompanyPromoter() {
	
	   var frm= $("#trxForm");
	   if(validateForm(frm)){

		   if(_chkclk){   
				_chkclk=false;
			$(frm).submit();
		   }   }
}


function nextProjectPaymentForm() {
	   var frm= $("#trxForm");
	   if(validateForm(frm)){
		   if(_chkclk){   
				_chkclk=false;
			$(frm).submit();
		   }	   }
}

function saveOrUpdatePayment() {
	   var frm= $("#trxForm");
	   if(validateForm(frm)){
		   if(_chkclk){   
				_chkclk=false;
			$(frm).submit();
		   }	   }}

function saveProjectDetailsForm() {
	   var frm= $("#trxForm");
	   if(validateForm(frm)){
	 
		   var sd=$('#startdatefld').val();
		   var ed=$('#enddatefld').val();
		   if(checkdate(sd,ed)){
		   
		   if(_chkclk){   
				_chkclk=false;
			$(frm).submit();
		   }	  
		   
		   }
	   
	   }
}




function saveOrUpdateProjectDetailsForm() {
	   var frm= $("#trxForm");
	   if(validateForm(frm)){
	   var sd=$('#startdatefld').val();
	   var ed=$('#enddatefld').val();
	   if(checkdate(sd,ed)){
		   if(_chkclk){   
				_chkclk=false;
			$(frm).submit();
		   }	   }}
}

function checkdate(sd,ed){
	if(sd!='' && ed!=''){
	if(parsedate(sd)>=parsedate(ed)){
		alert("End date should be grater than start date.");
		return false;
	}else{
		return true;
	}
	}
}

function parsedate(str){
	if(str!=''){
		var dt=new Date();
	var st=	str.split('/');
	dt.setDate(st[0]);
	dt.setMonth(st[1]);
	dt.setFullYear(st[2], st[1], st[0]);
	dt.setHours(0,0,0,0);
	return dt;
	}
	return null;
}


function saveOrUpdateProjectDetailsForm() {

	   var frm= $("#trxForm");
	   if(validateForm(frm)){

		   if(_chkclk){   
				_chkclk=false;
			$(frm).submit();
		   }
		   }
}


function getAgentDetails() {

	var agentRegNo = $('#agentRegNo').val();
	alert(agentRegNo);
	if(agentRegNo.trim()==''){
		alert('Enter the agent registration');
		return false;
	}
	
	$.ajax({
		type : "GET",
		url : "getAgentDetailforProjectReg",
		data : "agentRegNo=" + agentRegNo,
		success : function(response) {
			alert('call---'+response+"ID--"+Obj.name);
			
		},

		error : function(e) {
        
		}

	});

}

function pervForm(url) {

	$(document).on("click", function(e) {
		// e.preventDefault();
		$('#trxForm').attr('action', url).submit();
	});

}




function checkOldPassword(){
	var currentPass=  $('#password').val();
	var oldPassword=  $('#oldPassword').val();
	
	 
	
	var newpassword=$('#new_password').val();
	var conFirmPassword=$('#conFirmPassword').val();
	
	if(oldPassword.trim()==''){
		alert("Please enter your oldPassword");
		$('#oldPassword').focus();
	    return false;
	}
 
	/*if(oldPassword.trim()!=currentPass){
		alert("Please enter your valid old Password");
		$('#oldPassword').focus();
		return false;
	}*/
 
	if(newpassword.trim()==''){
		alert("Please enter your new  Password");
		$('#new_password').focus();
		return false;
	}else{
		 var minNumberofChars = 8;
		//    var maxNumberofChars = 8;
		    var regularExpression  = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,16}$/;

		    if(newpassword.length < minNumberofChars){
		    	alert("Password must contain atleast 8 characters ");
		    	$('#new_password').focus();
		        return false;
		    }
		    if(!regularExpression.test(newpassword)) {
		        alert("password should contain atleast one number and one special character");
		        $('#new_password').focus();
		        return false;
		    }
	}
	
	
	if(conFirmPassword.trim()==''){
		alert("Please enter your new  confirm password");
		$('#conFirmPassword').focus();
		return false;
	}
	if(newpassword!=conFirmPassword){
		alert("Entered password does not match");
		return false;
		
	}
	
	 $('#password').val(Base64.encode(currentPass));
	 $('#newpassword').val(Base64.encode(newpassword));
	
	 
	  $('#oldPassword').val('');
		$('#new_password').val('');
	$('#conFirmPassword').val('');
	
	
	$('#changePass').submit();
	
	
 
}

function showFees(){
	//alert("shown");
	document.getElementById(feesTransaction).style.display = 'none';
	document.getElementById(penalTransaction).style.display = 'block';
	
}

function showPenalty(){
	//alert("hided");
	document.getElementById(penalTransaction).style.display ='block';
	document.getElementById(feesTransaction).style.display = 'none';
}

function showPenalTransaction(){
	//alert(count);
	showPenalty();
}

function showFeesTransaction(){
	//alert(count);
	showFees();
}
