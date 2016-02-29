<%@include file="init.jsp"%>
<liferay-theme:defineObjects />
<portlet:renderURL var="createURL">
	<portlet:param name="render" value="createTrade" />
</portlet:renderURL>


<portlet:actionURL var="updateStatusURL">
	<portlet:param name="action" value="updateStatus" />
</portlet:actionURL>





<div class="container-fluid">


	<form:form commandName="scfTradeModel" method="post"
		action="${createURL}" id="scfTradeList"  name="scfTradeList" >
		<input type="hidden" id="tradeID" name="tradeID">
		<input type="hidden" id="status" name="status">
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
	<div class="row-fluid">
		<div class="table-responsive">
			<table class="table  tablesorter table-bordered" id="tradeListTable">
				<thead>
					<tr>
						<th width="3%"></th>
					    <th>SCF Company</th>
					    <th>Allotment</th>
					    <th>BPS</th>
						<th>Investor Gross Profit</th>
						<th>WhiteHall Share</th>
						<th>Investor Net Profit</th>	
						<th>Seller Fees</th>
						<th>WhiteHall Gross Profit</th>		
						<th>Seller Allotment</th>
						<th>Status</th>					
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${fn:length(trades) gt 0}">
							<c:forEach items="${trades}" var="trade">
								<tr>
									<td width="3%"><input type="radio" value="${trade.id}" name="trade"  status-attr="${trade.status}" <c:if test="${trade.status eq 'Settled' || trade.status eq 'Closed'}">disabled="disabled"</c:if> ></td>
									<td class="underline"><strong><a href="javascript:void(0);"  onclick="window.location.href='${createURL}&tradeID=${trade.id}'">${trade.company.name} ( ${trade.duration} Days )</a></strong></td>
									<td>${trade.tradeAmount}</td>
									<td></td>
									<td>${trade.investorTotalGross}</td>
									<td>${trade.whitehallTotalShare}</td>
									<td>${trade.investorTotalProfit}</td>
									<td>${trade.sellerFees + trade.sellerTransFee}</td>
									<td>${trade.whitehallTotalProfit}</td>
									<td>${trade.sellerNetAllotment}</td>	
									<td>${trade.status}</td>						
								</tr>
								<c:if test="${fn:length(trade.allotments) gt 0}">
									<c:forEach items="${trade.allotments}" var="allotment">
										<tr>
											<td></td>
											<td></td>
											<td>${allotment.allotmentAmount}</td>
											<td>${allotment.marketDiscount}</td>
											<td>${allotment.investorGrossProfit}</td>
											<td>${allotment.whitehallProfitShare}</td>
											<td>${allotment.investorNetProfit}</td>
											<td></td>
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
		</div>
		<div class="row-fluid" id="buttonDiv">
			<div class="span3">
							<input type="button" value="Update Status" class="btn btn-primary span6" id="updateStatus"  data-url="${updateStatusURL}" />			
			</div>	
		</div>
		

	</form:form>
</div>
