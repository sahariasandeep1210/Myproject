$(document).ready(function(){

	
	$("#closingDate,#openingDate,#investorPaymentDate,#SellerPaymentDate").datepicker({
		changeMonth : true,
		changeYear : true,
		showOn : "button",
		buttonImage : "/tf-theme/images/calendar.jpg",
		buttonImageOnly : true,
		buttonText : "Select date"
	});
	
	$("#insureCheck").change(function() {
		console.log("Inside");
		$("#insuranceDocDiv").toggle();
	});
		



});