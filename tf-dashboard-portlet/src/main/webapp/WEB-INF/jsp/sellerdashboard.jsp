<%@include file="init.jsp"%>
<portlet:renderURL var="defaultRenderURL" />
<input type="hidden" name="defaultURL" 		id="defaultURL" 		value="${defaultRenderURL}" />

<portlet:defineObjects />
<form:form  method="post"
		action="${defaultRenderURL}" id="dashBoard" autocomplete="off" name="dashBoard">

<div id="dashboard">
	<div class="row-fluid">
		<div class="span6">
			<div class="panel panel-blue quick-stat-panel">
				<div class="panel-heading">
					<h3 class="panel-title">Credit Line Availability</h3>
					<br>
					<c:choose>
				<c:when test="${not empty sellerRegList }">
					<select id="sellercompNo" name="sellercompNo"
						class="aui-field-select">
						<option value="" selected="selected" disabled="disabled">Select </option>
						<c:forEach var="sellerCompany" items="${sellerRegList}">
							<option value="${sellerCompany.id}" 
							<c:if test="${sellerCompany.id eq companyId}">selected="selected" </c:if>>${sellerCompany.sellerCompany.name}</option>
						</c:forEach>
					</select>
				</c:when>
				
			</c:choose>
					<%-- <br>
					<input type="hidden" id="comp" name="comp" value=""/>
					<span id="showD">${compV}</span> --%>
				</div>
				<div class="panel-body">
					<div class="quick-stat-stats row-fluid">
						<div class="span4 fg-blue">
							<div class="text-container">
								<div class="small-text">TOTAL CREDIT LINE</div>
								<div class="big-text">&pound; <fmt:formatNumber type="number" maxFractionDigits="3" value="${dashboardModel.investmentCap}"  /></div>
							</div>
						</div>
						<div class="span4 fg-red">
							<div class="text-container">
								<div class="small-text">CREDIT AVAILABLE</div>
								<div class="big-text">&pound; <fmt:formatNumber type="number" maxFractionDigits="3" value="${dashboardModel.availToInvest}"  /></div>
							</div>
						</div>
						
					</div>
					<div id="donutchart"></div>
				</div>
			</div>
		</div>
		<div class="span6">
			<div class="panel panel-blue quick-stat-panel">
				<div class="panel-heading">
					<h3 class="panel-title">Available Credit Line with BPS</h3>
				</div>
				<div class="panel-body">	
						<div class="quick-stat-stats row-fluid">
						<div class="span4 fg-blue">
							<div class="text-container">
								<div class="small-text">Credit Available</div>
								<div class="big-text">&pound; <fmt:formatNumber type="number" maxFractionDigits="3" value="${dashboardModel.totalCreditAvail}"  /></div>
							</div>
						</div>
						
					</div>			
					<div id="barchart"></div>
				</div>
			</div>
		</div>
	</div>
</div>
</form:form>
<script type="text/javascript">
	google.charts.load("current", {
		packages : [ "corechart" ]
	});
	google.charts.setOnLoadCallback(drawChart);
	function drawChart() {
		var data = google.visualization.arrayToDataTable([
				[ 'Investment', 'Money' ], [ 'Total Credit Line', parseInt('${dashboardModel.investmentCap}') ],
				[ 'Credit Available', parseInt('${dashboardModel.availToInvest}') ]]);
		
		var barChartdata = new google.visualization.DataTable();		
		barChartdata.addColumn('string', 'Discount Rate');
		barChartdata.addColumn('number', 'Avail To Invest');
		      
	  <c:forEach var="element" items='${dashboardModel.investorPortfolios}'>
	  		barChartdata.addRow(["${element[1]}",parseFloat("${element[0]}")]);
      </c:forEach>
      
      var barChartOptions = {	        		
     		 legend: { position: "none" }
       };

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
		
		var barChart = new google.visualization.ColumnChart(document.getElementById('barchart'));
        barChart.draw(barChartdata, barChartOptions);

		var chart = new google.visualization.PieChart(document
				.getElementById('donutchart'));
		chart.draw(data, options);
	}
</script>
	  