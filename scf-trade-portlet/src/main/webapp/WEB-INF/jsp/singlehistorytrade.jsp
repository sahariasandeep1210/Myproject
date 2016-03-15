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


<div class="container-fluid">

	<form:form method="post" commandName="singlehistoryModel"
		class="form-horizontal" name="singlehistoryForm"
		id="singlehistoryForm" autocomplete="off">
		<input type="hidden" name="compID" value="${compID}">
		
		<input type="hidden" value="${getSellerHistoryURL}"
			id="getTradeSellerHis" />
		<input type="hidden" name="currentPage" id="currentPage"
			value="${paginationModel.currentPage}" />
		<input type="hidden" name="noOfRecords" id="noOfRecords"
			value="${paginationModel.noOfRecords}" />
		<input type="hidden" name="defaultURL" id="defaultURL"
			value="${defaultURL}" />
			<input type="hidden" name="getSellerHistoryURL" id="getSellerHistoryURL"
			value="${getSellerHistoryURL}" />
			
		<div>
     
			<a href="javascript:void(0);"
				onclick="window.location.href='${backURL}'"><i
				class="fa fa-reply"></i> Back</a>
		</div>
		<div class="table-responsive">

			<table class="addtextCenter" id="singleHisTable">
				<colgroup>
					<col style="width: 9.09%;">
					<col style="width: 9.09%;">
					<col style="width: 9.09%;">
					<col style="width: 9.09%;">
					<col style="width: 9.09%;">
					<col style="width: 9.09%;">

				</colgroup>
				<thead>
				</thead>
				<tbody>
					<tr>
						<td><label class="span6"><span class="total">TOTAL
									ALL</span></label></td>
						<td>${totalTradeAmount}</td>
						<td><input type="text" name="Search"
							placeholder="Search Here" id="search"></td>
						<td></td>
					</tr>

					<tr>
						<td><label class="span6">Select Date Range :</label></td>
						<td><input name="fromDate" id="fromDate" placeholder="From" />
						</td>

						<td><input name="toDate" id="toDate" placeholder="To" /></td>
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
			</table>


			<table class="table  tablesorter table-bordered"
				id="singleTradeHistoryTable">
				<colgroup>
					<col style="width: 9.09%;">
					<col style="width: 9.09%;">
					<col style="width: 9.09%;">
					<col style="width: 9.09%;">
					<col style="width: 9.09%;">
					<col style="width: 9.09%;">
					<col style="width: 9.09%;">
					<col style="width: 9.09%;">
					<col style="width: 9.09%;">
					<col style="width: 9.09%;">
					<col style="width: 9.09%;">
				</colgroup>
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
	</form:form>
</div>
<p:paginate paginationModel="${paginationModel}" />
