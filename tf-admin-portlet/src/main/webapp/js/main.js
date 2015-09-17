$(function() {
	
	$("#errorMsg").hide();
	$("#telNo").inputmask("999-999-9999");
	$("#userTelNo").inputmask("999-999-9999");
	
	
	
	$("#deleteCompany").dialog({
		autoOpen : false,
		resizable : false,
		width : 415,
		height : 300,
		modal : true,
		buttons : {
			"Continue" : function () {
				var url = $("#deleteURL").val();
				submitTradeForms(url);
			},
			Cancel : function () {
				$(this).dialog("close");
			}
		}
	});
	
	$("#companyDiv").hide();
	$("#userDiv").hide();
	enableDisableTab();
	
	$("#deleteCompany").hide();
	 $('table').tablesorter();
	
	
	

 /* var $table = $('table').tablesorter({
    theme: 'blue',
    widgets: ["zebra", "filter"],
    widgetOptions : {
      // filter_anyMatch replaced! Instead use the filter_external option
      // Set to use a jQuery selector (or jQuery object) pointing to the
      // external filter (column specific or any match)
      filter_external : '.search',
      // add a default type search to the first name column
      filter_defaultFilter: { 1 : '~{query}' },
      // include column filters
      filter_columnFilters: true,
      filter_placeholder: { search : 'Search...' },
      filter_saveFilters : true,
      filter_reset: '.reset'    
    },
    headers: { 
  		10: 
  		{ 
  			sorter: false
			} 
		   }
  });

  // make demo search buttons work
  $('button[data-column]').on('click', function(){
    var $this = $(this),
      totalColumns = $table[0].config.columns,
      col = $this.data('column'), // zero-based index or "all"
      filter = [];

    // text to add to filter
    filter[ col === 'all' ? totalColumns : col ] = $this.text();
    $table.trigger('search', [ filter ]);
    return false;
  });*/

});

$(document).ready(function(){
	
	$("#cmpUpdate,#cmpAdd,#cmpback,#homePage").click(function(){
		var url = $(this).attr('data-url');
		submitTradeForms(url);
	});
	
	$("#continue").click(function(){
		var error_free = true;
		error_free = validateCompanyInfo(error_free);
		if (error_free) {
			var url = $(this).attr('data-url');
			submitTradeForms(url);
		}
		
	});
	
	$("#registerSeller").click(function(){
		var error_free = true;
		error_free = validateUserInfo(error_free);
		console.log("error_free:::"+error_free)
		if (error_free) {
			var url = $(this).attr('data-url');
			console.log("url:::"+url)
			submitTradeForms(url);
		}
		
	});
	
	$("#userAdd,#userUpdate").click(function(){
		var url = $(this).attr('data-url');
		submitUserForms(url);
	});
	
	$("#dateestablished").datepicker({
		changeMonth : true,
		changeYear : true,
		showOn : "button",
		maxDate : '0',
		buttonImage : "/tf-theme/images/calendar.jpg",
		buttonImageOnly : true,
		buttonText : "Select date"
	});
	
	 
});

function deleteCompany() {
	$("#deleteCompany").dialog("open");
}

function submitTradeForms(url) {
	document.forms["companyDetail"].action = url;
	document.forms["companyDetail"].submit();
}

function submitUserForms(url) {
	console.log("hello2");
	document.forms["userDetail"].action = url;
	document.forms["userDetail"].submit();
}

function enableDisableTab(){
	var currentTab=$("#currScreen").val();
	console.log("currentTab:::::"+currentTab);
	if(currentTab=='Company'){
		$("#companyDiv").show();
		$("#Company").addClass("active");
		$("#User").removeClass("active");
		
	}else{
		$("#userDiv").show();
		$("#User").addClass("active");
		$("#Company").removeClass("active");
	}
	
}


function validateCompanyInfo(error_free) {

	var elements = [];
	elements[0] = "companyName";
	elements[1] = "registrationNo";
	elements[2] = "dateestablished";
	elements[3] = "cmpAddress";
	elements[4] = "telNo";
	$("#errorMsg").hide();
	for (i = 0; i < elements.length; i++) {
		var element = $("#" + elements[i]);
		var eleValue = element.val();
		if (eleValue == '' || eleValue == null || (element.is('select') && element[0].selectedIndex == 0)) {
			element.addClass("error_show");
			error_free = false;
			$("#errorMsg").show();
		} else {
			element.removeClass("error_show");
		}
	}
	return error_free;
}

function validateUserInfo(error_free){
	var elements = [];
	elements[0] = "title";
	elements[1] = "username";
	elements[2] = "firstname";
	elements[3] = "lastname";
	elements[4] = "email";
	elements[5] = "userTelNo";
	
	$("#errorMsg").hide();
	
	for (i = 0; i < elements.length; i++) {
		var element = $("#" + elements[i]);
		var eleValue = element.val();
		if (eleValue == '' || eleValue == null || (element.is('select') && element[0].selectedIndex == 0)) {
			element.addClass("error_show");
			error_free = false;
			$("#errorMsg").show();
		} else {
			element.removeClass("error_show");
		}
	}
	return error_free;
	
}