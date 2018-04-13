<%@include file="init.jsp"%>
<portlet:actionURL var="importInvoiceURL">
	<portlet:param name="action" value="importInvoice" />
</portlet:actionURL>

<portlet:actionURL var="saveInvoicesURL">
	<portlet:param name="action" value="saveInvoices" />
</portlet:actionURL>
<liferay-ui:error key="default-error-message" 		message="default.error.message" /> 
<%@include file="tabview.jsp"%>
<div class="tab-content">
	
	
	<div class="title-container clearfix">
		  	
		  	<div class="main-title">Manage Invoice Documents</div>
		  	
		  	<div class="btn-wrapper">		
		  			<input type="button" class="btnBgGreenSm" value="Export" id="exportInvoiceDocs" />
		  	</div>
		  	
	</div>

		<div class="customTableContainer" >
				<table class="table table-hover tablesorter table-bordered" id="invoiceDocTable">
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
			
			
			<div class="row-fluid" >
		  		<div class="span12">
		  			<div class="actionContainer noBorder text-left">		  				
		  				 <!-- <input type="button" value="Upload Invoice"	class="btnBgBuSm" id="updateInvoice" /> -->
		  				 	<a href="#myModal" class="btn btnBgGreenSm"  data-toggle="modal" type="button" >Upload Invoice </a>
		  			</div>		  			
		  		</div>
		  	</div>
			
			
			
		</div>
</div>
<form:form commandName="invoiceModel" id="importInvoiceForm"
	method="post" action="${importInvoiceURL}" name="importInvoicForm"
	enctype="multipart/form-data">
	
		<div id="myModal" class="modal  fade customModal" 
			role="dialog" aria-labelledby="myModalLabel"  tabindex="-1"
			aria-hidden="true">
			<div class="modal-header">
				<button type="button" class=" icomoon-close close"
					data-dismiss="modal" aria-hidden="true"></button>
				UPLOAD INVOICE
				
			</div>
			<%@include file="addinvoice.jsp"%>

		</div>


	</form:form>

<c:if test="${documentUpload}">
<div id="wrappersecond" class="hideclass">
	<form:form  id="saveInvoiceForm" method="post" action="${saveInvoicesURL}" name="saveInvoicForm" >
		<div id="confirmationModel" class=" modal fade customModal" tabindex="-1"
			role="dialog" aria-labelledby="confirmationModelLabel"
			aria-hidden="true">
			<div class="modal-header">
				<!-- <button type="button" class=" icomoon-close close" data-dismiss="modal" 
					aria-hidden="true">×</button> -->
					<button type="button" class=" icomoon-close close"	data-dismiss="modal" id="first" aria-hidden="true"></button>
				<h3 id="myModalLabel">Invoice Preview</h3>
			</div>
			<c:choose>
				<c:when test="${errorOccured}">
					 <div class="tab-content">	
                  	<div class="row-fluid">
				   			<div class="span12">
				   				<div class="labelBigTextContaier spacer border">
						   			<div class="smallLabelText">
						   				Error occured while importing invoices.Please validate your file.
						   			</div>	   			
						   			
						   		</div>	
				   			</div>
				   		</div>
                  </div>
				</c:when>
				<c:otherwise>
					<%@include file="invoicelisttablepreview.jsp"%>
				</c:otherwise>
			</c:choose>
				
			
		</div>
	</form:form>
	</div>
</c:if>


<aui:script>
AUI().ready(function() {
	
	fileUploadmanagerObj1 = new fileUploadmanager("#sampleFileUpload",function(obj){
		//file upload change event
	});
});
</aui:script>

