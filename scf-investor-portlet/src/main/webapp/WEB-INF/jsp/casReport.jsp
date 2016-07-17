<%@page import="com.tf.persistance.util.TranscationStatus"%>
<%@page import="org.springframework.transaction.TransactionStatus"%>
<%@include file="tabview1.jsp"%>

<%@include file="init.jsp"%>
<liferay-theme:defineObjects />

<portlet:renderURL var="fetchCashURL">
	<portlet:param name="report" value="casReport" />
</portlet:renderURL>


<portlet:renderURL var="defaultRenderURL" />


<div class="tab-content">

<form:form method="post" commandName="casReportModel"
		name="investorBalanceForm" id="investorBalanceForm"> 
				      <input type="hidden" value="${fetchCashURL}" id="getCasReport" />
		
		      <input type="hidden" name="currentPage"  		id="currentPage"   	value="${paginationModel.currentPage}" />
		      <input type="hidden" name="noOfRecords"  		id="noOfRecords"   	value="${paginationModel.noOfRecords}" />
		      <input type="hidden" name="defaultCasURL"   	id="defaultCasURL" 	value="${fetchCashURL}" />
		      <input type="hidden" name="defaultURL"   		id="defaultURL" 	value="${fetchCashURL}" />
		      <input type="hidden" name="getCasReport"   	id="getCasReport" 	value="${fetchCashURL}" />      
		      <input type="hidden" name="companyId" 							value="${companyname.id}">
		      <input type="hidden" name="curPageSize"  		id="curPageSize"   	value="${paginationModel.pageSize}" />
		      <input type="hidden" name="pageSize"     		id="pageSize"      	value="${paginationModel.pageSize}" />
		      
		      <div class="customWell">		      
				      	<div class="row-fluid">
				   			<div class="span12">
				   				<div class="labelBigTextContaier spacer border">
						   			<div class="smallLabelText">
						   				Investor Name
						   			</div>
						   			
						   			<div class="bigText">
						   				 ${companyname.name} 
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
								<input name="fromDate" class="span9" id="fromDate" placeholder="dd-MM-yyyy" value="${from}" type="text"/>
									<span	class="add-on" ><i	class="icomoon-calendar"></i></span>
							</div>
						</div> 
		   			</div>
		   			
		   			<div class="span3 spanSm6 mtSm15 mtXs15 mtLg15">
		   				<div class="control-group">
		   					<label class="control-label" for="dateEs">To</label>
			   				<div class="input-append">						
									 <input name="toDate" Class="span9" id="toDate" placeholder="dd-MM-yyyy" value="${to}" type="text"/>
									<span	class="add-on" ><i	class="icomoon-calendar"></i></span>
							</div>
						</div>
		   			</div>
		   			
		   			<div class="span3 spanSm6 mtSm15 mtXs15 mtLg15">
		   				<div class="control-group">
		   					<label class="control-label" for="transcationType">Transaction Type</label>	
		   					<select id="transaction " name="transaction" class="aui-field-select">
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
		   			<!-- <div class="span3 spanSm6 mtSm15 mtXs15 mtLg15">
		   				<div class="labelBigTextContaier">
				   			<div class="smallLabelText">
				   				Total Selected
				   			</div>
				   			
				   			<div class="bigText blue">
				   				&pound; 3775.77
				   			</div>
				   		</div>
		   			</div> -->
		   		</div>	  
	  
				 <div class="row-fluid">
						<div class="span12" id="buttons">
							<div class="actionContainer noBorder text-left">
								<input type="button" value="Submit" id="casReport" class="btnBgBuSm" />
							</div>
					 </div>
				</div>
		</div>
	
	<div class="customTableContainer">
			<table class="table  tablesorter table-bordered investorCash" id="casReportTable" >
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
							<td><fmt:formatDate pattern="dd-MM-yyyy" value="${investorTransaction.transcationDate}" /></td>
							<td class="text-right bigger-icon">
								<div class="pull-left text-align-text">${investorTransaction.transcationType}</div>
									<div class="text-align-icon">								
											<c:choose>
												<c:when test="${investorTransaction.transcationType eq 'Deposit' || investorTransaction.transcationType eq 'Repaid' || investorTransaction.transcationType eq 'Profit' }">
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
							<td class="${amountClass} rightalign"><fmt:formatNumber type="number" maxFractionDigits="3" value="${investorTransaction.amount}"  /> </td>
							<td></td>
						</tr>
						</c:forEach>
						 </c:when>
						 <c:otherwise>
						 	<td colspan="5">No transcation information found!!</td>
						 </c:otherwise>	   
				</c:choose>
				</tbody>
		</table>
	</div>
			 <div class="lfr-pagination">
			
				<p:paginate  paginationModel="${paginationModel}"/>
				
				<div class="lfr-pagination-controls">
					<div class="btn-group">
					  <a class="btn btn-default dropdown-toggle" role="button" data-toggle="dropdown" href="#">${paginationModel.pageSize} items per page <i class="caret"></i></a>
					  <ul id="menu1" class="dropdown-menu" role="menu" aria-labelledby="drop4">
					  	  <li role="presentation" pageSize="2"><a role="menuitem" href="#">2 items per page</a></li>
		                  <li role="presentation" pageSize="5"><a role="menuitem" href="#">5 items per page</a></li>
		                  <li role="presentation" pageSize="10"><a role="menuitem" href="#">10 items per page</a></li>
		                  <li role="presentation" pageSize="20"><a role="menuitem" href="#">20 items per page</a></li>
		                  <li role="presentation" pageSize="30"><a role="menuitem" href="#">30 items per page</a></li>
		                  <li role="presentation" pageSize="45"><a role="menuitem" href="#">45 items per page</a></li>
		                  <li role="presentation" pageSize="60"><a role="menuitem" href="#">60 items per page</a></li>
		                  <li role="presentation"  pageSize="75"><a role="menuitem" href="#">75 items per page</a></li>
		                </ul> 		              
					</div>
					
					<small class="search-results">Showing ${(paginationModel.currentPage-1)*paginationModel.pageSize+1} - 
					<c:choose>
							<c:when test="${paginationModel.currentPage*paginationModel.pageSize >= paginationModel.noOfRecords}">${paginationModel.noOfRecords}</c:when>
							<c:otherwise>${paginationModel.currentPage*paginationModel.pageSize}</c:otherwise>
					</c:choose>
					 of ${paginationModel.noOfRecords} Results.</small>
					
					
				</div>
		  </div>
	</form:form>
</div>
	 