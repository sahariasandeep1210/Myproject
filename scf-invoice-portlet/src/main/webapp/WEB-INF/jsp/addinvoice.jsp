<%@include file="init.jsp"%>






<div class="row-fluid">
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
</div>




