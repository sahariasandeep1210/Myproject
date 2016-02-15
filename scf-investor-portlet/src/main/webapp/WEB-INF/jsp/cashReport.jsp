<%@include file="init.jsp"%>


<div class="container-fluid">

<form:form method="post" commandName="cashReportModel"
		class="form-horizontal" name="cashReportForm" id="cashReport">      
		
       
		<div class="row-fluid">
			<div class="span6">
				<label class="span6">Cash Position:</label>
				   
	        </div>
	         
			<div class="span6">
				<label class="span6">Total Asset Value:</label>
			</div>
		</div>
		<div class="row-fluid">
			<div class="span6">
				<label class="span6">Receivables Position:</label>
			</div>
		</div>
		<div class="row-fluid">
			<div class="span6">
				<label class="span6">Current Balance :</label>
			</div>
		</div>
	  <div class="row-fluid">
	         <div class="span6">
                <label class="span6">Select Date Range :</label>
               From:<br><input name="fromDate" class="span9" id="fromDate"/>
             </div>
		<div class="span6">
                
               To:<br><input name="toDate" Class="span9" id="toDate"/>
                
	     </div>
	  </div>
		<br>
		
		<div class="row-fluid">
          <div class="span6">
              <label class="span6">Select Transaction Type :</label>
			<select id="transaction " name="transaction">
				<option value="">---Select---</option>
					<option value="0" >Deposit </option>
					<option value="1" >Withdrawl </option>
					
			</select>
           </div>
       </div>
       <div class="row-fluid">
			<div class="span6">
				<label class="span6">Total Selected :</label>
			</div>
	 </div>
	 <div class="row-fluid">
			<div class="span6" id="buttons">
				<input type="button" value="Submit" id="cashReport" class="btn btn-primary" />
		 </div>
	</div>
		<br>
	
	<div class="table-responsive">
			<table class="table  tablesorter table-bordered" id="cashReportTable">
				<thead>
					<tr>
					    <th>Date</th>
						<th>Transaction Type</th>
						<th>TRADE ID</th>
						<th>Amount</th>
						<th>Reference</th>	
						
					</tr>
				</thead>
				</table>
	</div>
	</form:form>
</div>
