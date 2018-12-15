function changeLabelText(id, text, val) {
	/* alert("changeLabelText") */
	$(id).text(text);
	$('#nextForm').val(val);
}

function checkIfsc(fld) {
	obj = fld.value;
	var char = /^[A-Za-z]{4}[0-9]{6,7}$/;
	if (obj != '') {
		if (!obj.match(char)) {
			alert("Please enter valid IFSC Code");
			fld.focus();
			return false;
		}
	}
	return true;
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

function checkPin(fld) {
	obj = fld.value;
	var char = /^\d{6}$/;
	if (obj != '') {
		if (!obj.match(char)) {
			alert("Please enter 6 digit Pin Code");
			fld.focus();
			return false;
		}
	}
	return true;
}

function checkAadhaar(fld) {
	obj = fld.value;
	var char = /^\d{12}$/;
	if (obj != '') {
		if (!obj.match(char)) {
			alert("Please enter 12 digit Aadhaar No.");
			fld.focus();
			return false;
		}
	}
	return true;
}

function checkPAN(fld) {
	obj = fld.value;
	var char = /[a-zA-z]{5}\d{4}[a-zA-Z]{1}/;
	if (obj != '') {
		if (!obj.match(char)) {
			alert("Please enter valid PAN Number");
			fld.focus();
			return false;
		}
	}
	return true;
}

function validateEmail(obj) {
	//var x = obj;
	var x = $(obj).val();
	var atpos = x.indexOf("@");
	var dotpos = x.lastIndexOf(".");
	if (atpos < 1 || dotpos < atpos + 2 || dotpos + 2 >= x.length) {
		alert("Please enter a valid Email ID");
		return false;
	}
	return true;
}

function requiredValField(fld, msg) {
	var val = fld.value;
	if (val == '') {
		alert(msg);
		fld.focus();
		return false;
	}
	return true;
}

function requiredValSelect(fld, msg) {
	var val = fld.value;
	if (val == '0' || val == '') {
		alert(msg);
		fld.focus();
		return false;
	}
	return true;
}

function checkEmail(fld) {
	var x = fld.value;
	var atpos = x.indexOf("@");
	var dotpos = x.lastIndexOf(".");
	if (atpos < 1 || dotpos < atpos + 2 || dotpos + 2 >= x.length) {
		alert("Please enter a valid E-mail");
		fld.focus();
		return false;
	}
	return true;
}

function isNumber(fld) {
	obj = fld.value;
	var char = /^([0-9]+,)*[0-9]+$/;
	if (obj != '') {
		if (!obj.match(char)) {
			alert("Please enter numeric only.");
			fld.focus();
			return false;
		}
	}
	return true;
}

function isAlphaNumeber(fld) {
	obj = fld.value;
	var letterNumber = /^[0-9a-zA-Z ]+$/;
	if (obj.match(letterNumber)) {
		return true;
	} else {
		alert("Please enter alphanumeric only");
		fld.focus();
		return false;
	}
}

function isCharacter(fld) {
	obj = fld.value;
	var letters = /^[A-Za-z ]+$/;
	if (obj.match(letters)) {
		return true;
	} else {
		alert("Please enter alphabet only.");
		fld.focus();
		return false;
	}
}

function checkFile(fld, msg) {
	var obj = fld;
	var fileExtension = [ 'jpeg', 'jpg', 'png', 'gif', 'bmp', 'pdf' ];

	if ($(obj).val() != '') {
		if ($.inArray($(obj).val().split('.').pop().toLowerCase(),
				fileExtension) == -1) {
			alert("Only '.jpeg','.jpg', '.png', '.gif', '.bmp' formats are allowed.");
			fld.focus();
			return false;
		}
	} else if ($(obj).val() == ''
			&& $(obj).parent('div').css('display') == 'block') {
		alert(msg);
		fld.focus();
		return false;

	}
	return true;
}

function agentForm() {
	var emailId = $('#emailId').val();
	if (emailId == '') {
		alert('Please enter emailId');
		$('#emailId').focus();
	} else if (!checkEmail($('#emailId')[0])) {
		return false;
	} else {
		$("#trxForm").submit();
	}

}

function agentForm1() {
	var emailId = $('#agentEmailId').val();

}

function nextForm() {
	 var frm= $("#agenttrxForm1");
	   if(validateForm(frm)){

		   if(_chkclk){   
				_chkclk=false;
			$(frm).submit();
		   }   }

}
var _chkclk=true;
function updateAgentDocs(){
	$("#agenttrxForm1").submit();
}

function nextDocumentForm() {


	 var frm= $("#agenttrxForm1");
	   if(validateForm(frm)){

		   if(_chkclk){   
				_chkclk=false;
			$(frm).submit();
		   }   }
	
}

function nextConfirmationForm() {
	
	
	
	 var frm= $("#agenttrxForm1");
	   if(validateForm(frm)){

		   if(_chkclk){   
				_chkclk=false;
			$(frm).submit();
		   }   }

}

function nextForm1() {

	 var frm= $("#agenttrxForm1");
	   if(validateForm(frm)){
		   if(_chkclk){   
				_chkclk=false;
			$(frm).submit();
		   }	   }
	
	/*if (validateIndiAgentRegistration()) {

		 var panno=		document.getElementsByName("agentDetailsModel.agentPanNo")[0];
		 if(panno){
			 checkPanNo(panno.value);
		 }
		
	}*/
}

function validateDocuments() {
	if (!checkFile(document.getElementsByName("panCardFile")[0],
			'Please select PAN Card')) {
		return false;
	}
	if (!checkFile(document.getElementsByName("addressProofFile")[0],
			'Please select Address proof')) {
		return false;
	}
	
	return true;
}


function pervAgentForm(url) {
	
	$(document).on("click", function(e) {
		e.preventDefault();
		$('#agenttrxForm1').attr('action', url).submit();
	});

}




$("#preDocButton").click(function() {
	
	$.ajax({
		url : 'prevIndAgentForm',
		method : 'POST',
		async : false,
		complete : function(data) {

		}
	});

});

function pervAgentForm1(url) {
	
	$(document).on("click", function(e) {
		e.preventDefault();
		$('#agenttrxForm1').attr('action', url).submit();
	});

}

$("#editDocButton").click(function() {

	$.ajax({
		url : 'editAgentUploadDoc',
		method : 'POST',
		async : false,
		complete : function(data) {

		}
	});

});

/*function validateIndvAgentDetails() {
	var agentName = $('#agentName').val();
	if (agentName.trim() == '') {
		alert('Please enter Agent Name');
		$('#agentName').focus();
		return false;
	}
	return true;
}
*/

function checkPanNo(pnum){

$.ajax({
	type : "GET",
	url : "getAgentDetailByPan",
	data : "PANNO=" + pnum,
	success : function(response){
	var str=	response.split('~');
		if(str[1].indexOf('ERROR')>0){
			alert('Something went wrong! Please try later.');
		}else if(str[1].indexOf('NOTEXIST')>0){
			$("#agenttrxForm1").submit();
			
		}else{
			alert("Pan No. '"+str[0]+"' used by another registration.");
		}
	},

	error : function(e) {alert('Error: ' + e);}

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
