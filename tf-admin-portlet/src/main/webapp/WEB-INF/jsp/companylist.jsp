<%@include file="init.jsp"%>
<%@ taglib uri="http://whitehall.com/jsp/tld/p" prefix="p"%>

<portlet:renderURL var="createURL">
	<portlet:param name="render" value="createCompany" />
</portlet:renderURL>

<portlet:renderURL var="defaultRenderURL" />

<portlet:actionURL var="getCompanyReportURL">
	<portlet:param name="company" value="getCompanyReport" />
</portlet:actionURL>

<portlet:resourceURL id="exportCompanies" var="exportCompaniesURL" ></portlet:resourceURL> 


<div class="tab-content">


	<form:form commandName="companyModel" method="post"
		action="${createURL}" id="companyList" autocomplete="off" name="companyList">
		
	<input type="hidden" name="currentPage" 	id="currentPage"    	value="${paginationModel.currentPage}" />
	<input type="hidden" name="currPageSize" 	id="currPageSize"    	value="${paginationModel.pageSize}" /> 
	<input type="hidden" name="noOfRecords" 	id="noOfRecords"    	value="${paginationModel.noOfRecords}" />
	<input type="hidden" name="defaultURL" 		id="defaultURL" 		value="${defaultRenderURL}" />
	<input type="hidden" name="pageSize"        id="pageSize"      		value="${paginationModel.pageSize}" />

		<div id="scf-tab" class="tab-pane">
			<c:choose>
				<c:when test="${permissionChecker.isOmniadmin()}">
					<div class="title-container clearfix">
					 	<div class="main-title">Manage my Company</div>
					 	
					 	<div class="btn-wrapper">
					 		<aui:button cssClass="btnBrGrSm btnIconSm filter-btn active"  icon="icomoon-filter"></aui:button>
			  				<!-- <input type="button" class="btnBgGreenSm" value="Export"  id="exportCompanies"/> -->
			  				<a href="${exportCompaniesURL}" class="btnBgGreenSm" >Export</a>
			  			</div>
					 </div>
					<div class="customWell filter-container">
		  				<div class="row-fluid">
							<div class="span3 spanSm6">
								<div class="control-group">
									<div class="input-append">
									<input name="Search" type="text" placeholder="Search" id="search"	value="${search}" /> 
									<span class="add-on"><i	class="icomoon-search"></i></span>
									<i class="icon-info-sign tooltipSearch" data-toggle="tooltip" title="Search in for Company Name and Registration Number" ></i>
									</div>
								</div>
							</div>
							
						  		<div class="span3 spanSm6 mtXs10">
						  			<div class="actionContainer noBorder text-left">
						  				 <input type="button" value="Search" id="companyReport" class="btnBgBuSm" />
						  			</div>
						  			
						  		</div>
						  	
						</div>
					</div>				
				</c:when>
				<c:otherwise>
					 <div class="title-container clearfix">
					 	<div class="main-title">Manage my Company</div>
					 </div>
				</c:otherwise>			
			</c:choose>	
			
			
		</div>
		<div class="customTableContainer">
			<table class="table table-hover tablesorter table-bordered"  id="companyListTable">
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
						<c:when test="${fn:length(allCompanies) gt 0}">
							<c:forEach items="${allCompanies}" var="company">
								<tr onclick="window.location.href='${createURL}&companyID=${company.id}'">
									<td>${company.name} </td>
									<td>${company.regNumber}</td>
									<td>${company.address.region}, ${company.address.country}</td>
									<td><fmt:formatDate pattern="dd-MM-yyyy" value="${company.dateestablished}" /></td>
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
							<tr>
								<td colspan="7" align="center">No Record Found!</td>
							</tr>
						</c:otherwise>
				</c:choose>
				</tbody>
			</table>
		</div>
		<c:if test="${permissionChecker.isOmniadmin()}">
			
			<div class="actionContainer text-left">
				<a href="${createURL}"	class="btn btnBgBuSm" >Add Company</a>			
			</div>
			
			 <div class="lfr-pagination">			
				<p:paginate  paginationModel="${paginationModel}"/>
				
				<div class="lfr-pagination-controls">
					<div class="btn-group">
					  <a class="btn btn-default dropdown-toggle" role="button" data-toggle="dropdown" href="#">${paginationModel.pageSize} items per page <i class="caret"></i></a>
					  <ul id="menu1" class="dropdown-menu" role="menu" aria-labelledby="drop4">
					  	  <li role="presentation" pageSize="2"><a role="menuitem" href="#">2 items per page</a></li>
		                  <li role="presentation" pageSize="5"><a role="menuitem" href="#">5 items per page</a></li>
		                  <li role="presentation" pageSize="10"><a role="menuitem" href="#">10 items per page</a></li>
		                  <li role="presentation" pageSize="20"><a role="menuitem" href="#">20 items per page</a></li>
		                  <li role="presentation" pageSize="30"><a role="menuitem" href="#">30 items per page</a></li>
		                  <li role="presentation" pageSize="45"><a role="menuitem" href="#">45 items per page</a></li>
		                  <li role="presentation" pageSize="60"><a role="menuitem" href="#">60 items per page</a></li>
		                  <li role="presentation" pageSize="75"><a role="menuitem" href="#">75 items per page</a></li>
		                </ul> 		              
					</div>
					
					<small class="search-results">Showing ${(paginationModel.currentPage-1)*paginationModel.pageSize+1} - 
					<c:choose>
							<c:when test="${paginationModel.currentPage*paginationModel.pageSize >= paginationModel.noOfRecords}">${paginationModel.noOfRecords}</c:when>
							<c:otherwise>${paginationModel.currentPage*paginationModel.pageSize}</c:otherwise>
					</c:choose>
					 of ${paginationModel.noOfRecords} Results.</small>				
					
				</div>
		  </div>			
		</c:if>
		
		

	</form:form>



</div>
