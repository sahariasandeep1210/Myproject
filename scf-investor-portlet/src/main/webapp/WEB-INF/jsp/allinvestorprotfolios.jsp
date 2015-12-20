<%@ include file="init.jsp"%>
<div class="table-responsive">
			<table class="table tablesorter table-bordered"  id="companyListTable">
				<thead>
					<tr>
						<th>Investor</th>
						<th>SCF Company</th>
						<th>My Credit Line</th>
						<th>BPS</th>
						<th>Utilised</th>
						<th>Available</th>	
						<th>Trade Live Count</th>										
					</tr>
				</thead>
				<tbody>
				 <c:choose>
				 	
					<c:when test="${fn:length(investorList) gt 0}">
						<c:set  var="currentInvestor" value="" />
						
						<c:forEach items="${investorList}" var="investorProt" varStatus="loop">
							<c:if test="${currentInvestor ne investorProt.investor.company.name}">
								<tr class="highlightrow">
									<td   colspan="6" >${investorProt.investor.company.name}</td>
									<td></td>
								</tr>
								<c:set  var="currentInvestor" value="${investorProt.investor.company.name}" />
							</c:if>
							<tr>
								<td>${investorProt.investor.company.name} </td>
								<td>${investorProt.company.name}</td>
								<td> <fmt:formatNumber type="number" maxFractionDigits="3" value="${investorProt.myCreditLine}" /> </td>
								<td>${investorProt.discountRate}</td>
								<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${investorProt.amountInvested}" /></td>
								<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${investorProt.availToInvest}" /></td>
								<td></td>	
							</tr>							
						</c:forEach>
					</c:when>
					<c:otherwise>
							<tr>
								
								<td colspan="7" align="center" style="text-align: center;">Protfolio information not found!</td>
							</tr>
					</c:otherwise>
				</c:choose>
				</tbody>
			</table>
		</div>