<%@include file="init.jsp"%>

<div class="row-fluid">
				<div class="span12" >
					<div class="span9"><h6><u>${scfCompany}</u> credit Line breakdown</h6></div>								
				</div>
</div>
<div class="table-responsive">
			<table class="table tablesorter table-bordered"  id="companyListTable">
				<thead>
					<tr>
						<th>Investor Name</th>
						<th>My Credit Line</th>
						<th>BPS</th>															
					</tr>
				</thead>
				<tbody>
				 <c:choose>
					<c:when test="${fn:length(investorList) gt 0}">						
						<c:forEach items="${investorList}" var="investorProt" varStatus="loop">
							<tr class="${loop.index % 2 == 0 ? 'evenrow' : 'oddrow'}   ${investorProt.investor.investorId eq investorID ? 'boldclass' : ''}">
								<td>${investorProt.investor.investorId eq investorID ? 'Self' : 'Anonymous'}</td>
								<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${investorProt.myCreditLine}" pattern="#0.00"/></td>
								<td>${investorProt.discountRate}</td>									
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
							<tr>
								
								<td colspan="3" align="center" style="text-align: center;">Information not found!</td>
							</tr>
					</c:otherwise>
				</c:choose>
				</tbody>
			</table>
		</div>