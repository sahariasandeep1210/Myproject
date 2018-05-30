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


	<form:form commandName="scfSellerTradeModel"  method="post" action="" id="sellerList" name="scfTradeList" autocomplete="off">
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
			<table class="table  tablesorter table-bordered table-striped" id="tradeListTable">
				<thead>
					<tr>
						<th>Trade # <br><img column-name="scfId" class="sortColumn" id="trade_SortAsc" src="<%=request.getContextPath()%>/images/up.png" alt="asc" order="asc"/><img column-name="scfId" class="sortColumn" id="trade_SortDesc" src="<%=request.getContextPath()%>/images/down.png" alt="desc" order="desc"/></th>
					   
						<th>Status <br><img column-name="status" class="sortColumn" id="status_SortAsc" src="<%=request.getContextPath()%>/images/up.png" alt="asc" order="asc"/><img column-name="status" class="sortColumn" id="status_SortDesc" src="<%=request.getContextPath()%>/images/down.png" alt="desc" order="desc"/></th>
						<th>Trade Value <br><img column-name="tradeAmount" class="sortColumn" id="allotment_SortAsc" src="<%=request.getContextPath()%>/images/up.png" alt="asc" order="asc"/><img column-name="tradeAmount" class="sortColumn" id="allotment_SortDesc" src="<%=request.getContextPath()%>/images/down.png" alt="desc" order="desc"/></th>
						<th>My Allotment<br><img column-name="sellerNetAllotment" class="sortColumn" id="financeAmount_SortAsc" src="<%=request.getContextPath()%>/images/up.png" alt="asc" order="asc"/><img column-name="sellerNetAllotment" class="sortColumn" id="financeAmount_SortDesc" src="<%=request.getContextPath()%>/images/down.png" alt="desc" order="desc"/></th>
						<th>BPS<br><img column-name="sellerNetAllotment" class="sortColumn" id="financeAmount_SortAsc" src="<%=request.getContextPath()%>/images/up.png" alt="asc" order="asc"/><img column-name="sellerNetAllotment" class="sortColumn" id="financeAmount_SortDesc" src="<%=request.getContextPath()%>/images/down.png" alt="desc" order="desc"/></th>
						
						<th>My Gross Profit <br><img column-name="tradeAmount" class="sortColumn" id="allotment_SortAsc" src="<%=request.getContextPath()%>/images/up.png" alt="asc" order="asc"/><img column-name="tradeAmount" class="sortColumn" id="allotment_SortDesc" src="<%=request.getContextPath()%>/images/down.png" alt="desc" order="desc"/></th>
						<!-- <th>VAT On Profit</th> -->
						<th>Whitehall Charges <br><img column-name="sellerFees" class="sortColumn" id="sellerFees_SortAsc" src="<%=request.getContextPath()%>/images/up.png" alt="asc" order="asc"/><img column-name="sellerFees" class="sortColumn" id="sellerFees_SortDesc" src="<%=request.getContextPath()%>/images/down.png" alt="desc" order="desc"/></th>
					  
						<th>My Net Profit <br><img column-name="tradeAmount" class="sortColumn" id="allotment_SortAsc" src="<%=request.getContextPath()%>/images/up.png" alt="asc" order="asc"/><img column-name="tradeAmount" class="sortColumn" id="allotment_SortDesc" src="<%=request.getContextPath()%>/images/down.png" alt="desc" order="desc"/></th>
						
					    <th>Duration <br><img column-name="duration" class="sortColumn" id="duration_SortAsc" src="<%=request.getContextPath()%>/images/up.png" alt="asc" order="asc"/><img column-name="duration" class="sortColumn" id="duration_SortDesc" src="<%=request.getContextPath()%>/images/down.png" alt="desc" order="desc"/></th>
						<th width="8%">Start Date <br><img column-name="openingDate" class="sortColumn" id="openingDate_SortAsc" src="<%=request.getContextPath()%>/images/up.png" alt="asc" order="asc"/><img column-name="openingDate" class="sortColumn" id="openingDate_SortDesc" src="<%=request.getContextPath()%>/images/down.png" alt="desc" order="desc"/></th>
						
						<th>End Date <br><img column-name="SellerPaymentDate" class="sortColumn" id="supplierPaymentDate_SortAsc" src="<%=request.getContextPath()%>/images/up.png" alt="asc" order="asc"/><img column-name="SellerPaymentDate" class="sortColumn" id="supplierPaymentDate_SortDesc" src="<%=request.getContextPath()%>/images/down.png" alt="desc" order="desc"/></th>
						<th>Expected Amount<br><img column-name="SellerPaymentDate" class="sortColumn" id="supplierPaymentDate_SortAsc" src="<%=request.getContextPath()%>/images/up.png" alt="asc" order="asc"/><img column-name="SellerPaymentDate" class="sortColumn" id="supplierPaymentDate_SortDesc" src="<%=request.getContextPath()%>/images/down.png" alt="desc" order="desc"/></th>
						
	
					</tr>
				</thead>
				<tbody>
					<c:choose>						
						<c:when test="${fn:length(scftrades) gt 0}">

						 	<tr>
								<td style="background-color:#189a80;color:white" ><span class='underline'>Total</span></td>
								<td style="background-color:#189a80;color:white" ></td>
								<td style="background-color:#189a80 ;color:white"" class="rightalign"><fmt:formatNumber type="number"
										maxFractionDigits="3" value="${totalTradeAmount}" pattern="#,##0.00"/></td>
								
								<td style="background-color:#189a80 ;color:white"" class="rightalign"><fmt:formatNumber type="number"
										maxFractionDigits="3" value="${totalInvestorAllotment}" pattern="#,##0.00"/></td>
								<td style="background-color:#189a80;color:white" ></td>
								
								<td style="background-color:#189a80;color:white"" class="rightalign"><fmt:formatNumber type="number"
										maxFractionDigits="3" value="${investorTotalGrossProfit}" pattern="#,##0.00"/></td>
								<!-- <td style="background-color:#189a80;color:white" ></td> -->
								<td style="background-color:#189a80;color:white"" class="rightalign"><fmt:formatNumber type="number"
										maxFractionDigits="3" value="${whiteHallTotalCharges}" pattern="#,##0.00"/></td>
								<td style="background-color:#189a80;color:white"" class="rightalign"><fmt:formatNumber type="number"
										maxFractionDigits="3" value="${investorTotalNetProfit}" pattern="#,##0.00"/></td>
								
								<td style="background-color:#189a80;color:white""></td>
								<td style="background-color:#189a80;color:white""></td>
								<td style="background-color:#189a80;color:white""></td>
									<td style="background-color:#189a80;color:white"" class="rightalign"><fmt:formatNumber type="number"
										maxFractionDigits="3" value="${receivableAmount}" pattern="#,##0.00"/></td>
								
							</tr> 
							 
							  
							<c:forEach items="${myInvestment}" var="myInvestment">
							<c:choose>
								<c:when test="${ myInvestment.rowNo % 2 == 0}">
									<c:set var="color" value="#ffffff" />
								</c:when>
								<c:otherwise>
									<c:set var="color" value="#edf1f7" />
								</c:otherwise>
								</c:choose>
								<tr>
									<td  style="background-color:${color};">
										<div class="bigText blue">
											<a href="${myTradeUrl}&tradeID=${myInvestment.tradeId}"
												style="text-decoration: underline;">
												${myInvestment.tradeNumber} </a>
										</div>
									</td>

									<td  style="background-color:${color};">${myInvestment.status}</td>
									
									
									<td  style="background-color:${color};" class="rightalign"><fmt:formatNumber type="number" maxFractionDigits="3" value="${myInvestment.totalTradeAmount}"  pattern="#,##0.00"/></td>
									
									<td  style="background-color:${color};" class="rightalign"><fmt:formatNumber type="number" maxFractionDigits="3" value="${myInvestment.myAllotment}"  pattern="#,##0.00"/></td>
									<td  style="background-color:${color};">${myInvestment.bps}</td>
									<td  style="background-color:${color};" class="rightalign"><fmt:formatNumber type="number" maxFractionDigits="3" value="${myInvestment.grossProfit}"  pattern="#,##0.00"/></td>
									 <%-- <td  style="background-color:${color};" class="rightalign"><fmt:formatNumber type="number" maxFractionDigits="3" value="${myInvestment.vatInvestorFee}"  pattern="#,##0.00"/></td>
									 --%> 
									  <td  style="background-color:${color};" class="rightalign"><fmt:formatNumber type="number" maxFractionDigits="3" value="${myInvestment.whiteHallCharges}"  pattern="#,##0.00"/></td>
									
									<td  style="background-color:${color};" class="rightalign"><fmt:formatNumber type="number" maxFractionDigits="3" value="${myInvestment.netProfit}"  pattern="#,##0.00"/></td>
									
			                      
									<td  style="background-color:${color};" class="text-center">${myInvestment.duration}</td>
									<td  style="background-color:${color};" class="text-center"><fmt:formatDate pattern="dd-MM-yyyy"
											value="${myInvestment.startDate}" /></td>
									
									<td  style="background-color:${color};" class="text-center"><fmt:formatDate pattern="dd-MM-yyyy"
											value="${myInvestment.endDate}" /></td>
									<td  style="background-color:${color};" class="rightalign"><fmt:formatNumber type="number" maxFractionDigits="3" value="${myInvestment.receivableAmount}"  pattern="#,##0.00"/></td>
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
