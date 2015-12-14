$(document).ready(function(){
	$(".historyRow").hide();

	
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
	
	 $(".faqflip").click(function(){
		    $(this).next('.faqpanel').slideToggle();
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
	
    $('#scfTradeList').on('click', '.breakdown', function() {
   	   var breakdownURL=$(this).attr('data-url'); 
   	   var tradeID=$(this).attr('tradeID');
   	   //hiding all other history rows
   	   $(".historyRow").hide();
   	   if($(this).parent().parent().hasClass("highlightedClass")){
   		 $(this).parent().parent().toggleClass('highlightedClass');
   		   return ;
   	   }else{
   		 $('#tradeListTable tr').removeClass("highlightedClass");
   		 $(this).parent().parent().toggleClass('highlightedClass');
   	   }
   	   
   	   
   	   
   	   if($("#"+tradeID+"_table").length){
   		   $("#"+tradeID+"_row").slideToggle();
   	   }else{
   			$.ajax({ 
 				url: breakdownURL, 
 				type: 'POST', 
 				cache: false,
 				data: { 
 					tradeID: tradeID 					
 					  }, 
 				success: function(data){
 					$("#"+tradeID+"_row > td").html(data);
 					$("#"+tradeID+"_row").slideToggle();
 							
 				} ,
 				error: function(jqXHR, textStatus, errorThrown) {
 					ajaxindicatorstop();
 					
 				}
 				});	
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
		$("#insuranceDocDiv").slideToggle();
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

function ajaxindicatorstart(text)
{
	if($('body').find('#resultLoading').attr('id') != 'resultLoading'){
	$('body').append('<div id="resultLoading" style="display:none"><div><img src="/tf-admin-portlet/images/ajax-loader.gif"><div>'+text+'</div></div><div class="bg"></div></div>');
	}
	
	$('#resultLoading').css({
		'width':'100%',
		'height':'100%',
		'position':'fixed',
		'z-index':'10000000',
		'top':'0',
		'left':'0',
		'right':'0',
		'bottom':'0',
		'margin':'auto'
	});	
	
	$('#resultLoading .bg').css({
		'background':'#000000',
		'opacity':'0.7',
		'width':'100%',
		'height':'100%',
		'position':'absolute',
		'top':'0'
	});
	
	$('#resultLoading>div:first').css({
		'width': '250px',
		'height':'75px',
		'text-align': 'center',
		'position': 'fixed',
		'top':'0',
		'left':'0',
		'right':'0',
		'bottom':'0',
		'margin':'auto',
		'font-size':'16px',
		'z-index':'10',
		'color':'#ffffff'
		
	});

    $('#resultLoading .bg').height('100%');
    $('#resultLoading').fadeIn(300);
    $('body').css('cursor', 'wait');
}

function ajaxindicatorstop()
{
    $('#resultLoading .bg').height('100%');
    $('#resultLoading').fadeOut(300);
    $('body').css('cursor', 'default');
}

$(document).ajaxStart(function () {
		//show ajax indicator
	ajaxindicatorstart('loading history data.. please wait..');
}).ajaxStop(function () {
	//hide ajax indicator
	ajaxindicatorstop();
});