<%@include file="init.jsp"%>






<div class="row-fluid">
	<div class="span6">
		<label class="span6">SCF Company:</label> 
		<select id="scfCompany" name="scfCompany"  placeholder="SCF Company">
			<option value="">---Select---</option>
			<c:forEach var="company" items="${companyList}">
				<option value="${company.id}">${company.name}</option>
			</c:forEach>			
		</select>
		
	</div>
</div>

<div class="row-fluid">
	<div class="span6">
		<label class="span6">File Type:</label> 
		<select id="fileType" name="fileType"  placeholder="File Type">
			<option value="CSV">CSV</option>
			<option value="XLS">XLS/XLSX</option>		   	   
		</select>
	</div>
</div>
<div class="row-fluid">
	<div class="span6">
		<label class="span6">Invoices Documents</label> 
		<input type="file" name="invoiceDoc" class=" btn btn-file span6" />
	</div>
</div>




