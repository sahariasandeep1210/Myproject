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


<div class="tab-content">

<form:form method="post" commandName="cashReportModel"
		 autocomplete="off" name="cashReportForm" id="cashReportForm"> 
		      <input type="hidden" value="${getCashURL}" id="getCashReports" />
		      <input type="hidden" name="currentPage"  id="currentPage"   value="${paginationModel.currentPage}" />
		      <input type="hidden" name="currPageSize" 	id="currPageSize"    	value="${paginationModel.pageSize}" /> 
		      <input type="hidden" name="noOfRecords"  id="noOfRecords"   value="${paginationModel.noOfRecords}" />
		      <input type="hidden" name="defaultCashURL"   id="defaultCashURL" 	  value="${cashReportURL}" />
		      <input type="hidden" name="getCashs"   id="getCashs" 	  value="${cashReportURL}" />
		      <input type="hidden" name="investorID" value="${investorId}">
		      
		       <div class="customWell">	
		       
		       			<div class="row-fluid">
				   			<div class="span12">
				   				<div class="labelBigTextContaier spacer border">
						   			<div class="smallLabelText">
						   				Investor Name
						   			</div>
						   			
						   			<div class="bigText">
						   				${companyname} 
						   			</div>
						   		</div>	
				   			</div>
				   		</div>	
				   		<div class="row-fluid">
				   			<div class="span3 spanSm6">
				   				<div class="labelBigTextContaier">
						   			<div class="smallLabelText">
						   				Cash Position
						   			</div>
						   			
						   			<div class="bigText blue">
						   				&pound; <fmt:formatNumber type="number" maxFractionDigits="3" value="${investor.cashPosition}"  />
						   			</div>
						   		</div>
				   			</div>
				   			
				   			<div class="span3 spanSm6">
				   				<div class="labelBigTextContaier mtXs15">
						   			<div class="smallLabelText">
						   				Receivables Position 
						   			</div>
						   			
						   			<div class="bigText blue">
						   				&pound; <fmt:formatNumber type="number" maxFractionDigits="3" value="${totalReceivablesPosition}"  />
						   			</div>
						   		</div>
				   			</div>
				   			
				   			<div class="span3 spanSm6">
				   				<div class="labelBigTextContaier mtSm15 mtXs15">
						   			<div class="smallLabelText">
						   				Total Asset Value 
						   			</div>
						   			
						   			<div class="bigText blue">
						   				&pound; <fmt:formatNumber type="number" maxFractionDigits="3" value="${totalAsset}"  />
						   			</div>
						   		</div>
				   			</div>	   		
			   		</div>
			   		<div class="row-fluid">
		   			<div class="span3 spanSm6 mtSm15 mtXs15 mtLg15">
		   				 <div class="control-group">
		   					<label class="control-label" for="dateEs">From</label>
			   				<div class="input-append">						
								<input name="fromDate" class="span9" id="fromDate" placeholder="From" value="${from}" type="text" />
									<span	class="add-on" ><i	class="icomoon-calendar"></i></span>
							</div>
						</div> 
		   			</div>
		   			
		   			<div class="span3 spanSm6 mtSm15 mtXs15 mtLg15">
		   				<div class="control-group">
		   					<label class="control-label" for="dateEs">To</label>
			   				<div class="input-append">						
									  <input name="toDate" Class="span9" id="toDate" placeholder="To" value="${to}" type="text"/>
									<span	class="add-on" ><i	class="icomoon-calendar"></i></span>
							</div>
						</div>
		   			</div>
		   			
		   			<div class="span3 spanSm6 mtSm15 mtXs15 mtLg15">
		   				<div class="control-group">
		   					<label class="control-label" for="transcationType">Transaction Type</label>	
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
		   			<div class="span3 spanSm6 mtSm15 mtXs15 mtLg15">
		   				<div class="actionContainer noBorder text-left">
							<input type="button" value="Submit" id="cashReport" class="btnBgBuSm" />
						</div>
		   			</div>	   			
		   		</div>	  
		       </div>

	
	<div class="customTableContainer">
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
								<td><fmt:formatDate pattern="dd-MM-yyyy"	value="${investorTransaction.transcationDate}" /></td>
								<td  class="text-right bigger-icon">
									<div class="pull-left text-align-text">${investorTransaction.transcationType}</div>
									<div class="text-align-icon">	
								  <c:choose>
											<c:when test="${investorTransaction.transcationType eq 'Deposit' ||investorTransaction.transcationType eq 'Repaid' || investorTransaction.transcationType eq 'Profit' }">
												<i class="icomoon-round-plus green_normal cursor-pointer"></i>
												<c:set var="amountClass"  value="rightalign green_bold"/>
											</c:when>
											<c:otherwise>
												<i class="icomoon-round-minus red_normal cursor-pointer"></i>
													<c:set var="amountClass" value="rightalign red_bold"/>
											</c:otherwise>										
										</c:choose>
										</div>
								</td>
								<td>${investorTransaction.scfTradeId}</td>
								<td class="${amountClass} rightalign"><fmt:formatNumber type="number" maxFractionDigits="3" value="${investorTransaction.amount}"  /></td>
								<td>${investorTransaction.reference}</td>
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
	<div class="back-actions">
    <a href="javascript:void(0);" onclick="window.location.href='${backURL}&investorID=${investorId}'"  class="btnBgBuSm">Back</a>
</div>
</div>
        <p:paginate  paginationModel="${paginationModel}"/>
        
        

