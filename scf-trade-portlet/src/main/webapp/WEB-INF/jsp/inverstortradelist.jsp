<%@include file="init.jsp"%>
<liferay-theme:defineObjects />
<%@ taglib uri="http://whitehall.com/jsp/tld/p" prefix="p"%>


<portlet:actionURL var="getSellerTradeURL">
	<portlet:param name="seller" value="getSellerTrade" />
</portlet:actionURL>

<portlet:resourceURL var="tradeURL"></portlet:resourceURL>
<portlet:renderURL var="defaultRenderURL" />


<style>
.aui input, .aui textarea, .aui .uneditable-input {
	width: 100% !important;
}
</style>

<portlet:renderURL var="investorDetailsURL">
	<portlet:param name="render" value="investorDetails" />
</portlet:renderURL>

<div class="container-fluid">


	<form:form commandName="scfSellerTradeModel" method="post" action=" "
		id="sellerList" name="sellerList" autocomplete="off">
		<input type="hidden" name="currentPage" id="currentPage"
			value="${paginationModel.currentPage}" />
		<input type="hidden" name="currPageSize" id="currPageSize"
			value="${paginationModel.pageSize}" />
		<input type="hidden" name="noOfRecords" id="noOfRecords"
			value="${paginationModel.noOfRecords}" />
		<input type="hidden" name="defaultURL" id="defaultURL"
			value="${defaultRenderURL}" />
		<input type="hidden" name="getSellerTradeURL" id="getSellerTradeURL"
			value="${defaultRenderURL}" />
		<input type="hidden" id="tradeURL" name="tradeURL" value="${tradeURL}" />
		<input type="hidden" id="invoices" name="invoices"
			value="${trade.invoices}">


		<div class="row-fluid">
			<div class="search-seller">
				<input type="text" name="Search" placeholder="Search Here"
					id="search" value="${search}"> <input type="button"
					id="sellerTradeReport" class="btn btn-primary" value="Search" />
			</div>
		</div>
		<div class="row-fluid">
			<div class="span6">
				<div class="span3">
					<h4>Manage Trade</h4>
				</div>
			</div>

			<div class="span6">
				<div class="span12">
					<h5 style="float: right !important;">
						<a href="#" style="color: #295780; font-weight: bold;"
							id="exportSeller"> Export</a>
					</h5>
				</div>
			</div>
		</div>

		<div class="table-responsive">
			<table class="table  tablesorter table-bordered" id="sellerListTable">
				<thead>
					<tr>
						<th>Trade #</th>
						<th>Scf Company</th>
						<th>Trade Value</th>
						<th>Status</th>
						<th>Duration</th>
						<th width="8%">Opening Date</th>
						<th width="8%">Maturity Date</th>
						<th>Supplier Payment Date</th>
						<th>Fixed Charges</th>
						<th>Whiethall Variable Fees</th>
						<th>Investors Fees</th>
						<th>Other Fees</th>
						<th>Gross charges</th>
						<th>Finance Amount</th>

					</tr>
				</thead>
				<tbody>
					<c:choose>						
						<c:when test="${fn:length(scftrades) gt 0}">
							<c:forEach items="${scftrades}" var="trade">
								<tr>
									<td><span class='underline'><a
											href="${investorDetailsURL}&tradeID=${trade.id}">${trade.scfId}</a></span></td>
									<td>${trade.company.name}</td>
									<td  class="rightalign"><fmt:formatNumber type="number" maxFractionDigits="3" value="${trade.tradeAmount}"  /></td>
									<td>${trade.status}</td>
									<td>${trade.duration}</td>
									<td><fmt:formatDate pattern="dd-MM-yyyy"
											value="${trade.openingDate}" /></td>
									<td><fmt:formatDate pattern="dd-MM-yyyy"
											value="${trade.closingDate}" /></td>
									<td><fmt:formatDate pattern="dd-MM-yyyy"
											value="${trade.sellerPaymentDate}" /></td>
									<td class="rightalign"><fmt:formatNumber type="number" maxFractionDigits="3" value="${trade.sellerTransFee}"  /></td>
									<td class="rightalign"><fmt:formatNumber type="number" maxFractionDigits="3" value="${trade.sellerFees}"  /></td>
									<td class="rightalign"><fmt:formatNumber type="number" maxFractionDigits="3" value="${trade.investorTotalGross}"  /></td>
									<td></td>
									<td class="rightalign"><fmt:formatNumber type="number" maxFractionDigits="3" value="${trade.sellerTransFee + trade.sellerFees + trade.investorTotalGross}"  /></td>
									<td class="rightalign"><fmt:formatNumber type="number" maxFractionDigits="3" value="${trade.sellerNetAllotment}"  /></td>

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
		<div class="row-fluid">
			<div class="span6"></div>
			<div class="span6">
				<div class="span4"></div>
				<div class="span8">
					<label class="diplay-inline"> Show &nbsp;</label> <select
						id="pageSize" class="paginationselect" name="pageSize">
						<option value="5">5</option>
						<option value="10">10</option>
						<option value="20">20</option>
						<option value="30">30</option>
						<option value="45">45</option>
						<option value="60">60</option>
						<option value="75">75</option>
						<option value="100">100</option>
					</select> <label class="diplay-inline">&nbsp; Results per page </label>
				</div>
			</div>
		</div>
	</form:form>
</div>
<p:paginate paginationModel="${paginationModel}" />
