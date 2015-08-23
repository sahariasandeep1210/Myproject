<%@include file="init.jsp"%>

<portlet:renderURL var="addPurchaseOrderURL">
	<portlet:param name="render" value="addPurchaseOrder" />
</portlet:renderURL>

<style>
.aui input, .aui textarea, .aui .uneditable-input {
	width: 100% !important;
}
</style>

<div class="container-fluid">
	<form:form commandName="purchaseOrderDTO" method="post"
		action="${addPurchaseOrderURL}" id="addPurchaseOrder" autocomplete="off"
		name="addPurchaseOrder">
		<div class="row-fluid">
			<div class="span6">
				<h4>Purchase Order List</h4>
			</div>
		</div>
		<div class="table-responsive">
			<table class="table table-hover tablesorter table-bordered">
				<thead>
					<tr>
						<th>Seller</th>
						<th>PO No.</th>
						<th>PO Amount</th>
						<th>PO days</th>
						<th>Finance Amount</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="purchaseObj">
						<tr onclick="window.location.href='${addPurchaseOrderURL}&purchaseOrderId=${purchaseObj.id}'">
							<td>${purchaseObj.sellerId} </td>
							<td>${purchaseObj.poNumber}</td>
							<td>${purchaseObj.poAmount	}</td>
							<td>${purchaseObj.poDays}</td>
							<td>${purchaseObj.financeAmount}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</form:form>
</div>