<%@include file="init.jsp"%>

<portlet:actionURL var="saveSellerURL">
	<portlet:param name="action" value="saveSeller" />
</portlet:actionURL>

<portlet:renderURL var="createURL">
	<portlet:param name="render" value="createCompany" />
</portlet:renderURL>

<div class="container-fluid">
	<form:form commandName="sellerListModel" method="post" action=""
		id="sellerList" autocomplete="off" name="sellerList">
		<input type="hidden" value="${saveSellerURL}" id="saveURL" />

		<div class="row-fluid">
			<div class="span6">
				<label class="span6">Seller Company List:</label> 
				<select id="sellerCompany" name="sellerCompany">
					<option value="">---Select---</option>
                  <c:forEach var="company" items="${companies}">
					<option value="${company.id}">${company.name}</option>
				</c:forEach>					
			</select>
			</div>
			<div class="span6">
				<input type="button" value="Add" id="addSeller"
					class="btn btn-primary" />
			</div>
		</div>
<br>
		<div class="table-responsive">
			<table class="table table-hover tablesorter table-bordered"
				id="reportListTable">
				<thead>
					<tr>
						<th>Name</th>
						<th>Registration No</th>
						<th>Established date</th>
						<th>Tel Number</th>
					</tr>
				</thead>
				<tbody>
					 <c:choose>
						<c:when test="${fn:length(sellerScfMappings) gt 0}">
							<c:forEach items="${sellerScfMappings}" var="seller"> 
					<tr  onclick="window.location.href='${createURL}&companyID=${seller.sellerCompany.id}'">
						<td>${seller.sellerCompany.name}</td>
						<td>${seller.sellerCompany.regNumber}</td>
					   <td><fmt:formatDate pattern="dd-MM-yyyy" value="${seller.sellerCompany.dateestablished}"/></td>
						<td>${seller.sellerCompany.telnumber}</td>

					</tr>
					 </c:forEach>
						 </c:when>
						 <c:otherwise> 
					<tr>
						<td colspan="7" align="center">No Record Found!</td>
					</tr>
					 </c:otherwise>
				</c:choose> 
				</tbody>
			</table>
		</div>
	</form:form>

</div>
