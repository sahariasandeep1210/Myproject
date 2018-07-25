<%@include file="init.jsp"%>

<portlet:actionURL var="saveSellerURL">
	<portlet:param name="action" value="saveSeller" />
</portlet:actionURL>

<portlet:renderURL var="createURL">
	<portlet:param name="render" value="createCompany" />
</portlet:renderURL>
<portlet:renderURL var="defaultRenderURL"></portlet:renderURL>

	<form:form commandName="sellerListModel" method="post" action=""
		id="sellerList" autocomplete="off" name="sellerList">
		<input type="hidden" value="${createURL}" id="saveURL" />
        <input type="hidden" value="${companyId}" id="companyID" name="companyID"/>
       
		
		 <div class="customWell filter-container">
				<div class="row-fluid">


			<div class="span3 spanSm6">
				<div class="control-group">
					<label class="control-label">SCF Company</label> <select
						id="scfCompany" name="scfCompany" class="aui-field-select">
						<option value="">---Select---</option>
						<c:forEach var="company" items="${companies}">
							<option value="${company.id}">${company.name}</option>
						</c:forEach>
					</select>
				</div>
			</div>

			<div class="span3 spanSm6 mtSm10 mtXs10">
		  				<div class="actionContainer noBorder text-left">
						<input type="button" value="Request Membership" id="addSeller"	class="btnBgGreenSm" />
					</div>
		  		</div>				
				</div>
		</div>
		
		<div class="customTableContainer">
			<table class="table table-hover tablesorter table-bordered"
				id="reportListTable">
				<thead>
					<tr>
						<th>Name</th>
						<th>Registration No</th>
						<th>Established date</th>
						<th>Tel Number</th>
						<th>Status</th>
					</tr>
				</thead>
				<tbody>
					 <c:choose>
						<c:when test="${fn:length(sellerScfMappings) gt 0}">
							<c:forEach items="${sellerScfMappings}" var="seller"> 
							<%-- onclick="window.location.href='${createURL}&companyID=${seller.sellerCompany.id}'" --%>
					<tr>
						<td>${seller.sellerCompany.name}</td>
						<td>${seller.sellerCompany.regNumber}</td>
					   <td class="text-center"><fmt:formatDate pattern="dd-MM-yyyy" value="${seller.sellerCompany.dateestablished}"/></td>
						<td>${seller.sellerCompany.telnumber}</td>
						<td>${seller.status}</td>

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

