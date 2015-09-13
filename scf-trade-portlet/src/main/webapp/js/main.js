$(document).ready(function(){

	
	$("#investorPaymentDate,#SellerPaymentDate").datepicker({
		changeMonth : true,
		changeYear : true,
		showOn : "button",
		buttonImage : "/tf-theme/images/calendar.jpg",
		buttonImageOnly : true,
		buttonText : "Select date"
	});
	
	$("#openingDate").datepicker({
		changeMonth : true,
		dateFormat: 'dd-mm-yy',
		changeYear : true,
		showOn : "button",
		buttonImage : "/tf-theme/images/calendar.jpg",
		buttonImageOnly : true,
		buttonText : "Select date",
		onClose: function( selectedDate ) {
			$( "#closingDate" ).datepicker( "option", "minDate", selectedDate );
		}
	});
	
	$("#closingDate").datepicker({
		changeMonth : true,
		dateFormat: 'dd-mm-yy',
		changeYear : true,
		showOn : "button",
		buttonImage : "/tf-theme/images/calendar.jpg",
		buttonImageOnly : true,
		buttonText : "Select date",
		onClose: function( selectedDate ) {
			$( "#openingDate" ).datepicker( "option", "maxDate", selectedDate );
			}
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