$(document).ready(
		function() {
			$("#TransactionReport").click(function() {
				var updateURL = $("#getReportURL").val();
				document.forms["reportList"].action = updateURL;
				document.forms["reportList"].submit();
			});
			
		$("#exportReport").click(function() {
			$('#reportListTable').tableExport({
				type : 'excel',
				escape : 'false',
				fileName : 'ReportList',
				worksheetName : 'ReportList'
			});
		});
		

});

$("#fromDate").datepicker({
	changeMonth : true,
	changeYear : true,
	showOn : "button",

	buttonImage : "/tf-theme/images/calendar.jpg",
	buttonImageOnly : true,
	buttonText : "Select date",
	onSelect : function(selected) {
		$("#toDate").datepicker("option", "minDate", selected)

	}
});

$("#toDate").datepicker({
	changeMonth : true,
	changeYear : true,
	showOn : "button",
	buttonImage : "/tf-theme/images/calendar.jpg",
	buttonImageOnly : true,
	buttonText : "Select date",
	onSelect : function(selected) {
		$("#fromDate").datepicker("option", "maxDate", selected)

	}
});

function setPage(pageNumber) {
	$("#currentPage").val(pageNumber);
	var actionUrl = $("#defaultURL").val();
	document.forms["reportList"].action = actionUrl;
	document.forms["reportList"].submit();
}

$("#pageSize").change(function (){
	var noOfRecords=parseInt($("#noOfRecords").val());
	var pageSize=parseInt($("#currPageSize").val());
	var newPageSize=parseInt($(this).val());
	$("#currentPage").val(1);
	if(noOfRecords<pageSize && newPageSize>pageSize){
		return;
	}else{
		var actionUrl = $("#defaultURL").val();
		document.forms["reportList"].action = actionUrl;
		document.forms["reportList"].submit();
	}	
	
});
