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

});