<%@include file="init.jsp"%>

<portlet:defineObjects />



<div id="dashboard">
	<div class="row-fluid">
		<div class="span4">
			<div class="panel panel-blue quick-stat-panel">
				<div class="panel-heading">
					<h3 class="panel-title">Credit Line</h3>
				</div>
				<div class="panel-body">					
					<div id="stackedBarChart"></div>
				</div>
			</div>
		</div>
		<div class="span4">
			<div class="panel panel-blue quick-stat-panel">
				<div class="panel-heading">
					<h3 class="panel-title">SETTLED TRADES</h3>
				</div>
				<div class="panel-body">	
					
					<div id="barChart_setteled"></div>
				</div>
			</div>
		</div>
		<div class="span4">
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
		//stackedBarChartdata.addColumn('number', 'Settled');
		stackedBarChartdata.addColumn('number', 'Available');
		
		var barChartdata = new google.visualization.DataTable();		
		barChartdata.addColumn('string', 'Discount Rate');
		barChartdata.addColumn('number', 'Avail To Invest');
		barChartdata.addColumn({type: 'string', role: 'style'});
		      
		var barChartdata_settledAmount = new google.visualization.DataTable();		
		barChartdata_settledAmount.addColumn('string', 'SETTLED TRADES');
		barChartdata_settledAmount.addColumn('number', 'Settled');
		barChartdata_settledAmount.addColumn({type: 'string', role: 'style'});
      
	
		      
	
	  <c:forEach var="element" items="${dashboardModel.map}">
	/*   parseFloat("${element.value.settledTradeAmount}"), */
		<c:if test="${element.value.liveTradeAmount ne 0}">
		stackedBarChartdata.addRow(["${element.value.companyName}",parseFloat("${element.value.liveTradeAmount}"),parseFloat("${element.value.availTradeAmount}")]);
	</c:if>
	  
      </c:forEach>
      
	  <c:forEach var="element" items='${dashboardModel.investorPortfolios}'>
		barChartdata.addRow(["${element[1]}",parseFloat("${element[0]}"), '#ff9900' ]);
	</c:forEach>
	
	<c:forEach var="element" items='${dashboardModel.map}'>
	<c:if test="${element.value.settledTradeAmount ne 0}">
	barChartdata_settledAmount.addRow(["${element.value.companyName}",parseFloat("${element.value.settledTradeAmount}"), '#ff9900' ]);
	</c:if>
	</c:forEach>
      
      var stackedBarChartOptions = {	        		
     		 legend: { position: "top" },
     		 isStacked: true,
     		
     		height:500,
            chartArea: {
            	height:300,
              top:100,
            },
     		hAxis: {
     	        
     	        slantedText:true,
     	        slantedTextAngle:45
     	        } 
       };
      var barChartOptions = {	        		
      		 legend: { position: "none"},
      		height:500,
            chartArea: {
            	height:300,
              top:100,
            },
     		hAxis: {
     	        
     	        slantedText:true,
     	        slantedTextAngle:45
     	        } 
        };
      var barChartOptions_settledAmount = {	        		
       		 legend: { position: "none"},
       		height:500,
            chartArea: {
            	height:300,
              top:100,
            },
     		hAxis: {
     	        
     	        slantedText:true,
     	        slantedTextAngle:45
     	        } 
      		
         };
		
		
		var stackedBarChart = new google.visualization.ColumnChart(document.getElementById('stackedBarChart'));
		stackedBarChart.draw(stackedBarChartdata, stackedBarChartOptions);
		
		var barChart = new google.visualization.ColumnChart(document.getElementById('barchart'));
		barChart.draw(barChartdata, barChartOptions);
		
		var barChart_setteled = new google.visualization.ColumnChart(document.getElementById('barChart_setteled'));
		barChart_setteled.draw(barChartdata_settledAmount, barChartOptions_settledAmount);

	}
</script>