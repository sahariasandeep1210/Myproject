<%@include file="init.jsp"%>

<portlet:actionURL var="importInvoiceURL">
	<portlet:param name="action" value="importInvoice" />
</portlet:actionURL>


	<form:form commandName="invoiceModel" id="importInvoiceForm"  method="post" action="${importInvoiceURL}"  
		name="importInvoicForm" enctype="multipart/form-data" >
	    <input type="file" name="insuranceDoc" />
	   <input type="text" name="docu" />
	    <input type="submit" value="addInvoice" />
	</form:form>