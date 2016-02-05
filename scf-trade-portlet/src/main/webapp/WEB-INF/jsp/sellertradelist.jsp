<%@include file="init.jsp"%>
<liferay-theme:defineObjects />

<style>
.aui input, .aui textarea, .aui .uneditable-input {
	width: 100% !important;
}
</style>

<portlet:renderURL var="supplierURL">
	<portlet:param name="render" value="singleTrade" />
</portlet:renderURL>

<div class="container-fluid">


	<form:form commandName="scfSellerTradeModel" method="post" action=" "
		id="scfSellerTradeList">
		<div class="row-fluid">
			<div class="search-seller">
				<input type="text" name="Search" placeholder="Search Here">

			</div>
		</div>
		<div class="row-fluid">
			<div class="span6">
				<div class="span3">
					<h4>Manage Trade</h4>
				</div>
			</div>

			<div class="span6">
				<div class="span12">
					<h5 style="float: right !important;">
						<a href="#" style="color: #295780; font-weight: bold;"> Export</a>
					</h5>
				</div>
			</div>
		</div>

		<div class="table-responsive">
			<table class="table  tablesorter table-bordered" id="tradeListTable">
				<thead>
					<tr>
						<th>Trade #</th>
						<th>Trade Value</th>
						<th>Trade Status</th>
						<th>Duration</th>
						<th width="8%">Opening Date</th>
						<th width="8%">Maturity Date</th>
						<th>Supplier Payment Date</th>
						<th>FIXED CHARGES(£)</th>
						<th>Whiethall Variable Fees IN £</th>
						<th>Investors Fees</th>
						<th>Other Fees</th>
						<th>GROSS CHARGES</th>
						<th>Finance Amount</th>

					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${fn:length(trades) gt 0}">
							<c:forEach items="${trades}" var="trade">
								<tr>
									<td><a href="javascript:void(0);"
										onclick="window.location.href='${supplierURL}&tradeID=${trade.id}'">${trade.id}</a></td>
									<td>${trade.tradeAmount}</td>
									<td>${trade.status}</td>
									<td>${trade.duration}</td>
									<td><fmt:formatDate pattern="dd-MM-yyyy"
											value="${trade.openingDate}" /></td>
									<td><fmt:formatDate pattern="dd-MM-yyyy"
											value="${trade.closingDate}" /></td>
									<td><fmt:formatDate pattern="dd-MM-yyyy"
											value="${trade.sellerPaymentDate}" /></td>
									<td>${trade.sellerTransFee }</td>
									<td>${trade.investorTotalGross}</td>
									<td>${trade.sellerFees}</td>
									<td>${trade.tradeAmount}</td>
									<td>${trade.sellerNetAllotment}</td>
									<td>${trade.sellerNetAllotment}</td>

								</tr>

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
