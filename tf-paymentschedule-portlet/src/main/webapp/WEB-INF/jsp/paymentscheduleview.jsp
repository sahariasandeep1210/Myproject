<%@include file="init.jsp"%>
<%@ taglib uri="http://whitehall.com/jsp/tld/p" prefix="p"%>

<liferay-theme:defineObjects />

<portlet:renderURL var="defaultRenderURL" />
<div class="tab-content">

<form:form  method="post" action="${defaultRenderURL}" id="payemtnScheduleList"  >
		
		<input type="hidden" name="currentPage"           id="currentPage"        value="${paginationModel.currentPage}" />
        <input type="hidden" name="currPageSizes"         id="currPageSizes"      value="${paginationModel.pageSize}" />
        <input type="hidden" name="noOfRecords"           id="noOfRecords"        value="${paginationModel.noOfRecords}" />
        <input type="hidden" name="defaultURL"            id="defaultURL"         value="${defaultRenderURL}" />
        <input type="hidden" name="defaultRender"   	  id="defaultRender" 	  value="${defaultRenderURL}" />
        <input type="hidden" name="pageSize"        	  id="pageSize"      	  value="${paginationModel.pageSize}" />
         
        <input type="hidden" id="sortVal_order" name="sortVal_order" value="${sortCompany_order}"/>
		<input type="hidden" id="sort_Column" name="sort_Column" value="${sort_Column}" />
		<input type="hidden" id="sort_order" name="sort_order" value="${sort_order}"/>
	  
<div class="lfr-pagination">
			
			
		fdsafdas	${paginationModel}fdsa
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
			<table class="table  tablesorter table-bordered" id="tradeListTable">
				<thead>
					<tr>
						<th>Invoice Number</th>
						<th>Seller Name</th>
						<th>Invoice Amount</th>
						<th>Duration</th>
						<th>Finance Date</th>
						<th>Payment Date</th>
					</tr>
				</thead>
				<tbody>						
					<c:choose>						
						<c:when test="${fn:length(paymentScheduleList) gt 0}">
						
							<c:forEach items="${paymentScheduleList}" var="trade">
								<tr>
									<td>${trade.invoiceNumber}</td>
									<td class="pull-left">${trade.sellerName}</td>
									<td class="blue_bold text-right">
										<div class="pull-right"><fmt:formatNumber type="number" maxFractionDigits="3" value="${trade.invoiceAmount}"  pattern="#,##0.00"/></div>
									</td>
									<td class="text-center">${trade.duration}</td>
									<td class="text-center"><fmt:formatDate pattern="dd-MM-yyyy" value="${trade.financeDate}" /></td>
									<td class="text-center"><fmt:formatDate pattern="dd-MM-yyyy" value="${trade.paymentDate}" /></td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="8" align="center">No records found!</td>
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

