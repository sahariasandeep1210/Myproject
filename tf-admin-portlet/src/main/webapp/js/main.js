var errormessage="Some required information is missing or incomplete. Please correct your entries and try again.";

$(function() {
	
	//enableDisableoptions();
	
	$("#addSeller").click(function() {
		var updateURL = $("#saveURL").val();
		document.forms["sellerList"].action = updateURL;
		document.forms["sellerList"].submit();
	});
	
	 $("#pageSize").val($("#currPageSize").val());
	$("#errorMsg").hide(); 
	
	$("#telNo").inputmask("999-999-9999");
	$("#userTelNo").inputmask("999-999-9999");
	
	$("#pageSize").change(function (){
		var noOfRecords=parseInt($("#noOfRecords").val());
		var pageSize=parseInt($("#currPageSize").val());
		var newPageSize=parseInt($(this).val());
		$("#currentPage").val(1);
		if(noOfRecords<pageSize && newPageSize>pageSize){
			return;
		}else{
			var actionUrl=$("#defaultURL").val();
			document.forms["companyList"].action = actionUrl;
			document.forms["companyList"].submit();	
		}
		
		
		
	});
	
	$("#exportCompanies").click(function(){
		/* window.open('data:application/vnd.ms-excel,' + $('#dvData').html());
		 e.preventDefault();*/	
		
		$('#companyListTable').tableExport({
			type : 'excel',
			escape : 'false',
			fileName: 'companieslist',
			worksheetName: 'Company List'
		});
		
	});
	
	$("#findCompany").click(function(){
		
		var companyNumber=$("#companyNumber").val();		
		$("#companyNumber").removeClass("error_show");
		if(companyNumber!=''){
			
			$.ajax({ 
				url: $("#fetchURL").val(), 
				type: 'POST', 
				datatype:'json', 
				cache: false,
				data: { 
						companyNo: companyNumber 					
					  }, 
				success: function(data){
							//var companObject= JSON.parse(data);
					
							$("#companyNumber").removeClass("error_show");
							//$("#companyDetails").show(); 
							var companyObject=jQuery.parseJSON(data);
							console.log("::companyObject::"+companyObject);
							//var obj = jQuery.parseJSON( '{ "name": "John" }' );
							$("#companyName").val(companyObject.company_name);			
							$("#registrationNo").val(companyObject.company_number);// clear 
							$("#jurisdiction").val(companyObject.jurisdiction); 
							var creatDate=new Date(companyObject.date_of_creation);
							$("#dateestablished").val(dateFormatter(creatDate));
							$("#orgType").val(companyObject.type);
							
							//adding Address information
							$("#address1").val(companyObject.registered_office_address.address_line_1);
							$("#address2").val(companyObject.registered_office_address.address_line_2);
							$("#locality").val(companyObject.registered_office_address.locality);
							$("#region").val(companyObject.registered_office_address.region);
							$("#country").val(companyObject.registered_office_address.country);
							$("#postalCode").val(companyObject.registered_office_address.postal_code);
							
							
							//$.each(content, function(i, state) { $('#state').append($('<option>').text(state.name).attr('value', state.stateId)); }); 
						 } ,
				error: function(jqXHR, textStatus, errorThrown) {
					ajaxindicatorstop();
					$(':input').not(':button, :submit, :reset, :hidden, input[id=companyNumber]').val('').removeAttr('checked').removeAttr('selected');
					//$("#companyDetails").show(); 
					$('#myModal').modal('show');
				}
				});	
			
		}else{
			$("#companyNumber").addClass("error_show");
		}
		
	
	});
	
	$("#fetchOfficers").click(function(){
		
		var companyNumber=$("#registrationNo").val();
		var companyId=$("#compId").val();
		if(companyNumber!=''){
			
			$.ajax({ 
				url: $(this).attr('data-url'), 
				type: 'POST', 
				datatype:'json', 
				cache: false,
				data: { 
						companyNo: companyNumber,
						companyId: companyId
					  }, 
				success: function(data){				
							$("#officersDiv").html(data);
							
						 } ,
				error: function(jqXHR, textStatus, errorThrown) {
					ajaxindicatorstop();
				}
				});	
			
		}else{
			$("#companyNumber").addClass("error_show");
		}
		
	
	});
	
	$("#officer").change(function(){
		
		var officerVal=$(this).val();
		if(officerVal==''){			
			$(':input').not(':button, :submit, :reset, :hidden, input[id=officer]').val('').removeAttr('checked').removeAttr('selected');
			$(':input').not(':button, :submit, :reset, :hidden, input[id=officer]').prop("readonly", false);
		}else{
			$.ajax({ 
				url: $(this).attr('data-url'), 
				type: 'POST', 
				datatype:'json', 
				cache: false,
				data: { 
						officerId: officerVal
					  }, 
				success: function(data){				
							var officerObject= jQuery.parseJSON(data);
							
							$("#firstname").val(officerObject.firstName).prop("readonly", true);
							$("#lastname").val(officerObject.lastName).prop("readonly", true);
							if(officerObject.middleName!='' && officerObject.middleName!=null){								
								$("#middleName").val(officerObject.middleName).prop("readonly", true);
							}
							if(officerObject.occupation!='' && officerObject.occupation!=null){
								$("#occupation").val(officerObject.occupation).prop("readonly", true);
							}
							if(officerObject.role!='' && officerObject.role!=null){
								$("#companyDirector").val(officerObject.role).prop("readonly", true);
							}						
							
						 } ,
				error: function(jqXHR, textStatus, errorThrown) {
					ajaxindicatorstop();
				}
				});	
		}
		
		
	});
	
	
	
	
	
	
	
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
	
	$("#cmpback,#homePage").click(function(){
		var url = $(this).attr('data-url');
		submitTradeForms(url);
	});
	
	//registration first step
	$("#continue").click(function(){
		var error_free = true;
		error_free = validateCompanyInfo(error_free);
		if (error_free) {
			var url = $(this).attr('data-url');
			submitTradeForms(url);
		}
		
	});
	
	
	//Company Add
	$("#cmpAdd,#cmpUpdate").click(function(){
		$("#companyNumber").removeClass("error_show");
		var error_free = true;
		error_free = validateCompanyInfo(error_free);
		if (error_free) {
			var url = $(this).attr('data-url');
			submitTradeForms(url);
		}
		
	});
	
	
	//registration final Step
	$("#registerSeller").click(function(){
		var error_free = true;
		error_free = validateUserInfo(error_free);
		console.log("error_free:::"+error_free)
		if (error_free) {
			var url = $(this).attr('data-url');
			submitTradeForms(url);
		}
		
	});
	
	$("#userAdd,#userUpdate").click(function(){
		var error_free = true;
		error_free = validateUserInfo(error_free);
		
	
		if (error_free) {	
			var url = $(this).attr('data-url');
			submitUserForms(url);
		}
	});
	
	$("#cmpbackBtn").click(function(){
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
	elements[3] = "address1";
	elements[4] = "region";
	elements[5] = "country";
	elements[6] = "postalCode";
	elements[7] = "telNo";
	elements[8] = "companyType";
	
	$("#errorMsg").hide();
	$("#errorMsg").html();
	for (i = 0; i < elements.length; i++) {
		var element = $("#" + elements[i]);
		if(element.length){
			var eleValue = element.val();
			if (eleValue == '' || eleValue == null || (element.is('select') && element[0].selectedIndex == 0)) {
				element.addClass("error_show");
				error_free = false;
				$("#errorMsg").show();
				$("#errorMsg").html(errormessage);
			} else {
				element.removeClass("error_show");
			}
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
	$("#errorMsg").html();
	
	for (i = 0; i < elements.length; i++) {
		var element = $("#" + elements[i]);
		var eleValue = element.val();
		if (eleValue == '' || eleValue == null || (element.is('select') && element[0].selectedIndex == 0)) {
			element.addClass("error_show");
			error_free = false;
			$("#errorMsg").show();
			$("#errorMsg").html(errormessage);
		} else {
			element.removeClass("error_show");
		}
	}
	return error_free;
	
}

function ajaxindicatorstart(text)
{
	if($('body').find('#resultLoading').attr('id') != 'resultLoading'){
	$('body').append('<div id="resultLoading" style="display:none"><div><img src="/tf-admin-portlet/images/ajax-loader.gif"><div>'+text+'</div></div><div class="bg"></div></div>');
	}
	
	$('#resultLoading').css({
		'width':'100%',
		'height':'100%',
		'position':'fixed',
		'z-index':'10000000',
		'top':'0',
		'left':'0',
		'right':'0',
		'bottom':'0',
		'margin':'auto'
	});	
	
	$('#resultLoading .bg').css({
		'background':'#000000',
		'opacity':'0.7',
		'width':'100%',
		'height':'100%',
		'position':'absolute',
		'top':'0'
	});
	
	$('#resultLoading>div:first').css({
		'width': '250px',
		'height':'75px',
		'text-align': 'center',
		'position': 'fixed',
		'top':'0',
		'left':'0',
		'right':'0',
		'bottom':'0',
		'margin':'auto',
		'font-size':'16px',
		'z-index':'10',
		'color':'#ffffff'
		
	});

    $('#resultLoading .bg').height('100%');
    $('#resultLoading').fadeIn(300);
    $('body').css('cursor', 'wait');
}

function ajaxindicatorstop()
{
    $('#resultLoading .bg').height('100%');
    $('#resultLoading').fadeOut(300);
    $('body').css('cursor', 'default');
}



function dateFormatter (dateObject) {
    var d = new Date(dateObject);
    var day = d.getDate();
    var month = d.getMonth() + 1;
    var year = d.getFullYear();
    if (day < 10) {
        day = "0" + day;
    }
    if (month < 10) {
        month = "0" + month;
    }
    var date = month+ "/" + day  + "/" + year;

    return date;
}

function enableDisableoptions(){
	if($("#compId").val()==''){
		$("#companyDetails").hide(); 
	}else{
		$("#fetchCmpInfo").hide(); 	
	}
	
	
}

function setPage(pageNumber){
	$("#currentPage").val(pageNumber);
	var actionUrl=$("#defaultURL").val();
	document.forms["companyList"].action = actionUrl;
	document.forms["companyList"].submit();	
}