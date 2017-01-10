
$(document).ready(function(){
	
	
	$("#sellercompNo").change(function(){
		var url =$("#defaultURL").val();
		var compName=$("#sellercompNo option:selected").text();
		/*$("#comp").html('').append( compName );*/
		$("#comp").val(compName);
		document.forms["dashBoard"].action = url;
		document.forms["dashBoard"].submit();
    });
	 
});






















