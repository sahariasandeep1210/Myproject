<%@include file="init.jsp"%>
<%@ page import="com.tf.persistance.util.Constants" %>

<portlet:actionURL var="saveSellerURL">
	<portlet:param name="action" value="saveSeller" />
</portlet:actionURL>
<portlet:actionURL var="suspendMappingUrl">
	<portlet:param name="action" value="suspendMapping" />
</portlet:actionURL>


	<form:form commandName="sellerListModel" method="post" action=""
		id="sellerList" autocomplete="off" name="sellerList">
		<input type="hidden" value="${createURL}" id="saveURL" />
        <input type="hidden" value="${companyId}" id="companyID" name="companyID"/>
		
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
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					 <c:choose>
						<c:when test="${fn:length(sellerScfMappings) gt 0}">
							<c:forEach items="${sellerScfMappings}" var="seller"> 
						<%-- 	onclick="window.location.href='${createURL}&companyID=${seller.sellerCompany.id}'" --%>
					<tr>
						<td>${seller.sellerCompany.name}</td>
						<td>${seller.sellerCompany.regNumber}</td>
					   <td class="text-center"><fmt:formatDate pattern="dd-MM-yyyy" value="${seller.sellerCompany.dateestablished}"/></td>
						<td>${seller.sellerCompany.telnumber}</td>
						<td>${seller.status}</td>
						<td>
						<c:if test="${(seller.status eq 'Approve' or seller.status eq 'Pending')}">
							<a href="${suspendMappingUrl}&sellerCompanyId=${seller.id}">
									<span  class="add-on seller-add-on-mapping"><i class="icon-remove-sign"
							            data-toggle="tooltip" title="Reject"></i></span>
						     </a>
						</c:if>

						</td>
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

