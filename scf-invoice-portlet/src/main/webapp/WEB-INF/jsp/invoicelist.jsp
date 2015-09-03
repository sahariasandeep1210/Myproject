<%@include file="init.jsp"%>
<portlet:actionURL var="importInvoiceURL">
	<portlet:param name="action" value="importInvoice" />
</portlet:actionURL>

<portlet:renderURL var="invoiceDocumentsURL">
	<portlet:param name="render" value="invoiceDocuments" />
</portlet:renderURL>
<div class="container-fluid">
	<form name="invoicelist" method="post" action="${invoiceDocumentsURL}">
		<div class="table-responsive">
			<table class="table table-hover tablesorter table-bordered">
				<thead>
					<tr>
						<th></th>
						<th>Invoice Number</th>
						<th>Date</th>
						<th>Amount</th>
						<th>Duration</th>
						<th>Invoice Company</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${invoiceList}" var="invoice">
						<tr>
							<td><input type="checkbox" value="${invoice.id}"
								name="invoiceId"></td>
							<td>${invoice.invoiceNumber}</td>
							<td>${invoice.invoiceDate}</td>
							<td>${invoice.invoiceAmount}</td>
							<td>${invoice.duration}</td>
							<td>${invoice.scfCompany}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

		<div class="row-fluid">
			<input type="submit" value="Upload Invoice Document" class="btn btn-primary"
				id="uploadInvoice" />
				<input type="button" value="Create Trade" class="btn btn-primary"
				id="createTrade" />
		</div>


	</form>



</div>




