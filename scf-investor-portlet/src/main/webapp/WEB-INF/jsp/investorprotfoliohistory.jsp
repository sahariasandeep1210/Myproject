
<%@include file="init.jsp"%>


<div class="row-fluid">
	<div class="span2">
		<label class="span12"></label>
	</div>
	<div class="span10">
		<div class="table-responsive" id="${protfolioID}_table">
		<table class="table  tablesorter table-bordered historytable" >
			<thead>
				<tr>
					<th>Discount Rate</th>
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
								<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${investorHis.myCreditLine}" /></td>
								<td><fmt:formatDate value="${investorHis.startDate}" pattern="dd-MM-yyyy HH:mm" /> <%-- <fmt:formatDate type="both"        dateStyle="short" timeStyle="short"       value="" /> --%></td>
								<td><fmt:formatDate value="${investorHis.endDate}" pattern="dd-MM-yyyy HH:mm" /> <%-- <fmt:formatDate type="both"        dateStyle="short" timeStyle="short"       value="" /> --%></td>

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