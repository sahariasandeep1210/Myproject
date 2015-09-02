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
		$("#insuranceDocDiv").toggle();
	});
		
	
	$("#tradeAdd,#tradeback").click(function(){
		var url = $(this).attr('data-url');
		submitTradeForms(url);
	});



});

function submitTradeForms(url) {
	document.forms["TradeDetail"].action = url;
	document.forms["TradeDetail"].submit();
}