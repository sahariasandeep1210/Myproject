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
	
	
	
	
	
	//currently not in used
	$("#sellerCompany").change(function() {
	var settingURL=$("#settingURL").val();
		var userSel=$(this).val();
	  	   
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
						console.log("::settingObject::"+setting);

						$("#transaction").val(setting.sellerTransFee);
						$("#finance").val(setting.sellerFinFee);
								
					} ,
					error: function(jqXHR, textStatus, errorThrown) {
						ajaxindicatorstop();
						
					}
					});	
		
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