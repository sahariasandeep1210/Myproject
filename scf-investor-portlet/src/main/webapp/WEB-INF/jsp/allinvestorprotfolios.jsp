<%@ include file="init.jsp"%>


<div class="row-fluid">
	<div class="panel panel-primary filterable">

		<!-- <div class="panel-heading">
			<div class="pull-right">
				<label> Protfolios</label>
			</div>
			<div class="pull-right">
				<button class="btn btn-default btn-xs btn-filter">
					<span class="fa fa-filter"></span> Filter
				</button>
			</div>
		</div> -->
		<div class="row-fluid" style="margin-bottom: 10px">
			<div class="span6"><h4> Investor Protfolios</h4></div>
			<div class="span6 pull-right">			
				<button class="btn btn-default btn-xs btn-filter pull-right">
					<span class="fa fa-filter"></span> Filter
				</button>			
			</div>
		</div>
		<div class="table-responsive">
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
						<th><!-- <input type="text" class="form-control"
							placeholder="Trade Live Count" disabled></th> -->
					</tr>
				</thead>
				<tbody>
					<c:choose>

						<c:when test="${fn:length(investorList) gt 0}">
							<c:set var="currentInvestor" value="" />

							<c:forEach items="${investorList}" var="investorProt"
								varStatus="loop">
								<c:if
									test="${currentInvestor ne investorProt.investor.company.name}">
									<tr class="highlightrow">
										<td colspan="6">${investorProt.investor.company.name}</td>
										<td></td>
									</tr>
									<c:set var="currentInvestor"
										value="${investorProt.investor.company.name}" />
								</c:if>
								<tr>
									<td>${investorProt.investor.company.name}</td>
									<td>${investorProt.company.name}</td>
									<td><fmt:formatNumber type="number" maxFractionDigits="3"
											value="${investorProt.myCreditLine}" /></td>
									<td>${investorProt.discountRate}</td>
									<td><fmt:formatNumber type="number" maxFractionDigits="3"
											value="${investorProt.amountInvested}" /></td>
									<td><fmt:formatNumber type="number" maxFractionDigits="3"
											value="${investorProt.availToInvest}" /></td>
									<!-- <td></td> -->
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