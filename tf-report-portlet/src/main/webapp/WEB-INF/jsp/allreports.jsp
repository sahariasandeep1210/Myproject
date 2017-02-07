<%@include file="init.jsp"%>
<%@ taglib uri="http://whitehall.com/jsp/tld/p" prefix="p"%>
<portlet:renderURL var="defaultURL">
</portlet:renderURL>

<portlet:actionURL var="getReportURL">
	<portlet:param name="report" value="getReport" />
</portlet:actionURL>
<div class="tab-content">

	<form:form commandName="reportModel" method="post"
		action="" id="reportList" autocomplete="off" name="reportList">
		
	<input type="hidden" name="currentPage" 	id="currentPage"    	value="${paginationModel.currentPage}" />
	<input type="hidden" name="currPageSize" 	id="currPageSize"    	value="${paginationModel.pageSize}" /> 
	<input type="hidden" name="curPageSize"     id="curPageSize"   		value="${paginationModel.pageSize}" />
	<input type="hidden" name="noOfRecords" 	id="noOfRecords"    	value="${paginationModel.noOfRecords}" />
	<input type="hidden" name="defaultURL" 		id="defaultURL"    		value="${defaultURL}" />
	<input type="hidden" name="getReportURL" 	id="getReportURL"    	value="${getReportURL}" />
    <input type="hidden" name="pageSize"        id="pageSize"      		value="${paginationModel.pageSize}" />
                
	
	
	 <div class="customWell filter-container"> 
		  	<div class="row-fluid">
		  		<div class="span3 spanSm6">

					<div class="control-group">
						<div class="input-append">
							<input type="text" name="Search" placeholder="Search Here" 	id="search" value="${search}">
							<span	class="add-on" ><i	class="icomoon-search"></i></span>
						</div>
					</div>
				</div>		  	
		  	
		  		
		  		<div class="span3 spanSm6 mtSm10 mtXs10">
				  	<div class="control-group">
						<div class="input-append">
							<input name="fromDate" type="text" id="fromDate" placeholder="From" value="${from}" />
							<span	class="add-on" ><i	class="icomoon-calendar"></i></span>
						</div>
					</div>
		  		</div>
		  		
		  		<div class="span3 spanSm6 mtSm10 mtXs10">
		  			<div class="control-group">
						<div class="input-append">
							<input name="toDate" type="text" id="toDate" placeholder="To"  value="${to}"/>
							<span	class="add-on" ><i	class="icomoon-calendar"></i></span>
						</div>
					</div>
		  		</div>
		  		
		  		<div class="span3 spanSm6 mtSm10 mtXs10">
		  			<div class=""> 
		  				<input type="button" value="Search" id="TransactionReport"		class="btnBgBuSm" />
		  			</div>
		  			
		  		</div>
		  		
		  	</div>
		  	<br>
		  <div class="row-fluid">
			<div class="span6">
				<label class="span6">Total Earnings:</label>
				   	<span style="font: normal 700 .85714em/1.33333em 'Open Sans',sans-serif;color: #189a80;"><fmt:formatNumber type="number" maxFractionDigits="3" value="${totalEarnins}"  />	</span>			   
	        </div>
	    </div>
		 
	</div>
	
	
	<div class="title-container clearfix">		  	
		  	
		  	<div class="btn-wrapper">		  			
		  			<a href="javascript:;" id="exportReport" class="btnBgGreenSm"> Export</a>
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
			<table class="table table-hover tablesorter table-bordered"  id="reportListTable">
				<thead>
					<tr>
						<th>TransactionDate</th>
						<th>TransactionType</th>
						<th>Amount</th>
						<th>Trade#</th>
					<!-- 	<th>CompanyName</th> -->
						<th>Reference</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${fn:length(reportList) gt 0}">
							<c:forEach items="${reportList}" var="report">
								<tr>
									<td><fmt:formatDate pattern="dd-MM-yyyy" value="${report.transcationDate}" /></td>
									<td class="text-right bigger-icon">
										<div class="pull-left text-align-text">${report.transcationType}</div>
											<div class="text-align-icon">	
													 <c:choose>
														<c:when test="${report.transcationType eq 'SCF Repayment' || report.transcationType eq 'Investor Paid'  || report.transcationType eq 'Whitehall Profit' ||  report.transcationType eq 'Whitehall Fee' }">
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
									
									<td class="${amountClass}"><fmt:formatNumber type="number" maxFractionDigits="3" value="${report.amount}"  pattern="#0.00"/></td>
									<td>${report.scfTradeId}</td>
									<%-- <td>${report.company.name}</td> --%>
									<td>${report.reference}</td>
								</tr>
							</c:forEach>
						 </c:when>
						 <c:when test="${fn:length(whiteHallTransactions) gt 0}">
							<c:forEach items="${whiteHallTransactions}" var="report">
								<tr>
									<td><fmt:formatDate pattern="dd-MM-yyyy" value="${report.transcationDate}" /></td>
									<td class="text-right bigger-icon">
										<div class="pull-left text-align-text">${report.transcationType}</div>
											<div class="text-align-icon">	
													 <c:choose>
														<c:when test="${report.transcationType eq 'SCF Repayment' || report.transcationType eq 'Investor Paid'  || report.transcationType eq 'Whitehall Profit' ||  report.transcationType eq 'Whitehall Fee' }">
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
									<td class="${amountClass}"><fmt:formatNumber type="number" maxFractionDigits="3" value="${report.amount}"  /></td>
									<td>${report.tradeID}</td>
									<<%-- td>${report.company.name}</td> --%>
									<td>${report.reference}</td>
								</tr>
							</c:forEach>
						 </c:when>
						 <c:otherwise>
							<tr>
								<td colspan="7" align="center">No Record Found!</td>
							</tr>
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
 