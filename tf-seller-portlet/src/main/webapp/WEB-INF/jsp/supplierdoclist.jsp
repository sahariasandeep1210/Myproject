<%@include file="init.jsp"%>
<portlet:actionURL var="importCompanyURL">
	<portlet:param name="action" value="importCompany" />
</portlet:actionURL>

<portlet:actionURL var="saveCompanyURL">
	<portlet:param name="action" value="saveCompanys" />
</portlet:actionURL>
<liferay-ui:error key="default-error-message" 		message="default.error.message" /> 
<%@include file="suppliertabview.jsp"%>
<div class="tab-content">
	
	
	<div class="title-container clearfix">
		  	
		  	<div class="main-title">Manage Company Documents</div>
		  	
		  	<div class="btn-wrapper">		  			
		  			<input type="button" class="btnBgGreenSm" value="Export" id="exportCompanyDocs" />
		  	</div>
		  	
	</div>

		<div class="customTableContainer" >
				<table class="table table-hover tablesorter table-bordered" id="companyDocTable">
					<thead>
						<tr>
							<th>Name</th>
							<th>Uploaded By</th>
							<th>Upload date</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
								<c:when test="${fn:length(companyDocumentList) gt 0}">
								<c:forEach items="${companyDocumentList}" var="companyDocument">
										<c:set var="url" value="${companyDocument.documentUrl}" scope="page" /> 
									 <tr>
										<td> <a href="${url}" class="file-download">${companyDocument.documentName}</a></td>
										<td>${companyDocument.uploadedby}</td>
										<td><fmt:formatDate pattern="dd-MM-yyyy" value="${companyDocument.uploadDate}" /></td>
				
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
		  				 	<a href="#myModal" class="btn btnBgGreenSm"  data-toggle="modal" type="button" >Upload Company </a>
		  			</div>		  			
		  		</div>
		  	</div>
			
			
			
		</div>
</div>
<form:form commandName="companyModelDetail" id="imporCompanyForm"
	method="post" action="${importCompanyURL}" name="imporCompanyForm"
	enctype="multipart/form-data">
	
		<div id="myModal" class="modal  fade customModal" 
			role="dialog" aria-labelledby="myModalLabel"  tabindex="-1"
			aria-hidden="true">
			<div class="modal-header">
				<button type="button" class=" icomoon-close close"
					data-dismiss="modal" aria-hidden="true"></button>
				UPLOAD COMPANY
				
			</div>
			<%@include file="addsupplier.jsp"%>

		</div>


	</form:form>
<c:if test="${documentUpload}">
<div id="wrappersecond" class="hideclass">
 	<form:form  id="saveInvoiceForm" method="post" action="${saveCompanyURL}" name="saveInvoicForm" >
		<div id="confirmationModel" class=" modal fade customModal" tabindex="-1"
			role="dialog" aria-labelledby="confirmationModelLabel"
			aria-hidden="true">
			<div class="modal-header">
				<!-- <button type="button" class=" icomoon-close close" data-dismiss="modal" 
					aria-hidden="true">×</button> -->
					<button type="button" class=" icomoon-close close"	data-dismiss="modal" id="first" aria-hidden="true"></button>
				<h3 id="myModalLabel">Company Preview</h3>
			</div>
			<c:choose>
				<c:when test="${errorOccured}">
					 <div class="tab-content">	
                  	<div class="row-fluid">
				   			<div class="span12">
				   				<div class="labelBigTextContaier spacer border">
						   			<div class="smallLabelText">
						   				Error occured while importing Company.Please validate your file.
						   			</div>	   			
						   			
						   		</div>	
				   			</div>
				   		</div>
                  </div>
				</c:when>
				<c:otherwise>
					 <%@include file="companylisttablepreview.jsp"%> 
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

