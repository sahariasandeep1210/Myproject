	<div class="table-responsive">
			<table class="table table-hover tablesorter table-bordered">
				<thead>
					<tr>										
						<th>Invoice Number</th>
						<th>Date</th>
						<th>Amount</th>
						<th>Duration</th>
						<th>Invoice Company</th>
						<th>Due date</th>
					</tr>
				</thead>
				<tbody>
						<c:forEach items="${invoices}" var="invoice">
							<tr>						
								<td>${invoice.invoiceNumber}</td>
								<td><fmt:formatDate pattern="dd-MM-yyyy" value="${invoice.invoiceDate}" /></td>
								<td>${invoice.invoiceAmount}</td>
								<td>${invoice.duration}</td>
								<td>${invoice.scfCompany.name}</td>
								<td><fmt:formatDate pattern="dd-MM-yyyy" value="${invoice.dueDate}" /></td>
							</tr>
						</c:forEach>
						
				</tbody>
			</table>
		</div>