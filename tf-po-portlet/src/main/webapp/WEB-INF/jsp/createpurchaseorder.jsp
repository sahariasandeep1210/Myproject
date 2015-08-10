<%@include file="init.jsp"%>

<portlet:actionURL var="addPurchaseOrderURL">
	<portlet:param name="action" value="addPurchaseOrder" />
</portlet:actionURL>

<div class="container-fluid">
	<c:if test="${create eq 'success' && purchaseOrderModel.id !=null}">
		<div class="alert alert-success">Purchase order has been successfully added.Please create on Upload Documents to upload relevant documents </div>
	</c:if>
	<form:form commandName="purchaseOrderModel" method="post"
		action="${addPurchaseOrderURL}" id="createUser" autocomplete="off"
		name="purchaseOrderForm">


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
					value="${purchaseOrderModel.id}" />
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
			<c:when test="${purchaseOrderModel.id == null}">
				<div class="row-fluid">
					<div class="span6">
						<input type="submit" value="Add Purchase order"
							class="btn btn-primary" data-url="${addPurchaseOrderURL}"
							id="addPO" />
					</div>
				</div>
			</c:when>
			<c:otherwise>
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
								<td>Insurance Documents</td>
								<td> <input type="file" name="file"> </td>
								<td></td>
							</tr>
						</tbody>
					</table>
				</div>

			</c:otherwise>
		</c:choose>
		
		
		
	</form:form>


</div>