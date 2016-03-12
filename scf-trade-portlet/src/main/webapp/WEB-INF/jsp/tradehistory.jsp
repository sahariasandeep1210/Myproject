<%@include file="init.jsp"%>
<%@include file="tabview.jsp"%>
<portlet:renderURL var="histryURL">
	<portlet:param name="render" value="singleHistory" />
</portlet:renderURL>
<portlet:renderURL var="defaultURL">
</portlet:renderURL>

<portlet:actionURL var="getTradeHistoryURL">
	<portlet:param name="trade" value="getTradeHistory" />
</portlet:actionURL>

<div class="container-fluid">

	<form:form method="post" commandName="tradehistoryModel"
		class="form-horizontal" name="tradehistoryForm" id="tradehistoryForm"
		autocomplete="off">
		<input type="hidden" value="${getTradeHistoryURL}"
			id="getTradeHistorys" />
		<input type="hidden" name="currentPage" id="currentPage"
			value="${paginationModel.currentPage}" />
		<input type="hidden" name="noOfRecords" id="noOfRecords"
			value="${paginationModel.noOfRecords}" />
		<input type="hidden" name="defaultURL" id="defaultURL"
			value="${defaultURL}" />



		<div class="table-responsive">


			<table class="addtextCenter" id="tradeHisTable">
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
							placeholder="Search With SCF CompanyName" id="search"></td>
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
						<td><input type="button" value="Search" id="historyReport"
							class="btn btn-primary" /></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td colspan="4">
							<h5 style="text-align: right;">
								<a href="#" style="color: #295780; font-weight: bold;"
									id="exportTradeHistory"> Export</a>
							</h5>
						</td>

					</tr>


				</tbody>
			</table>


			<table class="table  tablesorter table-bordered"
				id="tradeHistoryTable">
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
						<th>Trade Status</th>
						<th>Trade Ref</th>
						<th>Number of Invoices</th>
						<th>Selling Company</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${fn:length(scfTradesHistory) gt 0}">
							<c:forEach items="${scfTradesHistory}" var="trade">

								<tr>
									<td><span class='underline'><a
											href="javascript:void(0);"
											onclick="window.location.href='${histryURL}&compID=${trade.insuranceDocId}'">${trade.tradeNotes}</a></span></td>
									<td>${trade.tradeAmount}</td>
									<td>ALL</td>
									<td>N/A</td>
									<td>${trade.duration}</td>
									<td>N/A</td>

								</tr>
							</c:forEach>
						</c:when>
						<c:when test="${fn:length(scfTradesList) gt 0}">
								<tr>
									<td>${scfTradesList.tradeNotes}</td>
									<td>${scfTradesList.tradeAmount}</td>
									<td>ALL</td>
									<td>N/A</td>
									<td>${scfTradesList.duration}</td>
									<td>N/A</td>

								</tr>
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
