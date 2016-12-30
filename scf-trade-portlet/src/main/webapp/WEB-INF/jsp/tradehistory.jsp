<%@include file="init.jsp"%>
<%@include file="tabview.jsp"%>

<portlet:renderURL var="histryURL">
	<portlet:param name="render" value="singleHistory" />
</portlet:renderURL>

<portlet:actionURL var="getTradeHistoryURL">
	<portlet:param name="trade" value="getTradeHistory" />
</portlet:actionURL>

<div class="tab-content">

	<form:form method="post" commandName="tradehistoryModel"  name="tradehistoryForm" id="tradehistoryForm"	autocomplete="off">
		<input type="hidden" 						id="getTradeHistorys" 	value="${tradeHistoryURL}"		 />
		<input type="hidden" name="currentPage" 	id="currentPage" 		value="${paginationModel.currentPage}" />
		<input type="hidden" name="noOfRecords" 	id="noOfRecords"		value="${paginationModel.noOfRecords}" />
		<input type="hidden" name="defaultURL" 		id="defaultURL"			value="${tradeHistoryURL}" />
		<input 	type="hidden" name="pageSize"        		id="pageSize"      			value="${paginationModel.pageSize}" />
		<input 	type="hidden" name="currPageSize" 			id="currPageSize"			value="${paginationModel.pageSize}" /> 
			
			<div class="title-container clearfix">
		  	
		  		<div class="main-title">Trade History</div>
		  	
		  	<div class="btn-wrapper">		  			
		  			 <aui:button cssClass="btnBrGrSm btnIconSm filter-btn active"  icon="icomoon-filter"></aui:button>
		  			<input type="button" class="btnBgGreenSm" value="Export"  id="exportData"/>
		  	</div>
		  	
			</div>
			
 <div class="customWell filter-container">
		  	<div class="row-fluid">
			<div class="span3 spanSm6">
				<div class="control-group">
					<div class="input-append">
						<input     type="text" name="Search" placeholder="Search" id="search" value="${companyName}" />
						<span class="add-on"><i	class="icomoon-search"></i></span>
					</div>
				</div>
			</div>

			  		
		  		<div class="span3 spanSm6 mtSm10 mtXs10">
				  	<div class="control-group">
						<div class="input-append">
							<input name="fromDate" id="fromDate" placeholder="From" value="${fromDate}" type="text"/>
							<span	class="add-on" ><i	class="icomoon-calendar"></i></span>
						</div>
					</div>
		  		</div>
		  		
		  		<div class="span3 spanSm6 mtSm10 mtXs10">
		  			<div class="control-group">
						<div class="input-append">
							<input name="toDate" id="toDate" placeholder="To" value="${toDate}" type="text"/>
							<span	class="add-on" ><i	class="icomoon-calendar"></i></span>
						</div>
					</div>
		  		</div>
		  	</div>
		  	<div class="row-fluid">
		  		<div class="span12">
		  			<div class="actionContainer noBorder text-left">
		  				 <input type="button" value="Search" id="historyReport"	class="btnBgBuSm" />
		  			</div>
		  			
		  		</div>
		  	</div>
	</div>
				
		
		
			

           <div class="customTableContainer">
			<table class="table table-hover tablesorter table-bordered"	id="tradeHistoryTable">
			
				<thead>
					<tr>
						<th>SCF Company</th>
						<th>Value</th>
						<th>Trade Status</th>
						<th>Trade Ref</th>
						<th>Number of Invoices</th>
						<th>Selling Company</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${fn:length(scfTradesHistory) gt 0}">
							<tr>
									<td><b>Totals</b></td>
									<td class="rightalign blue_bold"><fmt:formatNumber type="number" maxFractionDigits="3" value="${totalTradeAmount}" pattern="#0.00"/> </td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
							<c:forEach items="${scfTradesHistory}" var="trade">
								
								<tr>
									<td><span class='underline'><a
											href="javascript:void(0);"
											onclick="window.location.href='${histryURL}&compID=${trade.insuranceDocId}'">${trade.tradeNotes}</a></span></td>
									<td class="rightalign blue_bold"><fmt:formatNumber type="number" maxFractionDigits="3" value="${trade.tradeAmount}" pattern="#0.00"/> </td>
									<td>ALL</td>
									<td>N/A</td>
									<td>${trade.duration}</td>
									<td>N/A</td>

								</tr>
							</c:forEach>
						</c:when>
						<c:when test="${fn:length(scfTradesList) gt 0}">
							<tr>
									<td>Totals</td>
									<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${totalTradeAmount}" pattern="#0.00"/> </td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
							<c:forEach items="${scfTradesList}" var="trade">
								
								<tr>
									<td><span class='underline'><a
											href="javascript:void(0);"
											onclick="window.location.href='${histryURL}&compID=${trade.insuranceDocId}'">${trade.tradeNotes}</a></span></td>
									<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${trade.tradeAmount}" pattern="#0.00"/> </td>
									<td>ALL</td>
									<td>N/A</td>
									<td>${trade.duration}</td>
									<td>N/A</td>

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

	</form:form>
</div>
