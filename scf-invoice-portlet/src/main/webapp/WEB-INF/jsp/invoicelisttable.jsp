<%@include file="init.jsp"%>
<portlet:renderURL var="invoiceURL">
	<portlet:param name="render" value="updateInvoices" />
</portlet:renderURL>




	<div class="customTableContainer">
		<table class="table table-hover tablesorter table-bordered"
			id="invoiceListTable">
			<thead>
				<tr>
					<c:if test="${defaultRender}">
						<th class="hide-tablesorter" width="20px"></th>
					</c:if>
					<th>Invoice Number</th>
					<th>PaymentDate</th>
					<th>Amount</th>
					<th>Duration</th>
					<c:if test="${userType =='SCF Company Admin'}">
					<th>Supplier Company</th>
					</c:if>
					<c:if test="${userType !='SCF Company Admin'}">
					<th>Investor Company</th>
					</c:if>
					
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
													name="invoiceId" date-attr="${invoice.payment_date}"
													scfcompany-attr="${invoice.scfCompany.id}"
													<c:if test="${invoice.scfTrade.id ne null}">disabled="disabled"</c:if>>
											</c:when>
											<c:when
												test="${userType eq 'Seller Admin' && invoice.status ne 'New'}">
												<input type="checkbox" name="invoiceId"
													date-attr="${invoice.payment_date}"
													scfcompany-attr="${invoice.scfCompany.id}"
													disabled="disabled">
											</c:when>
											<c:when test="${invoice.status eq 'New'}">
												<input type="checkbox" name="invoiceId"
													date-attr="${invoice.payment_date}"
													scfcompany-attr="${invoice.scfCompany.id}"
													disabled="disabled">
											</c:when>
											<c:otherwise>
												<input type="checkbox" value="${invoice.id}"
													name="invoiceId" date-attr="${invoice.payment_date}"
													scfcompany-attr="${invoice.scfCompany.id}"
													<c:if test="${invoice.scfTrade.id ne null}">disabled="disabled"</c:if>>
											</c:otherwise>
										</c:choose></td>
								</c:if>
								<td><span class="green_bold"><a
										href="javascript:void(0);"
										onclick="window.location.href='${invoiceURL}&invoiceID=${invoice.id}'">${invoice.invoiceNumber}</a></span></td>
								<td class="text-center"><fmt:formatDate pattern="dd-MM-yyyy"
										value="${invoice.payment_date}" /></td>
								<td class="rightalign blue_bold"><fmt:formatNumber type="number" maxFractionDigits="3" value="${invoice.invoiceAmount}"  pattern="#,##0.00"/></td>
								<td class="text-center">${invoice.duration}</td>
								<td>${invoice.scfCompany.name}</td>								
								<td>
								${invoice.status}
								<c:if test="${invoice.status ne 'New'}">
								 (<a  href ="${tradeURL}&tradeID=${invoice.scfTrade.id}">${invoice.scfTrade.scfId} </a>)
								</c:if>
								</td>
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

