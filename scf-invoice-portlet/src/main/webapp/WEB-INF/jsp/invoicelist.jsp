<%@include file="init.jsp"%>
<portlet:actionURL var="importInvoiceURL">
	<portlet:param name="action" value="importInvoice" />
</portlet:actionURL>
<div class="container-fluid">
	<div class="table-responsive">
		<table class="table table-hover tablesorter table-bordered">
			<thead>
				<tr>
					<th>Name</th>
					<th>Uploaded By</th>
					<th>Upload date</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${invoiceList}" var="invoice">
					<tr>
						<td>${invoice.name}</td>
						<td>${invoice.regNumber}</td>
						<td>${invoice.addRegistered}</td>

					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<div class="row-fluid">
		<!-- <a href="#myModal" role="button" class="btn btn-primary" data-toggle="modal">Upload Invoice</a> -->
		<input type="button" value="Upload Invoice"	class="btn btn-primary" id="updateInvoice" />
	</div>
	
	
	
</div>

<!-- Modal -->


	<form:form commandName="invoiceModel" id="importInvoiceForm"
		method="post" action="${importInvoiceURL}" name="importInvoicForm"
		enctype="multipart/form-data">

<div id="myModal" class="modal  fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h3 id="myModalLabel">Upload Invoice</h3>
  </div>
  <div class="modal-body">
    <%@include file="addinvoice.jsp"%>
  </div>
  <div class="modal-footer">
    <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
   <input type="submit" value="Upload Invoice" class="btn btn-primary" />
  </div>
</div>


	</form:form>

