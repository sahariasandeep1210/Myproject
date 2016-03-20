	<%@include file="init.jsp"%>
	
	
	<div class="row-fluid">
            <div class="span6">
                <div class="span3">
                </div>
            </div>

            <div class="span6">
                <div class="span12">
                    <h5 style="float: right !important;">
                        <a href="#" style="color: #295780; font-weight: bold;" id="exportTradeInvoice"> Export</a>
                    </h5>
                </div>
            </div>
        </div>
	
	
	<div class="table-responsive">
			<table class="table table-hover tablesorter table-bordered" id="tradeInvoiceTable"> 
				<thead>
					<tr>										
						<th>Invoice Number</th>
						<th>Seller Company</th>
						<th>Date</th>
						<th>Amount</th>
						<th>Duration</th>
						<th>Invoice Company</th>
						<th>FinanceDate</th>
					</tr>
				</thead>
				<tbody>
						<c:forEach items="${invoiceList}" var="invoice">
							<tr>						
								<td>${invoice.invoiceNumber}</td>
								<td>${sellerName}</td>
								<td><fmt:formatDate pattern="dd-MM-yyyy" value="${invoice.invoiceDate}" /></td>
								<td>${invoice.invoiceAmount}</td>
								<td>${invoice.duration}</td>
								<td>${invoice.scfCompany.name}</td>
								<td><fmt:formatDate pattern="dd-MM-yyyy" value="${invoice.financeDate}" /></td>
							</tr>
						</c:forEach>
						
				</tbody>
			</table>
		</div>