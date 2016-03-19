$(document).ready(function() {
	
	var userType=$("#userType").val();
	enableTab();
	$("#createTrade").hide(); 
	$("#pageSize").val($("#currPageSize").val());
	$("#requestFinance").hide();
	$("#errorMsg").hide(); 
	$('table').tablesorter();	 
	$("#pageSize").change(function (){
			var noOfRecords=parseInt($("#noOfRecords").val());
			var pageSize=parseInt($("#currPageSize").val());
			var newPageSize=parseInt($(this).val());
			$("#currentPage").val(1);
			if(noOfRecords<pageSize && newPageSize>pageSize){
				return;
			}else{
				var actionUrl=$("#defaultURL").val();
				document.forms["invoicelist"].action = actionUrl;
				document.forms["invoicelist"].submit();	
			}
	 });  
	 
	 $("#invoiceUpdate").click(function (){
			var updateURL=$("#updateInvoiceURL").val();
			document.forms["createInvoiceForm"].action = updateURL;
			document.forms["createInvoiceForm"].submit();
	 });	 
	
	 $("#exportInvoices").click(function(){			
			$('#invoiceListTable').tableExport({
				type : 'excel',
				escape : 'false',
				fileName: 'invoiceList',
				worksheetName: 'InvoicesList'
			});			
	});

	$('ul.nav-pills li a').click(function (e) {
		  $('ul.nav-pills li.active').removeClass('active');
		  $(this).parent('li').addClass('active');
	});
	
	$("#updateInvoice").click(function() {
		$('#wrapperfirst').removeClass('hideclass');
		$('#myModal').modal('show');
	});

	$(":checkbox").change(function() {		
		var chekedLen = $(":checkbox:checked").length;
		if (chekedLen > 0) {
			if($("#createTrade").length){
				$("#createTrade").show();
			}else if($("#requestFinance").length){
				$("#requestFinance").show();
			}
			
		} else {
			$("#createTrade").hide();
			$("#requestFinance").hide();
			$("#errormsg").text("");
			$("#errormsg").hide();		
		}

	});
	
	if ($('#confirmationModel').length > 0) {
		$('#wrappersecond').removeClass('hideclass');
		$('#confirmationModel').modal('show');
	}
	
	$("#createTrade").click(function() {	
		var invoices = [];  
		var invoiceDate = []; 
		var scfCompany = []; 
		 $("#errormsg").hide();
		 $("#errormsg").text("");
		
		 $("#invoicelist input:checkbox:checked").each(function () {
			 invoiceDate.push($(this).attr("date-attr"));
			 scfCompany.push($(this).attr("scfcompany-attr"));		       
		    });
		 
		 var uniquesDates = invoiceDate.unique();
		 var uniquescmp = scfCompany.unique();
		 if(uniquesDates.length==1  && uniquescmp.length==1 ){
			 var url = $(this).attr('data-url');
			$("#invoicelist input:checkbox:checked").each(function() {
				invoices.push($(this).val());
			});
			$("#invoices").val(invoices.toString()); 
			$("#companyId").val(scfCompany.toString());
			document.forms["invoicelist"].action = url;
			document.forms["invoicelist"].submit();
			 
		 }else{
			 if(uniquescmp.length>1){
				 $("#errormsg").text("All the invoices in a trade must be from same Invoice company");
				 $("#errormsg").show();				 
			 } if(uniquesDates.length>1){
				 $("#errormsg").text("All the invoices in a trade must be having same closing date");
				 $("#errormsg").show();
			 }
		 }
		
	});
	
	$("#requestFinance").click(function() {
		var invoices = []; 
		 var url = $(this).attr('data-url');
		 $("#invoicelist input:checkbox:checked").each(function() {
				invoices.push($(this).val());
			});
		 $("#invoices").val(invoices.toString()); 
		 document.forms["invoicelist"].action = url;
		document.forms["invoicelist"].submit();
		
	}); 
	
	$("#createInvoice").click(function() {
		 var url = $(this).attr('data-url');
		 document.forms["invoicelist"].action = url;
		document.forms["invoicelist"].submit();
		
	}); 
	
	$("#invoiceback").click(function() {
		 var url = $(this).attr('data-url');
		 document.forms["createInvoiceForm"].action = url;
		document.forms["createInvoiceForm"].submit();
		
	});
	
	$("#invoiceDate, #paymentDate,#dueDate").datepicker({
		changeMonth : true,
		changeYear : true,
		showOn : "button",	
		buttonImage : "/tf-theme/images/calendar.jpg",
		buttonImageOnly : true,
		buttonText : "Select date"
	});
	
	//adding condition for Seller
	if(userType=='Seller Admin'){
		//removing datepicker image
		$(".ui-datepicker-trigger").remove();
		
		//disabling SCF company select box
		$('#scfCompany').attr('disabled', 'disabled');
	}

});

Array.prototype.contains = function(v) {
    for(var i = 0; i < this.length; i++) {
        if(this[i] === v) return true;
    }
    return false;
};

Array.prototype.unique = function() {
    var arr = [];
    for(var i = 0; i < this.length; i++) {
        if(!arr.contains(this[i])) {
            arr.push(this[i]);
        }
    }
    return arr; 
}

function enableTab(){
	var curentTab=$("#currentTab").val();
	if(curentTab=='invoiceslist'){
		$("#invoiceList").addClass("active");
	}else if(curentTab=='invoiceDocuments'){
		$("#invoicedocList").addClass("active");
	}else{
		$("#invoiceList").addClass("active");
	}
}

$("#invoiceAdd").click(function(){
	var error_free = true;
	error_free = validateInvoice(error_free);
	if (error_free) {
		var url =$("#addInvoiceURL").val();
		submitInvoiceForms(url);
	}
	
});
function submitInvoiceForms(url) {
	document.forms["createInvoiceForm"].action = url;
	document.forms["createInvoiceForm"].submit();
}

function validateInvoice(error_free) {
	var errormessage="Some required information is missing or incomplete. Please correct your entries and try again.";
	var elements = [];
	
	elements[0] = "invoiceNumber";
	elements[1] = "sellerRegNo";
	elements[2] = "invoiceAmount";
	elements[3] = "currency";
	elements[4] = "invoiceDate";
	elements[5] = "paymentDate";
	elements[6] ="scfCompany";
	
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

function setPage(pageNumber){
	$("#currentPage").val(pageNumber);
	var actionUrl=$("#defaultURL").val();
	document.forms["invoicelist"].action = actionUrl;
	document.forms["invoicelist"].submit();	
}


$("#fromDate").datepicker({
	changeMonth : true,
	changeYear : true,
	showOn : "button",
	
	buttonImage : "/tf-theme/images/calendar.jpg",
	buttonImageOnly : true,
	buttonText : "Select date",
    onSelect: function(selected) {
				$("#toDate").datepicker("option","minDate", selected)
				  
		   }
});

$("#toDate").datepicker({
	changeMonth : true,
	changeYear : true,
	showOn : "button",
	buttonImage : "/tf-theme/images/calendar.jpg",
	buttonImageOnly : true,
	buttonText : "Select date",
	onSelect: function(selected) {
				$("#fromDate").datepicker("option","maxDate", selected)
				  
		   }
});

$("#invoiceReport").click(function (){
	var updateURL=$("#getInvoiceReportURL").val();
	document.forms["invoicelist"].action = updateURL;
  document.forms["invoicelist"].submit();
});
