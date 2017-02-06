
var errormessage="Some required information is missing or incomplete. Please correct your entries and try again.";

$(function() {
	
	//registration final Step
	$("#submitForm").click(function(){
		var error_free = true;
		error_free = validateContactForm(error_free);
		if (error_free) {
			document.forms["contactForm"].submit();	
		}
		
	});
	
	
});



function validateEmail(error_free,element){
	element.removeClass("error_show");
	var emailID=element.val();
	
	var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;	 
	 
	if(!(regex.test(emailID))){
		 element.addClass("error_show");
		 error_free = false;
	}if(emailID == '' || emailID == null){
		 element.addClass("error_show");
		 error_free = false;
	}	
		
	return error_free;
}

function validateContactForm(error_free){
	var elements = [];
	elements[0] = "firstName";
	elements[1] = "lastName";
	elements[2] = "companyName";
	elements[3] = "jobtitle";
	elements[4] = "contactNo";
	elements[5] = "emailAddress";
	elements[6] = "message";
	
	
	$("#errorMsg").hide();
	$("#errorMsg").removeClass("alert alert-danger");
	$("#errorMsg").html();
	
	for (i = 0; i < elements.length; i++) {
		var element = $("#" + elements[i]);
		var eleValue = element.val();
		if (eleValue == '' || eleValue == null) {
			element.addClass("error_show");
			error_free = false;
			$("#errorMsg").show();
			$("#errorMsg").addClass("alert alert-danger");
			$("#errorMsg").html(errormessage);
		} else {
			element.removeClass("error_show");
		}
	}
	error_free=validateEmail(error_free,$("#emailAddress"));
	
	return error_free;
	
}