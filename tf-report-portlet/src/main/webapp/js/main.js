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
		
	function setPage(pageNumber) {
					$("#currentPage").val(pageNumber);
					var actionUrl = $("#defaultURL").val();
					document.forms["reportList"].action = actionUrl;
					document.forms["reportList"].submit();
				}
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
