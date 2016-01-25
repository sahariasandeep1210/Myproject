<%@include file="init.jsp"%>
<liferay-theme:defineObjects />
<portlet:renderURL var="createURL">
	<portlet:param name="render" value="createTrade" />
</portlet:renderURL>


<style>
.aui input, .aui textarea, .aui .uneditable-input {
	width: 100% !important;
}
</style>



<div class="container-fluid">


	<form:form commandName="scfTradeModel" method="post"
		action="${createURL}" id="scfTradeList"  >
			<div class="row-fluid">
			<div class="span6">
				<div class="span3">
					<h4>Manage Trade</h4>
				</div>
				
			</div>
			<div class="span6">  
			  <div class="span12">
			  	<h5 style="float: right !important;" ><a href="#" style="color: #295780;font-weight: bold;"> Export</a></h5>
			  </div>
			  </div>			
		</div>
	
		<div class="table-responsive">
			<table class="table  tablesorter table-bordered" id="tradeListTable">
				<thead>
					<tr>
					    <th>SCF Company</th>
					    <th>Allotment</th>
					    <th>BPS</th>
						<th>Investor Gross Profit</th>
						<th>WhiteHall Share</th>
						<th>Investor Net Profit</th>	
						<th>Seller Fees</th>
						<th>WhiteHall Gross Profit</th>		
						<th>Seller Allotment</th>					
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${fn:length(trades) gt 0}">
							<c:forEach items="${trades}" var="trade">
								<tr>
									<td><strong><a href="javascript:void(0);"  onclick="window.location.href='${createURL}&tradeID=${trade.id}'">${trade.company.name} ( ${trade.duration} Days )</a></strong></td>
									<td>${trade.tradeAmount}</td>
									<td></td>
									<td>${trade.investorTotalGross}</td>
									<td>${trade.whitehallTotalShare}</td>
									<td>${trade.investorTotalProfit}</td>
									<td>${trade.sellerFees}</td>
									<td>${trade.whitehallTotalProfit}</td>
									<td>${trade.sellerNetAllotment}</td>							
								</tr>
								<c:if test="${fn:length(trade.allotments) gt 0}">
									<c:forEach items="${trade.allotments}" var="allotment">
										<tr>
											<td></td>
											<td>${allotment.allotmentAmount}</td>
											<td>${allotment.marketDiscount}</td>
											<td>${allotment.investorGrossProfit}</td>
											<td>${allotment.whitehallProfitShare}</td>
											<td>${allotment.investorNetProfit}</td>
											<td></td>
											<td></td>
											<td></td>
											
										</tr>
										
									</c:forEach>
								</c:if>
							
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="9" align="center">No records found!</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>

	</form:form>
</div>
