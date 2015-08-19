$(document).ready(function(){
	
	
	//$("#uploadTableDiv").hide();
	
/*	$("#updatePO").click(function(){
		var url = $(this).attr('data-url');
		submitPOForms(url);
	});*/
	
	$("#uploadSpan").click(function(){
		$("#uploadTableDiv").toggle();
	});
	
	$("#poDate,#shippingDate,#deliveryDate").datepicker({
		changeMonth : true,
		changeYear : true,
		showOn : "button",
		buttonImage : "/tf-theme/images/calendar.jpg",
		buttonImageOnly : true,
		buttonText : "Select date"
	});
	 
});

function submitPOForms(url) {
	document.forms["documentModel"].action = url;
	document.forms["documentModel"].submit();
}