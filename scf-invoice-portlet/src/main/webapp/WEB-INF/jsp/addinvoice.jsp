<%@include file="init.jsp"%>






<%-- <div class="row-fluid">
	<div class="span6">
		<select id="scfCompany" name="scfCompany">
		    <option value="" selected="selected" disabled="disabled">Select SCF Company*</option>
			<c:forEach var="company" items="${companyList}">
				<option value="${company.id}">${company.name}</option>
			</c:forEach>			
		</select>
		
	</div>
</div>

<div class="row-fluid">
	<div class="span6">
		<select id="fileType" name="fileType" >
			<option value="" selected="selected" disabled="disabled">Select File Type*</option>
			<option value="XLS">XLS/XLSX</option>	
			<option value="CSV">CSV</option>				   	   
		</select>
	</div>
</div>
<div class="row-fluid">
	<div class="span6">
		<input type="file" name="invoiceDoc" class=" btn btn-file span12" id="invoiceDoc"/>
	</div>
</div> --%>

<div class="modal-body">
	<div class="row-fluid">
		<div class="span12">
			<div class="control-group">
					<label class="control-label" for="selectionStyle"   > Select SCF Company *</label>
					<select class="aui-field-select"   id="scfCompany" name="scfCompany">
						<option value="" selected="selected" disabled="disabled">Select SCF Company*</option>
						<c:forEach var="company" items="${companyList}">
							<option value="${company.id}">${company.name}</option>
						</c:forEach>
				   </select>
			</div>
		</div>
	</div>

	<div class="row-fluid">
		<div class="span12">
			<div class="control-group">
				<label class="control-label" for="selectionStyle"> Select File Type *</label> 
				<select class="aui-field-select"  id="fileType" name="fileType" > 
					<option value="" selected="selected" disabled="disabled">Select File Type*</option>
					<option value="XLS">XLS/XLSX</option>	
					<option value="CSV">CSV</option>
				</select>
			</div>
		</div>
	</div>

	<div class="row-fluid">
		<div class="span12">
			<div id="sampleFileUpload" class="customFileUpload">
				<div class="control-group">
					<label class="control-label" for="fileUploadBtn"></label> 
					<input 	class="field fileUploadManager" id="invoiceDoc"	name="invoiceDoc" type="file" value="">
				</div>
				<div class="control-group">
					<div class="input-append">
						<input class="field disabled fakeFileUploader" disabled="" id="fileUploadFakeBtn1" name="fileUploadFakeBtn1"		placeholder="Upload File" type="text" value=""> 
							<span class="add-on">BROWSE</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<div class="modal-footer">
	<button class="btn btnBrGrSm" data-dismiss="modal" aria-hidden="true">Close</button>
	<!-- <button class="btn btnBgGreenSm" id="uploadInvoices">UPLOAD INVOICE</button> -->
	<input type="button" value="Upload Invoice" class="btn btnBgGreenSm"  id="uploadInvoices"/>
</div>




