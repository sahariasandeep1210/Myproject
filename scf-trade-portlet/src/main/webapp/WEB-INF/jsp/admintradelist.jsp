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
                
        
		<input type="hidden" id="tradeID" name="tradeID" />
		<input type="hidden" id="status" name="status" />
		
		
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
			<table class="table" id="tradeListTable">
				<thead>
					<tr>
						<th width="3%" class=""></th>
						<th>Trade # <br><img id="scfId" column-name="scfId" class="sortColumn" src="<%=request.getContextPath()%>/images/up.png" alt="asc" order="asc"/><img id="scfIdDesc" column-name="scfId" class="sortColumn" src="<%=request.getContextPath()%>/images/down.png" alt="desc" order="desc"/></th>
					    <th>SCF Company <br><img id="scfcompany" column-name="company.name" class="sortColumn" src="<%=request.getContextPath()%>/images/up.png" alt="asc" order="asc"/><img id="scfcompanyDesc"  column-name="company.name" class="sortColumn" src="<%=request.getContextPath()%>/images/down.png" alt="desc" order="desc"/></th>
					    <th>Allotment <br><img id="allotment" column-name="tradeAmount" class="sortColumn" src="<%=request.getContextPath()%>/images/up.png" alt="asc" order="asc"/><img id="allotmentDesc" column-name="tradeAmount" class="sortColumn" src="<%=request.getContextPath()%>/images/down.png" alt="desc" order="desc"/></th>
					    <th>BPS <br><img id="bps" column-name="allotments.marketDiscount" class="sortColumn" src="<%=request.getContextPath()%>/images/up.png" alt="asc" order="asc"/><img id="bpsDesc" column-name="allotments.marketDiscount" class="sortColumn" src="<%=request.getContextPath()%>/images/down.png" alt="desc" order="desc"/></th>
						<th>Investor Gross Profit <br><img id="investorgross" column-name="investorTotalGross" class="sortColumn" src="<%=request.getContextPath()%>/images/up.png" alt="asc" order="asc"/><img id="investorgrossDesc" column-name="investorTotalGross" class="sortColumn" src="<%=request.getContextPath()%>/images/down.png" alt="desc" order="desc"/></th>
						<th>WhiteHall Share<br><img id="whitehallShare" column-name="whitehallTotalShare" class="sortColumn" src="<%=request.getContextPath()%>/images/up.png" alt="asc" order="asc"/><img id="whitehallShareDesc" column-name="whitehallTotalShare" class="sortColumn" src="<%=request.getContextPath()%>/images/down.png" alt="desc" order="desc"/></th>
						<th>Investor Net Profit <br><img id="InvestorNet" column-name="investorTotalProfit" class="sortColumn" src="<%=request.getContextPath()%>/images/up.png" alt="asc" order="asc"/><img id="InvestorNetDesc" column-name="investorTotalProfit" class="sortColumn" src="<%=request.getContextPath()%>/images/down.png" alt="desc" order="desc"/></th>	
						<th>Seller Fees <br><img id="sellerFees" column-name="sellerFees" class="sortColumn" src="<%=request.getContextPath()%>/images/up.png" alt="asc" order="asc"/><img id="sellerFeesDesc" column-name="sellerFees" class="sortColumn" src="<%=request.getContextPath()%>/images/down.png" alt="desc" order="desc"/></th>
						<th>WhiteHall Gross Profit <br><img id="whitehallGrossProfit" column-name="whitehallTotalProfit" class="sortColumn" src="<%=request.getContextPath()%>/images/up.png" alt="asc" order="asc"/><img id="whitehallGrossProfitDesc" column-name="whitehallTotalProfit" class="sortColumn" src="<%=request.getContextPath()%>/images/down.png" alt="desc" order="desc"/></th>		
						<th>VAT On Whitehall</th>
						
						<th>Seller Allotment <br><img id="SellerAllotment" column-name="sellerNetAllotment" class="sortColumn" src="<%=request.getContextPath()%>/images/up.png" alt="asc" order="asc"/><img id="SellerAllotmentDesc" column-name="sellerNetAllotment" class="sortColumn" src="<%=request.getContextPath()%>/images/down.png" alt="desc" order="desc"/></th>
						<th>Status <br><img id="Status" column-name="status" class="sortColumn" src="<%=request.getContextPath()%>/images/up.png" alt="asc" order="asc"/><img id="StatusDesc" column-name="status" class="sortColumn" src="<%=request.getContextPath()%>/images/down.png" alt="desc" order="desc"/></th>					
					</tr>
				</thead>
				<tbody>
				
					<c:choose>						
						<c:when test="${fn:length(scftrades) gt 0}">
						     <tr>
									<td style="background-color:#189a80;color:white" width="3%"></td>
									 <td style="background-color:#189a80;color:white">Total</td>
									<td style="background-color:#189a80;color:white"></td>
									<td style="background-color:#189a80;color:white" class="rightalign blue_bold"><fmt:formatNumber type="number" maxFractionDigits="3" value="${totalTradeAmounts}"  pattern="#,##0.00"/></td>
									<td style="background-color:#189a80;color:white"></td>
									<td style="background-color:#189a80;color:white" class="rightalign green_bold" ><fmt:formatNumber type="number" maxFractionDigits="3" value="${totalInvestorTotalGross}"  pattern="#,##0.00"/></td>
									<td style="background-color:#189a80;color:white" class="rightalign blue_bold"><fmt:formatNumber type="number" maxFractionDigits="3" value="${totalWhitehallTotalShare}"  pattern="#,##0.00"/></td>
									<td style="background-color:#189a80;color:white" class="rightalign green_bold"><fmt:formatNumber type="number" maxFractionDigits="3" value="${totalInvestorTotalProfit}"  pattern="#,##0.00"/></td>
									<td style="background-color:#189a80;color:white" class="rightalign"><fmt:formatNumber type="number" maxFractionDigits="3" value="${totalWhitehallSeller}"  pattern="#,##0.00"/></td>
									<td style="background-color:#189a80;color:white" class="rightalign blue_bold"><fmt:formatNumber type="number" maxFractionDigits="3" value="${totalWhitehallTotalProfit}"  pattern="#,##0.00"/></td>
									<td style="background-color:#189a80;color:white"></td>		
									<td style="background-color:#189a80;color:white"></td>		
									<td style="background-color:#189a80;color:white" class="rightalign"><fmt:formatNumber type="number" maxFractionDigits="3" value="${totalSellerNetAllotment}"  pattern="#,##0.00"/></td>	
									<td style="background-color:#189a80;color:white"></td>						
								</tr>
							<c:forEach items="${scftrades}" var="trade">
								<tr>
									<td width="3%"><input type="radio" value="${trade.id}" name="trade"  status-attr="${trade.status}" <c:if test="${trade.status eq 'Settled' || trade.status eq 'Closed'}">disabled="disabled"</c:if> ></td>
									 <td class="underline"><a href="javascript:void(0);"
                                        onclick="window.location.href='${createURL}&tradeID=${trade.id}'">${trade.scfId}</a></td>
									<td><strong>${trade.company.name} ( ${trade.duration} Days )</strong></td>
									<td class="rightalign blue_bold"><fmt:formatNumber type="number" maxFractionDigits="3" value="${trade.tradeAmount}"  pattern="#,##0.00"/></td>
									<td></td>
									<td class="rightalign green_bold" ><fmt:formatNumber type="number" maxFractionDigits="3" value="${trade.investorTotalGross}"  pattern="#,##0.00"/></td>
									<td class="rightalign blue_bold"><fmt:formatNumber type="number" maxFractionDigits="3" value="${trade.whitehallTotalShare}"  pattern="#,##0.00"/></td>
									<td class="rightalign green_bold"><fmt:formatNumber type="number" maxFractionDigits="3" value="${trade.investorTotalProfit}"  pattern="#,##0.00"/></td>
									<td class="rightalign"><fmt:formatNumber type="number" maxFractionDigits="3" value="${trade.sellerFees + trade.sellerTransFee}"  pattern="#,##0.00"/></td>
									<td class="rightalign blue_bold"><fmt:formatNumber type="number" maxFractionDigits="3" value="${trade.whitehallTotalProfit}"  pattern="#,##0.00"/></td>
									<td class="rightalign"><fmt:formatNumber type="number" maxFractionDigits="3" value="${trade.vatWhitehallGrossProfit}"  pattern="#,##0.00"/></td>	
									<td class="rightalign"><fmt:formatNumber type="number" maxFractionDigits="3" value="${trade.sellerNetAllotment}"  pattern="#,##0.00"/></td>	
									<td>${trade.status}</td>						
								</tr>
								<c:if test="${fn:length(trade.allotments) gt 0}">
									<c:forEach items="${trade.allotments}" var="allotment">
										<tr>
											<td></td>
											<td></td>
											<td>${allotment.investorPortfolio.investor.company.name}</td> 
											<td class="rightalign "><fmt:formatNumber type="number" maxFractionDigits="3" value="${allotment.allotmentAmount}"  pattern="#,###.00"/></td>
											<td class="rightalign"><fmt:formatNumber type="number" maxFractionDigits="3" value="${allotment.marketDiscount}"  /></td>
											<td class="rightalign "><fmt:formatNumber type="number" maxFractionDigits="3" value="${allotment.investorGrossProfit}"  pattern="#,###.00"/></td>
											<td class="rightalign "><fmt:formatNumber type="number" maxFractionDigits="3" value="${allotment.whitehallProfitShare}"  pattern="#,###.00"/></td>
											<td class="rightalign"><fmt:formatNumber type="number" maxFractionDigits="3" value="${allotment.investorNetProfit}"  pattern="#,###.00"/></td>
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

 	

