<%@include file="init.jsp"%>
<portlet:actionURL var="importInvoiceURL">
	<portlet:param name="action" value="importInvoice" />
</portlet:actionURL>

<portlet:actionURL var="saveInvoicesURL">
	<portlet:param name="action" value="saveInvoices" />
</portlet:actionURL>
<liferay-ui:error key="default-error-message" 		message="default.error.message" /> 
<%@include file="tabview.jsp"%>

<div class="row-fluid">
				<div class="span12" >
					<div class="span4"><h4>Manage Invoice Documents</h4></div>		
								
				</div>
</div>

<div class="container-fluid" style=" padding: 0px;">
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
				<c:choose>
						<c:when test="${fn:length(invoiceList) gt 0}">
						<c:forEach items="${invoiceList}" var="invoice">
								<c:set var="url" value="${invoice.documentUrl}" scope="page" />
							<tr>
								<td> <a href="${url}" class="file-download">${invoice.documentName}</a></td>
								<td>${invoice.uploadedby}</td>
								<td><fmt:formatDate pattern="dd-MM-yyyy" value="${invoice.uploadDate}" /></td>
		
							</tr>
						</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="3" align="center">No records found!</td>
							</tr>
						</c:otherwise>
				</c:choose>
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
	<div id="wrapperfirst" class="hideclass">
		<div id="myModal" class="modal  fade" tabindex="-1" role="dialog"	aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h3 id="myModalLabel">Upload Invoice</h3>
			</div>
			<div class="modal-body">
				<%@include file="addinvoice.jsp"%>
			</div>
			<div class="modal-footer">
				<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
				<input type="button" value="Upload Invoice" class="btn btn-primary"  id="uploadInvoices"/>
			</div>
		</div>
	</div>


</form:form>

<c:if test="${documentUpload}">
<div id="wrappersecond" class="hideclass">
	<form:form  id="saveInvoiceForm" method="post" action="${saveInvoicesURL}" name="saveInvoicForm" >
		<div id="confirmationModel" class=" modal fade" tabindex="-1"
			role="dialog" aria-labelledby="confirmationModelLabel"
			aria-hidden="true">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" id="first"
					aria-hidden="true">×</button>
				<h3 id="myModalLabel">Invoice Preview</h3>
			</div>
			<div class="modal-body">
				<%@include file="invoicelisttablepreview.jsp"%>
			</div>
			<div class="modal-footer">
				<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
				<input type="submit" value="Save Invoices" class="btn btn-primary" id="last"/>
			</div>
		</div>
	</form:form>
	</div>
</c:if>


