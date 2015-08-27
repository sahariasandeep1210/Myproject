<%@include file="init.jsp"%>

<portlet:actionURL var="importInvoiceURL">
	<portlet:param name="action" value="importInvoice" />
</portlet:actionURL>

<div class="container-fluid">

	<form:form commandName="invoiceModel" id="importInvoiceForm"
		method="post" action="${importInvoiceURL}" name="importInvoicForm"
		enctype="multipart/form-data">


		<div class="row-fluid">
			<div class="span12" style="padding-bottom: 30px;">
				<div class="span4"></div>
				<div class="span4">
					<h4>Upload Invoice</h4>
				</div>
			</div>
		</div>
		<div class="row-fluid">
			<div class="span6">
				<label class="span6">Upload Invoice:</label> <input type="file"
					name="invoiceDoc" />

			</div>

		</div>
		<div class="row-fluid">
			<div class="span6">
				<input type="submit" value="addInvoice" />
			</div>

		</div>




	</form:form>
</div>