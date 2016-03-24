<%@include file="init.jsp"%>
<%@ taglib uri="http://whitehall.com/jsp/tld/p" prefix="p"%>
<portlet:renderURL var="defaultURL">
</portlet:renderURL>

<portlet:actionURL var="getReportURL">
	<portlet:param name="report" value="getReport" />
</portlet:actionURL>
<div class="container-fluid">

	<form:form commandName="reportModel" method="post"
		action="" id="reportList" autocomplete="off" name="reportList">
		
	<input type="hidden" name="currentPage" 	id="currentPage"    	value="${paginationModel.currentPage}" />
	<input type="hidden" name="currPageSize" 	id="currPageSize"    	value="${paginationModel.pageSize}" /> 
	<input type="hidden" name="noOfRecords" 	id="noOfRecords"    	value="${paginationModel.noOfRecords}" />
	<input type="hidden" name="defaultURL" 		id="defaultURL"    		value="${defaultURL}" />
		<input type="hidden" name="getReportURL" 	id="getReportURL"    	value="${getReportURL}" />
	
	
<div class="row-fluid">
			<div class="span6">
				<input type="text" name="Search" placeholder="Search Here"
					id="search" value="${search}">
			</div>
		</div>
		<div class="row-fluid">		
			
		  <div class="span3">	
				<input name="fromDate" type="text" id="fromDate" placeholder="From" value="${from}" /> 
		  </div>		
		  <div class="span3">	
				<input name="toDate" type="text" id="toDate" placeholder="To"  value="${to}"/>
		  </div>
				
		</div>
		<div class="row-fluid">
			<div class="span6">
				<input type="button" value="Search" id="TransactionReport"
					class="btn btn-primary" />
			</div>

		</div>
		<div class="row-fluid">
					<div class="span6">
					</div>
					<div class="span6">
						
						<div class="span12">
							<h5 style="float: right !important;">
								<a href="javascript:;"
									style="color: #295780; font-weight: bold;" id="exportReport"><i
									class="fa fa-file-excel-o fa-2"></i> Export</a>
							</h5>
						</div>
					</div>
			
		</div>
		<div class="table-responsive">
			<table class="table table-hover tablesorter table-bordered"  id="reportListTable">
				<thead>
					<tr>
						<th>Amount</th>
						<th>TransactionType</th>
						<th>TransactionDate</th>
						<th>Trade#</th>
						<th>CompanyName</th>
						<th>Reference</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${fn:length(reportList) gt 0}">
							<c:forEach items="${reportList}" var="report">
								<tr>
									<td>${report.amount} </td>
									<td>${report.transcationType}
										 <c:choose>
											<c:when test="${report.transcationType eq 'SCF Repayment' || report.transcationType eq 'Investor Paid' }">
												<img height="30" width="30" src="${themeDisplay.pathThemeImages}/green.png" style=" float: right; vertical-align: middle; font-size: 20px"/>
											</c:when>
											<c:otherwise>
												<img height="30" width="30" src="${themeDisplay.pathThemeImages}/red.png" style=" float: right; vertical-align: middle; font-size: 20px"/>
											</c:otherwise>										
										</c:choose>
									
									
									</td>
									<td><fmt:formatDate pattern="dd-MM-yyyy" value="${report.transcationDate}" /></td>
									<td>${report.tradeID}</td>
									<td>${report.company.name}</td>
									<td>${report.reference}</td>
								</tr>
							</c:forEach>
						 </c:when>
						 <c:when test="${fn:length(whiteHallTransactions) gt 0}">
							<c:forEach items="${whiteHallTransactions}" var="report">
								<tr>
									<td>${report.amount} </td>
									<td>${report.transcationType}</td>
									<td><fmt:formatDate pattern="dd-MM-yyyy" value="${report.transcationDate}" /></td>
									<td>${report.tradeID}</td>
									<td>${report.company.name}</td>
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

	</form:form>



</div>
	<p:paginate  paginationModel="${paginationModel}"/>
 