<%@include file="init.jsp"%>
<liferay-theme:defineObjects />
<portlet:renderURL var="createURL">
	<portlet:param name="render" value="createTrade" />
</portlet:renderURL>

<portlet:resourceURL id="breakdownURL" var="breakdownURL" ></portlet:resourceURL> 

<style>
.aui input, .aui textarea, .aui .uneditable-input {
	width: 100% !important;
}
</style>



<div class="container-fluid">


	<form:form commandName="scfTradeModel" method="post"
		action="${createURL}" id="scfTradeList"  >
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
					    <th>SCF Company</th>
					    <th>Duration</th>
						<th>Opening Date</th>
						<th>Closing Date</th>
						<th>Trade Amount</th>
						<th>Status</th>	
						<th>MultiInvoice ?</th>						
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${fn:length(trades) gt 0}">
							<c:forEach items="${trades}" var="trade">
								<tr>
									<%-- <td>${trade.scfTrade}</td> --%>
									<td><a href="javascript:void(0);"  onclick="window.location.href='${createURL}&tradeID=${trade.id}'">${trade.company.name}</a></td>
									<td>${trade.duration}</td>
									<td><fmt:formatDate pattern="dd-MM-yyyy" value="${trade.openingDate}" /></td>
									<td><fmt:formatDate pattern="dd-MM-yyyy" value="${trade.closingDate}" /></td>
									<td>${trade.tradeAmount} <a href="javascript:void(0);"  data-url="${breakdownURL}" class="breakdown"   tradeID="${trade.id}" style=" float: right; vertical-align: middle; font-size: 20px" ><i class="fa fa-plus-square-o"></i> </a></td>
									<td>${trade.status}</td>
									<td><img src="${themeDisplay.pathThemeImages}/folder-full-delete-icon_24.png"/></td>
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

	</form:form>
	<%-- <div class="row-fluid">
		<div class="span6">			
				<a href="${createURL}"  class="btn btn-primary" style="color: #fff; font-weight: bold;"><i
					class="fa fa fa-plus"></i> Add Trade</a>		
		</div>

	</div> --%>

</div>
