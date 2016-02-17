<%@page import="com.tf.persistance.util.TranscationStatus"%>
<%@page import="org.springframework.transaction.TransactionStatus"%>
<%@include file="init.jsp"%>

<portlet:actionURL var="getCashURL">
  <portlet:param name="cash" value="getCashReport"/>
</portlet:actionURL>
<portlet:renderURL var="cashURL">
<portlet:param name="render" value="cashReport"/>

</portlet:renderURL>
<div class="container-fluid">

<form:form method="post" commandName="cashReportModel"
		class="form-horizontal" name="cashReportForm" id="cashReportForm"> 
		      <input type="hidden" value="${getCashURL}" id="getCashReports" />
		      <input type="hidden" name="currentPage"  id="currentPage"   value="${paginationModel.currentPage}" />
		      <input type="hidden" name="noOfRecords"  id="noOfRecords"  value="${paginationModel.noOfRecords}" />
		      <input type="hidden" name="companyId" value="${companyname.id}">
       		<div class="row-fluid">
       		 <div class="span6">
				<label class="span6">Investor Name:</label>
				   ${companyname.name} 
	          </div>
	         
       </div>
		<div class="row-fluid">
			<div class="span6">
				<label class="span6">Cash Position:</label>
				   
	        </div>
	    </div>
	    <div class="row-fluid">
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
              <input name="fromDate" class="span9" id="fromDate" placeholder="From"/>
             </div>
		<div class="span6">
                
              <input name="toDate" Class="span9" id="toDate" placeholder="To"/>
                
	     </div>
	  </div>
		<br>
		
		<div class="row-fluid">
          <div class="span6">
              <label class="span6">Select Transaction Type :</label>
			<select id="transaction " name="transaction">
				<option value="">---Select---</option>
					<option value="<%=TranscationStatus.DEPOSIT.getValue()%>" >Deposit</option>
					<option value="<%=TranscationStatus.WITHDRAWAL.getValue()%>" >WithDrawal</option>
					<option value="<%=TranscationStatus.INVESTMENT.getValue()%>" >Investment</option>
					<option value="<%=TranscationStatus.REPAYMENT.getValue()%>" >Repayment</option>
					<option value="<%=TranscationStatus.PROFIT.getValue()%>" >Profit</option>
					<option value="<%=TranscationStatus.WHITEHALL_FEE.getValue()%>" >WhiteHallFee</option>					
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
				<tbody>
				   		<c:forEach items="${investorTransactions}" var="investorTransaction">
				   
						<tr>
							<td><fmt:formatDate pattern="dd-MM-yyyy" value="${investorTransaction.transcationDate}" /></td>
							<td>${investorTransaction.transcationType}</td>
							<td></td>
							<td>${investorTransaction.amount}</td>
							<td></td>
						</tr>
						</c:forEach>
				</tbody>
		</table>
	</div>
	</form:form>
</div>
	      	<p:paginate  paginationModel="${paginationModel}"/>

<div class="back-actions">
    <a href="/group/guest/portfolio" class="btn btn-primary btn-lg">Back</a>
</div>
