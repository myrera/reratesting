
var chkform=true;


$("#projectScheduleId").click( function(e) {
	var frm= $("#projectScheduleForm");
	if(validateForm(frm)){
		var isTrue=true;
		var index = $('#sche-subStructure-list >tbody >tr').length;
		for(i = 0; i<index; i++){
			if($("#subestimatedFrmDate_"+i).val() !="" && $("#subestimatedToDate_"+i).val() !=""){
				var fd=$("#subestimatedFrmDate_"+i).val();
				var td=$("#subestimatedToDate_"+i).val();
				if(!checkdate(fd,td)){
					$("#subestimatedFrmDate_"+i).focus();
					$("#subestimatedToDate_"+i).focus();
					isTrue=false;
					return;
				}
			}
		}
		if(isTrue){
			if(chkform){   
				chkform=false;
				$(frm).submit();
			}
		}
	}
});



/*function checkdates(sd,ed){
	if(sd!='' && ed!=''){
	if(parsedate(sd)>=parsedate(ed)){
		alert("End date should be grater than start date.");
		return false;
	}else{
		return true;
	}
	}
}*/

$("#landCostAquId").click( function(e) {
	/*	alert("hii");
	var amounttest = $('#"amounttest"').val();
	alert("amounttest");
	if(agentRegNo.trim()==''){
		alert('Enter the agent registration');
		return false;
	}
	 */
	var frm= $("#landCostAquiForm");
	if(validateForm(frm)){
		if(chkform){   
			chkform=false;
			$(frm).submit();
		}
	}
});






$("#tdrId").click( function(e) {
	var frm= $("#TDRForm");
//	alert("jiiii");
	if(validateForm(frm)){
		if(chkform){   
			chkform=false;
			$(frm).submit();
		}
	}
});



$("#approvalCostId").click( function(e) {
	var frm= $("#ApprovalCostForm");
	if(validateForm(frm)){
		if(chkform){   
			chkform=false;
			$(frm).submit();
		}
	}
});




$("#constructionCostId").click( function(e) {
	var frm= $("#constructionCostForm");
//	alert("liiii");
	if(validateForm(frm)){
		if(chkform){   
			chkform=false;
			$(frm).submit();
		}
	}
});


function resetlandCostAquiForm() {
	var frm= $("#landCostAquiForm");
	document.getElementById("landCostAquiForm").reset();
	$(frm).submit();
	return true;
}

function ApprovalCostForm() {
	var frm= $("#ApprovalCostForm");
	//alert (frm);
	$(frm).submit();
	alert("updated successfully..Please wait");
	return true;
	/*if(validateForm(frm)){

		if(_chkclk){   
			_chkclk=false;
			$(frm).submit();
		}
	}*/
}

function constructionCostForm() {
	var frm= $("#constructionCostForm");
	//alert (frm);
	$(frm).submit();
	alert("updated successfully..Please wait");
	return true;
	/*if(validateForm(frm)){

		if(_chkclk){   
			_chkclk=false;
			$(frm).submit();
		}
	}*/
}

//QUATERLY UPDATE 



$("#bankdetailsId").click( function(e) {
	var frm= $("#bankForm");
//	alert("bankdetailsId >>");
	if(validateForm(frm)){
		if(chkform){   
			chkform=false;
			$(frm).submit();
		}
	}
});


$("#apartmentId").click( function(e) {
	var frm= $("#apartmentForm");
	//alert("apartmentId >>");
	if(validateForm(frm)){
		if(chkform){   
			chkform=false;
			$(frm).submit();
		}
	}
});

$("#parkingId").click( function(e) {
	var frm= $("#parkingForm");
	//alert("parkingFormId >>");
	if(validateForm(frm)){
		if(chkform){   
			chkform=false;
			$(frm).submit();
		}
	}
});

$("#floorId").click( function(e) {
	var frm= $("#floorForm");
	//alert("parkingFormId >>");
	if(validateForm(frm)){
		if(chkform){   
			chkform=false;
			$(frm).submit();
		}
	}
});



$("#infrastructureId").click( function(e) {
	var frm= $("#infrastructureForm");
	//alert("infrastructureForm  >>");
	if(validateForm(frm)){
		if(chkform){   
			chkform=false;
			$(frm).submit();
		}
	}
});


$("#commonAreaId").click( function(e) {
	var frm= $("#commonAreaForm");
	//alert("commonAreaForm  >>");
	if(validateForm(frm)){
		if(chkform){   
			chkform=false;
			$(frm).submit();
		}
	}
});


$("#approvalNocId").click( function(e) {
	var frm= $("#approvalNocForm");
	//$(frm).submit();
	//alert("approvalNocFormId  >>");
	if(validateForm(frm)){
		if(chkform){   
			chkform=false;
			$(frm).submit();
		}
	}
});


$("#associationId").click( function(e) {
	var frm= $("#associationForm");
	//alert("associationForm  >>");
	if(validateForm(frm)){
		if(chkform){   
			chkform=false;
			$(frm).submit();
		}
	}
});


$("#modificationId").click( function(e) {
	var frm= $("#modificationForm");
	//alert("modificationForm  >>");
	if(validateForm(frm)){
		if(chkform){   
			chkform=false;
			$(frm).submit();
		}
	}
});



$("#litigationId").click( function(e) {
	var frm= $("#litigationForm");
	//alert("litigationForm  >>");
	if(validateForm(frm)){
		if(chkform){   
			chkform=false;
			$(frm).submit();
		}
	}
});


$("#projectSummaryId").click( function(e) {
	var frm= $("#projectSummaryForm");
	//alert("projectSummaryForm  >>");
	if(validateForm(frm)){
		if(chkform){   
			chkform=false;
			$(frm).submit();
		}
	}
});



$("#finalApproveId").click( function(e) {
	var frm= $("#finalApproveForm");
	//alert("finalApproveForm  >>");
	if(validateForm(frm)){
		if(chkform){   
			chkform=false;
			$(frm).submit();
		}
	}
});

function deleteWork(workId){
	$("#rm_"+workId).remove();
}




$("#civilWorksId").click( function(e) {
	var frm= $("#civilWorksForm");
//	alert("civilWorksForm  >>");
	if(validateForm(frm)){
		if(chkform){   
			chkform=false;
			$(frm).submit();
		}
	}
});



$("#buildingId").click( function(e) {
	var frm= $("#buildingForm");
	//alert("buildingForm  >>");
	if(validateForm(frm)){
		if(chkform){   
			chkform=false;
			$(frm).submit();
		}
	}
});



$("#updateDetailsId").click( function(e) {
	var frm= $("#updateDocDetailsForm");
	if(validateForm(frm)){
		if(chkform){   
			chkform=false;
			$(frm).submit();
		}
	}
});

$("#towerFormId").click( function(e) {
	var frm= $("#towerForm");
	//alert("towerForm  >>");
	if(validateForm(frm)){
		//	alert("jjjj");
		if(chkform){   
			chkform=false;
			$(frm).submit();
		}
	}
});

$("#floorFormId").click( function(e) {
	var frm= $("#updatefloorForm");
	//alert("towerForm  >>");
	var total=$("#totApartments").val();
	var appartments=0;
	var index = $('#floor-list >tbody >tr').length;
	//alert("towerApp  >>"+total);
	//alert("towerApp  >>"+index);
	for (i = 0; i <index; i++) {
		var app=$("#totNoOfApartment_"+i).val();
		appartments+=parseInt(app);
	}
	//alert("towerApp  >>"+appartments);
	if(appartments!=total){
		alert("Please enter only "+total+" Apartments");
	}else{
		if(validateForm(frm)){
			//alert("jjjj");
			if(chkform){   
				chkform=false;
				$(frm).submit();
			}
		}
	}
});

$("#plotFormId").click( function(e) {
	var frm= $("#plotForm");

	var total=$("#totalNumberOfPlots").val();
	var plot1=$("#totalnoOfEWSPlots").val();
	var plot2=$("#totalnoOfLIGPlots").val();
	var plot3=$("#totalnoOfMIGPlots").val();
	var plot4=$("#totalnoOfHIGPlots").val();
	var plot5=$("#totalnoOfOtherPlots").val();
	var sumOfPlots=parseInt(plot1)+parseInt(plot2)+parseInt(plot3)+parseInt(plot4)+parseInt(plot5);
	var noOfPlots=parseInt(total);
	//alert(sumOfPlots+"<<>>"+noOfPlots);
	if(sumOfPlots!=noOfPlots){
		alert("Please enter only "+noOfPlots+" Plots");
		$("#totalNumberOfPlots").focus();
	}else{
		if(validateForm(frm)){
			if(chkform){   
				chkform=false;
				$(frm).submit();
			}
		}
	}
});

$("#eachApartFormId").click( function(e) {
	var frm= $("#eachApartForm");
	//alert("towerForm  >>");
	var total=$("#totApartments").val();
	var appartments=0;
	var index = $('#sche-list >tbody >tr').length;
	//alert("towerApp  >>"+total);
	//alert("towerApp  >>"+index);
	for (i = 0; i <index; i++) {
		var app=$("#totNoOfUnits_"+i).val();
		appartments+=parseInt(app);
	}
	//alert("towerApp  >>"+appartments);
	if(appartments!=total){
		alert("Please enter only "+total+" Apartments");
	}else{
		//alert("success");
		if(validateForm(frm)){
			if(chkform){   
				chkform=false;
				alert("Tower details submitted sucessfully,click add more tower to add another Tower");
				$(frm).submit();
			}
		}
	}
});

$("#welfareId").click( function(e) {
	var frm= $("#welfareForm");
	//alert("associationForm  >>");
	if(validateForm(frm)){
		if(chkform){   
			chkform=false;
			$(frm).submit();
		}
	}
});

$("#masonryId").click( function(e) {
	var frm= $("#masonryForm");
	if(validateForm(frm)){
		var isTrue=true;
		var index = $('#sche-masonry-Works-list >tbody >tr').length;
		for(i = 0; i<index; i++){
			if($("#mansoryestimatedFrmDate_"+i).val() !="" && $("#mansoryestimatedToDate_"+i).val() !=""){
				var fd=$("#mansoryestimatedFrmDate_"+i).val();
				var td=$("#mansoryestimatedToDate_"+i).val();
				if(!checkdate(fd,td)){
					$("#mansoryestimatedFrmDate_"+i).focus();
					$("#mansoryestimatedToDate_"+i).focus();
					isTrue=false;
					return;
				}
			}
		}
		if(isTrue){
			if(chkform){   
				chkform=false;
				$(frm).submit();
			}
		}
	}
});

$("#supStructureId").click( function(e) {
	var frm= $("#supStructureForm");
	if(validateForm(frm)){
		var isTrue=true;
		var index = $('#sche-super-Structure-list >tbody >tr').length;
		for(i = 0; i<index; i++){
			if($("#superestimatedFrmDate_"+i).val() !="" && $("#superestimatedToDate_"+i).val() !=""){
				var fd=$("#superestimatedFrmDate_"+i).val();
				var td=$("#superestimatedToDate_"+i).val();
				if(!checkdate(fd,td)){
					$("#superestimatedFrmDate_"+i).focus();
					$("#superestimatedToDate_"+i).focus();
					isTrue=false;
					return;
				}
			}
		}
		if(isTrue){
			if(chkform){   
				chkform=false;
				$(frm).submit();
			}
		}
	}
});

$("#finishingId").click( function(e) {
	var frm= $("#finishingForm");
	if(validateForm(frm)){
		var isTrue=true;
		var index = $('#sche-interior-work-list >tbody >tr').length;
		for(i = 0; i<index; i++){
			if($("#estimatedFrmDate_"+i).val() !="" && $("#estimatedToDate_"+i).val() !=""){
				var fd=$("#estimatedFrmDate_"+i).val();
				var td=$("#estimatedToDate_"+i).val();
				if(!checkdate(fd,td)){
					$("#estimatedFrmDate_"+i).focus();
					$("#estimatedToDate_"+i).focus();
					isTrue=false;
					return;
				}
			}
		}
		if(isTrue){
			if(chkform){   
				chkform=false;
				$(frm).submit();
			}
		}
	}
});


$("#ExternalInfraId").click( function(e) {
	var frm= $("#ExternalInfraForm");
	if(validateForm(frm)){
		if(chkform){   
			chkform=false;
			$(frm).submit();
		}
	}
});


$("#infrastructureId").click( function(e) {
	var frm= $("#infrastructureForm");
	if(validateForm(frm)){
		if(chkform){   
			chkform=false;
			$(frm).submit();
		}
	}
});


$("#commonAreaId").click( function(e) {
	var frm= $("#commonAreaForm");
	if(validateForm(frm)){
		if(chkform){   
			chkform=false;
			$(frm).submit();
		}
	}
});


//for civil work

$("#buildingId").click( function(e) {
	var frm= $("#buildingForm");
	//alert("buildingForm  >>");
	if(validateForm(frm)){
		if(chkform){   
			chkform=false;
			$(frm).submit();
		}
	}
});

//for common area purcheaser

$("#PurchaserDetailsId").click( function(e) {
	var frm= $("#commonAreasPurchaserDetailsForm");
	if(validateForm(frm)){
		if(chkform){   
			chkform=false;
			$(frm).submit();
		}
	}
});




$("#quaterSupStructureupdateId").click( function(e) {
	var frm= $("#quaterSupStructureupdateForm");
	if(validateForm(frm)){
		var isTrue=true;
		var index = $('#quarter-sup-sche-list >tbody >tr').length;
		for(i = 0; i<index; i++){
			if($("#supactualFrmDate_"+i).val() !="" && $("#supactualToDate_"+i).val() !=""){
				var fd=$("#supactualFrmDate_"+i).val();
				var td=$("#supactualToDate_"+i).val();
				if(!checkdate(fd,td)){
					$("#supactualFrmDate_"+i).focus();
					$("#supactualToDate_"+i).focus();
					isTrue=false;
					return;
				}
			}
		}
		if(isTrue){
			if(chkform){   
				chkform=false;
				$(frm).submit();
			}
		}
	}
});

$("#quaterSubStructureupdateId").click( function(e) {
	var frm= $("#quaterSubStructureupdateForm");
	if(validateForm(frm)){
		var isTrue=true;
		var index = $('#quarter-sub-sche-list >tbody >tr').length;
		for(i = 0; i<index; i++){
			if($("#subactualFrmDate_"+i).val() !="" && $("#subactualToDate_"+i).val() !=""){
				var fd=$("#subactualFrmDate_"+i).val();
				var td=$("#subactualToDate_"+i).val();
				if(!checkdate(fd,td)){
					$("#subactualFrmDate_"+i).focus();
					$("#subactualToDate_"+i).focus();
					isTrue=false;
					return;
				}
			}
		}
		if(isTrue){
			if(chkform){   
				chkform=false;
				$(frm).submit();
			}
		}
	}
});

$("#quaterupdateId").click( function(e) {
	var frm= $("#quaterupdateForm");
	if(validateForm(frm)){
		var isTrue=true;
		var index = $('#quarter-masonry-sche-list >tbody >tr').length;
		for(i = 0; i<index; i++){
			if($("#masactualFrmDate_"+i).val() !="" && $("#masactualToDate_"+i).val() !=""){
				var fd=$("#masactualFrmDate_"+i).val();
				var td=$("#masactualToDate_"+i).val();
				if(!checkdate(fd,td)){
					$("#masactualFrmDate_"+i).focus();
					$("#masactualToDate_"+i).focus();
					isTrue=false;
					return;
				}
			}
		}
		if(isTrue){
			if(chkform){   
				chkform=false;
				$(frm).submit();
			}
		}
	}
});


$("#amenityId").click( function(e) {
	var frm= $("#amenityForm");
	//alert("amenityForm  >>");
	if(validateForm(frm)){
		if(chkform){   
			chkform=false;
			$(frm).submit();
		}
	}
});





$("#landCostAquJDAId").click( function(e) {
	var frm= $("#landCostAquiJDAForm");
	if(validateForm(frm)){
		if(chkform){   
			chkform=false;
			$(frm).submit();
		}
	}
});

$("#projectWelFareId").click( function(e) {
	//alert("hhh");
	var frm= $("#updateProjectWelfareFundDetails");
	//alert("associationForm  >>");
	if(validateForm(frm)){
		if(chkform){   
			chkform=false;
			$(frm).submit();
		}
	}
});

$("#plotCivilWorkId").click( function(e) {
	var frm= $("#plotCivilWorkForm");
	if(validateForm(frm)){
		var isTrue=true;
		var index = $('#plotsche-list >tbody >tr').length;
		for(i = 0; i<index; i++){
			if($("#estimatedFrmDate_"+i).val() !="" && $("#estimatedToDate_"+i).val() !=""){
				var fd=$("#estimatedFrmDate_"+i).val();
				var td=$("#estimatedToDate_"+i).val();
				if(!checkdate(fd,td)){
					$("#estimatedFrmDate_"+i).focus();
					$("#estimatedToDate_"+i).focus();
					isTrue=false;
					return;
				}
			}
		}
		if(isTrue){
			if(chkform){   
				chkform=false;
				$(frm).submit();
			}
		}
	}
});

function checkdate(sd,ed){
	//alert("validating date");
	if(sd!='' && ed!=''){
		//alert("if");
		if(parsedate(sd)>=parsedate(ed)){
			alert("End date should be grater than start date.");
			return false;
		}else{
			return true;
		}
	}
}

function parsedate(str){
	//alert("date");
	if(str!=''){
		//alert("if");
		var dt=new Date();
		var st=	str.split('-');
		dt.setDate(st[2]);
		dt.setMonth(st[1]);
		dt.setFullYear(st[0], st[1], st[2]);
		dt.setHours(0,0,0,0);
		//alert(dt);
		return dt;
	}
	return null;
}

$("#PurchaserDetailsId").click( function(e) {
	var frm= $("#commonAreasPurchaserDetailsForm");
	if(validateForm(frm)){
		if(chkform){   
			chkform=false;
			$(frm).submit();
		}
	}
});

$("#quaterupdateFinInteriorId").click( function(e) {
	//alert("test");
	var frm= $("#quaterupdatefinInteriorForm");
	if(validateForm(frm)){
		var isTrue=true;
		var index = $('#quarter-finishing-sche-list >tbody >tr').length;
		for(i = 0; i<index; i++){
			if($("#actualFrmDate_"+i).val() !="" && $("#actualToDate_"+i).val() !=""){
				//alert(i);
				var fd=$("#actualFrmDate_"+i).val();
				var td=$("#actualToDate_"+i).val();
				if(!checkdate(fd,td)){
					$("#actualFrmDate_"+i).focus();
					$("#actualToDate_"+i).focus();
					isTrue=false;
					return;
				}
			}
		}
		if(isTrue){
			if(chkform){   
				chkform=false;
				$(frm).submit();
			}
		}
	}
});

$("#quaterExternalupdateId").click( function(e) {
	var frm= $("#quaterExternalupdateForm");
	if(validateForm(frm)){
		if(chkform){   
			chkform=false;
			$(frm).submit();
		}
	}
});


$("#quaterupdateCivilWorkId").click( function(e) {
	var frm= $("#updateCivilWorksForm");
	if(validateForm(frm)){
		var isTrue=true;
		var index = $('#quarter-sche-list >tbody >tr').length;
		for(i = 0; i<index; i++){
			if($("#actualFrmDate_"+i).val() !="" && $("#actualToDate_"+i).val() !=""){
				var fd=$("#actualFrmDate_"+i).val();
				var td=$("#actualToDate_"+i).val();
				if(!checkdate(fd,td)){
					$("#actualFrmDate_"+i).focus();
					$("#actualToDate_"+i).focus();
					isTrue=false;
					return;
				}
			}
		}
		if(isTrue){
			if(chkform){   
				chkform=false;
				$(frm).submit();
			}
		}
	}
});

$("#quarterlyCommonAuthId").click( function(e) {
	//alert("hhh");
	var frm= $("#updateQuarterlyCommonAreasAuthorityDetailsForm");
	if(validateForm(frm)){
		if(chkform){   
			chkform=false;
			$(frm).submit();
		}
	}
});

$("#quarterlyCommonPurchaserId").click( function(e) {
	//alert("hhh");
	var frm= $("#quarterlyCommonPurchaserForm");
	if(validateForm(frm)){
		if(chkform){   
			chkform=false;
			$(frm).submit();
		}
	}
});





$("#approvalPlotNocId").click( function(e) {
	var frm= $("#approvalPlotNocForm");
	//alert("approvalNocFormId  >>");
	//$(frm).submit();
	if(validateForm(frm)){
		//alert("approvalNocFormId  >>");
		if(chkform){   
			chkform=false;
			$(frm).submit();
		}
	}
});

$("#commonAuthorityId").click( function(e) {
	//alert("hhh");
	var frm= $("#commonAreasAuthorityForm");
	if(validateForm(frm)){
		if(chkform){   
			chkform=false;
			$(frm).submit();
		}
	}

});

$("#quarterplotsId").click( function(e) {
	//alert("hhh");
	var frm= $("#quarterplotForm");
	if(validateForm(frm)){
		if(chkform){   
			chkform=false;
			$(frm).submit();
		}
	}

});

$("#towerdetailsFormId").click( function(e) {
	//alert("hhh");
	var frm= $("#towerdetailsForm");
	if(validateForm(frm)){
		if(chkform){   
			chkform=false;
			$(frm).submit();
		}
	}

});

$("#uploadexcelId").click( function(e) {
	
	  var txt;
	    var r =  confirm("Please make sure you have filled all tower wise unit details, are you sure to upload the file ???");
	    if (r == true) {
	        var frm= $("#uploadexcelForm");
	        var validExts = new Array(".xlsx", ".xls");
	        var fileExt = $("#unitdetailsExcelFile").val();
	        alert(fileExt);
	        fileExt = fileExt.substring(fileExt.lastIndexOf('.'));
	        alert(fileExt);
	        if (validExts.indexOf(fileExt) < 0) {
	        	alert("Invalid file selected, valid files are of " +
	        			validExts.toString() + " types.");
	        	return false;
	        }
	        else $(frm).submit();
	    } else {
	        alert("Please check the excel sheet and upload");
	    }
});

