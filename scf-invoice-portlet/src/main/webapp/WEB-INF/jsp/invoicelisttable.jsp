	<div class="table-responsive">
			<table class="table table-hover tablesorter table-bordered">
				<thead>
					<tr>
					<c:if test="${defaultRender}">
						<th></th>
					</c:if>						
						<th>Invoice Number</th>
						<th>Date</th>
						<th>Amount</th>
						<th>Duration</th>
						<th>Invoice Company</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${invoicesList}" var="invoice">
						<tr>
							<c:if test="${defaultRender}">
							<td><input type="checkbox" value="${invoice.id}" name="invoiceId" date-attr="${invoice.invoiceDate}" scfcompany-attr="${invoice.scfCompany.id}"></td>
							</c:if>
							<td>${invoice.invoiceNumber}</td>
							<td><fmt:formatDate pattern="dd-MM-yyyy" value="${invoice.invoiceDate}" /></td>
							<td>${invoice.invoiceAmount}</td>
							<td>${invoice.duration}</td>
							<td>${invoice.scfCompany.name}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>