<%@page import="com.tf.persistance.util.TranscationStatus"%>
<%@include file="init.jsp"%>
<%@include file="tabview.jsp"%> 
<liferay-theme:defineObjects />
 

<portlet:actionURL var="addInvtranscationURL">
	<portlet:param name="action" value="addInvtranscation"/>
</portlet:actionURL>

<portlet:renderURL var="cashReportURL">
    <portlet:param name="render" value="cashReport" />
</portlet:renderURL>

<portlet:renderURL var="receivableReportURL">
    <portlet:param name="receivable" value="receivableReport" />
</portlet:renderURL>

<portlet:actionURL var="getInvestorDetailsURL">
  <portlet:param name="getBy" value="getInvestorDetails"/>
</portlet:actionURL>


<div  id="errorMsg"></div>

<div class="tab-content">
 <form:form method="post" commandName="investorBalanceModel"
		 name="investorBalanceForm" id="investorBalanceForm" action="${getInvestorDetailsURL}">
		      <input type="hidden" name="id"    									value="${investorBalanceModel.id}"  />
		      <input type="hidden" 					   id="getInvBalanceDetails"	value="${addInvtranscationURL}"  />
 		      <input type="hidden" name="currentPage"  id="currentPage"     		value="${paginationModel.currentPage}" />
		      <input type="hidden" name="noOfRecords"  id="noOfRecords"  			value="${paginationModel.noOfRecords}" />
		      <input type="hidden" name="defaultURL"   id="defaultURL"      		value="${getInvestorDetailsURL}" />
		      <input type="hidden" name="pageSize"     id="pageSize"      			value="${paginationModel.pageSize}" />
		      <input type="hidden" name="curPageSize"  id="curPageSize"   			value="${paginationModel.pageSize}" />
		      
		      
		     <div class="customWell">
				<div class="row-fluid">
					<div class="span4">
						<div class="control-group">
							<label class="control-label" for="investorname">Investor</label>	
							<select id="investorID " name="investorID"  onchange="this.form.submit()" class="aui-field-select" >
								<option value="0">---Select---</option>
								<c:forEach var="investor" items="${investors}">
								     <option value="${investor.investorID}" <c:if test="${ investor.investorID eq investorID}">selected="selected" </c:if>>${investor.name}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
				<div class="row-fluid">
					<div class="span4">
						<div class="labelBigTextContaier mt15">
				   			<div class="smallLabelText">
				   				Cash Position
				   			</div>
				   			<div class="with-button">
				   				<div class="bigText blue">
					   				&pound; <fmt:formatNumber type="number" maxFractionDigits="3" value="${investor.cashPosition}"  pattern="#,###.00"/>
					   			</div>
					   			  	 <c:if test="${not empty investorID}">	         
								             <a href="javascript:void(0);"  class="btnBgGraySm" onclick="window.location.href='${cashReportURL}&investorID=${investorID}'">Cash Report</a>
	        				 		</c:if>
				   			</div>
				   			
				   		</div>
					</div>
					
					<div class="span4">
						<div class="labelBigTextContaier mt15">
				   			<div class="smallLabelText">
				   				Receivables Position 
				   			</div>
				   			<div class="with-button">
				   				<div class="bigText blue">
					   				&pound; <fmt:formatNumber type="number" maxFractionDigits="3" value="${totalReceivablesPosition}"  pattern="#,##0.00"/>
					   			</div>
					   			<a href="javascript:void(0);" onclick="window.location.href='${receivableReportURL}&investorID=${investorID}'" class="btnBgGraySm">Current Receivable</a>
				   			</div>
				   			
				   		</div>
					</div>
					
					<div class="span4">
						<div class="labelBigTextContaier mt15">
				   			<div class="smallLabelText">
				   				Total Asset Value
				   			</div>
				   			
			   				<div class="bigText blue">
				   				&pound; <fmt:formatNumber type="number" maxFractionDigits="3" value="${totalAsset}"  pattern="#,##0.00"/>
				   			</div>	   			
				   			
				   		</div>
					</div>
					
				</div>
				
				<div class="row-fluid">
					<div class="span4 mt15">
						<div class="control-group">
							<label class="control-label" for="action">Action</label>
							<select id="transactionType" name="transcationType" class="aui-field-select" >
										<option value=" ">---Select---</option>
										<option value="<%=TranscationStatus.DEPOSIT.getValue() %>" >Deposit </option>
										<option value="<%=TranscationStatus.WITHDRAWAL.getValue()%>">Withdrawl </option>										
								</select>
						</div>
					</div>
					
					<div class="span4 mt15">
						<div class="control-group">
							<label class="control-label" for="amount">Amount</label>
							<input type="text" name="amount" id="transactionAmount" class="field">
						</div>						 
					</div>
					
					<div class="span4 mt15">
						<div class="control-group">
							<label class="control-label" for="amount">Date</label>
							<div class="input-append">		
									<input type="text" name="transcationDate" id="balanceDate" class="field" placeholder="dd-MM-yyyy">				
									<span	class="add-on" ><i	class="icomoon-calendar"></i></span>
							</div>
							
						</div>
					 	
					</div>
					
				</div>
				
				<div class="row-fluid">
			  		<div class="span12">
			  			<div class="actionContainer noBorder text-left">
			  				<input type="button" value="Submit"   id="updatebalance" class="btnBgBuSm" />
							<!-- <input type="button" value="Cancel" id="cancelSetting" class="btnBrGrSm" /> -->
			  			</div>
			  			
			  		</div>
			  	</div>
			</div>
		
	<br>
	
 <c:if test="${not empty investorList}">
 <div class="row-fluid">
       
         <div class="span12 text-right mb15">
	
				<div class="span12">
					<h5 style="float: right !important;">
						<a href="javascript:;" class="btnBgGreenSm" id="exportBalances"> Export</a>
					</h5>
				</div>
			</div>
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
<div class="customTableContainer">
			<table class="table  tablesorter table-bordered" id="balanceListTable">
				<thead>
					<tr>
					   
						<th>Date</th>
						<th>Transaction Type</th>
						<th>TRADE ID</th>
						<th> Amount</th>	
						<th>Reference</th>	
						
					</tr>
				</thead>
				<tbody>
				     <c:forEach items="${investorList}" var="investorTransaction">
				    
						<tr>
							<td><fmt:formatDate pattern="dd-MM-yyyy" value="${investorTransaction.transcationDate}" /></td>
							<td class="text-right bigger-icon">
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
							<td class="${amountClass} rightalign"><fmt:formatNumber type="number" maxFractionDigits="3" value="${investorTransaction.amount}"  pattern="#,##0.00"/></td>
							<td>${investorTransaction.reference}</td>
						</tr>
						</c:forEach>
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
	      
	 </c:if>
 </form:form>
</div>	
