/*****
 * CONFIGURATION
 */
//Main navigation
$.navigation = $('nav > ul.nav');

$.panelIconOpened = 'icon-arrow-up';
$.panelIconClosed = 'icon-arrow-down';

//Default colours
$.brandPrimary = '#20a8d8';
$.brandSuccess = '#4dbd74';
$.brandInfo = '#63c2de';
$.brandWarning = '#f8cb00';
$.brandDanger = '#f86c6b';

$.grayDark = '#2a2c36';
$.gray = '#55595c';
$.grayLight = '#818a91';
$.grayLighter = '#d1d4d7';
$.grayLightest = '#f8f9fa';

'use strict';

/****
 * MAIN NAVIGATION
 */

$(document).ready(function($) {

	// Add class .active to current link
	$.navigation.find('a').each(function() {

		var cUrl = String(window.location);

		if (cUrl.substr(cUrl.length - 1) == '#') {
			cUrl = cUrl.slice(0, -1);
		}

		if ($($(this))[0].href == cUrl) {
			$(this).addClass('active');

			$(this).parents('ul').add(this).each(function() {
				$(this).parent().addClass('open');
			});
		}
	});

	// Dropdown Menu
	$.navigation.on('click', 'a', function(e) {

		if ($.ajaxLoad) {
			e.preventDefault();
		}

		if ($(this).hasClass('nav-dropdown-toggle')) {
			$(this).parent().toggleClass('open');
		}

	});

	function resizeBroadcast() {

		var timesRun = 0;
		var interval = setInterval(function() {
			timesRun += 1;
			if (timesRun === 5) {
				clearInterval(interval);
			}
			window.dispatchEvent(new Event('resize'));
		}, 62.5);
	}

	/* ---------- Main Menu Open/Close, Min/Full ---------- */
	$('.navbar-toggler').click(function() {

		var bodyClass = localStorage.getItem('body-class');

		if ($(this).hasClass('layout-toggler') && $('body').hasClass('sidebar-off-canvas')) {
			$('body').toggleClass('sidebar-opened').parent().toggleClass('sidebar-opened');
			//resize charts
			resizeBroadcast();

		} else if ($(this).hasClass('layout-toggler') && ($('body').hasClass('sidebar-nav') || bodyClass == 'sidebar-nav')) {
			$('body').toggleClass('sidebar-nav');
			localStorage.setItem('body-class', 'sidebar-nav');
			if (bodyClass == 'sidebar-nav') {
				localStorage.clear();
			}
			//resize charts
			resizeBroadcast();
		} else {
			$('body').toggleClass('mobile-open');
		}
	});

	$('.aside-toggle').click(function() {
		$('body').toggleClass('aside-menu-open');

		//resize charts
		resizeBroadcast();
	});

	$('.sidebar-close').click(function() {
		$('body').toggleClass('sidebar-opened').parent().toggleClass('sidebar-opened');
	});

	/* ---------- Disable moving to top ---------- */
	$('a[href="#"][data-top!=true]').click(function(e) {
		e.preventDefault();
	});

});

/****
 * CARDS ACTIONS
 */

$(document).on('click', '.card-actions a', function(e) {
	e.preventDefault();

	if ($(this).hasClass('btn-close')) {
		$(this).parent().parent().parent().fadeOut();
	} else if ($(this).hasClass('btn-minimize')) {
		var $target = $(this).parent().parent().next('.card-block');
		if (!$(this).hasClass('collapsed')) {
			$('i', $(this)).removeClass($.panelIconOpened).addClass($.panelIconClosed);
		} else {
			$('i', $(this)).removeClass($.panelIconClosed).addClass($.panelIconOpened);
		}

	} else if ($(this).hasClass('btn-setting')) {
		$('#myModal').modal('show');
	}

});

function capitalizeFirstLetter(string) {
	return string.charAt(0).toUpperCase() + string.slice(1);
}

function init(url) {

	/* ---------- Tooltip ---------- */
	$('[rel="tooltip"],[data-rel="tooltip"]').tooltip({ "placement": "bottom", delay: { show: 400, hide: 200 } });

	/* ---------- Popover ---------- */
	$('[rel="popover"],[data-rel="popover"],[data-toggle="popover"]').popover();

}


$(function() {

	$(document.body).on('click', '.changeType', function() {
		$(this).closest('.phone-input').find('.type-text').text($(this).text());
		$(this).closest('.phone-input').find('.type-input').val($(this).data('type-value'));
	});

	$(document.body).on('click', '.btn-remove-phone', function() {
		$(this).closest('.phone-input').remove();
	});


	$('.btn-add-phone').click(function() {
		var index = $('.phone-input').length + 1;

		$('.phone-list').append('' +
				'<div class="input-group phone-input">' +
				'<span class="input-group-btn">' +

				'</span>' +
				'<input type="file" name="phone[' + index + '][number]" class="form-control" placeholder="+1 (999) 999 9999" />' +
				'<input type="hidden" name="phone[' + index + '][type]" class="type-input" value="" />' +
				'<span class="input-group-btn">' +
				'<button class="btn btn-danger btn-remove-phone" type="button"><span class="fa fa-times">  </span></button>' +
				'</span>' +
				'</div>'
		);

	});

});

/*$(function() {

    $(document.body).on('click', '.changeType', function() {
        $(this).closest('.advertisement-input').find('.type-text').text($(this).text());
        $(this).closest('.advertisement-list').find('.type-input').val($(this).data('type-value'));
    });

    $(document.body).on('click', '.btn-remove-advertisement', function() {
        $(this).closest('.advertisement-input').remove();
    });

    $('.btn-add-advertisement').click(function() {

        var index = $('.advertisement-input').length + 1;

        $('.advertisement-list').append('' +
            '<div class="input-group advertisement-input">' +
            '<span class="input-group-btn">' +

            '</span>' +
            '<input type="file" name="advertisement[' + index + '][number]" class="form-control" />' +
            '<input type="hidden" name="advertisement[' + index + '][type]" class="type-input" value="" />' +
            '<span class="input-group-btn">' +
            '<button class="btn btn-danger btn-remove-advertisement" type="button"><span class="fa fa-times"></span></button>' +
            '</span>' +
            '</div>'
        );

    });

});*/

$(function() {

	$(document.body).on('click', '.btn-remove-projsched', function() {
		$(this).closest('tr').remove();
	});


	$('.btn-add-projsch').click(function() {
		var index = $('#sche-list >tbody >tr').length+1;
		$('#sche-list').append('' +
				'<tr><td>'+index+'</td>'+
				'<td><input type="text" name="typeOfWork" class="form-control requiredValFld">'+
				'<span class="requiredValFldMsg"> Please Enter type Of Work.</span>'+
				'</td>'+
				'<td> <input type="date"  name="estimatedFrmDate" class="form-control requiredValFld">'+
				'<span class="requiredValFldMsg"> Please Enter Estimated From Date.</span>'+
				'</td>'+
				'<td> <input type="date" name="estimatedToDate" class="form-control requiredValFld">'+
				'<span class="requiredValFldMsg"> Please Enter Estimated To Date </span>'+
				'</td>'+
				'<td>'+
				'</td>'+
				'<td> '+
				'</td>'+
				'<td><span class="input-group-btn">' +
				'<button class="btn btn-danger btn-remove-projsched" type="button"><span class="fa fa-times"></span></button>' +
				'</span></td>'+
				'</tr>'
		);

	});

});




//added by renuka for addmore 
$(function() {

	$(document.body).on('click', '.remove', function() {
		$(this).closest('.after-add-more').remove();
	});

	$('.btn-add-tdr').click(function() {
		$(".after-add-more").last().after(''+
				'<div class ="after-add-more" style="border-style: ridge;padding: 20px;background-color: #F8F8F8;">'+
				'<div class="form-group row">'+
				' <label class="col-md-3 form-control-label" for="amount">Amount withdrawn from the bank for the purpose of the project (INR)</label>'+
				' <div class="col-md-9">'+
				' <input type="text" id="amount" name="amount" class="form-control requiredValFld" placeholder="">'+
				' <span class="requiredValFldMsg"> Please enter amount.</span>'+
				'</div></div><div class="form-group row">'+
				' <label class="col-md-3 form-control-label" for="amtWithDrawnDate">Date</label>'+
				'<div class="col-md-9"><input type="date" id="amtWithDrawnDate" name="amtWithDrawnDate" class="form-control requiredValFld" placeholder="">'+
				'<span class="requiredValFldMsg"> Please enter date.</span>'+
				'</div></div>' +
				'<div class="form-group row">'+
				'<label class="col-md-3 form-control-label" for="certFromChartedAcc">Certificate from Chartered Account</label>'+
				'<div class="col-md-9"><input type="file" id="certFromChartedAcc" name="certFromChartedAcc" class="form-control requiredValFld">'+
				' <span class="requiredValFldMsg"> Please Attach file.</span>'+
				'</div>'+
				'</div>'+
				'<div class="form-group row">'+
				'<a class="btn btn-danger btn-sm pull-right remove"> Remove</a>'+
				'<br/></div></div>'
		);
	});
});

$(function() {
	$('.btn-add-approve').click(function() {
		$(".add-more").last().after(''+
				'<div class ="after-add-more" style="border-style: ridge;padding: 20px;background-color: #F8F8F8;">'+
				'<div class="form-group row">'+
				' <label class="col-md-3 form-control-label" for="amount">Amount withdrawn from the bank for the purpose of the project (INR)</label>'+
				' <div class="col-md-9">'+
				' <input type="text" id="amount" name="amount" class="form-control requiredValFld" placeholder="">'+
				' <span class="requiredValFldMsg"> Please enter amount.</span>'+
				'</div></div><div class="form-group row">'+
				' <label class="col-md-3 form-control-label" for="amtWithDrawnDate">Date</label>'+
				'<div class="col-md-9"><input type="date" id="amtWithDrawnDate" name="amtWithDrawnDate" class="form-control requiredValFld" placeholder="">'+
				'<span class="requiredValFldMsg"> Please enter date.</span>'+
				'</div></div>' +
				'<div class="form-group row">'+
				'<label class="col-md-3 form-control-label" for="certFromChartedAcc">Certificate from Chartered Account</label>'+
				'<div class="col-md-9"><input type="file" id="certFromChartedAcc" name="certFromChartedAcc" class="form-control requiredValFld">'+
				' <span class="requiredValFldMsg"> Please Attach file.</span>'+
				'</div>'+
				'</div>'+
				'<div class="form-group row">'+
				'<a class="btn btn-danger btn-sm pull-right remove"> Remove</a>'+
				'<br/></div></div>'
		);
	});
});







$(function() {

	$(document.body).on('click', '.btn-remove-civilwork', function() {
		$(this).closest('tr').remove();
	});


	$('.btn-add-civilwork').click(function() {
		var index = $('#sche-list >tbody >tr').length+1;
		$('#sche-list').append('' +
				'<tr><td>'+index+'</td>'+
				'<td><input type="text" name="typeOfWork" class="form-control requiredValFld">'+
				'<span class="requiredValFldMsg"> Please Enter type Of Work.</span>'+
				'</td>'+
				'<td> <input type="date" name="actualFrmDate" class="form-control requiredValFld">'+
				'<span class="requiredValFldMsg"> Please Enter Actual From Date</span>'+
				'</td>'+
				'<td> <input type="date" name="actualToDate" class="form-control requiredValFld">'+
				'<span class="requiredValFldMsg"> Please Enter Actual To Date</span>'+
				'</td>'+
				'<td><span class="input-group-btn">' +
				'<button class="btn btn-danger btn-remove-civilwork" type="button"><span class="fa fa-times"></span></button>' +
				'</span></td>'+
				'</tr>'
		);

	});
});


$('#projectRegDetls').change(function(){
	// var selectedText = $("#projectRegDetls").find("option:selected").text();
	var projectId = $("#projectRegDetls").val();
	window.location.href=$("#base_url").val()+'/project/projectScheduleDetls?PROJECT_ID='+projectId;
});	


$('#landSectionProjId').change(function(){
	// var selectedText = $("#projectRegDetls").find("option:selected").text();
	var projectId = $("#landSectionProjId").val();
	window.location.href=$("#base_url").val()+'/project/getLandCostDetails?PROJECT_ID='+projectId;
});	

$('#ConstrSectionProjId').change(function(){
	// var selectedText = $("#projectRegDetls").find("option:selected").text();
	var projectId = $("#ConstrSectionProjId").val();
	window.location.href=$("#base_url").val()+'/project/getConstructionCostDetails?PROJECT_ID='+projectId;
});	


$('#finalApprovalProjId').change(function(){
	// var selectedText = $("#projectRegDetls").find("option:selected").text();
	var projectId = $("#finalApprovalProjId").val();
	window.location.href=$("#base_url").val()+'/project/getFinalApprovalDetails?PROJECT_ID='+projectId;
});

$('#projectSummary').change(function(){
	// var selectedText = $("#projectRegDetls").find("option:selected").text();
	var projectId = $("#projectSummary").val();
	window.location.href=$("#base_url").val()+'/project/getprojectSummaryDetails?PROJECT_ID='+projectId;
});

$('#quarterSecProjId').change(function(){
	// var selectedText = $("#projectRegDetls").find("option:selected").text();
	var projectId = $("#quarterSecProjId").val();
	window.location.href=$("#base_url").val()+'/quarter/getHome?PROJECT_ID='+projectId;
});


/* $(function() {
	          $("#btn").click(function() {
	            var x = $("#txt1").val();
	            var y = $("#txt2").val();
	            var z = $("#txt3").val();
	            var M = $("#txt4").val();
	            var L = parseInt(y) + parseInt(z) - parseInt(M);

	            $("#tb").append("<tr> <td class='total-ignore'>" + x + "</td> <td>" + y + "</td> <td>" + z + "<td>" + M + "</td><td>" + L + "</td></tr>");
	            var totals = [];
	            $('#tb').find('tr').each(function() {
	              var $row = $(this);

	              $row.children('td').not('.total-ignore').each(function(index) {
	                totals[index] = totals[index] || 0;
	                totals[index] += parseInt($(this).text()) || 0;
	              });
	            })
	            $('#totals td').not('.total-ignore').each(function(index) {
	              $(this).text(totals[index]);
	            });
	          });
	          $("#tb").on("click", "tr", function() {

	            $(this).find("td").slice(0, 4).prop("contenteditable", true);

	          });

	        });

 */


$("#btn-construction").click(function() {
	var totals =0;
	var sum=0;
	$('#tb').find('.count').each(function() {
		totals += parseInt($(this).val()) || 0;
	})

	$('#tb').find('.sum').each(function() {
		sum += parseInt($(this).val()) || 0;
	})
	$('.totalEstConstructionval').val(totals);
	$('.totalActConstructionval').val(sum);
});




$("#btn-approval").click(function() {
	var sum=0;
	$('#tb').find('.totalSum').each(function() {
		sum += parseInt($(this).val()) || 0;
	})
	$('.totalSumOfApproval').val(sum);
});


$(".caluclateAmt").keyup(function() {
	var sum=0;
	var alloteeAmt = $("#alloteeAmt").val();
	var constructionAmt = $("#constructionAmt").val();
	var utilizedAmt = $("#utilizedAmt").val();
	var tot = parseInt(constructionAmt)  + parseInt(utilizedAmt);
	sum = parseInt(alloteeAmt) - parseInt(tot) ;
	// alert("sum >>"+sum);
	//sum += parseInt($(this).val()) || 0;
	$('#totAmt').val(sum);
});


$(document).ready(function () {

	//iterate through each textboxes and add keyup
	//handler to trigger sum event

	$(this).keypress(function () {
		calculateSum();
	});

});

function calculateSum() {

	var sum = 0;
	//iterate through each textboxes and add the values
	$(".txt").each(function () {

		//add only if the value is number
		if (!isNaN(this.value) && this.value.length != 0) {
			sum += parseFloat(this.value);
		}

	});
	//.toFixed() method will roundoff the final sum to 2 decimal places
	$("#sum").html(sum.toFixed(2));
}


$(function() {

	$(document.body).on('click', '.btn-remove-civilwork', function() {
		$(this).closest('tr').remove();
	});
	$('.btn-add-apartment').click(function() {

		var index = $('#sche-list >tbody >tr').length;
		$('#sche-list').append('' +
				'<tr><td><select name="apartmentType" id="residential" class="" style="width: 180px !important; min-width: 180px; max-width: 180px; vertical-align: right;">'+
				' <option value="0">--Select--</option>'+
				'<option value="1BHK">1BHK</option>'+
				'<option value="2BHK">2BHK</option>'+
				'<option value="3BHK">3BHK</option>'+
				'<option value="4BHK">4BHK</option>'+
				'<option value="5BHK">5BHK</option>'+
				'<option value="office">Office</option>'+
				'<option value="shop">Shop</option>'+
				'<option value="other">other</option>'+
				' </select></td>'+
				'<td><input type="text" id="totNoOfUnits_'+index+'" name="totNoOfEachApartmentType" value="" /></td>'+
				'<td><input type="text"  name="carpetArea" value="" /></td>'+
				'<td><input type="text" name="builtUpArea" /></td>'+
				'<td><input type="text" name="proportionateCommonArea" /></td>'+
				'<td><span class="input-group-btn">' +
				'<button class="btn btn-danger btn-remove-civilwork" type="button"><span class="fa fa-times"></span></button>' +
				'</span></td>'+
				'</tr>'
		);

	});
});

//plots

$("#btn-totalinfo").click(function() {
	var sum=0;
	$('#total').find('.totalSumOfCost').each(function() {
		sum += parseInt($(this).val()) || 0;
	})
	$('.totalSumOfApproval').val(sum);
});

$('.btn-add-particulars').click(function() {

	$(document.body).on('click', '.btn-remove-projcommonremove', function() {
		$(this).closest('tr').remove();
	});

	var index = $('#particulars-list >tbody >tr').length;
	$('#particulars-list').append('' +
			'<tr><td>'+index+'</td>'+

			'<td><input type="text" name="stampsDutyAmt" class="form-control requiredValFld totalSum" placeholder="Enter More Approval Costs">'+

			'</td>'+
			'<td> <input type="text" name="stampsDutyAmt" class="form-control requiredValFld totalSum" placeholder="only digits are allowed">'+

			'</td>'+
			/*'<td>'+
	        	  	'</td>'+
	        	     '<td> '+
	        	     '</td>'+*/
			'<td><span class="input-group-btn">' +
			'<button class="btn btn-danger btn-remove-projcommonremove" type="button"><span class="fa fa-times"></span></button>' +
			'</span></td>'+
			'</tr>'
	);

});



$('.btn-add-projcommon').click(function() {

	$(document.body).on('click', '.btn-remove-projcommonremove', function() {
		$(this).closest('tr').remove();
	});

	var index = $('#common-list >tbody >tr').length+1;
	$('#common-list').append('' +
			'<tr><td>'+index+'</td>'+
			'<td><input type="text" name="commonArea" class="form-control requiredValFld" placeholder="Add more common areas">'+
			'<span class="requiredValFldMsg"> Please Enter type Of Work.</span>'+
			'</td>'+
			'<td><label class="radio-inline" for="inline-radio1"><input type="radio" name="isApplicable_3" value="Yes" class="requiredValFld">Yes '+
			'<span class="requiredValFldMsg"> Please select yes/No </span>'+
			'</label>&nbsp;'+
			'<label class="radio-inline" for="inline-radio2"><input type="radio" name="isApplicable_3" value="No" class="requiredValFld">No '+
			'<span	class="requiredValFldMsg"> Please select yes/No </span>'+
			'</label>'+
			'</td>'+
			'<td> <input type="text" name="perofCompletion"  class="form-control requiredValFld"/>'+
			'<span class="requiredValFldMsg"> Please Enter Percentage of Completion.</span>'+
			'</td>'+
			'<td> <input type="file" id="photoAttachment" name="photoAttachment" class="form-control requiredValFld">'+
			'<span class="requiredValFldMsg"> Please Select attachment for Photograph</span>'+
			'</td>'+
			/*'<td>'+
	        	  	'</td>'+
	        	     '<td> '+
	        	     '</td>'+*/
			'<td><span class="input-group-btn">' +
			'<button class="btn btn-danger btn-remove-projcommonremove" type="button"><span class="fa fa-times"></span></button>' +
			'</span></td>'+
			'</tr>'
	);

});

$('.btn-add-projnoc').click(function() {

	$(document.body).on('click', '.btn-remove-projcommonremove', function() {
		$(this).closest('tr').remove();
	});

	var index = $('#common-noc >tbody >tr').length+1;
	$('#common-noc').append('' +
			'<tr><td>'+index+'</td>'+
			'<td><input type="text" name="detailsOfApprovalsOrNoc" placeholder="Add more provisions">'+
			'<span class="requiredValFldMsg"> Please Enter type Of Work.</span>'+
			'</td>'+
			'<td><label class="radio-inline" for="inline-radio1"><input type="radio"   name="isApplicable_'+(index-1)+'" value="Yes">Yes'+

			'<span class="requiredValFldMsg"> Please select yes/No </span>'+
			'</label>&nbsp;'+
			'<label class="radio-inline" for="inline-radio2"> <input type="radio"  name="isApplicable_'+(index-1)+'" value="No">No'+
			'<span	class="requiredValFldMsg"> Please select yes/No </span>'+
			'</label>'+
			'</td>'+
			'<td> <select id="select" name="status" class="form-control input-sm" size="1">'+
			'<option value="0"> select</option>'+
			'<option value="Approved">Approved </option>'+
			'<option value="Applied">Applied</option>'+
			'<option value="To Be Applied">To Be Applied</option>'+
			'</select>'+
			'</td>'+
			'<td> <input type="date" name="dateOfApplication" class="requiredValFld">'+
			'<span class="requiredValFldMsg"> Please select Date Of Application </span>'+
			'</td>'+
			'<td> <input type="file" name="uploadDoc" class="requiredValFld">'+
			'<span class="requiredValFldMsg"> Please Upload Document </span>'+
			'</td>'+
			/*'<td>'+
	        	  	'</td>'+
	        	     '<td> '+
	        	     '</td>'+*/
			'<td><span class="input-group-btn">' +
			'<button class="btn btn-danger btn-remove-projcommonremove" type="button"><span class="fa fa-times"></span></button>' +
			'</span></td>'+
			'</tr>'
	);
});

function showSummaryCost(){
	document.getElementById('totalSummaryCostMatching').style.display = 'block';
}

function hideSummaryCost(){
	document.getElementById('totalSummaryCostMatching').style.display ='none';
}


$("#totalProjSummaryCost").click(function() {
	var sum=0;
	var total=0;
	var landcost = $("#estLandCost").val();
	var constructioncost = $("#estConstructionCost").val();
	var approvalcost = $("#estCostOfApprove").val();
	var sum = parseInt(landcost)  + parseInt(constructioncost) + parseInt(approvalcost);
	var actlandcost = $("#actLandCost").val();
	var actconstructioncost = $("#actConstructionCost").val();
	var actapprovalcost = $("#actCostOfApprove").val();
	var total = parseInt(actlandcost)  + parseInt(actconstructioncost) + parseInt(actapprovalcost);
	$('#estTotalCost').val(sum);
	if(isNaN(total)){
		alert("Please enter the Actual Cost in (INR) and Calculate Total");
	}else{
		$('#actTotalCost').val(total);
	}
	if(sum<total){
		showSummaryCost();
	}else{
		hideSummaryCost();
	}
});


$("#btn-totalinfo").click(function() {
	var sum=0;
	$('#total').find('.totalSumOfCost').each(function() {
		sum += parseInt($(this).val()) || 0;
	})
	$('.totalSumOfApproval').val(sum);
});



$('.btn-add-plotSc').click(function() {

	$(document.body).on('click', '.btn-remove-projcommonremove', function() {
		$(this).closest('tr').remove();
	});

	var index = $('#plotsche-list >tbody >tr').length+1;
	$('#plotsche-list').append('' +
			'<tr><td>'+index+'</td>'+
			'<td><input type="text" name="typeOfWork" class="form-control requiredValFld" placeholder="Add more project works">'+
			'<span class="requiredValFldMsg"> Please Enter type Of Work.</span>'+
			'</td>'+
			'<td><label class="radio-inline" for="inline-radio1"><input checked type="radio" name="isApplicable_'+(index-1)+'" value="Yes" class="requiredValFld">Yes '+
			'<span class="requiredValFldMsg"> Please select yes/No </span>'+
			'</label>&nbsp;'+
			
			'</td>'+
			'<td> <input type="date" name="estimatedFrmDate" id="estimatedFrmDate_'+(index-1)+'" class="form-control requiredValFld" >'+

			'</td>'+
			'<td> <input type="date" name="estimatedToDate" id="estimatedToDate_'+(index-1)+'" class="form-control requiredValFld">'+

			'</td>'+
			/*'<td>'+
	        			        	  	'</td>'+
	        			        	     '<td> '+
	        			        	     '</td>'+*/
			'<td><span class="input-group-btn">' +
			'<button class="btn btn-danger btn-remove-projcommonremove" type="button"><span class="fa fa-times"></span></button>' +
			'</span></td>'+
			'</tr>'
	);

});

$('.btn-add-plotcommon').click(function() {

	$(document.body).on('click', '.btn-remove-projcommonremove', function() {
		$(this).closest('tr').remove();
	});

	var index = $('#plot-common-list >tbody >tr').length+1;
	$('#plot-common-list').append('' +
			'<tr><td>'+index+'</td>'+
			'<td><input type="text" name="commonArea" class="form-control requiredValFld" placeholder="Add more common areas">'+
			'<span class="requiredValFldMsg"> Please Enter type Of Work.</span>'+
			'</td>'+
			'<td><label class="radio-inline" for="inline-radio1"><input type="radio" name="isApplicable_'+(index-1)+'" value="Yes" class="requiredValFld">Yes '+
			'<span class="requiredValFldMsg"> Please select yes/No </span>'+
			'</label>&nbsp;'+
			'<label class="radio-inline" for="inline-radio2"><input type="radio" name="isApplicable_'+(index-1)+'" value="No" class="requiredValFld">No '+
			'<span	class="requiredValFldMsg"> Please select yes/No </span>'+
			'</label>'+
			'</td>'+

			/*'<td>'+
	        			        	  	'</td>'+
	        			        	     '<td> '+
	        			        	     '</td>'+*/
			'<td><span class="input-group-btn">' +
			'<button class="btn btn-danger btn-remove-projcommonremove" type="button"><span class="fa fa-times"></span></button>' +
			'</span></td>'+
			'</tr>'
	);

});

$('.btn-add-plotnoc').click(function() {

	$(document.body).on('click', '.btn-remove-projcommonremove', function() {
		$(this).closest('tr').remove();
	});

	var index = $('#common-noc >tbody >tr').length+1;
	$('#common-noc').append('' +
			'<tr><td>'+index+'</td>'+
			'<td><input type="text" name="detailsOfApprovalsOrNoc" placeholder="Add more provisions">'+
			'<span class="requiredValFldMsg"> Please Enter type Of Work.</span>'+
			'</td>'+
			'<td><label class="radio-inline" for="inline-radio1"><input type="radio"   name="isApplicable_'+(index-1)+'" value="Yes">Yes'+

			'<span class="requiredValFldMsg"> Please select yes/No </span>'+
			'</label>&nbsp;'+
			'<label class="radio-inline" for="inline-radio2"> <input type="radio"  name="isApplicable_'+(index-1)+'" value="No">No'+
			'<span	class="requiredValFldMsg"> Please select yes/No </span>'+
			'</label>'+
			'</td>'+
			'<td> <select id="select" name="status" class="form-control input-sm" size="1">'+
			'<option value="0"> select</option>'+
			'<option value="Approved">Approved </option>'+
			'<option value="Applied">Applied</option>'+
			'<option value="To Be Applied">To Be Applied</option>'+
			'</select>'+
			'</td>'+
			'<td> <input type="date" name="dateOfApplication" class="requiredValFld">'+
			'<span class="requiredValFldMsg"> Please select Date Of Application </span>'+
			'</td>'+
			'<td> <input type="file" name="uploadDoc" class="requiredValFld">'+
			'<span class="requiredValFldMsg"> Please Upload Document </span>'+
			'</td>'+
			/*'<td>'+
	        			        	  	'</td>'+
	        			        	     '<td> '+
	        			        	     '</td>'+*/
			'<td><span class="input-group-btn">' +
			'<button class="btn btn-danger btn-remove-projcommonremove" type="button"><span class="fa fa-times"></span></button>' +
			'</span></td>'+
			'</tr>'
	);

});



//plots

$("#totalNumberOfPlotsBooked").keyup(function() {
	var sum=0;
	var ews = $("#totalnoOfEWSPlotsBooked").val();
	var lig = $("#totalnoOfLIGPlotsBooked").val();
	var mig = $("#totalnoOfMIGPlotsBooked").val();
	var hig = $("#totalnoOfHIGPlotsBooked").val();
	var other = $("#totalnoOfOtherPlotsBooked").val();
	sum = parseInt(ews)+parseInt(lig)+parseInt(mig)+parseInt(hig)+parseInt(other) ;
	$('#totalNumberOfPlotsBooked').val(sum);
});

$("#totalnoOfOtherPlotsBooked").keyup(function() {
	var available=0;
	var total = $("#totalnoOfOtherPlots").val();
	var booked = $("#totalnoOfOtherPlotsBooked").val();
	if(booked>total){
		alert("Please enter only for "+total+" plots");
		$("#totalnoOfOtherPlotsBooked").focus();
	}else{
	available = parseInt(total)-parseInt(booked);
	$('#totalnoOfOtherPlotsAvailable').val(available);
	}
});

$("#totalnoOfEWSPlotsBooked").keyup(function() {
	var available=0;
	var total = $("#totalnoOfEWSPlots").val();
	var booked = $("#totalnoOfEWSPlotsBooked").val();
	if(booked>total){
		alert("Please enter only for "+total+" EWS plots");
		$("#totalnoOfEWSPlotsBooked").focus();
	}else{
	available = parseInt(total)-parseInt(booked);
	$('#totalnoOfEWSPlotsAvailable').val(available);
	}
});

$("#totalnoOfMIGPlotsBooked").keyup(function() {
	var available=0;
	var total = $("#totalnoOfMIGPlots").val();
	var booked = $("#totalnoOfMIGPlotsBooked").val();
	if(booked>total){
		alert("Please enter only for "+total+" MIG plots");
		$("#totalnoOfMIGPlotsBooked").focus();
	}else{
	available = parseInt(total)-parseInt(booked);
	$('#totalnoOfMIGPlotsAvailable').val(available);
	}
});

$("#totalnoOfHIGPlotsBooked").keyup(function() {
	var available=0;
	var total = $("#totalnoOfHIGPlots").val();
	var booked = $("#totalnoOfHIGPlotsBooked").val();
	if(booked>total){
		alert("Please enter only for "+total+" HIG plots");
		$("#totalnoOfHIGPlotsBooked").focus();
	}else{
	available = parseInt(total)-parseInt(booked);
	$('#totalnoOfHIGPlotsAvailable').val(available);
	}
});

$("#totalnoOfLIGPlotsBooked").keyup(function() {
	var available=0;
	var total = $("#totalnoOfLIGPlots").val();
	var booked = $("#totalnoOfLIGPlotsBooked").val();
	if(booked>total){
		alert("Please enter only for "+total+" LIG plots");
		$("#totalnoOfLIGPlotsBooked").focus();
	}else{
	available = parseInt(total)-parseInt(booked);
	$('#totalnoOfLIGPlotsAvailable').val(available);
	}
});


$("#totalNumberOfPlotsBooked").keyup(function() {
	var sum=0;
	var ews = $("#totalnoOfEWSPlotsAvailable").val();
	var lig = $("#totalnoOfLIGPlotsAvailable").val();
	var mig = $("#totalnoOfMIGPlotsAvailable").val();
	var hig = $("#totalnoOfHIGPlotsAvailable").val();
	var other = $("#totalnoOfOtherPlotsAvailable").val();
	sum = parseInt(ews)+parseInt(lig)+parseInt(mig)+parseInt(hig)+parseInt(other) ;
	$('#totalNumberOfPlotsAvailable').val(sum);
});

/*$("#btn1").click(function() {
	        			var totals =0;
	        			$('#total').find('.totalSumOfCost').each(function() {
	        				totals += parseInt($(this).val()) || 0;
	        			})

	        			$('.totalEstConstructionval').val(totals);
	        		});*/





$("#btn-totalinfo").click(function() {
	var sum=0;
	$('#total').find('.totalSumOfCost').each(function() {
		sum += parseInt($(this).val()) || 0;
	})
	$('.totalSumOfApproval').val(sum);
});



$(function() {
	$(document.body).on('click', '.btn-remove-agentNo', function() {
		$(this).closest('.agent-input').remove();
	});
	$('.btn-add-agentNo').click(function() {
		$(".agentNo-list").last().after(''+
				'<div class="input-group agent-input">'+
				'<span class="input-group-btn"> </span> <input	type="text"	name="agentAppNo" class="form-control" />'+
				'<span class="input-group-btn"><button class="btn btn-danger btn-remove-agentNo" type="button"><span class="fa fa-times"></span></button></span><br/>' +
				'</div>'
		);
	});
});


$(function() {
	$(document.body).on('click', '.btn-remove-website', function() {
		$(this).closest('.website-input').remove();
	});
	$('.btn-add-website').click(function() {
		$(".website-list").last().after(''+
				'<div class="input-group website-input">'+
				'<span class="input-group-btn"> </span> <input	type="text"	name="webSiteUrl" class="form-control" />'+
				'<span class="input-group-btn"><button class="btn btn-danger btn-remove-website" type="button"><span class="fa fa-times"></span></button></span><br/>' +
				'</div>'
		);
	});
});


$(function() {
	$(document.body).on('click', '.btn-remove-brochure', function() {
		$(this).closest('.brochure-input').remove();
	});
	$('.btn-add-brochure').click(function() {
		$(".brochure-list").last().after(''+
				'<div class="input-group brochure-input">'+
				'<span class="input-group-btn"> </span> <input	type="file"	name="prospectusOrBrochureDoc" class="form-control" />'+
				'<span class="input-group-btn"><button class="btn btn-danger btn-remove-brochure" type="button"><span class="fa fa-times"></span></button></span><br/>' +
				'</div>'
		);
	});
});


$(function() {
	$(document.body).on('click', '.btn-remove-advertisement', function() {
		$(this).closest('.advertisement-input').remove();
	});
	$('.btn-add-advertisement').click(function() {
		$(".advertisement-list").last().after(''+
				'<br><div class="input-group advertisement-input">'+
				'<span class="input-group-btn"> </span> <input	type="file"	name="advertisementDoc" class="form-control" />'+
				'<span class="input-group-btn"><button class="btn btn-danger btn-remove-advertisement" type="button"><span class="fa fa-times"></span></button></span><br/>' +
				'</div>'
		);
	});
});

function showJdaDetails(){
	document.getElementById('jdaDetails').style.display = 'block';
}

function hideJdaDetails(){
	document.getElementById('jdaDetails').style.display ='none';
}



function selectappartment() {
	//alert("dsvvz");
	var type = $("#selectapartmentType").val();
	//alert(type);
	if(type=='other'){
		alert("Please enter the other type");
		$('#appartmentselected').val("");
	}else{
		$('#appartmentselected').val(type);
	}
}

function showCaseFile(){
	document.getElementById('showCaseFile').style.display = 'block';
}

function hideCaseFile(){
	document.getElementById('showCaseFile').style.display ='none';
}



function showTdrDetails(){
	document.getElementById('tdrDetails').style.display = 'block';
}

function hideTdrDetails(){
	document.getElementById('tdrDetails').style.display = 'none';
}

function showModificationDetails(){
	document.getElementById('modificationdetails').style.display = 'block';
}

function hideModificationDetails(){
	document.getElementById('modificationdetails').style.display = 'none';
}

function showMoreModificationDetails(){
	document.getElementById('moremodificationdetails').style.display = 'block';
}

function hideMoreModificationDetails(){
	document.getElementById('moremodificationdetails').style.display = 'none';
}

function showAssociationDetails(){
	document.getElementById('associationdetails').style.display = 'block';
}

function hideAssociationDetails(){
	document.getElementById('associationdetails').style.display = 'none';
}

function showWelfareDetails(){
	document.getElementById('welfaredetails').style.display = 'block';
}

function hideWelfareDetails(){
	document.getElementById('welfaredetails').style.display = 'none';
}

$('#btn-add-subStructure').click(function() {

	$(document.body).on('click', '.btn-remove-projcommonremove', function() {
		$(this).closest('tr').remove();
	});

	var index = $('#sche-subStructure-list >tbody >tr').length+1;
	$('#sche-subStructure-list').append('' +
			'<tr><td>'+index+'</td>'+
			'<td><input type="text" name="typeOfWork" class="form-control requiredValFld" placeholder="Add more project works">'+
			'<span class="requiredValFldMsg">Please Enter type Of Work.</span>'+
			'</td>'+
			'<td><label class="radio-inline" for="inline-radio1"><input type="radio" checked name="isApplicable_'+(index-1)+'" value="Yes" class="requiredValFld">Yes '+
			'<span class="requiredValFldMsg"> Please select yes/No </span>'+
			'</label>&nbsp;'+
			'</td>'+
			'<td> <input type="date" name="estimatedFrmDate" id="subestimatedFrmDate_'+(index-1)+'" class="form-control requiredValFld" ><span class="requiredValFldMsg">Please Enter Estimated From Date.</span>'+

			'</td>'+
			'<td> <input type="date" name="estimatedToDate" id="subestimatedToDate_'+(index-1)+'" class="form-control requiredValFld"><span class="requiredValFldMsg">Please Enter Estimated To Date.</span>'+

			'</td>'+
			/*'<td>'+
			        	  	'</td>'+
			        	     '<td> '+
			        	     '</td>'+*/
			'<td><span class="input-group-btn">' +
			'<button class="btn btn-danger btn-remove-projcommonremove" type="button"><span class="fa fa-times"></span></button>' +
			'</span></td>'+
			'</tr>'
	);

});


$('#btn-add-super-Structure').click(function() {

	$(document.body).on('click', '.btn-remove-projcommonremove', function() {
		$(this).closest('tr').remove();
	});

	var index = $('#sche-super-Structure-list >tbody >tr').length+1;
	$('#sche-super-Structure-list').append('' +
			'<tr><td>'+index+'</td>'+
			'<td><input type="text" name="typeOfWork" class="form-control requiredValFld" placeholder="Add more project works">'+
			'<span class="requiredValFldMsg"> Please Enter type Of Work.</span>'+
			'</td>'+
			'<td><label class="radio-inline" for="inline-radio1"><input type="radio" checked name="isApplicable_'+(index-1)+'" value="Yes" class="requiredValFld">Yes '+
			'<span class="requiredValFldMsg"> Please select yes/No </span>'+
			'</label>&nbsp;'+
			'</td>'+
			'<td> <input type="date" name="estimatedFrmDate" id="superestimatedFrmDate_'+(index-1)+'" class="form-control requiredValFld" ><span class="requiredValFldMsg">Please Enter Estimated From Date.</span>'+

			'</td>'+
			'<td> <input type="date" name="estimatedToDate" id="superestimatedToDate_'+(index-1)+'" class="form-control requiredValFld"><span class="requiredValFldMsg">Please Enter Estimated To Date.</span>'+

			'</td>'+
			/*'<td>'+
			        	  	'</td>'+
			        	     '<td> '+
			        	     '</td>'+*/
			'<td><span class="input-group-btn">' +
			'<button class="btn btn-danger btn-remove-projcommonremove" type="button"><span class="fa fa-times"></span></button>' +
			'</span></td>'+
			'</tr>'
	);

});


$('#btn-add-interior-work').click(function() {

	$(document.body).on('click', '.btn-remove-projcommonremove', function() {
		$(this).closest('tr').remove();
	});

	var index = $('#sche-interior-work-list >tbody >tr').length+1;
	$('#sche-interior-work-list').append('' +
			'<tr><td>'+index+'</td>'+
			'<td><input type="text" name="typeOfWork" class="form-control requiredValFld" placeholder="Add more project works">'+
			'<span class="requiredValFldMsg"> Please Enter type Of Work.</span>'+
			'</td>'+
			'<td><label class="radio-inline" for="inline-radio1"><input type="radio" checked name="isApplicable_'+(index-1)+'" value="Yes" class="requiredValFld">Yes '+
			'<span class="requiredValFldMsg"> Please select yes/No </span>'+
			'</label>&nbsp;'+
			'</td>'+
			'<td> <input type="date" name="estimatedFrmDate" id="estimatedFrmDate_'+(index-1)+'" class="form-control requiredValFld" ><span class="requiredValFldMsg">Please Enter Estimated From Date.</span>'+

			'</td>'+
			'<td> <input type="date" name="estimatedToDate" id="estimatedToDate_'+(index-1)+'" class="form-control requiredValFld"><span class="requiredValFldMsg">Please Enter Estimated To Date.</span>'+

			'</td>'+
			/*'<td>'+
	  	'</td>'+
	     '<td> '+
	     '</td>'+*/
			'<td><span class="input-group-btn">' +
			'<button class="btn btn-danger btn-remove-projcommonremove" type="button"><span class="fa fa-times"></span></button>' +
			'</span></td>'+
			'</tr>'
	);

});



$('#btn-add-masonry-Works').click(function() {

	$(document.body).on('click', '.btn-remove-projcommonremove', function() {
		$(this).closest('tr').remove();
	});

	var index = $('#sche-masonry-Works-list >tbody >tr').length+1;
	$('#sche-masonry-Works-list').append('' +
			'<tr><td>'+index+'</td>'+
			'<td><input type="text" name="typeOfWork" class="form-control requiredValFld" placeholder="Add more project works">'+
			'<span class="requiredValFldMsg"> Please Enter type Of Work.</span>'+
			'</td>'+
			'<td><label class="radio-inline" for="inline-radio1"><input type="radio" checked name="isApplicable_'+(index-1)+'" value="Yes" class="requiredValFld">Yes '+
			'<span class="requiredValFldMsg"> Please select yes/No </span>'+
			'</label>&nbsp;'+
			'</td>'+
			'<td> <input type="date" name="estimatedFrmDate" id="mansoryestimatedFrmDate_'+(index-1)+'"  class="form-control requiredValFld" ><span class="requiredValFldMsg">Please Enter Estimated From Date.</span>'+

			'</td>'+
			'<td> <input type="date" name="estimatedToDate" id="mansoryestimatedToDate_'+(index-1)+'" class="form-control requiredValFld"><span class="requiredValFldMsg">Please Enter Estimated To Date.</span>'+

			'</td>'+
			/*'<td>'+
	  	'</td>'+
	     '<td> '+
	     '</td>'+*/
			'<td><span class="input-group-btn">' +
			'<button class="btn btn-danger btn-remove-projcommonremove" type="button"><span class="fa fa-times"></span></button>' +
			'</span></td>'+
			'</tr>'
	);

});

$('#btn-add-Internal-Infra').click(function() {

	$(document.body).on('click', '.btn-remove-projcommonremove', function() {
		$(this).closest('tr').remove();
	});

	var index = $('#sche-Internal-Infra-list >tbody >tr').length+1;
	$('#sche-Internal-Infra-list').append('' +
			'<tr><td>'+index+'</td>'+
			'<td><input type="text" name="infrastructureName" class="form-control requiredValFld" placeholder="Add more project works">'+
			'<span class="requiredValFldMsg"> Please Enter type Of Work.</span>'+
			'</td>'+
			'<td><label class="radio-inline" for="inline-radio1"><input type="radio" name="isApplicable_'+(index-1)+'" checked value="Yes" class="requiredValFld">Yes '+
			'<span class="requiredValFldMsg"> Please select yes/No </span>'+
			'</label>&nbsp;'+
			'</td>'+

			/*'<td>'+
	  	'</td>'+
	     '<td> '+
	     '</td>'+*/
			'<td><span class="input-group-btn">' +
			'<button class="btn btn-danger btn-remove-projcommonremove" type="button"><span class="fa fa-times"></span></button>' +
			'</span></td>'+
			'</tr>'
	);

});

$('#btn-add-External-Infrastructure').click(function() {

	$(document.body).on('click', '.btn-remove-projcommonremove', function() {
		$(this).closest('tr').remove();
	});

	var index = $('#sche-External-Infrastructure-list >tbody >tr').length+1;
	$('#sche-External-Infrastructure-list').append('' +
			'<tr><td>'+index+'</td>'+
			'<td><input type="text" name="externalInfrastructureName" class="form-control requiredValFld" placeholder="Add more project works">'+
			'<span class="requiredValFldMsg"> Please Enter type Of Work.</span>'+
			'</td>'+
			'<td><label class="radio-inline" for="inline-radio1"><input type="radio" name="isApplicable_'+(index-1)+'" checked value="Yes" class="requiredValFld">Yes '+
			'<span class="requiredValFldMsg"> Please select yes/No </span>'+
			'</label>&nbsp;'+
			'</td>'+

			/*'<td>'+
	  	'</td>'+
	     '<td> '+
	     '</td>'+*/
			'<td><span class="input-group-btn">' +
			'<button class="btn btn-danger btn-remove-projcommonremove" type="button"><span class="fa fa-times"></span></button>' +
			'</span></td>'+
			'</tr>'
	);

});

$('#btn-add-aminity-details').click(function() {

	$(document.body).on('click', '.btn-remove-projcommonremove', function() {
		$(this).closest('tr').remove();
	});

	var index = $('#sche-aminity-details-list >tbody >tr').length+1;
	$('#sche-aminity-details-list').append('' +
			'<tr><td>'+index+'</td>'+
			'<td><input type="text" name="amenityName" class="form-control requiredValFld" placeholder="Add more project works">'+
			'<span class="requiredValFldMsg"> Please Enter type Of Work.</span>'+
			'</td>'+
			'<td><label class="radio-inline" for="inline-radio1"><input type="radio" name="isApplicable_'+(index-1)+'" checked value="Yes" class="requiredValFld">Yes '+
			'<span class="requiredValFldMsg"> Please select yes/No </span>'+
			'</label>&nbsp;'+
			'</td>'+

			/*'<td>'+
	  	'</td>'+
	     '<td> '+
	     '</td>'+*/
			'<td><span class="input-group-btn">' +
			'<button class="btn btn-danger btn-remove-projcommonremove" type="button"><span class="fa fa-times"></span></button>' +
			'</span></td>'+
			'</tr>'
	);

});

$('#btn-add-common-area').click(function() {

	$(document.body).on('click', '.btn-remove-projcommonremove', function() {
		$(this).closest('tr').remove();
	});

	var index = $('#sche-common-area-list >tbody >tr').length+1;
	$('#sche-common-area-list').append('' +
			'<tr><td>'+index+'</td>'+
			'<td><input type="text" name="commonAreaName" class="form-control requiredValFld" placeholder="Add more project works">'+
			'<span class="requiredValFldMsg"> Please Enter type Of Work.</span>'+
			'</td>'+
			'<td><label class="radio-inline" for="inline-radio1"><input type="radio" name="isApplicable_'+(index-1)+'" checked value="Yes" class="requiredValFld">Yes '+
			'<span class="requiredValFldMsg"> Please select yes/No </span>'+
			'</label>&nbsp;'+
			'</td>'+

			/*'<td>'+
	  	'</td>'+
	     '<td> '+
	     '</td>'+*/
			'<td><span class="input-group-btn">' +
			'<button class="btn btn-danger btn-remove-projcommonremove" type="button"><span class="fa fa-times"></span></button>' +
			'</span></td>'+
			'</tr>'
	);

});

function showLitigation(){
	document.getElementById('litigationdetails').style.display = 'block';
}

function hideLitigation(){
	document.getElementById('litigationdetails').style.display ='none';
}

$("#availableGarages").keyup(function() {
	var available=0;
	var total = $("#totalGarages").val();
	var booked = $("#bookedGarages").val();
	available = parseInt(total)-parseInt(booked);
	//alert(total+"-"+booked+"="+available);
	$('#availableGarages').val(available);
});

$("#availableParking").keyup(function() {
	var available=0;
	var total = $("#totalParking").val();
	var booked = $("#bookedParking").val();
	available = parseInt(total)-parseInt(booked);
	//alert(total+"-"+booked+"="+available);
	$('#availableParking').val(available);
});

$("#availableclosedParking").keyup(function() {
	var available=0;
	var total = $("#totalclosedParking").val();
	var booked = $("#bookedclosedParking").val();
	available = parseInt(total)-parseInt(booked);
	//alert(total+"-"+booked+"="+available);
	$('#availableclosedParking').val(available);
});

function showRegCost(){
	document.getElementById('totalCostMatching').style.display = 'block';
}

function hideRegCost(){
	document.getElementById('totalCostMatching').style.display ='none';
}

$("#btn-construction").click(function() {
	var totals =0;
	$('#tb').find('.count').each(function() {
		totals += parseInt($(this).val()) || 0;
	})
	$('.totalEstConstructionval').val(totals);
	var regtotal=$('#regTotalCost').val();
	if(regtotal<totals){
		showRegCost();
	}else{
		hideRegCost();
	}
});

$("#plotconstructioncost").click(function() {
	var totals =0;
	$('#total').find('.totalSumOfCost').each(function() {
		totals += parseInt($(this).val()) || 0;
	})
	$('.totalEstConstructionval').val(totals);
	var regtotal=$('#regTotalCost').val();
	if(regtotal<totals){
		showPlotRegCost();
	}else{
		hidePlotRegCost();
	}
});

function showPlotRegCost(){
	document.getElementById('totalCostMatching').style.display = 'block';
}

function hidePlotRegCost(){
	document.getElementById('totalCostMatching').style.display ='none';
}

function showPlotJdaDetails(){
	document.getElementById('jdaDetails').style.display = 'block';
}

function hidePlotJdaDetails(){
	document.getElementById('jdaDetails').style.display ='none';
}

function showPlotLitigation(){
	document.getElementById('litigationdetails').style.display = 'block';
}

function hidePlotLitigation(){
	document.getElementById('litigationdetails').style.display ='none';
}

function showPlotCaseFile(){
	document.getElementById('showCaseFile').style.display = 'block';
}

function hidePlotCaseFile(){
	document.getElementById('showCaseFile').style.display ='none';
}

function showPlotModificationDetails(){
	//showPlotMoreModificationDetails();
	document.getElementById('modificationdetails').style.display = 'block';
}

function hidePlotModificationDetails(){
	document.getElementById('modificationdetails').style.display = 'none';
}

function showPlotMoreModificationDetails(){
	//alert("shown");
	document.getElementById('plotmodification').style.display = 'block';
}

function hidePlotMoreModificationDetails(){
	//alert("hided");
	document.getElementById('plotmodification').style.display = 'none';
}

function showPlotAssociationDetails(){
	document.getElementById('associationdetails').style.display = 'block';
}

function hidePlotAssociationDetails(){
	document.getElementById('associationdetails').style.display = 'none';
}

function showPlotWelfareDetails(){
	document.getElementById('welfaredetails').style.display = 'block';
}

function hidePlotWelfareDetails(){
	document.getElementById('welfaredetails').style.display = 'none';
}

function showPlotSummaryCost(){
	document.getElementById('totalSummaryCostMatching').style.display = 'block';
}

function hidePlotSummaryCost(){
	document.getElementById('totalSummaryCostMatching').style.display ='none';
}

$("#totalPlotSummary").click(function() {
	var sum=0;
	var total=0;
	var landcost = $("#estLandCost").val();
	var constructioncost = $("#estConstructionCost").val();
	var approvalcost = $("#estCostOfApprove").val();
	var sum = parseInt(landcost)  + parseInt(constructioncost) + parseInt(approvalcost);
	var actlandcost = $("#actLandCost").val();
	var actconstructioncost = $("#actConstructionCost").val();
	var actapprovalcost = $("#actCostOfApprove").val();
	var total = parseInt(actlandcost)  + parseInt(actconstructioncost) + parseInt(actapprovalcost);
	$('#estTotalCost').val(sum);
	if(isNaN(total)){
		alert("Please enter the Actual Cost in (INR) and Calculate Total");
	}else{
		$('#actTotalCost').val(total);
	}
	if(sum<total){
		showPlotSummaryCost();
	}else{
		hidePlotSummaryCost();
	}
});

function hideShcedule(count){
	document.getElementById('estimatedFrmDate_'+count).style.display ='none';
	document.getElementById('estimatedToDate_'+count).style.display ='none';
}

function showShcedule(count){
	document.getElementById('estimatedFrmDate_'+count).style.display ='block';
	document.getElementById('estimatedToDate_'+count).style.display ='block';
	$('#estimatedFrmDate_'+count).addClass("requiredValFld");
	$('#estimatedToDate_'+count).addClass("requiredValFld");
}

function showEstDate(id){
	var count=id.getAttribute("schcount");
	showShcedule(count);
}

function hideEstDate(id){
	var count=id.getAttribute("schcount");
	hideShcedule(count);
}

function hideSubShcedule(count){
	document.getElementById('subestimatedFrmDate_'+count).style.display ='none';
	document.getElementById('subestimatedToDate_'+count).style.display ='none';
}

function showSubShcedule(count){
	document.getElementById('subestimatedFrmDate_'+count).style.display ='block';
	document.getElementById('subestimatedToDate_'+count).style.display ='block';
	$('#subestimatedFrmDate_'+count).addClass("requiredValFld");
	$('#subestimatedToDate_'+count).addClass("requiredValFld");
}

function showSubEstDate(id){
	var count=id.getAttribute("subcount");
	//alert(count);
	showSubShcedule(count);
}

function hideSubEstDate(id){
	var count=id.getAttribute("subcount");
	//alert(count);
	hideSubShcedule(count);
}

function hideSuperShcedule(count){
	document.getElementById('superestimatedFrmDate_'+count).style.display ='none';
	document.getElementById('superestimatedToDate_'+count).style.display ='none';
}

function showSuperShcedule(count){
	document.getElementById('superestimatedFrmDate_'+count).style.display ='block';
	document.getElementById('superestimatedToDate_'+count).style.display ='block';
	$('#superestimatedFrmDate_'+count).addClass("requiredValFld");
	$('#superestimatedToDate_'+count).addClass("requiredValFld");
}

function showSuperEstDate(id){
	var count=id.getAttribute("supcount");
	showSuperShcedule(count);
}

function hideSuperEstDate(id){
	var count=id.getAttribute("supcount");
	hideSuperShcedule(count);
}

function hideMansoryShcedule(count){
	document.getElementById('mansoryestimatedFrmDate_'+count).style.display ='none';
	document.getElementById('mansoryestimatedToDate_'+count).style.display ='none';
}

function showMansoryShcedule(count){
	document.getElementById('mansoryestimatedFrmDate_'+count).style.display ='block';
	document.getElementById('mansoryestimatedToDate_'+count).style.display ='block';
	$('#mansoryestimatedFrmDate_'+count).addClass("requiredValFld");
	$('#mansoryestimatedToDate_'+count).addClass("requiredValFld");
}

function showMansoryEstDate(id){
	var count=id.getAttribute("mansorycount");
	showMansoryShcedule(count);
}

function hideMansoryEstDate(id){
	var count=id.getAttribute("mansorycount");
	hideMansoryShcedule(count);
}



function hideNOC(count){
	document.getElementById('nocStatus_'+count).style.display ='none';
	document.getElementById('nocDate_'+count).style.display ='none';
	document.getElementById('nocDoc_'+count).style.display ='none';
}

function showNOC(count){
	//alert("Showed");
	document.getElementById('nocStatus_'+count).style.display ='block';
	document.getElementById('nocDate_'+count).style.display ='block';
	document.getElementById('nocDoc_'+count).style.display ='block';
	$('#nocStatus_'+count).addClass("requiredValFld");

}

function showStatusOfNoc(id){
	//alert(id.getAttribute("nocCount"));
	var count=id.getAttribute("nocCount");
	//alert("show");
	showNOC(count);
}

function hideStatusOfNoc(id){
	//alert(id.getAttribute("nocCount"));
	var count=id.getAttribute("nocCount");
	//alert("hide");
	hideNOC(count);
}

function hideNOCDateDoc(count){
	//alert("hided");
	document.getElementById('nocDate_'+count).style.display ='none';
	document.getElementById('nocDoc_'+count).style.display ='none';
}

function showNOCDateDoc(count){
	//alert("showed");
	document.getElementById('nocDate_'+count).style.display ='block';
	document.getElementById('nocDoc_'+count).style.display ='block';
	$('#nocDate_'+count).addClass("requiredValFld");
	$('#nocDoc_'+count).addClass("requiredValFld");
}

function hideNOCDoc(count){
	//alert("hided");
	document.getElementById('nocDoc_'+count).style.display ='none';
}

function requiredNOC(id){
	//alert(id.getAttribute("noccount"));
	var count=id.getAttribute("noccount");
	var x = document.getElementById('nocStatus_'+count).selectedIndex;
	var y = document.getElementById('nocStatus_'+count).options;
	//alert("Index: " + y[x].index + " is " + y[x].text);
	if(y[x].text=="To Be Applied"){
		//alert("hide");
		hideNOCDateDoc(count);
	}
	if(y[x].text=="Applied"){
		//alert("hide");
		showNOCDateDoc(count);
		hideNOCDoc(count);
	}
	if(y[x].text=="Approved"){
		//alert("show");
		showNOCDateDoc(count);
	}

}

function hideQuarterReport(){
	document.getElementById('annualReport').style.display ='block';
	document.getElementById('quarterReport').style.display ='none';
}

function showQuarterReport(){
	document.getElementById('annualReport').style.display ='none';
	document.getElementById('quarterReport').style.display ='block';
}


$("#totAdvanceAmt").keyup(function() {
	//alert("report");
	var a=$('#percentageOfProjectCompletion').val();
	if(a<0){
		alert("Percentage should be 0-100%");
	}else{
		if(a.length>3||a>100){
			alert("Percentage should be within 100%");
		}else{
			var perc=parseInt(a);
			//alert(perc);
			if(perc==100){
				hideQuarterReport();
			}else{
				showQuarterReport();
			}
		}
	}
});

$("#amtUtilized").keyup(function() {
	var sum=0;
	var per=0;
	var amtCollected = $("#amtCollected").val();
	var amtUtilized = $("#amtUtilized").val();
	per = (parseInt(amtUtilized)  / parseInt(amtCollected))*100;
	sum = parseInt(amtCollected) - parseInt(amtUtilized) ;
	$('#balanceAmt').val(sum);
	$('#AmtPer').val(per);
});

function showApproveCost(count){
	document.getElementById('approvalAmt_'+count).style.display ='block';
	$('#approvalAmt_'+count).addClass("requiredValFld");
	//alert("showed");
}

function hideApproveCost(count){
	document.getElementById('approvalAmt_'+count).style.display ='none';
	//alert("hide");
}

function showApprovalCost(id){
	var count=id.getAttribute("approvalCount");
	//alert(count);
	showApproveCost(count);
}

function hideApprovalCost(id){
	var count=id.getAttribute("approvalCount");
	//alert(count);
	hideApproveCost(count);
}

$('#btn-add-approvalAddMore').click(function() {

	$(document.body).on('click', '.btn-remove-projcommonremove', function() {
		$(this).closest('tr').remove();
	});

	var index = $('#approval-list >tbody >tr').length;
	$('#approval-list').append('' +
			'<tr><td>'+index+'</td>'+
			'<td><input type="text" name="approvalParticular" class="form-control requiredValFld" placeholder="Please Enter Construction Cost Particular Name">'+
			'<span class="requiredValFldMsg"> Please Enter approval particular name.</span>'+
			'</td>'+
			'<td><label class="radio-inline" for="inline-radio1"><input type="radio" name="isApplicable_'+(index-1)+'" checked value="Yes" class="requiredValFld">Yes '+
			'<span class="requiredValFldMsg"> Please select yes/No </span>'+
			'</label>&nbsp;'+
			'</td>'+
			'<td> <input type="number" name="approvalAmt" class="form-control totalSum" >'+

			'</td>'+
			'<td><span class="input-group-btn">' +
			'<button class="btn btn-danger btn-remove-projcommonremove" type="button"><span class="fa fa-times"></span></button>' +
			'</span></td>'+
			'</tr>'
	);

});

function showConCost(count){
	document.getElementById('estConsCost_'+count).style.display ='block';
	$('#estConsCost_'+count).addClass("requiredValFld");
}

function hideConCost(count){
	document.getElementById('estConsCost_'+count).style.display ='none';
}

function showConstructionCost(id){
	var count=id.getAttribute("conCount");
	//alert(count);
	showConCost(count);
}

function hideConstructionCost(id){
	var count=id.getAttribute("conCount");
	//alert(count);
	hideConCost(count);
}

$('#btn-add-consCost').click(function() {

	$(document.body).on('click', '.btn-remove-projcommonremove', function() {
		$(this).closest('tr').remove();
	});

	var index = $('#consCost-list >tbody >tr').length;
	$('#consCost-list').append('' +
			'<tr><td>'+index+'</td>'+
			'<td><input type="text" name="consCostParticular" class="form-control requiredValFld" placeholder="Please Enter Construction Cost Particular Name">'+
			'<span class="requiredValFldMsg"> Please Enter type Of Work.</span>'+
			'</td>'+
			'<td><label class="radio-inline" for="inline-radio1"><input type="radio" name="isApplicable_'+(index-1)+'" checked value="Yes" class="requiredValFld">Yes '+
			'<span class="requiredValFldMsg"> Please select yes/No </span>'+
			'</label>&nbsp;'+
			'</td>'+
			'<td> <input type="number" name="estConsCost" class="form-control count" >'+

			'</td>'+
			'<td><span class="input-group-btn">' +
			'<button class="btn btn-danger btn-remove-projcommonremove" type="button"><span class="fa fa-times"></span></button>' +
			'</span></td>'+
			'</tr>'
	);

});

function showApprovalDate(){
	document.getElementById('approvalDate').style.display ='block';
	document.getElementById('approvalDoc').style.display ='block';
}

function hideApprovalDate(){
	document.getElementById('approvalDate').style.display ='none';
	document.getElementById('approvalDoc').style.display ='none';
}

$('#btn-add-finalApproval').click(function() {

	$(document.body).on('click', '.btn-remove-projcommonremove', function() {
		$(this).closest('tr').remove();
	});

	var index = $('#approvalTable >tbody >tr').length+1;
	$('#approvalTable').append('' +
			'<tr><td>'+index+'</td>'+
			'<td><input type="text" id="text-input" name="nameOfCerificate" placeholder="Please enter Final approval name" class="form-control requiredValFld">'+
			'</td>'+
			'<td>Date <input type="date" name="approvedDate" class="requiredValFld">'+
			'</td>'+
			'<td> <input type="file" name="uploadDoc" class="requiredValFld">'+

			'</td>'+
			'<td><span class="input-group-btn">' +
			'<button class="btn btn-danger btn-remove-projcommonremove" type="button"><span class="fa fa-times"></span></button>' +
			'</span></td>'+
			'</tr>'
	);

});

$('.btn-add-Litigation').click(function() {
	
	$(document.body).on('click', '.remove', function() {
		$(this).closest('.after-add-more-litigation').remove();
	});
	
	var count = $('#count_add_more').val();
	var index=parseInt(count)+1;
	//alert(index);
	$('#count_add_more').val(index);
	
	$(".add-more-litigation").last().after(''+
			'<div class ="after-add-more-litigation" style="border-style: ridge;padding: 20px;background-color: #F8F8F8;">'+
			'<input type="hidden" name="anyLitigationOnProject_'+index+'" value="Yes">'+
		'<div class="form-group row">'+
			'<label class="col-md-3 form-control-label">Type of Case </label>'+
			'<div class="col-md-9">'+
				'<select id="select" name="caseType"'+
					'class="form-control input-sm" size="1"'+
					'style="width: 200px;">'+
					'<option value="0"> --select--</option>'+
					'<option value="Commercial">Commercial </option>'+
					'<option value="Civil">Civil</option>'+
					'<option value="Others">Others</option>'+
				'</select>'+
			'</div>'+
		'</div>'+
		
		'<div class="form-group row">'+
			'<label class="col-md-3 form-control-label" for="text-input">Name of the Court /Tribunal/ Authority </label>'+
			'<div class="col-md-9">'+
				'<input type="text" id="text-input" name="courtOrAuthorityName" class="form-control requiredValFld" placeholder="AuthorityName"> '+
				'<span class="requiredValFldMsg"> Please Enter Court Or AuthorityName </span>'+
			'</div></div>'+
		'<div class="form-group row">'+
			'<label class="col-md-3 form-control-label" for="text-input">Case No. </label>'+
			'<div class="col-md-9">'+
				'<input type="text" id="text-input" name="caseNo" class="form-control requiredValFld" placeholder="only digits 0-9 allowed"> '+
				'<span class="requiredValFldMsg"> Please Enter Case No. </span>'+
			'</div> </div>'+
		'<div class="form-group row">'+
			'<label class="col-md-3 form-control-label" for="text-input">Year </label>'+
			'<div class="col-md-9">'+
				'<input type="text" id="text-input" name="litigationYear" class="form-control requiredValFld" placeholder="eg:2018">'+
				
			'</div> </div>'+
		'<div class="form-group row">'+
			'<label class="col-md-3 form-control-label">Whether any Preventive Order issued? (Injunction / Interim Order / Final Order / Stay Order) </label>'+
			'<div class="col-md-9">'+
				'<label class="radio-inline" for="inline-radio1">'+
					'<input type="radio" id="isCaseApplicable_'+index+'" name="anyPreventiveOrderIssued_'+index+'" value="Yes" caseCount="'+index+'" class="requiredValFld" onclick="showCaseFile(this);">Yes'+
				'</label> <label class="radio-inline" for="inline-radio2">'+
					'<input type="radio" id="isCaseApplicable_'+index+'" name="anyPreventiveOrderIssued_'+index+'" value="No" caseCount="'+index+'" onclick="hideCaseFile(this);">No </label>'+

			'</div> </div>'+
		'<div id="showCaseFile_'+index+'" style="display: none;">'+
		'<div class="form-group row">'+
			'<label class="col-md-3 form-control-label" for="file-input">Preventive Order (Injunction / Interim Order / Final Order / Stay Order </label>'+
			'<div class="col-md-3">'+
				'<input type="file" id="file-input" name="preventiveOrderDoc" class="requiredValFld">'+
				'<span class="requiredValFldMsg"> Please select Preventive Order </span>'+
			'</div> <label class="col-md-3 form-control-label">Present Status</label>'+
			'<div class="col-md-3">'+
				'<select id="select" name="litigationStatus" class="form-control input-sm" size="1"'+
					'style="width: 200px;">'+
					'<option value="0">--select--</option>'+
					'<option value="Pending">Pending </option>'+
					'<option value="Disposed">Disposed</option>'+
				'</select> </div> </div>'+
		'<div class="form-group row" >'+
			'<label class="col-md-3 form-control-label">Any Future Orders in this regard</label>'+
			'<div class="col-md-3">'+
				'<input type="file" id="file-input" name="furtherOrderDoc" class="requiredValFld">'+
				'<span class="requiredValFldMsg"> Please select Preventive Order </span>'+
			'</div>  </div>'+
				'<div class="form-group row">'+
				'<a class="btn btn-danger btn-sm pull-right remove"> Remove</a>'+
				'<br/></div></div>'
	);
});

function showCase(count){
	document.getElementById('showCaseFile_'+count).style.display = 'block';
}

function hideCase(count){
	document.getElementById('showCaseFile_'+count).style.display ='none';
}

function showCaseFile(id){
	var count=id.getAttribute("caseCount");
	//alert(count);
	showCase(count);
}

function hideCaseFile(id){
	var count=id.getAttribute("caseCount");
	//alert(count);
	hideCase(count);
}

function showLandOwner(count){
	//alert("shown");
	document.getElementById('landownerdetails_'+count).style.display = 'none';
	document.getElementById('landownerRegNo_'+count).style.display = 'block';
	
}

function hideLandOwner(count){
	//alert("hided");
	document.getElementById('landownerdetails_'+count).style.display ='block';
	document.getElementById('landownerRegNo_'+count).style.display = 'none';
}

function showLandOwnerDetails(id){
	var count=id.getAttribute("landCount");
	//alert(count);
	showLandOwner(count);
}

function hideLandOwnerDetails(id){
	var count=id.getAttribute("landCount");
	//alert(count);
	hideLandOwner(count);
}

function showLandRegisterOwner(count){
	//alert("shown");
	document.getElementById('landownerRegister_'+count).style.display = 'block';
	//document.getElementById('landownerRegNo_'+count).style.display = 'block';
}

function hideLandRegisterOwner(count){
	//alert("hided");
	document.getElementById('landownerRegister_'+count).style.display = 'none';
	document.getElementById('landownerRegNo_'+count).style.display = 'none';
	document.getElementById('landownerdetails_'+count).style.display = 'none';
}

function showLandOwnerRegisterDetails(id){
	var count=id.getAttribute("registerCount");
	//alert(count);
	showLandRegisterOwner(count);
}

function hideLandOwnerRegisterDetails(id){
	var count=id.getAttribute("registerCount");
	//alert(count);
	hideLandRegisterOwner(count);
}

function calcualteAvblApartments(id){
	var count=id.getAttribute("bookedCount");
	//alert(count);
$('#bookedApartments_'+count).keyup(function() {
	var available=0;
	var total = $('#totalApartments_'+count).val();
	var booked = $('#bookedApartments_'+count).val();
	if(booked>total){
		alert("Please enter less than or equal to "+total+" apartments");
		$('#totalApartments_'+count).focus();
	}else{
	available = parseInt(total)-parseInt(booked);
	$('#availableApartments_'+count).val(available);
	}
	
});
}

