$(document).ready(function(){

	
	$("#SellerPaymentDate").datepicker({
		changeMonth : true,
		dateFormat: 'dd/mm/yy',
		changeYear : true,
		showOn : "button",
		buttonImage : "/tf-theme/images/calendar.jpg",
		buttonImageOnly : true,
		buttonText : "Select date",
			onClose: function( selectedDate ) {
				$( "#investorPaymentDate" ).datepicker( "option", "minDate", selectedDate );
			}
	});
	
	$("#investorPaymentDate").datepicker({
		changeMonth : true,
		dateFormat: 'dd/mm/yy',
		changeYear : true,
		showOn : "button",
		buttonImage : "/tf-theme/images/calendar.jpg",
		buttonImageOnly : true,
		buttonText : "Select date",
		onClose: function( selectedDate ) {
			$( "#SellerPaymentDate" ).datepicker( "option", "maxDate", selectedDate );
		}
	});
	
	$("#openingDate").datepicker({
		changeMonth : true,
		dateFormat: 'dd/mm/yy',
		changeYear : true,
		showOn : "button",
		buttonImage : "/tf-theme/images/calendar.jpg",
		buttonImageOnly : true,
		buttonText : "Select date",
		onClose: function( selectedDate ) {
			$( "#closingDate" ).datepicker( "option", "minDate", selectedDate );
			
			if($("#openingDate").val()!="" && $("#closingDate").val()!=""){
				var openingDate = new Date($("#openingDate").datepicker("getDate"));				
				var closingDate = new Date($("#closingDate").datepicker("getDate"));
				var diff = closingDate.getTime() - openingDate.getTime();
				var duration  = Math.ceil(diff / 1000 / 60 / 60 / 24);
				$("#duration").val(duration);
			}
			
			
		}
	});
	
	$("#closingDate").datepicker({
		changeMonth : true,
		dateFormat: 'dd/mm/yy',
		changeYear : true,
		showOn : "button",
		buttonImage : "/tf-theme/images/calendar.jpg",
		buttonImageOnly : true,
		buttonText : "Select date",
		onClose: function( selectedDate ) {
			$( "#openingDate" ).datepicker( "option", "maxDate", selectedDate );
			
			if($("#openingDate").val()!="" && $("#closingDate").val()!=""){
				var openingDate = new Date($("#openingDate").datepicker("getDate"));				
				var closingDate = new Date($("#closingDate").datepicker("getDate"));
				var diff = closingDate.getTime() - openingDate.getTime();
				var duration  = Math.ceil(diff / 1000 / 60 / 60 / 24);
				$("#duration").val(duration);
			}
			
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