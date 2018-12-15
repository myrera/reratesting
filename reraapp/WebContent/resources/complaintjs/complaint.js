function validationFRM() {

/*	if (!requiredValField(document.getElementsByName("applicateName")[0],
			'Please Name of Complainant')) {
		return false;
	}

	if (!requiredValField($('#applicatePhoneNo')[0],
			'Please enter Telephone Number')) {
		return false;
	} else if (!checkLandline($('#applicatePhoneNo')[0])) {
		return false;
	}

	if (!requiredValField($('#applicateMobileNo')[0],
			'Please enter Mobile Number')) {
		return false;
	} else if (!checkMobile($('#applicateMobileNo')[0])) {
		return false;
	}

	var appEmailId = $('#applicateEmailId').val();
	if (appEmailId.trim() == '') {
		alert('Please enter Email ID');
		$('#applicateEmailId').focus();
		return false;

	} else if (!checkEmail($('#applicateEmailId')[0])) {
		return false;
	}

	// 1
	if (!requiredValField(document
			.getElementsByName("applicateResAddressLine1")[0],
			'Please enter address line 1')) {
		return false;
	}
	if (!requiredValField(document
			.getElementsByName("applicateResAddressLine2")[0],
			'Please enter address line 2')) {
		return false;
	}

	if (!requiredValSelect(document.getElementsByName("applicantSateId")[0],
			'Please select State')) {
		return false;
	}
	if (!requiredValSelect(
			document.getElementsByName("applicantDistrictId")[0],
			'Please select District')) {
		return false;
	}

	if (!requiredValField($('#applicateResPinCode')[0], 'Please enter PIN Code')) {
		return false;
	} else if (!checkPin($('#applicateResPinCode')[0])) {
		return false;
	}

	// 1

	if (!requiredValField(document
			.getElementsByName("applicateResSameAsAddressLine1")[0],
			'Please enter address line 1')) {
		return false;
	}
	if (!requiredValField(document
			.getElementsByName("applicateResSameAsAddressLine2")[0],
			'Please enter address line 2')) {
		return false;
	}

	if (!requiredValSelect(document
			.getElementsByName("applicantResSameAsSateId")[0],
			'Please select State')) {
		return false;
	}
	if (!requiredValSelect(
			document.getElementsByName("resSameAsDistrictId")[0],
			'Please select District')) {
		return false;
	}

	if (!requiredValField($('#applicateResSameAsPinCode')[0],
			'Please enter PIN Code')) {
		return false;
	} else if (!checkPin($('#applicateResSameAsPinCode')[0])) {
		return false;
	}

	// part 2

	if (!requiredValField(document.getElementsByName("respondentName")[0],
			'Please enter Name of Respondent')) {
		return false;
	}

	if (!requiredValField($('#respondentPhoneNo')[0],
			'Please enter Telephone Number')) {
		return false;
	} else if (!checkLandline($('#applicatePhoneNo')[0])) {
		return false;
	}

	if (!requiredValField($('#respondentMobileNo')[0],
			'Please enter Mobile Number')) {
		return false;
	} else if (!checkMobile($('#respondentMobileNo')[0])) {
		return false;
	}

	var appEmailId = $('#respondentEmailId').val();
	if (appEmailId.trim() == '') {
		alert('Please enter Email ID');
		$('#respondentEmailId').focus();
		return false;

	} else if (!checkEmail($('#respondentEmailId')[0])) {
		return false;
	}

	// 1
	if (!requiredValField(document
			.getElementsByName("respondentResAddressLine1")[0],
			'Please enter address line 1')) {
		return false;
	}
	if (!requiredValField(document
			.getElementsByName("respondentResAddressLine2")[0],
			'Please enter address line 2')) {
		return false;
	}

	if (!requiredValSelect(document.getElementsByName("respondentSateId")[0],
			'Please select State')) {
		return false;
	}
	if (!requiredValSelect(
			document.getElementsByName("respondentDistrictId")[0],
			'Please select District')) {
		return false;
	}

	if (!requiredValField($('#respondentResPinCode')[0],
			'Please enter PIN Code')) {
		return false;
	} else if (!checkPin($('#respondentResPinCode')[0])) {
		return false;
	}

	// 1

	if (!requiredValField(document
			.getElementsByName("respondentResSameAsAddressLine1")[0],
			'Please enter address line 1')) {
		return false;
	}
	if (!requiredValField(document
			.getElementsByName("respondentResSameAsAddressLine2")[0],
			'Please enter address line 2')) {
		return false;
	}

	if (!requiredValSelect(
			document.getElementsByName("respondentSameAsSateId")[0],
			'Please select State')) {
		return false;
	}
	if (!requiredValSelect(document
			.getElementsByName("respondentSameAsdistrict")[0],
			'Please select District')) {
		return false;
	}

	if (!requiredValField($('#respondentResSameAsPinCode')[0],
			'Please enter PIN Code')) {
		return false;
	} else if (!checkPin($('#respondentResSameAsPinCode')[0])) {
		return false;
	}

	// Details of the Complaint
	// complaintSubject
	if (!requiredValField(document.getElementsByName("complaintSubject")[0],
			'Please enter of Complaint Subject')) {
		return false;
	}
	if (!requiredValField(document.getElementsByName("complaintSummary")[0],
			'Please enter Facts of Complaints')) {
		return false;
	}
	if (!requiredValField(
			document.getElementsByName("reliefSoughtfromRera")[0],
			'Please enter Relief Sought from RERA')) {
		return false;
	}

	if (document.getElementsByName("interimOrderRequired")[0].value == '') {
		alert('Please select nterim Order Required');

		return false;
	}

	var interimOrderRequired1 = $("input[name='interimOrderRequired']:checked")
			.val()

	
	if (interimOrderRequired1 == "YES") {
		if (!requiredValField(
				document.getElementsByName("interimOrderPrayed")[0],
				'Please enter Interim Order')) {
			return false;
		}
	}

	// last

	//
*/
	
	if ($('#declaration1').prop("checked") == false) {
		alert('Please ckeck Declarations');
		$('#declaration1').focus();
		return false;
	}
	if ($('#declaration2').prop("checked") == false) {
		alert('Please ckeck Declarations');
		$('#declaration2').focus();
		return false;
	}
	if ($('#declaration3').prop("checked") == false) {
		alert('Please ckeck Declarations');
		$('#declaration3').focus();
		return false;
	}
	
	return true;
}

function copyAppResAdd() {
	var val = $('#applicantCapyAdd').is(':checked');
	if (val == true) {
		appResCheck();
	} else {
		appResUnCheck();
	}

}

// --2
function copyResponResAdd() {
	var val = $('#respondentCheckAddr').is(':checked');
	if (val == true) {
		appRespondentCheck();
	} else {
		appRespondentUnCheck();
	}

}

// ----2

function appRespondentUnCheck() {
	$("#respondentResSameAsAddressLine1").val('');

	$("#respondentResSameAsAddressLine2").val('');

	$('#respondentSameAsSate').val("0").attr("selected", "selected");

	var value = "0";
	var text = '--Select--';

	$('#District-respondentSameAsSate').empty();

	$('#District-respondentSameAsSate').append(
			$("<option></option>").attr("value", value).text(text));

	$("#respondentResSameAsPinCode").val('');

}
function appRespondentCheck() {

	var applicateResAddressLine1 = $("#respondentResAddressLine1").val();

	if (applicateResAddressLine1.trim() == "") {
		alert('Please enter addressLine1');
		$("#respondentResAddressLine1").focus();

		$('#respondentCheckAddr').attr('checked', false);

		return false;
	}

	var respondentResAddressLine2 = $("#respondentResAddressLine2").val();

	if (respondentResAddressLine2.trim() == "") {
		alert('Please enter addressLine 2');
		$("#respondentResAddressLine2").focus();
		$('#respondentCheckAddr').attr('checked', false);

		return false;
	}

	var applicantSate = $("#respondentSate").val();

	if (applicantSate == "0") {
		alert('Please  select state');
		$("#respondentSate").focus();
		$('#respondentCheckAddr').attr('checked', false);

		return false;
	}

	var districtApplicantSate = $("#District-respondentSate").val();
	if (districtApplicantSate == "0") {
		alert('Please select district');
		$("#District-respondentSate").focus();
		$('#respondentCheckAddr').attr('checked', false);

		return false;
	}

	var pinCode = $("#respondentResPinCode").val();
	if (pinCode.trim() == '') {
		alert('Please enter pin code');
		$("#respondentResPinCode").focus();
		$('#respondentCheckAddr').attr('checked', false);
		return false;

	}

	$("#respondentResSameAsAddressLine1").val(
			$("#respondentResAddressLine1").val());

	$("#respondentResSameAsAddressLine2").val(
			$("#respondentResAddressLine2").val());

	var applicantSate = $('#respondentSate :selected').val();

	$('#respondentSameAsSate').val(applicantSate).attr("selected", "selected");

	var value = $('#District-respondentSate').val();

	var text = $('#District-respondentSate :selected').text();

	$('#District-respondentSameAsSate').empty();

	$('#District-respondentSameAsSate').append(
			$("<option></option>").attr("value", value).text(text));

	$("#respondentResSameAsPinCode").val($("#respondentResPinCode").val());

	$('#respondentCheckAddr').attr('checked', true);

	
}

// ---

function appResUnCheck() {
	$("#applicateResSameAsAddressLine1").val('');

	$("#applicateResSameAsAddressLine2").val('');

	var applicantSate = "0";

	$('#resSameAsSate').val("0").attr("selected", "selected");

	var value = "0";
	var text = '--Select--';

	$('#District-resSameAsSate').empty();

	$('#District-resSameAsSate').append(
			$("<option></option>").attr("value", value).text(text));

	$("#applicateResSameAsPinCode").val('');

}
function appResCheck() {

	var applicateResAddressLine1 = $("#applicateResAddressLine1").val();

	if (applicateResAddressLine1.trim() == "") {
		alert('Please enter addressLine1');
		$("#applicateResAddressLine1").focus();

		$('#applicantCapyAdd').attr('checked', false);

		return false;
	}

	var applicateResAddressLine2 = $("#applicateResAddressLine2").val();

	if (applicateResAddressLine2.trim() == "") {
		alert('Please enter addressLine2');
		$("#applicateResAddressLine2").focus();
		$('#applicantCapyAdd').attr('checked', false);

		return false;
	}

	var applicantSate = $("#applicantSate").val();

	if (applicantSate == "0") {
		alert('Please  select state');
		$("#applicantSate").focus();
		$('#applicantCapyAdd').attr('checked', false);

		return false;
	}

	var districtApplicantSate = $("#District-applicantSate").val();
	if (districtApplicantSate == "0") {
		alert('Please  select district');
		$("#District-applicantSate").focus();
		$('#applicantCapyAdd').attr('checked', false);

		return false;
	}

	var pinCode = $("#applicateResPinCode").val();
	if (pinCode.trim() == '') {
		alert('Please enter pin code');
		$("#applicateResPinCode").focus();
		$('#applicantCapyAdd').attr('checked', false);
		return false;

	}

	$("#applicateResSameAsAddressLine1").val(
			$("#applicateResAddressLine1").val());

	$("#applicateResSameAsAddressLine2").val(
			$("#applicateResAddressLine2").val());

	var applicantSate = $('#applicantSate :selected').val();

	$('#resSameAsSate').val(applicantSate).attr("selected", "selected");

	var value = $('#District-applicantSate').val();

	var text = $('#District-applicantSate :selected').text();

	$('#District-resSameAsSate').empty();

	$('#District-resSameAsSate').append(
			$("<option></option>").attr("value", value).text(text));
	$("#applicateResSameAsPinCode").val($("#applicateResPinCode").val());

	$('#applicantCapyAdd').attr('checked', true);

}

function submitCompalint() {
	var _frm=$("#complaint");
	if (validateForm(_frm) && validationFRM()) {
		$(_frm).submit();
	}

}

function validatePaymentDetails() {
	var paymode = document.getElementsByName("paymentmode")[0];
	if (!requiredValSelect(paymode, 'Please Select Payment Mode')) {
		return false;
	} else {

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

		}
	}

	return true;
}
