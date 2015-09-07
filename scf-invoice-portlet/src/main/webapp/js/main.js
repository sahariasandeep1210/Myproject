$(document).ready(function() {
	var invoices = [];  
	
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
	

	
	$("#createTrade").click(function() {	
		var url = $(this).attr('data-url');
		
		$("#invoicelist input:checkbox:checked").each(function() {	    
		    invoices.push($(this).val());
		});		
		$("#invoices").val(invoices.toString());
		
		document.forms["invoicelist"].action = url;
		document.forms["invoicelist"].submit();
	});
	

});