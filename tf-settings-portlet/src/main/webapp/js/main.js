$(document).ready(function() {
	
	$(".settingDiv").hide();
	enableTab();
	$('ul.nav-pills li a').click(function (e) {
		  $('ul.nav-pills li.active').removeClass('active');
		  $(this).parent('li').addClass('active');
	});
	
	$("#updateSettings").click(function (){
		var updateURL=$("#saveURL").val();
		document.forms["settingForm"].action = updateURL;
		document.forms["settingForm"].submit();

	});
	
	$("#updateGeneralSettings").click(function (){
		
		if($("#vatWhitehall").val()>100 || $("#vatInvestor").val()>100 || $("#vatSeller").val()>100  ){
			
			alert("VAT% value can not be greater than 100");
			return;
		}
		var updateURL=$("#saveSettingURL").val();
		document.forms["generalSettingForm"].action = updateURL;
		document.forms["generalSettingForm"].submit();
	});
	 $('table').tablesorter();

	
	$("#exportSellers").click(function(){
		/* window.open('data:application/vnd.ms-excel,' + $('#dvData').html());
		 e.preventDefault();*/	
		
		$('#settingListTable').tableExport({
			type : 'excel',
			escape : 'false',
			fileName: 'sellerList',
			worksheetName: 'SellerSetting List'
		});
		
	});
	
	


function enableTab(){
	var curentTab=$("#currentTab").val();
	if(curentTab=='generalsetting'){
		$("#generalSettings").addClass("active");
	}else if(curentTab=='investor'){
		$("#investorSettings").addClass("active");
	}else if(curentTab=='seller'){
		$("#sellerSetings").addClass("active");
	}
	else{
		$("#investorSettings").addClass("active");
	}	
}




$("#sellerCompany").change(function() {
	var settingURL=$("#settingURL").val();
	var userSel=$(this).val();
	if(userSel === 'undefined' || (! userSel )|| userSel === null){
		$("#transaction").val('');
		$("#finance").val('');

	}else{
	  			$.ajax({ 
					url: settingURL, 
					type: 'POST', 
					datatype:'json', 

					cache: false,
					data: { 
						userSelection: userSel 					
						  }, 
					success: function(data){
						if(data){
							var setting=jQuery.parseJSON(data);
							$("#transaction").val(setting.sellerTransFee);
							$("#finance").val(setting.sellerFinFee);
						}else{
							$("#transaction").val("");
							$("#finance").val("");
						}			
						
					} ,
					error: function(jqXHR, textStatus, errorThrown) {
						$("#transaction").val("");
						$("#finance").val("");
						ajaxindicatorstop();

						
					}	  			
	  		});	
	  			

	    }
	});

$("#vatWhitehall").forceNumeric("#vatWhitehall");
$("#vatInvestor").forceNumeric("#vatInvestor");
$("#vatSeller").forceNumeric("#vatSeller");
	
/*$("#vatWhitehall").change(function(evt) {
	
	var theEvent = evt || window.event;
	  var key = theEvent.keyCode || theEvent.which;
	  key = String.fromCharCode( key );
	  console.log("hello on key press "+ key);
	  var regex = /[0-9]|\./;
	  if( !regex.test(key) ) {
	    theEvent.returnValue = false;
	    if(theEvent.preventDefault) theEvent.preventDefault();
	  }
	
	
});
  */

function validate(evt){
	
	console.log("hellot this "+ evt);
}



	
});

var periodPressTime = 0;
//forceNumeric() plug-in implementation
jQuery.fn.forceNumeric = function (ID) {
    return this.each(function () {
        $(this).keydown(function (e) {
            var key = e.which || e.keyCode;

            if (!e.shiftKey && !e.altKey && !e.ctrlKey &&
            // numbers   
                key >= 48 && key <= 57 ||
            // Numeric keypad
                key >= 96 && key <= 105 ||
            // comma, period and minus, . on keypad
               key == 190 ||  key == 109 || key == 110 ||
            // Backspace and Tab and Enter
               key == 8 || key == 9 || key == 13 ||
            // Home and End
               key == 35 || key == 36 ||
            // left and right arrows
               key == 37 || key == 39 ||
            // Del and Ins
               key == 46 || key == 45){
            	
            	if(key == 190){
            		
            		periodPressTime++;
            		var value = $(ID).val()+"";
            		 if(value.indexOf(".") >=0 ){// to check double press of period
                     	
                     	return false;
                     }
            	}
               
                return true;
            }

            return false;
        });
    });
}