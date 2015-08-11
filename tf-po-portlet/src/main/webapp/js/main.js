$(document).ready(function(){
	
	
	$("#uploadTableDiv").hide();
	
/*	$("#updatePO").click(function(){
		var url = $(this).attr('data-url');
		submitPOForms(url);
	});*/
	
	$("#uploadSpan").click(function(){
		$("#uploadTableDiv").toggle();
	});
	 
});

function submitPOForms(url) {
	document.forms["documentModel"].action = url;
	document.forms["documentModel"].submit();
}