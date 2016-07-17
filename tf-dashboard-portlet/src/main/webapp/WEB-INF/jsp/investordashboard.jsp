<%@include file="init.jsp"%>

<portlet:defineObjects />



<div id="dashboard">
	<div class="row-fluid">
		<div class="span6">
			<div class="panel panel-blue quick-stat-panel">
				<div class="panel-heading">
					<h3 class="panel-title">Credit Line</h3>
				</div>
				<div class="panel-body">					
					<div id="stackedBarChart"></div>
				</div>
			</div>
		</div>
	<div class="span6">
			<div class="panel panel-blue quick-stat-panel">
				<div class="panel-heading">
					<h3 class="panel-title">Available Credit Line</h3>
				</div>
				<div class="panel-body">	
					
					<div id="barchart"></div>
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
	
		
		var stackedBarChartdata = new google.visualization.DataTable();		
		stackedBarChartdata.addColumn('string', 'SCF Company');
		stackedBarChartdata.addColumn('number', 'Live');			
		stackedBarChartdata.addColumn('number', 'Settled');
		stackedBarChartdata.addColumn('number', 'Available');
		
		var barChartdata = new google.visualization.DataTable();		
		barChartdata.addColumn('string', 'Discount Rate');
		barChartdata.addColumn('number', 'Avail To Invest');
		barChartdata.addColumn({type: 'string', role: 'style'});
		      

      
	
		      
	
	  <c:forEach var="element" items="${dashboardModel.map}">
	  stackedBarChartdata.addRow(["${element.value.companyName}",parseFloat("${element.value.liveTradeAmount}"),parseFloat("${element.value.settledTradeAmount}"),parseFloat("${element.value.availTradeAmount}")]);
      </c:forEach>
      
	  <c:forEach var="element" items='${dashboardModel.investorPortfolios}'>
		barChartdata.addRow(["${element[1]}",parseFloat("${element[0]}"), '#ff9900' ]);
	</c:forEach>
      
      var stackedBarChartOptions = {	        		
     		 legend: { position: "top" },
     		 isStacked: true
       };
      var barChartOptions = {	        		
      		 legend: { position: "none"
      			
      			 	 
      			 }
        };

		
		
		var stackedBarChart = new google.visualization.ColumnChart(document.getElementById('stackedBarChart'));
		stackedBarChart.draw(stackedBarChartdata, stackedBarChartOptions);
		
		var barChart = new google.visualization.ColumnChart(document.getElementById('barchart'));
		barChart.draw(barChartdata, barChartOptions);

	}
</script>