
<%@page import="com.liferay.portal.kernel.portlet.LiferayWindowState"%>
<%@include file="init.jsp"%>
<%@ taglib uri="http://liferay.com/tld/portlet" prefix="liferay-portlet" %>

<input type="hidden" value="${dashboardModel.investmentCap}" id="investmentCap" />
<input type="hidden" value="${dashboardModel.availToInvest}" id="availToInvest" />
<input type="hidden" value="${dashboardModel.amountInvested}" id="amountInvested" />

<liferay-portlet:renderURL portletName="tfcompanyportlet_WAR_tfadminportlet"  var="myTaskURL" varImpl="myTaskRender" windowState="<%=LiferayWindowState.NORMAL.toString()%>"  plid="10967">
    <liferay-portlet:param name="render" value="myTaskRender"/>
</liferay-portlet:renderURL>

<div class="container-fluid">
	<div class="row-fluid">
		<div class="span6 vcenter">
		
			<div class="widget stacked">

				<div class="widget-header">
					<i class="icon-star" style="margin-left: 10px !important;"></i>
					<h3>Quick Start</h3>
				</div>
				<!-- /widget-header -->
			<div class="widget-content">
					<div class="stats">
							
							<div class="stat">
								<span class="stat-value">${dashboardModel.investmentCap}</span>									
								Total Credit Line
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
