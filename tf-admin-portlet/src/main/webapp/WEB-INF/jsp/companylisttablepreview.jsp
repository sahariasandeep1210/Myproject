<%@include file="init.jsp"%>
<portlet:renderURL var="invoiceURL">
	<portlet:param name="render" value="updateInvoices" />
</portlet:renderURL>
<portlet:renderURL var="createURL">
	<portlet:param name="render" value="createCompany" />
</portlet:renderURL>
<portlet:resourceURL id="closeSessionValues" var="closeSessionValuesURL" ></portlet:resourceURL> 
<div class="scroll">
<div class="tab-content">  	
	<c:if test="${fn:length(validCompanyList) gt 0}">
		<c:if test="${fn:length(invalidCompanyList) gt 0}">
		  <div class="customWell">	
				<div class="row-fluid">
					<span><b>Valid Company</span></b><br>
				</div>
			</div>
		</c:if>
		

	<div class="customTableContainer">
		<table class="table table-hover tablesorter table-bordered"
			id="companyListTable">
			<thead>
				<tr>
					    <th>Name</th>
						<th>Registration No.</th>
						<th>Address Registered</th>
						<th>Established date</th>
						<!-- <th>URL</th> -->
						<th>Tel Number</th>
						<th>Type of Company</th>
						<th>Status</th>		
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${fn:length(validCompanyList) gt 0}">
						<c:forEach items="${validCompanyList}" var="company">
								<tr onclick="window.location.href='${createURL}&companyID=${company.id}'">
									<td>${company.name} </td>
									<td>${company.regNumber}</td>
									<td> ${company.address.addressLine1} ${company.address.addressLine2}</td>
									<td class="text-center"><fmt:formatDate pattern="dd-MM-yyyy" value="${company.dateestablished}" /></td>
									<%-- <td>${company.website}</td> --%>
									<td>${company.telnumber}</td>
								<c:if test="${company.companyType == '1'}">
							         <td>Primary Investor</td>
							    </c:if>
							         <c:if test="${company.companyType == '2'}">
							         <td>Secondary Investor</td>
							         </c:if>
							         <c:if test="${company.companyType == '3'}">
							         <td>Admin</td>
							         </c:if>
							         <c:if test="${company.companyType == '4'}">
							         <td>Seller</td>
							         </c:if>
							         <c:if test="${company.companyType == '5'}">
							         <td>SCF Company</td>
							         </c:if>
									<%-- <td>${company.companyType}</td> --%>
									<td>${company.activestatus}</td>							
									
								</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
					    <c:set var="valid"  scope="page" value="false" />
					    <td class="" colspan="6" align="center">There are  no  valid invoices.</td>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
	</c:if>
		<c:if test="${fn:length(invalidCompanyList) gt 0}">
		<br>
		<div class="customWell">
			<div class="row-fluid">
				<span class=""><b>Invalid Company.</b></span><br>
				<span class="">These Company's are already present on our platform or not valid.</span><br>
			</div>
		</div>
	
	<div class="customTableContainer">
		<table class="table table-hover tablesorter table-bordered"
			id="companyListTable">
			<thead>
				<tr>
					<c:if test="${defaultRender}">
						<th class="hide-tablesorter"></th>
					</c:if>
				     	<th>Name</th>
						<th>Registration No.</th>
						<th>Address Registered</th>
						<th>Established date</th>
						<!-- <th>URL</th> -->
						<th>Tel Number</th>
						<th>Type of Company</th>
						<th>Status</th>		
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${fn:length(invalidCompanyList) gt 0}">
						<c:forEach items="${invalidCompanyList}" var="company">
							<tr>
							<%-- <c:if test="${defaultRender}"> --%>
									<td>${company.name} </td>
									<td>${company.regNumber}</td>
									<td>${company.address.addressLine1}  ${company.address.addressLine2}</td>
									<td class="text-center"><fmt:formatDate pattern="dd-MM-yyyy" value="${company.dateestablished}" /></td>
									<%-- <td>${company.website}</td> --%>
									<td>${company.telnumber}</td>
								<c:if test="${company.companyType == '1'}">
							         <td>Primary Investor</td>
							    </c:if>
							         <c:if test="${company.companyType == '2'}">
							         <td>Secondary Investor</td>
							         </c:if>
							         <c:if test="${company.companyType == '3'}">
							         <td>Admin</td>
							         </c:if>
							         <c:if test="${company.companyType == '4'}">
							         <td>Seller</td>
							         </c:if>
							         <c:if test="${company.companyType == '5'}">
							         <td>SCF Company</td>
							         </c:if>
									<%-- <td>${company.companyType}</td> --%>
									<td>${company.activestatus}</td>	
								<%-- </c:if> --%>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
	</c:if>
	</div>
	
	<div class="modal-footer">	
		<button class="btn btnBrGrSm" id="invoice-popup-close" data-dismiss="modal" aria-hidden="true">Close</button>
		<c:if test="${fn:length(validCompanyList) gt 0}">
		<input type="submit" value="Save Company" class="btn btnBgGreenSm" id="last"/>
		</c:if>
	</div>

</div>

