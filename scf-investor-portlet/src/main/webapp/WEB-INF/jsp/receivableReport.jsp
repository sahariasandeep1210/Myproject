<%@include file="init.jsp"%>
<portlet:renderURL var="renderURL"/>

<portlet:actionURL var="backURL">
<portlet:param name="page" value="cashBack"/>
</portlet:actionURL>

<div class="tab-content">

<form:form method="post" commandName="receivableReportModel"
		class="form-horizontal" name="receivableReportForm" 		id="receivableReportForm" autocomplete="off"> 
				<input type="hidden" 	name="pageSize"    			id="pageSize"      			value="${paginationModel.pageSize}" />
		      	<input type="hidden" 	name="curPageSize"  		id="curPageSize"   			value="${paginationModel.pageSize}" />
                <input type="hidden" 	name="currentPage"  		id="currentPage"   			value="${paginationModel.currentPage}" />
                <input type="hidden" 	name="noOfRecords"  		id="noOfRecords"   			value="${paginationModel.noOfRecords}" />
                <input type="hidden" 	name="defaultRenderURL"   	id="defaultRenderURL" 	  	value="${renderURL}" />
                 <input type="hidden" 	name="defaultURL"   		id="defaultURL"      		value="${renderURL}" />
                <input type="hidden" 	name="investorID" 										value="${investorId}">
                
                  <div class="customWell">	
                  	<div class="row-fluid">
				   			<div class="span12">
				   				<div class="labelBigTextContaier spacer border">
						   			<div class="smallLabelText">
						   				Investor Receivable Report
						   			</div>	   			
						   			
						   		</div>	
				   			</div>
				   		</div>
                  </div>
 
	
	

	<div class="customTableContainer">
                    
			<table class="table  tablesorter table-bordered" id="receivableReportTable">
				<thead>
					<tr>
					   
						<th>SCF Company</th>
						<th>Date Invested </th>
						<th>Date for Maturity</th>
						<th> Number of Days</th>	
						<th>Amount Invested</th>	
						<th>Amount at Maturity Gross</th>
						<th>Whitehall Finance Fee</th>
						<th>Amount at Maturity Net</th>
						<th>Return Amount</th>
						<th>Return %</th>
						<th>Status</th>
						
					</tr>
				</thead>
				<tbody>
				<c:choose>
                        <c:when test="${fn:length(dtos) gt 0}">
                        			<tr>
										<td><b>Totals</b></td>
			                            <td></td>
			                            <td></td>
			                            <td></td>
			                            <td class="rightalign green_bold"><fmt:formatNumber type="number" maxFractionDigits="3" value="${totalAllotAmount}"  pattern="#0.00"/></td>
			                            <td class="rightalign green_bold"><fmt:formatNumber type="number" maxFractionDigits="3" value="${totalMajurity}"  pattern="#0.00"/></td>
			                            <td class="rightalign green_bold"><fmt:formatNumber type="number" maxFractionDigits="3" value="${totalFinance}"  pattern="#0.00"/></td>
			                            <td class="rightalign green_bold"><fmt:formatNumber type="number" maxFractionDigits="3" value="${totalNet}"  pattern="#0.00"/></td>
			                            <td class="rightalign green_bold"><fmt:formatNumber type="number" maxFractionDigits="3" value="${totalAmount}"  pattern="#0.00"/></td>
			                            <td></td>
								</tr>
		                        <c:forEach items="${dtos}" var="allotment">						            
									<tr>
										<td>${allotment.name}</td>
			                            <td><fmt:formatDate value="${allotment.allotmentDate}" pattern="dd-MM-yyyy" /></td>
			                            <td><fmt:formatDate pattern="dd-MM-yyyy" value="${allotment.closingDate}" /></td>							
			                            <td width="7%">${allotment.noOfdays}</td>
										<td class="rightalign"><fmt:formatNumber type="number" maxFractionDigits="3" value="${allotment.allotmentAmount}"  pattern="#0.00"/></td>
										<td class="rightalign"><fmt:formatNumber type="number" maxFractionDigits="3" value="${allotment.majurityGross}"  pattern="#0.00"/></td>
										<td class="rightalign"><fmt:formatNumber type="number" maxFractionDigits="3" value="${allotment.financeFee}"  pattern="#0.00"/></td>
										<td class="rightalign"><fmt:formatNumber type="number" maxFractionDigits="3" value="${allotment.majurityNet}"  pattern="#0.00"/></td>
										<td class="rightalign"><fmt:formatNumber type="number" maxFractionDigits="3" value="${allotment.returnAmount}"  pattern="#0.00"/></td>
										<td class="rightalign"><fmt:formatNumber type="number" maxFractionDigits="3" value="${allotment.returns}"  pattern="#0.00"/></td>
										<td>${allotment.status}</td>
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
	      
	<div class="back-actions">
    <a href="javascript:void(0);" onclick="window.location.href='${backURL}&investorID=${investorId}'"  class="btnBgBuSm">Back</a>
</div>