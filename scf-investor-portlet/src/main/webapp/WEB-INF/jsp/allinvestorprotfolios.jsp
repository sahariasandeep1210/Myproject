<%@ include file="init.jsp"%>
<%@include file="tabview.jsp"%>

<div class="tab-content">
<div class="row-fluid">
	<div class="panel panel-primary filterable">

		
		<div class="row-fluid" style="margin-bottom: 10px">
			<div class="span6 pull-right">	
				<span><font color="green">Click on filter image to filter table data</font></span>		
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
									<td style="background-color:#189a80;color:white" class="highlightrow"><b>Totals</b></td>
									<td style="background-color:#189a80;color:white"></td>
									<td style="background-color:#189a80;color:white" class="rightalign blue_bold"><fmt:formatNumber type="number" maxFractionDigits="3" value="${totalsMap.myCreditLine}" pattern="#,###.00"/></td>
									<td style="background-color:#189a80;color:white"></td>
									<td style="background-color:#189a80;color:white" class="rightalign blue_bold"><fmt:formatNumber type="number" maxFractionDigits="3" value="${totalsMap.amountInvested}" pattern="#,###.00"/></td>
									<td style="background-color:#189a80;color:white" class="rightalign blue_bold"><fmt:formatNumber type="number" maxFractionDigits="3" value="${totalsMap.availToInvest}" pattern="#,###.00"/></td>
									<!-- <td></td> -->
								</tr>
							<c:forEach items="${investorList}" var="investorProt"
								varStatus="loop">							
								<tr>
									<td>${investorProt.investor.company.name}</td>
									<td>${investorProt.company.name}</td>
									<td class="rightalign blue_bold"><fmt:formatNumber type="number" maxFractionDigits="3"	value="${investorProt.myCreditLine}" pattern="#,###.00"/></td>
									<td>${investorProt.discountRate}</td>
									<td class="rightalign blue_bold"><fmt:formatNumber type="number" maxFractionDigits="3"	value="${investorProt.amountInvested}" pattern="#,###.00"/></td>
									<td class="rightalign blue_bold"><fmt:formatNumber type="number" maxFractionDigits="3"	value="${investorProt.availToInvest}" pattern="#,###.00"/></td>
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