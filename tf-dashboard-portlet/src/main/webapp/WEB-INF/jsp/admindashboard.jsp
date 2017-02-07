<%@include file="init.jsp"%>

<portlet:defineObjects />



<div id="dashboard">
	<div class="row-fluid dashboard-sm-widget-wrapper">
		<div class="span2 spanSm6 spanMd6">
			<div class="dashboard-small-widget">
				<div class="widget-content fg-yellow">
					<div class="widget-title">INVOICES</div>
					<div class="widget-body">
						<i class="widget-icon icomoon-invoice"></i>
						<div class="count pull-right">${dashboardModel.invoiceCount}</div>
					</div>
				</div>
				<div class="widget-footer">
					<div class="widget-footer-button create-new-button">
						<a href="${dashboardModel.createInvoiceURL}">CREATE NEW</a>
					</div>
					<div class="widget-footer-button">
						<a href="/group/guest/invoices"> VIEW ALL</a>
					</div>
				</div>
			</div>
		</div>
		<div class="span2 spanSm6 spanMd6">
			<div class="dashboard-small-widget mtXs15">
				<div class="widget-content fg-blue">
					<div class="widget-title">COMPANY</div>
					<div class="widget-body">
						<i class="widget-icon icomoon-company"></i>
						<div class="count pull-right">${dashboardModel.companyCount}</div>
					</div>
				</div>
				<div class="widget-footer">
					<div class="widget-footer-button create-new-button">
						<a href="${dashboardModel.createCompanyURL}">CREATE NEW</a>
					</div>
					<div class="widget-footer-button">
						<a href="/group/guest/company"> VIEW ALL</a>
					</div>
				</div>
			</div>
		</div>
		<div class="span2 spanSm6 spanMd6">
			<div class="dashboard-small-widget mtSm15 mtMd15  mtXs15">
				<div class="widget-content fg-green">
					<div class="widget-title">INVESTORS</div>
					<div class="widget-body">
						<i class="widget-icon icomoon-portfolio"></i>
						<div class="count pull-right">${dashboardModel.investorCount}</div>
					</div>
				</div>
				<div class="widget-footer">
					<div class="widget-footer-button create-new-button">
						<a href="${dashboardModel.createInvestorURL}">CREATE NEW</a>
					</div>
					<div class="widget-footer-button">
						<a href="/group/guest/portfolio"> VIEW ALL</a>
					</div>
				</div>
			</div>
		</div>
		<div class="span6 spanSm6 spanMd6">
			<div class="dashboard-small-widget mtSm15 mtMd15 mtXs15">
				<div class="widget-content">
					<div class="widget-title">TRADES</div>
					<div class="widget-body">
						<div class="row-fluid">
							<div class="span4 fg-blue">
								<div class="text-container">
									<div class="small-text">${dashboardModel.settledTradeCount} PAID</div>
									<div class="big-text">&pound; <fmt:formatNumber type="number" maxFractionDigits="3" value="${dashboardModel.settledTradeAmount}"  pattern="#,###.00"/></div>
								</div>
								
							</div>
							<div class="span4 fg-red">
								<div class="text-container">
									<div class="small-text">${dashboardModel.liveTradeCount} UNPAID</div>
									<div class="big-text">&pound;  <fmt:formatNumber type="number" maxFractionDigits="3" value="${dashboardModel.liveTradeAmount}"  pattern="#,###.00"/></div>
								</div>
							</div>
							<div class="span4 fg-green">
								<div class="text-container">
									<div class="small-text">TOTAL SCF TRADE</div>
									<div class="big-text">&pound;  <fmt:formatNumber type="number" maxFractionDigits="3" value="${dashboardModel.totalTradeAmount}"  pattern="#,###.00"/></div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="widget-footer">
					<div class="widget-footer-button right">
						<a href="/group/guest/scf-trade"> VIEW ALL</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="row-fluid">
		<div class="span6">
			<div class="panel panel-blue quick-stat-panel">
				<div class="panel-heading">
					<h3 class="panel-title">QUICK STAT</h3>
				</div>
				<div class="panel-body">
					<div class="quick-stat-stats row-fluid">
						<%-- <div class="span4 fg-blue">
							<div class="text-container">
								<div class="small-text">TOTAL CREDIT LINE</div>
								<div class="big-text">&pound; <fmt:formatNumber type="number" maxFractionDigits="3" value="${dashboardModel.investmentCap}"  /></div>
							</div>
						</div> --%>
						<div class="span6 fg-red">
							<div class="text-container">
								<div class="small-text">AVAILABLE TO INVEST</div>
								<div class="big-text">&pound; <fmt:formatNumber type="number" maxFractionDigits="3" value="${dashboardModel.availToInvest}"  pattern="#,###.00"/></div>
							</div>
						</div>
						<div class="span6 fg-green">
							<div class="text-container">
								<div class="small-text">AMOUNT INVESTED</div>
								<div class="big-text">&pound; <fmt:formatNumber type="number" maxFractionDigits="3" value="${dashboardModel.amountInvested}"  pattern="#,###.00"/></div>
							</div>
						</div>
					</div>
					<div id="donutchart"></div>
				</div>
			</div>
		</div>
		<div class="span6">
			<div class="panel panel-blue top-cash-position-panel">
				<div class="panel-heading">
					<h3 class="panel-title">TOP CASH POSITION</h3>
				</div>
				<div class="panel-body">
					<ul>
						<c:forEach items="${dashboardModel.investors}" var="investor">
						<li><span class="pull-right cash-amount">&pound;
								<fmt:formatNumber type="number" maxFractionDigits="3" value="${investor.cashPosition}"  pattern="#,###.00"/></span><span class="org-name">${investor.company.name}</span></li>
						
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	google.charts.load("current", {
		packages : [ "corechart" ]
	});
	google.charts.setOnLoadCallback(drawChart);
	function drawChart() {
		var data = google.visualization.arrayToDataTable([
				[ 'Investment', 'Money' ],
				[ 'Available to Invest', parseInt('${dashboardModel.availToInvest}') ], [ 'Amount Invested', parseInt('${dashboardModel.amountInvested}') ] ]);

		var options = {
			pieHole : 0.4,
			pieSliceText : 'none',
			pieSliceBorderColor : 'transparent',
			colors : [ '#ffba00', '#189a80' ],
			chartArea:{
	          	left:20,
	            top:10,
	            width:'100%',
	            height:'90%'
	        }
		};

		var chart = new google.visualization.PieChart(document
				.getElementById('donutchart'));
		chart.draw(data, options);
	}
</script>