
<%@include file="init.jsp"%>

<style>
.historytable th {
	background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#f6f6f6),	to(#eaeaea)) !important;
	color: #003d59 !important;
	text-align: left;
	padding: 5px;
	font-weight: normal;
	text-shadow: none;
	font-family: Candara;
}
</style>
<div class="row-fluid">
	<div class="span3">
		<label class="span12">Protfolio History</label>
	</div>
	<div class="span9">
		<div class="table-responsive" id="${protfolioID}_table">
		<table class="table table-hover tablesorter table-bordered historytable" >
			<thead>
				<tr>
					<th>Discount Rate</th>
					<th>Current Credit Line</th>
					<th>My Credit Line</th>
					<th>Start End</th>
					<th>End Date</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${fn:length(investorHistoryList) gt 0}">
						<c:forEach items="${investorHistoryList}" var="investorHis">
							<tr>
								<td>${investorHis.discountRate}</td>
								<td>${investorHis.currentCreditLine}</td>
								<td>${investorHis.myCreditLine}</td>
								<td><fmt:formatDate pattern="dd-MM-yyyy"
										value="${investorHis.startDate}" /></td>
								<td><fmt:formatDate pattern="dd-MM-yyyy"
										value="${investorHis.endDate}" /></td>

							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="5" align="center" style="text-align: center;">
								No History found!</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
	
	</div>
	
</div>