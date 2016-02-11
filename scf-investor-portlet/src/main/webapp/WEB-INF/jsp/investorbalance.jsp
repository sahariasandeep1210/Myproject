<%@include file="init.jsp"%>
<%@include file="tabview.jsp"%>
<div class="container-fluid">
<%-- <form:form method="post" 
		class="form-horizontal" name="investorBalanceForm" id="investorBalance">
		 --%>
		<div class="row-fluid">
          <div class="span6">
              <label class="span6">Investor Name :</label>
			<select id="investorName " name="investorName"  placeholder="investorName">
				<option value="">---Select---</option>
					<option value="" ></option>
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
			</div>
		</div>
		 <div class="row-fluid">
			<div class="span6">
				<label class="span6">Date:</label>
				<input type="text" name="balanceDate"  id="balanceDate" />

			</div>
			</div> 
		<div class="row-fluid">
			<div class="span6">
				<input type="button" value="Submit" id="updatebalance" class="btn btn-primary" />
			</div>
			<div class="span6">
				<input type="button" value="Cancel" id="cancelSetting" class="btn btn-primary" />
			</div>
		</div>
<%-- 		</form:form>
 --%></div>