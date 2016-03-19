<%@include file="init.jsp"%>
<portlet:renderURL var="invoiceURL">
	<portlet:param name="render" value="updateInvoices" />
</portlet:renderURL>


	<div class="row-fluid">
		<div class="span6">
			<div class="span12"></div>
		</div>
		<div class="span6">

			<div class="span12">
				<h5 style="float: right !important;">
					<a href="javascript:;" style="color: #295780; font-weight: bold;"
						id="exportInvoices"> Export</a>
				</h5>
			</div>
		</div>
	</div>

	<div class="table-responsive">
		<table class="table table-hover tablesorter table-bordered"
			id="invoiceListTable">
			<thead>
				<tr>
					<c:if test="${defaultRender}">
						<th class="hide-tablesorter"></th>
					</c:if>
					<th>Invoice Number</th>
					<th>PaymentDate</th>
					<th>Amount</th>
					<th>Duration</th>
					<th>Invoice Company</th>
					<th>Status</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${fn:length(invoicesList) gt 0}">
						<c:forEach items="${invoicesList}" var="invoice">
							<tr>
								<c:if test="${defaultRender}">
									<td><c:choose>
											<c:when
												test="${ userType eq 'Seller Admin' && invoice.status eq 'New'}">
												<input type="checkbox" value="${invoice.id}"
													name="invoiceId" date-attr="${invoice.financeDate}"
													scfcompany-attr="${invoice.scfCompany.id}"
													<c:if test="${invoice.scfTrade.id ne null}">disabled="disabled"</c:if>>
											</c:when>
											<c:when
												test="${userType eq 'Seller Admin' && invoice.status ne 'New'}">
												<input type="checkbox" name="invoiceId"
													date-attr="${invoice.financeDate}"
													scfcompany-attr="${invoice.scfCompany.id}"
													disabled="disabled">
											</c:when>
											<c:when test="${invoice.status eq 'New'}">
												<input type="checkbox" name="invoiceId"
													date-attr="${invoice.financeDate}"
													scfcompany-attr="${invoice.scfCompany.id}"
													disabled="disabled">
											</c:when>
											<c:otherwise>
												<input type="checkbox" value="${invoice.id}"
													name="invoiceId" date-attr="${invoice.financeDate}"
													scfcompany-attr="${invoice.scfCompany.id}"
													<c:if test="${invoice.scfTrade.id ne null}">disabled="disabled"</c:if>>
											</c:otherwise>
										</c:choose></td>
								</c:if>
								<td><span class='underline'><a
										href="javascript:void(0);"
										onclick="window.location.href='${invoiceURL}&invoiceID=${invoice.id}'">${invoice.invoiceNumber}</a></span></td>
								<td><fmt:formatDate pattern="dd-MM-yyyy"
										value="${invoice.payment_date}" /></td>
								<td>${invoice.invoiceAmount}</td>
								<td>${invoice.duration}</td>
								<td>${invoice.scfCompany.name}</td>
								<%--  <td><fmt:formatDate pattern="dd-MM-yyyy"
										value="${invoice.financeDate}" /></td>  --%>
								<td>${invoice.status}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:when test="${fn:length(invoices) gt 0}">
						<c:forEach items="${invoices}" var="invoice">
							<tr>
							<c:if test="${defaultRender}">
									<td><c:choose>
											<c:when
												test="${ userType eq 'Seller Admin' && invoice.status eq 'New'}">
												<input type="checkbox" value="${invoice.id}"
													name="invoiceId" date-attr="${invoice.financeDate}"
													scfcompany-attr="${invoice.scfCompany.id}"
													<c:if test="${invoice.scfTrade.id ne null}">disabled="disabled"</c:if>>
											</c:when>
											<c:when
												test="${userType eq 'Seller Admin' && invoice.status ne 'New'}">
												<input type="checkbox" name="invoiceId"
													date-attr="${invoice.financeDate}"
													scfcompany-attr="${invoice.scfCompany.id}"
													disabled="disabled">
											</c:when>
											<c:when test="${invoice.status eq 'New'}">
												<input type="checkbox" name="invoiceId"
													date-attr="${invoice.financeDate}"
													scfcompany-attr="${invoice.scfCompany.id}"
													disabled="disabled">
											</c:when>
											<c:otherwise>
												<input type="checkbox" value="${invoice.id}"
													name="invoiceId" date-attr="${invoice.financeDate}"
													scfcompany-attr="${invoice.scfCompany.id}"
													<c:if test="${invoice.scfTrade.id ne null}">disabled="disabled"</c:if>>
											</c:otherwise>
										</c:choose></td>
								</c:if>
								<td><span class='underline'><a
										href="javascript:void(0);"
										onclick="window.location.href='${invoiceURL}&invoiceID=${invoice.id}'">${invoice.invoiceNumber}</a></span></td>
								<td><fmt:formatDate pattern="dd-MM-yyyy"
										value="${invoice.payment_date}" /></td>
								<td>${invoice.invoiceAmount}</td>
								<td>${invoice.duration}</td>
								<td>${invoice.scfCompany.name}</td>
								<td>${invoice.status}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="6" align="center">No records found!</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>

