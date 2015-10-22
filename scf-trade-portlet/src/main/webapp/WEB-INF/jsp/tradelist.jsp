<%@include file="init.jsp"%>

<portlet:renderURL var="createURL">
	<portlet:param name="render" value="createTrade" />
</portlet:renderURL>

<style>
.aui input, .aui textarea, .aui .uneditable-input {
	width: 100% !important;
}
</style>



<div class="container-fluid">


	<form:form commandName="scfTradeModel" method="post"
		action="${createURL}" id="scfTradeList" >
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
			<table class="table table-hover tablesorter table-bordered">
				<thead>
					<tr>
					<!-- 	<th>SCF Trade</th> -->
						<th>Opening Date</th>
						<th>Closing Date</th>
						<th>Trade Amount</th>
						<th>Trade Settled </th>						
						<th>Status</th>						
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${fn:length(trades) gt 0}">
							<c:forEach items="${trades}" var="trade">
								<tr
									onclick="window.location.href='${createURL}&tradeID=${trade.id}'">
									<%-- <td>${trade.scfTrade}</td> --%>
									<td><fmt:formatDate pattern="dd-MM-yyyy" value="${trade.openingDate}" /></td>
									<td><fmt:formatDate pattern="dd-MM-yyyy" value="${trade.closingDate}" /></td>
									<td>${trade.tradeAmount}</td>
									<td>${trade.tradeSettled}</td>
									<td>${trade.status}</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="6" align="center">No records found!</td>
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
