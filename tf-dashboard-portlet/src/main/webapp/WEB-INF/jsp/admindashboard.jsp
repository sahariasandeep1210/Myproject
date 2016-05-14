<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>

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
					<!-- <div class="widget-footer-button create-new-button">
						<a>CREATE NEW</a>
					</div> -->
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
									<div class="big-text">&pound; ${dashboardModel.settledTradeAmount}</div>
								</div>
								
							</div>
							<div class="span4 fg-red">
								<div class="text-container">
									<div class="small-text">${dashboardModel.liveTradeCount} UNPAID</div>
									<div class="big-text">&pound; ${dashboardModel.liveTradeAmount}</div>
								</div>
							</div>
							<div class="span4 fg-green">
								<div class="text-container">
									<div class="small-text">TOTAL SCF TRADE</div>
									<div class="big-text">&pound; ${dashboardModel.totalTradeAmount}</div>
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
						<div class="span4 fg-blue">
							<div class="text-container">
								<div class="small-text">TOTAL CREDIT LINE</div>
								<div class="big-text">&pound; ${dashboardModel.investmentCap}</div>
							</div>
						</div>
						<div class="span4 fg-red">
							<div class="text-container">
								<div class="small-text">AVAILABLE TO INVEST</div>
								<div class="big-text">&pound; ${dashboardModel.availToInvest}</div>
							</div>
						</div>
						<div class="span4 fg-green">
							<div class="text-container">
								<div class="small-text">AMOUNT INVESTED</div>
								<div class="big-text">&pound; ${dashboardModel.amountInvested}</div>
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
						<li><span class="pull-right cash-amount">&pound;
								11,325,200</span><span class="org-name">ROYAL BANK GROUP
								SERVICES LIMITED</span></li>
						<li><span class="pull-right cash-amount">&pound;
								10,245,500</span><span class="org-name">HSBC LIMITED</span></li>
						<li><span class="pull-right cash-amount">&pound;
								9,325,600</span><span class="org-name">CITI LIMITED</span></li>
						<li><span class="pull-right cash-amount">&pound;
								8,225,200</span><span class="org-name">LLOYDS LTD</span></li>
						<li><span class="pull-right cash-amount">&pound;
								6,325,200</span><span class="org-name">HALIFAX MORTGAGE SERVICES
								LIMITED</span></li>
						<li><span class="pull-right cash-amount">&pound;
								4,545,600</span><span class="org-name">SOFTECH CONSULTANCY
								LIMITED</span></li>
						<li><span class="pull-right cash-amount">&pound;
								3,655,100</span><span class="org-name">NETWORK CONSULTANCY
								LIMITED</span></li>
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
				[ 'Investment', 'Money' ], [ 'Total Credit Line', parseInt('${dashboardModel.investmentCap}') ],
				[ 'Available to Invest', parseInt('${dashboardModel.availToInvest}') ], [ 'Amount Invested', parseInt('${dashboardModel.amountInvested}') ] ]);

		var options = {
			pieHole : 0.4,
			pieSliceText : 'none',
			pieSliceBorderColor : 'transparent',
			colors : [ '#2a7bb2', '#ffba00', '#189a80' ],
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