<%@include file="init.jsp"%>

<portlet:renderURL var="importInvoiceURL">
	<portlet:param name="render" value="importInvoice" />
</portlet:renderURL>


	<form:form commandName="invoiceModel" id="importInvoiceForm"  method="post"
		action="${importInvoiceURL}"  
		name="importInvoicForm" enctype="multipart/form-data" >
	    <input type="file" name="insuranceDoc">
	    <input type="submit" value="addInvoice">
	</form:form>