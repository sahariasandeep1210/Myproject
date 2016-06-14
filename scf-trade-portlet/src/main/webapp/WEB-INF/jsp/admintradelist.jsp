<%@include file="init.jsp"%>
<%@ taglib uri="http://whitehall.com/jsp/tld/p" prefix="p"%>
<%@include file="tabview.jsp"%>

<liferay-theme:defineObjects />

<portlet:renderURL var="createURL">
	<portlet:param name="render" value="createTrade" />
</portlet:renderURL>

<portlet:actionURL var="updateStatusURL">
	<portlet:param name="action" value="updateStatus" />
</portlet:actionURL>

<portlet:actionURL var="getAdminTradeURL">
	<portlet:param name="admin" value="getAdminTrade" />
</portlet:actionURL>

<portlet:renderURL var="defaultRenderURL" />

<liferay-ui:error key="trade.allotment.error"  message="trade.allotment.error"/>
<div class="tab-content">
	<form:form commandName="scfTradeModel" method="post"
		action="${createURL}" id="scfTradeList"  name="scfTradeList" >
		<input type="hidden" name="currentPage"    			id="currentPage"       		value="${paginationModel.currentPage}" />
        <input type="hidden" name="curPageSize"         	id="curPageSize"   			value="${paginationModel.pageSize}" />
        <input type="hidden" name="noOfRecords"     		id="noOfRecords"        	value="${paginationModel.noOfRecords}" />
        <input type="hidden" name="defaultURL"         		id="defaultURL"      		value="${defaultRenderURL}" />
        <input type="hidden" name="defaultRender"        	id="defaultRender"      	value="${defaultRenderURL}" />
        <input type="hidden" name="pageSize"        		id="pageSize"      			value="${paginationModel.pageSize}" />
                
        
		<input type="hidden" id="tradeID" name="tradeID">
		<input type="hidden" id="status" name="status">
				<%@include file="tradefilter.jspf"%> 
	
		
		<div class="customTableContainer">
			<table class="tablesorter table" id="tradeListTable">
				<thead>
					<tr>
						<th width="3%" class="sorter-false"></th>
						<th>Trade #</th>
					    <th>SCF Company</th>
					    <th>Allotment</th>
					    <th>BPS</th>
						<th>Investor Gross Profit</th>
						<th>WhiteHall Share</th>
						<th>Investor Net Profit</th>	
						<th>Seller Fees</th>
						<th>WhiteHall Gross Profit</th>		
						<th>Seller Allotment</th>
						<th>Status</th>					
					</tr>
				</thead>
				<tbody>
				
					<c:choose>						
						<c:when test="${fn:length(scftrades) gt 0}">
							<c:forEach items="${scftrades}" var="trade">
								<tr>
									<td width="3%"><input type="radio" value="${trade.id}" name="trade"  status-attr="${trade.status}" <c:if test="${trade.status eq 'Settled' || trade.status eq 'Closed'}">disabled="disabled"</c:if> ></td>
									 <td class="underline"><a href="javascript:void(0);"
                                        onclick="window.location.href='${createURL}&tradeID=${trade.id}'">${trade.scfId}</a></td>
									<td><strong>${trade.company.name} ( ${trade.duration} Days )</strong></td>
									<td class="rightalign blue_bold"><fmt:formatNumber type="number" maxFractionDigits="3" value="${trade.tradeAmount}"  /></td>
									<td></td>
									<td class="rightalign green_bold" ><fmt:formatNumber type="number" maxFractionDigits="3" value="${trade.investorTotalGross}"  /></td>
									<td class="rightalign blue_bold"><fmt:formatNumber type="number" maxFractionDigits="3" value="${trade.whitehallTotalShare}"  /></td>
									<td class="rightalign green_bold"><fmt:formatNumber type="number" maxFractionDigits="3" value="${trade.investorTotalProfit}"  /></td>
									<td class="rightalign"><fmt:formatNumber type="number" maxFractionDigits="3" value="${trade.sellerFees + trade.sellerTransFee}"  /></td>
									<td class="rightalign blue_bold"><fmt:formatNumber type="number" maxFractionDigits="3" value="${trade.whitehallTotalProfit}"  /></td>
									<td class="rightalign"><fmt:formatNumber type="number" maxFractionDigits="3" value="${trade.sellerNetAllotment}"  /></td>	
									<td>${trade.status}</td>						
								</tr>
								<c:if test="${fn:length(trade.allotments) gt 0}">
									<c:forEach items="${trade.allotments}" var="allotment">
										<tr>
											<td></td>
											<td></td>
											<td>${allotment.investorPortfolio.investor.company.name}</td> 
											<td class="rightalign blue_bold"><fmt:formatNumber type="number" maxFractionDigits="3" value="${allotment.allotmentAmount}"  /></td>
											<td class="rightalign"><fmt:formatNumber type="number" maxFractionDigits="3" value="${allotment.marketDiscount}"  /></td>
											<td class="rightalign green_bold"><fmt:formatNumber type="number" maxFractionDigits="3" value="${allotment.investorGrossProfit}"  /></td>
											<td class="rightalign blue_bold"><fmt:formatNumber type="number" maxFractionDigits="3" value="${allotment.whitehallProfitShare}"  /></td>
											<td class="rightalign green_bold"><fmt:formatNumber type="number" maxFractionDigits="3" value="${allotment.investorNetProfit}"  /></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											
										</tr>
										
									</c:forEach>
								</c:if>
								</c:forEach>
								</c:when>
						<c:otherwise>
							<tr>
								<td colspan="12" align="center">No records found!</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
		
	<%-- 	<div class="row-fluid" >
			<div class="span3">
							<input type="button" value="Update Status" 	class="btn btn-primary span6" id="updateStatus"  data-url="${updateStatusURL}" />
							<input type="button" value="Update Status" 	class="btnBgBuSm"			  id="updateStatus"  data-url="${updateStatusURL}"/>			
			</div>	
		</div> --%>
		
		<div class="row-fluid" id="buttonDiv">
		  		<div class="span12">
		  			<div class="actionContainer noBorder text-left">
		  				
		  				 <input type="button" value="Update Status" 	class="btnBgBuSm"			  id="updateStatus"  data-url="${updateStatusURL}"/>
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

	</form:form>
	</div>

 	

