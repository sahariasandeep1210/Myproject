<%@include file="init.jsp"%>
<liferay-theme:defineObjects />
<%@ taglib uri="http://whitehall.com/jsp/tld/p" prefix="p"%>


<portlet:actionURL var="getSellerTradeURL">
	<portlet:param name="seller" value="getSellerTrade" />
</portlet:actionURL>

<portlet:resourceURL var="tradeURL"></portlet:resourceURL>
<portlet:renderURL var="defaultRenderURL" />


<portlet:renderURL var="investorDetailsURL">
	<portlet:param name="render" value="investorDetails" />
</portlet:renderURL>

<div class="tab-content">


	<form:form commandName="scfSellerTradeModel" method="post" action="" id="sellerList" name="scfTradeList" autocomplete="off">
		<input type="hidden" name="currentPage" 		id="currentPage" 		value="${paginationModel.currentPage}" />
		<input type="hidden" name="currPageSize" 		id="currPageSize"		value="${paginationModel.pageSize}" />
		<input type="hidden" name="noOfRecords"			id="noOfRecords"		value="${paginationModel.noOfRecords}" />
		<input type="hidden" name="defaultURL"		 	id="defaultURL"			value="${defaultRenderURL}" />
		<input type="hidden" name="getSellerTradeURL" 	id="getSellerTradeURL"	value="${defaultRenderURL}" />
		<input type="hidden" name="tradeURL"			id="tradeURL"  			value="${tradeURL}" />
		<input type="hidden" name="invoices"			id="invoices" 			value="${trade.invoices}">
		<input type="hidden" name="invoices"			id="invoices" 			value="${trade.invoices}">
		<input type="hidden" name="pageSize"        	id="pageSize"      		value="${paginationModel.pageSize}" /> 
		<input type="hidden" name="defaultRender"       id="defaultRender"      value="${defaultRenderURL}" />


		<%@include file="tradefilter.jspf"%> 
		

		<div class="customTableContainer">
			<table class="table  tablesorter table-bordered" id="tradeListTable">
				<thead>
					<tr>
						<th>Trade #</th>
						<th>Scf Company</th>
						<th>Trade Value</th>
						<th>Status</th>
						<th>Duration</th>
						<th width="8%">Opening Date</th>
						<th width="8%">Maturity Date</th>
						<th>Supplier Payment Date</th>
						<th>Fixed Charges</th>
						<th>Whiethall Variable Fees</th>
						<th>Investors Fees</th>
						<th>Other Fees</th>
						<th>Gross charges</th>
						<th>Finance Amount</th>

					</tr>
				</thead>
				<tbody>
					<c:choose>						
						<c:when test="${fn:length(scftrades) gt 0}">
							<c:forEach items="${scftrades}" var="trade">
								<tr>
									<td><span class='underline'><a
											href="${investorDetailsURL}&tradeID=${trade.id}">${trade.scfId}</a></span></td>
									<td>${trade.company.name}</td>
									<td  class="rightalign"><fmt:formatNumber type="number" maxFractionDigits="3" value="${trade.tradeAmount}"  /></td>
									<td>${trade.status}</td>
									<td>${trade.duration}</td>
									<td><fmt:formatDate pattern="dd-MM-yyyy"
											value="${trade.openingDate}" /></td>
									<td><fmt:formatDate pattern="dd-MM-yyyy"
											value="${trade.closingDate}" /></td>
									<td><fmt:formatDate pattern="dd-MM-yyyy"
											value="${trade.sellerPaymentDate}" /></td>
									<td class="rightalign"><fmt:formatNumber type="number" maxFractionDigits="3" value="${trade.sellerTransFee}"  /></td>
									<td class="rightalign"><fmt:formatNumber type="number" maxFractionDigits="3" value="${trade.sellerFees}"  /></td>
									<td class="rightalign"><fmt:formatNumber type="number" maxFractionDigits="3" value="${trade.investorTotalGross}"  /></td>
									<td></td>
									<td class="rightalign"><fmt:formatNumber type="number" maxFractionDigits="3" value="${trade.sellerTransFee + trade.sellerFees + trade.investorTotalGross}"  /></td>
									<td class="rightalign"><fmt:formatNumber type="number" maxFractionDigits="3" value="${trade.sellerNetAllotment}"  /></td>

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
