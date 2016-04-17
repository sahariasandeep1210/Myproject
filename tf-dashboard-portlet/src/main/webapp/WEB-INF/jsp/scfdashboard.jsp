
<%@page import="com.liferay.portal.util.PortalUtil"%>
<%@page import="com.liferay.portal.kernel.portlet.LiferayWindowState"%>
<%@include file="init.jsp"%>
<%@ taglib uri="http://liferay.com/tld/portlet" prefix="liferay-portlet" %>

<input type="hidden" value="${dashboardModel.investmentCap}" id="investmentCap" />
<input type="hidden" value="${dashboardModel.availToInvest}" id="availToInvest" />
<input type="hidden" value="${dashboardModel.amountInvested}" id="amountInvested" />

<%
long protPlid=PortalUtil.getPlidFromPortletId(themeDisplay.getScopeGroupId(),true, "tfcompanyportlet_WAR_tfadminportlet");
%>

<liferay-portlet:renderURL portletName="tfcompanyportlet_WAR_tfadminportlet"  var="myTaskURL" varImpl="myTaskRender" windowState="<%=LiferayWindowState.NORMAL.toString()%>"  plid="<%= protPlid %>">
    <liferay-portlet:param name="render" value="myTaskRender"/>
</liferay-portlet:renderURL>

<div class="container-fluid">
	<div class="row-fluid">
			<div class="span6 vcenter">
		
			<div class="widget stacked">

				<div class="widget-header">
					<i class="icon-star" style="margin-left: 10px !important;"></i>
					<h3>Quick Stat</h3>
				</div>
				<!-- /widget-header -->
			<div class="widget-content" id="creditLineChart">
		
			</div>	
				
			</div>

			<div class="widget stacked">
				<div class="widget-header">
					<i class="fa fa-money" style="margin-left: 10px !important;"></i>
					<h3>Graph</h3>
				</div>
				<div id="chart-widget" class="widget-content">
					<c:choose>
						<c:when test="${not empty investorPortfolios }">
							<div id="columnchart_material"></div>
						</c:when>
						<c:otherwise>

						</c:otherwise>
					</c:choose>
				</div>
			</div>

		</div>
			
			


		<div class="span6 vcenter">
		
			<div class="widget stacked">
					
				<div class="widget-header">
					<i class="icon-bookmark" style="margin-left: 10px !important;"></i>
					<h3>Quick Shortcuts</h3>
				</div> <!-- /widget-header -->
				
				<div class="widget-content">
					
					<div class="shortcuts">
						<a href="/group/guest/company" class="shortcut">
							<i class="fa fa-users fa-4"></i>
							<span class="shortcut-label">Company</span>
						</a>
						
						<a href="/group/guest/invoices" class="shortcut">
							<i class="icon-book fa-6 fa-4" ></i>
							<span class="shortcut-label">Invoices</span>								
						</a>
						
						<a href="/group/guest/scf-trade" class="shortcut">
							<i class="fa fa-money"></i>
							<span class="shortcut-label">Trades</span>	
						</a>
						<a href="javascript:;" class="shortcut">
							<i class="fa fa-bar-chart"></i>
							<span class="shortcut-label">Reports</span>	
						</a>
						<a href="${myTaskURL}" class="shortcut">
							<i class="fa fa-tasks"></i>
							<span class="shortcut-label">My Task</span>	
						</a>
									
					</div> <!-- /shortcuts -->	
				
				</div> <!-- /widget-content -->
				
			</div>
			
		
		</div>
		</div>
		



	</div>
	  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	  <script type="text/javascript">
	  // Load Charts and the corechart and barchart packages.
      google.charts.load('current', {'packages':['corechart']});
      // Draw the pie chart and bar chart when Charts is loaded.
	  google.charts.setOnLoadCallback(drawChart);
      
      function drawChart() {
	      var barChartdata = new google.visualization.DataTable();
	      var pieChartdata = new google.visualization.DataTable();
	      
	      barChartdata.addColumn('string', 'Discount Rate');
	      barChartdata.addColumn('number', 'Avail To Invest');
	      
		  <c:forEach var="element" items='${investorPortfolios}'>
		  		barChartdata.addRow(["${element[1]}",parseFloat("${element[0]}")]);
	      </c:forEach>
	      
	      
	      pieChartdata.addColumn('string', 'Cash');
	      pieChartdata.addColumn('number', 'Amount');
	      pieChartdata.addRows([
	                    ['Total Credit line', parseInt('${dashboardModel.investmentCap}')],
	                    ['Available to Invest', parseInt('${dashboardModel.availToInvest}')],
	                    ['Amount Invested', parseInt('${dashboardModel.amountInvested}')]
	                  ]);
 
	      
	        var barChartOptions = {	        		
	        		 legend: { position: "none" }
	          };
	        
	         var pieChartOptions = {        		
	        		 is3D: true,
	        		 width: '100%',
	        	     height: '100%',
	        	     chartArea: {
	        	            left: "10%",
	        	            top: "3%",
	        	            height: "100%",
	        	            width: "100%"
	        	        }
	          }; 
	        
	        var barChart = new google.visualization.ColumnChart(document.getElementById('columnchart_material'));
	        barChart.draw(barChartdata, barChartOptions);
	        
	        var pieChart = new google.visualization.PieChart(document.getElementById('creditLineChart'));
	        pieChart.draw(pieChartdata, pieChartOptions); 
        }
    </script>