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

<liferay-ui:error key="invoice.minPaymentDuration.invalid">
	<liferay-ui:message key="invoice.payment.duration.invalid"></liferay-ui:message>
</liferay-ui:error>




<div  id="errorMsg">
	
</div>


<div class="tab-content">
	<form:form commandName="invoiceModel" method="post"	id="createInvoiceForm" name="createInvoiceForm"	>
		<input type="hidden" id="updateInvoiceURL" value="${updateInvoiceURL}">
        <input type="hidden" id="addInvoiceURL" value="${updateInvoiceURL}">        
		<input type="hidden" name="invoiceId" value="${invoiceModel.id}">
		<input type="hidden" name="userType" value="${userType}" id="userType">
		<input type="hidden" name="deleteInvoiceURL" value="${deleteInvoiceURL}" id="deleteInvoiceURL">
		<input type="hidden" name="status" value="${invoiceModel.status}"  id="invoicestatus">
		
	<div class="row-fluid">
				<div class="span12"
					style="border-bottom: 1px solid #003d59; margin-bottom: 35px">
					<h2>
						<c:choose>
							<c:when test="${invoiceModel.id ne null }">	
							View				
						</c:when>
							<c:otherwise>		
							Add			
						</c:otherwise>
						</c:choose>
						Invoice
					</h2>
				</div>
		</div>
		
		
		<div class="row-fluid">
			<div class="span3">
				<div class="control-group">
					<label class="control-label">Invoice Number:</label>
					<form:input path="invoiceNumber" cssClass="field" id="invoiceNumber"  readonly="${readOnly}" />
				</div>
			</div>
			<div class="span3">
				<div class="control-group">
					<label class="control-label">Supplier:</label>
					<c:choose>
						<c:when test="${not empty sellerRegList }">
							<select id="sellerRegNo" name="sellerRegNo"
								class="aui-field-select">
								<option value="" selected="selected" disabled="disabled">Select Supplier*</option>
								<c:forEach var="company" items="${sellerRegList}">
									<option value="${company.regNumber}" 
									<c:if test="${company.regNumber eq invoiceModel.sellerRegNo}">selected="selected" </c:if> >${company.name}</option>
								</c:forEach>
							</select>
						</c:when>
						<c:otherwise>
							<form:input path="sellerRegNo" cssClass="field" id="sellerRegNo"
								readonly="${readOnly}" />
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div class="span3">
				<div class="control-group">
					<label class="control-label">Invoice Amount:</label>
					<form:input path="invoiceAmount" cssClass="field" id="invoiceAmount"  readonly="${readOnly}" />
				</div>
			</div>		

		</div>
		
		
		<div class="row-fluid">			
				
			<div class="span3">
				<div class="control-group">
					<label class="control-label">Invoice Date:</label>
					<div class="input-append">						
							<form:input path="invoiceDate" cssClass="field" id="invoiceDate"  readonly="${readOnly}" />
							<span	class="add-on" ><i	class="icomoon-calendar"></i></span>
					</div>
				</div>
			</div>
			<div class="span3">
				<div class="control-group">
				<label class="control-label">Payment Date:</label>				
						<div class="input-append">						
								<form:input path="paymentDate" cssClass="field" id="paymentDate"  readonly="${readOnly}"/>
								<span	class="add-on" ><i	class="icomoon-calendar"></i></span>
						</div>
				</div>
			</div>				
				<c:choose>
					<c:when test="${invoiceModel.id !=null && invoiceModel.id !=0}">
					<div class="span3">
						<div class="control-group">
							<label class="control-label">Duration:</label>
							<form:input path="duration" cssClass="field" id="duration"		readonly="true" />
						</div>
					</div>
				</c:when>
				</c:choose>
		</div>
		<div class="row-fluid">
			
			<div class="span3">
				<div class="control-group">
					<label class="control-label">SCF Company:</label>
					 <select id="scfCompany"	name="scfCompany"  class="aui-field-select" >
						<option value="" selected="selected" disabled="disabled">SCF Company*</option>
						<c:forEach var="company" items="${companyList}">
							<option value="${company.id}"
								<c:if test="${ company.id eq invoiceModel.scfCompany}">selected="selected" </c:if>>${company.name}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			
			<div class="span3">
				<div class="control-group">
				<label class="control-label">Currency:</label>
				<form:input path="currency" cssClass="field" id="currency" readonly="true" />
				</div>
			</div>
			
			<div class="span3">
				<div class="control-group">
				<label class="control-label">Invoice Description:</label>
				<form:textarea path="invoiceDesc" cssClass="field" id="invoiceDesc" readonly="${readOnly}" />
				</div>

			</div>

		</div>	

		<div class="row-fluid">
			<div class="span6">
				<!-- Invoice link won't be visible for Investor so that's why putting condition for only Seller  -->
				<c:if test="${LIFERAY_SHARED_userRole ne 'Seller Admin'}">				
					<c:choose>
						<c:when test="${invoiceModel.id !=null && invoiceModel.id !=0 && invoiceModel.status eq 'New'}">
							<input type="button" value="Update" class="btn btnBgBuSm"
								id="invoiceUpdate" />
							<input type="button" value="Delete" class="btn btnBgRedSm"
								id="invoiceDelete" />
						</c:when>
						<c:when test="${invoiceModel.id eq null || invoiceModel.id ==0 }">
						    	<input type="button" value="Add Invoice" class="btn btnBgGreenSm" id="invoiceAdd" />
                         </c:when>					
                   </c:choose>				
				</c:if>
				
				 <input type="button" value="Go Back" class="btn btnBgBuSm"	data-url="${invoiceListURL}" id="invoiceback" />
				
			</div>
		</div>
	</form:form>
</div>