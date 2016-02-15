
<%@page import="com.tf.persistance.util.TranscationStatus"%>
<%@include file="init.jsp"%>
 <%@include file="tabview.jsp"%> 



<portlet:actionURL var="addInvtranscationURL">
	<portlet:param name="action" value="addInvtranscation"/>
</portlet:actionURL>

<portlet:renderURL var="cashReportURL">
    <portlet:param name="render" value="cashReport" />
</portlet:renderURL>

<div class="container-fluid">
 <form:form method="post" commandName="investorBalanceModel"
		class="form-horizontal" name="investorBalanceForm" id="investorBalanceForm" action="${addInvtranscationURL}">
		      <input type="hidden" value="${investorBalanceModel.id}" name="id" />
		      
		      
		<div class="row-fluid">
          <div class="span6">
              <label class="span6">Investor Name :</label>
			<select id="investorName " name="investorName"  >
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
	         
	         <div class="span6">
	             <a href="javascript:void(0);" onclick="window.location.href='${cashReportURL}&investorID='">Cash Report</a>
	         
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
			<select id="transcationType " name="transcationType" >
				<option value="">---Select---</option>
					<option value="<%=TranscationStatus.DEPOSIT.getValue() %>" >Deposit </option>
					<option value="<%=TranscationStatus.WITHDRAWAL.getValue()%>" >Withdrawl </option>
					
			</select>
           </div>
       </div>
       <div class="row-fluid">
			<div class="span6">
				<label class="span6">Transaction Amount :</label>
					<form:input path="amount" cssClass="span9" id="transactionAmount"/>
				
				
			</div>
		</div>
		 <div class="row-fluid">
			<div class="span6">
				<label class="span6">Date:</label>
				<form:input path="transcationDate" cssClass="span9" id="balanceDate"/>
				
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
				<tbody>
					<c:forEach items="${investorTransactions}" var="investorTransaction">
						<tr>
							
							<td></td>
							<td></td>
							<td></td>
							<td>${investorTransaction.transcationType}</td>
							<td>${investorTransaction.amount}</td>
							<td><fmt:formatDate pattern="dd-MM-yyyy" value="${investorTransaction.transcationDate}" /></td>
							
						</tr>
					</c:forEach>
				</tbody>
				</table>
	</div>
		</form:form>
 </div>