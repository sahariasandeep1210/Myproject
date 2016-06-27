<%@include file="init.jsp"%>

<portlet:defineObjects />



<div id="dashboard">
	<div class="row-fluid">
		<div class="span6">
			<div class="panel panel-blue quick-stat-panel">
				<div class="panel-heading">
					<h3 class="panel-title">Available Credit Line</h3>
				</div>
				<div class="panel-body">	
						<div class="quick-stat-stats row-fluid">
						<div class="span4 fg-blue">
							<div class="text-container">
								<div class="small-text">Available Credit Line</div>
								<div class="big-text">&pound; <fmt:formatNumber type="number" maxFractionDigits="3" value="${dashboardModel.totalCreditAvail}"  /></div>
							</div>
						</div>
						
					</div>			
					<div id="barchart"></div>
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
								<fmt:formatNumber type="number" maxFractionDigits="3" value="${investor.cashPosition}"  /></span>
								<span class="org-name">
								<c:choose>
									<c:when test="${investorID eq investor.investorId}">
										${investor.company.name}
									</c:when>
									<c:otherwise>
										Confidential
									</c:otherwise>							
								</c:choose>
								</span>
								</li>
						
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
	
		
		var barChartdata = new google.visualization.DataTable();		
		barChartdata.addColumn('string', 'SCF Company');
		barChartdata.addColumn('number', 'Avail To Invest');
		      
	  <c:forEach var="element" items='${dashboardModel.investorPortfolios}'>
	  		barChartdata.addRow(["${element[2]}",parseFloat("${element[0]}")]);
      </c:forEach>
      
      var barChartOptions = {	        		
     		 legend: { position: "none" }
       };

		
		
		var barChart = new google.visualization.ColumnChart(document.getElementById('barchart'));
        barChart.draw(barChartdata, barChartOptions);

	}
</script>