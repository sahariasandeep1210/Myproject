<%@include file="init.jsp"%>

<portlet:actionURL var="updateInvoiceURL">
	<portlet:param name="update" value="updateInvoice" />
</portlet:actionURL>
<portlet:renderURL var="createInvoiceURL">
  <portlet:param name="render" value="createInvoice"/>
</portlet:renderURL>
<portlet:actionURL var="deleteInvoiceURL">
  <portlet:param name="delete" value="deleteInvoice"/>
</portlet:actionURL>
<portlet:renderURL var="invoiceListURL"></portlet:renderURL>


<liferay-ui:error 	key="invoice.duplicate.error" message="${errorMessage}"/>
<liferay-ui:error key="invoice.minPaymentDuration.error">
	<liferay-ui:message key="invoice.payment.duration.error"
		arguments="${minPaymentDurationDate}"></liferay-ui:message>
</liferay-ui:error>




<div class="alert alert-danger" id="errorMsg">
	
</div>


<div class="container-fluid">
	<form:form commandName="invoiceModel" method="post"	id="createInvoiceForm" name="createInvoiceForm"	>
		<input type="hidden" id="updateInvoiceURL" value="${updateInvoiceURL}">
        <input type="hidden" id="addInvoiceURL" value="${updateInvoiceURL}">        
		<input type="hidden" name="invoiceId" value="${invoiceModel.id}">
		<input type="hidden" name="userType" value="${userType}" id="userType">
		<input type="hidden" name="deleteInvoiceURL" value="${deleteInvoiceURL}" id="deleteInvoiceURL">
		
	<div class="row-fluid">
			<div class="span12">
				<div class="span12"
					style="border-bottom: 1px solid #003d59; margin-bottom: 35px">
					<h4>
						<c:choose>
							<c:when test="${invoiceModel.id ne null }">	
							View				
						</c:when>
							<c:otherwise>		
							Add			
						</c:otherwise>
						</c:choose>
						Invoice
					</h4>
				</div>
			</div>
		</div>
		
		
		<div class="row-fluid">
			<div class="span6">
				<label class="span6">Invoice Number:</label>
				<form:input path="invoiceNumber" cssClass="span6" id="invoiceNumber"  readonly="${readOnly}" />

			</div>
			<div class="span6">
				<label class="span6">Invoice Date:</label>
				<form:input path="invoiceDate" cssClass="span5" id="invoiceDate"  readonly="${readOnly}" />

			</div>

		</div>
		<div class="row-fluid">
			<div class="span6">
				<label class="span6">Seller Reg No:</label>
				<form:input path="sellerRegNo" cssClass="span6" id="sellerRegNo" readonly="${readOnly}"  />
			</div>
			<div class="span6">
				<label class="span6">Payment Date:</label>
				<form:input path="paymentDate" cssClass="span5" id="paymentDate"  readonly="${readOnly}"/>

			</div>
		</div>
		<div class="row-fluid">
			<div class="span6">
				<label class="span6">Invoice Amount:</label>
				<form:input path="invoiceAmount" cssClass="span6" id="invoiceAmount"  readonly="${readOnly}" />
			</div>
			<div class="span6">
				<label class="span6">SCF Company:</label>
				 <select id="scfCompany"	name="scfCompany"  >
					<option value="" selected="selected" disabled="disabled">SCF Company*</option>
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
						<form:input path="duration" cssClass="span6" id="duration"		readonly="true" />
					</div>

				</c:when>
				</c:choose>
			<div class="span6">
				<label class="span6">Invoice Description:</label>
				<form:textarea path="invoiceDesc" cssClass="span6" id="invoiceDesc" readonly="${readOnly}" />

			</div>

		</div>
		<div class="row-fluid">
			<div class="span6">
				<label class="span6">Currency:</label>
				<form:input path="currency" cssClass="span6" id="currency" readonly="${readOnly}" />
			</div>


		</div>

		<div class="row-fluid">
			<div class="span6">
				<!-- Invoice link won't be visible for Investor so that's why putting condition for only Seller  -->
				<c:if test="${userType ne 'Seller Admin'}">
					<c:choose>
						<c:when test="${invoiceModel.id !=null && invoiceModel.id !=0 && invoiceModel.status eq 'New'}">
							<input type="button" value="Update" class="btn btn-primary"
								id="invoiceUpdate" />
							<input type="button" value="Delete" class="btn btn-danger"
								id="invoiceDelete" />
						</c:when>
						<c:when test="${invoiceModel.id eq null }">
						    	<input type="button" value="Add Invoice" class="btn btn-primary" id="invoiceAdd" />
                         </c:when>					
                   </c:choose>				
				</c:if>
				
				 <input type="button" value="Go Back" class="btn btn-primary"	data-url="${invoiceListURL}" id="invoiceback" />
				
			</div>
		</div>
	</form:form>
</div>