$(document).ready(function() {

	enableTab();
	$("#createTrade").hide(); 
	$("#requestFinance").hide();
	
	$('ul.nav-pills li a').click(function (e) {
		  $('ul.nav-pills li.active').removeClass('active')
		  $(this).parent('li').addClass('active')
		})
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
