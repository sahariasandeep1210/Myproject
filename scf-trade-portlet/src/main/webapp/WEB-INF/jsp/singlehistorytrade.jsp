<%@include file="init.jsp"%>

<portlet:renderURL var="defaultURL">
	<portlet:param name="render" value="singleHistory" />
</portlet:renderURL>
<portlet:actionURL var="backURL">
	<portlet:param name="page" value="historyBack" />
</portlet:actionURL>

<portlet:actionURL var="getSellerHistoryURL">
	<portlet:param name="trade" value="getSellerHistory" />
</portlet:actionURL>


<div class="tab-content">

	<form:form method="post" commandName="singlehistoryModel" name="singlehistoryForm"
		id="singlehistoryForm" autocomplete="off">
		<input type="hidden" name="compID" value="${compID}">		
		<input type="hidden" value="${defaultURL}" 		id="getTradeSellerHis" />
		<input type="hidden" name="currentPage" id="currentPage" value="${paginationModel.currentPage}" />
		<input type="hidden" name="noOfRecords" id="noOfRecords"	value="${paginationModel.noOfRecords}" />
		<input type="hidden" name="defaultURL" id="defaultURL" 	value="${defaultURL}" />
			
		<div class="customWell filter-container">
		  	<div class="row-fluid">
			<div class="span3 spanSm6">
				<div class="control-group">
					<div class="input-append">
						<input type="text" name="Search"	placeholder="Search Here" id="search" value="${companyName}">
						<span class="add-on"><i	class="icomoon-search"></i></span>
					</div>
				</div>
			</div>

			  		
		  		<div class="span3 spanSm6 mtSm10 mtXs10">
				  	<div class="control-group">
						<div class="input-append">
							<input name="fromDate" id="fromDate" placeholder="From" value="${fromDate}" type="text" />
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
		  				<!--  <input type="button" value="Search" id="historyReport"	class="" /> -->
		  				 <input type="button" value="Search" id="sellerReport"		class="btnBgBuSm" />
		  			</div>
		  			
		  		</div>
		  	</div>
	</div>
	

			<%-- <table class="addtextCenter" id="singleHisTable">
			
				<thead>
				</thead>
				<tbody>
					<tr>
						<td><label class="span6"><span class="total">TOTAL
									ALL</span></label></td>
						<td>${totalTradeAmount}</td>
						<td><input type="text" name="Search"
							placeholder="Search Here" id="search" value="${companyName}"></td>
						<td></td>
					</tr>

					<tr>
						<td><label class="span6">Select Date Range :</label></td>
						<td><input name="fromDate" id="fromDate" placeholder="From" value="${fromDate}" />
						</td>

						<td><input name="toDate" id="toDate" placeholder="To" value="${toDate}"/></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td><input type="button" value="Search" id="sellerReport"
							class="btn btn-primary" /></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td colspan="4">
							<h5 style="text-align: right;">
								<a href="#" style="color: #295780; font-weight: bold;"
									id="exportSingleTradeHistory"> Export</a>
							</h5>
						</td>
					</tr>
				</tbody>
			</table> --%>

 <div class="customTableContainer">
			<table class="table  tablesorter table-bordered"
				id="singleTradeHistoryTable">			
				<thead>
					<tr>
						<th>SCF Company</th>
						<th>Value</th>
						<th>Trade Ref</th>
						<th>Trade Status</th>
						<th>Number of Invoices</th>
						<th>Selling Company</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${fn:length(scfTradesHistory) gt 0}">
								<tr>
									<td>Totals</td>
									<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${totalTradeAmount}" /> </td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
							<c:forEach items="${scfTradesHistory}" var="trade">
							
							
								<tr>
								    
									<td>${trade.tradeNotes}</td>
									<td>${trade.tradeAmount}</td>
									<td>${trade.id}</td>
									<td>${trade.status }</td>
									<td>${trade.duration }</td>
									<td>${trade.insuranceDocName}</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:when test="${fn:length(scfTradesList) gt 0}">
							<tr>
									<td>Totals</td>
									<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${totalTradeAmount}" /> </td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
						   <c:forEach items="${scfTradesList}" var="trade">
						   		
						   
								<tr>
									<td>${trade.tradeNotes}</td>
									<td>${trade.tradeAmount}</td>
									<td>${trade.id}</td>
									<td>${trade.status }</td>
									<td>${trade.duration }</td>
									<td>${trade.insuranceDocName}</td>

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

		
		 	<div class="row-fluid">
		  		<div class="span12">
		  			<div class="actionContainer noBorder text-left">
		  				 <a href="javascript:void(0);"	class="btnBgBuSm" onclick="window.location.href='${backURL}'"> Back</a>
		  			</div>
		  			
		  		</div>
		  	</div>
	</form:form>
	
	
	
</div>
<p:paginate paginationModel="${paginationModel}" />
