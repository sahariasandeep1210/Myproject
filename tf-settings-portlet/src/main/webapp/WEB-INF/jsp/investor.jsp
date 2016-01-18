<%@include file="init.jsp"%>
<%@include file="tabview.jsp"%>
<portlet:actionURL var="saveInvestorSettings">
	<portlet:param name="action" value="saveInvestorSettings"/>
</portlet:actionURL>

<div class="row-fluid">
				<div class="span12" >
					<div class="span4"><h4><liferay-ui:message key='manage.investor.information'/></h4></div>	
								
				</div>
</div>
<div class="row-fluid">
				<div class="span12" >
					<div class="span12"><h6><liferay-ui:message key='manage.investor.message'/></h6></div>		
								
				</div>
</div>

<div class="row-fluid">
<div class="span6" >
	
	<form:form   method="post" commandName="investorModel"  class="form-horizontal">
	

	<div class="table-responsive" id="investorTable">
		<table class="table  tablesorter table-bordered">
			<thead>
				<tr>
					<th width="5%"></th>
					<th>Investor Name</th>
					<th width="25%">Whitehall Profit Share %</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${fn:length(investorList) gt 0}">
						<c:forEach items="${investorList}" var="investor">
							<tr>
								<td><input type="checkbox" value="${investor.investorID}" /></td>
								<td>${investor.name}</td>
								<td><input type="text"  value="${investor.whitehallShare}"></td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="3" align="center" style="text-align: center;">
								<liferay-ui:message key='investor.not.found' /> </td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
	
	</form:form>
</div>
</div>
