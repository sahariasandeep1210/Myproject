
<%@include file="init.jsp"%>


<!-- <div class="row-fluid">
	<div class="span2">
		<label class="span12"></label>
	</div>
	<div class="span10"> -->
		<div id="${tradeID}_table">
		<table class="table  tablesorter table-bordered historytable table inner-table" >
			<thead>
				<tr>
					<th>Allotment Amount</th>
					<th>Discount Rate</th>
					<th>Duration</th>
					<th>Allotment Date</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${fn:length(allotmentList) gt 0}">
						<c:forEach items="${allotmentList}" var="allotment">
							<tr>
								<td>${allotment.allotmentAmount}</td>
								<td>${allotment.marketDiscount}</td>
								<td>${allotment.noOfdays}</td>
								<td><fmt:formatDate value="${allotment.allotmentDate}" pattern="dd-MM-yyyy HH:mm" /> <%-- <fmt:formatDate type="both"        dateStyle="short" timeStyle="short"       value="" /> --%></td>

							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="4" align="center" style="text-align: center;">
								No Allotment information found!</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
	
<!-- 	</div>
	
</div> -->