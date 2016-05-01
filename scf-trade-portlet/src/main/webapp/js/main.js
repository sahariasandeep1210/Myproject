$(document).ready(
		function() {
			

			$(".historyRow").hide();
			$("#buttonDiv").hide();
			$("#pageSize").val($("#currPageSize").val());
			$("#pagSize").val($("#curPageSize").val());
			$("#pgSize").val($("#currPageSizes").val());
			
			$("#dateList").change(function() {
				var userSel=$(this).val();
				if(userSel === 'undefined' || (! userSel )|| userSel === null){
					$("#fromDate").val('');
					$("#toDate").val('');
				}
			});
			

			$("#adminTradeReport").click(function() {
				var updateURL = $("#getAdminTradeURL").val();
				document.forms["scfTradeList"].action = updateURL;
				document.forms["scfTradeList"].submit();
			});
			$("#scfAdminTradeReport").click(function() {
				var updateURL = $("#getScfAdminTradeURL").val();
				document.forms["scfTradeList"].action = updateURL;
				document.forms["scfTradeList"].submit();
			});

			$("#sellerTradeReport").click(function() {
				var updateURL = $("#getSellerTradeURL").val();
				document.forms["sellerList"].action = updateURL;
				document.forms["sellerList"].submit();
			});

			$("#historyReport").click(function() {
				var updateURL = $("#getTradeHistorys").val();
				document.forms["tradehistoryForm"].action = updateURL;
				document.forms["tradehistoryForm"].submit();
			});

			$("#sellerReport").click(function() {
				var updateURL = $("#getTradeSellerHis").val();
				document.forms["singlehistoryForm"].action = updateURL;
				document.forms["singlehistoryForm"].submit();
			});
			enableTab();

			$("#pgSize").change(function() {
				var noOfRecords = parseInt($("#noOfRecords").val());
				var pageSize = parseInt($("#currPageSizes").val());
				var newPageSize = parseInt($(this).val());
				$("#currentPage").val(1);
				if (noOfRecords < pageSize && newPageSize > pageSize) {
					return;
				} else {
					var actionUrl = $("#defaultURL").val();
					document.forms["scfTradeList"].action = actionUrl;
					document.forms["scfTradeList"].submit();
				}
			});
			$("#pageSize").change(function() {
				var noOfRecords = parseInt($("#noOfRecords").val());
				var pageSize = parseInt($("#currPageSize").val());
				var newPageSize = parseInt($(this).val());
				$("#currentPage").val(1);
				if (noOfRecords < pageSize && newPageSize > pageSize) {
					return;
				} else {
					var actionUrl = $("#defaultURL").val();
					document.forms["sellerList"].action = actionUrl;
					document.forms["sellerList"].submit();
				}
			});

			$("#pagSize").change(function() {
				var noOfRecords = parseInt($("#noOfRecords").val());
				var pageSize = parseInt($("#curPageSize").val());
				var newPageSize = parseInt($(this).val());
				$("#currentPage").val(1);
				if (noOfRecords < pageSize && newPageSize > pageSize) {
					return;
				} else {
					var actionUrl = $("#defaultURL").val();
					document.forms["scfTradeList"].action = actionUrl;
					document.forms["scfTradeList"].submit();
				}
			});
			$("#exportAdmin").click(function() {
				$('#tradeListTable').tableExport({
					type : 'excel',
					escape : 'false',
				    fileName : 'TradeList',
					worksheetName : 'TradeList'
				});

			});
			$("#exportScfAdmin").click(function() {
				$('#tradeListTable').tableExport({
					type : 'excel',
					escape : 'false',
				    fileName : 'TradeList',
					worksheetName : 'TradeList'
				});

			});

			$("#exportSeller").click(function() {
				$('#sellerListTable').tableExport({
					type : 'excel',
					escape : 'false',
					fileName : 'sellerList',
					worksheetName : 'SellerList'
				});

			});
			$("#exportSingleTradeHistory").click(function() {
				$('#singleTradeHistoryTable').tableExport({
					type : 'excel',
					escape : 'false',
					fileName : 'singleTradeHistoryList',
					worksheetName : 'singleTradeHistoryList'
				});

			});
			$("#exportTradeHistory").click(function() {
				$('#tradeHistoryTable').tableExport({
					type : 'excel',
					escape : 'false',
					fileName : 'TradeHistory',
					worksheetName : 'TradeHistory'
				});

			});

			$("#exportTradeInvoice").click(function() {
				$('#tradeInvoiceTable').tableExport({
					type : 'excel',
					escape : 'false',
					fileName : 'InvoiceList',
					worksheetName : 'InvoiceList'
				});

			});

			$('input[type=radio][name="trade"]').change(function() {
				// this logic can be changed to ajax implementation
				var currentStatus = $(this).attr('status-attr');
				var tradeID = $(this).val();
				var updatedStatus = "";
				if (currentStatus == 'Live') {
					updatedStatus = 'Allotment Paid';
				} else if (currentStatus == 'Allotment Paid') {
					updatedStatus = 'Supplier Paid';
				} else if (currentStatus == 'Hold') {
					updatedStatus = 'Allotment Paid';
				} else if (currentStatus == 'Supplier Paid') {
					updatedStatus = 'SCF Repayment';
				} else if (currentStatus == 'SCF Repayment') {
					updatedStatus = 'Investor Paid';
				} else if (currentStatus == 'Investor Paid') {
					updatedStatus = 'Settled';
				}
				$("#buttonDiv").show();
				$("#tradeID").val(tradeID);
				$("#updateStatus").val(updatedStatus);

			});

			$("#SellerPaymentDate").datepicker(
					{
						changeMonth : true,
						dateFormat : 'dd/mm/yy',
						changeYear : true,
						showOn : "button",
						buttonImage : "/tf-theme/images/calendar.jpg",
						buttonImageOnly : true,
						buttonText : "Select date",
						onClose : function(selectedDate) {
							$("#investorPaymentDate").datepicker("option",
									"minDate", selectedDate);
						}
					});

			$(".faqflip").click(function() {
				$(this).next('.faqpanel').slideToggle();
			});

			$("#investorPaymentDate").datepicker(
					{
						changeMonth : true,
						dateFormat : 'dd/mm/yy',
						changeYear : true,
						showOn : "button",
						buttonImage : "/tf-theme/images/calendar.jpg",
						buttonImageOnly : true,
						buttonText : "Select date",
						onClose : function(selectedDate) {
							$("#SellerPaymentDate").datepicker("option",
									"maxDate", selectedDate);
						}
					});

			$("#openingDate").datepicker(
					{
						changeMonth : true,
						dateFormat : 'dd/mm/yy',
						changeYear : true,
						showOn : "button",
						buttonImage : "/tf-theme/images/calendar.jpg",
						buttonImageOnly : true,
						buttonText : "Select date",
						onClose : function(selectedDate) {
							$("#closingDate").datepicker("option", "minDate",
									selectedDate);

							if ($("#openingDate").val() != ""
									&& $("#closingDate").val() != "") {
								var openingDate = new Date($("#openingDate")
										.datepicker("getDate"));
								var closingDate = new Date($("#closingDate")
										.datepicker("getDate"));
								var diff = closingDate.getTime()
										- openingDate.getTime();
								var duration = Math.ceil(diff / 1000 / 60 / 60
										/ 24);
								$("#duration").val(duration);
							}

						}
					});

			$('#scfTradeList').on('click', '.breakdown', function() {
				var breakdownURL = $(this).attr('data-url');
				var tradeID = $(this).attr('tradeID');
				// resting icon
				$("[id$='_icon']").removeClass('fa-minus-square');
				$("[id$='_icon']").addClass('fa-plus-square');
				// hiding all other history rows
				$(".historyRow").hide();
				if ($(this).parent().parent().hasClass("highlightedClass")) {
					$(this).parent().parent().toggleClass('highlightedClass');
					changeExpandIcon(tradeID);
					return;
				} else {
					$('#tradeListTable tr').removeClass("highlightedClass");
					$(this).parent().parent().toggleClass('highlightedClass');
				}

				if ($("#" + tradeID + "_table").length) {
					$("#" + tradeID + "_row").slideToggle();
					changeExpandIcon(tradeID);

				} else {
					$.ajax({
						url : breakdownURL,
						type : 'POST',
						cache : false,
						data : {
							tradeID : tradeID
						},
						success : function(data) {
							$("#" + tradeID + "_row > td").html(data);
							$("#" + tradeID + "_row").slideToggle();
							changeExpandIcon(tradeID);

						},
						error : function(jqXHR, textStatus, errorThrown) {
							ajaxindicatorstop();

						}
					});
				}

			});

			$("#closingDate").datepicker(
					{
						changeMonth : true,
						dateFormat : 'dd/mm/yy',
						changeYear : true,
						showOn : "button",
						buttonImage : "/tf-theme/images/calendar.jpg",
						buttonImageOnly : true,
						buttonText : "Select date",
						onClose : function(selectedDate) {
							$("#openingDate").datepicker("option", "maxDate",
									selectedDate);

							if ($("#openingDate").val() != ""
									&& $("#closingDate").val() != "") {
								var openingDate = new Date($("#openingDate")
										.datepicker("getDate"));
								var closingDate = new Date($("#closingDate")
										.datepicker("getDate"));
								var diff = closingDate.getTime()
										- openingDate.getTime();
								var duration = Math.ceil(diff / 1000 / 60 / 60
										/ 24);
								$("#duration").val(duration);
							}

						}
					});

			$("#insureCheck").change(function() {
				$("#insuranceDocDiv").slideToggle();
			});

			$("#tradeAdd,#tradeback").click(function() {
				var url = $(this).attr('data-url');
				submitTradeForms(url);
			});

			$("#updateStatus").click(function() {
				var url = $(this).attr('data-url');
				var updatedStatus = $(this).val();
				$("#status").val(updatedStatus);
				document.forms["scfTradeList"].action = url;
				document.forms["scfTradeList"].submit();
			});
			$("#updteTradeForm .ui-datepicker-trigger").remove();
			
			 $('.info-icon').tooltip({
			        placement: 'left',
			        title: 'Hello'
			        });


		});

function submitTradeForms(url) {
	document.forms["TradeDetail"].action = url;
	document.forms["TradeDetail"].submit();
}

function ajaxindicatorstart(text) {
	if ($('body').find('#resultLoading').attr('id') != 'resultLoading') {
		$('body')
				.append(
						'<div id="resultLoading" style="display:none"><div><img src="/tf-admin-portlet/images/ajax-loader.gif"><div>'
								+ text
								+ '</div></div><div class="bg"></div></div>');
	}

	$('#resultLoading').css({
		'width' : '100%',
		'height' : '100%',
		'position' : 'fixed',
		'z-index' : '10000000',
		'top' : '0',
		'left' : '0',
		'right' : '0',
		'bottom' : '0',
		'margin' : 'auto'
	});

	$('#resultLoading .bg').css({
		'background' : '#000000',
		'opacity' : '0.7',
		'width' : '100%',
		'height' : '100%',
		'position' : 'absolute',
		'top' : '0'
	});

	$('#resultLoading>div:first').css({
		'width' : '250px',
		'height' : '75px',
		'text-align' : 'center',
		'position' : 'fixed',
		'top' : '0',
		'left' : '0',
		'right' : '0',
		'bottom' : '0',
		'margin' : 'auto',
		'font-size' : '16px',
		'z-index' : '10',
		'color' : '#ffffff'

	});

	$('#resultLoading .bg').height('100%');
	$('#resultLoading').fadeIn(300);
	$('body').css('cursor', 'wait');
}

function ajaxindicatorstop() {
	$('#resultLoading .bg').height('100%');
	$('#resultLoading').fadeOut(300);
	$('body').css('cursor', 'default');
}

function changeExpandIcon(tradeID) {
	if ($("#" + tradeID + "_row").css('display') == 'none') {
		$("#" + tradeID + "_icon").removeClass('fa-minus-square');
		$("#" + tradeID + "_icon").addClass('fa-plus-square');
	} else {
		$("#" + tradeID + "_icon").removeClass('fa-plus-square');
		$("#" + tradeID + "_icon").addClass('fa-minus-square');
	}

}

$('table').tablesorter();

function setPage(pageNumber) {
	if ($("#sellerListTable").length) {
		$("#currentPage").val(pageNumber);
		var actionUrl = $("#defaultURL").val();
		document.forms["sellerList"].action = actionUrl;
		document.forms["sellerList"].submit();
	} else if ($("#tradeListTable").length) {
		$("#currentPage").val(pageNumber);
		var actionUrl = $("#defaultURL").val();
		document.forms["scfTradeList"].action = actionUrl;
		document.forms["scfTradeList"].submit();
	} else if ($("#tradeHisTable").length) {
		$("#currentPage").val(pageNumber);
		var actionUrl = $("#defaultURL").val();
		document.forms["tradehistoryForm"].action = actionUrl;
		document.forms["tradehistoryForm"].submit();
	} else if ($("#singleTradeHistoryTable").length) {
		$("#currentPage").val(pageNumber);
		var actionUrl = $("#defaultURL").val();
		document.forms["singlehistoryForm"].action = actionUrl;
		document.forms["singlehistoryForm"].submit();
	}  else {
		$("#currentPage").val(pageNumber);
		var actionUrl = $("#defaultURL").val();
		document.forms["scfTradeList"].action = actionUrl;
		document.forms["scfTradeList"].submit();
	}

}

function enableTab() {
	var curentTab = $("#currentTab").val();
	if (curentTab == 'admintradelist') {
		$("#scftradesTab").addClass("active");
	} else if (curentTab == 'tradehistory') {
		$("#tradehis").addClass("active");
	} else {
		$("#scftradesTab").addClass("active");
	}
}

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
