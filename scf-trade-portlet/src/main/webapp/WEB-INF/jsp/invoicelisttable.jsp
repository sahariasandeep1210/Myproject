<%@include file="init.jsp"%>
	
<div id="myToggler" class="customToggler">
  <div class="toggleHeader toggler-header-collapsed">
  	<div class="toggle-title pull-left">Invoice within Trade</div>
  	<div class="toggle-icon-container text-right">
  		<i class="icomoon-accordian-arrow-down"></i>
  	</div>
  	
  </div>
  <div class="toggleContent toggler-content-collapsed">
  	<div class="row-fluid">
  		<div class="span12 text-right">
  			<div class="actionContainer noBorder pt0">
  				<aui:button cssClass="btnBgGreenSm" value="Export" id="exportInvoices"></aui:button>
  			</div>
  			
  		</div>
  	</div>
  	
  	<div class="customTableContainer">
	  	<table id="tradeInvoiceTable" class="tablesorter table">
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
								<td class="text-center"><fmt:formatDate pattern="dd-MM-yyyy" value="${invoice.invoiceDate}" /></td>
								<td class="blue_normal rightalign"><fmt:formatNumber type="number" maxFractionDigits="3" value="${invoice.invoiceAmount}"  pattern="#,##0.00"/></td>
								<td class="text-center">${invoice.duration}</td>
								<td>${invoice.scfCompany.name}</td>
								<td><fmt:formatDate pattern="dd-MM-yyyy" value="${invoice.financeDate}" /></td>
							</tr>
						</c:forEach>
				
			</tbody>
		</table>
	  </div>
  </div>

  
</div>
	
