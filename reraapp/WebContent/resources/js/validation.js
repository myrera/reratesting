var _validationOutput=true;

function validateForm(frm){

	 _validationOutput=true;
	$(frm).find('.requiredValFld').each(function(){
	
		if(! isDisabled(this)){
		
			var msg=$(this).parent().find('.requiredValFldMsg').html();
		if($(this).is('input')){
		var typ=$(this).attr('type');
		if(typ=='radio' || typ=='RADIO'){
			if(!requiredradio(this,msg)){
				 _validationOutput=false;
				 return  _validationOutput;
			}
			
		}else if(typ=='checkbox' || typ=='CHECKBOX'){
			
			if(!requiredOption(this,msg)){
				 _validationOutput=false;
				 return  _validationOutput;
			}
		}else if(typ!='hidden' && typ!='HIDDEN'){
		
			if(!requiredValField(this,msg)){
				 _validationOutput=false;
				 return  _validationOutput;
			}
			
		}
		
		
		
		}else if($(this).is('select')){
			
			if(!requiredValSelect(this,msg)){
				 _validationOutput=false;
				 return  _validationOutput;
			}
		}
        else if($(this).is('textarea')){
        	if(!requiredValField(this,msg)){
				 _validationOutput=false;
				 return  _validationOutput;
			}
		}
		
	}
	});
	
	if(_validationOutput){
	$(frm).find('.mobileValFld').each(function(){
		if(! isDisabled(this)){
			if(! checkMobile(this)){
				 _validationOutput=false;
				 return  _validationOutput;
			}
		}
	
		});
	}
	
	if(_validationOutput){
		$(frm).find('.percentValFld').each(function(){
			if(! isDisabled(this)){
				if(! checkPercent(this)){
					 _validationOutput=false;
					 return  _validationOutput;
				}
			}
		
			});
		}
	
	if(_validationOutput){
	$(frm).find('.landlineValFld').each(function(){
		if(! isDisabled(this)){
			if(! checkLandline(this)){
				 _validationOutput=false;
				 return  _validationOutput;
			}
		}
	
		});
	}
	
	
	if(_validationOutput){
	$(frm).find('.panNoValFld').each(function(){
		if(! isDisabled(this)){
			if(! checkPAN(this)){
				 _validationOutput=false;
				 return  _validationOutput;
			}
		}
	
		});
	}
	
	
	
	if(_validationOutput){
	$(frm).find('.aadhaarNoValFld').each(function(){
		if(! isDisabled(this)){
			if(! checkAadhaar(this)){
				 _validationOutput=false;
				 return  _validationOutput;
			}
		}
	
		});
	}
	
	
	if(_validationOutput){
	$(frm).find('.pinCodeValFld').each(function(){
		if(! isDisabled(this)){
			if(! checkPin(this)){
				 _validationOutput=false;
				 return  _validationOutput;
			}
		}
	
		});
	}
	
	/*if(_validationOutput){
		$(frm).find('.dateValFld').each(function(){
			if(! isDisabled(this)){
				if(! checkPin(this)){
					 _validationOutput=false;
					 return  _validationOutput;
				}
			}
		
			});
		}*/
	
	if(_validationOutput){
	$(frm).find('.numericValFld').each(function(){
		if(! isDisabled(this)){
			if(! isNumber(this)){
				 _validationOutput=false;
				 return  _validationOutput;
			}
		}
	
		});
	}
	
	
	
	if(_validationOutput){
	$(frm).find('.emailValFld').each(function(){
		if(! isDisabled(this)){
			
			if(! validateEmail(this)){
				 _validationOutput=false;
				 return  _validationOutput;
			}
		}
		
	});
	}
	
	
	
	if(_validationOutput){
    $(frm).find('.onlycharValFld').each(function(){
    	if(! isDisabled(this)){
    	if(!isCharacterFun(this)){
    		 _validationOutput=false;
    		 return  _validationOutput;
    	}
    	}
	});
	}
	
	
	if(_validationOutput){
    $(frm).find('.alphanumericValFld').each(function(){
    	if(! isDisabled(this)){
    	if(!isAlphaNumeberFun(this)){
    		 _validationOutput=false;
    		 return  _validationOutput;
    	}
    	}
	});
	}
	
	
	
	return _validationOutput;
}


function isDisabled(fld){
	var flg=false;
	var part=fld;
	var dis=$(fld).css('display');
	var x=0;
	while(x<7){
		if(dis=='none'){
			return true;
		}
		part=$(part).parent();
		dis=$(part).css('display');
		x=x+1;
	}
	
	return flg;
}


function requiredValField(fld, msg) {
	var val = $(fld).val();
	if (val == '') {
		alert(msg);
		$(fld).focus();
		return false;
	}
	return true;
}

function requiredValSelect(fld, msg) {
	var val = $(fld).val();

	if (val == '0' || val == '') {
		alert(msg);
		$(fld).focus();
		return false;
	}
	return true;
}



function requiredradio(fld,msg){
	var st=$(fld).attr('name');
	var flg=false;
	
	var fd=document.getElementsByName(st);
	if(fd && fd.length>0){
	
		for(var x=0;x<fd.length; x=x+1){
		
			if(fd[x].checked){
				flg=true;
			}
		}
	}
	if(!flg){
		alert(msg);
		$(fld).focus();
		return false;
	}
	return true;
}



function requiredOption(fld, msg) {
	if (! $(fld).prop('checked')) {
		alert(msg);
		$(fld).focus();
		return false;
	}
	return true;
}


function checkLandline(fld) {
	var obj = $(fld).val();
	var char = /^\d{6,10}$/;
	if (obj != '') {
		if (!obj.match(char)) {
			alert("Please enter (6-10) digit Landline No.");
			$(fld).focus();
			return false;
		}
	}

	return true;
}

function checkYear(fld) {
	var obj = $(fld).val();
	var char = /^\d{4}$/;
	if (obj != '') {
		if (!obj.match(char)) {
			alert("Please enter 4 digit Year.");
			$(fld).focus();
			return false;
		}
	}
	return true;
}

function checkIfsc(fld) {
	var obj = $(fld).val();
	var char = /^[A-Za-z]{4}[0-9]{6,7}$/;
	if (obj != '') {
		if (!obj.match(char)) {
			alert("Please enter valid IFSC Code");
			$(fld).focus();
			return false;
		}
	}
	return true;
}

function checkAmount(fld) {
	var obj = $(fld).val();
	var char = /^([0-9]+.)*[0-9]+$/;
	if (obj != '') {
		if (!obj.match(char)) {
			alert("Plese enter amount in decimal.");
			$(fld).focus();
			return false;
		}
	}
	
	return true;
}



function checkMobile(fld) {
	var obj = $(fld).val();
	var char = /^\d{10}$/;
	if (obj != '') {
		if (!obj.match(char)) {
			alert("Please enter 10 digit Mobile No.");
			$(fld).focus();
			return false;
		}
	}
	return true;
}

function checkPercent(fld) {
	var obj = $(fld).val();
	var char = /^\d{1,3}$/;
	if(char>100){
		alert("Percentrage should be 0-100 % only.");
	}
	if (obj != '') {
		if (!obj.match(char)) {
			alert("Percentrage should be 1-3 digits Only.");
			$(fld).focus();
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
	var obj = $(fld).val();
	var char = /^\d{6}$/;
	if (obj != '') {
		if (!obj.match(char)) {
			alert("Please enter 6 digit Pin Code");
			$(fld).focus();
			return false;
		}
	}
	return true;
}

function checkAadhaar(fld) {
	var obj = $(fld).val();
	var char = /^\d{12}$/;
	if (obj != '') {
		if (!obj.match(char)) {
			alert("Please enter 12 digit Aadhaar No.");
			$(fld).focus();
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
			$(fld).focus();
			return false;
		}
	}
	return true;
}

function validateEmail(obj) {
	var x = $(obj).val();
	var atpos = x.indexOf("@");
	var dotpos = x.lastIndexOf(".");
	if (atpos < 1 || dotpos < atpos + 2 || dotpos + 2 >= x.length) {
		alert("Please enter a valid Email ID");
		return false;
	}
	return true;
}




function isNumber(fld) {
	var obj = $(fld).val();
	var char = /^([0-9]+,)*[0-9]+$/;
	if (obj != '') {
		if (!obj.match(char)) {
			alert("Please enter numeric only.");
			$(fld).focus();
			return false;
		}
	}
	return true;
}

function isAlphaNumeberFun(fld) {
	var obj = $(fld).val();
	var letterNumber = /^[0-9a-zA-Z ]+$/;
	if (obj.match(letterNumber)) {
		return true;
	} else {
		alert("Please enter alphanumeric only");
		$(fld).focus();
		return false;
	}
}

function isCharacterFun(fld) {
	var obj = $(fld).val();
	var letters = /^[A-Za-z ]+$/;
	if (obj.match(letters)) {
		return true;
	} else {
		alert("Please enter alphabet only.");
		$(fld).focus();
		return false;
	}
}
