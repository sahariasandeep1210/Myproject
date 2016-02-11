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
						var setting=jQuery.parseJSON(data);
						$("#transaction").val(setting.sellerTransFee);
						$("#finance").val(setting.sellerFinFee);
					} ,
					error: function(jqXHR, textStatus, errorThrown) {
						ajaxindicatorstop();

						
					}	  			
	  		});	
	  			

	    }
	});
	
	
	
});


