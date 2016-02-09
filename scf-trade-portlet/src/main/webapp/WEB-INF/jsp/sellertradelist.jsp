<%@include file="init.jsp"%>
<liferay-theme:defineObjects />
<%@ taglib uri="http://whitehall.com/jsp/tld/p" prefix="p"%>

<portlet:resourceURL  var="tradeURL"></portlet:resourceURL>

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
		<input type="hidden" name="currentPage" 	id="currentPage"    	value="${paginationModel.currentPage}" />
	    <input type="hidden" name="pageSize" 		id="pageSize" 			value="${paginationModel.pageSize}" />
	    <input type="hidden" name="defaultURL" 		id="defaultURL" 		value="${defaultRenderURL}" />
	     <input type="hidden" id="tradeURL" name="tradeURL" value="${tradeURL}"/>
	    
		
		<div class="row-fluid">
			<div class="search-seller">
				<input type="text" name="Search" placeholder="Search Here" id="search">

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
						<a href="#" style="color: #295780; font-weight: bold;" id="sellerTradeList"> Export</a>
					</h5>
				</div>
			</div>
		</div>

		<div class="table-responsive">
			<table class="table  tablesorter table-bordered" id="sellerListTable">
				<thead>
					<tr>
						<th>Trade #</th>
						<th>Scf Company</th>
						<th>Trade Value</th>
						<th>Status</th>
						<th>Duration</th>
						<th width="8%">Opening Date</th>
						<th width="8%">Maturity Date</th>
						<th>Supplier Payment Date</th>
						<th>Fixed Charges</th>
						<th>Whiethall Variable Fees</th>
						<th>Investors Fees</th>
						<th>Other Fees</th>
						<th>Gross charges</th>
						<th>Finance Amount</th>

					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${fn:length(trades) gt 0}">
							<c:forEach items="${trades}" var="trade">
								<tr>
									<td><span class='underline'><a href="javascript:void(0);"
										onclick="window.location.href='${supplierURL}&tradeID=${trade.id}'">${trade.id}</a></span></td>
										<td>${trade.company.name}</td>
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
									<td></td>
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
	<p:paginate  paginationModel="${paginationModel}"/>
