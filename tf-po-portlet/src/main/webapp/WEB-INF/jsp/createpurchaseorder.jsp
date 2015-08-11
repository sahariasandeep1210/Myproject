<%@include file="init.jsp"%>

<portlet:actionURL var="addPurchaseOrderURL">
	<portlet:param name="action" value="addPurchaseOrder" />
</portlet:actionURL>



<div class="container-fluid">
	<c:if test="${create eq 'success' && purchaseOrderDTO.id !=null}">
		<div class="alert alert-success">Purchase order has been successfully added.Please click on Upload Documents to upload relevant documents </div>
	</c:if>
	<form:form commandName="purchaseOrderDTO" method="post"
		action="${addPurchaseOrderURL}" id="purchaseOrderForm" 
		name="purchaseOrderForm" enctype="multipart/form-data" >


		<div class="row-fluid">
			<div class="span12" style="padding-bottom: 30px;">
				<div class="span4"></div>
				<div class="span4">
					<h4>Add Purchase Order</h4>
				</div>
			</div>
		</div>

		<div class="row-fluid">
			<div class="span6">
				<label class="span6">Seller:</label> <input type="hidden" name="id"
					value="${purchaseOrderDTO.id}" />
				<form:input path="sellerId" cssClass="span6" />

			</div>
			<div class="span6">
				<label class="span6">Debtor Company:</label>
				<form:input path="debtorCompany" cssClass="span6" />
			</div>
		</div>		
		<div class="row-fluid">
			<div class="span6">
				<label class="span6">PO Number:</label>
				<form:input path="poNumber" cssClass="span6" />

			</div>
			<div class="span6">
				<label class="span6">PO Date</label>
				<form:input path="poDate" cssClass="span6" />
			</div>
		</div>
		<div class="row-fluid">
			<div class="span6">
				<label class="span6">PO Amount:</label>
				<form:input path="poAmount" cssClass="span6" />

			</div>
			<div class="span6">
				<label class="span6">PO Days</label>
				<form:input path="poDays" cssClass="span6" />
			</div>
		</div>

		<div class="row-fluid">
			<div class="span6">
				<label class="span6">PO Notes:</label>
				<form:textarea path="poNotes" cssClass="span6" />
			</div>

		</div>
		
		
		<c:choose>
			<c:when test="${purchaseOrderDTO.id == null}">
				<div class="row-fluid">
					<div class="span6">
						<input type="submit" value="Add Purchase order"
							class="btn btn-primary" data-url="${addPurchaseOrderURL}"
							id="addPO" />
					</div>
				</div>
			</c:when>
			<c:otherwise>				
					<input type="hidden" name="uploadDocments"
					value="true" />
				<div class="row-fluid">
					<div class="span6" style="float: right;">
						<h4>
							<span id="uploadSpan"><i class="fa fa-upload fa-1"></i> Upload Documents</span>
						</h4>
					</div>
				</div>
				
				<div class="table-responsive" id="uploadTableDiv">
					<table class="table table-hover  table-bordered">
						<thead>
							<tr>
								<th>Document Name</th>
								<th>Document</th>
								<th>Upload Date</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>Insurance</td>
								<td> <input type="file" name="insuranceDoc"> </td>
								<td></td>
							</tr>
							<tr>
								<td>Invoice</td>
								<td> <input type="file" name="invoiceDoc"> </td>
								<td></td>
							</tr>
							<tr>
								<td>Delivery Note</td>
								<td> <input type="file" name="deliveryNoteDoc"> </td>
								<td></td>
							</tr>
							<tr>
								<td>Shipping</td>
								<td> <input type="file" name="shippingDoc"> </td>
								<td></td>
							</tr>
							<tr>
								<td>Letter of Credit</td>
								<td> <input type="file" name="locDoc"> </td>
								<td></td>
							</tr>
							<tr>
								<td>Contract</td>
								<td> <input type="file" name="contractDoc"> </td>
								<td></td>
							</tr>
						</tbody>
					</table>
				</div>
				
				<div class="span6">
						<input type="submit" value="Update Purchase order"
							class="btn btn-primary" data-url="${addPurchaseOrderURL}"
							id="updatePO" />
					</div>
			</c:otherwise>
		
		</c:choose>
		
		</form:form>
		


</div>