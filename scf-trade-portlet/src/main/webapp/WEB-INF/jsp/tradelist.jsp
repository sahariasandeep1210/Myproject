<%@include file="init.jsp"%>
<%@ taglib uri="http://whitehall.com/jsp/tld/p" prefix="p"%>

<liferay-theme:defineObjects />
<portlet:renderURL var="createURL">
	<portlet:param name="render" value="createTrade" />
</portlet:renderURL>
<portlet:renderURL var="defaultRenderURL" />

<portlet:actionURL var="getScfAdminTradeURL">
	<portlet:param name="scf" value="getScfAdminTrade" />
</portlet:actionURL>

<portlet:resourceURL id="breakdownURL" var="breakdownURL" ></portlet:resourceURL> 


<div class="container-fluid">

	<form:form commandName="scfTradeModel" method="post" action="${createURL}" id="scfTradeList"  >
		
		<input type="hidden" name="currentPage"           id="currentPage"        value="${paginationModel.currentPage}" />
        <input type="hidden" name="currPageSizes"         id="currPageSizes"      value="${paginationModel.pageSize}" />
        <input type="hidden" name="noOfRecords"           id="noOfRecords"        value="${paginationModel.noOfRecords}" />
        <input type="hidden" name="defaultURL"           id="defaultURL"         value="${defaultRenderURL}" />
        <input type="hidden" name="getScfAdminTradeURL"  id="getScfAdminTradeURL" value="${getScfAdminTradeURL}" />
         
         
         <div class="row-fluid">
			<div class="search-scf">
				<input type="text" name="Search" placeholder="Search Here" id="search">
			</div>
		</div>
		<div class="row-fluid">
			<div class="span1">
				<label style="margin-bottom:0;padding: 5px 0;">Date:</label>  </div>
			<div class="span3">	
				<select id="dateList" name="dateList">
					<option value="">---Select---</option>
					<option value="openingDate" <c:if test="${ value eq 'openingDate'}">selected="selected" </c:if>>invoiceDate</option>
					<option value="closingDate" <c:if test="${ value eq 'closingDate'}">selected="selected" </c:if>>closingDate</option>
					<option value="investorPaymentDate" <c:if test="${ value eq 'investorPaymentDate'}">selected="selected" </c:if>>investorPaymentDate</option>
					<option value="sellerPaymentDate" <c:if test="${ value eq 'sellerPaymentDate'}">selected="selected" </c:if>>sellerPaymentDate</option>
				    <option value="createDate" <c:if test="${ value eq 'createDate'}">selected="selected" </c:if>>createDate</option>
					
				</select> 
		   </div>
		  <div class="span3">	
				<input name="fromDate" id="fromDate" placeholder="From" /> 
		  </div>		
		  <div class="span3">	
				<input name="toDate" id="toDate" placeholder="To" />
		  </div>
	</div>	  
		<div class="row-fluid">
			<div class="scfAdminTradeReport">
				 <input type="button" value="Search" id="scfAdminTradeReport" class="btn btn-primary" />
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
			  	<h5 style="float: right !important;" ><a href="${createURL}" style="color: #295780;font-weight: bold;"> Export</a></h5>
			  </div>
			  </div>			
		</div>
	
		<div class="table-responsive">
			<table class="table  tablesorter table-bordered" id="tradeListTable">
				<thead>
					<tr>
					<!-- 	<th>SCF Trade</th> -->
					    <th>Trade #</th>
					    <th>SCF Company</th>
					    <th>Duration</th>
						<th>Opening Date</th>
						<th>Closing Date</th>
						<th>Trade Amount</th>
						<th>Status</th>	
						<th>Is MultiInvoice</th>						
					</tr>
				</thead>
				<tbody>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td>${totalTradeAmount}</td>
						<td></td>
						<td></td>

					</tr>
					<c:choose>
						<c:when test="${fn:length(trades) gt 0}">
							<c:forEach items="${trades}" var="trade">
								<tr>
									<%-- <td>${trade.scfTrade}</td> --%>
									<td class="underline"><a href="javascript:void(0);"
                                        onclick="window.location.href='${createURL}&tradeID=${trade.id}'">${trade.scfId}</a></td>
									<td>${trade.company.name}</td>
									<td>${trade.duration}</td>
									<td><fmt:formatDate pattern="dd-MM-yyyy" value="${trade.openingDate}" /></td>
									<td><fmt:formatDate pattern="dd-MM-yyyy" value="${trade.closingDate}" /></td>
									<td>${trade.tradeAmount} <a href="javascript:void(0);"  data-url="${breakdownURL}" class="breakdown"   tradeID="${trade.id}" style=" float: right; vertical-align: middle; font-size: 20px" ><i  id="${trade.id}_icon" class="fa fa-plus-square"></i> </a></td>
									<td>${trade.status}</td>
									<td>
										<c:choose>
											<c:when test="${fn:length(trade.invoices) gt 1}">
												<img src="${themeDisplay.pathThemeImages}/folder-full-accept-icon_24.png"/>
											</c:when>
											<c:otherwise>
												<img src="${themeDisplay.pathThemeImages}/folder-full-delete-icon_24.png"/>
											</c:otherwise>										
										</c:choose>
									
									</td>
								</tr>
								<tr class="historyRow"  id="${trade.id}_row">								
							  		<td colspan=7></td>
							</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="7" align="center">No records found!</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
		<div class="row-fluid">
			<div class="span6">
		  </div>
			<div class="span6">
				<div class="span4"></div>
				<div class="span8">
					<label  class="diplay-inline"> Show &nbsp;</label> 
					<select id="pgSize" class="paginationselect" name="pageSize">
						<option value="5">5</option>
						<option value="10">10</option>
						<option value="20">20</option>
						<option value="30">30</option>
						<option value="45">45</option>
						<option value="60">60</option>
						<option value="75">75</option>
						<option value="100">100</option>
					</select> 
					<label  class="diplay-inline">&nbsp; Results per page </label>
				</div>
			</div>
		</div>

	</form:form>
</div>
 	<p:paginate  paginationModel="${paginationModel}"/>
