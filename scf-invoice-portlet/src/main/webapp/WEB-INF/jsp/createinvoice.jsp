<%@include file="init.jsp"%>
<portlet:actionURL var="createInvoiceURL">
	<portlet:param name="action" value="addInvoice" />
</portlet:actionURL>

<portlet:renderURL var="invoiceListURL"></portlet:renderURL>

<div class="alert alert-danger" id="errorMsg"><i class="icon-remove-sign icon-2"></i> </div>

<div class="container-fluid">
	<form:form commandName="invoiceModel" method="post" id="createInvoiceForm" 
		name="createInvoiceForm"  action="${createInvoiceURL}">
		<input type="hidden" name="invoiceId"  value="${invoiceModel.id}">
		<div class="span12">
					<div class="span12" style="border-bottom: 1px solid #003d59; margin-bottom: 35px">
						<h4 >Create Invoice</h4>
					</div>		
								
		</div>
		<div class="row-fluid">
			<div class="span6">
				<label class="span6">Invoice Number:</label>
				<form:input path="invoiceNumber" cssClass="span6"  id="invoiceNumber"/>

			</div>
			<div class="span6">
				<label class="span6">Invoice Date:</label>
				<fmt:formatDate pattern="dd-MM-yyyy" value="${invoiceModel.invoiceDate}" var="invoiceDat"/>
				<form:input path="invoiceDate" cssClass="span5" id="invoiceDate" value="${invoiceDat}" />

			</div>

		</div>
				<div class="row-fluid">
			<div class="span6">
				<label class="span6">Seller Reg No:</label>
				<form:input path="sellerRegNo" cssClass="span6"  id="sellerRegNo"/>

			</div>
			<div class="span6">
				<label class="span6">Seller VAT Number:</label>
				<form:input path="sellerVatNumber" cssClass="span6" id="sellerVatNumber" />

			</div>

		</div>
				<div class="row-fluid">
			<div class="span6">
				<label class="span6">Invoice Amount:</label>
				<form:input path="invoiceAmount" cssClass="span6" id="invoiceAmount" />

			</div>
			<div class="span6">
				<label class="span6">VAT Amount:</label>
				<form:input path="vatAmount" cssClass="span6"  id="vatAmount"/>

			</div>

		</div>
				<div class="row-fluid">
			<div class="span6">
				<label class="span6">Duration:</label>
				<form:input path="duration" cssClass="span6"  id="duration"/>

			</div>
			<div class="span6">
				<label class="span6">Payment Date:</label>
				<fmt:formatDate pattern="dd-MM-yyyy" value="${invoiceModel.paymentDate}" var="paymentDat"/>
				<form:input path="paymentDate" cssClass="span5" id="paymentDate" value="${paymentDat}" />

			</div>

		</div>
		<div class="row-fluid">
			<div class="span6">
				<label class="span6">Currency:</label>
				<form:input path="currency" cssClass="span6"  id="currency"/>
			</div>	
			<div class="span6">
				<label class="span6">SCF Company:</label>
			<select id="scfCompany" name="scfCompany"  placeholder="SCF Company">
				<option value="">---Select---</option>
				<c:forEach var="company" items="${companyList}">
					<option value="${company.id}" <c:if test="${ company.id eq invoiceModel.companyId}">selected="selected" </c:if>>${company.name}</option>
				</c:forEach>			
			</select>
			</div>	

		</div>
		<div class="row-fluid">
				<div class="span6">
				<label class="span6">Due Date:</label>
				 <fmt:formatDate pattern="dd-MM-yyyy" value="${invoiceModel.dueDate}" var="dueDat"/>
				
				<form:input path="dueDate" cssClass="span5" id="dueDate" value="${dueDat}" />

			</div>
			<div class="span6">
				<label class="span6">Invoice Description:</label>
				<form:textarea path="invoiceDesc" cssClass="span6" id="invoiceDesc" />

			</div> 
		</div>
		
		<div class="row-fluid">
			<div class="span6">
				<c:choose>
					<c:when test="${invoiceModel.id !=null && invoiceModel.id !=0}">
						<input type="submit" value="Update" class="btn btn-primary"
							data-url="${createInvoiceURL}" id="invoiceUpdate" />
						<input type="button" value="Delete" class="btn btn-danger" onclick="deleteInvoice()" />
					</c:when>
					<c:otherwise>
						<input type="button" value="Add Invoice" class="btn btn-primary"
							data-url="${createInvoiceURL}" id="invoiceAdd" />
							
					</c:otherwise>

				</c:choose>

			<input type="button" value="Go Back" class="btn btn-primary"
						data-url="${invoiceListURL}" id="invoiceback" />
			</div>
		</div>
	</form:form>
</div>