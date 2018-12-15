function changeLabelText(id, text, val) {
	$(id).text(text);
	$('#nextForm').val(val);

}
function validateCheckbox(fld, msg) {
	if (fld.checked == false) {
		alert("msg");
		fld.focus();
		return false;
	}
	return true;
}
function checkLandline(fld) {
	obj = fld.value;
	var char = /^\d{6,10}$/;
	if (obj != '') {
		if (!obj.match(char)) {
			alert("Please enter (6-10) digit Landline No.");
			fld.focus();
			return false;
		}
	}

	return true;
}

function checkYear(fld) {
	obj = fld.value;
	var char = /^\d{4}$/;
	if (obj != '') {
		if (!obj.match(char)) {
			alert("Please enter 4 digit Year.");
			fld.focus();
			return false;
		}
	}
	return true;
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

function checkAmount(fld) {
	obj = fld.value;
	var char = /^([0-9]+.)*[0-9]+$/;
	if (obj != '') {
		if (!obj.match(char)) {
			alert("Plese enter amount in decimal.");
			fld.focus();
			return false;
		}
	}
	if (obj == '') {
		alert("Plese enter amount.");
		fld.focus();
		return false;
	}
	return true;
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
			alert("Only '.jpeg','.jpg', '.png', '.bmp' formats are allowed.");
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

function uploadFile(fld, msg, fc) {
	alert(fld);
	alert(fc);
	var obj = fld;
	var fileExtension = [ 'jpeg', 'jpg', 'png', 'gif', 'bmp', 'pdf' ];

	if ($(obj).val() != '') {
		if ($.inArray($(obj).val().split('.').pop().toLowerCase(),
				fileExtension) == -1) {
			alert("Only '.jpeg','.jpg', '.png', '.bmp' formats are allowed.");
			fld.focus();
			return false;
		}
	} else if ($(obj).val() == ''
			&& $(obj).parent('div').css('display') == 'block') {
		alert(msg);
		fc.focus();
		return false;

	}
	return true;
}

function projectForm() {
	var flg = true;
	var emailId = $('#emailId').val();
	if (emailId.trim() == '') {
		alert('Please enter Email ID');
		$('#emailId').focus();
		flg = false;
		return false;

	} else {
		flg = (validateEmail(emailId));
	}
	if (flg) {

		$("#trxForm").submit();
	}
}

function nextProjectDetailsForm() {

	//if (validateIndvPromoterDetails()) {
		
	//}
	
	$("#trxForm").submit();

	//if (validateIndvPromoterDetails()) {
	
	//}
	$("#trxForm").submit();

}

function saveOrUpdateCompanyPromoter() {

	//alert("saveOrUpdateCompanyPromoter");
	//if (validatePromoterRegis()) {
		//$("#trxForm").submit();
	//}
	$("#trxForm").submit();

	if (validatePromoterRegis()) {
		$("#trxForm").submit();
	}

}

function editSaveOrUpdateCompanyPromoter() {
	
	if (editValidatePromoter()) {
		$("#trxForm").submit();
	}
}


function nextProjectPaymentForm() {
	//if (validateAttachmentsDetails()) {
		
	//}
	$("#trxForm").submit();
}

function saveOrUpdatePayment() {
	if (validatePayment()) {
		
		$("#trxForm").submit();
	}
}

function saveOrUpdateProjectDetailsForm() {

	//if (validateProjectDetsils()) {
	
	//}
	$("#trxForm").submit();
}

function validateIndvPromoterDetails() {
	if (!requiredValField($('#promoterName')[0], 'Please enter Name')) {
		return false;
	} else if (!isCharacter($('#promoterName')[0])) {
		return false;
	}

	if (!requiredValField($('#promoterIndividualFatherName')[0],
			'Please enter Fathers Name')) {
		return false;
	} else if (!isCharacter($('#promoterIndividualFatherName')[0])) {
		return false;
	}
	if (!requiredValField($('#panNo')[0], 'Please enter PAN Number')) {
		return false;
	} else if (!checkPAN($('#panNo')[0])) {
		return false;
	}
	if (!requiredValField($('#adhaarNo')[0], 'Please enter Aadhaar Number')) {
		return false;
	} else if (!checkAadhaar($('#adhaarNo')[0])) {
		return false;
	}
	if (!requiredValField($('#mobileNo')[0], 'Please enter Mobile Number')) {
		return false;
	} else if (!checkMobile($('#mobileNo')[0])) {
		return false;
	}
	if (!requiredValField($('#telephoneNo')[0], 'Please enter Telephone Number')) {
		return false;
	} else if (!checkLandline($('#telephoneNo')[0])) {
		return false;
	}
	if (!requiredValField($('#emailId')[0], 'Please enter E-mail')) {
		return false;
	} else if (!checkEmail($('#emailId')[0])) {
		return false;
	}
	
	
	if (!requiredValField($('#addressLine1')[0], 'Please enter Address Line1')) {
		return false;
	}
	if (!requiredValField($('#addressLine2')[0], 'Please enter Address Line2')) {
		return false;
	}
	if (!requiredValSelect(document.getElementsByName("promoterStateUtId")[0],
			'Please select State')) {
		return false;
	}
	if (!requiredValSelect(document.getElementsByName("permDistrictId")[0],
			'Please select District')) {
		return false;
	}

	if (!requiredValField($('#pinCode')[0], 'Please enter PIN Code')) {
		return false;
	} else if (!checkPin($('#pinCode')[0])) {
		return false;
	}

	var prvProjectName = document.getElementsByName("pervProjectName");
	var i;

	for (i = 0; i < prvProjectName.length; i++) {
		if (document.getElementsByName("pervProjectName")[i].value != '') {
			if (!requiredValField(
					document.getElementsByName("pervProjectName")[i],
					'Please enter Project Name')) {
				return false;
			} else if (!isCharacter(document
					.getElementsByName("pervProjectName")[i])) {
				return false;
			}
			if (!requiredValField(document
					.getElementsByName("pervProjectDescription")[i],
					'Please enter Project Description')) {
				return false;
			}

			if (!requiredValSelect(document
					.getElementsByName("projectCurrentStatus")[i],
					'Please select Current Status')) {
				return false;
			}
			if (!requiredValSelect(document.getElementsByName("typeOfLand")[i],
					'Please select Type of Land')) {
				return false;
			}

			if (document.getElementsByName("projectCurrentStatus")[i].value == "1") {
				if (!checkFile(
						document.getElementsByName("completionDocId")[i],
						'Please select Photograph')) {
					return false;
				}
				document.getElementsByName("expectedCompletionDate")[i].value = '';
				document.getElementsByName("noOfMonthDelayed")[i].value = '';

			} else if (document.getElementsByName("projectCurrentStatus")[i].value == "2") {
				if (!requiredValField(document
						.getElementsByName("expectedCompletionDate")[i],
						'Please select Expected Completion Date')) {
					return false;
				}
				document.getElementsByName("completionDocId")[i].value = '';
				document.getElementsByName("noOfMonthDelayed")[i].value = '';

			} else if (document.getElementsByName("projectCurrentStatus")[i].value == "3") {
				if (!requiredValField(document
						.getElementsByName("noOfMonthDelayed")[i],
						'Please enter No. of Months Delayed')) {
					return false;
				} else if (!isNumber(document
						.getElementsByName("noOfMonthDelayed")[i])) {
					return false;
				}
				document.getElementsByName("expectedCompletionDate")[i].value = '';
				document.getElementsByName("completionDocId")[i].value = '';

			}

			var isCase = document.getElementsByName("isCasesPending")[i].checked;
			if (isCase == true) {
				if (!requiredValField(
						document.getElementsByName("caseDetails")[i],
						'Please enter Case Details')) {
					return false;
				}
			}
			if (document.getElementsByName("caseDetails")[i].value != '') {
				document.getElementsByName("isCasesPending")[i].checked = true;
			}
			var isPaymentPending = document
					.getElementsByName("isPaymentPending")[i].checked;
			if (isPaymentPending == true) {
				if (!isNumber(document.getElementsByName("pendingAmount")[i])) {
					return false;
				}
			}
			// if (document.getElementsByName("pendingAmount")[i].value != '') {
			// document.getElementsByName("isPaymentPending")[i].checked = true;
			// }

			if (!requiredValField(
					document.getElementsByName("projectAddress")[i],
					'Please enter Address')) {
				return false;
			}

			if (!requiredValSelect(document.getElementsByName("stateUtId")[i],
					'Please select State/UT')) {
				return false;
			}

			if (!requiredValSelect(document
					.getElementsByName("pervProjDistrictId")[i],
					'Please select District')) {
				return false;
			}
			if (!requiredValField(document
					.getElementsByName("projectAddrPinCode")[i],
					'Please enter Pin Code')) {
				return false;
			} else if (!checkPin(document
					.getElementsByName("projectAddrPinCode")[i])) {
				return false;
			}
		}
	}

	return true;

}


function saveOrUpdateProjectDetailsForm() {

	//if (validateProjectDetsils()) {
		
	//}
	$("#trxForm").submit();
}

function editValidateIndvPromoterDetails() {
	if (!requiredValField($('#promoterName')[0], 'Please enter Name')) {
		return false;
	} else if (!isCharacter($('#promoterName')[0])) {
		return false;
	}

	if (!requiredValField($('#promoterIndividualFatherName')[0],
			'Please enter Fathers Name')) {
		return false;
	} else if (!isCharacter($('#promoterIndividualFatherName')[0])) {
		return false;
	}
	if (!requiredValField($('#panNo')[0], 'Please enter PAN Number')) {
		return false;
	} else if (!checkPAN($('#panNo')[0])) {
		return false;
	}
	if (!requiredValField($('#adhaarNo')[0], 'Please enter Aadhaar Number')) {
		return false;
	} else if (!checkAadhaar($('#adhaarNo')[0])) {
		return false;
	}
	if (!requiredValField($('#mobileNo')[0], 'Please enter Mobile Number')) {
		return false;
	} else if (!checkMobile($('#mobileNo')[0])) {
		return false;
	}
	if (!requiredValField($('#telephoneNo')[0], 'Please enter Telephone Number')) {
		return false;
	} else if (!checkLandline($('#telephoneNo')[0])) {
		return false;
	}
	if (!requiredValField($('#emailId')[0], 'Please enter E-mail')) {
		return false;
	} else if (!checkEmail($('#emailId')[0])) {
		return false;
	}
	
	
	if (!requiredValField($('#addressLine1')[0], 'Please enter Address Line1')) {
		return false;
	}
	if (!requiredValField($('#addressLine2')[0], 'Please enter Address Line2')) {
		return false;
	}
	if (!requiredValSelect(document.getElementsByName("stateUtId")[0],
			'Please select State')) {
		return false;
	}
	if (!requiredValSelect(document.getElementsByName("permDistrictId")[0],
			'Please select District')) {
		return false;
	}

	if (!requiredValField($('#pinCode')[0], 'Please enter PIN Code')) {
		return false;
	} else if (!checkPin($('#pinCode')[0])) {
		return false;
	}

	var prvProjectName = document.getElementsByName("pervProjectName");
	var i;

	for (i = 0; i < prvProjectName.length; i++) {
		if (document.getElementsByName("pervProjectName")[i].value != '') {
			if (!requiredValField(
					document.getElementsByName("pervProjectName")[i],
					'Please enter Project Name')) {
				return false;
			} else if (!isCharacter(document
					.getElementsByName("pervProjectName")[i])) {
				return false;
			}
			if (!requiredValField(document
					.getElementsByName("pervProjectDescription")[i],
					'Please enter Project Description')) {
				return false;
			}

			if (!requiredValSelect(document
					.getElementsByName("projectCurrentStatus")[i],
					'Please select Current Status')) {
				return false;
			}
			if (!requiredValSelect(document.getElementsByName("typeOfLand")[i],
					'Please select Type of Land')) {
				return false;
			}

			if (document.getElementsByName("projectCurrentStatus")[i].value == "1") {
				if (!checkFile(
						document.getElementsByName("completionDocId")[i],
						'Please select Photograph')) {
					return false;
				}
				document.getElementsByName("expectedCompletionDate")[i].value = '';
				document.getElementsByName("noOfMonthDelayed")[i].value = '';

			} else if (document.getElementsByName("projectCurrentStatus")[i].value == "2") {
				if (!requiredValField(document
						.getElementsByName("expectedCompletionDate")[i],
						'Please select Expected Completion Date')) {
					return false;
				}
				document.getElementsByName("completionDocId")[i].value = '';
				document.getElementsByName("noOfMonthDelayed")[i].value = '';

			} else if (document.getElementsByName("projectCurrentStatus")[i].value == "3") {
				if (!requiredValField(document
						.getElementsByName("noOfMonthDelayed")[i],
						'Please enter No. of Months Delayed')) {
					return false;
				} else if (!isNumber(document
						.getElementsByName("noOfMonthDelayed")[i])) {
					return false;
				}
				document.getElementsByName("expectedCompletionDate")[i].value = '';
				document.getElementsByName("completionDocId")[i].value = '';

			}

			var isCase = document.getElementsByName("isCasesPending")[i].checked;
			if (isCase == true) {
				if (!requiredValField(
						document.getElementsByName("caseDetails")[i],
						'Please enter Case Details')) {
					return false;
				}
			}
			if (document.getElementsByName("caseDetails")[i].value != '') {
				document.getElementsByName("isCasesPending")[i].checked = true;
			}
			var isPaymentPending = document
					.getElementsByName("isPaymentPending")[i].checked;
			if (isPaymentPending == true) {
				if (!isNumber(document.getElementsByName("pendingAmount")[i])) {
					return false;
				}
			}
			// if (document.getElementsByName("pendingAmount")[i].value != '') {
			// document.getElementsByName("isPaymentPending")[i].checked = true;
			// }

			if (!requiredValField(
					document.getElementsByName("projectAddress")[i],
					'Please enter Address')) {
				return false;
			}

			if (!requiredValSelect(document.getElementsByName("stateUtId")[i],
					'Please select State/UT')) {
				return false;
			}

			if (!requiredValSelect(document
					.getElementsByName("pervProjDistrictId")[i],
					'Please select District')) {
				return false;
			}
			if (!requiredValField(document
					.getElementsByName("projectAddrPinCode")[i],
					'Please enter Pin Code')) {
				return false;
			} else if (!checkPin(document
					.getElementsByName("projectAddrPinCode")[i])) {
				return false;
			}
		}
	}

	return true;

}


function validateProjectDetsils() {

	if (!requiredValField($('#currentProjectName')[0],
			'Please enter Project Name')) {
		return false;
	} else if (!isCharacter($('#currentProjectName')[0])) {
		return false;
	}
	if (!requiredValField($('#currentProjectDesc')[0],
			'Please enter Project Description')) {
		return false;
	}

	if (!requiredValSelect(document
			.getElementsByName("projectDetailsModel.projectType")[0],
			'Please select Project Type')) {
		return false;
	}
	if (!requiredValSelect(document
			.getElementsByName("projectDetailsModel.projectStatus")[0],
			'Please select Project Status')) {
		return false;
	}
	if (!requiredValField(document
			.getElementsByName("projectDetailsModel.startDate")[0],
			'Please select Project Start Date')) {
		return false;
	}
	if (!requiredValField(document
			.getElementsByName("projectDetailsModel.completionDate")[0],
			'Please select Project End Date')) {
		return false;
	}
	if (!validateDate(document
			.getElementsByName("projectDetailsModel.startDate")[0], document
			.getElementsByName("projectDetailsModel.completionDate")[0],
			'Projet End date should be greater than Project Start Date')) {
		return false;
	}
	if (!requiredValField(document
			.getElementsByName("projectDetailsModel.totalAreaOfLand")[0],
			'Please enter Total Area of Land')) {
		return false;
	} else if (!isNumber(document
			.getElementsByName("projectDetailsModel.totalAreaOfLand")[0])) {
		return false;
	}
	if (!requiredValField(document
			.getElementsByName("projectDetailsModel.totalOpenArea")[0],
			'Please enter Total Open Area')) {
		return false;
	} else if (!isNumber(document
			.getElementsByName("projectDetailsModel.totalOpenArea")[0])) {
		return false;
	}
	if (!requiredValField(document
			.getElementsByName("projectDetailsModel.totalCoverdArea")[0],
			'Please enter Total Covered Area')) {
		return false;
	} else if (!isNumber(document
			.getElementsByName("projectDetailsModel.totalCoverdArea")[0])) {
		return false;
	}
	if (!requiredValField(document
			.getElementsByName("projectDetailsModel.addressLine1")[0],
			'Please enter Project Address Line 1')) {
		return false;
	}
	if (!requiredValField(document
			.getElementsByName("projectDetailsModel.addressLine2")[0],
			'Please enter Project Address Line 2')) {
		return false;
	}
	if (!requiredValSelect(document
			.getElementsByName("projectDetailsModel.projectStatus")[0],
			'Please select Tehsil/Sub District')) {
		return false;
	}

	if (!requiredValField(document
			.getElementsByName("projectDetailsModel.noOfGarageForSale")[0],
			'Please enter No. of Garages Available for Sale')) {
		return false;
	} else if (!isNumber(document
			.getElementsByName("projectDetailsModel.noOfGarageForSale")[0])) {
		return false;
	}
	if (!requiredValField(document
			.getElementsByName("projectDetailsModel.areaOfGarageForSale")[0],
			'Please enter Total Area of Garages')) {
		return false;
	} else if (!isNumber(document
			.getElementsByName("projectDetailsModel.areaOfGarageForSale")[0])) {
		return false;
	}
	if (!requiredValField(document
			.getElementsByName("projectDetailsModel.noOfParkinfForSale")[0],
			'Please enter No. of Open Parking')) {
		return false;
	} else if (!isNumber(document
			.getElementsByName("projectDetailsModel.noOfParkinfForSale")[0])) {
		return false;
	}

	if (!requiredValField(document
			.getElementsByName("projectDetailsModel.areaOfParkinfForSale")[0],
			'Please enter Total Area Of Open Parking')) {
		return false;
	} else if (!isNumber(document
			.getElementsByName("projectDetailsModel.areaOfParkinfForSale")[0])) {
		return false;
	}

	// Development Details
	var typeOfInventory = document.getElementsByName("typeOfInventory");
	var p;
	for (p = 0; p < typeOfInventory.length; p++) {
		if (document.getElementsByName("typeOfInventory")[p] != '') {

			if (!requiredValField(
					document.getElementsByName("typeOfInventory")[p],
					'Please enter Type of Inventory')) {
				return false;
			} else if (!isCharacter(document
					.getElementsByName("typeOfInventory")[p])) {
				return false;
			}

			if (!requiredValField(
					document.getElementsByName("noOfInventory")[p],
					'Please enter No. of Inventory')) {
				return false;
			} else if (!isNumber(document.getElementsByName("noOfInventory")[p])) {
				return false;
			}
			if (!requiredValField(document.getElementsByName("carpetArea")[p],
					'Please enter Carpet Area')) {
				return false;
			} else if (!isNumber(document.getElementsByName("carpetArea")[p])) {
				return false;
			}
			if (!requiredValField(
					document.getElementsByName("areaOfExclusive")[p],
					'Please enter Area of exclusive balcony/verandah')) {
				return false;
			} else if (!isNumber(document.getElementsByName("areaOfExclusive")[p])) {
				return false;
			}
			if (!isNumber(document
					.getElementsByName("areaOfExclusiveOpenTerrace")[p])) {
				return false;
			}
		}
	}
	// External Development Work
	if (!requiredValSelect(
			document
					.getElementsByName("externalDevelopmentWorkModel.roadSysetmDevBy")[0],
			'Please select Road System')) {
		return false;
	}
	if (!requiredValSelect(
			document
					.getElementsByName("externalDevelopmentWorkModel.waterSupplyBy")[0],
			'Please select Water Supply')) {
		return false;
	}
	if (!requiredValSelect(
			document
					.getElementsByName("externalDevelopmentWorkModel.sewegeAndDrainageSystemDevBy")[0],
			'Please select Sewage and Drainage System')) {
		return false;
	}
	if (!requiredValSelect(
			document
					.getElementsByName("externalDevelopmentWorkModel.electricityAndTrasfomerSupply")[0],
			'Please select Electricity Supply Transformer And Sub Station')) {
		return false;
	}
	if (!requiredValSelect(
			document
					.getElementsByName("externalDevelopmentWorkModel.solidWasteSupplyBy")[0],
			'Please select Solid Waste Management And Disposal')) {
		return false;
	}
	// Project Bank Details
	if (!requiredValSelect(document
			.getElementsByName("projectBankId")[0],
			'Please enter Bank Name')) {
		return false;
	}
	if (!requiredValField(document
			.getElementsByName("projectBankDetailsModel.bankBranch")[0],
			'Please enter Branch Name')) {
		return false;
	} else if (!isCharacter(document
			.getElementsByName("projectBankDetailsModel.bankBranch")[0])) {
		return false;
	}
	if (!requiredValField(document
			.getElementsByName("projectBankDetailsModel.accountNumber")[0],
			'Please enter Account No.')) {
		return false;
	} else if (!isNumber(document
			.getElementsByName("projectBankDetailsModel.accountNumber")[0])) {
		return false;
	}
	if (!requiredValField(document
			.getElementsByName("projectBankDetailsModel.ifscCode")[0],
			'Please enter IFSC Code.')) {
		return false;
	} else if (!checkIfsc(document
			.getElementsByName("projectBankDetailsModel.ifscCode")[0])) {
		return false;
	}
	if (!requiredValSelect(
			document
					.getElementsByName("projectBankDetailsModel.districtModel.stateUtModel.stateUtId")[0],
			'Please select State/UT')) {
		return false;
	}
	if (!requiredValSelect(
			document
					.getElementsByName("projectBankDetailsModel.districtModel.districtId")[0],
			'Please select District')) {
		return false;
	}

	// Project Architect
	var architectName = document.getElementsByName("architectName");
	var q;
	for (q = 0; q < architectName.length; q++) {
		if (document.getElementsByName("architectName")[q].value != '') {

			if (!requiredValField(
					document.getElementsByName("architectName")[q],
					'Please enter Architect Name')) {
				return false;
			} else if (!isCharacter(document.getElementsByName("architectName")[q])) {
				return false;
			}
			if (!requiredValField(document.getElementsByName("arctEmailId")[q],
					'Please enter Email ID')) {
				return false;
			} else if (!checkEmail(document.getElementsByName("arctEmailId")[q])) {
				return false;
			}
			if (!requiredValField(document
					.getElementsByName("arctAddressLine1")[q],
					'Please enter Address Line 1')) {
				return false;
			}
			if (!requiredValField(document
					.getElementsByName("arctAddressLine2")[q],
					'Please enter Address Line 2')) {
				return false;
			}
			if (!requiredValSelect(
					document.getElementsByName("arctStateUtId")[q],
					'Please select State')) {
				return false;
			}
			if (!requiredValSelect(document
					.getElementsByName("arctProjDistrictId")[q],
					'Please select District')) {
				return false;
			}
			if (!requiredValField(
					document.getElementsByName("arctPineCode")[q],
					'Please enter PIN Code')) {
				return false;
			} else if (!checkPin(document.getElementsByName("arctPineCode")[q])) {
				return false;
			}
			if (!requiredValField(
					document.getElementsByName("arctYearOfEst")[q],
					'Please enter Year of establishment')) {
				return false;
			} else if (!checkYear(document.getElementsByName("arctYearOfEst")[q])) {
				return false;
			}

		}

	}

	// Structure Engineer
	// var engineerName = document.getElementsByName("engineerName");
	var k;
	for (k = 0; k < engineerName.length; k++) {
		if (document.getElementsByName("engineerName")[k].value != '') {

			if (!requiredValField(
					document.getElementsByName("engineerName")[k],
					'Please enter Engineer Name')) {
				return false;
			} else if (!isCharacter(document.getElementsByName("engineerName")[k])) {
				return false;
			}

			if (!requiredValField(document.getElementsByName("strcEmailId")[k],
					'Please enter Email ID')) {
				return false;
			} else if (!checkEmail(document.getElementsByName("strcEmailId")[k])) {
				return false;
			}
			if (!requiredValField(document
					.getElementsByName("strcAddressLine1")[k],
					'Please enter Address Line 1')) {
				return false;
			}
			if (!requiredValField(document
					.getElementsByName("strcAddressLine2")[k],
					'Please enter Address Line 2')) {
				return false;
			}
			if (!requiredValSelect(
					document.getElementsByName("strcStateUtId")[k],
					'Please select State')) {
				return false;
			}
			if (!requiredValSelect(document
					.getElementsByName("strcProjDistrictId")[k],
					'Please select District')) {
				return false;
			}
			if (!requiredValField(
					document.getElementsByName("strcPineCode")[k],
					'Please enter PIN Code')) {
				return false;
			} else if (!checkPin(document.getElementsByName("strcPineCode")[k])) {
				return false;
			}
			if (!requiredValField(
					document.getElementsByName("strcYearOfEst")[k],
					'Please enter Year of establishment')) {
				return false;
			} else if (!checkYear(document.getElementsByName("strcYearOfEst")[k])) {
				return false;
			}

		}

	}

	// Contractor Details
	var contractorName = document.getElementsByName("engineerName");
	var t;
	for (t = 0; t < contractorName.length; t++) {
		if (document.getElementsByName("contractorName")[t].value != '') {

			if (!requiredValField(
					document.getElementsByName("engineerName")[t],
					'Please enter Engineer Name')) {
				return false;
			} else if (!isCharacter(document.getElementsByName("engineerName")[t])) {
				return false;
			}
			if (!requiredValField(document.getElementsByName("cntrEmailId")[t],
					'Please enter Email ID')) {
				return false;
			} else if (!checkEmail(document.getElementsByName("cntrEmailId")[t])) {
				return false;
			}
			if (!requiredValField(document
					.getElementsByName("cntrAddressLine1")[t],
					'Please enter Address Line 1')) {
				return false;
			}
			if (!requiredValField(document
					.getElementsByName("cntrAddressLine2")[t],
					'Please enter Address Line 2')) {
				return false;
			}
			if (!requiredValSelect(
					document.getElementsByName("cntrStateUtId")[t],
					'Please select State')) {
				return false;
			}
			if (!requiredValSelect(document
					.getElementsByName("cntrProjDistrictId")[t],
					'Please select District')) {
				return false;
			}
			if (!requiredValField(
					document.getElementsByName("cntrPineCode")[t],
					'Please enter PIN Code')) {
				return false;
			} else if (!checkPin(document.getElementsByName("cntrPineCode")[t])) {
				return false;
			}
			if (!requiredValField(
					document.getElementsByName("cntrYearOfEst")[t],
					'Please enter Year of establishment')) {
				return false;
			} else if (!checkYear(document.getElementsByName("cntrYearOfEst")[t])) {
				return false;
			}
		}

	}
	return true;
}

function editValidateProjectDetsils() {

	if (!requiredValField($('#currentProjectName')[0],
			'Please enter Project Name')) {
		return false;
	} else if (!isCharacter($('#currentProjectName')[0])) {
		return false;
	}
	if (!requiredValField($('#currentProjectDesc')[0],
			'Please enter Project Description')) {
		return false;
	}

	if (!requiredValSelect(document
			.getElementsByName("projectDetailsModel.projectType")[0],
			'Please select Project Type')) {
		return false;
	}
	if (!requiredValSelect(document
			.getElementsByName("projectDetailsModel.projectStatus")[0],
			'Please select Project Status')) {
		return false;
	}
	if (!requiredValField(document
			.getElementsByName("projectDetailsModel.startDate")[0],
			'Please select Project Start Date')) {
		return false;
	}
	if (!requiredValField(document
			.getElementsByName("projectDetailsModel.completionDate")[0],
			'Please select Project End Date')) {
		return false;
	}
	if (!validateDate(document
			.getElementsByName("projectDetailsModel.startDate")[0], document
			.getElementsByName("projectDetailsModel.completionDate")[0],
			'Projet End date should be greater than Project Start Date')) {
		return false;
	}
	if (!requiredValField(document
			.getElementsByName("projectDetailsModel.totalAreaOfLand")[0],
			'Please enter Total Area of Land')) {
		return false;
	} else if (!isNumber(document
			.getElementsByName("projectDetailsModel.totalAreaOfLand")[0])) {
		return false;
	}
	if (!requiredValField(document
			.getElementsByName("projectDetailsModel.totalOpenArea")[0],
			'Please enter Total Open Area')) {
		return false;
	} else if (!isNumber(document
			.getElementsByName("projectDetailsModel.totalOpenArea")[0])) {
		return false;
	}
	if (!requiredValField(document
			.getElementsByName("projectDetailsModel.totalCoverdArea")[0],
			'Please enter Total Covered Area')) {
		return false;
	} else if (!isNumber(document
			.getElementsByName("projectDetailsModel.totalCoverdArea")[0])) {
		return false;
	}
	if (!requiredValField(document
			.getElementsByName("projectDetailsModel.addressLine1")[0],
			'Please enter Project Address Line 1')) {
		return false;
	}
	if (!requiredValField(document
			.getElementsByName("projectDetailsModel.addressLine2")[0],
			'Please enter Project Address Line 2')) {
		return false;
	}
	if (!requiredValSelect(document
			.getElementsByName("projectDetailsModel.projectStatus")[0],
			'Please select Tehsil/Sub District')) {
		return false;
	}

	if (!requiredValField(document
			.getElementsByName("projectDetailsModel.noOfGarageForSale")[0],
			'Please enter No. of Garages Available for Sale')) {
		return false;
	} else if (!isNumber(document
			.getElementsByName("projectDetailsModel.noOfGarageForSale")[0])) {
		return false;
	}
	if (!requiredValField(document
			.getElementsByName("projectDetailsModel.areaOfGarageForSale")[0],
			'Please enter Total Area of Garages')) {
		return false;
	} else if (!isNumber(document
			.getElementsByName("projectDetailsModel.areaOfGarageForSale")[0])) {
		return false;
	}
	if (!requiredValField(document
			.getElementsByName("projectDetailsModel.noOfParkinfForSale")[0],
			'Please enter No. of Open Parking')) {
		return false;
	} else if (!isNumber(document
			.getElementsByName("projectDetailsModel.noOfParkinfForSale")[0])) {
		return false;
	}

	if (!requiredValField(document
			.getElementsByName("projectDetailsModel.areaOfParkinfForSale")[0],
			'Please enter Total Area Of Open Parking')) {
		return false;
	} else if (!isNumber(document
			.getElementsByName("projectDetailsModel.areaOfParkinfForSale")[0])) {
		return false;
	}

	// Development Details
	var typeOfInventory = document.getElementsByName("typeOfInventory");
	var p;
	for (p = 0; p < typeOfInventory.length; p++) {
		if (document.getElementsByName("typeOfInventory")[p] != '') {

			if (!requiredValField(
					document.getElementsByName("typeOfInventory")[p],
					'Please enter Type of Inventory')) {
				return false;
			} else if (!isCharacter(document
					.getElementsByName("typeOfInventory")[p])) {
				return false;
			}

			if (!requiredValField(
					document.getElementsByName("noOfInventory")[p],
					'Please enter No. of Inventory')) {
				return false;
			} else if (!isNumber(document.getElementsByName("noOfInventory")[p])) {
				return false;
			}
			if (!requiredValField(document.getElementsByName("carpetArea")[p],
					'Please enter Carpet Area')) {
				return false;
			} else if (!isNumber(document.getElementsByName("carpetArea")[p])) {
				return false;
			}
			if (!requiredValField(
					document.getElementsByName("areaOfExclusive")[p],
					'Please enter Area of exclusive balcony/verandah')) {
				return false;
			} else if (!isNumber(document.getElementsByName("areaOfExclusive")[p])) {
				return false;
			}
			if (!isNumber(document
					.getElementsByName("areaOfExclusiveOpenTerrace")[p])) {
				return false;
			}
		}
	}
	// External Development Work
	if (!requiredValSelect(
			document
					.getElementsByName("externalDevelopmentWorkModel.roadSysetmDevBy")[0],
			'Please select Road System')) {
		return false;
	}
	if (!requiredValSelect(
			document
					.getElementsByName("externalDevelopmentWorkModel.waterSupplyBy")[0],
			'Please select Water Supply')) {
		return false;
	}
	if (!requiredValSelect(
			document
					.getElementsByName("externalDevelopmentWorkModel.sewegeAndDrainageSystemDevBy")[0],
			'Please select Sewage and Drainage System')) {
		return false;
	}
	if (!requiredValSelect(
			document
					.getElementsByName("externalDevelopmentWorkModel.electricityAndTrasfomerSupply")[0],
			'Please select Electricity Supply Transformer And Sub Station')) {
		return false;
	}
	if (!requiredValSelect(
			document
					.getElementsByName("externalDevelopmentWorkModel.solidWasteSupplyBy")[0],
			'Please select Solid Waste Management And Disposal')) {
		return false;
	}
	// Project Bank Details
	if (!requiredValSelect(document
			.getElementsByName("projectBankId")[0],
			'Please enter Bank Name')) {
		return false;
	}
	if (!requiredValField(document
			.getElementsByName("projectBankDetailsModel.bankBranch")[0],
			'Please enter Branch Name')) {
		return false;
	} else if (!isCharacter(document
			.getElementsByName("projectBankDetailsModel.bankBranch")[0])) {
		return false;
	}
	if (!requiredValField(document
			.getElementsByName("projectBankDetailsModel.accountNumber")[0],
			'Please enter Account No.')) {
		return false;
	} else if (!isNumber(document
			.getElementsByName("projectBankDetailsModel.accountNumber")[0])) {
		return false;
	}
	if (!requiredValField(document
			.getElementsByName("projectBankDetailsModel.ifscCode")[0],
			'Please enter IFSC Code.')) {
		return false;
	} else if (!checkIfsc(document
			.getElementsByName("projectBankDetailsModel.ifscCode")[0])) {
		return false;
	}
	if (!requiredValSelect(
			document
					.getElementsByName("bankStateUtId")[0],
			'Please select State/UT')) {
		return false;
	}
	if (!requiredValSelect(
			document
					.getElementsByName("projectBankDetailsModel.districtModel.districtId")[0],
			'Please select District')) {
		return false;
	}

	// Project Architect
	var architectName = document.getElementsByName("architectName");
	var q;
	for (q = 0; q < architectName.length; q++) {
		if (document.getElementsByName("architectName")[q].value != '') {

			if (!requiredValField(
					document.getElementsByName("architectName")[q],
					'Please enter Architect Name')) {
				return false;
			} else if (!isCharacter(document.getElementsByName("architectName")[q])) {
				return false;
			}
			if (!requiredValField(document.getElementsByName("arctEmailId")[q],
					'Please enter Email ID')) {
				return false;
			} else if (!checkEmail(document.getElementsByName("arctEmailId")[q])) {
				return false;
			}
			if (!requiredValField(document
					.getElementsByName("arctAddressLine1")[q],
					'Please enter Address Line 1')) {
				return false;
			}
			if (!requiredValField(document
					.getElementsByName("arctAddressLine2")[q],
					'Please enter Address Line 2')) {
				return false;
			}
			if (!requiredValSelect(
					document.getElementsByName("arctStateUtId")[q],
					'Please select State')) {
				return false;
			}
			if (!requiredValSelect(document
					.getElementsByName("arctProjDistrictId")[q],
					'Please select District')) {
				return false;
			}
			if (!requiredValField(
					document.getElementsByName("arctPineCode")[q],
					'Please enter PIN Code')) {
				return false;
			} else if (!checkPin(document.getElementsByName("arctPineCode")[q])) {
				return false;
			}
			if (!requiredValField(
					document.getElementsByName("arctYearOfEst")[q],
					'Please enter Year of establishment')) {
				return false;
			} else if (!checkYear(document.getElementsByName("arctYearOfEst")[q])) {
				return false;
			}

		}

	}

	// Structure Engineer
	// var engineerName = document.getElementsByName("engineerName");
	var k;
	for (k = 0; k < engineerName.length; k++) {
		if (document.getElementsByName("engineerName")[k].value != '') {

			if (!requiredValField(
					document.getElementsByName("engineerName")[k],
					'Please enter Engineer Name')) {
				return false;
			} else if (!isCharacter(document.getElementsByName("engineerName")[k])) {
				return false;
			}

			if (!requiredValField(document.getElementsByName("strcEmailId")[k],
					'Please enter Email ID')) {
				return false;
			} else if (!checkEmail(document.getElementsByName("strcEmailId")[k])) {
				return false;
			}
			if (!requiredValField(document
					.getElementsByName("strcAddressLine1")[k],
					'Please enter Address Line 1')) {
				return false;
			}
			if (!requiredValField(document
					.getElementsByName("strcAddressLine2")[k],
					'Please enter Address Line 2')) {
				return false;
			}
			if (!requiredValSelect(
					document.getElementsByName("strcStateUtId")[k],
					'Please select State')) {
				return false;
			}
			if (!requiredValSelect(document
					.getElementsByName("strcProjDistrictId")[k],
					'Please select District')) {
				return false;
			}
			if (!requiredValField(
					document.getElementsByName("strcPineCode")[k],
					'Please enter PIN Code')) {
				return false;
			} else if (!checkPin(document.getElementsByName("strcPineCode")[k])) {
				return false;
			}
			if (!requiredValField(
					document.getElementsByName("strcYearOfEst")[k],
					'Please enter Year of establishment')) {
				return false;
			} else if (!checkYear(document.getElementsByName("strcYearOfEst")[k])) {
				return false;
			}

		}

	}

	// Contractor Details
	var contractorName = document.getElementsByName("engineerName");
	var t;
	for (t = 0; t < contractorName.length; t++) {
		if (document.getElementsByName("contractorName")[t].value != '') {

			if (!requiredValField(
					document.getElementsByName("engineerName")[t],
					'Please enter Engineer Name')) {
				return false;
			} else if (!isCharacter(document.getElementsByName("engineerName")[t])) {
				return false;
			}
			if (!requiredValField(document.getElementsByName("cntrEmailId")[t],
					'Please enter Email ID')) {
				return false;
			} else if (!checkEmail(document.getElementsByName("cntrEmailId")[t])) {
				return false;
			}
			if (!requiredValField(document
					.getElementsByName("cntrAddressLine1")[t],
					'Please enter Address Line 1')) {
				return false;
			}
			if (!requiredValField(document
					.getElementsByName("cntrAddressLine2")[t],
					'Please enter Address Line 2')) {
				return false;
			}
			if (!requiredValSelect(
					document.getElementsByName("cntrStateUtId")[t],
					'Please select State')) {
				return false;
			}
			if (!requiredValSelect(document
					.getElementsByName("cntrProjDistrictId")[t],
					'Please select District')) {
				return false;
			}
			if (!requiredValField(
					document.getElementsByName("cntrPineCode")[t],
					'Please enter PIN Code')) {
				return false;
			} else if (!checkPin(document.getElementsByName("cntrPineCode")[t])) {
				return false;
			}
			if (!requiredValField(
					document.getElementsByName("cntrYearOfEst")[t],
					'Please enter Year of establishment')) {
				return false;
			} else if (!checkYear(document.getElementsByName("cntrYearOfEst")[t])) {
				return false;
			}
		}

	}
	return true;
}

function validateAttachmentsDetails() {
	var xAtt = document.getElementsByName("otherFileDoc");
	var intCtr;
/*
	for (intCtr = 0; intCtr < xAtt.length; intCtr++) {

		if (document.getElementById(xAtt[intCtr].id).value == '') {
			alert("Please select File");
			document.getElementById(xAtt[intCtr].id).focus();
			return false;
		}

	}
	return false;
*/
	/*
	 * if (!checkFile($('#panCardFile')[0], 'Please select PAN Card')) { return
	 * false; }
	 * 
	 * if (!checkFile($('#auditedBalFile')[0], 'Please select Audited Balance
	 * Sheet')) { return false; } if (!checkFile($('#auditedProfitLossFile')[0],
	 * 'Please select Audited Profit/Loss Account')) { return false; } if
	 * (!checkFile($('#cashFlowFile')[0], 'Please select Cash Flow Statement')) {
	 * return false; } if (!checkFile($('#directorReportFile')[0], 'Please
	 * select Director Report')) { return false; } if
	 * (!checkFile($('#auditedReportFile')[0], 'Please select Audited Report')) {
	 * return false; } if (!checkFile($('#commencementCertFile')[0], 'Please
	 * select Commencement Certificate')) { return false; } if
	 * (!checkFile($('#approvedSanctionPlanFile')[0], 'Please select Approved
	 * Sanctioned Plan')) { return false; } if
	 * (!checkFile($('#approvedLayoutPlanFile')[0], 'Please select Approved
	 * Layout Plan')) { return false; } if
	 * (!checkFile($('#performaForSaleOfAgreement')[0], 'Please select Proforma
	 * for Sale of Agreement')) { return false; } if
	 * (!checkFile($('#landDocumentsFile')[0], 'Please select Land documents &
	 * Location')) { return false; } if
	 * (!checkFile($('#sanctionedLayoutPlan')[0], 'Please select Sanctioned
	 * Layout Plan')) { return false; } if
	 * (!checkFile($('#areaDevelopmentPlanFile')[0], 'Please select Area
	 * Development Plan')) { return false; } if
	 * (!checkFile($('#performaOfAllotmentLetterFile')[0], 'Please select
	 * Proforma of Allotment Letter')) { return false; } if
	 * (!checkFile($('#brochureOfCurrentProjectFile')[0], 'Please select
	 * Brochure of Current Project')) { return false; } if
	 * (!checkFile($('#projectRelatedDocumentsFile')[0], 'Please select Project
	 * Related Documents')) { return false; } if
	 * (!checkFile($('#declarationFormb')[0], 'Please select Declaration (Form
	 * B)')) { return false; }
	 */

	return true;
}

function validatePayment() {
	if (!requiredValSelect(document
			.getElementsByName("paymentDetailsModel.paymentMode")[0],
			'Please select Payment Mode')) {
		return false;
	} else if (document.getElementsByName("paymentDetailsModel.paymentMode")[0] != 'Payment Gateway') {
		if (!requiredValSelect(document
				.getElementsByName("paymentDetailsModel.bankModel.bankId")[0],
				'Please select Bank Name')) {
			return false;
		}
		if (!requiredValField(document
				.getElementsByName("paymentDetailsModel.branchName")[0],
				'Please enter Branch')) {
			return false;
		}
		if (!requiredValField(document
				.getElementsByName("paymentDetailsModel.ddChequeNo")[0],
				'Please enter DD/ Cheque No.')) {
			return false;
		} else if (!isNumber(document
				.getElementsByName("paymentDetailsModel.ddChequeNo")[0])) {
			return false;
		}
		if (!checkFile(document.getElementsByName("scanCopyDoc")[0],
				'Please select Attach Scan Copy')) {
			return false;
		}
		
	}
	if (!validateCheckbox(document.getElementsByName("checkAffidavit")[0],
	'Please select afirmation option.')) {
return false;
}
if (!validateCheckbox(document.getElementsByName("showonpublicdomain")[0],
'Please select allow to publish content on public domain option.')) {
return false;
}

	return true;
}

function validatePromoterRegis() {
	if (!requiredValSelect(document
			.getElementsByName("promoterDetailsModel.typeOfPromoter")[0],
			'Please select Type of Promoter')) {
		return false;
	} else if (document
			.getElementsByName("promoterDetailsModel.typeOfPromoter")[0] == '7') {
		if (!requiredValField(document
				.getElementsByName("promoterDetailsModel.ifOther")[0],
				'Please enter other')) {
			return false;
		}
	}
	if (!requiredValField(document
			.getElementsByName("promoterDetailsModel.promoterName")[0],
			'Please enter Name')) {
		return false;
	} else if (!isCharacter(document
			.getElementsByName("promoterDetailsModel.promoterName")[0])) {
		return false;
	}
	if (!requiredValField(document
			.getElementsByName("promoterDetailsModel.panNo")[0],
			'Please enter PAN Number')) {
		return false;
	} else if (!checkPAN(document
			.getElementsByName("promoterDetailsModel.panNo")[0])) {
		return false;
	}

	if (!requiredValField(document
			.getElementsByName("promoterDetailsModel.mobileNo")[0],
			'Please enter Mobile No.')) {
		return false;
	} else if (!checkMobile(document
			.getElementsByName("promoterDetailsModel.mobileNo")[0])) {
		return false;
	}
	if (!requiredValField(document
			.getElementsByName("promoterDetailsModel.addressLine1")[0],
			'Please enter Address Line 1')) {
		return false;
	}
	if (!requiredValField(document
			.getElementsByName("promoterDetailsModel.addressLine2")[0],
			'Please enter Address Line 2 ')) {
		return false;
	}
	if (!requiredValSelect(document.getElementsByName("promoterStateUtId")[0],
			'Please select State/UT')) {
		return false;
	}
	if (!requiredValSelect(document.getElementsByName("permDistrictId")[0],
			'Please select District')) {
		return false;
	}
	if (!requiredValField(document
			.getElementsByName("promoterDetailsModel.comRegistrationNo")[0],
			'Please enter Registration No.')) {
		return false;
	}
	if (!requiredValField(document
			.getElementsByName("promoterDetailsModel.pinCode")[0],
			'Please enter PIN Code')) {
		return false;
	} else if (!checkPin(document
			.getElementsByName("promoterDetailsModel.pinCode")[0])) {
		return false;
	}

	if (!checkFile(document.getElementsByName("regCertificateFile")[0],
			'Please select Registration Certificate')) {
		return false;
	}
	// Project Chairman Details

	if (!requiredValField(
			document
					.getElementsByName("promoterDetailsModel.projectChairmanModel.chairmanName")[0],
			'Please enter Chairman Name')) {
		return false;
	} else if (!isCharacter(document
			.getElementsByName("promoterDetailsModel.projectChairmanModel.chairmanName")[0])) {
		return false;
	}
	if (!requiredValField(
			document
					.getElementsByName("promoterDetailsModel.projectChairmanModel.mobileNo")[0],
			'Please enter Mobile No.')) {
		return false;
	} else if (!checkMobile(document
			.getElementsByName("promoterDetailsModel.projectChairmanModel.mobileNo")[0])) {
		return false;
	}
	if (!requiredValField(
			document
					.getElementsByName("promoterDetailsModel.projectChairmanModel.emailId")[0],
			'Please enter Email Address')) {
		return false;
	} else if (!checkEmail(document
			.getElementsByName("promoterDetailsModel.projectChairmanModel.emailId")[0])) {
		return false;
	}
	if (!requiredValField(
			document
					.getElementsByName("promoterDetailsModel.projectChairmanModel.addressLine1")[0],
			'Please enter Address Line 1')) {
		return false;
	}
	if (!requiredValField(
			document
					.getElementsByName("promoterDetailsModel.projectChairmanModel.addressLine2")[0],
			'Please enter Address Line2')) {
		return false;
	}
	if (!checkFile(document.getElementsByName("chairManPhoto")[0],
			'Please select Photograph')) {
		return false;
	}
	// Project Member Details
	var projMemberName = document.getElementsByName("memberName");
	var m;
	for (m = 0; m < projMemberName.length; m++) {
		if (document.getElementsByName("memberName")[m].value != "") {

			if (!requiredValField(document.getElementsByName("memberName")[m],
					'Please enter Member Name')) {
				return false;
			} else if (!isCharacter(document.getElementsByName("memberName")[m])) {
				return false;
			}
			if (!requiredValSelect(document.getElementsByName("memberType")[m],
					'Please select Member Type')) {
				return false;
			}

			if (!requiredValField(
					document.getElementsByName("memberMobileNo")[m],
					'Please enter Mobile No.')) {
				return false;
			} else if (!checkMobile(document
					.getElementsByName("memberMobileNo")[m])) {
				return false;
			}
			if (!requiredValField(
					document.getElementsByName("memberEmailId")[m],
					'Please enter Email Address')) {
				return false;
			} else if (!checkEmail(document.getElementsByName("memberEmailId")[m])) {
				return false;
			}
			if (!requiredValField(document
					.getElementsByName("memberAddressLine1")[m],
					'Please enter Address Line1')) {
				return false;
			}
			if (!requiredValField(document
					.getElementsByName("memberAddressLine2")[m],
					'Please enter Address Line2')) {
				return false;
			}
			if (!requiredValField(
					document.getElementsByName("memberPinCode")[m],
					'Please enter Pin Code')) {
				return false;
			} else if (!checkPin(document.getElementsByName("memberPinCode")[m])) {
				return false;
			}
			if (!checkFile(document.getElementsByName("memberPhotoFile")[m],
					'Please select Photograph')) {
				return false;
			}
		}
		// Project Blacklist Details
		/*
		 * var blacklist = document.getElementsByName("isBalckList")[0].checked;
		 * if (blacklist == true) { if (!requiredValField(
		 * document.getElementsByName("certificateNo")[0], 'Please enter
		 * Certificate Number')) { return false; } if
		 * (!requiredValSelect(document.getElementsByName("blacklist")[0],
		 * 'Please select Reason for Blacklist')) { return false; } }
		 * 
		 * 
		 * var blacklist = document.getElementsByName("isBalckList")[0]; var j;
		 * for (j = 0; j < blacklist.length; j++) { if (blacklist == true) { if
		 * (!requiredValField(document .getElementsByName("certificateNo")[j],
		 * 'Please enter Certificate Number')) { return false; } if
		 * (!requiredValSelect( document.getElementsByName("blacklist")[j],
		 * 'Please select Reason for Blacklist')) { return false; } } }
		 */
		// Previous Project Details of Promoter
		var prvProjectName = document.getElementsByName("pervProjectName");
		var r;

		for (r = 0; r < prvProjectName.length; r++) {
			if (document.getElementsByName("pervProjectName")[r].value != '') {
				if (!requiredValField(document
						.getElementsByName("pervProjectName")[r],
						'Please enter Project Name')) {
					return false;
				} else if (!isCharacter(document
						.getElementsByName("pervProjectName")[r])) {
					return false;
				}
				if (!requiredValField(document
						.getElementsByName("pervProjectDescription")[r],
						'Please enter Project Description')) {
					return false;
				}

				if (!requiredValSelect(document
						.getElementsByName("projectCurrentStatus")[r],
						'Please select Current Status')) {
					return false;
				}
				if (!requiredValSelect(
						document.getElementsByName("typeOfLand")[r],
						'Please select Type of Land')) {
					return false;
				}

				if (document.getElementsByName("projectCurrentStatus")[r].value == "1") {
					if (!checkFile(document
							.getElementsByName("completionDocId")[r],
							'Please select Photograph')) {
						return false;
					}
					document.getElementsByName("expectedCompletionDate")[r].value = '';
					document.getElementsByName("noOfMonthDelayed")[r].value = '';

				} else if (document.getElementsByName("projectCurrentStatus")[r].value == "2") {
					if (!requiredValField(document
							.getElementsByName("expectedCompletionDate")[r],
							'Please select Expected Completion Date')) {
						return false;
					}
					document.getElementsByName("completionDocId")[0].value = '';
					document.getElementsByName("noOfMonthDelayed")[r].value = '';

				} else if (document.getElementsByName("projectCurrentStatus")[r].value == "3") {
					if (!requiredValField(document
							.getElementsByName("noOfMonthDelayed")[r],
							'Please enter No. of Months Delayed')) {
						return false;
					} else if (!isNumber(document
							.getElementsByName("noOfMonthDelayed")[r])) {
						return false;
					}
					document.getElementsByName("expectedCompletionDate")[r].value = '';
					document.getElementsByName("completionDocId")[0].value = '';

				}

				var isCase = document.getElementsByName("isCasesPending")[r].checked;
				if (isCase == true) {
					if (!requiredValField(document
							.getElementsByName("caseDetails")[r],
							'Please enter Case Details')) {
						return false;
					}
				}
				if (document.getElementsByName("caseDetails")[r].value != '') {
					document.getElementsByName("isCasesPending")[r].checked = true;
				}
				var isPaymentPending = document
						.getElementsByName("isPaymentPending")[r].checked;
				if (isPaymentPending == true) {
					if (!isNumber(document.getElementsByName("pendingAmount")[r])) {
						return false;
					}
				}
				if (document.getElementsByName("pendingAmount")[r].value != '') {
					document.getElementsByName("isPaymentPending")[r].checked = true;
				}

				if (!requiredValField(document
						.getElementsByName("projectAddress")[r],
						'Please enter Address')) {
					return false;
				}

				if (!requiredValSelect(document
						.getElementsByName("stateUtId")[r],
						'Please select State/UT')) {
					return false;
				}

				if (!requiredValSelect(document
						.getElementsByName("pervProjDistrictId")[r],
						'Please select District')) {
					return false;
				}
				if (!requiredValField(document
						.getElementsByName("projectAddrPinCode")[r],
						'Please enter Pin Code')) {
					return false;
				} else if (!checkPin(document
						.getElementsByName("projectAddrPinCode")[r])) {
					return false;
				}
			}
		}

		//

	}

	return true;

}

function editValidatePromoter() {
	
	if (!requiredValSelect(document
			.getElementsByName("promoterDetailsModel.typeOfPromoter")[0],
			'Please select Type of Promoter')) {
		return false;
	} else if (document
			.getElementsByName("promoterDetailsModel.typeOfPromoter")[0] == '7') {
		if (!requiredValField(document
				.getElementsByName("promoterDetailsModel.ifOther")[0],
				'Please enter other')) {
			return false;
		}
	}
	if (!requiredValField(document
			.getElementsByName("promoterDetailsModel.promoterName")[0],
			'Please enter Name')) {
		return false;
	} else if (!isCharacter(document
			.getElementsByName("promoterDetailsModel.promoterName")[0])) {
		return false;
	}
	if (!requiredValField(document
			.getElementsByName("promoterDetailsModel.panNo")[0],
			'Please enter PAN Number')) {
		return false;
	} else if (!checkPAN(document
			.getElementsByName("promoterDetailsModel.panNo")[0])) {
		return false;
	}
	/*if (!requiredValField(document
			.getElementsByName("promoterDetailsModel.emailId")[0],
			'Please enter E-mail')) {
		return false;
	} else if (!checkEmail(document
			.getElementsByName("promoterDetailsModel.emailId")[0])) {
		return false;
	}*/
	if (!requiredValField(document
			.getElementsByName("promoterDetailsModel.mobileNo")[0],
			'Please enter Mobile No.')) {
		return false;
	} else if (!checkMobile(document
			.getElementsByName("promoterDetailsModel.mobileNo")[0])) {
		return false;
	}
	if (!requiredValField(document
			.getElementsByName("promoterDetailsModel.addressLine1")[0],
			'Please enter Address Line 1')) {
		return false;
	}
	if (!requiredValField(document
			.getElementsByName("promoterDetailsModel.addressLine2")[0],
			'Please enter Address Line 2 ')) {
		return false;
	}
	
	if (!requiredValSelect(document.getElementsByName("stateUtId")[0],
			'Please select State/UT')) {
		return false;
	}
	if (!requiredValSelect(document.getElementsByName("permDistrictId")[0],
			'Please select District')) {
		return false;
	}
	if (!requiredValField(document
			.getElementsByName("promoterDetailsModel.comRegistrationNo")[0],
			'Please enter Registration No.')) {
		return false;
	}
	if (!requiredValField(document
			.getElementsByName("promoterDetailsModel.pinCode")[0],
			'Please enter PIN Code')) {
		return false;
	} else if (!checkPin(document
			.getElementsByName("promoterDetailsModel.pinCode")[0])) {
		return false;
	}

	//if (!checkFile(document.getElementsByName("regCertificateFile")[0],
	//		'Please select Registration Certificate')) {
	//	return false;
	//}
	// Project Chairman Details

	if (!requiredValField(
			document
					.getElementsByName("promoterDetailsModel.projectChairmanModel.chairmanName")[0],
			'Please enter Chairman Name')) {
		return false;
	} else if (!isCharacter(document
			.getElementsByName("promoterDetailsModel.projectChairmanModel.chairmanName")[0])) {
		return false;
	}
	if (!requiredValField(
			document
					.getElementsByName("promoterDetailsModel.projectChairmanModel.mobileNo")[0],
			'Please enter Mobile No.')) {
		return false;
	} else if (!checkMobile(document
			.getElementsByName("promoterDetailsModel.projectChairmanModel.mobileNo")[0])) {
		return false;
	}
	if (!requiredValField(
			document
					.getElementsByName("promoterDetailsModel.projectChairmanModel.emailId")[0],
			'Please enter Email Address')) {
		return false;
	} else if (!checkEmail(document
			.getElementsByName("promoterDetailsModel.projectChairmanModel.emailId")[0])) {
		return false;
	}
	if (!requiredValField(
			document
					.getElementsByName("promoterDetailsModel.projectChairmanModel.address")[0],
			'Please enter Address')) {
		return false;
	}
	//if (!checkFile(document.getElementsByName("chairManPhoto")[0],
	//		'Please select Photograph')) {
	//	return false;
	//}
	// Project Member Details
	var projMemberName = document.getElementsByName("memberName");
	var m;
	for (m = 0; m < projMemberName.length; m++) {
		if (document.getElementsByName("memberName")[m].value != "") {

			if (!requiredValField(document.getElementsByName("memberName")[m],
					'Please enter Member Name')) {
				return false;
			} else if (!isCharacter(document.getElementsByName("memberName")[m])) {
				return false;
			}
			if (!requiredValSelect(document.getElementsByName("memberType")[m],
					'Please select Member Type')) {
				return false;
			}

			if (!requiredValField(
					document.getElementsByName("memberMobileNo")[m],
					'Please enter Mobile No.')) {
				return false;
			} else if (!checkMobile(document
					.getElementsByName("memberMobileNo")[m])) {
				return false;
			}
			if (!requiredValField(
					document.getElementsByName("memberEmailId")[m],
					'Please enter Email Address')) {
				return false;
			} else if (!checkEmail(document.getElementsByName("memberEmailId")[m])) {
				return false;
			}
			if (!requiredValField(document
					.getElementsByName("memberAddressLine1")[m],
					'Please enter Address Line1')) {
				return false;
			}
			if (!requiredValField(document
					.getElementsByName("memberAddressLine2")[m],
					'Please enter Address Line2')) {
				return false;
			}
			if (!requiredValField(
					document.getElementsByName("memberPinCode")[m],
					'Please enter Pin Code')) {
				return false;
			} else if (!checkPin(document.getElementsByName("memberPinCode")[m])) {
				return false;
			}
			//if (!checkFile(document.getElementsByName("memberPhotoFile")[m],
			//		'Please select Photograph')) {
			//	return false;
			//}
		}
		// Project Blacklist Details
		/*
		 * var blacklist = document.getElementsByName("isBalckList")[0].checked;
		 * if (blacklist == true) { if (!requiredValField(
		 * document.getElementsByName("certificateNo")[0], 'Please enter
		 * Certificate Number')) { return false; } if
		 * (!requiredValSelect(document.getElementsByName("blacklist")[0],
		 * 'Please select Reason for Blacklist')) { return false; } }
		 * 
		 * 
		 * var blacklist = document.getElementsByName("isBalckList")[0]; var j;
		 * for (j = 0; j < blacklist.length; j++) { if (blacklist == true) { if
		 * (!requiredValField(document .getElementsByName("certificateNo")[j],
		 * 'Please enter Certificate Number')) { return false; } if
		 * (!requiredValSelect( document.getElementsByName("blacklist")[j],
		 * 'Please select Reason for Blacklist')) { return false; } } }
		 */
		// Previous Project Details of Promoter
		var prvProjectName = document.getElementsByName("pervProjectName");
		var r;

		for (r = 0; r < prvProjectName.length; r++) {
			if (document.getElementsByName("pervProjectName")[r].value != '') {
				if (!requiredValField(document
						.getElementsByName("pervProjectName")[r],
						'Please enter Project Name')) {
					return false;
				} else if (!isCharacter(document
						.getElementsByName("pervProjectName")[r])) {
					return false;
				}
				if (!requiredValField(document
						.getElementsByName("pervProjectDescription")[r],
						'Please enter Project Description')) {
					return false;
				}

				if (!requiredValSelect(document
						.getElementsByName("projectCurrentStatus")[r],
						'Please select Current Status')) {
					return false;
				}
				if (!requiredValSelect(
						document.getElementsByName("typeOfLand")[r],
						'Please select Type of Land')) {
					return false;
				}

				if (document.getElementsByName("projectCurrentStatus")[r].value == "1") {
					if (!checkFile(document
							.getElementsByName("completionDocId")[r],
							'Please select Photograph')) {
						return false;
					}
					document.getElementsByName("expectedCompletionDate")[r].value = '';
					document.getElementsByName("noOfMonthDelayed")[r].value = '';

				} else if (document.getElementsByName("projectCurrentStatus")[r].value == "2") {
					if (!requiredValField(document
							.getElementsByName("expectedCompletionDate")[r],
							'Please select Expected Completion Date')) {
						return false;
					}
					document.getElementsByName("completionDocId")[0].value = '';
					document.getElementsByName("noOfMonthDelayed")[r].value = '';

				} else if (document.getElementsByName("projectCurrentStatus")[r].value == "3") {
					if (!requiredValField(document
							.getElementsByName("noOfMonthDelayed")[r],
							'Please enter No. of Months Delayed')) {
						return false;
					} else if (!isNumber(document
							.getElementsByName("noOfMonthDelayed")[r])) {
						return false;
					}
					document.getElementsByName("expectedCompletionDate")[r].value = '';
					document.getElementsByName("completionDocId")[0].value = '';

				}

				var isCase = document.getElementsByName("isCasesPending")[r].checked;
				if (isCase == true) {
					if (!requiredValField(document
							.getElementsByName("caseDetails")[r],
							'Please enter Case Details')) {
						return false;
					}
				}
				if (document.getElementsByName("caseDetails")[r].value != '') {
					document.getElementsByName("isCasesPending")[r].checked = true;
				}
				var isPaymentPending = document
						.getElementsByName("isPaymentPending")[r].checked;
				if (isPaymentPending == true) {
					if (!isNumber(document.getElementsByName("pendingAmount")[r])) {
						return false;
					}
				}
				if (document.getElementsByName("pendingAmount")[r].value != '') {
					document.getElementsByName("isPaymentPending")[r].checked = true;
				}

				if (!requiredValField(document
						.getElementsByName("projectAddress")[r],
						'Please enter Address')) {
					return false;
				}

				if (!requiredValSelect(document
						.getElementsByName("stateUtId")[r],
						'Please select State/UT')) {
					return false;
				}

				if (!requiredValSelect(document
						.getElementsByName("pervProjDistrictId")[r],
						'Please select District')) {
					return false;
				}
				if (!requiredValField(document
						.getElementsByName("projectAddrPinCode")[r],
						'Please enter Pin Code')) {
					return false;
				} else if (!checkPin(document
						.getElementsByName("projectAddrPinCode")[r])) {
					return false;
				}
			}
		}

		//

	}

	return true;

}

function editValidatePromoterRegis() {
	if (!requiredValSelect(document
			.getElementsByName("promoterDetailsModel.typeOfPromoter")[0],
			'Please select Type of Promoter')) {
		return false;
	} else if (document
			.getElementsByName("promoterDetailsModel.typeOfPromoter")[0] == '7') {
		if (!requiredValField(document
				.getElementsByName("promoterDetailsModel.ifOther")[0],
				'Please enter other')) {
			return false;
		}
	}
	if (!requiredValField(document
			.getElementsByName("promoterDetailsModel.promoterName")[0],
			'Please enter Name')) {
		return false;
	} else if (!isCharacter(document
			.getElementsByName("promoterDetailsModel.promoterName")[0])) {
		return false;
	}
	if (!requiredValField(document
			.getElementsByName("promoterDetailsModel.panNo")[0],
			'Please enter PAN Number')) {
		return false;
	} else if (!checkPAN(document
			.getElementsByName("promoterDetailsModel.panNo")[0])) {
		return false;
	}
	/*if (!requiredValField(document
			.getElementsByName("promoterDetailsModel.emailId")[0],
			'Please enter E-mail')) {
		return false;
	} else if (!checkEmail(document
			.getElementsByName("promoterDetailsModel.emailId")[0])) {
		return false;
	}*/
	if (!requiredValField(document
			.getElementsByName("promoterDetailsModel.mobileNo")[0],
			'Please enter Mobile No.')) {
		return false;
	} else if (!checkMobile(document
			.getElementsByName("promoterDetailsModel.mobileNo")[0])) {
		return false;
	}
	if (!requiredValField(document
			.getElementsByName("promoterDetailsModel.addressLine1")[0],
			'Please enter Address Line 1')) {
		return false;
	}
	if (!requiredValField(document
			.getElementsByName("promoterDetailsModel.addressLine2")[0],
			'Please enter Address Line 2 ')) {
		return false;
	}
	if (!requiredValSelect(document.getElementsByName("promoterStateUtId")[0],
			'Please select State/UT')) {
		return false;
	}
	if (!requiredValSelect(document.getElementsByName("permDistrictId")[0],
			'Please select District')) {
		return false;
	}
	if (!requiredValField(document
			.getElementsByName("promoterDetailsModel.comRegistrationNo")[0],
			'Please enter Registration No.')) {
		return false;
	}
	if (!requiredValField(document
			.getElementsByName("promoterDetailsModel.pinCode")[0],
			'Please enter PIN Code')) {
		return false;
	} else if (!checkPin(document
			.getElementsByName("promoterDetailsModel.pinCode")[0])) {
		return false;
	}

	if (!checkFile(document.getElementsByName("regCertificateFile")[0],
			'Please select Registration Certificate')) {
		return false;
	}
	// Project Chairman Details

	if (!requiredValField(
			document
					.getElementsByName("promoterDetailsModel.projectChairmanModel.chairmanName")[0],
			'Please enter Chairman Name')) {
		return false;
	} else if (!isCharacter(document
			.getElementsByName("promoterDetailsModel.projectChairmanModel.chairmanName")[0])) {
		return false;
	}
	if (!requiredValField(
			document
					.getElementsByName("promoterDetailsModel.projectChairmanModel.mobileNo")[0],
			'Please enter Mobile No.')) {
		return false;
	} else if (!checkMobile(document
			.getElementsByName("promoterDetailsModel.projectChairmanModel.mobileNo")[0])) {
		return false;
	}
	if (!requiredValField(
			document
					.getElementsByName("promoterDetailsModel.projectChairmanModel.emailId")[0],
			'Please enter Email Address')) {
		return false;
	} else if (!checkEmail(document
			.getElementsByName("promoterDetailsModel.projectChairmanModel.emailId")[0])) {
		return false;
	}
	if (!requiredValField(
			document
					.getElementsByName("promoterDetailsModel.projectChairmanModel.address")[0],
			'Please enter Address')) {
		return false;
	}
	if (!checkFile(document.getElementsByName("chairManPhoto")[0],
			'Please select Photograph')) {
		return false;
	}
	// Project Member Details
	var projMemberName = document.getElementsByName("memberName");
	var m;
	for (m = 0; m < projMemberName.length; m++) {
		if (document.getElementsByName("memberName")[m].value != "") {

			if (!requiredValField(document.getElementsByName("memberName")[m],
					'Please enter Member Name')) {
				return false;
			} else if (!isCharacter(document.getElementsByName("memberName")[m])) {
				return false;
			}
			if (!requiredValSelect(document.getElementsByName("memberType")[m],
					'Please select Member Type')) {
				return false;
			}

			if (!requiredValField(
					document.getElementsByName("memberMobileNo")[m],
					'Please enter Mobile No.')) {
				return false;
			} else if (!checkMobile(document
					.getElementsByName("memberMobileNo")[m])) {
				return false;
			}
			if (!requiredValField(
					document.getElementsByName("memberEmailId")[m],
					'Please enter Email Address')) {
				return false;
			} else if (!checkEmail(document.getElementsByName("memberEmailId")[m])) {
				return false;
			}
			if (!requiredValField(document
					.getElementsByName("memberAddressLine1")[m],
					'Please enter Address Line1')) {
				return false;
			}
			if (!requiredValField(document
					.getElementsByName("memberAddressLine2")[m],
					'Please enter Address Line2')) {
				return false;
			}
			if (!requiredValField(
					document.getElementsByName("memberPinCode")[m],
					'Please enter Pin Code')) {
				return false;
			} else if (!checkPin(document.getElementsByName("memberPinCode")[m])) {
				return false;
			}
			if (!checkFile(document.getElementsByName("memberPhotoFile")[m],
					'Please select Photograph')) {
				return false;
			}
		}
		// Project Blacklist Details
		/*
		 * var blacklist = document.getElementsByName("isBalckList")[0].checked;
		 * if (blacklist == true) { if (!requiredValField(
		 * document.getElementsByName("certificateNo")[0], 'Please enter
		 * Certificate Number')) { return false; } if
		 * (!requiredValSelect(document.getElementsByName("blacklist")[0],
		 * 'Please select Reason for Blacklist')) { return false; } }
		 * 
		 * 
		 * var blacklist = document.getElementsByName("isBalckList")[0]; var j;
		 * for (j = 0; j < blacklist.length; j++) { if (blacklist == true) { if
		 * (!requiredValField(document .getElementsByName("certificateNo")[j],
		 * 'Please enter Certificate Number')) { return false; } if
		 * (!requiredValSelect( document.getElementsByName("blacklist")[j],
		 * 'Please select Reason for Blacklist')) { return false; } } }
		 */
		// Previous Project Details of Promoter
		var prvProjectName = document.getElementsByName("pervProjectName");
		var r;

		for (r = 0; r < prvProjectName.length; r++) {
			if (document.getElementsByName("pervProjectName")[r].value != '') {
				if (!requiredValField(document
						.getElementsByName("pervProjectName")[r],
						'Please enter Project Name')) {
					return false;
				} else if (!isCharacter(document
						.getElementsByName("pervProjectName")[r])) {
					return false;
				}
				if (!requiredValField(document
						.getElementsByName("pervProjectDescription")[r],
						'Please enter Project Description')) {
					return false;
				}

				if (!requiredValSelect(document
						.getElementsByName("projectCurrentStatus")[r],
						'Please select Current Status')) {
					return false;
				}
				if (!requiredValSelect(
						document.getElementsByName("typeOfLand")[r],
						'Please select Type of Land')) {
					return false;
				}

				if (document.getElementsByName("projectCurrentStatus")[r].value == "1") {
					if (!checkFile(document
							.getElementsByName("completionDocId")[r],
							'Please select Photograph')) {
						return false;
					}
					document.getElementsByName("expectedCompletionDate")[r].value = '';
					document.getElementsByName("noOfMonthDelayed")[r].value = '';

				} else if (document.getElementsByName("projectCurrentStatus")[r].value == "2") {
					if (!requiredValField(document
							.getElementsByName("expectedCompletionDate")[r],
							'Please select Expected Completion Date')) {
						return false;
					}
					document.getElementsByName("completionDocId")[0].value = '';
					document.getElementsByName("noOfMonthDelayed")[r].value = '';

				} else if (document.getElementsByName("projectCurrentStatus")[r].value == "3") {
					if (!requiredValField(document
							.getElementsByName("noOfMonthDelayed")[r],
							'Please enter No. of Months Delayed')) {
						return false;
					} else if (!isNumber(document
							.getElementsByName("noOfMonthDelayed")[r])) {
						return false;
					}
					document.getElementsByName("expectedCompletionDate")[r].value = '';
					document.getElementsByName("completionDocId")[0].value = '';

				}

				var isCase = document.getElementsByName("isCasesPending")[r].checked;
				if (isCase == true) {
					if (!requiredValField(document
							.getElementsByName("caseDetails")[r],
							'Please enter Case Details')) {
						return false;
					}
				}
				if (document.getElementsByName("caseDetails")[r].value != '') {
					document.getElementsByName("isCasesPending")[r].checked = true;
				}
				var isPaymentPending = document
						.getElementsByName("isPaymentPending")[r].checked;
				if (isPaymentPending == true) {
					if (!isNumber(document.getElementsByName("pendingAmount")[r])) {
						return false;
					}
				}
				if (document.getElementsByName("pendingAmount")[r].value != '') {
					document.getElementsByName("isPaymentPending")[r].checked = true;
				}

				if (!requiredValField(document
						.getElementsByName("projectAddress")[r],
						'Please enter Address')) {
					return false;
				}

				if (!requiredValSelect(document
						.getElementsByName("stateUtId")[r],
						'Please select State/UT')) {
					return false;
				}

				if (!requiredValSelect(document
						.getElementsByName("pervProjDistrictId")[r],
						'Please select District')) {
					return false;
				}
				if (!requiredValField(document
						.getElementsByName("projectAddrPinCode")[r],
						'Please enter Pin Code')) {
					return false;
				} else if (!checkPin(document
						.getElementsByName("projectAddrPinCode")[r])) {
					return false;
				}
			}
		}

		//

	}

	return true;

}

function pervForm(url) {

	$(document).on("click", function(e) {
		// e.preventDefault();
		$('#trxForm').attr('action', url).submit();
	});

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

