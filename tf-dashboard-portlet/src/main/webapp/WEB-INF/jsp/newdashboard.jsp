



<input type="hidden" value="${dashboardModel.investmentCap}" id="investmentCap" />
<input type="hidden" value="${dashboardModel.availToInvest}" id="availToInvest" />
<input type="hidden" value="${dashboardModel.amountInvested}" id="amountInvested" />

<div class="container-fluid">
	<div class="row-fluid">
		<div class="span6 vcenter">
		
			<div class="widget stacked">

				<div class="widget-header">
					<i class="icon-star" style="margin-left: 10px !important;"></i>
					<h3>Quick Stats</h3>
				</div>
				<!-- /widget-header -->
			<div class="widget-content">
					<div class="stats">
							
							<div class="stat">
								<span class="stat-value">${dashboardModel.investmentCap}</span>									
								Investment Cap
							</div> 
							
							<div class="stat">
								<span class="stat-value">${dashboardModel.availToInvest}</span>									
								Available To Invest
							</div> 
							
							<div class="stat">
								<span class="stat-value">${dashboardModel.amountInvested}</span>									
								Amount Invested 
							</div> 
							
						</div> 
						
						<div id="chart-stats" class="stats" >
						<div class="stat stat-chart">	
							<canvas id="chart-area" width="225" height="100" ></canvas>
							 <!-- <div id="js-legend" class="chart-legend"></div> -->
							 <div id="js-legend" class="chart-legend" style="display:inline-block;position: absolute;"></div>
						 </div>
					</div>
					<!-- <div id="chart-stats" class="stats">
						
						<div class="stat stat-chart">							
							<div id="donut-chart" class="chart-holder" style="padding: 0px; position: relative;">
							<canvas class="base" width="260" height="100"></canvas>
							<canvas class="overlay" width="260" height="100" style="position: absolute; left: 0px; top: 0px;"></canvas> 
							<div class="legend"><div style="position: absolute; width: 53px; height: 72px; top: 5px; right: 5px; opacity: 0.85; background-color: rgb(255, 255, 255);"> </div><table style="position:absolute;top:5px;right:5px;;font-size:smaller;color:#545454"><tbody><tr><td class="legendColorBox"><div style="border:1px solid #ccc;padding:1px"><div style="width:4px;height:0;border:5px solid rgb(255,153,0);overflow:hidden"></div></div></td><td class="legendLabel">Series 1</td></tr><tr><td class="legendColorBox"><div style="border:1px solid #ccc;padding:1px"><div style="width:4px;height:0;border:5px solid rgb(34,34,34);overflow:hidden"></div></div></td><td class="legendLabel">Series 2</td></tr><tr><td class="legendColorBox"><div style="border:1px solid #ccc;padding:1px"><div style="width:4px;height:0;border:5px solid rgb(119,119,119);overflow:hidden"></div></div></td><td class="legendLabel">Series 3</td></tr></tbody></table></div></div> #donut							
						</div> /substat
						
						<div class="stat stat-time">									
							<span class="stat-value">00:28:13</span>
							Average Time on Site
						</div> /substat
						
					</div> -->
		
			

			
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
						
						<a href="javascript:;" class="shortcut">
							<i class="fa fa-bar-chart"></i>
							<span class="shortcut-label">Reports</span>	
						</a>
						
						<a href="javascript:;" class="shortcut">
							<i class="fa fa-user fa-4"></i>
							<span class="shortcut-label">Users</span>
						</a>
						
						<a href="javascript:;" class="shortcut">
							<i class="fa fa-newspaper-o"></i>
							<span class="shortcut-label">Notes</span>
						</a>
						
						<a href="/group/guest/scf-trade" class="shortcut">
							<i class="fa fa-money"></i>
							<span class="shortcut-label">Trades</span>	
						</a>
						
						<a href="javascript:;" class="shortcut">
							<i class="shortcut-icon icon-picture"></i>
							<span class="shortcut-label">Documents</span>	
						</a>
						
						<a href="javascript:;" class="shortcut">
							<i class="shortcut-icon icon-tag"></i>
							<span class="shortcut-label">Tags</span>
						</a>				
					</div> <!-- /shortcuts -->	
				
				</div> <!-- /widget-content -->
				
			</div>
			
		
		</div>
		</div>
		



	</div>
