<%@include file="init.jsp"%>
<%-- <portlet:actionURL var="createInvoiceURL">
	<portlet:param name="action" value="addInvoice" />
</portlet:actionURL> --%>

<portlet:actionURL var="updateInvoiceURL">
	<portlet:param name="update" value="updateInvoice" />
</portlet:actionURL>
<portlet:renderURL var="createInvoiceURL">
  <portlet:param name="render" value="createInvoice"/>
</portlet:renderURL>
<portlet:renderURL var="invoiceListURL"></portlet:renderURL>

<%-- <liferay-ui:error 	key="invoice.duplicate.error">
	<liferay-ui:message key="invoice.duplicate.number.company"  arguments="${invoice.invoiceNumber}"></liferay-ui:message>
</liferay-ui:error>  --%>
<liferay-ui:error 	key="invoice.duplicate.error" message="${errorMessage}"/>


<div class="alert alert-danger" id="errorMsg">
	<i class="icon-remove-sign icon-2"></i>
</div>


<div class="container-fluid">
	<form:form commandName="invoiceModel" method="post"
		id="createInvoiceForm" name="createInvoiceForm"
		>
		<input type="hidden" id="updateInvoiceURL" value="${updateInvoiceURL}">
        <input type="hidden" id="addInvoiceURL" value="${updateInvoiceURL}">
        
		<input type="hidden" name="invoiceId" value="${invoiceModel.id}">
		<div class="span12">
			<div class="span12"
				style="border-bottom: 1px solid #003d59; margin-bottom: 35px">
				<h4>Create Invoice</h4>
			</div>

		</div>
		<div class="row-fluid">
			<div class="span6">
				<label class="span6">Invoice Number:</label>
				<form:input path="invoiceNumber" cssClass="span6" id="invoiceNumber"  />

			</div>
			<div class="span6">
				<label class="span6">Invoice Date:</label>
				<form:input path="invoiceDate" cssClass="span5" id="invoiceDate" />

			</div>

		</div>
		<div class="row-fluid">
			<div class="span6">
				<label class="span6">Seller Reg No:</label>
				<form:input path="sellerRegNo" cssClass="span6" id="sellerRegNo" />
			</div>
			<div class="span6">
				<label class="span6">Payment Date:</label>
				<form:input path="paymentDate" cssClass="span5" id="paymentDate" />

			</div>
		</div>
		<div class="row-fluid">
			<div class="span6">
				<label class="span6">Invoice Amount:</label>
				<form:input path="invoiceAmount" cssClass="span6" id="invoiceAmount" />
			</div>
			<div class="span6">
				<label class="span6">SCF Company:</label> <select id="scfCompany"
					name="scfCompany" placeholder="SCF Company">
					<option value="">---Select---</option>
					<c:forEach var="company" items="${companyList}">
						<option value="${company.id}"
							<c:if test="${ company.id eq invoiceModel.companyId}">selected="selected" </c:if>>${company.name}</option>
					</c:forEach>
				</select>
			</div>

		</div>

		<div class="row-fluid">

				<c:choose>
					<c:when test="${invoiceModel.id !=null && invoiceModel.id !=0}">
								<div class="span6">
					
						<label class="span6">Duration:</label>

						<form:input path="duration" cssClass="span6" id="duration"
							readonly="true" />
								</div>
							
					</c:when>
				</c:choose>
			<div class="span6">
				<label class="span6">Invoice Description:</label>
				<form:textarea path="invoiceDesc" cssClass="span6" id="invoiceDesc" />

			</div>

		</div>
		<div class="row-fluid">
			<div class="span6">
				<label class="span6">Currency:</label>
				<form:input path="currency" cssClass="span6" id="currency" />
			</div>


		</div>

		<div class="row-fluid">
			<div class="span6">
				<c:choose>
					<c:when test="${invoiceModel.id !=null && invoiceModel.id !=0}">
						<input type="button" value="Update" class="btn btn-primary"
							id="invoiceUpdate" />
						<input type="button" value="Delete" class="btn btn-danger"
							onclick="deleteInvoice()" />
					</c:when>
					<c:otherwise>
						<input type="button" value="Add Invoice" class="btn btn-primary" id="invoiceAdd" />

					</c:otherwise>

				</c:choose>

				<input type="button" value="Go Back" class="btn btn-primary"
					data-url="${invoiceListURL}" id="invoiceback" />
			</div>
		</div>
	</form:form>
</div>