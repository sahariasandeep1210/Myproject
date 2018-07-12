<%@include file="init.jsp"%>
<liferay-theme:defineObjects />
<%@include file="tabview.jsp"%> 
<%@ taglib uri="http://whitehall.com/jsp/tld/p" prefix="p"%>

<portlet:actionURL var="getSellerTradeURL">
	<portlet:param name="seller" value="getSellerTrade" />
</portlet:actionURL>

<portlet:resourceURL var="tradeURL"></portlet:resourceURL>
<portlet:renderURL var="defaultRenderURL" />




<div class="tab-content">


	<form:form commandName="scfSellerTradeModel"  method="post" action="" id="allinvestorbalance" name="allinvestorbalance" autocomplete="off">
		<input type="hidden" name="currentPage" 		id="currentPage" 		value="${paginationModel.currentPage}" />
		<input type="hidden" name="currPageSize" 		id="currPageSize"		value="${paginationModel.pageSize}" />
		<input type="hidden" name="noOfRecords"			id="noOfRecords"		value="${paginationModel.noOfRecords}" />
		<input type="hidden" name="defaultURL"		 	id="defaultURL"			value="${investorscfURL}" />
		<input type="hidden" name="getSellerTradeURL" 	id="getSellerTradeURL"	value="${defaultRenderURL}" />
		<input type="hidden" name="tradeURL"			id="tradeURL"  			value="${tradeURL}" />
		<input type="hidden" name="invoices"			id="invoices" 			value="${trade.invoices}">
		<input type="hidden" name="invoices"			id="invoices" 			value="${trade.invoices}">
		<input type="hidden" name="pageSize"        	id="pageSize"      		value="${paginationModel.pageSize}" /> 
		<input type="hidden" name="defaultRender"       id="defaultRender"      value="${defaultRenderURL}" />

		 <input type="hidden" id="sortVal_order" name="sortVal_order" value="${sortCompany_order}"/>
		<input type="hidden" id="sort_Column" name="sort_Column" value="${sort_Column}" />
		<input type="hidden" id="sort_order" name="sort_order" value="${sort_order}"/>
		<%@include file="shortFallfilter.jspf"%> 
		
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
	<%@include file="investorSCFListTable.jsp"%> 
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
