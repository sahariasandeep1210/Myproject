<%@include file="init.jsp"%>
<%@include file="tabview.jsp"%>

<portlet:actionURL var="saveInvestorBalance">
	<portlet:param name="action" value="saveInvestorBalance" />
</portlet:actionURL>
<div class="container-fluid">
 <form:form method="post" commandName="investorBalanceModel"
		class="form-horizontal" name="investorBalanceForm" id="investorBalance">
		      <input type="hidden" id="balanceURL" name="balanceURL" value="${balanceURL}"/>
		      <input type="hidden" value="${saveInvestorBalance}" id="saveInvestorBalanceURL" />
		      		<input type="hidden" value="${investorBalanceModel.id}" name="id" />
		      
		      
		<div class="row-fluid">
          <div class="span6">
              <label class="span6">Investor Name :</label>
			<select id="investorName " name="investorName"  placeholder="investorName">
				<option value="">---Select---</option>
			<c:forEach var="company" items="${companies}">
			     <option value="${company.id}">${company.name}</option>
			</c:forEach>
			</select>
           </div>
       </div>
       
		<div class="row-fluid">
			<div class="span6">
				<label class="span6">Cash Position:</label>
				   
	         </div>
		</div>
		<div class="row-fluid">
			<div class="span6">
				<label class="span6">Receivables Position:</label>
			</div>
		</div>
		<div class="row-fluid">
			<div class="span6">
				<label class="span6">Total Asset Value:</label>
			</div>
		</div>
		<div class="row-fluid">
          <div class="span6">
              <label class="span6">Action :</label>
			<select id="action " name="action"  placeholder="action">
				<option value="">---Select---</option>
					<option value="0" >Deposit </option>
					<option value="1" >Withdrawl </option>
					
			</select>
           </div>
       </div>
       <div class="row-fluid">
			<div class="span6">
				<label class="span6">Transaction Amount :</label>
				<input type="text" value="" name="amount" id="transactionAmount" class="span6">
				
			</div>
		</div>
		 <div class="row-fluid">
			<div class="span6">
				<label class="span6">Date:</label>
				<input type="text" name="transcationDate"  id="balanceDate" class="span6"/>

			</div>
			</div> 
		<div class="row-fluid">
			<div class="span6" id="buttons">
				<input type="button" value="Submit" id="updatebalance" class="btn btn-primary" />
				<input type="button" value="Cancel" id="cancelSetting" class="btn btn-primary" />
		 </div>
	</div>
	<br>
	<div class="table-responsive">
			<table class="table  tablesorter table-bordered" id="settingListTable">
				<thead>
					<tr>
					    <th>Cash Position</th>
						<th>Receivables Position</th>
						<th>Total Asset Value</th>
						<th>Transaction Type</th>
						<th>Transaction Amount</th>	
						<th>Transaction Date</th>	
						
					</tr>
				</thead>
				</table>
	</div>
		</form:form>
 </div>