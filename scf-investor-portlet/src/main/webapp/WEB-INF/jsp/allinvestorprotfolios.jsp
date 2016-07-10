<%@ include file="init.jsp"%>
<%@include file="tabview.jsp"%>

<div class="tab-content">
<div class="row-fluid">
	<div class="panel panel-primary filterable">


		<div class="row-fluid" style="margin-bottom: 10px">
			<div class="span6 pull-right">			
				<button class="btnBrGrSm btnIconSm  filter-btn pull-right">
					<span class="icomoon-filter"></span> 
				</button>	
			</div>
		</div>
		<div class="customTableContainer">
			<table class="table tablesorter table-bordered" id="companyListTable">
				<thead>
					<tr class="filters">
						<th><input type="text" class="form-control"
							placeholder="Investor" disabled></th>
						<th><input type="text" class="form-control"
							placeholder="SCF Company" disabled></th>
						<th><input type="text" class="form-control"
							placeholder="My Credit Line" disabled></th>
						<th><input type="text" class="form-control" placeholder="BPS"
							disabled></th>
						<th><input type="text" class="form-control"
							placeholder="Utilised" disabled></th>
						<th><input type="text" class="form-control"
							placeholder="Available" disabled></th>
					
					</tr>
				</thead>
				<tbody>
					<c:choose>

						<c:when test="${fn:length(investorList) gt 0}">
							<c:set var="currentInvestor" value="" />
								<tr>
									<td class="highlightrow"><b>Totals</b></td>
									<td></td>
									<td class="rightalign blue_bold"><fmt:formatNumber type="number" maxFractionDigits="3" value="${totalsMap.myCreditLine}" /></td>
									<td></td>
									<td class="rightalign blue_bold"><fmt:formatNumber type="number" maxFractionDigits="3" value="${totalsMap.amountInvested}" /></td>
									<td class="rightalign blue_bold"><fmt:formatNumber type="number" maxFractionDigits="3" value="${totalsMap.availToInvest}" /></td>
									<!-- <td></td> -->
								</tr>
							<c:forEach items="${investorList}" var="investorProt"
								varStatus="loop">							
								<tr>
									<td>${investorProt.investor.company.name}</td>
									<td>${investorProt.company.name}</td>
									<td class="rightalign blue_bold"><fmt:formatNumber type="number" maxFractionDigits="3"	value="${investorProt.myCreditLine}" /></td>
									<td>${investorProt.discountRate}</td>
									<td class="rightalign blue_bold"><fmt:formatNumber type="number" maxFractionDigits="3"	value="${investorProt.amountInvested}" /></td>
									<td class="rightalign blue_bold"><fmt:formatNumber type="number" maxFractionDigits="3"	value="${investorProt.availToInvest}" /></td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>

								<td colspan="6" align="center" style="text-align: center;">Protfolio
									information not found!</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
	</div>
</div>
</div>