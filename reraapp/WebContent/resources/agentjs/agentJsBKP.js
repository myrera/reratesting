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

function validateCheckbox(fld, msg) {
	if (fld.checked==false) {
			alert(msg);
			fld.focus();
			return false;
	}
	return true;
}

function checkLandline(fld,msg){
	obj=fld.value;
	var char = /^\d{4,8}$/;
	if (obj != '') {
		if (!obj.match(char)) {
			alert("Please enter (4-8) digit Landline No.");
			fld.focus();
			return false;
		}
	}
	
	return true;
}

function checkMobile(fld) {
	obj = fld.value;
	var char = /^\d{10}$/;
	if (obj != '') {
		if (!obj.match(char)) {
			alert("Please enter 10 digit Mobile No.");
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
	var x = obj;
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
	if (validateDocuments()) {
		$("#agenttrxForm1").submit();
	}

}

function updateAgentDocs(){
	$("#agenttrxForm1").submit();
}

function nextDocumentForm() {
	if (firmRegistration()) {
		 var panno=		document.getElementsByName("agentDetailsModel.agentPanNo")[0];
		 if(panno){
			 checkPanNo(panno.value);
		 }	}

}

function nextConfirmationForm() {
	if (validatePaymentDetails()) {
		$("#agenttrxForm1").submit();
	}

}

function nextForm1() {

	 var frm= $("#agenttrxForm1");
	   if(validateForm(frm)){

		$(frm).submit();
	   }
	
	/*if (validateIndiAgentRegistration()) {

		 var panno=		document.getElementsByName("agentDetailsModel.agentPanNo")[0];
		 if(panno){
			 checkPanNo(panno.value);
		 }
		
	}*/
}

function validateIndiAgentRegistration() {

	if (!requiredValField(document
			.getElementsByName("agentDetailsModel.agentName")[0],
			'Please enter Name')) {
		return false;
	} else if (!isCharacter(document
			.getElementsByName("agentDetailsModel.agentName")[0])) {
		return false;
	}
	if (!requiredValField(document
			.getElementsByName("agentDetailsModel.agentFatherName")[0],
			'Please enter Fathers Name')) {
		return false;
	} else if (!isCharacter(document
			.getElementsByName("agentDetailsModel.agentFatherName")[0])) {
		return false;
	}
	if (!requiredValField(document
			.getElementsByName("agentDetailsModel.agentEmailId")[0],
			'Please enter E-mail')) {
		return false;
	} else if (!checkEmail(document
			.getElementsByName("agentDetailsModel.agentEmailId")[0])) {
		return false;
	}
	if (!requiredValField(document
			.getElementsByName("agentDetailsModel.agentAdhaarNo")[0],
			'Please enter Aadhaar Number')) {
		return false;
	} else if (!checkAadhaar(document
			.getElementsByName("agentDetailsModel.agentAdhaarNo")[0])) {
		return false;
	}
	if (!requiredValField(document
			.getElementsByName("agentDetailsModel.agentPanNo")[0],
			'Please enter PAN Number')) {
		return false;
	} else if (!checkPAN(document
			.getElementsByName("agentDetailsModel.agentPanNo")[0])) {
		return false;
	}
	if (!requiredValField(document
			.getElementsByName("agentDetailsModel.agentPhoneNo")[0],
			'Please enter Mobile Number')) {
		return false;
	} else if (!checkMobile(document
			.getElementsByName("agentDetailsModel.agentPhoneNo")[0])) {
		return false;
	}
	if (!requiredValField(document
			.getElementsByName("agentDetailsModel.landLineNumber1")[0],
			'Please enter Landline Number')) {
		return false;
	} else if (!checkLandline(document
			.getElementsByName("agentDetailsModel.landLineNumber1")[0])) {
		return false;
	}
	if (!requiredValField(
			document
					.getElementsByName("agentDetailsModel.agentIndividualAddressLine1")[0],
			'Please enter Address Line1')) {
		return false;
	}
	if (!requiredValField(
			document
					.getElementsByName("agentDetailsModel.agentIndividualAddressLine2")[0],
			'Please enter Address Line2')) {
		return false;
	}
	if (!requiredValSelect(document.getElementsByName("stateUtId")[0],
			'Please select State')) {
		return false;
	}
	if (!requiredValSelect(document.getElementsByName("agentDistrictId")[0],
			'Please select District')) {
		return false;
	}
	if (!requiredValField(document
			.getElementsByName("agentDetailsModel.agentIndividualPincode")[0],
			'Please enter Pin Code')) {
		return false;
	} else if (!checkPin(document
			.getElementsByName("agentDetailsModel.agentIndividualPincode")[0])) {
		return false;
	}
	if (!requiredValField(
			document
					.getElementsByName("agentDetailsModel.agentIndividualBussAddress1")[0],
			'Please enter Businees Address Line1')) {
		return false;
	}
	if (!requiredValField(
			document
					.getElementsByName("agentDetailsModel.agentIndividualBussAddress2")[0],
			'Please enter Business Address Line2')) {
		return false;
	}
	if (!requiredValSelect(document.getElementsByName("busstateUtId")[0],
			'Please select State')) {
		return false;
	}

	if (!requiredValSelect(document.getElementsByName("businessDistrictId")[0],
			'Please select District')) {
		return false;
	}
	if (!requiredValField(document
			.getElementsByName("agentDetailsModel.agentIndividualBussPincode")[0],
			'Please enter Pin Code')) {
		return false;
	} else if (!checkPin(document
			.getElementsByName("agentDetailsModel.agentIndividualBussPincode")[0])) {
		return false;
	}

	if (!checkFile(document.getElementsByName("agentPhotographPath")[0],
			'Please select Photograph')) {

		return false;
	}
	// Previous Details
	if (!requiredValField(document.getElementsByName("preRegistrationNo")[0],
			'Please enter Registration Number')) {
		return false;
	}
	if (!requiredValSelect(document.getElementsByName("prestateUtId")[0],
			'Please select Union Territory/State')) {
		return false;
	}
	if (!checkFile(document.getElementsByName("certificatePath")[0],
			'Please select Certificate')) {
		return false;
	}

	if (!requiredValSelect(document.getElementsByName("preDistrictId")[0],
			'Please select District')) {
		return false;
	}

	return true;
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

function firmRegistration() {
	if (!requiredValField(document
			.getElementsByName("agentDetailsModel.firmName")[0],
			'Please enter Name')) {
		return false;
	} else if (!isCharacter(document
			.getElementsByName("agentDetailsModel.firmName")[0])) {
		return false;
	}
	if (!requiredValSelect(document
			.getElementsByName("agentDetailsModel.firmRegistrationType")[0],
			'Please select Registration Type')) {
		return false;
	}
	if (!requiredValField(document
			.getElementsByName("agentDetailsModel.agentPanNo")[0],
			'Please enter PAN Number')) {
		return false;
	} else if (!checkPAN(document
			.getElementsByName("agentDetailsModel.agentPanNo")[0])) {
		return false;
	}
	if (!requiredValField(document
			.getElementsByName("agentDetailsModel.firmActivities")[0],
			'Please enter Major Activities')) {
		return false;
	}
	if (!requiredValField(document
			.getElementsByName("agentDetailsModel.firmRegistrationNo")[0],
			'Please enter Registration Number')) {
		return false;
	}
	if (!requiredValField(document
			.getElementsByName("agentDetailsModel.firmMobileNo")[0],
			'Please enter Mobile Number')) {
		return false;
	} else if (!checkMobile(document
			.getElementsByName("agentDetailsModel.firmMobileNo")[0])) {
		return false;
	}
	if (!requiredValField(document
			.getElementsByName("agentDetailsModel.firmLandLineNo1")[0],
			'Please enter Landline Number 1')) {
		return false;
	} else if (!checkLandline(document
			.getElementsByName("agentDetailsModel.firmLandLineNo1")[0])) {
		return false;
	}
	if (!requiredValField(document
			.getElementsByName("agentDetailsModel.firmAddressLine1")[0],
			'Please enter Address Line 1')) {
		return false;
	}
	
	if (!requiredValField(document
			.getElementsByName("agentDetailsModel.firmAddressLine2")[0],
			'Please enter Address Line 2')) {
		return false;
	}
	
	if (!requiredValSelect(document.getElementsByName("stateUtId")[0],
			'Please select State')) {
		return false;
	}
	if (!requiredValSelect(document.getElementsByName("agentDistrictId")[0],
			'Please select District')) {
		return false;
	}
	if (!requiredValField(document
			.getElementsByName("agentDetailsModel.firmPincode")[0],
			'Please enter Landline Number 2')) {
		return false;
	} else if (!checkPin(document
			.getElementsByName("agentDetailsModel.firmPincode")[0])) {
		return false;
	}
	if (!checkFile(document.getElementsByName("firmRegCertificatePath")[0],
			'Please select Company Registration Certificate')) {
		return false;
	}
	

	// Partner/Director
	if (!requiredValField(document
			.getElementsByName("agentDetailsModel.partnerOrDirectorName")[0],
			'Please enter Partner / Director Name')) {
		return false;
	} else if (!isCharacter(document
			.getElementsByName("agentDetailsModel.partnerOrDirectorName")[0])) {
		return false;
	}
	if (!requiredValField(
			document
					.getElementsByName("agentDetailsModel.partnerOrDirectorEmailAddress")[0],
			'Please enter Email Address')) {
		return false;
	} else if (!checkEmail(document
			.getElementsByName("agentDetailsModel.partnerOrDirectorEmailAddress")[0])) {
		return false;
	}
	if (!requiredValField(
			document
					.getElementsByName("agentDetailsModel.partnerOrDirectorAddressLine1")[0],
			'Please enter Address Line 1')) {
		return false;
	}
	if (!requiredValField(
			document
					.getElementsByName("agentDetailsModel.partnerOrDirectorAddressLine2")[0],
			'Please enter Address Line 2')) {
		return false;
	}
	
	
	//if (!requiredValSelect(document.getElementsByName("stateUtId")[0],
	//		'Please select State')) {
	//	return false;
	//}
	if (!requiredValSelect(document.getElementsByName("directorDistrictId")[0],
			'Please select District')) {
		return false;
	}
	if (!requiredValField(
			document
					.getElementsByName("agentDetailsModel.partnerOrDirectorPincode")[0],
			'Please enter Mobile Number')) {
		return false;
	} else if (!checkPin(document
			.getElementsByName("agentDetailsModel.partnerOrDirectorPincode")[0])) {
		return false;
	}
	if (!requiredValField(
			document
					.getElementsByName("agentDetailsModel.partnerOrDirectorPhoneNO")[0],
			'Please enter Mobile Number')) {
		return false;
	} else if (!checkMobile(document
			.getElementsByName("agentDetailsModel.partnerOrDirectorPhoneNO")[0])) {
		return false;
	}
	if (!checkFile(document.getElementsByName("agentPhotographPath")[0],
			'Please select Photograph')) {
		return false;
	}

	// Previous Registration Details
	if (!requiredValField(document.getElementsByName("preRegistrationNo")[0],
			'Please enter Registration Number')) {
		return false;
	}
	//if (!requiredValSelect(document.getElementsByName("stateUtId")[0],
	//		'Please select Union Territory/State')) {
	//	return false;
	//}
	if (!checkFile(document.getElementsByName("certificatePath")[0],
			'Please select Certificate')) {
		return false;
	}
	if (!requiredValSelect(document.getElementsByName("preDistrictId")[0],
			'Please select District')) {
		return false;
	}


	return true;
}

function validatePaymentDetails() {
	var paymode=document.getElementsByName("paymentmode")[0];
	if (!requiredValSelect(paymode,'Please Select Payment Mode')) {
		return false;
	}else{
		
	if (paymode.value != 'Payment Gateway') {
			if (!requiredValSelect(document.getElementsByName("bankName")[0],
				'Please select Bank Name')) {
			return false;
		}
		if (!requiredValField(document.getElementsByName("bankbranch")[0],
				'Please enter Branch')) {
			return false;
		}
		if (!requiredValField(document.getElementsByName("ddChequeNo")[0],
				'Please enter DD/ Cheque No.')) {
			return false;
		} else if (!isNumber(document.getElementsByName("ddChequeNo")[0])) {
			return false;
		}
		if (!checkFile(document.getElementsByName("attachScanCopy")[0],
				'Please select Attach Scan Copy')) {
			return false;
		}
		if (!validateCheckbox(document.getElementsByName("affirm")[0],
		'Please select Afirmation')) {
	       return false;
         }
		if (!validateCheckbox(document.getElementsByName("showonpublicdomain")[0],
				'Please select public domain condition.')) {
			return false;
		}
	}
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
	alert("pre called");
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

function validateIndvAgentDetails() {
	var agentName = $('#agentName').val();
	if (agentName.trim() == '') {
		alert('Please enter Agent Name');
		$('#agentName').focus();
		return false;
	}
	return true;
}


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


