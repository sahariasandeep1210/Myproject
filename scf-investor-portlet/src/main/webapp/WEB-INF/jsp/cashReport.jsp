<%@page import="com.tf.persistance.util.TranscationStatus"%>
<%@page import="org.springframework.transaction.TransactionStatus"%>
<%@include file="init.jsp"%>

<portlet:actionURL var="getCashURL">
  <portlet:param name="cash" value="getCashReport"/>
</portlet:actionURL>

<portlet:actionURL var="backURL">
<portlet:param name="page" value="cashBack"/>
</portlet:actionURL>


<portlet:renderURL var="cashURL">
<portlet:param name="render" value="cashReport"/>
</portlet:renderURL>


<div class="container-fluid">

<form:form method="post" commandName="cashReportModel"
		class="form-horizontal" name="cashReportForm" id="cashReportForm"> 
		      <input type="hidden" value="${getCashURL}" id="getCashReports" />
		      <input type="hidden" name="curentPage"  id="curentPage"   value="${paginationModel.currentPage}" />
		      <input type="hidden" name="noOfRecords"  id="noOfRecords"   value="${paginationModel.noOfRecords}" />
		      <input type="hidden" name="defaultCashURL"   id="defaultCashURL" 	  value="${cashURL}" />
		      <input type="hidden" name="investorID" value="${investorId}">
		      
		      
		      
		      <div class="row-fluid">
       		 <div class="span6">
				<label class="span6">Investor Name:</label>
				   ${companyname} 
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
              <input name="fromDate" class="span9" id="fromDate" placeholder="From" />
             </div>
		<div class="span6">
                
              <input name="toDate" Class="span9" id="toDate" placeholder="To" />
                
	     </div>
	  </div>
		<br>
		
		<div class="row-fluid">
          <div class="span6">
              <label class="span6">Select Transaction Type :</label>
			<select id="transaction " name="transaction">
				<option value="">---Select---</option>
					<option value="<%=TranscationStatus.DEPOSIT.getValue()%>" <c:if test="${ transactionType eq 'Deposit'}">selected="selected" </c:if>>Deposit</option>
					<option value="<%=TranscationStatus.WITHDRAWAL.getValue()%>" <c:if test="${ transactionType eq 'Withdrawal'}">selected="selected" </c:if>>WithDrawal</option>
					<option value="<%=TranscationStatus.ALLOTED.getValue()%>" <c:if test="${ transactionType eq 'Alloted'}">selected="selected" </c:if>>Alloted</option>
					<option value="<%=TranscationStatus.INVESTED.getValue()%>" <c:if test="${ transactionType eq 'Invested'}">selected="selected" </c:if>>Invested</option>
					<option value="<%=TranscationStatus.REPAID.getValue()%>" <c:if test="${ transactionType eq 'Repaid'}">selected="selected" </c:if>>Repaid</option>
					<option value="<%=TranscationStatus.PROFIT.getValue()%>" <c:if test="${ transactionType eq 'Profit'}">selected="selected" </c:if>>Profit</option>	
					<option value="<%=TranscationStatus.WHITEHALL_FEE.getValue()%>" <c:if test="${ transactionType eq 'Whitehall Fee'}">selected="selected" </c:if>>Whitehall Fee</option>					
									
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
	      <c:if test="${not empty investorList }">
	
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

                   
				   		
				   <c:forEach items="${investorList}" var="investorTransaction">
				   
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
	       <p:paginate  paginationModel="${paginationModel}"/>
	
</c:if>
	
	<c:if test="${not empty invList }">
	
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
						     <c:forEach items="${invList}" var="inv">
				   
						    <tr>
							   <td><fmt:formatDate pattern="dd-MM-yyyy" value="${inv.transcationDate}" /></td>
							    <td>${inv.transcationType}</td>
							      <td></td>
							     <td>${inv.amount}</td>
							    <td></td>
						</tr>
						</c:forEach>
						
						
				</tbody>
		</table>
	</div>
	       <p:paginate  paginationModel="${paginationModel}"/>
	
		</c:if>
			<c:if test="${ empty invList }">
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
				      <tr>							
 					      <td colspan="9" align="center">No records found!</td>
 					 </tr>
				</tbody>
				</table>
				</div>
		    </c:if>
	
	</form:form>
</div>
        
<div class="back-actions">
    <a href="javascript:void(0);" onclick="window.location.href='${backURL}&investorID=${investorId}'"  class="btn btn-primary btn-lg">Back</a>
</div>
