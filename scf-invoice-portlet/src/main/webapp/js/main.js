$(document).ready(function() {

	
	$("#createTrade").hide();
	$("#updateInvoice").click(function() {
		$('#myModal').modal('show');
	});

	$(":checkbox").change(function() {		
		var chekedLen = $(":checkbox:checked").length;
		if (chekedLen > 0) {
			$("#createTrade").show();
		} else {
			$("#createTrade").hide();
		}

	});
	
	if ($('#confirmationModel').length > 0) {
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
				 $("#errormsg").text("All the invoice in a trade must be from same SCF company");
				 $("#errormsg").show();				 
			 } if(uniquesDates.length>1){
				 $("#errormsg").text("All the invoice in a trade must be having same closing date");
				 $("#errormsg").show();
			 }
		 }
		
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