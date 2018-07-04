
$(function() {
	

	
	$("#pageSize").val($("#currPageSize").val());
	
	$(".dropdown-menu").on("click", "li", function(event) {
		var noOfRecords = parseInt($("#noOfRecords").val());
		var pageSize = parseInt($("#currPageSize").val());
		var newPageSize = parseInt($(this).attr('pageSize'));
		$("#pageSize").val(newPageSize);
		$("#currentPage").val(1);
		if (noOfRecords < pageSize && newPageSize > pageSize) {
			return;
		} else {
			var actionUrl = $("#defaultURL").val();
			document.forms["payemtnScheduleList"].action = actionUrl;
			document.forms["payemtnScheduleList"].submit();
		}

	});

});

function setPage(pageNumber){
	$("#currentPage").val(pageNumber);
	var actionUrl=$("#defaultURL").val();
	document.forms["payemtnScheduleList"].action = actionUrl;
	document.forms["payemtnScheduleList"].submit();	
}
