<%@page import="com.tf.persistance.util.TranscationStatus"%>
<%@page import="org.springframework.transaction.TransactionStatus"%>
<%@include file="init.jsp"%>
<liferay-theme:defineObjects />

<portlet:actionURL var="getCashURL">
  <portlet:param name="cash" value="getCashReport"/>
</portlet:actionURL>

<portlet:actionURL var="backURL">
<portlet:param name="page" value="cashBack"/>
</portlet:actionURL>


<portlet:renderURL var="cashReportURL">
    <portlet:param name="render" value="cashReport" />
</portlet:renderURL>

	<portlet:renderURL var="defaultRenderURL" />


<div class="container-fluid">

<form:form method="post" commandName="cashReportModel"
		class="form-horizontal" autocomplete="off" name="cashReportForm" id="cashReportForm"> 
		      <input type="hidden" value="${getCashURL}" id="getCashReports" />
		      <input type="hidden" name="currentPage"  id="currentPage"   value="${paginationModel.currentPage}" />
		      <input type="hidden" name="currPageSize" 	id="currPageSize"    	value="${paginationModel.pageSize}" /> 
		      <input type="hidden" name="noOfRecords"  id="noOfRecords"   value="${paginationModel.noOfRecords}" />
		      <input type="hidden" name="defaultCashURL"   id="defaultCashURL" 	  value="${cashReportURL}" />
		      <input type="hidden" name="getCashs"   id="getCashs" 	  value="${cashReportURL}" />
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
				   	${investor.cashPosition}
				   
	        </div>
	    </div>
	    <div class="row-fluid">
			<div class="span6">
				<label class="span6">Receivables Position:</label>
				   				${totalReceivablesPosition}
				   
			</div>
		</div>
	    <div class="row-fluid">
			<div class="span6">
				<label class="span6">Total Asset Value:</label>
				    				  ${totalAsset}
				    
			</div>
	    </div>
		
		
	  <div class="row-fluid">
	         <div class="span6">
                <label class="span6">Select Date Range :</label>
                    <input name="fromDate" class="span9" id="fromDate" placeholder="From" value="${from}" />
             </div>
		<div class="span6">
              <input name="toDate" Class="span9" id="toDate" placeholder="To" value="${to}"/>
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
                      <c:choose>
                   
                       <c:when test="${fn:length(investorList) gt 0}">
                    

						<c:forEach items="${investorList}" var="investorTransaction">

							<tr>
								<td><fmt:formatDate pattern="dd-MM-yyyy"
										value="${investorTransaction.transcationDate}" /></td>
								<td>${investorTransaction.transcationType}
								  <c:choose>
											<c:when test="${investorTransaction.transcationType eq 'Deposit' ||investorTransaction.transcationType eq 'Repaid' || investorTransaction.transcationType eq 'Profit' }">
												<img height="30" width="30" src="${themeDisplay.pathThemeImages}/green.png" style=" float: right; vertical-align: middle; font-size: 20px"/>
											</c:when>
											<c:otherwise>
												<img height="30" width="30" src="${themeDisplay.pathThemeImages}/red.png" style=" float: right; vertical-align: middle; font-size: 20px"/>
											</c:otherwise>										
										</c:choose>
								</td>
								<td>${investorTransaction.tradeID}</td>
								<td>${investorTransaction.amount}</td>
								<td>${investorTransaction.reference}</td>
							</tr>
						</c:forEach>
						</c:when>
						 <c:when test="${fn:length(invList) gt 0}">


						<c:forEach items="${invList}" var="inv">

							<tr>
								<td><fmt:formatDate pattern="dd-MM-yyyy"
										value="${inv.transcationDate}" /></td>
								<td>${inv.transcationType}
								    <c:choose>
											<c:when test="${inv.transcationType eq 'Deposit' ||inv.transcationType eq 'Repaid' || inv.transcationType eq 'Profit' }">
												<img height="30" width="30" src="${themeDisplay.pathThemeImages}/green.png" style=" float: right; vertical-align: middle; font-size: 20px"/>
											</c:when>
											<c:otherwise>
												<img height="30" width="30" src="${themeDisplay.pathThemeImages}/red.png" style=" float: right; vertical-align: middle; font-size: 20px"/>
											</c:otherwise>										
										</c:choose>
								</td>
								<td></td>
								<td>${inv.amount}</td>
								<td></td>
							</tr>
						</c:forEach>
						</c:when>
					   <c:otherwise>

						<tr>
							<td colspan="9" align="center">No records found!</td>
						</tr>
                     </c:otherwise>

              </c:choose>
				</tbody>
				 
		</table>
		
	</div>
		<div class="row-fluid">
			<div class="span6"></div>
			<div class="span6">
				<div class="span4"></div>
				<div class="span8">
					<label class="diplay-inline"> Show &nbsp;</label> <select id="pageSize"
						class="paginationselect" name="pageSize">
						<option value="5">5</option>
						<option value="10">10</option>
						<option value="20">20</option>
						<option value="30">30</option>
						<option value="45">45</option>
						<option value="60">60</option>
						<option value="75">75</option>
						<option value="100">100</option>
					</select> <label class="diplay-inline">&nbsp; Results per page </label>
				</div>
			</div>
		</div>
	</form:form>
</div>
        <p:paginate  paginationModel="${paginationModel}"/>
        
        
<div class="back-actions">
    <a href="javascript:void(0);" onclick="window.location.href='${backURL}&investorID=${investorId}'"  class="btn btn-primary btn-lg">Back</a>
</div>
