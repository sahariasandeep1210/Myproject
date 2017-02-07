<%@include file="init.jsp"%>
<%@ taglib uri="http://whitehall.com/jsp/tld/p" prefix="p"%>

<liferay-theme:defineObjects />
<portlet:renderURL var="createURL">
	<portlet:param name="render" value="createTrade" />
</portlet:renderURL>
<portlet:renderURL var="defaultRenderURL" />

<portlet:actionURL var="getScfAdminTradeURL">
	<portlet:param name="scf" value="getScfAdminTrade" />
</portlet:actionURL>

<portlet:resourceURL id="breakdownURL" var="breakdownURL"></portlet:resourceURL>


<div class="tab-content">

	<form:form commandName="scfTradeModel" method="post" action="${createURL}" id="scfTradeList"  >
		
		<input type="hidden" name="currentPage"           id="currentPage"        value="${paginationModel.currentPage}" />
        <input type="hidden" name="currPageSizes"         id="currPageSizes"      value="${paginationModel.pageSize}" />
        <input type="hidden" name="noOfRecords"           id="noOfRecords"        value="${paginationModel.noOfRecords}" />
        <input type="hidden" name="defaultURL"            id="defaultURL"         value="${defaultRenderURL}" />
        <input type="hidden" name="defaultRender"   	  id="defaultRender" 	  value="${defaultRenderURL}" />
        <input type="hidden" name="pageSize"        	  id="pageSize"      			value="${paginationModel.pageSize}" />
         
        <input type="hidden" id="sortVal_order" name="sortVal_order" value="${sortCompany_order}"/>
		<input type="hidden" id="sort_Column" name="sort_Column" value="${sort_Column}" />
		<input type="hidden" id="sort_order" name="sort_order" value="${sort_order}"/>
       <%@include file="tradefilter.jspf"%> 
	  
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
			<table class="table  tablesorter table-bordered" id="tradeListTable">
				<thead>
					<tr>
						<!-- 	<th>SCF Trade</th> -->
						<th>Trade # <br><img column-name="scfId" class="sortColumn" id="trade_SortAsc" src="<%=request.getContextPath()%>/images/up.png" alt="asc"/><img column-name="scfId" class="sortColumn" id="trade_SortDesc" src="<%=request.getContextPath()%>/images/down.png" alt="desc"/></th>
					    <th>SCF Company <br><img column-name="company.name" class="sortColumn" id="scfCompany_SortAsc" src="<%=request.getContextPath()%>/images/up.png" alt="asc"/><img column-name="company.name" class="sortColumn" id="scfCompany_SortDesc" src="<%=request.getContextPath()%>/images/down.png" alt="desc"/></th>
						<th>Duration <br><img column-name="duration" class="sortColumn" id="duration_SortAsc" src="<%=request.getContextPath()%>/images/up.png" alt="asc"/><img column-name="duration" class="sortColumn" id="duration_SortDesc" src="<%=request.getContextPath()%>/images/down.png" alt="desc"/></th>
						<th width="8%">Opening Date <br><img column-name="openingDate" class="sortColumn" id="openingDate_SortAsc" src="<%=request.getContextPath()%>/images/up.png" alt="asc"/><img column-name="openingDate" class="sortColumn" id="openingDate_SortDesc" src="<%=request.getContextPath()%>/images/down.png" alt="desc"/></th>
						<th width="8%">Closing Date <br><img column-name="closingDate" class="sortColumn" id="closingDate_SortAsc" src="<%=request.getContextPath()%>/images/up.png" alt="asc"/><img column-name="closingDate" class="sortColumn" id="closingDate_SortDesc" src="<%=request.getContextPath()%>/images/down.png" alt="desc"/></th>
						<th>Trade Amount <br><img column-name="tradeAmount" class="sortColumn" id="allotment_SortAsc" src="<%=request.getContextPath()%>/images/up.png" alt="asc"/><img column-name="tradeAmount" class="sortColumn" id="allotment_SortDesc" src="<%=request.getContextPath()%>/images/down.png" alt="desc"/></th>
						<th>Status <br><img column-name="status" class="sortColumn" id="status_SortAsc" src="<%=request.getContextPath()%>/images/up.png" alt="asc"/><img column-name="status" class="sortColumn" id="status_SortDesc" src="<%=request.getContextPath()%>/images/down.png" alt="desc"/></th>
						<th>Is MultiInvoice</th>
					</tr>
				</thead>
				<tbody>						
					<c:choose>						
						<c:when test="${fn:length(scftrades) gt 0}">
							<c:forEach items="${scftrades}" var="trade">
								<tr>
									<%-- <td>${trade.scfTrade}</td> --%>
									<td class="underline"><a href="javascript:void(0);"
										onclick="window.location.href='${createURL}&tradeID=${trade.id}'">${trade.scfId}</a></td>
									<td>${trade.company.name}</td>
									<td>${trade.duration}</td>
									<td><fmt:formatDate pattern="dd-MM-yyyy" value="${trade.openingDate}" /></td>
									<td><fmt:formatDate pattern="dd-MM-yyyy" value="${trade.closingDate}" /></td>
									<td class="blue_bold text-right">
										<div class="pull-left"><fmt:formatNumber type="number" maxFractionDigits="3" value="${trade.tradeAmount}"  pattern="#0.00"/></div>
										<div class="text-align-icon">
											<a href="javascript:void(0);"	data-url="${breakdownURL}" class="breakdown" tradeID="${trade.id}">
											<i id="${trade.id}_icon" class="icomoon-plus cursor-pointer credit-break"></i> </a>
										</div>
									</td>
									<td>${trade.status}</td>
									<c:choose>
											<c:when test="${fn:length(trade.invoices) gt 1}">												
												<td class="bigger-icon green_normal" title="MultiInvoice"><i class="fa fa-files-o"></i> Yes</td>
											</c:when>
											<c:otherwise>
												<td class="bigger-icon red_normal" title="SingleInvoice"><i class="fa fa-file-o"></i>No</td>												
											</c:otherwise>
										</c:choose>
								</tr>
								<tr class="historyRow" id="${trade.id}_row">
									<td colspan=8></td>
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

